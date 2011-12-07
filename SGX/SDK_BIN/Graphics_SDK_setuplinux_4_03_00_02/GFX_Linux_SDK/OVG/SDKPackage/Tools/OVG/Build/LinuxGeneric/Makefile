#
# File			Makefile
# Title			Makes the tools
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../..
include $(SDKDIR)/Builds/OVG/$(PLATFORM)/make_platform.mak

OUTNAME = libopenvgtools.a
INCLUDES += -I$(SDKDIR)/Tools -I$(SDKDIR)/Tools/OVG $(addprefix -I, $(PLAT_INC))
VPATH = $(SDKDIR)/Tools : $(SDKDIR)/Tools/OVG

OBJECTS = PVRTLoadPVG.o \
		  PVRTPrintVG.o \
		  PVRTSVGParser.o \
		  PVRTSVGObject.o \
		  PVRTString.o    \
          PVRTResourceFile.o \
          PVRTMatrixF.o \
		  PVRTVector.o \
         PVRTError.o \
         PVRTImage.o \
         PVRTTexture.o

OBJECTS := $(addprefix $(PLAT_OBJPATH)/, $(OBJECTS))

$(PLAT_OBJPATH)/$(OUTNAME) : $(OBJECTS) 
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+a+ $@"
	@$(PLAT_AR) -r $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS)

$(PLAT_OBJPATH)/%.o: %.cpp
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $(OUTNAME) $@"
	@$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

clean:
	@for i in $(OBJECTS); do test -f $$i && rm -vf $$i || true; done
