// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: FullscreenVertShader.vsh ********

// File data
static const char _FullscreenVertShader_vsh[] = 
	"attribute highp vec2  inVertex;\r\n"
	"\r\n"
	"void main()\r\n"
	"{\r\n"
	"\tgl_Position = vec4(inVertex, 0.0, 1.0);\r\n"
	"}\r\n";

// Register FullscreenVertShader.vsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_FullscreenVertShader_vsh("FullscreenVertShader.vsh", _FullscreenVertShader_vsh, 96);

// ******** End: FullscreenVertShader.vsh ********

// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: FullscreenVertShader.vsc ********

// File data
A32BIT _FullscreenVertShader_vsc[] = {
0x10fab438,0xe84c2aad,0x35050100,0x901,0xf121629f,0x0,0x0,0x69010000,0x0,0x4000200,0x0,0x1000000,0x1000000,0x0,0x0,0x0,0x210000,0xd6000000,0x55535020,0x17,0xca,0x1,0x0,0xc,0x0,0x3,0x6d,0x1,0x0,0x0,0xffffffff,0x0,0x76000a,0xffff,0x2,0x0,0x0,0x0,0x0,0x0,0x0,0xfffc0000,0x0,0x0,0x0,0x110000,0xffffffff,0x0,0x56780002,0x30000,0x40000,0x110000,0x2,0x5,0x80018001,0x80018001,0x0,0x0,0x0,0x0,0x0,0x1001a000,0x802881,0x1001a020,
0x1a002881,0x10016060,0x7002883,0x10026000,0x1b02883,0x10055040,0x60081,0xc000000,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x803f,0x3f,0x3f,0x0,0x0,0x6c670200,0x736f505f,0x6f697469,0x100006e,0x505,0x1000001,0x40000,0x6900000f,0x7265566e,0x786574,0x4030000,0x10000,0x100,0x30004,0x0,
};

// Register FullscreenVertShader.vsc in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_FullscreenVertShader_vsc("FullscreenVertShader.vsc", _FullscreenVertShader_vsc, 393);

// ******** End: FullscreenVertShader.vsc ********

