// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SkyboxFShader.fsh ********

// File data
static const char _SkyboxFShader_fsh[] = 
	"uniform samplerCube CubeMap;\r\n"
	"\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"uniform lowp vec3 FogColour;\r\n"
	"uniform mediump float RcpMaxFogDepth;\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_DISCARD_CLIP\r\n"
	"uniform bool ClipPlaneBool;\r\n"
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
	"\t#ifdef ENABLE_DISCARD_CLIP\r\n"
	"\t\t// Reject fragments behind the clip plane\r\n"
	"\t\tif(ClipDist < 0.0)\r\n"
	"\t\t{\r\n"
	"\t\t\tdiscard; // Too slow for hardware. Left as an example of how not to do this!\r\n"
	"\t\t}\r\n"
	"\t#endif\r\n"
	"\t\r\n"
	"\t#ifdef ENABLE_FOG_DEPTH\r\n"
	"\t\t// Mix the object's colour with the fogging colour based on fragment's depth\r\n"
	"\t\tlowp vec3 vFragColour = textureCube(CubeMap, EyeDir).rgb;\r\n"
	"\t\t\r\n"
	"\t\t// Test depth\r\n"
	"\t\tlowp float fFogBlend = clamp(VertexDepth * RcpMaxFogDepth, 0.0, 1.0);\r\n"
	"\t\tvFragColour.rgb = mix(vFragColour.rgb, FogColour.rgb, fFogBlend);\r\n"
	"\t\t\t\r\n"
	"\t\tgl_FragColor = vec4(vFragColour.rgb, 1.0);\r\n"
	"\t#else\r\n"
	"\t\tgl_FragColor = textureCube(CubeMap, EyeDir);\r\n"
	"\t\t\r\n"
	"\t#endif\r\n"
	"}";

// Register SkyboxFShader.fsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SkyboxFShader_fsh("SkyboxFShader.fsh", _SkyboxFShader_fsh, 1035);

// ******** End: SkyboxFShader.fsh ********

// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SkyboxFShader.fsc ********

// File data
A32BIT _SkyboxFShader_fsc[] = {
0x10fab438,0xf8b6bad6,0x35050100,0x901,0xf121629f,0x0,0x0,0x19020000,0x1000000,0x4000100,0x0,0x8000000,0x3,0x0,0x20000,0x0,0x0,0xdc000000,0x55535020,0x17,0xd0,0x1,0x0,0x48,0x0,0x3,0x6d,0x1,0x0,0x0,0xffffffff,0x0,0x770009,0xffff,0x1,0x0,0x1,0x0,0x0,0x0,0x0,0xfffc0000,0x3,0x10004,0x0,0x110000,0xffffffff,0x0,0x56780000,0x0,0x10000,0x0,0x4,0x50011,0x10000,0x80010000,0x80018001,0x8001,0x0,0x120000,0xf0000,0x60a000f,0x30003,0x30003,
0x0,0x0,0x40004,0x40004,0x10000,0x30002,0x1,0x30001,0x6,0xdc000000,0x55535020,0x17,0xd0,0x1,0x0,0x148,0x0,0x3,0x6d,0x1,0x0,0x0,0xffffffff,0x0,0x770009,0xffff,0x10001,0x0,0x1,0x0,0x0,0x0,0x0,0xfffc0000,0x1,0x10004,0x0,0x110000,0xffffffff,0x0,0x56780000,0x0,0x10000,0x0,0x4,0x50011,0x10000,0x80010000,0x80018001,0x8001,0x0,0x120000,0xf0000,0x60a000f,0x10001,0x10001,0x0,0x0,0x40004,0x40004,0x10000,0x30002,0x10001,0x30001,
0x6,0x2000000,0x65627543,0x70614d,0x31a0000,0x10000,0x200,0x10001,0x65794500,0x726944,0x5040000,0x10000,0x100,0x70003,0x0,
};

// Register SkyboxFShader.fsc in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SkyboxFShader_fsc("SkyboxFShader.fsc", _SkyboxFShader_fsc, 569);

// ******** End: SkyboxFShader.fsc ********

