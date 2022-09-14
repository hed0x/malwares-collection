#ifndef WSAPI_INCLUDED
#define WSAPI_INCLUDED

#define WSAPISTUB \
    FORCEINLINE   \
    WSAAPI

SOCKET
WSAPISTUB
WSASocketW(
    IN     ULONG af,
    IN     ULONG type,
    IN     ULONG protocol,
    IN OPT LPWSAPROTOCOL_INFOW lpProtocolInfo,
    IN     GROUP g,
    IN     DWORD dwFlags
    );

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
    );

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
    );

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
    );

INT
WSAPISTUB
closesocket(
    IN SOCKET s
    );

INT
WSAPISTUB
GetAddrInfoW(
    IN  OPT PCWSTR      pNodeName,
    IN  OPT PCWSTR      pServiceName,
    IN  OPT PADDRINFOW  pHints,
    OUT     PADDRINFOW *ppResult
    );

#endif
