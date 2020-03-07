   #if !defined WEBBROWSE_H
   #define WEBBROWSE_H

   #if _MSC_VER > 1000
   #pragma once
   #endif // _MSC_VER > 1000
   // WebBrowse.h : header file
   //
   #include <objbase.h>
   #include <exdisp.h>
   #include <exdispid.h>

   /////////////////////////////////////////////////////////////////////////////
   // CWebBrowser2 command target

   class CWebBrowser2 : public CCmdTarget
   {
       DECLARE_DYNCREATE(CWebBrowser2)

       CWebBrowser2();
       virtual ~CWebBrowser2();

       // Attributes
   public:

   // Operations
       virtual BOOL SinkEvents();

   public:

   // Overrides
       // ClassWizard generated virtual function overrides
       //{{AFX_VIRTUAL(CWebBrowser2)
       public:
       virtual void OnFinalRelease();
       //}}AFX_VIRTUAL


       IWebBrowser2* m_pBrowserApp;

   // Implementation
   protected:
       void Reset();
       DWORD m_dwCookie;

       // Generated message map functions
       //{{AFX_MSG(CWebBrowser2)
           // NOTE - the ClassWizard will add and remove member functions here.
       //}}AFX_MSG

       DECLARE_MESSAGE_MAP()

       //Message Handlers
       virtual void OnQuit();
       virtual void OnStatusTextChange(LPCTSTR strText);
       virtual void OnProgressChange(long nProgress, long nProgressMax);
       virtual void OnCommandStateChange(long lCommand, BOOL bEnable);
       virtual void OnDownloadBegin();
       virtual void OnDownloadComplete();
       virtual void OnTitleChange(LPCTSTR strTitle);
       virtual void OnPropertyChange(LPCTSTR strProperty);
       virtual void OnBeforeNavigate2(LPDISPATCH  pDisp , VARIANT* URL, VARIANT* Flags, VARIANT* TargetFrameName,VARIANT* PostData, VARIANT* Headers, BOOL* Cancel);
       virtual void OnNewWindow2(LPDISPATCH FAR* ppDisp, BOOL* Cancel);
       virtual void NavigateComplete2(LPDISPATCH pDisp, VARIANT FAR* URL);
       virtual void OnDocumentComplete(LPDISPATCH pDisp, const VARIANT FAR* URL);
       virtual void OnVisible(BOOL bVisible);
       virtual void OnToolBar(BOOL bToolBar);
       virtual void OnMenuBar(BOOL bMenuBar);
       virtual void OnStatusBar(BOOL bStatusBar);
       virtual void OnFullScreen(BOOL bFullScreen);
       virtual void OnTheaterMode(BOOL bTheaterMode);

       // Generated OLE dispatch map functions
       //{{AFX_DISPATCH(CWebBrowser2)
       //}}AFX_DISPATCH
       DECLARE_DISPATCH_MAP()
       DECLARE_INTERFACE_MAP()

   //Typical functions same as CHtmlView with some additions and corrections
   // Attributes
   public:
       CString GetType() const;
       long GetLeft() const;
       void SetLeft(long nNewValue);
       long GetTop() const;
       void SetTop(long nNewValue);
       long GetHeight() const;
       void SetHeight(long nNewValue);
       void SetVisible(BOOL bNewValue);
       BOOL GetVisible() const;
       CString GetLocationName() const;
       READYSTATE GetReadyState() const;
       BOOL GetOffline() const;
       void SetOffline(BOOL bNewValue);
       BOOL GetSilent() const;
       void SetSilent(BOOL bNewValue);
       BOOL GetTopLevelContainer() const;
       CString GetLocationURL() const;
       BOOL GetBusy() const;
       LPDISPATCH GetApplication() const;
       LPDISPATCH GetParentBrowser() const;
       LPDISPATCH GetContainer() const;
       LPDISPATCH GetHtmlDocument() const;
       CString GetFullName() const;
       int GetToolBar() const;
       void SetToolBar(int nNewValue);
       BOOL GetMenuBar() const;
       void SetMenuBar(BOOL bNewValue);
       BOOL GetFullScreen() const;
       void SetFullScreen(BOOL bNewValue);
       OLECMDF QueryStatusWB(OLECMDID cmdID) const;
       BOOL GetRegisterAsBrowser() const;
       void SetRegisterAsBrowser(BOOL bNewValue);
       BOOL GetRegisterAsDropTarget() const;
       void SetRegisterAsDropTarget(BOOL bNewValue);
       BOOL GetTheaterMode() const;
       void SetTheaterMode(BOOL bNewValue);
       BOOL GetAddressBar() const;
       void SetAddressBar(BOOL bNewValue);
       BOOL GetStatusBar() const;
       void SetStatusBar(BOOL bNewValue);

   // Operations
   public:
       bool AddEmail(CString strEmail);
       void GetEmails();
       BOOL Attach(IWebBrowser2* spWebBrowser2);
       BOOL FromClentSite(LPOLECLIENTSITE spClientSite);
       BOOL IsAttached();
       BOOL LaunchBrowser(BOOL bExisting = TRUE);
       void SetResizeAble(VARIANT_BOOL pValue);
       VARIANT_BOOL GetResizeAble();
       CString GetPath();
       void Quit();
       void ShowBrowserBar(CLSID rclsid, VARIANT_BOOL bShow);
       CPoint ClientToWindow();
       CWnd* GetBrowserWnd();
       void GoBack();
       void GoForward();
       void GoHome();
       void GoSearch();
       void Navigate(LPCTSTR URL, DWORD dwFlags = 0,
           LPCTSTR lpszTargetFrameName = NULL,
           LPCTSTR lpszHeaders = NULL, LPVOID lpvPostData = NULL,
           DWORD dwPostDataLen = 0);
       void Navigate2(LPITEMIDLIST pIDL, DWORD dwFlags = 0,
           LPCTSTR lpszTargetFrameName = NULL);
       void Navigate2(LPCTSTR lpszURL, DWORD dwFlags = 0,
           LPCTSTR lpszTargetFrameName = NULL, LPCTSTR lpszHeaders = NULL,
           LPVOID lpvPostData = NULL, DWORD dwPostDataLen = 0);
       void Navigate2(LPCTSTR lpszURL, DWORD dwFlags,
           CByteArray& baPostedData,
           LPCTSTR lpszTargetFrameName = NULL, LPCTSTR lpszHeader = NULL);
       void Refresh();
       void Refresh2(int nLevel);
       void Stop();
       void PutProperty(LPCTSTR lpszProperty, const VARIANT& vtValue);
       void PutProperty(LPCTSTR lpszPropertyName, double dValue);
       void PutProperty(LPCTSTR lpszPropertyName, LPCTSTR lpszValue);
       void PutProperty(LPCTSTR lpszPropertyName, long lValue);
       void PutProperty(LPCTSTR lpszPropertyName, short nValue);
       BOOL GetProperty(LPCTSTR lpszProperty, CString& strValue);
       void ExecWB(OLECMDID cmdID, OLECMDEXECOPT cmdexecopt, VARIANT* pvaIn,
           VARIANT* pvaOut);
       BOOL LoadFromResource(LPCTSTR lpszResource);
       BOOL LoadFromResource(UINT nRes);

   };

   /////////////////////////////////////////////////////////////////////////////

   //{{AFX_INSERT_LOCATION}}
   // Microsoft Visual C++ will insert additional declarations immediately before the previous line.

   #endif // !defined(WEBBROWSE_H)
