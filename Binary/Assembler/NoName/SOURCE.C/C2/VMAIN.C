 
		/*	VMAIN.C  file	*/
#include"v.h"
 extern void far * OldEntryPoint;
 extern unsigned int NewReloCS;
 void scantree(void);

 void vmain(void)
 { 
  NewReloCS = NRCS;  		/*  IMPORTANT !!!  */
  OldEntryPoint = OEP;		/*   IMPORTANT !!! */
  counter++;
  scantree();}


