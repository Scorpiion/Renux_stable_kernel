#
# File			make_common.mak
# Title			Used by the other makefiles
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

include $(SDKDIR)/Builds/OGLES/$(PLATFORM)/make_platform.mak

# Compile options for every OGLES linux builds
COMMON_CFLAGS = -DBUILD_OGLES -Wall

ifeq ($(X11BUILD),1)
COMMON_INCLUDES = -I$(SDKDIR)/Builds/OGLES/$(PLATFORM)/Include \
	-I$(SDKDIR)/Builds/OGLES/Include \
	-I/usr/X11R6/include \
	-I/usr/X11/include
else
COMMON_INCLUDES = -I$(SDKDIR)/Builds/OGLES/$(PLATFORM)/Include \
	-I$(SDKDIR)/Builds/OGLES/Include
endif

# Calculates the output directory OBJPATH
ifdef CommonLite
	ProfilePath = CommonLite
	COMMON_CFLAGS += -DPVRT_FIXED_POINT_ENABLE
	LIBNAME = GLES_CL
endif

ifdef Common
	ProfilePath = Common
	COMMON_CFLAGS +=
	LIBNAME = GLES_CM
endif

ifndef ProfilePath
$(error When building an OGLES package you must pass Common=1 or CommonLite=1 as a parameter for make)
endif

ifdef Debug
	DebugReleasePath = Debug$(WS)
	COMMON_CFLAGS += -DDEBUG -g -DDLL_METRIC
else
	DebugReleasePath = Release$(WS)
	COMMON_CFLAGS += -DRELEASE -O2
endif

OBJECTS := $(addprefix $(PLAT_OBJPATH)/, $(OBJECTS))

# Final step to link the app. It's up to the calling makefile to specify LINKCOMMAND
$(PLAT_OBJPATH)/$(OUTNAME) : $(ADDITIONAL_DEPENDENCIES) $(OBJECTS) 
	mkdir -p $(PLAT_OBJPATH)
	$(LINKCOMMAND)

# Step to compile source files
$(PLAT_OBJPATH)/%.o: %.cpp
	mkdir -p $(PLAT_OBJPATH)
	$(PLAT_CC) -c $(COMMON_INCLUDES) $(addprefix -I,$(PLAT_INC)) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

$(PLAT_OBJPATH)/%.o: %.c
	mkdir -p $(PLAT_OBJPATH)
	$(PLAT_CC) -c $(COMMON_INCLUDES) $(addprefix -I,$(PLAT_INC)) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

# Cleaning
 clean:
	rm -rf $(PLAT_OBJPATH) *.o

