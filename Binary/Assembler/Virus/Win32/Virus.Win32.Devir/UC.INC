   ; “¯ ª®¢é¨ª ®á®¢ ë©   LZSS áå¥¬¥. ˆá¯®«ì§ã¥â ¡¨ à®¥ ¤¥à¥¢®, ¤«ï
   ;  å®¦¤¥¨ï ¯®¢â®àïîé¨å ¯®á«¥¤®¢ â¥«ì®áâ¥©, ¢ à¥§ã«ìâ â¥ ç¥£® ¤®áâ¨£ ¥âáï
   ; ¤®¢®«ì® ¥¯«®å ï áª®à®áâì á¦ â¨ï (¨ ª ç¥áâ¢®,ª áâ â¨, â®¦¥)

   WinBit  = 13
   WinLen  = 1 shl WinBit

   LenBit  = 7
   LenSize = 1 shl LenBit-1

   MinLen  = (WinBit+LenBit+2)/8+1
   NODENIL = WinLen
   ;-------
   InitTree  proc
         pushad
             lea   edi,RSon[ebp]
             mov   eax,NODENIL
             mov   ecx,256+WinLen+1
             rep   stosd
             xor   ebx,ebx
   CleanLoop:
             mov   LSon[ebx*4][ebp],eax
             mov   Dad[ebx*4][ebp],eax
             inc   ebx
             cmp   ebx,WinLen
             jbe   CleanLoop
         popad
             ret
   InitTree        endp

   AddNode   proc
             mov   ebx,[xPos][ebp]
             movzx ebx,1 ptr [ebx]
             lea   edi,[ebx][WinLen+1]

             mov   [dir][ebp],TRUE

             mov   ecx,[cChar][ebp]
             mov   eax,NODENIL
             mov   RSon[ecx*4][ebp],eax
             mov   LSon[ecx*4][ebp],eax
   CheckLoop:
             mov   eax,[MatchLen][ebp]
             cmp   eax,LenSize
             jae   SkipNextSearches

             cmp   [dir][ebp],TRUE
             jne   LSonCheck

             cmp   RSon[EDI*4][ebp],NODENIL
             jne   GetRSon

             mov   eax,[cChar][ebp]
             mov   RSon[EDI*4][ebp],eax
             mov   Dad[EAX*4][ebp],EDI
             jmp   SearchQuit

   GetRSon:  mov   edi,RSon[EDI*4][ebp]
             jmp   CmpExit
   LSonCheck:cmp   LSon[EDI*4][ebp],NODENIL
             jne   GetLSon

             mov   eax,[cChar][ebp]
             mov   LSon[EDI*4][ebp],eax
             mov   Dad[EAX*4][ebp],EDI
             jmp   SearchQuit

   GetLSon:  mov   edi,LSon[EDI*4][ebp]
   CmpExit:

         mov   ecx,[cChar][ebp]
             sub   ecx,EDI
             or    ecx,ecx
             jge   AddSkip1
             add   ecx,WinLen
   AddSkip1:

         mov   esi,[xPos][ebp]
             mov   ebx,esi
             sub   ebx,ecx

             mov   ecx,1

             mov   edx,[xLim][ebp]
             sub   edx,esi
         dec   edx

   StringCompare:
             mov   al,[ESI+ECX]
             cmp   al,[EBX+ECX]
             jnz   OuttaCompare
             cmp   ecx,LenSize
             jae   OuttaCompare
             cmp   ecx,edx
             jae   OuttaCompare
             inc   ecx
             jmp   StringCompare

   OuttaCompare:
             jbe   MakeFalse
             mov   [dir][ebp],TRUE
             jmp   MakeOut
   MakeFalse:
             mov   [dir][ebp],FALSE

   MakeOut:

             cmp   ecx,[MatchLen][ebp]
             jbe   SkipNew
             mov   [MatchPos][ebp],EDI
             mov   [MatchLen][ebp],ECX
   SkipNew:
             mov   edx,[cChar][ebp]
             add   edx,[xPos][ebp]
             mov   eax,edx
             sub   edx,[MatchPos][ebp]
             sub   eax,edi

             cmp   eax,edx
             jae   SkipBigger
             cmp   ecx,[MatchLen][ebp]
             jb    SkipBigger
             mov   [MatchPos][ebp],EDI
             mov   [MatchLen][ebp],ECX
   SkipBigger:
             jmp   CheckLoop

   SkipNextSearches:
             mov   ebx,[cChar][ebp]
             mov   eax,Dad[EDI*4][ebp]
             mov   Dad[EBX*4][ebp],eax

             mov   ecx,LSon[EDI*4][ebp]
             mov   LSon[EBX*4][ebp],ecx
             mov   Dad[ECX*4][ebp],ebx

             mov   ecx,RSon[EDI*4][ebp]
             mov   RSon[EBX*4][ebp],ecx
             mov   Dad[ECX*4][ebp],ebx

             mov   ecx,Dad[EDI*4][ebp]
             mov   edx,[cChar][ebp]
             cmp   RSon[ECX*4][ebp],edi
             jnz   MakeLSon
             mov   RSon[ECX*4][ebp],edx
             jmp   MakeDone
   MakeLSon: mov   LSon[ECX*4][ebp],edx
   MakeDone: mov   Dad[EDI*4][ebp],NODENIL
   SearchQuit:
             ret
   AddNode   endp

   DelNode   proc
             mov   edx,[cChar][ebp]
             shl   edx,2
             mov   ebx,Dad[edx][ebp]

             cmp   ebx,NODENIL
             jz    SearchQuit
             shl   ebx,2

             cmp   LSon[edx][ebp],NODENIL
             jnz   Branch2
             mov   ecx,RSon[EDX][ebp]
             jmp   BranchQuit
   Branch2:  cmp   RSon[edx][ebp],NODENIL
             jnz   Branch3
             mov   ecx,LSon[EDX][ebp]
             jmp   BranchQuit
   Branch3:  mov   ecx,RSon[EDX][ebp]
   SeekLoop: cmp   LSon[ecx*4][ebp],NODENIL
             jz    AtTheEnd
             mov   ecx,LSon[ecx*4][ebp]
             jmp   SeekLoop
   AtTheEnd: mov   edi,LSon[EDX][ebp]
             mov   LSon[ECX*4][ebp],EDi
             mov   Dad[EDI*4][ebp],ECX
             mov   ecx,RSon[EDX][ebp]
   BranchQuit:
             cmp   ecx,NODENIL
             jz    Skipped
             mov   eax,ebx
             shr   eax,2
             mov   Dad[ECX*4][ebp],eax
   Skipped:  mov   eax,[cChar][ebp]
             cmp   RSon[EBX][ebp],EAX
             jnz   KillLSon
             mov   RSon[EBX][ebp],ECX
             jmp   SkipKill
   KillLSon: mov   LSon[EBX][ebp],ECX
   SkipKill: mov   eax,NODENIL
             mov   Dad[EDX][ebp],eax
             mov   LSon[EDX][EBP],eax
             mov   RSon[EDX][ebp],eax
             ret
   DelNode   endp
   ;-----------------------------------------------
   StoreBits   proc
       mov ebx,32
       sub ebx,ecx
       xchg    ebx,ecx
       shl eax,cl
       xchg    ebx,ecx
   FlipIt: shl [xCode][ebp],1
       shl eax,1
       jnc Nope
       or  [xCode][ebp],1
   Nope:   dec [Cnt][ebp]
       jnz NotZero
       xchg    edi,[xBst][ebp]
       xchg    eax,[xCode][ebp]
       stosd
       xchg    eax,[xCode][ebp]
       xchg    edi,[xBst][ebp]
       mov [Cnt][ebp],32
   NotZero:loop    FlipIt

       ret
   StoreBits   endp
   ;-----------------------------------------------

   StoreOne    proc
       mov ecx,1
       Call    StoreBits
       ret
   StoreOne    endp

   StoreByte   proc
       mov ecx,8
       Call    StoreBits
       ret
   StoreByte   endp
   ;---------------------------
   Compress    proc
           Call    InitTree
           mov     [xDst][ebp],edi
           mov     [xSrc][ebp],esi
           mov     [xCnt][ebp],ecx

       push    esi ecx
       lea esi,[LZSSu][ebp]
       mov ecx,LZSSul
   rep movsb
       pop ecx esi

           mov     eax,ecx
           stosd
           mov     [xBst][ebp],edi
           add     eax,esi
           mov     [xLim][ebp],eax
           mov     [Cnt][ebp],32
           mov     [cChar][ebp],0
           mov     [xPos][ebp],esi
           xor     eax,eax
           mov     [MatchLen][ebp],eax
           mov     [MatchPos][ebp],eax

   CompressIt:
           mov     eax,LenSize
           cmp     [MatchLen][ebp],eax
           jbe     Skipp
           mov     [MatchLen][ebp],eax
   Skipp:

           cmp     [MatchLen][ebp],MinLen
           jae     MakeBlock

           mov     al,0
           Call    StoreOne
           mov     ebx,[xPos][ebp]
           mov     al,[ebx]
           Call    StoreByte

           jmp     SkipEncode
   MakeBlock:
           mov     al,1
           Call    StoreOne
           mov     eax,[MatchLen][ebp]
           mov     ecx,LenBit
           Call    StoreBits
           mov     eax,[cChar][ebp]
           sub     eax,[MatchPos][ebp]
           or      eax,eax
           jge     NoAdd2
           add     eax,WinLen
   NoAdd2: mov     ecx,WinBit
           Call    StoreBits

           mov     eax,[MatchLen][ebp]
       dec eax
           mov     [n][ebp],eax

   SkipBlocks:
           mov     eax,[cChar][ebp]
           inc     eax
       cmp eax,WinLen
       jb  Okay
       sub eax,WinLen
   Okay:   mov     [cChar][ebp],eax
           inc     [xPos][ebp]
           mov     [MatchLen][ebp],0
           Call    DelNode
           Call    AddNode
           dec     [n][ebp]
           jnz     SkipBlocks

   SkipEncode:
           mov     [MatchLen][ebp],0
           mov     eax,[cChar][ebp]
           inc     eax
       cmp eax,WinLen
       jb  Okay1
       sub eax,WinLen
   Okay1:  mov [cChar][ebp],eax
           inc     [xPos][ebp]
           Call    DelNode
           Call    AddNode

           mov     eax,[xPos][ebp]
           cmp     eax,[xLim][ebp]
           jbe     CompressIt

           mov     ecx,[Cnt][ebp]
           mov     eax,[xCode][ebp]
           shl     eax,cl
           mov     edi,[xBst][ebp]
           stosd

       mov ecx,edi
       mov eax,[xDst][ebp]
       sub ecx,eax

       mov 4 ptr [eax][DecomPos-LZSSu],ecx

           ret
   Compress    endp
   ;---------------------------
   include dlzssu.inc
