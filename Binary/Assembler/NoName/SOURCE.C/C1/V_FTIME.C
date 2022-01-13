
// V_FTIME.C

#include"v.h"
extern int errno;

int  _Cdecl getftime	 (int handle, struct ftime *ftimep)
{ union REGS reg;
  reg.x.ax = 0x5700;
  reg.x.bx = handle;
  intdos(&reg,&reg);
  ((int*)ftimep)[0] = reg.x.cx;
  ((int*)ftimep)[2] = reg.x.dx;
  if(!reg.x.cflag) return 0;
  else
  errno = reg.x.ax;
  return -1;
  }


int  _Cdecl setftime	 (int handle, struct ftime *ftimep)
{ union REGS reg;
  reg.x.ax = 0x5701;
  reg.x.bx = handle;
  ((int*)ftimep)[0] = reg.x.cx;
  ((int*)ftimep)[2] = reg.x.dx;
  intdos(&reg,&reg);
  if(!reg.x.cflag) return 0;
  else
  errno = reg.x.ax;
  return -1;
  }
