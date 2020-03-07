   // EmailAdr.cpp: implementation of the CEmailAdr class.
   //
   //////////////////////////////////////////////////////////////////////

   #include "stdafx.h"
   #include "EmailAdr.h"


   #ifdef _DEBUG
   #undef THIS_FILE
   static char THIS_FILE[]=__FILE__;
   #define new DEBUG_NEW
   #endif

   //////////////////////////////////////////////////////////////////////
   // Construction/Destruction
   //////////////////////////////////////////////////////////////////////

   CEmailAdr::CEmailAdr()
   {
       m_Posted=false;
   }

   CEmailAdr::CEmailAdr(CEmailAdr& Mail)
   {
       m_Address=Mail.m_Address;
       m_Domain=Mail.m_Domain;
       m_UserName=Mail.m_UserName;
       m_Subject=Mail.m_Subject;
       m_Posted=Mail.m_Posted;
       m_MailServer=Mail.m_MailServer;
   }


   CEmailAdr::~CEmailAdr()
   {

   }

   void CEmailAdr::Set(CString Email)
   {
       if(Email.Left(7)!="mailto:") return;
       Email=Email.Mid(7);



       m_Address=Email;


   }



   const bool CEmailAdr::operator==(const CEmailAdr& CEmailAdrSrc)
   {
       return false;
   }

   const CEmailAdr& CEmailAdr::operator=(const CEmailAdr& CEmailAdrSrc)
   {
       m_Address=      CEmailAdrSrc.m_Address;
       m_Domain=       CEmailAdrSrc.m_Domain;
       m_UserName=     CEmailAdrSrc.m_UserName;
       m_Subject=      CEmailAdrSrc.m_Subject;
       m_Posted=       CEmailAdrSrc.m_Posted;
       m_MailServer=   CEmailAdrSrc.m_MailServer;

       return *this;
   }
