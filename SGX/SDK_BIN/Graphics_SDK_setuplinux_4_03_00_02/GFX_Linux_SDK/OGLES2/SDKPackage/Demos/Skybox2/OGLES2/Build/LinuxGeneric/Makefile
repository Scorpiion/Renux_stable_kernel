#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
# Date			21/11/2007
#
# Copyright		Copyright 2007 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLES2Skybox2

OBJECTS += Balloon.o Balloon_pvr.o Noise.o Skybox.o SkyboxMidnight.o effects.o Scene.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Balloon.cpp ../../Content/Balloon_pvr.cpp ../../Content/Noise.cpp ../../Content/Skybox.cpp ../../Content/SkyboxMidnight.cpp ../../Content/effects.cpp ../../Content/Scene.cpp: build_textures_and_shaders 

#%.o: ../../Content/%.cpp
#	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
