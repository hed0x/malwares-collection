   ; UNCALL
   ; ~~~~~~
   ; - vxdcall restorator (FF 15 xxxxxxxx --> CD 20 aaaa bbbb)

   include                 INCLUDE\consts.inc

   include                 plugin.inc
                           PLUGIN_START    UNCALL, W9XR0, PERMUTABLE

   handleevent:            hookevent EV_UNCALL_RANGE, uncall_range
                           stc
                           retn

   uncall_range:           pusha
   __cycle:                call    uncall
                           inc     esi
                           loop    __cycle
                           popa
                           clc
                           retn

   ; subroutine: uncall
   ; action:     find perverted VxDcall (FF 15 nnnnnnnn) and replace it with
   ;             CD 20 xx xx yy yy
   ; input:      ESI = pointer to some 6 bytes in memory
   ; output:     none

   uncall:                 pusha

                           cmp     word ptr [esi], 15FFh  ; call far [xxxxxxxx]
                           jne     __exit

                           VMMcall GetDDBList

   __cycle:                or      eax, eax
                           jz      __exit

                           mov     ecx, [esi+2]    ; [xxxxxxxx]
                           sub     ecx, [eax+30h]  ; DDB_Service_Table_Ptr
                           shr     ecx, 1
                           jc      __cont
                           shr     ecx, 1
                           jc      __cont
                           cmp     ecx, [eax+34h]  ; # of services
                           jae     __cont

                           mov     edx, [eax+6-2]
                           mov     dx, cx

                           mov     word ptr [esi], 20CDh
                           mov     [esi+2], edx

   __exit:                 popa
                           retn

   __cont:                 mov     eax, [eax]  ; DDB_Next
                           jmp     __cycle

                           PLUGIN_END
