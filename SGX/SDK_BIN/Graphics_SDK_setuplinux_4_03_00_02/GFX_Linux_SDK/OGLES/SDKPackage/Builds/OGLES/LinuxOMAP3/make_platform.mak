#
# File			make_platform.mak
# Title			Platform specific makefile
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

ifndef Common 
ifndef CommonLite
$(error When building an OGLES package you must pass Common=1 or CommonLite=1 as a parameter for make)
endif
endif

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
$(error When building an X11 BUILD of OGLES package you must set X11ROOT to the location where are your X11 freedesktop binaries)
endif
X11_LIBS = -L$(X11ROOT)/lib -lX11 -lXau
X11RPATH = $(X11ROOT)/lib
WS       = X11
X11_INC  = $(X11ROOT)/include
else
X11_LIBS =
X11RPATH = 
WS       = Raw
X11_INC  = 
endif

ifdef LIBDIR
LIBDIR_FLAGS = -L$(LIBDIR) -Wl,--rpath-link,$(LIBDIR):$(X11RPATH)
else
LIBDIR_FLAGS = 
endif

ifdef Debug
DEBUG_RELEASE = Debug
PLAT_CFLAGS   = -DBUILD_OGLES -Wall -DDEBUG -g -DDLL_METRIC \
				-DAPIENTRY=GL_APIENTRY            \
				-DUSE_TRIGONOMETRIC_LOOKUP_TABLES \
				-DKEYPAD_INPUT="\"/dev/input/event0\""
else
DEBUG_RELEASE = Release
PLAT_CFLAGS   = -DBUILD_OGLES -Wall -DRELEASE -O2 \
				-DAPIENTRY=GL_APIENTRY            \
				-DUSE_TRIGONOMETRIC_LOOKUP_TABLES \
				-DKEYPAD_INPUT="\"/dev/input/event0\""
endif

ifdef SDKDIR
SDKDIR   := $(shell cd $(SDKDIR) && pwd)
PLAT_INC  = $(SDKDIR)/Builds/OGLES/Include \
			$(SDKDIR)/Builds/OGLES/$(PLATFORM)/Include \
			$(X11_INC)
endif

ifeq "$(Common)" "1"
PLAT_OBJPATH = ../$(PLATFORM)/$(DEBUG_RELEASE)$(WS)
else
PLAT_OBJPATH = ../$(PLATFORM)/$(DEBUG_RELEASE)$(WS)Lite
endif

PLAT_LINK =  $(LIBDIR_FLAGS) -lGLES_CM $(X11_LIBS) -lm -ldl \
			-L$(TOOLCHAIN)/lib -Wl,--rpath=/usr/lib

ifdef CommonLite
PLAT_CFLAGS += -DPVRT_FIXED_POINT_ENABLE
endif


