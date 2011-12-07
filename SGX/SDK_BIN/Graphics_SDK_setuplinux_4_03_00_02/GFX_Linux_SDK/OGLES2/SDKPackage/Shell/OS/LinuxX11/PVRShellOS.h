/******************************************************************************

 @File         PVRShellOS.h

 @Title        LinuxX11/PVRShellOS

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     Linux X11

 @Description  Makes programming for 3D APIs easier by wrapping surface
               initialization, Texture allocation and other functions for use by a demo.

******************************************************************************/
#ifndef _PVRSHELLOS_
#define _PVRSHELLOS_

#include "X11/Xlib.h"
#include "X11/Xutil.h"
#ifdef BUILD_OGL
#include "X11/extensions/xf86vmode.h"
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
	char* szTitle;

	Display*     x11display;
	long         x11screen;
	XVisualInfo* x11visual;
	Colormap     x11colormap;
	Window       x11window;
    #ifdef BUILD_OGL
    XF86VidModeModeLine originalMode;  // modeline that was active at the starting point of this aplication
    int         originalMode_dotclock;
    #endif
	// Pixmap support: variables for the pixmap
	Pixmap		x11pixmap;
	GC			x11gc;

public:
	int OpenX11Window(const PVRShell &shell);
	void CloseX11Window();
};

#endif /* _PVRSHELLOS_ */
/*****************************************************************************
 End of file (PVRShellOS.h)
*****************************************************************************/
