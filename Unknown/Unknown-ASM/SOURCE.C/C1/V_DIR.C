
	/* V_DIR.C file          directory functions	    */
#include"v.h"

extern int errno;

 void set_dta(struct ffblk far * ptr)
 { union REGS reg;
   struct SREGS sreg;
   sreg.ds = FP_SEG(ptr);
   reg.x.dx = FP_OFF(ptr);
   reg.h.ah = 0x1A;
   intdosx(&reg,&reg,&sreg);
   }


 struct ffblk far * get_dta(void)
 {  union REGS reg;
   struct SREGS sreg;
   reg.h.ah = 0x2F;
   intdosx(&reg,&reg,&sreg);
   return MK_FP(sreg.es,reg.x.bx);
}


int _Cdecl findfirst(const char *path,int attrib)
{   union REGS reg;
   reg.h.ah = 0x4E;	/* Fnd1st */
   reg.x.dx = (int)path;
   reg.x.cx = attrib;
   intdos(&reg,&reg);
   if(!reg.x.cflag) return 0;
   else
   errno = reg.x.ax;
   return -1;
   }

int	 _Cdecl findnext(void)
{   union REGS reg;
   reg.h.ah = 0x4F;	/* FndNxt */
   intdos(&reg,&reg);
   if(!reg.x.cflag) return 0;
   else
   errno = reg.x.ax;
   return -1;
   }
