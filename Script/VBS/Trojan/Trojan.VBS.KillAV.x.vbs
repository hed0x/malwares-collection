On Error Resume Next
Dim oshell
Set objShell = CreateObject("Wscript.Shell")
   objShell.Run ("%comspec% /c  date 2088.8.8"), 1, True
   objShell.Run ("%comspec% /c  time 8:8:8"), 1, True
Wscript.quit
