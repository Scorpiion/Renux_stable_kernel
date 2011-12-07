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
# $Revision: 1.4 $
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
	FloorToon.pvr \
	MouseToon.pvr \
	Toon.pvr \
	WallToon.pvr

	

RESOURCES = \
	$(CONTENTDIR)/Mouse_float.cpp \
	$(CONTENTDIR)/Mouse_fixed.cpp \
	$(CONTENTDIR)/FloorToon.cpp \
	$(CONTENTDIR)/MouseToon.cpp \
	$(CONTENTDIR)/Toon.cpp \
	$(CONTENTDIR)/WallToon.cpp

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

FloorToon.pvr: $(MEDIAPATH)/FloorToon.png
	$(PVRTEXTOOL) -nt -fOGL565 -i$(MEDIAPATH)/FloorToon.png -o$@

MouseToon.pvr: $(MEDIAPATH)/MouseToon.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/MouseToon.png -o$@

Toon.pvr: $(MEDIAPATH)/Toon.png
	$(PVRTEXTOOL) -nt -m -fOGL565 -i$(MEDIAPATH)/Toon.png -o$@

WallToon.pvr: $(MEDIAPATH)/WallToon.png
	$(PVRTEXTOOL) -nt -m -fOGL565 -i$(MEDIAPATH)/WallToon.png -o$@

############################################################################
# Create content files
############################################################################

$(CONTENTDIR)/Mouse_float.cpp: Mouse_float.pod
	$(FILEWRAP)  -o $@ Mouse_float.pod

$(CONTENTDIR)/Mouse_fixed.cpp: Mouse_fixed.pod
	$(FILEWRAP)  -o $@ Mouse_fixed.pod

$(CONTENTDIR)/FloorToon.cpp: FloorToon.pvr
	$(FILEWRAP)  -o $@ FloorToon.pvr

$(CONTENTDIR)/MouseToon.cpp: MouseToon.pvr
	$(FILEWRAP)  -o $@ MouseToon.pvr

$(CONTENTDIR)/Toon.cpp: Toon.pvr
	$(FILEWRAP)  -o $@ Toon.pvr

$(CONTENTDIR)/WallToon.cpp: WallToon.pvr
	$(FILEWRAP)  -o $@ WallToon.pvr


############################################################################
# End of file (content.mak)
############################################################################
