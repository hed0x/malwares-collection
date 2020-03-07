   ;
   ;      WSocks.inc: include file for windows sockets .
   ;      Designed for TASM5 and Win32.
   ;
   ;      (C) 1999 Bumblebee.
   ;
   ;       This file contains basic structures and stuff to work
   ;       with windows sockets.
   ;

   ; Descriptions of the API:
   ;  arguments in order of PUSH ;)

   ; only for debug
   extrn   WSAGetLastError:PROC

   ; starts the use of winsock dll
   ; addr WSADATA, version requested
   ; returns: 0 ok
   extrn   WSAStartup:PROC

   ; terminates the use of winsock dll
   ; returns: SOCK_ERR on error
   extrn   WSACleanup:PROC

   ; opens a new socket
   ; protocol (PCL_NONE), type (SOCK_??), addr format (AF_??)
   ; returns: socket id or SOCKET_ERR (socket is dw)
   extrn   socket:PROC

   ; closes a socket
   ; socket descriptor
   ;
   extrn   closesocket:PROC

   ; sends data (this socks are a shit... Unix uses simple write)
   ; flags (1  OOB data or 0 normal ) , length, addr of buffer, socket
   ; returns: caracters sent or SOCKET_ERR on error
   extrn   send:PROC

   ; reveives data (this socks are a shit... Unix uses simple read)
   ; flags (use 0), length, addr of buffer, socket
   ; returns: caracters sent or SOCKET_ERR on error
   extrn   recv:PROC

   ; connects to a server
   ; sizeof struct SOCKADDR, struct SOCKADDR, socket
   ; returns: SOCKET_ERR on error
   extrn   connect:PROC

   ; gets the name of the current host
   ; length of the buffer for name, addr of buffer for name
   ; return: SOCKET_ERR on error
   extrn   gethostname:PROC

   ; gets strcut hostent
   ; addr of name
   ; returns: ponter to the struct or 0 on error
   extrn   gethostbyname:PROC

   ; converts a zstring like "xxx.xxx.xx...." to netw byte order
   ; zstring ptr to change to dotted addr format
   ; returns: in_addr (dd)
   extrn   inet_addr:PROC

   ; dw to convert into netw byte order (usually the port)
   ; returns: the value in network byte order (dw)
   extrn   htons:PROC

   ; Structs :o

   ; sockaddr struct for connection
   ; modified (for better use)
   ; if you want the original look for it into a winsock.h
   SOCKADDR        struct
   sin_family  dw  0   ; ex. AF_INET
   sin_port    dw  0   ; use htons for this
   sin_addr        dd      0       ; here goes server node (from inet_addr)
   sin_zero    db  8 dup(0)
   SOCKADDR        ends

   ; for WSAStartup diagnose
   WSADATA     struct
   mVersion    dw  0
   mHighVersion    dw  0
   szDescription   db  257 dup(0)
   szSystemStatus  db  129 dup(0)
   iMaxSockets dw  0
   iMaxUpdDg   dw  0
   lpVendorInfo    dd  0
   WSADATA     ends

   ; Some nice equs

   ; what version of winsock do you need? (usually 1.1)
   VERSION1_0      equ     0100h
   VERSION1_1      equ     0101h
   VERSION2_0      equ     0200h

   AF_UNIX     equ 1   ; local host
   AF_INET         equ     2       ; internet (most used)
   AF_IMPLINK  equ 3   ; arpanet
   AF_NETBIOS  equ 17  ; NetBios style addresses

   ; types of sockets
   SOCK_STREAM     equ     1       ; stream (connection oriented; telnet like)
   SOCK_DGRAM      equ     2       ; datagram (packets, packets, packets)

   ; protocol
   PCL_NONE        equ     0       ; none (define the protocol not needed)

   SOCKET_ERR      equ     -1      ; standard winsock error

   HOSTENT_IP      equ     10h     ; where is the IP into the hostent
