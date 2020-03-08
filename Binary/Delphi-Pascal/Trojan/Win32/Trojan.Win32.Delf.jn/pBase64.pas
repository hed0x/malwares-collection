   unit pBase64;

   interface

   uses
     Windows;

     PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString);

   implementation

   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString);
   VAR
     PIn     : Pointer;
     POut    : Pointer;
     InSize  : Cardinal;
     OutSize : Cardinal;

     PROCEDURE Base64Encode2(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); REGISTER;
     CONST
       cBase64Codec : ARRAY [0..63] OF AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
     VAR
       ByThrees : Cardinal;
       LeftOver : Cardinal;
       Line     : Word;
     ASM
       mov ESI,[EAX]
       mov EDI,[ECX]
       mov EAX,EBX
       mov ECX,$03
       xor EDX,EDX
       div ECX
       mov ByThrees,EAX
       mov LeftOver,EDX
       lea ECX,cBase64Codec[0]
       xor EAX,EAX
       xor EBX,EBX
       xor EDX,EDX
       cmp ByThrees,0
       jz  @@LeftOver
       mov Line,0
       @@LoopStart:
       inc Line
       LODSW
       mov BL,AL
       shr BL,2
       mov DL,BYTE PTR [ECX+EBX]
       mov BH,AH
       and BH,$0F
       rol AX,4
       and AX,$3F
       mov DH,BYTE PTR [ECX+EAX]
       mov AX,DX
       STOSW
       LODSB
       mov BL,AL
       shr BX,6
       mov DL,BYTE PTR [ECX+EBX]
       and AL,$3F
       xor AH,AH
       mov DH,BYTE PTR [ECX+EAX]
       mov AX,DX
       STOSW
       cmp Line,19
       jnz @@ugor
       mov AX,$0A0D
       STOSW
       mov Line,0
       @@ugor:
       dec ByThrees
       jnz @@LoopStart
       @@LeftOver:
       cmp LeftOver, 0
       jz  @@Done
       xor EAX,EAX
       xor EBX,EBX
       xor EDX,EDX
       LODSB
       shl AX,6
       mov BL,AH
       mov DL,BYTE PTR [ECX+EBX]
       dec LeftOver
       jz  @@SaveOne
       shl AX,2
       and AH,$03
       LODSB
       shl AX,4
       mov BL,AH
       mov DH,BYTE PTR [ECX+EBX]
       shl EDX,16
       shr AL,2
       mov BL,AL
       mov DL,BYTE PTR [ECX+EBX]
       mov DH,'='
       jmp @@WriteLast4
       @@SaveOne:
       shr AL,2
       mov BL,AL
       mov DH,BYTE PTR [ECX+EBX]
       shl EDX,16
       mov DH,'='
       mov DL,'='
       @@WriteLast4:
       mov EAX,EDX
       ror EAX,16
       STOSD
       @@Done:
     END;

   BEGIN
     InSize:=Length(InText);
     OutSize:=(InSize DIV 3) SHL 2;
     IF InSize MOD 3>0 THEN Inc(OutSize,4);
     Outsize:=Outsize+Outsize DIV 20;
     SetLength(OutText,OutSize);
     PIn:=@InText[1];
     POut:=@OutText[1];
     Base64Encode2(PIn,InSize,POut);
   END;

   end.

