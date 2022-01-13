
random_ax:              push    ebx
                        push    ebp
                        push    eax
                        call    get_base_ebp
                        mov     ebx, random_dword[ebp]
                        in      al, 40h
                        xor     bl, al
                        in      al, 40h
                        add     bh, al
                        in      al, 41h
                        sub     bl, al
                        in      al, 41h
                        xor     bh, al
                        in      al, 42h
                        add     bl, al
                        in      al, 42h
                        sub     bh, al
                        ror     ebx, 1
                        sub     ebx, 13
                        mov     random_dword[ebp], ebx
                        mov     [esp], bx
                        pop     eax
                        pop     ebp
                        pop     ebx
                        or      ax, ax
                        ret

random_eax:             call    random_ax
                        shl     eax, 16
                        call    random_ax
                        rol     eax, 19
                        or      eax, eax
                        ret

rnd_eax:                push    ecx
                        push    edx
                        xchg    ecx, eax
                        xor     edx, edx
                        jecxz   __1
                        xor     eax, eax
                        call    random_eax
                        div     ecx
__1:                    xchg    edx, eax
                        pop     edx
                        pop     ecx
                        ret

random_ax_pgp:          push    ebx
                        call    random_ax
                        and     ax, 1E1Eh
                        xchg    ebx, eax
                        call    random_ax
                        and     ax, 3F3Fh
                        add     ax, 2121h
                        add     eax, ebx
                        pop     ebx
                        ret
