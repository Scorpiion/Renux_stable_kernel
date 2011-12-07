#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLES2ChameleonMan
OBJECTS += ChameleonScene.o skyline.o Wall_diffuse_baked.o Tang_space_BodyMap.o Tang_space_LegsMap.o Tang_space_BeltMap.o FinalChameleonManLegs.o FinalChameleonManHeadBody.o lamp.o ChameleonBelt.o SkinnedVertShader.o SkinnedFragShader.o DefaultVertShader.o DefaultFragShader.o
include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/ChameleonScene.cpp ../../Content/skyline.cpp ../../Content/Wall_diffuse_baked.cpp ../../Content/Tang_space_BodyMap.cpp ../../Content/Tang_space_LegsMap.cpp ../../Content/Tang_space_BeltMap.cpp ../../Content/FinalChameleonManLegs.cpp ../../Content/FinalChameleonManHeadBody.cpp ../../Content/lamp.cpp ../../Content/ChameleonBelt.cpp ../../Content/SkinnedVertShader.cpp ../../Content/SkinnedFragShader.cpp ../../Content/DefaultVertShader.cpp ../../Content/DefaultFragShader.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm -rf $(PLAT_OBJPATH)/*
	make -C ../.. -f content.mak clean
