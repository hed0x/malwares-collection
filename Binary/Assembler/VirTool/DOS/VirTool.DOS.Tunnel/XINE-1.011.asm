
;                                        /-----------------------------\
;                                        | Xine - issue #1 - Phile 011 |
;                                        \-----------------------------/

;
; Methyl [Immortal Riot/Genesis] proudly presents:
;
;
;                 ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;                 ³               Tunneling               ³
;                 ³                 with                  ³
;                 ³            Single step mode           ³
;                 ³                                       ³
;                 ³            EXAMPLE PROGRAM            ³
;                 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
;   So you can code a good tunneling routine now, but which one should you 
;choose?  A good method of working out which handler you want to use is to 
;first have a look at how each method performs on YOUR system, and then maybe
;on other systems if you have them available.  So as to save you unknown
;coding time, I have assembled all the methods you have learnt so far into
;this example program, which will simply show you the results of each type
;of tunneling method.
;
;   Please note there are no anti-anti-tunneling routines in here, as they are
;not really needed for an example program such as this.  Also note that this is
;NOT a virus, it is an EXAMPLE PROGRAM!  Almost all of the code in here, at
;least the major portions of the INT 1 handlers, was copied straight from
;my document, cut+paste style, just to prove the routines I provided you are
;ready to run without modification!
;
codesg segment para public 'code'
    assume cs:codesg, ds:codesg, es:codesg, ss:codesg
    org 0100h
start:
    jmp begin
    orig_1         dw 0, 0
    return_address dw 0, 0
    m_startup   db 'Methyl''s example interrupt tunneler$'
    m_segment_o_13 db 0dh, 0ah, 'SEGMENT CHECK, int 13, BIOS method    - $'
    m_segment_n_13 db 0dh, 0ah, 'SEGMENT CHECK, int 13, IO method      - $'
    m_segment_21   db 0dh, 0ah, 'SEGMENT CHECK, int 21                 - $'
    m_hand_o_13    db 0dh, 0ah, 'HAND METHOD, int 13, BIOS method      - $'
    m_hand_n_13    db 0dh, 0ah, 'HAND METHOD, int 13, IO  method       - $'
    m_hand_21      db 0dh, 0ah, 'HAND METHOD, int 21                   - $'
    m_opcode_13    db 0dh, 0ah, 'OPCODE CHECK, int 13                  - $'
    m_opcode_21    db 0dh, 0ah, 'OPCODE CHECK, int 21                  - $'
    m_list_13      db 0dh, 0ah, 'CS:LIST METHOD, int 13                - $'
    m_list_21      db 0dh, 0ah, 'CS:LIST METHOD, int 21                - $'
    m_iret_13      db 0dh, 0ah, 'IRET CHECK, int 13                    - $'
    m_iret_21      db 0dh, 0ah, 'IRET CHECK, int 21                    - $'
    m_desq         db 0dh, 0ah, 'DESQView detected, exitting', 0dh, 0ah, '$'
    m_end       db 0dh, 0ah, 'End of example program', 0dh, 0ah, '$'
begin proc near
    mov ah, 9
    lea dx, [m_startup]
    int 021h                    ; Show startup message

    mov ax, 03501h
    int 021h
    mov [orig_1], bx
    mov [orig_1+2], es          ; Save original INT 1 handler

    mov ax, 02b01h
    mov cx, 'DE'
    mov dx, 'SQ'
    int 021h
    cmp al, -1
    je desqview_not_here        ; Exit if DESQView found

    mov ah, 9
    lea dx, [m_desq]
    int 021h
    mov ax, 04c01h
    int 021h

