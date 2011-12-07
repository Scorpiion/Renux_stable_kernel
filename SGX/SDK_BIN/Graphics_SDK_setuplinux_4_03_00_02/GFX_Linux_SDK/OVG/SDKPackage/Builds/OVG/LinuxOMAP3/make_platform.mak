#
# File			make_platform.mak
# Title			Platform specific makefile
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

ifdef TOOLCHAIN
PLAT_CC  = $(TOOLCHAIN)/bin/arm-none-linux-gnueabi-gcc
PLAT_CPP = $(TOOLCHAIN)/bin/arm-none-linux-gnueabi-g++
PLAT_AR  = $(TOOLCHAIN)/bin/arm-none-linux-gnueabi-ar
else
PLAT_CC  = arm-none-linux-gnueabi-gcc
PLAT_CPP = arm-none-linux-gnueabi-g++
PLAT_AR  = arm-none-linux-gnueabi-ar
endif

ifeq "$(X11BUILD)" "1"
ifndef X11ROOT
$(error When building an X11 BUILD of OVG package you must set X11ROOT to the location where are your X11 freedesktop binaries)
endif
X11RPATH = $(X11ROOT)/lib
X11_LIBS = -L$(X11ROOT)/lib -lX11 -lXau
WS       = X11
X11_INC  = $(X11ROOT)/include
else
X11RPATH = 
X11_LIBS =
WS       = Raw
X11_INC  =
endif

ifdef LIBDIR
LIBDIR_FLAGS = -L$(LIBDIR) -Wl,--rpath-link,$(LIBDIR):$(X11RPATH)
else
LIBDIR_FLAGS = -Wl,--rpath-link=$(SDKDIR)/Builds/OVG/$(PLATFORM)/Lib \
               -L$(SDKDIR)/Builds/OVG/$(PLATFORM)/Lib
endif

ifdef Debug
DEBUG_RELEASE = Debug
PLAT_CFLAGS   = -DBUILD_OVG -Wall -DDEBUG -g -DDLL_METRIC \
				-DAPIENTRY=GL_APIENTRY                      \
				-DSHELL_DISPLAY_DIM_X=240 -DSHELL_DISPLAY_DIM_Y=320 \
				-DKEYPAD_INPUT="\"/dev/input/event0\""
else
DEBUG_RELEASE = Release
PLAT_CFLAGS   = -DBUILD_OVG -Wall -DRELEASE -O2 \
				-DAPIENTRY=GL_APIENTRY            \
				-DSHELL_DISPLAY_DIM_X=240 -DSHELL_DISPLAY_DIM_Y=320 \
				-DKEYPAD_INPUT="\"/dev/input/event0\""
endif

ifdef SDKDIR
SDKDIR   := $(shell cd $(SDKDIR) && pwd)
PLAT_INC  = $(SDKDIR)/Builds/OVG/Include \
			$(SDKDIR)/Builds/OVG/$(PLATFORM)/Include \
			$(X11_INC)
endif

PLAT_OBJPATH = ../$(PLATFORM)/$(DEBUG_RELEASE)$(WS)
PLAT_LINK =  $(LIBDIR_FLAGS) -lEGL -lOpenVG -lOpenVGU $(X11_LIBS) -lm -ldl \
			-L$(TOOLCHAIN)/lib -Wl,--rpath=/usr/lib


