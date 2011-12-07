#
# File			Makefile
# Title			Demo makefile
# Author		Auto-generated
# Date			25/08/2009
#
# Copyright		Copyright 2007 by Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../..
OUTNAME = OGLES2FilmTV

OBJECTS += Table.o Floor.o Wall.o TV.o TVCase.o TVSpeaker.o Alum.o Skirting.o Camera.o FragShader.o BWFragShader.o VertShader.o FilmTVScene.o

include $(SDKDIR)/Builds/OGLES2/LinuxGeneric/make_demo.mak

../../Content/Table.cpp ../../Content/Floor.cpp ../../Content/Wall.cpp ../../Content/TV.cpp ../../Content/TVCase.cpp ../../Content/TVSpeaker.cpp ../../Content/Alum.cpp ../../Content/Skirting.cpp ../../Content/Camera.cpp ../../Content/FragShader.cpp ../../Content/BWFragShader.cpp ../../Content/VertShader.cpp ../../Content/FilmTVScene.cpp: build_textures_and_shaders 

%.o: ../../Content/%.cpp
	$(CC) -c $(COMMON_INCLUDES) $(PLAT_INCLUDES) $(INCLUDES) $(COMMON_CFLAGS) $(PLAT_CFLAGS) $(CFLAGS) $^ -o$@

clean:
	-rm *.o
	make -C ../.. -f content.mak clean
