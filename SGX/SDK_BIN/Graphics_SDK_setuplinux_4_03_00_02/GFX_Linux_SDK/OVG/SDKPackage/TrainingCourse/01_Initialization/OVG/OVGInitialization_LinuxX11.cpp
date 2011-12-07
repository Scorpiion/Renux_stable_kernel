/******************************************************************************

 @File         OVGInitialization_LinuxX11.cpp

 @Title        OpenVG Intitalization Tutorial

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     .

 @Description  Basic Tutorial that shows step-by-step how to initialize OpenVG,
               use it for drawing a line, and terminate it.

******************************************************************************/
#include "X11/Xlib.h"
#include "X11/Xutil.h"

#include <VG/openvg.h>
#include <EGL/egl.h>

// No C++ Standard Library or exception handling on Symbian platform
#include <stdio.h>

/******************************************************************************
 Defines
******************************************************************************/

// Width and height of the window
#define WINDOW_WIDTH	240
#define WINDOW_HEIGHT	320

/****************************************************************************
** Constants
****************************************************************************/
const char pszAppName[] = "OpenVG Intialization Tutorial";

/****************************************************************************
** Declarations
****************************************************************************/

/****************************************************************************
** Application entry point
****************************************************************************/
int main()
{
	// Variable set in the message handler to finish the demo
	bool				bDemoDone	= false;

	// X11 variables
	Display*			x11Display	= 0;
	Window				x11Window	= 0;
	Colormap			x11Colormap	= 0;

	EGLDisplay			eglDisplay	= 0;
	EGLConfig			eglConfig	= 0;
	EGLSurface			eglSurface	= 0;
	EGLContext			eglContext	= 0;
	int i32NumConfigs, i32MajorVersion, i32MinorVersion;

	// Initialize the clear color to opaque red
	VGfloat afClearColor[] = { 1, 0, 0, 1 };

	/*
	Step 0 - Create a window that we can use for OpenVG output

	Window creation is platform specific so it should be done by
	a separate function.
	*/
	Window					sRootWindow;
    XSetWindowAttributes	sWA;
	unsigned int			ui32Mask;
	int						i32Depth;

	// Initializes the display and screen
	x11Display = XOpenDisplay( 0 );
	if (!x11Display)
	{
		printf("Error: Unable to open X display\n");
		goto cleanup;
	}
	long x11Screen;
	x11Screen = XDefaultScreen( x11Display );

	// Gets the window parameters
	sRootWindow = RootWindow(x11Display, x11Screen);
	i32Depth = DefaultDepth(x11Display, x11Screen);
	XVisualInfo* x11Visual;
	x11Visual = new XVisualInfo;
	XMatchVisualInfo( x11Display, x11Screen, i32Depth, TrueColor, x11Visual);
	if (!x11Visual)
	{
		printf("Error: Unable to acquire visual\n");
		goto cleanup;
	}
    x11Colormap = XCreateColormap( x11Display, sRootWindow, x11Visual->visual, AllocNone );
    sWA.colormap = x11Colormap;

    // Add to these for handling other events
    sWA.event_mask = StructureNotifyMask | ExposureMask | ButtonPressMask | ButtonReleaseMask | KeyPressMask | KeyReleaseMask;
    ui32Mask = CWBackPixel | CWBorderPixel | CWEventMask | CWColormap;

	// Creates the X11 window
    x11Window = XCreateWindow( x11Display, RootWindow(x11Display, x11Screen), 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT,
								 0, CopyFromParent, InputOutput, CopyFromParent, ui32Mask, &sWA);
	XMapWindow(x11Display, x11Window);
	XFlush(x11Display);


	/*
	Step 1 - Get the default display

	EGL uses the concept of a "display" which in most environments
	corresponds to a single physical screen. Since we usually want
	to draw to the main screen or only have a single screen to begin
	with, we let EGL pick the default display.

	Querying other displays is platform specific.
	*/
	eglDisplay = (EGLDisplay)eglGetDisplay((NativeDisplayType)x11Display);

	/*
	Step 2 - Initialize EGL

	EGL has to be initialized with the display obtained in the
	previous step. We cannot use other EGL functions except
	eglGetDisplay and eglGetError before eglInitialize has been
	called.
	If we're not interested in the EGL version number we can just
	pass NULL for the second and third parameters.
	*/
	if(!eglInitialize(eglDisplay, &i32MajorVersion, &i32MinorVersion))
	{
		printf("Error: eglInitialize() failed.\n");
		goto cleanup;
	}

	/*
	Step 3 - Make OpenVG the current API

	EGL provides ways to set up OpenGL ES and OpenVG contexts
	(and possibly other graphics APIs in the future), so we need
	to specify the "current API".
	*/
	eglBindAPI(EGL_OPENVG_API);

	/*
	Step 4 - Specify the required configuration attributes

	An EGL "configuration" describes the pixel format and type of
	surfaces that can be used for drawing.
	For now we just want to use a 16 bit RGB surface that is a
	window surface, i.e. it will be visible on screen. The list
	has to contain key/value pairs, terminated with EGL_NONE.
	*/
	static const int ai32ConfigAttribs[] =
	{
		EGL_RED_SIZE,       5,
		EGL_GREEN_SIZE,     6,
		EGL_BLUE_SIZE,      5,
		EGL_ALPHA_SIZE,     0,
		EGL_SURFACE_TYPE,   EGL_WINDOW_BIT,
		EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
		EGL_NONE
	};

	/*
	Step 5 - Find a config that matches all requirements

	eglChooseConfig provides a list of all available configurations
	that meet or exceed the requirements given as the second
	argument. In most cases we just want the first config that meets
	all criteria, so we can limit the number of configs returned to 1.
	*/
	if(!eglChooseConfig(eglDisplay, ai32ConfigAttribs, &eglConfig, 1, &i32NumConfigs) || (i32NumConfigs != 1))
	{
		printf("Error: eglChooseConfig() failed.\n");
		goto cleanup;
	}

	/*
	Step 6 - Create a window surface to draw to

	Use the config picked in the previous step and the native window
	handle to create a window surface. A window surface is one that
	will be visible on screen inside the native window (or
	fullscreen if there is no window system).

	Pixmaps and pbuffers are surfaces which only exist in off-screen
	memory.
	*/
	eglSurface = eglCreateWindowSurface(eglDisplay, eglConfig, (NativeWindowType)x11Window, NULL);
	if((eglGetError() != EGL_SUCCESS) || (eglSurface == EGL_NO_SURFACE))
	{
		printf("Error: eglCreateWindowSurface() failed.\n");
		goto cleanup;
	}

	/*
	Step 7 - Create a context

	EGL has to create a context for OpenVG. Our OpenVG resources
	like paths and images will only be valid inside this context
	(or shared contexts)
	*/
	eglContext = eglCreateContext(eglDisplay, eglConfig, NULL, NULL);
	if((eglGetError() != EGL_SUCCESS) || (eglContext == EGL_NO_CONTEXT))
	{
		printf("Error: eglCreateContext() failed.\n");
		goto cleanup;
	}

	/*
	Step 8 - Bind the context to the current thread and use our
	window surface for drawing and reading

	Contexts are bound to a thread. This means you don't have to
	worry about other threads and processes interfering with your
	OpenVG application.
	We need to specify a surface that will be the target of all
	subsequent drawing operations, and one that will be the source
	of read operations. They can be the same surface.
	*/
	eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext);
	if(eglGetError() != EGL_SUCCESS)
	{
		printf("Error: eglMakeCurrent() failed.\n");
		goto cleanup;
	}

	/*
	Step 9 - Draw something with OpenVG

	At this point everything is initialized and we're ready to use
	OpenVG to draw something on the screen.

	Usually an application would create OpenVG resources like paths
	and images once and then call a draw function either in response
	to a repaint request by the window system or in an idle loop to
	facilitate smooth animation.

 	For demonstration purposes we only clear the surface
	1000 times while interpolating the clear color from red to blue.
	*/

	/*
	OpenVG's coordinate system is pixel based, so we first determine
	the size of the surface we're drawing to.

	Note that if the window was resized, EGL will automatically resize
	the window surface when you call eglSwapBuffers.
	So when you handle a resize event, it is a good idea to call
	eglSwapBuffers and update all variables that depend on the surface
	size.
	*/
	int i32WindowWidth, i32WindowHeight;
	eglQuerySurface(eglDisplay, eglSurface, EGL_WIDTH, &i32WindowWidth);
	eglQuerySurface(eglDisplay, eglSurface, EGL_HEIGHT, &i32WindowHeight);

	// Start the render loop for 1000 frames!
	for(int i = 0; i < 1000; ++i)
	{
		// Check if the message handler finished the demo
		if (bDemoDone) break;

		// Change clear clour between clear Blue and clear Yellow
		if (i&64)
		{
			afClearColor[0] = 0.6f; // red
			afClearColor[1] = 0.8f; // green
			afClearColor[2] = 1.0f; // blue
			afClearColor[3] = 1.0f; // alpha
		}
		else
		{
			afClearColor[0] = 1.0f; // red
			afClearColor[1] = 1.0f; // green
			afClearColor[2] = 0.66f;// blue
			afClearColor[3] = 1.0f; // alpha
		}

		// Set the new clear color
		vgSetfv(VG_CLEAR_COLOR, 4, afClearColor);

		// Clear the whole surface with the clear color
		vgClear(0, 0, i32WindowWidth, i32WindowHeight);

		/*
		Drawing is double buffered, so you never see any intermediate
		results of the drawing. When you have finished drawing
		you have to call eglSwapBuffers to make the results appear on
		screen.
		*/
		eglSwapBuffers(eglDisplay, eglSurface);

		// Managing the X11 messages
		int i32NumMessages = XPending( x11Display );
		for( int i = 0; i < i32NumMessages; i++ )
		{
			XEvent	event;
			XNextEvent( x11Display, &event );

			switch( event.type )
			{
			// Exit on mouse click
			case ButtonPress:
        		bDemoDone = true;
        		break;
			default:
				break;
			}
		}
	}

cleanup:
	/*
	Step 10 - Terminate OpenVG

	eglTerminate takes care of destroying any context or surface created
	with this display, so we don't need to call eglDestroySurface or
	eglDestroyContext here.
	*/
	eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
	eglTerminate(eglDisplay);

	/*
	Step 11 - Destroy the window

	Again, this is platform specific and delegated to a separate function
	*/
	if (x11Window) XDestroyWindow(x11Display, x11Window);
    if (x11Colormap) XFreeColormap( x11Display, x11Colormap );
	if (x11Display) XCloseDisplay(x11Display);

	// Say goodbye
	printf("%s finished.", pszAppName);
	return 0;
}

/*****************************************************************************
 End of file (Initialization.cpp)
*****************************************************************************/
