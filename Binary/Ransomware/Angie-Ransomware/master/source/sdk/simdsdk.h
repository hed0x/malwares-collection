#ifndef __INCLUDE_SIMDSDK_H
#define __INCLUDE_SIMDSDK_H

#include <intrin.h>
#include <intrin0.h>
#include <mmintrin.h>   // MMX
#include <xmmintrin.h>  // SSE
#include <emmintrin.h>  // SSE2

typedef __m64   M64,   *P64;
typedef __m128  M128,  *PM128;
typedef __m128i M128I, *PM128I;
typedef __m128d M128D, *PM128D;

#endif
