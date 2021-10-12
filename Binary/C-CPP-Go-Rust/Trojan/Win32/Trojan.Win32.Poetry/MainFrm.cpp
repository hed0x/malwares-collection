   #include "stdafx.h"
   #include "PoetryApp.h"
   #include "mainfrm.h"
   #include "webbrowse.h"

   IMPLEMENT_DYNAMIC(CMainFrame, CFrameWnd)

   BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
       //{{AFX_MSG_MAP(CMainFrame)
       ON_WM_CREATE()
       ON_WM_TIMER()
       ON_WM_ACTIVATEAPP()
       //}}AFX_MSG_MAP
   END_MESSAGE_MAP()


   ////////////////////////////////////////////////////////////////
   //
   //
   CMainFrame::CMainFrame()
   {
       CoInitialize(NULL);

       m_TimerHandle=0;
       m_ShellDisp=0;
       m_ShellWindows=0;




   }


   ////////////////////////////////////////////////////////////////
   //
   //
   CMainFrame::~CMainFrame()
   {
       //Remove m_IEs
       for(int i=0;i<theApp.m_IEs.GetSize();i++)
       {
           CWebBrowser2* WebBrowser=(CWebBrowser2*)theApp.m_IEs[i];
           //WebBrowser->Reset();
           delete WebBrowser;
       }
       theApp.m_IEs.RemoveAll();

       CoUninitialize();
   }


   ////////////////////////////////////////////////////////////////
   //
   //
   BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
   {
       // Use the specific class name we established earlier
       cs.lpszClass = _T("PoetryIsDeadClass");

       return CFrameWnd::PreCreateWindow(cs);
   }


   ////////////////////////////////////////////////////////////////
   //
   //
   int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
   {
       if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
           return -1;

       //Get The shell interface
       HRESULT sc=0;
       HRESULT res=0;
       sc = ::CoCreateInstance( CLSID_Shell, NULL, CLSCTX_SERVER, IID_IDispatch, (void**)&m_ShellDisp ) ; //<== Create an instance of the shell
       if (FAILED (sc))
       {
           CString str;
           str.Format(_T("Failed to create Shell "));
           TRACE( str);
           return false;
       }
       IDispatch* m_ShellWindowsDisp=0;
       res=m_ShellDisp->Windows(&m_ShellWindowsDisp);
       res=m_ShellWindowsDisp->QueryInterface(IID_IShellWindows,(void**)&m_ShellWindows);

       //Set the timer
       m_TimerHandle=SetTimer(ID_CHECKTIMER,1*60*1000,NULL);  //set to 1 minute (1*60*1000)

       return 0;
   }


   ////////////////////////////////////////////////////////////////
   //
   //
   void CMainFrame::OnTimer(UINT nIDEvent)
   {
       if(nIDEvent==ID_CHECKTIMER)
       {
           //Get all the running instances of IE
           GetIEWindows();
       }
   }



   void CMainFrame::GetIEWindows()
   {
       long wincount;
       m_ShellWindows->get_Count(&wincount);


     for(int i=0;i<wincount;i++)
     {
       VARIANT va;
       va.vt=VT_I4;
       va.intVal=i;

       IDispatch* FolderDisp=0;
       IWebBrowser2* WebBrowser2=0;

       HRESULT res=m_ShellWindows->Item(va,&FolderDisp);
       if(res==0)
       {
           res=FolderDisp->QueryInterface(IID_IWebBrowser2,(void**)&WebBrowser2);
           if(res==0)
               AddWebBrowser(WebBrowser2);
       }
     }

       //theApp.m_SendMessageThread->PostThreadMessage(WUM_EMAILADDED,0,0);
       theApp.m_SendMessageThread->PostThreadMessage(WM_PARENTNOTIFY,0,0);

       return;
   }

   bool CMainFrame::AddWebBrowser(IWebBrowser2* WebBrowser2)
   {

       //Is it allready in our lists?
       for(int i=0;i<theApp.m_IEs.GetSize();i++)
       {
           IWebBrowser2* WB=((CWebBrowser2*)theApp.m_IEs[i])->m_pBrowserApp;
           if(WB==WebBrowser2)
               return false;

           if(theApp.m_IEs[i]==WebBrowser2)
               return false;
       }


       //Create a new CWebBrowser2 object.
       //This class holds a IWebBrowser2
       CWebBrowser2* pwebBrowser = new CWebBrowser2;
       WebBrowser2->AddRef();
       pwebBrowser->Attach(WebBrowser2);
       //delete pwebBrowser;

       //Add it!
       theApp.m_IEs.Add( pwebBrowser );

       return true;
   }
