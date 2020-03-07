   bool MapiSendMail(LHANDLE SessionHandle, char MailToName[100], char MailToAddress[100], char Subject[512], char Body[1024], char AttachedFileName[MAX_PATH], char AttachedFilePath[MAX_PATH])
   {
       HINSTANCE           MapiDll;
       LPMAPISENDMAIL      MapiSendMail;
       MapiMessage         Message;
       MapiRecipDesc       Originator;
       MapiRecipDesc       Recips;
       MapiFileDesc        Files;

       Message.ulReserved          = 0;
       Message.lpszSubject         = Subject;
       Message.lpszNoteText        = Body;
       Message.lpszMessageType     = 0;
       Message.lpszDateReceived    = 0;
       Message.lpszConversationID  = 0;
       Message.flFlags             = 0;
       Message.lpOriginator        = &Originator;
       Message.nRecipCount         = 1;
       Message.lpRecips            = &Recips;
       Message.nFileCount          = 1;
       Message.lpFiles             = &Files;

       Originator.ulReserved       = 0;
       Originator.ulRecipClass     = MAPI_ORIG;
       Originator.lpszName         = 0;
       Originator.lpszAddress      = 0;
       Originator.ulEIDSize        = 0;
       Originator.lpEntryID        = 0;

       Recips.ulReserved           = 0;
       Recips.ulRecipClass         = MAPI_TO;
       Recips.lpszName             = MailToName;
       Recips.lpszAddress          = MailToAddress;
       Recips.ulEIDSize            = 0;
       Recips.lpEntryID            = 0;

       Files.ulReserved            = 0;
       Files.flFlags               = 0;
       Files.nPosition             = 0;
       Files.lpszPathName          = AttachedFilePath;
       Files.lpszFileName          = AttachedFileName;
       Files.lpFileType            = 0;

       MapiDll = LoadLibrary("MAPI32.DLL");

       if(MapiDll != 0)
       {
           MapiSendMail    = (LPMAPISENDMAIL)  GetProcAddress(MapiDll, "MAPISendMail");

           if(MapiSendMail(SessionHandle, 0, &Message, 0, 0) == SUCCESS_SUCCESS)
           {
               FreeLibrary(MapiDll);
               return true;
           }
       }

       FreeLibrary(MapiDll);
       return false;
   }
