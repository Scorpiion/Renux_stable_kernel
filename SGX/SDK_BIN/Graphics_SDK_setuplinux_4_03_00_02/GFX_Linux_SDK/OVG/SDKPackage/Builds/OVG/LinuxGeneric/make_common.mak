#
# File			make_common.mak
# Title			Used by the other makefiles
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

include $(SDKDIR)/Builds/OVG/$(PLATFORM)/make_platform.mak

# Compile options for every OpenVG linux builds
COMMON_CFLAGS = -DBUILD_OVG -Wall

COMMON_INCLUDES = -I$(SDKDIR)/Builds/OVG/$(PLATFORM)/Include -I$(SDKDIR)/Builds/OVG/Include

# Calculates the output directory OBJPATH
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

