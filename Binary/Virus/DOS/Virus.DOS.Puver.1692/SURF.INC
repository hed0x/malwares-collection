   ; Surf module by Soulburner


   LOADED  equ 45
   INITSi  dw  ?

   ; This subprogram calculates opcode size, and moving through it.
   ; Doesn't uses trace.


   surf    proc    near
       ;...;
       mov cs:[InitSi],Si
   FindIt:
       lodsb               ; Get byte
       push cx
       xchg ah,al

       push si
       mov si,offset BadOpCode     ; Check for bad opcode
       call TestIt
       pop si

       cmp al,0
       jz NextTest2            ; If zero - all ok
       pop cx
       dec si
       ret
   NextTest2:
       cmp ah,0EBh         ; Check for jump short
       jne TestNext1

       xor ax,ax
       push si
       lodsb
       add si,ax
       sub si,cs:[InitSi]      ; Check for offset, if it in area
       cmp si,LOADED           ; of loaded block
       pop si
       jb AllOk
       pop cx
       ret
   AllOk:
       add si,ax
       inc si
       jmp LoopIt

   TestNext1:
       push si
       lea si,Grp1_Tbl         ; Check for "group" opcodes
       call TestIt
       pop si

       cmp al,0
       jz TestBit16            ; Nope...

       lodsb               ; Get second byte and check for all
       xchg ah,al          ; command size
       mov al,06
       mov cx,9
   FindDirect:
       cmp ah,al
       jne TestNext
       jmp Bit16
   TestNext:
       add al,7
       loop FindDirect

       cmp ah,40h
       ja TestMore
   TwoByte1:
       jmp TwoByte
   TestMore:
       cmp ah,80h
       ja TestMore1
       jmp Bit16
   TestMore1:
       cmp ah,0C0h
       ja TwoByte1
       jmp FourByte

   TestBit16:
       push si
       mov si,offset imm16         ; Check for imm16b opcodes
       call testit
       pop si

       cmp al,0
       jz TestBit8             ; Nope
       jmp Immed16
   TestBit8:
       push si
       lea si,imm8
       call testIt             ; Test for imm8bit
       pop si
       cmp al,0
       jz LoopIt
       jmp Immed8
   LoopIt:
       pop cx                  ; All ok... Probably
       or cx,cx                ; not finded opcode is one
       jz AllDOne              ; byte
       dec cx
       jmp FindIt
   AllDone:
       ret
   surf    endp
   ;-----------------------------------------------------
   TestIt  proc    near                ; This procedure works with
       lodsb                   ; table
       cmp al,00               ; Format of table is:
       jz This_Is_Range            ; 00 - Range of numbers
       cmp al,1                ;  If it is range, next
       jz TestValues               ;  byte is lower number of
       cmp al,2                ;  range, and next byte
       jz EndOfTbl             ;  after lower - higher range
       jmp EndOfTbl                ; 01 - Just counting of opcodes
   TestValues:                 ;  Next byte would be number
       xor cx,cx               ;  of opcodes check, and after
       lodsb                   ;  it goes opcodes
       xchg al,cl              ; 02 - end of table
   TestForValues:
       lodsb
       cmp ah,al
       jz Founded
       loop TestForValues
       jmp ToBad
   This_Is_Range:
       lodsb
       xchg dh,al
       lodsb
       xchg dl,al
       cmp ah,dh
       jb ToBad
       cmp ah,dl
       ja ToBad
       jmp Founded
   ToBad:
       jmp TestIt

   EndOfTbl:
       mov al,0
       ret
   Founded:
       mov al,1
       ret
   TestIt  endp
   ;-----------------------------------------------------
   Immed16:
   FourByte:
       inc si
   Immed8:
   Bit16:
       inc si
   TwoByte:
   Bit8:
       jmp LoopIt

   ;-----------------------------------------------------
   Grp1_Tbl    db  0, 0, 4
           db  0,10h,14h
           db  0,20h,24h
           db  0,30h,34h
           db  0,08h,0Bh
           db  0,18h,1Bh
           db  0,28h,2bH
           db  0,38h,3Bh
           db  0,84h,87h
           db  0,88h,8Bh
           db  01,01,0D3h
           db  02

   Imm16       db  01,13
           db  05,15h,25h,35h,0A1h,0A3h,0Dh,1Dh,2Dh,3Dh,68h,0A9h,0E8h
           db  00,0B8h,0Bfh
           db  02

   Imm8        db  01,11
           db  04,14h,24h,34h,0Ch,1Ch,2Ch,3Ch,6Ah,0A8h,0Cdh
           db  00,0E2h,0E7h
           db  00,0B0h,0B7h
           db  02

   BadOpCode   db  01,07
           db  0CBh,0E9h,0EAh,09Ah,0C8h,0FEh,0FFh
           db  00,70h,7Fh
           db  00,68h,6Bh
           db  00,8Ch,8Fh
           db  00,80h,83h
           db  00,0C0h,0C7h
           db  00,0D0h,0D3h
           db  2

