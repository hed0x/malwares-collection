#include <stdio.h>
#include <stdlib.h>
#include <io.h>

typedef unsigned char       BYTE;
typedef unsigned short      WORD;
typedef unsigned long       DWORD;

#define __SIGN1	  'TOL1'
#define __SIGN2	  'TOL2'

   int o1=0,o2=0,repeat_s;

int main(void)
{
	FILE *f,*h;
	if ((f=fopen("image.dmp","rb"))==NULL){printf("File opening error!\n"); return 1;}
	int l=filelength(fileno(f));
	BYTE* buf= (BYTE*)malloc(l);

   fread(buf,1,l,f);
   fclose(f);

   for (int i=0;i<l;i++)
   {
   	if ( *(DWORD*)&buf[i] == __SIGN1 ) o1=i+4;
   	if ( *(DWORD*)&buf[i] == __SIGN2 ) o2=i;
   }

   f=fopen("virhex.inc","wb");				//asm include

	fprintf(f,"\r\n;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�\r\n");
	fprintf(f,";  VIRHEX.%i\r\n",o2-o1);
	fprintf(f,";께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�\r\n");
	fprintf(f,"\r\n\r\nvirhex:\r\n");

   for(int i=0;i<(o2-o1);i++)
  	{
		if (i%10 == 0)	fprintf(f,"\r\n		db ");

	        fprintf(f,"0%02Xh",buf[o1+i]);
		if ((i%10 != 9)&&(i!=(o2-o1-1))) fprintf(f,",");
        }


      free(buf);
      fclose(f);
      return 0;
}
