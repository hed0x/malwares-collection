   ; R0PROT
   ; ~~~~~~
   ; - protect r0 memory from ring3-access

   include                 INCLUDE\consts.inc
   include                 tsr.inc

   include                 plugin.inc
                           PLUGIN_START    R0PROT, W9XR0, PERMUTABLE

   handleevent:            hookevent EV_TSR_IN_NEW_ADDR, _prot
                           stc
                           retn

   ; input: EDI/ECX

   _prot:                  pusha

                           shr     edi, 12         ; addr
                           add     ecx, 4095
                           shr     ecx, 12         ; len

                           push    PC_STATIC                       ; OR_MASK
                           push    not (PC_WRITEABLE+PC_USER)      ; AND_MASK
                           push    ecx
                           push    edi

   ;                       VMMcall PageModifyPermissions
                           pusho   __retaddr
                           pop     esi
                           push    0E6FF0001h
                           push    013320CDh
                           jmp     esp
   __retaddr:
                           add     esp, 4*4 + 2*4

                           popa
                           stc
                           retn

                           PLUGIN_END
