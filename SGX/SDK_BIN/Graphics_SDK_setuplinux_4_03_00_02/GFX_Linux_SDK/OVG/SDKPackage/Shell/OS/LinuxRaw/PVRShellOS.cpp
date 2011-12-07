/******************************************************************************

 @File         PVRShellOS.cpp

 @Title        LinuxRaw/PVRShellOS

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     Non-windowed support for any Linux

 @Description  Makes programming for 3D APIs easier by wrapping window creation
               and other functions for use by a demo.

******************************************************************************/
#include "PVRShell.h"
#include "PVRShellAPI.h"
#include "PVRShellOS.h"
#include "PVRShellImpl.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/time.h>
#include <fcntl.h>

#include <sys/ioctl.h>
#include <linux/fb.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <time.h>
#include <string.h>

#ifndef CONNAME
#define CONNAME "/dev/tty"
#endif

#ifdef PVRSHELL_OMAP3_TS_SUPPORT
#ifndef TOUCHSCREEN_INPUT
#define TOUCHSCREEN_INPUT "/dev/input/event1"
#endif
#endif

#ifndef KEYPAD_INPUT
#define KEYPAD_INPUT "/dev/input/event1"
#endif

#ifndef FBNAME
#define FBNAME  "/dev/fb0"
#endif

#ifndef REMOTE
#define REMOTE "/dev/ttyS1"
#endif

/*!***************************************************************************
	Defines
*****************************************************************************/

/*!***************************************************************************
	Declarations
*****************************************************************************/

/*!***************************************************************************
	Class: PVRShellInit
*****************************************************************************/

/*!***********************************************************************
@Function		PVRShellOutputDebug
@Input			format			printf style format followed by arguments it requires
@Description	Writes the resultant string to the debug output (e.g. using
				printf(), OutputDebugString(), ...). Check the SDK release notes for
				details on how the string is output.
*************************************************************************/
void PVRShell::PVRShellOutputDebug(char const * const format, ...) const
{
	va_list arg;
	char	buf[1024];

	va_start(arg, format);
	vsnprintf(buf, 1024, format, arg);
	va_end(arg);

	// Passes the data to a platform dependant function
	m_pShellInit->OsDisplayDebugString(buf);
}

