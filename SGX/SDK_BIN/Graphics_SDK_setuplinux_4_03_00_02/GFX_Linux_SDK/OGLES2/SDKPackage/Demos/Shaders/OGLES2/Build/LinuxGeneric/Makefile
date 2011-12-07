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
OUTNAME = OGLES2Shaders

OBJECTS += Basetex.o Reflection.o Cubemap.o AnisoMap.o anisotropic_lighting.o directional_lighting.o envmap.o fasttnl.o lattice.o phong_lighting.o point_lighting.o reflections.o simple.o spot_lighting.o toon.o vertex_sine.o wood.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Basetex.cpp ../../Content/Reflection.cpp ../../Content/Cubemap.cpp ../../Content/AnisoMap.cpp ../../Content/anisotropic_lighting.cpp ../../Content/directional_lighting.cpp ../../Content/envmap.cpp ../../Content/fasttnl.cpp ../../Content/lattice.cpp ../../Content/phong_lighting.cpp ../../Content/point_lighting.cpp ../../Content/reflections.cpp ../../Content/simple.cpp ../../Content/spot_lighting.cpp ../../Content/toon.cpp ../../Content/vertex_sine.cpp ../../Content/wood.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
