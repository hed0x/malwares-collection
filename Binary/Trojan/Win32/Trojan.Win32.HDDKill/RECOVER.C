/* восстанавливалка win.com
*/

#include <stdio.h>
#include <windows.h>


BOOL ReadRecoverDataFromRegistry( char* Data, DWORD* DataSz )
  {
    HKEY  KeyH;
    BOOL  Rc;
    DWORD VType;

    if( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
                      "System\\CurrentControlSet\\Services\\VxD\\VXXXD",
                      0, KEY_READ, &KeyH ) != ERROR_SUCCESS ) return FALSE;
    Rc = FALSE;
    *DataSz = 512;
    if( RegQueryValueEx( KeyH, "RData", NULL, &VType,
                         (LPBYTE) Data, DataSz ) == ERROR_SUCCESS )
      Rc = TRUE;
    RegCloseKey( KeyH );
    return Rc;
  }

void main()
  {
    FILETIME Ftm;
    DWORD    attr, Sz, x;
    HANDLE   Fh;
    static   char  WinCom[MAX_PATH];
    static   char  RData[512];

    if( ! ReadRecoverDataFromRegistry( RData, &Sz ) ) {
      puts( "no recover data" );
      return;
    }
    GetWindowsDirectory( WinCom, MAX_PATH );
    // set manually if recover under NT: strcpy( WinCom,"c:\\windows" );
    strcat( WinCom, "\\win.com" );
    attr = GetFileAttributes( WinCom );
    SetFileAttributes( WinCom, FILE_ATTRIBUTE_NORMAL );
    Fh = CreateFile( WinCom, GENERIC_READ | GENERIC_WRITE,
                     0, NULL, OPEN_EXISTING, 0, NULL );
    if( Fh != INVALID_HANDLE_VALUE ) {
      GetFileTime( Fh, NULL, NULL, &Ftm );
      WriteFile( Fh, RData, Sz, &x, NULL );
      SetFileTime( Fh, NULL, NULL, &Ftm );
      CloseHandle( Fh );
    }
    SetFileAttributes( WinCom, attr );
  }
