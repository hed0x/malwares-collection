   SOCKADDR        struct
   sin_family  dw  0
   sin_port    dw  0
   sin_addr        dd      0
   sin_zero    db  8 dup(0)
   SOCKADDR        ends

   WSADATA     struct
   mVersion    dw  0
   mHighVersion    dw  0
   szDescription   db  257 dup(0)
   szSystemStatus  db  129 dup(0)
   iMaxSockets dw  0
   iMaxUpdDg   dw  0
   lpVendorInfo    dd  0
   WSADATA     ends

   VERSION1_0      equ     0100h
   VERSION1_1      equ     0101h
   VERSION2_0      equ     0200h

   AF_UNIX     equ 1
   AF_INET         equ     2
   AF_IMPLINK  equ 3
   AF_NETBIOS  equ 17

   SOCK_STREAM     equ     1
   SOCK_DGRAM      equ     2

   PCL_NONE        equ     0

   SOCKET_ERR      equ     -1
   SOCK_ERR      equ     -1

   HOSTENT_IP      equ     10h

   IPPROTO_TCP equ 6
   TCP_NODELAY equ 1
