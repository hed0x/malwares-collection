   ; VxDcall RESTORING library
   ; (x) 2000 Z0MBiE, http://z0mbie.cjb.net

   ; *** WARNING ***:
   ; only 'FF 15 [xxxxxxxx]' far-calls will be restored;
   ; but some VxD calls are changing to 'MOV EBX, [nnnnnnnn]' and alike shit.

   ; subroutine: uncall_range
   ; action:     for each byte in specified range call 'uncall' subroutine
   ; input:      ESI = buffer
   ;             ECX = buffer size
   ; output:     none

   uncall_range:           pusha
   __cycle:                call    uncall
                           inc     esi
                           loop    __cycle
                           popa
                           ret

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
                           ret

   __cont:                 mov     eax, [eax]  ; DDB_Next
                           jmp     __cycle
