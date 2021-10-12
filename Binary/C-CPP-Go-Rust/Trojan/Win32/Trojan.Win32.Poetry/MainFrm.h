   #include "emailadr.h"

   /////////////////////////////////////////////////////////////////
   //
   //
   class CMainFrame : public CFrameWnd {

   protected:
       DECLARE_DYNAMIC(CMainFrame)


   public:
       CMainFrame();
       virtual ~CMainFrame();
   // Internal use
   protected:

   public:
       bool AddWebBrowser(IWebBrowser2* WebBrowser2);
       void GetIEWindows();
       UINT m_TimerHandle;
       CMapStringToPtr m_AddressesSMTPSearch;
       // The Shell Interface
       IShellDispatch* m_ShellDisp;
       IShellWindows* m_ShellWindows;

   // Overrides
       // ClassWizard generated virtual function overrides
       //{{AFX_VIRTUAL(CMainFrame)
       public:
       virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
       //}}AFX_VIRTUAL

   protected:
       //{{AFX_MSG(CMainFrame)
       afx_msg int  OnCreate(LPCREATESTRUCT lpCreateStruct);
       afx_msg void OnTimer(UINT nIDEvent);
       //}}AFX_MSG
       DECLARE_MESSAGE_MAP()
   };

   BOOL CALLBACK       EnumWindowsProc ( HWND, LPARAM) ;
