   unit Tools;

   interface
   uses
     Sysutils;

   type
   {$IFDEF VER120}
     dword= longword;
   {$ELSE}
     dword= longint;
   {$ENDIF}

   function LRot16(X: word; c: integer): word; assembler;
   function RRot16(X: word; c: integer): word; assembler;
   function LRot32(X: dword; c: integer): dword; assembler;
   function RRot32(X: dword; c: integer): dword; assembler;
   procedure XorBlock(I1, I2, O1: PByteArray; Len: integer);
   procedure IncBlock(P: PByteArray; Len: integer);

   implementation

   function LRot16(X: word; c: integer): word; assembler;
   asm
     mov ecx,&c
     mov ax,&X
     rol ax,cl
     mov &Result,ax
   end;

   function RRot16(X: word; c: integer): word; assembler;
   asm
     mov ecx,&c
     mov ax,&X
     ror ax,cl
     mov &Result,ax
   end;

   function LRot32(X: dword; c: integer): dword; register; assembler;
   asm
     mov ecx, edx
     rol eax, cl
   end;

   function RRot32(X: dword; c: integer): dword; register; assembler;
   asm
     mov ecx, edx
     ror eax, cl
   end;

   procedure XorBlock(I1, I2, O1: PByteArray; Len: integer);
   var
     i: integer;
   begin
     for i:= 0 to Len-1 do
       O1[i]:= I1[i] xor I2[i];
   end;

   procedure IncBlock(P: PByteArray; Len: integer);
   begin
     Inc(P[Len-1]);
     if (P[Len-1]= 0) and (Len> 1) then
       IncBlock(P,Len-1);
   end;

   end.
