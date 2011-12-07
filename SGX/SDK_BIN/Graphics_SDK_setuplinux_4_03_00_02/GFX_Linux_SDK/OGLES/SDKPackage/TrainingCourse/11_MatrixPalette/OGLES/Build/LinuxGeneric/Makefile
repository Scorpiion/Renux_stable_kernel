#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright 2008 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLESMatrixPalette

OBJECTS += model_float.o model_fixed.o Mallet.o

include $(SDKDIR)/Builds/OGLES/LinuxGeneric/make_demo.mak

../../Content/model_float.cpp ../../Content/model_fixed.cpp ../../Content/Mallet.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
