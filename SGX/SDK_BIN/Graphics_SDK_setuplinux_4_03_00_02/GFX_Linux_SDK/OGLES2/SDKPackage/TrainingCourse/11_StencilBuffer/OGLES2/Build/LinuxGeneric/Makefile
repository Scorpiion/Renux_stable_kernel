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
OUTNAME = OGLES2StencilBuffer

OBJECTS += Lattice.o Stone.o Tile.o FragShader.o VertShader.o Cylinder.o Sphere.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Lattice.cpp ../../Content/Stone.cpp ../../Content/Tile.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Cylinder.cpp ../../Content/Sphere.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
