#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright 2008 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLESMouse

OBJECTS += Mouse_float.o Mouse_fixed.o FloorToon.o MouseToon.o Toon.o WallToon.o

include $(SDKDIR)/Builds/OGLES/LinuxGeneric/make_demo.mak

../../Content/Mouse_float.cpp ../../Content/Mouse_fixed.cpp ../../Content/FloorToon.cpp ../../Content/MouseToon.cpp ../../Content/Toon.cpp ../../Content/WallToon.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
