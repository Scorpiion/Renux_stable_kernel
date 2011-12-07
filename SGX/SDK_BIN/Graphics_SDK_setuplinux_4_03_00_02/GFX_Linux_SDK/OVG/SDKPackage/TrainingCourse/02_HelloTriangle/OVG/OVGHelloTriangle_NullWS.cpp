/******************************************************************************

 @File         OVGHelloTriangle_NullWS.cpp

 @Title        OpenVG HelloTriangle

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     Independant

 @Description  Simple example rendering a triangle with OpenVG

******************************************************************************/
#include <VG/openvg.h>
#include <EGL/egl.h>

// No C++ Standard Library or exception handling on Symbian platform
#include <stdio.h>

/****************************************************************************
** Constants
****************************************************************************/
const char pszAppName[] = "OpenVG Hello Triangle";

/****************************************************************************
** Declarations
****************************************************************************/

/****************************************************************************
** Platform specific functions
****************************************************************************/
/*!***********************************************************************
 @Function		CreateVGWindow
 @Input			pszTitle		a C string to be used as window title
 @Returns		A window handle
 @Description	Creates a window that is suitable for OpenVG rendering
*************************************************************************/
EGLNativeWindowType CreateVGWindow(const char *pszTitle) throw()
{
	// This will work for a platform without window system.
	return (EGLNativeWindowType)0;
}

/*!***********************************************************************
 @Function		DestroyVGWindow
 @Input			window		a window handle
 @Description	Destroys a window
*************************************************************************/
void DestroyVGWindow(EGLNativeWindowType window) throw()
{
	// This will work for a platform without window system.
	return;
}


