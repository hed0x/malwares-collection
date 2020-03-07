   ; ALREDY
   ; ~~~~~~
   ; - r0 io-port handler

   include                 INCLUDE\consts.inc
   include                 tsr.inc

   include                 plugin.inc
                           PLUGIN_START    ALREDY, CODE32, PERMUTABLE

   handleevent:            hookevent EV_TSR_IS_ALREDY, _check
                           hookevent EV_TSR_IN_NEW_ADDR, _setup
                           stc
                           retn

   _check:                 pusha
                           mov     dx, C_PORT
                           in      al, dx
                           cmp     al, C_VALUE
                           popa
                           clc
                           retn

   _setup:                 pusha

                           pusho   iocallback
                           pop     esi
                           mov     edx, C_PORT

                           VMMcall Install_IO_Handler
   ;                       push    90C30001h
   ;                       push    009620CDh
   ;                       call    esp
   ;                       pop     ecx
   ;                       pop     ecx

                           popa
                           stc
                           retn

   ; io handler

   iocallback:             cmp     edx, C_PORT
                           jne     __exit
                           mov     al, C_VALUE
   __exit:                 retn

                           PLUGIN_END
