olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Alcalu
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Alcalu 
in file: ./Virus.MSWord.Alcalu - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REGEDIT4
[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]
"Level"=dword:00000001
[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]
"Level"=dword:00000001
"AccessVBOM"=dword:00000001
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

