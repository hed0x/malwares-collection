
	/*  V_IO.c file	*/

#include"v.h"

int errno;

int  _Cdecl _open	 (const char *path, int oflags)
{ union REGS reg;
  reg.x.ax = oflags ;
  reg.h.ah = 0x3D;	/*	Open handle; */
  reg.x.dx = (int) path;
  intdos(&reg,&reg);
  if(!reg.x.cflag) return reg.x.ax;
  else
  errno = reg.x.ax;
  return -1;
  }

int  _Cdecl close(int handle)
{ union REGS reg;
  reg.h.ah = 0x3E;
  reg.x.bx = handle;
  intdos(&reg,&reg);
  if(!reg.x.cflag) return 0;
  else
  errno = reg.x.ax;
  return -1;
  }

long _Cdecl lseek	 (int handle, long offset, int fromwhere)
{ union REGS reg;
  reg.x.ax = fromwhere;
  reg.h.ah = 0x42;
  reg.x.cx = (unsigned int) (offset >> 16);
  reg.x.dx = (unsigned) offset;
  reg.x.bx = handle;
  intdos(&reg,&reg);
  if(reg.x.cflag) return -1L;
  else
  return ( reg.x.ax | ((long)reg.x.dx << 16));
  }

  long _Cdecl tell(int handle)
  { return lseek(handle,0L,SEEK_CUR); }

  long _Cdecl filelength(int handle)
  { long curpos,len;
    if(( curpos = tell(handle)) == -1L) return -1;
    len = lseek(handle,0L,SEEK_END);
    if(lseek(handle,curpos,SEEK_SET) == -1) return -1;
    return len;
    }

int  _Cdecl read(int handle, void *buf, unsigned len)
{ union REGS reg;
  reg.x.bx = handle;
  reg.h.ah = 0x3f;
  reg.x.dx = (unsigned)buf;
  reg.x.cx = len;
  intdos(&reg,&reg);
  if(!reg.x.cflag) return reg.x.ax;
  else
  errno = reg.x.ax;
  return -1;  }

int  _Cdecl write(int handle, void *buf, unsigned len)
{  union REGS reg;
  reg.x.bx = handle;
  reg.h.ah = 0x40;
  reg.x.dx = (unsigned)buf;
  reg.x.cx = len;
  intdos(&reg,&reg);
  if(!reg.x.cflag) return reg.x.ax;
  else
  errno = reg.x.ax;
  return -1;  }

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
