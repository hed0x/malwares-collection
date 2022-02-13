
; DEBUG -- win32 process debugger
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; DO NOT FORGET to write in soft-ice: 'i3here off' before launching tracer32

; syntax:
;   debug <program> [cmdline]

include                 ..\..\INCLUDE\consts.inc
include                 debug.inc

callW                   macro   x
                        extern  x:PROC
                        call    x
                        endm

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

error1msg               db      'error loading program',13,10
                        db      'syntax: DEBUG program [cmdline]',13,10,0

int3msg                 db      'int3 at ',0

include                 tracer.inc

c_mode                  dd      ?
imagebase               dd      ?
curhandle               dd      ?       ; current thread handle

; STARTUP_INFO
sinfo                   db      40h,0,0,0, 40h dup (?)

; PROCESS_INFO
pinfo                   label   dword
pinfo_phandle           dd      ?
pinfo_thandle           dd      ?
pinfo_pid               dd      ?
pinfo_tid               dd      ?

; DEBUG_EVENT
de                      label   byte
de_code                 dd      ?
de_pid                  dd      ?
de_tid                  dd      ?
de_data                 db      1024 dup (?)

t2h_id                  dd      256 dup (?)
t2h_handle              dd      256 dup (?)

buf                     db      8192 dup (?)

                        .code
start:
                        callW   GetCommandLineA
                        xchg    esi, eax
                        lodsb
                        cmp     al, '"'
                        je      __1
                        mov     al, 32
__1:                    mov     edi, esi
                        repnz
__2:                    scasb
                        cmp     byte ptr [edi], 32
                        je      __2

                        push    offset pinfo
                        push    offset sinfo
                        push    0
                        push    0
                        push    DEBUG_PROCESS+DEBUG_ONLY_THIS_PROCESS ; flags
                        push    0
                        push    0
                        push    0
                        push    edi     ; program+cmdline
                        push    0       ; program
                        callW   CreateProcessA
                        or      eax, eax
                        jz      __errorcmdline

                        push    SLE_WARNING
                        callW   SetDebugErrorLevel

__cycle:                push    -1
                        push    offset de
                        callW   WaitForDebugEvent
                        or      eax, eax
                        jz      __exit

                        mov     c_mode, DBG_EXCEPTION_NOT_HANDLED

                        cmp     de_code, CREATE_PROCESS_DEBUG_EVENT
                        jne     __skip0

                        mov     eax, de_tid              ; id
                        mov     ebx, de_data.dword ptr 8 ; handle
                        mov     curhandle, ebx
                        call    t2h_add

                        mov     eax, de_data.dword ptr 0Ch  ; imagebase
                        mov     imagebase, eax

__skip0:
                        cmp     de_code, CREATE_THREAD_DEBUG_EVENT
                        jne     __skip1

                        mov     eax, de_tid               ; id
                        mov     ebx, de_data.dword ptr 0  ; handle
                        call    t2h_add

__skip1:
                        cmp     de_code, EXIT_THREAD_DEBUG_EVENT
                        jne     __skip4

                        mov     eax, de_tid
                        call    t2h_del
__skip4:

                        cmp     de_code, EXCEPTION_DEBUG_EVENT
                        jne     __skip2

                        mov     eax, de_tid
                        call    t2h_convert
                        mov     curhandle, eax

                        mov     al, '('
                        call    dump_al
                        xchg    eax, ebx
                        call    dump_dec ; thread # (neither id nor handle)
                        mov     al, ')'
                        call    dump_al

                        cmp     de_data.dword ptr 0, EXCEPTION_BREAKPOINT
                        je      __my_except3
__skip2:
                        mov     eax, de_code
                        cmp     eax, OUTPUT_DEBUG_STRING_EVENT
                        je      __debugmsg
                        lea     esi, msgA
                        call    xmsg

                        cmp     de_code, EXIT_PROCESS_DEBUG_EVENT
                        je      __exit
                        cmp     de_code, RIP_EVENT
                        je      __exit

                        cmp     de_code, EXCEPTION_DEBUG_EVENT
                        je      __except

__continue:             push    c_mode  ; DBG_CONTINUE||DBG_EXCEPTION_NOT_HANDLED
                        push    de_tid
                        push    de_pid
                        callW   ContinueDebugEvent

                        jmp     __cycle

__exit:                 callW   GetLastError

                        push    -1
                        callW   ExitProcess

__errorcmdline:         lea     edx, error1msg
                        call    dump_asciiz_edx
                        jmp     __exit

__my_except3:
                        mov     esi, de_data.dword ptr 12
;                       cmp     esi, 77000000h  ; if KERNEL's INT 3 found
;                       ja      __skip_dump       ; do nothing

                        lea     edx, int3msg
                        call    dump_asciiz_edx
                        mov     eax, esi
                        call    dump_hexdword
                        call    dump_crlf

                        mov     c_mode, DBG_CONTINUE
                        jmp     __continue

__except:               lea     esi, msgB
                        mov     eax, de_data.dword ptr 0
                        call    xmsg

                        ; no matter what the fuck this exception means

                        jmp     __continue

__debugmsg:
                        mov     esi, de_data.dword ptr 0
                        call    get_buf
                        lea     edx, buf
                        call    dump_asciiz_edx

                        mov     c_mode, DBG_CONTINUE
                        jmp     __continue

; input: EAX=#
;        ESI=structure of the following format:
;          DD #/DD asciizptr
;          ...
;          DD 0,0
xmsg:                   xchg    edi, eax
                        lea     edx, msg_unk
__cycle:                mov     ecx, [esi+4]
                        jecxz   __dump
                        cmp     edi, [esi]
                        je      __found
                        add     esi, 8
                        jmp     __cycle
__found:                mov     edx, [esi+4]
__dump:                 call    dump_asciiz_edx
                        call    dump_crlf
                        retn

get_buf:                push    0
                        push    size buf
                        push    offset buf
                        push    esi
                        push    pinfo_phandle
                        callW   ReadProcessMemory
                        retn

; input: EAX=id
;        EBX=handle

t2h_add:                pusha
                        xor     ecx, ecx
                        inc     ecx
__cycle:                cmp     t2h_id[ecx*4], 0
                        je      __found
                        inc     cl
                        jnz     __cycle
                        popa
                        retn
__found:                mov     t2h_id[ecx*4], eax
                        mov     t2h_handle[ecx*4], ebx
                        popa
                        retn

; input: EAX=id

t2h_del:                pusha
                        xor     ecx, ecx
                        inc     ecx
__cycle:                cmp     t2h_id[ecx*4], eax
                        je      __found
                        inc     cl
                        jnz     __cycle
                        popa
                        retn
__found:                mov     t2h_id[ecx*4], 0
                        mov     t2h_handle[ecx*4], 0
                        popa
                        retn

; input: EAX=id
; output:EAX=handle
;        EBX=index

t2h_convert:            pusha
                        xor     ecx, ecx
                        inc     ecx
__cycle:                cmp     t2h_id[ecx*4], eax
                        je      __found
                        inc     cl
                        jnz     __cycle
                        xor     eax, eax
                        xor     ebx, ebx
__exit:                 mov     [esp].popa_eax, eax
                        mov     [esp].popa_ebx, ecx
                        popa
                        retn
__found:                mov     eax, t2h_handle[ecx*4]
                        jmp     __exit

include                 ..\..\INCLUDE\console.inc

                        end     start
