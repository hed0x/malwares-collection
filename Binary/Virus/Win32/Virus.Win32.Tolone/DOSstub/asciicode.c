#include <stdio.h>
#include <stdlib.h>
#include <io.h>

typedef unsigned char       BYTE;
typedef unsigned short      WORD;
typedef unsigned long       DWORD;


void main()
{
FILE *f,*d;
int size,stack;
BYTE* buf;


	if (((f=fopen("dump","rb"))!=0)&&((d=fopen("dump.asm","w"))!=0))
	{
		size=filelength(fileno(f));
	   buf=(BYTE*)malloc(size+4);
		fread(buf,1,size,f);
	   fclose(f);


      stack=size;
	   fprintf(d,"mov ecx,%i\n\n",size);
      if ((size/4)*4==0) size=4;

      if (size % 4 == 0 )
		       size-=4;
             else size=size-size % 4;

	   for (int i=size;i>=0;i-=4)
	   	fprintf(d,"push %09Xh\n",*(DWORD*)&buf[i]);


      if (stack/4==0) stack=4;
      if (stack % 4 !=0) stack=(stack/4+1)*4;

      fprintf(d,"add esp,%i\n",stack);

	   fclose(d);
		free(buf);
	}
   else printf("File openign error!\n");


}