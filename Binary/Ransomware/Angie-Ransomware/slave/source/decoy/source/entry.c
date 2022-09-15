#define INCL_WINSOCK_API_PROTOTYPES 1

#include <wsasdk.h>

ULONG
WINAPI
DecoyEntry(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Loading ws2_32.dll");

    WSADATA WsaData;

    LoadLibraryW(L"ws2_32.dll");
    WSAStartup(0x0202, &WsaData);

    $DLOG2(DLG_FLT_INFO, "Done");

    #ifdef DEBUG
        $DLogDestroy(TRUE);
    #endif

    return 0;
}
