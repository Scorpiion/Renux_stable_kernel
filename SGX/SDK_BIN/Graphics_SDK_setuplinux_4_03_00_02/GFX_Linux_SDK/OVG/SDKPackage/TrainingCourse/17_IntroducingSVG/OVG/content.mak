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

RESOURCES = \
	$(CONTENTDIR)/tiger.cpp

all: resources
	
help:
	@echo Valid targets are:
	@echo resources, textures, clean
	@echo FILEWRAP and PVRTEXTOOL can be used to override the 
	@echo default paths to these utilities.

clean:
	-rm $(RESOURCES)
	
resources: 		$(CONTENTDIR) $(RESOURCES)



$(CONTENTDIR):
	-mkdir $@

############################################################################
# Create textures
############################################################################

############################################################################
# Create content files
############################################################################

$(CONTENTDIR)/tiger.cpp: tiger.svg
	$(FILEWRAP)  -o $@ tiger.svg

############################################################################
# End of file (content.mak)
############################################################################
