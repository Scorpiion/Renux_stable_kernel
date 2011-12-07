#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright 2008 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLESSkinning

OBJECTS += man_float.o man_fixed.o Legs.o Body.o Belt.o

include $(SDKDIR)/Builds/OGLES/LinuxGeneric/make_demo.mak

../../Content/man_float.cpp ../../Content/man_fixed.cpp ../../Content/Legs.cpp ../../Content/Body.cpp ../../Content/Belt.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
