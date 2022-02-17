   UNIT uCRC32;

   INTERFACE

   PROCEDURE BuildCRC32Table;
   FUNCTION  CalculateCRC32(VAR Buffer;CONST Size:Cardinal) : Cardinal;

   IMPLEMENTATION

   VAR
     CRC32TAB : ARRAY[0..255] OF Cardinal;

   //------------------------------------------------------------------------------
   PROCEDURE BuildCRC32Table; ASSEMBLER;
   ASM
       mov ebx, 0EDB88320h
       lea edi, crc32tab
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

   //------------------------------------------------------------------------------
   FUNCTION CalculateCRC32(VAR Buffer;CONST Size:Cardinal) : Cardinal; ASSEMBLER;
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
       xor eax,dword ptr [CRC32tab+ebx*4]
       mov bl,al
       xor bl,dh
       shr eax,8
       xor eax,dword ptr [CRC32tab+ebx*4]
       shr edx,16
       mov bl,al
       xor bl,dl
       shr eax,8
       xor eax,dword ptr [CRC32tab+ebx*4]
       mov bl,al
       xor bl,dh
       shr eax,8
       xor eax,dword ptr [CRC32tab+ebx*4]
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
       xor eax,dword ptr [CRC32tab+ebx*4]
       loop @Loop_Rest
   @End:
       xor eax,$ffffffff
       pop ebx
       pop edi
       pop esi
   END;

   END.
