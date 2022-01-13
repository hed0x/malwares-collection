; детектирования LME декриптора
;
; кто сделает лучше ?

locals __
.model tiny
.code
org 100h
start:
     lea dx, msg
     mov ah, 9
     int 21h
     lea dx, file
     mov si, dx
__k:
     lodsb
     cmp al, 0
     jz __l 
     int 29h
     jmp __k
msg  db 'программа проверки на LME',0dh,0ah
     db 'на диске должен быть файл lme.tst',0dh,0ah
     db 'результат не 100%, а вы что хотeли?',0dh,0ah,'$'
__l:
     mov al, ' '
     int 29h
     mov ax, 3DC0h
     int 21h
     xchg ax, bx
     lea dx, merlin
     mov cx, 2
     mov ah, 3Fh
     int 21h
     mov si, dx
     mov ax, 4200h
     xor cx, cx
     cwd
     int 21h 
     lodsw
     cmp ax, 'ZM'
     jnz __4
     mov ax, 4200h
     xor cx, cx
     mov dx, 20h
     int 21h 
__4:
     lea dx, merlin
     mov cx, 2000
     mov ah, 3Fh
     int 21h
     mov ah, 3eh
     int 21h
     lea si, merlin
     call check_merlin
     cmp 1 ptr _anti, 1
     jnz __1
     cmp 1 ptr _antix, 1
     jnz __1
     cmp 1 ptr _decr, 1
     jnz __1
     cmp 1 ptr _inc, 1
     jnz __1
     cmp 1 ptr _loop, 1
     jnz __1
     cmp 1 ptr _cmp, 1
     jnz __1 
     lea dx, msg1
     mov ah, 9
     int 21h
     ret 
__1:
     lea dx, msg2
     mov ah, 9
     int 21h
     ret

file db 'lme.tst',0

msg0 db 'file $'
msg1 db '- find LordDarkMutationEngine!',0dh,0ah,'$'
msg2 db '- OK',0dh,0ah,'$'

check_merlin:
    ; si - ofs
__1:
    lodsb
    cmp si, offset merlin+2000
    ja __2
    call is_garbage
    jnc __1
    call check_fishka
    jnc __1
__2:
    ret

check_fishka:
    mov ax, [si-1]
    cmp ax, 1234h
    org $-2
    out  64h, al
    jnz __2
    lodsb 
    ret 
__2:
    cmp ax, 0786h
    jnz __3
__5:
    mov 1 ptr _anti, 1
    lodsb 
    ret 
__3:
    cmp ax, 0788h
    jz  __5
    mov al, [si-1]
    cmp al, 10000001b
    jnz __6
    mov al, [si]
    and al, 0F0h
    cmp al, 0F0h
    jnz __p
    mov 1 ptr _cmp, 1
    lodsb
    lodsw
    clc  
    ret
__p:
    mov 1 ptr _decr, 1
    lodsb
    lodsw
    lodsw
    clc
    ret 
__6:
    cmp al, 74h
    jnz __7
__8:
    mov 1 ptr _loop, 1
    lodsb
    clc
    ret
__7:
    cmp al, 75h
    jz __8
    and al, not 111b
    cmp al, 40h
    jnz __9
    mov 1 ptr _inc, 1
    clc
    ret
__9:
    stc
    ret

_anti  db 0
_antix db 0
_decr  db 0
_loop  db 0
_inc   db 0
_cmp   db 0

is_garbage proc
    push ax
    call check_one
    pop ax
    jc  __2
__3: 
    ret
__2: 
    push ax
    call check_osn
    pop ax
    jnc __3
    cmp al, 0E8h
    jnz __1
__7:   
    lodsw
    clc 
    ret 
__1:
    cmp al, 0E9h
    jz  __7
    cmp 2 ptr [si-1], 021CDh
    jnz __4
    lodsb
    clc
    ret 
__4:
    cmp al, 08Dh
    jnz __5
    lodsb
    lodsw
    clc
    ret 
__5:
    cmp al, 35h
    jnz __8
    lodsw 
    clc
    ret 
__8: 
    and al, not 111b
    cmp al, 0B8h
    jnz __6
    lodsw
    clc
    ret
__6:
    cmp 2 ptr [si-1], 20CDh
    jz  __e
    cmp 2 ptr [si-1], 4CB4h
    jnz __x4
__e:
    mov 1 ptr _antix, 1
    lodsb
    ret 
__x4:
    cmp al, 0B0h
    jnz __x7
    lodsb
    clc
    ret
__x7:  
    stc 
    ret  
    endp

check_osn proc
    push si
    call __1
    db 10001010b
    db 00000010b
    db 00010010b
    db 00100010b
    db 00001010b
    db 00101010b
    db 00011010b
    db 00110010b
    db 00111010b
    db 10000100b
__1:
    lea cx, __1
    pop si
    sub cx, si
    xchg al, ah
    and ah, not 1
__2:
    lodsb
    cmp al, ah 
    loopnz __2 
    pop si
    stc
    jnz __3
    clc
__3:
    jnc __4
    and ah, not 1110b
    cmp ah, 11010000b
    jnz __5
    lodsb
    clc
    ret 
__5:
    stc 
    ret 
__4:
    lodsb
    and al, 0C0h
    cmp al, 0C0h
    jnz __6
    clc
    ret
__6:
    lodsw
    clc
    ret 
    endp

check_one proc
    push si 
    call __1  
    clc
    cld
    cli
    cmc
    sti
    nop
    stc
    std
    sahf
    segss
    segcs
    seges 
__1:
    lea cx, __1
    pop si
    sub cx, si
    xchg al, ah
__2:
    lodsb
    cmp al, ah 
    loopnz __2 
    pop si
    stc
    jnz __3
    clc
__3:
    ret
    endp

merlin:
    
end start