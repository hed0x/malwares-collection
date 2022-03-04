/* LDIZX-based statistic tool ViewCommands v 1.12 .
   Scans all folder with subfolders for disassembly statistic.*/

#include <stdio.h>
#include <stdlib.h>
#include <dir.h>
#include <dos.h>
#include <string.h>
#include <io.h>
#include <ctype.h>


typedef unsigned char       BYTE;
typedef unsigned short      WORD;
typedef unsigned long       DWORD;
#include "..\ldizx.h"

typedef DWORD __cdecl ldizx(DWORD bufer,DWORD out,DWORD table);
typedef void __cdecl ldizx_init(DWORD bufer);

cmd xout;
DWORD result;
DWORD PEheader;
int resb,resc,res5,resf;
void* tablePtr;

void findfiles(char* dir);
int process_file(char* filename);
#include "..\ldizx.c"
void *ldizxPtr=_ldizx;
void *ldizx_initPtr=_ldizx_init;

int main(int argc,char* argv[])
{


tablePtr=malloc(0x1000);
(*(ldizx_init*)ldizx_initPtr)((DWORD)tablePtr);
printf (" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n");
if (argc!=2) {
printf ("\n Use:        vcstat32.exe  <dir_name>\n");
printf (" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n\n");
exit(1);}
printf ("*** Statistic for %s *** \n\n",argv[1]);

resb=resc=res5=resf=0;
findfiles(argv[1]);

printf (" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n");
printf ("  Total  files processed                           %i\n",resf);
if (resf==0) resf=1;
printf ("  Middle bytes disassembled (Kb)                   %i.%i\n",resb/(1024*resf),((resb%(1024*resf))/1000)*1000);
printf ("  Middle commands disassembled                     %i\n",resc/resf);
printf ("  Middle 5 length bytes commands disassembled      %i\n",res5/resf);
printf (" =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n");

free(tablePtr);
return 0;
}

void findfiles(char* dir)
{

struct ffblk searchRec;
char dirmask[1024];
char pdir[1024];
char npath[1024];

strcpy(dirmask,dir);
strcpy(pdir,dir);
if (dirmask[strlen(dirmask)-1]!='\\') strcat(dirmask,"\\");
strcat(dirmask,"*.*");
findfirst(dirmask,&searchRec,FA_RDONLY|FA_HIDDEN|FA_SYSTEM|FA_DIREC|FA_ARCH);


while (1)
  {
	strcpy(npath,pdir);		//npath=cdir
	if (npath[strlen(npath)-1]!='\\') strcat(npath,"\\");
        strcat(npath,searchRec.ff_name);

	if ((searchRec.ff_attrib & FA_DIREC)&&(searchRec.ff_name[0]!='.'))
	{
  		strcat(npath,"\\");
		findfiles(npath);
	}
        else if(!(searchRec.ff_attrib & FA_DIREC)) process_file(npath);
  	  if(findnext(&searchRec)) break;
  }

};


//==============================================================================
#define l strlen(filename)

int process_file(char* filename)
{
	int i,len;
  	int cc=0,cs=0,c5=0;
	FILE* f;
	BYTE *buf,*memPtr;
	DWORD text,RVA,clen;


 for (i=0; i<l; i++) filename[i] = toupper(filename[i]);

if (

	((filename[l-3]=='E')&&
	(filename[l-2]=='X')&&
	(filename[l-1]=='E'))||

	((filename[l-3]=='D')&&
	(filename[l-2]=='L')&&
	(filename[l-1]=='L')))

{

	if ((f=fopen(filename,"rb"))==NULL)
	{printf(" * ! %s  - File opening error.\n",filename); return 0;}


	len= filelength(fileno(f));
	buf=(BYTE*)malloc(len);
   	fread(buf,1,len,f);
	fclose(f);

	printf(" ok1\n");

   	if (*(WORD*)buf!=(WORD)0x5A4D){free(buf);return 0;}
   	if ((*(WORD*)&buf[0x18])!=(WORD)0x40){free(buf);return 0;}

	PEheader=(*(DWORD*)&buf[0x3c]);
   	if (*(WORD*)(buf+PEheader)!=(WORD)'PE'){free(buf);return 0;}

	text=*(WORD*)(buf+PEheader+0x14)+PEheader+0x18;
   	RVA=*(DWORD*)(buf+PEheader+0x28);
	if (RVA==0) {free(buf);return 0;}

   	RVA=RVA-*(DWORD*)(buf+text+0x0C)+*(DWORD*)(buf+text+0x14);

	printf(" * file : %s \n",filename);

	clen=*(DWORD*)(buf+text+0x0C)+*(DWORD*)(buf+text+0x10)-*(DWORD*)(buf+PEheader+0x28)+0x1000;
	memPtr=buf+(DWORD)RVA;

	printf(" ok2\n");

	while (clen>0x1000)
	{
		result=(*(ldizx*)ldizxPtr)((DWORD)memPtr,(DWORD)&xout,(DWORD)tablePtr);
		if (result!=0xFFFFFFFF)
		{
			 cs+=result;
			 clen-=result;
			 resb+=result;
          		 cc++;
          		 resc++;

      		if(result>=5){c5++;res5++;}
		(DWORD)memPtr+=result;
		}else break;
	}

   	free(buf);
  	resf++;																	//+ 1 file processed

	printf("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n");
	printf("   Disasmed bytes      :  %u  bytes.\n",cs);
	printf("   Disasmed commands   :  %u .\n",cc);
	printf("   5-bytes commands    :  %u .\n",c5);
	printf("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n\n");
}
	return 0;
}

