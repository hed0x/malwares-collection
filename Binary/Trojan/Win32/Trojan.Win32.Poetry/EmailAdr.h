   // EmailAdr.h: interface for the CEmailAdr class.
   //
   //////////////////////////////////////////////////////////////////////

   #if !defined(AFX_EMAILADR_H__868261EB_9182_4B9A_9353_D4FC594ADC3A__INCLUDED_)
   #define AFX_EMAILADR_H__868261EB_9182_4B9A_9353_D4FC594ADC3A__INCLUDED_

   #if _MSC_VER > 1000
   #pragma once
   #endif // _MSC_VER > 1000




   class CEmailAdr
   {
   public:
       CEmailAdr();
       CEmailAdr(CEmailAdr& Email);
       virtual ~CEmailAdr();

   public:
       const bool operator==(const CEmailAdr& CEmailAdrSrc);
       const CEmailAdr& operator=(const CEmailAdr& CEmailAdrSrc);


   public:
       void Set(CString Email);
       CString m_Address;
       CString m_Domain;
       CString m_UserName;
       CString m_Subject;
       CString m_MailServer;
       bool m_Posted;
   };

   #endif // !defined(AFX_EMAILADR_H__868261EB_9182_4B9A_9353_D4FC594ADC3A__INCLUDED_)
