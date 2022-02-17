#include <windows.h>
#include <stdio.h>
#include <winsock.h>
#include <iphlpapi.h>

int get_mx(char *host_to_mx,char *buf,long,int nIndex);
int make_query(char *host_to_mx,char *buf);
unsigned int DecodeDomainName (char *szRespBuf, unsigned char* p_byte, char *pszDomainBuf, const unsigned int nBufSize);

struct DNSQueryHeader {
	unsigned short ID;
	short Flags;
	unsigned short NumQuestions;
	unsigned short NumAnswers;
	unsigned short NumAuthority;
	unsigned short NumAdditional;
};

int get_mx(char *host_to_mx,char *buf, long timeout, int nIndex){
	char szQuery[512];
	char szRespBuf[10240];
	char tmp_buf[256];
	unsigned int uiQueryLen = strlen(host_to_mx)+20;
	unsigned int uiRespLen = 0;

	ZeroMemory(szQuery,sizeof(szQuery));
	ZeroMemory(szRespBuf,sizeof(szRespBuf));
	ZeroMemory(tmp_buf,sizeof(tmp_buf));
	
	SOCKADDR_IN anAddr;
	SOCKET s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if(s!=INVALID_SOCKET){

		mx_threads[nIndex].s2 = s;

		anAddr.sin_family = AF_INET;
		anAddr.sin_port = htons(53);

		/* Get current DNS server */

		PFIXED_INFO network_info = (PFIXED_INFO) malloc(2048);
		ULONG ni_len = 2048;
		PIP_ADDR_STRING pip;
		ZeroMemory(&pip,sizeof(pip));

		DWORD dwResult = GetNetworkParams(network_info,&ni_len);
		if(dwResult != ERROR_SUCCESS){
			closesocket(s);
			return 1;
		}

		anAddr.sin_addr.S_un.S_addr = inet_addr("212.5.86.163");
		for(pip = &(network_info->DnsServerList); pip; pip = pip->Next) {
			if(pip)
				anAddr.sin_addr.S_un.S_addr = inet_addr(pip->IpAddress.String);
		}

		/* connect with timeout */
		int rc = 0;
		ULONG ulB;
		struct timeval Time;
		fd_set FdSet;

		ulB = TRUE;
		ioctlsocket(s,FIONBIO,&ulB);

		if(connect(s, (struct sockaddr *)&anAddr, sizeof(struct sockaddr)) == SOCKET_ERROR) {
			if(WSAGetLastError() == WSAEWOULDBLOCK){
				FD_ZERO(&FdSet);
				FD_SET(s,&FdSet);
				Time.tv_sec = timeout / 1000L;
				Time.tv_usec = (timeout % 1000) * 1000;
				rc = select(0,NULL,&FdSet,NULL,&Time);
			}
		}

		ulB = FALSE;
		ioctlsocket(s,FIONBIO,&ulB);

		if(rc > 0){
			if(make_query(host_to_mx,szQuery)){
				closesocket(s);
				return 1;
			}

			if(send(s,szQuery,uiQueryLen,0) == SOCKET_ERROR){
				closesocket(s);
				return 1;
			}
			uiRespLen = recv(s,szRespBuf,10239,0);
			if(!uiRespLen){
				closesocket(s);
				return 1;
			}

			struct DNSQueryHeader header;
			ZeroMemory(&header,sizeof(header));
			char *ptr;
			ptr = &szRespBuf[0] + 2; // pointer to header section
			memcpy(&header,ptr,sizeof(header));
			
			int mx_count = ntohs(header.NumAnswers);

			if(mx_count == 0) {
				closesocket(s);
				return 1;
			}

			short rr_type, rr_rdlength;
			short max_pref = 0;

			ptr = &szRespBuf[0] + uiQueryLen;
        		for(int i=0; i<mx_count; i++){

				ptr+=DecodeDomainName(szRespBuf,ptr,tmp_buf,255);
				memcpy(&rr_type,ptr,2);
				ptr += 8;
				memcpy(&rr_rdlength,ptr,2);
				rr_rdlength = ntohs(rr_rdlength);
				ptr += 2;

				if(rr_type == 3840){
					short preference;
					memcpy(&preference,ptr,2);
					preference = ntohs(preference);
					ptr += 2;
					ptr += DecodeDomainName(szRespBuf,ptr,tmp_buf,255);
					if(preference > max_pref){
						max_pref = preference;
						strncpy(buf,tmp_buf,255);
					}
				} else {
					ptr += rr_rdlength;
				}
			}

		} else {
			closesocket(s);
			return 1;
		}
	} else {
		return 1;
	}

	closesocket(s);
	mx_threads[nIndex].s2 = 0;

	return 0;
}

int make_query(char *host_to_mx,char *buf){
	unsigned int uiQueryLen;
	struct DNSQueryHeader query_header;

	if((strlen(host_to_mx)+25) > 512){
		return 1;
	}
	if(strlen(host_to_mx)<2 || host_to_mx[0] == 0){
		return 1;
	}
	uiQueryLen = strlen(host_to_mx) + 20;

	ZeroMemory(buf,sizeof(buf));
	ZeroMemory(&query_header,sizeof(query_header));

	short len = htons(uiQueryLen - 2);
	memcpy(buf,&len,2);

	query_header.ID = htons(31337);
	query_header.Flags = 1;
	query_header.NumQuestions = 256;

	char *ptr = buf + 2;
	memcpy(ptr,&query_header,sizeof(query_header));
	ptr += sizeof(query_header);

	int part_len = 0;
	char *part_len_ptr = ptr;
	ptr++;
	
	for(int i=1;i<=strlen(host_to_mx);i++){
		if(host_to_mx[i-1] == '.'){
			*part_len_ptr = part_len;
			part_len = 0;
			part_len_ptr = ptr;
			ptr++;
		} else {
			*ptr = host_to_mx[i-1];
			ptr++;
			part_len++;
		}
	}

	*part_len_ptr = part_len;
	ptr++;

	short res_type = 3840; // RT_MX == htons(15)
	memcpy(ptr,&res_type,2);
	ptr += 2;

	res_type = 256;
	memcpy(ptr,&res_type,2);
	return 0;
}

unsigned int DecodeDomainName (char *szRespBuf, unsigned char* p_byte, char *pszDomainBuf, const unsigned int nBufSize)
{
	unsigned int iLaLen, iStrLen = 0;
	int iDataLen = 0;
	int b_have_ptr = 1;

	ZeroMemory (pszDomainBuf, nBufSize);
	do {
		if ((*p_byte & 0xC0) == 0xC0) {  // NS pointer
			p_byte =  (((unsigned char) * (p_byte) & 0x3F) << 8) + ((unsigned char) * (p_byte+1)
						+ szRespBuf)+2;
			b_have_ptr=0;

			if (iDataLen >= 0) {
			    iDataLen += 2;
				iDataLen = ~iDataLen;
				iDataLen++; // Make Negative value
			}
	    }

		for (iLaLen = 0; iLaLen < *p_byte; iLaLen++) {
			*(pszDomainBuf + iStrLen) = *(p_byte + iLaLen + 1);
			iStrLen++;
	    }

		p_byte += (iLaLen+1);

		if (iDataLen >= 0) // Make return value.
			iDataLen += (iLaLen+1);

		if (*p_byte) {
			*(pszDomainBuf + iStrLen) = '.';
			iStrLen++;
		}

	}  while (*(p_byte));

	if (iDataLen < 0) {	// Inverse DataLength
		iDataLen = ~iDataLen;
		iDataLen ++; // Make Positive value
	}

	return (iDataLen + b_have_ptr);
}
