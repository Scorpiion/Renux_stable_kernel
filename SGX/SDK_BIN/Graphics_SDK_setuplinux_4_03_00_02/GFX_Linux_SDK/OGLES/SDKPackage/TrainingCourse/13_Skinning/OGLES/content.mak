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
# $Revision: 1.1 $
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
	Legs.pvr \
	Body.pvr \
	Belt.pvr

	

RESOURCES = \
	$(CONTENTDIR)/man_float.cpp \
	$(CONTENTDIR)/man_fixed.cpp \
	$(CONTENTDIR)/Legs.cpp \
	$(CONTENTDIR)/Body.cpp \
	$(CONTENTDIR)/Belt.cpp

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

Legs.pvr: $(MEDIAPATH)/legs.bmp
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/legs.bmp -o$@

Body.pvr: $(MEDIAPATH)/body.bmp
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/body.bmp -o$@

Belt.pvr: $(MEDIAPATH)/belt.bmp
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/belt.bmp -o$@

############################################################################
# Create content files
############################################################################

$(CONTENTDIR)/man_float.cpp: man_float.pod
	$(FILEWRAP)  -o $@ man_float.pod

$(CONTENTDIR)/man_fixed.cpp: man_fixed.pod
	$(FILEWRAP)  -o $@ man_fixed.pod

$(CONTENTDIR)/Legs.cpp: Legs.pvr
	$(FILEWRAP)  -o $@ Legs.pvr

$(CONTENTDIR)/Body.cpp: Body.pvr
	$(FILEWRAP)  -o $@ Body.pvr

$(CONTENTDIR)/Belt.cpp: Belt.pvr
	$(FILEWRAP)  -o $@ Belt.pvr


############################################################################
# End of file (content.mak)
############################################################################
