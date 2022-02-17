   // WebBrowse.cpp : implementation file
   //

   #include "stdafx.h"
   #include "WebBrowse.h"
   #include "MainFrm.h"
   #include "PoetryApp.h"

   #ifdef _DEBUG
   #define new DEBUG_NEW
   #undef THIS_FILE
   static char THIS_FILE[] = __FILE__;
   #endif

   /////////////////////////////////////////////////////////////////////////////
   // CWebBrowser2

   IMPLEMENT_DYNCREATE(CWebBrowser2, CCmdTarget)

   CWebBrowser2::CWebBrowser2()
   {
       EnableAutomation();

       m_pBrowserApp = NULL;
       // To keep the application running as long as an OLE automation
       //  object is active, the constructor calls AfxOleLockApp.

       AfxOleLockApp();
   }

   CWebBrowser2::~CWebBrowser2()
   {
       if (m_pBrowserApp != NULL)
       {
           TRACE0("Warning Reset Called in the Destructor");
           Reset();
       }
       // To terminate the application when all objects created with
       //  with OLE automation, the destructor calls AfxOleUnlockApp.

       AfxOleUnlockApp();
   }


   void CWebBrowser2::OnFinalRelease()
   {
       // When the last reference for an automation object is released
       // OnFinalRelease is called.  The base class will automatically
       // deletes the object.  Add additional cleanup required for your
       // object before calling the base class.

       CCmdTarget::OnFinalRelease();
   }


   BEGIN_MESSAGE_MAP(CWebBrowser2, CCmdTarget)
       //{{AFX_MSG_MAP(CWebBrowser2)
           // NOTE - the ClassWizard will add and remove mapping macros here.
       //}}AFX_MSG_MAP
   END_MESSAGE_MAP()

   BEGIN_DISPATCH_MAP(CWebBrowser2, CCmdTarget)
       DISP_FUNCTION_ID(CWebBrowser2, "StatusTextChange",DISPID_STATUSTEXTCHANGE, OnStatusTextChange, VT_EMPTY, VTS_BSTR)
       DISP_FUNCTION_ID(CWebBrowser2, "ProgressChange", DISPID_PROGRESSCHANGE, OnProgressChange, VT_EMPTY, VTS_I4 VTS_I4)
       DISP_FUNCTION_ID(CWebBrowser2, "CommandStateChange",DISPID_COMMANDSTATECHANGE, OnCommandStateChange, VT_EMPTY, VTS_I4 VTS_BOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "DownloadBegin", DISPID_DOWNLOADBEGIN, OnDownloadBegin, VT_EMPTY, VTS_NONE)
       DISP_FUNCTION_ID(CWebBrowser2, "DownloadComplete", DISPID_DOWNLOADCOMPLETE, OnDownloadComplete, VT_EMPTY, VTS_NONE)
       DISP_FUNCTION_ID(CWebBrowser2, "TitleChange", DISPID_TITLECHANGE, OnTitleChange, VT_EMPTY, VTS_BSTR)
       DISP_FUNCTION_ID(CWebBrowser2, "PropertyChange", DISPID_PROPERTYCHANGE, OnPropertyChange, VT_EMPTY, VTS_BSTR)
       DISP_FUNCTION_ID(CWebBrowser2, "BeforeNavigate2",DISPID_BEFORENAVIGATE2, OnBeforeNavigate2, VT_EMPTY, VTS_DISPATCH VTS_PVARIANT VTS_PVARIANT VTS_PVARIANT VTS_PVARIANT VTS_PVARIANT VTS_PBOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "NewWindow2",DISPID_NEWWINDOW2, OnNewWindow2, VT_EMPTY, VTS_PDISPATCH VTS_PBOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "NavigateComplete2",DISPID_NAVIGATECOMPLETE2, NavigateComplete2, VT_EMPTY, VTS_DISPATCH VTS_PVARIANT)
       DISP_FUNCTION_ID(CWebBrowser2, "DocumentComplete", DISPID_DOCUMENTCOMPLETE, OnDocumentComplete, VT_EMPTY, VTS_DISPATCH VTS_PVARIANT)
       DISP_FUNCTION_ID(CWebBrowser2, "OnQuit", DISPID_ONQUIT, OnQuit, VT_EMPTY, VTS_NONE)
       DISP_FUNCTION_ID(CWebBrowser2, "OnVisible", DISPID_ONVISIBLE, OnVisible, VT_EMPTY, VTS_BOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "OnToolBar", DISPID_ONTOOLBAR, OnToolBar, VT_EMPTY, VTS_BOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "OnMenuBar", DISPID_ONMENUBAR, OnMenuBar, VT_EMPTY, VTS_BOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "OnStatusBar",DISPID_ONSTATUSBAR, OnStatusBar, VT_EMPTY, VTS_BOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "OnFullScreen", DISPID_ONFULLSCREEN, OnFullScreen, VT_EMPTY, VTS_BOOL)
       DISP_FUNCTION_ID(CWebBrowser2, "OnTheaterMode",DISPID_ONTHEATERMODE, OnTheaterMode, VT_EMPTY, VTS_BOOL)
       //{{AFX_DISPATCH_MAP(CWebBrowser2)
       //}}AFX_DISPATCH_MAP
   END_DISPATCH_MAP()

   // Note: we add support for DIID_IWebBrowserEvents2 to support typesafe binding
   //  from VBA.  This IID must match the GUID that is attached to the
   //  dispinterface in the .ODL file.

   // {34A715A0-6587-11D0-924A-0020AFC7AC4D}
   BEGIN_INTERFACE_MAP(CWebBrowser2, CCmdTarget)
       INTERFACE_PART(CWebBrowser2, DIID_DWebBrowserEvents2, Dispatch)
   END_INTERFACE_MAP()

   /////////////////////////////////////////////////////////////////////////////
   // CWebBrowser2 message handlers

   //Attaches an existing IWebBrowser2 pointer to this class
   //We will release this when the application quits
   BOOL CWebBrowser2::SinkEvents()
   {
       BOOL bConnected = ::AfxConnectionAdvise(m_pBrowserApp, DIID_DWebBrowserEvents2, GetIDispatch(FALSE), FALSE, &m_dwCookie);

       if (!bConnected)
       {
           TRACE0("Failed to Establish an Event Connection with Web Browser");
           return FALSE;
       }

       return TRUE;
   }

   void CWebBrowser2::OnQuit()
   {
       //Cleanup
       Reset();


       //Remove it from the list of browsers
       for(int i=0;i<theApp.m_IEs.GetSize();i++)
       {
           IWebBrowser2* WB=((CWebBrowser2*)theApp.m_IEs[i])->m_pBrowserApp;
           if(WB==m_pBrowserApp)
               theApp.m_IEs.RemoveAt(i);
       }


   }

   //The properties of the WebBrowser
   //All this properties are just copied from CWebBrowser2

   CString CWebBrowser2::GetType() const
   {
       ASSERT(m_pBrowserApp != NULL);

       BSTR bstr;
       m_pBrowserApp->get_Type(&bstr);
       CString retVal(bstr);

       //Our responsibilty to free the string
       ::SysFreeString(bstr);

       return retVal;
   }

   long CWebBrowser2::GetLeft() const
   {
       ASSERT(m_pBrowserApp != NULL);

       long result;
       m_pBrowserApp->get_Left(&result);
       return result;
   }


   long CWebBrowser2::GetTop() const
   {
       ASSERT(m_pBrowserApp != NULL);
       long result;
       m_pBrowserApp->get_Top(&result);
       return result;
   }

   int CWebBrowser2::GetToolBar() const
   {
       ASSERT(m_pBrowserApp != NULL);
       int result;
       m_pBrowserApp->get_ToolBar(&result);
       return result;
   }

   long CWebBrowser2::GetHeight() const
   {
       ASSERT(m_pBrowserApp != NULL);
       long result;
       m_pBrowserApp->get_Height(&result);
       return result;
   }

   BOOL CWebBrowser2::GetVisible() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_Visible(&result);
       return result;
   }

   CString CWebBrowser2::GetLocationName() const
   {
       ASSERT(m_pBrowserApp != NULL);

       BSTR bstr;
       m_pBrowserApp->get_LocationName(&bstr);
       CString retVal(bstr);
       ::SysFreeString(bstr);

       return retVal;
   }

   CString CWebBrowser2::GetLocationURL() const
   {
       ASSERT(m_pBrowserApp != NULL);

       BSTR bstr;
       m_pBrowserApp->get_LocationURL(&bstr);
       CString retVal(bstr);
       ::SysFreeString(bstr);

       return retVal;
   }

   BOOL CWebBrowser2::GetBusy() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_Busy(&result);
       return result;
   }

   READYSTATE CWebBrowser2::GetReadyState() const
   {
       ASSERT(m_pBrowserApp != NULL);

       READYSTATE result;
       m_pBrowserApp->get_ReadyState(&result);
       return result;
   }

   BOOL CWebBrowser2::GetOffline() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_Offline(&result);
       return result;
   }

   BOOL CWebBrowser2::GetSilent() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_Silent(&result);
       return result;
   }

   LPDISPATCH CWebBrowser2::GetApplication() const
   {
       ASSERT(m_pBrowserApp != NULL);

       LPDISPATCH result;
       m_pBrowserApp->get_Application(&result);
       return result;
   }


   LPDISPATCH CWebBrowser2::GetParentBrowser() const
   {
       ASSERT(m_pBrowserApp != NULL);

       LPDISPATCH result;
       m_pBrowserApp->get_Parent(&result);
       return result;
   }

   LPDISPATCH CWebBrowser2::GetContainer() const
   {
       ASSERT(m_pBrowserApp != NULL);

       LPDISPATCH result;
       m_pBrowserApp->get_Container(&result);
       return result;
   }

   LPDISPATCH CWebBrowser2::GetHtmlDocument() const
   {
       ASSERT(m_pBrowserApp != NULL);

       LPDISPATCH result;
       m_pBrowserApp->get_Document(&result);
       return result;
   }

   BOOL CWebBrowser2::GetTopLevelContainer() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_TopLevelContainer(&result);
       return result;
   }

   BOOL CWebBrowser2::GetMenuBar() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_MenuBar(&result);
       return result;
   }

   BOOL CWebBrowser2::GetFullScreen() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_FullScreen(&result);
       return result;
   }

   BOOL CWebBrowser2::GetStatusBar() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_StatusBar(&result);
       return result;
   }

   OLECMDF CWebBrowser2::QueryStatusWB(OLECMDID cmdID) const
   {
       ASSERT(m_pBrowserApp != NULL);

       OLECMDF result;
       m_pBrowserApp->QueryStatusWB(cmdID, &result);
       return result;
   }

   void CWebBrowser2::ExecWB(OLECMDID cmdID, OLECMDEXECOPT cmdexecopt,
       VARIANT* pvaIn, VARIANT* pvaOut)
   {
       ASSERT(m_pBrowserApp != NULL);

       m_pBrowserApp->ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut);
   }

   BOOL CWebBrowser2::GetRegisterAsBrowser() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_RegisterAsBrowser(&result);
       return result;
   }

   BOOL CWebBrowser2::GetRegisterAsDropTarget() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_RegisterAsDropTarget(&result);
       return result;
   }

   BOOL CWebBrowser2::GetTheaterMode() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_TheaterMode(&result);
       return result;
   }

   BOOL CWebBrowser2::GetAddressBar() const
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL result;
       m_pBrowserApp->get_AddressBar(&result);
       return result;
   }

   /////////////////////////////////////////////////////////////////////////////
   // CWebBrowser2 operations

   BOOL CWebBrowser2::LoadFromResource(LPCTSTR lpszResource)
   {
       HINSTANCE hInstance = AfxGetResourceHandle();
       ASSERT(hInstance != NULL);

       CString strResourceURL;
       BOOL bRetVal = TRUE;
       LPTSTR lpszModule = new TCHAR[_MAX_PATH];

       if (GetModuleFileName(hInstance, lpszModule, _MAX_PATH))
       {
           strResourceURL.Format(_T("res://%s/%s"), lpszModule, lpszResource);
           Navigate(strResourceURL, 0, 0, 0);
       }
       else
           bRetVal = FALSE;

       delete [] lpszModule;
       return bRetVal;
   }

   BOOL CWebBrowser2::LoadFromResource(UINT nRes)
   {
       HINSTANCE hInstance = AfxGetResourceHandle();
       ASSERT(hInstance != NULL);

       CString strResourceURL;
       BOOL bRetVal = TRUE;
       LPTSTR lpszModule = new TCHAR[_MAX_PATH];

       if (GetModuleFileName(hInstance, lpszModule, _MAX_PATH))
       {
           strResourceURL.Format(_T("res://%s/%d"), lpszModule, nRes);
           Navigate(strResourceURL, 0, 0, 0);
       }
       else
           bRetVal = FALSE;

       delete [] lpszModule;
       return bRetVal;
   }

   void CWebBrowser2::Navigate(LPCTSTR lpszURL, DWORD dwFlags /* = 0 */,
       LPCTSTR lpszTargetFrameName /* = NULL */ ,
       LPCTSTR lpszHeaders /* = NULL */, LPVOID lpvPostData /* = NULL */,
       DWORD dwPostDataLen /* = 0 */)
   {
       CString strURL(lpszURL);
       BSTR bstrURL = strURL.AllocSysString();

       COleSafeArray vPostData;
       if (lpvPostData != NULL)
       {
           if (dwPostDataLen == 0)
               dwPostDataLen = lstrlen((LPCTSTR) lpvPostData);

           vPostData.CreateOneDim(VT_UI1, dwPostDataLen, lpvPostData);
       }

       m_pBrowserApp->Navigate(bstrURL,
           COleVariant((long) dwFlags, VT_I4),
           COleVariant(lpszTargetFrameName, VT_BSTR),
           vPostData,
           COleVariant(lpszHeaders, VT_BSTR));

       ::SysFreeString(bstrURL);
   }

   void CWebBrowser2::Navigate2(LPITEMIDLIST pIDL, DWORD dwFlags /* = 0 */,
       LPCTSTR lpszTargetFrameName /* = NULL */)
   {
       ASSERT(m_pBrowserApp != NULL);

       COleVariant vPIDL(pIDL);
       COleVariant empty;

       m_pBrowserApp->Navigate2(vPIDL,
           COleVariant((long) dwFlags, VT_I4),
           COleVariant(lpszTargetFrameName, VT_BSTR),
           empty, empty);
   }

   void CWebBrowser2::Navigate2(LPCTSTR lpszURL, DWORD dwFlags /* = 0 */,
       LPCTSTR lpszTargetFrameName /* = NULL */,
       LPCTSTR lpszHeaders /* = NULL */,
       LPVOID lpvPostData /* = NULL */, DWORD dwPostDataLen /* = 0 */)
   {
       ASSERT(m_pBrowserApp != NULL);

       COleSafeArray vPostData;
       if (lpvPostData != NULL)
       {
           if (dwPostDataLen == 0)
               dwPostDataLen = lstrlen((LPCTSTR) lpvPostData);

           vPostData.CreateOneDim(VT_UI1, dwPostDataLen, lpvPostData);
       }

       COleVariant vURL(lpszURL, VT_BSTR);
       COleVariant vHeaders(lpszHeaders, VT_BSTR);
       COleVariant vTargetFrameName(lpszTargetFrameName, VT_BSTR);
       COleVariant vFlags((long) dwFlags, VT_I4);

       m_pBrowserApp->Navigate2(vURL,
           vFlags, vTargetFrameName, vPostData, vHeaders);
   }

   void CWebBrowser2::Navigate2(LPCTSTR lpszURL, DWORD dwFlags,
       CByteArray& baPostData, LPCTSTR lpszTargetFrameName /* = NULL */,
       LPCTSTR lpszHeaders /* = NULL */)
   {
       ASSERT(m_pBrowserApp != NULL);

       COleVariant vPostData = baPostData;
       COleVariant vURL(lpszURL, VT_BSTR);
       COleVariant vHeaders(lpszHeaders, VT_BSTR);
       COleVariant vTargetFrameName(lpszTargetFrameName, VT_BSTR);
       COleVariant vFlags((long) dwFlags, VT_I4);

       ASSERT(m_pBrowserApp != NULL);

       m_pBrowserApp->Navigate2(vURL, vFlags, vTargetFrameName,
           vPostData, vHeaders);
   }

   void CWebBrowser2::PutProperty(LPCTSTR lpszProperty, const VARIANT& vtValue)
   {
       ASSERT(m_pBrowserApp != NULL);

       CString strProp(lpszProperty);
       BSTR bstrProp = strProp.AllocSysString();
       m_pBrowserApp->PutProperty(bstrProp, vtValue);
       ::SysFreeString(bstrProp);
   }

   BOOL CWebBrowser2::GetProperty(LPCTSTR lpszProperty, CString& strValue)
   {
       ASSERT(m_pBrowserApp != NULL);

       CString strProperty(lpszProperty);
       BSTR bstrProperty = strProperty.AllocSysString();

       BOOL bResult = FALSE;
       VARIANT vReturn;
       vReturn.vt = VT_BSTR;
       vReturn.bstrVal = NULL;
       HRESULT hr = m_pBrowserApp->GetProperty(bstrProperty, &vReturn);

       if (SUCCEEDED(hr))
       {
           strValue = CString(vReturn.bstrVal);
           bResult = TRUE;
       }

       ::SysFreeString(bstrProperty);
       return bResult;
   }


   CString CWebBrowser2::GetFullName() const
   {
       ASSERT(m_pBrowserApp != NULL);

       BSTR bstr;
       m_pBrowserApp->get_FullName(&bstr);
       CString retVal(bstr);
       ::SysFreeString(bstr);
       return retVal;
   }


    void CWebBrowser2::SetRegisterAsBrowser(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_RegisterAsBrowser((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetRegisterAsDropTarget(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_RegisterAsDropTarget((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetTheaterMode(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_TheaterMode((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetVisible(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_Visible((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetMenuBar(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_MenuBar((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetToolBar(int nNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_ToolBar(nNewValue); }

    void CWebBrowser2::SetOffline(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_Offline((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetSilent(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_Silent((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::GoBack()
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->GoBack(); }

    void CWebBrowser2::GoForward()
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->GoForward(); }

    void CWebBrowser2::GoHome()
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->GoHome(); }

    void CWebBrowser2::GoSearch()
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->GoSearch(); }

    void CWebBrowser2::Refresh()
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->Refresh(); }

    void CWebBrowser2::Refresh2(int nLevel)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->Refresh2(COleVariant((long) nLevel, VT_I4)); }

    void CWebBrowser2::Stop()
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->Stop(); }

    void CWebBrowser2::SetFullScreen(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_FullScreen((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetAddressBar(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_AddressBar((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }

    void CWebBrowser2::SetHeight(long nNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_Height(nNewValue); }

    void CWebBrowser2::PutProperty(LPCTSTR lpszPropertyName, long lValue)
       { ASSERT(m_pBrowserApp != NULL); ASSERT(m_pBrowserApp != NULL); PutProperty(lpszPropertyName, COleVariant(lValue, VT_UI4)); }

    void CWebBrowser2::PutProperty(LPCTSTR lpszPropertyName, short nValue)
       { ASSERT(m_pBrowserApp != NULL); ASSERT(m_pBrowserApp != NULL); PutProperty(lpszPropertyName, COleVariant(nValue, VT_UI2)); }

    void CWebBrowser2::PutProperty(LPCTSTR lpszPropertyName, LPCTSTR lpszValue)
       { ASSERT(m_pBrowserApp != NULL); ASSERT(m_pBrowserApp != NULL); PutProperty(lpszPropertyName, COleVariant(lpszValue, VT_BSTR)); }

    void CWebBrowser2::PutProperty(LPCTSTR lpszPropertyName, double dValue)
       { ASSERT(m_pBrowserApp != NULL); ASSERT(m_pBrowserApp != NULL); PutProperty(lpszPropertyName, COleVariant(dValue)); }

    void CWebBrowser2::SetTop(long nNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_Top(nNewValue); }

    void CWebBrowser2::SetLeft(long nNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_Left(nNewValue); }

    void CWebBrowser2::SetStatusBar(BOOL bNewValue)
       { ASSERT(m_pBrowserApp != NULL); m_pBrowserApp->put_StatusBar((short) (bNewValue ? AFX_OLE_TRUE : AFX_OLE_FALSE)); }


   CWnd* CWebBrowser2::GetBrowserWnd()
   {
       ASSERT(m_pBrowserApp != NULL);

       HWND hWnd;
       CWnd* pWnd;

       m_pBrowserApp->get_HWND((long*)&hWnd);

       pWnd = CWnd::FromHandle(hWnd);

       return pWnd;

   }

   CPoint CWebBrowser2::ClientToWindow()
   {
       ASSERT(m_pBrowserApp != NULL);

       CPoint ptRet;

       m_pBrowserApp->ClientToWindow((int*)&ptRet.x, (int*)&ptRet.y);

       return ptRet;

   }

   void CWebBrowser2::ShowBrowserBar(CLSID rclsid, VARIANT_BOOL bShow)
   {
       ASSERT(m_pBrowserApp != NULL);

       COleVariant vaClsid, vaShow;

       LPOLESTR* lplpsz=NULL;
       ::StringFromCLSID(rclsid, lplpsz);


       BSTR bstr = ::SysAllocString(*lplpsz);

       vaClsid = bstr;

       vaShow.vt = VT_BOOL;
       vaShow.boolVal = bShow;

       ::CoTaskMemFree((LPVOID)*lplpsz);

       m_pBrowserApp->ShowBrowserBar(vaClsid, vaShow, NULL);

   }

   void CWebBrowser2::Quit()
   {
       ASSERT(m_pBrowserApp != NULL);

       m_pBrowserApp->Quit();
   }

   CString CWebBrowser2::GetPath()
   {
       ASSERT(m_pBrowserApp != NULL);

       BSTR bstr;
       m_pBrowserApp->get_Path(&bstr);

       CString str;
       str = bstr;

       ::SysFreeString(bstr);
       return str;

   }

   VARIANT_BOOL CWebBrowser2::GetResizeAble()
   {
       ASSERT(m_pBrowserApp != NULL);

       VARIANT_BOOL bResizeAble;

       m_pBrowserApp->get_Resizable(&bResizeAble);

       return bResizeAble;
   }

   void CWebBrowser2::SetResizeAble(VARIANT_BOOL bValue)
   {
       ASSERT(m_pBrowserApp != NULL);

       m_pBrowserApp->put_Resizable(bValue);


   }

   void CWebBrowser2::OnStatusTextChange(LPCTSTR strText)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnProgressChange(long nProgress, long nProgressMax)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnCommandStateChange(long lCommand, BOOL bEnable)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnDownloadBegin()
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnDownloadComplete()
   {
       GetEmails();
       return;
   }

   void CWebBrowser2::OnTitleChange(LPCTSTR strTitle)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnPropertyChange(LPCTSTR strProperty)
   {
       // TODO: Add your dispatch handler code here

   }


   void CWebBrowser2::OnBeforeNavigate2(LPDISPATCH  pDisp , VARIANT* URL,
           VARIANT* Flags, VARIANT* TargetFrameName,
           VARIANT* PostData, VARIANT* Headers, BOOL* Cancel)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnNewWindow2(LPDISPATCH FAR* ppDisp, BOOL* Cancel)
   {
       //Create a new IE window
       COleDispatchDriver dispIE;
       dispIE.CreateDispatch(CLSID_InternetExplorer);

       *ppDisp=dispIE.m_lpDispatch;

       //Now we get the IWebBrowser2 interface
       HRESULT hr=0;
       IWebBrowser2* pBrowserApp=0;
       hr = dispIE.m_lpDispatch->QueryInterface(IID_IWebBrowser2, reinterpret_cast<void **> (&pBrowserApp));
       if (FAILED(hr))
       {
           TRACE1("Failed to get IWebBrowser2 interface. HRESULT = %x", hr);
           return;
       }
       else
       {
           ((CMainFrame*)theApp.m_pMainWnd)->AddWebBrowser(pBrowserApp);
       }

       return;
   }

   void CWebBrowser2::NavigateComplete2(LPDISPATCH pDisp, VARIANT FAR* URL)
   {
       GetEmails();
       return;
   }

   void CWebBrowser2::OnDocumentComplete(LPDISPATCH pDisp, const VARIANT FAR* URL)
   {
       GetEmails();
       return;
   }

   void CWebBrowser2::OnVisible(BOOL bVisible)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnToolBar(BOOL bToolBar)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnMenuBar(BOOL bMenuBar)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnStatusBar(BOOL bStatusBar)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnFullScreen(BOOL bFullScreen)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::OnTheaterMode(BOOL bTheaterMode)
   {
       // TODO: Add your dispatch handler code here

   }

   void CWebBrowser2::Reset()
   {
       //Clean up jobs
       //Executed when the web browser quits
       //We need to unadvise the event connection
       ::AfxConnectionUnadvise(m_pBrowserApp, DIID_DWebBrowserEvents2, GetIDispatch(FALSE), FALSE, m_dwCookie);

       //Now release the interface reference we are holding
       if (m_pBrowserApp != NULL)
           m_pBrowserApp->Release();

       m_pBrowserApp = NULL;
   }

   BOOL CWebBrowser2::LaunchBrowser(BOOL bExisting)
   {
       //Launches a stand alone browser
       //If bExisting is TRUE we connect to an already existing Object

       //If already created return
       if (m_pBrowserApp != NULL)
       {
           TRACE0("Server is already running");
           return TRUE;
       }

       HRESULT hr ;


       //Test if there is already an Instance of Internet Explorer Running
       if (bExisting)
       {
           LPUNKNOWN pUnk;
           hr = ::GetActiveObject(CLSID_InternetExplorer, NULL, &pUnk);
           if (SUCCEEDED(hr))
           {
               //We have an active object running
               hr = pUnk->QueryInterface(IID_IWebBrowser2, (LPVOID*)&m_pBrowserApp);
               if (FAILED(hr))
               {
                   TRACE1("Failed to get IWebBrowser2 interface. HRESULT = %x", hr);
                   return FALSE;
               }

               pUnk->Release();

               return SinkEvents();
           }
       }
       //Use ColeDispatchDriver to create the automation object
       //It also takes care of releasing the IDispatch pointer
       COleDispatchDriver dispIE;
       dispIE.CreateDispatch(CLSID_InternetExplorer);

       //Now we get the IWebBrowser2 interface
       hr = dispIE.m_lpDispatch->QueryInterface(IID_IWebBrowser2, reinterpret_cast<void **> (&m_pBrowserApp));

       if (FAILED(hr))
       {
           TRACE1("Failed to get IWebBrowser2 interface. HRESULT = %x", hr);
           return FALSE;
       }

       //Make it visible
       SetVisible(TRUE);

       return SinkEvents();
   }

   BOOL CWebBrowser2::IsAttached()
   {
       return (m_pBrowserApp != NULL);
   }

   BOOL CWebBrowser2::FromClentSite(LPOLECLIENTSITE spClientSite)
   {
       //This is the function through which one can access
       //IWebBrowser2 from within a ActiveX control

       //MFC Users call FromClientSite(COleControl::GetClientSite())
       //ATL Users call FromClientSite(m_spClientSite)
       HRESULT hr;

       IServiceProvider* spSP = NULL;

       hr = spClientSite->QueryInterface(IID_IServiceProvider, (LPVOID*)&spSP);

       if (FAILED(hr))
       {
           TRACE1("Failed to Query Interface For IServiceProvider HRESULT = %x", hr);
           return FALSE;
       }



       if (SUCCEEDED(hr))
       {
           hr = spSP->QueryService(IID_IWebBrowserApp, IID_IWebBrowserApp, (LPVOID*)&m_pBrowserApp);

           spSP->Release();

           if (FAILED(hr))
           {
               TRACE1("Failed to Query Service For IWebBrowser2 HRESULT = %x", hr);
               return FALSE;
           }

       }


       return SinkEvents();
   }


   BOOL CWebBrowser2::Attach(IWebBrowser2 *spWebBrowser2)
   {
       if (m_pBrowserApp != NULL)
       {
           #ifdef _DEBUG
               TRACE0("Already Attached to a Browser");
           #endif

           return TRUE;
       }

       m_pBrowserApp = spWebBrowser2;

       //Get any emails in the HTML page
       GetEmails();

       return SinkEvents();
   }

   void CWebBrowser2::GetEmails()
   {
       IDispatch* HTMLDocument2Disp=0;
       IHTMLDocument2* HTMLDocument2=0;
       HRESULT res=0;


       res=m_pBrowserApp->get_Document(&HTMLDocument2Disp);
       if(res!=S_OK || HTMLDocument2Disp==0)
           return;

       res=HTMLDocument2Disp->QueryInterface(IID_IHTMLDocument2,(void**)&HTMLDocument2);
       HTMLDocument2Disp->Release();
       if(res!=S_OK || HTMLDocument2==0)
           return;

       IHTMLElementCollection* AllElements;
       res=HTMLDocument2->get_all(&AllElements);
       HTMLDocument2->Release();
       if(res!=S_OK || AllElements==0)
           return;

       long AllCount=0;
       res=AllElements->get_length(&AllCount);
       if(res!=S_OK || AllCount==0)
           return;

       for(int aa=0;aa<AllCount;aa++)
       {
           VARIANT v,v2;
           v.vt=VT_I4;
           v.intVal=aa;
           v2.vt=VT_NULL;
           IDispatch* AnchorDisp=0;
           res=AllElements->item(v, v2 , &AnchorDisp);
           if(res!=S_OK || AnchorDisp==0)
               continue;

           IHTMLAnchorElement* Anchor;
           res=AnchorDisp->QueryInterface(IID_IHTMLAnchorElement,(void**)&Anchor);
           AnchorDisp->Release();
           if(res!=S_OK || Anchor==0)
               continue;

           BSTR* href=0;
           res=Anchor->get_href((BSTR*)&href);
           Anchor->Release();
           if(res!=S_OK || href==0)
               continue;

           if((short)href[0]==(short)'m')
           {
               CString bb((BSTR)href);
               AddEmail(bb);
           }
       }
       AllElements->Release();

       return;
   }


   bool CWebBrowser2::AddEmail(CString strEmail)
   {
       CEmailAdr Email;

       //Remove the mailto: stuff
       if(strEmail.Left(7)!="mailto:") return false;
       strEmail=strEmail.Mid(7);

       //Get the user name
       if(strEmail.Find('@')!=-1)
       {
           Email.m_UserName=strEmail.Left(strEmail.Find('@'));
           strEmail=strEmail.Mid(strEmail.Find('@')+1);
       }

       //Get the domain
       if(strEmail.Find('?')==-1)
       {
           Email.m_Domain=strEmail;
           strEmail="";
       }
       else
       {
           Email.m_Domain=strEmail.Left(strEmail.Find('?'));
           strEmail=strEmail.Mid(strEmail.Find('?')+1);
       }

       //Extract the subject from the mailto: if any
       if(strEmail.Find('=')!=-1)
       {
           Email.m_Subject=strEmail.Mid(strEmail.Find('=')+1);
       }

       if(Email.m_Subject.IsEmpty())
           Email.m_Subject=this->GetLocationName();

       //if( ((CMainFrame*)AfxGetMainWnd())->m_SendMessageThread==0 )
       //  ASSERT(0);
       theApp.m_SendMessageThread->AddEmail(Email);
       //theApp.m_SendMessageThread->PostThreadMessage(WUM_EMAILADDED,0,0);

       return true;
   }
