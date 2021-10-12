   bool GetAutostartPath(char *AutostartPath)
   {
       HKEY        RegHandle;
       DWORD       RegIndex = 0;
       char        ValueName[MAX_PATH];
       DWORD       ValueNameSize = sizeof(ValueName);
       DWORD       AutostartPathSize = sizeof(AutostartPath);
       char        Suffix[4];
       char        DoublePoint[2];

       if(RegOpenKeyEx(HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", 0, KEY_ALL_ACCESS, &RegHandle) == ERROR_SUCCESS)
       {
           while(RegEnumValue(RegHandle, RegIndex, ValueName, &ValueNameSize, 0, 0, (BYTE *)AutostartPath, &AutostartPathSize) != ERROR_NO_MORE_ITEMS)
           {
               lstrcpy(Suffix, AutostartPath + lstrlen(AutostartPath) - 3);
               lstrcpyn(DoublePoint, AutostartPath + 1, 2);

               if(lstrcmp(DoublePoint, ":") == 0)
               {
                   if(lstrcmp(Suffix, "exe") == 0 || lstrcmp(Suffix, "EXE") == 0)
                   {
                       CloseHandle(RegHandle);
                       return true;
                   }
               }

               RegIndex++;
           }

           RegCloseKey(RegHandle);
       }

       return false;
   }