/*!***********************************************************************
 @Function		OsInit
 @description	Initialisation for OS-specific code.
*************************************************************************/
void PVRShellInit::OsInit()
{
	m_pShell->m_pShellData->bFullScreen=true;	// linux overrides default to use fullscreen

	// Keyboard handling
	if((devfd=open(CONNAME, O_RDWR|O_NDELAY)) <= 0)
	{
		m_pShell->PVRShellOutputDebug("Can't open tty (%s)\n",CONNAME);
	}
	else
	{
		tcgetattr(devfd,&termio_orig);
		tcgetattr(devfd,&termio);
		cfmakeraw(&termio);
		termio.c_oflag |= OPOST | ONLCR; // Turn back on cr-lf expansion on output
		termio.c_cc[VMIN]=1;
		termio.c_cc[VTIME]=0;

		if(tcsetattr(devfd,TCSANOW,&termio) == -1)
		{
			m_pShell->PVRShellOutputDebug("Can't set tty attributes for %s\n",CONNAME);
		}
	}

	// Keypad handling.
	if ((keypad_fd = open(KEYPAD_INPUT, O_RDONLY | O_NDELAY)) <= 0)
	{
		m_pShell->PVRShellOutputDebug("Can't open keypad input device (%s)\n",KEYPAD_INPUT);
	}

#ifdef PVRSHELL_OMAP3_TS_SUPPORT
	/*************************************************
	 * Touchscreen code
	 * NOTE: For the init code to work, these variables have to be set prior to the app launch.
	 *
	 * export TSLIB_TSDEVICE=/dev/input/event1
	 * export TSLIB_CONFFILE=/etc/ts.conf
	 * export TSLIB_CALIBFILE=/etc/pointercal
	 * export TSLIB_CONSOLEDEVICE=/dev/tty
	 * export TSLIB_FBDEVICE=/dev/fb0
	 *************************************************/

	ts = ts_open(TOUCHSCREEN_INPUT, 1);

	if (!ts)
	{
		m_pShell->PVRShellOutputDebug("Can't open the touchscreen input device\n");
	}
	else if (ts_config(ts))
	{
		m_pShell->PVRShellOutputDebug("Can't open the touchscreen input device\n");
	}
#endif

    // Remote Control handling
    if((remote_fd = open(REMOTE, O_RDONLY|O_NDELAY)) <= 0)
	{
		m_pShell->PVRShellOutputDebug("Can't open remote control input device (%s)\n",REMOTE);
	}
    else
    {
		tcgetattr(remote_fd, &remios_orig);
		remios.c_cflag = B9600 | CRTSCTS | CS8 | CLOCAL | CREAD;
		remios.c_iflag = IGNPAR | ICRNL;
		remios.c_oflag = 0;
		remios.c_lflag = 0;
		remios.c_cc[VMIN] = 1;
		remios.c_cc[VTIME]= 0;

		tcflush(remote_fd, TCIFLUSH);
		tcsetattr(remote_fd, TCSANOW, &remios);
    }



	// Pixmap support: init variables to 0

	/*
		Construct the binary path for GetReadPath() and GetWritePath()
	*/
	// Get PID
	pid_t ourPid = getpid();
	char *pszExePath, pszSrcLink[64];
	int len = 64;
	int res;

	sprintf(pszSrcLink, "/proc/%d/exe", ourPid);
	pszExePath = 0;

	do
	{
		len *= 2;
		delete[] pszExePath;
		pszExePath = new char[len];
		res = readlink(pszSrcLink, pszExePath, len);
	} while((res < 0) || (res >= len));

	pszExePath[res] = '\0'; // Null-terminate readlink's result
	SetReadPath(pszExePath);
	SetWritePath(pszExePath);
	SetAppName(pszExePath);
	delete[] pszExePath;

	/*
	 * Get rid of the blinking cursor on a screen.
	 *
	 * It's an equivalent of:
	 * <CODE> echo -n -e "\033[?25l" > /dev/tty0 </CODE>
	 * if you do the above command then you can undo it with:
	 * <CODE> echo -n -e "\033[?25h" > /dev/tty0 </CODE>
	 */
	FILE *tty = 0;
	tty = fopen("/dev/tty0", "w");
	if (tty != 0)
	{
		const char txt[] = { 27 /* the ESCAPE ASCII character */
						   , '['
						   , '?'
						   , '2'
						   , '5'
						   , 'l'
						   , 0
						   };

		fprintf(tty, txt);
		fclose(tty);
	}
}

/*!***********************************************************************
 @Function		OsInitOS
 @description	Saves instance handle and creates main window
				In this function, we save the instance handle in a global variable and
				create and display the main program window.
*************************************************************************/
bool PVRShellInit::OsInitOS()
{
	// Initialize global strings

	m_pShell->m_pShellData->bFullScreen = 1;

	return true;
}

/*!***********************************************************************
 @Function		OsReleaseOS
 @description	Destroys main window
*************************************************************************/
void PVRShellInit::OsReleaseOS()
{
}

/*!***********************************************************************
 @Function		OsExit
 @description	Destroys main window
*************************************************************************/
void PVRShellInit::OsExit()
{
	// Show the exit message to the user
	m_pShell->PVRShellOutputDebug((const char*)m_pShell->PVRShellGet(prefExitMessage));
}

/*!***********************************************************************
 @Function		OsDoInitAPI
 @Return		true on success
 @description	Perform API initialisation and bring up window / fullscreen
*************************************************************************/
bool PVRShellInit::OsDoInitAPI()
{
	if(!ApiInitAPI())
	{
		return false;
	}

	// No problem occured
	return true;
}

/*!***********************************************************************
 @Function		OsDoReleaseAPI
 @description	Clean up after we're done
*************************************************************************/
void PVRShellInit::OsDoReleaseAPI()
{
	ApiReleaseAPI();
}