desqview_not_here:
    mov ah, 9
    lea dx, [m_segment_o_13]
    int 021h
    call segment_o_13
    call show_int_address

    mov ah, 9
    lea dx, [m_segment_n_13]
    int 021h
    call segment_n_13
    call show_int_address

    mov ah, 9
    lea dx, [m_segment_21]
    int 021h
    call segment_21
    call show_int_address

    mov ah, 9
    lea dx, [m_hand_o_13]
    int 021h
    call hand_o_13
    call show_int_address

    mov ah, 9
    lea dx, [m_hand_n_13]
    int 021h
    call hand_n_13
    call show_int_address

    mov ah, 9
    lea dx, [m_hand_21]
    int 021h
    call hand_21
    call show_int_address

    mov ah, 9
    lea dx, [m_opcode_13]
    int 021h
    call opcode_13
    call show_int_address

    mov ah, 9
    lea dx, [m_opcode_21]
    int 021h
    call opcode_21
    call show_int_address

    mov ah, 9
    lea dx, [m_list_13]
    int 021h
    call list_13
    call show_int_address

    mov ah, 9
    lea dx, [m_list_21]
    int 021h
    call list_21
    call show_int_address

    mov ah, 9
    lea dx, [m_iret_13]
    int 021h
    call iret_13
    call show_int_address

    mov ah, 9
    lea dx, [m_iret_21]
    int 021h
    call iret_21
    call show_int_address

    mov ah, 9
    lea dx, [m_end]
    int 021h                    ; Show exit message

    xor ax, ax
    mov es, ax
    cli
    mov ax, [orig_1]
    mov [es:4], ax
    mov ax, [orig_1+2]
    mov [es:6], ax
    sti                         ; Reset original interrupt 1 address

    push cs
    pop ds
    
    mov ax, 04c00h
    int 021h
begin endp
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
segment_o_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset segment_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov byte ptr [segment_status], -1
    mov byte ptr [segment_type], 2
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
segment_o_13 endp
segment_n_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset segment_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov byte ptr [segment_status], -1
    mov byte ptr [segment_type], 1
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
segment_n_13 endp
segment_21 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset segment_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov ah, 030h
    int 021h                    ; DOS version check
    cmp al, 3
    jb alternative_segment
    mov ah, 052h
    int 021h
    mov ax, [es:bx-2]
    mov [first_mcb], ax         ; Setup first MCB address
    jmp segment_done
alternative_segment:
    mov word ptr [first_mcb], 0300h
