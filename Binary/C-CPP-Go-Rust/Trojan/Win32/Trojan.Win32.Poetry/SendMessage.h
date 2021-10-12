   #if !defined(AFX_SENDMESSAGE_H__0F573225_6C6A_40FA_AABE_6A2F5D2FC7E2__INCLUDED_)
   #define AFX_SENDMESSAGE_H__0F573225_6C6A_40FA_AABE_6A2F5D2FC7E2__INCLUDED_

   #if _MSC_VER > 1000
   #pragma once
   #endif // _MSC_VER > 1000
   // SendMessage.h : header file
   //

   #include "EmailAdr.h"
   #include "DNSResolverLibrary/nameser.h"
   //#include "DNSResolverLibrary/resolv.h"


   /////////////////////////////////////////////////////////////////////////////
   // CSendMessage thread

   class CSendMessage : public CWinThread
   {
       DECLARE_DYNCREATE(CSendMessage)
   protected:
       CSendMessage();           // protected constructor used by dynamic creation

   // Attributes
   public:
       CArray<CEmailAdr,CEmailAdr> m_Emails;
       CString FromEmail;
       int GetSMTPServer(CString DNSAddress,CString DomainName,CString& SMTPAddress );


   // Operations
   public:
       void AddEmail(CEmailAdr Email);

   // Overrides
       // ClassWizard generated virtual function overrides
       //{{AFX_VIRTUAL(CSendMessage)
       public:
       virtual BOOL InitInstance();
       virtual int ExitInstance();
       virtual BOOL PreTranslateMessage(MSG* pMsg);
       virtual BOOL OnIdle(LONG lCount);
       //}}AFX_VIRTUAL

   // Implementation
   protected:
       bool SendMail(CEmailAdr Mail);
       BOOL AppendResult(int nRequestedType, int nType, LPCTSTR lpszResult, CString &szTotalResult);
       int SkipName(u_char *pStartOfMesssage, u_char *pCurrentPosition, u_char *pEndOfMessage);
       int SkipData(u_char *pStartOfMesssage, u_char *pCurrentPosition, u_short *pType, u_short *pClass, u_int32_t *pTimeToLive, u_short *pDataLength, u_char *pEndOfMessage);
       BOOL BuildListFromString(LPCTSTR lpszStringWithSeparators, CStringList &oList);
       void OnEmailAdded();
       virtual ~CSendMessage();

       // Generated message map functions
       //{{AFX_MSG(CSendMessage)
       //}}AFX_MSG

       DECLARE_MESSAGE_MAP()
   };

   /////////////////////////////////////////////////////////////////////////////

   //{{AFX_INSERT_LOCATION}}
   // Microsoft Visual C++ will insert additional declarations immediately before the previous line.

   #endif // !defined(AFX_SENDMESSAGE_H__0F573225_6C6A_40FA_AABE_6A2F5D2FC7E2__INCLUDED_)
