   bool NTFSCheck(void)
   {
       char    WindowsDir[MAX_PATH];
       HANDLE  FileHandle;
       char    FileStream[MAX_PATH];

       if(GetWindowsDirectory(WindowsDir, sizeof(WindowsDir)) != 0)
       {
           lstrcat(WindowsDir, "\\dia.from");

           FileHandle = CreateFile(WindowsDir, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_HIDDEN, 0);

           if(FileHandle != INVALID_HANDLE_VALUE)
           {
               CloseHandle(FileHandle);

               lstrcpy(FileStream, WindowsDir);
               lstrcat(FileStream, ":rrlf");

               if(CopyFile(WindowsDir, FileStream, false) != 0)
               {
                   DeleteFile(WindowsDir);
                   return true;
               }

               DeleteFile(WindowsDir);
           }
       }

       return false;
   }
