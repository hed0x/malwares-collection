   GetUserName dd  0

   WSAStartup  dd  ?
   socket      dd  ?
   htons       dd  ?
   bind        dd  ?
   listen      dd  ?
   accept      dd  ?
   recv        dd  ?
   send        dd  ?
   closesocket dd  ?
   WSACleanup  dd  ?
   setsockopt  dd  ?
   connect     dd  ?
   ixnum   =   ($ - WSAStartup) shr 2

   wsadata     WSADATA <>
   sockaddr    SOCKADDR <>
   sock        dd  ?
   sock2       dd  ?

   dfile       db  260 dup (?)
   dlen        dd  ?

   fblock      db  Block dup (?)

   psi     dd  27 dup (?)
   pi  label
   hProcess    dd ?
   hTread      dd ?
   ProcessID   dd ?
   ThreadID    dd ?
   ClArea  equ $ - psi

   ExVer   dd  verl
       dd  ?
       dd  ?
       dd  ?
       dd  ?
       db  128 dup (?)
   verl    =   $ - ExVer

   CurDir      db  512 dup (?)
   FullName    db  512 dup (?)

   xFindData   label
   xdwFileAttributes   dd ?
   xftCreationTime     dq ?
   xftLastAccessTime   dq ?
   xftLastWriteTime    dq ?
   xnFileSizeHigh      dd ?
   xnFileSizeLow       dd ?
   xdwReserved0        dd ?
   xdwReserved1        dd ?
   xcFileName      db MAX_PATH dup (?)
   xAFile          db 14 dup (?)

   xFData  dd  ?
   cDir    db  512 dup (0)

   plugs   db  512 dup (0)