/****************************************************************************
** Application entry point
****************************************************************************/
int main()
{
	EGLDisplay			eglDisplay	= 0;
	EGLConfig			eglConfig	= 0;
	EGLSurface			eglSurface	= 0;
	EGLContext			eglContext	= 0;
	EGLint i32NumConfigs, i32MajorVersion, i32MinorVersion;

	/*
	Step 0 - Initialize OpenVG
	--------------------------

	The following code up to the next comment block consists of the
	steps 0 to 8 taken straight from the Initialization tutorial.
	*/
	EGLNativeWindowType sWindow = CreateVGWindow(pszAppName);

	eglDisplay = eglGetDisplay((EGLNativeDisplayType) EGL_DEFAULT_DISPLAY);

	if(!eglInitialize(eglDisplay, &i32MajorVersion, &i32MinorVersion))
	{
		printf("Error: eglInitialize() failed.\n");
		goto cleanup;
	}

	eglBindAPI(EGL_OPENVG_API);

	static const EGLint ai32ConfigAttribs[] =
	{
		EGL_RED_SIZE,       5,
		EGL_GREEN_SIZE,     6,
		EGL_BLUE_SIZE,      5,
		EGL_ALPHA_SIZE,     0,
		EGL_SURFACE_TYPE,   EGL_WINDOW_BIT,
		EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
		EGL_NONE
	};

	if(!eglChooseConfig(eglDisplay, ai32ConfigAttribs, &eglConfig, 1, &i32NumConfigs) || (i32NumConfigs != 1))
	{
		printf("Error: eglChooseConfig() failed.\n");
		goto cleanup;
	}

	eglSurface = eglCreateWindowSurface(eglDisplay, eglConfig, sWindow, NULL);
	if((eglGetError() != EGL_SUCCESS) || (eglSurface == EGL_NO_SURFACE))
	{
		printf("Error: eglCreateWindowSurface() failed.\n");
		goto cleanup;
	}

	eglContext = eglCreateContext(eglDisplay, eglConfig, NULL, NULL);
	if((eglGetError() != EGL_SUCCESS) || (eglContext == EGL_NO_CONTEXT))
	{
		printf("Error: eglCreateContext() failed.\n");
		goto cleanup;
	}

	eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext);
	if(eglGetError() != EGL_SUCCESS)
	{
		printf("Error: eglMakeCurrent() failed.\n");
		goto cleanup;
	}

	/*
	Steps 1 to 4 - Prepare OpenVG to draw a triangle
	------------------------------------------------

	At this point we could theoretically start drawing with OpenVG. But
	we have to specify what to draw and how to draw it first.
	*/

	/*
	Step 1 - Set up a device independent coordinate system
	------------------------------------------------------

	Initially, the OpenVG coordinate system is based on the output resolution.
	To get a device independent coordinate system, we need to apply a
	transformation: Scaling by the output resolution means that coordinates
	between (0, 0) and (1, 1) will be visible on screen, with the origin
	in the lower left corner.

	Transformations are described more in-depth in the Transforms tutorial.

	It should be noted that different aspect ratios often require
	special attention regarding the layout of elements on screen.
	*/

	EGLint i32WindowWidth, i32WindowHeight;
	eglQuerySurface(eglDisplay, eglSurface, EGL_WIDTH, &i32WindowWidth);
	eglQuerySurface(eglDisplay, eglSurface, EGL_HEIGHT, &i32WindowHeight);

	vgSeti(VG_MATRIX_MODE, VG_MATRIX_PATH_USER_TO_SURFACE);
	vgLoadIdentity();
	vgScale((float)i32WindowWidth, (float)i32WindowHeight);


	/*
	Step 2 - Create a path
	----------------------
	Drawing shapes with OpenVG requires a path which represents a series of
	line and curve segments describing the outline of the shape. The shape
	does not need to be closed, but for now we will start with a simple
	triangle.
	First we create a path handle, then we append segment and point data.

	Creating a path involves choosing a datatype used for point data (we use
	float here, indicated by VG_PATH_DATATYPE_F) and capabilities that we want
	to use. Picking the right capabilities is important as the OpenVG driver
	can use a more efficient and compact internal representation for paths
	with limited capabilities. We only need two capabilities for this tutorial:
	adding data	to the path and drawing it, with the latter being implicitly
	enabled	for all paths.
	*/
	VGPath vgTriangle;
	vgTriangle = vgCreatePath(
							VG_PATH_FORMAT_STANDARD,
							VG_PATH_DATATYPE_F,
							1.0f, 0.0f, 4, 3,
							(unsigned int)VG_PATH_CAPABILITY_APPEND_TO);

	/*
	The segments of a path are described as a series of commands, represented as
	an array of bytes. You can imagine the commands being performed by a pen:
	First the pen moves to a starting location without drawing, from there it
	draws a line to a second point. Then another line to a third point. After
	that, it closes the shape by drawing a line from the last point to the
	starting location: triangle finished!

	The suffixes _ABS and _REL attached to the commands indicate whether the
	coordinates are to be interpreted as absolute locations (seen from the
	origin)or as being relative to the location of the current point.
	*/
	VGubyte aui8PathSegments[4];
	aui8PathSegments[0] = VG_MOVE_TO_ABS;
	aui8PathSegments[1] = VG_LINE_TO_ABS;
	aui8PathSegments[2] = VG_LINE_TO_ABS;
	aui8PathSegments[3] = VG_CLOSE_PATH;

	/*
	In addition to the array of commands, the path needs a list of points. A
	command can "consume" from 0 to 6 values, depending on its type. MOVE_TO
	and LINE_TO each take two values, CLOSE_PATH takes none.
	A triangle requires 3 2D vertices.
	*/
	VGfloat afPoints[6];
	afPoints[0] = 0.3f;
	afPoints[1] = 0.3f;
	afPoints[2] = 0.7f;
	afPoints[3] = 0.3f;
	afPoints[4] = 0.5f;
	afPoints[5] = 0.7f;

	/*
	When appending data to the path, only the number of segments needs to be
	specified since the number of points used depends on the actual commands.
	*/
	vgAppendPathData(vgTriangle, 4, aui8PathSegments, afPoints);

	/*
	Path capabilities should be removed as soon as they are no longer needed.
	The OpenVG implementation might work more efficiently if it knows that
	path data will not change since it can use an optimized internal
	representation.
	*/
	vgRemovePathCapabilities(vgTriangle, VG_PATH_CAPABILITY_APPEND_TO);


	/*
	Step 3 - Create a paint
	-----------------------
	To fill a shape, we need a paint that describes how to fill it: a gradient,
	pattern, or single color. Here we choose a paint with type COLOR that
	is a simple opaque red. vgSetColor is a shortcut function that takes a
	non-premultiplied sRGBA color encoded as a 32bit integer in RGBA_8888 form.
	*/
	VGPaint vgFillPaint;
	vgFillPaint = vgCreatePaint();
	vgSetParameteri(vgFillPaint, VG_PAINT_TYPE, VG_PAINT_TYPE_COLOR);
	vgSetColor(vgFillPaint, 0xFFFFAAFF);

	/*
	Step 4 - Prepare the render loop
	--------------------------------

	The clear color will be used whenever calling vgClear(). The color is given
	as non-premultiplied sRGBA, represented by four float values.
	*/
	VGfloat afClearColor[4];
	afClearColor[0] = 0.6f;
	afClearColor[1] = 0.8f;
	afClearColor[2] = 1.0f;
	afClearColor[3] = 1.0f;

	// Set the clear color
	vgSetfv(VG_CLEAR_COLOR, 4, afClearColor);

	/*
	Step 5 - Render loop
	--------------------

	Start the render loop for 1000 frames!
	*/
	for(int i = 0; i < 1000; ++i)
	{
		// Clear the whole surface with the clear color
		vgClear(0, 0, i32WindowWidth, i32WindowHeight);

		// Set the current fill paint...
		vgSetPaint(vgFillPaint, VG_FILL_PATH);

		// Draw the triangle!
		vgDrawPath(vgTriangle, VG_FILL_PATH);

		/*
		Drawing is double buffered, so you never see any intermediate
		results of the drawing. When you have finished drawing
		you have to call eglSwapBuffers to make the results appear on
		screen.
		*/
		eglSwapBuffers(eglDisplay, eglSurface);
	}

	/*
	Step 6 - Destroy resources
	--------------------------

	OpenVG resources like paths and paints need to be destroyed
	when they are no longer needed.
	*/
	vgDestroyPath(vgTriangle);
	vgDestroyPaint(vgFillPaint);


cleanup:
	/*
	Step 7 - Terminate OpenVG
	-------------------------

	Again, the following code is taken from the Initialization tutorial,
	steps 10 and 11.
	*/
	eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
	eglTerminate(eglDisplay);

	DestroyVGWindow(sWindow);

	// Say goodbye
	printf("%s finished.", pszAppName);
	return 0;
}

/*****************************************************************************
 End of file (HelloTriangle.cpp)
*****************************************************************************/
