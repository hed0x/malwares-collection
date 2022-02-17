%include "../inc/win32n.inc"

extern  _ExitProcess@4
extern  _GetTickCount@0
extern  _GetStdHandle@4
extern  _MessageBeep@4
extern  _WriteConsoleA@20

global _mainCRTStartup

SEGMENT .text USE32 class=code

_mainCRTStartup
    push    dword STD_OUTPUT_HANDLE ; get handle for stdout just for
    call    _GetStdHandle@4     ; debugging purposes... cos we're
    mov [stdout],eax        ; gonna write out addresses we trace

    xor ebx,ebx         ; set up Structured Exception Handler
    push    dword eh        ; address of our handler
    push    dword [fs:ebx]      ; save previous head of the list
    mov [fs:ebx],esp        ; prepend our handler to the list

;   call    _GetTickCount@0     ; for measuring execution speed
;   mov ebx,eax

    pushfd
    mov eax,esp         ; save ESP

    int3                ; transfer to ring-0

    mov ebx,cr3         ; prove it ;-)

    push    dword edx       ; GS
    push    dword edx       ; FS
    push    dword edx       ; ES
    push    dword edx       ; DS
    push    dword edx       ; SS
    push    eax         ; ESP
    push    dword [eax]     ; EFLAGS
    push    dword ecx       ; CS
    push    dword .wow      ; EIP
    iretd
.wow
    popfd
    call    printaddress

;   call    _GetTickCount@0     ; for measuring execution speed
;   sub eax,ebx
;   mov ebx,eax
;   call    printaddress

    pop dword [fs:0]        ; clean up SEH frame
    add esp,4

    push    dword MB_ICONASTERISK   ; bingo, we're done
    call    _MessageBeep@4

    push    dword 0
    call    _ExitProcess@4
;   retn

eh
    push    ebp         ; our handler, let's set up the stack
    mov ebp,esp         ; frame cos we're gonna access
    push    ebx         ; parameters passed on the stack
    push    ecx

    mov eax,[ebp+8]     ; let's see if it is stack unwinding
    test    dword [eax+4],6     ; should not be of course in our case
    jz  .cont           ; but one never knows
    push    dword 0
    push    dword written
    push    dword 2
    push    dword oi
    push    dword [stdout]
    call    _WriteConsoleA@20
    mov eax,1
    jmp .e

.cont
    mov ebx,[ebp+8]     ; check whether it was an
;   cmp dword [ebx],0x80000004  ; EXCEPTION_SINGLE_STEP or not
    mov eax,1           ; if not, terminate the application
;   cmp dword [ebx],0xC000001D  ; EXCEPTION_ILLEGAL_INSTRUCTION
;   cmp dword [ebx],0xC0000005  ; EXCEPTION_ACCESS_VIOLATION
    cmp dword [ebx],0x80000003  ; EXCEPTION_BREAKPOINT
    jne .e

    mov eax,[ebp+0x10]

    movzx   ecx,word [eax+CONTEXT.cx_SegCs]
    mov [eax+CONTEXT.cx_Ecx],ecx

    mov dword [eax+CONTEXT.cx_SegCs],0x28
;   mov     dword [eax+CONTEXT.cx_SegCs],0x08

    movzx   ecx, word [eax+CONTEXT.cx_SegSs]
    mov [eax+CONTEXT.cx_Edx],ecx

    mov dword [eax+CONTEXT.cx_SegSs],0x30
;   mov     dword [eax+CONTEXT.cx_SegSs],0x10

    or  dword [eax+CONTEXT.cx_EFlags],0x0200    ; CLI
    mov ebx,0x12345678
    call    printaddress
    mov eax,0

.e
    pop ecx         ; destroy stack frame and return
    pop ebx
    mov esp,ebp
    pop ebp
    retn

printaddress
    push    ecx         ; just a lame routine to print out
    push    edx         ; a hex address, no explanations ;-)

    xor ecx,ecx
.n
    rol ebx,4
    mov dl,bl
    and dl,0x0F
    cmp dl,0x9
    ja  .abcdef
    add dl,'0'
    jmp .a
.abcdef
    add dl,'A'-0xA
.a
    mov [ecx+address],dl
    inc cl
    cmp cl,8
    jne .n

    push    dword 0
    push    dword written
    push    dword 9
    push    dword address
    push    dword [stdout]
    call    _WriteConsoleA@20

    pop edx
    pop ecx
    retn

SEGMENT .data USE32 class=data

stdout  dd 0
onedot  db '.'
oi  db '!',0x0A
written dd 0
address db 0,1,2,3,4,5,6,7,0x0A
