#
# File			make_demo.mak
# Title			Used to build a demo
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

#---------------------------------------------------------------------

ifndef Common 
ifndef CommonLite
$(error When building an OGLES package you must pass Common=1 or CommonLite=1 as a parameter for make)
endif
endif

include $(SDKDIR)/Builds/OGLES/$(PLATFORM)/make_platform.mak

#---------------------------------------------------------------------

.PHONY: build_tools build_textures_and_shaders

SHELLOSPATH = $(SDKDIR)/Shell/OS/Linux$(WS)

CONTENT := $(addprefix ../../Content/, $(subst .o,.cpp,$(OBJECTS)))
OBJECTS += $(OUTNAME).o PVRShell.o PVRShellAPI.o PVRShellOS.o
OBJECTS := $(addprefix $(PLAT_OBJPATH)/, $(OBJECTS))

INCLUDES += -I$(SDKDIR)/Tools/OGLES 						\
			-I$(SDKDIR)/Shell 								\
			-I$(SDKDIR)/Shell/API/KEGL 						\
			-I$(SDKDIR)/Builds/OGLES/$(PLATFORM)/Include 	\
			-I$(SDKDIR)/Builds/OGLES/Include 				\
			-I$(SHELLOSPATH) 								\
			$(addprefix -I, $(PLAT_INC))					\
			-I../../..

VPATH += ../.. : \
		../../.. : \
		$(SDKDIR)/Shell : \
		$(SDKDIR)/Shell/API/KEGL : \
		$(SHELLOSPATH)

LINK            += -L$(SDKDIR)/Tools/OGLES/Build/LinuxGeneric/$(PLAT_OBJPATH) -loglestools
TEXTOOL_PATH     = $(SDKDIR)/Utilities/PVRTexTool/PVRTexToolCL/Linux/PVRTexTool
UNISCO_PATH      = $(SDKDIR)/Utilities/PVRUniSCo/OGLES/Linux/PVRUniSCo
VGPCOMPILER_PATH = $(SDKDIR)/Utilities/VGPCompiler/Linux/VGPCompiler

ifdef BIGENDIAN
FILEWRAP_PATH="../../../Utilities/Filewrap/Linux/Filewrap -be"
else
FILEWRAP_PATH=../../../Utilities/Filewrap/Linux/Filewrap
endif

ifdef CommonLite
PLAT_CFLAGS += -DPVRT_FIXED_POINT_ENABLE
endif

#---------------------------------------------------------------------

all: $(PLAT_OBJPATH)/$(OUTNAME)

$(PLAT_OBJPATH)/$(OUTNAME) : build_tools build_textures_and_shaders $(OBJECTS) 
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+l+ $@"
	$(PLAT_CPP) -o $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS) $(LINK) $(PLAT_LINK)

$(PLAT_OBJPATH)/%.o: %.c
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $(OUTNAME) $@"
	$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

$(PLAT_OBJPATH)/%.o: %.cpp
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $(OUTNAME) $@"
	$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

$(PLAT_OBJPATH)/%.o: ../../Content/%.cpp
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $@"
	$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

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

build_tools: $(SDKDIR)/Tools/OGLES/Build/LinuxGeneric/$(PLAT_OBJPATH)/liboglestools.a

$(SDKDIR)/Tools/OGLES/Build/LinuxGeneric/$(PLAT_OBJPATH)/liboglestools.a:
	@echo "********************"
	@echo "* Building tools.  *"
	@echo "********************"
	make -C $(SDKDIR)/Tools/OGLES/Build/LinuxGeneric/ $(MAKECMDGOALS)

$(CONTENT): build_textures_and_shaders

build_textures_and_shaders:
	@for f in maketex.mak content.mak; do               \
		test -f ../../$$f &&                            \
		echo "+t+ Making $$f" &&                        \
		make -C ../.. -f $$f                            \
			PVRTEXTOOL=$(TEXTOOL_PATH)                  \
			FILEWRAP=$(FILEWRAP_PATH)                   \
			PVROGLESVGPCOMPILERPATH=$(VGPCOMPILER_PATH) \
			VGPCOMPILER=$(VGPCOMPILER_PATH)             \
			PVRTEXTURETOOLPATH=$(TEXTOOL_PATH)          \
			|| true;                                    \
	 done

clean:
	@rm -vf $(OBJECTS) || true
	@test -f ../../content.mak && make -C ../../ -f content.mak clean || true
	@make -C $(SDKDIR)/Tools/OGLES/Build/LinuxGeneric/ clean || true

