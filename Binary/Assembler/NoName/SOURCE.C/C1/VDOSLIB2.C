
// VDOSLIB2.c
#include"v.h"

 int	 _Cdecl intdos	(union REGS *inregs, union REGS *outregs)
{ return int86(0x21,inregs,outregs);}

int	 _Cdecl intdosx	(union REGS *inregs, union REGS *outregs,
			 struct SREGS *segregs)
{ return int86x(0x21,inregs,outregs,segregs); }


