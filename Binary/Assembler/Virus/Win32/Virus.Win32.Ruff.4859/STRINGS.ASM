   ;-----------------------------------------------------------
   ; StrCompare ‘à ¢¨âì ¤¢¥ áâà®ª¨
   ;-----------------------------------------------------------
   ; ‚å®¤:
   ;       si =  ¤à¥á áâà®ª¨ 1 (s1)
   ;       di =  ¤à¥á áâà®ª¨ 2 (s2)
   ; ‚ëå®¤:
   ;        ¡®à ä« £®¢ ¤«ï ãá«®¢ëå ¯¥à¥å®¤®¢ jb, jbe,
   ;       je, ja, jae, or
   ; *¥£¨áâàë:
   ;       ¥ ¨á¯®«ì§ãîâáï
   ;-----------------------------------------------------------
   StrCompare     PROC

           push    eax
           push    edi
           push    esi

           cld
   @@10:
           lodsb
           scasb
           jne     @@20
           or      al, al
           jne     @@10
   @@20:
           pop     esi
           pop     edi
           pop     eax
           ret
   ENDP StrCompare
   ;-----------------------------------------------------------
   ; StrPos * ©â¨ ¢å®¦¤¥¨¥ ¢ áâà®ªã ¯®¤áâà®ª¨
   ;-----------------------------------------------------------
   ; ‚å®¤:
   ;       si =  ¤à¥á ¨áª®¬®© ¯®¤áâà®ª¨
   ;       di =  ¤à¥á ¯à®¢¥àï¥¬®© æ¥«¥¢®© áâà®ª¨
   ; ‚ëå®¤:
   ;       …á«¨ zf = 1, â®£¤  dx = ¨¤¥ªá ¯®¤áâà®ª¨
   ;       …á«¨ zf = 0, â®£¤  ¯®¤áâà®ª  ¥  ©¤¥ 
   ; ‡ ¬¥ç ¨¥: ¥á«¨ zf = 0, â® § ç¥¨¥ ¢ dx ¥ ¨¬¥¥â ¨ª ª®£® á¬ëá« 
   ; *¥£¨áâàë:
   ;       dx
   ;-----------------------------------------------------------
   ASCNull EQU     0
   StrPos    PROC
           push    eax
           push    ebx
           push    ecx
           push    edi

           call    StrLength
           mov     eax, ecx
           xchg    esi, edi
           call    StrLength
           mov     ebx, ecx
           xchg    esi, edi
           sub     eax,ebx
           jb      __20
           mov     edx, 0FFFFFFFFh
   __10:
           inc     edx
           mov     cl, byte ptr [ebx + edi]
           mov   byte ptr  [ ebx + edi], ASCNull
           call    StrCompare
           mov   byte ptr [ebx + edi], cl
           je      __20
           inc     edi
           cmp     edx, eax
           jne     __10
           xor     ecx, ecx
           inc     ecx
   __20:
           pop     edi
           pop     ecx
           pop     ebx
           pop     eax
           ret
   ENDP    StrPos

   ;-----------------------------------------------------------
   ; StrLength *®¤áç¨â âì ¢ áâà®ª¥ ª®«¨ç¥áâ¢® ¥ã«¥¢ëå á¨¬¢®«®¢
   ;-----------------------------------------------------------
   ; ‚å®¤:
   ;       di =  ¤à¥á áâà®ª¨ (s)
   ; ‚ëå®¤:
   ;       cx = ª®«¨ç¥áâ¢® ¥ã«¥¢ëå á¨¬¢®«®¢ ¢ s
   ; *¥£¨áâàë:
   ;       cx
   ;-----------------------------------------------------------
   StrLength PROC
           push    eax
           push    edi

           xor     al, al
           mov     ecx, 0FFFFFFFFh
           cld
           repnz   scasb
           not     ecx
           dec     ecx

           pop     edi
           pop     eax
           ret
   ENDP StrLength
