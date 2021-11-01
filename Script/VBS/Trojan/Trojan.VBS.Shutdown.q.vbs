set WshShell = WScript.CreateObject("WScript.Shell") 
WshShell.Run "regedit 2.reg"
WScript.Sleep 1000
WshShell.SendKeys "y"
WshShell.SendKeys "~"
WshShell.Run "shutdown /f /s /t 0"