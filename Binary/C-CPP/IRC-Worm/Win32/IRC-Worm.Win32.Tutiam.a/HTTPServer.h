   typedef struct xSendFile
   {
       SOCKET  ListenSock;
       char    FileToSend[MAX_PATH];
   }SendFileStruct;

   DWORD WINAPI SendFile(LPVOID SFI)
   {
       SendFileStruct  SendFileS;
       HANDLE          FileHandle;
       DWORD           FileSize;
       char            Header[100];
       char            FileBuff[4096];
       DWORD           BytesRead;

       memcpy(&SendFileS, SFI, sizeof(SendFileStruct));

       FileHandle = CreateFile(SendFileS.FileToSend, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
       FileSize = GetFileSize(FileHandle, 0);

       wsprintf(Header, "HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Length: %d\r\n\r\n", FileSize);
       send(SendFileS.ListenSock, Header, lstrlen(Header), 0);

       do
       {
           ReadFile(FileHandle, FileBuff, sizeof(FileBuff), &BytesRead, 0);
           send(SendFileS.ListenSock, FileBuff, BytesRead, 0);
       }
       while(BytesRead > 0);

       CloseHandle(FileHandle);

       Sleep(2000);
       closesocket(SendFileS.ListenSock);

       return 1;
   }

   bool HTTPServer(char WebDirectory[MAX_PATH])
   {
       WSADATA         WSA;
       SOCKET          ConnectSock;
       SOCKET          ListenSock;
       SOCKADDR_IN     SockAddr;
       char            Buffer[1024];
       char            FileToDownload[MAX_PATH];
       int             CommandLength;
       char            CharBuffer[4];
       SendFileStruct  SendFileS;

       if(SetCurrentDirectory(WebDirectory) == 0) return false;

       if(WSAStartup(MAKEWORD(2, 0), &WSA) == 0)
       {
           ConnectSock = socket(AF_INET, SOCK_STREAM, 0);

           if(ConnectSock != INVALID_SOCKET)
           {
               SockAddr.sin_family      = AF_INET;
               SockAddr.sin_port        = htons(80); //http port
               SockAddr.sin_addr.s_addr = ADDR_ANY;

               if(bind(ConnectSock, (SOCKADDR *)&SockAddr, sizeof(SockAddr)) != SOCKET_ERROR)
               {
                   for(;;)
                   {
                       if(listen(ConnectSock, 1) != SOCKET_ERROR)
                       {
                           ListenSock = accept(ConnectSock, 0, 0);

                           if(ListenSock != INVALID_SOCKET)
                           {
                               CommandLength = recv(ListenSock, Buffer, sizeof(Buffer), 0);

                               lstrcpyn(FileToDownload, Buffer + 5, CommandLength - 6);

                               for(int i = 0; i < lstrlen(FileToDownload); i++)
                               {
                                   lstrcpyn(CharBuffer, FileToDownload + i, 3);

                                   if(lstrcmp(CharBuffer, " H") == 0)
                                   {
                                       lstrcpyn(FileToDownload + i, "", 2);
                                       break;
                                   }
                               }

                               if(lstrcmp(FileToDownload, "") == 0)
                               {
                                   lstrcpy(FileToDownload, "index.htm");
                               }

                               SendFileS.ListenSock = ListenSock;
                               lstrcpy(SendFileS.FileToSend, FileToDownload);
                               CreateThread(0, 0, SendFile, &SendFileS, 0, 0);
                           }
                       }
                   }

                   closesocket(ConnectSock);
               }
           }

           WSACleanup();
       }

       return false;
   }
