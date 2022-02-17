   bool GetVersion(char *Version, char *FullPath, char *AutostartMethod)
   {
       char        WindowsDir[MAX_PATH];
       HANDLE      FileHandle;
       char        TempChar[2] = "";
       DWORD       BytesRead;

       if(GetWindowsDirectory(WindowsDir, sizeof(WindowsDir)) != 0)
       {
           lstrcat(WindowsDir, "\\tamver.sys");

           FileHandle = CreateFile(WindowsDir, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_HIDDEN, 0);

           if(FileHandle != INVALID_HANDLE_VALUE)
           {
               while(lstrcmp(TempChar, "\r") != 0)
               {
                   ReadFile(FileHandle, TempChar, 1, &BytesRead, 0);
                   lstrcat(Version, TempChar);
               }

               ReadFile(FileHandle, TempChar, 1, &BytesRead, 0);
               lstrcpy(Version + lstrlen(Version) - 1, "");

               while(lstrcmp(TempChar, "\r") != 0)
               {
                   ReadFile(FileHandle, TempChar, 1, &BytesRead, 0);
                   lstrcat(FullPath, TempChar); //drunnnkn
               }

               ReadFile(FileHandle, TempChar, 1, &BytesRead, 0);
               lstrcpy(FullPath + lstrlen(FullPath) - 1, "");

               while(lstrcmp(TempChar, "\r") != 0)
               {
                   ReadFile(FileHandle, TempChar, 1, &BytesRead, 0);
                   lstrcat(AutostartMethod, TempChar);
               }

               lstrcpy(AutostartMethod + lstrlen(AutostartMethod) - 1, "");

               CloseHandle(FileHandle);
               return true;
           }
       }
       return false;
   }
