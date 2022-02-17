   UNIT Crc32;

   INTERFACE

   PROCEDURE BuildCRC32Table;
   FUNCTION  ComputeFileCRC32(FileName:STRING) : LongInt;

   IMPLEMENTATION

   VAR
     CRC32Table : ARRAY[0..255] OF Cardinal;

   PROCEDURE BuildCRC32Table; ASSEMBLER;
   ASM
       mov ebx, 0EDB88320h
       lea edi, crc32table
       xor ecx, ecx
     @loc1:
       mov eax, ecx
       mov edx, 8
     @loc2:
       test eax, 1
       jz  @loc3
       shr eax, 1
       xor eax, ebx
       jmp @loc4
     @loc3:
       shr eax, 1
     @loc4:
       dec edx
       jnz @loc2
       stosd
       inc ecx
       cmp ecx, 256
       jb  @loc1
   END;

   FUNCTION CalculateCRC32(Buffer:Pointer;Size:Cardinal) : Cardinal; ASSEMBLER;
   ASM
       push esi
       push edi
       push ebx
       mov edi,edx
       mov esi,eax
       xor ebx,ebx
       mov eax,$ffffffff
       mov ecx,edi
       shr ecx,2
       jecxz @Rest
     @Loop:
       mov edx,[esi]
       mov bl,al
       xor bl,dl
       shr eax,8
       xor eax,dword ptr [CRC32table+ebx*4]
       mov bl,al
       xor bl,dh
       shr eax,8
       xor eax,dword ptr [CRC32table+ebx*4]
       shr edx,16
       mov bl,al
       xor bl,dl
       shr eax,8
       xor eax,dword ptr [CRC32table+ebx*4]
       mov bl,al
       xor bl,dh
       shr eax,8
       xor eax,dword ptr [CRC32table+ebx*4]
       add esi,4
       loop @Loop
     @Rest:
       mov ecx,edi
       and ecx,3
       jecxz @End
     @Loop_Rest:
       mov bl,al
       xor bl,[esi]
       shr eax,8
       inc esi
       xor eax,dword ptr [CRC32table+ebx*4]
       loop @Loop_Rest
   @End:
       xor eax,$ffffffff
       pop ebx
       pop edi
       pop esi
   END;

   FUNCTION ComputeFileCRC32(FileName:STRING) : Longint;
   VAR
      InputFile    : FILE;
      FileSize_    : Integer;
      Crc32        : LongInt;
      Buffer       : AnsiString;
   BEGIN
      BuildCRC32Table;
      Assign(InputFile,FileName);
      FileMode:=0;
      Reset(InputFile,1);
      FileSize_:=FileSize(InputFile);
      SetLength(Buffer,FileSize_);
      BlockRead(InputFile,Buffer[1],FileSize_);
      Result:=CalculateCRC32(@Buffer[1],FileSize_);
      Close(InputFile);
   END;

   END.
