   unit untFileManager;

   interface

   uses
     windows, MD5;

     Function GetFileDir(Dir: String): String;

   implementation

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
       FindHandle: THandle  platform;
       FindData: TWin32FindData  platform;
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

   function InttoStr(const Value: integer): string;
   var S: string[11]; begin Str(Value, S); Result := S; end;

   Function GetFileDir(Dir: String): String;
   Var
     Search    :TSearchRec;
     Temp      :String;
     Attr      :String;
   Begin
     If (FindFirst(Dir+'*.*', faDirectory, Search) = 0) Then
     Repeat
       Temp := Dir+#10+Search.Name+#10;
       Temp := Temp + MD5Print(MD5File(Dir+Search.Name))+#10;
       Temp := Temp + IntToStr(Search.Size)+#10;

       Attr := 'xxxxxxx';

       If ((Search.Attr and faDirectory) = faDirectory) Then
       Begin
         Delete(Attr, 1, 1);
         Insert('D', Attr, 1);
       End;

       If ((Search.Attr and faHidden) = faHidden) Then
       Begin
         Delete(Attr, 2, 1);
         Insert('H', Attr, 2);
       End;

       If ((Search.Attr and faSysFile) = faSysFile) Then
       Begin
         Delete(Attr, 3, 1);
         Insert('S', Attr, 3);
       End;

       If ((Search.Attr and faVolumeID) = faVolumeID) Then
       Begin
         Delete(Attr, 4, 1);
         Insert('V', Attr, 4);
       End;

       If ((Search.Attr and faReadOnly) = faReadOnly) Then
       Begin
         Delete(Attr, 5, 1);
         Insert('R', Attr, 5);
       End;

       If ((Search.Attr and faArchive) = faArchive) Then
       Begin
         Delete(Attr, 6, 1);
         Insert('A', Attr, 6);
       End;

       If ((Search.Attr and faAnyFile) = faAnyFile) Then
       Begin
         Delete(Attr, 7, 1);
         Insert('F', Attr, 7);
       End;

       Result := Result + Temp + Attr + #11;
     Until (FindNext(Search) <> 0);
     FindClose(Search);

   End;

   end.
