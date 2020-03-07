   bool DisableXPFirewall(void)
   {
       char    RegPath[] = "SYSTEM\\CurrentControlSet\\Services\\SharedAccess";
       char    RegKey[] = "Start";
       DWORD   DisableValue = 4;
       DWORD   DisableValueSize = sizeof(DisableValue);
       HKEY    RegHandle;

       if(RegOpenKeyEx(HKEY_LOCAL_MACHINE, RegPath, 0, KEY_WRITE, &RegHandle) == ERROR_SUCCESS)
       {
           RegSetValueEx(RegHandle, RegKey, 0, REG_DWORD, (BYTE *)&DisableValue, DisableValueSize);
           RegCloseKey(RegHandle);
           return true;
       }

       return false;
   }
