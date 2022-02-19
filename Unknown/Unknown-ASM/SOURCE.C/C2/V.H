 
 /*   V.H file	*/

#ifndef __TINY__
#error  Must use tiny model for this project
#endif

#ifndef __V_STD_H_
#include"v_std.h"
#endif

 #ifndef _V_H_
 #define _V_H_

 #define random() *(int*)MK_FP(0x40,0x6C)


 extern unsigned long  OldFileLength;
 extern void far *OEP ; /* old entry */
 extern unsigned int NRCS;
 extern int presence;
 extern int counter;
 extern int end_of_program;
 extern char err_handler[];

 void message(char *ptr);
 void vmain(void);
 void exit(void);
 void scantree(void);
 int modify(char*);


 void set_dta(struct ffblk far * ptr);
 struct ffblk far * get_dta(void);

 enum {
stdin = 0,stdout,stderr,stdaux,stdprn
 };		/* for write & read */

 struct EXEheader
 { unsigned sign,PartPag,PageCnt,ReloCnt,HdrSize,MinMem,MaxMem,ReloSS,
     ExeSP,ChkSum,ExeIP,ReloCS,TablOff,Overlay;
 };


 #endif  /* _V_H_ */

