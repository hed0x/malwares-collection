   ; [Death Virii Crew] Presents
   ; CHAOS A.D. Vmag, Issue 2, Summer 1996                           file 007
   ;
   ;
   ;                         *à¨¬¥à ¨á¯®«ì§®¢ ¨ï AMBER.
   ;
   ;                                 (¥ ¢¨àãá)
   ;
   ;
   ;         *â  ¯à®£à ¬  £¥¥à¨â ®¤¨ § è¨äà®¢ ë© ä ©«, ª®â®àë© â®«ìª®
   ;         ¢ë¢®¤¨â áâà®çªã   íªà . * à ««¥«ì® - íâ® ¯à¨¬¥à ¢ë§®¢  ¨
   ;         ¨á¯®«ì§®¢ ¨ï. (” ©« £¥¥à¨âáï â®«ìª® ®¤¨ - ¢á¥£¤  ¡¥á¨«®,
   ;         ª®£¤  ¨å £¥¥à¨âáï á ¤¥áïâ®ª, ¢¯à®ç¥¬, ¯®¬¥ïâì - 5 á¥ªã¤)
   ;                           HŽ ‹…Hˆ‚Ž ;))))))))))))


   ;================================ à¥§ âì âãâ ============================
   .286
   .model tiny
   .code
   org 100h
   start:
   jmp start1
   mb dw 30 dup (0)
   start1:
   lea bx,mb

   mov [bx.OfsSource],offset beg
   mov [bx.SegSource],ds
   mov [bx.LenSource],all

   mov [bx.OfsCrypt],offset buf
   mov [bx.SegCrypt],ds
   mov [bx.StartIP],100h

   call phantom

   mov si,[bx.LenCrypt]

   mov ah,3ch
   mov cx,20h
   lea dx,fname
   int 21h
   jc er

   xchg ax,bx
   mov ah,40h
   lea dx,buf
   mov cx,si
   int 21h
   jc er
   mov ah,3eh
   int 21h
   jc er
   int 20h

   er:
   mov al,7
   int 29h
   int 20h

   fname db 'amb_ex1.com',0

   beg:
   call print
   db 'Hello everybody$'
   print:
   pop dx
   mov ah,9
   int 21h
   int 20h
   nop
   all equ $-beg

   include amber.asm

   buf:
   end start
   ;================================ à¥§ âì âãâ ============================


   ;                                        (c) by Reminder [DVC]
