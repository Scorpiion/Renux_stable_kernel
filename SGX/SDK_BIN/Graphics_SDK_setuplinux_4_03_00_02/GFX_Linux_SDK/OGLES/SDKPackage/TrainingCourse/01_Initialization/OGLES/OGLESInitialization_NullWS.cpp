/******************************************************************************

 @File         OGLESInitialization_NullWS.cpp

 @Title        OpenGL ES 1.x Initialization Tutorial

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     .

 @Description  Basic Tutorial that shows step-by-step how to initialize OpenGL ES
               1.x, use it for clearing the screen with different colours and
               terminate it.

******************************************************************************/
#include <stdio.h>

#include <GLES/egl.h>
#include <GLES/gl.h>

/******************************************************************************
 Defines
******************************************************************************/

// Defines to abstract float/fixed data for Common/CommonLite profiles
#ifdef PVRT_FIXED_POINT_ENABLE
#define VERTTYPE			GLfixed
#define VERTTYPEENUM		GL_FIXED
#define f2vt(x)				((int)((x)*65536))
#define myglLoadMatrix		glLoadMatrixx
#define myglClearColor		glClearColorx
#define myglLight			glLightx
#define myglLightv			glLightxv
#define myglLightModel		glLightModelx
#define myglLightModelv		glLightModelxv
#define myglTexParameter	glTexParameterx
#else
#define VERTTYPE			GLfloat
#define VERTTYPEENUM		GL_FLOAT
#define f2vt(x)				(x)
#define myglLoadMatrix		glLoadMatrixf
#define myglClearColor		glClearColor
#define myglLight			glLightf
#define myglLightv			glLightfv
#define myglLightModel		glLightModelf
#define myglLightModelv		glLightModelfv
#define myglTexParameter	glTexParameterf
#endif

/*!****************************************************************************
 @Function		TestEGLError
 @Input			pszLocation		location in the program where the error took
								place. ie: function name
 @Return		bool			true if no EGL error was detected
 @Description	Tests for an EGL error and prints it
******************************************************************************/
bool TestEGLError(char* pszLocation)
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

/*!****************************************************************************
 @Function		main
 @Input			argc		Number of arguments
 @Input			argv		Command line arguments
 @Return		int			result code to OS
 @Description	Main function of the program
******************************************************************************/
int main(int argc, char **argv)
{
	// EGL variables
	EGLDisplay			eglDisplay	= 0;
	EGLConfig			eglConfig	= 0;
	EGLSurface			eglSurface	= 0;
	EGLContext			eglContext	= 0;

	/*
		Step 1 - Get the default display.
		EGL uses the concept of a "display" which in most environments
		corresponds to a single physical screen. Since we usually want
		to draw to the main screen or only have a single screen to begin
		with, we let EGL pick the default display.
		Querying other displays is platform specific.
	*/
	eglDisplay = eglGetDisplay((NativeDisplayType)0);

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
		goto cleanup;
	}

	/*
		Step 3 - Specify the required configuration attributes.
		An EGL "configuration" describes the pixel format and type of
		surfaces that can be used for drawing.
		For now we just want to use a 16 bit RGB surface that is a
		Window surface, i.e. it will be visible on screen. The list
		has to contain key/value pairs, terminated with EGL_NONE.
	 */
	EGLint pi32ConfigAttribs[3];
	pi32ConfigAttribs[0] = EGL_SURFACE_TYPE;
	pi32ConfigAttribs[1] = EGL_WINDOW_BIT;
	pi32ConfigAttribs[2] = EGL_NONE;

	/*
		Step 4 - Find a config that matches all requirements.
		eglChooseConfig provides a list of all available configurations
		that meet or exceed the requirements given as the second
		argument. In most cases we just want the first config that meets
		all criteria, so we can limit the number of configs returned to 1.
	*/
	EGLint iConfigs;
	if (!eglChooseConfig(eglDisplay, pi32ConfigAttribs, &eglConfig, 1, &iConfigs) || (iConfigs != 1))
	{
		printf("Error: eglChooseConfig() failed.\n");
		goto cleanup;
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
	eglSurface = eglCreateWindowSurface(eglDisplay, eglConfig, (NativeWindowType)0, NULL);
	if (!TestEGLError("eglCreateWindowSurface"))
	{
		goto cleanup;
	}

	/*
		Step 6 - Create a context.
		EGL has to create a context for OpenGL ES. Our OpenGL ES resources
		like textures will only be valid inside this context
		(or shared contexts)
	*/
	eglContext = eglCreateContext(eglDisplay, eglConfig, NULL, NULL);
	if (!TestEGLError("eglCreateContext"))
	{
		goto cleanup;
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
		goto cleanup;
	}

	/*
		Step 8 - Draw something with OpenGL ES.
		At this point everything is initialized and we're ready to use
		OpenGL ES to draw something on the screen.
	*/

	// Clears the screen in different colours
	for(int i = 0; i < 1000; ++i)
	{
		// Sets the clear color to a varying color.
		// The colours are passed per channel (red,green,blue,alpha) as float values from 0.0 to 1.0
		if (i&64)
		{
			myglClearColor(f2vt(0.6f), f2vt(0.8f), f2vt(1.0f), f2vt(1.0f)); // clear blue
		}
		else
		{
			myglClearColor(f2vt(1.0f), f2vt(1.0f), f2vt(0.66f), f2vt(1.0f)); // clear yellow
		}


		/*
			Clears the color buffer.
			glClear() can also be used to clear the depth or stencil buffer
			(GL_DEPTH_BUFFER_BIT or GL_STENCIL_BUFFER_BIT)
		*/
		glClear(GL_COLOR_BUFFER_BIT);
		if (!TestEGLError("glClear"))
		{
			goto cleanup;
		}

		/*
			Swap Buffers.
			Brings to the native display the current render surface.
		*/
		eglSwapBuffers(eglDisplay, eglSurface);
		if (!TestEGLError("eglSwapBuffers"))
		{
			goto cleanup;
		}
	}

	/*
		Step 9 - Terminate OpenGL ES and destroy the window (if present).
		eglTerminate takes care of destroying any context or surface created
		with this display, so we don't need to call eglDestroySurface or
		eglDestroyContext here.
	*/
cleanup:
	eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT) ;
	eglTerminate(eglDisplay);
	return 0;
}

/******************************************************************************
 End of file (OGLESInitialization.cpp)
******************************************************************************/
