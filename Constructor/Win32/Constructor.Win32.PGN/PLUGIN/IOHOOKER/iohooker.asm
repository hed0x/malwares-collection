
include                 IOHOOKER.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\PLAN\PLAN.INC

                        extrn   Event:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

is_hooked               db      0

winsock                 db      'WSOCK32.DLL',0

szWSASetLastError       db      'WSASetLastError',0
addr_WSASetLastError    dd      ?

send_info:              dd      my_send
send_orig               dd      ?
send_bytes              db      6 dup (?)
                        db      'send',0

recv_info:              dd      my_recv
recv_orig               dd      ?
recv_bytes              db      6 dup (?)
                        db      'recv',0

connect_info:           dd      my_connect
connect_orig            dd      ?
connect_bytes           db      6 dup (?)
                        db      'connect',0

iohooker_recv_info:
stkframeptr             dd      ?
num_received            dd      ?

oldprot                 dd      ?

                        .code

HandleEvent:
                        cmp     dword ptr [esp+4], EV_PLAN_PER_PROCESS  ; event_id
                        jne     __return_0
                        cmp     dword ptr [esp+8], PLAN_WINSOCK
                        jne     __return_0

                        cmp     is_hooked, 0
                        jne     __return_0
                        mov     is_hooked, 1

                        call    install_hook

                        mov     eax, 1
                        retn

__return_0:             xor     eax, eax
                        retn

install_hook:           pusha
                        cld

                        push    offset winsock
                        callW   GetModuleHandleA
                        or      eax, eax
                        jz      __exit
                        xchg    ebx, eax

                        push    offset szWSASetLastError  ; proc name
                        push    ebx                       ; hmodule
                        callW   GetProcAddress
                        or      eax, eax
                        jz      __exit
                        mov     addr_WSASetLastError, eax

                        lea     edi, send_info
                        call    hook1
                        jz      __exit

                        lea     edi, recv_info
                        call    hook1
                        jz      __exit

                        lea     edi, connect_info
                        call    hook1
                        jz      __exit

                        call    hook_init

__exit:                 popa
                        retn

hook1:                  lea     eax, [edi+14]
                        push    eax                     ; proc name
                        push    ebx                     ; hmodule
                        callW   GetProcAddress
                        or      eax, eax
                        jz      __exit
                        xchg    esi, eax        ; ebx = proc address

                        mov     [edi+4], esi    ; orig

                        cmp     [esi].byte ptr 0, 68h
                        je      __exit          ; alredy???

                        push    offset oldprot
                        push    PAGE_EXECUTE_READWRITE
                        push    6               ; size
                        push    esi             ; addr
                        callW   VirtualProtect
                        or      eax, eax
                        jz      __exit

                        pusha
                        add     edi, 8          ; bytes
                        movsd
                        movsw
                        popa

                        or      esp, esp        ; NZ

__exit:                 retn

;----------------------------------------------------------------------------

hook_init:              pushf
                        pusha

                        lea     edi, send_info
                        call    hook2
                        lea     edi, recv_info
                        call    hook2
                        lea     edi, connect_info
                        call    hook2

                        popa
                        popf
                        retn

hook_done:              pushf
                        pusha

                        lea     edi, send_info
                        call    hook3
                        lea     edi, recv_info
                        call    hook3
                        lea     edi, connect_info
                        call    hook3

                        popa
                        popf
                        retn

hook2:                  mov     eax, [edi+4]    ; orig
                        mov     [eax].byte ptr 0, 68h
                        mov     ecx, [edi+0]    ; my addr
                        mov     [eax+1], ecx
                        mov     [eax].byte ptr 5, 0C3h
                        retn

hook3:                  mov     eax, [edi+4]    ; orig
                        mov     ecx, [edi+8]    ; bytes
                        mov     [eax], ecx
                        mov     cx, [edi+12]
                        mov     [eax+4], cx
                        retn

;----------------------------------------------------------------------------

my_send:                pushf
                        pusha
                        lea     eax, [esp+32+4+4]         ; stack frame ptr
                        ;;
                        push    eax
                        push    EV_IOHOOKER_ON_SEND
                        call    Event
                        add     esp, 8
                        ;;
                        popa
                        popf

                        call    hook_done

                        push    dword ptr [esp+16]+0
                        push    dword ptr [esp+12]+4
                        push    dword ptr [esp+8] +8
                        push    dword ptr [esp+4] +12
                        call    send_orig

                        call    hook_init

                        retn    4*4

;----------------------------------------------------------------------------

my_recv:                call    hook_done

                        push    dword ptr [esp+16]+0
                        push    dword ptr [esp+12]+4
                        push    dword ptr [esp+8] +8
                        push    dword ptr [esp+4] +12
                        call    recv_orig

                        call    hook_init

                        pushf
                        pusha
                        mov     num_received, eax
                        or      eax, eax; 0 bytes received
                        jz      __skip
                        inc     eax     ; -1=error
                        jz      __skip
                        lea     eax, [esp+32+4+4]      ; stack frame ptr
                        mov     stkframeptr, eax
                        ;;
                        push    offset iohooker_recv_info
                        push    EV_IOHOOKER_ON_RECV
                        call    Event
                        add     esp, 8
                        ;;
__skip:                 popa
                        popf

                        retn    4*4

;----------------------------------------------------------------------------

my_connect:             pushf
                        pusha
                        lea     eax, [esp+32+4+4]         ; stack frame ptr
                        ;;
                        push    eax
                        push    EV_IOHOOKER_ON_CONNECT
                        call    Event
                        add     esp, 8
                        ;;
                        ; event handled == deny connect()
                        or      eax, eax
                        jnz     fuckup_connect
                        popa
                        popf

                        call    hook_done

                        push    dword ptr [esp+12]+0
                        push    dword ptr [esp+8] +4
                        push    dword ptr [esp+4] +8
                        call    connect_orig

                        call    hook_init

                        retn    3*4

fuckup_connect:         push    10050           ; WSAENETDOWN
                        call    addr_WSASetLastError

                        popa
                        popf

                        mov     eax, -1         ; ERROR
                        retn    3*4

;----------------------------------------------------------------------------

                        end
