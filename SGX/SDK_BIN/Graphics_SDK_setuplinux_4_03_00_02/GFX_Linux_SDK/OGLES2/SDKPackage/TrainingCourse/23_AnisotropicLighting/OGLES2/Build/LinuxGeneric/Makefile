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
OUTNAME = OGLES2AnisotropicLighting

OBJECTS += Basetex.o FastFragShader.o FastVertShader.o SlowFragShader.o SlowVertShader.o Mask.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Basetex.cpp ../../Content/FastFragShader.cpp ../../Content/FastVertShader.cpp ../../Content/SlowFragShader.cpp ../../Content/SlowVertShader.cpp ../../Content/Mask.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
