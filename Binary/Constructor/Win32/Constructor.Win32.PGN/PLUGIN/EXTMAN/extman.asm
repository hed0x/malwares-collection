
HASH_SIZE               equ     262144          ; 256k for bitset, pwr of 2

include                 EXTMAN.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\FILEIO\fileio.inc
include                 ..\REGSCAN\regscan.inc
include                 ..\RECSERCH\recserch.inc
include                 ..\IFSHAN\ifshan.inc

                        extrn   Event:PROC

                        extrn   malloc:PROC
                        extrn   mfree:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

hash_ptr                dd      0

extman_info             extman_info_struc <?,offset ff,?,?>

ff                      ff_struc ?

curr_hash               dd      ?

                        .code


HandleEvent:            mov     eax, [esp+4]

                        cmp     eax, EV_RECSERCH_GOT_FILENAME   ; r3
                        je      __fname
                        cmp     eax, EV_REGSCAN_GOT_FILENAME    ; r3
                        je      __fname
                        cmp     eax, EV_IFSHAN_GOT_FILENAME     ; r0
                        je      __fname

__return_0:             xor     eax, eax
                        retn

__fname:
                        ; allocate hash-buffer if not allocated yet

                        cmp     hash_ptr, 0
                        jne     __alredy

                        push    HASH_SIZE
                        call    malloc

                        mov     hash_ptr, eax
__alredy:

                        ; try to find file
                        push    offset ff
                        push    dword ptr [esp+8]+4       ; fname ptr
                        callW   findfirst

                        ; not found?
                        or      eax, eax
                        jz      __return_0

                        ; close handle
                        push    eax
                        callW   findclose

                        ; fill some extman_info structure records

                        mov     edx, [esp+8]
                        mov     extman_info.ei_fnameptr, edx

                        ; calc hash from filename
                        call    calc_hash
                        mov     curr_hash, eax

                        ; set corresponding flag
                        mov     ecx, hash_ptr
                        bts     [ecx], eax
                        ; CF=previous value
                        setc    al
                        movzx   eax, al
                        mov     extman_info.ei_is_alredy, eax

                        ; extract extension
                        mov     edx, [esp+8]
__re:                   xor     ecx, ecx    ; ecx = extension, without '.'
__cycle:                mov     al, [edx]
                        inc     edx
                        cmp     al, '\'
                        je      __re
                        cmp     al, '.'
                        jne     __cont
                        mov     ecx, [edx]
__cont:                 or      al, al
                        jnz     __cycle
                        mov     extman_info.ei_ext, ecx

                        ; call event
                        push    offset extman_info
                        push    EV_EXTMAN_GOT_FILENAME
                        call    Event
                        add     esp, 8

                        ; -1 --> 1
                        and     eax, 1  ; return just called event's exitcode
                        retn

; input:  EDX = asciiz filename
; output: ECX = hash
; uses:   EAX

calc_hash:              xor     ecx, ecx
__cycle1:               mov     al, [edx]
                        or      al, al
                        jz      __done
                        xor     cl, al
                        mov     ah, 8
__cycle2:               ror     ecx, 1          ; modified crc32
                        jnc     __nc
                        xor     ecx, 0EDB88320h
__nc:                   dec     ah
                        jnz     __cycle2
                        inc     edx
                        jmp     __cycle1
__done:                 mov     eax, ecx
                        shr     ecx, 16 ; 11..21
                        xor     eax, ecx
                        and     eax, HASH_SIZE * 8 - 1
                        retn

  ; unload(int UT_xxx) -- called before deallocating plugin,
  ; or in case of updating with newer version

                        public  unload
unload:
                        push    hash_ptr
                        call    mfree

                        xor     eax, eax
                        retn

                        end
