#ifndef __INCLUDE_WSA_H
#define __INCLUDE_WSA_H

#include <WinSock2.h>

#define IS_SOCKET_ERROR(X)  ((X))
#define NOT_SOCKET_ERROR(X) (!(X))

#define IS_INVALID_SOCKET(X)  ((X) == INVALID_SOCKET)
#define NOT_INVALID_SOCKET(X) ((X) != INVALID_SOCKET)

/* It makes me angry we need to call a function for use a port, kkk */
#define HTONS(X) (X << 8 | X >> 8)

#endif
