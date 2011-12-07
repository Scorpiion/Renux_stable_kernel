// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SHVertShader.vsh ********

// File data
static const char _SHVertShader_vsh[] = 
	"attribute highp   vec3  inVertex;\r\n"
	"attribute mediump vec3  inNormal;\r\n"
	"attribute mediump vec2  inTexCoord;\r\n"
	"\r\n"
	"uniform highp   mat4  MVPMatrix;\r\n"
	"uniform highp   mat3  Model;\r\n"
	"\r\n"
	"// Precalculated constants used for lighting\r\n"
	"uniform highp   vec4  cAr;\r\n"
	"uniform highp   vec4  cAg;\r\n"
	"uniform highp   vec4  cAb;\r\n"
	"\r\n"
	"uniform highp\tvec4  cBr;\r\n"
	"uniform highp\tvec4  cBg;\r\n"
	"uniform highp\tvec4  cBb;\r\n"
	"\r\n"
	"uniform highp\tvec3  cC;\r\n"
	"\r\n"
	"// varyings\r\n"
	"varying lowp    vec4  LightColour;\r\n"
	"varying mediump vec2  TexCoord;\r\n"
	"\r\n"
	"void main()\r\n"
	"{\r\n"
	"\thighp vec4 r0, r1;\r\n"
	"\thighp vec3 r2, r3;\r\n"
	"\t\r\n"
	"\t// Transform position\r\n"
	"\tgl_Position = MVPMatrix * vec4(inVertex, 1.0);\r\n"
	"\r\n"
	"\t// Transform the Normal and add a homogenous 1\r\n"
	"\tr0 = vec4(Model * inNormal, 1.0);\r\n"
	"\r\n"
	"\t// Compute 1st 4 basis functions - linear + constant\r\n"
	"\t// r0 is the normal with a homegenous 1\r\n"
	"\t// c* are precomputed constants\r\n"
	"\tr2.x = dot(cAr, r0);\r\n"
	"\tr2.y = dot(cAg, r0);\r\n"
	"\tr2.z = dot(cAb, r0);\r\n"
	"\t\r\n"
	"\t// Compute polynomials for the next 4 basis functions\r\n"
	"\tr1 = r0.yzzx * r0.xyzz; // r1 is { yx, zy, z^2, xz}\r\n"
	"\r\n"
	"\t// Add contributions and store them in r3\r\n"
	"\tr3.x = dot(cBr, r1);\r\n"
	"\tr3.y = dot(cBg, r1);\r\n"
	"\tr3.z = dot(cBb, r1);\r\n"
	"\r\n"
	"\t// Compute the final basis function x^2 - y^2\r\n"
	"\tr0.z = r0.y * r0.y;\r\n"
	"\tr0.w = (r0.x * r0.x) - r0.z;\r\n"
	"\t\r\n"
	"\t// Combine the first 2 sets : 8 basis functions\r\n"
	"\tr1.xyz = r2 + r3;\r\n"
	"\r\n"
	"\t// Add in the final 9th basis function to create the final RGB Lighting\r\n"
	"\tLightColour.xyz = (cC * r0.w) + r1.xyz;\r\n"
	"\t\r\n"
	"\t// Set light alpha to 1.0\r\n"
	"\tLightColour.a = 1.0;\r\n"
	"\r\n"
	"\t// Pass through texcoords\r\n"
	"\tTexCoord = inTexCoord;\r\n"
	"}";

// Register SHVertShader.vsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SHVertShader_vsh("SHVertShader.vsh", _SHVertShader_vsh, 1553);

// ******** End: SHVertShader.vsh ********

// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SHVertShader.vsc ********

