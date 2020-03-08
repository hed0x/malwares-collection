   { Coded by Byt3Cr0w/GEDZAC
     www.byt3cr0w.tk
   - Thnx to Dave Barton for her TwoFish and Sha1 Units. }

   program GDT;

   {$APPTYPE CONSOLE}

   uses
     GPALL,SHA1,Twofish;
   CONST
   sp = #13#10;


     var TW1,TW2,TW3:integer;
         DeleteFile_,CopyFile_,WinExec_,MoveFile_:pointer;

   function IntToStr(I: Longint): String;
   var s: string[11];
   begin
    str(i,s);
    result := S;
   end;

   function GetAPI(dll:string;api:string):pointer;
   var myhandy:integer;
       myoff:pointer;
      begin
      myhandy := LoadLibraryA(pchar(dll));
      myoff := GetProcAddress(myhandy,Pchar(api));
      Result := myoff;
    end;


    procedure WinExec(const a:string);
    var b:pchar;
    begin
    b := Pchar(a);
    asm
    push 0
    push b
    Call WinExec_
    end;
    end;

    procedure MoveFile(const a,b:pchar);
    begin
    asm
    push b
    push a
    Call MoveFile_
    end;
    end;


    procedure DeleteFile(const f:string);
    var a:pchar;
    begin
    a := Pchar(f);
    asm
    push a
    Call DeleteFile_
    end;
    end;

    procedure CopyFile(const a,b:pchar);
    begin
    asm
    push 0
    push b
    push a
    Call CopyFile_
    end;
    end;


   { /////////// TWOFISH \\\\\\\\\\\\\ }

   Function RandomStr(x:integer):string;
   var
   c,o: Integer;
   abc,rez: String;
   Begin
   rez:='';
   abc:='qwertyuopasdfghjklizxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890';
   Randomize;
   for c:=1 to x Do
   begin
   o:=random(length(abc));
   if o = 0 then Inc(o);
   rez:=rez+abc[o];
   end;
   Result:=rez;
   end;

   procedure HS(wez: string;var got:TSHA1Digest);
   var pzz: TSHA1Context;
   begin
   SHA1Init(pzz);SHA1Update(pzz,@wez[1],Length(wez));SHA1Final(pzz,got);
   end;

   procedure HF(FileZ:string;var got:TSHA1Digest);
   var wez:file;
    Buffer:array[1..8192] of byte;
    pzz:TSHA1Context;
    pok:integer;
   begin
    AssignFile(wez,FileZ);
    try Reset(wez,1); except Exit;
    end;
    SHA1Init(pzz);
    repeat
    BlockRead(wez,Buffer,Sizeof(Buffer),pok); SHA1Update(pzz,@Buffer,pok);
    until pok<> Sizeof(Buffer);
    SHA1Final(pzz,got); CloseFile(wez);
   end;

     procedure ec(const f:string);
     var  z1: file;
     got: TSHA1Digest;
     c1,c2,c3: integer;
     juaz: array[0..15] of byte;
     secret: TTwofishData;
     Buffer: array[0..8191] of byte;
     zecret: string;
   begin
   Randomize;
   zecret:= IntToStr(Random(99999))+RandomStr(Random(9999999))+IntToStr(Random(9999999));
   zecret := zecret + RandomStr(Random(9999999)+1);
   HS(zecret,got);
   TwofishInit(secret,@got,Sizeof(got),nil);
   FillChar(juaz,Sizeof(juaz),0);
   TwofishEncryptCBC(secret,@juaz,@got);
   Move(got,secret.InitBlock,Sizeof(secret.InitBlock));
   TwofishReset(secret);
   AssignFile(z1,f);
   try
   Reset(z1,1);
   except
   TwofishBurn(secret);
   Exit;
   end;
   repeat
   c3:= FilePos(z1);
   BlockRead(z1,Buffer,Sizeof(Buffer),c1);
   for c2:= 1 to (c1 div 16) do
   TwofishEncryptCBC(secret,@Buffer[(c2-1)*Sizeof(juaz)],@Buffer[(c2-1)*Sizeof(juaz)]);
   if (c1 mod 16)<> 0 then
   begin
   Move(secret.LastBlock,juaz,Sizeof(juaz));
   TwofishEncryptCBC(secret,@juaz,@juaz);
   for c2:= 1 to (c1 mod 16) do
   Buffer[(c1 and not 15)+c2]:= Buffer[(c1 and not 15)+c2] xor juaz[c2];
   end;
   Seek(z1,c3);
   BlockWrite(z1,Buffer,c1);
   until c1<> Sizeof(Buffer);
   CloseFile(z1);
   end;
   { /////////// TWOFISH \\\\\\\\\\\\\ }
   /////////////////////////////////////////////////////////////////////////////////////

   { /////////// ALGORITHMS \\\\\\\\\\\\\ }

   procedure NAVSO(const archivo,mode:string);
   var arch1:file;
       ToWrite,OxRandom:integer;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   if mode = 'MFM' then Writeln('Deleting using US Navy, NAVSO P-5239-26 - MFM...')
   else Writeln('Deleting using US Navy, NAVSO P-5239-26 - RLL...');
   Randomize;
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   OxRandom := $4D XOR Random(9999) + 1;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 4 then goto fin;
   if marka = 1 then ToWrite := $ffffffff;
   if (marka = 2) and (mode='MFM') then ToWrite := $bfffffff else ToWrite := $27ffffff;
   if marka = 3 then ToWrite := OxRandom;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;

   procedure BitToggle(const archivo:string);
   var arch1:file;
       ToWrite:byte;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   Writeln('Deleting using BitToggle...');
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 4 then goto fin;
   if (marka = 1) or (marka = 3) then ToWrite := $00;
   if marka = 2 then ToWrite := $ff;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;

   procedure DOD(const archivo:string);
   var arch1:file;
       ToWrite,OxRandom:integer;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   Writeln('Deleting using US Department of Defense (DoD 5220.22-M)...');
   Randomize;
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   OxRandom := $4D XOR Random(9999) + 1;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 4 then goto fin;
   if marka = 1 then ToWrite := $27ff;
   if marka = 2 then ToWrite := $ff;
   if marka = 3 then ToWrite := OxRandom;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(archivo);
   Writeln('Deleted');
   end;

   procedure AFSSI(const archivo:string);
   var arch1:file;
       ToWrite:byte;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   Writeln('Deleting using US Air Force, AFSSI5020...');
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 3 then goto fin;
   if marka = 1 then ToWrite := $00;
   if marka = 2 then ToWrite := $ff;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;

   procedure NATO(const archivo:string);
   var arch1:file;
       ToWrite,OxRandom:byte;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   Writeln('Deleting using North Atlantic Treaty Organization - NATO standard ...');
   Randomize;
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   OxRandom := $4D XOR Random(9999) + 1;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 8 then goto fin;
   if marka = 1 then ToWrite := $00;
   if marka = 2 then ToWrite := $ff;
   if marka > 2 then ToWrite := OxRandom;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;

   procedure Schneier(const archivo:string);
   var arch1:file;
       ToWrite:byte;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
   begin
   Writeln('Deleting using Bruce Schneier Algorithm...');
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 3then goto fin;
   if marka = 1 then ToWrite := $ff;
   if marka = 2 then ToWrite := $00;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   ec(archivo);
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;

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
   Writeln('Deleting using Peter Gutmann Algorithm...');
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
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;

   function Extract(n:string;m:byte):string;
   var i,c:integer;
   r:string;
   begin
   i:=0;
   case m of
   1:begin
   for i := Length(n) downto 0 do if n[i]='\' then begin Inc(c); break; end else Inc(c);
   for i := 1 to c do result := result + n[i];
   end;
   2:begin
   for i := Length(n) downto 0 do if n[i]='.' then begin r:=r+n[i]; break; end else r := r + n[i];
   for i := length(r) downto 0 do result := result + r[i];
   end;
   end;
   end;


   function Rename(f:string):string;
   var i,k:integer;
   NewName,LastName,path,ex:string;
   begin
   LastName := f;
   i := 0;
   path := Extract(f,1);
   ex := Extract(f,2);
   Repeat
   Randomize;
   k := Random(20)+5;
   NewName := path+RandomStr(k)+ex;
   MoveFile(Pchar(LastName),Pchar(NewName));
   LastName := NewName;
   Inc(i);
   Until i = 20;
   Result := LastName;
   end;

   procedure Crow(const archivo:string);
   var arch1:file;
   archivo_:string;
   ToWrite,OxRandom:byte;
   tamano,BytesEscritos,BytesEscritos_,marka:integer;
   label escribe;
   label fin;
   begin
   Writeln('Deleting using Crow Algorithm (by Byt3Cr0w/GEDZAC)...');
   Randomize;
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   ToWrite := 0;
   OxRandom := $4D XOR Random(9999) + 1;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 11 then goto fin;
   if (marka=1) or (marka=3) or (marka=5) or (marka=7) or (marka=9) then ToWrite:=OxRandom;
   if (marka=2) or (marka=4) or (marka=6) or (marka=8) or (marka=10) then ToWrite:=$00;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   Inc(marka);
   goto escribe;
   fin:
   archivo_ := Rename(archivo);
   DeleteFile(pchar(archivo_));
   Writeln('Deleted.');
   end;



   procedure imagefill(const archivo,archivo2:string);
   begin
   CopyFile(Pchar(archivo),Pchar(archivo2));
   end;

   procedure PandoraZ(const archivo,archivo2:string);
   var arch1:file;
       OxRandom,ToWrite:integer;
       tamano,BytesEscritos,BytesEscritos_,marka:integer;
       label escribe;
       label fin;
       label x;
   begin
   Writeln('Deleting using PandoraZ Algorithm (by Byt3Cr0w/GEDZAC)...');
   Randomize;
   BytesEscritos := 0; BytesEscritos_ := 0;
   marka := 1;
   OxRandom := $4D XOR Random(9999) + 1;
   AssignFile(arch1,archivo);
   Reset(arch1,1);
   tamano := FileSize(arch1);
   escribe:
   if marka = 14 then goto fin;
   if (marka=1) or (marka=5) or (marka=9) then begin ec(archivo); goto x; end;
   if (marka=2) or (marka=6) or (marka=10) or (marka=13) then begin imagefill(archivo2,archivo); goto x; end;
   if (marka=3) or (marka=7) or (marka=11) then ToWrite := $00;
   if (marka=4) or (marka=8) or (marka=12) then ToWrite := OxRandom;
   Rewrite(arch1,1);
   Repeat
   BlockWrite(arch1,ToWrite,SizeOf(ToWrite),BytesEscritos_);
   BytesEscritos := BytesEscritos + BytesEscritos_;
   Until (BytesEscritos=tamano) or (BytesEscritos > tamano);
   BytesEscritos := 0; BytesEscritos_ := 0;
   closefile(arch1);
   x:
   Inc(marka);
   goto escribe;
   fin:
   DeleteFile(archivo);
   Writeln('Deleted.');
   end;




   { /////////// ALGORITHMS \\\\\\\\\\\\\ }
   //////////////////////////////////////////////////////////////////////////////



   procedure ShowMsg(const e:byte);
   var head,msg1,msg2,msg3:string;
   begin
   head :='<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>' + sp +
          '<<<<<<<<<<<<<<<<<<<<< GDT 1.0 (BETA) - GEDZAC DELETE TOOL >>>>>>>>>>>>>>>>>>>>>>' + sp +
          '<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>' + sp +
          '         By: Byt3Cr0w/GEDZAC - bytecrow@post.cz - http://www.gedzac.tk'+sp+
          '                     This Software is FREE and OpenSource'+sp+sp;
   msg1 := 'Usage: GDT.exe <algorithm> <if you use the PandoraZ then you have to put another file here> <file to delete>'+sp+'Algorithms:'+sp+sp+' -nm <US Navy, NAVSO P-5239-26 - MFM>'+sp+
           ' -nr <US Navy, NAVSO P-5239-26 - RLL>'+sp+ ' -b <BitToggle>'+sp+
           ' -d <US Department of Defense DoD 5220.22-M'+sp+' -a <US Air Force, AFSSI5020>'+sp+
           ' -na <North Atlantic Treaty Organization - NATO standard>'+sp+
           ' -s <Bruce Schneier Algorithm>'+sp+' -g <Peter Gutmann Algorithm>'+sp+' -c <Crow Algorithm by Byt3Cr0w>'+sp+
           ' -p <PandoraZ Algorithm by Byt3Cr0w>'+sp+sp+
           'Examples: GDT -c C:\file.exe'+sp+
           '          GDT -p C:\image.jpg C:\File_To_Delete.exe'+sp+sp+
           'If you want to know about the algorithms then'+sp+'Use: GDT -?';
   msg1 := head + msg1;
   msg2 := 'The file doesnt exists.';
   msg3 := 'Almost all the Algorithms are already documented, for more info'+sp+
           'you can read my article "Secure Information Mangement On Magnetic Discs"'+sp+
           'Security Level Table:'+sp+sp+'US Navy, NAVSO P-5239-26 - MFM & RLL = Medium'+sp+
           'BitToggle = Medium'+sp+'US Department of Defense (DoD 5220.22-M) = Medium'+sp+
           'US Air Force, AFSSI5020 = Medium'+sp+'North Atlantic Treaty Organization - NATO standard  = HIGH'+sp+
           'Bruce Schneier Algorithm = HIGH'+sp+'Peter Gutmann Algorithm = VERY HIGH'+sp+
           '* Crow Algorithm = HIGH'+sp+'* PandoraZ Algorithm = VERY HIGH'+sp+sp+
           'The algorithms with the * are not documented & are created by me.'+sp+sp+
           'Crow Algorithm:'+sp+'This algorithm will overwrite the file with'+sp+
           'Ox00 & Random values 10 times and then the file will be renamed 20 times'+sp+
           'with random names and finally will be deleted.'+sp+sp+
           'PandoraZ Algorithm:'+sp+'1,5 and 9 Pass = The file will be encrypted with TwoFish'+sp+
           '1,6,10 and 13 Pass = The file will be overwrited with another file'+sp+
           '3,7 and 11 Pass = The file will be overwrited with Ox00 values'+sp+
           '4,8 and 12 Pass = The file will be overwrited with random values.'+sp+sp+
           'P.D = The TwoFish Ecryption Unit (Incluiding the SHA1 unit) was programmed by'+sp+
           'Dave Barton , a Lot of Thanx!';
   case e of
   1: begin
      Writeln(msg1);
      halt(0);
      end;
   2: begin
      Writeln(msg2);
      halt(1);
      end;
   3: begin
      Writeln(msg3);
      halt(0);
      end;
      end;
      end;

   procedure test(const a:string; const b:integer; const c:string);
   begin
   if b = 1 then NAVSO(a,'MFM');
   if b = 2 then NAVSO(a,'X');
   if b = 3 then BitToggle(a);
   if b = 4 then DOD(a);
   if b = 5 then AFSSI(a);
   if b = 6 then NATO(a);
   if b = 7 then Schneier(a);
   if b = 8 then Gutmann(a);
   if b = 9 then Crow(a);
   if b = 10 then PandoraZ(a,c);
   end;


   var a,b,c:string;
       ABOUT:string;
   begin
   ABOUT := 'GDT (GEDZAC DELETE TOOL) V 1.0 (BETA) by Byt3Cr0w/GEDZAC';
   a := paramstr(1);
   b := paramstr(2);
   c := paramstr(3);
   DeleteFile_ := GetApi('kernel32.dll','DeleteFileA');
   CopyFile_ := GetApi('kernel32.dll','CopyFileA');
   WinExec_ := GetApi('kernel32.dll','WinExec');
   MoveFile_ := GetApi('kernel32.dll','MoveFileA');
   if a = '' then ShowMsg(1);
   if a = '-?' then ShowMsg(3);
   if a = '-nm' then test(b,1,'');
   if a = '-nr' then test(b,2,'');
   if a = '-b' then test(b,3,'');
   if a = '-d' then test(b,4,'');
   if a = '-a' then test(b,5,'');
   if a = '-na' then test(b,6,'');
   if a = '-s' then test(b,7,'');
   if a = '-g' then test(b,8,'');
   if a = '-c' then test(b,9,'');
   if a = '-p' then test(c,10,b);
   end.
