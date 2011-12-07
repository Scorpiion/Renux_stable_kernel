#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
# Date			16/08/2007
#
# Copyright		Copyright 2007 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLES2LightMap

OBJECTS += Basetex.o Reflection.o Shadow.o FragShader.o VertShader.o Mask.o Plane.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Basetex.cpp ../../Content/Reflection.cpp ../../Content/Shadow.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp ../../Content/Plane.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
