#include <wsasdk.h>
#include <server.h>
#include <config.h>
#include <console.h>
#include <memory.h>
#include <aes.h>
#include <aeskey.h>
#include <crc32.h>

/*
    still under development
*/

ULONG ServerConnectionsCount = 0;

static
SOCKET
CreateAcceptSocket(VOID)
{
    BOOL bTrue = TRUE;
    SOCKET Socket = WSASocketW(AF_INET, SOCK_STREAM, 0, NULL, 0, WSA_FLAG_OVERLAPPED);

    if (NOT_INVALID_SOCKET(Socket)) {
        /* "socks do have souls" */
        if (NOT_SOCKET_ERROR(setsockopt(Socket, SOL_SOCKET, SO_REUSEADDR, (PVOID)&bTrue, sizeof(bTrue)))) {
            SOCKADDR_IN Address = { 
                AF_INET,
                HTONS(2666)
            };

            if (NOT_SOCKET_ERROR(bind(Socket, (PVOID)&Address, sizeof(Address)))) {
                return Socket;
            } else {
                ConsolePrint("Couldn't bind a address to socket\n");
            }
        } else {
            ConsolePrint("Couldn't set option SO_REUSEADDR to TRUE\n");
        }
    } else {
        ConsolePrint("Couldn't create new socket\n");
    }

    return INVALID_SOCKET;
}

static
BOOL
FORCEINLINE
DECLSPEC_DEPRECATED_S("Still under development")
CheckConfig(VOID)
{
    

    return FALSE;
}

BOOL
DECLSPEC_DEPRECATED_S("Still under development")
InitServer(VOID)
{
    SOCKET AcceptSocket = CreateAcceptSocket();

    CheckConfig();

    if (IS_INVALID_SOCKET(AcceptSocket)) {
        ConsolePrint("Couldn't create socket\n");

        return FALSE;
    }

    ConsolePrint("Waiting for connections...\n");

    if (IS_SOCKET_ERROR(listen(AcceptSocket, SOMAXCONN))) {
        ConsolePrint("Couldn't listen for new connection\n");

        return FALSE;
    }

    DWORD dwReserved;
    DWORD dwFlags = 0;
    ULONG dwTimeout = 50;
    CHAR sRecvBuffer[100];
    CHAR sSendBuffer[4];
    WSABUF RecvBuffer = { 100, (PVOID)&sRecvBuffer };
    WSABUF SendBuffer = { 1,   (PVOID)&sSendBuffer };

    PVOID ClientAesKey = MmAlloc(AesExpandedKeySize);
    AesLoadKey(Config.Aes.Key, ClientAesKey);

    while (TRUE) {
        SOCKET ClientSocket = WSAAccept(AcceptSocket, NULL, NULL, NULL, 0);

        ConsolePrint("New connection\n");

        if (NOT_SOCKET_ERROR(WSARecv(ClientSocket, &RecvBuffer, 1, &dwReserved, &dwFlags, NULL, NULL))) {
            WSASend(ClientSocket, &SendBuffer, 1, &dwReserved, 0, NULL, NULL);
        }

        closesocket(ClientSocket);
        ConsolePrint("Lost connection\n");
    }
}
