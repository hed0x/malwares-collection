
////////x///////x///////x///////x///////x///////x///////x///////x///////x////
// CODEGEN 2.01
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#ifndef __CG_BIN_HPP__
#define __CG_BIN_HPP__

typedef
void __cdecl cg_engine(
                BYTE*      bufptr,
                DWORD*     outbufsize,
                DWORD      regfree,
                BYTE* __cdecl user_fixup(BYTE* outptr, DWORD value),   // both may be NULL,
                BYTE* __cdecl user_trash(BYTE* outptr, DWORD regfree), // both returns modified outptr
                DWORD      cmd_x_x,
                DWORD      cmd_xxx,
                DWORD      arg1,
                DWORD      arg2);

#define cmd_v_c         0       // cmd,v,c
#define cmd_v_v         1       // cmd,v1,v2
#define cmd_v_memv      2       // cmd,v1,[v2]
#define cmd_memv_v      3       // cmd,[v1],v2
#define cmd_r_r         4       // cmd,r1,r2
#define cmd_r_c         5       // cmd,r,c
#define cmd_r_memr      6       // cmd,r1,[r2]
#define cmd_memr_r      7       // cmd,[r1],r2
#define cmd_r_v         8       // cmd,r,v
#define cmd_v_r         9       // cmd,v,r

// cmd means one of the following:
#define cmd_mov         0
#define cmd_add         1
#define cmd_sub         2
#define cmd_xor         3
#define cmd_cmp         4

// v means offset
// r means 32-bit register # (0..7)
// c means dword-const

#endif // __CG_BIN_HPP__
