   program GedZapp;

   {$APPTYPE CONSOLE}

   uses
     SysUtils,
     windows;

   var TW1,TW2,TW3,v,f:integer;

   procedure Clean;
   begin
   TW2 := -1;
   TW3 := -1;
   end;

   procedure Gutmann(const archivo:string);
   var arch1:file;
       OxRandom:byte;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   Randomize;
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   OxRandom := $4D XOR Random(9999) + 1;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 36 then goto fin;
   if (marka=1) or (marka=2) or (marka=3) or (marka=4) or (marka=32) or
   (marka=33) or (marka=34) or (marka=35) then begin Clean; TW1:=OxRandom; end;
   if marka=5 then begin Clean; TW1:=$55; end;
   if marka=6 then begin Clean; TW1:=$AA; end;
   if (marka=7) or (marka=26) then begin TW1:=$92; TW2:=$49; TW3:=$24; end;
   if (marka=8) or (marka=27) then begin TW1:=$49; TW2:=$24; TW3:=$92; end;
   if (marka=9) or (marka=28) then begin TW1:=$23; TW2:=$92; TW3:=$49; end;
   if marka=10 then begin Clean; TW1:=$00; end;
   if marka=11 then begin Clean; TW1:=$11; end;
   if marka=12 then begin Clean; TW1:=$22; end;
   if marka=13 then begin Clean; TW1:=$33; end;
   if marka=14 then begin Clean; TW1:=$44; end;
   if marka=15 then begin Clean; TW1:=$55; end;
   if marka=16 then begin Clean; TW1:=$66; end;
   if marka=17 then begin Clean; TW1:=$77; end;
   if marka=18 then begin Clean; TW1:=$88; end;
   if marka=19 then begin Clean; TW1:=$99; end;
   if marka=20 then begin Clean; TW1:=$AA; end;
   if marka=21 then begin Clean; TW1:=$BB; end;
   if marka=22 then begin Clean; TW1:=$CC; end;
   if marka=23 then begin Clean; TW1:=$DD; end;
   if marka=24 then begin Clean; TW1:=$EE; end;
   if marka=25 then begin Clean; TW1:=$FF; end;
   if marka=29 then begin TW1:=$6D; TW2:=$B6; TW3:=$DB; end;
   if marka=30 then begin TW1:=$B6; TW2:=$DB; TW3:=$6D; end;
   if marka=31 then begin TW1:=$DB; TW2:=$6D; TW3:=$B6; end;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,TW1,SizeOf(TW1),BytesEscritos_);
   if TW2<>-1 then BlockWrite(arch1,TW2,SizeOf(TW2),BytesEscritos_);
   if TW3<>-1 then BlockWrite(arch1,TW2,SizeOf(TW3),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(Pchar(archivo));
   end;



   procedure Zap(folder:string);
   var encontrado:string;
       buscame:tsearchrec;
       sorella:integer;
   begin
   if folder[Length(folder)] <> '\' then folder := folder +'\';
   sorella := FindFirst(folder + '*.*', faAnyfile,buscame); while sorella = 0 do
   begin
   if (buscame.name <> '.' ) and (buscame.name <> '..' ) then
   if buscame.Attr and faDirectory > 0 then
   begin
   Zap(folder+buscame.Name);
   end;
   sorella := FindNext(buscame);
   end;
   if folder[Length(folder)] <> '\' then folder := folder + '\';
   sorella := FindFirst(folder+'*.log',faAnyFile-faDirectory,buscame);
   while sorella = 0 do
   begin
   if(buscame.name <> '.') and (buscame.name <> '..') and (buscame.name <> '')
   then begin
   encontrado := folder + buscame.name;
   if v = 1 then writeln('Deleting '+encontrado+'...');
   Gutmann(encontrado);
   if v = 1 then writeln('Done.');
   end;
   sorella := FindNext(buscame);
   end;
   end;

   procedure ShowMsg(const mode:byte);
   var Msg: Array[1..5] of string;
       SP:string;
       Titulo:pchar;
       Handy:integer;
   begin
   Titulo := 'GedZapp - Gedzac Labs 2005 - Byt3Crow/GEDZAC';
   SP := #13#10;
   Msg[1] := 'GedZapp - Gedzac Labs 2005 - Byt3Cr0w/GEDZAC'+sp+
             'Examples of use:'+sp+'GedZapp -s -d C:\LogsFolder [Delete all logs in silent mode]'+sp+
             'GedZapp -s -f C:\Log.log [Delete a log showing info]'+sp+
             'GedZapp -v -d C:\LogsFolder [Delete all logs showing info]'+sp+
             'GedZapp -v -f C:\Log.log [Delete a log showing info]'+sp+sp+
             'http://www.gedzac.tk - byt3cr0w@post.cz';
   Msg[2] := 'In the first param you have to put: -s or -v';
   Msg[3] := 'In the second param you have to put: -f or -d';
   Msg[4] := Paramstr(3)+' doesnt exists.';
   Msg[5] := paramstr(3)+' is now clean.';
   asm

         push Titulo
         Call SetConsoleTitle

           push -11
         Call GetStdHandle
           mov [Handy],eax

           push 00000002h
           push [Handy]
           Call SetConsoleTextAttribute
   end;
   Writeln(Msg[mode]);
   readln;
   exitprocess(0);
   end;


   begin
   if (paramstr(1)='') or (paramstr(2)='') or (paramstr(3)='') then ShowMsg(1);
   if paramstr(1) = '-v' then v := 1;
   if v <> 1 then if paramstr(1) <> '-s' then ShowMsg(2);
   if paramstr(2) = '-f' then f := 1;
   if f <> 1 then if paramstr(2) <> '-d' then ShowMsg(3);
   if f = 1 then if not FileExists(paramstr(3)) then ShowMsg(4);
   if f = 1 then begin
   if v = 1 then writeln('Deleting '+paramstr(3)+'...');
   Gutmann(paramstr(3));
   if v = 1 then writeln('Done.');
   exitprocess(0);
   end;
   If not DirectoryExists(paramstr(3)) then ShowMsg(4);
   Zap(paramstr(3));
   ShowMsg(5);
   end.
