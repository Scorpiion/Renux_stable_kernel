#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright 2008 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLESEvilSkull

OBJECTS += Iris.o Metal.o Fire02.o Fire03.o EvilSkull_float.o EvilSkull_fixed.o

include $(SDKDIR)/Builds/OGLES/LinuxGeneric/make_demo.mak

../../Content/Iris.cpp ../../Content/Metal.cpp ../../Content/Fire02.cpp ../../Content/Fire03.cpp ../../Content/EvilSkull_float.cpp ../../Content/EvilSkull_fixed.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
