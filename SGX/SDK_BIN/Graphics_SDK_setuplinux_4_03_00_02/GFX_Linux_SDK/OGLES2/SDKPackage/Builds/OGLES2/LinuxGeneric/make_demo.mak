#
# File			make_demo.mak
# Title			Used to build a demo
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

#---------------------------------------------------------------------

include $(SDKDIR)/Builds/OGLES2/$(PLATFORM)/make_platform.mak

#---------------------------------------------------------------------

.PHONY: print_info build_tools build_textures_and_shaders

SHELLOSPATH = $(SDKDIR)/Shell/OS/Linux$(WS)

CONTENT := $(addprefix ../../Content/, $(subst .o,.cpp, $(OBJECTS)))
OBJECTS += $(OUTNAME).o PVRShell.o PVRShellAPI.o PVRShellOS.o
OBJECTS := $(addprefix $(PLAT_OBJPATH)/, $(OBJECTS))

INCLUDES += -I$(SDKDIR)/Tools/OGLES2 						\
			-I$(SDKDIR)/Shell 								\
			-I$(SDKDIR)/Shell/API/KEGL 						\
			-I$(SDKDIR)/Builds/OGLES2/$(PLATFORM)/Include 	\
			-I$(SDKDIR)/Builds/OGLES2/Include 				\
			-I$(SHELLOSPATH) 								\
			$(addprefix -I, $(PLAT_INC))

VPATH += ../..                      : \
		 ../../Content              : \
		 $(SDKDIR)/Shell            : \
		 $(SDKDIR)/Shell/API/KEGL   : \
		 $(SHELLOSPATH)

LINK         += -L$(SDKDIR)/Tools/OGLES2/Build/LinuxGeneric/$(PLAT_OBJPATH) -loglestools
TEXTOOL_PATH  =  $(SDKDIR)/Utilities/PVRTexTool/PVRTexToolCL/Linux/PVRTexTool
FILEWRAP_PATH =  $(SDKDIR)/Utilities/Filewrap/Linux/Filewrap
UNISCO_PATH   =  $(SDKDIR)/Utilities/PVRUniSCo/OGLES/Linux/PVRUniSCo

#---------------------------------------------------------------------

all: $(PLAT_OBJPATH)/$(OUTNAME)

$(PLAT_OBJPATH)/$(OUTNAME) : print_info build_tools build_textures_and_shaders $(OBJECTS) 
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+l+ $@"
	@$(PLAT_CPP) -o $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS) $(LINK) $(PLAT_LINK)

$(PLAT_OBJPATH)/%.o: %.c
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $@"
	@$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

$(PLAT_OBJPATH)/%.o: %.cpp
	@mkdir -p $(PLAT_OBJPATH)
	@echo "+c+ $@"
	@$(PLAT_CC) -c $(INCLUDES) $(PLAT_CFLAGS) $^ -o$@

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

build_tools: $(SDKDIR)/Tools/OGLES2/Build/LinuxGeneric/$(PLAT_OBJPATH)/liboglestools.a

$(SDKDIR)/Tools/OGLES2/Build/LinuxGeneric/$(PLAT_OBJPATH)/liboglestools.a:
	@echo "********************"
	@echo "* Building tools.  *"
	@echo "********************"
	make -C $(SDKDIR)/Tools/OGLES2/Build/LinuxGeneric/

$(CONTENT): build_textures_and_shaders

build_textures_and_shaders:
	@test -f ../../maketex.mak &&                       \
		echo "+t+ Making maketex.mak" &&                \
		make -C ../.. -f maketex.mak                    \
			PVRTEXTURETOOLPATH=$(TEXTOOL_PATH) || true
	@test -f ../../content.mak &&                       \
		echo "+t+ Making content.mak" &&                \
		make -C ../.. -f content.mak                    \
			PVRTEXTOOL=$(TEXTOOL_PATH)                  \
			FILEWRAP=$(FILEWRAP_PATH)                   \
			PVRUNISCO=$(UNISCO_PATH)                    \
			|| true

clean: print_info
	@rm -vf $(OBJECTS) || true
	@test -f ../../content.mak && make -C ../../ -f content.mak clean || true
	@make -C $(SDKDIR)/Tools/OGLES2/Build/LinuxGeneric/ clean || true

