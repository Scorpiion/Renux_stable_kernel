#
# File			Makefile
# Title			Makes the PVREngine
# Author		PowerVR
#
# Copyright		Copyright 2003-2004 by Imagination Technologies Limited.
#

.PHONY: clean

BUILD_API = OGLES2
SDKDIR  = ../../../../..
OUTNAME = libPVREngine.a
INCLUDES += -I$(SDKDIR)/Tools -I$(SDKDIR)/Tools/$(BUILD_API) -I$(SDKDIR)/Extras/PVREngine/Include -I$(SDKDIR)/Extras/PVREngine/Include/$(BUILD_API)
VPATH = $(SDKDIR)/Tools $(SDKDIR)/Tools/$(BUILD_API) $(SDKDIR)/Extras/PVREngine/Source $(SDKDIR)/Extras/PVREngine/Source/$(BUILD_API)

INCLUDES += -I$(SDKDIR)/Tools/$(BUILD_API) -I$(SDKDIR)/Shell -I$(SDKDIR)/Shell/API/KEGL -I$(SHELLOSPATH) -I../../.. $(addprefix -I,$(PLAT_INC))
VPATH += .. : ../.. : ../../.. : $(SDKDIR)/Shell : $(SDKDIR)/Shell/API/KEGL : $(SHELLOSPATH) : $(SDKDIR)/Tools

LINK = 
LINKCOMMAND = $(PLAT_CPP) -o $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS) $(LINK) $(PLAT_LINK)


OBJPATH = .

.PHONY: build_tools

# Files to compile
OBJECTS += PVREngine.o \
	PVRShell.o	\
	PVRShellAPI.o	\
	PVRShellOS.o	\
	UniformHandlerBase.o	\
	UniformHandler.o	\
	UniformBase.o	\
	Uniform.o	\
	TimeController.o	\
	TextureManager.o	\
	TextureBase.o	\
	Texture.o	\
	SimpleCamera.o	\
	PVRESettingsBase.o	\
	PVRESettings.o	\
	Plane.o	\
	OptionsMenu.o	\
	Option.o	\
	MeshManager.o	\
	MeshBase.o	\
	Mesh.o	\
	MaterialManager.o	\
	MaterialBase.o	\
	Material.o	\
	LightManager.o	\
	LightBase.o	\
	Light.o	\
	ConsoleLog.o	\
	ContextManager.o	\
	BoundingHex.o	\
	BoundingBox.o
		
PLAT_OBJPATH = ../$(PLATFORM)/$(BinariesFolderName)/$(DebugReleasePath)

LINKCOMMAND = $(PLAT_AR) -r $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS)

include $(SDKDIR)/Builds/$(BUILD_API)/LinuxGeneric/make_common.mak

# X11BUILD is defined in make_platform.mak (included in make_common.mak) for X11 builds only
ifdef X11BUILD
SHELLOSPATH = $(SDKDIR)/Shell/OS/LinuxX11
BinariesFolderName = X11
else
SHELLOSPATH = $(SDKDIR)/Shell/OS/LinuxRaw
BinariesFolderName = NullWS
endif

# Builds the tools if necessary
build_tools: $(SDKDIR)/Tools/$(BUILD_API)/Build/LinuxGeneric/$(PLAT_OBJPATH)/liboglestools.a

$(SDKDIR)/Tools/$(BUILD_API)/Build/LinuxGeneric/$(PLAT_OBJPATH)/liboglestools.a:
	@echo "***************************************"
	@echo "* Tools not built yet, building them. *"
	@echo "***************************************"
	make -C $(SDKDIR)/Tools/$(BUILD_API)/Build/LinuxGeneric/ clean $(MAKECMDGOALS)
	make -C $(SDKDIR)/Tools/$(BUILD_API)/Build/LinuxGeneric/ $(MAKECMDGOALS)
