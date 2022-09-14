#include <wsasdk.h>
#include <wsapi.h>
#include "wsapi.h"

enum {
    XOR_KEY = RTLP_LCG_DWORD,
};

CONST VOLATILE DWORD WsapiNamesHashXorKey = XOR_KEY;

DWORD WsapiNamesHash[] = {
    0xA6A9403C ^ XOR_KEY, // WSASocketW
    0x851A5758 ^ XOR_KEY, // WSAConnect
    0x607C8DF8 ^ XOR_KEY, // WSASend
    0xCBD213CE ^ XOR_KEY, // WSARecv
    0x06834302 ^ XOR_KEY, // closesocket
    0x43CF5D01 ^ XOR_KEY  // GetAddrInfoW
};

FARPROC WsapiAddressStorage[] = {
    (PVOID)RTLP_LCG_NATIVE, // WSASocketW
    (PVOID)RTLP_LCG_NATIVE, // WSAConnect
    (PVOID)RTLP_LCG_NATIVE, // WSASend
    (PVOID)RTLP_LCG_NATIVE, // WSARecv
    (PVOID)RTLP_LCG_NATIVE, // closesocket
    (PVOID)RTLP_LCG_NATIVE  // GetAddrInfoW
};

PRAGMA_WARNING_DISABLE_PUSH(869) // parameter "X" was never referenced

SOCKET
WSAPISTUB
WSASocketW(
    IN     ULONG af,
    IN     ULONG type,
    IN     ULONG protocol,
    IN OPT LPWSAPROTOCOL_INFOW lpProtocolInfo,
    IN     GROUP g,
    IN     DWORD dwFlags
    )
{
    return (SOCKET)WsapiAddressStorage[0](af, type, protocol, lpProtocolInfo, g, dwFlags);
}

INT
WSAPISTUB
WSAConnect(
    IN       SOCKET    s,
    IN CONST PSOCKADDR name,
    IN       ULONG     namelen,
    IN  OPT  LPWSABUF  lpCallerData,
    OUT OPT  LPWSABUF  lpCalleeData,
    IN  OPT  LPQOS     lpSQOS,
    IN  OPT  LPQOS     lpGQOS
    )
{
    return (INT)WsapiAddressStorage[1](s, name, namelen, lpCallerData, lpCalleeData, lpSQOS, lpGQOS);
}

INT
WSAPISTUB
WSASend(
    IN      SOCKET   s,
    IN      LPWSABUF lpBuffers,
    IN      DWORD    dwBufferCount,
    OUT OPT LPDWORD  lpNumberOfBytesSent,
    IN      DWORD    dwFlags,
    IO OPT  LPWSAOVERLAPPED lpOverlapped,
    IN OPT  LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    )
{
    return (INT)WsapiAddressStorage[2](s, lpBuffers, dwBufferCount, lpNumberOfBytesSent, dwFlags, lpOverlapped, lpCompletionRoutine);
}

INT
WSAPISTUB
WSARecv(
    IN      SOCKET   s,
    IN      LPWSABUF lpBuffers,
    IN      DWORD    dwBufferCount,
    OUT OPT LPDWORD  lpNumberOfBytesRecvd,
    IO      LPDWORD  lpFlags,
    IO OPT  LPWSAOVERLAPPED lpOverlapped,
    IN OPT  LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    )
{
    return (INT)WsapiAddressStorage[3](s, lpBuffers, dwBufferCount, lpNumberOfBytesRecvd, lpFlags, lpOverlapped, lpCompletionRoutine);
}

INT
WSAPISTUB
closesocket(
    IN SOCKET s
    )
{
    return (INT)WsapiAddressStorage[4](s);
}

INT
WSAPISTUB
GetAddrInfoW(
    IN  OPT PCWSTR      pNodeName,
    IN  OPT PCWSTR      pServiceName,
    IN  OPT PADDRINFOW  pHints,
    OUT     PADDRINFOW *ppResult
    )
{
    return (INT)WsapiAddressStorage[5](pNodeName, pServiceName, pHints, ppResult);
}

PRAGMA_WARNING_DISABLE_POP(869)

#ifndef __INTELLISENSE__
    C_ASSERT(sizeof(WsapiNamesHash)      == sizeof(*WsapiNamesHash)      * WsapiFunctionsCount);
    C_ASSERT(sizeof(WsapiAddressStorage) == sizeof(*WsapiAddressStorage) * WsapiFunctionsCount);
#endif

