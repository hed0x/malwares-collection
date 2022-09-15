#ifndef SDK_WSA_INCLUDED
#define SDK_WSA_INCLUDED

#ifndef INCL_WINSOCK_API_PROTOTYPES
    #define INCL_WINSOCK_API_PROTOTYPES 0
#endif

#ifndef INCL_WINSOCK_API_TYPEDEFS
    #define INCL_WINSOCK_API_TYPEDEFS 0
#endif

#include <WinSock2.h>
#include <ws2ipdef.h>

#define IS_SOCKET_ERROR(X)  ((X))
#define NOT_SOCKET_ERROR(X) (!(X))

#define IS_INVALID_SOCKET(X)  ((X) == INVALID_SOCKET)
#define NOT_INVALID_SOCKET(X) ((X) != INVALID_SOCKET)

/* It makes me angry we need to call a function to use a port, kkk */
#define HTONS(X) (X << 8 | X >> 8)

#endif
