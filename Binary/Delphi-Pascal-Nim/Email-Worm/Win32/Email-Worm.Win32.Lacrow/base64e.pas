   unit base64e;

   interface
   uses windows;
   function Base64EncodeFile(cInFile, cOutFile:PAnsiChar):integer;stdcall;

   implementation

   const
     cBase64Codec: array[0..63] of AnsiChar =
       'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
     Base64Filler = '=';

   function CalcEncodedSize(InSize: Cardinal): Cardinal;
   begin
     // no buffers passed along, calculate outbuffer size needed
     Result := (InSize div 3) shl 2;
     if ((InSize mod 3) > 0)
     then Inc(Result, 4);
   end;


   procedure Base64Encode(const InBuffer; InSize: Cardinal; var OutBuffer); register;
   var
     ByThrees, LeftOver: Cardinal;
     // reset in- and outbytes positions
   asm
     // load addresses for source and destination
     // PBYTE(InBuffer);
     mov  ESI, [EAX]
     // PBYTE(OutBuffer);
     mov  EDI, [ECX]
     // ByThrees := InSize div 3;
     // LeftOver := InSize mod 3;
     // load InSize (stored in EBX)
     mov  EAX, EBX
     // load 3
     mov  ECX, $03
     // clear upper 32 bits
     xor  EDX, EDX
     // divide by ECX
     div  ECX
     // save result
     mov  ByThrees, EAX
     // save remainder
     mov  LeftOver, EDX
     // load addresses
     lea  ECX, cBase64Codec[0]
     // while I < ByThrees do
     // begin
     xor  EAX, EAX
     xor  EBX, EBX
     xor  EDX, EDX
     cmp  ByThrees, 0
     jz   @@LeftOver
     @@LoopStart:
       // load the first two bytes of the source triplet
       LODSW
       // write Bits 0..5 to destination
       mov  BL, AL
       shr  BL, 2
       mov  DL, BYTE PTR [ECX + EBX]
       // save the Bits 12..15 for later use [1]
       mov  BH, AH
       and  BH, $0F
       // save Bits 6..11
       rol  AX, 4
       and  AX, $3F
       mov  DH, BYTE PTR [ECX + EAX]
       mov  AX, DX
       // store the first two bytes of the destination quadruple
       STOSW
       // laod last byte (Bits 16..23) of the source triplet
       LODSB
       // extend bits 12..15 [1] with Bits 16..17 and save them
       mov  BL, AL
       shr  BX, 6
       mov  DL, BYTE PTR [ECX + EBX]
       // save bits 18..23
       and  AL, $3F
       xor  AH, AH
       mov  DH, BYTE PTR [ECX + EAX]
       mov  AX, DX
       // store the last two bytes of the destination quadruple
       STOSW
       dec  ByThrees
     jnz  @@LoopStart
     @@LeftOver:
     // there are up to two more bytes to encode
     cmp  LeftOver, 0
     jz   @@Done
     // clear result
     xor  EAX, EAX
     xor  EBX, EBX
     xor  EDX, EDX
     // get left over 1
     LODSB
     // load the first six bits
     shl  AX, 6
     mov  BL, AH
     // save them
     mov  DL, BYTE PTR [ECX + EBX]
     // another byte ?
     dec  LeftOver
     jz   @@SaveOne
     // save remaining two bits
     shl  AX, 2
     and  AH, $03
     // get left over 2
     LODSB
     // load next 4 bits
     shl  AX, 4
     mov  BL, AH
     // save all 6 bits
     mov  DH, BYTE PTR [ECX + EBX]
     shl  EDX, 16
     // save last 4 bits
     shr  AL, 2
     mov  BL, AL
     // save them
     mov  DL, BYTE PTR [ECX + EBX]
     // load base 64 'no more data flag'
     mov  DH, Base64Filler
     jmp  @@WriteLast4
     @@SaveOne:
     // adjust the last two bits
     shr  AL, 2
     mov  BL, AL
     // save them
     mov  DH, BYTE PTR [ECX + EBX]
     shl  EDX, 16
     // load base 64 'no more data flags'
     mov  DH, Base64Filler
     mov  DL, Base64Filler
     // ignore jump, as jump reference is next line !
     // jmp  @@WriteLast4
     @@WriteLast4:
       // load and adjust result
       mov  EAX, EDX
       ror EAX, 16
       // save it to destination
       STOSD
     @@Done:
   end;

   function Base64EncodeFile(cInFile, cOutFile:PChar):integer;stdcall;
   var
     cBuff:array[0..1024] of char;
     cOutBuff:array[0..3072] of char;
     dwRead, dwWritten:DWORD;
     hFile, nFile:THandle;
   begin
     result := 1;
     hFile := CreateFile(cInFile, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
     if (hFile = INVALID_HANDLE_VALUE) then
       exit;
     SetFilePointer(hFile, 0, nil, FILE_BEGIN);
     result := 2;
     nFile := CreateFile(cOutFile, GENERIC_WRITE, 0, nil, CREATE_ALWAYS, 0, 0);
     if (nFile = INVALID_HANDLE_VALUE) then
       exit;
     repeat
       ReadFile(hFile, cBuff, sizeof(cBuff), dwRead, nil);
       Base64Encode(cBuff, dwRead, cOutBuff);
       WriteFile(nFile, cOutBuff, CalcEncodedSize(dwRead), dwWritten, nil);
     until (dwRead < 1);
     CloseHandle(hFile);
     CloseHandle(nFile);
     result := 0;
   end;
   end.
