/* Primitive LDIZX-based disassembler */


typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef unsigned long  DWORD;

#include <stdio.h>
#include <stdlib.h>
#include "..\ldizx.h"

#define LDIZX_SIZE 695
#define LDIZXI_SIZE 566

cmd xout;

DWORD result;

int main()
{
#include "..\ldizx.c"

typedef DWORD __cdecl ldizx(DWORD bufer,DWORD out,DWORD table);
typedef void  __cdecl ldizx_init(DWORD bufer);

void *ldizxPtr=_ldizx;
void *ldizx_initPtr=_ldizx_init;

BYTE* tPtr=(BYTE*)malloc(0x1000);

(*(ldizx_init*)ldizx_initPtr)((DWORD)tPtr);

BYTE* mPtr=_ldizx_init;

while ((DWORD)(mPtr-_ldizx_init)<=LDIZXI_SIZE)
{
	result=(*(ldizx*)ldizxPtr)((DWORD)mPtr,(DWORD)&xout,(DWORD)tPtr);
	if (result!=0xFFFFFFFF)
		{
			 printf("{ ");
		         for (DWORD i=0;i<result;i++)	printf("%02X",mPtr[i]);
			 printf("}  [%i] ",result);
			 if (xout.lc_flags & LF_TTTN) printf("TTTN=%x ",xout.lc_tttn);
			 printf("\n"); 
			 mPtr+=result;
		}else break;
}

printf("\n\n ******************************* \n\n");
mPtr=_ldizx;

while ((DWORD)(mPtr-_ldizx)<=LDIZX_SIZE)
{
result=(*(ldizx*)ldizxPtr)((DWORD)mPtr,(DWORD)&xout,(DWORD)tPtr);
	if (result!=0xFFFFFFFF)
		{
			 printf("{ ");
		          for (DWORD i=0;i<result;i++)
		          	printf("%02X",mPtr[i]);
			 printf("} ( %i )",result);
			 if (xout.lc_flags & LF_TTTN) printf("TTTN=%0X ",xout.lc_tttn);

			 if (xout.lc_flags & LF_MEM) printf("memory using ");

			 if (xout.lc_flags & LF_MODRM) 
			  {
				printf("MODRM ");
			  	printf("MOD = %0X ",xout.lc_mod);
			  	printf("R/O = %0X ",xout.lc_ro);
			  	printf("R/M = %0X ",xout.lc_rm);
			  }

			 if (xout.lc_flags & LF_SIB) 
			  {

				printf("SIB ");
				printf("SCALE = %0X ",xout.lc_scale);
				printf("INDEX = %0X ",xout.lc_index);
				printf("BASE = %0X ",xout.lc_base);

                          }
			 if (xout.lc_flags & LF_PCS) printf("CS prefix ");
			 if (xout.lc_flags & LF_PDS) printf("DS prefix ");
			 if (xout.lc_flags & LF_PES) printf("ES prefix ");
			 if (xout.lc_flags & LF_PFS) printf("FS prefix ");
			 if (xout.lc_flags & LF_PGS) printf("GS prefix ");
			 if (xout.lc_flags & LF_PSS) printf("SS prefix ");
			 if (xout.lc_flags & LF_PLOCK) printf("LOCK prefix ");
			 if (xout.lc_flags & LF_PREPZ) printf("REPZ prefix ");
			 if (xout.lc_flags & LF_PREPNZ) printf("REPNZ prefix ");

			 if (xout.lc_flags & LF_REG) printf("REG =%0X",xout.lc_reg);
		


			 printf("\n"); 

			(DWORD)mPtr+=result;
		}else break;
}


free(tPtr);
return 0;
}
