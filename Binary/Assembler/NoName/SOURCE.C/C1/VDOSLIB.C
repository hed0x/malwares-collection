
 /* VDOSLIB.c file	*/

 #include"v.h"
 #pragma inline

int _Cdecl int86x(int intno, union REGS *inregs, union REGS *outregs,
		  struct SREGS *segregs)
{
   _AX = intno;
   asm mov byte ptr cs:interrupt_number, al;
   _AX =   segregs->ds;
   asm push ax;
   _AX =   segregs->es;
   asm push ax;

   _BX = (int)inregs;
   _CX = 6;	/* six registers */
   push_regs:
   asm push word ptr [bx]
   asm inc bx
   asm inc bx
   asm loop push_regs;
   asm pop di
   asm pop si
   asm pop dx
  asm  pop cx
   asm pop bx
   asm pop ax
			/* ATTENTION! new segments */
   asm pop es;
   asm pop ds;
   asm			 db 0xCD	;  /* INT 80x86 directive */
   asm interrupt_number  db 0		;
   asm pushf
   asm push ax
   asm push bx
   asm push cx
   asm push dx
   asm push si
   asm push di
   asm push ds
   asm push cs
   asm pop ds				/* DS restored */
   asm pop ax
   segregs->ds = _AX;                 /* returned ds */
   segregs->es = _ES;
   asm push cs
   asm pop es
   _BX = (int)outregs;
   asm add bx,10
   _CX = 6;
   pop_regs:
   asm pop word ptr [bx]
   asm dec bx
   asm dec bx
   asm loop pop_regs
   asm pop ax			/* flags */
   outregs->x.flags = _AX;
   outregs->x.cflag = _AX & 1;
   return 0;
   }

int _Cdecl int86(int intno, union REGS *inregs, union REGS *outregs)
{ struct SREGS sreg;
 sreg.ds = _DS;
 sreg.es = _ES;
 return int86x(intno, inregs, outregs, &sreg);
 }









