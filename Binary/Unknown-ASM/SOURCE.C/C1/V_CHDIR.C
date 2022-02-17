
// V_CHDIR.C file
#include"v.h"
extern int errno;

int	 _Cdecl chdir(const char *path)
{ union REGS reg;
  reg.x.dx = (int)path;
  reg.h.ah = 0x3B;
  intdos(&reg,&reg);
  if(!reg.x.cflag) return 0;
  else
  errno = reg.x.ax;
  return -1;
  }
