   EXTRN ExitProcess:Proc
   EXTRN WSAStartup:Proc
   EXTRN socket:Proc
   EXTRN WSACleanup:Proc
   EXTRN closesocket:Proc
   EXTRN send:Proc
   EXTRN recv:Proc
   EXTRN bind:Proc
   EXTRN listen:Proc
   EXTRN accept:Proc
   EXTRN htons:Proc
   EXTRN connect:Proc
   EXTRN GlobalAlloc:Proc
   EXTRN GlobalFree:Proc
   EXTRN CreateThread:Proc
   EXTRN ExitThread:Proc
   EXTRN SetErrorMode:Proc

   SOCK_STREAM             EQU     1
   AF_INET                 EQU     2
   PROXY_PORT              EQU     9160
   SEM_NOGPFAULTERRORBOX   EQU     00000002h
   FIONREAD        EQU 4004667Fh

   WSADATA         struct

       mVersion          dw    0
       mHighVersion    dw  0
       szDescription   db  257 dup(0)
       szSystemStatus  db  129 dup(0)
       iMaxSockets dw  0
       iMaxUpdDg   dw  0
       lpVendorInfo    dd  0

   WSADATA         ends

   SOCKADDR_IN         struc

           sin_family dw AF_INET
           sin_port   dw 0
           sin_addr   dd 0
           sin_zero   db 8 dup(0)

   SOCKADDR_IN         ends

   THREADDATA      struc

       socket1     dd 0
       socket2     dd 0
       tmp_data_offset dd 0
       socket_struc    SOCKADDR_IN <>
       ErrorCounter    db 0
       ErrorCounter2   db 0
       threadid2   dd 0
          thread_argument2 dd 0

   THREADDATA      ends
