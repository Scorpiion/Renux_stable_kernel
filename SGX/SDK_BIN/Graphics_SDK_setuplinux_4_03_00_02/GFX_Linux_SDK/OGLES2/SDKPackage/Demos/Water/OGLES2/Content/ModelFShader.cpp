// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: ModelFShader.fsh ********

// File data
static const char _ModelFShader_fsh[] = 
	"#define ENABLE_TEXTURE\r\n"
	"#ifdef ENABLE_TEXTURE\r\n"
	"uniform sampler2D\t\tModelTexture;\r\n"
	"#endif\r\n"
	"\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"uniform lowp vec3 \t\tFogColour;\r\n"
	"uniform mediump float \tRcpMaxFogDepth;\r\n"
	"#endif\r\n"
	"\r\n"
	"#ifdef ENABLE_LIGHTING\r\n"
	"\tvarying lowp float\t\tLightIntensity;\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_TEXTURE\r\n"
	"\tvarying mediump vec2   \tTexCoord;\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"\tvarying mediump float \tVertexDepth;\r\n"
	"#endif\r\n"
	"\r\n"
	"void main()\r\n"
	"{\t\r\n"
	"\t#ifdef ONLY_ALPHA\r\n"
	"\t\tgl_FragColor = vec4(vec3(0.5),0.0);\r\n"
	"\t#else\r\n"
	"\t\t#ifdef ENABLE_TEXTURE\r\n"
	"\t\t\t#ifdef ENABLE_FOG_DEPTH\t\t\r\n"
	"\t\t\t\t// Mix the object's colour with the fogging colour based on fragment's depth\r\n"
	"\t\t\t\tlowp vec3 vFragColour = texture2D(ModelTexture, TexCoord).rgb;\r\n"
	"\t\t\t\t\r\n"
	"\t\t\t\t// Perform depth test and clamp the values\r\n"
	"\t\t\t\tlowp float fFogBlend = clamp(VertexDepth * RcpMaxFogDepth, 0.0, 1.0);\r\n"
	"\t\t\t\t\r\n"
	"\t\t\t\t#ifdef ENABLE_LIGHTING\r\n"
	"\t\t\t\t\tvFragColour.rgb = mix(vFragColour.rgb * LightIntensity, FogColour.rgb, fFogBlend);\r\n"
	"\t\t\t\t#else\r\n"
	"\t\t\t\t\tvFragColour.rgb = mix(vFragColour.rgb, FogColour.rgb, fFogBlend);\r\n"
	"\t\t\t\t#endif\r\n"
	"\t\t\t\tgl_FragColor = vec4(vFragColour,1.0);\r\n"
	"\t\t\t#else\r\n"
	"\t\t\t\t#ifdef ENABLE_LIGHTING\r\n"
	"\t\t\t\t\tgl_FragColor = vec4(texture2D(ModelTexture, TexCoord).rgb * LightIntensity, 1.0);\r\n"
	"\t\t\t\t#else\r\n"
	"\t\t\t\t\tgl_FragColor = vec4(texture2D(ModelTexture, TexCoord).rgb, 1.0);\r\n"
	"\t\t\t\t#endif\r\n"
	"\t\t\t#endif\r\n"
	"\t\t#else\r\n"
	"\t\t\t// Solid colour is used instead of texture colour\r\n"
	"\t\t\t#ifdef ENABLE_LIGHTING\r\n"
	"\t\t\t\tgl_FragColor = vec4(vec3(0.3,0.3,0.3)* LightIntensity, 1.0);\r\n"
	"\t\t\t#else\r\n"
	"\t\t\t\tgl_FragColor = vec4(vec3(0.3,0.3,0.3), 1.0);\t\r\n"
	"\t\t\t#endif\r\n"
	"\t\t#endif\r\n"
	"\t#endif\r\n"
	"}\r\n";

// Register ModelFShader.fsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_ModelFShader_fsh("ModelFShader.fsh", _ModelFShader_fsh, 1568);

// ******** End: ModelFShader.fsh ********

// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: ModelFShader.fsc ********

// File data
A32BIT _ModelFShader_fsc[] = {
0x10fab438,0xaae7886e,0x35050100,0x901,0xf121629f,0x0,0x0,0x74020000,0x1000000,0x4000100,0x0,0x8000000,0x2,0x0,0x20000,0x0,0x0,0xfe000000,0x55535020,0x17,0xf2,0x1,0x0,0x48,0x0,0x3,0x6d,0x1,0x0,0x0,0xffffffff,0x0,0x770009,0xffff,0x1,0x0,0x1,0x0,0x0,0x0,0x0,0xfffc0000,0x3,0x10004,0x0,0x110000,0xffffffff,0x0,0x56780000,0x0,0x10000,0x0,0x4,0x50011,0x10000,0x80010000,0x80018001,0x8001,0x0,0x120000,0x70000,0x60a0007,0x30003,0x30003,
0x0,0x0,0x40004,0x40004,0x10000,0x30002,0x1,0x20001,0x2,0x1,0x80018001,0x80018001,0x0,0x0,0x1a000010,0x1c226004,0x64083,0x0,0x5020fe00,0x175553,0xf20000,0x10000,0x0,0x1480000,0x0,0x30000,0x6d0000,0x10000,0x0,0x0,0xffff0000,0xffff,0x90000,0xffff0077,0x10000,0x1,0x10000,0x0,0x0,0x0,0x0,0x0,0x1fffc,0x40000,0x1,0x0,0xffff0011,0xffff,0x0,0x5678,0x0,0x1,0x40000,0x110000,0x5,0x1,0x80018001,0x80018001,0x0,0x0,0x12,0x70007,0x1060a,0x10001,
0x1,0x0,0x40000,0x40004,0x4,0x20001,0x10003,0x10001,0x20002,0x10000,0x80010000,0x80018001,0x8001,0x0,0x100000,0x60041a00,0x40831c20,0x6,0x400,0x0,0x0,0x803f0000,0x2000000,0x65646f4d,0x7865546c,0x65727574,0x18000000,0x1000003,0x20000,0x1000100,0x65540000,0x6f6f4378,0x6472,0x50300,0x100,0x2000001,0x300,0x0,
};

// Register ModelFShader.fsc in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_ModelFShader_fsc("ModelFShader.fsc", _ModelFShader_fsc, 660);

// ******** End: ModelFShader.fsc ********

