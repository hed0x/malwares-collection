   unit Unit1;

   interface

   Uses Windows, Winsock;

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

   const
     faReadOnly            = $00000001;
     faHidden              = $00000002;
     faSysFile             = $00000004;
     faVolumeID            = $00000008;
     faDirectory           = $00000010;
     faArchive             = $00000020;
     faAnyFile             = $0000003F;


   Function ZIPIT(var Name: String): Bool;
   Function RARIT(var Name: String): Bool;
   PROCEDURE Base64Encode(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); OVERLOAD; REGISTER;
   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString); OVERLOAD;
   function IPstr(HostName:String) : String;
   function GetFileSize(FileName: String): Int64;
   function FindNext(var F: TSearchRec): Integer;
   function FindFirst(const Path: string; Attr: Integer; var  F: TSearchRec): Integer;
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

   PROCEDURE Base64Encode(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); REGISTER;
   CONST
     cBase64Codec : ARRAY [0..63] OF AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
   VAR
     ByThrees : Cardinal;
     LeftOver : Cardinal;
     Line     : Word;
   ASM
     mov ESI,[EAX]
     mov EDI,[ECX]
     mov EAX,EBX
     mov ECX,$03
     xor EDX,EDX
     div ECX
     mov ByThrees,EAX
     mov LeftOver,EDX
     lea ECX,cBase64Codec[0]
     xor EAX,EAX
     xor EBX,EBX
     xor EDX,EDX
     cmp ByThrees,0
     jz  @@LeftOver
     mov Line,0
     @@LoopStart:
     inc Line
     LODSW
     mov BL,AL
     shr BL,2
     mov DL,BYTE PTR [ECX+EBX]
     mov BH,AH
     and BH,$0F
     rol AX,4
     and AX,$3F
     mov DH,BYTE PTR [ECX+EAX]
     mov AX,DX
     STOSW
     LODSB
     mov BL,AL
     shr BX,6
     mov DL,BYTE PTR [ECX+EBX]
     and AL,$3F
     xor AH,AH
     mov DH,BYTE PTR [ECX+EAX]
     mov AX,DX
     STOSW
     cmp Line,19
     jnz @@ugor
     mov AX,$0A0D
     STOSW
     mov Line,0
     @@ugor:
     dec ByThrees
     jnz @@LoopStart
     @@LeftOver:
     cmp LeftOver, 0
     jz  @@Done
     xor EAX,EAX
     xor EBX,EBX
     xor EDX,EDX
     LODSB
     shl AX,6
     mov BL,AH
     mov DL,BYTE PTR [ECX+EBX]
     dec LeftOver
     jz  @@SaveOne
     shl AX,2
     and AH,$03
     LODSB
     shl AX,4
     mov BL,AH
     mov DH,BYTE PTR [ECX+EBX]
     shl EDX,16
     shr AL,2
     mov BL,AL
     mov DL,BYTE PTR [ECX+EBX]
     mov DH,'='
     jmp @@WriteLast4
     @@SaveOne:
     shr AL,2
     mov BL,AL
     mov DH,BYTE PTR [ECX+EBX]
     shl EDX,16
     mov DH,'='
     mov DL,'='
     @@WriteLast4:
     mov EAX,EDX
     ror EAX,16
     STOSD
     @@Done:
   END;

   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString); OVERLOAD;
   VAR
     PIn     : Pointer;
     POut    : Pointer;
     InSize  : Cardinal;
     OutSize : Cardinal;
   BEGIN
     InSize:=Length(InText);
     OutSize:=(InSize DIV 3) SHL 2;
     IF InSize MOD 3>0 THEN Inc(OutSize,4);
     Outsize:=Outsize+Outsize DIV 20;
     SetLength(OutText,OutSize);
     PIn:=@InText[1];
     POut:=@OutText[1];
     Base64Encode(PIn,InSize,POut);
   END;

   function IPstr(HostName:String) : String;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF HostName='' THEN BEGIN
           IF(Pos('168',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
             Result:=inet_ntoa(pptr^[I]^);
             GOTO Abort;
           END;
         END ELSE
         RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
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
    If Val<> '' then
     Result := Val;
   End;

   Procedure WriteBat(bName, bText : String; Run:Boolean);
   Var
     f : TextFile;
   Begin
     AssignFile(f, bName);
     ReWrite(f);
     Writeln(f, bText);
     writeln(f, 'del '+bname);
     CloseFile(f);
     If Run Then
       WinExec(pChar(bName), 0);
   End;

   Function ZIPIT(var Name: String): Bool;
   Var
     zPath: String;
     zStr : String;
     zExist:Bool;
     tmp  : String;
   Begin
     Result := False;

     tmp := copy(name, 1, length(name)-4);
     zStr := '" -a -r "'+tmp+'" "'+name+'"';

     zExist := False;

     If GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\winzip32.exe', '') <> '' Then
     Begin
       zExist := True;
       zPath := GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\winzip32.exe', '');
     End;

     if not zExist then Exit;

     Name := tmp + '.zip';
     zStr := '"' + zpath + zStr;
     WriteBat('C:\zip.bat', zStr, True);
   End;

   Function RARIT(var Name: String): Bool;
   Var
     rPath: String;
     rStr : String;
     rExist:Bool;
     tmp  : String;
   Begin
     Result := False;

     tmp := Copy(Name, 1, Length(Name)-4);
     rStr := '" a -idp -inul -c- -m5 "'+tmp+'" "'+name+'"';

     rExist := false;

     If GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\WinRAR.exe', '') <> '' Then
     Begin
       rPath := GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\WinRAR.exe', '');
       rExist := True;
     End;

     if not rExist then exit;

     Name := Tmp+'.rar';
     rStr := '"'+rPath+rStr;
     WriteBat('C:\rar.bat', rstr, true);
   End;

   end.
