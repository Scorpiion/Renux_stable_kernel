#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright 2008 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLESFur

OBJECTS += tBridge.o tGrass.o tSkin.o tWater.o tCloud.o tFur.o Scene_float.o Scene_fixed.o

include $(SDKDIR)/Builds/OGLES/LinuxGeneric/make_demo.mak

../../Content/tBridge.cpp ../../Content/tGrass.cpp ../../Content/tSkin.cpp ../../Content/tWater.cpp ../../Content/tCloud.cpp ../../Content/tFur.cpp ../../Content/Scene_float.cpp ../../Content/Scene_fixed.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
