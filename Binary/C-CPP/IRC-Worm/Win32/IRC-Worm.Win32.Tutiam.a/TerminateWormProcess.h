   bool TerminateWormProcess(void)
   {
       char            Version[MAX_PATH] = "";
       char            FullPath[MAX_PATH] = "";
       char            AutostartMethod[MAX_PATH] = "";
       char            ShortName[100];
       char            TempChar[2];
       unsigned int    Counter = 0;
       HANDLE          ToolhelpHandle;
       PROCESSENTRY32  ProcessEntry32;
       HANDLE          ProcessHandle;

       if(GetVersion(Version, FullPath, AutostartMethod) == false) return false;

       while(lstrcmp(TempChar, "\\") != 0)
       {
           lstrcpyn(TempChar, FullPath + lstrlen(FullPath) - Counter, 2);
           Counter++;
       }

       lstrcpy(ShortName, FullPath + lstrlen(FullPath) - Counter + 2);

       ToolhelpHandle = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

       if(ToolhelpHandle > 0)
       {
           ProcessEntry32.dwSize = sizeof(ProcessEntry32);

           if(Process32First(ToolhelpHandle, &ProcessEntry32) == 1)
           {
               do
               {
                   if(lstrcmp(ProcessEntry32.szExeFile, FullPath) == 0 || //Win9x
                      lstrcmp(ProcessEntry32.szExeFile, ShortName) == 0)  //NT+
                   {
                       ProcessHandle = OpenProcess(PROCESS_TERMINATE, 0, ProcessEntry32.th32ProcessID);

                       if(ProcessHandle != 0)
                       {
                           if(TerminateProcess(ProcessHandle, 0) != 0)
                           {
                               CloseHandle(ProcessHandle);
                               CloseHandle(ToolhelpHandle);
                               return true;
                           }

                           CloseHandle(ProcessHandle);
                       }
                       else return false;
                   }
               }
               while(Process32Next(ToolhelpHandle, &ProcessEntry32) != 0);
           }

           CloseHandle(ToolhelpHandle);
       }

       return false;
   }
