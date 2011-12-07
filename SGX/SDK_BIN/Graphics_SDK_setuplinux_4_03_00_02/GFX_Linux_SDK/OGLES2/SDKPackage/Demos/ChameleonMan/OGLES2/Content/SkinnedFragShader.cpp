// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SkinnedFragShader.fsh ********

// File data
static const char _SkinnedFragShader_fsh[] = 
	"uniform sampler2D sTexture;\r\n"
	"uniform sampler2D sNormalMap;\r\n"
	"uniform bool bUseDot3;\r\n"
	"\r\n"
	"varying mediump vec2 TexCoord;\r\n"
	"varying mediump vec3 Light;\r\n"
	"\r\n"
	"void main()\r\n"
	"{\r\n"
	"\tif(bUseDot3)\r\n"
	"\t{\r\n"
	"\t\t/*\r\n"
	"\t\t\tNote:\r\n"
	"\t\t\tIn the normal map red = y, green = x, blue = z which is why when we get the normal\r\n"
	"\t\t\tfrom the texture we use the swizzle .grb so the colours are mapped to the correct\r\n"
	"\t\t\tco-ordinate variable.\r\n"
	"\t\t*/\r\n"
	"\r\n"
	"\t\tmediump vec3 fNormal = texture2D(sNormalMap, TexCoord).grb;\r\n"
	"\t\tmediump float fNDotL = dot((fNormal - 0.5) * 2.0, Light);\r\n"
	"\t\t\r\n"
	"\t\tgl_FragColor = texture2D(sTexture, TexCoord) * fNDotL;\r\n"
	"    }\r\n"
	"    else\r\n"
	"\t\tgl_FragColor = texture2D(sTexture, TexCoord) * Light.x;\r\n"
	"}\r\n";

// Register SkinnedFragShader.fsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SkinnedFragShader_fsh("SkinnedFragShader.fsh", _SkinnedFragShader_fsh, 672);

// ******** End: SkinnedFragShader.fsh ********

// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: SkinnedFragShader.fsc ********

