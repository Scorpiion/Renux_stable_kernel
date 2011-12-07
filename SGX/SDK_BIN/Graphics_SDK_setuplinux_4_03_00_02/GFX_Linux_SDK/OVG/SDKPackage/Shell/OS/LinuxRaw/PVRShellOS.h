/******************************************************************************

 @File         PVRShellOS.h

 @Title        LinuxRaw/PVRShellOS

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     Non-windowed support for any Linux

 @Description  Makes programming for 3D APIs easier by wrapping surface
               initialization, Texture allocation and other functions for use by a demo.

******************************************************************************/
#ifndef _PVRSHELLOS_
#define _PVRSHELLOS_

#include <termios.h>
#include <unistd.h>

#ifdef PVRSHELL_OMAP3_TS_SUPPORT
// Touchscreen include file
#include "tslib.h"
#define PVRSHELL_TS_SAMPLES 15
#endif

#define PVRSHELL_DIR_SYM	'/'
#define _stricmp strcasecmp

/*!***************************************************************************
 PVRShellInitOS
 @Brief Class. Interface with specific Operative System.
*****************************************************************************/
class PVRShellInitOS
{
public:
	~PVRShellInitOS() {
		/* recover tty state */
		tcsetattr(devfd, TCSANOW, &termio_orig);
		tcsetattr(remote_fd, TCSANOW, &remios_orig);
		close(remote_fd);
	}

public:
	// Pixmap support: variables for the pixmap

	// Keypad handling.
	int keypad_fd;

	// Remote control handling.
	int remote_fd;
    struct termios remios;
    struct termios remios_orig;

	// Key handling
	int devfd;
	struct termios termio;
    struct termios termio_orig;

#ifdef PVRSHELL_OMAP3_TS_SUPPORT
	// Touchscreen
	struct tsdev *ts;
	struct ts_sample samples[PVRSHELL_TS_SAMPLES];
	float m_vec2PointerLocation[2];
	// Note: not really necessary if the samples are read in OsGet
	//bool m_bPointer;	// is there a valid pointer position stored?
#endif
};

#endif /* _PVRSHELLOS_ */
/*****************************************************************************
 End of file (PVRShellOS.h)
*****************************************************************************/
