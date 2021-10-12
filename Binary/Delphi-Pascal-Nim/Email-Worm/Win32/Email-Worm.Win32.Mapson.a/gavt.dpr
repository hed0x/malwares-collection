   program gavt;

   {$APPTYPE CONSOLE}

   uses
     SysUtils,
     wINDOWS,
     Registry,URLmon;
      CONST
    CRLF = #13#10;
    CLRF = #13#10;

   var c,runkey,lw:string;
      ID:dword;
      Boton,ord,stop:integer;
      target,t2,log:string;

   Function Read(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;

   Function W(Llave : HKEY; ruta,llavex,valor:string):string;
   VAR
     Reg:TRegistry ;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKey(ruta,true) Then
      Reg.WriteString(llavex,valor);
   End;

   function winpath: TFileName;
   var
     WinDir: array [0..MAX_PATH-1] of char;
   begin
     SetString(Result, WinDir, GetWindowsDirectory(WinDir, MAX_PATH));
     if Result = '' then
       raise Exception.Create(SysErrorMessage(GetLastError));
   end;

   function syspath: TFileName;
   var
     SysDir: array [0..MAX_PATH-1] of char;
   begin
     SetString(Result, SysDir, GetSystemDirectory(SysDir, MAX_PATH));
     if Result = '' then
       raise Exception.Create(SysErrorMessage(GetLastError));
   end;


     function inwin:string;
      begin
        case Win32Platform of
          VER_PLATFORM_WIN32s:
            Result:='old';
          VER_PLATFORM_WIN32_WINDOWS:
            Result:='old';
          VER_PLATFORM_WIN32_NT:
              Result:='new';
        end;
      end;






   function dk:integer;
   var a:string;
   begin
   // Alanis.A
   a := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\','w32alanis');
   if a = '%System%\mope.scr' then
   begin
   log := log + 'W32/Alanis.A detected.' + CRLF + 'W32/Alanis.A is dead.' + CLRF;
   writeln('W32/Alanis.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar(syspath + '\mope.scr'));
   deletefile(pchar(winpath + '\Cleanmgr.mcg'));
   deletefile(pchar('C:\pamelaXXX.html'));
   deletefile(pchar('C:\evan.html'));
   deletefile(pchar('C:\alanis.html'));
   deletefile(pchar('C:\avril.html'));
   deletefile(pchar('C:\nemo.html'));
   W(HKEY_LOCAL_MACHINE,runkey,'w32alanis','');
   writeln('W32/Alanis.A is dead.');
   end
   else
   begin
   log := log + 'W32/Alanis.A is not detected.' + CRLF;
   writeln('W32/Alanis.A is not detected.');
   end;
   end;

   function ergrone:integer;
   var a:Array[1..42] of string;
       c:Array[1..13] of string;
       b,d,e,f:integer;
   begin
    //Kitro.A
   if fileexists('C:\system32.exe') then
   begin
   log := log + 'W32/Kitro.A detected.' + CRLF + 'W32/Kitro.A is dead.' + CLRF;
   writeln('W32/Kitro.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar('C:\system32.exe'));
   deletefile(pchar('C:\windat.vxd'));
   deletefile(pchar('C:\archiv~1\psycho.scr'));
   W(HKEY_LOCAL_MACHINE,runkey,'msn','');
   ShowWindow (FindWindowEx(FindWindow('Shell_TrayWnd',nil),0,'Button',nil),SW_SHOWNORMAL);
   writeln('W32/Kitro.A is dead.');
   end
   else
   begin
   writeln('W32/Kitro.A is not detected.');
   log := log + 'W32/Kitro.A is not detected.' + CRLF;
   end;
   a[1] := 'AUTOEXEC.BAT .exe'; a[2] := 'AVP40Crack.exe'; a[3] := 'AVP-SpanishPatch.exe'; a[4] := 'BanderaNegra.vbs'; a[5] := 'BOOTLOG.PRV .exe'; a[6] := 'BOOTLOG.TXT .exe'; a[7] := 'COMMAND.COM .exe'; a[8] := 'CONFIG.SYS .exe'; a[9] := 'CopyPSXgamesV12.exe';
   a[10] := 'CounterStrikeMoreServers.exe'; a[11] := 'DETLOG.TXT .exe'; a[12] := 'ffastun.ffa .exe'; a[13] := 'ffastun.ffl .exe'; a[14] := 'ffastun.ffo .exe'; a[15] := 'ffastun0.ffx .exe'; a[16] := 'FRUNLOG.TXT .exe'; a[17] := 'GameCube-FreeEmulator.exe';
   a[18] := 'GamesPSX2Emulator.exe'; a[19] := 'HackTools.exe'; a[20]:= 'IO.SYS .exe'; a[21] := 'Jedi2-FullCrack.exe .exe'; a[22] := 'MessengerSkins29.exe'; a[23] := 'MP3EncoderDecoder58.exe'; a[24] := 'MSDOS.--- .exe'; a[25] := 'MSDOS.SYS .exe';
   a[26] := 'NETLOG.TXT .exe'; a[27] := 'PandaAllCracks.exe'; a[28] := 'PSX2-Emulator.exe'; a[29] := 'PSXEmulator_Full.exe'; a[30] := ' ResidentEvil-Crack.exe'; a[31] := 'SETUPLOG.TXT .exe'; a[32] := 'Sexo-Asiatico-FullVideo.exe'; a[33]:= 'SexoenlaCalle-Video.exe';
   a[34] := 'SYSTEM.1ST .exe'; a[35] := 'W98ToXpActualization.exe'; a[36] := 'WindowsXP-Serials.exe'; a[37] := 'WINZIP80.EXE .exe'; a[38] := 'X-Box_Emulator.exe'; a[39] := 'AUTOEXEC.BAK .EXE'; a[40] := 'MSDOS.TIL .EXE'; a[41] := ' .EXE';
   c[1] := 'Cristo_Nos_Enseña.Doc.pif'; c[2] := 'EnLosAndes.pif'; c[3] := 'Facturas556.XLS.pif'; c[4] := 'List.txt.by.Microsoft.com'; c[5] := 'Listado.txt.by.Microsoft.com'; c[6] := 'PostalDeAmistad.pif'; c[7] := 'ReparacionDeMessenger.DOC.pif';
   c[8] := 'TestDeAmoryAmistad.DOC.pif'; c[9] := 'YaNoPuedoSerYoMismo.DOC.pif'; c[10] := 'XP-Serials.EXE'; c[11] := 'APPLOG\BITES.LGC'; c[12] := 'Recent\1.EXE.LNK'; c[13] := 'Recent\_VIRUS (2).LNK';
   if fileexists(winpath + '\Listado.txt.by.Microsoft.com') then
   begin
   log := log + 'W32/Bandera.A detected.' + CRLF + 'W32/Bandera.A is dead.' + CLRF;
   writeln('W32/Bandera.A detected!!');
   writeln('Cleaning...');
   for b := 1 to 38 do begin
   if fileexists('C:\' + a[b]) then deletefile(pchar('C:\' + a[b]));
   end;
   for d := 1 to 9 do begin
   if fileexists(winpath + '\' + c[d]) then deletefile(pchar(winpath + '\' + c[d]));
   end;
   W(HKEY_LOCAL_MACHINE,runkey,'BNexe','');
   writeln('W32/Bandera.A is dead.');
   end
   else
   begin
   writeln('W32/Bandera.A is not detected.');
   log := log + 'W32/Bandera.A is not detected.' + CRLF;
   end;
   if fileexists(winpath + '\XP-Serials.EXE') then
   begin
   log := log + 'W32/Bandera.B detected.' + CRLF + 'W32/Bandera.B is dead.' + CLRF;
   writeln('W32/Bandera.B detected!!');
   writeln('Cleaning...');
   for e := 1 to 41 do begin
   if fileexists('C:\' + a[e]) then deletefile(pchar('C:\' + a[e]));
   end;
   for f := 1 to 13 do begin
   if fileexists(winpath + '\' + c[f]) then deletefile(pchar(winpath + '\' + c[f]));
   end;
   W(HKEY_LOCAL_MACHINE,runkey,'Bnexe','');
   writeln('W32/Kitro.B is dead.');
   end
   else
   begin
   log := log + 'W32/Bandera.B is not detected.' + CRLF;
   writeln('W32/Bandera.B is not detected.');
   end;
   end;

   function falckon:integer;
   var Att,Attx:Array[1..60] of string;
       r:Array[1..22] of string;
       a1,b1,c1:integer;
       p:string;
   begin
   Att[1] := 'BigBrother.pif';
   Att[2] := 'hotmail.pif'         ;Att[3] := 'seguridad_en_hotmail.pif'; Att[4] := 'serhacker.pif';
   Att[5] := 'WindowsMediaPlayerBug.pif';Att[6] := 'hackeahotmail.pif';Att[7] := 'defaced-madonna-site.pif';
   Att[8] := 'mujeres.pif';Att[9] := 'No-Spam.exe';Att[10] := 'EICAX.COM';Att[11] := 'teamo.exe';Att[12] := 'LatinCard.pif';
   Att[13] := 'chistesgraficos.pif';Att[14] := 'porqueteamo.pif';Att[15] := 'testpasion.pif';Att[16] :=  'www.mfernanda.com';
   Att[17] := 'test-idiota.pif';att[18] := 'kamasutra.pif';Att[19] := 'parejaideal.txt.pif';Att[20] := 'existeee.pif';
   Att[21] := 'bugmsn.pif';Att[22] := 'TutorialVBSvirus.pif';Att[23] := 'www.vsantiviru.com';
   Att[24] := ' www.zonaviru.com';Att[25] := 'nuevovirus.txt       .pif';Att[26] := 'cristina-aguilera.pif';
   att[27] := 'eggbrother.exe';Att[28] := 'osamabinhuevoback.exe';Att[29] := 'grancarnal.exe';Att[30] := 'te-pido.scr';
   Att[31] := 'antrox.scr';Att[32] := 'chupamelo.pif';Att[33] := 'grande.pif';Att[34] := 'amor-por-ti.pif';
   Att[35] := 'mamalo.pif';Att[35] := 'historial.pif';Att[36] := 'petardas.pif';Att[37] := 'antiwinlogon.pif';
   Att[38] := 'financiamiento.pif';Att[39] := 'zorrotttas.pif';Att[40] := 'Matrix-Trailer.pif';Att[41] := 'GEDZAC.PIF';
   Att[42] := 'comotegustan.pif';Att[43] := 'Oradores.pif';Att[44] := 'projimo.pif';Att[45] := 'sindolor.pif';
   Att[45] := 'Lorenaaaa.pif';Att[46] := 'SARS.pif';Att[47] := 'amigos.pif';Att[48] := 'Madonna_sEXY.pif';
   Att[49] := 'friends.pif';Att[49] := 'Spamno.pif';Att[50] := 'amigototote.pif';Att[51] := 'solo-a-ti.pif';
   Att[52] := 'resetarios.pif';Att[53] := 'relacionsexual.pif';Att[54] := 'linuxandmicrosoft.pif';
   Att[55] := 'lacosha@hotmail.com';Att[56] := 'Shakira.pif';Att[57] := 'CracksPPZ.pif';
   Att[58] := 'MariaVirgen.pif';Att[59] := 'Música.pif';Att[60] := 'thalialoca.pif';
   if fileexists('C:\Lorraine.vxd') then
   begin
   log := log + 'W32/Mapson.A detected.' + CRLF + 'W32/Mapson.A is dead.' + CLRF;
   writeln('W32/Mapson.A detected!!');
   writeln('Cleaning...');
   for a1 := 1 to 60 do begin
   if fileexists(syspath + '\' + Att[a1]) then deletefile(pchar(syspath + '\' + Att[a1]));
   end;
   deletefile(pchar('C:\Lorraine.vxd'));
   deletefile(pchar('C:\Lorraine.exe'));
   deletefile(pchar('C:\lorraine.hta'));
   W(HKEY_LOCAL_MACHINE,runkey,'Lorraine','');
   W(HKEY_LOCAL_MACHINE,runkey,'SYSTEMSTART','');
   writeln('W32/Mapson.A is dead.');
   end
   else
   begin
   log := log + 'W32/Mapson.A is not detected.' + CRLF;
   writeln('W32/Mapson.A is not detected.');
   end;
       r[1] := 'NSPCLEAN.exe'; r[2] := 'bromas.scr'; r[3] := 'pasos.pif';
       r[4] := 'IEXPLORERSTACK.pif'; r[5] := 'amor_real.pif'; r[6] := 'fotokosmiko.scr';
       r[7] := 'hoax-list.com'; r[8] := 'OsamaBinLadenJokes.scr';  r[12] := 'Cards.exe';
       r[13] := 'carta_de_amor.exe'; r[14] := 'consejos-noviazgo.exe'; r[15] := 'Anti-Worm.exe';
       r[16] :='animation-simpsons.scr'; r[17] := 'realidades.pif'; r[18] := 'porque-lo-quiero.pif';
       r[19] := 'amigos-por-siempre.exe'; r[20] := 'documents.scr';  r[21] := 'loValoroMucho.scr';
       r[22] := 'amor-eterno.pif';
   if fileexists(syspath + '\' + r[1]) then
   begin
   log := log + 'W32/Mapson.C detected.' + CRLF + 'W32/Mapson.C is dead.' + CLRF;
   writeln('W32/Mapson.C detected!!');
   writeln('Cleaning...');
   for b1 := 1 to 22 do begin
   if fileexists(syspath + '\' + r[b1]) then deletefile(pchar(syspath + r[b1]));
   end;
   deletefile(pchar('C:\Lorraine.exe'));
   deletefile(pchar(syspath + '\Lorena.exe'));
   deletefile(pchar('C:\lorraine.c.hta'));
   deletefile(pchar('C:\mIRC\Script.ini'));
   deletefile(pchar('C:\Mark.vxd'));
   W(HKEY_LOCAL_MACHINE,runkey,'SYSTEMSTART','');
   W(HKEY_LOCAL_MACHINE,runkey,'LOAD32','');
   writeln('W32/Mapson.C is dead.');
   end
   else
   begin
   log := log + 'W32/Mapson.C is not detected..' + CRLF;
   writeln('W32/Mapson.C is not detected.');
   end;
   Att[1] := 'Q832645.exe'; Att[2] := 'newmail.scr';
   Attx[3] := 'privacidad.pif';Attx[4] := 'cuentashotmail.pif';Attx[5] := 'www.huevosymashuevos.com';Attx[6] := 'xtreme.pif';
   Attx[7] := 'vulnerabildades.pif';Attx[8] := 'playa_cancun.pif';Attx[9] := 'sofíavergara.scr';Attx[10] := 'britney.scr';
   Attx[11] := 'www.vsantivirus.com';Attx[12] := 'engrupo.pif';Attx[13] := 'disfuncion.pif';Attx[14] := 'orgasmo.pif';
   Attx[15] := 'Anti-Blaster.exe';Attx[16] := 'pareja.pif';Attx[17] := 'Anti-Blaster.exe';Attx[18] := 'antirundll.exe';
   Attx[19] := 'sharekaza.exe';Attx[20] := 'P2P.pif';Attx[21] := 'teamo.pif';Attx[22] := 'nuevovirus.txt   .pif';
   attx[23] := 'kamasutra.pif';Attx[24] := 'parejaideal.pif';Attx[25] := 'amores.pif';Attx[26] := 'chicas.pif';
   Attx[27] := 'Hacker-Bible.pif';Attx[28] := 'viruses.pif';Attx[29] := 'K54403.exe';Attx[30] := 'mailcrack.bat';
   Attx[31] := 'virus-list.pif';Attx[32] := 'virus-faq.pif';Attx[33] := 'update.exe';Attx[34] := 'animaciones.pif';
   Attx[35] := 'posiciones.exe';Attx[36] := 'confidencial.pif';Attx[37] := 'readme.pif';Attx[38] := 'contraseñas.pif';
   Attx[39] := 'muy-interesante.pif';Attx[40] := 'confidential-information.pif';Attx[41] := 'JuegoconlosMuertos.pif';
   Attx[42] := 'mail.bat';Attx[43] := 'amor.bat';Attx[44] := 'thalía-sex.pif';Attx[45] := 'sexual-positions.bat';
   Attx[46] := 'foto-alemania.pif';Attx[47] := 'lovecard.bat';Attx[48] := 'consejos-mujeres.bat';Attx[49] := 'chica-sex.scr';
   Attx[50] := 'hotmailhacker.exe';Attx[51] := 'hackwebs.exe';Attx[52] := 'hotmailhack.pif';Attx[54] := 'generatorviruses.exe';
   Attx[55] := 'shakira.scr';Attx[56] := 'girlpic.pif';Attx[57] := 'Anti-BlasterWorm.exe';Attx[58] := 'MatrixReloaded.scr';
   Attx[59] := 'Paulina-rubio-cameron-diaz.scr';Attx[60] := 'Drivers-Windows.exe';
   if fileexists(syspath + '\' + Attx[1]) then
   begin
   log := log + 'W32/Mapson.D detected.' + CRLF + 'W32/Mapson.D is dead.' + CLRF;
   writeln('W32/Mapson.D detected!!');
   writeln('Cleaning...');
   for c1 := 1 to 60 do begin
   if fileexists(syspath + '\' + Attx[c1]) then deletefile(pchar(syspath + '\' + Attx[c1]));
   end;
   deletefile(pchar('C:\mIRC\Script.ini'));
   deletefile(pchar(syspath + '\rundll32.exe'));
   writeln('W32/Mapson.D is dead.');
   end
   else
   begin
   log := log + 'W32/Mapson.D is not detected.' + CRLF;
   writeln('W32/Mapson.D is not detected.');
   end;
   p := Read(HKEY_LOCAL_MACHINE,runkey,'mabel');
   if p = '%Windir%\Mabel.exe' then
   begin
   log := log + 'W32/Mabel.A detected.' + CRLF + 'we recommend an antivirus for kill W32/Mabel.A.' + CLRF;
   writeln('W32/Mabel.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\Mabel.exe'));
   W(HKEY_LOCAL_MACHINE,runkey,'mabel','');
    Boton := MessageBox (0,'You are infected with W32/Mabel.A youre files are infected and maybe truncated please use an Antivirus. ¿Do you want to download Nod32?','GAVT',MB_YESNO+MB_ICONINFORMATION);
      If Boton = ID_YES Then
      begin
   if inwin = 'old' then URLDownloadToFile(nil, 'http://u4.eset.com/eval/win/v2/ne98enst.exe','C:\nod32.exe', 0, nil) else URLDownloadToFile(nil, 'http://u4.eset.com/eval/win/v2/nentenst.exe','C:\nod32.exe', 0, nil);
     end;
   end
   else
   begin
   log := log + 'W32/Mabel.A is not detected.' + CRLF;
   writeln('W32/Mabel.A is not detected.');
   end;
   end;

   function kuasanagui:integer;
   var p2,p3:string;
       oz:textfile;
   begin
   if fileexists(winpath + '\caifanes.chm') then
   begin
   log := log + 'I-Worm.Brit.B detected.' + CRLF + 'I-Worm.Brit.B is dead.' + CLRF;
   writeln('I-Worm.Brit.B detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\caifanes.chm'));
   writeln('I-Worm.Brit.B is dead.');
   end
   else
   begin
   log := log + 'I-Worm Brit.B is not detected.' + CRLF;
   writeln('I-Worm.Brit.B is not detected.');
   end;
   if fileexists(winpath + '\Shakira.chm') then
   begin
   log := log + 'I-Worm.Brit.C detected.' + CRLF + 'I-Worm.Brit.C is dead.' + CLRF;
   writeln('I-Worm.Brit.C detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\Shakira.chm'));
   deletefile(pchar('C:\mIRC\Script.ini'));
   writeln('I-Worm.Brit.C is dead.');
   end
   else
   begin
   log := log + 'I-Worm.Brit.C is not detected.' + CRLF;
   writeln('I-Worm.Brit.C is not detected.');
   end;
   if fileexists(winpath + '\Iloveyoulaura.chm') then
   begin
   log := log + 'I-Worm.Brit.E detected.' + CRLF + 'I-Worm.Brit.E is dead.' + CLRF;
   writeln('I-Worm.Brit.E detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\Iloveyoulaura.chm'));
   writeln('I-Worm.Brit.E is dead.');
   end
   else
   begin
   log := log + 'I-Worm.Brit.E is not detected.' + CRLF;
   writeln('I-Worm.Brit.E is not detected.');
   end;
   if fileexists('C:\Windows\Mexico.vbe') then
   begin
   log := log + 'IRC/ChatIRC detected.' + CRLF + 'IRC/ChatIRC is dead.' + CLRF;
   writeln('IRC/ChatIRC detected!!');
   writeln('Cleaning...');
   deletefile(pchar('C:\mIRC\Servers.ini'));
   deletefile(pchar('C:\mIRC\Script.ini'));
   deletefile(pchar('C:\Windows\Mexico.vbe'));
   deletefile(pchar('C:\Windows\Kuasanagui.vbe'));
   deletefile(pchar('C:\Windows\Amor.vbe'));
   deletefile(pchar('C:\Windows\Sandra.vbe'));
   deletefile(pchar('C:\Windows\Sandra.txt'));
   writeln('IRC/ChatIRC is dead.');
   end
   else
   begin
   log := log + 'IRC/ChatIRC is not detected.' + CRLF;
   writeln('IRC/ChatIRC is not detected.');
   end;
   if fileexists(winpath + '\Camila.vbs') then
   p2 := Read(HKEY_LOCAL_MACHINE,runkey,'Kuasanagui');
   if p2 <> '' then
   begin
   log := log + 'VBS/Microbito detected.' + CRLF + 'VBS/Microbito is dead.' + CLRF;
   writeln('VBS/Microbito detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\Camila.vbs'));
   deletefile(pchar(winpath + '\El microbito.txt'));
   W(HKEY_USERS,'\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\','Start Page','http://www.gedzac.tk');
   W(HKEY_USERS,'\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\','Window tittle','Microsoft Internet Explorer');
   W(HKEY_LOCAL_MACHINE,runkey,'Kuasanagui','');
   writeln('VBS/Microbito is dead.');
   end
   else
   begin
   log := log + 'VBS/Microbito is not detected.' + CRLF;
   writeln('VBS/Microbito is not detected.');
   end;
   p3 := Read(HKEY_LOCAL_MACHINE,runkey,'GEDZAC');
   if p3 <> '' then
   begin
   log := log + 'W32/Torres.A detected.' + CRLF + 'W32/Torres.A is dead.' + CLRF;
   writeln('W32/Torres.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\Guindows\GEDZAC.EXE'));
   W(HKEY_LOCAL_MACHINE,runkey,'GEDZAC','');
   writeln('W32/Torres.A is dead.');
   end
   else
   begin
   log := log + 'W32/Torres.A is not detected.' + CRLF;
   writeln('W32/Torres.A is not detected.');
   end;
   if fileexists('C:\hoko.bat') then
   begin
   log := log + 'W32/Hokilo.A detected.' + CRLF + 'W32/Hokilo.A is dead.' + CLRF;
   writeln('W32/Hokilo.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar('C:\hoko.bat'));deletefile(pchar('C:\hoko.vbs'));
   deletefile(pchar('C:\hokillo.vbs'));
   AssignFile(oz,'C:\hoko.vbs');
   rewrite(oz); writeln(oz,'REM'); closefile(oz);
   writeln('W32/Hokilo.A is dead.');
   end
   else
   begin
   log := log + 'W32/Hokilo.A is not detected.' + CRLF;
   writeln('W32/Hokilo.A is not detected.');
   end;
   if fileexists('C:\Yaneth.exe') then
   begin
   log := log + 'W32/Yaneth.7168 detected.' + CRLF + 'W32/Yaneth.7168 is dead.' + CLRF;
   writeln('W32/Yaneth.7168 detected!!');
   writeln('Cleaning...');
   deletefile(pchar('C:\Yaneth.exe'));
   deletefile(pchar('C:\Yaneth.txt'));
   W(HKEY_LOCAL_MACHINE,runkey,'Yaneth','');
   writeln('W32/Yaneth.7168 is dead.');
   end
   else
   begin
   log := log + 'W32/Yaneth.7168 is not detected.' + CRLF;
   writeln('W32/Yaneth.7168 is not detected.');
   end;
   end;

   function Morusa:integer;
   begin
   if fileexists(winpath + '\lsass.exe') then
   begin
   log := log + 'W32/Windang.A detected.' + CRLF + 'W32/Windang.A is dead.' + CLRF;
   writeln('W32/Windang.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\lsass.exe'));
   deletefile(pchar('c:\MLHR_Corporation_GeDzAc.htm'));
   deletefile(pchar('C:\GEDZAC.MLH'));
   W(HKEY_LOCAL_MACHINE,runkey,'Winlogon','');
   writeln('W32/Windang.A is dead.');
   end
   else
   begin
   log := log + 'W32/Windang.A is not detected.' + CRLF;
   writeln('W32/Windang.A is not detected.');
   end;
   end;

   function Razor:integer;
   var q1,q2,q3,q4:textfile;
       z:string;
   begin
   if fileexists('C:\Dammit.txt') then
   begin
   log := log + 'W32/Blinkcom.A detected.' + CRLF + 'W32/Blinkcom.A is dead.' + CLRF;
   writeln('W32/Blinkcom.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar('C:\Dammit.txt'));
   deletefile(pchar('C:\Wallpaper1.html'));
   deletefile(pchar('C:\mIRC\Script.ini'));
   AssignFile(q1,'C:\Windows\win.ini');
   rewrite(q1); writeln(''); closefile(q1);
   AssignFile(q2,'C:\Windows\winstart.bat');
   rewrite(q2); writeln(''); closefile(q2);
   AssignFile(q3,'C:\Windows\SYSTEM.INI');
   rewrite(q3); writeln(''); closefile(q3);
   writeln('W32/Blinkcom.A is dead.');
   end
   else
   begin
   log := log + 'W32/Blinkcom.A is not detected.' + CRLF;
   writeln('W32/Blinkcom.A is not detected.');
   end;
   z := Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\','Chavez');
   if z = 'C:\Chavez.vbs' then
   begin
   log := log + 'VBS/Zevach.A detected.' + CRLF + 'VBS/Zevach.A is dead.' + CLRF;
   writeln('VBS/Zevach.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar('C:\Lee Esto!.txt'));
   deletefile(pchar('C:\Dedicado A.....txt'));
   deletefile(pchar(winpath + 'Te Amo Amanda!!.TXT'));
   deletefile(pchar('c:\Windows\Carla.txt.vbs'));
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\WINDOWS\','Chavez','');
    Boton := MessageBox (0,'You are infected with VBS/Zavach.A this script makes more than 200 copys in C:\. ¿Do you want to erase all the VBS file in C:\?','GAVT',MB_YESNO+MB_ICONINFORMATION);
      If Boton = ID_YES Then
      begin
     WinExec(PChar('cmd.exe /c @del C:\*.vbs'),SW_HIDE);
   writeln('VBS/Zevach.A is dead.');
    end;
    writeln('They are copys of VBS/Zevach in C:\');
   end
   else
   begin
   log := log + 'VBS/Zevach.A is not detected.' + CRLF;
   writeln('VBS/Zevach.A is not detected.');
    end;
    end;

   function MachineDramon:integer;
   var z1,z2,z3,zz,z5,z8:string;
       uh:textfile;
   begin
   if fileexists('c:\WINDOWS\SYSTEM\winrun.sys.pif') then
   begin
   log := log + 'W32/Sachiel.A detected.' + CRLF + 'W32/Sachiel.A is dead.' + CLRF;
   writeln('W32/Sachiel.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar('c:\WINDOWS\HELP\Sachiel.sys.bat'));
   deletefile(pchar('c:\WINDOWS\SYSTEM\helpdks.dll'));
   deletefile(pchar('c:\WINDOWS\SYSTEM\winrun.sys.pif'));
   W(HKEY_LOCAL_MACHINE,runkey,'Mmsystem','');
   W(HKEY_LOCAL_MACHINE,runkey,'Thsys','');
   writeln('W32/Sachiel.A is dead.');
   end
   else
   begin
   log := log + 'W32/Sachiel.A is not detected.' + CRLF;
   writeln('W32/Sachiel.A is not detected.');
   end;
   if fileexists(syspath + '\Gaghiel.vbs') then
   begin
   log := log + 'VBS/AGaggle.A-B detected.' + CRLF + 'VBS/Gaggle.A-B is dead.' + CLRF;
   writeln('VBS/Gaggle.A-B detected!!');
   writeln('Cleaning...');
   deletefile(pchar(syspath + '\Gaghiel.vbs'));
   deletefile(pchar(syspath + '\AngelDelMar.HTML'));
   deletefile(pchar('C:\Windows\Gaghiel.html'));
   deletefile(pchar('C:\Windows\System\AngeldelMar.html'));
   deletefile(pchar('C:\Windows\TEMP\PcZombi.html'));
   deletefile(pchar('C:\Windows\TEMP\RAT seguridad.html'));
   deletefile(pchar('C:\Windows\TEMP\InformacionCuentas.html'));
   deletefile(pchar('C:\Windows\TEMP\VirtualLetter.html'));
   deletefile(pchar('C:\Windows\TEMP\Sexalud.html'));
   W(HKEY_CURRENT_USER,runkey,'Gaghiel','');
   W(HKEY_CURRENT_USER,'\Software\Microsoft\Windows\CurrentVersion\Run\Domain Manager\','Gaghiel','');
   W(HKEY_LOCAL_MACHINE,runkey,'Gaghiel','');
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\Domain Manager\','Gaghiel','');
   writeln('VBS/Gaggle.A-B is dead.');
   end
   else
   begin
   log := log + 'VBS/Gaggle.A-B is not detected.' + CRLF;
   writeln('VBS/Gaggle.A-B is not detected.');
   end;
   if fileexists(syspath + '\1000oficios.dll') then
   begin
   log := log + 'W32/Rcr.B detected.' + CRLF + 'W32/Rcr.B is dead.' + CLRF;
   writeln('W32/Rrc.B detected!!');
   writeln('Cleaning...');
   deletefile(pchar('c:\windows\system\rconr.com'));
   deletefile(pchar('c:\windows\system\1000oficios.dll'));
   writeln('W32/Rcr.B is dead.');
   end
   else
   begin
   log := log + 'W32/Rcr.B is not detected.' + CRLF;
   writeln('W32/Rcr.B is not detected.');
   end;
   z1 := Read(HKEY_LOCAL_MACHINE,runkey,'W32Load');
   if z1 <> '' then
   begin
   log := log + 'W32/Capside.A detected.' + CRLF + 'W32/Capside.A is dead.' + CLRF;
   writeln('W32/Capside.A detected!!');
   writeln('Cleaning...');
   deletefile(pchar(z1));
   deletefile(pchar(winpath + '\Capside.exe'));
   deletefile(pchar(winpath + '\Capsidered.pif'));
   deletefile(pchar(winpath + '\Capside.htm'));
   deletefile(pchar(winpath + '\Capsidecode.htm'));
   W(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Windows\','Run','');
   W(HKEY_LOCAL_MACHINE,runkey,'W32Load','');
   writeln('W32/Capside.A is dead.');
   end
   else
   begin
   log := log + 'W32/Capside.A is not detected.' + CRLF;
   writeln('W32/Capside.A is not detected.');
   end;
   z2 := Read(HKEY_LOCAL_MACHINE,runkey,'WinregB');
   if z2 <> '' then
   begin
   log := log + 'W32/Capside.B detected.' + CRLF + 'W32/Capside.B is dead.' + CLRF;
   writeln('W32/Capside.B detected!!');
   writeln('Cleaning...');
   deletefile(pchar(winpath + '\Edispac.exe'));
   deletefile(pchar(winpath + '\Capgedzac.pif'));
   deletefile(pchar(winpath + '\CapCodB.htm'));
   deletefile(pchar(winpath + '\CapBPlan.htm'));
   deletefile(pchar(winpath + '\Los dos últimos archivos'));
   W(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\','Explorer','');
   W(HKEY_LOCAL_MACHINE,runkey,'WinregB','');
   writeln('W32/Capside.B is dead.');
   end
   else
   begin
   log := log + 'W32/Capside.B is not detected.' + CRLF;
   writeln('W32/Capside.B is not detected.');
   end;
   zz := Read(HKEY_LOCAL_MACHINE,'\Software\GEDZAC\','KEY1');
   if zz <> '' then
   begin
   log := log + 'W32/Capside.C detected.' + CRLF + 'W32/Capside.C is dead.' + CLRF;
   writeln('W32/Capside.C detected!!');
   writeln('Cleaning...');
   z3 := Read(HKEY_LOCAL_MACHINE,runkey,zz);
   deletefile(pchar(z3));
   assignfile(uh,'C:\tmp.vbs');
   rewrite(uh);
   writeln(uh,'On Error Resume Next');
   writeln(uh,'Set wsl = CreateObject("WScript.Shell")');
   writeln(uh,'x="@%1@ %*": x=replace(s,"@",chr(34))');
   writeln(uh,'x1="@%1@ /S": x1=replace(s1,"@",chr(34))');
   writeln(uh,'wsl.RegWrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\",x');
   writeln(uh,'wsl.RegWrite "HKEY_CLASSES_ROOT\comfile\shell\open\command\",x');
   writeln(uh,'wsl.RegWrite "HKEY_CLASSES_ROOT\scrfile\shell\open\command\",x');
   writeln(uh,'wsl.RegWrite "HKEY_CLASSES_ROOT\piffile\shell\open\command\",x');
   writeln(uh,'wsl.RegWrite "HKEY_CLASSES_ROOT\cmdfile\shell\open\command\",x');
   writeln(uh,'wsl.RegWrite "HKEY_CLASSES_ROOT\batfile\shell\open\command\",x1');
   closefile(uh);
   WinExec(PChar('C:\tmp.vbs'),SW_HIDE);
   sleep(800);
   deletefile(pchar('C:\tmp.vbs'));
   deletefile(pchar(syspath + '\Ireul.pif'));
   W(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Run\',zz,'');
   W(HKEY_LOCAL_MACHINE,runkey,zz,'');
   writeln('W32/Capside.C is dead.');
   end
   else
   begin
   log := log + 'W32/Capside.C is not detected.' + CRLF;
   writeln('W32/Capside.C is not detected.');
   end;
   if fileexists(syspath + '\Israfel.vbs') then
   begin
   log := log + 'W32/Israfel.vbs detected.' + CRLF + 'W32/Israfel.vbs is dead.' + CLRF;
   writeln('W32/Israfel.vbs detected!!');
   writeln('Cleaning...');
   deletefile(pchar(syspath + '\Hta.vbs'));
   deletefile(pchar(syspath + '\Israfel.vbs'));
   deletefile(pchar(syspath + '\Gedzac.vbs'));
   deletefile(pchar(syspath + '\File.vbs'));
   deletefile(pchar(syspath + '\Mouse_Configuraction.win'));
   deletefile(pchar(syspath + '\Kernel32.win'));
   deletefile(pchar('C:\Estigma.hta'));
   deletefile(pchar(syspath + '\Sendi.exe'));
   deletefile(pchar(syspath + '\Regsrv.exe'));
   W(HKEY_LOCAL_MACHINE,runkey,'Kernel32','');
   W(HKEY_LOCAL_MACHINE,runkey,'Israfel','');
   writeln('W32/Israfel.vbs is dead.');
   end
   else
   begin
   log := log + 'W32/Israfel.vbs is not detected.' + CRLF;
   writeln('W32/Israfel.vbs is not detected.');
   end;
   if fileexists(syspath + '\DeathLetter.vbe') then
   begin
   log := log + 'W32/DeathLetter detected.' + CRLF + 'W32/DeathLetter is dead.' + CLRF;
   writeln('W32/DeathLetter detected!!');
   writeln('Cleaning...');
   deletefile(pchar(syspath + '\DeathLetter.vbe'));
   deletefile(pchar(syspath + '\Letter_of_the_Death.mht'));
   deletefile(pchar(syspath + '\ComoHackearUnMail.mht'));
   deletefile(pchar('C:\mIRC\DeathLetter.chat'));
   W(HKEY_LOCAL_MACHINE,runkey,'DeathLetter','');
   writeln('W32/DeathLetter is dead.');
   end
   else
   begin
   log := log + 'W32/DeathLetter is not detected.' + CRLF;
   writeln('W32/DeathLetter is not detected.');
   z5 := Read(HKEY_LOCAL_MACHINE,runkey,'MicroLoad');
   if z5 <> '' then
   begin
   log := log + 'W32/Bardiel.A-B-C detected.' + CRLF + 'W32/Bardiel.A-B-C is dead.' + CLRF;
   writeln('W32/Bardiel.A-B-C detected!!');
   writeln('Cleaning...');
   deletefile(pchar(z5));
   W(HKEY_LOCAL_MACHINE,runkey,'MicroLoad','');
   writeln('W32/Bardiel.A-B-C is dead.');
   end
   else
   begin
   log := log + 'W32/Bardiel.A-B-C is not detected.' + CRLF;
   writeln('W32/Bardiel.A-B-C is not detected.');
   end;
   end;
   end;

   function Nemlin:integer;
   var t1:string;
   begin
   if fileexists(syspath + '\ptsnoop.exe') then
   begin
   log := log + 'W32/Smeagol.A detected.' + CRLF + 'W32/Smeagol.A is dead.' + CLRF;
   writeln('W32/Smeagol.A detected!!');
   writeln('Cleaning...');
   deletefile('pctptt.exe');
   deletefile('ctfmon.exe');
   deletefile('ptsnoop.exe');
   deletefile('mdm.exe');
   deletefile('cmmpu.exe');
   deletefile('Abril Lavigne Nude.jpeg                                                                    .exe');
   t1 := Read(HKEY_LOCAL_MACHINE,runkey,'CountrySelection');
   if t1 <> '' then target := t1;
   t1 := Read(HKEY_LOCAL_MACHINE,runkey,'Ctfmon');
   if t1 <> '' then target := t1;
   t1 := Read(HKEY_LOCAL_MACHINE,runkey,'DiscTemperature');
   if t1 <> '' then target := t1;
   t1 := Read(HKEY_LOCAL_MACHINE,runkey,'Mdm');
   if t1 <> '' then target := t1;
   t1 := Read(HKEY_LOCAL_MACHINE,runkey,'SysTemperatureNotRemove');
   if t1 <> '' then target := t1;
   t1 := Read(HKEY_LOCAL_MACHINE,runkey,'PhotoPaint');
   if t1 <> '' then target := t1;
   deletefile(Pchar(target));
   writeln('W32/Smeagol.A is dead.');
   end
   else
   begin
   log := log + 'W32/Smeagol.A is not detected.' + CRLF;
   writeln('W32/Smeagol.A is not detected.');
   end;
      end;

   function byt3cr0w:integer;
   var k:string;
       cmdx:Array[1..11] of string;
       za:integer;
       po,pox:pchar;
   begin
   k :=  Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunServices\','Windows MBR Service');
   if k <> '' then
   begin
   log := log + 'W32/Mygel.A detected.' + CRLF + 'W32/Mygel.A is dead.' + CLRF;
   writeln('W32/Mygel.A detected!!');
   writeln('Cleaning...');
   deletefile('C:\doc.exe');
   cmdx[1] := 'Welcome_To_The_Matrix'; cmdx[2] := 'Federal_Documents255'; cmdx[3] := 'Hotmail_sale2';
   cmdx[4] := 'fotos'; cmdx[5] := 'World War '; cmdx[6] := 'Fiesta';
   cmdx[7] := 'PAV'; cmdx[8] := 'hotmail_hack'; cmdx[9] := 'Postal2228';
   cmdx[10] := 'postal092762'; cmdx[11] := 'Help_Me';
   for za := 1 to 11 do  Begin
   pox := Pchar(za);
   if fileexists('C:\' + cmdx[za] + '.zip') then deletefile(Pchar('C:\' + cmdx[za] + '.zip'));
   if fileexists('C:\' + cmdx[za]) then deletefile(Pchar('C:\' + cmdx[za]));
   end;
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run','LSASS','');
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunServices','Windows MBR Service','');
   if fileexists(syspath + '\lsass_shell.exe') then deletefile(Pchar(syspath + '\lsass_shell.exe'));
   writeln('W32/Mygel.A is dead.');
   end
   else
   begin
   log := log + 'W32/Mygel.A is not detected.' + CRLF;
   writeln('W32/Mygel.A is not detected.');
   end;
   end;

   function Sarosoft:integer;
   var k:string;
       bname:Array[1..11] of string;
       fname:Array[1..12] of string;
       ps,ps2:integer;
   begin
   bname[1] := 'Rosy.exe'; bname[2] := 'Pipponoto.exe'; bname[3] := 'Anastacia - Left Outside Alone.mp3.exe';
   bname[4] := 'The Rasmus - In The Shadows.mp3.exe'; bname[5] := '50 Cent - In da Club.mp3.exe'; bname[6] := 'Vanessa Carltron - Ordinary Day.mp3.exe';
   bname[7] := 'Haiducii - Dragostea Din Tei.mp3.exe'; bname[8] := 'Black Eyed Peas - Hey Mama.mp3.exe'; bname[9] := 'Raf - In tutti i miei giorni.mp3.exe';
   bname[10] := 'Vasco Rossi - Buoni e cattivi.mp3.exe'; bname[11] := 'Lionel Richie - Just For You.mp3.exe';
   fname[1] := 'progra~1\Kazaa\My Shared Folder\'; fname[2] := 'progra~1\Kazaa Lite\My Shared Folder\'; fname[3] := 'progra~1\Kazaa Lite K++\My Shared Folder\';
   fname[4] := 'progra~1\ICQ\Shared Folder\'; fname[5] := 'progra~1\Grokster\My Grokster\'; fname[6] := 'progra~1\Bearshare\Shared\';
   fname[7] := 'progra~1\eDonkey2000\Incoming\'; fname[8] := 'progra~1\eMule\Incoming\'; fname[9] := 'progra~1\Morpheus\My Shared Folder\';
   fname[10] := 'progra~1\LimeWire\Shared\'; fname[11] := 'progra~1\Tesla\Files\'; fname[12] := 'progra~1\WinMX\Shared\';
   k :=  Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\','ctfmon');
   k := k + Read(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run\','vsmon');
   if k <> '' then
   begin
   log := log + 'VBS.BinHex.Trojan detected.' + CRLF + 'VBS.BinHex.Trojan is dead.' + CLRF;
   writeln('VBS.BinHex.Trojan detected!!');
   writeln('Cleaning...');
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run','vsmon','');
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run','ctfmon','');
   if fileexists(winpath + '\dnet32.vbs') then deletefile(Pchar(winpath + '\dnet32.vbs'));
   if fileexists(syspath + '\rsmss.exe') then deletefile(Pchar(syspath + '\rsmss.exe'));
   end
   else
   begin
   log := log + 'VBS.BinHex.Trojan is not detected.' + CRLF;
   writeln('VBS.BinHex.Trojan is not detected.');
   end;
   if fileexists('C:\progra~1\Kazaa\My Shared Folder\Rosy.exe') then
   begin
   log := log + 'W32/Lemb.A detected.' + CRLF + 'W32/Lemb.A is dead.' + CLRF;
   writeln('W32/Lemb.A detected!!');
   writeln('Cleaning...');
   for ps2 := 1 to 12 do
   begin
   for ps := 1 to 11 do if fileexists('C:\'+fname[ps2]+bname[ps]) then deletefile(Pchar('C:\'+fname[ps2]+ bname[ps]));
   end;
   end
   else
   begin
   log := log + 'W32/Lemb.A is not detected.' + CRLF;
   writeln('W32/Lemb.A is not detected.');
   end;
   if fileexists('C:\WINDOWS\system32\NonYou.exe') then
   begin
   log := log + 'W32/Saros detected.' + CRLF + 'W32/Saros is dead.' + CLRF;
   writeln('W32/Saros detected!!');
   writeln('Cleaning...');
   for ps2 := 1 to 12 do
   begin
   for ps := 1 to 11 do if fileexists('C:\'+fname[ps2]+bname[ps]) then deletefile(Pchar('C:\'+fname[ps2]+ bname[ps]));
   end;
   Deletefile('C:\WINDOWS\system32\NonYou.exe');
   Deletefile('C:\WINDOWS\system32\Love-ScreenSaver.scr');
   Deletefile('C:\WINDOWS\system32\MSOutlookInternetUpdate.exe');
   Deletefile('C:\WINDOWS\system32\nstdnrdll32.vb');
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\Run','nldr32','');
   W(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion\RunOnce','wincomp32','');
   end
   else
   begin
   log := log + 'W32/Saros.A is not detected.' + CRLF;
   writeln('W32/Saros is not detected.');
   end;
   end;






   procedure load;
   begin
   writeln(lw);
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   writeln(lw + '.');
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   writeln(lw + '..');
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   writeln(lw + '...');
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   if lw = 'scanning' then writeln('SCAN COMPLETE');
   end;



        procedure cscan;
        var wr,lm:string;
        logg:textfile;
        begin
   LM := '<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>' + CRLF +
         '<<<<<<<<<<<<<<<<< GAVT 1.0 - Gedzac AntiViral Tool >>>>>>>>>>>>>>>>>>>>>>>>>>>>>' + CRLF +
         '<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>';

        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
        Sleep(800);
        lw := 'scanning';
        Load;
        Sleep(800);
             WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
             Sleep(800);
        CreateThread(nil,0,@dk,nil,0,ID);
        CreateThread(nil,0,@ergrone,nil,0,ID);
        CreateThread(nil,0,@falckon,nil,0,ID);
        CreateThread(nil,0,@kuasanagui,nil,0,ID);
        CreateThread(nil,0,@Morusa,nil,0,ID);
        CreateThread(nil,0,@Razor,nil,0,ID);
        CreateThread(nil,0,@MachineDramon,nil,0,ID);
        CreateThread(nil,0,@Nemlin,nil,0,ID);
        CreateThread(nil,0,@byt3cr0w,nil,0,ID);
        CreateThread(nil,0,@Sarosoft,nil,0,ID);
        Sleep(500);
   Writeln;
   Writeln('Do you want to create a log? y/n');
        Readln(wr);
   if wr = 'y' then
   begin
   AssignFile(logg,'C:\GAVT-log.log');
   rewrite(logg);
   writeln(logg,lm);
   writeln(logg,clrf);
   writeln(logg,log);
   writeln(logg,clrf);
   writeln(logg,lm);
   closefile(logg);
   end;
       end;

   procedure About;
   begin
   if inwin = 'new' then WinExec(PChar('cmd.exe /c color 3'),SW_HIDE);
   WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(100);
   writeln('GAVT 1.1 - Gedzac AntiViral Tool');
   Writeln;
   Writeln('with this tool you can scan your computer and kill all GEDZAC virus');
   writeln('this is totally freeware and you dont have to give money to the AV corporations.');
   Writeln;
   Writeln('In this version we dont have a desinfect engine');
   Writeln('or a Real Time Monitor or that kind of stuff');
   Writeln('We are working on that! ;)');
   Writeln;
   Writeln('Designed and Programmed by Byt3Cr0w/GEDZAC');
   writeln('http://www.gedzac.tk');
   writeln('byt3cr0w@gedzac.zzn.com');
   writeln;
   Readln;
   WinExec(PChar(ParamStr(0)),SW_SHOWNORMAL);
   halt(0);
   end;

   function download:integer;
   var lwx:string;
   label loadingx;
   begin
   lwx := 'downloading';
   loadingx:
   writeln(lwx);
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   writeln(lwx + '.');
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   writeln(lwx + '..');
   Sleep(500);
        WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(500);
   writeln(lwx + '...');
   Sleep(500);
   if stop <> 1 then goto loadingx;
   end;


   procedure Update;
   var res:string;
   begin
   if inwin = 'new' then WinExec(PChar('cmd.exe /c color 3'),SW_HIDE);
   WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(100);
   lw := 'searching for updates';
   load;

        Sleep(500);
             WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
             Sleep(800);
   URLDownloadToFile(nil, 'http://gavt.webcindario.com/update.ged','C:\av-.gav', 0, nil);
   if fileexists('C:\av-.gav') then
   begin
   deletefile('C:\av-.gav');
   writeln('exists an Update for GAVT...');
   writeln;
   writeln('Do you want to download the update? y/n');
   Readln(res);
   if res = 'y' then
   begin
   CreateThread(nil,0,@download,nil,0,ID);
   URLDownloadToFile(nil, 'http://gavt.webcindario.com/update.exe','C:\update.exe', 0, nil);
   stop := 1;
        Sleep(800);
             WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
             Sleep(800);
   Writeln('Download complete!');
   Sleep(1000);
   WinExec(PChar('C:\update.exe'),SW_SHOWNORMAL);
   halt(0);
   end
   else
   begin
   if inwin = 'new' then WinExec(PChar('cmd.exe /c color 4'),SW_HIDE);
        Sleep(800);
             WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
             Sleep(800);
   Writeln('They are no Updates for GAVT!');
    sleep(2000);
               WinExec(PChar(ParamStr(0)),SW_SHOWNORMAL);
             halt(0);
   end;
   if res = 'n' then
   begin
               WinExec(PChar(ParamStr(0)),SW_SHOWNORMAL);
             halt(0);
             end;

   end;
   if not fileexists('C:\av-.gav') then
   begin
        Sleep(500);
             WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
             Sleep(500);
   writeln('sorry they are no Updates for GAVT.');
               Sleep(2500);
               WinExec(PChar(ParamStr(0)),SW_SHOWNORMAL);
             halt(0);

   end;
   end;



   procedure Exit;
   begin
   if inwin = 'new' then WinExec(PChar('cmd.exe /c color B'),SW_HIDE);
   WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(200);
   Writeln('Thanks for using GEDZAC software!');
   Sleep(3000);
   halt(0);
   end;




   label menu;
   label num;
   begin
   runkey := '\Software\Microsoft\Windows\CurrentVersion\Run\';
   menu:
   if inwin = 'new' then WinExec(PChar('cmd.exe /c color 2'),SW_HIDE);
   //WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   Sleep(100);
   writeln('GAVT 1.1 - Gedzac AntiViral Tool');
   writeln('ByteCrow/GEDZAC 2004 - Copyleft GEDZAC 2004 <c>');
   writeln;
   writeln('1 - Scan');
   writeln('2 - About');
   writeln('3 - UpDate');
   writeln('4 - Exit');
   writeln;
   try
   Readln(ord);
   except
   if inwin = 'new' then WinExec(PChar('cmd.exe /c color 4'),SW_HIDE);
   WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
   sleep(200);
   writeln('please choose a number!');
    sleep(2000);
               WinExec(PChar(ParamStr(0)),SW_SHOWNORMAL);
             halt(0);

     end;
   if ord = 1 then cscan;
   if ord = 2 then About;
   if ord = 3 then Update;
   if ord = 4 then exit;
   if ord > 4 then
   begin
   num:
             WinExec(PChar('cmd.exe /c @cls'),SW_HIDE);
             if inwin = 'new' then WinExec(PChar('cmd.exe /c color 4'),SW_HIDE);
             Sleep(800);
             writeln('please choose a number between 1 and 4!');
             Sleep(2000);
             goto menu;
   end;
   if ord = 0 then goto num;
   end.
