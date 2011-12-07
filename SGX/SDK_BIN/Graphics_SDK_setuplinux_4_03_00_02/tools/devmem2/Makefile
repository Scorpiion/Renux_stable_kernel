# Makefile to build DEVMEM2

.PHONY: clean

TARGETFSDIR  = ../../targetfs/

CROSS_COMPILE=arm-none-linux-gnueabi-

PLAT_CC  = $(CROSS_COMPILE)gcc
PLAT_CPP = $(CROSS_COMPILE)g++
PLAT_AR  = $(CROSS_COMPILE)ar

DEBUG_RELEASE = Release
PLAT_CFLAGS   = -Wall -DRELEASE -O2

PLAT_OBJPATH = ./Obj
PLAT_LINK =  -lm -ldl -L$(TOOLCHAIN)/lib -Wl

SRCNAME = devmem2

OUTNAME = devmem2

OBJECTS = $(PLAT_OBJPATH)/$(SRCNAME).o

$(PLAT_OBJPATH)/$(OUTNAME) : $(OBJECTS) 
	mkdir -p $(PLAT_OBJPATH)
	$(PLAT_CPP) -o $(PLAT_OBJPATH)/$(OUTNAME) $(OBJECTS) $(OBJECTS1) $(OBJECTS2) $(LINK) $(PLAT_LINK) $(VG_LINK) $(PVR2D_LINK)

$(PLAT_OBJPATH)/%.o: %.cpp 
	mkdir -p $(PLAT_OBJPATH)
	$(PLAT_CC) $(PLAT_CFLAGS) -c $(COMMON_INCLUDES) $(INCLUDES) $^ -o $@

$(PLAT_OBJPATH)/%.o: %.c 
	mkdir -p $(PLAT_OBJPATH)
	$(PLAT_CC) $(PLAT_CFLAGS) -c $(COMMON_INCLUDES) $(INCLUDES) $^ -o $@

install:
	cp $(PLAT_OBJPATH)/$(OUTNAME) ../../targetfs/

clean:
	rm -rf $(PLAT_OBJPATH) *.o
