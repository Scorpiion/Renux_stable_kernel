#
# File			make_demo.mak
# Title			Used to build a demo
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

#---------------------------------------------------------------------

include $(SDKDIR)/Builds/OVG/$(PLATFORM)/make_platform.mak

#---------------------------------------------------------------------

TOOLSLIB = $(SDKDIR)/Tools/OVG/Build/LinuxGeneric/$(PLAT_OBJPATH)/libopenvgtools.a

.PHONY: print_info build_textures_and_shaders

SHELLOSPATH = $(SDKDIR)/Shell/OS/Linux$(WS)

OBJECTS += $(OUTNAME).o PVRShell.o PVRShellAPI.o PVRShellOS.o
OBJECTS := $(addprefix $(PLAT_OBJPATH)/, $(OBJECTS))

INCLUDES += -I$(SDKDIR)/Tools/OVG \
			-I$(SDKDIR)/Shell \
			-I$(SDKDIR)/Shell/API/KEGL \
			-I$(SDKDIR)/Builds/OVG/$(PLATFORM)/Include 	\
			-I$(SDKDIR)/Builds/OVG/Include 				\
			-I$(SHELLOSPATH) \
			$(addprefix -I,$(PLAT_INC)) \
			-I../../..

VPATH += ../.. : \
		../../.. : \
		$(SDKDIR)/Shell : \
		$(SDKDIR)/Shell/API/KEGL : \
		$(SHELLOSPATH)

LINK          += -L$(SDKDIR)/Tools/OVG/Build/LinuxGeneric/$(PLAT_OBJPATH) -lopenvgtools
TEXTOOL_PATH  =  ../../../Utilities/PVRTexTool/PVRTexToolCL/Linux/PVRTexTool
FILEWRAP_PATH =  ../../../Utilities/Filewrap/Linux/Filewrap
UNISCO_PATH   =  ../../../Utilities/PVRUniSCo/OGLES/Linux/PVRUniSCo
VGPCOMPILER_PATH = ../../../Utilities/VGPCompiler/Linux/VGPCompiler

#---------------------------------------------------------------------

all: $(PLAT_OBJPATH)/$(OUTNAME)

$(PLAT_OBJPATH)/$(OUTNAME) : print_info $(TOOLSLIB) build_textures_and_shaders $(OBJECTS) 
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+l+ $@"
	$(PLAT_CPP) -o $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS) $(LINK) $(PLAT_LINK)

$(PLAT_OBJPATH)/%.o: %.cpp
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $(OUTNAME) $@"
	$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

$(PLAT_OBJPATH)/%.o: ../../Content/%.cpp
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $@"
	@$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

print_info:
	@echo ""
	@echo "******************************************************"
	@echo "*"
	@echo "* Name:         $(OUTNAME)"
	@echo "* PWD:          $(shell pwd)"
	@echo "* Binary path:  $(shell pwd)/$(PLAT_OBJPATH)"
	@echo "* Library path: $(shell cd $(LIBDIR) && pwd)"
	@echo "* WS:           $(WS)"
	@echo "*"
	@echo "******************************************************"

$(TOOLSLIB):
	@echo "********************"
	@echo "* Building tools.  *"
	@echo "********************"
	make -C $(SDKDIR)/Tools/OVG/Build/LinuxGeneric/ $(MAKECMDGOALS)

build_textures_and_shaders:
	@echo "PVRTEXTURETOOLPATH='$(PVRTEXTURETOOLPATH)'"
	@test -f ../../maketex.mak && \
		echo "+t+ Making maketex.mak" &&                \
		make -C ../.. -f maketex.mak \
			PVRTEXTOOL=$(TEXTOOL_PATH) \
			FILEWRAP=$(FILEWRAP_PATH) \
			PVROGLESVGPCOMPILERPATH=$(VGPCOMPILER_PATH) \
			PVRTEXTURETOOLPATH=$(TEXTOOL_PATH) \
			|| true
	@test -f ../../content.mak && \
		echo "+t+ Making content.mak" && \
		make -C ../.. -f content.mak \
			PVRTEXTOOL=$(TEXTOOL_PATH) \
			FILEWRAP=$(FILEWRAP_PATH) \
			PVRUNISCO=$(UNISCO_PATH) \
			|| true

clean:
	@rm -vf $(OBJECTS) || true
	@test -f ../../content.mak && make -C ../../ -f content.mak clean || true
	@make -C $(SDKDIR)/Tools/OVG/Build/LinuxGeneric/ clean || true

