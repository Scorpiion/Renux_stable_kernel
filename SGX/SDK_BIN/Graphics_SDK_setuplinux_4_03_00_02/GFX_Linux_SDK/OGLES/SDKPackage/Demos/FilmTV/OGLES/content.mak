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
	Table.pvr \
	Floor.pvr \
	Wall.pvr \
	TV.pvr \
	TVCase.pvr \
	TVSpeaker.pvr \
	Alum.pvr \
	Skirting.pvr \
	Camera.pvr

	

RESOURCES = \
	$(CONTENTDIR)/Table.cpp \
	$(CONTENTDIR)/Floor.cpp \
	$(CONTENTDIR)/Wall.cpp \
	$(CONTENTDIR)/TV.cpp \
	$(CONTENTDIR)/TVCase.cpp \
	$(CONTENTDIR)/TVSpeaker.cpp \
	$(CONTENTDIR)/Alum.cpp \
	$(CONTENTDIR)/Skirting.cpp \
	$(CONTENTDIR)/Camera.cpp \
	$(CONTENTDIR)/FilmTVScene_float.cpp \
	$(CONTENTDIR)/FilmTVScene_fixed.cpp

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

Table.pvr: $(MEDIAPATH)/Table.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/Table.png -o$@

Floor.pvr: $(MEDIAPATH)/Floor.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/Floor.png -o$@

Wall.pvr: $(MEDIAPATH)/Wall.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/Wall.png -o$@

TV.pvr: $(MEDIAPATH)/TV.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/TV.png -o$@

TVCase.pvr: $(MEDIAPATH)/TVCase.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/TVCase.png -o$@

TVSpeaker.pvr: $(MEDIAPATH)/TVSpeaker.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/TVSpeaker.png -o$@

Alum.pvr: $(MEDIAPATH)/Alum.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/Alum.png -o$@

Skirting.pvr: $(MEDIAPATH)/Skirting.png
	$(PVRTEXTOOL) -m -fOGLPVRTC4 -i$(MEDIAPATH)/Skirting.png -o$@

Camera.pvr: $(MEDIAPATH)/Camera.png
	$(PVRTEXTOOL) -fOGLPVRTC4 -i$(MEDIAPATH)/Camera.png -o$@

############################################################################
# Create content files
############################################################################

$(CONTENTDIR)/Table.cpp: Table.pvr
	$(FILEWRAP)  -o $@ Table.pvr

$(CONTENTDIR)/Floor.cpp: Floor.pvr
	$(FILEWRAP)  -o $@ Floor.pvr

$(CONTENTDIR)/Wall.cpp: Wall.pvr
	$(FILEWRAP)  -o $@ Wall.pvr

$(CONTENTDIR)/TV.cpp: TV.pvr
	$(FILEWRAP)  -o $@ TV.pvr

$(CONTENTDIR)/TVCase.cpp: TVCase.pvr
	$(FILEWRAP)  -o $@ TVCase.pvr

$(CONTENTDIR)/TVSpeaker.cpp: TVSpeaker.pvr
	$(FILEWRAP)  -o $@ TVSpeaker.pvr

$(CONTENTDIR)/Alum.cpp: Alum.pvr
	$(FILEWRAP)  -o $@ Alum.pvr

$(CONTENTDIR)/Skirting.cpp: Skirting.pvr
	$(FILEWRAP)  -o $@ Skirting.pvr

$(CONTENTDIR)/Camera.cpp: Camera.pvr
	$(FILEWRAP)  -o $@ Camera.pvr

$(CONTENTDIR)/FilmTVScene_float.cpp: FilmTVScene_float.pod
	$(FILEWRAP)  -o $@ FilmTVScene_float.pod

$(CONTENTDIR)/FilmTVScene_fixed.cpp: FilmTVScene_fixed.pod
	$(FILEWRAP)  -o $@ FilmTVScene_fixed.pod


############################################################################
# End of file (content.mak)
############################################################################