// File data
A32BIT _SkinnedFragShader_fsc[] = {
0x10fab438,0xcf6d0790,0x35050100,0x901,0xf121629f,0x0,0x0,0x9b060000,0x1000000,0x4000200,0x0,0x18000000,0x203,0x7b000000,0x2020021,0x58000011,0x1000030,0xda020000,0x55535020,0x17,0x2ce,0x1,0x0,0x48,0x0,0x3,0x6d,0x1,0x8,0x0,0xffffffff,0x0,0x770009,0xffff,0x60005,0x0,0x10003,0x0,0x0,0x0,0x0,0xfffc0000,0x3,0x10004,0x0,0x110000,0xffffffff,0x10000,0x56780000,0x40000,0x10000,0x10003,0x0,0x2,0x0,0x20001,0x0,0x30001,0x0,0x4,0x20011,0x10000,0x80010000,0x80018001,
0x8001,0x0,0x0,0xd00004b0,0x48a11280,0x3,0x0,0xfd000040,0x50012,0x10000,0x80010000,0x80018001,0x8001,0x0,0x0,0x70000,0x6880007,0x10001,0x10001,0x10000,0x30002,0x10001,0x10001,0x0,0x0,0x60001,0x20002,0x2,0x2,0x40a18001,0x80008000,0x0,0x0,0x4,0x1a10000,0xfa100004,0x50600704,0xa32220,0x2,0x2,0x80018000,0x80018001,0x0,0x0,0x4,0x10101,0xfa100000,0x20200180,0x10a02002,0x5,0x1,0x80018000,0x80018001,0x0,0x0,0x10000,0xf000f,0x10688,0x10001,0x1,0x20001,0x10003,0x10001,0x1,
0x0,0x10000,0x20006,0x20002,0x40000,0x80000000,0x80018001,0x8001,0x0,0x0,0x1,0x40010001,0x6060000,0x138ab,0x1c3cf004,0x41034083,0x6060020,0x138ab,0x1c24f004,0x34083,0x0,0x400000,0x13f800,0x4,0x50012,0x10000,0x80010000,0x80018001,0x8001,0x0,0x0,0xf0001,0x688000f,0x30003,0x30003,0x20001,0x40003,0x10001,0x10001,0x0,0x0,0x60001,0x20002,0x2,0x4,0x80018001,0x80018001,0x0,0x0,0x10000,0x10000,0xa0200082,0x38ab0606,0xf0040001,0x40831c3c,0xa0400184,0x38ab0606,0xf0040001,0x40831c24,0x4,0x20013,0x20000,0x80010000,0x80018001,
0x8001,0x0,0x40000,0x1010012,0x101,0xfa10,0x10022000,0x62881,0x0,0x5020d002,0x175553,0x2c40000,0x10000,0x0,0x1480000,0x0,0x30000,0x6d0000,0x10000,0x80000,0x0,0xffff0000,0xffff,0x90000,0xffff0077,0x50000,0x6,0x30000,0x1,0x0,0x0,0x0,0x0,0x1fffc,0x40000,0x1,0x1,0xffff0011,0xffff,0x1,0x5678,0x4,0x30001,0x1,0x20000,0x0,0x10000,0x2,0x10000,0x3,0x40000,0x110000,0x2,0x1,0x80018001,0x80018001,0x0,0x0,0x4b00000,0x1280d000,0x348a1,0x0,0x400000,0x12fd00,
0x5,0x1,0x80018001,0x80018001,0x0,0x0,0x0,0x70007,0x10688,0x10001,0x1,0x20001,0x10003,0x10001,0x1,0x0,0x10000,0x20006,0x20002,0x20000,0x80010000,0x800040a1,0x8000,0x0,0x40000,0x0,0x401a1,0x704fa10,0x22205060,0x200a3,0x20000,0x80000000,0x80018001,0x8001,0x0,0x40000,0x1010000,0x1,0x180fa10,0x20002020,0x510a0,0x10000,0x80000000,0x80018001,0x8001,0x0,0x0,0xf0001,0x688000f,0x10001,0x10001,0x30002,0x50004,0x10001,0x10001,0x0,0x0,0x60001,0x20002,0x2,0x4,0x80018000,0x80018001,0x0,
0x0,0x130000,0x110000,0x4103,0x38ab0600,0xf0040001,0x40831c3c,0x204205,0x38ab0600,0xf0040001,0x40831c24,0x3,0x0,0xf8000040,0x40013,0x120000,0x5,0x1,0x80018001,0x80018001,0x0,0x0,0x10000,0xf000f,0x10688,0x10001,0x1,0x20001,0x10003,0x10001,0x1,0x0,0x10000,0x20006,0x20002,0x40000,0x80010000,0x80018001,0x8001,0x0,0x0,0x13,0x10011,0x6040000,0x138ab,0x1c3cf004,0x1034083,0x6040020,0x138ab,0x1c24f004,0x44083,0x130000,0x2,0x1,0x80018001,0x80018001,0x0,0x0,0x1010004,0x101,0x6fa10,0x10000000,0x0,0x0,
0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x3f,0x0,0x0,0x0,0x40,0x55620500,0x6f446573,0x3374,0x30a00,0x100,0x4030001,0x100,0x726f4e73,0x4d6c616d,0x7061,0x31800,0x100,0x1000002,0x100,0x43786554,0x64726f6f,0x3000000,0x1000005,0x10000,0x3000204,0x694c0000,0x746867,0x5040000,0x10000,0x100,0x70003,0x65547300,0x72757478,0x65,0x318,0x2000001,0x10100,0x1,
};

// Register SkinnedFragShader.fsc in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_SkinnedFragShader_fsc("SkinnedFragShader.fsc", _SkinnedFragShader_fsc, 1723);

// ******** End: SkinnedFragShader.fsc ********
