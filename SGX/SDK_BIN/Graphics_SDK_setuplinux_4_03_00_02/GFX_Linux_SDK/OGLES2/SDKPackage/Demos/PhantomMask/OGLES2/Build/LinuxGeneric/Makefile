#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLES2PhantomMask
OBJECTS += PhantomMask.o MaskMain.o RoomStill.o SHVertShader.o DiffuseVertShader.o FragShader.o
include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/PhantomMask.cpp ../../Content/MaskMain.cpp ../../Content/RoomStill.cpp ../../Content/SHVertShader.cpp ../../Content/DiffuseVertShader.cpp ../../Content/FragShader.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm -rf $(PLAT_OBJPATH)/*
	make -C ../.. -f content.mak clean
