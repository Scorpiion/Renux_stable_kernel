#--------------------------------------------------------------------------
# Name         : content.mak
# Title        : Makefile to build content files
# Author       : Auto-generated
#
# Copyright    : 2007 by Imagination Technologies.  All rights reserved.
#              : No part of this software, either material or conceptual 
#              : may be copied or distributed, transmitted, transcribed,
#              : stored in a retrieval system or translated into any 
#              : human or computer language in any form by any means,
#              : electronic, mechanical, manual or other-wise, or 
#              : disclosed to third parties without the express written
#              : permission of VideoLogic Limited, Unit 8, HomePark
#              : Industrial Estate, King's Langley, Hertfordshire,
#              : WD4 8LZ, U.K.
#
# Description  : Makefile to build content files for demos in the PowerVR SDK
#
# Platform     :
#
# $Revision: 1.2 $
#--------------------------------------------------------------------------

#############################################################################
## Variables
#############################################################################

PVRTEXTOOL 	= ..\..\..\Utilities\PVRTexTool\PVRTexToolCL\Win32\PVRTexTool.exe
FILEWRAP 	= ..\..\..\Utilities\Filewrap\Win32\Filewrap.exe


MEDIAPATH = ../Media
CONTENTDIR = Content

#############################################################################
## Instructions
#############################################################################

TEXTURES = \
	tBridge.pvr \
	tGrass.pvr \
	tSkin.pvr \
	tWater.pvr \
	tCloud.pvr \
	tFur.pvr

	

RESOURCES = \
	$(CONTENTDIR)/tBridge.cpp \
	$(CONTENTDIR)/tGrass.cpp \
	$(CONTENTDIR)/tSkin.cpp \
	$(CONTENTDIR)/tWater.cpp \
	$(CONTENTDIR)/tCloud.cpp \
	$(CONTENTDIR)/tFur.cpp \
	$(CONTENTDIR)/Scene_float.cpp \
	$(CONTENTDIR)/Scene_fixed.cpp

all: resources 
	
help:
	@echo Valid targets are:
	@echo resources, textures, binary_shaders, clean
	@echo PVRTEXTOOL, FILEWRAP and VGPCOMPILER can be used to override the 
	@echo default paths to these utilities.

clean:
	-rm $(TEXTURES)
	-rm $(RESOURCES)
	
	
resources: 		$(CONTENTDIR) $(RESOURCES)
textures: 		$(TEXTURES)


$(CONTENTDIR):
	-mkdir $@

############################################################################
# Create textures
############################################################################

tBridge.pvr: $(MEDIAPATH)/tBridge.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/tBridge.png -o$@

tGrass.pvr: $(MEDIAPATH)/tGrass.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/tGrass.png -o$@

tSkin.pvr: $(MEDIAPATH)/tSkin.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/tSkin.png -o$@

tWater.pvr: $(MEDIAPATH)/tWater.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/tWater.png -o$@

tCloud.pvr: $(MEDIAPATH)/tCloud.png $(MEDIAPATH)/tCloudAlpha.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/tCloud.png -a$(MEDIAPATH)/tCloudAlpha.png -o$@

tFur.pvr: $(MEDIAPATH)/tFur.png $(MEDIAPATH)/tFurAlpha.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/tFur.png -a$(MEDIAPATH)/tFurAlpha.png -o$@

############################################################################
# Create content files
############################################################################

$(CONTENTDIR)/tBridge.cpp: tBridge.pvr
	$(FILEWRAP)  -o $@ tBridge.pvr

$(CONTENTDIR)/tGrass.cpp: tGrass.pvr
	$(FILEWRAP)  -o $@ tGrass.pvr

$(CONTENTDIR)/tSkin.cpp: tSkin.pvr
	$(FILEWRAP)  -o $@ tSkin.pvr

$(CONTENTDIR)/tWater.cpp: tWater.pvr
	$(FILEWRAP)  -o $@ tWater.pvr

$(CONTENTDIR)/tCloud.cpp: tCloud.pvr
	$(FILEWRAP)  -o $@ tCloud.pvr

$(CONTENTDIR)/tFur.cpp: tFur.pvr
	$(FILEWRAP)  -o $@ tFur.pvr

$(CONTENTDIR)/Scene_float.cpp: Scene_float.pod
	$(FILEWRAP)  -o $@ Scene_float.pod

$(CONTENTDIR)/Scene_fixed.cpp: Scene_fixed.pod
	$(FILEWRAP)  -o $@ Scene_fixed.pod


############################################################################
# End of file (content.mak)
############################################################################
