// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SkyboxVShader.vsh ********

// File data
static const char _SkyboxVShader_vsh[] = 
	"attribute mediump vec3 inVertex;\r\n"
	"\r\n"
	"uniform mediump mat4 ModelMatrix;\r\n"
	"uniform mediump mat4 ModelViewMatrix;\r\n"
	"uniform mediump mat4 MVPMatrix;\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"uniform mediump float WaterHeight;\t\t//Assume water always lies on the y-axis\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_DISCARD_CLIP\r\n"
	"uniform bool ClipPlaneBool;\r\n"
	"uniform mediump vec4 ClipPlane;\r\n"
	"#endif\r\n"
	"\r\n"
	"varying mediump vec3 EyeDir;\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"varying mediump float VertexDepth;\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_DISCARD_CLIP\r\n"
	"varying highp float ClipDist;\r\n"
	"#endif\r\n"
	"\r\n"
	"void main()\r\n"
	"{\r\n"
	"\tEyeDir = -inVertex;\r\n"
	"\tgl_Position = MVPMatrix * vec4(inVertex, 1.0);\r\n"
	"\t\r\n"
	"\t#ifdef ENABLE_DISCARD_CLIP\r\n"
	"\t\t// Compute the distance between the vertex and clipping plane (in world space coord system)\r\n"
	"\t\tmediump vec4 vVertexView = ModelMatrix * vec4(inVertex.xyz,1.0);\r\n"
	"\t\tClipDist = dot(vVertexView, ClipPlane);\r\n"
	"\t#endif\r\n"
	"\t\r\n"
	"\t#ifdef ENABLE_FOG_DEPTH\r\n"
	"\t\t// Calculate the vertex's distance under water surface. This assumes clipping has removed all objects above the water\r\n"
	"\t\tmediump float vVertexHeight = (ModelMatrix * vec4(inVertex,1.0)).y;\r\n"
	"\t\tVertexDepth = WaterHeight - vVertexHeight;\r\n"
	"\t#endif\r\n"
	"}";

// Register SkyboxVShader.vsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SkyboxVShader_vsh("SkyboxVShader.vsh", _SkyboxVShader_vsh, 1133);

// ******** End: SkyboxVShader.vsh ********

// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SkyboxVShader.vsc ********

// File data
A32BIT _SkyboxVShader_vsc[] = {
0x10fab438,0xef4aa102,0x35050100,0x901,0xf121629f,0x0,0x0,0xb4020000,0x0,0x4000200,0x0,0x9000000,0x3,0x0,0x20000,0x0,0x0,0xbe010000,0x55535020,0x17,0x1b2,0x1,0x0,0xc,0x0,0x3,0x6d,0x1,0x8,0x0,0xffffffff,0x0,0x76000a,0xffff,0x20003,0x0,0x100000,0x0,0x0,0x0,0x0,0xfffc0000,0x0,0x0,0x0,0x110000,0xffffffff,0x100000,0x56780003,0x10000,0x4,0x10000,0x10005,0x10000,0x20006,0x10000,0x30007,0x10000,0x40008,0x10000,0x50009,0x10000,0x6000a,0x10000,
0x7000b,0x10000,0x8000c,0x10000,0x9000d,0x10000,0xa000e,0x10000,0xb000f,0x10000,0xc0010,0x10000,0xd0011,0x10000,0xe0012,0x10000,0xf0013,0x70000,0x40000,0x110000,0x2,0x1,0x80018001,0x80018001,0x0,0x0,0x1a300000,0x20855080,0x200a3,0xc0000,0x80000000,0x80048001,0x8004,0x0,0x40000,0x0,0x10001,0x10001,0x10001,0x0,0x4040000,0x1,0x700fa10,0x10006020,0x50b2883,0x2204f000,0x1a1610a8,0x10017000,0x60d0082,0x606f000,0x1a173898,0x10057020,0x48110082,0x606f000,0x8a153882,0x206f000,0x8038a2,0x1002e020,0xc0e2883,0x1206d000,0x5a190081,0x10057060,0x41800082,0x10016040,
0x60080,0x18000000,0x0,0x0,0x0,0x803f,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x3f,0x3f,0x0,0x0,0x79450400,0x72694465,0x4000000,0x1000005,0x10000,0x7000300,0x6e690000,0x74726556,0x7865,0x40400,0x100,0x4000001,0x700,0x4d50564d,0x69727461,0x78,0x316,0x1000001,0xff100400,0x670000ff,0x6f505f6c,0x69746973,0x6e6f,0x50501,0x100,0x4000001,0xf00,0x0,
};

// Register SkyboxVShader.vsc in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SkyboxVShader_vsc("SkyboxVShader.vsc", _SkyboxVShader_vsc, 724);

// ******** End: SkyboxVShader.vsc ********

