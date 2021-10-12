   unit api;

   interface

   uses windows,winsock;

   function getIPs: string;

   implementation

   //-------------------------------------
   function IPAddrToName(IPAddr : String): String;
   var
     SockAddrIn: TSockAddrIn;
     HostEnt: PHostEnt;
     WSAData: TWSAData;
   begin
     WSAStartup($101, WSAData);
     SockAddrIn.sin_addr.s_addr:= inet_addr(PChar(IPAddr));
     HostEnt:= gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);
     if HostEnt<>nil then
     begin
       result:=(Hostent^.h_name)
     end
     else
     begin
       result:='';
     end;
   end;
   //-------------------------------------
   function getIPs: string;
   type
     TaPInAddr = array[0..10] of PInAddr;
     PaPInAddr = ^TaPInAddr;
   var
     phe: PHostEnt;
     pptr: PaPInAddr;
     Buffer: array[0..63] of Char;
     I: Integer;
     GInitData: TWSAData;
   begin
     WSAStartup($101, GInitData);
     GetHostName(Buffer, SizeOf(Buffer));
     phe := GetHostByName(buffer);
     if phe = nil then Exit;
     pPtr := PaPInAddr(phe^.h_addr_list);
     I    := 0;
     Result:='';
     while pPtr^[I] <> nil do
     begin
       If Result='' then Result:=inet_ntoa(pptr^[I]^)+':'+IPAddrToName(inet_ntoa(pptr^[I]^))
       else
       Result:=REsult+' | '+inet_ntoa(pptr^[I]^)+':'+IPAddrToName(inet_ntoa(pptr^[I]^));
       Inc(I);
     end;
     WSACleanup;
   end;
   //-------------------------------------------------------
   //-------------------------------------------------------


   end.
