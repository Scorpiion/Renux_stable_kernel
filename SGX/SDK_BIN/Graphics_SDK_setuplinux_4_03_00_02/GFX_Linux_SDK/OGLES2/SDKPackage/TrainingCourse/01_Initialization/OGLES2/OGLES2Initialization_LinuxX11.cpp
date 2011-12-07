/******************************************************************************

 @File         OGLES2Initialization_LinuxX11.cpp

 @Title        OpenGL ES 2.0 Initialization Tutorial

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     .

 @Description  Basic Tutorial that shows step-by-step how to initialize OpenGL ES
               2.0, use it for clearing the screen with different colours and
               terminate it.

******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include "X11/Xlib.h"
#include "X11/Xutil.h"

#include <EGL/egl.h>
#include <GLES2/gl2.h>

/******************************************************************************
 Defines
******************************************************************************/

// Width and height of the window
#define WINDOW_WIDTH	640
#define WINDOW_HEIGHT	480

/*!****************************************************************************
 @Function		TestEGLError
 @Input			pszLocation		location in the program where the error took
								place. ie: function name
 @Return		bool			true if no EGL error was detected
 @Description	Tests for an EGL error and prints it
******************************************************************************/
bool TestEGLError(const char* pszLocation)
{
	/*
		eglGetError returns the last error that has happened using egl,
		not the status of the last called function. The user has to
		check after every single egl call or at least once every frame.
	*/
	EGLint iErr = eglGetError();
	if (iErr != EGL_SUCCESS)
	{
		printf("%s failed (%d).\n", pszLocation, iErr);
		return false;
	}

	return true;
}

void CleanupAndExit ( EGLDisplay eglDisplay
					, Display * x11Display
					, Window x11Window
					, Colormap x11Colormap
					)
{
	eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT) ;
	eglTerminate(eglDisplay);

	/*
		Step 10 - Destroy the eglWindow.
		Again, this is platform specific and delegated to a separate function 
	*/
	if (x11Window) XDestroyWindow(x11Display, x11Window);
    if (x11Colormap) XFreeColormap( x11Display, x11Colormap );
	if (x11Display) XCloseDisplay(x11Display);
	exit(-1);
}