// File data
A32BIT _SHVertShader_vsc[] = {
0x10fab438,0xc62f7f02,0x35050100,0x901,0xf121629f,0x0,0x0,0x14070000,0x0,0x4000200,0x0,0x19000000,0x204,0x0,0x2010000,0x0,0x0,0x70040000,0x55535020,0x17,0x464,0x1,0x0,0xc,0x0,0x3,0x6d,0x1,0x8,0x0,0xffffffff,0x0,0x76000a,0xffff,0x2000a,0x0,0x340000,0x0,0x0,0x0,0x0,0xfffc0000,0x0,0x0,0x0,0x110000,0xffffffff,0x340000,0x5678000a,0x10000,0x4,0x10000,0x10005,0x10000,0x20006,0x10000,0x30007,0x10000,0x40008,0x10000,0x50009,0x10000,0x6000a,0x10000,
0x7000b,0x10000,0x8000c,0x10000,0x9000d,0x10000,0xa000e,0x10000,0xb000f,0x10000,0xc0010,0x10000,0xd0011,0x10000,0xe0012,0x10000,0xf0013,0x10000,0x100014,0x10000,0x110015,0x10000,0x120016,0x10000,0x130018,0x10000,0x140019,0x10000,0x15001a,0x10000,0x16001c,0x10000,0x17001d,0x10000,0x18001e,0x10000,0x190020,0x10000,0x1a0021,0x10000,0x1b0022,0x10000,0x1c0023,0x10000,0x1d0024,0x10000,0x1e0025,0x10000,0x1f0026,0x10000,0x200027,0x10000,0x210028,0x10000,0x220029,0x10000,0x23002a,0x10000,0x24002b,0x10000,0x25002c,0x10000,0x26002d,0x10000,
0x27002e,0x10000,0x28002f,0x10000,0x290030,0x10000,0x2a0031,0x10000,0x2b0032,0x10000,0x2c0033,0x10000,0x2d0034,0x10000,0x2e0035,0x10000,0x2f0036,0x10000,0x300037,0x10000,0x310038,0x10000,0x320039,0x10000,0x33003a,0x3770000,0x40000,0x110000,0x2,0x2,0x80018001,0x80018001,0x0,0x0,0x0,0x60e01a00,0x28831001,0xa1000400,0x28a11001,0x2,0x3,0x80018000,0x80048004,0x0,0x0,0x4,0x4040000,0x1,0x700fa10,0x100260e0,0x50b2883,0x2206f060,0x210a8,0x200000,0x80000000,0x80018001,0x8000,0x0,0x50000,0x10001,0x10001,0x10001,0x10001,0x10001,
0x10001,0x10001,0x10001,0x10001,0x10000,0x10001,0x10001,0x10001,0x10001,0x10001,0x1000001,0x1,0xda16fa10,0x10057000,0x60d0082,0x606f000,0x1a173898,0x10057020,0x48110082,0x606f000,0x8a153882,0x206f000,0xc0e38a2,0x1206d020,0xd1b0081,0x606f001,0x1a193898,0x10057060,0xc1810082,0x10056041,0x4e9e0080,0x606f001,0x90213882,0x606f0e1,0xd58738a2,0xc606e101,0x16003898,0x1006f042,0xc21c0081,0x8606b121,0x5bb03898,0x1004d002,0x4f800081,0x1006f001,0x91000081,0x1006e021,0x4010080,0x1084b022,0xd1a70081,0x606f001,0x122838ab,0x606f002,0x52a93882,0x206f000,0x1a2638a2,0x100670c0,0x56820082,0x4606e000,0x80389d,0x1002e060,0x1a2a2883,0x100670a0,0x44070082,0x606a000,
0x803888,0x1002e080,0x1a2e2883,0x10067040,0x57b30082,0x606f022,0x5c003888,0x1006c000,0xdc800080,0x1006e000,0x200a0,0x70000,0x80ff0000,0x800080ff,0x8001,0x0,0x50000,0x10001,0x10001,0x10001,0xffff0001,0xfa100000,0x60009a00,0x821006,0xe0c05e80,0x801001,0xf0005834,0x38820606,0xf000d8b5,0x38820606,0xf0011936,0x38820606,0x70219a00,0xa31006,0x2,0x2,0x80008001,0x80ff8001,0x0,0x0,0x4,0x10001ff,0xfa100000,0xe0805d81,0xa01001,0x6,0x4400,0x0,0x0,0x803f0000,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x803f0000,0x3f0000,0x3f0000,0x0,0x0,0xf000000,0x65566e69,0x78657472,0x4000000,0x1000004,0x10000,0x7000400,0x6c670000,0x736f505f,0x6f697469,0x100006e,0x505,0x1000001,0x40000,
0x4d00000f,0x614d5056,0x78697274,0x16000000,0x1000003,0x10000,0xffff1004,0x6e690000,0x6d726f4e,0x6c61,0x40400,0x100,0x4040001,0x700,0x65646f4d,0x6c,0x312,0x1000001,0x70c1400,0x63000077,0x7241,0x30500,0x100,0x4200001,0xf00,0x674163,0x3050000,0x10000,0x24000100,0xf0004,0x62416300,0x5000000,0x1000003,0x10000,0xf000428,0x42630000,0x72,0x305,0x1000001,0x42c00,0x6300000f,0x6742,0x30500,0x100,0x4300001,0xf00,0x624263,0x3050000,0x10000,0x34000100,0xf0004,0x436300,0x3040000,0x10000,0x38000100,0x70004,0x67694c00,0x6f437468,0x72756f6c,0x5000000,0x1000005,0x10000,0xf000400,0x65540000,
0x6f6f4378,0x6472,0x50300,0x100,0x2040001,0x300,0x65546e69,0x6f6f4378,0x6472,0x40300,0x100,0x4080001,0x300,0x0,
};

// Register SHVertShader.vsc in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SHVertShader_vsc("SHVertShader.vsc", _SHVertShader_vsc, 1844);

// ******** End: SHVertShader.vsc ********
