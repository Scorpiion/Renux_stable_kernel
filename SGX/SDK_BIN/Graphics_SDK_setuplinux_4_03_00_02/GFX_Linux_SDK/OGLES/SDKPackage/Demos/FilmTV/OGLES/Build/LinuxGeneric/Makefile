#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
#
# Copyright		Copyright 2008 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLESFilmTV

OBJECTS += Table.o Floor.o Wall.o TV.o TVCase.o TVSpeaker.o Alum.o Skirting.o Camera.o FilmTVScene_float.o FilmTVScene_fixed.o

include $(SDKDIR)/Builds/OGLES/LinuxGeneric/make_demo.mak

../../Content/Table.cpp ../../Content/Floor.cpp ../../Content/Wall.cpp ../../Content/TV.cpp ../../Content/TVCase.cpp ../../Content/TVSpeaker.cpp ../../Content/Alum.cpp ../../Content/Skirting.cpp ../../Content/Camera.cpp ../../Content/FilmTVScene_float.cpp ../../Content/FilmTVScene_fixed.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
