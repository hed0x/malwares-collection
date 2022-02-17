// ICECream.c
//
// SoftICE '95 Detection - Made by David Eriksson (david@shellwizard.com)
//
// This sourcecode is hereby free to use. The only thing I ask for is
// credits, and maybe a copy of the program you use it in.
//
// I take no responsability for the authenticity of this information, or the 
// results of the use or misuse of the sourcecode.
//
// For more information about how this works, read ICECream.txt
//
#include <stdio.h>

#ifndef _WIN32
#error This is a Win32 console application!
#endif

//
// Word align is required!!!
//
#pragma pack(2)

//
// Nice typedefs & macros
//
typedef unsigned long	DWORD;
typedef unsigned short	WORD;

#define MK_LONG(h,l)		( (((DWORD)h) << 16) | ((DWORD)l) )


//
// The format of these structures was found in:
//     INTEL 80386 PROGRAMMER'S REFERENCE MANUAL 1986
//
typedef struct _IDTGATE
{
	WORD	gateOffsetLow;
	WORD	gateSelector;
	WORD	gateFlags;
	WORD	gateOffsetHigh;
} IDTGATE;

typedef struct _IDT
{
	WORD		idtLimit;
	IDTGATE*	idtGate;
} IDT;


//
// main() function
//
int main()
{
	IDT icy;
	DWORD* pId;

	printf( "\nSoftICE Detection program! Made by David Eriksson (david@shellwizard.com)\n\n");

	// Get Interrupt Descriptor Table
	_asm SIDT icy;

	printf( "Interrupt Description Table:\n\tBase:\t%p\n\tLimit:\t0x%04X\n",
			icy.idtGate,
			icy.idtLimit );

	// Get pointer from IDT Gate
	pId = (DWORD*)MK_LONG( icy.idtGate[1].gateOffsetHigh, icy.idtGate[1].gateOffsetLow);
	
	// 4 DWORDs back!
	pId -= 4;	

	printf( "SoftICE ID:\n\tOffset:\t%p\n\tValue:\t0x%08X\n",
			pId,
			*pId );

	// Is ID = "V101" ???
	if( *pId == 0x31303156 )
	{
		printf("SoftICE is running!\n");
	}
	else
	{
		printf("SoftICE is not running!\n");
	}

	return 0;
}


