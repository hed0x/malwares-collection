#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<io.h>
#include<fcntl.h>
#include<errno.h>
#include<dos.h>

struct EXEheader	{
unsigned int sign;
unsigned int PartPag;
unsigned int PageCnt;
unsigned int ReloCnt;
unsigned int HdrSize;
unsigned int MinMem;
unsigned int MaxMem;
unsigned int ReloSS;
unsigned int ExeSP;
unsigned int ChkSum;
unsigned int ExeIP;
unsigned int ReloCS;
unsigned int TablOff;
unsigned int Overlay;
			}H;

main(int argc,char **argv)
{ int i,j,fd;
unsigned long filelen;
  void far *SSSP,far * CSIP;
  if(argc == 0) return 0;
clrscr();
 if((fd = _open(argv[1],O_RDONLY)) == -1)       {
 printf("\n%s %d : %s",argv[0],__LINE__,sys_errlist[errno]); return 1;}
 if(read(fd,&H,0x1c) == -1)
{ printf("\n%s %d : %s",argv[0],__LINE__,sys_errlist[errno]);return 1;}
SSSP = MK_FP(H.ReloSS,H.ExeSP);
CSIP = MK_FP(H.ReloCS,H.ExeIP);
 printf("\nFile:%s\n",argv[1]);
 printf("\nSIGNATURE :\t%4x\nPartPag :\t%4x\t%5d",H.sign,H.PartPag,H.PartPag);
 printf("\nPageCnt   :\t%4x\t%5u",H.PageCnt,H.PageCnt);
 printf("\nReloCnt   :\t%4x\t%5u",H.ReloCnt,H.ReloCnt);
 printf("\nHdrSize   :\t%4x\t%5u",H.HdrSize,H.HdrSize);
 printf("\nMinMem    :\t%4x\t%5u",H.MinMem,H.MinMem);
 printf("\nMaxMem    :\t%4x\t%5u",H.MaxMem,H.MaxMem);
 printf("\nChkSum    :\t%4x\t%5u",H.ChkSum,H.ChkSum);
 printf("\nTablOff   :\t%4x\t%5u",H.TablOff,H.TablOff);
 printf("\nOverlay   :\t%4x\t%5u\n",H.Overlay,H.Overlay);
 printf("\nSS:SP     :\t%Fp",SSSP);
 printf("\nCS:IP     :\t%Fp",CSIP);
 printf("\nFilelength:\t%ld",(filelen = lseek(fd,0,2)));
 printf("\nStack enough:%ld",(H.ReloSS+H.HdrSize)*16uL + H.ExeSP - filelen);
 printf("\nLoad portion: %ld",(long)(512uL*(H.PageCnt - 1)+(unsigned)H.PartPag));
 }




