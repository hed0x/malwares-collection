.586P
.MODEL FLAT, STDCALL

extern ExitProcess    :PROC
extern _wsprintfA     :PROC
extern MessageBoxA    :PROC

.data

regsiters   dd  8 dup (0)

mb_cap  db  0
mb_fuk  db  'press ok to write again, cancel to exit',0
mb_text db  'register dump from exception',10,13
        db  'dr0 = %08xh',10,13
        db  'dr1 = %08xh',10,13
        db  'dr2 = %08xh',10,13
        db  'dr3 = %08xh',10,13
        db  'dr6 = %08xh',10,13
        db  'dr7 = %08xh',10,13
        db  'eip = %08xh',10,13,0

format_buffer   db 1000h dup (?)

.code

main:
    xor eax, eax
    dec eax
    setc al
    push offset except      ; set up exception handler
    push dword ptr fs:[eax] ; save old handler (handler 2 now..)
    mov fs:[eax], esp       ; update tib with handler address
exception1:
    div eax
;    mov [eax], eax          ; cause page fault.
    s_e1 equ $-exception1
    
    ;int 3

    push dword ptr [regsiters+24]
    push dword ptr [regsiters+20]
    push dword ptr [regsiters+16]
    push dword ptr [regsiters+12]
    push dword ptr [regsiters+8]
    push dword ptr [regsiters+4]
    push dword ptr [regsiters]
    push offset mb_text
    push offset format_buffer
    call _wsprintfA
    add esp, 7*4+8
    call MessageBoxA, 0, offset format_buffer, offset mb_cap, 1
    cmp eax, 1
    jz exception1

    pop dword ptr [fs:00]   ; restore old exception handler
    add esp, 4              ; fix stack
    ret                     ;)
    
except:
    ;int 3

    

    mov eax, [esp+4]    ; ptr to exception record
    mov edx, [eax+0ch]  ; edx = address exception happened
    mov eax, [eax]      ; eax = exception code ..
    
    ;mov ebx, [esp+8]    ; ptr to ERR structure
    ;mov ebx, [ebx+8]    ; safe place to return, given in ERR structure 

    mov ebx, [esp+0ch]  ; ptr to context structure
    
    jmp read_drx

write_drx:
    mov eax, 0  ;12345678h
    mov [ebx+4], eax
    mov [ebx+8], eax
    mov [ebx+12], eax
    mov [ebx+16], eax
    xor eax, eax
    mov [ebx+20], eax
    mov eax, 155h
    mov [ebx+24], eax
    
read_drx:
    pushad
    lea edi, regsiters
    lea esi, [ebx+4]
    mov ecx, 6
    repz movsd
    mov ecx, [ebx+0b8h]
    mov [edi], ecx
    popad
    

; update eax & eip in the context structure (which works)
    mov [ebx+0b0h], 'r!sc'  ; eax

    add dword ptr [ebx+0b8h],  s_e1  ; point eip in context structure to next instruction

    xor eax, eax
    ret
    
end main