segment_done:
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov byte ptr [segment_status], -1
    mov byte ptr [segment_type], 0
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 052h
    pushf
    call far ptr [(021h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
segment_21 endp
hand_o_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset hand_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov word ptr [hand_segment], 0
    mov byte ptr [hand_type], 1
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
hand_o_13 endp
hand_n_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset hand_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov word ptr [hand_segment], -1
    mov byte ptr [hand_type], 0
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
hand_n_13 endp
hand_21 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset hand_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov word ptr [hand_segment], -1
    mov byte ptr [hand_type], 0
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 052h
    pushf
    call far ptr [(021h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
hand_21 endp
opcode_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset opcode_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
opcode_13 endp
opcode_21 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset opcode_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 052h
    pushf
    call far ptr [(021h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
opcode_21 endp
list_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset list_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address

    lea bx, [offset list_begin]
zero_loop_13:
    mov word ptr [bx], 0
    add bx, 2
    cmp bx, offset list_end
    jne zero_loop_13            ; Zero out list
    mov word ptr [list_begin], cs        

    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
list_13 endp
list_21 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset list_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address

    lea bx, [offset list_begin]
zero_loop_21:
    mov word ptr [bx], 0
    add bx, 2
    cmp bx, offset list_end
    jne zero_loop_21            ; Zero out list
    mov word ptr [list_begin], cs        

    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 052h
    pushf
    call far ptr [(021h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
list_21 endp
iret_13 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset iret_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov byte ptr [iret_status], -1
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 1
    pushf
    call far ptr [(013h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
iret_13 endp
iret_21 proc near
    push ds
    xor ax, ax
    mov es, ax
    cli
    mov word ptr [es:4], offset iret_handler
    mov [es:6], cs
    sti                         ; redirect INT 1 to our routine
    mov ah, 052h
    int 021h
    mov ax, [es:bx-2]
    mov [first_mcb], ax         ; Setup first MCB address
    mov [return_address], 0
    mov [return_address+2], 0   ; Clear return address
    mov byte ptr [iret_status], -1
                                ; Set us up to start tunneling
    xor ax, ax
    mov ds, ax                  ; Point DS to IVT
    pushf
    pushf
    pop ax
    or ah, 1
    push ax
    popf                        ; Set TF
    mov ah, 052h
    pushf
    call far ptr [(021h*4)]     ; Simulate interrupt call
    
    popf
    pop ds                      ; Restore our DS
    ret
iret_21 endp
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; Start of INT 1 handler using SEGMENT CHECK method
    first_mcb      dw 0
    segment_status db -1
    segment_type   db 0             ; 0=DOS KERNEL scan
                                    ; 1=IO KERNEL scan
                                    ; 2=ROM BIOS scan
segment_handler proc far
    push bp
    mov bp, sp
    push ax
    cmp [cs:segment_status], 0
    je segment_exit                 ; exit if we've finished tunneling already    
    mov ax, [bp+4]                  ; get CS:
    cmp [cs:segment_type], 1
    je segment_io_scan
    cmp [cs:segment_type], 2
    je segment_bios_scan
    cmp ax, [cs:first_mcb]
    jb segment_found                ; check CS: is in DOS kernel
    jmp segment_exit
segment_io_scan:
    cmp ax, 070h
    je segment_found
    jmp segment_exit                ; check CS: is in IO kernel
segment_bios_scan:
    cmp ax, 0c800h                  ; check for XT bios
    je segment_found
    cmp ax, 0f000h                  ; check for XT+ bios
    je segment_found
segment_exit:
    pop ax
    pop bp
    iret
segment_found:
    mov ax, [bp+4]
    mov [cs:return_address+2], ax
    mov ax, [bp+2]
    mov [cs:return_address], ax     ; save CS:IP
    mov [cs:segment_status], 0      ; indicate to stop tunneling
    jmp segment_exit
segment_handler endp
; End of INT 1 handler using SEGMENT CHECK method
; Start of INT 1 handler using OPCODE CHECK method
_override dw 0                      ; used to store current override
_cs       dw 0                      ; CS of instruction being executed, needed
                                    ; to simplify override usage
_ds       dw 0                      ; DS before we modified it, needed to 
                                    ; simplify override usage

opcode_handler proc far
    push bp
    mov bp, sp
    push ax
    push si
    push ds                         ; save registers
    mov ax, [bp+4]
    mov [cs:_cs], ax                ; save CS
    mov [cs:_ds], ds                ; save DS
    mov [cs:_override], ds          ; setup override as default
    lds si, [bp+2]                  ; get address of instruction into DS:SI
    cld
read_opcode:
    lodsb
    cmp al, 026h
    je es_override                  ; use ES override
    cmp al, 036h
    je ss_override                  ; use SS override
    cmp al, 02eh
    je cs_override                  ; use CS override
    cmp al, 03eh
    je ds_override                  ; use DS override

    cmp al, 0eah
    je immediate                    ; jmp far off:seg
    dec si
    lodsw
    cmp ax, 02effh
    je variable                     ; jmp far [variable]
    cmp ax, 09ah
    je immediate                    ; call far off:seg
    cmp ax, 01effh
    je variable                     ; call far [variable]

opcode_exit:
    pop ds
    pop si
    pop ax
    pop bp
    iret

immediate:
    lodsw
    mov [cs:return_address], ax
    lodsw
    mov [cs:return_address+2], ax   ; save address of area we're going into
    jmp opcode_exit

variable:
    lodsw
    mov si, ax
    mov ax, [cs:_override]
    mov ds, ax
    jmp immediate                   ; extract off:seg

ds_override:
    mov ax, [cs:_ds]
    mov [cs:_override], ax
    jmp read_opcode
cs_override:
    mov ax, [cs:_cs]
    mov [cs:_override], ax
    jmp read_opcode
es_override:
    mov [cs:_override], es
    jmp read_opcode
ss_override:
    mov [cs:_override], ss
    jmp read_opcode    
opcode_handler endp
; End of INT 1 handler using OPCODE CHECK method
; Start of INT 1 handler using CS:LIST method
list_begin: 
    dw 015h dup(0)
list_end:

list_handler proc far
    push bp
    mov bp, sp
    push ax
    push bx
    mov ax, [bp+4]
    lea bx, [list_begin]
list_traverse:
    cmp bx, offset list_end
    je list_error                   ; this is a check to make sure the 
                                    ; list of CS: values doesn't outgrow
                                    ; the space allocated for them
    cmp [cs:bx], ax
    je list_exit                    ; this is if the CS: is already on the 
                                    ; list
    cmp word ptr [cs:bx], 0
    je list_insert                  ; add us to the list if we've reached the
                                    ; end of defined values
    add bx, 2
    jmp list_traverse               ; this moves down to the next item on 
                                    ; the CS: list
list_insert:
    mov [cs:bx], ax                 ; put us on the list
    mov [cs:return_address+2], ax
    mov ax, [bp+2]
    mov [cs:return_address], ax     ; save CS:IP value
    jmp list_exit

list_error:
    mov [cs:return_address], 0
    mov [cs:return_address+2], 0    ; set error indicator

list_exit:
    pop bx
    pop ax
    pop bp
    iret
list_handler endp
; End of INT 1 handler using CS:LIST method
; Start of INT 1 handler using HAND-over-HAND method
hand_segment dw 0                   ; Where we save our CS: values
hand_type    db 0                   ; 0=Go down
                                    ; 1=Go up
hand_handler proc far
    push bp
    mov bp, sp
    push ax
    mov ax, [bp+4]
    cmp byte ptr [cs:hand_type], 1
    je go_up
go_down:
    cmp ax, [cs:hand_segment]
    jb hand_over_hand
    jmp hand_exit
go_up:
    cmp ax, [cs:hand_segment]
    ja hand_over_hand           
hand_exit:
    pop ax
    pop bp
    iret
hand_over_hand:
    mov [cs:return_address+2], ax
    mov [cs:hand_segment], ax
    mov ax, [bp+2]
    mov [cs:return_address], ax     ; save CS:IP
    jmp hand_exit
hand_handler endp
; End of INT 1 handler using HAND-over-HAND method
; Start of INT 1 handler using IRET method
iret_status db -1
iret_handler proc far
    push bp
    mov bp, sp
    push ax
    push ds
    push si
    cmp [cs:iret_status], 0
    je iret_exit
    mov ax, [cs:return_address+2]
    cmp [bp+4], ax
    jne iret_save
    lds si, [bp+2]
    lodsb
    cmp al, 0cfh
    je iret_exit_detected
iret_exit:
    pop si
    pop ds
    pop ax
    pop bp
    iret
iret_save:
    mov ax, [bp+4]
    mov [cs:return_address+2], ax
    mov ax, [bp+2]
    mov [cs:return_address], ax     ; save CS:IP
    jmp iret_exit
iret_exit_detected:
    mov [cs:iret_status], 0
    jmp iret_exit
iret_handler endp
; End of INT 1 handler using IRET method
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
show_int_address proc near      ; displays return_address
    mov bx, [return_address+2]
    call show_hex
    call show_colon
    mov bx, [return_address]
    call show_hex
    ret    
show_int_address endp
show_colon proc near            ; displays a colon on screen
    mov ah, 2
    mov dl, ':'
    int 021h
    ret
show_colon endp
show_hex proc near              ; displays a HEX number on screen
    mov ch, 4
rotate:
    mov cl, 4
    rol bx, cl
    mov al, bl
    and al, 0fh
    add al, 030h
    cmp al, '9'+1
    jl print_it
    add al, 07h
print_it:
    mov dl, al
    mov ah, 2
    int 021h
    dec ch
    jnz rotate
    ret
show_hex endp
codesg ends
end start

