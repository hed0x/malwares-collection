#include "..\k2common.h"

#define		UM_ASYNC		WM_USER+1
#define		UM_QUITCLIENT	WM_USER+2
#define		MAXCONN			SOMAXCONN
#define		NOMOREREQUEST	(-2)
#define		BADREQUEST		(-3)

typedef struct tagREQUEST {
	SOCKET socket;				// socket
	HANDLE thread;				// thread handle
} REQUEST;

extern REQUEST request[];
void ClearRequests(void);
int NewRequest(void);
int GetRequest(SOCKET);
