   {

     Requested sourcecode for p0ke.no-ip.com page.
     use this as you want, but remember its only
     open source code for educational purposes.

     If you do not agree to take responsibility
     for any actions/damage made by this sourcecode
     (after your own modifications/compile) then
     close this project at once.
     The only responsible for anything here is you.

     (c) p0ke.no-ip.com 2005

     This unit contains the search-engine for the
     worm. Changing/modifying anything might result
     into errors, so unless you know what you are
     doing, leave it as it is.

     Note:
       This sourcecode is uncommented for more advanced coders.
       A sourcecode with comments will be release at p0ke.no-ip.com

   }

   unit flipscan;

   interface

   uses
     windows;

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

     function FindNext(var F: TSearchRec): Integer;
     function FindFirst(const Path: string; Attr: Integer;var  F: TSearchRec): Integer;
     procedure FindClose(var F: TSearchRec);
     function FindMatchingFile(var F: TSearchRec): Integer;

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

   end.
