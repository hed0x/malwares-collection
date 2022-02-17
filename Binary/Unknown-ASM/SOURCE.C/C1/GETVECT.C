
// getvect.c file
#include"v.h"
#include"v_std.h"

void	 _Cdecl setvect	(int interruptno, void interrupt (*isr) ());
void	interrupt 	(* _Cdecl getvect(int interruptno)) ();

typedef void far * fptr;

void	 _Cdecl setvect	(int interruptno, void interrupt (*isr) ())
{ union REGS r;
  struct SREGS sr;
  r.h.ah = 0x25; r.h.al = interruptno;
  r.x.dx = FP_OFF(isr);
  sr.ds = FP_SEG(isr);
  intdosx(&r,&r,&sr);
}

void	interrupt 	(* _Cdecl getvect(int interruptno)) ()
{
  union REGS r;
  struct SREGS sr;
  r.h.ah = 0x35; r.h.al = interruptno;
  intdosx(&r,&r,&sr);
  return MK_FP(sr.es,r.x.bx);
}