/*!***********************************************************************
 @Function		OsRenderComplete
 @Returns		false when the app should quit
 @description	Main message loop / render loop
*************************************************************************/
void PVRShellInit::OsRenderComplete()
{
	int		ckb = 0;
	size_t  bytes_read;

	// Check keyboard and keypad

	// Keyboard.
	{
		while ((bytes_read = read(devfd, &ckb, 1)) == 1);

		switch(ckb)
		{
		case '0':
		case 'q':
		case 'Q':
		case 0x71000000:
			nLastKeyPressed = PVRShellKeyNameQUIT;
			break;
		case 95: // F11
		case 's':
		case 0x73000000:
			nLastKeyPressed = PVRShellKeyNameScreenshot;
			break;
		case 13:
		case 0x0D000000:
			nLastKeyPressed = PVRShellKeyNameSELECT;
			break;
		case ' ':
		case 0x20000000:
			nLastKeyPressed = PVRShellKeyNameACTION1;
			break;
		case '8':
		case 65: // Up Arrow
		case 0x41000000:
			nLastKeyPressed = m_eKeyMapUP;
			break;
		case '2':
		case 66: // Down Arrow
		case 0x42000000:
			nLastKeyPressed = m_eKeyMapDOWN;
			break;
		case '4':
		case 68: // Left Arrow
		case 0x44000000:
			nLastKeyPressed = m_eKeyMapLEFT;
			break;
		case '6':
		case 67: // Right Arrow
		case 0x43000000:
			nLastKeyPressed = m_eKeyMapRIGHT;
			break;
		default:;

		}
	}

	// Keypad.
	if (keypad_fd)
	{
	    struct input_event {
        	struct timeval time;
        	unsigned short type;
        	unsigned short code;
        	unsigned int value;
    	}keyinfo;

        int bytes=read(keypad_fd,&keyinfo,sizeof(struct input_event));

        if(bytes == sizeof(struct input_event) && keyinfo.type==0x01)
        {
			// keyinfo.value posibilities:
			// 0: key released.
			// 1: key pressed.
			// 2: key is beeing held.
			if (keyinfo.value == 1 || keyinfo.value == 2)
			{
            	//printf("bytes_read=%d, time=%ld; sec %ld microsec,code=%d,value=%d\n",
				//		bytes,
            	//		keyinfo.time.tv_sec,
            	//		keyinfo.time.tv_usec,
            	//		keyinfo.code,
            	//		keyinfo.value
            	//		);

				switch(keyinfo.code)
				{
				case 22:
				case 64:
					  nLastKeyPressed = PVRShellKeyNameQUIT;	break;
				case 37:
				case 65:
					  nLastKeyPressed = PVRShellKeyNameScreenshot;	break;
				case 28:  nLastKeyPressed = PVRShellKeyNameSELECT;	break;
				case 46:
				case 59:
					  nLastKeyPressed = PVRShellKeyNameACTION1;	break;
				case 60:
					  nLastKeyPressed = PVRShellKeyNameACTION2;	break;
				case 103: nLastKeyPressed = m_eKeyMapUP;	break;
				case 108: nLastKeyPressed = m_eKeyMapDOWN;	break;
				case 105: nLastKeyPressed = m_eKeyMapLEFT;	break;
				case 106: nLastKeyPressed = m_eKeyMapRIGHT;	break;
				default:;
				}
			}
        }
	}

	// Remote control
	if(remote_fd)
	{
		int ret = 0;
		char input[32];
		ret = read(remote_fd, input, sizeof(input));

		if(input[0] == 0x87)
		{
			switch(input[1])
			{
				case 0x56: // Stop
					nLastKeyPressed = PVRShellKeyNameQUIT;
				break;
				case 0x75: // Rec
					nLastKeyPressed = PVRShellKeyNameScreenshot;
				break;
				case 0x63: // Ok
					nLastKeyPressed = PVRShellKeyNameSELECT;
				break;
				case 0x65: // Chapter back
					nLastKeyPressed = PVRShellKeyNameACTION1;
				break;
				case 0x66: // Chapter forward
					nLastKeyPressed = PVRShellKeyNameACTION2;
				break;
				case 0xc2: // Up
					nLastKeyPressed = m_eKeyMapUP;
				break;
				case 0xc3: // Down
					nLastKeyPressed = m_eKeyMapDOWN;
				break;
				case 0x93: // Left
					nLastKeyPressed = m_eKeyMapLEFT;
				break;
				case 0x8f: // Right
					nLastKeyPressed = m_eKeyMapRIGHT;
				break;
			}
		}
	}
}

