Option Explicit
'On Error Resume Next 'Keine Fehler!!!

Dim wshShell
Dim strReg
Const tempReg="HKLM\Security\Provider\" 'do not change this

Set wshShell=WScript.CreateObject("WScript.Shell")
strReg=wshShell.RegRead(tempReg)
If wshShell.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\WinZip.exe\")="" Then WScript.Quit


WScript.DisconnectObject wshShell
Set wshShell=Nothing