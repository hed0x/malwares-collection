   // stdafx.h : include file for standard system include files,
   //  or project specific include files that are used frequently, but
   //      are changed infrequently
   //

   #if !defined(AFX_STDAFX_H__48D98CA6_1C85_11D1_8C74_006097821365__INCLUDED_)
   #define AFX_STDAFX_H__48D98CA6_1C85_11D1_8C74_006097821365__INCLUDED_

   #if _MSC_VER >= 1000
   #pragma once
   #endif // _MSC_VER >= 1000

   #define VC_EXTRALEAN        // Exclude rarely-used stuff from Windows headers

   #include <afxwin.h>         // MFC core and standard components
   #include <afxext.h>         // MFC extensions
   #include <afxdisp.h>
   #include <afxtempl.h>       // Template support (CArray)
   #include <afxmt.h>          // Synchronization
   #include <afxpriv.h>        // for AfxLoadString
   #include "winsock2.h"
   #include <afxsock.h>
   #ifndef _AFX_NO_AFXCMN_SUPPORT
   #include <afxcmn.h>         // MFC support for Windows Common Controls
   #endif // _AFX_NO_AFXCMN_SUPPORT

   #include <comdef.h>
   #include <assert.h>
   #include <crtdbg.h>
   #include <afxctl.h>
   #include "webbrowse.h"
   #include "objmodel.h"

   //Connect to Shell,Explorers/IEs
   #include <mshtml.h>
   #include <Shlwapi.h>
   #include <exdisp.h>
   #include <ShellApi.h>
   #include <Shlguid.h>
   #include <dispex.h>


   //{{AFX_INSERT_LOCATION}}
   // Microsoft Developer Studio insère des déclarations supplémentaires juste au-dessus de la ligne précédente.

   #endif // !defined(AFX_STDAFX_H__48D98CA6_1C85_11D1_8C74_006097821365__INCLUDED_)