/*!***********************************************************************
 @Function		OsPixmapCopy
 @Return		true if the copy succeeded
 @description	When using pixmaps, copy the render to the display
*************************************************************************/
bool PVRShellInit::OsPixmapCopy()
{
	return false;
}

/*!***********************************************************************
 @Function		OsGetNativeDisplayType
 @Return		The 'NativeDisplayType' for EGL
 @description	Called from InitAPI() to get the NativeDisplayType
*************************************************************************/
void *PVRShellInit::OsGetNativeDisplayType()
{
	return 0;
}

/*!***********************************************************************
 @Function		OsGetNativePixmapType
 @Return		The 'NativePixmapType' for EGL
 @description	Called from InitAPI() to get the NativePixmapType
*************************************************************************/
void *PVRShellInit::OsGetNativePixmapType()
{
	// Pixmap support: return the pixmap
	return 0;
}

/*!***********************************************************************
 @Function		OsGetNativeWindowType
 @Return		The 'NativeWindowType' for EGL
 @description	Called from InitAPI() to get the NativeWindowType
*************************************************************************/
void *PVRShellInit::OsGetNativeWindowType()
{
	return 0;
}

/*!***********************************************************************
 @Function		OsGet
 @Input			prefName	Name of value to get
 @Modified		pn A pointer set to the value asked for
 @Returns		true on success
 @Description	Retrieves OS-specific data
*************************************************************************/
bool PVRShellInit::OsGet(const prefNameIntEnum prefName, int *pn)
{
	return false;
}

/*!***********************************************************************
 @Function		OsGet
 @Input			prefName	Name of value to get
 @Modified		pp A pointer set to the value asked for
 @Returns		true on success
 @Description	Retrieves OS-specific data
*************************************************************************/
bool PVRShellInit::OsGet(const prefNamePtrEnum prefName, void **pp)
{
#ifdef PVRSHELL_OMAP3_TS_SUPPORT
	switch(prefName)
	{
	case prefPointerLocation:
	{
		int ret = ts_read(ts, samples, PVRSHELL_TS_SAMPLES);

		if (ret <= 0)
		{
			//m_bPointer = false;
			*pp = NULL;
			return false;
		}
		struct ts_sample &samp = samples[ret - 1];
		m_vec2PointerLocation[0] = (float)samp.x / m_pShell->m_pShellData->nShellDimX;
		m_vec2PointerLocation[1] = (float)samp.y / m_pShell->m_pShellData->nShellDimY;
		//m_bPointer = true;
		*pp = m_vec2PointerLocation;

		return true;
	}
	default:
		return false;
	}
#endif
	return false;
}

/*!***********************************************************************
 @Function		OsDisplayDebugString
 @Input			str		string to output
 @Description	Prints a debug string
*************************************************************************/
void PVRShellInit::OsDisplayDebugString(char const * const str)
{
	printf(str);
}

/*!***********************************************************************
 @Function		OsGetTime
 @Return		Time in milliseconds since the beginning of the application
 @Description	Gets the time in milliseconds since the beginning of the application
*************************************************************************/
unsigned long PVRShellInit::OsGetTime()
{
#ifndef USE_CLOCK_FOR_TIME
	timeval tv;
	gettimeofday(&tv,NULL);
	return (unsigned long)(((unsigned long)tv.tv_sec*(unsigned long)1000) + (tv.tv_usec/1000.0));
#else
	return (unsigned long)(clock() * (1000.0f/CLOCKS_PER_SEC));
#endif
}

/*****************************************************************************
 Class: PVRShellInitOS
*****************************************************************************/

/*****************************************************************************
 Global code
*****************************************************************************/

/*!***************************************************************************
@function		main
@input			argc	count of args from OS
@input			argv	array of args from OS
@returns		result code to OS
@description	Main function of the program
*****************************************************************************/
int main(int argc, char **argv)
{
	PVRShellInit init;

	// Create the demo, process the command line, create the OS initialiser.
	PVRShell *pDemo = NewDemo();

	if(!pDemo)
		return EXIT_ERR_CODE;

	init.Init(*pDemo);
	init.CommandLine((argc-1),&argv[1]);

	//	Initialise/run/shutdown
	while(init.Run());

	delete pDemo;

	return EXIT_NOERR_CODE;
}

/*****************************************************************************
 End of file (PVRShellOS.cpp)
*****************************************************************************/
