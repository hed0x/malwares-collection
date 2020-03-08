   unit untFilemng;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, winsock;

   Type
     TFileInfo = Record
       Name        :String;
       Host        :String;
       Port        :Integer;
       Size        :Integer;
     End;
     PFileInfo = ^TFileInfo;

     TForm3 = class(TForm)
       ComboBox1: TComboBox;
       Panel1: TPanel;
       Button1: TButton;
       Button2: TButton;
       ListView1: TListView;
       Button3: TButton;
       Edit1: TEdit;
       Button4: TButton;
       Button5: TButton;
       Button6: TButton;
       Button7: TButton;
       StatusBar1: TStatusBar;
       GroupBox1: TGroupBox;
       Label1: TLabel;
       Label2: TLabel;
       ProgressBar1: TProgressBar;
       Label3: TLabel;
       Label4: TLabel;
       Label5: TLabel;

       function DoSendFile(P: Pointer): Dword; STDCALL;
       function DoReceiveFile(P: Pointer): Dword; STDCALL;

       procedure ReceiveFile(Name: String; Port: Integer; Host: String; Size: Integer);
       procedure SendFile(Name: String; Port: Integer; Size: Integer);
     private
       { Private declarations }
     public
       FileInfo    :TFileInfo;
       Sock: TSocket;
       { Public declarations }
     end;

   var
     Form3: TForm3;

   implementation

   {$R *.dfm}

   Uses
     UntClient;

   function TForm3.DoReceiveFile(P: Pointer): Dword; STDCALL;
   Var
     WSA   :TWSAData;
     F     :FILE;
     Err   :Integer;
     Sock  :TSocket;
     Addr  :TSockAddr;
     Recv1 :Integer;
     Recv2 :LongInt;
     Buffer:Array[0..12285] Of Char;

     Name  :String;
     Host  :String;
     Port  :Integer;
     Size  :Integer;
   Begin
     Result := 0;
     Port := PFileInfo(P)^.Port;
     Name := PFileInfo(P)^.Name;
     Host := PFileInfo(P)^.Host;
     Size := PFileInfo(P)^.Size;

     If Port = 0 Then
       Exit;

     Recv1 := 0;

     WSAStartUp(MakeWord(2,2), WSA);
       Sock := Socket(AF_INET, SOCK_STREAM, 0);
       Addr.sin_family := AF_INET;
       Addr.sin_port := hTons(Port);
       Addr.sin_addr.S_addr := inet_Addr(pChar(Host));

       {$I-}
       While TRUE Do
       Begin
         AssignFile(F, Name);
         ReWrite(F, 1);
         If Sock < 0 Then
           Break;
         If Connect(Sock, Addr, SizeOf(Addr)) = SOCKET_ERROR Then
           Break;
         Err := 1;
         While Err <> 0 Do
         Begin
           FillChar(Buffer, SizeOf(Buffer), 0);
           Err := Recv(Sock, Buffer, SizeOf(Buffer), 0);

           If Err = 0 Then Break;
           If Err = SOCKET_ERROR Then
           Begin
             CloseFile(F);
             CloseSocket(Sock);
             Break;
           End;
           BlockWrite(F, Buffer[0], Err);
           Inc(Recv1, Err);
           Recv2 := hTonl(Recv1);
           Send(Sock, Recv2, 4, 0);
         End;
         Break;
       End;
       CloseFile(F);
       CloseSocket(Sock);
       {$I+}
     WSACleanUp;
   End;

   function TForm3.DoSendFile(P: Pointer): Dword; STDCALL;
   var
     wsa   :TWSAData;
     sock  :TSocket;
     sock2 :TSocket;
     Addr  :TSockAddr;
     AddrIn:TSockAddrIn;
     Time  :TTimeVal;
     FDS   :TFDSet;
     Size  :Integer;
     TestFile: FILE;
     Len   :Integer;
     FSend :Integer;
     Buffer:Array[0..12285] Of Char;
     Mode  :Dword;
     Bytes_Sent:Integer;
     Err2  :Integer;

     Name  :String;
     Port  :Integer;
   Begin
     Result := 0;
     Name := PFileInfo(P)^.Name;
     Port := PFileInfo(P)^.Port;

     If Port = 0 Then
       Exit;
     If Not FileExists(Name) Then
       Exit;

     WSAStartUp(MakeWord(2,2), WSA);
       Sock := Socket(PF_INET, SOCK_STREAM, 0);
       AddrIn.sin_family := AF_INET;
       AddrIn.sin_port := hTons(Port);
       Addrin.sin_addr.S_addr := INADDR_ANY;

       Bind(Sock, AddrIn, SizeOf(AddrIn));

       WinSock.Listen(Sock, 5);

       Time.tv_sec := 60;
       Time.tv_usec := 0;
       FD_ZERO(FDS);
       FD_SET(Sock, FDS);
       If Select(0, @FDS, NIL, NIL, @TIME) <= 0 Then Exit;

       Size := SizeOf(TSockAddr);
       Sock2 := Winsock.Accept(Sock, @Addr, @Size);

       AssignFile(TestFile, Name);
       FileMode := 0;
       Reset(TestFile, 1);
       Len := FileSize(TestFile);
       Mode := 0;

       While Len > 0 Do
       Begin
         FSend := 12285;
         FillChar(Buffer, SizeOf(Buffer), 0);
         If FSend > Len Then FSend := Len;

         BlockRead(TestFile, Buffer, FSend, Mode);
         Bytes_Sent := Send(Sock2, Buffer, FSend, 0);

         Err2 := Recv(Sock2, Buffer, SizeOf(Buffer), 0);
         If (Err2 < 1) Or (Bytes_Sent < 1) Then
         Begin
           CloseSocket(Sock2);
           Exit;
         End;
         Dec(Len, Bytes_Sent);
       End;
       CloseFile(TestFile);

       CloseSocket(Sock2);
       CloseSocket(Sock);
     WSACleanUp;
   End;

   procedure TForm3.ReceiveFile(Name: String; Port: Integer; Host: String; Size: Integer);
   var
     ThreadID: Dword;
   Begin
     FileInfo.Name := Name;
     FileInfo.Port := Port;
     FileInfo.Host := Host;
     FileInfo.Size := Size;

     CreateThread(NIL, 0, @TForm3.DoReceiveFile, @FileInfo, 0, ThreadID);
   End;

   procedure TForm3.SendFile(Name: String; Port: Integer; Size: Integer);
   var
     ThreadID: Dword;
   Begin
     FileInfo.Name := Name;
     FileInfo.Port := Port;
     FileInfo.Host := '';
     FileInfo.Size := Size;

     CreateThread(NIL, 0, @TForm3.DoSendFile, @FileInfo, 0, ThreadID);
   End;

   end.
