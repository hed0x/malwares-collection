   bool GetIP(char *IPAddress)
   {
       struct      hostent *Hostent;
       WSADATA     WSA;
       char        Hostname[100];
       UCHAR       UcAddr[4];
       char        LocalIP[8];
       HINTERNET   InternetHandle;
       HINTERNET   UrlHandle;
       char        CheckIpBuffer[106];
       char        IpBuffer[31];
       DWORD       BytesRead;
       char        TempChar[2];

       if(WSAStartup(MAKEWORD(2, 0), &WSA) == 0)
       {
           if(gethostname(Hostname, sizeof(Hostname)) != SOCKET_ERROR)
           {
               Hostent = gethostbyname(Hostname);

               if(Hostname != 0)
               {
                   for(int i = 0; Hostent->h_addr_list[i]; i++)
                   {
                       UcAddr[0] = Hostent->h_addr_list[i][0];
                       UcAddr[1] = Hostent->h_addr_list[i][1];
                       UcAddr[2] = Hostent->h_addr_list[i][2];
                       UcAddr[3] = Hostent->h_addr_list[i][3];

                       wsprintf(IPAddress, "%d.%d.%d.%d", UcAddr[0], UcAddr[1], UcAddr[2], UcAddr[3]);
                   }

                   lstrcpyn(LocalIP, IPAddress, 8);

                   if(lstrcmp(LocalIP, "192.168") == 0 || lstrcmp(LocalIP, "127.0.0") == 0)
                   {
                       return false;

                       //can't start http server on a machine in lan
                       //but following code shows how to get ip:
                       InternetHandle = InternetOpen("DiA/rrlf", 0, 0, 0, 0);

                       if(InternetHandle != 0)
                       {
                           UrlHandle = InternetOpenUrl(InternetHandle, "http://checkip.dyndns.org", 0, 0, INTERNET_FLAG_NEED_FILE, 0);

                           if(UrlHandle != 0)
                           {
                               if(InternetReadFile(UrlHandle, CheckIpBuffer, 106, &BytesRead) != 0)
                               {
                                   lstrcpyn(IpBuffer, CheckIpBuffer + 76, 31);

                                   for(i = 0; lstrcmp(TempChar, "<") != 0; i++)
                                   {
                                       lstrcpyn(TempChar, IpBuffer + i, 2);
                                   }

                                   lstrcpyn(IPAddress, IpBuffer, i);

                                   InternetCloseHandle(UrlHandle);
                                   InternetCloseHandle(InternetHandle);
                                   WSACleanup();
                                   return true;
                               }

                               InternetCloseHandle(UrlHandle);
                           }

                           InternetCloseHandle(InternetHandle);
                       }
                   }
                   else
                   {
                       WSACleanup();
                       return true;
                   }
               }
           }

           WSACleanup();
       }

       return false;
   }
