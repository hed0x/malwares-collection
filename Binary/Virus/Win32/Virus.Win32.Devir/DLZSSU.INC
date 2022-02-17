   ; ‘®¡áâ¥¢¥® à á¯ ª®¢é¨ª. ˆ¤¥â ¯®á«¥ 2å ¯®«¨¬®àäëå æ¨ª«®¢. Ÿ, ª®¥ç® ¬®£
   ; ¡ë ¥£® ®â¯¥à¬ãâ¨à®¢ âì ¯®¬®éìî DME, ® § ç¥¬ ?
   LZSSu   proc
       Call    GetDelta
   GetDelta:
       pop ebp
       sub ebp,offset GetDelta

       lea esi,[DataEnd][ebp]
       mov edi,esi
       add edi,12345678h
   DecomPos    equ $ - 4
       push    esi edi
   include unuc.inc
       pop esi edi
   rep movsb
       jmp DataEnd             ; Clear prefetch (on 486)
   LZSSu   endp

   LZSSul  equ $ - LZSSu

   DataEnd:
