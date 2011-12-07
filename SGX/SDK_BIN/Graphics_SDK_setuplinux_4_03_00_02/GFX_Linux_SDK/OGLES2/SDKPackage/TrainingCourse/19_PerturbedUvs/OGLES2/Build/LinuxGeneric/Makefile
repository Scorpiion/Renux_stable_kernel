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
OUTNAME = OGLES2PerturbedUvs

OBJECTS += Reflection.o NormalMap.o FragShader.o VertShader.o Mask.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Reflection.cpp ../../Content/NormalMap.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