/*!****************************************************************************
 @Function		main
 @Input			argc		Number of arguments
 @Input			argv		Command line arguments
 @Return		int			result code to OS
 @Description	Main function of the program
******************************************************************************/
int main(int argc, char **argv)
{
	// Variable set in the message handler to finish the demo
	bool				bDemoDone	= false;

	// X11 variables
	Window				x11Window	= 0;
	Display*			x11Display	= 0;
	long				x11Screen	= 0;
	XVisualInfo*		x11Visual	= 0;
	Colormap			x11Colormap	= 0;

	// EGL variables
	EGLDisplay			eglDisplay	= 0;
	EGLConfig			eglConfig	= 0;
	EGLSurface			eglSurface	= 0;
	EGLContext			eglContext	= 0;

	/*
		Step 0 - Create a EGLNativeWindowType that we can use it for OpenGL ES output
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
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
	}
	x11Screen = XDefaultScreen( x11Display );
	
	// Gets the window parameters
	sRootWindow = RootWindow(x11Display, x11Screen);
	i32Depth = DefaultDepth(x11Display, x11Screen);
	x11Visual = new XVisualInfo;
	XMatchVisualInfo( x11Display, x11Screen, i32Depth, TrueColor, x11Visual);
	if (!x11Visual)
	{
		printf("Error: Unable to acquire visual\n");
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
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
		Step 1 - Get the default display.
		EGL uses the concept of a "display" which in most environments
		corresponds to a single physical screen. Since we usually want
		to draw to the main screen or only have a single screen to begin
		with, we let EGL pick the default display.
		Querying other displays is platform specific.
	*/
	eglDisplay = eglGetDisplay((EGLNativeDisplayType)x11Display);

	/*
		Step 2 - Initialize EGL.
		EGL has to be initialized with the display obtained in the
		previous step. We cannot use other EGL functions except
		eglGetDisplay and eglGetError before eglInitialize has been
		called.
		If we're not interested in the EGL version number we can just
		pass NULL for the second and third parameters.
	*/
	EGLint iMajorVersion, iMinorVersion;
	if (!eglInitialize(eglDisplay, &iMajorVersion, &iMinorVersion))
	{
		printf("Error: eglInitialize() failed.\n");
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
	}

	/*
		Step 3 - Specify the required configuration attributes.
		An EGL "configuration" describes the pixel format and type of
		surfaces that can be used for drawing.
		For now we just want to use a 16 bit RGB surface that is a 
		Window surface, i.e. it will be visible on screen. The list
		has to contain key/value pairs, terminated with EGL_NONE.
	 */
	EGLint pi32ConfigAttribs[5];
	pi32ConfigAttribs[0] = EGL_SURFACE_TYPE;
	pi32ConfigAttribs[1] = EGL_WINDOW_BIT;
	pi32ConfigAttribs[2] = EGL_RENDERABLE_TYPE;
	pi32ConfigAttribs[3] = EGL_OPENGL_ES2_BIT;	
	pi32ConfigAttribs[4] = EGL_NONE;

	EGLint pi32ContextAttribs[3];
	pi32ContextAttribs[0] = EGL_CONTEXT_CLIENT_VERSION;
	pi32ContextAttribs[1] = 2;
	pi32ContextAttribs[2] = EGL_NONE;

	/*
		Step 4 - Find a config that matches all requirements.
		eglChooseConfig provides a list of all available configurations
		that meet or exceed the requirements given as the second
		argument. In most cases we just want the first config that meets
		all criteria, so we can limit the number of configs returned to 1.
	*/
	int iConfigs;
	if (!eglChooseConfig(eglDisplay, pi32ConfigAttribs, &eglConfig, 1, &iConfigs) || (iConfigs != 1))
	{
		printf("Error: eglChooseConfig() failed.\n");
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
	}

	/*
		Step 5 - Create a surface to draw to.
		Use the config picked in the previous step and the native window
		handle when available to create a window surface. A window surface
		is one that will be visible on screen inside the native display (or 
		fullscreen if there is no windowing system).
		Pixmaps and pbuffers are surfaces which only exist in off-screen
		memory.
	*/
	eglSurface = eglCreateWindowSurface(eglDisplay, eglConfig, (EGLNativeWindowType)x11Window, NULL);
	
    if (!TestEGLError("eglCreateWindowSurface"))
	{
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
	}

	/*
		Step 6 - Create a context.
		EGL has to create a context for OpenGL ES. Our OpenGL ES resources
		like textures will only be valid inside this context
		(or shared contexts)
	*/
	eglContext = eglCreateContext(eglDisplay, eglConfig, NULL, pi32ContextAttribs);

	if (!TestEGLError("eglCreateContext"))
	{
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
	}

	/*
		Step 7 - Bind the context to the current thread and use our 
		window surface for drawing and reading.
		Contexts are bound to a thread. This means you don't have to
		worry about other threads and processes interfering with your
		OpenGL ES application.
		We need to specify a surface that will be the target of all
		subsequent drawing operations, and one that will be the source
		of read operations. They can be the same surface.
	*/
	eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext);

	if (!TestEGLError("eglMakeCurrent"))
	{
		CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
	}

	/*
		Step 8 - Draw something with OpenGL ES.
		At this point everything is initialized and we're ready to use
		OpenGL ES to draw something on the screen. 
	*/

	// Clears the screen in different colours
	for(int i = 0; i < 1000; ++i)
	{
		// Check if the message handler finished the demo
		if (bDemoDone) break;

		// Sets the clear color to a varying color.
		// The colours are passed per channel (red,green,blue,alpha) as float values from 0.0 to 1.0
		if (i&128)
	    {
			glClearColor(0.6f, 0.8f, 1.0f, 1.0f); // clear blue 			
	    }
		else
	    {
			glClearColor(1.0f, 1.0f, 0.66f, 1.0f); // clear yellow
	    }

		/*
			Clears the color buffer.
			glClear() can also be used to clear the depth or stencil buffer
			(GL_DEPTH_BUFFER_BIT or GL_STENCIL_BUFFER_BIT)
		*/
		glClear(GL_COLOR_BUFFER_BIT);
		if (!TestEGLError("glClear"))
		{
			CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
		}

		/*
			Swap Buffers.
			Brings to the native display the current render surface.
		*/
		eglSwapBuffers(eglDisplay, eglSurface);

		if (!TestEGLError("eglSwapBuffers"))
		{
			CleanupAndExit (eglDisplay, x11Display, x11Window, x11Colormap);
		}
	}
		
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

	/*
		Step 9 - Terminate OpenGL ES and destroy the window (if present).
		eglTerminate takes care of destroying any context or surface created
		with this display, so we don't need to call eglDestroySurface or
		eglDestroyContext here.
	*/
	return 0;
}

/******************************************************************************
 End of file (OGLES2Initialization.cpp)
******************************************************************************/
