/******************************************************************************

 @File         OVGTools.h

 @Title        OVGTools

 @Copyright    Copyright (C)  Imagination Technologies Limited.

 @Platform     ANSI compatible

 @Description  Header file of OVGTools.lib.

******************************************************************************/
#ifndef _OVGTOOLS_H_
#define _OVGTOOLS_H_

/*****************************************************************************/
/*! @mainpage OVGTools
******************************************************************************
@section _tools_sec1 Overview
*****************************

OVGTools is a collection of source code to help developers with some common
tasks. OVGTools supplies code for mathematical operations, matrix handling,
svg loading, pvg loading and loading VGImages.

@section _tools_sec2 Content
*****************************
This is a description of the files which compose OVGTools. Not all the files might have been released for
your platform so check the file list to know what is available.

\b PVRTMatrix: Vector and Matrix functions.

\b PVRTVector: Vector and Matrix functions that are gradually replacing PVRTMatrix.

\b PVRTQuaternion: Quaternion functions.

\b PVRTResourceFile: The tools code for loading files included using FileWrap.

\b PVRTPrintVG: Display text/logos on the screen.

\b PVRTError: Error codes and tools output debug.

\b PVRTString: A string class.

\b PVRTLoadPVG: Functions to load our binary PVG format.

\b PVRTSVGParser and \b PVRTSVGObject: Classes for the loading and displaying of SVGs.

\b PVRTImage: Loading code for pvr files.

*/

#ifndef BUILD_OVG
	#define BUILD_OVG
#endif

#include "PVRTContext.h"
#include "../PVRTGlobal.h"
#include "../PVRTString.h"
#include "PVRTPrintVG.h"
#include "PVRTLoadPVG.h"
#include "PVRTSVGParser.h"
#include "PVRTSVGObject.h"
#include "../PVRTVector.h"
#include "../PVRTMatrix.h"
#include "../PVRTQuaternion.h"
#include "../PVRTResourceFile.h"
#include "../PVRTMemoryFileSystem.h"
#include "../PVRTError.h"
#include "PVRTImage.h"

#endif /* _OVGTOOLS_H_ */

/*****************************************************************************
 End of file (OVGTools.h)
*****************************************************************************/
