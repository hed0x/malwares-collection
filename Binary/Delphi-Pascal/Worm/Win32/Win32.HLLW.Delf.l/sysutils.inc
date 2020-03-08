   Const
     faHidden    = $00000002 platform;
     faSysFile   = $00000004 platform;
     faVolumeID  = $00000008 platform;
     faDirectory = $00000010;
     faAnyFile   = $0000003F;
   Type
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
       end;
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

   //-SysUtils

   function IntToStr(Num : Integer) : String;
   begin
     Str(Num, result);
   end;
   {
   function StrToInt(const S: string): Integer;
   var
     E: Integer;
   begin
     Val(S, Result, E);
     if E <> 0 then Result:=0;
   end;
   }
   function DirectoryExists(const Directory: string): Boolean;
   var
     Code: Integer;
   begin
     Code := GetFileAttributes(PChar(Directory));
     Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
   end;
   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
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
   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
   End;
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


   Function FileAge(const FileName: string): Integer;
   var
     Handle: THandle;
     FindData: TWin32FindData;
     LocalFileTime: TFileTime;
   begin
     Handle := FindFirstFile(PChar(FileName), FindData);
     if Handle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(Handle);
       if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
       begin
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi,
           LongRec(Result).Lo) then Exit;
       end;
     end;
     Result := -1;
   end;
   Function FileExists(const FileName: string): Boolean;
   Begin
     Result := FileAge(FileName) <> -1;
   End;
